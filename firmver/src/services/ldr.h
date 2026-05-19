#ifndef LDR_H
#define LDR_H

#include "state.h"
#include "config.h"
#include "drivers/display.h"
#include "utils/math.h"
#include "const.h"

namespace LDR {

static constexpr uint16_t  LDR_ADC_MIN = 100;
static constexpr uint16_t  LDR_ADC_MAX = 700;
static constexpr uint16_t LDR_BRIGHTNESS_SCALE_PERCENT = 200;
// Offset zabezpeci to, ze 512 je priemerna hodnota
// static constexpr uint8_t  LDR_OFFSET = 300;

inline void onSecondTick() {
#if LDR_ENABLED
    if (Config::get(Config::BRIGHTNESS_MODE) != Config::BRIGHTNESS_AUTO) return;
    if (!Clock::State::inNormalMode()) return;

    const uint16_t raw = (uint16_t)ADC_READ_AND_RESTORE_MODE(LDR_PIN_PORTC);
    // sprint("RAW: ");
    // sprintln(raw);
    // Zmapujeme hodnotu od 0-1023 do rozsahu jasu.
    // Lenze LDR rezistor zobrazuje vacsie hodnoty pre nizsiu uroven svetla.
    const uint8_t brightness = MAX(
        MAX_BRIGHTNESS - MAP(
            raw, LDR_ADC_MIN, LDR_ADC_MAX, 0, (MAX_BRIGHTNESS - MIN_BRIGTHNESS)
        ), MIN_BRIGTHNESS
    );

    // sprint("Brightness percent: ");
    // sprintln(((brightness - MIN_BRIGTHNESS) * 100u) / (MAX_BRIGHTNESS - MIN_BRIGTHNESS));

    Display::setBrightness(brightness, 2);
#endif
}

} // namespace LDR

#endif // LDR_H
