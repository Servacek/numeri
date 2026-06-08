#include "normal_mode.h"

#include "clock.h"
#include "drivers/display.h"
#include "drivers/led.h"
#include "services/sync.h"

namespace NormalMode {

void enter() {
    Led::unlock();
    DCF77Sync::restoreStatusLED();
    Display::setBrightness(Display::getConfigBrightness());
    Display::displayTimeFromCounters(Clock::t_counter_minutes, Clock::t_counter_hours);
}

}
