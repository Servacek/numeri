#ifndef SYNC_H
#define SYNC_H

#include "modules/dcf77.h"

#include "clock.h"
#include "const.h"
#include "reg.h"

// Zalezi na nastavenom napati, mi pouzivame zvycajne napatie okolo 2.5V
// takze by hodnota logickej 1 mala byt okolo 500.
#define DCF77_ADC_THRESHOLD 250
#define CLOCK_DRIFT_HZ      909

namespace DCF77Sync {

    //////////////////////////////////
    // Sukromne funkcie
    //////////////////////////////////

    static inline void _turnOnModule() {
        SBI(DDRB, DCF_PON);
    }

    static inline void _turnOffModule() {
        CBI(DDRB, DCF_PON);
    }

    static inline bool _isModuleTurnedOff() {
        return (DDRB & (1 << DCF_PON)) == 0;
    }

    static inline uint8_t _sampleInputPin() {
        if (ACSR & (1 << ACO)) { // invertovana logika
            CBI(FLAG, FLAG_DCF_LEDONN);
            return 0;
        }

        SBI(FLAG, FLAG_DCF_LEDONN);
        return 1;
    }

    //////////////////////////////////
    // Verejne funkcie
    //////////////////////////////////

    void setup();

    void startSynchronization();

    bool isSynced();

    Clock::time_t getCurrentTime();

    void onSecondTick();

    // inline pretoze je to v ISR.
    inline void onMillisecondTick() {
        Internal::Generic_1_kHz_Generator::isr_handler();
    }
}

#endif // SYNC_H
