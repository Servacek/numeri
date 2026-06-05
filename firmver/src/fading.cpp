#include <stdint.h>

#include "clock.h"
#include "const.h"
#include "drivers/display.h"
#include "fading.h"
#include "state.h"
#include "utils/reg.h"


namespace Display { namespace Crossfading {

// Aktualne pomaly sa meniace duty cykly jednotlivych segmentov (0..CROSSFADING_PERIOD).
volatile static uint8_t _seg_duty[TOTAL_SEGS];
// Cielovy stav kazdeho segmentu ako bitmaska: bit s bajtu d = segment s cifry d ma byt zapnuty.
// Ciel je vzdy bud 0 alebo CROSSFADING_PERIOD, takze staci 1 bit na segment (4B namiesto 32B).
volatile static uint8_t _seg_target_bits[DIGIT_COUNT];

static uint8_t _crsf_cycle_counter = 0;
static uint8_t _crsf_step_period   = NUMBER_TRANS_PER;
static uint8_t _crsf_step_counter  = NUMBER_TRANS_PER;

volatile static bool _crsf_active = false;

// ─── Internal ────────────────────────────────────────────────────────────────

CALLED_FROM_ISR static inline uint8_t _stepPeriod() {
    return Clock::State::inEditMode() ? NUMBER_TRANS_PER_EDIT : NUMBER_TRANS_PER;
}

// Assemble output bytes from current _seg_duty[] and push to shift registers.
// Called every ISR tick while a fade is active.
CALLED_FROM_ISR static inline void _writeSegDuties() {
    uint8_t out[DIGIT_COUNT];
    for (uint8_t d = 0u; d < DIGIT_COUNT; d++) {
        uint8_t byte = 0u;
        for (uint8_t s = 0u; s < 8u; s++) {
            if (_crsf_cycle_counter < _seg_duty[d * 8u + s]) {
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
// _seg_duty[] is never reset — mid-ramp segments continue from their current
// level, reversing direction if their new target flips. This is what makes
// interrupted fades seamless instead of jumping.
void startTransition() {
    NO_INTERRUPTS_SECTION {
        // _DIGITS[d] je bitmaska segmentov cifry d — priamo kopirujeme do ciela.
        for (uint8_t d = 0u; d < DIGIT_COUNT; d++) {
            _seg_target_bits[d] = _DIGITS[d];
        }
        _crsf_step_period  = _stepPeriod();
        _crsf_step_counter = _crsf_step_period;
        _crsf_active      = true;
    }
}

bool isActive() { return _crsf_active; }

// ─── ISR tick (call from TIMER2_COMPA_vect) ──────────────────────────────────

void onISRTick() {
    if (!_crsf_active)
        return;

    if (++_crsf_cycle_counter >= CROSSFADING_PERIOD) {
        _crsf_cycle_counter = 0;
    }

    _writeSegDuties();

    if (--_crsf_step_counter == 0) {
        _crsf_step_counter = _stepPeriod();

        bool any_moving = false;
        for (uint8_t i = 0u; i < TOTAL_SEGS; i++) {
            // Ciel segmentu i: bajt i/8 bitmasky, bit i%8 — 0=vypnuty, 1=zapnuty.
            const uint8_t target_i =
                ((_seg_target_bits[i >> 3u] >> (i & 7u)) & 1u) ? CROSSFADING_PERIOD : 0u;
            if (_seg_duty[i] < target_i) {
                _seg_duty[i]++;
                any_moving = true;
            } else if (_seg_duty[i] > target_i) {
                _seg_duty[i]--;
                any_moving = true;
            }
        }

        if (!any_moving) {
            _crsf_active = false;
            // Final write with exact on/off values — no PWM rounding.
            uint8_t out[DIGIT_COUNT];
            for (uint8_t d = 0u; d < DIGIT_COUNT; d++) {
                uint8_t byte = 0u;
                for (uint8_t s = 0u; s < 8u; s++) {
                    if (_seg_duty[d * 8u + s] >= CROSSFADING_PERIOD) {
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

}}
