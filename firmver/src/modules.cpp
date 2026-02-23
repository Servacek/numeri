#include "modules.h"

namespace Modules {

#if RTC_ENABLED
DS3231 RTC;
#endif
#if INA_ENABLED
INA219 INA(INA219_ADDR);
#endif

uint8_t _MODULES = 0;

typedef bool (*DetectFn)();
struct Module {
    DetectFn detect;
};

// ─── Detection helpers ────────────────────────────────────────────────────────

static bool _DS3231_Present() {
#if RTC_ENABLED
    Wire.beginTransmission(DS3231_ADDR);
    return Wire.endTransmission() == 0;
#else
    return false;
#endif
}

static bool _DCF77_Present() {
#if DCF77_ENABLED
    return !(ACSR & (1 << ACO));
#else
    return false;
#endif
}

static bool _INA219_Present() {
#if INA_ENABLED
    return INA.isConnected();
#else
    return false;
#endif
}

static const Module modules[MODULE_COUNT] = {
    {_DS3231_Present}, // MODULE_RTC
    {_DCF77_Present},  // MODULE_DCF77
    {_INA219_Present}, // MODULE_INA
};

// ─── Connection-change callbacks ─────────────────────────────────────────────

static void _onPeripheralStateChanged(bool connected) {
    sprintln(connected ? F("[INFO] Modul pripojený.")
                       : F("[INFO] Modul odpojený."));
    SET_ALL_LED_BRIGHT(0);
    SET_LED_COLOR(connected ? LED_G : LED_R, led_brightness);
    wait(2000);
    SET_ALL_LED_BRIGHT(0);
}

// ─── Status polling ───────────────────────────────────────────────────────────

bool isConnected(uint8_t module_index) {
    return BIS(_MODULES, module_index) != 0;
}

void updateConnectionStatus() {
    for (uint8_t i = 0; i < MODULE_COUNT; i++) {
        const bool was_connected = BIS(_MODULES, i) != 0;
        const bool now_connected = modules[i].detect();

        if (now_connected != was_connected) {
            MBI(_MODULES, i, now_connected);
            _onPeripheralStateChanged(now_connected);
        }
    }
}

} // namespace Modules
