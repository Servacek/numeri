# TODO:

# Hardware
- [x] Pojistka z vonku či zvnútra? (uvidí sa podľa návrhu) (najskôr zvnútra, zvonku je toho už dosť).
- [x] Kapacita na zdroji je príliš veľká pre USB-C špecifikáciu.
    - Pravdepodobne netreba tak veľkú kapacitu pretože numitronu nespúšťame všetky naraz.
- [ ] Detekcia poruchy segmentov (zatiaľ len manuálna diagnostika).
    - Pred každý register 1 Ohm rezistor ktorý bude merať prúdový odber.
        - Treba zistiť aký to bude mať dopad na jas a aká bude presnosť takéhoto merania.
- [ ] Odmerať spotrebu ATmegy v rôznych režimoch + vypočítať odhadovanú životnosť batérie.
- [x] ATtiny24 má príliš málo (2kB) pamäti flash pre utiahnutie programov na DCF77 demoduláciu.
    - Najväčší MCU so 14 pinmi z rady ATtiny je ATtiny84 (8kB) (https://www.vpcentrum.eu/attiny84a-pu-mikrokontroler-avr-flash-8kx8bit-eeprom-512b-sram-512b-dip14), čo je stále pomerne málo.
    - Prejdeme teda na ATmega328-PU ktorá má 32kB pamäte flash a 2kB pamäte RAM.
        - To nám umožní ľahšie vyvíjať softvér (bude kompatibilný s arduino UNO prototypom).
        - Dokáže utiahnuť bez modifikácií knižnicu od Uda Kleina na dekódovanie DCF77 signálu.
- [ ] Zohnať zdroj s USB C káblom určený na dlhodobé napájanie.
    - Väčšina bežných mobilných nabíjačiek su v podstate len 5V (+-0.5V) zdroje s trafom
      takže pokiaľ nabíjačka podoporuje aspoň 1A, môže byť použítá na napájanie hodín.
    - Treba si dať pozor oceľová káble (kontrola magnetom). Vždy len meď!
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
- [ ] Poradie registrov bude netredične začínať jednotkami minút, pretože tak to vychádza
      podstatne lepšie na doske.
      - Treba zistiť aké výhody a nevýhody toto potencionálne prinesie a aké veľké zmeny bude treba urobiť v prototype.
- [x] Podpora signalizácie aj pre invertujúce DCF77 moduly.
    - LED-ka bude vyvedená zo MCU a ovládaná priamo DCF77 knižnicou, invertovanie vie byť ľahko zmenené v softvéri.
- [ ] Kapacitný trimmer pre detailné ladenie kryštálového oscilátora?
    - ~~Treba zistiť či nebude potrebný rezistor pre vybíjanie kondezátorov.~~ (Nepotrebuje, ATmega328p ho ma zabudovaný).
    - !!!! Problém je, že datasheet ATmega328p vyžaduje aby boli kondezátory C1 a C2 na XTAL1 a XTAL2 rovnaké.
- [ ] Tlačítka zo zadu na krajoch krabičky (najväčší priemer ~10mm);
- [ ] Na doske, erb Korne, pripadne aj nejaký text (napr. "Dizajnované v Korni"...)
    - Idealne možno niekde v strede namiesto MCU?
- [ ] Jas signalizačnej LED-ky by mal byť upraviteľný pomocou trimmeru, bez potreby úpravy softvéru.
- [ ] Zohnať lepší DCF77 modul prípadne väčšiu feritovú anténu (ideálne 100x10mm).
- [ ] ~~Programovanie cez USB-C konektor.~~
    - To by vyžadovalo IO pre konvertovanie USB do serialu.
- [ ] QR kód z logom obce s odkazom na online návod.
- [ ] Bezpečnostný obvod pre CR2032 batériu (od PANASONIC) podľa pomerne prísnych noriem od UL.
    - Obvod by mal obsahovať buď dve blokujúce diódy v sérií alebo jednu blokujúcu diódu
      a jeden rezistor tiež v sérií.
    - Použité diódy by mali byť krémikové (lat. silicium) aby zvodový prúd nepresiahol
      1% celkovej kapacity batérie počas jej života. Akýkoľvek väčší zvodový prúd ktorý
      by nabíjal batériu, ju môže poškodiť a tak skrátiť jej životnosť.
    - https://cr2032.co/protection-circuit-article.html
- [ ] Treba oldschool spojitú schému vytlačenú na A3/A2 ktorá sa vloží do manuálu v prípade
      potreby opráv.
- [ ] Bolo by zaujimavé vytvoriť vlastnú anténu pre DCF77. Na to ale budeme potrebovať:
    - feritovú tyč aspoň 10x100mm (Aliexpress).
    - vynutie na cievku 0.3-0.5mm (AliExpress).
    - tester tranzistorov s meraním indukčnosti a kapacity (Aliexpress).
    - ak by sme chceli byť hodne presný, treba generátor frekvencie a osciloskop.
    (https://www.aliexpress.com/item/1005007476871321.html?spm=a2g0o.productlist.main.2.4f4dc625Y27osO&algo_pvid=c280ab1b-e1fc-415f-a841-08b5a900e0ac&algo_exp_id=c280ab1b-e1fc-415f-a841-08b5a900e0ac-2&pdp_ext_f=%7B%22order%22%3A%22512%22%2C%22eval%22%3A%221%22%2C%22orig_sl_item_id%22%3A%221005007476871321%22%2C%22orig_item_id%22%3A%221005007156708206%22%7D&pdp_npi=4%40dis%21EUR%21145.19%2159.53%21%21%211171.85%21480.46%21%402103894417506270027512469e4cb1%2112000040910524318%21sea%21SK%216326788170%21ABX&curPageLogUid=UTDPevglkIv9&utparam-url=scene%3Asearch%7Cquery_from%3A)
- [ ] Pre vyriešenie problémov z presnosťou hodín na slepo (bez DCF77 synchronizácie)
      môžeme použiť modul HW-084 s RTC čipom DS3231-SN (industrial).
      Zároveň tým vyriešime problémy s pozíciou a bezpečným zapojením 3V mincovej Li batérie
      (modul čip spĺňa podmienky UL pre ochranu pred spätným prúdom).
    - Modul vypadá byť zapojený pomerne dobre, akurát treba odstrániť dva rezistory:
        - jeden pred diódov signalizujúcou externé napájanie a jeden pred
          nabíjacou diódov (budeme používať CR2032 ktoré nie sú nabijateľné).
    - Modul má aj senzor teploty (+- 3 °C).


# Pájkovanie
- [ ] Pasta na ošetrenie medennej dosky proti korózií a skratom. (má čas ale dôležité pre finálny výsledok)


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
- [ ] Závažia do krabičky aby bola stabilnejšia a masivnejšia.

# Manuál
- [ ] Historia numitronov IV-9.
- [ ] Prepísať na písacom stroji na starý zahnedlý papier.
- [ ] Pre obrázky použiť len čiernobiele obrysy s retro filtrom.

https://www.vpcentrum.eu/pic16f1825-e-p-mikrokontroler-pic-eeprom-256b-sram-1024b-32mhz-dip14
https://www.vpcentrum.eu/pic16f1825-i-p-mikrokontroler-pic-eeprom-256b-sram-1024b-32mhz-dip14
https://www.vpcentrum.eu/pic16f18426-i-p-mikrokontroler-pic-pamet-28kb-sram-2048b-eeprom-256b-32mhz

https://www.mouser.sk/ProductDetail/Microchip-Technology/PIC16F17126-I-P?qs=t7xnP681wgXtcSE8l0tHNA%3D%3D
https://www.youtube.com/watch?v=aIWxFjGh_HY

# Pozorovania
- Nemôžeme použiť interný kryštál pretože aj dekódovanie DCF signálu vyžaduje presný oscilátor.
- Programovanie ATMEGA cez ICSP prepíše celú flash pamäť vrátane bootloadera ktorý je na jej samom konci.
    - Preto po programovaní cez ICSP treba napáliť bootloader aby fungoval Arduino UNO shield.
