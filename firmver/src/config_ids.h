#ifndef __CONFIG_IDS_H__
#define __CONFIG_IDS_H__

#include <stdint.h>

namespace Config {

/*
 * Vsetky konfiguracie su zoradene tak ako by sa zobrazovali po strankach
 * teda ID / 4 je rovne indexu stranky a ID % 4 je indexom nastavenia relativne k danej stranke.
**/
enum ID : uint8_t {
    // Prva stranka s nastavenim samotneho casu hodin.
    TIME_HOURS_TENS,
    TIME_HOURS_ONES,
    TIME_MINUTES_TENS,
    TIME_MINUTES_ONES,
    // TIME page
    TIME_BRIGHTNESS_MODE,
    TIME_HOUR_FORMAT, // 2 pre 12h, 4 pre 24h
    TIME_LEADING_ZERO,
    TIME_BRIGHTNESS_VALUE,
    // TIME_DCF77,
    // Casovace
    NIGHT_MODE,
    NIGHT_START_HOURS,
    NIGHT_START_MINUTES,
    NIGHT_END_HOURS,
    // INDICATORS page
    IND_LED_BRIGHTNESS,
    IND_VIEW_FREQUENCY,
    IND_ACTIVE_VIEWS,
    IND_RESERVED,
    // YEAR page
    YEAR_D1,
    YEAR_D2,
    YEAR_D3,
    YEAR_D4,
    // DATE page
    DATE_DAY_D1,
    DATE_DAY_D2,
    DATE_MONTH_D1,
    DATE_MONTH_D2,
    /////////////////////////////
    COUNT // sentinel
};
}

#endif // __CONFIG_IDS_H__
