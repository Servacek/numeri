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
 * alebo podprud a zaroven pocet chybnych segmentov. Ak ich bude viac ako 8 tak odstavime
 * cely displej, v pripade ze ich menej ako 8 a jedna sa od podprud, tak skusime zistit
 * presne ktory numitron obsahuje chybu. Vypneme vsetky numitrony a postupne ich budeme zapinat
 * pricom vzdy rozsvietime vsetky segmenty na danom numitron kym nenajdeme ten, ktoreho
 * predpokladany prudovy odber nebude rovnaky ako namerany. V pripade nadprudu odstavyme cely displej
 * aby sme predisli poskodeniu dosky.
 *
 * Indikacnu RGB LED mozeme pouzivat na signalizaciu typu poruchy.
 * Kazda farba bude mat pri poruchy priradenu inu farbu podla ktorej sa
 * da urcit pricina.
 *
 * Minimalnu hodnotu jasu na hodinach musime urcit tak aby bolo stale mozne
 * rozlisit jednotlive segmenty.
*/

#include <stdint.h>

#include "drivers/display.h"
#include "modules/ina219.h"
#include "services/logging.h"
#include "libs/EEPROM.h"
#include "utils/utils.h"

// TODO: Zatial pocitame len s jednou hladinou jasu pre jednoduchost.
#define BRIGHTNESS_LEVELS 1
#define UNDEFINED_CURRENT -1
#define MIN_DIFFERENCE    50

#define EEPROM_SIZE       1024
#define TABLE_SIZE_BYTES  (BRIGHTNESS_LEVELS * sizeof(int16_t))
#define EEPROM_TABLE_ADDR (uint8_t*)(EEPROM_SIZE - TABLE_SIZE_BYTES - 1)
#define EEPROM_CRC_ADDR   (uint8_t*)(EEPROM_SIZE - 1)

#define CONSECUTIVE_FAILS 3 // 3 rovnake poruchy za sebou spustia obsluhu poruchy displeja.

// TODO: Toto treba poriesit, mat nejaky system na spolahlive oznacovanie levelov jasu.
#define BRIGHTNESS_LEVEL 0

namespace Monitor {

static int16_t _AVG_CURRENT_PER_SEGMENT[BRIGHTNESS_LEVELS] = {UNDEFINED_CURRENT};

enum FAILURE_TYPE {
    NONE,
    UNKNOWN,
    OVERCURRENT,
    UNDERCURRENT,
};

// Funkcia na vypocet paritneho bajtu,
// ktory pridavame k bajtom kalibracnej tabulky
// aby sme sa uistili ze citame spravne udaje.
static uint8_t crc8(const uint8_t* data, uint8_t len) {
    uint8_t crc = 0x00;
    while (len--) {
        crc ^= *data++;
        for (uint8_t i = 0; i < 8; i++)
            crc = (crc & 0x80) ? (crc << 1) ^ 0x07 : (crc << 1);
    }
    return crc;
}

bool loadCalibrationTableFromEEPROM() {
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
        // TODO: Treba ten level system.
        Display::setBrightness(MAX_BRIGHTNESS);
        // Pockame kym sa jas zmeni.
        while (Display::_target_brightness != DISPLAY_PWM_REG);

        // Utils::wait(500); // Dajme numitronovym vlaknam chvilku na ustalenie.

        int16_t measured_current;
        const Modules::INA219::READING_STATE result = Modules::INA219::readCurrentX10(measured_current);
        // Treba tiez poriesit overflow.
        if (result != Modules::INA219::SUCCESS || measured_current <= 0) {
            // TODO: mozno nejake skusanie znovu?
            issue(F("Kalibracia zlyhala: Neplatne meranie.\n"));
            return false; // Kalibracia zlyhala, nic nebolo ulozene.
        }
        measurements[level] = measured_current / lit_segments;
    }

    // Kalibracia prebehla bez chyby, prekopirujme data do statickeho
    // pola a ulozme do EEPROM.
    memcpy(_AVG_CURRENT_PER_SEGMENT, measurements, TABLE_SIZE_BYTES);

    saveCalibrationTableToEEPROM();

    info(F("Kalibracia prebehla uspesne.\n"));
    return true;
}

static int16_t _getEstimatedCurrent() {
    if (_AVG_CURRENT_PER_SEGMENT[BRIGHTNESS_LEVEL] < 0) {
        // Kalibracna hodnota pre tuto uroven jasu nie je definovana.
        return UNDEFINED_CURRENT;
    }

    const uint8_t lit_segment_count = Display::getLitSegmentsCount();
    const int16_t estimated_current = _AVG_CURRENT_PER_SEGMENT[BRIGHTNESS_LEVEL] * lit_segment_count;
    return estimated_current;
}

FAILURE_TYPE getFailureType(int16_t& measured_current, int16_t& estimated_current) {
    const Modules::INA219::READING_STATE result = Modules::INA219::readCurrentX10(measured_current);
    if (result == Modules::INA219::OVERFLOW) {
        // Interny vypocet prudu/vykonu pretiekol, to neznaci nic dobre...
        return OVERCURRENT;
    }

    if (result != Modules::INA219::SUCCESS) {
        // Nepodarilo sa precitat hodnotu zo senzora.
        return UNKNOWN;
    }

    estimated_current = _getEstimatedCurrent();
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

void handleFailure(FAILURE_TYPE failure_type) {
    switch (failure_type) {
        case OVERCURRENT:
            info(F("Doslo k nadprudu! Vypínanie displeja!\n"));
            Display::emergencyShutdown();
            // Je treba vypnut cely displej pre ochranu dosky.
            break;
        case UNDERCURRENT:
            info(F("Doslo k podprudu, teda nejaky segment sa vypalil alebo "
                "numitron bol odpojeny.\n"));
            // Pravdepodobne sa nam vypalil nejaky segment
            // Najskor to bude len jeden. Treba prist na to
            // ktory numitron je vadny a ten nechat vypnuty.
            Display::emergencyShutdown();
            break;
        default:
            return; // Bud bez chyby alebo nevieme zmerat.
    }
}

static FAILURE_TYPE _last_failure_type = NONE;
static uint8_t      _consecutive_failures = 0;

void onSecondTick() {
    int16_t measured_current, estimated_current;
    const FAILURE_TYPE failure_type = getFailureType(measured_current, estimated_current);
    if (failure_type != _last_failure_type) {
        // Doslo k zmene typu poruchy oproti predchadzajucemu.
        _consecutive_failures = 0;
    } else {
        // Doslo k zmene rovnakeho typu.
        _consecutive_failures++;
    }

    if (_consecutive_failures >= CONSECUTIVE_FAILS) {
        handleFailure(failure_type);
    }

    _last_failure_type = failure_type;
}

} // namespace Monitor
