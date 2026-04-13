#include "avr_thermometer.h"
#include "utils/utils.h"
#include <avr/io.h>


namespace AVRThermometer {

// ---------------------------------------------------------------------------
// Kalibracia pre konkretny cip - zmeraj adcValue pri znamej teplote
// a podla toho uprav tieto dve konstanty. Pouzi spolahlivy referencny teplomer.
// ---------------------------------------------------------------------------

/// Hodnota ADC namerana pri CALIB_TEMP na tomto konkretnom cipe.
static constexpr uint16_t CALIB_ADC = 322;
/// Teplota okolia (C), pri ktorej bola namerana hodnota CALIB_ADC.
static constexpr int8_t CALIB_TEMP = 23;

// ---------------------------------------------------------------------------
// Citlivost senzora: typicky asi 1 LSB/C podla datasheetu ATmega.
// Vyjadrene ako zlomok, aby sme sa vyhli floating point vypoctom.
// Citatel/menovatel sa da doladit pri dvojbodovej kalibracii.
// ---------------------------------------------------------------------------
static constexpr int32_t SENS_NUM = 9259; // cca 0.9259 C / LSB
static constexpr int32_t SENS_DEN = 10000;

/// Pocet ADC vzoriek na spriemerovanie. Musi byt mocnina 2.
static constexpr uint8_t NUM_SAMPLES = 8;

// ---------------------------------------------------------------------------

int8_t read() {
    // Ulozime aktualnu konfiguraciu ADC, aby sme nenarusili nastavenie volajuceho.
    const uint8_t saved_ADMUX  = ADMUX;
    const uint8_t saved_ADCSRA = ADCSRA;

    // Interne 1.1 V referencia + kanal teplotneho senzora (ADC8 / MUX3).
    ADMUX = (1 << REFS1) | (1 << REFS0) | (1 << MUX3);
    // Zapneme ADC, prescaler = 128, co dava 125 kHz ADC clock pri 16 MHz.
    ADCSRA = (1 << ADEN) | (1 << ADPS2) | (1 << ADPS1) | (1 << ADPS0);

    // Pockame, kym sa interna 1.1 V referencia ustali.
    Utils::wait(20);

    // Prvu konverziu po prepnuti referencie zahodime,
    // ako odporuca datasheet ATmega (sekcia "ADC Noise Canceler").
    ADCSRA |= (1 << ADSC);
    while (ADCSRA & (1 << ADSC))
        ;

    // Nazbierame NUM_SAMPLES konverzii a spriemerujeme ich pre mensi sum.
    // Interny senzor ma typicky jitter 2 az 4 LSB, priemer to potlaci.
    uint32_t sum = 0;
    for (uint8_t i = 0; i < NUM_SAMPLES; ++i) {
        ADCSRA |= (1 << ADSC);
        while (ADCSRA & (1 << ADSC))
            ;
        sum += ADC;
    }
    const uint16_t adcAvg = static_cast<uint16_t>(sum / NUM_SAMPLES);

    // Obnovime povodnu konfiguraciu ADC pre volajuceho.
    ADMUX  = saved_ADMUX;
    ADCSRA = saved_ADCSRA;

    // Linearny prepocet ukotveny kalibracnym bodom:
    //   T = CALIB_TEMP + (adcAvg - CALIB_ADC) * (SENS_NUM / SENS_DEN)
    //
    // Nasobenie pred delenim zachova presnost bez floatov.
    // int32_t staci: max delta asi 200 LSB * 9259 = asi 1 851 800, bezpecne v rozsahu.
    const int32_t temp =
        static_cast<int32_t>(CALIB_TEMP) +
        (static_cast<int32_t>(adcAvg) - CALIB_ADC) * SENS_NUM / SENS_DEN;

    // Orezeme na rozsah int8_t pred pretypovanim, aby bol overflow explicitny.
    if (temp > 127)
        return 127;
    if (temp < -128)
        return -128;
    return static_cast<int8_t>(temp);
}

} // namespace AVRThermometer
