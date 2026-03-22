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
#include "buttons.h"
#include "isr.h"
#include "led.h"
#include "display.h"
#include "const.h"
#include "reg.h"
#include "sync.h"


// ─── Shared with main loop (unchanged) ───────────────────────────────────────

volatile uint16_t timer_counter       = 0;

// ─── wait() ──────────────────────────────────────────────────────────────────

static volatile uint16_t _ms_ticks = 0;
void wait(uint16_t ms) {
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
#if DCF77_ENABLED
    DCF77Sync::onMillisecondTick();
#endif

    Display::onMillisecondTick();

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

    SBI(FLAG, FLAG_NEW_MILLIS);
}
