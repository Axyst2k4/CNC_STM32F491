/*

  pwm.c - driver code for STM32F7xx ARM processors

  Part of grblHAL

  Copyright (c) 2024-2025 Terje Io

  grblHAL is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  grblHAL is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with grblHAL. If not, see <http://www.gnu.org/licenses/>.
*/

#include "driver.h"

typedef struct {
    TIM_TypeDef *timer;
    __IO uint32_t *ccr;
} pwm_claimed_t;

// CCR = CH == 1 || CH == 2 ? 1 : 2
// .timer = timer(N), .ccr = &timerCCR(N, CH), .ccmr = &timerCCMR(N, CCR), .af = timerAF(N, AF),
// .en = timerCCEN(CH, ), .pol = timerCCP(CH, ), .ois = timerCR2OIS(CH, ), .ocm = timerOCM(CCR, CH), .ocmc = timerOCM(CCR, CH)

static const pwm_signal_t pwm_pin[] = {
		  {
		        .port = GPIOB,
		        .pin = 4,
		        .timer = TIM3,
		        .ccr = &TIM3->CCR1,
		        .ccmr = &TIM3->CCMR1,
		        .af = GPIO_AF2_TIM3,  // AF2 for TIM3 on STM32G4
		        .en = TIM_CCER_CC1E,
		        .pol = TIM_CCER_CC1P,
		        .ois = TIM_CR2_OIS1,
		        .ocm = TIM_CCMR1_OC1M_1 | TIM_CCMR1_OC1M_2,  // PWM mode 1
		        .ocmc = TIM_CCMR1_OC1M | TIM_CCMR1_CC1S
		    },
		    // ========================================================================
		    // ADDITIONAL PWM OUTPUTS (for future expansion)
		    // ========================================================================

		    {
		        .port = GPIOC,
		        .pin = 0,
		        .timer = TIM1,
		        .ccr = &TIM1->CCR1,
		        .ccmr = &TIM1->CCMR1,
		        .af = GPIO_AF6_TIM1,  // AF6 for TIM1 on STM32G4
		        .en = TIM_CCER_CC1E,
		        .pol = TIM_CCER_CC1P,
		        .ois = TIM_CR2_OIS1,
		        .ocm = TIM_CCMR1_OC1M_1 | TIM_CCMR1_OC1M_2,
		        .ocmc = TIM_CCMR1_OC1M | TIM_CCMR1_CC1S
		    },
		    {
		        .port = GPIOC,
		        .pin = 1,
		        .timer = TIM1,
		        .ccr = &TIM1->CCR2,
		        .ccmr = &TIM1->CCMR1,
		        .af = GPIO_AF6_TIM1,
		        .en = TIM_CCER_CC2E,
		        .pol = TIM_CCER_CC2P,
		        .ois = TIM_CR2_OIS2,
		        .ocm = TIM_CCMR1_OC2M_1 | TIM_CCMR1_OC2M_2,
		        .ocmc = TIM_CCMR1_OC2M | TIM_CCMR1_CC2S
		    },
			 {
				.port = GPIOC,
				.pin = 2,
				.timer = TIM1,
				.ccr = &TIM1->CCR2,
				.ccmr = &TIM1->CCMR1,
				.af = GPIO_AF6_TIM1,
				.en = TIM_CCER_CC2E,
				.pol = TIM_CCER_CC2P,
				.ois = TIM_CR2_OIS2,
				.ocm = TIM_CCMR1_OC2M_1 | TIM_CCMR1_OC2M_2,
				.ocmc = TIM_CCMR1_OC2M | TIM_CCMR1_CC2S
			}
};

uint_fast8_t n_claimed = 0;
pwm_claimed_t pwm_claimed[5] = {0};

// TODO: somehow handle frequency/period when two or more PWM outputs share the same timer...

bool pwm_is_available (GPIO_TypeDef *port, uint8_t pin)
{
    const pwm_signal_t *pwm = NULL;
    uint_fast8_t i = sizeof(pwm_pin) / sizeof(pwm_signal_t);

    do {
        i--;
        if(port == pwm_pin[i].port && pin == pwm_pin[i].pin)
            pwm = &pwm_pin[i];
    } while(i && pwm == NULL);

    if(pwm && (i = n_claimed)) do {
        i--;
        if(pwm->timer == pwm_claimed[i].timer)
            return pwm->ccr != pwm_claimed[i].ccr;
    } while(i);

    return pwm && !timer_is_claimed(pwm->timer);
}

const pwm_signal_t *pwm_claim (GPIO_TypeDef *port, uint8_t pin)
{
    const pwm_signal_t *pwm = NULL;

    if(pwm_is_available(port, pin)) {

        uint_fast8_t i = sizeof(pwm_pin) / sizeof(pwm_signal_t);

        do {
            i--;
            if(port == pwm_pin[i].port && pin == pwm_pin[i].pin)
                pwm = &pwm_pin[i];
        } while(i && pwm == NULL);

        if(pwm) {

            TIM_TypeDef *timer = NULL;

            if((i = n_claimed)) do {
                if(pwm->timer == pwm_claimed[--i].timer)
                    timer = pwm_claimed[i].timer;
            } while(i && timer == NULL);

            if(timer || timer_claim(pwm->timer)) {
                pwm_claimed[n_claimed].timer = pwm->timer;
                pwm_claimed[n_claimed++].ccr = pwm->ccr;
            } else
                pwm = NULL;
        }
    }

    return pwm;
}

bool pwm_enable (const pwm_signal_t *pwm)
{
    timer_clk_enable(pwm->timer);

    GPIO_InitTypeDef GPIO_Init = {
        .Speed = GPIO_SPEED_FREQ_HIGH,
        .Mode = GPIO_MODE_AF_PP,
        .Pull = GPIO_NOPULL
    };

    GPIO_Init.Pin = (1 << pwm->pin);
    GPIO_Init.Alternate = pwm->af;
    HAL_GPIO_Init(pwm->port, &GPIO_Init);

    return true;
}

bool pwm_config (const pwm_signal_t *pwm, uint32_t prescaler, uint32_t period, bool inverted)
{
    pwm->timer->CR1 &= ~TIM_CR1_CEN;

    TIM_Base_InitTypeDef timerInitStructure = {
        .Prescaler = prescaler - 1,
        .CounterMode = TIM_COUNTERMODE_UP,
        .Period = period - 1,
        .ClockDivision = TIM_CLOCKDIVISION_DIV1,
        .RepetitionCounter = 0
    };

    TIM_Base_SetConfig(pwm->timer, &timerInitStructure);

    pwm->timer->CCER &= ~pwm->en;
    *pwm->ccmr &= ~pwm->ocmc;
    *pwm->ccmr |= pwm->ocm;
    *pwm->ccr = 0;

    if(pwm->timer == TIM1 || pwm->timer == TIM8)
        pwm->timer->BDTR |= TIM_BDTR_MOE | TIM_BDTR_OSSR | TIM_BDTR_OSSI;

    if(inverted) {
        pwm->timer->CCER |= pwm->pol;
        pwm->timer->CR2 |= pwm->ois;
    } else {
        pwm->timer->CCER &= ~pwm->pol;
        pwm->timer->CR2 &= ~pwm->ois;
    }
    pwm->timer->CCER |= pwm->en;
    pwm->timer->CR1 |= TIM_CR1_CEN;

    return true;
}

uint32_t pwm_get_clock_hz (const pwm_signal_t *pwm)
{
    return timer_get_clock_hz(pwm->timer);
}
