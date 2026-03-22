#ifndef __MODULES_H__
#define __MODULES_H__

#include "isr.h"
#include "led.h"
#include "main.h"


#if RTC_ENABLED
#include "modules/ds3231.h"
#endif

#if INA_ENABLED
#include "modules/ina219.h"
#endif

#if DCF77_ENABLED
#include "modules/dcf77.h"
#endif

namespace Modules {

enum ModuleType : uint8_t {
    MODULE_DS3231,
    MODULE_INA219,

    MODULE_COUNT,
};

bool isConnected(uint8_t module_index);
void updateConnectionStatus();

void initializeModules();

} // namespace Modules

#endif // __MODULES_H__
