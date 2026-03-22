#include <stdint.h>

#include "clock.h"
#include "const.h"
#include "fading.h"
#include "reg.h"


namespace Display::Crossfading {

// Aktualne pomaly sa meniace cykly jednotlivych segmentov.
volatile static uint8_t seg_duty[TOTAL_SEGS];
// Cykly jednotlivych segmentov ku ktorym kazdym tickom smerujeme, tieto sa menia okamzite.
volatile static uint8_t seg_target[TOTAL_SEGS];

static uint8_t crsf_cycle_counter = 0;
static uint8_t crsf_step_period   = NUMBER_TRANS_PER;
static uint8_t crsf_step_counter  = NUMBER_TRANS_PER;
static bool    _crsf_active       = false;

// ─── Internal ────────────────────────────────────────────────────────────────

CALLED_FROM_ISR static inline uint8_t _stepPeriod() {
    return ((BIS(MODE, MODE_EDIT) || BIS(MODE, MODE_DIAG)) &&
            !BIS(MODE, MODE_BOOT))
               ? NUMBER_TRANS_PER_EDIT
               : NUMBER_TRANS_PER;
}

// Assemble output bytes from current seg_duty[] and push to shift registers.
// Called every ISR tick while a fade is active.
CALLED_FROM_ISR static inline void _writeSegDuties() {
    uint8_t out[DIGIT_COUNT];
    for (uint8_t d = 0u; d < DIGIT_COUNT; d++) {
        uint8_t byte = 0u;
        for (uint8_t s = 0u; s < 8u; s++) {
            if (crsf_cycle_counter < seg_duty[d * 8u + s]) {
                byte |= (uint8_t)(1u << s);
            }
        }
        out[d] = byte;
    }
    putDigitsToInputRegs(out, DIGIT_COUNT);
    pushToOutputRegs();
}

// ─── Public API ──────────────────────────────────────────────────────────────

// Start or redirect a crossfade toward `to[]`.
// seg_duty[] is never reset — mid-ramp segments continue from their current
// level, reversing direction if their new target flips. This is what makes
// interrupted fades seamless instead of jumping.
void transitionTo(const uint8_t to[DIGIT_COUNT]) {
    NO_INTERRUPTS_SECTION {
        for (uint8_t d = 0u; d < DIGIT_COUNT; d++) {
            for (uint8_t s = 0u; s < 8u; s++) {
                seg_target[d * 8u + s] = (to[d] & (uint8_t)(1u << s)) ? CROSSFADING_PERIOD : 0u;
            }
        }
        crsf_step_period  = _stepPeriod();
        crsf_step_counter = crsf_step_period;
        _crsf_active      = true;
        // SBI(MODE, MODE_CRSF);
    }
}

// ─── ISR tick (call from TIMER2_COMPA_vect) ──────────────────────────────────

CALLED_FROM_ISR void onMillisecondTick() {
    if (!_crsf_active)
        return;

    if (++crsf_cycle_counter >= CROSSFADING_PERIOD) {
        crsf_cycle_counter = 0;
    }

    _writeSegDuties();

    if (--crsf_step_counter == 0) {
        crsf_step_counter = _stepPeriod();

        bool any_moving = false;
        for (uint8_t i = 0u; i < TOTAL_SEGS; i++) {
            if (seg_duty[i] < seg_target[i]) {
                seg_duty[i]++;
                any_moving = true;
            } else if (seg_duty[i] > seg_target[i]) {
                seg_duty[i]--;
                any_moving = true;
            }
        }

        if (!any_moving) {
            _crsf_active = false;
            // CBI(MODE, MODE_CRSF);
            // Final write with exact on/off values — no PWM rounding.
            uint8_t out[DIGIT_COUNT];
            for (uint8_t d = 0u; d < DIGIT_COUNT; d++) {
                uint8_t byte = 0u;
                for (uint8_t s = 0u; s < 8u; s++) {
                    if (seg_duty[d * 8u + s] >= CROSSFADING_PERIOD) {
                        byte |= (uint8_t)(1u << s);
                    }
                }
                out[d] = byte;
            }
            putDigitsToInputRegs(out, DIGIT_COUNT);
            pushToOutputRegs();
        }
    }
}

}
