#ifndef MODULES_H
#define MODULES_H

#include <stdint.h>

#include "const.h"

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
};

bool isConnected(uint8_t module_index);
void updateConnectionStatus();

void initializeModules();

} // namespace Modules

#endif // MODULES_H
