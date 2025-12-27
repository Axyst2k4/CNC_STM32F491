/*
  timers.c - Simplified for 3-axis CNC (X,Y,Z) + Spindle PWM

  TIM1: Stepper motor control (X,Y,Z) using CH1, CH2, CH3
  TIM3: Spindle PWM control using CH1

  Modified from grblHAL driver
  Copyright (c) 2024 Terje Io
*/

#include "driver.h"

// ============================================================================
// TIMER STRUCTURE
// ============================================================================
typedef struct {
    TIM_TypeDef *timer;
    timer_resolution_t resolution;
    bool claimed;
    timer_cfg_t cfg;
    timer_cap_t cap;
    IRQn_Type irq;
    uint32_t freq_hz;
} dtimer_t;

// ============================================================================
// TIMER DEFINITIONS - ONLY TIM1 (STEPPER) AND TIM3 (SPINDLE)
// ============================================================================
static dtimer_t timers[] = {
    // TIM1 - Stepper motor control (X, Y, Z axes)
    {
        .timer = TIM1,
        .irq = TIM1_UP_TIM16_IRQn,  // Update interrupt
        .resolution = Timer_16bit,
        .cap = {
          .comp1 = 1,  // CH1 available for X-axis
          .comp2 = 1   // CH2 available for Y-axis
          // CH3 sẽ dùng cho Z-axis (không cần khai báo ở đây)
        }
    },

    // TIM3 - Spindle PWM control
    {
        .timer = TIM3,
        .irq = TIM3_IRQn,
        .resolution = Timer_16bit,
        .cap = {
          .comp1 = 1,  // CH1 for spindle PWM
          .comp2 = 0   // Not used
        }
    }
};

// ============================================================================
// TIMER INDEX DEFINITIONS
// ============================================================================
#define TIM1_IDX  0  // Stepper timer
#define TIM3_IDX  1  // Spindle PWM timer

// ============================================================================
// HELPER FUNCTIONS
// ============================================================================

// Get timer structure by TIM_TypeDef pointer
static dtimer_t *timer_get(TIM_TypeDef *timer)
{
    if(timer == TIM1)
        return &timers[TIM1_IDX];
    else if(timer == TIM3)
        return &timers[TIM3_IDX];

    return NULL;
}

// Claim a timer for exclusive use
bool timer_claim(TIM_TypeDef *timer)
{
    dtimer_t *dtimer = timer_get(timer);

    if(dtimer && !dtimer->claimed) {
        dtimer->claimed = true;
        return true;
    }

    return false;
}

// Check if timer is already claimed
bool timer_is_claimed(TIM_TypeDef *timer)
{
    dtimer_t *dtimer = timer_get(timer);
    return dtimer ? dtimer->claimed : false;
}

// Get timer clock frequency
uint32_t timer_get_clock_hz(TIM_TypeDef *timer)
{
    dtimer_t *dtimer = timer_get(timer);
    return dtimer ? dtimer->freq_hz : 0;
}

// ============================================================================
// CLOCK ENABLE
// ============================================================================
uint32_t timer_clk_enable(TIM_TypeDef *timer)
{
    dtimer_t *dtimer = timer_get(timer);

    if(!dtimer)
        return 0;

    if(timer == TIM1) {
        __HAL_RCC_TIM1_CLK_ENABLE();
        // TIM1 is on APB2 bus
        dtimer->freq_hz = HAL_RCC_GetPCLK2Freq() ;
    }
    else if(timer == TIM3) {
        __HAL_RCC_TIM3_CLK_ENABLE();
        // TIM3 is on APB1 bus
        dtimer->freq_hz = HAL_RCC_GetPCLK1Freq() ;
    }

    return dtimer->freq_hz;
}

// ============================================================================
// TIMER CLAIM WITH CONFIGURATION
// ============================================================================
hal_timer_t timerClaim(timer_cap_t cap, uint32_t timebase)
{
    // For stepper control, we want TIM1
    // For PWM control, we want TIM3

    dtimer_t *t = NULL;

    // Try TIM1 first (stepper)
    if(!timers[TIM1_IDX].claimed) {
        t = &timers[TIM1_IDX];
    }
    // Then try TIM3 (spindle)
    else if(!timers[TIM3_IDX].claimed) {
        t = &timers[TIM3_IDX];
    }

    if(t) {
        uint32_t f = timer_clk_enable(t->timer) / 1000;

        t->claimed = true;

        // Configure timer in one-pulse mode with prescaler
        t->timer->CR1 = TIM_CR1_ARPE;

        // Set prescaler based on timebase (microseconds)
        t->timer->PSC = ((f * timebase) / 1000000) - 1;

        // Clear status flags
        t->timer->SR = 0;
        t->timer->CNT = 0;

        // Enable interrupt
        HAL_NVIC_SetPriority(t->irq, 0, 1);
        NVIC_EnableIRQ(t->irq);
    }

    return (hal_timer_t)t;
}

// ============================================================================
// TIMER CONFIGURATION
// ============================================================================
bool timerCfg(hal_timer_t timer, timer_cfg_t *cfg)
{
    if(!timer)
        return false;

    dtimer_t *t = (dtimer_t *)timer;

    // Copy configuration
    memcpy(&t->cfg, cfg, sizeof(timer_cfg_t));

    // Configure one-pulse mode
    if(cfg->single_shot)
        t->timer->CR1 |= TIM_CR1_OPM;
    else
        t->timer->CR1 &= ~TIM_CR1_OPM;

    // Configure interrupts
    t->timer->DIER = 0;  // Clear all interrupts first

    // Compare 1 interrupt (for X-axis or spindle)
    if(cfg->irq0_callback && t->cap.comp1)
        t->timer->DIER |= TIM_DIER_CC1IE;

    // Compare 2 interrupt (for Y-axis)
    if(cfg->irq1_callback && t->cap.comp2)
        t->timer->DIER |= TIM_DIER_CC2IE;

    // Update interrupt (timeout)
    if(cfg->timeout_callback)
        t->timer->DIER |= TIM_DIER_UIE;

    return true;
}

// ============================================================================
// START TIMER
// ============================================================================
bool timerStart(hal_timer_t timer, uint32_t period)
{
    if(!timer)
        return false;

    dtimer_t *t = (dtimer_t *)timer;

    // Only reconfigure if timer not running or period changed
    if(!(t->timer->CR1 & TIM_CR1_CEN) ||
       (t->timer->CR1 & TIM_CR1_OPM) ||
       period != t->cfg.period) {

        t->cfg.period = period;
        period--;

        // Configure compare channels
        if(t->cfg.irq1_callback) {
            t->timer->CCR2 = period;
            period += t->cfg.irq1;
        }

        if(t->cfg.irq0_callback) {
            t->timer->CCR1 = period;
            period += t->cfg.irq0;
        }

        // Set auto-reload register
        t->timer->ARR = period;

        // Start timer if not running
        if(!(t->timer->CR1 & TIM_CR1_CEN)) {
            t->timer->SR = 0;  // Clear all flags

            if(!(t->timer->DIER & TIM_DIER_UIE)) {
                t->timer->DIER |= TIM_DIER_UIE;
                t->timer->EGR = TIM_EGR_UG;  // Generate update event
            }

            t->timer->CR1 |= TIM_CR1_CEN;  // Enable timer
        }
    }

    return true;
}

// ============================================================================
// STOP TIMER
// ============================================================================
bool timerStop(hal_timer_t timer)
{
    if(!timer)
        return false;

    dtimer_t *t = (dtimer_t *)timer;

    t->timer->DIER = 0;              // Disable all interrupts
    t->timer->CR1 &= ~TIM_CR1_CEN;   // Stop timer

    return true;
}

// ============================================================================
// INTERRUPT HANDLER HELPER
// ============================================================================
__attribute__((always_inline))
static inline void _irq_handler(TIM_TypeDef *timer, timer_cfg_t *cfg)
{
    uint32_t irq_flags = timer->SR & timer->DIER;

    // Clear interrupt flags
    timer->SR &= ~(TIM_SR_UIF | TIM_SR_CC1IF | TIM_SR_CC2IF | TIM_SR_CC3IF);

    // Handle update interrupt (timeout)
    if((irq_flags & TIM_SR_UIF) && cfg->timeout_callback)
        cfg->timeout_callback(cfg->context);

    // Handle compare 1 interrupt (X-axis or spindle)
    if((irq_flags & TIM_SR_CC1IF) && cfg->irq0_callback)
        cfg->irq0_callback(cfg->context);

    // Handle compare 2 interrupt (Y-axis)
    if((irq_flags & TIM_SR_CC2IF) && cfg->irq1_callback)
        cfg->irq1_callback(cfg->context);
}

// ============================================================================
// INTERRUPT SERVICE ROUTINES
// ============================================================================

// TIM1 - Stepper motor control (X, Y, Z)
void TIM1_UP_TIM16_IRQHandler(void)
{
    _irq_handler(TIM1, &timers[TIM1_IDX].cfg);
}

// TIM3 - Spindle PWM control
void TIM3_IRQHandler(void)
{
    _irq_handler(TIM3, &timers[TIM3_IDX].cfg);
}

// ============================================================================
// SPINDLE PWM SPECIFIC FUNCTIONS
// ============================================================================

// Initialize TIM3 for PWM mode (spindle control)
void spindle_pwm_init(void)
{
    // Enable TIM3 clock
    __HAL_RCC_TIM3_CLK_ENABLE();

    // Configure TIM3 for PWM mode on CH1
    TIM3->CR1 = 0;  // Reset
    TIM3->CR1 = TIM_CR1_ARPE;  // Auto-reload preload

    // PWM mode 1 on channel 1
    TIM3->CCMR1 = (6 << TIM_CCMR1_OC1M_Pos) |  // PWM mode 1
                  TIM_CCMR1_OC1PE;              // Output compare preload

    // Enable CH1 output, active high
    TIM3->CCER = TIM_CCER_CC1E;

    // Set PWM frequency (example: 10kHz with 170MHz system clock)
    // Assuming APB1 = 85MHz, timer clock = 170MHz
    // For 10kHz: ARR = 170MHz / 10kHz = 17000
    TIM3->PSC = 0;       // No prescaler
    TIM3->ARR = 17000;   // 10kHz PWM
    TIM3->CCR1 = 0;      // 0% duty cycle initially

    // Start timer
    TIM3->EGR = TIM_EGR_UG;      // Generate update
    TIM3->CR1 |= TIM_CR1_CEN;    // Enable timer
}

// Set spindle PWM duty cycle (0-100%)
void spindle_set_speed(float speed_percent)
{
    if(speed_percent < 0.0f)
        speed_percent = 0.0f;
    if(speed_percent > 100.0f)
        speed_percent = 100.0f;

    uint32_t duty = (uint32_t)((TIM3->ARR * speed_percent) / 100.0f);
    TIM3->CCR1 = duty;
}

// Stop spindle
void spindle_stop(void)
{
    TIM3->CCR1 = 0;  // 0% duty cycle
}
