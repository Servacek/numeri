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
    // ── Timer UI stranka (jedna stranka, TIMER_NUM je len UI stav) ───────────
    TIMER_UI_H1,        // Desiatky hodiny timera ktory prave editujeme
    TIMER_UI_H2,        // Jednotky hodiny timera ktory prave editujeme
    TIMER_UI_ACTION,    // Akcia timera (0=NONE..4=DCF_SYNC)
    TIMER_UI_NUM,       // Ktory timer editujeme (0..N_TIMERS-1) — len UI, nie EEPROM

    // ── Ulozene data timerov (2 entries na timer, persist=true) ─────────────
    // Pre N_TIMERS=4: 8 entries na 2 skrytych strankach (neprechadzame cez ne v edit mode)
    TIMER_0_HOUR,
    TIMER_0_ACTION,
    TIMER_1_HOUR,
    TIMER_1_ACTION,
    TIMER_2_HOUR,
    TIMER_2_ACTION,
    TIMER_3_HOUR,
    TIMER_3_ACTION,
    /////////////////////////////
    COUNT // sentinel
};

enum DISPLAY_BRIGHTNESS_MODE : uint8_t {
    BRIGHTNESS_MANUAL = 0,
    BRIGHTNESS_AUTO   = 1,
};

} // namespace Config

#endif // __CONFIG_IDS_H__
