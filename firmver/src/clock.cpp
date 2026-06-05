#include "clock.h"
#include "services/logging.h"
#include "state.h"
#include "drivers/display.h"

//////////////////////////////

namespace Clock {

volatile uint16_t t_counter_millis = 0;

uint8_t t_counter_hours   = 0;
uint8_t t_counter_minutes = 0;

//////////////////////////////
/// Cas
//////////////////////////////

void addNewMinuteToCounters() {
    sprintln(F("addNewMinuteToCounters"));

    // Pocitame aj sami ak by nahodou neboli ziadne externe moduly k dispozicii.
    if (++t_counter_minutes >= MAX_MINUTES_COUNT) {
        t_counter_minutes = 0;
        if (++t_counter_hours >= MAX_HOURS_COUNT) {
            t_counter_hours = 0;
        }
    }
}


uint8_t updateTimeSourceFromTimeCounters() {
    if (Modules::isConnected(Modules::MODULE_DS3231)) {
#if RTC_ENABLED
        // Nacitame aktualny datum aby sme ho zachovali — menime len cas.
        Modules::DS3231::DateTime dt{};
        if (!Modules::DS3231::now(dt)) {
            // Ak sa nacitanie nepodarilo, pouzijeme bezpecne predvolene hodnoty.
            dt.day   = 1;
            dt.month = 1;
            dt.year  = 2000;
        }
        dt.minute = t_counter_minutes;
        dt.hour   = t_counter_hours;
        Modules::DS3231::adjust(dt);
#endif
    } // DCF77 prijimac neumoznuje manualne nastavovanie casu.

    return 1;
}

uint8_t updateTimeCountersFromTimeSources() {
    const uint8_t _t_counter_hours   = t_counter_hours;
    const uint8_t _t_counter_minutes = t_counter_minutes;

    if (Modules::isConnected(Modules::MODULE_DS3231)) {
        Modules::DS3231::readTime(t_counter_hours, t_counter_minutes);
    } else if (State::consumeFlag(FLAG_NEW_MINUTE)) {
        addNewMinuteToCounters();
    }
    State::consumeFlag(FLAG_NEW_MINUTE); // drainujeme vlajku ked DS3231 prebera

    return (t_counter_hours != _t_counter_hours ||
            t_counter_minutes != _t_counter_minutes);
}

////////////////////////////////////

void onISRTick() {
    if (++t_counter_millis % SECOND_MILLIS == 0) {
        State::setFlag(FLAG_NEW_SECOND);
        if (t_counter_millis >= MINUTE_MILLIS) {
            State::setFlag(FLAG_NEW_MINUTE);
            t_counter_millis = 0;
        }
    }

    State::setFlag(FLAG_NEW_MILLIS);
}

} // namespace Clock
