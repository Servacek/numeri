#include "night_mode.h"

#include "clock.h"
#include "drivers/display.h"
#include "drivers/led.h"
#include "services/logging.h"
#include "services/sync.h"

namespace NightMode {

// Po stlaceni tlacidla v night mode zobrazime cas po tuto dobu (ms).
static constexpr uint16_t _NIGHT_PREVIEW_MS = 15000u;

// Odpocet zostatkoveho casu preview; 0 = preview neaktivne.
static uint16_t _preview_remaining = 0u;

/////////////////////////////////
// Verejne funkcie
/////////////////////////////////

void enter() {
    // V nocnom rezime je jas vypnuty.
    Display::setBrightness(0);
    // Ledka tiez nesvieti vobec.
    Led::setRGB(0, 0, 0); // Vypneme LED ale zachovame ulozeny jas.
    Led::lock();

    info(F("[NightMode] Aktivovany.\n"));
}

void exit() {
    info(F("[NightMode] Ukonceny.\n"));
}

// Volane pri stlaceni lubovolneho tlacidla v nocnom rezime.
void startPreview() {
    if (!_preview_remaining) { // Ak prvy krat zobrazujeme nahlad.
        info(F("[NightMode] Prezeranie casu.\n"));
        // Umoznime LED-ke aby blikala.
        Led::unlock();
        DCF77Sync::restoreStatusLED();

        // V AUTO rezime zacneme na MIN_BRIGHTNESS - LDR slucka zvysi jas
        // v zavislosti od okolia (v ramci uzivatelskeho stropu) na nasl. ticku.
        // V MANUAL rezime LDR nezasahuje, takze ostavame na uzivatelskom strope.
        const uint8_t b = (Config::get(Config::DISPLAY_BRIGHTNESS_MODE) == Config::BRIGHTNESS_AUTO)
            ? Display::MIN_BRIGHTNESS
            : Display::getConfigBrightness();
        Display::setBrightness(b);
        Display::displayTimeFromCounters(Clock::t_counter_minutes, Clock::t_counter_hours);
    }

    _preview_remaining = _NIGHT_PREVIEW_MS; // Kazde stlacenie resetuje cas, aj drzanie.
}

void stopPreview() {
    enter(); // Vstupujeme opat do nocneho rezimu.
}

void onMillisecondTick() {
    if (!_preview_remaining) return; // Nahlad nie je aktivny.

    if (--_preview_remaining == 0) {
        stopPreview(); // Vstupujeme opat do nocneho rezimu.
    }
}

} // namespace NightMode
