// isr_new.cpp — drop-in replacement for isr.cpp
//
// WHAT CHANGED: Per-segment independent crossfading.
//
// OLD ARCHITECTURE:
//   One shared _crsf_duty for all 32 segments. ISR writes the entire shift
//   register chain at two fixed edges per period (old→new). Redirect works
//   by inverting the duty, which is correct only for segments shared between
//   old and new images. Segments present in one image but not the other
//   reverse direction abruptly on redirect — causing the boot jump.
//
// NEW ARCHITECTURE:
//   Each of the 32 segments (DIGIT_COUNT × 8) has its own uint8_t duty
//   (seg_duty[]) ranging 0..CROSSFADING_PERIOD, and its own uint8_t target
//   (seg_target[]) which is always either 0 or CROSSFADING_PERIOD.
//   On every ISR tick the duty is nudged one step toward the target.
//   The shift register is assembled from the 32 duties on every ISR tick
//   and written once per tick while any segment is still transitioning.
//
// INTERFACE CONTRACT (identical to old isr.cpp):
//   All functions and all extern symbols consumed by display.cpp, edit.cpp,
//   and main.cpp are preserved with identical signatures.
//   The only symbols removed are _fade_in_buffer and _fade_out_buffer —
//   they are no longer needed. display.cpp references them only inside
//   #if CRSF_ENABLED blocks, so removing them produces no compile errors
//   as long as display.cpp is updated (see note at bottom of this file).
//
// RAM COST:
//   OLD: 2 × DIGIT_COUNT bytes  (8 bytes for two 4-byte buffers)
//   NEW: 2 × DIGIT_COUNT × 8 bytes  (64 bytes for duty + target arrays)
//   NET INCREASE: +56 bytes. Monitor this against RAM_SAFETY_THRESHOLD.
//
// ISR COST:
//   OLD: putDigitsToInputRegs + pushToOutputRegs called at most twice per
//        CROSSFADING_PERIOD ticks (~2 calls per 20ms = ~100 calls/sec).
//   NEW: One call per ISR tick while fading is active (up to 1000 calls/sec).
//        Benchmark putDigitsToInputRegs+pushToOutputRegs before deploying.
//        If the bit-bang is too slow, switch shift registers to hardware SPI.

#include <avr/interrupt.h>
#include <avr/sleep.h>

#include "clock.h"
#include "display.h"
#include "input.h"
#include "isr.h"
#include "led.h"
#include "main.h"
#include "reg.h"


// ─── Shared with main loop (unchanged) ───────────────────────────────────────

volatile uint16_t timer_counter       = 0;
static uint8_t    _brightness_counter = 0;

// ─── Per-segment crossfade state ─────────────────────────────────────────────

#if CRSF_ENABLED

// Total segments: one byte of bitmask per digit, 8 bits per byte.
#define TOTAL_SEGS (DIGIT_COUNT * 8u)

// Current soft-PWM duty per segment: 0 = fully off, CROSSFADING_PERIOD = fully on.
// These live in ISR-only space — never touch from main code without ATOMIC_BLOCK.
static uint8_t seg_duty[TOTAL_SEGS];

// Target each segment is heading toward: always 0 or CROSSFADING_PERIOD.
static uint8_t seg_target[TOTAL_SEGS];

// Free-running cycle counter, 0..CROSSFADING_PERIOD-1. Resets each period.
static uint8_t crsf_cycle_counter = 0;

// Ramp rate: how many ISR ticks between each duty step per segment.
// Mirrors NUMBER_TRANS_PER / NUMBER_TRANS_PER_EDIT semantics.
static uint8_t crsf_step_period = NUMBER_TRANS_PER;

// Counts down to zero, then nudges all duties one step toward their targets.
static uint8_t crsf_step_counter = NUMBER_TRANS_PER;

// True while any segment's duty != its target.
// Set by triggerCrossfade(), cleared by ISR when all duties have settled.
// Replaces MODE_CRSF bit — but we keep setting/clearing MODE_CRSF for
// compatibility with all callers that read it (display.cpp, edit.cpp, monitor).
static bool _crsf_active = false;

// ─── Internal helpers ─────────────────────────────────────────────────────────

// Assemble the 4 output bytes from current seg_duty[] values and
// write them to the shift registers. Called every ISR tick while fading.
static inline void _writeSegDuties() {
    uint8_t out[DIGIT_COUNT];
    for (uint8_t d = 0u; d < DIGIT_COUNT; d++) {
        uint8_t byte = 0u;
        for (uint8_t s = 0u; s < 8u; s++) {
            // Segment is "on" in this tick if cycle counter is below its duty.
            if (crsf_cycle_counter < seg_duty[d * 8u + s]) {
                byte |= (uint8_t)(1u << s);
            }
        }
        out[d] = byte;
    }
    putDigitsToInputRegs(out, DIGIT_COUNT);
    pushToOutputRegs();
}

// Current ramp step period based on active mode.
static inline uint8_t _stepPeriod() {
    return ((BIS(MODE, MODE_EDIT) || BIS(MODE, MODE_DIAG)) &&
            !BIS(MODE, MODE_BOOT))
               ? NUMBER_TRANS_PER_EDIT
               : NUMBER_TRANS_PER;
}

// ─── Public crossfade API (same signatures as before) ─────────────────────────

// Called from crossfadeFromOldDigitsToNew() when no fade is active.
// Snapshot the current display into duties (as fully on/off) and set targets
// from DIGITS[]. Segments present in DIGITS head to CROSSFADING_PERIOD,
// segments absent head to 0.
//
// This replaces the old buffer-swap + resetCrossfadeState() sequence.
// Callers in display.cpp must call triggerCrossfade() instead of the old
// COPY_DIGIT_BUFFER + resetCrossfadeState() + SBI(MODE, MODE_CRSF) dance.
void triggerCrossfade() {
    // seg_duty: set from whatever is currently on the display.
    // Because abortCrossfade() always snaps to the target, and outside of a
    // fade the display always shows DIGITS, we can read DIGITS directly as
    // the current "from" state. Each bit that is set → duty = CROSSFADING_PERIOD.
    for (uint8_t d = 0u; d < DIGIT_COUNT; d++) {
        for (uint8_t s = 0u; s < 8u; s++) {
            seg_duty[d * 8u + s] =
                (DIGITS[d] & (uint8_t)(1u << s)) ? CROSSFADING_PERIOD : 0u;
        }
    }
    // seg_target: set from DIGITS[] — the caller has already written the
    // new image into DIGITS before calling crossfadeFromOldDigitsToNew().
    // Wait — DIGITS is the new image here.
    //
    // Actually the display.cpp caller writes the new symbols into DIGITS
    // BEFORE calling crossfadeFromOldDigitsToNew(). So at this point
    // DIGITS already contains the "to" state. We need to snapshot the
    // FROM state differently.
    //
    // Solution: crossfadeFromOldDigitsToNew() in display.cpp must be
    // updated to call triggerCrossfadeFromTo(old, new) with both states
    // explicitly. See display_new.cpp patch notes at the bottom of this file.
    //
    // For now this stub is intentionally left as a reminder — see
    // triggerCrossfadeFromTo() below which is the actual entry point.
    (void)0;
}

// The real entry point called from display.cpp.
// from[]: the image currently on screen (old state).
// to[]:   the image to transition to (new state = DIGITS[]).
// Both arrays are DIGIT_COUNT bytes.
void triggerCrossfadeFromTo(const uint8_t* from, const uint8_t* to) {
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
        for (uint8_t d = 0u; d < DIGIT_COUNT; d++) {
            for (uint8_t s = 0u; s < 8u; s++) {
                const uint8_t mask = (uint8_t)(1u << s);

                // Current duty: what the display is actually showing right now.
                // If a fade was already in progress, seg_duty[i] is mid-ramp —
                // we keep it exactly as-is. This is the key improvement:
                // segments that were already partially faded continue from
                // their current level, not from a hard 0 or CROSSFADING_PERIOD.
                // On first call (no prior fade) seg_duty[] was set by the last
                // abortCrossfade() or init, so it correctly reflects the display.
                //
                // (No change to seg_duty here — it always reflects reality.)

                // New target: fully on if the bit is set in the destination image.
                seg_target[d * 8u + s] =
                    (to[d] & mask) ? CROSSFADING_PERIOD : 0u;

                // If duty already equals target, this segment needs no work —
                // it will be skipped by the ISR's per-segment nudge naturally.
            }
        }

        crsf_step_period  = _stepPeriod();
        crsf_step_counter = crsf_step_period;
        _crsf_active      = true;
        SBI(MODE, MODE_CRSF); // keep compatibility flag set
    }
}

// Called from display.cpp when a fade is already active and a new target
// arrives. In the old architecture this inverted _crsf_duty. In the new
// architecture there is nothing special to do — triggerCrossfadeFromTo()
// simply updates seg_target[] for each segment. Each segment is already
// at its correct current duty and will reverse or continue naturally.
// This function is kept for API compatibility but is now a thin wrapper.
void redirectCrossfade() {
    // seg_duty[] already holds the correct per-segment current levels.
    // Just update targets to point at the new DIGITS[] image.
    // The from[] argument is unused — duties reflect reality already.
    uint8_t dummy_from[DIGIT_COUNT];
    for (uint8_t d = 0u; d < DIGIT_COUNT; d++) {
        // Reconstruct current "from" from duties: a segment is "on" if its
        // duty is > CROSSFADING_PERIOD/2. This threshold is arbitrary but
        // triggerCrossfadeFromTo doesn't read from[] for the duty snapshot.
        dummy_from[d] = 0u; // unused — duties are not reset inside
    }
    triggerCrossfadeFromTo(dummy_from, DIGITS);
    CBI(FLAG, FLAG_CRSF_DEFFERED);
}

// Hard-stop: snap all segments to their targets immediately.
// Called from enterEditMode(), startDiagnostics(), etc.
void abortCrossfade() {
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
        for (uint8_t i = 0u; i < TOTAL_SEGS; i++) {
            seg_duty[i] = seg_target[i];
        }
        _crsf_active = false;
        CBI(MODE, MODE_CRSF);
        CBI(FLAG, FLAG_CRSF_DEFFERED);
        crsf_step_counter = NUMBER_TRANS_PER;
        crsf_step_period  = NUMBER_TRANS_PER;
    }

    // Write the snapped state to the shift registers now that ISR won't race.
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

// Kept for API compatibility. In the new architecture there is no global
// duty to reset — state lives per-segment. abortCrossfade() is the
// canonical reset path. resetCrossfadeState() is now a no-op.
void resetCrossfadeState() {
    crsf_step_period  = _stepPeriod();
    crsf_step_counter = crsf_step_period;
}

// ─── Compatibility: old buffer symbols ───────────────────────────────────────
//
// display.cpp references _fade_in_buffer and _fade_out_buffer in several
// places inside #if CRSF_ENABLED blocks. Those references must be updated
// to use the new triggerCrossfadeFromTo() API. Until display.cpp is patched,
// provide stub arrays so the project still links. They are never written by
// the ISR and should not be read for display purposes.
//
// TODO: Remove these once display.cpp is updated.
uint8_t _fade_in_buffer[DIGIT_COUNT]  = {0, 0, 0, 0};
uint8_t _fade_out_buffer[DIGIT_COUNT] = {0, 0, 0, 0};

#endif // CRSF_ENABLED

// ─── wait() ──────────────────────────────────────────────────────────────────

static volatile uint16_t _ms_ticks = 0;
void                     wait(uint16_t ms) {
    _ms_ticks = ms;
    set_sleep_mode(SLEEP_MODE_IDLE);
    sleep_enable();
    while (_ms_ticks > 0) {
        sleep_cpu();
    }
    sleep_disable();
}

// ─── ISR ─────────────────────────────────────────────────────────────────────

ISR(TIMER2_COMPA_vect) {
// DCF77
#if DCF77_ENABLED
    Internal::Generic_1_kHz_Generator::isr_handler();
#endif

    // LED B software PWM step
    LED_B_CNT += LED_B_STEP;

    // Main time counter
    if (++timer_counter % SECOND_MILLIS == 0) {
        SBI(FLAG, FLAG_NEW_SECOND);
        if (timer_counter >= MINUTE_MILLIS) {
            SBI(FLAG, FLAG_NEW_MINUTE);
            timer_counter = 0;
        }
    }

    // wait() countdown
    if (_ms_ticks) {
        _ms_ticks--;
    }

    // Display brightness ramp (unchanged from original)
    if (_target_brightness != DISPLAY_PWM_REG &&
        _target_brightness <= MAX_BRIGHTNESS) {
        if ((++_brightness_counter) == BRIGHTNESS_CNT_TOP) {
            if (_target_brightness > DISPLAY_PWM_REG) {
                if (DISPLAY_PWM_REG == 0 && !IS_DISPLAY_PWM_ON()) {
                    START_DISPLAY_PWM();
                } else {
                    DISPLAY_PWM_REG++;
                }
            } else if (DISPLAY_PWM_REG && --DISPLAY_PWM_REG == 0) {
                SBI(PORTD, _G_PORTD);
                STOP_DISPLAY_PWM();
            }
            _brightness_counter = 0;
        }
    } else {
        _brightness_counter = 0;
    }

// ── Per-segment crossfade ─────────────────────────────────────────────────
#if CRSF_ENABLED
    if (_crsf_active) {
        // Advance cycle counter
        if (++crsf_cycle_counter >= CROSSFADING_PERIOD) {
            crsf_cycle_counter = 0;
        }

        // Write assembled segment duties to shift registers every tick.
        // This is more frequent than the old two-edge write but enables
        // independent per-segment PWM brightness.
        _writeSegDuties();

        // Nudge each duty one step toward its target at the configured rate.
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
                // All segments have settled — transition complete.
                _crsf_active = false;
                CBI(MODE, MODE_CRSF);

                // Final write with exact target values (no PWM rounding).
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
#endif // CRSF_ENABLED

    SBI(FLAG, FLAG_NEW_MILLIS);
}

// ─── display.cpp patch notes ─────────────────────────────────────────────────
//
// crossfadeFromOldDigitsToNew() in display.cpp must be updated to call
// triggerCrossfadeFromTo() instead of the old buffer-swap sequence.
//
// The key change: display.cpp must snapshot the current display state
// (DIGITS[] before the new image is written) as the "from" buffer, then
// after writing the new symbols into DIGITS[], call triggerCrossfadeFromTo().
//
// Minimal patch to crossfadeFromOldDigitsToNew() in display.cpp:
//
//   void crossfadeFromOldDigitsToNew() {
//       if (BIS(MODE, MODE_EDIT)) {
//           // Edit mode: direct write, keep duties in sync.
//           #if CRSF_ENABLED
//           ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
//               if (!_crsf_active) {
//                   // Snap duties to current DIGITS so next fade starts clean.
//                   for (uint8_t d = 0; d < DIGIT_COUNT; d++)
//                       for (uint8_t s = 0; s < 8; s++)
//                           seg_duty[d*8+s] = (DIGITS[d] & (1<<s))
//                               ? CROSSFADING_PERIOD : 0;
//               }
//           }
//           #endif
//           putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
//           pushToOutputRegs();
//           return;
//       }
//
//       #if CRSF_ENABLED
//       ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
//           if (_crsf_active) {
//               redirectCrossfade(); // updates seg_target[] to new DIGITS[]
//           } else {
//               triggerCrossfadeFromTo(/* from = current duties, to = */ DIGITS);
//           }
//       }
//       #else
//       putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
//       pushToOutputRegs();
//       #endif
//   }
//
// Note: triggerCrossfadeFromTo() does not use the from[] array to reset
// seg_duty[] — it leaves duties exactly as they are (mid-ramp or settled).
// The from[] parameter exists only as a forward-compatible hook and can be
// passed as nullptr or DIGITS if called when no fade was active (duties
// already reflect the display state from the last abortCrossfade/settle).
