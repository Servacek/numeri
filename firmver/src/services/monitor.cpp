/* Sluzba monitor ma za ulohu sledovat prudovy odber numitronoveho
 * displeja a porovnavat tuto hodnotu s odhadom podla aktualneho jasu
 * a poctu rozsvietenych segmentov. Tuto kontrolu budeme prevadzat
 * najcastejsie kazdu sekundu.
 *
 * Dovodom tejto kontroly je detekcia vypalenych segmentov a teda prevencia chybne
 * zobrazenych cisel ale aj detekcia poruchy v softveri/hardveri, ktora by
 * mohla sposobit poskodenie numitronov (napr. sa vypne PWM a numitrony sa rozsvietia
 * na plnych 5 V).
 *
 * Pri vypocte odhadovaneho prudoveho odberu je problem spravne opisat
 * nelinearnu VA charakteristiku numitronov. Tato charakteristika sa moze
 * casom menit (napr. vplyvom starnutia segmentov). Preto je ziaduce umoznit
 * uzivatelovy nakalibrovat tento system. Pri kalibracii rozsvietime
 * vsetky segmenty a postupne budeme prechadza vsetkymi moznymi nastaveniami jasu
 * od 0 po najvyssiu, pricom medzi zmenami pockami kym sa prud ustaly. Pri kazdej
 * kombinacii odmerame hodnotu prudoveho odberu displeja a vydelime ju
 * poctom rozsvietenych segmentov aby sme dostali priemernu hodnotu prudoveho
 * odberu na jeden segment pri danom jase. Bude sa jedna o vzorku ktora bude
 * rekonstruovat VA charakteristiku numitronov. Toto pole vzorkov ulozime
 * do EEPROM aby sa zachovali aj napriec restartom hodin.
 *
 * Nasledne pri starte hodin sa dana tabulka nacita. V pripade, ze sa nenajde,
 * zahajime automaticku kalibraciu, ak je tato funkcia povolena v nastaveniach.
 * Predvolene je monitorovanie displeja vypnute aby bolo mozne ho vypnut podrzanim
 * RESET tlacidla. To preto, aby v pripade, ze sa system pokazi a bude bezdovodne
 * vypinat displej bolo mozne ho force vypnut aj bez zapnuteho  displeja.
 *
 * Pri pocitani odhadovaneho prudoveho odberu pouzijeme hodnotu z tabulky
 * na indexe zodpovedajucemu aktualnej urovni jasu. Vynasobime ho poctom
 * segmentov ktore firmver diktuje, ze by mali byt rozsvietene.
 *
 * Ak sa tento vypocitany prud nebude rovnat odmeranej hodnote, a to 3 merania
 * po sebe, prejdeme do stavu detekovanej poruchy. Urcime ci sa jedna o nadprud
 * alebo podprud. Pri nadprade odstavime cely displej. Pri podprade spustime
 * izolaciu: pre kazdy numitron zvlast zmerame prud a porovname s odhadom;
 * vadne numitrony zakazeme a displej nechame bezat na zvysnych cifrach.
 * Ak izolacia nenajde ziadny vadny numitron, displej pokracuje bez zmeny.
 * V oboch pripadoch LED blika cervenou (nadprud) alebo modrou (podprud).
*/

#include <stdint.h>
#include <avr/wdt.h>

#include "drivers/display.h"
#include "drivers/led.h"
#include "modules/ina219.h"
#include "services/logging.h"
#include "libs/EEPROM.h"
#include "utils/utils.h"
#include "utils/crc.h"

#define UNDEFINED_CURRENT -1
#define MIN_DIFFERENCE    50

#define EEPROM_SIZE       1024
#define TABLE_SIZE_BYTES  (BRIGHTNESS_LEVELS * sizeof(int8_t))
#define EEPROM_TABLE_ADDR (uint8_t*)(EEPROM_SIZE - TABLE_SIZE_BYTES - 1)
#define EEPROM_CRC_ADDR   (uint8_t*)(EEPROM_SIZE - 1)

#define CONSECUTIVE_FAILS 3 // 3 rovnake poruchy za sebou spustia obsluhu poruchy displeja.

namespace Monitor {

// int8_t: max 127 zodpoveda ~12.7 mA/segment (numitrony bezne <5 mA/segment pri pouzivanych napatiach).
static int8_t _AVG_CURRENT_PER_SEGMENT[BRIGHTNESS_LEVELS];

enum FAILURE_TYPE {
    NONE,
    UNKNOWN,
    OVERCURRENT,
    UNDERCURRENT,
};

static bool         _fault_active      = false;
static FAILURE_TYPE _active_fault_type = NONE;

bool loadCalibrationTableFromEEPROM() {
    for (uint8_t i = 0; i < BRIGHTNESS_LEVELS; i++)
        _AVG_CURRENT_PER_SEGMENT[i] = UNDEFINED_CURRENT;

    uint8_t buf[TABLE_SIZE_BYTES];
    eeprom_read_block(buf, EEPROM_TABLE_ADDR, TABLE_SIZE_BYTES);

    const uint8_t stored_crc = eeprom_read_byte(EEPROM_CRC_ADDR);
    const uint8_t computed_crc = crc8(buf, TABLE_SIZE_BYTES);
    if (stored_crc != computed_crc) {
        // Paritny bit nesedi, data su neplatne. Nic nebudeme nacitavat.
        return false;
    }

    // Data vypadaju byt vporiadku, nacitame z bufferu.
    memcpy(_AVG_CURRENT_PER_SEGMENT, buf, TABLE_SIZE_BYTES);

    return true;
}

void saveCalibrationTableToEEPROM() {
    const uint8_t* buf = (const uint8_t*)_AVG_CURRENT_PER_SEGMENT;
    const uint8_t  crc = crc8(buf, TABLE_SIZE_BYTES);

    eeprom_update_block(buf, EEPROM_TABLE_ADDR, TABLE_SIZE_BYTES);
    eeprom_update_byte(EEPROM_CRC_ADDR, crc);
}

void clearCalibrationTable() {
    for (uint8_t i = 0; i < BRIGHTNESS_LEVELS; i++) {
        _AVG_CURRENT_PER_SEGMENT[i] = UNDEFINED_CURRENT;
    }
    saveCalibrationTableToEEPROM();
}

// Tato funkcia blokuje hlavnu slucku.
bool runCalibration() {
    /* Pri kalibracii rozsvietime
    * vsetky segmenty a postupne budeme prechadza vsetkymi moznymi nastaveniami jasu
    * od 0 po najvyssiu, pricom medzi zmenami pockami kym sa prud ustaly. Pri kazdej
    * kombinacii odmerame hodnotu prudoveho odberu displeja a vydelime ju
    * poctom rozsvietenych segmentov aby sme dostali priemernu hodnotu prudoveho
    * odberu na jeden segment pri danom jase. Bude sa jedna o vzorku ktora bude
    * rekonstruovat VA charakteristiku numitronov. Toto pole vzorkov ulozime
    * do EEPROM aby sa zachovali aj napriec restartom hodin.
    */

    Display::showAllSegments();

    // Pocet rozsvietenych segmentov je konstantny pocas celej kalibracie
    // (vsetky su zapnute), takze ho staci ziskat raz.
    const uint8_t lit_segments = Display::getLitSegmentsCount();
    if (lit_segments == 0) {
        issue(F("Kalibracia zlyhala: getLitSegmentsCount() vratilo 0.\n"));
        return false;
    }

    int16_t measurements[BRIGHTNESS_LEVELS] = {};
    for (uint8_t level = 0; level < BRIGHTNESS_LEVELS; level++) {
        Display::setBrightness(Display::getLevelBrightness(level));
        while (Display::isBrightnessTransitioning()) {
            // Cakame kym sa jas ustali, aby sme mali presne meranie.
        };

        int16_t measured_current;
        const Modules::INA219::READING_STATE result = Modules::INA219::readCurrentX10(measured_current);
        if (result != Modules::INA219::SUCCESS || measured_current <= 0) {
            issue(F("Kalibracia zlyhala: Neplatne meranie.\n"));
            return false;
        }
        measurements[level] = measured_current / lit_segments;
    }

    // Kalibracia prebehla bez chyby — konvertujeme int16_t->int8_t a ulozime.
    // Maximalna hodnota ~12.7 mA/segment; pri beznych napatiach <5 mA (max 50 v 0.1 mA jednotkach).
    for (uint8_t level = 0; level < BRIGHTNESS_LEVELS; level++) {
        _AVG_CURRENT_PER_SEGMENT[level] = (int8_t)measurements[level];
    }

    saveCalibrationTableToEEPROM();

    info(F("Kalibracia prebehla uspesne.\n"));
    return true;
}

static int16_t _getEstimatedCurrent() {
    const uint8_t level = Display::getBrightnessLevel(Display::getTargetBrightness());
    if (_AVG_CURRENT_PER_SEGMENT[level] < 0) {
        // Kalibracna hodnota pre tuto uroven jasu nie je definovana.
        return UNDEFINED_CURRENT;
    }

    const uint8_t lit_segment_count = Display::getLitSegmentsCount();
    const int16_t estimated_current = _AVG_CURRENT_PER_SEGMENT[level] * lit_segment_count;
    return estimated_current;
}

static FAILURE_TYPE _getFailureType() {
    int16_t measured_current;
    const Modules::INA219::READING_STATE result = Modules::INA219::readCurrentX10(measured_current);
    if (result == Modules::INA219::OVERFLOW) {
        // Interny vypocet prudu/vykonu pretiekol, to neznaci nic dobre...
        return OVERCURRENT;
    }

    if (result != Modules::INA219::SUCCESS) {
        // Nepodarilo sa precitat hodnotu zo senzora.
        return UNKNOWN;
    }

    const int16_t estimated_current = _getEstimatedCurrent();
    if (estimated_current < 0) {
        // Nepodarilo sa vypocitat odhadovany odber, pravdepodobne
        // nemame spravnu kalibracnu tabulku.
        return UNKNOWN;
    }

    const int16_t difference = ABS(measured_current - estimated_current);
    if (difference < MIN_DIFFERENCE) {
        // Rozdiel medzi nameranou a odhadovanou hodnotou je zanedbatelne maly.
        return NONE;
    }

    if (measured_current > estimated_current) {
        return OVERCURRENT; // Namerany prud je vacsi nez odhadovany.
    } else {
        return UNDERCURRENT;
    }
}

//////////////////////////////

// Tato funkcia blokuje hlavnu slucku.
// Pre kazdy numitron zvlast rozsvieti vsetky jeho segmenty, pocka na ustaly
// prud a zmera. Vadne numitrony (merany prud nizsi nez ocakavany) zakaze.
// Vracia true ak bol najdeny aspon jeden vadny numitron.
static bool _runIsolation() {
    const uint8_t level = Display::getBrightnessLevel(Display::getTargetBrightness());
    if (_AVG_CURRENT_PER_SEGMENT[level] < 0) return false;

    // Ocakavany prud pre jeden plne rozsvieti numitron (8 segmentov).
    const int16_t expected_one = _AVG_CURRENT_PER_SEGMENT[level] * 8;
    uint8_t       found        = 0;

    for (uint8_t i = 0; i < DIGIT_COUNT; i++) {
        // Zhasneme vsetky, rozsvietime len numitron i.
        for (uint8_t j = 0; j < DIGIT_COUNT; j++)
            Display::setSymbolRawOnNumitron(j, 0);
        Display::setSymbolRawOnNumitron(i, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        Display::Crossfading::startTransition();

        // Cakame kym sa prud ustali (jas aj prechod segmentov).
        while (Display::isBrightnessTransitioning() ||
               Display::Crossfading::isActive()) {
            wdt_reset();
        }

        int16_t measured;
        if (Modules::INA219::readCurrentX10(measured) != Modules::INA219::SUCCESS)
            return found > 0;

        if (ABS(measured - expected_one) >= MIN_DIFFERENCE) {
            Display::disableNumitron(i);
            found++;
        }
    }

    return found > 0;
}

static void _handleFailure(FAILURE_TYPE failure_type) {
    _fault_active      = true;
    _active_fault_type = failure_type;

    switch (failure_type) {
        case OVERCURRENT:
            info(F("Doslo k nadprudu! Vypínanie displeja!\n"));
            Display::emergencyShutdown();
            break;
        case UNDERCURRENT:
            info(F("Doslo k podprudu. Spustam izolaciu.\n"));
            _runIsolation();
            break;
        default:
            return;
    }
}

static FAILURE_TYPE _last_failure_type  = NONE;
static uint8_t      _consecutive_failures = 0;

void onSecondTick() {
    if (_fault_active) return;

    // Jas este dobieha na ciel — meranie by bolo nepresne.
    if (Display::isBrightnessTransitioning()) return;

    const FAILURE_TYPE failure_type = _getFailureType();

    if (failure_type == NONE) {
        _consecutive_failures = 0;
        _last_failure_type    = NONE;
        return;
    }

    if (failure_type != _last_failure_type) {
        // Nova porucha — zaciname pocitat od 1.
        _consecutive_failures = 1;
    } else {
        _consecutive_failures++;
    }

    if (_consecutive_failures >= CONSECUTIVE_FAILS) {
        _handleFailure(failure_type);
    }

    _last_failure_type = failure_type;
}

void onMillisecondTick() {
    if (!_fault_active) return;

    static uint8_t _blink_ms = 0;
    static bool    _blink_on = false;

    if (++_blink_ms < 250) return;
    _blink_ms = 0;
    _blink_on = !_blink_on;

    Led::unlock();
    if (_blink_on) {
        Led::setRGB(_active_fault_type == OVERCURRENT
            ? Led::Palette::SYNC_FAIL        // cervena — nadprud
            : Led::Palette::FIRMWARE_LOAD);  // modra   — podprud
    } else {
        Led::setRGB({0, 0, 0});
    }
}

} // namespace Monitor
