#ifndef FADING_H
#define FADING_H

#include <const.h>

// Total segments: one byte of bitmask per digit, 8 bits per byte.
#define TOTAL_SEGS          (DIGIT_COUNT * 8u)

// Minimalna doba trvania zmeny jasu z MIN na MAX.
#define NUMBER_TRANS_DUR    4096 // ms
// Cim mensia hodnota, tym rychlejsie preklapanie.
#define CROSSFADING_PERIOD  16
// +1: duty klesa od CROSSFADING_PERIOD az po 0 vratane (CROSSFADING_PERIOD+1 krokov).
#define NUMBER_TRANS_PER    (uint8_t)(NUMBER_TRANS_DUR / (CROSSFADING_PERIOD + 1))

namespace Display { namespace Crossfading {
    void transitionTo(const uint8_t to[DIGIT_COUNT]);

    void onMillisecondTick();
}}

#endif
