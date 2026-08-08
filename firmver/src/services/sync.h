#ifndef SYNC_H
#define SYNC_H

#if DCF77_ENABLED
#include "modules/dcf77.h"
#endif

#include "clock.h"
#include "const.h"
#include "state.h"
#include "utils/reg.h"

// Zalezi na nastavenom napati, mi pouzivame zvycajne napatie okolo 2.5V
// takze by hodnota logickej 1 mala byt okolo 500.
#define DCF77_ADC_THRESHOLD   250
#define CLOCK_DRIFT_HZ        909

// Maximalny cas (v sekundach) ktory sa snazime o synchronizaciu casu
#define MAX_SYNC_TIME_SECONDS 3600 // 60 minut

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

    static inline bool _isTryingToSync() {
        return !_isModuleTurnedOff();
    }

    static inline uint8_t _sampleInputPin() {
        if (_isModuleTurnedOff()) return 0; // Pri vypnutom module necitame stav.

        if (ACSR & (1 << ACO)) { // invertovana logika
            Clock::State::clearFlag(FLAG_DCF_LEDONN);
            return 0;
        }

        Clock::State::setFlag(FLAG_DCF_LEDONN);
        return 1;
    }

    //////////////////////////////////
    // Verejne funkcie
    //////////////////////////////////

    void startSynchronization();
    void stopSynchronization(); // vypne modul ak synchronizacia prebieha
    void restoreStatusLED();

    void onSecondTick();

    // inline pretoze je to v ISR.
    inline void onISRTick() {
        #if DCF77_ENABLED
        Internal::Generic_1_kHz_Generator::isr_handler();
        #endif
    }

    void onMillisecondTick();
}

#endif // SYNC_H
