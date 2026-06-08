/* Sluzba monitor sleduje prudovy odber numitronoveho displeja a porovnava
 * ho s odhadom podla aktualneho jasu a poctu rozsvietenych segmentov.
 *
 * Detekuje vypalene segmenty (prevencia chybne zobrazenych cisel) aj
 * poruchy v softveri/hardveri (napr. zlyhanie PWM by mohlo dostat
 * numitrony na plnych 5 V).
 *
 * KALIBRACIA
 * Pre kazdu uroven jasu (0..BRIGHTNESS_LEVELS-1) rozsvietime vsetky
 * segmenty, pockame na ustalenie, zmerame cerstvu vzorku prudu a
 * vydelime poctom svietiacich segmentov. Vysledok ulozime do EEPROM
 * (s CRC8 na koncu).
 *
 * DETEKCIA
 * Kazdu sekundu (LEN v NORMAL mode, pri ustalenom displeji) porovnavame
 * namerany prud s odhadom = per_segment[level] * lit_segments. Az 3
 * rovnake poruchy po sebe spustia obsluhu:
 *   - NADPRUD : Display::emergencyShutdown() + trvale cervene blikanie.
 *   - PODPRUD : izolacia vadnych numitronov, displej pokracuje na
 *               zvysnych cifrach + trvale modre blikanie.
 *
 * Predvolene je monitorovanie vypnute (CURRENT_SENSOR_ENABLED = 0),
 * aby bolo mozne ho vypnut podrzanim RESET tlacidla v pripade, ze
 * by sa system pokazil a nespravne vypinal displej.
 */

#include <stdint.h>
#include <string.h>
#include <avr/wdt.h>

#include "drivers/display.h"
#include "drivers/led.h"
#include "modules/ina219.h"
#include "services/logging.h"
#include "libs/EEPROM.h"
#include "utils/utils.h"
#include "utils/crc.h"
#include "state.h"
#include "clock.h"

namespace Monitor {

// ─── Konstanty ───────────────────────────────────────────────────────────────

static constexpr int8_t   _UNDEFINED_CURRENT    = -1;
static constexpr int16_t  _MIN_DIFFERENCE       = 50;   // 5 mA (jednotky 0.1 mA)
static constexpr uint8_t  _CONSECUTIVE_FAILS    = 3;
static constexpr uint16_t _INA_FRESH_TIMEOUT_MS = 250;  // dlhsie ako 1 konverzny cyklus (~136 ms)
static constexpr uint16_t _SETTLE_TIMEOUT_MS    = 5000; // ramp jasu aj crossfade su <= 4096 ms
static constexpr uint8_t  _BLINK_HALF_PERIOD_MS = 250;  // 4 Hz blikanie

// EEPROM layout (umiestneny na konci EEPROM oblasti).
static constexpr uint16_t _EEPROM_SIZE       = 1024;
static constexpr uint8_t  _TABLE_SIZE_BYTES  = BRIGHTNESS_LEVELS * sizeof(int8_t);
static uint8_t* const     _EEPROM_TABLE_ADDR = (uint8_t*)(_EEPROM_SIZE - _TABLE_SIZE_BYTES - 1);
static uint8_t* const     _EEPROM_CRC_ADDR   = (uint8_t*)(_EEPROM_SIZE - 1);

// ─── Stav ────────────────────────────────────────────────────────────────────

enum FaultType : uint8_t {
    FAULT_NONE         = 0,
    FAULT_OVERCURRENT  = 1,
    FAULT_UNDERCURRENT = 2,
};

// Priemerny odber jedneho segmentu pre kazdu uroven jasu (0.1 mA/seg).
// _UNDEFINED_CURRENT (-1) = pre tuto uroven kalibracia este nebola vykonana.
// int8_t: max 127 = 12.7 mA/seg; numitrony pri pouzitych napatiach < 5 mA/seg.
static int8_t    _avg_current_per_segment[BRIGHTNESS_LEVELS];

static bool      _fault_active      = false;
static FaultType _active_fault      = FAULT_NONE;
static uint8_t   _consecutive_fails = 0;
static FaultType _last_fault        = FAULT_NONE;

// ─── Pomocne funkcie ─────────────────────────────────────────────────────────

// Pocka kym sa displej ustali (jas aj crossfade segmentov).
// Vracia false pri timeoute — volajuci by mal okamzite koncit.
static bool _waitForDisplaySettled() {
    return Utils::waitUntil([]() {
        return !Display::isBrightnessTransitioning()
            && !Display::Crossfading::isActive();
    }, _SETTLE_TIMEOUT_MS);
}

// Cita CERSTVU vzorku prudu z INA219.
// INA219 ma 128-vzorkove averagovanie (cyklus ~136 ms). Citanie ihned
// po zmene jasu by vratilo zmes starych a novych vzoriek. Najprv zahodime
// rozpracovanu konverziu, pockame na novu a az potom citame.
static bool _readFreshCurrent(int16_t& current_out) {
    if (!Modules::INA219::clearConversionFlag()) return false;
    if (!Utils::waitUntil(Modules::INA219::conversionReady, _INA_FRESH_TIMEOUT_MS)) {
        return false;
    }
    return Modules::INA219::readCurrentX10(current_out) == Modules::INA219::SUCCESS;
}

// ─── EEPROM ──────────────────────────────────────────────────────────────────

bool loadCalibrationTableFromEEPROM() {
    for (uint8_t i = 0; i < BRIGHTNESS_LEVELS; i++)
        _avg_current_per_segment[i] = _UNDEFINED_CURRENT;

    uint8_t buf[_TABLE_SIZE_BYTES];
    eeprom_read_block(buf, _EEPROM_TABLE_ADDR, _TABLE_SIZE_BYTES);

    const uint8_t stored_crc   = eeprom_read_byte(_EEPROM_CRC_ADDR);
    const uint8_t computed_crc = crc8(buf, _TABLE_SIZE_BYTES);
    if (stored_crc != computed_crc) {
        info(F("Monitor: CRC tabulky nesedi - treba kalibraciu.\n"));
        return false;
    }

    // CRC sedi, ale ak hodnoty su neplatne (napr. cela tabulka -1 po
    // clearCalibrationTable), tabulka je logicky prazdna. Bez tejto
    // kontroly by sme prijali nekalibrovany stav ako platny.
    for (uint8_t i = 0; i < _TABLE_SIZE_BYTES; i++) {
        if ((int8_t)buf[i] <= 0) {
            info(F("Monitor: Tabulka obsahuje neplatne hodnoty - treba kalibraciu.\n"));
            return false;
        }
    }

    memcpy(_avg_current_per_segment, buf, _TABLE_SIZE_BYTES);
    return true;
}

static void _saveCalibrationTableToEEPROM() {
    const uint8_t* buf = (const uint8_t*)_avg_current_per_segment;
    const uint8_t  crc = crc8(buf, _TABLE_SIZE_BYTES);
    eeprom_update_block(buf, _EEPROM_TABLE_ADDR, _TABLE_SIZE_BYTES);
    eeprom_update_byte(_EEPROM_CRC_ADDR, crc);
}

void clearCalibrationTable() {
    for (uint8_t i = 0; i < BRIGHTNESS_LEVELS; i++) {
        _avg_current_per_segment[i] = _UNDEFINED_CURRENT;
    }
    _saveCalibrationTableToEEPROM();
}

// ─── Kalibracia ──────────────────────────────────────────────────────────────

// Blokuje hlavnu slucku. Volat len zo setup(), pred zapnutim WDT.
bool runCalibration() {
    info(F("Monitor: Zacinam kalibraciu.\n"));

    Display::showAllSegments();

    // showAllSegments() len SPUSTI crossfade. Bez tohto cakania by prve
    // urovne jasu boli zmerane pocas rampovania segmentov a tabulka by
    // bola systematicky podhodnotena.
    if (!_waitForDisplaySettled()) {
        issue(F("Monitor: Kalibracia zlyhala - displej sa neustalil.\n"));
        return false;
    }

    const uint8_t lit_segments = Display::getLitSegmentsCount();
    if (lit_segments == 0) {
        issue(F("Monitor: Kalibracia zlyhala - ziadne svietiace segmenty.\n"));
        return false;
    }

    // Merame do docasneho pola — tabulku v RAM nahradime az ked vsetky
    // urovne uspesne zmerane. Tak nezostane v polovicnom stave.
    int16_t measurements[BRIGHTNESS_LEVELS];
    for (uint8_t level = 0; level < BRIGHTNESS_LEVELS; level++) {
        Display::setBrightness(Display::getLevelBrightness(level));

        if (!_waitForDisplaySettled()) {
            issue(F("Monitor: Kalibracia zlyhala - jas sa neustalil.\n"));
            return false;
        }

        int16_t measured;
        if (!_readFreshCurrent(measured) || measured <= 0) {
            issue(F("Monitor: Kalibracia zlyhala - neplatne meranie.\n"));
            return false;
        }

        const int16_t per_seg = measured / lit_segments;
        if (per_seg <= 0 || per_seg > 127) {
            // Mimo rozsahu int8_t (max 127 = 12.7 mA/seg).
            issue(F("Monitor: Kalibracia zlyhala - hodnota mimo rozsahu.\n"));
            return false;
        }
        measurements[level] = per_seg;
    }

    for (uint8_t level = 0; level < BRIGHTNESS_LEVELS; level++) {
        _avg_current_per_segment[level] = (int8_t)measurements[level];
    }
    _saveCalibrationTableToEEPROM();

    info(F("Monitor: Kalibracia prebehla uspesne.\n"));
    return true;
}

// ─── Detekcia poruchy ────────────────────────────────────────────────────────

// Vrati true ak je BEZPECNE porovnavat namerany prud s odhadom.
// Falsny vystup znamena "tuto sekundu nemerame" (NIE poruchu).
static bool _canMeasure() {
    using namespace Clock::State;

    // Len v NORMAL mode. EDIT/VIEW menia obsah displeja (iny pocet
    // svietiacich segmentov nez kalibracia ocakava). NIGHT ma jas 0,
    // kde by sme inak permanentne detegovali "podprud" a izolacia
    // by sa snazila rozsvietit displej.
    if (!inNormalMode()) return false;

    // Displej je vypnuty (napr. po emergencyShutdown alebo zaciatok
    // boot sekvencie pred prvym ustalenim) — necitame.
    if (Display::getTargetBrightness() == 0) return false;

    // Pocas prechodov by bolo meranie nepresne (segmenty rampuju,
    // INA219 averaguje zmes starych a novych vzoriek).
    if (Display::isBrightnessTransitioning()) return false;
    if (Display::Crossfading::isActive())     return false;

    return true;
}

// Vrati typ poruchy alebo NONE. Pri NEISTOTE (I2C chyba, chybajuca
// kalibracia pre dany level) vraciame NONE — neistota NIE JE porucha.
static FaultType _detectFault() {
    int16_t measured;
    const Modules::INA219::READING_STATE r = Modules::INA219::readCurrentX10(measured);

    if (r == Modules::INA219::OVERFLOW) {
        // OVF v INA219 = matematicke pretecenie pri vypocte prudu/vykonu = vazna porucha.
        return FAULT_OVERCURRENT;
    }
    if (r != Modules::INA219::SUCCESS) {
        warn(F("Monitor: Citanie INA219 zlyhalo.\n"));
        return FAULT_NONE; // Tranzientna I2C chyba — nie je to porucha displeja.
    }

    const uint8_t level   = Display::getBrightnessLevel(Display::getTargetBrightness());
    const int8_t  per_seg = _avg_current_per_segment[level];
    if (per_seg <= 0) {
        // Pre tuto uroven nemame kalibraciu — neporovnavame.
        return FAULT_NONE;
    }

    const uint8_t lit      = Display::getLitSegmentsCount();
    const int16_t expected = (int16_t)per_seg * lit;
    const int16_t diff     = measured - expected;
    const int16_t abs_diff = diff < 0 ? -diff : diff;

    if (abs_diff < _MIN_DIFFERENCE) {
        return FAULT_NONE;
    }
    return (diff > 0) ? FAULT_OVERCURRENT : FAULT_UNDERCURRENT;
}

// ─── Izolacia vadnych numitronov ─────────────────────────────────────────────

// Blokuje hlavnu slucku. Pre kazdy numitron zvlast rozsvietime vsetkych
// jeho 8 segmentov a porovname s odhadom. Vyrazne nizsi prud = vadny.
//
// Pouzivame 50% toleranciu (nie fixnu _MIN_DIFFERENCE), aby sa zohladnili
// nelinearity: kalibracia bola s 32 segmentmi, tu meriame len 8. Falosne
// odhalenie dobreho numitronu by sposobilo trvale zhasnutie cifry, co je
// horsie ako prepasovanie skutocne pokazeneho.
static void _runIsolation() {
    const uint8_t level   = Display::getBrightnessLevel(Display::getTargetBrightness());
    const int8_t  per_seg = _avg_current_per_segment[level];
    if (per_seg <= 0) {
        info(F("Monitor: Izolacia preskocena - chyba kalibracia pre tento jas.\n"));
        return;
    }

    const int16_t expected_one = (int16_t)per_seg * 8;  // 8 segmentov na numitron
    const int16_t tolerance    = expected_one / 2;       // 50% (konzervativne)

    for (uint8_t i = 0; i < DIGIT_COUNT; i++) {
        for (uint8_t j = 0; j < DIGIT_COUNT; j++)
            Display::setSymbolRawOnNumitron(j, 0);
        Display::setSymbolRawOnNumitron(i, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        Display::Crossfading::startTransition();

        if (!_waitForDisplaySettled()) {
            warn(F("Monitor: Izolacia - displej sa neustalil, koncim.\n"));
            break;
        }

        int16_t measured;
        if (!_readFreshCurrent(measured)) {
            warn(F("Monitor: Izolacia - meranie zlyhalo, koncim.\n"));
            break;
        }

        // Ak chyba viac ako polovica ocakavaneho prudu, numitron
        // povazujeme za vadny.
        if ((expected_one - measured) >= tolerance) {
            info(F("Monitor: Vadny numitron - zakazujem.\n"));
            Display::disableNumitron(i);
        }
    }

    // Po izolacii ostal v _DIGITS testovaci pattern. Obnovime zobrazenie
    // casu — displayTimeFromCounters preskoci zakazane cifry (zostanu 0).
    for (uint8_t j = 0; j < DIGIT_COUNT; j++)
        Display::setSymbolRawOnNumitron(j, 0);
    Display::displayTimeFromCounters(Clock::t_counter_minutes, Clock::t_counter_hours);
}

// ─── Spracovanie poruchy ─────────────────────────────────────────────────────

static void _handleFault(FaultType fault) {
    _fault_active = true;
    _active_fault = fault;

    if (fault == FAULT_OVERCURRENT) {
        critical(F("Monitor: NADPRUD - vypinam displej.\n"));
        Display::emergencyShutdown();
    } else {
        critical(F("Monitor: PODPRUD - spustam izolaciu.\n"));
        _runIsolation();
    }
}

// ─── Public API ──────────────────────────────────────────────────────────────

void onSecondTick() {
    if (_fault_active) return;

    if (!_canMeasure()) {
        // Tranzientny stav (mode switch, prechod) — vynulujeme citac,
        // aby sa nesplnili ciastocne fails z roznych okolnosti.
        _consecutive_fails = 0;
        _last_fault        = FAULT_NONE;
        return;
    }

    const FaultType fault = _detectFault();
    if (fault == FAULT_NONE) {
        _consecutive_fails = 0;
        _last_fault        = FAULT_NONE;
        return;
    }

    _consecutive_fails = (fault == _last_fault) ? _consecutive_fails + 1 : 1;
    _last_fault        = fault;

    if (_consecutive_fails >= _CONSECUTIVE_FAILS) {
        _handleFault(fault);
    }
}

void onMillisecondTick() {
    if (!_fault_active) return;

    static uint8_t blink_ms = 0;
    static bool    blink_on = false;

    if (++blink_ms < _BLINK_HALF_PERIOD_MS) return;
    blink_ms = 0;
    blink_on = !blink_on;

    Led::unlock();
    if (blink_on) {
        Led::setRGB(_active_fault == FAULT_OVERCURRENT
            ? Led::Palette::SYNC_FAIL        // cervena - nadprud
            : Led::Palette::FIRMWARE_LOAD);  // modra   - podprud
    } else {
        Led::setRGB({0, 0, 0});
    }
}

} // namespace Monitor