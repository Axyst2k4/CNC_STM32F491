/*
  timers.h - Timer definitions for 3-axis CNC + Spindle

  TIM1: Stepper motors (X, Y, Z)
  TIM3: Spindle PWM
*/

#ifndef TIMERS_H
#define TIMERS_H

#include "stm32g4xx_hal.h"
#include <stdint.h>
#include <stdbool.h>
#include <string.h>

// ============================================================================
// TYPE DEFINITIONS
// ============================================================================




// ============================================================================
// FUNCTION PROTOTYPES
// ============================================================================

// Timer management
bool timer_claim(TIM_TypeDef *timer);
bool timer_is_claimed(TIM_TypeDef *timer);
uint32_t timer_get_clock_hz(TIM_TypeDef *timer);
uint32_t timer_clk_enable(TIM_TypeDef *timer);

// Timer operations
hal_timer_t timerClaim(timer_cap_t cap, uint32_t timebase);
bool timerCfg(hal_timer_t timer, timer_cfg_t *cfg);
bool timerStart(hal_timer_t timer, uint32_t period);
bool timerStop(hal_timer_t timer);

// Spindle PWM functions
void spindle_pwm_init(void);
void spindle_set_speed(float speed_percent);  // 0-100%
void spindle_stop(void);

// ============================================================================
// TIMER ASSIGNMENTS
// ============================================================================
//#define STEPPER_TIMER       TIM1    // Stepper motor control
#define SPINDLE_PWM_TIMER   TIM3    // Spindle PWM

// TIM1 Channels for Stepper
#define STEPPER_X_CHANNEL   1       // TIM1_CH1
#define STEPPER_Y_CHANNEL   2       // TIM1_CH2
#define STEPPER_Z_CHANNEL   3       // TIM1_CH3

// TIM3 Channel for Spindle PWM
#define SPINDLE_PWM_CHANNEL 1       // TIM3_CH1

#endif // TIMERS_H
