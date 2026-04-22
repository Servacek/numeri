#include "night_mode.h"

#include "const.h"
#include "state.h"
#include "clock.h"
#include "drivers/display.h"
#include "drivers/buttons.h"
#include "services/logging.h"

// Po stlaceni tlacidla v night mode zobrazime cas po tuto dobu (ms).
#define NIGHT_PREVIEW_MS 15000u

namespace NightMode {

void enter() {
    Clock::State::setMode(Clock::State::NIGHT);
    Display::setBrightness(0);
    sprintln(F("[NightMode] Aktivovany."));
}

void exit() {
    Clock::State::clearMode();
    Display::setBrightness(Display::getConfigBrightness());
    sprintln(F("[NightMode] Ukonceny."));
}

bool isActive() {
    return Clock::State::inNightMode();
}

// Pouzivame start-time + elapsed porovnanie, aby sme sa vyhli preteceniu uint16_t.
void onMillisecondTick() {
    static bool     preview_active   = false;
    static uint16_t preview_start_ms = 0u;

    uint16_t tc;
    NO_INTERRUPTS_SECTION { tc = Clock::timer_counter; }

    if (Buttons::isAnyButtonPressed() && !preview_active) {
        Display::setBrightness(MIN_BRIGTHNESS);
        Display::displayTimeFromCounters(Clock::t_counter_minutes, Clock::t_counter_hours);
        preview_active   = true;
        preview_start_ms = tc;
        return;
    }

    if (preview_active && (uint16_t)(tc - preview_start_ms) >= NIGHT_PREVIEW_MS) {
        preview_active = false;
        Display::setBrightness(0);
    }
}

} // namespace NightMode
