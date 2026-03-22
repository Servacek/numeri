/*
 * reg.h
 *
 *  Funkcie pre ovladanie registrov a posuvnych registrov.
 */

#ifndef REG_H
#define REG_H

#include <avr/sfr_defs.h>
#include "pins.h"

/* Trvanie NOP instrukcie:
 *      t = 1 / 16 000 000 = 0,0625 * 10^-6 s = 0,0625 us = 62,5 ns
 */

#define PULSE_PIN(register, pin) \
    asm volatile ( \
        "cbi %0, %1\n\t" \
        "nop\n\t" "nop\n\t" \
        "sbi %0, %1\n\t" \
        : \
        : "I" (_SFR_IO_ADDR(register)), "I" (pin) \
    )

// Bit helpers
#define BIS(reg, bit) (reg & (1 << bit))
#define SBI(reg, bit) (reg |= (1 << bit))
#define CBI(reg, bit) (reg &= ~(1 << bit))
// Move bit (value) to bit in register.
#define MBI(reg, bit, val) (val ? SBI(reg, bit) : CBI(reg, bit))

/////////////////////////////

inline void pushToOutputRegs() {
    PULSE_PIN(PORTD, RCK_PORTD);
}

// - Uistit sa ze dlzka impulzu je dostatocne dlha pre nase registre.
// - Cisla frekvencia zmien na hodinach je odstupnovana od prava.
// - Ak sa nejake cislo ma zmenit, vzdy sa zmenia aj cisla s prava od neho.
inline void putDigitsToInputRegs(const uint8_t* digits, const uint8_t n) {
    CBI(PORTD, RCK_PORTD); // Zapisovat data mozeme len ak je RCK v 0 (LOW).
    CBI(PORTB, SRCK_PORTB);
    for (uint8_t digit = 0; digit < n; digit++) {
        for (uint8_t i = 0; i < 8; i++) {
            if (BIS(digits[digit], i)) {
                SBI(PORTB, SERIN_PORTB);
            }
            else {
                CBI(PORTB, SERIN_PORTB);
            }

            // Setup time (aspon 10ns) zaisti dlzka operacie
            // Len na nabeznu hranu.
            SBI(PORTB, SRCK_PORTB);
            // Hold time (aspon 10ns) zaisti dlzka operacie.
            CBI(PORTB, SRCK_PORTB);
        }
    }
}

#endif // REG_H
