/* config_ids.h
*
*  Enumy a konstanty pre identifikaciu konfiguracnych nastaveni.
*/

#ifndef __CONFIG_IDS_H__
#define __CONFIG_IDS_H__

#include <stdint.h>

namespace Config {

/*
 * Vsetky konfiguracie su zoradene tak ako by sa zobrazovali po strankach
 * teda ID / 4 je rovne indexu stranky a ID % 4 je indexom nastavenia relativne k danej stranke.
**/
enum ID : uint8_t {
    // STRANKA 1 - NASTAVOVANIE CASU
    TIME_H10,
    TIME_H1,
    TIME_M10,
    TIME_M1,
    // STRANKA 2 - NASTAVOVANIE ZOBRAZOVANIA
    DISPLAY_BRIGHTNESS_MODE,
    LED_BRIGHTNESS_LEVEL,
    CURRENT_SENSOR_ENABLED,
    DCF77_SYNC_ENABLED,
    // STRANKA 3 - CASOVACE
    TIMER_INDEX,
    TIMER_ACTION,
    TIMER_H10,
    TIMER_H1,
    // STRANKA 4 - DATUM
    DATE_DAY_D10,
    DATE_DAY_D1,
    DATE_MONTH_D10,
    DATE_MONTH_D1,
    // STRANKA 5 - ROK
    YEAR_D1000,
    YEAR_D100,
    YEAR_D10,
    YEAR_D1,

    // DATA CASOVACOV (SUCAST STRANYK 3)
    // Nemaju vlastnu stranku, ale mame ich tu
    // aby sme vyuzili existujuci config system
    // pre ukladanie a spravu tychto nastaveni.
    TIMER_0_HOUR,
    TIMER_0_ACTION,
    TIMER_1_HOUR,
    TIMER_1_ACTION,
    TIMER_2_HOUR,
    TIMER_2_ACTION,
    TIMER_3_HOUR,
    TIMER_3_ACTION,

    // SKRYTE NASTAVENIA - nemaju vlastnu stranku, drzane v EEPROM.
    // Hornu hranicu jasu si pamatame medzi reboot-mi, aby uzivatelovo
    // nastavenie chranilo Numitrony aj po vypnuti napajania.
    DISPLAY_BRIGHTNESS_CAP,
    _RESERVED_0,
    _RESERVED_1,
    _RESERVED_2,
    /////////////////////////////
    COUNT // sentinel
};

enum DISPLAY_BRIGHTNESS_MODE : uint8_t {
    BRIGHTNESS_MANUAL = 0,
    BRIGHTNESS_AUTO   = 1,
};

} // namespace Config

#endif // __CONFIG_IDS_H__
