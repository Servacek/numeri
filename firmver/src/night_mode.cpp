#include "night_mode.h"

#include "const.h"
#include "state.h"
#include "clock.h"
#include "drivers/display.h"
#include "drivers/led.h"
#include "services/logging.h"

namespace NightMode {

// Po stlaceni tlacidla v night mode zobrazime cas po tuto dobu (ms).
static constexpr uint16_t _NIGHT_PREVIEW_MS         = 15000u;
// Doc: "jas bude na predvolenej hodnote" - pouzivame DEFAULT_BRIGHTNESS.
static constexpr uint8_t  _NIGHT_PREVIEW_BRIGHTNESS = Display::DEFAULT_BRIGHTNESS;

// Odpocet zostatkoveho casu preview; 0 = preview neaktivne.
static uint16_t _preview_remaining = 0u;

/////////////////////////////////
// Verejne funkcie
/////////////////////////////////

void enter() {
    // V nocnom rezime je jas vypnuty.
    Display::setBrightness(0);
    // Ledka tiez nesvieti vobec.
    Led::setRGB(0, 0, 0); // Zachovame nastaveny jas.
    Led::lock();

    info(F("[NightMode] Aktivovany.\n"));
}

void exit() {
    // Jas, LED a displej obnovi NormalMode::enter() pri prechode do NONE,
    // alebo Edit::enter() pri priamom prechode NIGHT->EDIT.
    info(F("[NightMode] Ukonceny.\n"));
}

bool isActive() {
    return Clock::State::inNightMode();
}

// Idempotentne: opakovane volania len obnovia odpocet timeoutu,
// vdaka comu kazde dalsie stlacenie tlacidla v preview predlzi zobrazenie.
void startPreview() {
    info(F("[NightMode] Prezeranie casu.\n"));
    Display::setBrightness(_NIGHT_PREVIEW_BRIGHTNESS);
    Display::displayTimeFromCounters(Clock::t_counter_minutes, Clock::t_counter_hours);
    _preview_remaining = _NIGHT_PREVIEW_MS;
}

void onMillisecondTick() {
    if (!_preview_remaining) return;

    if (--_preview_remaining == 0) {
        Display::setBrightness(0);
    }
}

} // namespace NightMode
