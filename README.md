# TODO:

# Hardware
- [x] Pojistka z vonku či zvnútra? (uvidí sa podľa návrhu) (najskôr zvnútra, zvonku je toho už dosť).
- [x] Kapacita na zdroji je príliš veľká pre USB-C špecifikáciu.
    - Pravdepodobne netreba tak veľkú kapacitu pretože numitronu nespúšťame všetky naraz.
- [ ] Detekcia poruchy segmentov (zatiaľ len manuálna diagnostika).
- [x] ATtiny24 má príliš málo (2kB) pamäti flash pre utiahnutie programov na DCF77 demoduláciu.
    - Najväčší MCU so 14 pinmi z rady ATtiny je ATtiny84 (8kB) (https://www.vpcentrum.eu/attiny84a-pu-mikrokontroler-avr-flash-8kx8bit-eeprom-512b-sram-512b-dip14), čo je stále pomerne málo.
    - Prejdeme teda na ATmega328-PU ktorá má 32kB pamäte flash a 2kB pamäte RAM.
        - To nám umožní ľahšie vyvíjať softvér (bude kompatibilný s arduino UNO prototypom).
        - Dokáže utiahnuť bez modifikácií knižnicu od Uda Kleina na dekódovanie DCF77 signálu.
- [ ] Zohnať zdroj s USB C káblom určený na dlhodobé napájanie.
    - Väčšina bežných mobilných nabíjačiek su v podstate len 5V (+-0.5V) zdroje s trafom
      takže pokiaľ nabíjačka podoporuje aspoň 1A, môže byť použítá na napájanie hodín.
- [ ] Ochrana pred prepätím na vstupe (vhodný transil) / pred skratom (vhodná rýchla poistka).
    - Transil použijeme [BZW06-5V8](https://www.gme.sk/v/1487314/stmicroelectronics-bzw06-5v8-unipolarny-transil),
      ktorý začne skratovať pri 5,8V čo by malo byť pod maximálnou hodnotou napätia pre IC s dosť veľkou rezervou.
    - Použijeme aspoň dva paralelne zapojené transily s vhodnou hodnotou, ideálne 5.5V pre čo najväčšiu prudovú výdrž.
- [ ] Čo najkvalitnejšie Schottkyho diódy (s čo najmenším Uf) (1N5817)
    - K dispozícií sú pomerne veľké 1N5822, ktoré by mohli byť vhodnejšie než tiw SR260.
- [ ] Ochrana proti opačnej polarite (Schottkyho diodov?) (ak ostane miesto na doske).
    - Klasická dióda Uf = ~0,7V
    - SR260 Uf = ~0,3V
    - 1N5822 Uf = ~0,2V
- [x] Mikrokontrolér by nemal byť vstrede ale na kraji keďže používame zreťazené registre.
- [x] Medzera medzi bankami s číslami hodín a minút by nemala presiahnuť 20mm (2x primer numitronu).
- [x] Medzera medzi bankami jednotlivých cifier čisiel by nemala presiahnuť 10mm (1x priemer numitronu).
- [x] Pri pajkovaní by vzdialenosť od pinov nemala byť menšia ako 3 mm (zvolili sme +5mm).
- [ ] Väčšie pady aspoň 2.2mm a diera 1.1mm
    - 95% pinov budú mať priemer pod 1mm, najmenší vrták je 1mm takže všetky diery ideálne chceme
      mať 1mm.
    - Aspoň milimiter materialu okolo diery pre istejšie leptanie.
- [ ] Tlačítko na manuálne zahájenie synchronizácie (kombinácia tlačidiel).
    - Tlačítko s LED-kou ktorá ide stačiť pre zahajenie synchronizácie?
- [ ] Tlačítka zo zadu na krajoch krabičky (najväčší priemer ~10mm);
- [ ] Na doske, erb Korne, pripadne aj nejaký text (napr. "Dizajnované v Korni"...)
    - Idealne možno niekde v strede namiesto MCU?

# Software
- [ ] Ukládať nastavenia do EEPROM.
- [ ] Animácie pri štarte, prip. pri kontrole segmentov.
- [ ] Watchdog podľa komplexity softvéru.
- [ ] Vypnúť ADC prevodníky na všetkých pinoch kde sa nepoužíva.
- [ ] V prípade detekcie odpojenia zo siete, prenúť do úsporného režimu.
- [ ] Väčší debouncy delay pre tlačítka aby sa počítalo aj z opotrebovaním.
- [ ] Plynulý prechod z jedného čisla na druhé pomocou PWM (podobne ako u danyka, nie len fading-in).

# Krabička
- [ ] Vyber dreva (pravdepodobne Buk?) (ebony, cherry, akacia, ...).
- [ ] Rozmery podľa archy zmluvy? (2.5:2.5:1.5)
- [ ] Pod ovládacím panelom citát z knihy Numeri + venovanie k 50-tým narodeninám pod tým.
- [ ] Zospodu krabičky mená ľudí, ktorý spolupracovali, ZVL-ka (logo?).

https://www.vpcentrum.eu/pic16f1825-e-p-mikrokontroler-pic-eeprom-256b-sram-1024b-32mhz-dip14
https://www.vpcentrum.eu/pic16f1825-i-p-mikrokontroler-pic-eeprom-256b-sram-1024b-32mhz-dip14
https://www.vpcentrum.eu/pic16f18426-i-p-mikrokontroler-pic-pamet-28kb-sram-2048b-eeprom-256b-32mhz

https://www.mouser.sk/ProductDetail/Microchip-Technology/PIC16F17126-I-P?qs=t7xnP681wgXtcSE8l0tHNA%3D%3D
https://www.youtube.com/watch?v=aIWxFjGh_HY

# Pozorovania
- Nemôžeme použiť interný kryštál pretože aj dekódovanie DCF signálu vyžaduje presný oscilátor.
