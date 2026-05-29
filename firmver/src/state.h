
#ifndef STATE_H
#define STATE_H

#include <stdint.h>

#include "utils/reg.h"


namespace Clock { namespace State {
    enum Mode : uint8_t {
        NONE = 0,
        EDIT,
        NIGHT,
    };

    // Register aktualneho rezimu.
    extern volatile Mode MODE;
    extern volatile uint8_t FLAG;

    enum Event : uint8_t {
        EVT_ENTER_EDIT,    // uzivatel pozaduje vstup do edit rezimu
        EVT_EXIT_EDIT,     // uzivatel potvrdil a ukoncuje edit rezim
        EVT_EDIT_TIMEOUT,  // edit rezim bol ukonceny kvoli necinnosti
        EVT_SLEEP_TIMER,   // casovac pozaduje prechod do nocneho rezimu
        EVT_WAKE_TIMER,    // casovac pozaduje prebudenie z nocneho rezimu
    };

    // true = prechod prebehol, false = udalost ignorovana v aktualnom stave
    bool dispatch(Event evt);

    inline bool inMode(Mode mode) {
        return MODE == mode;
    }

    inline bool inEditMode() { return MODE == EDIT; }
    inline bool inNightMode() { return MODE == NIGHT; }
    inline bool inNormalMode() { return MODE == NONE; }

    inline void setFlag(uint8_t bit) {
        SBI(FLAG, bit);
    }

    inline void clearFlag(uint8_t bit) {
        CBI(FLAG, bit);
    }

    inline bool isFlagSet(uint8_t bit) {
        return BIS(FLAG, bit);
    }

    // Vrati true ak sa vlajku podarilo vymazat, inak false.
    inline bool consumeFlag(uint8_t bit) {
        if (!isFlagSet(bit)) {
            return false;
        }
        clearFlag(bit);
        return true;
    }
} } // namespace Clock::State

#endif // STATE_H
