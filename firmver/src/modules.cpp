#include "modules.h"
#include "reg.h"

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

static inline bool _INA219_Present() {
#if INA_ENABLED
    return INA219::isConnected();
#else
    return false;
#endif
}

static const DetectFn module_detectors[MODULE_COUNT] = {
    _DS3231_Present, // MODULE_DS3231
    _INA219_Present, // MODULE_INA219
};

//

static void _onModuleStateChanged(const uint8_t module, const bool connected) {
    sprint("[INFO] Modul ");
    sprint(module == MODULE_DS3231   ? "RTC" :
           module == MODULE_INA219   ? "INA219" : "Neznámy");
    sprint(F(" "));
    sprintln(connected ? F("pripojený.")
                       : F("odpojený."));
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

void initializeModules() {
    /****************************************
     * I2C zbernica
     ****************************************/

    #if I2C_ENABLED
        sprintln(F("Inicializácia I2C zbernice..."));

        // Nastavy piny PC4 a PC5 ako INPUT_PULLUP
        Wire.begin();

        // Zistime pripojenie modulov uz tu, aby RTC begin() mohol byt
        // zavolany este pred vstupom do hlavnej slucky.
        Modules::updateConnectionStatus();
    #endif

    /****************************************
     * RTC modul
     ****************************************/

    #if RTC_ENABLED
        if (Modules::isConnected(Modules::MODULE_DS3231)) {
            sprintln(F("RTC modul inicializovaný."));

            Modules::DS3231::begin();
        } else {
            sprintln(F("[Varovanie] RTC modul nebol nájdený!"));
        }
    #endif

    /****************************************
     * Senzor Prudu
     ****************************************/

    // ! Potrebujeme mat povolene prerusenia kvoli I2C komunikacii.
    // https://www.ti.com/lit/ds/symlink/ina219.pdf
    #if INA_ENABLED
        sprintln(F("Inicializácia senzora prúdu..."));

        if (Modules::INA219::begin()) {
            sprintln(F("Senzor prúdu inicializovaný."));
        } else {
            sprintln(F("Prúdový senzor nebol nájdený!"));
        }
    #endif

} // end initializeModules

} // namespace Modules
