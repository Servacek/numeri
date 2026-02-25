#include "modules.h"

namespace Modules {

static uint8_t _MODULES = 0;

typedef bool (*DetectFn)();

// Funkcie na overovanie pritomnosti modulov.

static inline bool _DS3231_Present() {
#if RTC_ENABLED
    return DS3231::isConnected();
#else
    return false;
#endif
}

static inline bool _DCF77_Present() {
#if DCF77_ENABLED
    // TODO: Nevieme to zatial spolahlivo detekovat,
    // Jednoducho pri starte a na podnet timeru zavolame.
    return false;
#else
    return false;
#endif
}

static inline bool _INA219_Present() {
#if INA_ENABLED
    return INA219::isConnected();
#else
    return false;
#endif
}

static const DetectFn module_detectors[MODULE_COUNT] = {
    _DS3231_Present, // MODULE_DS3231
    _DCF77_Present,  // MODULE_DCF77
    _INA219_Present, // MODULE_INA219
};

//

static void _onModuleStateChanged(const uint8_t module, const bool connected) {
    sprint("[INFO] Modul ");
    sprint(module == MODULE_DS3231   ? "RTC" :
           module == MODULE_DCF77 ? "DCF77" :
           module == MODULE_INA219   ? "INA219" : "Neznámy");
    sprintln(connected ? F("pripojený.")
                       : F("odpojený."));

    if (connected) {
        // modul bol pripojeny, je treba zavolat jeho begin funkciu.

    }

    SET_ALL_LED_BRIGHT(0);
    SET_LED_COLOR(connected ? LED_G : LED_R, led_brightness);
    wait(2000);
    SET_ALL_LED_BRIGHT(0);
}

// Verejne funkcie

bool isConnected(uint8_t module_index) {
    return BIS(_MODULES, module_index) != 0;
}

// Volame v hlavnom cykle kazdu sekundu.
void updateConnectionStatus() {
    for (uint8_t i = 0; i < MODULE_COUNT; i++) {
        const bool was_connected = BIS(_MODULES, i) != 0;
        const bool now_connected = module_detectors[i]();

        if (now_connected != was_connected) {
            MBI(_MODULES, i, now_connected);
            _onModuleStateChanged(i, now_connected);
        }
    }
}

} // namespace Modules
