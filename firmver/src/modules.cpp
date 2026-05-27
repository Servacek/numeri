#include <serial.h>

#include "services/logging.h"
#include "modules.h"
#include "utils/reg.h"

namespace Modules {

static uint8_t _MODULES = 0;

static void _onModuleStateChanged(const uint8_t module, const bool connected) {
    info(F("Modul "));
    sprint(module == MODULE_DS3231 ? F("RTC") : F("INA219"));
    sprintln(connected ? F(" pripojený.") : F(" odpojený."));
}

static void _checkModule(const uint8_t idx, const bool now_connected) {
    const bool was_connected = BIS(_MODULES, idx) != 0;
    if (now_connected != was_connected) {
        WBI(_MODULES, idx, now_connected);
        _onModuleStateChanged(idx, now_connected);
    }
}

bool isConnected(uint8_t module_index) {
    return BIS(_MODULES, module_index) != 0;
}

void updateConnectionStatus() {
#if RTC_ENABLED
    _checkModule(MODULE_DS3231, DS3231::isConnected());
#endif
#if INA_ENABLED
    _checkModule(MODULE_INA219, INA219::isConnected());
#endif
}

void initializeModules() {
    /****************************************
     * I2C zbernica
     ****************************************/

    #if I2C_ENABLED
        info(F("Inicializácia I2C zbernice...\n"));

        // Nastavy piny PC4 a PC5 ako INPUT_PULLUP
        Wire.begin();

        // Zabranime nekonecnemu zablokovaniu hlavnej slucky pri I2C chybe.
        // Pri timeout-e sa TWI hardver resetne a volanie vrati chybu.
        twi_setTimeoutInMicros(25000ul, true);

        // Zistime pripojenie modulov uz tu, aby RTC begin() mohol byt
        // zavolany este pred vstupom do hlavnej slucky.
        Modules::updateConnectionStatus();
    #endif

    /****************************************
     * RTC modul
     ****************************************/

    #if RTC_ENABLED
        if (Modules::isConnected(Modules::MODULE_DS3231)) {
            info(F("RTC modul inicializovaný.\n"));

            Modules::DS3231::begin();
        } else {
            warn(F("RTC modul nebol nájdený!\n"));
        }
    #endif

    /****************************************
     * Senzor Prudu
     ****************************************/

    // ! Potrebujeme mat povolene prerusenia kvoli I2C komunikacii.
    // https://www.ti.com/lit/ds/symlink/ina219.pdf
    #if INA_ENABLED
        info(F("Inicializácia senzora prúdu...\n"));

        if (Modules::INA219::begin()) {
            info(F("Senzor prúdu inicializovaný.\n"));
        } else {
            warn(F("Prúdový senzor nebol nájdený!\n"));
        }
    #endif

} // end initializeModules

} // namespace Modules
