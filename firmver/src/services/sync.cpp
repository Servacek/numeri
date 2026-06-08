
#include "sync.h"
#include "services/logging.h"
#include "drivers/led.h"
#include "drivers/display.h"
#include "const.h"

namespace DCF77Sync {

using namespace Clock;

// Cas zachyteny v momente syncu - zapisany z ISR, citany z hlavnej slucky.
static Clock::time_t _synced_time;

static uint16_t _syncing_time_elapsed = 0; // sekundy od zahajenia synchronizacie

static int8_t _last_sync_result = -1; // -1 = ziadny sync, 0 = neuspech, 1 = uspech

// CALLED_FROM_ISR - zapise cas do buffra, odregistruje handler a nastavi flag.
// Vola sa prave raz za session: hned ako kniznca dosiahne stav locked/synced.
static void _onDecodedTime(const Clock::time_t &decoded_time) {
    _synced_time = decoded_time;
    DCF77_Clock::set_output_handler(nullptr); // odregistrujeme - iba raz za session
    State::setFlag(FLAG_DCF_SYNC);
}

static void _onSyncResult(bool success) {
    _turnOffModule();
    _last_sync_result = success ? 1 : 0;
    Led::setRGB(success ? Led::Palette::SYNC_OK : Led::Palette::SYNC_FAIL);
}

static void _setCountersToSyncedTime() {
    // DEBUG: surovy obsah _synced_time tak, ako ho dodala DCF77 kniznica.
    // Porovnaj s nastennymi hodinami v momente vypisu na lokalizaciu offsetu.
    sprint(F("[DCF] raw sync = "));
    sprint(bcd_to_int(_synced_time.hour));   sprint(F(":"));
    sprint(bcd_to_int(_synced_time.minute)); sprint(F(":"));
    sprint(bcd_to_int(_synced_time.second)); sprint(F("  date "));
    sprint(bcd_to_int(_synced_time.day));    sprint(F("."));
    sprint(bcd_to_int(_synced_time.month));  sprint(F("."));
    sprint(bcd_to_int(_synced_time.year) + 2000);
    sprint(F("  DST="));
    sprintln(_synced_time.uses_summertime ? F("CEST") : F("CET"));

    Clock::setCurrentTime(
        bcd_to_int(_synced_time.hour),
        bcd_to_int(_synced_time.minute),
        bcd_to_int(_synced_time.second)
    );

    #if RTC_ENABLED
    Modules::DS3231::DateTime dt{
        /*second=*/bcd_to_int(_synced_time.second),
        /*minute=*/t_counter_minutes,
        /*hour=*/t_counter_hours,
        /*day=*/bcd_to_int(_synced_time.day),
        /*month=*/bcd_to_int(_synced_time.month),
        /*year=*/(uint16_t)(bcd_to_int(_synced_time.year) + 2000)};
    Modules::DS3231::adjust(dt);
    #endif

    if (Clock::canDisplayTime()) {
        sprintln(F("Zobrazovanie noveho casu..."));
        Display::displayTimeFromCounters(t_counter_minutes, t_counter_hours);
    }
}

//////////////////////////////

void startSynchronization() {
    // Pri kazdom starte sa uistime, ze hodnoty su validne.
    COMPARATOR_ADC_MODE(DCF_OUT);

    // Za 15 minut je drift priblizne 100 ms, co znaci, ze presnost
    // nasho krystalu je (0.04 / 1020) * 1000 = ~39 ppm.
    // Velkost driftu v hertzoch je:
    // (dT1 / dT2) * F_CPU
    // Ci uz original cip alebo klon, rozdiel je minimalny.
    // https://blog.blinkenlight.net/experiments/dcf77/crystal-frequency-compensation/
    Internal::Generic_1_kHz_Generator::adjust(CLOCK_DRIFT_HZ);
    DCF77_Clock::setup(_sampleInputPin);
    DCF77_Clock::set_output_handler(_onDecodedTime);

    _turnOnModule();

    _syncing_time_elapsed = 0;
}


void stopSynchronization() {
    if (!_isTryingToSync()) return;
    _turnOffModule();
}

void onSecondTick() {
    if (_isTryingToSync()) {
        _syncing_time_elapsed++;
        if (_syncing_time_elapsed >= MAX_SYNC_TIME_SECONDS) {
            // Ak sa nam nepodarilo synchronizovat do casoveho limitu.
            _onSyncResult(false);
        }
    }

    if (State::consumeFlag(FLAG_DCF_SYNC)) {
        _onSyncResult(true);
        _setCountersToSyncedTime();
    }
}

void onMillisecondTick() {
    #if DCF77_ENABLED
    // Ked je modul vypnuty (po syncu), LED sa nedotykame - zelena moze pretrvavat.
    if (!_isModuleTurnedOff()) {
        if (State::isFlagSet(FLAG_DCF_LEDONN)) {
            Led::setRGB(Led::Palette::SYNCING);
        } else {
            Led::setRGB(0, 0, 0);
        }
    }

    State::clearFlag(FLAG_DCF_LEDONN);
    #endif
}

void restoreStatusLED() {
    if (!_isModuleTurnedOff()) return; // sync prebieha, pulzy maju prioritu
    if (_last_sync_result == 1) {
        Led::setRGB(Led::Palette::SYNC_OK);
    } else if (_last_sync_result == 0) {
        Led::setRGB(Led::Palette::SYNC_FAIL);
    } else {
        Led::setRGB(0, 0, 0);
    }
}

} // namespace DCF77Sync
