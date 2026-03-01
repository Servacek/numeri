
#include "main.h"
#include "reg.h"
#include "config.h"
#include "isr.h"
#include "clock.h"
#include "display.h"


uint8_t selected_digit = DIGIT_HOR_TENS;

// POZOR: Tato hodnota by sa nikdy nemala nastavovat priamo!!
volatile uint8_t _target_brightness = 0;

// Sem ulozime bajty ktore zobrazujeme,
// lebo ked chceme upravit len jedno cislo ostatne cisla si musime pamatat.
uint8_t DIGITS[DIGIT_COUNT] = {0, 0, 0, 0};

volatile uint8_t configured_brightness = DEFAULT_BRIGHTNESS; // Pre aplikovaný jas pozri register PWM_REGISTER

// Nastavovanie jasu s histereziou.
void setDisplayBrightness(const uint8_t value, const uint8_t histeresis=0) {
    const uint8_t new_brightness = MIN(value, MAX_BRIGHTNESS);

    if (_target_brightness == new_brightness) {
        return; // Ziadna zmena
    }

    // Hodnota chce narast, musi splnat tazsiu podmienku.
    // Pouzivame odcitanie namiesto scitania, aby sme predisli preteceniu uint8_t
    // (napr. _target_brightness=250 + histeresis=10 by pretieklo na 4).
    if (new_brightness < _target_brightness ||
        (new_brightness > _target_brightness &&
         (new_brightness - _target_brightness) > histeresis)) {
        _target_brightness = new_brightness;
    }
}

void configDisplayBrightness(uint8_t value) {
    configured_brightness = value;
    setDisplayBrightness(configured_brightness);
}

void setSymbolRawOnNumitron(const uint8_t numitron_index, const uint8_t symbol) {
    if (numitron_index >= DIGIT_COUNT) {
        return; // No change
    }

    DIGITS[numitron_index] = symbol;

    // Ak je numitron vybraty v editovacom rezime, uistime sa ze desatinna ciarka je zobrazena.
    if (numitron_index == selected_digit && BIS(MODE, MODE_EDIT)) {
        DIGITS[numitron_index] |= S2;
    }
}

// Numitrony su indexovane zpredu zľava ako: 0, 1, 2, 3
void setSymbolOnNumitron(const uint8_t numitron_index, const uint8_t symbol_index) {
    if (symbol_index < NUM_SYMBOL_COUNT) {
        setSymbolRawOnNumitron(numitron_index, GET_SEGMENT_SYMBOL(symbol_index));
    }
}

void crossfadeFromOldDigitsToNew() {
    if (BIS(MODE, MODE_EDIT)) {
        // V editacnom mode nepouzivame crossfading — priamo zapisujeme cifry.
        // Ale stale aktualizujeme buffery aby boli konzistentne po ukonceni editu.
        #if CRSF_ENABLED
        ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
            if (!BIS(MODE, MODE_CRSF)) {
                COPY_DIGIT_BUFFER(_fade_in_buffer, _fade_out_buffer);
                COPY_DIGIT_BUFFER(DIGITS, _fade_in_buffer);
            }
        }
        #endif
        putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
        pushToOutputRegs();
        return;
    }

    #if CRSF_ENABLED
    // ATOMIC_BLOCK zabranuje preteku kde by ISR dokoncilo crossfading
    // medzi kontrolou MODE_CRSF a nastavenim noveho stavu, cim by
    // sa spustil prechod s neaktualnymi buffermi.
    ATOMIC_BLOCK(ATOMIC_RESTORESTATE) {
        if (BIS(MODE, MODE_CRSF)) {
            // Prebieha iny prechod — odlozime na neskor.
            SBI(FLAG, FLAG_CRSF_DEFFERED);
        } else {
            // Pripravime buffery: stare "nove" sa stanu "starymi".
            COPY_DIGIT_BUFFER(_fade_in_buffer, _fade_out_buffer);
            COPY_DIGIT_BUFFER(DIGITS, _fade_in_buffer);
            resetCrossfadeState();
            SBI(MODE, MODE_CRSF);
        }
    }
    #else
        putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
        pushToOutputRegs();
    #endif
}

uint8_t getTimeDigitWithIndex(uint8_t digit, uint8_t minutes, uint8_t hours) {
    const uint8_t minute_digit = (digit == DIGIT_MIN_TENS || digit == DIGIT_MIN_ONES);
    // Cele cislo, bud minut alebo hodin
    uint8_t num = (minute_digit) ? minutes : hours;
    return (digit == DIGIT_HOR_TENS || digit == DIGIT_MIN_TENS)
        ? num / 10 : num % 10; // Neparne cisla nemozu mat nastaveny prvy bit.
}

void displayTimeFromCounters(uint8_t counter_minutes, uint8_t counter_hours) {
    sprintln(F("displayTimeFromCounters"));
    if (BIS(MODE, MODE_DIAG)) {
        return;
    }

    // Podpora pre 12h format: polnoc aj poludnie je 12:00 (loop-invariant, compute once)
    const uint8_t hours = (Config::get(Config::TIME_HOUR_FORMAT) == 2)
        ? ((counter_hours % 12 == 0) ? 12 : counter_hours % 12)
        : counter_hours;

    bool needs_update = false;
    for (uint8_t digit = 0; digit < DIGIT_COUNT; digit++) {
        const uint8_t val = getTimeDigitWithIndex(digit, counter_minutes, hours);
        const uint8_t new_symbol = GET_SEGMENT_SYMBOL(val);
        // TODO: Je spravne pouzivat DIGITS?
        if (DIGITS[digit] != new_symbol) {
            setSymbolRawOnNumitron(digit, new_symbol);
            needs_update = true;

            // Ak mame vypnutu uvodnu nulu.
            if (digit == DIGIT_HOR_TENS && val == 0 && Config::get(Config::TIME_LEADING_ZERO) == 0) {
                setSymbolRawOnNumitron(digit, 0);
            }
        }
    }

    if (needs_update) {
        crossfadeFromOldDigitsToNew();
    }
}

void displayPage(uint8_t page_index) {
    sprint("STRANKA: "); sprint(page_index); sprint(" HODNOTY NUMITRONOV:");
    for (uint8_t conf_index = 0; conf_index < CONFIG_PAGE_SIZE; conf_index++) {
        sprint(" ");
        sprint(Config::get(Config::toID(page_index, conf_index)));
        setSymbolOnNumitron(conf_index, Config::getSymbolIndex(Config::toID(page_index, conf_index)));
    }
    sprintln("");

    crossfadeFromOldDigitsToNew();
}

// Pre nastavovanie jednotlivych segmentov (hlavne pri desatinnej ciarke)
void setNumitronSegment(uint8_t digit, uint8_t index, bool state, bool smooth) {
    (void)smooth; // Zatial nepodporujeme hladke prechody pri zapinani/vypinani jednotlivych segmentov, takze tento parameter ignorujeme.
    uint8_t old = DIGITS[digit];
    uint8_t mask = (1 << index);
    uint8_t updated = state ? (old | mask) : (old & ~mask);

    if (updated != old) {
        DIGITS[digit] = updated;

        // if (smooth) {
            crossfadeFromOldDigitsToNew();
        // } else {
        //     putDigitsToInputRegs(DIGITS, DIGIT_COUNT);
        //     pushToOutputRegs();
        // }
    }
}

// Pri diagnostike chceme aby svietili vsetky segmenty,
// takze vieme povedat ktore su vypalene.
static uint8_t last_user_set_brightness;
void startDiagnostics() {
    if (!BIS(MODE, MODE_DIAG)) {
        // Okamzite prerusime prebiehajuci crossfade — diagnostika potrebuje
        // ihned prevziat kontrolu nad displayom.
        #if CRSF_ENABLED
        abortCrossfade();
        #endif
        SBI(MODE, MODE_DIAG);
        sprintln(F("Spúštanie diagnostiky... (rozsviecanie všetkých segmentov displeja)"));

        last_user_set_brightness = _target_brightness;
        // Pri diagnostike sa potrebujeme uistit, ze jas je zretelne viditelny.
        // Takze minimalne na urovni DEFAULT_BRIGHTNESS.
        if (last_user_set_brightness < DEFAULT_BRIGHTNESS) {
            setDisplayBrightness(DEFAULT_BRIGHTNESS);
        }

        setSymbolRawOnNumitron(DIGIT_HOR_TENS,  GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        setSymbolRawOnNumitron(DIGIT_HOR_ONES, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        setSymbolRawOnNumitron(DIGIT_MIN_TENS,  GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));
        setSymbolRawOnNumitron(DIGIT_MIN_ONES, GET_SEGMENT_SYMBOL(ALL_ON_SYMBOL));

        crossfadeFromOldDigitsToNew();
    }
}

void stopDiagnostics() {
    if (BIS(MODE, MODE_DIAG)) {
        sprintln(F("Vypínanie diagnostiky..."));
        // Prerusime crossfade diagnostiky (prechod na vsetky segmenty zapnute)
        // a zrusime pripadny odlozeny prechod — volajuci refreshne display sam.
        #if CRSF_ENABLED
        abortCrossfade();
        #endif
        setDisplayBrightness(last_user_set_brightness);

        CBI(MODE, MODE_DIAG);
    }
}
