#include <stdint.h>

#include "isr.h"
#include "utils/wait.h"

namespace InternalTempSensor {

    // Vracia teploty v stupnoch Celzia v rosahu -128 po 127.
    int8_t read() {
        // Ulozime aktualne nastavenia pre ADC.
        const uint8_t _ADMUX  = ADMUX;
        const uint8_t _ADCSRA = ADCSRA;

        // Set voltage reference to internal 1.1V and select temperature sensor (ADC8)
        ADMUX = (1 << REFS1) | (1 << REFS0) | (1 << MUX3);

        // Enable ADC and set prescaler to 128 (for 16MHz clock -> 125kHz ADC clock)
        ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);

        Utils::wait(20); // Pockame chvilu kym si to sadne.

        ADCSRA |= (1 << ADSC);
        while (ADCSRA & (1 << ADSC));
        const uint16_t adcValue = ADC;

        // Obnovime konfiguracie ADC.
        ADMUX  = _ADMUX;
        ADCSRA = _ADCSRA;

        // Vracia hodnoty okolo 322 pre 23 °C
        // Tuto kalibraciu je treba vykonat pre kazdy cip.
        const int32_t temp        = (int32_t)(adcValue - 300) * 9259;

        return (int8_t)(temp / 10000);
    }
}
