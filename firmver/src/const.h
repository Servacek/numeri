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

#define DIGIT_COUNT      4

#define ON  1
#define OFF 0

#define PRESSED  0
#define RELEASED 1

#define SUPPLY_VOLTAGE          (5)
#define MAX_DISPLAY_VOLTAGE_X10 (12) // 1,2V - pri 3V zacina krivka exponencialne rast.

// Serial moze robit bordel ak programujeme cez UART zbernicu.
#define SERIAL_ENABLED   1
#define COMMANDS_ENABLED (SERIAL_ENABLED && 0)
#define RTC_ENABLED      1
#define INA_ENABLED      0
#define DISPLAY_ENABLED  1
#define DCF77_ENABLED    1
#define CRSF_ENABLED     (DISPLAY_ENABLED && 1) // !
#define LDR_ENABLED      1
// Serial sa moc nekamarati s nasim watchdogom.
#define WATCHDOG_ENABLED 0 // TODO: Treba poriesit, co z watchdogom ked pouzivame wait.

#define I2C_ENABLED (INA_ENABLED || RTC_ENABLED)
#define ADC_ENABLED (LDR_ENABLED || DCF77_ENABLED)

// Rezimi (indexi bitov)
#define MODE_NORM 0
#define MODE_EDIT 1
#define MODE_CRSF 2
#define MODE_DIAG 3
#define MODE_BOOT 4
#define MODE_NGHT 5

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
