#ifndef LDR_H
#define LDR_H

#include "state.h"
#include "config.h"
#include "drivers/display.h"
#include "utils/math.h"
#include "const.h"

namespace LDR {

static constexpr int16_t  LDR_ADC_MIN = 0;
static constexpr int16_t  LDR_ADC_MAX = 1023;
static constexpr uint8_t  LDR_MAP_OUTPUT_MIN = 0;
static constexpr uint16_t LDR_BRIGHTNESS_SCALE_PERCENT = 150;

inline void onSecondTick() {
#if LDR_ENABLED
    if (Config::get(Config::TIME_BRIGHTNESS_MODE) == Config::BRIGHTNESS_MANUAL) return;
    if (Clock::State::inEditMode()) return;

    const int16_t raw = (int16_t)ADC_READ_AND_RESTORE_MODE(LDR_PIN_PORTC);
    const int16_t mapped = MAP(
        raw, LDR_ADC_MIN, LDR_ADC_MAX, LDR_MAP_OUTPUT_MIN, Display::configured_brightness
    );
    const int16_t base_brightness = MAX(
        (int16_t)Display::configured_brightness - mapped, (int16_t)MIN_BRIGTHNESS
    );
    const uint16_t scaled_brightness = (
        (uint16_t)base_brightness * LDR_BRIGHTNESS_SCALE_PERCENT
    ) / 100u;

    Display::setBrightness((uint8_t)MIN(scaled_brightness, (uint16_t)MAX_BRIGHTNESS));
#endif
}

} // namespace LDR

#endif // LDR_H
