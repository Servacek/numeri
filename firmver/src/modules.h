#ifndef __MODULES_H__
#define __MODULES_H__

#include "isr.h"
#include "led.h"
#include "main.h"


#if RTC_ENABLED
#include "ds.h"
#include <DS3231.h>
#include <Wire.h>

#endif
#if INA_ENABLED
#include <INA219.h>
#endif
#if DCF77_ENABLED
#include <dcf77.h>
#endif

namespace Modules {

enum ModuleType : uint8_t {
    MODULE_RTC   = 0,
    MODULE_DCF77 = 1,
    MODULE_INA   = 2,
    MODULE_COUNT,
};

#if RTC_ENABLED
extern DS3231 RTC;
#endif
#if INA_ENABLED
extern INA219 INA;
#endif

extern uint8_t _MODULES;

bool isConnected(uint8_t module_index);
void updateConnectionStatus();

} // namespace Modules

#endif // __MODULES_H__
