#include "clock.h"
#include "isr.h"

//////////////////////////////

volatile uint8_t MODE = 0;
volatile uint8_t FLAG = 0;

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
    if (Modules::isConnected(Modules::MODULE_DS3231)) { // ak RTC_ENABLED nie je 1, toto vrati vzdy 0
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
    const uint8_t _t_counter_hours      = t_counter_hours;
    const uint8_t _t_counter_minutes    = t_counter_minutes;

    if (Modules::isConnected(Modules::MODULE_DS3231)) { // ak RTC_ENABLED nie je 1, toto vrati vzdy 0
        #if RTC_ENABLED
        uint8_t h = 0, m = 0;
        if (Modules::DS3231::readTime(h, m)) {
            t_counter_hours   = h;
            t_counter_minutes = m;
        }
        #endif
    } else { // Skusime este dostat presny cas z DCF77 modulu.
        #if DCF77_ENABLED
        const uint8_t clock_state = DCF77_Clock::get_clock_state();
        if (clock_state == Clock::locked || clock_state == Clock::synced) {
            Clock::time_t now; DCF77_Clock::get_current_time(now);

            t_counter_hours = bcd_to_int(now.hour);
            t_counter_minutes = bcd_to_int(now.minute);
        }
        #else
            if (BIS(FLAG, FLAG_NEW_MINUTE)) {
                addNewMinuteToCounters();

                CBI(FLAG, FLAG_NEW_MINUTE);
            }
        #endif
    }

    return (t_counter_hours != _t_counter_hours || t_counter_minutes != _t_counter_minutes);
}
