/*
 * const.h
 *
 *  Vseobecne konstanty hodin, ktore pouzivame v roznych suboroch.
 */

#ifndef CONST_H
#define CONST_H

#include <util/atomic.h>

#define NO_INTERRUPTS_SECTION   ATOMIC_BLOCK(ATOMIC_RESTORESTATE)
#define INTERRUPTS_OFF          cli()
#define INTERRUPTS_ON           sei()

#define DEBUG_MODE       1

// Debug helper: force enter night mode right after boot sequence.
// Set to 0 after validation.
#define NIGHT_MODE_SIM_ON_BOOT 1

#define DIGIT_COUNT      4

#define ON  1
#define OFF 0

#define PRESSED  0
#define RELEASED 1

#define SUPPLY_VOLTAGE          (5)

// Serial moze robit bordel ak programujeme cez UART zbernicu.
#define SERIAL_ENABLED   1
#define RTC_ENABLED      1
#define INA_ENABLED      1
#define DISPLAY_ENABLED  0



#define DCF77_ENABLED    1
#define CRSF_ENABLED     (DISPLAY_ENABLED && 1) // !
#define LDR_ENABLED      1
// Serial sa moc nekamarati s nasim watchdogom.
#define WATCHDOG_ENABLED 0 // TODO: Treba poriesit, co z watchdogom ked pouzivame wait.

#define I2C_ENABLED (INA_ENABLED || RTC_ENABLED)
#define ADC_ENABLED (LDR_ENABLED || DCF77_ENABLED)

// Flagy (indexi bitov)
#define FLAG_NEW_SECOND    0
#define FLAG_NEW_MINUTE    1
#define FLAG_NEW_MILLIS    2
#define FLAG_DCF_LEDONN    3
#define FLAG_DCF_SYNC      4

#define SECOND_MILLIS     1000
#define MINUTE_MILLIS     60000
#define MAX_MINUTES_COUNT 60
#define MAX_HOURS_COUNT   24
#define MAX_HOURS_TENS    2

#define CALLED_FROM_ISR
#define ONLY_IN_ISR

#endif // CONST_H
