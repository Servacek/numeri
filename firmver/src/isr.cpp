
#include <avr/interrupt.h>

#include "clock.h"
#include "drivers/display.h"
#include "drivers/led.h"
#include "services/sync.h"
#include "utils/utils.h"


ISR(TIMER2_COMPA_vect) {
    DCF77Sync::onISRTick();
    Display::onISRTick();
    Utils::onISRTick();
    Led::onISRTick();
    Clock::onISRTick();
}
