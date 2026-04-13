
#ifndef STATE_H
#define STATE_H

#include <stdint.h>

#include "utils/reg.h"

// Rezimi (indexi bitov)
#define MODE_NORM 0
#define MODE_EDIT 1
#define MODE_CRSF 2
#define MODE_DIAG 3
#define MODE_BOOT 4
#define MODE_NGHT 5

namespace Clock {
    namespace State {
        // Register aktualneho rezimu (zdielane napriec celym projektom, zapisovane z ISR).
        extern uint8_t          MODE;
        extern volatile uint8_t FLAG;

        inline bool inEditMode() { return BIS(MODE, MODE_EDIT) != 0; }
        inline bool inDiagMode() { return BIS(MODE, MODE_DIAG) != 0; }
    }
}

#endif // STATE_H
