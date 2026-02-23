#include "led.h"

volatile uint8_t LED_B_REG = 0;
volatile uint8_t LED_B_CNT = 0;

// Jediny volny casovac je Timer1
void SET_LED_COLOR(uint8_t led, uint8_t val) {
    const uint8_t digital = val == 0 || val == 255;
	if (val == 0) {
		CBI(PORTB, led);
    } else if (val == 255) {
		SBI(PORTB, led);
	}

    switch(led)
    {
        case LED_R: // pin PD9
            MBI(TCCR1A, COM1A1, !digital); LED_R_REG = val;
            break;
        case LED_G: // pin PD10
            MBI(TCCR1A, COM1B1, !digital); LED_G_REG = val;
            break;
        case LED_B: // pin PD11 (na casovaci 2 ktory je zabrany, takze pouzivame softverovu PWM)
            LED_B_REG = digital ? 0 : val;
            break;
        default:
            break;
    }
}

void SET_ALL_LED_BRIGHT(uint8_t val) {
    SET_LED_COLOR(LED_R, val);
    SET_LED_COLOR(LED_G, val);
    SET_LED_COLOR(LED_B, val);
}
