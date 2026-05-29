#include "night_mode.h"

#include "const.h"
#include "state.h"
#include "clock.h"
#include "drivers/display.h"
#include "drivers/buttons.h"
#include "drivers/led.h"
#include "services/logging.h"

// Po stlaceni tlacidla v night mode zobrazime cas po tuto dobu (ms).
#define NIGHT_PREVIEW_MS         15000u
#define NIGHT_PREVIEW_BRIGHTNESS MIN_BRIGTHNESS * 2

namespace NightMode {

static bool     _preview_active     = false;
static uint16_t _preview_start_ms   = 0u;

/////////////////////////////////
// Verejne funkcie
/////////////////////////////////

void enter() {
    // V nocnom rezime je jas vypnuty.
    Display::setBrightness(0);
    // Ledka tiez nesvieti vobec.
    Led::setRGB(0, 0, 0);
    Led::lock();

    info(F("[NightMode] Aktivovany.\n"));
}

void exit() {
    // Vychadzame z nocneho rezimu, obnovme nastavenie jasu a LED.
    Display::setBrightness(Display::getConfigBrightness());
    Led::unlock();

    info(F("[NightMode] Ukonceny.\n"));
}

bool isActive() {
    return Clock::State::inNightMode();
}

void startPreview() {
    info(F("[NightMode] Prezeranie casu.\n"));
    Display::setBrightness(NIGHT_PREVIEW_BRIGHTNESS);
    Display::displayTimeFromCounters(Clock::t_counter_minutes, Clock::t_counter_hours);
    _preview_active = true;
    NO_INTERRUPTS_SECTION { _preview_start_ms = Clock::timer_counter; }
}

// Pouzivame start-time + elapsed porovnanie, aby sme sa vyhli preteceniu uint16_t.
void onMillisecondTick() {
    uint16_t tc;
    NO_INTERRUPTS_SECTION { tc = Clock::timer_counter; }

    if (Buttons::isAnyButtonPressed() && !_preview_active) {
        info(F("[NightMode] Prezeranie casu.\n"));
        Display::setBrightness(NIGHT_PREVIEW_BRIGHTNESS);
        Display::displayTimeFromCounters(Clock::t_counter_minutes, Clock::t_counter_hours);
        _preview_active   = true;
        _preview_start_ms = tc;
        return;
    }

    if (_preview_active && (uint16_t)(tc - _preview_start_ms) >= NIGHT_PREVIEW_MS) {
        _preview_active = false;
        Display::setBrightness(0);
    }
}

} // namespace NightMode
