#include "utils/math.h"

#include "utils/utils.h"
#include "clock.h"
#include "edit.h"
#include "services/logging.h"
#include "services/views.h"
#include "modules.h"
#include "drivers/display.h"
#include "drivers/led.h"
#include "timers.h"
#include "const.h"
#include "fading.h"
#include "state.h"
#include "night_mode.h"


namespace Edit {

//////////////////////////////
/// Sukromne premenne
//////////////////////////////

static uint8_t  _cur_page_index = 0;
static uint16_t _idle_seconds   = 0;

// Zaciname nastavovat cas od desiatok hodin.
static uint8_t  _selected_digit = DIGIT_HOR_TENS;

// Pocet stranok dostupnych uzivatelovi (vynechava interne stranky ulozenia casovacov).
static constexpr uint8_t _USER_PAGE_COUNT = Config::YEAR_D1 / CONFIG_PAGE_SIZE + 1u;

//////////////////////////////
/// Sukromne funkcie
//////////////////////////////

bool isEditingLedBrightness() {
    return _cur_page_index == Config::page(Config::LED_BRIGHTNESS_LEVEL)
        && _selected_digit  == Config::indexInPage(Config::LED_BRIGHTNESS_LEVEL);
}

// Pocas editacie jasu LED-ky drzime LED-ku zamknutu na bielej, aby ju
// ziadny iny vlastnik (DCF77 sync, atd.) nemohol pocas preview prepisat.
static void _updateLedPreview() {
    Led::unlock(); // bezpecne aj ak nebola zamknuta
    if (isEditingLedBrightness()) {
        Led::setRGB(255, 255, 255);
        Led::lock();
    } else {
        Led::setRGB(0, 0, 0);
    }
}

static void _setSelectedDigit(uint8_t digit) {
    // Presunieme kurzor na novu vybranu cifru.
    Display::addNumitronSegmentMask(_selected_digit, S2, OFF);
    Display::addNumitronSegmentMask(digit, S2, ON);
    _selected_digit = digit;
    _updateLedPreview();
}

static void _setSymbolOnNumitronWithCursor(uint8_t numitron_index, uint8_t symbol_index) {
    Display::setSymbolOnNumitron(numitron_index, symbol_index);
    if (numitron_index == _selected_digit && Clock::State::inEditMode()) {
        Display::_DIGITS[numitron_index] |= S2; // Uistime sa, ze kurzor je vzdy viditelny.
    }
}

static void _displayConfigPage(uint8_t page_index) {
    sprint("STRANKA: ");
    sprint(page_index);
    sprint(" HODNOTY NUMITRONOV:");
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        sprint(" ");
        sprint(Config::get(Config::toID(page_index, conf_index)));
        _setSymbolOnNumitronWithCursor(
            conf_index, Config::get(Config::toID(page_index, conf_index))
        );
    }
    sprintln("");

    Display::Crossfading::startTransition();
    _updateLedPreview();
}

static void _signalizeInvalidConfig() {
    // Zablikame displejom pre signalizaciu neplatnych nastaveni.
    Display::setBrightness(Display::MIN_BRIGHTNESS);
    Utils::waitUntil([]{ return !Display::isBrightnessTransitioning(); });
    Display::setBrightness(Display::MAX_BRIGHTNESS);
    Utils::waitUntil([]{ return !Display::isBrightnessTransitioning(); });
    Display::setBrightness(Display::getConfigBrightness());
}

// TODO: Mozno by nebolo od veci dat toto niekam do prec.
static void _onLedBrightnessSet(uint8_t /*page_index*/, uint8_t /*conf_index*/) {
    const uint8_t val = MAP_CLAMPED(
        Config::get(Config::LED_BRIGHTNESS_LEVEL),
        (uint8_t)0, (uint8_t)8,
        (uint8_t)0, (uint8_t)MAX_LED_BRIGHTNESS
    );
    // setBrightness obchadza zamok, takze sa prejavi aj pocas LED-brightness preview.
    Led::setBrightness(val);
}

//////////////////////////////
/// Sprava konfiguracii
//////////////////////////////

static void loadTimePage(uint8_t page_index) {
    // Uistime sa, ze pocidla hodin a minut su aktualne.
    Clock::updateTimeCountersFromTimeSources();

    for (uint8_t digit_index = 0; digit_index < DIGIT_COUNT; digit_index++) {
        Config::set(
            Config::toID(page_index, digit_index),
            Display::getTimeDigitWithIndex(
                digit_index, Clock::t_counter_minutes, Clock::t_counter_hours
            )
        );
    }
}

static bool saveTimePage(uint8_t) {
    // Je pocet hodin v nastavenom case platny? Minuty su platne vzdy (od 00-59).
    const uint8_t hours = Config::get(Config::TIME_H1) + Config::get(Config::TIME_H10) * 10u;
    if (hours >= MAX_HOURS_COUNT) {
        // Cas je neplatny,
        return false;
    }

    const uint8_t minutes = Config::get(Config::TIME_M1) + Config::get(Config::TIME_M10) * 10u;
    Clock::setCurrentTime(hours, minutes, 0); // V momente ulozenia zaciname pocitat od 0 sekund.

    Clock::updateTimeSourceFromTimeCounters(); // TODO: Hodne pochybna ficurka.
    return true;
}

static void loadDatePage(uint8_t page_index) {
    uint8_t month = 1, day = 1;
    Modules::DS3231::DateTime now{};
    if (Modules::DS3231::now(now)) {
        month = now.month;
        day   = now.day;
    }

    Config::set(Config::toID(page_index, 0), day / 10);
    Config::set(Config::toID(page_index, 1), day % 10);
    Config::set(Config::toID(page_index, 2), month / 10);
    Config::set(Config::toID(page_index, 3), month % 10);
}

static bool saveDatePage(uint8_t) {
    if (!Modules::isConnected(Modules::MODULE_DS3231)) {
        return true;
    }

    Modules::DS3231::DateTime now {};
    if (!Modules::DS3231::now(now)) {
        return false; // Neplatny datum.
    }

    Modules::DS3231::DateTime updated{
        /*minute=*/now.minute,
        /*hour=*/now.hour,
        /*day=*/(uint8_t)(Config::get(Config::DATE_DAY_D10) * 10 + Config::get(Config::DATE_DAY_D1)),
        /*month=*/(uint8_t)(Config::get(Config::DATE_MONTH_D10) * 10 + Config::get(Config::DATE_MONTH_D1)),
        /*year=*/now.year,
    };

    if (!Modules::DS3231::isDateTimeValid(updated)) {
        return false; // Neplatny datum.
    }

    Modules::DS3231::adjust(updated);
    return true;
}

static void loadYearPage(uint8_t page_index) {
    Modules::DS3231::DateTime now{};
    if (!Modules::DS3231::now(now)) {
        return;
    }

    const uint16_t year = now.year;

    Config::set(Config::toID(page_index, 0), (year / 1000) % 10);
    Config::set(Config::toID(page_index, 1), (year / 100) % 10);
    Config::set(Config::toID(page_index, 2), (year / 10) % 10);
    Config::set(Config::toID(page_index, 3), year % 10);
}

static bool saveYearPage(uint8_t) {
    const uint16_t year = Config::get(Config::YEAR_D1000) * 1000
                        + Config::get(Config::YEAR_D100) * 100
                        + Config::get(Config::YEAR_D10) * 10
                        + Config::get(Config::YEAR_D1);

    if (!Modules::isConnected(Modules::MODULE_DS3231)) {
        return true; // Nemame co riesit, modul nie je dostupny.
    }

    Modules::DS3231::DateTime now{};
    if (!Modules::DS3231::now(now)) {
        return true; // Nepodarilo sa nam ziskat referency cas, pustime uzivatela dalej.
    }

    Modules::DS3231::DateTime updated{
        /*minute=*/now.minute,
        /*hour=*/now.hour,
        /*day=*/now.day,
        /*month=*/now.month,
        /*year=*/year,
    };

    if (!Modules::DS3231::isDateTimeValid(updated)) {
        return false; // Neplatny datum.
    }

    Modules::DS3231::adjust(updated);
    return true;
}

//////////////////////////////
/// Verejne funkcie
//////////////////////////////

void enter() {
    sprintln(F("enterEditMode"));
    // Vybrany numitron sa uklada napriec nastavovacimi relaciami.
    _setSelectedDigit(_selected_digit);

    _idle_seconds   = 0;
    _cur_page_index = 0; // Zaciname vzdy od prvej stranky - nastavovanie casu.

    // Pocas editacneho rezimu svieti displej minimalne na DEFAULT_BRIGHTNESS
    // (napr. po prechode z nocneho rezimu kde je _target_brightness == 0).
    Display::setBrightness(
        Display::getConfigBrightness() < Display::DEFAULT_BRIGHTNESS
            ? Display::DEFAULT_BRIGHTNESS
            : Display::getConfigBrightness()
    );

    Config::loadForPage(_cur_page_index);
}

void exit() {
    sprintln(F("exitEditMode"));
    _cur_page_index = 0;
    Led::unlock(); // uvolni zamok pred NormalMode::enter()
}

void setupAllConfigurations() {
    // Registrujeme vlastne save/load funkcie pre stranku casu,
    // ktore synchronizuju hodnoty s RTC / countrami namiesto priameho zapisu do EEPROM.
    Config::setSaveCallbackForPage(Config::page(Config::TIME_H10), saveTimePage);
    Config::setLoadCallbackForPage(Config::page(Config::TIME_H10), loadTimePage);

    Config::setSaveCallbackForPage(Config::page(Config::DATE_DAY_D10),     saveDatePage);
    Config::setLoadCallbackForPage(Config::page(Config::DATE_DAY_D10),     loadDatePage);

    Config::setLoadCallbackForPage(Config::page(Config::YEAR_D1000),         loadYearPage);
    Config::setSaveCallbackForPage(Config::page(Config::YEAR_D1000),         saveYearPage);

    Config::setCallback(Config::LED_BRIGHTNESS_LEVEL, _onLedBrightnessSet);

    Timers::setup();

    Config::loadAll(); // Nacitajme konfiguracie z EEPROM pri startupe.
    _onLedBrightnessSet(0, 0); // Aplikuj ulozenu hodnotu jasu LED.
}

//////////////////////////////
/// Sekundovy handler
//////////////////////////////

void onSecondTick() {
    if (Clock::State::inEditMode() && ++_idle_seconds >= _EDIT_MODE_TIMEOUT_S) {
        sprintln(F("Ukoncovanie edit rezimu kvoli casovemu limitu..."));
        Config::loadForPage(_cur_page_index);
        Clock::State::dispatch(Clock::State::EVT_EDIT_TIMEOUT);
        return;
    }

    if (Clock::updateTimeCountersFromTimeSources()) {
        if (Clock::State::inNormalMode()) {
            Display::displayTimeFromCounters(Clock::t_counter_minutes, Clock::t_counter_hours);
        }
    }
}

} // namespace Edit

//////////////////////////////
/// Handlery tlacidiel
//////////////////////////////
// Su mimo namespace pretoze ich deklaracie su v buttons.

using namespace Edit;

void onAnyButtonPressed() {
    sprintln(F("ANY BUTTON PRESSED"));

    if (Clock::State::inEditMode()) {
        _idle_seconds = 0;
    } else if (Clock::State::inNightMode()) {
        // V nocnom rezime kazde stlacenie zobrazi cas a obnovi odpocet preview.
        NightMode::startPreview();
    }
}

void onLeftButtonReleased() {
    sprintln(F("LEFT BUTTON RELEASED"));
    if (Clock::State::inEditMode()) {
        _setSelectedDigit((_selected_digit + 1) % DIGIT_COUNT);
        sprint(F("VYBRATY NUMITRON CISLO: "));
        sprintln(_selected_digit);
    } else if (
        Config::get(Config::DISPLAY_BRIGHTNESS_MODE) == Config::BRIGHTNESS_MANUAL &&
        !Clock::State::inNightMode()
    ) {
        const int16_t current = Display::getTargetBrightness();
        const int16_t next = CONSTRAIN(current + Display::BRIGHTNESS_STEP, 0, 255);
        Display::setConfigBrightness(uint8_t(next));
    }
}

void onLeftButtonLongPressed() {
    sprintln(F("LEFT BUTTON LONG PRESSED"));
    onLeftButtonReleased();
}

void onRightButtonReleased() {
    sprintln(F("RIGHT BUTTON RELEASED"));
    if (Clock::State::inEditMode()) {
        Config::increment(Config::toID(_cur_page_index, _selected_digit));
        _displayConfigPage(_cur_page_index);
    } else if (
        Config::get(Config::DISPLAY_BRIGHTNESS_MODE) == Config::BRIGHTNESS_MANUAL &&
        !Clock::State::inNightMode()
    ) {
        // Ak je jas nastaveny na "manual", dovolme ho upravovat pomocou tlacidiel.
        const int16_t current = Display::getTargetBrightness();
        const int16_t next = CONSTRAIN(current - Display::BRIGHTNESS_STEP, 0, 255);
        Display::setConfigBrightness(uint8_t(next));

        if (Display::getTargetBrightness() == 0) {
            // prepneme do nocneho rezimu ak sme zmenili jas na 0
            Clock::State::dispatch(Clock::State::EVT_ENTER_NIGHT);
        }
    }
}

void onRightButtonLongPressed() {
    sprintln(F("RIGHT BUTTON LONG PRESSED"));
    onRightButtonReleased();
}

// Kratke stlacenie oboch tlacidiel naraz, zobraz dalsi view
void onBothButtonsReleased() {
    sprintln(F("BOTH BUTTONS RELEASED"));

    if (!Clock::State::inEditMode()) {
        // Mimo editacneho rezimu kratke stlacenie oboch tlacidiel zobrazuje teplotu a datum.
        Views::showNextViewOrHide();
        return;
    }

    // V editacnom rezime kratkym stlacenim oboch tlacidiel prepiname medzi strankami nastaveni.
    if (!Config::saveForPage(_cur_page_index)) {
        _signalizeInvalidConfig();
        return; // Nepodarilo sa ulozit nastavenia pre danu stranku (su neplatne).
    }
    _cur_page_index = (_cur_page_index + 1u) % _USER_PAGE_COUNT;
    Config::loadForPage(_cur_page_index);
    _displayConfigPage(_cur_page_index);
}

// Vykonavame bez opakovani
void onBothButtonsLongPressed() {
    sprintln(F("BOTH BUTTONS LONG PRESSED"));
    if (Clock::State::inEditMode()) {
        if (!Config::saveForPage(_cur_page_index)) {
            _signalizeInvalidConfig();
            return; // Nepodarilo sa ulozit nastavenia pre danu stranku (su neplatne).
        }

        Clock::State::dispatch(Clock::State::EVT_EXIT_EDIT);
    } else if (Clock::State::dispatch(Clock::State::EVT_ENTER_EDIT)) {
        _displayConfigPage(_cur_page_index);
    }
}
