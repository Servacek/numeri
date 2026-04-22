
#ifndef STATE_H
#define STATE_H

#include <stdint.h>

#include "utils/reg.h"


namespace Clock {
    namespace State {
        enum Mode : uint8_t {
            NONE = 0,
            EDIT,
            NIGHT,
        };

        // Register aktualneho rezimu (zdielane napriec celym projektom).
        extern volatile Mode MODE;
        extern volatile uint8_t FLAG;

        inline void setMode(Mode mode) {
            MODE = mode;
        }

        inline void clearMode() {
            MODE = NONE;
        }

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

        inline bool consumeFlag(uint8_t bit) {
            if (!isFlagSet(bit)) {
                return false;
            }
            clearFlag(bit);
            return true;
        }
    }
}

#endif // STATE_H
