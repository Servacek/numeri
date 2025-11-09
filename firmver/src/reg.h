#ifndef REG_H
#define REG_H

#include "main.h"

/* Trvanie NOP instrukcie:
 *      t = 1 / 16 000 000 = 0,0625 * 10^-6 s = 0,0625 us = 62,5 ns
 */

#define PULSE_RCK() \
    asm volatile ( \
        "cbi %0, %1\n\t" \
        "nop\n\t" "nop\n\t" \
        "sbi %0, %1\n\t" \
        : \
        : "I" (_SFR_IO_ADDR(PORTD)), "I" (RCK_PORTD) \
    )

/////////////////////////////

inline void pushToOutputRegs() {
    PULSE_RCK();
}

// - Uistit sa ze dlzka impulzu je dostatocne dlha pre nase registre.
// - Cisla frekvencia zmien na hodinach je odstupnovana od prava.
// - Ak sa nejake cislo ma zmenit, vzdy sa zmenia aj cisla s prava od neho.
inline void putDigitsToInputRegs(uint8_t* digits, uint8_t n) {
    CBI(PORTD, RCK_PORTD); // Write data and read data are valid only when RCK_PORTD is low.
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
