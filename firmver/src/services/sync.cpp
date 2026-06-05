
#include "sync.h"
#include "services/logging.h"
#include "drivers/led.h"
#include "drivers/display.h"
#include "edit.h"
#include "const.h"

namespace DCF77Sync {

using namespace Clock;

// Cas zachyteny v momente syncu - zapisany z ISR, citany z hlavnej slucky.
static Clock::time_t _synced_time;

static uint16_t _syncing_time_elapsed = 0; // sekundy od zahajenia synchronizacie

// CALLED_FROM_ISR - zapise cas do buffra, odregistruje handler a nastavi flag.
// Vola sa prave raz za session: hned ako kniznca dosiahne stav locked/synced.
static void _onDecodedTime(const Clock::time_t &decoded_time) {
    _synced_time = decoded_time;
    DCF77_Clock::set_output_handler(nullptr); // odregistrujeme - iba raz za session
    State::setFlag(FLAG_DCF_SYNC);
}

static void _onSyncResult(bool success) {
    _turnOffModule();
    if (!Edit::isEditingLedBrightness()) {
        Led::setRGB(success ? Led::Palette::SYNC_OK : Led::Palette::SYNC_FAIL);
    }
}

static void _setCountersToSyncedTime() {
    t_counter_hours   = bcd_to_int(_synced_time.hour);
    t_counter_minutes = bcd_to_int(_synced_time.minute);
    NO_INTERRUPTS_SECTION {
        t_counter_millis = (uint16_t)bcd_to_int(_synced_time.second) * 1000u;
    }

    #if RTC_ENABLED
    Modules::DS3231::DateTime dt{
        /*minute=*/t_counter_minutes,
        /*hour=*/t_counter_hours,
        /*day=*/bcd_to_int(_synced_time.day),
        /*month=*/bcd_to_int(_synced_time.month),
        /*year=*/(uint16_t)(bcd_to_int(_synced_time.year) + 2000)};
    Modules::DS3231::adjust(dt);
    #endif

    // V edit rezime displej vlastni uzivatel (zobrazuje upravovanu stranku),
    // v nocnom rezime ma byt displej tmavy - oba pripady preskakujeme.
    if (State::inNormalMode()) {
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
    if (!_isModuleTurnedOff() && !Edit::isEditingLedBrightness()) {
        if (State::isFlagSet(FLAG_DCF_LEDONN)) {
            Led::setRGB(Led::Palette::SYNCING);
        } else {
            Led::setRGB(0, 0, 0);
        }
    }

    State::clearFlag(FLAG_DCF_LEDONN);
    #endif
}

} // namespace DCF77Sync
