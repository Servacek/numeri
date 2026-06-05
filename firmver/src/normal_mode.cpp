#include "normal_mode.h"

#include "clock.h"
#include "drivers/display.h"
#include "drivers/led.h"
#include "services/views.h"

namespace NormalMode {

void enter() {
    // Zresetujeme stav viewov (moze byt nenulovy po zobrazovani v nocnom rezime).
    Views::reset();
    Led::unlock();
    Led::setRGB(0, 0, 0);
    Display::setBrightness(Display::getConfigBrightness());
    Display::displayTimeFromCounters(Clock::t_counter_minutes, Clock::t_counter_hours);
}

}
