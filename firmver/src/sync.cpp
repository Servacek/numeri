
#include "sync.h"
#include "led.h"
#include "display.h"
#include "const.h"

#define IS_SYNCED(state) ((state) != Clock::useless && (state) != Clock::dirty)

namespace DCF77Sync {

void startSynchronization() {
    SET_ALL_LED_BRIGHT(0);

    // Pri kazdom starte sa uistime, ze hodnoty su validne.
    COMPARATOR_ADC_MODE(DCF_OUT);

    // Za 15 minut je drift priblizne 100 ms, co znaci, ze presnost
    // nasho krystalu je (0.04 / 1020) * 1000 = ~39 ppm.
    // Velkost driftu v hertzoch je:
    // (dT1 / dT2) * F_CPU
    // Ci uz original cip alebo klon, rozdiel je minimalny.
    // https://blog.blinkenlight.net/experiments/dcf77/crystal-frequency-compensation/
    Internal::Generic_1_kHz_Generator::adjust(CLOCK_DRIFT_HZ);
    DCF77_Clock::setup(DCF77Sync::_sampleInputPin);

    _turnOnModule();
}

bool isSynced() {
    return IS_SYNCED(DCF77_Clock::get_clock_state());
}

Clock::time_t getCurrentTime() {
    Clock::time_t now;
    DCF77_Clock::read_current_time(now);
    return now;
}

static bool syncJustHappened() {
    static uint8_t last_state = Clock::useless;

    const uint8_t state = DCF77_Clock::get_clock_state();
    const bool just_synced = IS_SYNCED(state) && !IS_SYNCED(last_state);
    last_state = state;
    return just_synced;
}

static void onSynced() {
    _turnOffModule(); // Sme zosynchronizovani, mame na nejaky cas volno.
    SET_LED_COLOR(LED_G, led_brightness);
}

static void handleDCF77ClockState() {
    static uint8_t last_state = Clock::useless;

    const uint8_t state = DCF77_Clock::get_clock_state();
    if (state != Clock::useless &&
        state != Clock::dirty) { // Vypada to ze sme synchronizovani!
        sprintln(F("Hodiny zosynchronizované, vypínanie DCF77 modulu..."));
        CBI(DDRB, DCF_PON); // Vypneme DCF prijimač

        if (last_state == Clock::useless || last_state == Clock::dirty) {
            SBI(FLAG, FLAG_DCF_SYNC);
        }

        SET_ALL_LED_BRIGHT(0);

        // Zelena indikuje uspesne zosynchronizovanie.
        SET_LED_COLOR(LED_G, led_brightness);
        last_state = Clock::useless;
    } else {
        last_state = state;
    }
}

void onSecondTick() {
    if (_isModuleTurnedOff()) {
        return; // Modul je vypnuty, nerobime nic.
    }

    if (syncJustHappened()) {
        // Tuto sekundu sme sa zosynchronizovali, treba to poriesit
        // a ulozit cas co mame do RTC.
        onSynced();
    }


    if (BIS(FLAG, FLAG_DCF_SYNC)) {
        CBI(FLAG, FLAG_DCF_SYNC); // Len raz
        _turnOffModule();

        SET_LED_COLOR(LED_G, led_brightness);

        Clock::time_t now = getCurrentTime();

        t_counter_hours   = bcd_to_int(now.hour);
        t_counter_minutes = bcd_to_int(now.minute);
        // ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
        //     timer_counter = (uint16_t)bcd_to_int(now.second) * 1000u;
        // }

#if RTC_ENABLED
        Modules::DS3231::DateTime dt{
            /*minute=*/t_counter_minutes,
            /*hour=*/t_counter_hours,
            /*day=*/bcd_to_int(now.day),
            /*month=*/bcd_to_int(now.month),
            /*year=*/(uint16_t)(bcd_to_int(now.year) + 2000)};
        Modules::DS3231::adjust(dt);
#endif

        sprintln(F("Zobrazovanie nového času..."));
        Display::displayTimeFromCounters(t_counter_minutes, t_counter_hours);

        CBI(DDRB, DCF_PON);
    } else {
        handleDCF77ClockState();
    }
}

} // namespace DCF77Sync
