#ifndef ISR_H
#define ISR_H

#include <avr/interrupt.h>

#include "led.h"
#include "input.h"
#include "clock.h"
#include "main.h"
#include "peripherals.h"

// Pouzivame to aj v hlavnom loope, takze musi byt "volatile"
extern volatile uint16_t timer_counter; // Pocita do 60 000 - 1 minuta v ms

#if CRSF_ENABLED
extern uint8_t _fade_out_buffer[DIGIT_COUNT];
extern uint8_t _fade_in_buffer[DIGIT_COUNT];
#endif

void wait(uint16_t ms);

#endif // ISR_H
