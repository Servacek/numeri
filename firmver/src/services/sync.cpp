
#include "sync.h"
#include "services/logging.h"
#include "drivers/led.h"
#include "drivers/display.h"
#include "const.h"

#define IS_SYNCED(state) ((state) != Clock::useless && (state) != Clock::dirty)

namespace DCF77Sync {

using namespace Clock;

void startSynchronization() {
    // Led::setRGB(0, 0, 0);

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
    Led::setColor(Led::Color::GREEN);
}

static void handleDCF77ClockState() {
    static uint8_t last_state = Clock::useless;

    const uint8_t state = DCF77_Clock::get_clock_state();
    if (state != Clock::useless &&
        state != Clock::dirty) { // Vypada to ze sme synchronizovani!
        sprintln(F("Hodiny zosynchronizované, vypínanie DCF77 modulu..."));
        CBI(DDRB, DCF_PON); // Vypneme DCF prijimač

        if (last_state == Clock::useless || last_state == Clock::dirty) {
            State::setFlag(FLAG_DCF_SYNC);
        }

        // Led::setRGB(0, 0, 0);

        // Zelena indikuje uspesne zosynchronizovanie.
        Led::setColor(Led::Color::GREEN);
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


    if (State::consumeFlag(FLAG_DCF_SYNC)) {
        _turnOffModule();

        Led::setColor(Led::Color::GREEN);

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

void onMillisecondTick() {
    #if DCF77_ENABLED
    // When synced, the second handler manages the LED (green = synced).
    // The DCF module is powered off after sync so the comparator sees a
    // floating pin (random ACO) — suppress the millis handler to avoid
    // wiping the green sync indicator 999 times per second.
    if (!State::isFlagSet(FLAG_DCF_SYNC)) {
        if (State::isFlagSet(FLAG_DCF_LEDONN)) {
            Led::setColor(Led::Color::RED);

            const uint8_t state = DCF77_Clock::get_clock_state();
            if (state == Clock::dirty) {
                // Zlta
                Led::setColor(Led::Color::RED); Led::setColor(Led::Color::GREEN);
            }
        } else {
            // Led::setRGB(0, 0, 0);
        }
    }

    Led::setRGB(255, 255, 255);

    State::clearFlag(FLAG_DCF_LEDONN);
    #endif
}

} // namespace DCF77Sync
