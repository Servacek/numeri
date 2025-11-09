
.pio/build/oldnano/firmware.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
       0:	0c 94 38 02 	jmp	0x470	; 0x470 <__ctors_end>
       4:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
       8:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
       c:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      10:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      14:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      18:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      1c:	0c 94 76 16 	jmp	0x2cec	; 0x2cec <__vector_7>
      20:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      24:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      28:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      2c:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      30:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      34:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      38:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      3c:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      40:	0c 94 b5 14 	jmp	0x296a	; 0x296a <__vector_16>
      44:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      48:	0c 94 25 15 	jmp	0x2a4a	; 0x2a4a <__vector_18>
      4c:	0c 94 ff 14 	jmp	0x29fe	; 0x29fe <__vector_19>
      50:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      54:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      58:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      5c:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>
      60:	0c 94 57 15 	jmp	0x2aae	; 0x2aae <__vector_24>
      64:	0c 94 60 02 	jmp	0x4c0	; 0x4c0 <__bad_interrupt>

00000068 <__trampolines_end>:
      68:	44 69       	ori	r20, 0x94	; 148
      6a:	61 67       	ori	r22, 0x71	; 113
      6c:	6e 6f       	ori	r22, 0xFE	; 254
      6e:	73 74       	andi	r23, 0x43	; 67
      70:	69 6b       	ori	r22, 0xB9	; 185
      72:	61 20       	and	r6, r1
      74:	64 6f       	ori	r22, 0xF4	; 244
      76:	6b 6f       	ori	r22, 0xFB	; 251
      78:	6e c4       	rjmp	.+2268   	; 0x956 <_ZN14HardwareSerial4peekEv+0xa>
      7a:	8d 65       	ori	r24, 0x5D	; 93
      7c:	6e c3       	rjmp	.+1756   	; 0x75a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x6e>
      7e:	a1 2e       	mov	r10, r17
      80:	20 50       	subi	r18, 0x00	; 0
      82:	6f 6d       	ori	r22, 0xDF	; 223
      84:	61 6c       	ori	r22, 0xC1	; 193
      86:	c3 bd       	out	0x23, r28	; 35
      88:	20 70       	andi	r18, 0x00	; 0
      8a:	72 65       	ori	r23, 0x52	; 82
      8c:	63 68       	ori	r22, 0x83	; 131
      8e:	6f 64       	ori	r22, 0x4F	; 79
      90:	20 6e       	ori	r18, 0xE0	; 224
      92:	61 20       	and	r6, r1
      94:	75 6c       	ori	r23, 0xC5	; 197
      96:	6f c5       	rjmp	.+2782   	; 0xb76 <digitalWrite+0x7a>
      98:	be 65       	ori	r27, 0x5E	; 94
      9a:	6e c3       	rjmp	.+1756   	; 0x778 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x8c>
      9c:	bd 20       	and	r11, r13
      9e:	c4 8d       	ldd	r28, Z+28	; 0x1c
      a0:	61 73       	andi	r22, 0x31	; 49
      a2:	2e 2e       	mov	r2, r30
      a4:	2e 00       	.word	0x002e	; ????

000000a6 <_ZZ11bootDisplayvE3__c>:
      a6:	c3 9a 76 6f 64 6e c3 a1 20 64 69 61 67 6e 6f 73     ..vodn.. diagnos
      b6:	74 69 6b 61 2e 20 56 c5 a1 65 74 6b 79 20 73 65     tika. V..etky se
      c6:	67 6d 65 6e 74 79 20 62 75 64 75 20 70 6f 73 74     gmenty budu post
      d6:	75 70 6e 65 20 72 6f 7a 73 76 69 65 74 65 6e 65     upne rozsvietene
      e6:	2e 2e 2e 00                                         ....

000000ea <_ZZ5setupE3__c__17_>:
      ea:	53 70 c3 ba c5 a1 c5 a5 61 6e 69 65 20 68 6f 64     Sp......anie hod
      fa:	c3 ad 6e 20 64 6f 6b 6f 6e c4 8d 65 6e c3 a9 21     ..n dokon..en..!
	...

0000010b <_ZZ5setupE3__c__16_>:
     10b:	53 70 c3 ba c5 a1 c5 a5 61 6e 69 65 20 44 43 46     Sp......anie DCF
     11b:	37 37 20 70 72 69 6a c3 ad 6d 61 c4 8d 61 2e 2e     77 prij..ma..a..
     12b:	2e 00                                               ..

0000012d <_ZZ5setupE3__c__15_>:
     12d:	5a 6f 62 72 61 7a 6f 76 61 6e 69 65 20 c4 8d 61     Zobrazovanie ..a
     13d:	73 75 2e 2e 2e 00                                   su....

00000143 <_ZZ5setupE3__c__14_>:
     143:	4e 61 c4 8d c3 ad 74 61 76 61 6e 69 65 20 75 6c     Na....tavanie ul
     153:	6f c5 be 65 6e c3 bd 63 68 20 6b 6f 6e 66 69 67     o..en..ch konfig
     163:	75 72 c3 a1 63 69 c3 ad 20 7a 20 45 45 50 52 4f     ur..ci.. z EEPRO
     173:	4d 2e 2e 2e 00                                      M....

00000178 <_ZZ5setupE3__c__13_>:
     178:	52 65 73 65 74 6f 76 61 6e 69 65 20 c4 8d 61 73     Resetovanie ..as
     188:	75 20 76 20 52 54 43 20 6d 6f 64 75 6c 65 2e 00     u v RTC module..

00000198 <_ZZ5setupE3__c__12_>:
     198:	52 45 53 45 54 20 74 6c 61 c4 8d 69 64 6c 6f 20     RESET tla..idlo 
     1a8:	62 6f 6c 6f 20 73 74 6c 61 c4 8d 65 6e c3 a9 2c     bolo stla..en..,
     1b8:	20 70 6f 75 c5 be 69 6a 65 6d 65 20 76 c3 bd 63      pou..ijeme v..c
     1c8:	68 6f 64 7a 69 65 20 68 6f 64 6e 6f 74 79 20 6e     hodzie hodnoty n
     1d8:	61 73 74 61 76 65 6e c3 ad 2e 00                    astaven....

000001e3 <_ZZ5setupE3__c__11_>:
     1e3:	5a 61 70 c3 ad 6e 61 6e 69 65 20 64 69 73 70 6c     Zap..nanie displ
     1f3:	65 6a 61 2e 2e 2e 00                                eja....

000001fa <_ZZ5setupE3__c__10_>:
     1fa:	49 6e 69 63 69 61 6c 69 7a c3 a1 63 69 61 20 76     Inicializ..cia v
     20a:	73 74 75 70 6e 6f 2d 76 c3 bd 73 74 75 70 6e c3     stupno-v..stupn.
     21a:	bd 63 68 20 70 69 6e 6f 76 2e 2e 2e 00              .ch pinov....

00000227 <_ZZ5setupE3__c_9>:
     227:	50 72 c3 ba 64 6f 76 c3 bd 20 73 65 6e 7a 6f 72     Pr..dov.. senzor
     237:	20 6e 65 62 6f 6c 20 6e c3 a1 6a 64 65 6e c3 bd      nebol n..jden..
     247:	21 00                                               !.

00000249 <_ZZ5setupE3__c_8>:
     249:	4b 61 6c 69 62 72 c3 a1 63 69 61 2e 2e 2e 00        Kalibr..cia....

00000258 <_ZZ5setupE3__c_7>:
     258:	50 72 c3 ba 64 6f 76 c3 bd 20 73 65 6e 7a 6f 72     Pr..dov.. senzor
     268:	20 6e 69 65 20 6a 65 20 6b 61 6c 69 62 72 6f 76      nie je kalibrov
     278:	61 6e c3 bd 21 00                                   an..!.

0000027e <_ZZ5setupE3__c_6>:
     27e:	49 6e 69 63 69 61 6c 69 7a c3 a1 63 69 61 20 73     Inicializ..cia s
     28e:	65 6e 7a 6f 72 61 20 70 72 c3 ba 64 75 2e 2e 2e     enzora pr..du...
	...

0000029f <_ZZ5setupE3__c_5>:
     29f:	4b 6f 6e 66 69 67 75 72 c3 a1 63 69 61 20 70 69     Konfigur..cia pi
     2af:	6e 6f 76 20 44 43 46 37 37 20 70 72 69 6a c3 ad     nov DCF77 prij..
     2bf:	6d 61 c4 8d 61 2e 2e 2e 00                          ma..a....

000002c8 <_ZZ5setupE3__c_4>:
     2c8:	5b 56 61 72 6f 76 61 6e 69 65 5d 20 52 54 43 20     [Varovanie] RTC 
     2d8:	6d 6f 64 75 6c 20 6e 65 62 6f 6c 20 6e c3 a1 6a     modul nebol n..j
     2e8:	64 65 6e c3 bd 21 00                                den..!.

000002ef <_ZZ5setupE3__c_3>:
     2ef:	4b 6f 6e 66 69 67 75 72 c3 a1 63 69 61 20 c4 8d     Konfigur..cia ..
     2ff:	61 73 6f 76 61 c4 8d 61 2e 2e 2e 00                 asova..a....

0000030b <_ZZ5setupE3__c_2>:
     30b:	4b 6f 6e 66 69 67 75 72 c3 a1 63 69 61 20 7a 62     Konfigur..cia zb
     31b:	65 72 6e 69 63 65 20 72 65 67 69 73 74 72 6f 76     ernice registrov
     32b:	20 70 72 65 20 64 69 73 70 6c 65 6a 2e 2e 2e 00      pre displej....

0000033b <_ZZ5setupE3__c_1>:
     33b:	4b 6f 6e 66 69 67 75 72 c3 a1 63 69 61 20 50 57     Konfigur..cia PW
     34b:	4d 20 6b 61 6e c3 a1 6c 75 20 70 72 65 20 6a 61     M kan..lu pre ja
     35b:	73 2e 2e 2e 00                                      s....

00000360 <_ZZ5setupE3__c_0>:
     360:	44 65 66 69 6e 6f 76 61 6e 69 65 20 70 65 76 6e     Definovanie pevn
     370:	c3 bd 63 68 20 6c 6f 67 69 63 6b c3 bd 63 68 20     ..ch logick..ch 
     380:	68 6f 64 6e c3 b4 74 20 70 72 65 20 6e 65 70 6f     hodn..t pre nepo
     390:	75 c5 be 69 74 c3 a9 20 70 69 6e 79 2e 2e 2e 00     u..it.. piny....

000003a0 <_ZZ5setupE3__c>:
     3a0:	53 70 c3 ba c5 a1 c5 a5 61 6e 69 65 20 68 6f 64     Sp......anie hod
     3b0:	c3 ad 6e 2e 2e 2e 00                                ..n....

000003b7 <_ZL19NUM_SYMBOL_uint8_tS>:
     3b7:	7b 60 57 76 6c 3e 3f 70 7f 7e 5c 04 1b              {`Wvl>?p.~\..

000003c4 <_ZZ4loopE3__c_0>:
     3c4:	50 72 c3 ba 64 6f 76 c3 bd 20 6f 64 62 65 72 20     Pr..dov.. odber 
     3d4:	64 69 73 70 6c 65 6a 61 20 5b 6d 41 5d 3a 09 09     displeja [mA]:..
	...

000003e5 <_ZZ4loopE3__c>:
     3e5:	c3 9a 62 79 74 6f 6b 20 6e 61 70 c3 a4 74 69 61     ..bytok nap..tia
     3f5:	20 6e 61 20 6d 65 72 61 63 6f 6d 20 72 65 7a 69      na meracom rezi
     405:	73 74 6f 72 65 20 5b 6d 56 5d 3a 09 09 00           store [mV]:...

00000413 <digital_pin_to_timer_PGM>:
     413:	00 00 00 08 00 02 01 00 00 03 04 07 00 00 00 00     ................
     423:	00 00 00 00                                         ....

00000427 <_ZL11daysInMonth>:
     427:	1f 1c 1f 1e 1f 1e 1f 1f 1e 1f 1e                    ...........

00000432 <port_to_output_PGM>:
     432:	00 00 00 00 25 00 28 00 2b 00                       ....%.(.+.

0000043c <port_to_mode_PGM>:
     43c:	00 00 00 00 24 00 27 00 2a 00                       ....$.'.*.

00000446 <digital_pin_to_port_PGM>:
     446:	04 04 04 04 04 04 04 04 02 02 02 02 02 02 03 03     ................
     456:	03 03 03 03                                         ....

0000045a <digital_pin_to_bit_mask_PGM>:
     45a:	01 02 04 08 10 20 40 80 01 02 04 08 10 20 01 02     ..... @...... ..
     46a:	04 08 10 20                                         ... 

0000046e <__ctors_start>:
     46e:	ff 21       	and	r31, r15

00000470 <__ctors_end>:
     470:	11 24       	eor	r1, r1
     472:	1f be       	out	0x3f, r1	; 63
     474:	cf ef       	ldi	r28, 0xFF	; 255
     476:	d8 e0       	ldi	r29, 0x08	; 8
     478:	de bf       	out	0x3e, r29	; 62
     47a:	cd bf       	out	0x3d, r28	; 61

0000047c <__do_clear_bss>:
     47c:	26 e0       	ldi	r18, 0x06	; 6
     47e:	a8 e4       	ldi	r26, 0x48	; 72
     480:	b2 e0       	ldi	r27, 0x02	; 2
     482:	01 c0       	rjmp	.+2      	; 0x486 <.do_clear_bss_start>

00000484 <.do_clear_bss_loop>:
     484:	1d 92       	st	X+, r1

00000486 <.do_clear_bss_start>:
     486:	ab 30       	cpi	r26, 0x0B	; 11
     488:	b2 07       	cpc	r27, r18
     48a:	e1 f7       	brne	.-8      	; 0x484 <.do_clear_bss_loop>

0000048c <__do_copy_data>:
     48c:	12 e0       	ldi	r17, 0x02	; 2
     48e:	a0 e0       	ldi	r26, 0x00	; 0
     490:	b1 e0       	ldi	r27, 0x01	; 1
     492:	ea ec       	ldi	r30, 0xCA	; 202
     494:	f8 e5       	ldi	r31, 0x58	; 88
     496:	02 c0       	rjmp	.+4      	; 0x49c <__do_copy_data+0x10>
     498:	05 90       	lpm	r0, Z+
     49a:	0d 92       	st	X+, r0
     49c:	a8 34       	cpi	r26, 0x48	; 72
     49e:	b1 07       	cpc	r27, r17
     4a0:	d9 f7       	brne	.-10     	; 0x498 <__do_copy_data+0xc>

000004a2 <__do_global_ctors>:
     4a2:	12 e0       	ldi	r17, 0x02	; 2
     4a4:	c8 e3       	ldi	r28, 0x38	; 56
     4a6:	d2 e0       	ldi	r29, 0x02	; 2
     4a8:	04 c0       	rjmp	.+8      	; 0x4b2 <__do_global_ctors+0x10>
     4aa:	21 97       	sbiw	r28, 0x01	; 1
     4ac:	fe 01       	movw	r30, r28
     4ae:	0e 94 df 29 	call	0x53be	; 0x53be <__tablejump2__>
     4b2:	c7 33       	cpi	r28, 0x37	; 55
     4b4:	d1 07       	cpc	r29, r17
     4b6:	c9 f7       	brne	.-14     	; 0x4aa <__do_global_ctors+0x8>
     4b8:	0e 94 cb 22 	call	0x4596	; 0x4596 <main>
     4bc:	0c 94 63 2c 	jmp	0x58c6	; 0x58c6 <_exit>

000004c0 <__bad_interrupt>:
     4c0:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

000004c4 <_Z20putDigitsToInputRegsPhh.constprop.118>:
     4c4:	5f 98       	cbi	0x0b, 7	; 11
     4c6:	28 98       	cbi	0x05, 0	; 5
     4c8:	fc 01       	movw	r30, r24
     4ca:	94 e0       	ldi	r25, 0x04	; 4
     4cc:	50 e0       	ldi	r21, 0x00	; 0
     4ce:	40 e0       	ldi	r20, 0x00	; 0
     4d0:	20 81       	ld	r18, Z
     4d2:	30 e0       	ldi	r19, 0x00	; 0
     4d4:	04 2e       	mov	r0, r20
     4d6:	02 c0       	rjmp	.+4      	; 0x4dc <_Z20putDigitsToInputRegsPhh.constprop.118+0x18>
     4d8:	35 95       	asr	r19
     4da:	27 95       	ror	r18
     4dc:	0a 94       	dec	r0
     4de:	e2 f7       	brpl	.-8      	; 0x4d8 <_Z20putDigitsToInputRegsPhh.constprop.118+0x14>
     4e0:	20 ff       	sbrs	r18, 0
     4e2:	0d c0       	rjmp	.+26     	; 0x4fe <_Z20putDigitsToInputRegsPhh.constprop.118+0x3a>
     4e4:	2c 9a       	sbi	0x05, 4	; 5
     4e6:	28 9a       	sbi	0x05, 0	; 5
     4e8:	28 98       	cbi	0x05, 0	; 5
     4ea:	4f 5f       	subi	r20, 0xFF	; 255
     4ec:	5f 4f       	sbci	r21, 0xFF	; 255
     4ee:	48 30       	cpi	r20, 0x08	; 8
     4f0:	51 05       	cpc	r21, r1
     4f2:	71 f7       	brne	.-36     	; 0x4d0 <_Z20putDigitsToInputRegsPhh.constprop.118+0xc>
     4f4:	91 50       	subi	r25, 0x01	; 1
     4f6:	31 96       	adiw	r30, 0x01	; 1
     4f8:	91 11       	cpse	r25, r1
     4fa:	e8 cf       	rjmp	.-48     	; 0x4cc <_Z20putDigitsToInputRegsPhh.constprop.118+0x8>
     4fc:	08 95       	ret
     4fe:	2c 98       	cbi	0x05, 4	; 5
     500:	f2 cf       	rjmp	.-28     	; 0x4e6 <_Z20putDigitsToInputRegsPhh.constprop.118+0x22>

00000502 <_ZN8Internal18DCF77_Year_Decoder5setupEv.constprop.99>:
     502:	e2 ec       	ldi	r30, 0xC2	; 194
     504:	f3 e0       	ldi	r31, 0x03	; 3
     506:	11 92       	st	Z+, r1
     508:	83 e0       	ldi	r24, 0x03	; 3
     50a:	ec 3c       	cpi	r30, 0xCC	; 204
     50c:	f8 07       	cpc	r31, r24
     50e:	d9 f7       	brne	.-10     	; 0x506 <_ZN8Internal18DCF77_Year_Decoder5setupEv.constprop.99+0x4>
     510:	10 92 cc 03 	sts	0x03CC, r1	; 0x8003cc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xa>
     514:	10 92 ce 03 	sts	0x03CE, r1	; 0x8003ce <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xc>
     518:	8b e0       	ldi	r24, 0x0B	; 11
     51a:	80 93 cf 03 	sts	0x03CF, r24	; 0x8003cf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xd>
     51e:	10 92 cd 03 	sts	0x03CD, r1	; 0x8003cd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xb>
     522:	e0 ed       	ldi	r30, 0xD0	; 208
     524:	f3 e0       	ldi	r31, 0x03	; 3
     526:	11 92       	st	Z+, r1
     528:	83 e0       	ldi	r24, 0x03	; 3
     52a:	ea 3d       	cpi	r30, 0xDA	; 218
     52c:	f8 07       	cpc	r31, r24
     52e:	d9 f7       	brne	.-10     	; 0x526 <_ZN8Internal18DCF77_Year_Decoder5setupEv.constprop.99+0x24>
     530:	10 92 da 03 	sts	0x03DA, r1	; 0x8003da <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x18>
     534:	10 92 dc 03 	sts	0x03DC, r1	; 0x8003dc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x1a>
     538:	8b e0       	ldi	r24, 0x0B	; 11
     53a:	80 93 dd 03 	sts	0x03DD, r24	; 0x8003dd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x1b>
     53e:	10 92 db 03 	sts	0x03DB, r1	; 0x8003db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x19>
     542:	08 95       	ret

00000544 <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.64>:
     544:	80 91 5e 03 	lds	r24, 0x035E	; 0x80035e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3e>
     548:	90 91 5d 03 	lds	r25, 0x035D	; 0x80035d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3d>
     54c:	89 1b       	sub	r24, r25
     54e:	99 0b       	sbc	r25, r25
     550:	0c 97       	sbiw	r24, 0x0c	; 12
     552:	54 f0       	brlt	.+20     	; 0x568 <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.64+0x24>
     554:	80 91 5c 03 	lds	r24, 0x035C	; 0x80035c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3c>
     558:	8a 58       	subi	r24, 0x8A	; 138
     55a:	90 91 5f 03 	lds	r25, 0x035F	; 0x80035f <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3f>
     55e:	89 1b       	sub	r24, r25
     560:	8c 33       	cpi	r24, 0x3C	; 60
     562:	18 f0       	brcs	.+6      	; 0x56a <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.64+0x26>
     564:	8c 53       	subi	r24, 0x3C	; 60
     566:	fc cf       	rjmp	.-8      	; 0x560 <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.64+0x1c>
     568:	8f ef       	ldi	r24, 0xFF	; 255
     56a:	08 95       	ret

0000056c <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55>:
     56c:	ef 92       	push	r14
     56e:	ff 92       	push	r15
     570:	0f 93       	push	r16
     572:	1f 93       	push	r17
     574:	2f b7       	in	r18, 0x3f	; 63
     576:	f8 94       	cli
     578:	40 91 c3 05 	lds	r20, 0x05C3	; 0x8005c3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcd>
     57c:	50 91 c4 05 	lds	r21, 0x05C4	; 0x8005c4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xce>
     580:	60 91 c5 05 	lds	r22, 0x05C5	; 0x8005c5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcf>
     584:	70 91 c6 05 	lds	r23, 0x05C6	; 0x8005c6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd0>
     588:	80 91 bf 05 	lds	r24, 0x05BF	; 0x8005bf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc9>
     58c:	90 91 c0 05 	lds	r25, 0x05C0	; 0x8005c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xca>
     590:	a0 91 c1 05 	lds	r26, 0x05C1	; 0x8005c1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcb>
     594:	b0 91 c2 05 	lds	r27, 0x05C2	; 0x8005c2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcc>
     598:	84 17       	cp	r24, r20
     59a:	95 07       	cpc	r25, r21
     59c:	a6 07       	cpc	r26, r22
     59e:	b7 07       	cpc	r27, r23
     5a0:	38 f0       	brcs	.+14     	; 0x5b0 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55+0x44>
     5a2:	2f bf       	out	0x3f, r18	; 63
     5a4:	80 e0       	ldi	r24, 0x00	; 0
     5a6:	1f 91       	pop	r17
     5a8:	0f 91       	pop	r16
     5aa:	ff 90       	pop	r15
     5ac:	ef 90       	pop	r14
     5ae:	08 95       	ret
     5b0:	7a 01       	movw	r14, r20
     5b2:	8b 01       	movw	r16, r22
     5b4:	e8 1a       	sub	r14, r24
     5b6:	f9 0a       	sbc	r15, r25
     5b8:	0a 0b       	sbc	r16, r26
     5ba:	1b 0b       	sbc	r17, r27
     5bc:	d8 01       	movw	r26, r16
     5be:	c7 01       	movw	r24, r14
     5c0:	2f bf       	out	0x3f, r18	; 63
     5c2:	20 e0       	ldi	r18, 0x00	; 0
     5c4:	41 15       	cp	r20, r1
     5c6:	51 05       	cpc	r21, r1
     5c8:	61 05       	cpc	r22, r1
     5ca:	71 05       	cpc	r23, r1
     5cc:	31 f0       	breq	.+12     	; 0x5da <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55+0x6e>
     5ce:	76 95       	lsr	r23
     5d0:	67 95       	ror	r22
     5d2:	57 95       	ror	r21
     5d4:	47 95       	ror	r20
     5d6:	2f 5f       	subi	r18, 0xFF	; 255
     5d8:	f5 cf       	rjmp	.-22     	; 0x5c4 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55+0x58>
     5da:	22 23       	and	r18, r18
     5dc:	31 f0       	breq	.+12     	; 0x5ea <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55+0x7e>
     5de:	26 95       	lsr	r18
     5e0:	b6 95       	lsr	r27
     5e2:	a7 95       	ror	r26
     5e4:	97 95       	ror	r25
     5e6:	87 95       	ror	r24
     5e8:	f8 cf       	rjmp	.-16     	; 0x5da <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55+0x6e>
     5ea:	8f 3f       	cpi	r24, 0xFF	; 255
     5ec:	91 05       	cpc	r25, r1
     5ee:	a1 05       	cpc	r26, r1
     5f0:	b1 05       	cpc	r27, r1
     5f2:	c9 f2       	breq	.-78     	; 0x5a6 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55+0x3a>
     5f4:	c0 f2       	brcs	.-80     	; 0x5a6 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55+0x3a>
     5f6:	8f ef       	ldi	r24, 0xFF	; 255
     5f8:	90 e0       	ldi	r25, 0x00	; 0
     5fa:	a0 e0       	ldi	r26, 0x00	; 0
     5fc:	b0 e0       	ldi	r27, 0x00	; 0
     5fe:	d3 cf       	rjmp	.-90     	; 0x5a6 <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55+0x3a>

00000600 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52>:
     600:	8f b7       	in	r24, 0x3f	; 63
     602:	f8 94       	cli
     604:	90 91 c0 03 	lds	r25, 0x03C0	; 0x8003c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xe>
     608:	20 91 bf 03 	lds	r18, 0x03BF	; 0x8003bf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xd>
     60c:	29 17       	cp	r18, r25
     60e:	18 f0       	brcs	.+6      	; 0x616 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x16>
     610:	8f bf       	out	0x3f, r24	; 63
     612:	80 e0       	ldi	r24, 0x00	; 0
     614:	08 95       	ret
     616:	39 2f       	mov	r19, r25
     618:	32 1b       	sub	r19, r18
     61a:	23 2f       	mov	r18, r19
     61c:	8f bf       	out	0x3f, r24	; 63
     61e:	80 e0       	ldi	r24, 0x00	; 0
     620:	9d 31       	cpi	r25, 0x1D	; 29
     622:	40 f4       	brcc	.+16     	; 0x634 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x34>
     624:	9d 30       	cpi	r25, 0x0D	; 13
     626:	08 f4       	brcc	.+2      	; 0x62a <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x2a>
     628:	45 c0       	rjmp	.+138    	; 0x6b4 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xb4>
     62a:	83 2f       	mov	r24, r19
     62c:	86 95       	lsr	r24
     62e:	86 95       	lsr	r24
     630:	08 95       	ret
     632:	83 2f       	mov	r24, r19
     634:	96 95       	lsr	r25
     636:	31 e0       	ldi	r19, 0x01	; 1
     638:	38 0f       	add	r19, r24
     63a:	91 11       	cpse	r25, r1
     63c:	fa cf       	rjmp	.-12     	; 0x632 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x32>
     63e:	8d 30       	cpi	r24, 0x0D	; 13
     640:	68 f0       	brcs	.+26     	; 0x65c <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x5c>
     642:	8d 30       	cpi	r24, 0x0D	; 13
     644:	29 f1       	breq	.+74     	; 0x690 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x90>
     646:	8e 30       	cpi	r24, 0x0E	; 14
     648:	31 f1       	breq	.+76     	; 0x696 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x96>
     64a:	81 e1       	ldi	r24, 0x11	; 17
     64c:	90 e0       	ldi	r25, 0x00	; 0
     64e:	28 9f       	mul	r18, r24
     650:	a0 01       	movw	r20, r0
     652:	29 9f       	mul	r18, r25
     654:	50 0d       	add	r21, r0
     656:	11 24       	eor	r1, r1
     658:	85 2f       	mov	r24, r21
     65a:	08 95       	ret
     65c:	89 30       	cpi	r24, 0x09	; 9
     65e:	60 f0       	brcs	.+24     	; 0x678 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x78>
     660:	8b 30       	cpi	r24, 0x0B	; 11
     662:	28 f0       	brcs	.+10     	; 0x66e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x6e>
     664:	8c 30       	cpi	r24, 0x0C	; 12
     666:	d1 f4       	brne	.+52     	; 0x69c <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x9c>
     668:	85 e1       	ldi	r24, 0x15	; 21
     66a:	90 e0       	ldi	r25, 0x00	; 0
     66c:	f0 cf       	rjmp	.-32     	; 0x64e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x4e>
     66e:	8a 30       	cpi	r24, 0x0A	; 10
     670:	c1 f4       	brne	.+48     	; 0x6a2 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xa2>
     672:	89 e1       	ldi	r24, 0x19	; 25
     674:	90 e0       	ldi	r25, 0x00	; 0
     676:	eb cf       	rjmp	.-42     	; 0x64e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x4e>
     678:	87 30       	cpi	r24, 0x07	; 7
     67a:	28 f0       	brcs	.+10     	; 0x686 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x86>
     67c:	88 30       	cpi	r24, 0x08	; 8
     67e:	a1 f4       	brne	.+40     	; 0x6a8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xa8>
     680:	80 e2       	ldi	r24, 0x20	; 32
     682:	90 e0       	ldi	r25, 0x00	; 0
     684:	e4 cf       	rjmp	.-56     	; 0x64e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x4e>
     686:	86 30       	cpi	r24, 0x06	; 6
     688:	91 f4       	brne	.+36     	; 0x6ae <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xae>
     68a:	8a e2       	ldi	r24, 0x2A	; 42
     68c:	90 e0       	ldi	r25, 0x00	; 0
     68e:	df cf       	rjmp	.-66     	; 0x64e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x4e>
     690:	83 e1       	ldi	r24, 0x13	; 19
     692:	90 e0       	ldi	r25, 0x00	; 0
     694:	dc cf       	rjmp	.-72     	; 0x64e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x4e>
     696:	82 e1       	ldi	r24, 0x12	; 18
     698:	90 e0       	ldi	r25, 0x00	; 0
     69a:	d9 cf       	rjmp	.-78     	; 0x64e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x4e>
     69c:	87 e1       	ldi	r24, 0x17	; 23
     69e:	90 e0       	ldi	r25, 0x00	; 0
     6a0:	d6 cf       	rjmp	.-84     	; 0x64e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x4e>
     6a2:	8c e1       	ldi	r24, 0x1C	; 28
     6a4:	90 e0       	ldi	r25, 0x00	; 0
     6a6:	d3 cf       	rjmp	.-90     	; 0x64e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x4e>
     6a8:	84 e2       	ldi	r24, 0x24	; 36
     6aa:	90 e0       	ldi	r25, 0x00	; 0
     6ac:	d0 cf       	rjmp	.-96     	; 0x64e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x4e>
     6ae:	83 e3       	ldi	r24, 0x33	; 51
     6b0:	90 e0       	ldi	r25, 0x00	; 0
     6b2:	cd cf       	rjmp	.-102    	; 0x64e <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x4e>
     6b4:	99 30       	cpi	r25, 0x09	; 9
     6b6:	48 f0       	brcs	.+18     	; 0x6ca <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xca>
     6b8:	3b 30       	cpi	r19, 0x0B	; 11
     6ba:	a0 f4       	brcc	.+40     	; 0x6e4 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xe4>
     6bc:	37 30       	cpi	r19, 0x07	; 7
     6be:	a0 f4       	brcc	.+40     	; 0x6e8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xe8>
     6c0:	81 e0       	ldi	r24, 0x01	; 1
     6c2:	34 30       	cpi	r19, 0x04	; 4
     6c4:	08 f4       	brcc	.+2      	; 0x6c8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xc8>
     6c6:	a5 cf       	rjmp	.-182    	; 0x612 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x12>
     6c8:	08 95       	ret
     6ca:	95 30       	cpi	r25, 0x05	; 5
     6cc:	30 f0       	brcs	.+12     	; 0x6da <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xda>
     6ce:	36 30       	cpi	r19, 0x06	; 6
     6d0:	58 f4       	brcc	.+22     	; 0x6e8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xe8>
     6d2:	81 e0       	ldi	r24, 0x01	; 1
     6d4:	23 30       	cpi	r18, 0x03	; 3
     6d6:	c0 f7       	brcc	.-16     	; 0x6c8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xc8>
     6d8:	9c cf       	rjmp	.-200    	; 0x612 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0x12>
     6da:	93 30       	cpi	r25, 0x03	; 3
     6dc:	d0 f7       	brcc	.-12     	; 0x6d2 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xd2>
     6de:	83 2f       	mov	r24, r19
     6e0:	86 95       	lsr	r24
     6e2:	08 95       	ret
     6e4:	83 e0       	ldi	r24, 0x03	; 3
     6e6:	08 95       	ret
     6e8:	82 e0       	ldi	r24, 0x02	; 2
     6ea:	ee cf       	rjmp	.-36     	; 0x6c8 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52+0xc8>

000006ec <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51>:
     6ec:	8f b7       	in	r24, 0x3f	; 63
     6ee:	f8 94       	cli
     6f0:	90 91 b0 03 	lds	r25, 0x03B0	; 0x8003b0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x21>
     6f4:	20 91 af 03 	lds	r18, 0x03AF	; 0x8003af <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x20>
     6f8:	29 17       	cp	r18, r25
     6fa:	18 f0       	brcs	.+6      	; 0x702 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x16>
     6fc:	8f bf       	out	0x3f, r24	; 63
     6fe:	80 e0       	ldi	r24, 0x00	; 0
     700:	08 95       	ret
     702:	39 2f       	mov	r19, r25
     704:	32 1b       	sub	r19, r18
     706:	23 2f       	mov	r18, r19
     708:	8f bf       	out	0x3f, r24	; 63
     70a:	80 e0       	ldi	r24, 0x00	; 0
     70c:	9d 31       	cpi	r25, 0x1D	; 29
     70e:	40 f4       	brcc	.+16     	; 0x720 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x34>
     710:	9d 30       	cpi	r25, 0x0D	; 13
     712:	08 f4       	brcc	.+2      	; 0x716 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x2a>
     714:	45 c0       	rjmp	.+138    	; 0x7a0 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xb4>
     716:	83 2f       	mov	r24, r19
     718:	86 95       	lsr	r24
     71a:	86 95       	lsr	r24
     71c:	08 95       	ret
     71e:	83 2f       	mov	r24, r19
     720:	96 95       	lsr	r25
     722:	31 e0       	ldi	r19, 0x01	; 1
     724:	38 0f       	add	r19, r24
     726:	91 11       	cpse	r25, r1
     728:	fa cf       	rjmp	.-12     	; 0x71e <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x32>
     72a:	8d 30       	cpi	r24, 0x0D	; 13
     72c:	68 f0       	brcs	.+26     	; 0x748 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x5c>
     72e:	8d 30       	cpi	r24, 0x0D	; 13
     730:	29 f1       	breq	.+74     	; 0x77c <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x90>
     732:	8e 30       	cpi	r24, 0x0E	; 14
     734:	31 f1       	breq	.+76     	; 0x782 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x96>
     736:	81 e1       	ldi	r24, 0x11	; 17
     738:	90 e0       	ldi	r25, 0x00	; 0
     73a:	28 9f       	mul	r18, r24
     73c:	a0 01       	movw	r20, r0
     73e:	29 9f       	mul	r18, r25
     740:	50 0d       	add	r21, r0
     742:	11 24       	eor	r1, r1
     744:	85 2f       	mov	r24, r21
     746:	08 95       	ret
     748:	89 30       	cpi	r24, 0x09	; 9
     74a:	60 f0       	brcs	.+24     	; 0x764 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x78>
     74c:	8b 30       	cpi	r24, 0x0B	; 11
     74e:	28 f0       	brcs	.+10     	; 0x75a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x6e>
     750:	8c 30       	cpi	r24, 0x0C	; 12
     752:	d1 f4       	brne	.+52     	; 0x788 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x9c>
     754:	85 e1       	ldi	r24, 0x15	; 21
     756:	90 e0       	ldi	r25, 0x00	; 0
     758:	f0 cf       	rjmp	.-32     	; 0x73a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x4e>
     75a:	8a 30       	cpi	r24, 0x0A	; 10
     75c:	c1 f4       	brne	.+48     	; 0x78e <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xa2>
     75e:	89 e1       	ldi	r24, 0x19	; 25
     760:	90 e0       	ldi	r25, 0x00	; 0
     762:	eb cf       	rjmp	.-42     	; 0x73a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x4e>
     764:	87 30       	cpi	r24, 0x07	; 7
     766:	28 f0       	brcs	.+10     	; 0x772 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x86>
     768:	88 30       	cpi	r24, 0x08	; 8
     76a:	a1 f4       	brne	.+40     	; 0x794 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xa8>
     76c:	80 e2       	ldi	r24, 0x20	; 32
     76e:	90 e0       	ldi	r25, 0x00	; 0
     770:	e4 cf       	rjmp	.-56     	; 0x73a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x4e>
     772:	86 30       	cpi	r24, 0x06	; 6
     774:	91 f4       	brne	.+36     	; 0x79a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xae>
     776:	8a e2       	ldi	r24, 0x2A	; 42
     778:	90 e0       	ldi	r25, 0x00	; 0
     77a:	df cf       	rjmp	.-66     	; 0x73a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x4e>
     77c:	83 e1       	ldi	r24, 0x13	; 19
     77e:	90 e0       	ldi	r25, 0x00	; 0
     780:	dc cf       	rjmp	.-72     	; 0x73a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x4e>
     782:	82 e1       	ldi	r24, 0x12	; 18
     784:	90 e0       	ldi	r25, 0x00	; 0
     786:	d9 cf       	rjmp	.-78     	; 0x73a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x4e>
     788:	87 e1       	ldi	r24, 0x17	; 23
     78a:	90 e0       	ldi	r25, 0x00	; 0
     78c:	d6 cf       	rjmp	.-84     	; 0x73a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x4e>
     78e:	8c e1       	ldi	r24, 0x1C	; 28
     790:	90 e0       	ldi	r25, 0x00	; 0
     792:	d3 cf       	rjmp	.-90     	; 0x73a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x4e>
     794:	84 e2       	ldi	r24, 0x24	; 36
     796:	90 e0       	ldi	r25, 0x00	; 0
     798:	d0 cf       	rjmp	.-96     	; 0x73a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x4e>
     79a:	83 e3       	ldi	r24, 0x33	; 51
     79c:	90 e0       	ldi	r25, 0x00	; 0
     79e:	cd cf       	rjmp	.-102    	; 0x73a <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x4e>
     7a0:	99 30       	cpi	r25, 0x09	; 9
     7a2:	48 f0       	brcs	.+18     	; 0x7b6 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xca>
     7a4:	3b 30       	cpi	r19, 0x0B	; 11
     7a6:	a0 f4       	brcc	.+40     	; 0x7d0 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xe4>
     7a8:	37 30       	cpi	r19, 0x07	; 7
     7aa:	a0 f4       	brcc	.+40     	; 0x7d4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xe8>
     7ac:	81 e0       	ldi	r24, 0x01	; 1
     7ae:	34 30       	cpi	r19, 0x04	; 4
     7b0:	08 f4       	brcc	.+2      	; 0x7b4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xc8>
     7b2:	a5 cf       	rjmp	.-182    	; 0x6fe <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x12>
     7b4:	08 95       	ret
     7b6:	95 30       	cpi	r25, 0x05	; 5
     7b8:	30 f0       	brcs	.+12     	; 0x7c6 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xda>
     7ba:	36 30       	cpi	r19, 0x06	; 6
     7bc:	58 f4       	brcc	.+22     	; 0x7d4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xe8>
     7be:	81 e0       	ldi	r24, 0x01	; 1
     7c0:	23 30       	cpi	r18, 0x03	; 3
     7c2:	c0 f7       	brcc	.-16     	; 0x7b4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xc8>
     7c4:	9c cf       	rjmp	.-200    	; 0x6fe <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0x12>
     7c6:	93 30       	cpi	r25, 0x03	; 3
     7c8:	d0 f7       	brcc	.-12     	; 0x7be <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xd2>
     7ca:	83 2f       	mov	r24, r19
     7cc:	86 95       	lsr	r24
     7ce:	08 95       	ret
     7d0:	83 e0       	ldi	r24, 0x03	; 3
     7d2:	08 95       	ret
     7d4:	82 e0       	ldi	r24, 0x02	; 2
     7d6:	ee cf       	rjmp	.-36     	; 0x7b4 <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51+0xc8>

000007d8 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50>:
     7d8:	8f b7       	in	r24, 0x3f	; 63
     7da:	f8 94       	cli
     7dc:	90 91 82 03 	lds	r25, 0x0382	; 0x800382 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1a>
     7e0:	20 91 81 03 	lds	r18, 0x0381	; 0x800381 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x19>
     7e4:	29 17       	cp	r18, r25
     7e6:	18 f0       	brcs	.+6      	; 0x7ee <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x16>
     7e8:	8f bf       	out	0x3f, r24	; 63
     7ea:	80 e0       	ldi	r24, 0x00	; 0
     7ec:	08 95       	ret
     7ee:	39 2f       	mov	r19, r25
     7f0:	32 1b       	sub	r19, r18
     7f2:	23 2f       	mov	r18, r19
     7f4:	8f bf       	out	0x3f, r24	; 63
     7f6:	80 e0       	ldi	r24, 0x00	; 0
     7f8:	9d 31       	cpi	r25, 0x1D	; 29
     7fa:	40 f4       	brcc	.+16     	; 0x80c <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x34>
     7fc:	9d 30       	cpi	r25, 0x0D	; 13
     7fe:	08 f4       	brcc	.+2      	; 0x802 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x2a>
     800:	45 c0       	rjmp	.+138    	; 0x88c <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xb4>
     802:	83 2f       	mov	r24, r19
     804:	86 95       	lsr	r24
     806:	86 95       	lsr	r24
     808:	08 95       	ret
     80a:	83 2f       	mov	r24, r19
     80c:	96 95       	lsr	r25
     80e:	31 e0       	ldi	r19, 0x01	; 1
     810:	38 0f       	add	r19, r24
     812:	91 11       	cpse	r25, r1
     814:	fa cf       	rjmp	.-12     	; 0x80a <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x32>
     816:	8d 30       	cpi	r24, 0x0D	; 13
     818:	68 f0       	brcs	.+26     	; 0x834 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x5c>
     81a:	8d 30       	cpi	r24, 0x0D	; 13
     81c:	29 f1       	breq	.+74     	; 0x868 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x90>
     81e:	8e 30       	cpi	r24, 0x0E	; 14
     820:	31 f1       	breq	.+76     	; 0x86e <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x96>
     822:	81 e1       	ldi	r24, 0x11	; 17
     824:	90 e0       	ldi	r25, 0x00	; 0
     826:	28 9f       	mul	r18, r24
     828:	a0 01       	movw	r20, r0
     82a:	29 9f       	mul	r18, r25
     82c:	50 0d       	add	r21, r0
     82e:	11 24       	eor	r1, r1
     830:	85 2f       	mov	r24, r21
     832:	08 95       	ret
     834:	89 30       	cpi	r24, 0x09	; 9
     836:	60 f0       	brcs	.+24     	; 0x850 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x78>
     838:	8b 30       	cpi	r24, 0x0B	; 11
     83a:	28 f0       	brcs	.+10     	; 0x846 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x6e>
     83c:	8c 30       	cpi	r24, 0x0C	; 12
     83e:	d1 f4       	brne	.+52     	; 0x874 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x9c>
     840:	85 e1       	ldi	r24, 0x15	; 21
     842:	90 e0       	ldi	r25, 0x00	; 0
     844:	f0 cf       	rjmp	.-32     	; 0x826 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x4e>
     846:	8a 30       	cpi	r24, 0x0A	; 10
     848:	c1 f4       	brne	.+48     	; 0x87a <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xa2>
     84a:	89 e1       	ldi	r24, 0x19	; 25
     84c:	90 e0       	ldi	r25, 0x00	; 0
     84e:	eb cf       	rjmp	.-42     	; 0x826 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x4e>
     850:	87 30       	cpi	r24, 0x07	; 7
     852:	28 f0       	brcs	.+10     	; 0x85e <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x86>
     854:	88 30       	cpi	r24, 0x08	; 8
     856:	a1 f4       	brne	.+40     	; 0x880 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xa8>
     858:	80 e2       	ldi	r24, 0x20	; 32
     85a:	90 e0       	ldi	r25, 0x00	; 0
     85c:	e4 cf       	rjmp	.-56     	; 0x826 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x4e>
     85e:	86 30       	cpi	r24, 0x06	; 6
     860:	91 f4       	brne	.+36     	; 0x886 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xae>
     862:	8a e2       	ldi	r24, 0x2A	; 42
     864:	90 e0       	ldi	r25, 0x00	; 0
     866:	df cf       	rjmp	.-66     	; 0x826 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x4e>
     868:	83 e1       	ldi	r24, 0x13	; 19
     86a:	90 e0       	ldi	r25, 0x00	; 0
     86c:	dc cf       	rjmp	.-72     	; 0x826 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x4e>
     86e:	82 e1       	ldi	r24, 0x12	; 18
     870:	90 e0       	ldi	r25, 0x00	; 0
     872:	d9 cf       	rjmp	.-78     	; 0x826 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x4e>
     874:	87 e1       	ldi	r24, 0x17	; 23
     876:	90 e0       	ldi	r25, 0x00	; 0
     878:	d6 cf       	rjmp	.-84     	; 0x826 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x4e>
     87a:	8c e1       	ldi	r24, 0x1C	; 28
     87c:	90 e0       	ldi	r25, 0x00	; 0
     87e:	d3 cf       	rjmp	.-90     	; 0x826 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x4e>
     880:	84 e2       	ldi	r24, 0x24	; 36
     882:	90 e0       	ldi	r25, 0x00	; 0
     884:	d0 cf       	rjmp	.-96     	; 0x826 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x4e>
     886:	83 e3       	ldi	r24, 0x33	; 51
     888:	90 e0       	ldi	r25, 0x00	; 0
     88a:	cd cf       	rjmp	.-102    	; 0x826 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x4e>
     88c:	99 30       	cpi	r25, 0x09	; 9
     88e:	48 f0       	brcs	.+18     	; 0x8a2 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xca>
     890:	3b 30       	cpi	r19, 0x0B	; 11
     892:	a0 f4       	brcc	.+40     	; 0x8bc <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xe4>
     894:	37 30       	cpi	r19, 0x07	; 7
     896:	a0 f4       	brcc	.+40     	; 0x8c0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xe8>
     898:	81 e0       	ldi	r24, 0x01	; 1
     89a:	34 30       	cpi	r19, 0x04	; 4
     89c:	08 f4       	brcc	.+2      	; 0x8a0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xc8>
     89e:	a5 cf       	rjmp	.-182    	; 0x7ea <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x12>
     8a0:	08 95       	ret
     8a2:	95 30       	cpi	r25, 0x05	; 5
     8a4:	30 f0       	brcs	.+12     	; 0x8b2 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xda>
     8a6:	36 30       	cpi	r19, 0x06	; 6
     8a8:	58 f4       	brcc	.+22     	; 0x8c0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xe8>
     8aa:	81 e0       	ldi	r24, 0x01	; 1
     8ac:	23 30       	cpi	r18, 0x03	; 3
     8ae:	c0 f7       	brcc	.-16     	; 0x8a0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xc8>
     8b0:	9c cf       	rjmp	.-200    	; 0x7ea <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0x12>
     8b2:	93 30       	cpi	r25, 0x03	; 3
     8b4:	d0 f7       	brcc	.-12     	; 0x8aa <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xd2>
     8b6:	83 2f       	mov	r24, r19
     8b8:	86 95       	lsr	r24
     8ba:	08 95       	ret
     8bc:	83 e0       	ldi	r24, 0x03	; 3
     8be:	08 95       	ret
     8c0:	82 e0       	ldi	r24, 0x02	; 2
     8c2:	ee cf       	rjmp	.-36     	; 0x8a0 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50+0xc8>

000008c4 <pinMode.constprop.43>:
     8c4:	90 e0       	ldi	r25, 0x00	; 0
     8c6:	fc 01       	movw	r30, r24
     8c8:	e6 5a       	subi	r30, 0xA6	; 166
     8ca:	fb 4f       	sbci	r31, 0xFB	; 251
     8cc:	24 91       	lpm	r18, Z
     8ce:	8a 5b       	subi	r24, 0xBA	; 186
     8d0:	9b 4f       	sbci	r25, 0xFB	; 251
     8d2:	fc 01       	movw	r30, r24
     8d4:	84 91       	lpm	r24, Z
     8d6:	88 23       	and	r24, r24
     8d8:	99 f0       	breq	.+38     	; 0x900 <__stack+0x1>
     8da:	90 e0       	ldi	r25, 0x00	; 0
     8dc:	88 0f       	add	r24, r24
     8de:	99 1f       	adc	r25, r25
     8e0:	fc 01       	movw	r30, r24
     8e2:	e4 5c       	subi	r30, 0xC4	; 196
     8e4:	fb 4f       	sbci	r31, 0xFB	; 251
     8e6:	a5 91       	lpm	r26, Z+
     8e8:	b4 91       	lpm	r27, Z
     8ea:	fc 01       	movw	r30, r24
     8ec:	ee 5c       	subi	r30, 0xCE	; 206
     8ee:	fb 4f       	sbci	r31, 0xFB	; 251
     8f0:	85 91       	lpm	r24, Z+
     8f2:	94 91       	lpm	r25, Z
     8f4:	8f b7       	in	r24, 0x3f	; 63
     8f6:	f8 94       	cli
     8f8:	ec 91       	ld	r30, X
     8fa:	e2 2b       	or	r30, r18
     8fc:	ec 93       	st	X, r30
     8fe:	8f bf       	out	0x3f, r24	; 63
     900:	08 95       	ret

00000902 <_ZN7TwoWire16onRequestServiceEv>:
     902:	08 95       	ret

00000904 <_ZN7TwoWire16onReceiveServiceEPhi>:
     904:	08 95       	ret

00000906 <_ZN14HardwareSerial17availableForWriteEv>:
     906:	fc 01       	movw	r30, r24
     908:	53 8d       	ldd	r21, Z+27	; 0x1b
     90a:	44 8d       	ldd	r20, Z+28	; 0x1c
     90c:	25 2f       	mov	r18, r21
     90e:	30 e0       	ldi	r19, 0x00	; 0
     910:	84 2f       	mov	r24, r20
     912:	90 e0       	ldi	r25, 0x00	; 0
     914:	82 1b       	sub	r24, r18
     916:	93 0b       	sbc	r25, r19
     918:	54 17       	cp	r21, r20
     91a:	10 f0       	brcs	.+4      	; 0x920 <_ZN14HardwareSerial17availableForWriteEv+0x1a>
     91c:	cf 96       	adiw	r24, 0x3f	; 63
     91e:	08 95       	ret
     920:	01 97       	sbiw	r24, 0x01	; 1
     922:	08 95       	ret

00000924 <_ZN14HardwareSerial4readEv>:
     924:	fc 01       	movw	r30, r24
     926:	91 8d       	ldd	r25, Z+25	; 0x19
     928:	82 8d       	ldd	r24, Z+26	; 0x1a
     92a:	98 17       	cp	r25, r24
     92c:	61 f0       	breq	.+24     	; 0x946 <_ZN14HardwareSerial4readEv+0x22>
     92e:	a2 8d       	ldd	r26, Z+26	; 0x1a
     930:	ae 0f       	add	r26, r30
     932:	bf 2f       	mov	r27, r31
     934:	b1 1d       	adc	r27, r1
     936:	5d 96       	adiw	r26, 0x1d	; 29
     938:	8c 91       	ld	r24, X
     93a:	92 8d       	ldd	r25, Z+26	; 0x1a
     93c:	9f 5f       	subi	r25, 0xFF	; 255
     93e:	9f 73       	andi	r25, 0x3F	; 63
     940:	92 8f       	std	Z+26, r25	; 0x1a
     942:	90 e0       	ldi	r25, 0x00	; 0
     944:	08 95       	ret
     946:	8f ef       	ldi	r24, 0xFF	; 255
     948:	9f ef       	ldi	r25, 0xFF	; 255
     94a:	08 95       	ret

0000094c <_ZN14HardwareSerial4peekEv>:
     94c:	fc 01       	movw	r30, r24
     94e:	91 8d       	ldd	r25, Z+25	; 0x19
     950:	82 8d       	ldd	r24, Z+26	; 0x1a
     952:	98 17       	cp	r25, r24
     954:	31 f0       	breq	.+12     	; 0x962 <_ZN14HardwareSerial4peekEv+0x16>
     956:	82 8d       	ldd	r24, Z+26	; 0x1a
     958:	e8 0f       	add	r30, r24
     95a:	f1 1d       	adc	r31, r1
     95c:	85 8d       	ldd	r24, Z+29	; 0x1d
     95e:	90 e0       	ldi	r25, 0x00	; 0
     960:	08 95       	ret
     962:	8f ef       	ldi	r24, 0xFF	; 255
     964:	9f ef       	ldi	r25, 0xFF	; 255
     966:	08 95       	ret

00000968 <_ZN14HardwareSerial9availableEv>:
     968:	fc 01       	movw	r30, r24
     96a:	91 8d       	ldd	r25, Z+25	; 0x19
     96c:	22 8d       	ldd	r18, Z+26	; 0x1a
     96e:	89 2f       	mov	r24, r25
     970:	90 e0       	ldi	r25, 0x00	; 0
     972:	80 5c       	subi	r24, 0xC0	; 192
     974:	9f 4f       	sbci	r25, 0xFF	; 255
     976:	82 1b       	sub	r24, r18
     978:	91 09       	sbc	r25, r1
     97a:	8f 73       	andi	r24, 0x3F	; 63
     97c:	99 27       	eor	r25, r25
     97e:	08 95       	ret

00000980 <_ZN14HardwareSerial17_tx_udr_empty_irqEv>:
     980:	fc 01       	movw	r30, r24
     982:	a4 8d       	ldd	r26, Z+28	; 0x1c
     984:	a8 0f       	add	r26, r24
     986:	b9 2f       	mov	r27, r25
     988:	b1 1d       	adc	r27, r1
     98a:	a3 5a       	subi	r26, 0xA3	; 163
     98c:	bf 4f       	sbci	r27, 0xFF	; 255
     98e:	2c 91       	ld	r18, X
     990:	84 8d       	ldd	r24, Z+28	; 0x1c
     992:	90 e0       	ldi	r25, 0x00	; 0
     994:	01 96       	adiw	r24, 0x01	; 1
     996:	8f 73       	andi	r24, 0x3F	; 63
     998:	99 27       	eor	r25, r25
     99a:	84 8f       	std	Z+28, r24	; 0x1c
     99c:	a6 89       	ldd	r26, Z+22	; 0x16
     99e:	b7 89       	ldd	r27, Z+23	; 0x17
     9a0:	2c 93       	st	X, r18
     9a2:	a0 89       	ldd	r26, Z+16	; 0x10
     9a4:	b1 89       	ldd	r27, Z+17	; 0x11
     9a6:	8c 91       	ld	r24, X
     9a8:	83 70       	andi	r24, 0x03	; 3
     9aa:	80 64       	ori	r24, 0x40	; 64
     9ac:	8c 93       	st	X, r24
     9ae:	93 8d       	ldd	r25, Z+27	; 0x1b
     9b0:	84 8d       	ldd	r24, Z+28	; 0x1c
     9b2:	98 13       	cpse	r25, r24
     9b4:	06 c0       	rjmp	.+12     	; 0x9c2 <_ZN14HardwareSerial17_tx_udr_empty_irqEv+0x42>
     9b6:	02 88       	ldd	r0, Z+18	; 0x12
     9b8:	f3 89       	ldd	r31, Z+19	; 0x13
     9ba:	e0 2d       	mov	r30, r0
     9bc:	80 81       	ld	r24, Z
     9be:	8f 7d       	andi	r24, 0xDF	; 223
     9c0:	80 83       	st	Z, r24
     9c2:	08 95       	ret

000009c4 <_ZN14HardwareSerial5writeEh>:
     9c4:	ef 92       	push	r14
     9c6:	ff 92       	push	r15
     9c8:	0f 93       	push	r16
     9ca:	1f 93       	push	r17
     9cc:	cf 93       	push	r28
     9ce:	df 93       	push	r29
     9d0:	ec 01       	movw	r28, r24
     9d2:	81 e0       	ldi	r24, 0x01	; 1
     9d4:	88 8f       	std	Y+24, r24	; 0x18
     9d6:	9b 8d       	ldd	r25, Y+27	; 0x1b
     9d8:	8c 8d       	ldd	r24, Y+28	; 0x1c
     9da:	98 13       	cpse	r25, r24
     9dc:	1a c0       	rjmp	.+52     	; 0xa12 <_ZN14HardwareSerial5writeEh+0x4e>
     9de:	e8 89       	ldd	r30, Y+16	; 0x10
     9e0:	f9 89       	ldd	r31, Y+17	; 0x11
     9e2:	80 81       	ld	r24, Z
     9e4:	85 ff       	sbrs	r24, 5
     9e6:	15 c0       	rjmp	.+42     	; 0xa12 <_ZN14HardwareSerial5writeEh+0x4e>
     9e8:	9f b7       	in	r25, 0x3f	; 63
     9ea:	f8 94       	cli
     9ec:	ee 89       	ldd	r30, Y+22	; 0x16
     9ee:	ff 89       	ldd	r31, Y+23	; 0x17
     9f0:	60 83       	st	Z, r22
     9f2:	e8 89       	ldd	r30, Y+16	; 0x10
     9f4:	f9 89       	ldd	r31, Y+17	; 0x11
     9f6:	80 81       	ld	r24, Z
     9f8:	83 70       	andi	r24, 0x03	; 3
     9fa:	80 64       	ori	r24, 0x40	; 64
     9fc:	80 83       	st	Z, r24
     9fe:	9f bf       	out	0x3f, r25	; 63
     a00:	81 e0       	ldi	r24, 0x01	; 1
     a02:	90 e0       	ldi	r25, 0x00	; 0
     a04:	df 91       	pop	r29
     a06:	cf 91       	pop	r28
     a08:	1f 91       	pop	r17
     a0a:	0f 91       	pop	r16
     a0c:	ff 90       	pop	r15
     a0e:	ef 90       	pop	r14
     a10:	08 95       	ret
     a12:	f6 2e       	mov	r15, r22
     a14:	0b 8d       	ldd	r16, Y+27	; 0x1b
     a16:	10 e0       	ldi	r17, 0x00	; 0
     a18:	0f 5f       	subi	r16, 0xFF	; 255
     a1a:	1f 4f       	sbci	r17, 0xFF	; 255
     a1c:	0f 73       	andi	r16, 0x3F	; 63
     a1e:	11 27       	eor	r17, r17
     a20:	e0 2e       	mov	r14, r16
     a22:	8c 8d       	ldd	r24, Y+28	; 0x1c
     a24:	8e 11       	cpse	r24, r14
     a26:	0c c0       	rjmp	.+24     	; 0xa40 <_ZN14HardwareSerial5writeEh+0x7c>
     a28:	0f b6       	in	r0, 0x3f	; 63
     a2a:	07 fc       	sbrc	r0, 7
     a2c:	fa cf       	rjmp	.-12     	; 0xa22 <_ZN14HardwareSerial5writeEh+0x5e>
     a2e:	e8 89       	ldd	r30, Y+16	; 0x10
     a30:	f9 89       	ldd	r31, Y+17	; 0x11
     a32:	80 81       	ld	r24, Z
     a34:	85 ff       	sbrs	r24, 5
     a36:	f5 cf       	rjmp	.-22     	; 0xa22 <_ZN14HardwareSerial5writeEh+0x5e>
     a38:	ce 01       	movw	r24, r28
     a3a:	0e 94 c0 04 	call	0x980	; 0x980 <_ZN14HardwareSerial17_tx_udr_empty_irqEv>
     a3e:	f1 cf       	rjmp	.-30     	; 0xa22 <_ZN14HardwareSerial5writeEh+0x5e>
     a40:	eb 8d       	ldd	r30, Y+27	; 0x1b
     a42:	ec 0f       	add	r30, r28
     a44:	fd 2f       	mov	r31, r29
     a46:	f1 1d       	adc	r31, r1
     a48:	e3 5a       	subi	r30, 0xA3	; 163
     a4a:	ff 4f       	sbci	r31, 0xFF	; 255
     a4c:	f0 82       	st	Z, r15
     a4e:	9f b7       	in	r25, 0x3f	; 63
     a50:	f8 94       	cli
     a52:	0b 8f       	std	Y+27, r16	; 0x1b
     a54:	ea 89       	ldd	r30, Y+18	; 0x12
     a56:	fb 89       	ldd	r31, Y+19	; 0x13
     a58:	80 81       	ld	r24, Z
     a5a:	80 62       	ori	r24, 0x20	; 32
     a5c:	cf cf       	rjmp	.-98     	; 0x9fc <_ZN14HardwareSerial5writeEh+0x38>

00000a5e <_ZN5Print5printEPK19__FlashStringHelper.constprop.108>:
     a5e:	0f 93       	push	r16
     a60:	1f 93       	push	r17
     a62:	cf 93       	push	r28
     a64:	df 93       	push	r29
     a66:	8c 01       	movw	r16, r24
     a68:	d0 e0       	ldi	r29, 0x00	; 0
     a6a:	c0 e0       	ldi	r28, 0x00	; 0
     a6c:	f8 01       	movw	r30, r16
     a6e:	ec 0f       	add	r30, r28
     a70:	fd 1f       	adc	r31, r29
     a72:	64 91       	lpm	r22, Z
     a74:	66 23       	and	r22, r22
     a76:	41 f0       	breq	.+16     	; 0xa88 <_ZN5Print5printEPK19__FlashStringHelper.constprop.108+0x2a>
     a78:	89 e5       	ldi	r24, 0x59	; 89
     a7a:	94 e0       	ldi	r25, 0x04	; 4
     a7c:	0e 94 e2 04 	call	0x9c4	; 0x9c4 <_ZN14HardwareSerial5writeEh>
     a80:	89 2b       	or	r24, r25
     a82:	11 f0       	breq	.+4      	; 0xa88 <_ZN5Print5printEPK19__FlashStringHelper.constprop.108+0x2a>
     a84:	21 96       	adiw	r28, 0x01	; 1
     a86:	f2 cf       	rjmp	.-28     	; 0xa6c <_ZN5Print5printEPK19__FlashStringHelper.constprop.108+0xe>
     a88:	ce 01       	movw	r24, r28
     a8a:	df 91       	pop	r29
     a8c:	cf 91       	pop	r28
     a8e:	1f 91       	pop	r17
     a90:	0f 91       	pop	r16
     a92:	08 95       	ret

00000a94 <_ZN14HardwareSerial5flushEv>:
     a94:	cf 93       	push	r28
     a96:	df 93       	push	r29
     a98:	ec 01       	movw	r28, r24
     a9a:	88 8d       	ldd	r24, Y+24	; 0x18
     a9c:	88 23       	and	r24, r24
     a9e:	b9 f0       	breq	.+46     	; 0xace <_ZN14HardwareSerial5flushEv+0x3a>
     aa0:	aa 89       	ldd	r26, Y+18	; 0x12
     aa2:	bb 89       	ldd	r27, Y+19	; 0x13
     aa4:	e8 89       	ldd	r30, Y+16	; 0x10
     aa6:	f9 89       	ldd	r31, Y+17	; 0x11
     aa8:	8c 91       	ld	r24, X
     aaa:	85 fd       	sbrc	r24, 5
     aac:	03 c0       	rjmp	.+6      	; 0xab4 <_ZN14HardwareSerial5flushEv+0x20>
     aae:	80 81       	ld	r24, Z
     ab0:	86 fd       	sbrc	r24, 6
     ab2:	0d c0       	rjmp	.+26     	; 0xace <_ZN14HardwareSerial5flushEv+0x3a>
     ab4:	0f b6       	in	r0, 0x3f	; 63
     ab6:	07 fc       	sbrc	r0, 7
     ab8:	f7 cf       	rjmp	.-18     	; 0xaa8 <_ZN14HardwareSerial5flushEv+0x14>
     aba:	8c 91       	ld	r24, X
     abc:	85 ff       	sbrs	r24, 5
     abe:	f2 cf       	rjmp	.-28     	; 0xaa4 <_ZN14HardwareSerial5flushEv+0x10>
     ac0:	80 81       	ld	r24, Z
     ac2:	85 ff       	sbrs	r24, 5
     ac4:	ed cf       	rjmp	.-38     	; 0xaa0 <_ZN14HardwareSerial5flushEv+0xc>
     ac6:	ce 01       	movw	r24, r28
     ac8:	0e 94 c0 04 	call	0x980	; 0x980 <_ZN14HardwareSerial17_tx_udr_empty_irqEv>
     acc:	e9 cf       	rjmp	.-46     	; 0xaa0 <_ZN14HardwareSerial5flushEv+0xc>
     ace:	df 91       	pop	r29
     ad0:	cf 91       	pop	r28
     ad2:	08 95       	ret

00000ad4 <_Z17Serial0_availablev>:
     ad4:	89 e5       	ldi	r24, 0x59	; 89
     ad6:	94 e0       	ldi	r25, 0x04	; 4
     ad8:	0e 94 b4 04 	call	0x968	; 0x968 <_ZN14HardwareSerial9availableEv>
     adc:	21 e0       	ldi	r18, 0x01	; 1
     ade:	89 2b       	or	r24, r25
     ae0:	09 f4       	brne	.+2      	; 0xae4 <_Z17Serial0_availablev+0x10>
     ae2:	20 e0       	ldi	r18, 0x00	; 0
     ae4:	82 2f       	mov	r24, r18
     ae6:	08 95       	ret

00000ae8 <_Z14serialEventRunv>:
     ae8:	80 e0       	ldi	r24, 0x00	; 0
     aea:	90 e0       	ldi	r25, 0x00	; 0
     aec:	89 2b       	or	r24, r25
     aee:	29 f0       	breq	.+10     	; 0xafa <_Z14serialEventRunv+0x12>
     af0:	0e 94 6a 05 	call	0xad4	; 0xad4 <_Z17Serial0_availablev>
     af4:	81 11       	cpse	r24, r1
     af6:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>
     afa:	08 95       	ret

00000afc <digitalWrite>:
     afc:	90 e0       	ldi	r25, 0x00	; 0
     afe:	fc 01       	movw	r30, r24
     b00:	ed 5e       	subi	r30, 0xED	; 237
     b02:	fb 4f       	sbci	r31, 0xFB	; 251
     b04:	24 91       	lpm	r18, Z
     b06:	fc 01       	movw	r30, r24
     b08:	e6 5a       	subi	r30, 0xA6	; 166
     b0a:	fb 4f       	sbci	r31, 0xFB	; 251
     b0c:	34 91       	lpm	r19, Z
     b0e:	fc 01       	movw	r30, r24
     b10:	ea 5b       	subi	r30, 0xBA	; 186
     b12:	fb 4f       	sbci	r31, 0xFB	; 251
     b14:	e4 91       	lpm	r30, Z
     b16:	ee 23       	and	r30, r30
     b18:	c9 f0       	breq	.+50     	; 0xb4c <digitalWrite+0x50>
     b1a:	22 23       	and	r18, r18
     b1c:	39 f0       	breq	.+14     	; 0xb2c <digitalWrite+0x30>
     b1e:	23 30       	cpi	r18, 0x03	; 3
     b20:	01 f1       	breq	.+64     	; 0xb62 <digitalWrite+0x66>
     b22:	a8 f4       	brcc	.+42     	; 0xb4e <digitalWrite+0x52>
     b24:	21 30       	cpi	r18, 0x01	; 1
     b26:	19 f1       	breq	.+70     	; 0xb6e <digitalWrite+0x72>
     b28:	22 30       	cpi	r18, 0x02	; 2
     b2a:	29 f1       	breq	.+74     	; 0xb76 <digitalWrite+0x7a>
     b2c:	f0 e0       	ldi	r31, 0x00	; 0
     b2e:	ee 0f       	add	r30, r30
     b30:	ff 1f       	adc	r31, r31
     b32:	ee 5c       	subi	r30, 0xCE	; 206
     b34:	fb 4f       	sbci	r31, 0xFB	; 251
     b36:	a5 91       	lpm	r26, Z+
     b38:	b4 91       	lpm	r27, Z
     b3a:	8f b7       	in	r24, 0x3f	; 63
     b3c:	f8 94       	cli
     b3e:	ec 91       	ld	r30, X
     b40:	61 11       	cpse	r22, r1
     b42:	26 c0       	rjmp	.+76     	; 0xb90 <digitalWrite+0x94>
     b44:	30 95       	com	r19
     b46:	3e 23       	and	r19, r30
     b48:	3c 93       	st	X, r19
     b4a:	8f bf       	out	0x3f, r24	; 63
     b4c:	08 95       	ret
     b4e:	27 30       	cpi	r18, 0x07	; 7
     b50:	a9 f0       	breq	.+42     	; 0xb7c <digitalWrite+0x80>
     b52:	28 30       	cpi	r18, 0x08	; 8
     b54:	c9 f0       	breq	.+50     	; 0xb88 <digitalWrite+0x8c>
     b56:	24 30       	cpi	r18, 0x04	; 4
     b58:	49 f7       	brne	.-46     	; 0xb2c <digitalWrite+0x30>
     b5a:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
     b5e:	8f 7d       	andi	r24, 0xDF	; 223
     b60:	03 c0       	rjmp	.+6      	; 0xb68 <digitalWrite+0x6c>
     b62:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
     b66:	8f 77       	andi	r24, 0x7F	; 127
     b68:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
     b6c:	df cf       	rjmp	.-66     	; 0xb2c <digitalWrite+0x30>
     b6e:	84 b5       	in	r24, 0x24	; 36
     b70:	8f 77       	andi	r24, 0x7F	; 127
     b72:	84 bd       	out	0x24, r24	; 36
     b74:	db cf       	rjmp	.-74     	; 0xb2c <digitalWrite+0x30>
     b76:	84 b5       	in	r24, 0x24	; 36
     b78:	8f 7d       	andi	r24, 0xDF	; 223
     b7a:	fb cf       	rjmp	.-10     	; 0xb72 <digitalWrite+0x76>
     b7c:	80 91 b0 00 	lds	r24, 0x00B0	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
     b80:	8f 77       	andi	r24, 0x7F	; 127
     b82:	80 93 b0 00 	sts	0x00B0, r24	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
     b86:	d2 cf       	rjmp	.-92     	; 0xb2c <digitalWrite+0x30>
     b88:	80 91 b0 00 	lds	r24, 0x00B0	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
     b8c:	8f 7d       	andi	r24, 0xDF	; 223
     b8e:	f9 cf       	rjmp	.-14     	; 0xb82 <digitalWrite+0x86>
     b90:	3e 2b       	or	r19, r30
     b92:	da cf       	rjmp	.-76     	; 0xb48 <digitalWrite+0x4c>

00000b94 <micros>:
     b94:	3f b7       	in	r19, 0x3f	; 63
     b96:	f8 94       	cli
     b98:	80 91 d6 02 	lds	r24, 0x02D6	; 0x8002d6 <timer0_overflow_count>
     b9c:	90 91 d7 02 	lds	r25, 0x02D7	; 0x8002d7 <timer0_overflow_count+0x1>
     ba0:	a0 91 d8 02 	lds	r26, 0x02D8	; 0x8002d8 <timer0_overflow_count+0x2>
     ba4:	b0 91 d9 02 	lds	r27, 0x02D9	; 0x8002d9 <timer0_overflow_count+0x3>
     ba8:	26 b5       	in	r18, 0x26	; 38
     baa:	a8 9b       	sbis	0x15, 0	; 21
     bac:	05 c0       	rjmp	.+10     	; 0xbb8 <micros+0x24>
     bae:	2f 3f       	cpi	r18, 0xFF	; 255
     bb0:	19 f0       	breq	.+6      	; 0xbb8 <micros+0x24>
     bb2:	01 96       	adiw	r24, 0x01	; 1
     bb4:	a1 1d       	adc	r26, r1
     bb6:	b1 1d       	adc	r27, r1
     bb8:	3f bf       	out	0x3f, r19	; 63
     bba:	ba 2f       	mov	r27, r26
     bbc:	a9 2f       	mov	r26, r25
     bbe:	98 2f       	mov	r25, r24
     bc0:	88 27       	eor	r24, r24
     bc2:	bc 01       	movw	r22, r24
     bc4:	cd 01       	movw	r24, r26
     bc6:	62 0f       	add	r22, r18
     bc8:	71 1d       	adc	r23, r1
     bca:	81 1d       	adc	r24, r1
     bcc:	91 1d       	adc	r25, r1
     bce:	42 e0       	ldi	r20, 0x02	; 2
     bd0:	66 0f       	add	r22, r22
     bd2:	77 1f       	adc	r23, r23
     bd4:	88 1f       	adc	r24, r24
     bd6:	99 1f       	adc	r25, r25
     bd8:	4a 95       	dec	r20
     bda:	d1 f7       	brne	.-12     	; 0xbd0 <micros+0x3c>
     bdc:	08 95       	ret

00000bde <_ZN5Print5writeEPKhj>:
     bde:	af 92       	push	r10
     be0:	bf 92       	push	r11
     be2:	cf 92       	push	r12
     be4:	df 92       	push	r13
     be6:	ef 92       	push	r14
     be8:	ff 92       	push	r15
     bea:	0f 93       	push	r16
     bec:	1f 93       	push	r17
     bee:	cf 93       	push	r28
     bf0:	df 93       	push	r29
     bf2:	6c 01       	movw	r12, r24
     bf4:	7b 01       	movw	r14, r22
     bf6:	8b 01       	movw	r16, r22
     bf8:	04 0f       	add	r16, r20
     bfa:	15 1f       	adc	r17, r21
     bfc:	eb 01       	movw	r28, r22
     bfe:	5e 01       	movw	r10, r28
     c00:	ae 18       	sub	r10, r14
     c02:	bf 08       	sbc	r11, r15
     c04:	c0 17       	cp	r28, r16
     c06:	d1 07       	cpc	r29, r17
     c08:	59 f0       	breq	.+22     	; 0xc20 <_ZN5Print5writeEPKhj+0x42>
     c0a:	69 91       	ld	r22, Y+
     c0c:	d6 01       	movw	r26, r12
     c0e:	ed 91       	ld	r30, X+
     c10:	fc 91       	ld	r31, X
     c12:	01 90       	ld	r0, Z+
     c14:	f0 81       	ld	r31, Z
     c16:	e0 2d       	mov	r30, r0
     c18:	c6 01       	movw	r24, r12
     c1a:	09 95       	icall
     c1c:	89 2b       	or	r24, r25
     c1e:	79 f7       	brne	.-34     	; 0xbfe <_ZN5Print5writeEPKhj+0x20>
     c20:	c5 01       	movw	r24, r10
     c22:	df 91       	pop	r29
     c24:	cf 91       	pop	r28
     c26:	1f 91       	pop	r17
     c28:	0f 91       	pop	r16
     c2a:	ff 90       	pop	r15
     c2c:	ef 90       	pop	r14
     c2e:	df 90       	pop	r13
     c30:	cf 90       	pop	r12
     c32:	bf 90       	pop	r11
     c34:	af 90       	pop	r10
     c36:	08 95       	ret

00000c38 <twi_transmit>:
     c38:	20 91 89 02 	lds	r18, 0x0289	; 0x800289 <twi_txBufferLength>
     c3c:	26 0f       	add	r18, r22
     c3e:	33 27       	eor	r19, r19
     c40:	33 1f       	adc	r19, r19
     c42:	21 32       	cpi	r18, 0x21	; 33
     c44:	31 05       	cpc	r19, r1
     c46:	ec f4       	brge	.+58     	; 0xc82 <twi_transmit+0x4a>
     c48:	20 91 53 04 	lds	r18, 0x0453	; 0x800453 <twi_state>
     c4c:	fc 01       	movw	r30, r24
     c4e:	90 e0       	ldi	r25, 0x00	; 0
     c50:	80 e0       	ldi	r24, 0x00	; 0
     c52:	24 30       	cpi	r18, 0x04	; 4
     c54:	69 f0       	breq	.+26     	; 0xc70 <twi_transmit+0x38>
     c56:	82 e0       	ldi	r24, 0x02	; 2
     c58:	08 95       	ret
     c5a:	a0 91 89 02 	lds	r26, 0x0289	; 0x800289 <twi_txBufferLength>
     c5e:	21 91       	ld	r18, Z+
     c60:	ac 01       	movw	r20, r24
     c62:	47 59       	subi	r20, 0x97	; 151
     c64:	5d 4f       	sbci	r21, 0xFD	; 253
     c66:	a4 0f       	add	r26, r20
     c68:	b5 2f       	mov	r27, r21
     c6a:	b1 1d       	adc	r27, r1
     c6c:	2c 93       	st	X, r18
     c6e:	01 96       	adiw	r24, 0x01	; 1
     c70:	86 17       	cp	r24, r22
     c72:	98 f3       	brcs	.-26     	; 0xc5a <twi_transmit+0x22>
     c74:	80 91 89 02 	lds	r24, 0x0289	; 0x800289 <twi_txBufferLength>
     c78:	68 0f       	add	r22, r24
     c7a:	60 93 89 02 	sts	0x0289, r22	; 0x800289 <twi_txBufferLength>
     c7e:	80 e0       	ldi	r24, 0x00	; 0
     c80:	08 95       	ret
     c82:	81 e0       	ldi	r24, 0x01	; 1
     c84:	08 95       	ret

00000c86 <twi_init>:
     c86:	10 92 53 04 	sts	0x0453, r1	; 0x800453 <twi_state>
     c8a:	81 e0       	ldi	r24, 0x01	; 1
     c8c:	80 93 32 04 	sts	0x0432, r24	; 0x800432 <twi_sendStop>
     c90:	10 92 2d 04 	sts	0x042D, r1	; 0x80042d <twi_inRepStart>
     c94:	61 e0       	ldi	r22, 0x01	; 1
     c96:	82 e1       	ldi	r24, 0x12	; 18
     c98:	0e 94 7e 05 	call	0xafc	; 0xafc <digitalWrite>
     c9c:	61 e0       	ldi	r22, 0x01	; 1
     c9e:	83 e1       	ldi	r24, 0x13	; 19
     ca0:	0e 94 7e 05 	call	0xafc	; 0xafc <digitalWrite>
     ca4:	e9 eb       	ldi	r30, 0xB9	; 185
     ca6:	f0 e0       	ldi	r31, 0x00	; 0
     ca8:	80 81       	ld	r24, Z
     caa:	8e 7f       	andi	r24, 0xFE	; 254
     cac:	80 83       	st	Z, r24
     cae:	80 81       	ld	r24, Z
     cb0:	8d 7f       	andi	r24, 0xFD	; 253
     cb2:	80 83       	st	Z, r24
     cb4:	88 e4       	ldi	r24, 0x48	; 72
     cb6:	80 93 b8 00 	sts	0x00B8, r24	; 0x8000b8 <__TEXT_REGION_LENGTH__+0x7e00b8>
     cba:	85 e4       	ldi	r24, 0x45	; 69
     cbc:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
     cc0:	08 95       	ret

00000cc2 <_ZN7TwoWire5beginEv.constprop.17>:
     cc2:	10 92 e8 03 	sts	0x03E8, r1	; 0x8003e8 <_ZN7TwoWire13rxBufferIndexE>
     cc6:	10 92 e7 03 	sts	0x03E7, r1	; 0x8003e7 <_ZN7TwoWire14rxBufferLengthE>
     cca:	10 92 ea 03 	sts	0x03EA, r1	; 0x8003ea <_ZN7TwoWire13txBufferIndexE>
     cce:	10 92 0c 04 	sts	0x040C, r1	; 0x80040c <_ZN7TwoWire14txBufferLengthE>
     cd2:	0e 94 43 06 	call	0xc86	; 0xc86 <twi_init>
     cd6:	81 e8       	ldi	r24, 0x81	; 129
     cd8:	94 e0       	ldi	r25, 0x04	; 4
     cda:	90 93 dd 02 	sts	0x02DD, r25	; 0x8002dd <twi_onSlaveTransmit+0x1>
     cde:	80 93 dc 02 	sts	0x02DC, r24	; 0x8002dc <twi_onSlaveTransmit>
     ce2:	82 e8       	ldi	r24, 0x82	; 130
     ce4:	94 e0       	ldi	r25, 0x04	; 4
     ce6:	90 93 db 02 	sts	0x02DB, r25	; 0x8002db <twi_onSlaveReceive+0x1>
     cea:	80 93 da 02 	sts	0x02DA, r24	; 0x8002da <twi_onSlaveReceive>
     cee:	08 95       	ret

00000cf0 <twi_handleTimeout>:
     cf0:	cf 93       	push	r28
     cf2:	df 93       	push	r29
     cf4:	91 e0       	ldi	r25, 0x01	; 1
     cf6:	90 93 68 02 	sts	0x0268, r25	; 0x800268 <twi_timed_out_flag>
     cfa:	88 23       	and	r24, r24
     cfc:	b9 f0       	breq	.+46     	; 0xd2c <twi_handleTimeout+0x3c>
     cfe:	c0 91 b8 00 	lds	r28, 0x00B8	; 0x8000b8 <__TEXT_REGION_LENGTH__+0x7e00b8>
     d02:	d0 91 ba 00 	lds	r29, 0x00BA	; 0x8000ba <__TEXT_REGION_LENGTH__+0x7e00ba>
     d06:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
     d0a:	8a 7b       	andi	r24, 0xBA	; 186
     d0c:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
     d10:	60 e0       	ldi	r22, 0x00	; 0
     d12:	82 e1       	ldi	r24, 0x12	; 18
     d14:	0e 94 7e 05 	call	0xafc	; 0xafc <digitalWrite>
     d18:	60 e0       	ldi	r22, 0x00	; 0
     d1a:	83 e1       	ldi	r24, 0x13	; 19
     d1c:	0e 94 7e 05 	call	0xafc	; 0xafc <digitalWrite>
     d20:	0e 94 43 06 	call	0xc86	; 0xc86 <twi_init>
     d24:	d0 93 ba 00 	sts	0x00BA, r29	; 0x8000ba <__TEXT_REGION_LENGTH__+0x7e00ba>
     d28:	c0 93 b8 00 	sts	0x00B8, r28	; 0x8000b8 <__TEXT_REGION_LENGTH__+0x7e00b8>
     d2c:	df 91       	pop	r29
     d2e:	cf 91       	pop	r28
     d30:	08 95       	ret

00000d32 <twi_readFrom.constprop.136>:
     d32:	8f 92       	push	r8
     d34:	9f 92       	push	r9
     d36:	af 92       	push	r10
     d38:	bf 92       	push	r11
     d3a:	cf 92       	push	r12
     d3c:	df 92       	push	r13
     d3e:	ef 92       	push	r14
     d40:	ff 92       	push	r15
     d42:	0f 93       	push	r16
     d44:	1f 93       	push	r17
     d46:	cf 93       	push	r28
     d48:	df 93       	push	r29
     d4a:	d8 2f       	mov	r29, r24
     d4c:	c6 2f       	mov	r28, r22
     d4e:	14 2f       	mov	r17, r20
     d50:	61 32       	cpi	r22, 0x21	; 33
     d52:	08 f0       	brcs	.+2      	; 0xd56 <twi_readFrom.constprop.136+0x24>
     d54:	9c c0       	rjmp	.+312    	; 0xe8e <twi_readFrom.constprop.136+0x15c>
     d56:	0e 94 ca 05 	call	0xb94	; 0xb94 <micros>
     d5a:	6b 01       	movw	r12, r22
     d5c:	7c 01       	movw	r14, r24
     d5e:	80 91 53 04 	lds	r24, 0x0453	; 0x800453 <twi_state>
     d62:	81 11       	cpse	r24, r1
     d64:	6f c0       	rjmp	.+222    	; 0xe44 <twi_readFrom.constprop.136+0x112>
     d66:	81 e0       	ldi	r24, 0x01	; 1
     d68:	80 93 53 04 	sts	0x0453, r24	; 0x800453 <twi_state>
     d6c:	10 93 32 04 	sts	0x0432, r17	; 0x800432 <twi_sendStop>
     d70:	9f ef       	ldi	r25, 0xFF	; 255
     d72:	90 93 31 04 	sts	0x0431, r25	; 0x800431 <twi_error>
     d76:	10 92 30 04 	sts	0x0430, r1	; 0x800430 <twi_masterBufferIndex>
     d7a:	9c 0f       	add	r25, r28
     d7c:	90 93 2f 04 	sts	0x042F, r25	; 0x80042f <twi_masterBufferLength>
     d80:	80 93 2e 04 	sts	0x042E, r24	; 0x80042e <twi_slarw>
     d84:	80 91 2e 04 	lds	r24, 0x042E	; 0x80042e <twi_slarw>
     d88:	dd 0f       	add	r29, r29
     d8a:	d8 2b       	or	r29, r24
     d8c:	d0 93 2e 04 	sts	0x042E, r29	; 0x80042e <twi_slarw>
     d90:	80 91 2d 04 	lds	r24, 0x042D	; 0x80042d <twi_inRepStart>
     d94:	81 30       	cpi	r24, 0x01	; 1
     d96:	09 f0       	breq	.+2      	; 0xd9a <twi_readFrom.constprop.136+0x68>
     d98:	7c c0       	rjmp	.+248    	; 0xe92 <twi_readFrom.constprop.136+0x160>
     d9a:	10 92 2d 04 	sts	0x042D, r1	; 0x80042d <twi_inRepStart>
     d9e:	0e 94 ca 05 	call	0xb94	; 0xb94 <micros>
     da2:	6b 01       	movw	r12, r22
     da4:	7c 01       	movw	r14, r24
     da6:	80 91 2e 04 	lds	r24, 0x042E	; 0x80042e <twi_slarw>
     daa:	80 93 bb 00 	sts	0x00BB, r24	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
     dae:	80 91 55 04 	lds	r24, 0x0455	; 0x800455 <twi_timeout_us>
     db2:	90 91 56 04 	lds	r25, 0x0456	; 0x800456 <twi_timeout_us+0x1>
     db6:	a0 91 57 04 	lds	r26, 0x0457	; 0x800457 <twi_timeout_us+0x2>
     dba:	b0 91 58 04 	lds	r27, 0x0458	; 0x800458 <twi_timeout_us+0x3>
     dbe:	89 2b       	or	r24, r25
     dc0:	8a 2b       	or	r24, r26
     dc2:	8b 2b       	or	r24, r27
     dc4:	a1 f0       	breq	.+40     	; 0xdee <twi_readFrom.constprop.136+0xbc>
     dc6:	0e 94 ca 05 	call	0xb94	; 0xb94 <micros>
     dca:	00 91 55 04 	lds	r16, 0x0455	; 0x800455 <twi_timeout_us>
     dce:	10 91 56 04 	lds	r17, 0x0456	; 0x800456 <twi_timeout_us+0x1>
     dd2:	20 91 57 04 	lds	r18, 0x0457	; 0x800457 <twi_timeout_us+0x2>
     dd6:	30 91 58 04 	lds	r19, 0x0458	; 0x800458 <twi_timeout_us+0x3>
     dda:	6c 19       	sub	r22, r12
     ddc:	7d 09       	sbc	r23, r13
     dde:	8e 09       	sbc	r24, r14
     de0:	9f 09       	sbc	r25, r15
     de2:	06 17       	cp	r16, r22
     de4:	17 07       	cpc	r17, r23
     de6:	28 07       	cpc	r18, r24
     de8:	39 07       	cpc	r19, r25
     dea:	08 f4       	brcc	.+2      	; 0xdee <twi_readFrom.constprop.136+0xbc>
     dec:	4c c0       	rjmp	.+152    	; 0xe86 <twi_readFrom.constprop.136+0x154>
     dee:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
     df2:	83 fd       	sbrc	r24, 3
     df4:	d8 cf       	rjmp	.-80     	; 0xda6 <twi_readFrom.constprop.136+0x74>
     df6:	85 ec       	ldi	r24, 0xC5	; 197
     df8:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
     dfc:	0e 94 ca 05 	call	0xb94	; 0xb94 <micros>
     e00:	6b 01       	movw	r12, r22
     e02:	7c 01       	movw	r14, r24
     e04:	80 91 53 04 	lds	r24, 0x0453	; 0x800453 <twi_state>
     e08:	81 30       	cpi	r24, 0x01	; 1
     e0a:	09 f4       	brne	.+2      	; 0xe0e <twi_readFrom.constprop.136+0xdc>
     e0c:	44 c0       	rjmp	.+136    	; 0xe96 <twi_readFrom.constprop.136+0x164>
     e0e:	80 91 30 04 	lds	r24, 0x0430	; 0x800430 <twi_masterBufferIndex>
     e12:	8c 17       	cp	r24, r28
     e14:	10 f4       	brcc	.+4      	; 0xe1a <twi_readFrom.constprop.136+0xe8>
     e16:	c0 91 30 04 	lds	r28, 0x0430	; 0x800430 <twi_masterBufferIndex>
     e1a:	ed e0       	ldi	r30, 0x0D	; 13
     e1c:	f4 e0       	ldi	r31, 0x04	; 4
     e1e:	a3 e3       	ldi	r26, 0x33	; 51
     e20:	b4 e0       	ldi	r27, 0x04	; 4
     e22:	80 e0       	ldi	r24, 0x00	; 0
     e24:	8c 13       	cpse	r24, r28
     e26:	59 c0       	rjmp	.+178    	; 0xeda <twi_readFrom.constprop.136+0x1a8>
     e28:	8c 2f       	mov	r24, r28
     e2a:	df 91       	pop	r29
     e2c:	cf 91       	pop	r28
     e2e:	1f 91       	pop	r17
     e30:	0f 91       	pop	r16
     e32:	ff 90       	pop	r15
     e34:	ef 90       	pop	r14
     e36:	df 90       	pop	r13
     e38:	cf 90       	pop	r12
     e3a:	bf 90       	pop	r11
     e3c:	af 90       	pop	r10
     e3e:	9f 90       	pop	r9
     e40:	8f 90       	pop	r8
     e42:	08 95       	ret
     e44:	80 91 55 04 	lds	r24, 0x0455	; 0x800455 <twi_timeout_us>
     e48:	90 91 56 04 	lds	r25, 0x0456	; 0x800456 <twi_timeout_us+0x1>
     e4c:	a0 91 57 04 	lds	r26, 0x0457	; 0x800457 <twi_timeout_us+0x2>
     e50:	b0 91 58 04 	lds	r27, 0x0458	; 0x800458 <twi_timeout_us+0x3>
     e54:	89 2b       	or	r24, r25
     e56:	8a 2b       	or	r24, r26
     e58:	8b 2b       	or	r24, r27
     e5a:	09 f4       	brne	.+2      	; 0xe5e <twi_readFrom.constprop.136+0x12c>
     e5c:	80 cf       	rjmp	.-256    	; 0xd5e <twi_readFrom.constprop.136+0x2c>
     e5e:	0e 94 ca 05 	call	0xb94	; 0xb94 <micros>
     e62:	80 90 55 04 	lds	r8, 0x0455	; 0x800455 <twi_timeout_us>
     e66:	90 90 56 04 	lds	r9, 0x0456	; 0x800456 <twi_timeout_us+0x1>
     e6a:	a0 90 57 04 	lds	r10, 0x0457	; 0x800457 <twi_timeout_us+0x2>
     e6e:	b0 90 58 04 	lds	r11, 0x0458	; 0x800458 <twi_timeout_us+0x3>
     e72:	6c 19       	sub	r22, r12
     e74:	7d 09       	sbc	r23, r13
     e76:	8e 09       	sbc	r24, r14
     e78:	9f 09       	sbc	r25, r15
     e7a:	86 16       	cp	r8, r22
     e7c:	97 06       	cpc	r9, r23
     e7e:	a8 06       	cpc	r10, r24
     e80:	b9 06       	cpc	r11, r25
     e82:	08 f0       	brcs	.+2      	; 0xe86 <twi_readFrom.constprop.136+0x154>
     e84:	6c cf       	rjmp	.-296    	; 0xd5e <twi_readFrom.constprop.136+0x2c>
     e86:	80 91 54 04 	lds	r24, 0x0454	; 0x800454 <twi_do_reset_on_timeout>
     e8a:	0e 94 78 06 	call	0xcf0	; 0xcf0 <twi_handleTimeout>
     e8e:	c0 e0       	ldi	r28, 0x00	; 0
     e90:	cb cf       	rjmp	.-106    	; 0xe28 <twi_readFrom.constprop.136+0xf6>
     e92:	85 ee       	ldi	r24, 0xE5	; 229
     e94:	b1 cf       	rjmp	.-158    	; 0xdf8 <twi_readFrom.constprop.136+0xc6>
     e96:	80 91 55 04 	lds	r24, 0x0455	; 0x800455 <twi_timeout_us>
     e9a:	90 91 56 04 	lds	r25, 0x0456	; 0x800456 <twi_timeout_us+0x1>
     e9e:	a0 91 57 04 	lds	r26, 0x0457	; 0x800457 <twi_timeout_us+0x2>
     ea2:	b0 91 58 04 	lds	r27, 0x0458	; 0x800458 <twi_timeout_us+0x3>
     ea6:	89 2b       	or	r24, r25
     ea8:	8a 2b       	or	r24, r26
     eaa:	8b 2b       	or	r24, r27
     eac:	09 f4       	brne	.+2      	; 0xeb0 <twi_readFrom.constprop.136+0x17e>
     eae:	aa cf       	rjmp	.-172    	; 0xe04 <twi_readFrom.constprop.136+0xd2>
     eb0:	0e 94 ca 05 	call	0xb94	; 0xb94 <micros>
     eb4:	00 91 55 04 	lds	r16, 0x0455	; 0x800455 <twi_timeout_us>
     eb8:	10 91 56 04 	lds	r17, 0x0456	; 0x800456 <twi_timeout_us+0x1>
     ebc:	20 91 57 04 	lds	r18, 0x0457	; 0x800457 <twi_timeout_us+0x2>
     ec0:	30 91 58 04 	lds	r19, 0x0458	; 0x800458 <twi_timeout_us+0x3>
     ec4:	6c 19       	sub	r22, r12
     ec6:	7d 09       	sbc	r23, r13
     ec8:	8e 09       	sbc	r24, r14
     eca:	9f 09       	sbc	r25, r15
     ecc:	06 17       	cp	r16, r22
     ece:	17 07       	cpc	r17, r23
     ed0:	28 07       	cpc	r18, r24
     ed2:	39 07       	cpc	r19, r25
     ed4:	08 f0       	brcs	.+2      	; 0xed8 <twi_readFrom.constprop.136+0x1a6>
     ed6:	96 cf       	rjmp	.-212    	; 0xe04 <twi_readFrom.constprop.136+0xd2>
     ed8:	d6 cf       	rjmp	.-84     	; 0xe86 <twi_readFrom.constprop.136+0x154>
     eda:	91 91       	ld	r25, Z+
     edc:	9d 93       	st	X+, r25
     ede:	8f 5f       	subi	r24, 0xFF	; 255
     ee0:	a1 cf       	rjmp	.-190    	; 0xe24 <twi_readFrom.constprop.136+0xf2>

00000ee2 <_ZN7TwoWire15endTransmissionEh.constprop.133>:
     ee2:	8f 92       	push	r8
     ee4:	9f 92       	push	r9
     ee6:	af 92       	push	r10
     ee8:	bf 92       	push	r11
     eea:	cf 92       	push	r12
     eec:	df 92       	push	r13
     eee:	ef 92       	push	r14
     ef0:	ff 92       	push	r15
     ef2:	0f 93       	push	r16
     ef4:	1f 93       	push	r17
     ef6:	cf 93       	push	r28
     ef8:	df 93       	push	r29
     efa:	d0 91 0c 04 	lds	r29, 0x040C	; 0x80040c <_ZN7TwoWire14txBufferLengthE>
     efe:	d1 32       	cpi	r29, 0x21	; 33
     f00:	08 f0       	brcs	.+2      	; 0xf04 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x22>
     f02:	d7 c0       	rjmp	.+430    	; 0x10b2 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x1d0>
     f04:	18 2f       	mov	r17, r24
     f06:	c0 91 0b 04 	lds	r28, 0x040B	; 0x80040b <_ZN7TwoWire9txAddressE>
     f0a:	0e 94 ca 05 	call	0xb94	; 0xb94 <micros>
     f0e:	6b 01       	movw	r12, r22
     f10:	7c 01       	movw	r14, r24
     f12:	80 91 53 04 	lds	r24, 0x0453	; 0x800453 <twi_state>
     f16:	81 11       	cpse	r24, r1
     f18:	6b c0       	rjmp	.+214    	; 0xff0 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x10e>
     f1a:	82 e0       	ldi	r24, 0x02	; 2
     f1c:	80 93 53 04 	sts	0x0453, r24	; 0x800453 <twi_state>
     f20:	10 93 32 04 	sts	0x0432, r17	; 0x800432 <twi_sendStop>
     f24:	8f ef       	ldi	r24, 0xFF	; 255
     f26:	80 93 31 04 	sts	0x0431, r24	; 0x800431 <twi_error>
     f2a:	10 92 30 04 	sts	0x0430, r1	; 0x800430 <twi_masterBufferIndex>
     f2e:	d0 93 2f 04 	sts	0x042F, r29	; 0x80042f <twi_masterBufferLength>
     f32:	ab ee       	ldi	r26, 0xEB	; 235
     f34:	b3 e0       	ldi	r27, 0x03	; 3
     f36:	ed e0       	ldi	r30, 0x0D	; 13
     f38:	f4 e0       	ldi	r31, 0x04	; 4
     f3a:	80 e0       	ldi	r24, 0x00	; 0
     f3c:	d8 13       	cpse	r29, r24
     f3e:	91 c0       	rjmp	.+290    	; 0x1062 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x180>
     f40:	10 92 2e 04 	sts	0x042E, r1	; 0x80042e <twi_slarw>
     f44:	80 91 2e 04 	lds	r24, 0x042E	; 0x80042e <twi_slarw>
     f48:	cc 0f       	add	r28, r28
     f4a:	c8 2b       	or	r28, r24
     f4c:	c0 93 2e 04 	sts	0x042E, r28	; 0x80042e <twi_slarw>
     f50:	80 91 2d 04 	lds	r24, 0x042D	; 0x80042d <twi_inRepStart>
     f54:	81 30       	cpi	r24, 0x01	; 1
     f56:	09 f0       	breq	.+2      	; 0xf5a <_ZN7TwoWire15endTransmissionEh.constprop.133+0x78>
     f58:	88 c0       	rjmp	.+272    	; 0x106a <_ZN7TwoWire15endTransmissionEh.constprop.133+0x188>
     f5a:	10 92 2d 04 	sts	0x042D, r1	; 0x80042d <twi_inRepStart>
     f5e:	0e 94 ca 05 	call	0xb94	; 0xb94 <micros>
     f62:	6b 01       	movw	r12, r22
     f64:	7c 01       	movw	r14, r24
     f66:	80 91 2e 04 	lds	r24, 0x042E	; 0x80042e <twi_slarw>
     f6a:	80 93 bb 00 	sts	0x00BB, r24	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
     f6e:	80 91 55 04 	lds	r24, 0x0455	; 0x800455 <twi_timeout_us>
     f72:	90 91 56 04 	lds	r25, 0x0456	; 0x800456 <twi_timeout_us+0x1>
     f76:	a0 91 57 04 	lds	r26, 0x0457	; 0x800457 <twi_timeout_us+0x2>
     f7a:	b0 91 58 04 	lds	r27, 0x0458	; 0x800458 <twi_timeout_us+0x3>
     f7e:	89 2b       	or	r24, r25
     f80:	8a 2b       	or	r24, r26
     f82:	8b 2b       	or	r24, r27
     f84:	a1 f0       	breq	.+40     	; 0xfae <_ZN7TwoWire15endTransmissionEh.constprop.133+0xcc>
     f86:	0e 94 ca 05 	call	0xb94	; 0xb94 <micros>
     f8a:	00 91 55 04 	lds	r16, 0x0455	; 0x800455 <twi_timeout_us>
     f8e:	10 91 56 04 	lds	r17, 0x0456	; 0x800456 <twi_timeout_us+0x1>
     f92:	20 91 57 04 	lds	r18, 0x0457	; 0x800457 <twi_timeout_us+0x2>
     f96:	30 91 58 04 	lds	r19, 0x0458	; 0x800458 <twi_timeout_us+0x3>
     f9a:	6c 19       	sub	r22, r12
     f9c:	7d 09       	sbc	r23, r13
     f9e:	8e 09       	sbc	r24, r14
     fa0:	9f 09       	sbc	r25, r15
     fa2:	06 17       	cp	r16, r22
     fa4:	17 07       	cpc	r17, r23
     fa6:	28 07       	cpc	r18, r24
     fa8:	39 07       	cpc	r19, r25
     faa:	08 f4       	brcc	.+2      	; 0xfae <_ZN7TwoWire15endTransmissionEh.constprop.133+0xcc>
     fac:	42 c0       	rjmp	.+132    	; 0x1032 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x150>
     fae:	80 91 bc 00 	lds	r24, 0x00BC	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
     fb2:	83 fd       	sbrc	r24, 3
     fb4:	d8 cf       	rjmp	.-80     	; 0xf66 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x84>
     fb6:	85 ec       	ldi	r24, 0xC5	; 197
     fb8:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
     fbc:	0e 94 ca 05 	call	0xb94	; 0xb94 <micros>
     fc0:	6b 01       	movw	r12, r22
     fc2:	7c 01       	movw	r14, r24
     fc4:	80 91 53 04 	lds	r24, 0x0453	; 0x800453 <twi_state>
     fc8:	82 30       	cpi	r24, 0x02	; 2
     fca:	09 f4       	brne	.+2      	; 0xfce <_ZN7TwoWire15endTransmissionEh.constprop.133+0xec>
     fcc:	50 c0       	rjmp	.+160    	; 0x106e <_ZN7TwoWire15endTransmissionEh.constprop.133+0x18c>
     fce:	80 91 31 04 	lds	r24, 0x0431	; 0x800431 <twi_error>
     fd2:	8f 3f       	cpi	r24, 0xFF	; 255
     fd4:	09 f4       	brne	.+2      	; 0xfd8 <_ZN7TwoWire15endTransmissionEh.constprop.133+0xf6>
     fd6:	6f c0       	rjmp	.+222    	; 0x10b6 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x1d4>
     fd8:	80 91 31 04 	lds	r24, 0x0431	; 0x800431 <twi_error>
     fdc:	80 32       	cpi	r24, 0x20	; 32
     fde:	09 f4       	brne	.+2      	; 0xfe2 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x100>
     fe0:	6c c0       	rjmp	.+216    	; 0x10ba <_ZN7TwoWire15endTransmissionEh.constprop.133+0x1d8>
     fe2:	80 91 31 04 	lds	r24, 0x0431	; 0x800431 <twi_error>
     fe6:	80 33       	cpi	r24, 0x30	; 48
     fe8:	09 f4       	brne	.+2      	; 0xfec <_ZN7TwoWire15endTransmissionEh.constprop.133+0x10a>
     fea:	69 c0       	rjmp	.+210    	; 0x10be <_ZN7TwoWire15endTransmissionEh.constprop.133+0x1dc>
     fec:	84 e0       	ldi	r24, 0x04	; 4
     fee:	26 c0       	rjmp	.+76     	; 0x103c <_ZN7TwoWire15endTransmissionEh.constprop.133+0x15a>
     ff0:	80 91 55 04 	lds	r24, 0x0455	; 0x800455 <twi_timeout_us>
     ff4:	90 91 56 04 	lds	r25, 0x0456	; 0x800456 <twi_timeout_us+0x1>
     ff8:	a0 91 57 04 	lds	r26, 0x0457	; 0x800457 <twi_timeout_us+0x2>
     ffc:	b0 91 58 04 	lds	r27, 0x0458	; 0x800458 <twi_timeout_us+0x3>
    1000:	89 2b       	or	r24, r25
    1002:	8a 2b       	or	r24, r26
    1004:	8b 2b       	or	r24, r27
    1006:	09 f4       	brne	.+2      	; 0x100a <_ZN7TwoWire15endTransmissionEh.constprop.133+0x128>
    1008:	84 cf       	rjmp	.-248    	; 0xf12 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x30>
    100a:	0e 94 ca 05 	call	0xb94	; 0xb94 <micros>
    100e:	80 90 55 04 	lds	r8, 0x0455	; 0x800455 <twi_timeout_us>
    1012:	90 90 56 04 	lds	r9, 0x0456	; 0x800456 <twi_timeout_us+0x1>
    1016:	a0 90 57 04 	lds	r10, 0x0457	; 0x800457 <twi_timeout_us+0x2>
    101a:	b0 90 58 04 	lds	r11, 0x0458	; 0x800458 <twi_timeout_us+0x3>
    101e:	6c 19       	sub	r22, r12
    1020:	7d 09       	sbc	r23, r13
    1022:	8e 09       	sbc	r24, r14
    1024:	9f 09       	sbc	r25, r15
    1026:	86 16       	cp	r8, r22
    1028:	97 06       	cpc	r9, r23
    102a:	a8 06       	cpc	r10, r24
    102c:	b9 06       	cpc	r11, r25
    102e:	08 f0       	brcs	.+2      	; 0x1032 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x150>
    1030:	70 cf       	rjmp	.-288    	; 0xf12 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x30>
    1032:	80 91 54 04 	lds	r24, 0x0454	; 0x800454 <twi_do_reset_on_timeout>
    1036:	0e 94 78 06 	call	0xcf0	; 0xcf0 <twi_handleTimeout>
    103a:	85 e0       	ldi	r24, 0x05	; 5
    103c:	10 92 ea 03 	sts	0x03EA, r1	; 0x8003ea <_ZN7TwoWire13txBufferIndexE>
    1040:	10 92 0c 04 	sts	0x040C, r1	; 0x80040c <_ZN7TwoWire14txBufferLengthE>
    1044:	10 92 e9 03 	sts	0x03E9, r1	; 0x8003e9 <_ZN7TwoWire12transmittingE>
    1048:	df 91       	pop	r29
    104a:	cf 91       	pop	r28
    104c:	1f 91       	pop	r17
    104e:	0f 91       	pop	r16
    1050:	ff 90       	pop	r15
    1052:	ef 90       	pop	r14
    1054:	df 90       	pop	r13
    1056:	cf 90       	pop	r12
    1058:	bf 90       	pop	r11
    105a:	af 90       	pop	r10
    105c:	9f 90       	pop	r9
    105e:	8f 90       	pop	r8
    1060:	08 95       	ret
    1062:	9d 91       	ld	r25, X+
    1064:	91 93       	st	Z+, r25
    1066:	8f 5f       	subi	r24, 0xFF	; 255
    1068:	69 cf       	rjmp	.-302    	; 0xf3c <_ZN7TwoWire15endTransmissionEh.constprop.133+0x5a>
    106a:	85 ee       	ldi	r24, 0xE5	; 229
    106c:	a5 cf       	rjmp	.-182    	; 0xfb8 <_ZN7TwoWire15endTransmissionEh.constprop.133+0xd6>
    106e:	80 91 55 04 	lds	r24, 0x0455	; 0x800455 <twi_timeout_us>
    1072:	90 91 56 04 	lds	r25, 0x0456	; 0x800456 <twi_timeout_us+0x1>
    1076:	a0 91 57 04 	lds	r26, 0x0457	; 0x800457 <twi_timeout_us+0x2>
    107a:	b0 91 58 04 	lds	r27, 0x0458	; 0x800458 <twi_timeout_us+0x3>
    107e:	89 2b       	or	r24, r25
    1080:	8a 2b       	or	r24, r26
    1082:	8b 2b       	or	r24, r27
    1084:	09 f4       	brne	.+2      	; 0x1088 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x1a6>
    1086:	9e cf       	rjmp	.-196    	; 0xfc4 <_ZN7TwoWire15endTransmissionEh.constprop.133+0xe2>
    1088:	0e 94 ca 05 	call	0xb94	; 0xb94 <micros>
    108c:	00 91 55 04 	lds	r16, 0x0455	; 0x800455 <twi_timeout_us>
    1090:	10 91 56 04 	lds	r17, 0x0456	; 0x800456 <twi_timeout_us+0x1>
    1094:	20 91 57 04 	lds	r18, 0x0457	; 0x800457 <twi_timeout_us+0x2>
    1098:	30 91 58 04 	lds	r19, 0x0458	; 0x800458 <twi_timeout_us+0x3>
    109c:	6c 19       	sub	r22, r12
    109e:	7d 09       	sbc	r23, r13
    10a0:	8e 09       	sbc	r24, r14
    10a2:	9f 09       	sbc	r25, r15
    10a4:	06 17       	cp	r16, r22
    10a6:	17 07       	cpc	r17, r23
    10a8:	28 07       	cpc	r18, r24
    10aa:	39 07       	cpc	r19, r25
    10ac:	08 f0       	brcs	.+2      	; 0x10b0 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x1ce>
    10ae:	8a cf       	rjmp	.-236    	; 0xfc4 <_ZN7TwoWire15endTransmissionEh.constprop.133+0xe2>
    10b0:	c0 cf       	rjmp	.-128    	; 0x1032 <_ZN7TwoWire15endTransmissionEh.constprop.133+0x150>
    10b2:	81 e0       	ldi	r24, 0x01	; 1
    10b4:	c3 cf       	rjmp	.-122    	; 0x103c <_ZN7TwoWire15endTransmissionEh.constprop.133+0x15a>
    10b6:	80 e0       	ldi	r24, 0x00	; 0
    10b8:	c1 cf       	rjmp	.-126    	; 0x103c <_ZN7TwoWire15endTransmissionEh.constprop.133+0x15a>
    10ba:	82 e0       	ldi	r24, 0x02	; 2
    10bc:	bf cf       	rjmp	.-130    	; 0x103c <_ZN7TwoWire15endTransmissionEh.constprop.133+0x15a>
    10be:	83 e0       	ldi	r24, 0x03	; 3
    10c0:	bd cf       	rjmp	.-134    	; 0x103c <_ZN7TwoWire15endTransmissionEh.constprop.133+0x15a>

000010c2 <_ZN6INA21911isConnectedEv.constprop.26>:
    10c2:	80 91 02 06 	lds	r24, 0x0602	; 0x800602 <INA+0xc>
    10c6:	90 ec       	ldi	r25, 0xC0	; 192
    10c8:	98 0f       	add	r25, r24
    10ca:	90 31       	cpi	r25, 0x10	; 16
    10cc:	70 f4       	brcc	.+28     	; 0x10ea <_ZN6INA21911isConnectedEv.constprop.26+0x28>
    10ce:	91 e0       	ldi	r25, 0x01	; 1
    10d0:	90 93 e9 03 	sts	0x03E9, r25	; 0x8003e9 <_ZN7TwoWire12transmittingE>
    10d4:	80 93 0b 04 	sts	0x040B, r24	; 0x80040b <_ZN7TwoWire9txAddressE>
    10d8:	10 92 ea 03 	sts	0x03EA, r1	; 0x8003ea <_ZN7TwoWire13txBufferIndexE>
    10dc:	10 92 0c 04 	sts	0x040C, r1	; 0x80040c <_ZN7TwoWire14txBufferLengthE>
    10e0:	81 e0       	ldi	r24, 0x01	; 1
    10e2:	0e 94 71 07 	call	0xee2	; 0xee2 <_ZN7TwoWire15endTransmissionEh.constprop.133>
    10e6:	91 e0       	ldi	r25, 0x01	; 1
    10e8:	81 11       	cpse	r24, r1
    10ea:	90 e0       	ldi	r25, 0x00	; 0
    10ec:	89 2f       	mov	r24, r25
    10ee:	08 95       	ret

000010f0 <_ZN6INA21914_writeRegisterEhj.constprop.25>:
    10f0:	cf 93       	push	r28
    10f2:	df 93       	push	r29
    10f4:	eb 01       	movw	r28, r22
    10f6:	a0 91 03 06 	lds	r26, 0x0603	; 0x800603 <INA+0xd>
    10fa:	b0 91 04 06 	lds	r27, 0x0604	; 0x800604 <INA+0xe>
    10fe:	90 91 02 06 	lds	r25, 0x0602	; 0x800602 <INA+0xc>
    1102:	21 e0       	ldi	r18, 0x01	; 1
    1104:	20 93 e9 03 	sts	0x03E9, r18	; 0x8003e9 <_ZN7TwoWire12transmittingE>
    1108:	90 93 0b 04 	sts	0x040B, r25	; 0x80040b <_ZN7TwoWire9txAddressE>
    110c:	10 92 ea 03 	sts	0x03EA, r1	; 0x8003ea <_ZN7TwoWire13txBufferIndexE>
    1110:	10 92 0c 04 	sts	0x040C, r1	; 0x80040c <_ZN7TwoWire14txBufferLengthE>
    1114:	ed 91       	ld	r30, X+
    1116:	fc 91       	ld	r31, X
    1118:	11 97       	sbiw	r26, 0x01	; 1
    111a:	01 90       	ld	r0, Z+
    111c:	f0 81       	ld	r31, Z
    111e:	e0 2d       	mov	r30, r0
    1120:	68 2f       	mov	r22, r24
    1122:	cd 01       	movw	r24, r26
    1124:	09 95       	icall
    1126:	80 91 03 06 	lds	r24, 0x0603	; 0x800603 <INA+0xd>
    112a:	90 91 04 06 	lds	r25, 0x0604	; 0x800604 <INA+0xe>
    112e:	dc 01       	movw	r26, r24
    1130:	ed 91       	ld	r30, X+
    1132:	fc 91       	ld	r31, X
    1134:	01 90       	ld	r0, Z+
    1136:	f0 81       	ld	r31, Z
    1138:	e0 2d       	mov	r30, r0
    113a:	6d 2f       	mov	r22, r29
    113c:	09 95       	icall
    113e:	80 91 03 06 	lds	r24, 0x0603	; 0x800603 <INA+0xd>
    1142:	90 91 04 06 	lds	r25, 0x0604	; 0x800604 <INA+0xe>
    1146:	dc 01       	movw	r26, r24
    1148:	ed 91       	ld	r30, X+
    114a:	fc 91       	ld	r31, X
    114c:	01 90       	ld	r0, Z+
    114e:	f0 81       	ld	r31, Z
    1150:	e0 2d       	mov	r30, r0
    1152:	6c 2f       	mov	r22, r28
    1154:	09 95       	icall
    1156:	81 e0       	ldi	r24, 0x01	; 1
    1158:	0e 94 71 07 	call	0xee2	; 0xee2 <_ZN7TwoWire15endTransmissionEh.constprop.133>
    115c:	88 23       	and	r24, r24
    115e:	31 f0       	breq	.+12     	; 0x116c <_ZN6INA21914_writeRegisterEhj.constprop.25+0x7c>
    1160:	2f ef       	ldi	r18, 0xFF	; 255
    1162:	3f ef       	ldi	r19, 0xFF	; 255
    1164:	30 93 06 06 	sts	0x0606, r19	; 0x800606 <INA+0x10>
    1168:	20 93 05 06 	sts	0x0605, r18	; 0x800605 <INA+0xf>
    116c:	90 e0       	ldi	r25, 0x00	; 0
    116e:	df 91       	pop	r29
    1170:	cf 91       	pop	r28
    1172:	08 95       	ret

00001174 <_ZN18Adafruit_I2CDevice8detectedEv>:
    1174:	cf 93       	push	r28
    1176:	df 93       	push	r29
    1178:	ec 01       	movw	r28, r24
    117a:	8b 81       	ldd	r24, Y+3	; 0x03
    117c:	88 23       	and	r24, r24
    117e:	a1 f0       	breq	.+40     	; 0x11a8 <_ZN18Adafruit_I2CDevice8detectedEv+0x34>
    1180:	88 81       	ld	r24, Y
    1182:	91 e0       	ldi	r25, 0x01	; 1
    1184:	90 93 e9 03 	sts	0x03E9, r25	; 0x8003e9 <_ZN7TwoWire12transmittingE>
    1188:	80 93 0b 04 	sts	0x040B, r24	; 0x80040b <_ZN7TwoWire9txAddressE>
    118c:	10 92 ea 03 	sts	0x03EA, r1	; 0x8003ea <_ZN7TwoWire13txBufferIndexE>
    1190:	10 92 0c 04 	sts	0x040C, r1	; 0x80040c <_ZN7TwoWire14txBufferLengthE>
    1194:	81 e0       	ldi	r24, 0x01	; 1
    1196:	0e 94 71 07 	call	0xee2	; 0xee2 <_ZN7TwoWire15endTransmissionEh.constprop.133>
    119a:	91 e0       	ldi	r25, 0x01	; 1
    119c:	81 11       	cpse	r24, r1
    119e:	90 e0       	ldi	r25, 0x00	; 0
    11a0:	89 2f       	mov	r24, r25
    11a2:	df 91       	pop	r29
    11a4:	cf 91       	pop	r28
    11a6:	08 95       	ret
    11a8:	0e 94 61 06 	call	0xcc2	; 0xcc2 <_ZN7TwoWire5beginEv.constprop.17>
    11ac:	81 e0       	ldi	r24, 0x01	; 1
    11ae:	8b 83       	std	Y+3, r24	; 0x03
    11b0:	ce 01       	movw	r24, r28
    11b2:	0e 94 ba 08 	call	0x1174	; 0x1174 <_ZN18Adafruit_I2CDevice8detectedEv>
    11b6:	98 2f       	mov	r25, r24
    11b8:	81 11       	cpse	r24, r1
    11ba:	e2 cf       	rjmp	.-60     	; 0x1180 <_ZN18Adafruit_I2CDevice8detectedEv+0xc>
    11bc:	f1 cf       	rjmp	.-30     	; 0x11a0 <_ZN18Adafruit_I2CDevice8detectedEv+0x2c>

000011be <_ZN7TwoWire5flushEv>:
    11be:	08 95       	ret

000011c0 <_ZN7TwoWire4peekEv>:
    11c0:	e0 91 e8 03 	lds	r30, 0x03E8	; 0x8003e8 <_ZN7TwoWire13rxBufferIndexE>
    11c4:	80 91 e7 03 	lds	r24, 0x03E7	; 0x8003e7 <_ZN7TwoWire14rxBufferLengthE>
    11c8:	e8 17       	cp	r30, r24
    11ca:	30 f4       	brcc	.+12     	; 0x11d8 <_ZN7TwoWire4peekEv+0x18>
    11cc:	f0 e0       	ldi	r31, 0x00	; 0
    11ce:	ed 5c       	subi	r30, 0xCD	; 205
    11d0:	fb 4f       	sbci	r31, 0xFB	; 251
    11d2:	80 81       	ld	r24, Z
    11d4:	90 e0       	ldi	r25, 0x00	; 0
    11d6:	08 95       	ret
    11d8:	8f ef       	ldi	r24, 0xFF	; 255
    11da:	9f ef       	ldi	r25, 0xFF	; 255
    11dc:	08 95       	ret

000011de <_ZN7TwoWire4readEv>:
    11de:	90 91 e8 03 	lds	r25, 0x03E8	; 0x8003e8 <_ZN7TwoWire13rxBufferIndexE>
    11e2:	80 91 e7 03 	lds	r24, 0x03E7	; 0x8003e7 <_ZN7TwoWire14rxBufferLengthE>
    11e6:	2f ef       	ldi	r18, 0xFF	; 255
    11e8:	3f ef       	ldi	r19, 0xFF	; 255
    11ea:	98 17       	cp	r25, r24
    11ec:	48 f4       	brcc	.+18     	; 0x1200 <_ZN7TwoWire4readEv+0x22>
    11ee:	e9 2f       	mov	r30, r25
    11f0:	f0 e0       	ldi	r31, 0x00	; 0
    11f2:	ed 5c       	subi	r30, 0xCD	; 205
    11f4:	fb 4f       	sbci	r31, 0xFB	; 251
    11f6:	20 81       	ld	r18, Z
    11f8:	30 e0       	ldi	r19, 0x00	; 0
    11fa:	9f 5f       	subi	r25, 0xFF	; 255
    11fc:	90 93 e8 03 	sts	0x03E8, r25	; 0x8003e8 <_ZN7TwoWire13rxBufferIndexE>
    1200:	c9 01       	movw	r24, r18
    1202:	08 95       	ret

00001204 <_ZN7TwoWire9availableEv>:
    1204:	80 91 e7 03 	lds	r24, 0x03E7	; 0x8003e7 <_ZN7TwoWire14rxBufferLengthE>
    1208:	90 91 e8 03 	lds	r25, 0x03E8	; 0x8003e8 <_ZN7TwoWire13rxBufferIndexE>
    120c:	89 1b       	sub	r24, r25
    120e:	99 0b       	sbc	r25, r25
    1210:	08 95       	ret

00001212 <_ZN7TwoWire5writeEPKhj>:
    1212:	cf 92       	push	r12
    1214:	df 92       	push	r13
    1216:	ef 92       	push	r14
    1218:	ff 92       	push	r15
    121a:	0f 93       	push	r16
    121c:	1f 93       	push	r17
    121e:	cf 93       	push	r28
    1220:	df 93       	push	r29
    1222:	7c 01       	movw	r14, r24
    1224:	cb 01       	movw	r24, r22
    1226:	8a 01       	movw	r16, r20
    1228:	20 91 e9 03 	lds	r18, 0x03E9	; 0x8003e9 <_ZN7TwoWire12transmittingE>
    122c:	22 23       	and	r18, r18
    122e:	89 f0       	breq	.+34     	; 0x1252 <_ZN7TwoWire5writeEPKhj+0x40>
    1230:	eb 01       	movw	r28, r22
    1232:	6b 01       	movw	r12, r22
    1234:	c4 0e       	add	r12, r20
    1236:	d5 1e       	adc	r13, r21
    1238:	cc 15       	cp	r28, r12
    123a:	dd 05       	cpc	r29, r13
    123c:	69 f0       	breq	.+26     	; 0x1258 <_ZN7TwoWire5writeEPKhj+0x46>
    123e:	69 91       	ld	r22, Y+
    1240:	d7 01       	movw	r26, r14
    1242:	ed 91       	ld	r30, X+
    1244:	fc 91       	ld	r31, X
    1246:	01 90       	ld	r0, Z+
    1248:	f0 81       	ld	r31, Z
    124a:	e0 2d       	mov	r30, r0
    124c:	c7 01       	movw	r24, r14
    124e:	09 95       	icall
    1250:	f3 cf       	rjmp	.-26     	; 0x1238 <_ZN7TwoWire5writeEPKhj+0x26>
    1252:	64 2f       	mov	r22, r20
    1254:	0e 94 1c 06 	call	0xc38	; 0xc38 <twi_transmit>
    1258:	c8 01       	movw	r24, r16
    125a:	df 91       	pop	r29
    125c:	cf 91       	pop	r28
    125e:	1f 91       	pop	r17
    1260:	0f 91       	pop	r16
    1262:	ff 90       	pop	r15
    1264:	ef 90       	pop	r14
    1266:	df 90       	pop	r13
    1268:	cf 90       	pop	r12
    126a:	08 95       	ret

0000126c <_ZN7TwoWire5writeEh>:
    126c:	cf 93       	push	r28
    126e:	df 93       	push	r29
    1270:	1f 92       	push	r1
    1272:	cd b7       	in	r28, 0x3d	; 61
    1274:	de b7       	in	r29, 0x3e	; 62
    1276:	69 83       	std	Y+1, r22	; 0x01
    1278:	20 91 e9 03 	lds	r18, 0x03E9	; 0x8003e9 <_ZN7TwoWire12transmittingE>
    127c:	22 23       	and	r18, r18
    127e:	f9 f0       	breq	.+62     	; 0x12be <_ZN7TwoWire5writeEh+0x52>
    1280:	20 91 0c 04 	lds	r18, 0x040C	; 0x80040c <_ZN7TwoWire14txBufferLengthE>
    1284:	20 32       	cpi	r18, 0x20	; 32
    1286:	58 f0       	brcs	.+22     	; 0x129e <_ZN7TwoWire5writeEh+0x32>
    1288:	21 e0       	ldi	r18, 0x01	; 1
    128a:	30 e0       	ldi	r19, 0x00	; 0
    128c:	fc 01       	movw	r30, r24
    128e:	33 83       	std	Z+3, r19	; 0x03
    1290:	22 83       	std	Z+2, r18	; 0x02
    1292:	90 e0       	ldi	r25, 0x00	; 0
    1294:	80 e0       	ldi	r24, 0x00	; 0
    1296:	0f 90       	pop	r0
    1298:	df 91       	pop	r29
    129a:	cf 91       	pop	r28
    129c:	08 95       	ret
    129e:	80 91 ea 03 	lds	r24, 0x03EA	; 0x8003ea <_ZN7TwoWire13txBufferIndexE>
    12a2:	e8 2f       	mov	r30, r24
    12a4:	f0 e0       	ldi	r31, 0x00	; 0
    12a6:	e5 51       	subi	r30, 0x15	; 21
    12a8:	fc 4f       	sbci	r31, 0xFC	; 252
    12aa:	99 81       	ldd	r25, Y+1	; 0x01
    12ac:	90 83       	st	Z, r25
    12ae:	8f 5f       	subi	r24, 0xFF	; 255
    12b0:	80 93 ea 03 	sts	0x03EA, r24	; 0x8003ea <_ZN7TwoWire13txBufferIndexE>
    12b4:	80 93 0c 04 	sts	0x040C, r24	; 0x80040c <_ZN7TwoWire14txBufferLengthE>
    12b8:	81 e0       	ldi	r24, 0x01	; 1
    12ba:	90 e0       	ldi	r25, 0x00	; 0
    12bc:	ec cf       	rjmp	.-40     	; 0x1296 <_ZN7TwoWire5writeEh+0x2a>
    12be:	61 e0       	ldi	r22, 0x01	; 1
    12c0:	ce 01       	movw	r24, r28
    12c2:	01 96       	adiw	r24, 0x01	; 1
    12c4:	0e 94 1c 06 	call	0xc38	; 0xc38 <twi_transmit>
    12c8:	f7 cf       	rjmp	.-18     	; 0x12b8 <_ZN7TwoWire5writeEh+0x4c>

000012ca <_ZN5Print17availableForWriteEv>:
    12ca:	90 e0       	ldi	r25, 0x00	; 0
    12cc:	80 e0       	ldi	r24, 0x00	; 0
    12ce:	08 95       	ret

000012d0 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv>:
    12d0:	fc 01       	movw	r30, r24
    12d2:	3f b7       	in	r19, 0x3f	; 63
    12d4:	f8 94       	cli
    12d6:	96 ad       	ldd	r25, Z+62	; 0x3e
    12d8:	85 ad       	ldd	r24, Z+61	; 0x3d
    12da:	89 17       	cp	r24, r25
    12dc:	18 f0       	brcs	.+6      	; 0x12e4 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x14>
    12de:	3f bf       	out	0x3f, r19	; 63
    12e0:	80 e0       	ldi	r24, 0x00	; 0
    12e2:	08 95       	ret
    12e4:	29 2f       	mov	r18, r25
    12e6:	28 1b       	sub	r18, r24
    12e8:	3f bf       	out	0x3f, r19	; 63
    12ea:	80 e0       	ldi	r24, 0x00	; 0
    12ec:	9d 31       	cpi	r25, 0x1D	; 29
    12ee:	40 f4       	brcc	.+16     	; 0x1300 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x30>
    12f0:	9d 30       	cpi	r25, 0x0D	; 13
    12f2:	08 f4       	brcc	.+2      	; 0x12f6 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x26>
    12f4:	45 c0       	rjmp	.+138    	; 0x1380 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xb0>
    12f6:	82 2f       	mov	r24, r18
    12f8:	86 95       	lsr	r24
    12fa:	86 95       	lsr	r24
    12fc:	08 95       	ret
    12fe:	83 2f       	mov	r24, r19
    1300:	96 95       	lsr	r25
    1302:	31 e0       	ldi	r19, 0x01	; 1
    1304:	38 0f       	add	r19, r24
    1306:	91 11       	cpse	r25, r1
    1308:	fa cf       	rjmp	.-12     	; 0x12fe <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x2e>
    130a:	8d 30       	cpi	r24, 0x0D	; 13
    130c:	68 f0       	brcs	.+26     	; 0x1328 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x58>
    130e:	8d 30       	cpi	r24, 0x0D	; 13
    1310:	29 f1       	breq	.+74     	; 0x135c <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x8c>
    1312:	8e 30       	cpi	r24, 0x0E	; 14
    1314:	31 f1       	breq	.+76     	; 0x1362 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x92>
    1316:	81 e1       	ldi	r24, 0x11	; 17
    1318:	90 e0       	ldi	r25, 0x00	; 0
    131a:	28 9f       	mul	r18, r24
    131c:	a0 01       	movw	r20, r0
    131e:	29 9f       	mul	r18, r25
    1320:	50 0d       	add	r21, r0
    1322:	11 24       	eor	r1, r1
    1324:	85 2f       	mov	r24, r21
    1326:	08 95       	ret
    1328:	89 30       	cpi	r24, 0x09	; 9
    132a:	60 f0       	brcs	.+24     	; 0x1344 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x74>
    132c:	8b 30       	cpi	r24, 0x0B	; 11
    132e:	28 f0       	brcs	.+10     	; 0x133a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x6a>
    1330:	8c 30       	cpi	r24, 0x0C	; 12
    1332:	d1 f4       	brne	.+52     	; 0x1368 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x98>
    1334:	85 e1       	ldi	r24, 0x15	; 21
    1336:	90 e0       	ldi	r25, 0x00	; 0
    1338:	f0 cf       	rjmp	.-32     	; 0x131a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
    133a:	8a 30       	cpi	r24, 0x0A	; 10
    133c:	c1 f4       	brne	.+48     	; 0x136e <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x9e>
    133e:	89 e1       	ldi	r24, 0x19	; 25
    1340:	90 e0       	ldi	r25, 0x00	; 0
    1342:	eb cf       	rjmp	.-42     	; 0x131a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
    1344:	87 30       	cpi	r24, 0x07	; 7
    1346:	28 f0       	brcs	.+10     	; 0x1352 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x82>
    1348:	88 30       	cpi	r24, 0x08	; 8
    134a:	a1 f4       	brne	.+40     	; 0x1374 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xa4>
    134c:	80 e2       	ldi	r24, 0x20	; 32
    134e:	90 e0       	ldi	r25, 0x00	; 0
    1350:	e4 cf       	rjmp	.-56     	; 0x131a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
    1352:	86 30       	cpi	r24, 0x06	; 6
    1354:	91 f4       	brne	.+36     	; 0x137a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xaa>
    1356:	8a e2       	ldi	r24, 0x2A	; 42
    1358:	90 e0       	ldi	r25, 0x00	; 0
    135a:	df cf       	rjmp	.-66     	; 0x131a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
    135c:	83 e1       	ldi	r24, 0x13	; 19
    135e:	90 e0       	ldi	r25, 0x00	; 0
    1360:	dc cf       	rjmp	.-72     	; 0x131a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
    1362:	82 e1       	ldi	r24, 0x12	; 18
    1364:	90 e0       	ldi	r25, 0x00	; 0
    1366:	d9 cf       	rjmp	.-78     	; 0x131a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
    1368:	87 e1       	ldi	r24, 0x17	; 23
    136a:	90 e0       	ldi	r25, 0x00	; 0
    136c:	d6 cf       	rjmp	.-84     	; 0x131a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
    136e:	8c e1       	ldi	r24, 0x1C	; 28
    1370:	90 e0       	ldi	r25, 0x00	; 0
    1372:	d3 cf       	rjmp	.-90     	; 0x131a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
    1374:	84 e2       	ldi	r24, 0x24	; 36
    1376:	90 e0       	ldi	r25, 0x00	; 0
    1378:	d0 cf       	rjmp	.-96     	; 0x131a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
    137a:	83 e3       	ldi	r24, 0x33	; 51
    137c:	90 e0       	ldi	r25, 0x00	; 0
    137e:	cd cf       	rjmp	.-102    	; 0x131a <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x4a>
    1380:	99 30       	cpi	r25, 0x09	; 9
    1382:	48 f0       	brcs	.+18     	; 0x1396 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xc6>
    1384:	2b 30       	cpi	r18, 0x0B	; 11
    1386:	a0 f4       	brcc	.+40     	; 0x13b0 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xe0>
    1388:	27 30       	cpi	r18, 0x07	; 7
    138a:	a0 f4       	brcc	.+40     	; 0x13b4 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xe4>
    138c:	81 e0       	ldi	r24, 0x01	; 1
    138e:	24 30       	cpi	r18, 0x04	; 4
    1390:	08 f4       	brcc	.+2      	; 0x1394 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xc4>
    1392:	a6 cf       	rjmp	.-180    	; 0x12e0 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x10>
    1394:	08 95       	ret
    1396:	95 30       	cpi	r25, 0x05	; 5
    1398:	30 f0       	brcs	.+12     	; 0x13a6 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xd6>
    139a:	26 30       	cpi	r18, 0x06	; 6
    139c:	58 f4       	brcc	.+22     	; 0x13b4 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xe4>
    139e:	81 e0       	ldi	r24, 0x01	; 1
    13a0:	23 30       	cpi	r18, 0x03	; 3
    13a2:	c0 f7       	brcc	.-16     	; 0x1394 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xc4>
    13a4:	9d cf       	rjmp	.-198    	; 0x12e0 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0x10>
    13a6:	93 30       	cpi	r25, 0x03	; 3
    13a8:	d0 f7       	brcc	.-12     	; 0x139e <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xce>
    13aa:	82 2f       	mov	r24, r18
    13ac:	86 95       	lsr	r24
    13ae:	08 95       	ret
    13b0:	83 e0       	ldi	r24, 0x03	; 3
    13b2:	08 95       	ret
    13b4:	82 e0       	ldi	r24, 0x02	; 2
    13b6:	ee cf       	rjmp	.-36     	; 0x1394 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv+0xc4>

000013b8 <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>:
    13b8:	fc 01       	movw	r30, r24
    13ba:	90 81       	ld	r25, Z
    13bc:	44 23       	and	r20, r20
    13be:	19 f0       	breq	.+6      	; 0x13c6 <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b+0xe>
    13c0:	69 0f       	add	r22, r25
    13c2:	60 83       	st	Z, r22
    13c4:	08 95       	ret
    13c6:	96 1b       	sub	r25, r22
    13c8:	9f 5f       	subi	r25, 0xFF	; 255
    13ca:	90 83       	st	Z, r25
    13cc:	08 95       	ret

000013ce <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv>:
    13ce:	fc 01       	movw	r30, r24
    13d0:	15 ae       	std	Z+61, r1	; 0x3d
    13d2:	16 ae       	std	Z+62, r1	; 0x3e
    13d4:	8d e3       	ldi	r24, 0x3D	; 61
    13d6:	87 af       	std	Z+63, r24	; 0x3f
    13d8:	df 01       	movw	r26, r30
    13da:	80 e0       	ldi	r24, 0x00	; 0
    13dc:	9d 91       	ld	r25, X+
    13de:	26 ad       	ldd	r18, Z+62	; 0x3e
    13e0:	92 17       	cp	r25, r18
    13e2:	38 f0       	brcs	.+14     	; 0x13f2 <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv+0x24>
    13e4:	25 af       	std	Z+61, r18	; 0x3d
    13e6:	96 af       	std	Z+62, r25	; 0x3e
    13e8:	87 af       	std	Z+63, r24	; 0x3f
    13ea:	8f 5f       	subi	r24, 0xFF	; 255
    13ec:	8c 33       	cpi	r24, 0x3C	; 60
    13ee:	b1 f7       	brne	.-20     	; 0x13dc <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv+0xe>
    13f0:	08 95       	ret
    13f2:	25 ad       	ldd	r18, Z+61	; 0x3d
    13f4:	29 17       	cp	r18, r25
    13f6:	c8 f7       	brcc	.-14     	; 0x13ea <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv+0x1c>
    13f8:	95 af       	std	Z+61, r25	; 0x3d
    13fa:	f7 cf       	rjmp	.-18     	; 0x13ea <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv+0x1c>

000013fc <_ZN8Internal7Binning6bins_tIhhLj60EE5setupEv>:
    13fc:	fc 01       	movw	r30, r24
    13fe:	dc 01       	movw	r26, r24
    1400:	cc 96       	adiw	r24, 0x3c	; 60
    1402:	1d 92       	st	X+, r1
    1404:	a8 17       	cp	r26, r24
    1406:	b9 07       	cpc	r27, r25
    1408:	e1 f7       	brne	.-8      	; 0x1402 <_ZN8Internal7Binning6bins_tIhhLj60EE5setupEv+0x6>
    140a:	14 ae       	std	Z+60, r1	; 0x3c
    140c:	16 ae       	std	Z+62, r1	; 0x3e
    140e:	8d e3       	ldi	r24, 0x3D	; 61
    1410:	87 af       	std	Z+63, r24	; 0x3f
    1412:	15 ae       	std	Z+61, r1	; 0x3d
    1414:	08 95       	ret

00001416 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv>:
    1416:	8c e2       	ldi	r24, 0x2C	; 44
    1418:	91 e0       	ldi	r25, 0x01	; 1
    141a:	90 93 c9 05 	sts	0x05C9, r25	; 0x8005c9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd3>
    141e:	80 93 c8 05 	sts	0x05C8, r24	; 0x8005c8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd2>
    1422:	80 e2       	ldi	r24, 0x20	; 32
    1424:	93 e0       	ldi	r25, 0x03	; 3
    1426:	0e 94 fe 09 	call	0x13fc	; 0x13fc <_ZN8Internal7Binning6bins_tIhhLj60EE5setupEv>
    142a:	8f ef       	ldi	r24, 0xFF	; 255
    142c:	80 93 66 03 	sts	0x0366, r24	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    1430:	80 93 67 03 	sts	0x0367, r24	; 0x800367 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x47>
    1434:	80 ee       	ldi	r24, 0xE0	; 224
    1436:	92 e0       	ldi	r25, 0x02	; 2
    1438:	0e 94 fe 09 	call	0x13fc	; 0x13fc <_ZN8Internal7Binning6bins_tIhhLj60EE5setupEv>
    143c:	e8 e6       	ldi	r30, 0x68	; 104
    143e:	f3 e0       	ldi	r31, 0x03	; 3
    1440:	80 e8       	ldi	r24, 0x80	; 128
    1442:	93 e0       	ldi	r25, 0x03	; 3
    1444:	11 92       	st	Z+, r1
    1446:	8e 17       	cp	r24, r30
    1448:	9f 07       	cpc	r25, r31
    144a:	e1 f7       	brne	.-8      	; 0x1444 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv+0x2e>
    144c:	10 92 80 03 	sts	0x0380, r1	; 0x800380 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
    1450:	10 92 82 03 	sts	0x0382, r1	; 0x800382 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1a>
    1454:	89 e1       	ldi	r24, 0x19	; 25
    1456:	80 93 83 03 	sts	0x0383, r24	; 0x800383 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1b>
    145a:	10 92 81 03 	sts	0x0381, r1	; 0x800381 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x19>
    145e:	ef e8       	ldi	r30, 0x8F	; 143
    1460:	f3 e0       	ldi	r31, 0x03	; 3
    1462:	11 92       	st	Z+, r1
    1464:	83 e0       	ldi	r24, 0x03	; 3
    1466:	ee 3a       	cpi	r30, 0xAE	; 174
    1468:	f8 07       	cpc	r31, r24
    146a:	d9 f7       	brne	.-10     	; 0x1462 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv+0x4c>
    146c:	10 92 ae 03 	sts	0x03AE, r1	; 0x8003ae <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
    1470:	10 92 b0 03 	sts	0x03B0, r1	; 0x8003b0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x21>
    1474:	80 e2       	ldi	r24, 0x20	; 32
    1476:	80 93 b1 03 	sts	0x03B1, r24	; 0x8003b1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x22>
    147a:	10 92 af 03 	sts	0x03AF, r1	; 0x8003af <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x20>
    147e:	10 92 84 03 	sts	0x0384, r1	; 0x800384 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE>
    1482:	10 92 85 03 	sts	0x0385, r1	; 0x800385 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x1>
    1486:	10 92 86 03 	sts	0x0386, r1	; 0x800386 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x2>
    148a:	10 92 87 03 	sts	0x0387, r1	; 0x800387 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x3>
    148e:	10 92 88 03 	sts	0x0388, r1	; 0x800388 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x4>
    1492:	10 92 89 03 	sts	0x0389, r1	; 0x800389 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x5>
    1496:	10 92 8a 03 	sts	0x038A, r1	; 0x80038a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x6>
    149a:	10 92 8b 03 	sts	0x038B, r1	; 0x80038b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
    149e:	10 92 8d 03 	sts	0x038D, r1	; 0x80038d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x9>
    14a2:	88 e0       	ldi	r24, 0x08	; 8
    14a4:	80 93 8e 03 	sts	0x038E, r24	; 0x80038e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0xa>
    14a8:	10 92 8c 03 	sts	0x038C, r1	; 0x80038c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x8>
    14ac:	e2 eb       	ldi	r30, 0xB2	; 178
    14ae:	f3 e0       	ldi	r31, 0x03	; 3
    14b0:	8e eb       	ldi	r24, 0xBE	; 190
    14b2:	93 e0       	ldi	r25, 0x03	; 3
    14b4:	11 92       	st	Z+, r1
    14b6:	8e 17       	cp	r24, r30
    14b8:	9f 07       	cpc	r25, r31
    14ba:	e1 f7       	brne	.-8      	; 0x14b4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv+0x9e>
    14bc:	10 92 be 03 	sts	0x03BE, r1	; 0x8003be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
    14c0:	10 92 c0 03 	sts	0x03C0, r1	; 0x8003c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xe>
    14c4:	8d e0       	ldi	r24, 0x0D	; 13
    14c6:	80 93 c1 03 	sts	0x03C1, r24	; 0x8003c1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xf>
    14ca:	10 92 bf 03 	sts	0x03BF, r1	; 0x8003bf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xd>
    14ce:	0c 94 81 02 	jmp	0x502	; 0x502 <_ZN8Internal18DCF77_Year_Decoder5setupEv.constprop.99>

000014d2 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv>:
    14d2:	fc 01       	movw	r30, r24
    14d4:	3f b7       	in	r19, 0x3f	; 63
    14d6:	f8 94       	cli
    14d8:	94 85       	ldd	r25, Z+12	; 0x0c
    14da:	83 85       	ldd	r24, Z+11	; 0x0b
    14dc:	89 17       	cp	r24, r25
    14de:	18 f0       	brcs	.+6      	; 0x14e6 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x14>
    14e0:	3f bf       	out	0x3f, r19	; 63
    14e2:	80 e0       	ldi	r24, 0x00	; 0
    14e4:	08 95       	ret
    14e6:	29 2f       	mov	r18, r25
    14e8:	28 1b       	sub	r18, r24
    14ea:	3f bf       	out	0x3f, r19	; 63
    14ec:	80 e0       	ldi	r24, 0x00	; 0
    14ee:	9d 31       	cpi	r25, 0x1D	; 29
    14f0:	40 f4       	brcc	.+16     	; 0x1502 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x30>
    14f2:	9d 30       	cpi	r25, 0x0D	; 13
    14f4:	08 f4       	brcc	.+2      	; 0x14f8 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x26>
    14f6:	45 c0       	rjmp	.+138    	; 0x1582 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xb0>
    14f8:	82 2f       	mov	r24, r18
    14fa:	86 95       	lsr	r24
    14fc:	86 95       	lsr	r24
    14fe:	08 95       	ret
    1500:	83 2f       	mov	r24, r19
    1502:	96 95       	lsr	r25
    1504:	31 e0       	ldi	r19, 0x01	; 1
    1506:	38 0f       	add	r19, r24
    1508:	91 11       	cpse	r25, r1
    150a:	fa cf       	rjmp	.-12     	; 0x1500 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x2e>
    150c:	8d 30       	cpi	r24, 0x0D	; 13
    150e:	68 f0       	brcs	.+26     	; 0x152a <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x58>
    1510:	8d 30       	cpi	r24, 0x0D	; 13
    1512:	29 f1       	breq	.+74     	; 0x155e <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x8c>
    1514:	8e 30       	cpi	r24, 0x0E	; 14
    1516:	31 f1       	breq	.+76     	; 0x1564 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x92>
    1518:	81 e1       	ldi	r24, 0x11	; 17
    151a:	90 e0       	ldi	r25, 0x00	; 0
    151c:	28 9f       	mul	r18, r24
    151e:	a0 01       	movw	r20, r0
    1520:	29 9f       	mul	r18, r25
    1522:	50 0d       	add	r21, r0
    1524:	11 24       	eor	r1, r1
    1526:	85 2f       	mov	r24, r21
    1528:	08 95       	ret
    152a:	89 30       	cpi	r24, 0x09	; 9
    152c:	60 f0       	brcs	.+24     	; 0x1546 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x74>
    152e:	8b 30       	cpi	r24, 0x0B	; 11
    1530:	28 f0       	brcs	.+10     	; 0x153c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x6a>
    1532:	8c 30       	cpi	r24, 0x0C	; 12
    1534:	d1 f4       	brne	.+52     	; 0x156a <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x98>
    1536:	85 e1       	ldi	r24, 0x15	; 21
    1538:	90 e0       	ldi	r25, 0x00	; 0
    153a:	f0 cf       	rjmp	.-32     	; 0x151c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
    153c:	8a 30       	cpi	r24, 0x0A	; 10
    153e:	c1 f4       	brne	.+48     	; 0x1570 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x9e>
    1540:	89 e1       	ldi	r24, 0x19	; 25
    1542:	90 e0       	ldi	r25, 0x00	; 0
    1544:	eb cf       	rjmp	.-42     	; 0x151c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
    1546:	87 30       	cpi	r24, 0x07	; 7
    1548:	28 f0       	brcs	.+10     	; 0x1554 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x82>
    154a:	88 30       	cpi	r24, 0x08	; 8
    154c:	a1 f4       	brne	.+40     	; 0x1576 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xa4>
    154e:	80 e2       	ldi	r24, 0x20	; 32
    1550:	90 e0       	ldi	r25, 0x00	; 0
    1552:	e4 cf       	rjmp	.-56     	; 0x151c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
    1554:	86 30       	cpi	r24, 0x06	; 6
    1556:	91 f4       	brne	.+36     	; 0x157c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xaa>
    1558:	8a e2       	ldi	r24, 0x2A	; 42
    155a:	90 e0       	ldi	r25, 0x00	; 0
    155c:	df cf       	rjmp	.-66     	; 0x151c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
    155e:	83 e1       	ldi	r24, 0x13	; 19
    1560:	90 e0       	ldi	r25, 0x00	; 0
    1562:	dc cf       	rjmp	.-72     	; 0x151c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
    1564:	82 e1       	ldi	r24, 0x12	; 18
    1566:	90 e0       	ldi	r25, 0x00	; 0
    1568:	d9 cf       	rjmp	.-78     	; 0x151c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
    156a:	87 e1       	ldi	r24, 0x17	; 23
    156c:	90 e0       	ldi	r25, 0x00	; 0
    156e:	d6 cf       	rjmp	.-84     	; 0x151c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
    1570:	8c e1       	ldi	r24, 0x1C	; 28
    1572:	90 e0       	ldi	r25, 0x00	; 0
    1574:	d3 cf       	rjmp	.-90     	; 0x151c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
    1576:	84 e2       	ldi	r24, 0x24	; 36
    1578:	90 e0       	ldi	r25, 0x00	; 0
    157a:	d0 cf       	rjmp	.-96     	; 0x151c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
    157c:	83 e3       	ldi	r24, 0x33	; 51
    157e:	90 e0       	ldi	r25, 0x00	; 0
    1580:	cd cf       	rjmp	.-102    	; 0x151c <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x4a>
    1582:	99 30       	cpi	r25, 0x09	; 9
    1584:	48 f0       	brcs	.+18     	; 0x1598 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xc6>
    1586:	2b 30       	cpi	r18, 0x0B	; 11
    1588:	a0 f4       	brcc	.+40     	; 0x15b2 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xe0>
    158a:	27 30       	cpi	r18, 0x07	; 7
    158c:	a0 f4       	brcc	.+40     	; 0x15b6 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xe4>
    158e:	81 e0       	ldi	r24, 0x01	; 1
    1590:	24 30       	cpi	r18, 0x04	; 4
    1592:	08 f4       	brcc	.+2      	; 0x1596 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xc4>
    1594:	a6 cf       	rjmp	.-180    	; 0x14e2 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x10>
    1596:	08 95       	ret
    1598:	95 30       	cpi	r25, 0x05	; 5
    159a:	30 f0       	brcs	.+12     	; 0x15a8 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xd6>
    159c:	26 30       	cpi	r18, 0x06	; 6
    159e:	58 f4       	brcc	.+22     	; 0x15b6 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xe4>
    15a0:	81 e0       	ldi	r24, 0x01	; 1
    15a2:	23 30       	cpi	r18, 0x03	; 3
    15a4:	c0 f7       	brcc	.-16     	; 0x1596 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xc4>
    15a6:	9d cf       	rjmp	.-198    	; 0x14e2 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0x10>
    15a8:	93 30       	cpi	r25, 0x03	; 3
    15aa:	d0 f7       	brcc	.-12     	; 0x15a0 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xce>
    15ac:	82 2f       	mov	r24, r18
    15ae:	86 95       	lsr	r24
    15b0:	08 95       	ret
    15b2:	83 e0       	ldi	r24, 0x03	; 3
    15b4:	08 95       	ret
    15b6:	82 e0       	ldi	r24, 0x02	; 2
    15b8:	ee cf       	rjmp	.-36     	; 0x1596 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv+0xc4>

000015ba <_ZN8Internal23Generic_1_kHz_Generator13zero_providerEv>:
    15ba:	80 e0       	ldi	r24, 0x00	; 0
    15bc:	08 95       	ret

000015be <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb>:
    15be:	fc 01       	movw	r30, r24
    15c0:	82 81       	ldd	r24, Z+2	; 0x02
    15c2:	90 e0       	ldi	r25, 0x00	; 0
    15c4:	81 30       	cpi	r24, 0x01	; 1
    15c6:	39 f4       	brne	.+14     	; 0x15d6 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x18>
    15c8:	91 e0       	ldi	r25, 0x01	; 1
    15ca:	61 11       	cpse	r22, r1
    15cc:	04 c0       	rjmp	.+8      	; 0x15d6 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x18>
    15ce:	97 81       	ldd	r25, Z+7	; 0x07
    15d0:	93 fb       	bst	r25, 3
    15d2:	99 27       	eor	r25, r25
    15d4:	90 f9       	bld	r25, 0
    15d6:	81 81       	ldd	r24, Z+1	; 0x01
    15d8:	81 30       	cpi	r24, 0x01	; 1
    15da:	81 f4       	brne	.+32     	; 0x15fc <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x3e>
    15dc:	84 81       	ldd	r24, Z+4	; 0x04
    15de:	81 11       	cpse	r24, r1
    15e0:	06 c0       	rjmp	.+12     	; 0x15ee <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x30>
    15e2:	81 e0       	ldi	r24, 0x01	; 1
    15e4:	25 81       	ldd	r18, Z+5	; 0x05
    15e6:	21 11       	cpse	r18, r1
    15e8:	07 c0       	rjmp	.+14     	; 0x15f8 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x3a>
    15ea:	80 e0       	ldi	r24, 0x00	; 0
    15ec:	05 c0       	rjmp	.+10     	; 0x15f8 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x3a>
    15ee:	81 30       	cpi	r24, 0x01	; 1
    15f0:	e1 f7       	brne	.-8      	; 0x15ea <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x2c>
    15f2:	25 81       	ldd	r18, Z+5	; 0x05
    15f4:	21 11       	cpse	r18, r1
    15f6:	f9 cf       	rjmp	.-14     	; 0x15ea <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x2c>
    15f8:	89 23       	and	r24, r25
    15fa:	08 95       	ret
    15fc:	87 30       	cpi	r24, 0x07	; 7
    15fe:	21 f0       	breq	.+8      	; 0x1608 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x4a>
    1600:	84 30       	cpi	r24, 0x04	; 4
    1602:	11 f0       	breq	.+4      	; 0x1608 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x4a>
    1604:	80 31       	cpi	r24, 0x10	; 16
    1606:	39 f4       	brne	.+14     	; 0x1616 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x58>
    1608:	84 81       	ldd	r24, Z+4	; 0x04
    160a:	81 30       	cpi	r24, 0x01	; 1
    160c:	59 f3       	breq	.-42     	; 0x15e4 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x26>
    160e:	82 30       	cpi	r24, 0x02	; 2
    1610:	61 f7       	brne	.-40     	; 0x15ea <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x2c>
    1612:	81 e0       	ldi	r24, 0x01	; 1
    1614:	ee cf       	rjmp	.-36     	; 0x15f2 <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb+0x34>
    1616:	80 e0       	ldi	r24, 0x00	; 0
    1618:	08 95       	ret

0000161a <_ZNK8Internal13DCF77_Encoder11get_weekdayEv>:
    161a:	fc 01       	movw	r30, r24
    161c:	62 81       	ldd	r22, Z+2	; 0x02
    161e:	62 33       	cpi	r22, 0x32	; 50
    1620:	08 f0       	brcs	.+2      	; 0x1624 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0xa>
    1622:	49 c0       	rjmp	.+146    	; 0x16b6 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x9c>
    1624:	91 81       	ldd	r25, Z+1	; 0x01
    1626:	93 31       	cpi	r25, 0x13	; 19
    1628:	08 f0       	brcs	.+2      	; 0x162c <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x12>
    162a:	45 c0       	rjmp	.+138    	; 0x16b6 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x9c>
    162c:	80 81       	ld	r24, Z
    162e:	8a 39       	cpi	r24, 0x9A	; 154
    1630:	08 f0       	brcs	.+2      	; 0x1634 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x1a>
    1632:	41 c0       	rjmp	.+130    	; 0x16b6 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x9c>
    1634:	86 2f       	mov	r24, r22
    1636:	82 95       	swap	r24
    1638:	8f 70       	andi	r24, 0x0F	; 15
    163a:	2a e0       	ldi	r18, 0x0A	; 10
    163c:	6f 70       	andi	r22, 0x0F	; 15
    163e:	36 2f       	mov	r19, r22
    1640:	82 9f       	mul	r24, r18
    1642:	30 0d       	add	r19, r0
    1644:	11 24       	eor	r1, r1
    1646:	49 2f       	mov	r20, r25
    1648:	93 30       	cpi	r25, 0x03	; 3
    164a:	58 f5       	brcc	.+86     	; 0x16a2 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x88>
    164c:	50 e0       	ldi	r21, 0x00	; 0
    164e:	46 5f       	subi	r20, 0xF6	; 246
    1650:	5f 4f       	sbci	r21, 0xFF	; 255
    1652:	20 81       	ld	r18, Z
    1654:	82 2f       	mov	r24, r18
    1656:	82 95       	swap	r24
    1658:	8f 70       	andi	r24, 0x0F	; 15
    165a:	2f 70       	andi	r18, 0x0F	; 15
    165c:	6a e0       	ldi	r22, 0x0A	; 10
    165e:	86 9f       	mul	r24, r22
    1660:	20 0d       	add	r18, r0
    1662:	11 24       	eor	r1, r1
    1664:	81 e0       	ldi	r24, 0x01	; 1
    1666:	93 30       	cpi	r25, 0x03	; 3
    1668:	08 f0       	brcs	.+2      	; 0x166c <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x52>
    166a:	80 e0       	ldi	r24, 0x00	; 0
    166c:	28 1b       	sub	r18, r24
    166e:	6a e1       	ldi	r22, 0x1A	; 26
    1670:	64 9f       	mul	r22, r20
    1672:	c0 01       	movw	r24, r0
    1674:	65 9f       	mul	r22, r21
    1676:	90 0d       	add	r25, r0
    1678:	11 24       	eor	r1, r1
    167a:	02 97       	sbiw	r24, 0x02	; 2
    167c:	6a e0       	ldi	r22, 0x0A	; 10
    167e:	70 e0       	ldi	r23, 0x00	; 0
    1680:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    1684:	82 2f       	mov	r24, r18
    1686:	83 0f       	add	r24, r19
    1688:	26 95       	lsr	r18
    168a:	26 95       	lsr	r18
    168c:	82 0f       	add	r24, r18
    168e:	86 0f       	add	r24, r22
    1690:	87 30       	cpi	r24, 0x07	; 7
    1692:	90 f0       	brcs	.+36     	; 0x16b8 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x9e>
    1694:	87 50       	subi	r24, 0x07	; 7
    1696:	68 2f       	mov	r22, r24
    1698:	66 95       	lsr	r22
    169a:	66 95       	lsr	r22
    169c:	66 95       	lsr	r22
    169e:	87 70       	andi	r24, 0x07	; 7
    16a0:	f6 cf       	rjmp	.-20     	; 0x168e <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x74>
    16a2:	4f 70       	andi	r20, 0x0F	; 15
    16a4:	89 2f       	mov	r24, r25
    16a6:	82 95       	swap	r24
    16a8:	8f 70       	andi	r24, 0x0F	; 15
    16aa:	82 9f       	mul	r24, r18
    16ac:	40 0d       	add	r20, r0
    16ae:	11 24       	eor	r1, r1
    16b0:	42 50       	subi	r20, 0x02	; 2
    16b2:	55 0b       	sbc	r21, r21
    16b4:	ce cf       	rjmp	.-100    	; 0x1652 <_ZNK8Internal13DCF77_Encoder11get_weekdayEv+0x38>
    16b6:	8f ef       	ldi	r24, 0xFF	; 255
    16b8:	08 95       	ret

000016ba <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv>:
    16ba:	0f 93       	push	r16
    16bc:	1f 93       	push	r17
    16be:	cf 93       	push	r28
    16c0:	df 93       	push	r29
    16c2:	ec 01       	movw	r28, r24
    16c4:	0e 94 0d 0b 	call	0x161a	; 0x161a <_ZNK8Internal13DCF77_Encoder11get_weekdayEv>
    16c8:	81 11       	cpse	r24, r1
    16ca:	01 c0       	rjmp	.+2      	; 0x16ce <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x14>
    16cc:	87 e0       	ldi	r24, 0x07	; 7
    16ce:	8b 83       	std	Y+3, r24	; 0x03
    16d0:	19 81       	ldd	r17, Y+1	; 0x01
    16d2:	0a 81       	ldd	r16, Y+2	; 0x02
    16d4:	13 30       	cpi	r17, 0x03	; 3
    16d6:	d8 f4       	brcc	.+54     	; 0x170e <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x54>
    16d8:	8f 81       	ldd	r24, Y+7	; 0x07
    16da:	8e 7f       	andi	r24, 0xFE	; 254
    16dc:	8f 83       	std	Y+7, r24	; 0x07
    16de:	05 32       	cpi	r16, 0x25	; 37
    16e0:	30 f0       	brcs	.+12     	; 0x16ee <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x34>
    16e2:	ce 01       	movw	r24, r28
    16e4:	0e 94 0d 0b 	call	0x161a	; 0x161a <_ZNK8Internal13DCF77_Encoder11get_weekdayEv>
    16e8:	88 23       	and	r24, r24
    16ea:	09 f4       	brne	.+2      	; 0x16ee <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x34>
    16ec:	46 c0       	rjmp	.+140    	; 0x177a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xc0>
    16ee:	8f 81       	ldd	r24, Y+7	; 0x07
    16f0:	8b 7f       	andi	r24, 0xFB	; 251
    16f2:	8f 83       	std	Y+7, r24	; 0x07
    16f4:	60 e0       	ldi	r22, 0x00	; 0
    16f6:	ce 01       	movw	r24, r28
    16f8:	0e 94 df 0a 	call	0x15be	; 0x15be <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb>
    16fc:	9f 81       	ldd	r25, Y+7	; 0x07
    16fe:	80 fb       	bst	r24, 0
    1700:	93 f9       	bld	r25, 3
    1702:	9f 83       	std	Y+7, r25	; 0x07
    1704:	df 91       	pop	r29
    1706:	cf 91       	pop	r28
    1708:	1f 91       	pop	r17
    170a:	0f 91       	pop	r16
    170c:	08 95       	ret
    170e:	13 30       	cpi	r17, 0x03	; 3
    1710:	b1 f4       	brne	.+44     	; 0x173e <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x84>
    1712:	05 32       	cpi	r16, 0x25	; 37
    1714:	08 f3       	brcs	.-62     	; 0x16d8 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x1e>
    1716:	ce 01       	movw	r24, r28
    1718:	0e 94 0d 0b 	call	0x161a	; 0x161a <_ZNK8Internal13DCF77_Encoder11get_weekdayEv>
    171c:	88 23       	and	r24, r24
    171e:	49 f0       	breq	.+18     	; 0x1732 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x78>
    1720:	20 2f       	mov	r18, r16
    1722:	28 1b       	sub	r18, r24
    1724:	33 0b       	sbc	r19, r19
    1726:	25 32       	cpi	r18, 0x25	; 37
    1728:	31 05       	cpc	r19, r1
    172a:	b4 f2       	brlt	.-84     	; 0x16d8 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x1e>
    172c:	8f 81       	ldd	r24, Y+7	; 0x07
    172e:	81 60       	ori	r24, 0x01	; 1
    1730:	d5 cf       	rjmp	.-86     	; 0x16dc <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x22>
    1732:	91 e0       	ldi	r25, 0x01	; 1
    1734:	8c 81       	ldd	r24, Y+4	; 0x04
    1736:	82 30       	cpi	r24, 0x02	; 2
    1738:	d8 f4       	brcc	.+54     	; 0x1770 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xb6>
    173a:	90 e0       	ldi	r25, 0x00	; 0
    173c:	19 c0       	rjmp	.+50     	; 0x1770 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xb6>
    173e:	10 31       	cpi	r17, 0x10	; 16
    1740:	a8 f3       	brcs	.-22     	; 0x172c <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x72>
    1742:	10 31       	cpi	r17, 0x10	; 16
    1744:	49 f6       	brne	.-110    	; 0x16d8 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x1e>
    1746:	05 32       	cpi	r16, 0x25	; 37
    1748:	88 f3       	brcs	.-30     	; 0x172c <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x72>
    174a:	ce 01       	movw	r24, r28
    174c:	0e 94 0d 0b 	call	0x161a	; 0x161a <_ZNK8Internal13DCF77_Encoder11get_weekdayEv>
    1750:	88 23       	and	r24, r24
    1752:	39 f0       	breq	.+14     	; 0x1762 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xa8>
    1754:	20 2f       	mov	r18, r16
    1756:	28 1b       	sub	r18, r24
    1758:	33 0b       	sbc	r19, r19
    175a:	25 32       	cpi	r18, 0x25	; 37
    175c:	31 05       	cpc	r19, r1
    175e:	34 f3       	brlt	.-52     	; 0x172c <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x72>
    1760:	bb cf       	rjmp	.-138    	; 0x16d8 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x1e>
    1762:	8c 81       	ldd	r24, Y+4	; 0x04
    1764:	82 30       	cpi	r24, 0x02	; 2
    1766:	09 f4       	brne	.+2      	; 0x176a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xb0>
    1768:	bc cf       	rjmp	.-136    	; 0x16e2 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x28>
    176a:	91 e0       	ldi	r25, 0x01	; 1
    176c:	82 30       	cpi	r24, 0x02	; 2
    176e:	28 f7       	brcc	.-54     	; 0x173a <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x80>
    1770:	8f 81       	ldd	r24, Y+7	; 0x07
    1772:	90 fb       	bst	r25, 0
    1774:	80 f9       	bld	r24, 0
    1776:	8f 83       	std	Y+7, r24	; 0x07
    1778:	b4 cf       	rjmp	.-152    	; 0x16e2 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x28>
    177a:	13 30       	cpi	r17, 0x03	; 3
    177c:	a1 f4       	brne	.+40     	; 0x17a6 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xec>
    177e:	8f 81       	ldd	r24, Y+7	; 0x07
    1780:	2c 81       	ldd	r18, Y+4	; 0x04
    1782:	98 2f       	mov	r25, r24
    1784:	91 70       	andi	r25, 0x01	; 1
    1786:	80 ff       	sbrs	r24, 0
    1788:	07 c0       	rjmp	.+14     	; 0x1798 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xde>
    178a:	23 30       	cpi	r18, 0x03	; 3
    178c:	b1 f4       	brne	.+44     	; 0x17ba <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x100>
    178e:	91 e0       	ldi	r25, 0x01	; 1
    1790:	2d 81       	ldd	r18, Y+5	; 0x05
    1792:	22 23       	and	r18, r18
    1794:	99 f0       	breq	.+38     	; 0x17bc <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x102>
    1796:	11 c0       	rjmp	.+34     	; 0x17ba <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x100>
    1798:	21 30       	cpi	r18, 0x01	; 1
    179a:	81 f4       	brne	.+32     	; 0x17bc <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x102>
    179c:	91 e0       	ldi	r25, 0x01	; 1
    179e:	2d 81       	ldd	r18, Y+5	; 0x05
    17a0:	21 11       	cpse	r18, r1
    17a2:	0c c0       	rjmp	.+24     	; 0x17bc <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x102>
    17a4:	0a c0       	rjmp	.+20     	; 0x17ba <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x100>
    17a6:	10 31       	cpi	r17, 0x10	; 16
    17a8:	79 f4       	brne	.+30     	; 0x17c8 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x10e>
    17aa:	8f 81       	ldd	r24, Y+7	; 0x07
    17ac:	2c 81       	ldd	r18, Y+4	; 0x04
    17ae:	98 2f       	mov	r25, r24
    17b0:	91 70       	andi	r25, 0x01	; 1
    17b2:	80 ff       	sbrs	r24, 0
    17b4:	06 c0       	rjmp	.+12     	; 0x17c2 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x108>
    17b6:	22 30       	cpi	r18, 0x02	; 2
    17b8:	89 f3       	breq	.-30     	; 0x179c <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xe2>
    17ba:	90 e0       	ldi	r25, 0x00	; 0
    17bc:	90 fb       	bst	r25, 0
    17be:	82 f9       	bld	r24, 2
    17c0:	98 cf       	rjmp	.-208    	; 0x16f2 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x38>
    17c2:	22 30       	cpi	r18, 0x02	; 2
    17c4:	d9 f7       	brne	.-10     	; 0x17bc <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x102>
    17c6:	e3 cf       	rjmp	.-58     	; 0x178e <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0xd4>
    17c8:	13 31       	cpi	r17, 0x13	; 19
    17ca:	08 f4       	brcc	.+2      	; 0x17ce <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x114>
    17cc:	90 cf       	rjmp	.-224    	; 0x16ee <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x34>
    17ce:	92 cf       	rjmp	.-220    	; 0x16f4 <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv+0x3a>

000017d0 <_ZNK8Internal13DCF77_Encoder14days_per_monthEv>:
    17d0:	dc 01       	movw	r26, r24
    17d2:	11 96       	adiw	r26, 0x01	; 1
    17d4:	ec 91       	ld	r30, X
    17d6:	e1 50       	subi	r30, 0x01	; 1
    17d8:	e2 31       	cpi	r30, 0x12	; 18
    17da:	48 f5       	brcc	.+82     	; 0x182e <_ZNK8Internal13DCF77_Encoder14days_per_monthEv+0x5e>
    17dc:	f0 e0       	ldi	r31, 0x00	; 0
    17de:	ed 50       	subi	r30, 0x0D	; 13
    17e0:	f4 4f       	sbci	r31, 0xF4	; 244
    17e2:	0c 94 df 29 	jmp	0x53be	; 0x53be <__tablejump2__>
    17e6:	19 0c       	add	r1, r9
    17e8:	07 0c       	add	r0, r7
    17ea:	19 0c       	add	r1, r9
    17ec:	05 0c       	add	r0, r5
    17ee:	19 0c       	add	r1, r9
    17f0:	05 0c       	add	r0, r5
    17f2:	19 0c       	add	r1, r9
    17f4:	19 0c       	add	r1, r9
    17f6:	05 0c       	add	r0, r5
    17f8:	17 0c       	add	r1, r7
    17fa:	17 0c       	add	r1, r7
    17fc:	17 0c       	add	r1, r7
    17fe:	17 0c       	add	r1, r7
    1800:	17 0c       	add	r1, r7
    1802:	17 0c       	add	r1, r7
    1804:	19 0c       	add	r1, r9
    1806:	05 0c       	add	r0, r5
    1808:	19 0c       	add	r1, r9
    180a:	8e e1       	ldi	r24, 0x1E	; 30
    180c:	08 95       	ret
    180e:	fc 01       	movw	r30, r24
    1810:	80 81       	ld	r24, Z
    1812:	88 23       	and	r24, r24
    1814:	81 f0       	breq	.+32     	; 0x1836 <_ZNK8Internal13DCF77_Encoder14days_per_monthEv+0x66>
    1816:	98 2f       	mov	r25, r24
    1818:	92 95       	swap	r25
    181a:	9f 70       	andi	r25, 0x0F	; 15
    181c:	8f 70       	andi	r24, 0x0F	; 15
    181e:	fa e0       	ldi	r31, 0x0A	; 10
    1820:	9f 9f       	mul	r25, r31
    1822:	80 0d       	add	r24, r0
    1824:	11 24       	eor	r1, r1
    1826:	83 70       	andi	r24, 0x03	; 3
    1828:	31 f4       	brne	.+12     	; 0x1836 <_ZNK8Internal13DCF77_Encoder14days_per_monthEv+0x66>
    182a:	8d e1       	ldi	r24, 0x1D	; 29
    182c:	08 95       	ret
    182e:	80 e0       	ldi	r24, 0x00	; 0
    1830:	08 95       	ret
    1832:	8f e1       	ldi	r24, 0x1F	; 31
    1834:	08 95       	ret
    1836:	8c e1       	ldi	r24, 0x1C	; 28
    1838:	08 95       	ret

0000183a <_ZN8Internal18DCF77_Flag_Decoder9cummulateERab>:
    183a:	fc 01       	movw	r30, r24
    183c:	90 81       	ld	r25, Z
    183e:	66 23       	and	r22, r22
    1840:	39 f0       	breq	.+14     	; 0x1850 <_ZN8Internal18DCF77_Flag_Decoder9cummulateERab+0x16>
    1842:	21 e0       	ldi	r18, 0x01	; 1
    1844:	9f 37       	cpi	r25, 0x7F	; 127
    1846:	09 f4       	brne	.+2      	; 0x184a <_ZN8Internal18DCF77_Flag_Decoder9cummulateERab+0x10>
    1848:	20 e0       	ldi	r18, 0x00	; 0
    184a:	92 0f       	add	r25, r18
    184c:	90 83       	st	Z, r25
    184e:	08 95       	ret
    1850:	81 e0       	ldi	r24, 0x01	; 1
    1852:	92 38       	cpi	r25, 0x82	; 130
    1854:	0c f4       	brge	.+2      	; 0x1858 <_ZN8Internal18DCF77_Flag_Decoder9cummulateERab+0x1e>
    1856:	80 e0       	ldi	r24, 0x00	; 0
    1858:	98 1b       	sub	r25, r24
    185a:	f8 cf       	rjmp	.-16     	; 0x184c <_ZN8Internal18DCF77_Flag_Decoder9cummulateERab+0x12>

0000185c <_ZN8Internal16Arithmetic_Tools6parityEh>:
    185c:	98 2f       	mov	r25, r24
    185e:	9f 70       	andi	r25, 0x0F	; 15
    1860:	82 95       	swap	r24
    1862:	8f 70       	andi	r24, 0x0F	; 15
    1864:	98 27       	eor	r25, r24
    1866:	89 2f       	mov	r24, r25
    1868:	83 70       	andi	r24, 0x03	; 3
    186a:	96 95       	lsr	r25
    186c:	96 95       	lsr	r25
    186e:	98 27       	eor	r25, r24
    1870:	89 2f       	mov	r24, r25
    1872:	81 70       	andi	r24, 0x01	; 1
    1874:	96 95       	lsr	r25
    1876:	89 27       	eor	r24, r25
    1878:	08 95       	ret

0000187a <_ZN3BCD10int_to_bcdEh>:
    187a:	28 2f       	mov	r18, r24
    187c:	6a e0       	ldi	r22, 0x0A	; 10
    187e:	0e 94 6a 29 	call	0x52d4	; 0x52d4 <__udivmodqi4>
    1882:	96 ef       	ldi	r25, 0xF6	; 246
    1884:	89 9f       	mul	r24, r25
    1886:	20 0d       	add	r18, r0
    1888:	11 24       	eor	r1, r1
    188a:	82 95       	swap	r24
    188c:	80 7f       	andi	r24, 0xF0	; 240
    188e:	2f 70       	andi	r18, 0x0F	; 15
    1890:	82 2b       	or	r24, r18
    1892:	08 95       	ret

00001894 <_ZN8Internal7Binning7DecoderIhLj12EE14get_time_valueEv.constprop.76>:
    1894:	80 91 c0 03 	lds	r24, 0x03C0	; 0x8003c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xe>
    1898:	90 91 bf 03 	lds	r25, 0x03BF	; 0x8003bf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xd>
    189c:	89 1b       	sub	r24, r25
    189e:	99 0b       	sbc	r25, r25
    18a0:	02 97       	sbiw	r24, 0x02	; 2
    18a2:	7c f0       	brlt	.+30     	; 0x18c2 <_ZN8Internal7Binning7DecoderIhLj12EE14get_time_valueEv.constprop.76+0x2e>
    18a4:	80 91 c1 03 	lds	r24, 0x03C1	; 0x8003c1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xf>
    18a8:	90 91 be 03 	lds	r25, 0x03BE	; 0x8003be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
    18ac:	89 0f       	add	r24, r25
    18ae:	99 27       	eor	r25, r25
    18b0:	99 1f       	adc	r25, r25
    18b2:	01 96       	adiw	r24, 0x01	; 1
    18b4:	6c e0       	ldi	r22, 0x0C	; 12
    18b6:	70 e0       	ldi	r23, 0x00	; 0
    18b8:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    18bc:	8f 5f       	subi	r24, 0xFF	; 255
    18be:	0c 94 3d 0c 	jmp	0x187a	; 0x187a <_ZN3BCD10int_to_bcdEh>
    18c2:	8f ef       	ldi	r24, 0xFF	; 255
    18c4:	08 95       	ret

000018c6 <_ZN8Internal7Binning7DecoderIhLj31EE14get_time_valueEv.constprop.73>:
    18c6:	80 91 b0 03 	lds	r24, 0x03B0	; 0x8003b0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x21>
    18ca:	90 91 af 03 	lds	r25, 0x03AF	; 0x8003af <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x20>
    18ce:	89 1b       	sub	r24, r25
    18d0:	99 0b       	sbc	r25, r25
    18d2:	02 97       	sbiw	r24, 0x02	; 2
    18d4:	7c f0       	brlt	.+30     	; 0x18f4 <_ZN8Internal7Binning7DecoderIhLj31EE14get_time_valueEv.constprop.73+0x2e>
    18d6:	80 91 b1 03 	lds	r24, 0x03B1	; 0x8003b1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x22>
    18da:	90 91 ae 03 	lds	r25, 0x03AE	; 0x8003ae <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
    18de:	89 0f       	add	r24, r25
    18e0:	99 27       	eor	r25, r25
    18e2:	99 1f       	adc	r25, r25
    18e4:	01 96       	adiw	r24, 0x01	; 1
    18e6:	6f e1       	ldi	r22, 0x1F	; 31
    18e8:	70 e0       	ldi	r23, 0x00	; 0
    18ea:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    18ee:	8f 5f       	subi	r24, 0xFF	; 255
    18f0:	0c 94 3d 0c 	jmp	0x187a	; 0x187a <_ZN3BCD10int_to_bcdEh>
    18f4:	8f ef       	ldi	r24, 0xFF	; 255
    18f6:	08 95       	ret

000018f8 <_ZN8Internal7Binning7DecoderIhLj7EE14get_time_valueEv.constprop.70>:
    18f8:	80 91 8d 03 	lds	r24, 0x038D	; 0x80038d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x9>
    18fc:	90 91 8c 03 	lds	r25, 0x038C	; 0x80038c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x8>
    1900:	89 1b       	sub	r24, r25
    1902:	99 0b       	sbc	r25, r25
    1904:	02 97       	sbiw	r24, 0x02	; 2
    1906:	7c f0       	brlt	.+30     	; 0x1926 <_ZN8Internal7Binning7DecoderIhLj7EE14get_time_valueEv.constprop.70+0x2e>
    1908:	80 91 8e 03 	lds	r24, 0x038E	; 0x80038e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0xa>
    190c:	90 91 8b 03 	lds	r25, 0x038B	; 0x80038b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
    1910:	89 0f       	add	r24, r25
    1912:	99 27       	eor	r25, r25
    1914:	99 1f       	adc	r25, r25
    1916:	01 96       	adiw	r24, 0x01	; 1
    1918:	67 e0       	ldi	r22, 0x07	; 7
    191a:	70 e0       	ldi	r23, 0x00	; 0
    191c:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    1920:	8f 5f       	subi	r24, 0xFF	; 255
    1922:	0c 94 3d 0c 	jmp	0x187a	; 0x187a <_ZN3BCD10int_to_bcdEh>
    1926:	8f ef       	ldi	r24, 0xFF	; 255
    1928:	08 95       	ret

0000192a <_ZN8Internal7Binning7DecoderIhLj24EE14get_time_valueEv.constprop.67>:
    192a:	80 91 82 03 	lds	r24, 0x0382	; 0x800382 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1a>
    192e:	90 91 81 03 	lds	r25, 0x0381	; 0x800381 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x19>
    1932:	89 1b       	sub	r24, r25
    1934:	99 0b       	sbc	r25, r25
    1936:	02 97       	sbiw	r24, 0x02	; 2
    1938:	74 f0       	brlt	.+28     	; 0x1956 <_ZN8Internal7Binning7DecoderIhLj24EE14get_time_valueEv.constprop.67+0x2c>
    193a:	80 91 83 03 	lds	r24, 0x0383	; 0x800383 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1b>
    193e:	90 91 80 03 	lds	r25, 0x0380	; 0x800380 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
    1942:	89 0f       	add	r24, r25
    1944:	99 27       	eor	r25, r25
    1946:	99 1f       	adc	r25, r25
    1948:	01 96       	adiw	r24, 0x01	; 1
    194a:	68 e1       	ldi	r22, 0x18	; 24
    194c:	70 e0       	ldi	r23, 0x00	; 0
    194e:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    1952:	0c 94 3d 0c 	jmp	0x187a	; 0x187a <_ZN3BCD10int_to_bcdEh>
    1956:	8f ef       	ldi	r24, 0xFF	; 255
    1958:	08 95       	ret

0000195a <_ZN8Internal7Binning7DecoderIhLj60EE14get_time_valueEv.constprop.58>:
    195a:	80 91 1e 03 	lds	r24, 0x031E	; 0x80031e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3e>
    195e:	90 91 1d 03 	lds	r25, 0x031D	; 0x80031d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3d>
    1962:	89 1b       	sub	r24, r25
    1964:	99 0b       	sbc	r25, r25
    1966:	02 97       	sbiw	r24, 0x02	; 2
    1968:	74 f0       	brlt	.+28     	; 0x1986 <_ZN8Internal7Binning7DecoderIhLj60EE14get_time_valueEv.constprop.58+0x2c>
    196a:	80 91 1f 03 	lds	r24, 0x031F	; 0x80031f <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3f>
    196e:	90 91 1c 03 	lds	r25, 0x031C	; 0x80031c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3c>
    1972:	89 0f       	add	r24, r25
    1974:	99 27       	eor	r25, r25
    1976:	99 1f       	adc	r25, r25
    1978:	01 96       	adiw	r24, 0x01	; 1
    197a:	6c e3       	ldi	r22, 0x3C	; 60
    197c:	70 e0       	ldi	r23, 0x00	; 0
    197e:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    1982:	0c 94 3d 0c 	jmp	0x187a	; 0x187a <_ZN3BCD10int_to_bcdEh>
    1986:	8f ef       	ldi	r24, 0xFF	; 255
    1988:	08 95       	ret

0000198a <_ZN8Internal7Binning7DecoderIhLj10EE14get_time_valueEv>:
    198a:	fc 01       	movw	r30, r24
    198c:	84 85       	ldd	r24, Z+12	; 0x0c
    198e:	93 85       	ldd	r25, Z+11	; 0x0b
    1990:	89 1b       	sub	r24, r25
    1992:	99 0b       	sbc	r25, r25
    1994:	02 97       	sbiw	r24, 0x02	; 2
    1996:	64 f0       	brlt	.+24     	; 0x19b0 <_ZN8Internal7Binning7DecoderIhLj10EE14get_time_valueEv+0x26>
    1998:	85 85       	ldd	r24, Z+13	; 0x0d
    199a:	92 85       	ldd	r25, Z+10	; 0x0a
    199c:	89 0f       	add	r24, r25
    199e:	99 27       	eor	r25, r25
    19a0:	99 1f       	adc	r25, r25
    19a2:	01 96       	adiw	r24, 0x01	; 1
    19a4:	6a e0       	ldi	r22, 0x0A	; 10
    19a6:	70 e0       	ldi	r23, 0x00	; 0
    19a8:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    19ac:	0c 94 3d 0c 	jmp	0x187a	; 0x187a <_ZN3BCD10int_to_bcdEh>
    19b0:	8f ef       	ldi	r24, 0xFF	; 255
    19b2:	08 95       	ret

000019b4 <_ZN8Internal18DCF77_Year_Decoder14get_time_valueEv.constprop.60>:
    19b4:	cf 93       	push	r28
    19b6:	82 ec       	ldi	r24, 0xC2	; 194
    19b8:	93 e0       	ldi	r25, 0x03	; 3
    19ba:	0e 94 c5 0c 	call	0x198a	; 0x198a <_ZN8Internal7Binning7DecoderIhLj10EE14get_time_valueEv>
    19be:	c8 2f       	mov	r28, r24
    19c0:	80 ed       	ldi	r24, 0xD0	; 208
    19c2:	93 e0       	ldi	r25, 0x03	; 3
    19c4:	0e 94 c5 0c 	call	0x198a	; 0x198a <_ZN8Internal7Binning7DecoderIhLj10EE14get_time_valueEv>
    19c8:	cf 3f       	cpi	r28, 0xFF	; 255
    19ca:	39 f0       	breq	.+14     	; 0x19da <_ZN8Internal18DCF77_Year_Decoder14get_time_valueEv.constprop.60+0x26>
    19cc:	8f 3f       	cpi	r24, 0xFF	; 255
    19ce:	19 f0       	breq	.+6      	; 0x19d6 <_ZN8Internal18DCF77_Year_Decoder14get_time_valueEv.constprop.60+0x22>
    19d0:	82 95       	swap	r24
    19d2:	80 7f       	andi	r24, 0xF0	; 240
    19d4:	8c 0f       	add	r24, r28
    19d6:	cf 91       	pop	r28
    19d8:	08 95       	ret
    19da:	8f ef       	ldi	r24, 0xFF	; 255
    19dc:	fc cf       	rjmp	.-8      	; 0x19d6 <_ZN8Internal18DCF77_Year_Decoder14get_time_valueEv.constprop.60+0x22>

000019de <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17set_DCF77_EncoderERNS_13DCF77_EncoderE>:
    19de:	cf 93       	push	r28
    19e0:	df 93       	push	r29
    19e2:	ec 01       	movw	r28, r24
    19e4:	0e 94 a2 02 	call	0x544	; 0x544 <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.64>
    19e8:	8e 83       	std	Y+6, r24	; 0x06
    19ea:	0e 94 ad 0c 	call	0x195a	; 0x195a <_ZN8Internal7Binning7DecoderIhLj60EE14get_time_valueEv.constprop.58>
    19ee:	8d 83       	std	Y+5, r24	; 0x05
    19f0:	0e 94 95 0c 	call	0x192a	; 0x192a <_ZN8Internal7Binning7DecoderIhLj24EE14get_time_valueEv.constprop.67>
    19f4:	8c 83       	std	Y+4, r24	; 0x04
    19f6:	0e 94 7c 0c 	call	0x18f8	; 0x18f8 <_ZN8Internal7Binning7DecoderIhLj7EE14get_time_valueEv.constprop.70>
    19fa:	8b 83       	std	Y+3, r24	; 0x03
    19fc:	0e 94 63 0c 	call	0x18c6	; 0x18c6 <_ZN8Internal7Binning7DecoderIhLj31EE14get_time_valueEv.constprop.73>
    1a00:	8a 83       	std	Y+2, r24	; 0x02
    1a02:	0e 94 4a 0c 	call	0x1894	; 0x1894 <_ZN8Internal7Binning7DecoderIhLj12EE14get_time_valueEv.constprop.76>
    1a06:	89 83       	std	Y+1, r24	; 0x01
    1a08:	0e 94 da 0c 	call	0x19b4	; 0x19b4 <_ZN8Internal18DCF77_Year_Decoder14get_time_valueEv.constprop.60>
    1a0c:	88 83       	st	Y, r24
    1a0e:	8f 81       	ldd	r24, Y+7	; 0x07
    1a10:	90 91 63 02 	lds	r25, 0x0263	; 0x800263 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE>
    1a14:	90 fb       	bst	r25, 0
    1a16:	81 f9       	bld	r24, 1
    1a18:	8f 83       	std	Y+7, r24	; 0x07
    1a1a:	91 e0       	ldi	r25, 0x01	; 1
    1a1c:	80 91 64 02 	lds	r24, 0x0264	; 0x800264 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x1>
    1a20:	18 16       	cp	r1, r24
    1a22:	0c f0       	brlt	.+2      	; 0x1a26 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17set_DCF77_EncoderERNS_13DCF77_EncoderE+0x48>
    1a24:	90 e0       	ldi	r25, 0x00	; 0
    1a26:	8f 81       	ldd	r24, Y+7	; 0x07
    1a28:	90 fb       	bst	r25, 0
    1a2a:	82 f9       	bld	r24, 2
    1a2c:	90 91 65 02 	lds	r25, 0x0265	; 0x800265 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x2>
    1a30:	8e 7f       	andi	r24, 0xFE	; 254
    1a32:	97 ff       	sbrs	r25, 7
    1a34:	81 60       	ori	r24, 0x01	; 1
    1a36:	8f 83       	std	Y+7, r24	; 0x07
    1a38:	91 e0       	ldi	r25, 0x01	; 1
    1a3a:	80 91 66 02 	lds	r24, 0x0266	; 0x800266 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x3>
    1a3e:	18 16       	cp	r1, r24
    1a40:	0c f0       	brlt	.+2      	; 0x1a44 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17set_DCF77_EncoderERNS_13DCF77_EncoderE+0x66>
    1a42:	90 e0       	ldi	r25, 0x00	; 0
    1a44:	8f 81       	ldd	r24, Y+7	; 0x07
    1a46:	90 fb       	bst	r25, 0
    1a48:	83 f9       	bld	r24, 3
    1a4a:	8f 83       	std	Y+7, r24	; 0x07
    1a4c:	df 91       	pop	r29
    1a4e:	cf 91       	pop	r28
    1a50:	08 95       	ret

00001a52 <_ZN3BCD9incrementERNS_5bcd_tE>:
    1a52:	fc 01       	movw	r30, r24
    1a54:	90 81       	ld	r25, Z
    1a56:	29 2f       	mov	r18, r25
    1a58:	2f 70       	andi	r18, 0x0F	; 15
    1a5a:	90 7f       	andi	r25, 0xF0	; 240
    1a5c:	29 30       	cpi	r18, 0x09	; 9
    1a5e:	28 f4       	brcc	.+10     	; 0x1a6a <_ZN3BCD9incrementERNS_5bcd_tE+0x18>
    1a60:	2f 5f       	subi	r18, 0xFF	; 255
    1a62:	2f 70       	andi	r18, 0x0F	; 15
    1a64:	92 2b       	or	r25, r18
    1a66:	90 83       	st	Z, r25
    1a68:	08 95       	ret
    1a6a:	90 83       	st	Z, r25
    1a6c:	92 95       	swap	r25
    1a6e:	9f 70       	andi	r25, 0x0F	; 15
    1a70:	99 30       	cpi	r25, 0x09	; 9
    1a72:	20 f4       	brcc	.+8      	; 0x1a7c <_ZN3BCD9incrementERNS_5bcd_tE+0x2a>
    1a74:	9f 5f       	subi	r25, 0xFF	; 255
    1a76:	92 95       	swap	r25
    1a78:	90 7f       	andi	r25, 0xF0	; 240
    1a7a:	f5 cf       	rjmp	.-22     	; 0x1a66 <_ZN3BCD9incrementERNS_5bcd_tE+0x14>
    1a7c:	10 82       	st	Z, r1
    1a7e:	08 95       	ret

00001a80 <_ZN8Internal13DCF77_Encoder14advance_minuteEv>:
    1a80:	0f 93       	push	r16
    1a82:	1f 93       	push	r17
    1a84:	cf 93       	push	r28
    1a86:	df 93       	push	r29
    1a88:	fc 01       	movw	r30, r24
    1a8a:	25 81       	ldd	r18, Z+5	; 0x05
    1a8c:	29 35       	cpi	r18, 0x59	; 89
    1a8e:	38 f4       	brcc	.+14     	; 0x1a9e <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x1e>
    1a90:	05 96       	adiw	r24, 0x05	; 5
    1a92:	df 91       	pop	r29
    1a94:	cf 91       	pop	r28
    1a96:	1f 91       	pop	r17
    1a98:	0f 91       	pop	r16
    1a9a:	0c 94 29 0d 	jmp	0x1a52	; 0x1a52 <_ZN3BCD9incrementERNS_5bcd_tE>
    1a9e:	29 35       	cpi	r18, 0x59	; 89
    1aa0:	b1 f4       	brne	.+44     	; 0x1ace <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x4e>
    1aa2:	ec 01       	movw	r28, r24
    1aa4:	15 82       	std	Z+5, r1	; 0x05
    1aa6:	94 81       	ldd	r25, Z+4	; 0x04
    1aa8:	87 81       	ldd	r24, Z+7	; 0x07
    1aaa:	82 ff       	sbrs	r24, 2
    1aac:	19 c0       	rjmp	.+50     	; 0x1ae0 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x60>
    1aae:	80 fd       	sbrc	r24, 0
    1ab0:	13 c0       	rjmp	.+38     	; 0x1ad8 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x58>
    1ab2:	91 30       	cpi	r25, 0x01	; 1
    1ab4:	a9 f4       	brne	.+42     	; 0x1ae0 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x60>
    1ab6:	8f 01       	movw	r16, r30
    1ab8:	0c 5f       	subi	r16, 0xFC	; 252
    1aba:	1f 4f       	sbci	r17, 0xFF	; 255
    1abc:	c8 01       	movw	r24, r16
    1abe:	0e 94 29 0d 	call	0x1a52	; 0x1a52 <_ZN3BCD9incrementERNS_5bcd_tE>
    1ac2:	c8 01       	movw	r24, r16
    1ac4:	0e 94 29 0d 	call	0x1a52	; 0x1a52 <_ZN3BCD9incrementERNS_5bcd_tE>
    1ac8:	8f 81       	ldd	r24, Y+7	; 0x07
    1aca:	81 60       	ori	r24, 0x01	; 1
    1acc:	8f 83       	std	Y+7, r24	; 0x07
    1ace:	df 91       	pop	r29
    1ad0:	cf 91       	pop	r28
    1ad2:	1f 91       	pop	r17
    1ad4:	0f 91       	pop	r16
    1ad6:	08 95       	ret
    1ad8:	92 30       	cpi	r25, 0x02	; 2
    1ada:	11 f4       	brne	.+4      	; 0x1ae0 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x60>
    1adc:	8e 7f       	andi	r24, 0xFE	; 254
    1ade:	f6 cf       	rjmp	.-20     	; 0x1acc <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x4c>
    1ae0:	93 32       	cpi	r25, 0x23	; 35
    1ae2:	18 f4       	brcc	.+6      	; 0x1aea <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x6a>
    1ae4:	ce 01       	movw	r24, r28
    1ae6:	04 96       	adiw	r24, 0x04	; 4
    1ae8:	d4 cf       	rjmp	.-88     	; 0x1a92 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x12>
    1aea:	93 32       	cpi	r25, 0x23	; 35
    1aec:	81 f7       	brne	.-32     	; 0x1ace <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x4e>
    1aee:	1c 82       	std	Y+4, r1	; 0x04
    1af0:	8b 81       	ldd	r24, Y+3	; 0x03
    1af2:	87 30       	cpi	r24, 0x07	; 7
    1af4:	a8 f4       	brcc	.+42     	; 0x1b20 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0xa0>
    1af6:	ce 01       	movw	r24, r28
    1af8:	03 96       	adiw	r24, 0x03	; 3
    1afa:	0e 94 29 0d 	call	0x1a52	; 0x1a52 <_ZN3BCD9incrementERNS_5bcd_tE>
    1afe:	1a 81       	ldd	r17, Y+2	; 0x02
    1b00:	81 2f       	mov	r24, r17
    1b02:	82 95       	swap	r24
    1b04:	8f 70       	andi	r24, 0x0F	; 15
    1b06:	1f 70       	andi	r17, 0x0F	; 15
    1b08:	fa e0       	ldi	r31, 0x0A	; 10
    1b0a:	8f 9f       	mul	r24, r31
    1b0c:	10 0d       	add	r17, r0
    1b0e:	11 24       	eor	r1, r1
    1b10:	ce 01       	movw	r24, r28
    1b12:	0e 94 e8 0b 	call	0x17d0	; 0x17d0 <_ZNK8Internal13DCF77_Encoder14days_per_monthEv>
    1b16:	18 17       	cp	r17, r24
    1b18:	40 f4       	brcc	.+16     	; 0x1b2a <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0xaa>
    1b1a:	ce 01       	movw	r24, r28
    1b1c:	02 96       	adiw	r24, 0x02	; 2
    1b1e:	b9 cf       	rjmp	.-142    	; 0x1a92 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x12>
    1b20:	87 30       	cpi	r24, 0x07	; 7
    1b22:	69 f7       	brne	.-38     	; 0x1afe <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x7e>
    1b24:	81 e0       	ldi	r24, 0x01	; 1
    1b26:	8b 83       	std	Y+3, r24	; 0x03
    1b28:	ea cf       	rjmp	.-44     	; 0x1afe <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x7e>
    1b2a:	18 13       	cpse	r17, r24
    1b2c:	d0 cf       	rjmp	.-96     	; 0x1ace <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x4e>
    1b2e:	81 e0       	ldi	r24, 0x01	; 1
    1b30:	8a 83       	std	Y+2, r24	; 0x02
    1b32:	99 81       	ldd	r25, Y+1	; 0x01
    1b34:	92 31       	cpi	r25, 0x12	; 18
    1b36:	18 f4       	brcc	.+6      	; 0x1b3e <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0xbe>
    1b38:	ce 01       	movw	r24, r28
    1b3a:	01 96       	adiw	r24, 0x01	; 1
    1b3c:	aa cf       	rjmp	.-172    	; 0x1a92 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x12>
    1b3e:	92 31       	cpi	r25, 0x12	; 18
    1b40:	31 f6       	brne	.-116    	; 0x1ace <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x4e>
    1b42:	89 83       	std	Y+1, r24	; 0x01
    1b44:	88 81       	ld	r24, Y
    1b46:	89 39       	cpi	r24, 0x99	; 153
    1b48:	10 f4       	brcc	.+4      	; 0x1b4e <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0xce>
    1b4a:	ce 01       	movw	r24, r28
    1b4c:	a2 cf       	rjmp	.-188    	; 0x1a92 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x12>
    1b4e:	89 39       	cpi	r24, 0x99	; 153
    1b50:	09 f0       	breq	.+2      	; 0x1b54 <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0xd4>
    1b52:	bd cf       	rjmp	.-134    	; 0x1ace <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x4e>
    1b54:	18 82       	st	Y, r1
    1b56:	bb cf       	rjmp	.-138    	; 0x1ace <_ZN8Internal13DCF77_Encoder14advance_minuteEv+0x4e>

00001b58 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE>:
    1b58:	8f 92       	push	r8
    1b5a:	9f 92       	push	r9
    1b5c:	af 92       	push	r10
    1b5e:	bf 92       	push	r11
    1b60:	cf 92       	push	r12
    1b62:	df 92       	push	r13
    1b64:	ef 92       	push	r14
    1b66:	ff 92       	push	r15
    1b68:	0f 93       	push	r16
    1b6a:	1f 93       	push	r17
    1b6c:	cf 93       	push	r28
    1b6e:	df 93       	push	r29
    1b70:	cd b7       	in	r28, 0x3d	; 61
    1b72:	de b7       	in	r29, 0x3e	; 62
    1b74:	28 97       	sbiw	r28, 0x08	; 8
    1b76:	0f b6       	in	r0, 0x3f	; 63
    1b78:	f8 94       	cli
    1b7a:	de bf       	out	0x3e, r29	; 62
    1b7c:	0f be       	out	0x3f, r0	; 63
    1b7e:	cd bf       	out	0x3d, r28	; 61
    1b80:	8c 01       	movw	r16, r24
    1b82:	dc 01       	movw	r26, r24
    1b84:	15 96       	adiw	r26, 0x05	; 5
    1b86:	8c 91       	ld	r24, X
    1b88:	15 97       	sbiw	r26, 0x05	; 5
    1b8a:	8f 70       	andi	r24, 0x0F	; 15
    1b8c:	b8 2e       	mov	r11, r24
    1b8e:	16 96       	adiw	r26, 0x06	; 6
    1b90:	ec 91       	ld	r30, X
    1b92:	e0 90 e6 05 	lds	r14, 0x05E6	; 0x8005e6 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    1b96:	f0 90 e7 05 	lds	r15, 0x05E7	; 0x8005e7 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    1b9a:	2e 2f       	mov	r18, r30
    1b9c:	30 e0       	ldi	r19, 0x00	; 0
    1b9e:	50 e0       	ldi	r21, 0x00	; 0
    1ba0:	40 e0       	ldi	r20, 0x00	; 0
    1ba2:	25 50       	subi	r18, 0x05	; 5
    1ba4:	31 09       	sbc	r19, r1
    1ba6:	41 09       	sbc	r20, r1
    1ba8:	51 09       	sbc	r21, r1
    1baa:	ac e9       	ldi	r26, 0x9C	; 156
    1bac:	bf ef       	ldi	r27, 0xFF	; 255
    1bae:	0e 94 09 2a 	call	0x5412	; 0x5412 <__mulohisi3>
    1bb2:	9b 01       	movw	r18, r22
    1bb4:	ac 01       	movw	r20, r24
    1bb6:	2e 0d       	add	r18, r14
    1bb8:	3f 1d       	adc	r19, r15
    1bba:	41 1d       	adc	r20, r1
    1bbc:	51 1d       	adc	r21, r1
    1bbe:	69 01       	movw	r12, r18
    1bc0:	7a 01       	movw	r14, r20
    1bc2:	2b 2d       	mov	r18, r11
    1bc4:	30 e0       	ldi	r19, 0x00	; 0
    1bc6:	50 e0       	ldi	r21, 0x00	; 0
    1bc8:	40 e0       	ldi	r20, 0x00	; 0
    1bca:	80 91 e8 05 	lds	r24, 0x05E8	; 0x8005e8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x4>
    1bce:	28 1b       	sub	r18, r24
    1bd0:	31 09       	sbc	r19, r1
    1bd2:	41 09       	sbc	r20, r1
    1bd4:	51 09       	sbc	r21, r1
    1bd6:	a0 e9       	ldi	r26, 0x90	; 144
    1bd8:	b8 ee       	ldi	r27, 0xE8	; 232
    1bda:	0e 94 09 2a 	call	0x5412	; 0x5412 <__mulohisi3>
    1bde:	c6 0e       	add	r12, r22
    1be0:	d7 1e       	adc	r13, r23
    1be2:	e8 1e       	adc	r14, r24
    1be4:	f9 1e       	adc	r15, r25
    1be6:	31 e3       	ldi	r19, 0x31	; 49
    1be8:	c3 16       	cp	r12, r19
    1bea:	35 e7       	ldi	r19, 0x75	; 117
    1bec:	d3 06       	cpc	r13, r19
    1bee:	e1 04       	cpc	r14, r1
    1bf0:	f1 04       	cpc	r15, r1
    1bf2:	3c f0       	brlt	.+14     	; 0x1c02 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0xaa>
    1bf4:	40 e6       	ldi	r20, 0x60	; 96
    1bf6:	c4 1a       	sub	r12, r20
    1bf8:	4a ee       	ldi	r20, 0xEA	; 234
    1bfa:	d4 0a       	sbc	r13, r20
    1bfc:	e1 08       	sbc	r14, r1
    1bfe:	f1 08       	sbc	r15, r1
    1c00:	f2 cf       	rjmp	.-28     	; 0x1be6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x8e>
    1c02:	51 ed       	ldi	r21, 0xD1	; 209
    1c04:	c5 16       	cp	r12, r21
    1c06:	5a e8       	ldi	r21, 0x8A	; 138
    1c08:	d5 06       	cpc	r13, r21
    1c0a:	5f ef       	ldi	r21, 0xFF	; 255
    1c0c:	e5 06       	cpc	r14, r21
    1c0e:	f5 06       	cpc	r15, r21
    1c10:	3c f4       	brge	.+14     	; 0x1c20 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0xc8>
    1c12:	80 e6       	ldi	r24, 0x60	; 96
    1c14:	c8 0e       	add	r12, r24
    1c16:	8a ee       	ldi	r24, 0xEA	; 234
    1c18:	d8 1e       	adc	r13, r24
    1c1a:	e1 1c       	adc	r14, r1
    1c1c:	f1 1c       	adc	r15, r1
    1c1e:	f1 cf       	rjmp	.-30     	; 0x1c02 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0xaa>
    1c20:	d0 92 62 02 	sts	0x0262, r13	; 0x800262 <_ZN8Internal23DCF77_Frequency_Control9deviationE+0x1>
    1c24:	c0 92 61 02 	sts	0x0261, r12	; 0x800261 <_ZN8Internal23DCF77_Frequency_Control9deviationE>
    1c28:	e5 30       	cpi	r30, 0x05	; 5
    1c2a:	09 f0       	breq	.+2      	; 0x1c2e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0xd6>
    1c2c:	86 c0       	rjmp	.+268    	; 0x1d3a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x1e2>
    1c2e:	61 e0       	ldi	r22, 0x01	; 1
    1c30:	c8 01       	movw	r24, r16
    1c32:	0e 94 df 0a 	call	0x15be	; 0x15be <_ZNK8Internal13DCF77_Encoder28verify_leap_second_scheduledEb>
    1c36:	88 23       	and	r24, r24
    1c38:	29 f0       	breq	.+10     	; 0x1c44 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0xec>
    1c3a:	80 91 60 02 	lds	r24, 0x0260	; 0x800260 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    1c3e:	8d 7f       	andi	r24, 0xFD	; 253
    1c40:	80 93 60 02 	sts	0x0260, r24	; 0x800260 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    1c44:	80 91 60 02 	lds	r24, 0x0260	; 0x800260 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    1c48:	81 ff       	sbrs	r24, 1
    1c4a:	2c c1       	rjmp	.+600    	; 0x1ea4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x34c>
    1c4c:	80 91 60 02 	lds	r24, 0x0260	; 0x800260 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    1c50:	80 ff       	sbrs	r24, 0
    1c52:	20 c1       	rjmp	.+576    	; 0x1e94 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x33c>
    1c54:	80 91 e4 05 	lds	r24, 0x05E4	; 0x8005e4 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    1c58:	90 91 e5 05 	lds	r25, 0x05E5	; 0x8005e5 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    1c5c:	8e 34       	cpi	r24, 0x4E	; 78
    1c5e:	91 40       	sbci	r25, 0x01	; 1
    1c60:	08 f4       	brcc	.+2      	; 0x1c64 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x10c>
    1c62:	fd c0       	rjmp	.+506    	; 0x1e5e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x306>
    1c64:	80 91 61 02 	lds	r24, 0x0261	; 0x800261 <_ZN8Internal23DCF77_Frequency_Control9deviationE>
    1c68:	90 91 62 02 	lds	r25, 0x0262	; 0x800262 <_ZN8Internal23DCF77_Frequency_Control9deviationE+0x1>
    1c6c:	18 16       	cp	r1, r24
    1c6e:	19 06       	cpc	r1, r25
    1c70:	0c f4       	brge	.+2      	; 0x1c74 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x11c>
    1c72:	ee c0       	rjmp	.+476    	; 0x1e50 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x2f8>
    1c74:	80 91 61 02 	lds	r24, 0x0261	; 0x800261 <_ZN8Internal23DCF77_Frequency_Control9deviationE>
    1c78:	90 91 62 02 	lds	r25, 0x0262	; 0x800262 <_ZN8Internal23DCF77_Frequency_Control9deviationE+0x1>
    1c7c:	8c 3f       	cpi	r24, 0xFC	; 252
    1c7e:	9f 4f       	sbci	r25, 0xFF	; 255
    1c80:	0c f0       	brlt	.+2      	; 0x1c84 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x12c>
    1c82:	ed c0       	rjmp	.+474    	; 0x1e5e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x306>
    1c84:	8f b7       	in	r24, 0x3f	; 63
    1c86:	f8 94       	cli
    1c88:	e0 90 5d 02 	lds	r14, 0x025D	; 0x80025d <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE>
    1c8c:	f0 90 5e 02 	lds	r15, 0x025E	; 0x80025e <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE+0x1>
    1c90:	8f bf       	out	0x3f, r24	; 63
    1c92:	a0 91 61 02 	lds	r26, 0x0261	; 0x800261 <_ZN8Internal23DCF77_Frequency_Control9deviationE>
    1c96:	b0 91 62 02 	lds	r27, 0x0262	; 0x800262 <_ZN8Internal23DCF77_Frequency_Control9deviationE+0x1>
    1c9a:	40 91 e4 05 	lds	r20, 0x05E4	; 0x8005e4 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    1c9e:	50 91 e5 05 	lds	r21, 0x05E5	; 0x8005e5 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    1ca2:	2a e6       	ldi	r18, 0x6A	; 106
    1ca4:	3a e0       	ldi	r19, 0x0A	; 10
    1ca6:	0e 94 ff 29 	call	0x53fe	; 0x53fe <__usmulhisi3>
    1caa:	9a 01       	movw	r18, r20
    1cac:	50 e0       	ldi	r21, 0x00	; 0
    1cae:	40 e0       	ldi	r20, 0x00	; 0
    1cb0:	0e 94 c0 29 	call	0x5380	; 0x5380 <__divmodsi4>
    1cb4:	49 01       	movw	r8, r18
    1cb6:	80 91 e4 05 	lds	r24, 0x05E4	; 0x8005e4 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    1cba:	90 91 e5 05 	lds	r25, 0x05E5	; 0x8005e5 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    1cbe:	60 91 e4 05 	lds	r22, 0x05E4	; 0x8005e4 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    1cc2:	70 91 e5 05 	lds	r23, 0x05E5	; 0x8005e5 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    1cc6:	87 59       	subi	r24, 0x97	; 151
    1cc8:	95 4f       	sbci	r25, 0xF5	; 245
    1cca:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    1cce:	60 93 5f 02 	sts	0x025F, r22	; 0x80025f <_ZN8Internal23DCF77_Frequency_Control19confirmed_precisionE>
    1cd2:	80 91 5f 02 	lds	r24, 0x025F	; 0x80025f <_ZN8Internal23DCF77_Frequency_Control19confirmed_precisionE>
    1cd6:	81 11       	cpse	r24, r1
    1cd8:	03 c0       	rjmp	.+6      	; 0x1ce0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x188>
    1cda:	81 e0       	ldi	r24, 0x01	; 1
    1cdc:	80 93 5f 02 	sts	0x025F, r24	; 0x80025f <_ZN8Internal23DCF77_Frequency_Control19confirmed_precisionE>
    1ce0:	c7 01       	movw	r24, r14
    1ce2:	88 19       	sub	r24, r8
    1ce4:	99 09       	sbc	r25, r9
    1ce6:	80 33       	cpi	r24, 0x30	; 48
    1ce8:	f8 ef       	ldi	r31, 0xF8	; 248
    1cea:	9f 07       	cpc	r25, r31
    1cec:	14 f4       	brge	.+4      	; 0x1cf2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x19a>
    1cee:	80 e3       	ldi	r24, 0x30	; 48
    1cf0:	98 ef       	ldi	r25, 0xF8	; 248
    1cf2:	2f b7       	in	r18, 0x3f	; 63
    1cf4:	f8 94       	cli
    1cf6:	81 3d       	cpi	r24, 0xD1	; 209
    1cf8:	37 e0       	ldi	r19, 0x07	; 7
    1cfa:	93 07       	cpc	r25, r19
    1cfc:	14 f0       	brlt	.+4      	; 0x1d02 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x1aa>
    1cfe:	80 ed       	ldi	r24, 0xD0	; 208
    1d00:	97 e0       	ldi	r25, 0x07	; 7
    1d02:	90 93 5e 02 	sts	0x025E, r25	; 0x80025e <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE+0x1>
    1d06:	80 93 5d 02 	sts	0x025D, r24	; 0x80025d <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE>
    1d0a:	2f bf       	out	0x3f, r18	; 63
    1d0c:	88 eb       	ldi	r24, 0xB8	; 184
    1d0e:	9b e0       	ldi	r25, 0x0B	; 11
    1d10:	90 93 c9 05 	sts	0x05C9, r25	; 0x8005c9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd3>
    1d14:	80 93 c8 05 	sts	0x05C8, r24	; 0x8005c8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd2>
    1d18:	80 e3       	ldi	r24, 0x30	; 48
    1d1a:	95 e7       	ldi	r25, 0x75	; 117
    1d1c:	a0 e0       	ldi	r26, 0x00	; 0
    1d1e:	b0 e0       	ldi	r27, 0x00	; 0
    1d20:	80 93 bd 02 	sts	0x02BD, r24	; 0x8002bd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x11>
    1d24:	90 93 be 02 	sts	0x02BE, r25	; 0x8002be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x12>
    1d28:	a0 93 bf 02 	sts	0x02BF, r26	; 0x8002bf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x13>
    1d2c:	b0 93 c0 02 	sts	0x02C0, r27	; 0x8002c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x14>
    1d30:	80 91 60 02 	lds	r24, 0x0260	; 0x800260 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    1d34:	8d 7f       	andi	r24, 0xFD	; 253
    1d36:	80 93 60 02 	sts	0x0260, r24	; 0x800260 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    1d3a:	d8 01       	movw	r26, r16
    1d3c:	16 96       	adiw	r26, 0x06	; 6
    1d3e:	8c 91       	ld	r24, X
    1d40:	8f 30       	cpi	r24, 0x0F	; 15
    1d42:	09 f0       	breq	.+2      	; 0x1d46 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x1ee>
    1d44:	94 c0       	rjmp	.+296    	; 0x1e6e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x316>
    1d46:	80 91 ac 02 	lds	r24, 0x02AC	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    1d4a:	90 91 ad 02 	lds	r25, 0x02AD	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    1d4e:	02 97       	sbiw	r24, 0x02	; 2
    1d50:	08 f4       	brcc	.+2      	; 0x1d54 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x1fc>
    1d52:	8d c0       	rjmp	.+282    	; 0x1e6e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x316>
    1d54:	88 e0       	ldi	r24, 0x08	; 8
    1d56:	f8 01       	movw	r30, r16
    1d58:	de 01       	movw	r26, r28
    1d5a:	11 96       	adiw	r26, 0x01	; 1
    1d5c:	01 90       	ld	r0, Z+
    1d5e:	0d 92       	st	X+, r0
    1d60:	8a 95       	dec	r24
    1d62:	e1 f7       	brne	.-8      	; 0x1d5c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x204>
    1d64:	ce 01       	movw	r24, r28
    1d66:	01 96       	adiw	r24, 0x01	; 1
    1d68:	0e 94 40 0d 	call	0x1a80	; 0x1a80 <_ZN8Internal13DCF77_Encoder14advance_minuteEv>
    1d6c:	ce 01       	movw	r24, r28
    1d6e:	01 96       	adiw	r24, 0x01	; 1
    1d70:	0e 94 5d 0b 	call	0x16ba	; 0x16ba <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv>
    1d74:	98 85       	ldd	r25, Y+8	; 0x08
    1d76:	88 e0       	ldi	r24, 0x08	; 8
    1d78:	92 ff       	sbrs	r25, 2
    1d7a:	80 e0       	ldi	r24, 0x00	; 0
    1d7c:	90 ff       	sbrs	r25, 0
    1d7e:	aa c0       	rjmp	.+340    	; 0x1ed4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x37c>
    1d80:	80 61       	ori	r24, 0x10	; 16
    1d82:	93 fd       	sbrc	r25, 3
    1d84:	80 64       	ori	r24, 0x40	; 64
    1d86:	80 68       	ori	r24, 0x80	; 128
    1d88:	80 93 60 03 	sts	0x0360, r24	; 0x800360 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x40>
    1d8c:	1e 81       	ldd	r17, Y+6	; 0x06
    1d8e:	81 2f       	mov	r24, r17
    1d90:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZN8Internal16Arithmetic_Tools6parityEh>
    1d94:	88 23       	and	r24, r24
    1d96:	09 f4       	brne	.+2      	; 0x1d9a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x242>
    1d98:	97 c0       	rjmp	.+302    	; 0x1ec8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x370>
    1d9a:	10 68       	ori	r17, 0x80	; 128
    1d9c:	10 93 61 03 	sts	0x0361, r17	; 0x800361 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x41>
    1da0:	1d 81       	ldd	r17, Y+5	; 0x05
    1da2:	81 2f       	mov	r24, r17
    1da4:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZN8Internal16Arithmetic_Tools6parityEh>
    1da8:	88 23       	and	r24, r24
    1daa:	09 f4       	brne	.+2      	; 0x1dae <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x256>
    1dac:	8f c0       	rjmp	.+286    	; 0x1ecc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x374>
    1dae:	10 64       	ori	r17, 0x40	; 64
    1db0:	8b 81       	ldd	r24, Y+3	; 0x03
    1db2:	80 ff       	sbrs	r24, 0
    1db4:	8d c0       	rjmp	.+282    	; 0x1ed0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x378>
    1db6:	10 68       	ori	r17, 0x80	; 128
    1db8:	10 93 62 03 	sts	0x0362, r17	; 0x800362 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x42>
    1dbc:	bc 80       	ldd	r11, Y+4	; 0x04
    1dbe:	cb 80       	ldd	r12, Y+3	; 0x03
    1dc0:	8c 2d       	mov	r24, r12
    1dc2:	86 95       	lsr	r24
    1dc4:	b0 e2       	ldi	r27, 0x20	; 32
    1dc6:	bb 9e       	mul	r11, r27
    1dc8:	90 01       	movw	r18, r0
    1dca:	11 24       	eor	r1, r1
    1dcc:	82 2b       	or	r24, r18
    1dce:	80 93 63 03 	sts	0x0363, r24	; 0x800363 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x43>
    1dd2:	09 81       	ldd	r16, Y+1	; 0x01
    1dd4:	e0 2e       	mov	r14, r16
    1dd6:	f1 2c       	mov	r15, r1
    1dd8:	c7 01       	movw	r24, r14
    1dda:	25 e0       	ldi	r18, 0x05	; 5
    1ddc:	88 0f       	add	r24, r24
    1dde:	99 1f       	adc	r25, r25
    1de0:	2a 95       	dec	r18
    1de2:	e1 f7       	brne	.-8      	; 0x1ddc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x284>
    1de4:	da 80       	ldd	r13, Y+2	; 0x02
    1de6:	8d 29       	or	r24, r13
    1de8:	80 93 64 03 	sts	0x0364, r24	; 0x800364 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x44>
    1dec:	8c 2d       	mov	r24, r12
    1dee:	8f 70       	andi	r24, 0x0F	; 15
    1df0:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZN8Internal16Arithmetic_Tools6parityEh>
    1df4:	18 2f       	mov	r17, r24
    1df6:	8c 2d       	mov	r24, r12
    1df8:	82 95       	swap	r24
    1dfa:	8f 70       	andi	r24, 0x0F	; 15
    1dfc:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZN8Internal16Arithmetic_Tools6parityEh>
    1e00:	18 27       	eor	r17, r24
    1e02:	8d 2d       	mov	r24, r13
    1e04:	8f 70       	andi	r24, 0x0F	; 15
    1e06:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZN8Internal16Arithmetic_Tools6parityEh>
    1e0a:	18 27       	eor	r17, r24
    1e0c:	8d 2d       	mov	r24, r13
    1e0e:	82 95       	swap	r24
    1e10:	8f 70       	andi	r24, 0x0F	; 15
    1e12:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZN8Internal16Arithmetic_Tools6parityEh>
    1e16:	18 27       	eor	r17, r24
    1e18:	8b 2d       	mov	r24, r11
    1e1a:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZN8Internal16Arithmetic_Tools6parityEh>
    1e1e:	18 27       	eor	r17, r24
    1e20:	80 2f       	mov	r24, r16
    1e22:	8f 70       	andi	r24, 0x0F	; 15
    1e24:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZN8Internal16Arithmetic_Tools6parityEh>
    1e28:	18 27       	eor	r17, r24
    1e2a:	80 2f       	mov	r24, r16
    1e2c:	82 95       	swap	r24
    1e2e:	8f 70       	andi	r24, 0x0F	; 15
    1e30:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZN8Internal16Arithmetic_Tools6parityEh>
    1e34:	33 e0       	ldi	r19, 0x03	; 3
    1e36:	f5 94       	asr	r15
    1e38:	e7 94       	ror	r14
    1e3a:	3a 95       	dec	r19
    1e3c:	e1 f7       	brne	.-8      	; 0x1e36 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x2de>
    1e3e:	18 17       	cp	r17, r24
    1e40:	11 f0       	breq	.+4      	; 0x1e46 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x2ee>
    1e42:	68 94       	set
    1e44:	e5 f8       	bld	r14, 5
    1e46:	e0 92 65 03 	sts	0x0365, r14	; 0x800365 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x45>
    1e4a:	10 92 66 03 	sts	0x0366, r1	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    1e4e:	0f c0       	rjmp	.+30     	; 0x1e6e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x316>
    1e50:	80 91 61 02 	lds	r24, 0x0261	; 0x800261 <_ZN8Internal23DCF77_Frequency_Control9deviationE>
    1e54:	90 91 62 02 	lds	r25, 0x0262	; 0x800262 <_ZN8Internal23DCF77_Frequency_Control9deviationE+0x1>
    1e58:	05 97       	sbiw	r24, 0x05	; 5
    1e5a:	0c f0       	brlt	.+2      	; 0x1e5e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x306>
    1e5c:	13 cf       	rjmp	.-474    	; 0x1c84 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x12c>
    1e5e:	80 91 e4 05 	lds	r24, 0x05E4	; 0x8005e4 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    1e62:	90 91 e5 05 	lds	r25, 0x05E5	; 0x8005e5 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    1e66:	86 3d       	cpi	r24, 0xD6	; 214
    1e68:	94 41       	sbci	r25, 0x14	; 20
    1e6a:	08 f0       	brcs	.+2      	; 0x1e6e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x316>
    1e6c:	0b cf       	rjmp	.-490    	; 0x1c84 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x12c>
    1e6e:	28 96       	adiw	r28, 0x08	; 8
    1e70:	0f b6       	in	r0, 0x3f	; 63
    1e72:	f8 94       	cli
    1e74:	de bf       	out	0x3e, r29	; 62
    1e76:	0f be       	out	0x3f, r0	; 63
    1e78:	cd bf       	out	0x3d, r28	; 61
    1e7a:	df 91       	pop	r29
    1e7c:	cf 91       	pop	r28
    1e7e:	1f 91       	pop	r17
    1e80:	0f 91       	pop	r16
    1e82:	ff 90       	pop	r15
    1e84:	ef 90       	pop	r14
    1e86:	df 90       	pop	r13
    1e88:	cf 90       	pop	r12
    1e8a:	bf 90       	pop	r11
    1e8c:	af 90       	pop	r10
    1e8e:	9f 90       	pop	r9
    1e90:	8f 90       	pop	r8
    1e92:	08 95       	ret
    1e94:	80 91 e4 05 	lds	r24, 0x05E4	; 0x8005e4 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    1e98:	90 91 e5 05 	lds	r25, 0x05E5	; 0x8005e5 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    1e9c:	86 3d       	cpi	r24, 0xD6	; 214
    1e9e:	94 41       	sbci	r25, 0x14	; 20
    1ea0:	30 f3       	brcs	.-52     	; 0x1e6e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x316>
    1ea2:	46 cf       	rjmp	.-372    	; 0x1d30 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x1d8>
    1ea4:	80 91 60 02 	lds	r24, 0x0260	; 0x800260 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    1ea8:	80 ff       	sbrs	r24, 0
    1eaa:	e1 cf       	rjmp	.-62     	; 0x1e6e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x316>
    1eac:	10 92 e7 05 	sts	0x05E7, r1	; 0x8005e7 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    1eb0:	10 92 e6 05 	sts	0x05E6, r1	; 0x8005e6 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    1eb4:	10 92 e5 05 	sts	0x05E5, r1	; 0x8005e5 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    1eb8:	10 92 e4 05 	sts	0x05E4, r1	; 0x8005e4 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    1ebc:	b0 92 e8 05 	sts	0x05E8, r11	; 0x8005e8 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x4>
    1ec0:	80 91 60 02 	lds	r24, 0x0260	; 0x800260 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    1ec4:	82 60       	ori	r24, 0x02	; 2
    1ec6:	37 cf       	rjmp	.-402    	; 0x1d36 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x1de>
    1ec8:	1f 77       	andi	r17, 0x7F	; 127
    1eca:	68 cf       	rjmp	.-304    	; 0x1d9c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x244>
    1ecc:	1f 7b       	andi	r17, 0xBF	; 191
    1ece:	70 cf       	rjmp	.-288    	; 0x1db0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x258>
    1ed0:	1f 77       	andi	r17, 0x7F	; 127
    1ed2:	72 cf       	rjmp	.-284    	; 0x1db8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x260>
    1ed4:	80 62       	ori	r24, 0x20	; 32
    1ed6:	55 cf       	rjmp	.-342    	; 0x1d82 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE+0x22a>

00001ed8 <_ZN8Internal13DCF77_Encoder14advance_secondEv>:
    1ed8:	fc 01       	movw	r30, r24
    1eda:	86 81       	ldd	r24, Z+6	; 0x06
    1edc:	8b 33       	cpi	r24, 0x3B	; 59
    1ede:	38 f4       	brcc	.+14     	; 0x1eee <_ZN8Internal13DCF77_Encoder14advance_secondEv+0x16>
    1ee0:	8f 5f       	subi	r24, 0xFF	; 255
    1ee2:	86 83       	std	Z+6, r24	; 0x06
    1ee4:	8f 30       	cpi	r24, 0x0F	; 15
    1ee6:	c1 f4       	brne	.+48     	; 0x1f18 <_ZN8Internal13DCF77_Encoder14advance_secondEv+0x40>
    1ee8:	cf 01       	movw	r24, r30
    1eea:	0c 94 5d 0b 	jmp	0x16ba	; 0x16ba <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv>
    1eee:	97 81       	ldd	r25, Z+7	; 0x07
    1ef0:	93 ff       	sbrs	r25, 3
    1ef2:	0b c0       	rjmp	.+22     	; 0x1f0a <_ZN8Internal13DCF77_Encoder14advance_secondEv+0x32>
    1ef4:	8b 33       	cpi	r24, 0x3B	; 59
    1ef6:	49 f4       	brne	.+18     	; 0x1f0a <_ZN8Internal13DCF77_Encoder14advance_secondEv+0x32>
    1ef8:	25 81       	ldd	r18, Z+5	; 0x05
    1efa:	21 11       	cpse	r18, r1
    1efc:	06 c0       	rjmp	.+12     	; 0x1f0a <_ZN8Internal13DCF77_Encoder14advance_secondEv+0x32>
    1efe:	8c e3       	ldi	r24, 0x3C	; 60
    1f00:	86 83       	std	Z+6, r24	; 0x06
    1f02:	89 2f       	mov	r24, r25
    1f04:	87 7f       	andi	r24, 0xF7	; 247
    1f06:	87 83       	std	Z+7, r24	; 0x07
    1f08:	08 95       	ret
    1f0a:	8b 53       	subi	r24, 0x3B	; 59
    1f0c:	82 30       	cpi	r24, 0x02	; 2
    1f0e:	20 f4       	brcc	.+8      	; 0x1f18 <_ZN8Internal13DCF77_Encoder14advance_secondEv+0x40>
    1f10:	16 82       	std	Z+6, r1	; 0x06
    1f12:	cf 01       	movw	r24, r30
    1f14:	0c 94 40 0d 	jmp	0x1a80	; 0x1a80 <_ZN8Internal13DCF77_Encoder14advance_minuteEv>
    1f18:	08 95       	ret

00001f1a <_Z16sample_input_pinv>:
    1f1a:	83 e4       	ldi	r24, 0x43	; 67
    1f1c:	80 93 7c 00 	sts	0x007C, r24	; 0x80007c <__TEXT_REGION_LENGTH__+0x7e007c>
    1f20:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    1f24:	80 64       	ori	r24, 0x40	; 64
    1f26:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    1f2a:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    1f2e:	86 fd       	sbrc	r24, 6
    1f30:	fc cf       	rjmp	.-8      	; 0x1f2a <_Z16sample_input_pinv+0x10>
    1f32:	20 91 78 00 	lds	r18, 0x0078	; 0x800078 <__TEXT_REGION_LENGTH__+0x7e0078>
    1f36:	30 91 79 00 	lds	r19, 0x0079	; 0x800079 <__TEXT_REGION_LENGTH__+0x7e0079>
    1f3a:	81 e0       	ldi	r24, 0x01	; 1
    1f3c:	21 39       	cpi	r18, 0x91	; 145
    1f3e:	91 e0       	ldi	r25, 0x01	; 1
    1f40:	39 07       	cpc	r19, r25
    1f42:	0c f4       	brge	.+2      	; 0x1f46 <_Z16sample_input_pinv+0x2c>
    1f44:	80 e0       	ldi	r24, 0x00	; 0
    1f46:	21 39       	cpi	r18, 0x91	; 145
    1f48:	31 40       	sbci	r19, 0x01	; 1
    1f4a:	3c f0       	brlt	.+14     	; 0x1f5a <_Z16sample_input_pinv+0x40>
    1f4c:	90 91 ac 02 	lds	r25, 0x02AC	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    1f50:	29 9a       	sbi	0x05, 1	; 5
    1f52:	91 30       	cpi	r25, 0x01	; 1
    1f54:	21 f4       	brne	.+8      	; 0x1f5e <_Z16sample_input_pinv+0x44>
    1f56:	2a 9a       	sbi	0x05, 2	; 5
    1f58:	08 95       	ret
    1f5a:	29 98       	cbi	0x05, 1	; 5
    1f5c:	2a 98       	cbi	0x05, 2	; 5
    1f5e:	08 95       	ret

00001f60 <_Z13setBrightnessh>:
    1f60:	8a 31       	cpi	r24, 0x1A	; 26
    1f62:	08 f0       	brcs	.+2      	; 0x1f66 <_Z13setBrightnessh+0x6>
    1f64:	89 e1       	ldi	r24, 0x19	; 25
    1f66:	90 91 cb 02 	lds	r25, 0x02CB	; 0x8002cb <_target_brightness>
    1f6a:	98 13       	cpse	r25, r24
    1f6c:	80 93 cb 02 	sts	0x02CB, r24	; 0x8002cb <_target_brightness>
    1f70:	08 95       	ret

00001f72 <_Z10showDigitsv>:
    1f72:	82 ee       	ldi	r24, 0xE2	; 226
    1f74:	93 e0       	ldi	r25, 0x03	; 3
    1f76:	0e 94 62 02 	call	0x4c4	; 0x4c4 <_Z20putDigitsToInputRegsPhh.constprop.118>
    1f7a:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <MODE>
    1f7e:	82 fd       	sbrc	r24, 2
    1f80:	0c c0       	rjmp	.+24     	; 0x1f9a <_Z10showDigitsv+0x28>
    1f82:	80 e2       	ldi	r24, 0x20	; 32
    1f84:	80 93 00 01 	sts	0x0100, r24	; 0x800100 <__data_start>
    1f88:	10 92 58 02 	sts	0x0258, r1	; 0x800258 <crossfade_flip_counter>
    1f8c:	10 92 57 02 	sts	0x0257, r1	; 0x800257 <crossfade_step_counter>
    1f90:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <MODE>
    1f94:	82 60       	ori	r24, 0x02	; 2
    1f96:	80 93 e6 03 	sts	0x03E6, r24	; 0x8003e6 <MODE>
    1f9a:	08 95       	ret

00001f9c <_Z18setNumitronSegmenthhb.constprop.116>:
    1f9c:	90 91 e6 03 	lds	r25, 0x03E6	; 0x8003e6 <MODE>
    1fa0:	92 fd       	sbrc	r25, 2
    1fa2:	12 c0       	rjmp	.+36     	; 0x1fc8 <_Z18setNumitronSegmenthhb.constprop.116+0x2c>
    1fa4:	28 2f       	mov	r18, r24
    1fa6:	30 e0       	ldi	r19, 0x00	; 0
    1fa8:	f9 01       	movw	r30, r18
    1faa:	ee 51       	subi	r30, 0x1E	; 30
    1fac:	fc 4f       	sbci	r31, 0xFC	; 252
    1fae:	90 81       	ld	r25, Z
    1fb0:	22 52       	subi	r18, 0x22	; 34
    1fb2:	3c 4f       	sbci	r19, 0xFC	; 252
    1fb4:	d9 01       	movw	r26, r18
    1fb6:	9c 93       	st	X, r25
    1fb8:	66 23       	and	r22, r22
    1fba:	21 f0       	breq	.+8      	; 0x1fc4 <_Z18setNumitronSegmenthhb.constprop.116+0x28>
    1fbc:	90 68       	ori	r25, 0x80	; 128
    1fbe:	90 83       	st	Z, r25
    1fc0:	0c 94 b9 0f 	jmp	0x1f72	; 0x1f72 <_Z10showDigitsv>
    1fc4:	9f 77       	andi	r25, 0x7F	; 127
    1fc6:	fb cf       	rjmp	.-10     	; 0x1fbe <_Z18setNumitronSegmenthhb.constprop.116+0x22>
    1fc8:	08 95       	ret

00001fca <_Z22setSymbolRawOnNumitronhh.constprop.114>:
    1fca:	90 e0       	ldi	r25, 0x00	; 0
    1fcc:	fc 01       	movw	r30, r24
    1fce:	ee 51       	subi	r30, 0x1E	; 30
    1fd0:	fc 4f       	sbci	r31, 0xFC	; 252
    1fd2:	20 81       	ld	r18, Z
    1fd4:	2f 3f       	cpi	r18, 0xFF	; 255
    1fd6:	41 f0       	breq	.+16     	; 0x1fe8 <_Z22setSymbolRawOnNumitronhh.constprop.114+0x1e>
    1fd8:	82 52       	subi	r24, 0x22	; 34
    1fda:	9c 4f       	sbci	r25, 0xFC	; 252
    1fdc:	dc 01       	movw	r26, r24
    1fde:	2c 93       	st	X, r18
    1fe0:	8f ef       	ldi	r24, 0xFF	; 255
    1fe2:	80 83       	st	Z, r24
    1fe4:	0c 94 b9 0f 	jmp	0x1f72	; 0x1f72 <_Z10showDigitsv>
    1fe8:	08 95       	ret

00001fea <_ZL11getEEConfigh>:
    1fea:	e8 2f       	mov	r30, r24
    1fec:	f0 e0       	ldi	r31, 0x00	; 0
    1fee:	ea 53       	subi	r30, 0x3A	; 58
    1ff0:	fd 4f       	sbci	r31, 0xFD	; 253
    1ff2:	80 81       	ld	r24, Z
    1ff4:	87 fd       	sbrc	r24, 7
    1ff6:	02 c0       	rjmp	.+4      	; 0x1ffc <_ZL11getEEConfigh+0x12>
    1ff8:	80 68       	ori	r24, 0x80	; 128
    1ffa:	80 83       	st	Z, r24
    1ffc:	80 81       	ld	r24, Z
    1ffe:	8f 77       	andi	r24, 0x7F	; 127
    2000:	08 95       	ret

00002002 <_Z16configBrightnessh>:
    2002:	cf 93       	push	r28
    2004:	80 93 04 01 	sts	0x0104, r24	; 0x800104 <configured_brightness>
    2008:	80 91 04 01 	lds	r24, 0x0104	; 0x800104 <configured_brightness>
    200c:	0e 94 b0 0f 	call	0x1f60	; 0x1f60 <_Z13setBrightnessh>
    2010:	c0 91 04 01 	lds	r28, 0x0104	; 0x800104 <configured_brightness>
    2014:	82 e0       	ldi	r24, 0x02	; 2
    2016:	0e 94 f5 0f 	call	0x1fea	; 0x1fea <_ZL11getEEConfigh>
    201a:	c8 17       	cp	r28, r24
    201c:	19 f0       	breq	.+6      	; 0x2024 <_Z16configBrightnessh+0x22>
    201e:	c0 68       	ori	r28, 0x80	; 128
    2020:	c0 93 c8 02 	sts	0x02C8, r28	; 0x8002c8 <blink_timer_counter>
    2024:	cf 91       	pop	r28
    2026:	08 95       	ret

00002028 <_Z11displayTimej>:
    2028:	af 92       	push	r10
    202a:	bf 92       	push	r11
    202c:	cf 92       	push	r12
    202e:	df 92       	push	r13
    2030:	ef 92       	push	r14
    2032:	ff 92       	push	r15
    2034:	0f 93       	push	r16
    2036:	1f 93       	push	r17
    2038:	cf 93       	push	r28
    203a:	df 93       	push	r29
    203c:	20 91 e6 03 	lds	r18, 0x03E6	; 0x8003e6 <MODE>
    2040:	21 11       	cpse	r18, r1
    2042:	59 c0       	rjmp	.+178    	; 0x20f6 <_Z11displayTimej+0xce>
    2044:	6c e3       	ldi	r22, 0x3C	; 60
    2046:	70 e0       	ldi	r23, 0x00	; 0
    2048:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    204c:	92 ee       	ldi	r25, 0xE2	; 226
    204e:	e9 2e       	mov	r14, r25
    2050:	93 e0       	ldi	r25, 0x03	; 3
    2052:	f9 2e       	mov	r15, r25
    2054:	0e ed       	ldi	r16, 0xDE	; 222
    2056:	13 e0       	ldi	r17, 0x03	; 3
    2058:	d0 e0       	ldi	r29, 0x00	; 0
    205a:	d1 2c       	mov	r13, r1
    205c:	c8 2e       	mov	r12, r24
    205e:	b6 2e       	mov	r11, r22
    2060:	2a e0       	ldi	r18, 0x0A	; 10
    2062:	a2 2e       	mov	r10, r18
    2064:	81 e0       	ldi	r24, 0x01	; 1
    2066:	cb 2d       	mov	r28, r11
    2068:	8d 15       	cp	r24, r13
    206a:	08 f4       	brcc	.+2      	; 0x206e <_Z11displayTimej+0x46>
    206c:	cc 2d       	mov	r28, r12
    206e:	83 e0       	ldi	r24, 0x03	; 3
    2070:	0e 94 f5 0f 	call	0x1fea	; 0x1fea <_ZL11getEEConfigh>
    2074:	80 ff       	sbrs	r24, 0
    2076:	05 c0       	rjmp	.+10     	; 0x2082 <_Z11displayTimej+0x5a>
    2078:	cc 23       	and	r28, r28
    207a:	79 f1       	breq	.+94     	; 0x20da <_Z11displayTimej+0xb2>
    207c:	cd 30       	cpi	r28, 0x0D	; 13
    207e:	08 f0       	brcs	.+2      	; 0x2082 <_Z11displayTimej+0x5a>
    2080:	cc 50       	subi	r28, 0x0C	; 12
    2082:	8c 2f       	mov	r24, r28
    2084:	6a 2d       	mov	r22, r10
    2086:	0e 94 6a 29 	call	0x52d4	; 0x52d4 <__udivmodqi4>
    208a:	d0 fe       	sbrs	r13, 0
    208c:	28 c0       	rjmp	.+80     	; 0x20de <_Z11displayTimej+0xb6>
    208e:	e9 2f       	mov	r30, r25
    2090:	f0 e0       	ldi	r31, 0x00	; 0
    2092:	e9 54       	subi	r30, 0x49	; 73
    2094:	fc 4f       	sbci	r31, 0xFC	; 252
    2096:	e4 91       	lpm	r30, Z
    2098:	d7 01       	movw	r26, r14
    209a:	9d 91       	ld	r25, X+
    209c:	7d 01       	movw	r14, r26
    209e:	e9 17       	cp	r30, r25
    20a0:	41 f0       	breq	.+16     	; 0x20b2 <_Z11displayTimej+0x8a>
    20a2:	d8 01       	movw	r26, r16
    20a4:	9c 93       	st	X, r25
    20a6:	d7 01       	movw	r26, r14
    20a8:	11 97       	sbiw	r26, 0x01	; 1
    20aa:	ec 93       	st	X, r30
    20ac:	dd 20       	and	r13, r13
    20ae:	c9 f0       	breq	.+50     	; 0x20e2 <_Z11displayTimej+0xba>
    20b0:	d1 e0       	ldi	r29, 0x01	; 1
    20b2:	d3 94       	inc	r13
    20b4:	0f 5f       	subi	r16, 0xFF	; 255
    20b6:	1f 4f       	sbci	r17, 0xFF	; 255
    20b8:	b4 e0       	ldi	r27, 0x04	; 4
    20ba:	db 12       	cpse	r13, r27
    20bc:	d3 cf       	rjmp	.-90     	; 0x2064 <_Z11displayTimej+0x3c>
    20be:	dd 23       	and	r29, r29
    20c0:	d1 f0       	breq	.+52     	; 0x20f6 <_Z11displayTimej+0xce>
    20c2:	df 91       	pop	r29
    20c4:	cf 91       	pop	r28
    20c6:	1f 91       	pop	r17
    20c8:	0f 91       	pop	r16
    20ca:	ff 90       	pop	r15
    20cc:	ef 90       	pop	r14
    20ce:	df 90       	pop	r13
    20d0:	cf 90       	pop	r12
    20d2:	bf 90       	pop	r11
    20d4:	af 90       	pop	r10
    20d6:	0c 94 b9 0f 	jmp	0x1f72	; 0x1f72 <_Z10showDigitsv>
    20da:	cc e0       	ldi	r28, 0x0C	; 12
    20dc:	d2 cf       	rjmp	.-92     	; 0x2082 <_Z11displayTimej+0x5a>
    20de:	98 2f       	mov	r25, r24
    20e0:	d6 cf       	rjmp	.-84     	; 0x208e <_Z11displayTimej+0x66>
    20e2:	ca 30       	cpi	r28, 0x0A	; 10
    20e4:	28 f7       	brcc	.-54     	; 0x20b0 <_Z11displayTimej+0x88>
    20e6:	83 e0       	ldi	r24, 0x03	; 3
    20e8:	0e 94 f5 0f 	call	0x1fea	; 0x1fea <_ZL11getEEConfigh>
    20ec:	81 fd       	sbrc	r24, 1
    20ee:	e0 cf       	rjmp	.-64     	; 0x20b0 <_Z11displayTimej+0x88>
    20f0:	10 92 e2 03 	sts	0x03E2, r1	; 0x8003e2 <DIGITS>
    20f4:	dd cf       	rjmp	.-70     	; 0x20b0 <_Z11displayTimej+0x88>
    20f6:	df 91       	pop	r29
    20f8:	cf 91       	pop	r28
    20fa:	1f 91       	pop	r17
    20fc:	0f 91       	pop	r16
    20fe:	ff 90       	pop	r15
    2100:	ef 90       	pop	r14
    2102:	df 90       	pop	r13
    2104:	cf 90       	pop	r12
    2106:	bf 90       	pop	r11
    2108:	af 90       	pop	r10
    210a:	08 95       	ret

0000210c <_Z16pushToOutputRegsv>:
    210c:	5f 98       	cbi	0x0b, 7	; 11
    210e:	00 00       	nop
    2110:	00 00       	nop
    2112:	5f 9a       	sbi	0x0b, 7	; 11
    2114:	08 95       	ret

00002116 <_Z4waitj>:
    2116:	90 93 5c 02 	sts	0x025C, r25	; 0x80025c <ms_ticks+0x1>
    211a:	80 93 5b 02 	sts	0x025B, r24	; 0x80025b <ms_ticks>
    211e:	83 b7       	in	r24, 0x33	; 51
    2120:	81 7f       	andi	r24, 0xF1	; 241
    2122:	83 bf       	out	0x33, r24	; 51
    2124:	83 b7       	in	r24, 0x33	; 51
    2126:	81 60       	ori	r24, 0x01	; 1
    2128:	83 bf       	out	0x33, r24	; 51
    212a:	80 91 5b 02 	lds	r24, 0x025B	; 0x80025b <ms_ticks>
    212e:	90 91 5c 02 	lds	r25, 0x025C	; 0x80025c <ms_ticks+0x1>
    2132:	89 2b       	or	r24, r25
    2134:	11 f0       	breq	.+4      	; 0x213a <_Z4waitj+0x24>
    2136:	88 95       	sleep
    2138:	f8 cf       	rjmp	.-16     	; 0x212a <_Z4waitj+0x14>
    213a:	83 b7       	in	r24, 0x33	; 51
    213c:	8e 7f       	andi	r24, 0xFE	; 254
    213e:	83 bf       	out	0x33, r24	; 51
    2140:	08 95       	ret

00002142 <_ZN18Adafruit_I2CDevice4readEPhjb.constprop.130>:
    2142:	6f 92       	push	r6
    2144:	7f 92       	push	r7
    2146:	8f 92       	push	r8
    2148:	9f 92       	push	r9
    214a:	af 92       	push	r10
    214c:	bf 92       	push	r11
    214e:	cf 92       	push	r12
    2150:	df 92       	push	r13
    2152:	ef 92       	push	r14
    2154:	ff 92       	push	r15
    2156:	0f 93       	push	r16
    2158:	1f 93       	push	r17
    215a:	cf 93       	push	r28
    215c:	df 93       	push	r29
    215e:	6c 01       	movw	r12, r24
    2160:	3b 01       	movw	r6, r22
    2162:	7a 01       	movw	r14, r20
    2164:	10 e0       	ldi	r17, 0x00	; 0
    2166:	00 e0       	ldi	r16, 0x00	; 0
    2168:	d6 01       	movw	r26, r12
    216a:	14 96       	adiw	r26, 0x04	; 4
    216c:	8d 91       	ld	r24, X+
    216e:	9c 91       	ld	r25, X
    2170:	e7 01       	movw	r28, r14
    2172:	c0 1b       	sub	r28, r16
    2174:	d1 0b       	sbc	r29, r17
    2176:	8c 17       	cp	r24, r28
    2178:	9d 07       	cpc	r25, r29
    217a:	08 f4       	brcc	.+2      	; 0x217e <_ZN18Adafruit_I2CDevice4readEPhjb.constprop.130+0x3c>
    217c:	ec 01       	movw	r28, r24
    217e:	41 e0       	ldi	r20, 0x01	; 1
    2180:	c7 01       	movw	r24, r14
    2182:	8c 1b       	sub	r24, r28
    2184:	9d 0b       	sbc	r25, r29
    2186:	08 17       	cp	r16, r24
    2188:	19 07       	cpc	r17, r25
    218a:	08 f4       	brcc	.+2      	; 0x218e <_ZN18Adafruit_I2CDevice4readEPhjb.constprop.130+0x4c>
    218c:	40 e0       	ldi	r20, 0x00	; 0
    218e:	6c 2f       	mov	r22, r28
    2190:	c1 32       	cpi	r28, 0x21	; 33
    2192:	08 f0       	brcs	.+2      	; 0x2196 <_ZN18Adafruit_I2CDevice4readEPhjb.constprop.130+0x54>
    2194:	60 e2       	ldi	r22, 0x20	; 32
    2196:	f6 01       	movw	r30, r12
    2198:	80 81       	ld	r24, Z
    219a:	0e 94 99 06 	call	0xd32	; 0xd32 <twi_readFrom.constprop.136>
    219e:	10 92 e8 03 	sts	0x03E8, r1	; 0x8003e8 <_ZN7TwoWire13rxBufferIndexE>
    21a2:	80 93 e7 03 	sts	0x03E7, r24	; 0x8003e7 <_ZN7TwoWire14rxBufferLengthE>
    21a6:	8c 17       	cp	r24, r28
    21a8:	1d 06       	cpc	r1, r29
    21aa:	79 f5       	brne	.+94     	; 0x220a <_ZN18Adafruit_I2CDevice4readEPhjb.constprop.130+0xc8>
    21ac:	43 01       	movw	r8, r6
    21ae:	80 0e       	add	r8, r16
    21b0:	91 1e       	adc	r9, r17
    21b2:	54 01       	movw	r10, r8
    21b4:	c5 01       	movw	r24, r10
    21b6:	88 19       	sub	r24, r8
    21b8:	99 09       	sbc	r25, r9
    21ba:	8c 17       	cp	r24, r28
    21bc:	9d 07       	cpc	r25, r29
    21be:	78 f4       	brcc	.+30     	; 0x21de <_ZN18Adafruit_I2CDevice4readEPhjb.constprop.130+0x9c>
    21c0:	d6 01       	movw	r26, r12
    21c2:	11 96       	adiw	r26, 0x01	; 1
    21c4:	8d 91       	ld	r24, X+
    21c6:	9c 91       	ld	r25, X
    21c8:	dc 01       	movw	r26, r24
    21ca:	ed 91       	ld	r30, X+
    21cc:	fc 91       	ld	r31, X
    21ce:	02 84       	ldd	r0, Z+10	; 0x0a
    21d0:	f3 85       	ldd	r31, Z+11	; 0x0b
    21d2:	e0 2d       	mov	r30, r0
    21d4:	09 95       	icall
    21d6:	f5 01       	movw	r30, r10
    21d8:	81 93       	st	Z+, r24
    21da:	5f 01       	movw	r10, r30
    21dc:	eb cf       	rjmp	.-42     	; 0x21b4 <_ZN18Adafruit_I2CDevice4readEPhjb.constprop.130+0x72>
    21de:	0c 0f       	add	r16, r28
    21e0:	1d 1f       	adc	r17, r29
    21e2:	0e 15       	cp	r16, r14
    21e4:	1f 05       	cpc	r17, r15
    21e6:	08 f4       	brcc	.+2      	; 0x21ea <_ZN18Adafruit_I2CDevice4readEPhjb.constprop.130+0xa8>
    21e8:	bf cf       	rjmp	.-130    	; 0x2168 <_ZN18Adafruit_I2CDevice4readEPhjb.constprop.130+0x26>
    21ea:	81 e0       	ldi	r24, 0x01	; 1
    21ec:	df 91       	pop	r29
    21ee:	cf 91       	pop	r28
    21f0:	1f 91       	pop	r17
    21f2:	0f 91       	pop	r16
    21f4:	ff 90       	pop	r15
    21f6:	ef 90       	pop	r14
    21f8:	df 90       	pop	r13
    21fa:	cf 90       	pop	r12
    21fc:	bf 90       	pop	r11
    21fe:	af 90       	pop	r10
    2200:	9f 90       	pop	r9
    2202:	8f 90       	pop	r8
    2204:	7f 90       	pop	r7
    2206:	6f 90       	pop	r6
    2208:	08 95       	ret
    220a:	80 e0       	ldi	r24, 0x00	; 0
    220c:	ef cf       	rjmp	.-34     	; 0x21ec <_ZN18Adafruit_I2CDevice4readEPhjb.constprop.130+0xaa>

0000220e <_ZN18Adafruit_I2CDevice5writeEPKhjbS1_j.constprop.128>:
    220e:	1f 93       	push	r17
    2210:	cf 93       	push	r28
    2212:	df 93       	push	r29
    2214:	dc 01       	movw	r26, r24
    2216:	14 96       	adiw	r26, 0x04	; 4
    2218:	ed 91       	ld	r30, X+
    221a:	fc 91       	ld	r31, X
    221c:	e4 17       	cp	r30, r20
    221e:	f5 07       	cpc	r31, r21
    2220:	10 f4       	brcc	.+4      	; 0x2226 <_ZN18Adafruit_I2CDevice5writeEPKhjbS1_j.constprop.128+0x18>
    2222:	90 e0       	ldi	r25, 0x00	; 0
    2224:	1f c0       	rjmp	.+62     	; 0x2264 <_ZN18Adafruit_I2CDevice5writeEPKhjbS1_j.constprop.128+0x56>
    2226:	12 2f       	mov	r17, r18
    2228:	ea 01       	movw	r28, r20
    222a:	fc 01       	movw	r30, r24
    222c:	81 81       	ldd	r24, Z+1	; 0x01
    222e:	92 81       	ldd	r25, Z+2	; 0x02
    2230:	20 81       	ld	r18, Z
    2232:	31 e0       	ldi	r19, 0x01	; 1
    2234:	30 93 e9 03 	sts	0x03E9, r19	; 0x8003e9 <_ZN7TwoWire12transmittingE>
    2238:	20 93 0b 04 	sts	0x040B, r18	; 0x80040b <_ZN7TwoWire9txAddressE>
    223c:	10 92 ea 03 	sts	0x03EA, r1	; 0x8003ea <_ZN7TwoWire13txBufferIndexE>
    2240:	10 92 0c 04 	sts	0x040C, r1	; 0x80040c <_ZN7TwoWire14txBufferLengthE>
    2244:	dc 01       	movw	r26, r24
    2246:	ed 91       	ld	r30, X+
    2248:	fc 91       	ld	r31, X
    224a:	02 80       	ldd	r0, Z+2	; 0x02
    224c:	f3 81       	ldd	r31, Z+3	; 0x03
    224e:	e0 2d       	mov	r30, r0
    2250:	09 95       	icall
    2252:	c8 17       	cp	r28, r24
    2254:	d9 07       	cpc	r29, r25
    2256:	29 f7       	brne	.-54     	; 0x2222 <_ZN18Adafruit_I2CDevice5writeEPKhjbS1_j.constprop.128+0x14>
    2258:	81 2f       	mov	r24, r17
    225a:	0e 94 71 07 	call	0xee2	; 0xee2 <_ZN7TwoWire15endTransmissionEh.constprop.133>
    225e:	91 e0       	ldi	r25, 0x01	; 1
    2260:	81 11       	cpse	r24, r1
    2262:	df cf       	rjmp	.-66     	; 0x2222 <_ZN18Adafruit_I2CDevice5writeEPKhjbS1_j.constprop.128+0x14>
    2264:	89 2f       	mov	r24, r25
    2266:	df 91       	pop	r29
    2268:	cf 91       	pop	r28
    226a:	1f 91       	pop	r17
    226c:	08 95       	ret

0000226e <_ZN7RTC_I2C14write_registerEhh.constprop.42>:
    226e:	cf 93       	push	r28
    2270:	df 93       	push	r29
    2272:	00 d0       	rcall	.+0      	; 0x2274 <_ZN7RTC_I2C14write_registerEhh.constprop.42+0x6>
    2274:	cd b7       	in	r28, 0x3d	; 61
    2276:	de b7       	in	r29, 0x3e	; 62
    2278:	89 83       	std	Y+1, r24	; 0x01
    227a:	6a 83       	std	Y+2, r22	; 0x02
    227c:	21 e0       	ldi	r18, 0x01	; 1
    227e:	42 e0       	ldi	r20, 0x02	; 2
    2280:	50 e0       	ldi	r21, 0x00	; 0
    2282:	be 01       	movw	r22, r28
    2284:	6f 5f       	subi	r22, 0xFF	; 255
    2286:	7f 4f       	sbci	r23, 0xFF	; 255
    2288:	80 91 de 02 	lds	r24, 0x02DE	; 0x8002de <RTC>
    228c:	90 91 df 02 	lds	r25, 0x02DF	; 0x8002df <RTC+0x1>
    2290:	0e 94 07 11 	call	0x220e	; 0x220e <_ZN18Adafruit_I2CDevice5writeEPKhjbS1_j.constprop.128>
    2294:	0f 90       	pop	r0
    2296:	0f 90       	pop	r0
    2298:	df 91       	pop	r29
    229a:	cf 91       	pop	r28
    229c:	08 95       	ret

0000229e <_ZN7RTC_I2C13read_registerEh.constprop.41>:
    229e:	cf 93       	push	r28
    22a0:	df 93       	push	r29
    22a2:	00 d0       	rcall	.+0      	; 0x22a4 <_ZN7RTC_I2C13read_registerEh.constprop.41+0x6>
    22a4:	cd b7       	in	r28, 0x3d	; 61
    22a6:	de b7       	in	r29, 0x3e	; 62
    22a8:	8a 83       	std	Y+2, r24	; 0x02
    22aa:	21 e0       	ldi	r18, 0x01	; 1
    22ac:	41 e0       	ldi	r20, 0x01	; 1
    22ae:	50 e0       	ldi	r21, 0x00	; 0
    22b0:	be 01       	movw	r22, r28
    22b2:	6e 5f       	subi	r22, 0xFE	; 254
    22b4:	7f 4f       	sbci	r23, 0xFF	; 255
    22b6:	80 91 de 02 	lds	r24, 0x02DE	; 0x8002de <RTC>
    22ba:	90 91 df 02 	lds	r25, 0x02DF	; 0x8002df <RTC+0x1>
    22be:	0e 94 07 11 	call	0x220e	; 0x220e <_ZN18Adafruit_I2CDevice5writeEPKhjbS1_j.constprop.128>
    22c2:	41 e0       	ldi	r20, 0x01	; 1
    22c4:	50 e0       	ldi	r21, 0x00	; 0
    22c6:	be 01       	movw	r22, r28
    22c8:	6f 5f       	subi	r22, 0xFF	; 255
    22ca:	7f 4f       	sbci	r23, 0xFF	; 255
    22cc:	80 91 de 02 	lds	r24, 0x02DE	; 0x8002de <RTC>
    22d0:	90 91 df 02 	lds	r25, 0x02DF	; 0x8002df <RTC+0x1>
    22d4:	0e 94 a1 10 	call	0x2142	; 0x2142 <_ZN18Adafruit_I2CDevice4readEPhjb.constprop.130>
    22d8:	89 81       	ldd	r24, Y+1	; 0x01
    22da:	0f 90       	pop	r0
    22dc:	0f 90       	pop	r0
    22de:	df 91       	pop	r29
    22e0:	cf 91       	pop	r28
    22e2:	08 95       	ret

000022e4 <_ZN10RTC_DS32316adjustERK8DateTime.constprop.40>:
    22e4:	1f 93       	push	r17
    22e6:	cf 93       	push	r28
    22e8:	df 93       	push	r29
    22ea:	cd b7       	in	r28, 0x3d	; 61
    22ec:	de b7       	in	r29, 0x3e	; 62
    22ee:	28 97       	sbiw	r28, 0x08	; 8
    22f0:	0f b6       	in	r0, 0x3f	; 63
    22f2:	f8 94       	cli
    22f4:	de bf       	out	0x3e, r29	; 62
    22f6:	0f be       	out	0x3f, r0	; 63
    22f8:	cd bf       	out	0x3d, r28	; 61
    22fa:	fc 01       	movw	r30, r24
    22fc:	1a 82       	std	Y+2, r1	; 0x02
    22fe:	19 82       	std	Y+1, r1	; 0x01
    2300:	35 81       	ldd	r19, Z+5	; 0x05
    2302:	2a e0       	ldi	r18, 0x0A	; 10
    2304:	83 2f       	mov	r24, r19
    2306:	62 2f       	mov	r22, r18
    2308:	0e 94 6a 29 	call	0x52d4	; 0x52d4 <__udivmodqi4>
    230c:	98 2f       	mov	r25, r24
    230e:	88 0f       	add	r24, r24
    2310:	89 0f       	add	r24, r25
    2312:	88 0f       	add	r24, r24
    2314:	83 0f       	add	r24, r19
    2316:	8a 83       	std	Y+2, r24	; 0x02
    2318:	34 81       	ldd	r19, Z+4	; 0x04
    231a:	83 2f       	mov	r24, r19
    231c:	0e 94 6a 29 	call	0x52d4	; 0x52d4 <__udivmodqi4>
    2320:	98 2f       	mov	r25, r24
    2322:	88 0f       	add	r24, r24
    2324:	89 0f       	add	r24, r25
    2326:	88 0f       	add	r24, r24
    2328:	83 0f       	add	r24, r19
    232a:	8b 83       	std	Y+3, r24	; 0x03
    232c:	33 81       	ldd	r19, Z+3	; 0x03
    232e:	83 2f       	mov	r24, r19
    2330:	0e 94 6a 29 	call	0x52d4	; 0x52d4 <__udivmodqi4>
    2334:	98 2f       	mov	r25, r24
    2336:	88 0f       	add	r24, r24
    2338:	89 0f       	add	r24, r25
    233a:	88 0f       	add	r24, r24
    233c:	83 0f       	add	r24, r19
    233e:	8c 83       	std	Y+4, r24	; 0x04
    2340:	12 81       	ldd	r17, Z+2	; 0x02
    2342:	31 81       	ldd	r19, Z+1	; 0x01
    2344:	20 81       	ld	r18, Z
    2346:	42 2f       	mov	r20, r18
    2348:	50 e0       	ldi	r21, 0x00	; 0
    234a:	61 2f       	mov	r22, r17
    234c:	70 e0       	ldi	r23, 0x00	; 0
    234e:	e7 e2       	ldi	r30, 0x27	; 39
    2350:	f4 e0       	ldi	r31, 0x04	; 4
    2352:	81 e0       	ldi	r24, 0x01	; 1
    2354:	83 17       	cp	r24, r19
    2356:	30 f4       	brcc	.+12     	; 0x2364 <_ZN10RTC_DS32316adjustERK8DateTime.constprop.40+0x80>
    2358:	94 91       	lpm	r25, Z
    235a:	69 0f       	add	r22, r25
    235c:	71 1d       	adc	r23, r1
    235e:	8f 5f       	subi	r24, 0xFF	; 255
    2360:	31 96       	adiw	r30, 0x01	; 1
    2362:	f8 cf       	rjmp	.-16     	; 0x2354 <_ZN10RTC_DS32316adjustERK8DateTime.constprop.40+0x70>
    2364:	33 30       	cpi	r19, 0x03	; 3
    2366:	28 f0       	brcs	.+10     	; 0x2372 <_ZN10RTC_DS32316adjustERK8DateTime.constprop.40+0x8e>
    2368:	82 2f       	mov	r24, r18
    236a:	83 70       	andi	r24, 0x03	; 3
    236c:	11 f4       	brne	.+4      	; 0x2372 <_ZN10RTC_DS32316adjustERK8DateTime.constprop.40+0x8e>
    236e:	6f 5f       	subi	r22, 0xFF	; 255
    2370:	7f 4f       	sbci	r23, 0xFF	; 255
    2372:	ed e6       	ldi	r30, 0x6D	; 109
    2374:	f1 e0       	ldi	r31, 0x01	; 1
    2376:	4e 9f       	mul	r20, r30
    2378:	c0 01       	movw	r24, r0
    237a:	4f 9f       	mul	r20, r31
    237c:	90 0d       	add	r25, r0
    237e:	5e 9f       	mul	r21, r30
    2380:	90 0d       	add	r25, r0
    2382:	11 24       	eor	r1, r1
    2384:	05 96       	adiw	r24, 0x05	; 5
    2386:	4d 5f       	subi	r20, 0xFD	; 253
    2388:	5f 4f       	sbci	r21, 0xFF	; 255
    238a:	56 95       	lsr	r21
    238c:	47 95       	ror	r20
    238e:	56 95       	lsr	r21
    2390:	47 95       	ror	r20
    2392:	84 0f       	add	r24, r20
    2394:	95 1f       	adc	r25, r21
    2396:	86 0f       	add	r24, r22
    2398:	97 1f       	adc	r25, r23
    239a:	67 e0       	ldi	r22, 0x07	; 7
    239c:	70 e0       	ldi	r23, 0x00	; 0
    239e:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    23a2:	81 11       	cpse	r24, r1
    23a4:	01 c0       	rjmp	.+2      	; 0x23a8 <_ZN10RTC_DS32316adjustERK8DateTime.constprop.40+0xc4>
    23a6:	87 e0       	ldi	r24, 0x07	; 7
    23a8:	8d 83       	std	Y+5, r24	; 0x05
    23aa:	4a e0       	ldi	r20, 0x0A	; 10
    23ac:	81 2f       	mov	r24, r17
    23ae:	64 2f       	mov	r22, r20
    23b0:	0e 94 6a 29 	call	0x52d4	; 0x52d4 <__udivmodqi4>
    23b4:	98 2f       	mov	r25, r24
    23b6:	88 0f       	add	r24, r24
    23b8:	89 0f       	add	r24, r25
    23ba:	88 0f       	add	r24, r24
    23bc:	81 0f       	add	r24, r17
    23be:	8e 83       	std	Y+6, r24	; 0x06
    23c0:	83 2f       	mov	r24, r19
    23c2:	0e 94 6a 29 	call	0x52d4	; 0x52d4 <__udivmodqi4>
    23c6:	98 2f       	mov	r25, r24
    23c8:	88 0f       	add	r24, r24
    23ca:	89 0f       	add	r24, r25
    23cc:	88 0f       	add	r24, r24
    23ce:	83 0f       	add	r24, r19
    23d0:	8f 83       	std	Y+7, r24	; 0x07
    23d2:	82 2f       	mov	r24, r18
    23d4:	0e 94 6a 29 	call	0x52d4	; 0x52d4 <__udivmodqi4>
    23d8:	98 2f       	mov	r25, r24
    23da:	88 0f       	add	r24, r24
    23dc:	89 0f       	add	r24, r25
    23de:	88 0f       	add	r24, r24
    23e0:	82 0f       	add	r24, r18
    23e2:	88 87       	std	Y+8, r24	; 0x08
    23e4:	21 e0       	ldi	r18, 0x01	; 1
    23e6:	48 e0       	ldi	r20, 0x08	; 8
    23e8:	50 e0       	ldi	r21, 0x00	; 0
    23ea:	be 01       	movw	r22, r28
    23ec:	6f 5f       	subi	r22, 0xFF	; 255
    23ee:	7f 4f       	sbci	r23, 0xFF	; 255
    23f0:	80 91 de 02 	lds	r24, 0x02DE	; 0x8002de <RTC>
    23f4:	90 91 df 02 	lds	r25, 0x02DF	; 0x8002df <RTC+0x1>
    23f8:	0e 94 07 11 	call	0x220e	; 0x220e <_ZN18Adafruit_I2CDevice5writeEPKhjbS1_j.constprop.128>
    23fc:	8f e0       	ldi	r24, 0x0F	; 15
    23fe:	0e 94 4f 11 	call	0x229e	; 0x229e <_ZN7RTC_I2C13read_registerEh.constprop.41>
    2402:	68 2f       	mov	r22, r24
    2404:	6f 77       	andi	r22, 0x7F	; 127
    2406:	8f e0       	ldi	r24, 0x0F	; 15
    2408:	0e 94 37 11 	call	0x226e	; 0x226e <_ZN7RTC_I2C14write_registerEhh.constprop.42>
    240c:	28 96       	adiw	r28, 0x08	; 8
    240e:	0f b6       	in	r0, 0x3f	; 63
    2410:	f8 94       	cli
    2412:	de bf       	out	0x3e, r29	; 62
    2414:	0f be       	out	0x3f, r0	; 63
    2416:	cd bf       	out	0x3d, r28	; 61
    2418:	df 91       	pop	r29
    241a:	cf 91       	pop	r28
    241c:	1f 91       	pop	r17
    241e:	08 95       	ret

00002420 <_Z16getTimeInMinutesv>:
    2420:	0f 93       	push	r16
    2422:	1f 93       	push	r17
    2424:	cf 93       	push	r28
    2426:	df 93       	push	r29
    2428:	00 d0       	rcall	.+0      	; 0x242a <_Z16getTimeInMinutesv+0xa>
    242a:	00 d0       	rcall	.+0      	; 0x242c <_Z16getTimeInMinutesv+0xc>
    242c:	00 d0       	rcall	.+0      	; 0x242e <_Z16getTimeInMinutesv+0xe>
    242e:	1f 92       	push	r1
    2430:	cd b7       	in	r28, 0x3d	; 61
    2432:	de b7       	in	r29, 0x3e	; 62
    2434:	81 e0       	ldi	r24, 0x01	; 1
    2436:	80 93 e9 03 	sts	0x03E9, r24	; 0x8003e9 <_ZN7TwoWire12transmittingE>
    243a:	88 e6       	ldi	r24, 0x68	; 104
    243c:	80 93 0b 04 	sts	0x040B, r24	; 0x80040b <_ZN7TwoWire9txAddressE>
    2440:	10 92 ea 03 	sts	0x03EA, r1	; 0x8003ea <_ZN7TwoWire13txBufferIndexE>
    2444:	10 92 0c 04 	sts	0x040C, r1	; 0x80040c <_ZN7TwoWire14txBufferLengthE>
    2448:	81 e0       	ldi	r24, 0x01	; 1
    244a:	0e 94 71 07 	call	0xee2	; 0xee2 <_ZN7TwoWire15endTransmissionEh.constprop.133>
    244e:	81 11       	cpse	r24, r1
    2450:	70 c0       	rjmp	.+224    	; 0x2532 <_Z16getTimeInMinutesv+0x112>
    2452:	19 82       	std	Y+1, r1	; 0x01
    2454:	00 91 de 02 	lds	r16, 0x02DE	; 0x8002de <RTC>
    2458:	10 91 df 02 	lds	r17, 0x02DF	; 0x8002df <RTC+0x1>
    245c:	20 e0       	ldi	r18, 0x00	; 0
    245e:	41 e0       	ldi	r20, 0x01	; 1
    2460:	50 e0       	ldi	r21, 0x00	; 0
    2462:	be 01       	movw	r22, r28
    2464:	6f 5f       	subi	r22, 0xFF	; 255
    2466:	7f 4f       	sbci	r23, 0xFF	; 255
    2468:	c8 01       	movw	r24, r16
    246a:	0e 94 07 11 	call	0x220e	; 0x220e <_ZN18Adafruit_I2CDevice5writeEPKhjbS1_j.constprop.128>
    246e:	88 23       	and	r24, r24
    2470:	41 f0       	breq	.+16     	; 0x2482 <_Z16getTimeInMinutesv+0x62>
    2472:	47 e0       	ldi	r20, 0x07	; 7
    2474:	50 e0       	ldi	r21, 0x00	; 0
    2476:	be 01       	movw	r22, r28
    2478:	6f 5f       	subi	r22, 0xFF	; 255
    247a:	7f 4f       	sbci	r23, 0xFF	; 255
    247c:	c8 01       	movw	r24, r16
    247e:	0e 94 a1 10 	call	0x2142	; 0x2142 <_ZN18Adafruit_I2CDevice4readEPhjb.constprop.130>
    2482:	29 81       	ldd	r18, Y+1	; 0x01
    2484:	3a 81       	ldd	r19, Y+2	; 0x02
    2486:	83 2f       	mov	r24, r19
    2488:	90 e0       	ldi	r25, 0x00	; 0
    248a:	64 e0       	ldi	r22, 0x04	; 4
    248c:	95 95       	asr	r25
    248e:	87 95       	ror	r24
    2490:	6a 95       	dec	r22
    2492:	e1 f7       	brne	.-8      	; 0x248c <_Z16getTimeInMinutesv+0x6c>
    2494:	98 2f       	mov	r25, r24
    2496:	99 0f       	add	r25, r25
    2498:	99 0f       	add	r25, r25
    249a:	89 1b       	sub	r24, r25
    249c:	88 0f       	add	r24, r24
    249e:	98 2f       	mov	r25, r24
    24a0:	93 0f       	add	r25, r19
    24a2:	3b 81       	ldd	r19, Y+3	; 0x03
    24a4:	49 2f       	mov	r20, r25
    24a6:	50 e0       	ldi	r21, 0x00	; 0
    24a8:	80 91 ca 02 	lds	r24, 0x02CA	; 0x8002ca <MS_mode>
    24ac:	88 23       	and	r24, r24
    24ae:	e1 f0       	breq	.+56     	; 0x24e8 <_Z16getTimeInMinutesv+0xc8>
    24b0:	42 2f       	mov	r20, r18
    24b2:	4f 77       	andi	r20, 0x7F	; 127
    24b4:	24 2f       	mov	r18, r20
    24b6:	30 e0       	ldi	r19, 0x00	; 0
    24b8:	54 e0       	ldi	r21, 0x04	; 4
    24ba:	35 95       	asr	r19
    24bc:	27 95       	ror	r18
    24be:	5a 95       	dec	r21
    24c0:	e1 f7       	brne	.-8      	; 0x24ba <_Z16getTimeInMinutesv+0x9a>
    24c2:	82 2f       	mov	r24, r18
    24c4:	88 0f       	add	r24, r24
    24c6:	88 0f       	add	r24, r24
    24c8:	28 1b       	sub	r18, r24
    24ca:	82 2f       	mov	r24, r18
    24cc:	88 0f       	add	r24, r24
    24ce:	28 2f       	mov	r18, r24
    24d0:	24 0f       	add	r18, r20
    24d2:	3c e3       	ldi	r19, 0x3C	; 60
    24d4:	93 9f       	mul	r25, r19
    24d6:	c0 01       	movw	r24, r0
    24d8:	11 24       	eor	r1, r1
    24da:	82 0f       	add	r24, r18
    24dc:	91 1d       	adc	r25, r1
    24de:	90 93 c4 02 	sts	0x02C4, r25	; 0x8002c4 <minutes_count+0x1>
    24e2:	80 93 c3 02 	sts	0x02C3, r24	; 0x8002c3 <minutes_count>
    24e6:	16 c0       	rjmp	.+44     	; 0x2514 <_Z16getTimeInMinutesv+0xf4>
    24e8:	83 2f       	mov	r24, r19
    24ea:	90 e0       	ldi	r25, 0x00	; 0
    24ec:	24 e0       	ldi	r18, 0x04	; 4
    24ee:	95 95       	asr	r25
    24f0:	87 95       	ror	r24
    24f2:	2a 95       	dec	r18
    24f4:	e1 f7       	brne	.-8      	; 0x24ee <_Z16getTimeInMinutesv+0xce>
    24f6:	98 2f       	mov	r25, r24
    24f8:	99 0f       	add	r25, r25
    24fa:	99 0f       	add	r25, r25
    24fc:	89 1b       	sub	r24, r25
    24fe:	88 0f       	add	r24, r24
    2500:	83 0f       	add	r24, r19
    2502:	9c e3       	ldi	r25, 0x3C	; 60
    2504:	89 9f       	mul	r24, r25
    2506:	40 0d       	add	r20, r0
    2508:	51 1d       	adc	r21, r1
    250a:	11 24       	eor	r1, r1
    250c:	50 93 c4 02 	sts	0x02C4, r21	; 0x8002c4 <minutes_count+0x1>
    2510:	40 93 c3 02 	sts	0x02C3, r20	; 0x8002c3 <minutes_count>
    2514:	80 91 c3 02 	lds	r24, 0x02C3	; 0x8002c3 <minutes_count>
    2518:	90 91 c4 02 	lds	r25, 0x02C4	; 0x8002c4 <minutes_count+0x1>
    251c:	27 96       	adiw	r28, 0x07	; 7
    251e:	0f b6       	in	r0, 0x3f	; 63
    2520:	f8 94       	cli
    2522:	de bf       	out	0x3e, r29	; 62
    2524:	0f be       	out	0x3f, r0	; 63
    2526:	cd bf       	out	0x3d, r28	; 61
    2528:	df 91       	pop	r29
    252a:	cf 91       	pop	r28
    252c:	1f 91       	pop	r17
    252e:	0f 91       	pop	r16
    2530:	08 95       	ret
    2532:	80 91 c3 02 	lds	r24, 0x02C3	; 0x8002c3 <minutes_count>
    2536:	90 91 c4 02 	lds	r25, 0x02C4	; 0x8002c4 <minutes_count+0x1>
    253a:	01 96       	adiw	r24, 0x01	; 1
    253c:	80 3a       	cpi	r24, 0xA0	; 160
    253e:	25 e0       	ldi	r18, 0x05	; 5
    2540:	92 07       	cpc	r25, r18
    2542:	68 f2       	brcs	.-102    	; 0x24de <_Z16getTimeInMinutesv+0xbe>
    2544:	10 92 c4 02 	sts	0x02C4, r1	; 0x8002c4 <minutes_count+0x1>
    2548:	10 92 c3 02 	sts	0x02C3, r1	; 0x8002c3 <minutes_count>
    254c:	e3 cf       	rjmp	.-58     	; 0x2514 <_Z16getTimeInMinutesv+0xf4>

0000254e <_ZN6INA21913_readRegisterEh.constprop.123>:
    254e:	cf 93       	push	r28
    2550:	df 93       	push	r29
    2552:	a0 91 03 06 	lds	r26, 0x0603	; 0x800603 <INA+0xd>
    2556:	b0 91 04 06 	lds	r27, 0x0604	; 0x800604 <INA+0xe>
    255a:	90 91 02 06 	lds	r25, 0x0602	; 0x800602 <INA+0xc>
    255e:	21 e0       	ldi	r18, 0x01	; 1
    2560:	20 93 e9 03 	sts	0x03E9, r18	; 0x8003e9 <_ZN7TwoWire12transmittingE>
    2564:	90 93 0b 04 	sts	0x040B, r25	; 0x80040b <_ZN7TwoWire9txAddressE>
    2568:	10 92 ea 03 	sts	0x03EA, r1	; 0x8003ea <_ZN7TwoWire13txBufferIndexE>
    256c:	10 92 0c 04 	sts	0x040C, r1	; 0x80040c <_ZN7TwoWire14txBufferLengthE>
    2570:	ed 91       	ld	r30, X+
    2572:	fc 91       	ld	r31, X
    2574:	11 97       	sbiw	r26, 0x01	; 1
    2576:	01 90       	ld	r0, Z+
    2578:	f0 81       	ld	r31, Z
    257a:	e0 2d       	mov	r30, r0
    257c:	68 2f       	mov	r22, r24
    257e:	cd 01       	movw	r24, r26
    2580:	09 95       	icall
    2582:	81 e0       	ldi	r24, 0x01	; 1
    2584:	0e 94 71 07 	call	0xee2	; 0xee2 <_ZN7TwoWire15endTransmissionEh.constprop.133>
    2588:	88 23       	and	r24, r24
    258a:	49 f0       	breq	.+18     	; 0x259e <_ZN6INA21913_readRegisterEh.constprop.123+0x50>
    258c:	8f ef       	ldi	r24, 0xFF	; 255
    258e:	9f ef       	ldi	r25, 0xFF	; 255
    2590:	90 93 06 06 	sts	0x0606, r25	; 0x800606 <INA+0x10>
    2594:	80 93 05 06 	sts	0x0605, r24	; 0x800605 <INA+0xf>
    2598:	90 e0       	ldi	r25, 0x00	; 0
    259a:	80 e0       	ldi	r24, 0x00	; 0
    259c:	27 c0       	rjmp	.+78     	; 0x25ec <_ZN6INA21913_readRegisterEh.constprop.123+0x9e>
    259e:	41 e0       	ldi	r20, 0x01	; 1
    25a0:	62 e0       	ldi	r22, 0x02	; 2
    25a2:	80 91 02 06 	lds	r24, 0x0602	; 0x800602 <INA+0xc>
    25a6:	0e 94 99 06 	call	0xd32	; 0xd32 <twi_readFrom.constprop.136>
    25aa:	10 92 e8 03 	sts	0x03E8, r1	; 0x8003e8 <_ZN7TwoWire13rxBufferIndexE>
    25ae:	80 93 e7 03 	sts	0x03E7, r24	; 0x8003e7 <_ZN7TwoWire14rxBufferLengthE>
    25b2:	82 30       	cpi	r24, 0x02	; 2
    25b4:	f1 f4       	brne	.+60     	; 0x25f2 <_ZN6INA21913_readRegisterEh.constprop.123+0xa4>
    25b6:	80 91 03 06 	lds	r24, 0x0603	; 0x800603 <INA+0xd>
    25ba:	90 91 04 06 	lds	r25, 0x0604	; 0x800604 <INA+0xe>
    25be:	dc 01       	movw	r26, r24
    25c0:	ed 91       	ld	r30, X+
    25c2:	fc 91       	ld	r31, X
    25c4:	02 84       	ldd	r0, Z+10	; 0x0a
    25c6:	f3 85       	ldd	r31, Z+11	; 0x0b
    25c8:	e0 2d       	mov	r30, r0
    25ca:	09 95       	icall
    25cc:	d8 2f       	mov	r29, r24
    25ce:	b0 e0       	ldi	r27, 0x00	; 0
    25d0:	cb 2f       	mov	r28, r27
    25d2:	80 91 03 06 	lds	r24, 0x0603	; 0x800603 <INA+0xd>
    25d6:	90 91 04 06 	lds	r25, 0x0604	; 0x800604 <INA+0xe>
    25da:	dc 01       	movw	r26, r24
    25dc:	ed 91       	ld	r30, X+
    25de:	fc 91       	ld	r31, X
    25e0:	02 84       	ldd	r0, Z+10	; 0x0a
    25e2:	f3 85       	ldd	r31, Z+11	; 0x0b
    25e4:	e0 2d       	mov	r30, r0
    25e6:	09 95       	icall
    25e8:	8c 2b       	or	r24, r28
    25ea:	9d 2b       	or	r25, r29
    25ec:	df 91       	pop	r29
    25ee:	cf 91       	pop	r28
    25f0:	08 95       	ret
    25f2:	8e ef       	ldi	r24, 0xFE	; 254
    25f4:	9f ef       	ldi	r25, 0xFF	; 255
    25f6:	cc cf       	rjmp	.-104    	; 0x2590 <_ZN6INA21913_readRegisterEh.constprop.123+0x42>

000025f8 <_ZN5Print5writeEPKc.part.2.constprop.112>:
    25f8:	fc 01       	movw	r30, r24
    25fa:	01 90       	ld	r0, Z+
    25fc:	00 20       	and	r0, r0
    25fe:	e9 f7       	brne	.-6      	; 0x25fa <_ZN5Print5writeEPKc.part.2.constprop.112+0x2>
    2600:	31 97       	sbiw	r30, 0x01	; 1
    2602:	af 01       	movw	r20, r30
    2604:	48 1b       	sub	r20, r24
    2606:	59 0b       	sbc	r21, r25
    2608:	bc 01       	movw	r22, r24
    260a:	89 e5       	ldi	r24, 0x59	; 89
    260c:	94 e0       	ldi	r25, 0x04	; 4
    260e:	0c 94 ef 05 	jmp	0xbde	; 0xbde <_ZN5Print5writeEPKhj>

00002612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>:
    2612:	cf 93       	push	r28
    2614:	df 93       	push	r29
    2616:	0e 94 2f 05 	call	0xa5e	; 0xa5e <_ZN5Print5printEPK19__FlashStringHelper.constprop.108>
    261a:	ec 01       	movw	r28, r24
    261c:	86 e3       	ldi	r24, 0x36	; 54
    261e:	91 e0       	ldi	r25, 0x01	; 1
    2620:	0e 94 fc 12 	call	0x25f8	; 0x25f8 <_ZN5Print5writeEPKc.part.2.constprop.112>
    2624:	8c 0f       	add	r24, r28
    2626:	9d 1f       	adc	r25, r29
    2628:	df 91       	pop	r29
    262a:	cf 91       	pop	r28
    262c:	08 95       	ret

0000262e <_ZN5Print11printNumberEmh.constprop.35>:
    262e:	8f 92       	push	r8
    2630:	9f 92       	push	r9
    2632:	af 92       	push	r10
    2634:	bf 92       	push	r11
    2636:	0f 93       	push	r16
    2638:	1f 93       	push	r17
    263a:	cf 93       	push	r28
    263c:	df 93       	push	r29
    263e:	cd b7       	in	r28, 0x3d	; 61
    2640:	de b7       	in	r29, 0x3e	; 62
    2642:	a1 97       	sbiw	r28, 0x21	; 33
    2644:	0f b6       	in	r0, 0x3f	; 63
    2646:	f8 94       	cli
    2648:	de bf       	out	0x3e, r29	; 62
    264a:	0f be       	out	0x3f, r0	; 63
    264c:	cd bf       	out	0x3d, r28	; 61
    264e:	19 a2       	std	Y+33, r1	; 0x21
    2650:	42 30       	cpi	r20, 0x02	; 2
    2652:	08 f4       	brcc	.+2      	; 0x2656 <_ZN5Print11printNumberEmh.constprop.35+0x28>
    2654:	4a e0       	ldi	r20, 0x0A	; 10
    2656:	8e 01       	movw	r16, r28
    2658:	0f 5d       	subi	r16, 0xDF	; 223
    265a:	1f 4f       	sbci	r17, 0xFF	; 255
    265c:	84 2e       	mov	r8, r20
    265e:	91 2c       	mov	r9, r1
    2660:	b1 2c       	mov	r11, r1
    2662:	a1 2c       	mov	r10, r1
    2664:	a5 01       	movw	r20, r10
    2666:	94 01       	movw	r18, r8
    2668:	0e 94 9e 29 	call	0x533c	; 0x533c <__udivmodsi4>
    266c:	e6 2f       	mov	r30, r22
    266e:	b9 01       	movw	r22, r18
    2670:	ca 01       	movw	r24, r20
    2672:	ea 30       	cpi	r30, 0x0A	; 10
    2674:	f4 f4       	brge	.+60     	; 0x26b2 <_ZN5Print11printNumberEmh.constprop.35+0x84>
    2676:	e0 5d       	subi	r30, 0xD0	; 208
    2678:	d8 01       	movw	r26, r16
    267a:	ee 93       	st	-X, r30
    267c:	8d 01       	movw	r16, r26
    267e:	23 2b       	or	r18, r19
    2680:	24 2b       	or	r18, r20
    2682:	25 2b       	or	r18, r21
    2684:	79 f7       	brne	.-34     	; 0x2664 <_ZN5Print11printNumberEmh.constprop.35+0x36>
    2686:	90 e0       	ldi	r25, 0x00	; 0
    2688:	80 e0       	ldi	r24, 0x00	; 0
    268a:	10 97       	sbiw	r26, 0x00	; 0
    268c:	19 f0       	breq	.+6      	; 0x2694 <_ZN5Print11printNumberEmh.constprop.35+0x66>
    268e:	cd 01       	movw	r24, r26
    2690:	0e 94 fc 12 	call	0x25f8	; 0x25f8 <_ZN5Print5writeEPKc.part.2.constprop.112>
    2694:	a1 96       	adiw	r28, 0x21	; 33
    2696:	0f b6       	in	r0, 0x3f	; 63
    2698:	f8 94       	cli
    269a:	de bf       	out	0x3e, r29	; 62
    269c:	0f be       	out	0x3f, r0	; 63
    269e:	cd bf       	out	0x3d, r28	; 61
    26a0:	df 91       	pop	r29
    26a2:	cf 91       	pop	r28
    26a4:	1f 91       	pop	r17
    26a6:	0f 91       	pop	r16
    26a8:	bf 90       	pop	r11
    26aa:	af 90       	pop	r10
    26ac:	9f 90       	pop	r9
    26ae:	8f 90       	pop	r8
    26b0:	08 95       	ret
    26b2:	e9 5c       	subi	r30, 0xC9	; 201
    26b4:	e1 cf       	rjmp	.-62     	; 0x2678 <_ZN5Print11printNumberEmh.constprop.35+0x4a>

000026b6 <_ZN5Print7printlnEPKc.constprop.37>:
    26b6:	cf 93       	push	r28
    26b8:	df 93       	push	r29
    26ba:	0e 94 fc 12 	call	0x25f8	; 0x25f8 <_ZN5Print5writeEPKc.part.2.constprop.112>
    26be:	ec 01       	movw	r28, r24
    26c0:	86 e3       	ldi	r24, 0x36	; 54
    26c2:	91 e0       	ldi	r25, 0x01	; 1
    26c4:	0e 94 fc 12 	call	0x25f8	; 0x25f8 <_ZN5Print5writeEPKc.part.2.constprop.112>
    26c8:	8c 0f       	add	r24, r28
    26ca:	9d 1f       	adc	r25, r29
    26cc:	df 91       	pop	r29
    26ce:	cf 91       	pop	r28
    26d0:	08 95       	ret

000026d2 <_ZN5Print10printFloatEdh.constprop.30>:
    26d2:	4f 92       	push	r4
    26d4:	5f 92       	push	r5
    26d6:	6f 92       	push	r6
    26d8:	7f 92       	push	r7
    26da:	8f 92       	push	r8
    26dc:	9f 92       	push	r9
    26de:	af 92       	push	r10
    26e0:	bf 92       	push	r11
    26e2:	cf 92       	push	r12
    26e4:	df 92       	push	r13
    26e6:	ef 92       	push	r14
    26e8:	ff 92       	push	r15
    26ea:	0f 93       	push	r16
    26ec:	1f 93       	push	r17
    26ee:	cf 93       	push	r28
    26f0:	6b 01       	movw	r12, r22
    26f2:	7c 01       	movw	r14, r24
    26f4:	74 2e       	mov	r7, r20
    26f6:	ac 01       	movw	r20, r24
    26f8:	9b 01       	movw	r18, r22
    26fa:	0e 94 39 2b 	call	0x5672	; 0x5672 <__unordsf2>
    26fe:	88 23       	and	r24, r24
    2700:	99 f0       	breq	.+38     	; 0x2728 <_ZN5Print10printFloatEdh.constprop.30+0x56>
    2702:	89 e3       	ldi	r24, 0x39	; 57
    2704:	91 e0       	ldi	r25, 0x01	; 1
    2706:	cf 91       	pop	r28
    2708:	1f 91       	pop	r17
    270a:	0f 91       	pop	r16
    270c:	ff 90       	pop	r15
    270e:	ef 90       	pop	r14
    2710:	df 90       	pop	r13
    2712:	cf 90       	pop	r12
    2714:	bf 90       	pop	r11
    2716:	af 90       	pop	r10
    2718:	9f 90       	pop	r9
    271a:	8f 90       	pop	r8
    271c:	7f 90       	pop	r7
    271e:	6f 90       	pop	r6
    2720:	5f 90       	pop	r5
    2722:	4f 90       	pop	r4
    2724:	0c 94 fc 12 	jmp	0x25f8	; 0x25f8 <_ZN5Print5writeEPKc.part.2.constprop.112>
    2728:	46 01       	movw	r8, r12
    272a:	57 01       	movw	r10, r14
    272c:	e8 94       	clt
    272e:	b7 f8       	bld	r11, 7
    2730:	2f ef       	ldi	r18, 0xFF	; 255
    2732:	3f ef       	ldi	r19, 0xFF	; 255
    2734:	4f e7       	ldi	r20, 0x7F	; 127
    2736:	5f e7       	ldi	r21, 0x7F	; 127
    2738:	c5 01       	movw	r24, r10
    273a:	b4 01       	movw	r22, r8
    273c:	0e 94 39 2b 	call	0x5672	; 0x5672 <__unordsf2>
    2740:	81 11       	cpse	r24, r1
    2742:	0d c0       	rjmp	.+26     	; 0x275e <_ZN5Print10printFloatEdh.constprop.30+0x8c>
    2744:	2f ef       	ldi	r18, 0xFF	; 255
    2746:	3f ef       	ldi	r19, 0xFF	; 255
    2748:	4f e7       	ldi	r20, 0x7F	; 127
    274a:	5f e7       	ldi	r21, 0x7F	; 127
    274c:	c5 01       	movw	r24, r10
    274e:	b4 01       	movw	r22, r8
    2750:	0e 94 2c 28 	call	0x5058	; 0x5058 <__cmpsf2>
    2754:	18 16       	cp	r1, r24
    2756:	1c f4       	brge	.+6      	; 0x275e <_ZN5Print10printFloatEdh.constprop.30+0x8c>
    2758:	8d e3       	ldi	r24, 0x3D	; 61
    275a:	91 e0       	ldi	r25, 0x01	; 1
    275c:	d4 cf       	rjmp	.-88     	; 0x2706 <_ZN5Print10printFloatEdh.constprop.30+0x34>
    275e:	2f ef       	ldi	r18, 0xFF	; 255
    2760:	3f ef       	ldi	r19, 0xFF	; 255
    2762:	4f e7       	ldi	r20, 0x7F	; 127
    2764:	5f e4       	ldi	r21, 0x4F	; 79
    2766:	c7 01       	movw	r24, r14
    2768:	b6 01       	movw	r22, r12
    276a:	0e 94 34 2b 	call	0x5668	; 0x5668 <__gesf2>
    276e:	18 16       	cp	r1, r24
    2770:	1c f4       	brge	.+6      	; 0x2778 <_ZN5Print10printFloatEdh.constprop.30+0xa6>
    2772:	81 e4       	ldi	r24, 0x41	; 65
    2774:	91 e0       	ldi	r25, 0x01	; 1
    2776:	c7 cf       	rjmp	.-114    	; 0x2706 <_ZN5Print10printFloatEdh.constprop.30+0x34>
    2778:	2f ef       	ldi	r18, 0xFF	; 255
    277a:	3f ef       	ldi	r19, 0xFF	; 255
    277c:	4f e7       	ldi	r20, 0x7F	; 127
    277e:	5f ec       	ldi	r21, 0xCF	; 207
    2780:	c7 01       	movw	r24, r14
    2782:	b6 01       	movw	r22, r12
    2784:	0e 94 2c 28 	call	0x5058	; 0x5058 <__cmpsf2>
    2788:	87 fd       	sbrc	r24, 7
    278a:	f3 cf       	rjmp	.-26     	; 0x2772 <_ZN5Print10printFloatEdh.constprop.30+0xa0>
    278c:	20 e0       	ldi	r18, 0x00	; 0
    278e:	30 e0       	ldi	r19, 0x00	; 0
    2790:	a9 01       	movw	r20, r18
    2792:	c7 01       	movw	r24, r14
    2794:	b6 01       	movw	r22, r12
    2796:	0e 94 2c 28 	call	0x5058	; 0x5058 <__cmpsf2>
    279a:	10 e0       	ldi	r17, 0x00	; 0
    279c:	00 e0       	ldi	r16, 0x00	; 0
    279e:	87 ff       	sbrs	r24, 7
    27a0:	0a c0       	rjmp	.+20     	; 0x27b6 <_ZN5Print10printFloatEdh.constprop.30+0xe4>
    27a2:	6d e2       	ldi	r22, 0x2D	; 45
    27a4:	89 e5       	ldi	r24, 0x59	; 89
    27a6:	94 e0       	ldi	r25, 0x04	; 4
    27a8:	0e 94 e2 04 	call	0x9c4	; 0x9c4 <_ZN14HardwareSerial5writeEh>
    27ac:	8c 01       	movw	r16, r24
    27ae:	f7 fa       	bst	r15, 7
    27b0:	f0 94       	com	r15
    27b2:	f7 f8       	bld	r15, 7
    27b4:	f0 94       	com	r15
    27b6:	c0 e0       	ldi	r28, 0x00	; 0
    27b8:	60 e0       	ldi	r22, 0x00	; 0
    27ba:	70 e0       	ldi	r23, 0x00	; 0
    27bc:	80 e0       	ldi	r24, 0x00	; 0
    27be:	9f e3       	ldi	r25, 0x3F	; 63
    27c0:	7c 16       	cp	r7, r28
    27c2:	41 f0       	breq	.+16     	; 0x27d4 <_ZN5Print10printFloatEdh.constprop.30+0x102>
    27c4:	20 e0       	ldi	r18, 0x00	; 0
    27c6:	30 e0       	ldi	r19, 0x00	; 0
    27c8:	40 e2       	ldi	r20, 0x20	; 32
    27ca:	51 e4       	ldi	r21, 0x41	; 65
    27cc:	0e 94 93 2a 	call	0x5526	; 0x5526 <__divsf3>
    27d0:	cf 5f       	subi	r28, 0xFF	; 255
    27d2:	f6 cf       	rjmp	.-20     	; 0x27c0 <_ZN5Print10printFloatEdh.constprop.30+0xee>
    27d4:	a7 01       	movw	r20, r14
    27d6:	96 01       	movw	r18, r12
    27d8:	0e 94 27 2a 	call	0x544e	; 0x544e <__addsf3>
    27dc:	2b 01       	movw	r4, r22
    27de:	3c 01       	movw	r6, r24
    27e0:	0e 94 05 2b 	call	0x560a	; 0x560a <__fixunssfsi>
    27e4:	4b 01       	movw	r8, r22
    27e6:	5c 01       	movw	r10, r24
    27e8:	4a e0       	ldi	r20, 0x0A	; 10
    27ea:	0e 94 17 13 	call	0x262e	; 0x262e <_ZN5Print11printNumberEmh.constprop.35>
    27ee:	7c 01       	movw	r14, r24
    27f0:	e0 0e       	add	r14, r16
    27f2:	f1 1e       	adc	r15, r17
    27f4:	cc 23       	and	r28, r28
    27f6:	c1 f1       	breq	.+112    	; 0x2868 <_ZN5Print10printFloatEdh.constprop.30+0x196>
    27f8:	c5 01       	movw	r24, r10
    27fa:	b4 01       	movw	r22, r8
    27fc:	0e 94 31 28 	call	0x5062	; 0x5062 <__floatunsisf>
    2800:	9b 01       	movw	r18, r22
    2802:	ac 01       	movw	r20, r24
    2804:	c3 01       	movw	r24, r6
    2806:	b2 01       	movw	r22, r4
    2808:	0e 94 26 2a 	call	0x544c	; 0x544c <__subsf3>
    280c:	4b 01       	movw	r8, r22
    280e:	5c 01       	movw	r10, r24
    2810:	6e e2       	ldi	r22, 0x2E	; 46
    2812:	89 e5       	ldi	r24, 0x59	; 89
    2814:	94 e0       	ldi	r25, 0x04	; 4
    2816:	0e 94 e2 04 	call	0x9c4	; 0x9c4 <_ZN14HardwareSerial5writeEh>
    281a:	e8 0e       	add	r14, r24
    281c:	f9 1e       	adc	r15, r25
    281e:	c1 50       	subi	r28, 0x01	; 1
    2820:	18 f1       	brcs	.+70     	; 0x2868 <_ZN5Print10printFloatEdh.constprop.30+0x196>
    2822:	20 e0       	ldi	r18, 0x00	; 0
    2824:	30 e0       	ldi	r19, 0x00	; 0
    2826:	40 e2       	ldi	r20, 0x20	; 32
    2828:	51 e4       	ldi	r21, 0x41	; 65
    282a:	c5 01       	movw	r24, r10
    282c:	b4 01       	movw	r22, r8
    282e:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    2832:	2b 01       	movw	r4, r22
    2834:	3c 01       	movw	r6, r24
    2836:	0e 94 05 2b 	call	0x560a	; 0x560a <__fixunssfsi>
    283a:	4b 01       	movw	r8, r22
    283c:	b1 2c       	mov	r11, r1
    283e:	a1 2c       	mov	r10, r1
    2840:	4a e0       	ldi	r20, 0x0A	; 10
    2842:	c5 01       	movw	r24, r10
    2844:	b4 01       	movw	r22, r8
    2846:	0e 94 17 13 	call	0x262e	; 0x262e <_ZN5Print11printNumberEmh.constprop.35>
    284a:	e8 0e       	add	r14, r24
    284c:	f9 1e       	adc	r15, r25
    284e:	c5 01       	movw	r24, r10
    2850:	b4 01       	movw	r22, r8
    2852:	0e 94 31 28 	call	0x5062	; 0x5062 <__floatunsisf>
    2856:	9b 01       	movw	r18, r22
    2858:	ac 01       	movw	r20, r24
    285a:	c3 01       	movw	r24, r6
    285c:	b2 01       	movw	r22, r4
    285e:	0e 94 26 2a 	call	0x544c	; 0x544c <__subsf3>
    2862:	4b 01       	movw	r8, r22
    2864:	5c 01       	movw	r10, r24
    2866:	db cf       	rjmp	.-74     	; 0x281e <_ZN5Print10printFloatEdh.constprop.30+0x14c>
    2868:	c7 01       	movw	r24, r14
    286a:	cf 91       	pop	r28
    286c:	1f 91       	pop	r17
    286e:	0f 91       	pop	r16
    2870:	ff 90       	pop	r15
    2872:	ef 90       	pop	r14
    2874:	df 90       	pop	r13
    2876:	cf 90       	pop	r12
    2878:	bf 90       	pop	r11
    287a:	af 90       	pop	r10
    287c:	9f 90       	pop	r9
    287e:	8f 90       	pop	r8
    2880:	7f 90       	pop	r7
    2882:	6f 90       	pop	r6
    2884:	5f 90       	pop	r5
    2886:	4f 90       	pop	r4
    2888:	08 95       	ret

0000288a <_ZN5Print7printlnEdi.constprop.29>:
    288a:	cf 93       	push	r28
    288c:	df 93       	push	r29
    288e:	42 e0       	ldi	r20, 0x02	; 2
    2890:	0e 94 69 13 	call	0x26d2	; 0x26d2 <_ZN5Print10printFloatEdh.constprop.30>
    2894:	ec 01       	movw	r28, r24
    2896:	86 e3       	ldi	r24, 0x36	; 54
    2898:	91 e0       	ldi	r25, 0x01	; 1
    289a:	0e 94 fc 12 	call	0x25f8	; 0x25f8 <_ZN5Print5writeEPKc.part.2.constprop.112>
    289e:	8c 0f       	add	r24, r28
    28a0:	9d 1f       	adc	r25, r29
    28a2:	df 91       	pop	r29
    28a4:	cf 91       	pop	r28
    28a6:	08 95       	ret

000028a8 <_Z15stopDiagnosticsv>:
    28a8:	85 e4       	ldi	r24, 0x45	; 69
    28aa:	91 e0       	ldi	r25, 0x01	; 1
    28ac:	0e 94 fc 12 	call	0x25f8	; 0x25f8 <_ZN5Print5writeEPKc.part.2.constprop.112>
    28b0:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <MODE>
    28b4:	8b 7f       	andi	r24, 0xFB	; 251
    28b6:	80 93 e6 03 	sts	0x03E6, r24	; 0x8003e6 <MODE>
    28ba:	80 91 04 01 	lds	r24, 0x0104	; 0x800104 <configured_brightness>
    28be:	0c 94 b0 0f 	jmp	0x1f60	; 0x1f60 <_Z13setBrightnessh>

000028c2 <_Z16startDiagnosticsv>:
    28c2:	8f e5       	ldi	r24, 0x5F	; 95
    28c4:	91 e0       	ldi	r25, 0x01	; 1
    28c6:	0e 94 fc 12 	call	0x25f8	; 0x25f8 <_ZN5Print5writeEPKc.part.2.constprop.112>
    28ca:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <MODE>
    28ce:	84 60       	ori	r24, 0x04	; 4
    28d0:	80 93 e6 03 	sts	0x03E6, r24	; 0x8003e6 <MODE>
    28d4:	80 91 cb 02 	lds	r24, 0x02CB	; 0x8002cb <_target_brightness>
    28d8:	0e 94 01 10 	call	0x2002	; 0x2002 <_Z16configBrightnessh>
    28dc:	89 e1       	ldi	r24, 0x19	; 25
    28de:	0e 94 b0 0f 	call	0x1f60	; 0x1f60 <_Z13setBrightnessh>
    28e2:	80 e0       	ldi	r24, 0x00	; 0
    28e4:	0e 94 e5 0f 	call	0x1fca	; 0x1fca <_Z22setSymbolRawOnNumitronhh.constprop.114>
    28e8:	81 e0       	ldi	r24, 0x01	; 1
    28ea:	0e 94 e5 0f 	call	0x1fca	; 0x1fca <_Z22setSymbolRawOnNumitronhh.constprop.114>
    28ee:	82 e0       	ldi	r24, 0x02	; 2
    28f0:	0e 94 e5 0f 	call	0x1fca	; 0x1fca <_Z22setSymbolRawOnNumitronhh.constprop.114>
    28f4:	83 e0       	ldi	r24, 0x03	; 3
    28f6:	0c 94 e5 0f 	jmp	0x1fca	; 0x1fca <_Z22setSymbolRawOnNumitronhh.constprop.114>

000028fa <twi_stop>:
    28fa:	85 ed       	ldi	r24, 0xD5	; 213
    28fc:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    2900:	80 91 55 04 	lds	r24, 0x0455	; 0x800455 <twi_timeout_us>
    2904:	90 91 56 04 	lds	r25, 0x0456	; 0x800456 <twi_timeout_us+0x1>
    2908:	a0 91 57 04 	lds	r26, 0x0457	; 0x800457 <twi_timeout_us+0x2>
    290c:	b0 91 58 04 	lds	r27, 0x0458	; 0x800458 <twi_timeout_us+0x3>
    2910:	07 96       	adiw	r24, 0x07	; 7
    2912:	a1 1d       	adc	r26, r1
    2914:	b1 1d       	adc	r27, r1
    2916:	23 e0       	ldi	r18, 0x03	; 3
    2918:	b6 95       	lsr	r27
    291a:	a7 95       	ror	r26
    291c:	97 95       	ror	r25
    291e:	87 95       	ror	r24
    2920:	2a 95       	dec	r18
    2922:	d1 f7       	brne	.-12     	; 0x2918 <twi_stop+0x1e>
    2924:	20 91 bc 00 	lds	r18, 0x00BC	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    2928:	24 fd       	sbrc	r18, 4
    292a:	03 c0       	rjmp	.+6      	; 0x2932 <twi_stop+0x38>
    292c:	10 92 53 04 	sts	0x0453, r1	; 0x800453 <twi_state>
    2930:	08 95       	ret
    2932:	40 91 55 04 	lds	r20, 0x0455	; 0x800455 <twi_timeout_us>
    2936:	50 91 56 04 	lds	r21, 0x0456	; 0x800456 <twi_timeout_us+0x1>
    293a:	60 91 57 04 	lds	r22, 0x0457	; 0x800457 <twi_timeout_us+0x2>
    293e:	70 91 58 04 	lds	r23, 0x0458	; 0x800458 <twi_timeout_us+0x3>
    2942:	45 2b       	or	r20, r21
    2944:	46 2b       	or	r20, r22
    2946:	47 2b       	or	r20, r23
    2948:	69 f3       	breq	.-38     	; 0x2924 <twi_stop+0x2a>
    294a:	00 97       	sbiw	r24, 0x00	; 0
    294c:	a1 05       	cpc	r26, r1
    294e:	b1 05       	cpc	r27, r1
    2950:	41 f0       	breq	.+16     	; 0x2962 <twi_stop+0x68>
    2952:	2a e2       	ldi	r18, 0x2A	; 42
    2954:	2a 95       	dec	r18
    2956:	f1 f7       	brne	.-4      	; 0x2954 <twi_stop+0x5a>
    2958:	00 c0       	rjmp	.+0      	; 0x295a <twi_stop+0x60>
    295a:	01 97       	sbiw	r24, 0x01	; 1
    295c:	a1 09       	sbc	r26, r1
    295e:	b1 09       	sbc	r27, r1
    2960:	e1 cf       	rjmp	.-62     	; 0x2924 <twi_stop+0x2a>
    2962:	80 91 54 04 	lds	r24, 0x0454	; 0x800454 <twi_do_reset_on_timeout>
    2966:	0c 94 78 06 	jmp	0xcf0	; 0xcf0 <twi_handleTimeout>

0000296a <__vector_16>:
    296a:	1f 92       	push	r1
    296c:	0f 92       	push	r0
    296e:	0f b6       	in	r0, 0x3f	; 63
    2970:	0f 92       	push	r0
    2972:	11 24       	eor	r1, r1
    2974:	2f 93       	push	r18
    2976:	3f 93       	push	r19
    2978:	8f 93       	push	r24
    297a:	9f 93       	push	r25
    297c:	af 93       	push	r26
    297e:	bf 93       	push	r27
    2980:	80 91 d2 02 	lds	r24, 0x02D2	; 0x8002d2 <timer0_millis>
    2984:	90 91 d3 02 	lds	r25, 0x02D3	; 0x8002d3 <timer0_millis+0x1>
    2988:	a0 91 d4 02 	lds	r26, 0x02D4	; 0x8002d4 <timer0_millis+0x2>
    298c:	b0 91 d5 02 	lds	r27, 0x02D5	; 0x8002d5 <timer0_millis+0x3>
    2990:	30 91 d1 02 	lds	r19, 0x02D1	; 0x8002d1 <timer0_fract>
    2994:	23 e0       	ldi	r18, 0x03	; 3
    2996:	23 0f       	add	r18, r19
    2998:	2d 37       	cpi	r18, 0x7D	; 125
    299a:	58 f5       	brcc	.+86     	; 0x29f2 <__vector_16+0x88>
    299c:	01 96       	adiw	r24, 0x01	; 1
    299e:	a1 1d       	adc	r26, r1
    29a0:	b1 1d       	adc	r27, r1
    29a2:	20 93 d1 02 	sts	0x02D1, r18	; 0x8002d1 <timer0_fract>
    29a6:	80 93 d2 02 	sts	0x02D2, r24	; 0x8002d2 <timer0_millis>
    29aa:	90 93 d3 02 	sts	0x02D3, r25	; 0x8002d3 <timer0_millis+0x1>
    29ae:	a0 93 d4 02 	sts	0x02D4, r26	; 0x8002d4 <timer0_millis+0x2>
    29b2:	b0 93 d5 02 	sts	0x02D5, r27	; 0x8002d5 <timer0_millis+0x3>
    29b6:	80 91 d6 02 	lds	r24, 0x02D6	; 0x8002d6 <timer0_overflow_count>
    29ba:	90 91 d7 02 	lds	r25, 0x02D7	; 0x8002d7 <timer0_overflow_count+0x1>
    29be:	a0 91 d8 02 	lds	r26, 0x02D8	; 0x8002d8 <timer0_overflow_count+0x2>
    29c2:	b0 91 d9 02 	lds	r27, 0x02D9	; 0x8002d9 <timer0_overflow_count+0x3>
    29c6:	01 96       	adiw	r24, 0x01	; 1
    29c8:	a1 1d       	adc	r26, r1
    29ca:	b1 1d       	adc	r27, r1
    29cc:	80 93 d6 02 	sts	0x02D6, r24	; 0x8002d6 <timer0_overflow_count>
    29d0:	90 93 d7 02 	sts	0x02D7, r25	; 0x8002d7 <timer0_overflow_count+0x1>
    29d4:	a0 93 d8 02 	sts	0x02D8, r26	; 0x8002d8 <timer0_overflow_count+0x2>
    29d8:	b0 93 d9 02 	sts	0x02D9, r27	; 0x8002d9 <timer0_overflow_count+0x3>
    29dc:	bf 91       	pop	r27
    29de:	af 91       	pop	r26
    29e0:	9f 91       	pop	r25
    29e2:	8f 91       	pop	r24
    29e4:	3f 91       	pop	r19
    29e6:	2f 91       	pop	r18
    29e8:	0f 90       	pop	r0
    29ea:	0f be       	out	0x3f, r0	; 63
    29ec:	0f 90       	pop	r0
    29ee:	1f 90       	pop	r1
    29f0:	18 95       	reti
    29f2:	26 e8       	ldi	r18, 0x86	; 134
    29f4:	23 0f       	add	r18, r19
    29f6:	02 96       	adiw	r24, 0x02	; 2
    29f8:	a1 1d       	adc	r26, r1
    29fa:	b1 1d       	adc	r27, r1
    29fc:	d2 cf       	rjmp	.-92     	; 0x29a2 <__vector_16+0x38>

000029fe <__vector_19>:
    29fe:	1f 92       	push	r1
    2a00:	0f 92       	push	r0
    2a02:	0f b6       	in	r0, 0x3f	; 63
    2a04:	0f 92       	push	r0
    2a06:	11 24       	eor	r1, r1
    2a08:	2f 93       	push	r18
    2a0a:	3f 93       	push	r19
    2a0c:	4f 93       	push	r20
    2a0e:	5f 93       	push	r21
    2a10:	6f 93       	push	r22
    2a12:	7f 93       	push	r23
    2a14:	8f 93       	push	r24
    2a16:	9f 93       	push	r25
    2a18:	af 93       	push	r26
    2a1a:	bf 93       	push	r27
    2a1c:	ef 93       	push	r30
    2a1e:	ff 93       	push	r31
    2a20:	89 e5       	ldi	r24, 0x59	; 89
    2a22:	94 e0       	ldi	r25, 0x04	; 4
    2a24:	0e 94 c0 04 	call	0x980	; 0x980 <_ZN14HardwareSerial17_tx_udr_empty_irqEv>
    2a28:	ff 91       	pop	r31
    2a2a:	ef 91       	pop	r30
    2a2c:	bf 91       	pop	r27
    2a2e:	af 91       	pop	r26
    2a30:	9f 91       	pop	r25
    2a32:	8f 91       	pop	r24
    2a34:	7f 91       	pop	r23
    2a36:	6f 91       	pop	r22
    2a38:	5f 91       	pop	r21
    2a3a:	4f 91       	pop	r20
    2a3c:	3f 91       	pop	r19
    2a3e:	2f 91       	pop	r18
    2a40:	0f 90       	pop	r0
    2a42:	0f be       	out	0x3f, r0	; 63
    2a44:	0f 90       	pop	r0
    2a46:	1f 90       	pop	r1
    2a48:	18 95       	reti

00002a4a <__vector_18>:
    2a4a:	1f 92       	push	r1
    2a4c:	0f 92       	push	r0
    2a4e:	0f b6       	in	r0, 0x3f	; 63
    2a50:	0f 92       	push	r0
    2a52:	11 24       	eor	r1, r1
    2a54:	2f 93       	push	r18
    2a56:	8f 93       	push	r24
    2a58:	9f 93       	push	r25
    2a5a:	ef 93       	push	r30
    2a5c:	ff 93       	push	r31
    2a5e:	e0 91 69 04 	lds	r30, 0x0469	; 0x800469 <Serial+0x10>
    2a62:	f0 91 6a 04 	lds	r31, 0x046A	; 0x80046a <Serial+0x11>
    2a66:	80 81       	ld	r24, Z
    2a68:	e0 91 6f 04 	lds	r30, 0x046F	; 0x80046f <Serial+0x16>
    2a6c:	f0 91 70 04 	lds	r31, 0x0470	; 0x800470 <Serial+0x17>
    2a70:	82 fd       	sbrc	r24, 2
    2a72:	1b c0       	rjmp	.+54     	; 0x2aaa <__vector_18+0x60>
    2a74:	90 81       	ld	r25, Z
    2a76:	80 91 72 04 	lds	r24, 0x0472	; 0x800472 <Serial+0x19>
    2a7a:	8f 5f       	subi	r24, 0xFF	; 255
    2a7c:	8f 73       	andi	r24, 0x3F	; 63
    2a7e:	20 91 73 04 	lds	r18, 0x0473	; 0x800473 <Serial+0x1a>
    2a82:	82 17       	cp	r24, r18
    2a84:	41 f0       	breq	.+16     	; 0x2a96 <__vector_18+0x4c>
    2a86:	e0 91 72 04 	lds	r30, 0x0472	; 0x800472 <Serial+0x19>
    2a8a:	f0 e0       	ldi	r31, 0x00	; 0
    2a8c:	e7 5a       	subi	r30, 0xA7	; 167
    2a8e:	fb 4f       	sbci	r31, 0xFB	; 251
    2a90:	95 8f       	std	Z+29, r25	; 0x1d
    2a92:	80 93 72 04 	sts	0x0472, r24	; 0x800472 <Serial+0x19>
    2a96:	ff 91       	pop	r31
    2a98:	ef 91       	pop	r30
    2a9a:	9f 91       	pop	r25
    2a9c:	8f 91       	pop	r24
    2a9e:	2f 91       	pop	r18
    2aa0:	0f 90       	pop	r0
    2aa2:	0f be       	out	0x3f, r0	; 63
    2aa4:	0f 90       	pop	r0
    2aa6:	1f 90       	pop	r1
    2aa8:	18 95       	reti
    2aaa:	80 81       	ld	r24, Z
    2aac:	f4 cf       	rjmp	.-24     	; 0x2a96 <__vector_18+0x4c>

00002aae <__vector_24>:
    2aae:	1f 92       	push	r1
    2ab0:	0f 92       	push	r0
    2ab2:	0f b6       	in	r0, 0x3f	; 63
    2ab4:	0f 92       	push	r0
    2ab6:	11 24       	eor	r1, r1
    2ab8:	2f 93       	push	r18
    2aba:	3f 93       	push	r19
    2abc:	4f 93       	push	r20
    2abe:	5f 93       	push	r21
    2ac0:	6f 93       	push	r22
    2ac2:	7f 93       	push	r23
    2ac4:	8f 93       	push	r24
    2ac6:	9f 93       	push	r25
    2ac8:	af 93       	push	r26
    2aca:	bf 93       	push	r27
    2acc:	ef 93       	push	r30
    2ace:	ff 93       	push	r31
    2ad0:	80 91 b9 00 	lds	r24, 0x00B9	; 0x8000b9 <__TEXT_REGION_LENGTH__+0x7e00b9>
    2ad4:	88 7f       	andi	r24, 0xF8	; 248
    2ad6:	80 36       	cpi	r24, 0x60	; 96
    2ad8:	09 f4       	brne	.+2      	; 0x2adc <__vector_24+0x2e>
    2ada:	4a c0       	rjmp	.+148    	; 0x2b70 <__vector_24+0xc2>
    2adc:	f0 f5       	brcc	.+124    	; 0x2b5a <__vector_24+0xac>
    2ade:	88 32       	cpi	r24, 0x28	; 40
    2ae0:	09 f4       	brne	.+2      	; 0x2ae4 <__vector_24+0x36>
    2ae2:	a7 c0       	rjmp	.+334    	; 0x2c32 <__vector_24+0x184>
    2ae4:	18 f5       	brcc	.+70     	; 0x2b2c <__vector_24+0x7e>
    2ae6:	80 31       	cpi	r24, 0x10	; 16
    2ae8:	09 f4       	brne	.+2      	; 0x2aec <__vector_24+0x3e>
    2aea:	9b c0       	rjmp	.+310    	; 0x2c22 <__vector_24+0x174>
    2aec:	b8 f4       	brcc	.+46     	; 0x2b1c <__vector_24+0x6e>
    2aee:	88 23       	and	r24, r24
    2af0:	09 f4       	brne	.+2      	; 0x2af4 <__vector_24+0x46>
    2af2:	f9 c0       	rjmp	.+498    	; 0x2ce6 <__vector_24+0x238>
    2af4:	88 30       	cpi	r24, 0x08	; 8
    2af6:	09 f4       	brne	.+2      	; 0x2afa <__vector_24+0x4c>
    2af8:	94 c0       	rjmp	.+296    	; 0x2c22 <__vector_24+0x174>
    2afa:	ff 91       	pop	r31
    2afc:	ef 91       	pop	r30
    2afe:	bf 91       	pop	r27
    2b00:	af 91       	pop	r26
    2b02:	9f 91       	pop	r25
    2b04:	8f 91       	pop	r24
    2b06:	7f 91       	pop	r23
    2b08:	6f 91       	pop	r22
    2b0a:	5f 91       	pop	r21
    2b0c:	4f 91       	pop	r20
    2b0e:	3f 91       	pop	r19
    2b10:	2f 91       	pop	r18
    2b12:	0f 90       	pop	r0
    2b14:	0f be       	out	0x3f, r0	; 63
    2b16:	0f 90       	pop	r0
    2b18:	1f 90       	pop	r1
    2b1a:	18 95       	reti
    2b1c:	88 31       	cpi	r24, 0x18	; 24
    2b1e:	09 f4       	brne	.+2      	; 0x2b22 <__vector_24+0x74>
    2b20:	88 c0       	rjmp	.+272    	; 0x2c32 <__vector_24+0x184>
    2b22:	80 32       	cpi	r24, 0x20	; 32
    2b24:	51 f7       	brne	.-44     	; 0x2afa <__vector_24+0x4c>
    2b26:	80 93 31 04 	sts	0x0431, r24	; 0x800431 <twi_error>
    2b2a:	14 c0       	rjmp	.+40     	; 0x2b54 <__vector_24+0xa6>
    2b2c:	80 34       	cpi	r24, 0x40	; 64
    2b2e:	09 f4       	brne	.+2      	; 0x2b32 <__vector_24+0x84>
    2b30:	9d c0       	rjmp	.+314    	; 0x2c6c <__vector_24+0x1be>
    2b32:	40 f4       	brcc	.+16     	; 0x2b44 <__vector_24+0x96>
    2b34:	80 33       	cpi	r24, 0x30	; 48
    2b36:	b9 f3       	breq	.-18     	; 0x2b26 <__vector_24+0x78>
    2b38:	88 33       	cpi	r24, 0x38	; 56
    2b3a:	f9 f6       	brne	.-66     	; 0x2afa <__vector_24+0x4c>
    2b3c:	80 93 31 04 	sts	0x0431, r24	; 0x800431 <twi_error>
    2b40:	85 ec       	ldi	r24, 0xC5	; 197
    2b42:	b0 c0       	rjmp	.+352    	; 0x2ca4 <__vector_24+0x1f6>
    2b44:	80 35       	cpi	r24, 0x50	; 80
    2b46:	09 f4       	brne	.+2      	; 0x2b4a <__vector_24+0x9c>
    2b48:	85 c0       	rjmp	.+266    	; 0x2c54 <__vector_24+0x1a6>
    2b4a:	88 35       	cpi	r24, 0x58	; 88
    2b4c:	09 f4       	brne	.+2      	; 0x2b50 <__vector_24+0xa2>
    2b4e:	96 c0       	rjmp	.+300    	; 0x2c7c <__vector_24+0x1ce>
    2b50:	88 34       	cpi	r24, 0x48	; 72
    2b52:	99 f6       	brne	.-90     	; 0x2afa <__vector_24+0x4c>
    2b54:	0e 94 7d 14 	call	0x28fa	; 0x28fa <twi_stop>
    2b58:	d0 cf       	rjmp	.-96     	; 0x2afa <__vector_24+0x4c>
    2b5a:	88 39       	cpi	r24, 0x98	; 152
    2b5c:	09 f4       	brne	.+2      	; 0x2b60 <__vector_24+0xb2>
    2b5e:	8c c0       	rjmp	.+280    	; 0x2c78 <__vector_24+0x1ca>
    2b60:	38 f5       	brcc	.+78     	; 0x2bb0 <__vector_24+0x102>
    2b62:	88 37       	cpi	r24, 0x78	; 120
    2b64:	29 f0       	breq	.+10     	; 0x2b70 <__vector_24+0xc2>
    2b66:	50 f4       	brcc	.+20     	; 0x2b7c <__vector_24+0xce>
    2b68:	88 36       	cpi	r24, 0x68	; 104
    2b6a:	11 f0       	breq	.+4      	; 0x2b70 <__vector_24+0xc2>
    2b6c:	80 37       	cpi	r24, 0x70	; 112
    2b6e:	29 f6       	brne	.-118    	; 0x2afa <__vector_24+0x4c>
    2b70:	83 e0       	ldi	r24, 0x03	; 3
    2b72:	80 93 53 04 	sts	0x0453, r24	; 0x800453 <twi_state>
    2b76:	10 92 ab 02 	sts	0x02AB, r1	; 0x8002ab <twi_rxBufferIndex>
    2b7a:	57 c0       	rjmp	.+174    	; 0x2c2a <__vector_24+0x17c>
    2b7c:	88 38       	cpi	r24, 0x88	; 136
    2b7e:	09 f4       	brne	.+2      	; 0x2b82 <__vector_24+0xd4>
    2b80:	7b c0       	rjmp	.+246    	; 0x2c78 <__vector_24+0x1ca>
    2b82:	80 39       	cpi	r24, 0x90	; 144
    2b84:	19 f0       	breq	.+6      	; 0x2b8c <__vector_24+0xde>
    2b86:	80 38       	cpi	r24, 0x80	; 128
    2b88:	09 f0       	breq	.+2      	; 0x2b8c <__vector_24+0xde>
    2b8a:	b7 cf       	rjmp	.-146    	; 0x2afa <__vector_24+0x4c>
    2b8c:	80 91 ab 02 	lds	r24, 0x02AB	; 0x8002ab <twi_rxBufferIndex>
    2b90:	80 32       	cpi	r24, 0x20	; 32
    2b92:	08 f0       	brcs	.+2      	; 0x2b96 <__vector_24+0xe8>
    2b94:	71 c0       	rjmp	.+226    	; 0x2c78 <__vector_24+0x1ca>
    2b96:	e0 91 ab 02 	lds	r30, 0x02AB	; 0x8002ab <twi_rxBufferIndex>
    2b9a:	81 e0       	ldi	r24, 0x01	; 1
    2b9c:	8e 0f       	add	r24, r30
    2b9e:	80 93 ab 02 	sts	0x02AB, r24	; 0x8002ab <twi_rxBufferIndex>
    2ba2:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    2ba6:	f0 e0       	ldi	r31, 0x00	; 0
    2ba8:	e5 57       	subi	r30, 0x75	; 117
    2baa:	fd 4f       	sbci	r31, 0xFD	; 253
    2bac:	80 83       	st	Z, r24
    2bae:	3d c0       	rjmp	.+122    	; 0x2c2a <__vector_24+0x17c>
    2bb0:	80 3b       	cpi	r24, 0xB0	; 176
    2bb2:	39 f0       	breq	.+14     	; 0x2bc2 <__vector_24+0x114>
    2bb4:	e0 f4       	brcc	.+56     	; 0x2bee <__vector_24+0x140>
    2bb6:	80 3a       	cpi	r24, 0xA0	; 160
    2bb8:	09 f4       	brne	.+2      	; 0x2bbc <__vector_24+0x10e>
    2bba:	79 c0       	rjmp	.+242    	; 0x2cae <__vector_24+0x200>
    2bbc:	88 3a       	cpi	r24, 0xA8	; 168
    2bbe:	09 f0       	breq	.+2      	; 0x2bc2 <__vector_24+0x114>
    2bc0:	9c cf       	rjmp	.-200    	; 0x2afa <__vector_24+0x4c>
    2bc2:	84 e0       	ldi	r24, 0x04	; 4
    2bc4:	80 93 53 04 	sts	0x0453, r24	; 0x800453 <twi_state>
    2bc8:	10 92 8a 02 	sts	0x028A, r1	; 0x80028a <twi_txBufferIndex>
    2bcc:	10 92 89 02 	sts	0x0289, r1	; 0x800289 <twi_txBufferLength>
    2bd0:	e0 91 dc 02 	lds	r30, 0x02DC	; 0x8002dc <twi_onSlaveTransmit>
    2bd4:	f0 91 dd 02 	lds	r31, 0x02DD	; 0x8002dd <twi_onSlaveTransmit+0x1>
    2bd8:	09 95       	icall
    2bda:	80 91 89 02 	lds	r24, 0x0289	; 0x800289 <twi_txBufferLength>
    2bde:	81 11       	cpse	r24, r1
    2be0:	0f c0       	rjmp	.+30     	; 0x2c00 <__vector_24+0x152>
    2be2:	81 e0       	ldi	r24, 0x01	; 1
    2be4:	80 93 89 02 	sts	0x0289, r24	; 0x800289 <twi_txBufferLength>
    2be8:	10 92 69 02 	sts	0x0269, r1	; 0x800269 <twi_txBuffer>
    2bec:	09 c0       	rjmp	.+18     	; 0x2c00 <__vector_24+0x152>
    2bee:	80 3c       	cpi	r24, 0xC0	; 192
    2bf0:	09 f4       	brne	.+2      	; 0x2bf4 <__vector_24+0x146>
    2bf2:	a6 cf       	rjmp	.-180    	; 0x2b40 <__vector_24+0x92>
    2bf4:	88 3c       	cpi	r24, 0xC8	; 200
    2bf6:	09 f4       	brne	.+2      	; 0x2bfa <__vector_24+0x14c>
    2bf8:	a3 cf       	rjmp	.-186    	; 0x2b40 <__vector_24+0x92>
    2bfa:	88 3b       	cpi	r24, 0xB8	; 184
    2bfc:	09 f0       	breq	.+2      	; 0x2c00 <__vector_24+0x152>
    2bfe:	7d cf       	rjmp	.-262    	; 0x2afa <__vector_24+0x4c>
    2c00:	e0 91 8a 02 	lds	r30, 0x028A	; 0x80028a <twi_txBufferIndex>
    2c04:	81 e0       	ldi	r24, 0x01	; 1
    2c06:	8e 0f       	add	r24, r30
    2c08:	80 93 8a 02 	sts	0x028A, r24	; 0x80028a <twi_txBufferIndex>
    2c0c:	f0 e0       	ldi	r31, 0x00	; 0
    2c0e:	e7 59       	subi	r30, 0x97	; 151
    2c10:	fd 4f       	sbci	r31, 0xFD	; 253
    2c12:	80 81       	ld	r24, Z
    2c14:	80 93 bb 00 	sts	0x00BB, r24	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    2c18:	90 91 8a 02 	lds	r25, 0x028A	; 0x80028a <twi_txBufferIndex>
    2c1c:	80 91 89 02 	lds	r24, 0x0289	; 0x800289 <twi_txBufferLength>
    2c20:	29 c0       	rjmp	.+82     	; 0x2c74 <__vector_24+0x1c6>
    2c22:	80 91 2e 04 	lds	r24, 0x042E	; 0x80042e <twi_slarw>
    2c26:	80 93 bb 00 	sts	0x00BB, r24	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    2c2a:	85 ec       	ldi	r24, 0xC5	; 197
    2c2c:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    2c30:	64 cf       	rjmp	.-312    	; 0x2afa <__vector_24+0x4c>
    2c32:	90 91 30 04 	lds	r25, 0x0430	; 0x800430 <twi_masterBufferIndex>
    2c36:	80 91 2f 04 	lds	r24, 0x042F	; 0x80042f <twi_masterBufferLength>
    2c3a:	98 17       	cp	r25, r24
    2c3c:	58 f5       	brcc	.+86     	; 0x2c94 <__vector_24+0x1e6>
    2c3e:	e0 91 30 04 	lds	r30, 0x0430	; 0x800430 <twi_masterBufferIndex>
    2c42:	81 e0       	ldi	r24, 0x01	; 1
    2c44:	8e 0f       	add	r24, r30
    2c46:	80 93 30 04 	sts	0x0430, r24	; 0x800430 <twi_masterBufferIndex>
    2c4a:	f0 e0       	ldi	r31, 0x00	; 0
    2c4c:	e3 5f       	subi	r30, 0xF3	; 243
    2c4e:	fb 4f       	sbci	r31, 0xFB	; 251
    2c50:	80 81       	ld	r24, Z
    2c52:	e9 cf       	rjmp	.-46     	; 0x2c26 <__vector_24+0x178>
    2c54:	e0 91 30 04 	lds	r30, 0x0430	; 0x800430 <twi_masterBufferIndex>
    2c58:	81 e0       	ldi	r24, 0x01	; 1
    2c5a:	8e 0f       	add	r24, r30
    2c5c:	80 93 30 04 	sts	0x0430, r24	; 0x800430 <twi_masterBufferIndex>
    2c60:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    2c64:	f0 e0       	ldi	r31, 0x00	; 0
    2c66:	e3 5f       	subi	r30, 0xF3	; 243
    2c68:	fb 4f       	sbci	r31, 0xFB	; 251
    2c6a:	80 83       	st	Z, r24
    2c6c:	90 91 30 04 	lds	r25, 0x0430	; 0x800430 <twi_masterBufferIndex>
    2c70:	80 91 2f 04 	lds	r24, 0x042F	; 0x80042f <twi_masterBufferLength>
    2c74:	98 17       	cp	r25, r24
    2c76:	c8 f2       	brcs	.-78     	; 0x2c2a <__vector_24+0x17c>
    2c78:	85 e8       	ldi	r24, 0x85	; 133
    2c7a:	d8 cf       	rjmp	.-80     	; 0x2c2c <__vector_24+0x17e>
    2c7c:	e0 91 30 04 	lds	r30, 0x0430	; 0x800430 <twi_masterBufferIndex>
    2c80:	81 e0       	ldi	r24, 0x01	; 1
    2c82:	8e 0f       	add	r24, r30
    2c84:	80 93 30 04 	sts	0x0430, r24	; 0x800430 <twi_masterBufferIndex>
    2c88:	80 91 bb 00 	lds	r24, 0x00BB	; 0x8000bb <__TEXT_REGION_LENGTH__+0x7e00bb>
    2c8c:	f0 e0       	ldi	r31, 0x00	; 0
    2c8e:	e3 5f       	subi	r30, 0xF3	; 243
    2c90:	fb 4f       	sbci	r31, 0xFB	; 251
    2c92:	80 83       	st	Z, r24
    2c94:	80 91 32 04 	lds	r24, 0x0432	; 0x800432 <twi_sendStop>
    2c98:	81 11       	cpse	r24, r1
    2c9a:	5c cf       	rjmp	.-328    	; 0x2b54 <__vector_24+0xa6>
    2c9c:	81 e0       	ldi	r24, 0x01	; 1
    2c9e:	80 93 2d 04 	sts	0x042D, r24	; 0x80042d <twi_inRepStart>
    2ca2:	84 ea       	ldi	r24, 0xA4	; 164
    2ca4:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    2ca8:	10 92 53 04 	sts	0x0453, r1	; 0x800453 <twi_state>
    2cac:	26 cf       	rjmp	.-436    	; 0x2afa <__vector_24+0x4c>
    2cae:	85 ec       	ldi	r24, 0xC5	; 197
    2cb0:	80 93 bc 00 	sts	0x00BC, r24	; 0x8000bc <__TEXT_REGION_LENGTH__+0x7e00bc>
    2cb4:	10 92 53 04 	sts	0x0453, r1	; 0x800453 <twi_state>
    2cb8:	80 91 ab 02 	lds	r24, 0x02AB	; 0x8002ab <twi_rxBufferIndex>
    2cbc:	80 32       	cpi	r24, 0x20	; 32
    2cbe:	30 f4       	brcc	.+12     	; 0x2ccc <__vector_24+0x21e>
    2cc0:	e0 91 ab 02 	lds	r30, 0x02AB	; 0x8002ab <twi_rxBufferIndex>
    2cc4:	f0 e0       	ldi	r31, 0x00	; 0
    2cc6:	e5 57       	subi	r30, 0x75	; 117
    2cc8:	fd 4f       	sbci	r31, 0xFD	; 253
    2cca:	10 82       	st	Z, r1
    2ccc:	60 91 ab 02 	lds	r22, 0x02AB	; 0x8002ab <twi_rxBufferIndex>
    2cd0:	70 e0       	ldi	r23, 0x00	; 0
    2cd2:	e0 91 da 02 	lds	r30, 0x02DA	; 0x8002da <twi_onSlaveReceive>
    2cd6:	f0 91 db 02 	lds	r31, 0x02DB	; 0x8002db <twi_onSlaveReceive+0x1>
    2cda:	8b e8       	ldi	r24, 0x8B	; 139
    2cdc:	92 e0       	ldi	r25, 0x02	; 2
    2cde:	09 95       	icall
    2ce0:	10 92 ab 02 	sts	0x02AB, r1	; 0x8002ab <twi_rxBufferIndex>
    2ce4:	0a cf       	rjmp	.-492    	; 0x2afa <__vector_24+0x4c>
    2ce6:	10 92 31 04 	sts	0x0431, r1	; 0x800431 <twi_error>
    2cea:	34 cf       	rjmp	.-408    	; 0x2b54 <__vector_24+0xa6>

00002cec <__vector_7>:
    2cec:	1f 92       	push	r1
    2cee:	0f 92       	push	r0
    2cf0:	0f b6       	in	r0, 0x3f	; 63
    2cf2:	0f 92       	push	r0
    2cf4:	11 24       	eor	r1, r1
    2cf6:	4f 92       	push	r4
    2cf8:	5f 92       	push	r5
    2cfa:	6f 92       	push	r6
    2cfc:	7f 92       	push	r7
    2cfe:	8f 92       	push	r8
    2d00:	9f 92       	push	r9
    2d02:	af 92       	push	r10
    2d04:	bf 92       	push	r11
    2d06:	cf 92       	push	r12
    2d08:	df 92       	push	r13
    2d0a:	ef 92       	push	r14
    2d0c:	ff 92       	push	r15
    2d0e:	0f 93       	push	r16
    2d10:	1f 93       	push	r17
    2d12:	2f 93       	push	r18
    2d14:	3f 93       	push	r19
    2d16:	4f 93       	push	r20
    2d18:	5f 93       	push	r21
    2d1a:	6f 93       	push	r22
    2d1c:	7f 93       	push	r23
    2d1e:	8f 93       	push	r24
    2d20:	9f 93       	push	r25
    2d22:	af 93       	push	r26
    2d24:	bf 93       	push	r27
    2d26:	ef 93       	push	r30
    2d28:	ff 93       	push	r31
    2d2a:	cf 93       	push	r28
    2d2c:	df 93       	push	r29
    2d2e:	cd b7       	in	r28, 0x3d	; 61
    2d30:	de b7       	in	r29, 0x3e	; 62
    2d32:	68 97       	sbiw	r28, 0x18	; 24
    2d34:	de bf       	out	0x3e, r29	; 62
    2d36:	cd bf       	out	0x3d, r28	; 61
    2d38:	80 91 5d 02 	lds	r24, 0x025D	; 0x80025d <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE>
    2d3c:	90 91 5e 02 	lds	r25, 0x025E	; 0x80025e <_ZN8Internal23Generic_1_kHz_GeneratorL12adjust_pp16mE+0x1>
    2d40:	09 2e       	mov	r0, r25
    2d42:	00 0c       	add	r0, r0
    2d44:	aa 0b       	sbc	r26, r26
    2d46:	bb 0b       	sbc	r27, r27
    2d48:	40 91 53 02 	lds	r20, 0x0253	; 0x800253 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE>
    2d4c:	50 91 54 02 	lds	r21, 0x0254	; 0x800254 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x1>
    2d50:	60 91 55 02 	lds	r22, 0x0255	; 0x800255 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x2>
    2d54:	70 91 56 02 	lds	r23, 0x0256	; 0x800256 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x3>
    2d58:	84 0f       	add	r24, r20
    2d5a:	95 1f       	adc	r25, r21
    2d5c:	a6 1f       	adc	r26, r22
    2d5e:	b7 1f       	adc	r27, r23
    2d60:	80 93 53 02 	sts	0x0253, r24	; 0x800253 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE>
    2d64:	90 93 54 02 	sts	0x0254, r25	; 0x800254 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x1>
    2d68:	a0 93 55 02 	sts	0x0255, r26	; 0x800255 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x2>
    2d6c:	b0 93 56 02 	sts	0x0256, r27	; 0x800256 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x3>
    2d70:	81 15       	cp	r24, r1
    2d72:	2a ef       	ldi	r18, 0xFA	; 250
    2d74:	92 07       	cpc	r25, r18
    2d76:	a1 05       	cpc	r26, r1
    2d78:	b1 05       	cpc	r27, r1
    2d7a:	0c f4       	brge	.+2      	; 0x2d7e <__vector_7+0x92>
    2d7c:	4f c0       	rjmp	.+158    	; 0x2e1c <__vector_7+0x130>
    2d7e:	9a 5f       	subi	r25, 0xFA	; 250
    2d80:	a1 09       	sbc	r26, r1
    2d82:	b1 09       	sbc	r27, r1
    2d84:	80 93 53 02 	sts	0x0253, r24	; 0x800253 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE>
    2d88:	90 93 54 02 	sts	0x0254, r25	; 0x800254 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x1>
    2d8c:	a0 93 55 02 	sts	0x0255, r26	; 0x800255 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x2>
    2d90:	b0 93 56 02 	sts	0x0256, r27	; 0x800256 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x3>
    2d94:	88 ef       	ldi	r24, 0xF8	; 248
    2d96:	80 93 b3 00 	sts	0x00B3, r24	; 0x8000b3 <__TEXT_REGION_LENGTH__+0x7e00b3>
    2d9a:	e0 91 01 01 	lds	r30, 0x0101	; 0x800101 <_ZN8Internal23Generic_1_kHz_GeneratorL18the_input_providerE>
    2d9e:	f0 91 02 01 	lds	r31, 0x0102	; 0x800102 <_ZN8Internal23Generic_1_kHz_GeneratorL18the_input_providerE+0x1>
    2da2:	09 95       	icall
    2da4:	20 91 db 05 	lds	r18, 0x05DB	; 0x8005db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe5>
    2da8:	28 0f       	add	r18, r24
    2daa:	20 93 db 05 	sts	0x05DB, r18	; 0x8005db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe5>
    2dae:	90 91 da 05 	lds	r25, 0x05DA	; 0x8005da <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe4>
    2db2:	94 30       	cpi	r25, 0x04	; 4
    2db4:	19 f4       	brne	.+6      	; 0x2dbc <__vector_7+0xd0>
    2db6:	82 0f       	add	r24, r18
    2db8:	80 93 db 05 	sts	0x05DB, r24	; 0x8005db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe5>
    2dbc:	9f 5f       	subi	r25, 0xFF	; 255
    2dbe:	90 93 da 05 	sts	0x05DA, r25	; 0x8005da <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe4>
    2dc2:	9a 30       	cpi	r25, 0x0A	; 10
    2dc4:	08 f4       	brcc	.+2      	; 0x2dc8 <__vector_7+0xdc>
    2dc6:	da c1       	rjmp	.+948    	; 0x317c <__vector_7+0x490>
    2dc8:	f0 90 db 05 	lds	r15, 0x05DB	; 0x8005db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe5>
    2dcc:	80 91 be 05 	lds	r24, 0x05BE	; 0x8005be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc8>
    2dd0:	83 36       	cpi	r24, 0x63	; 99
    2dd2:	c8 f5       	brcc	.+114    	; 0x2e46 <__vector_7+0x15a>
    2dd4:	8f 5f       	subi	r24, 0xFF	; 255
    2dd6:	80 93 be 05 	sts	0x05BE, r24	; 0x8005be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc8>
    2dda:	10 91 be 05 	lds	r17, 0x05BE	; 0x8005be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc8>
    2dde:	21 2f       	mov	r18, r17
    2de0:	30 e0       	ldi	r19, 0x00	; 0
    2de2:	a9 01       	movw	r20, r18
    2de4:	44 0f       	add	r20, r20
    2de6:	55 1f       	adc	r21, r21
    2de8:	fa 01       	movw	r30, r20
    2dea:	ea 50       	subi	r30, 0x0A	; 10
    2dec:	fb 4f       	sbci	r31, 0xFB	; 251
    2dee:	80 81       	ld	r24, Z
    2df0:	91 81       	ldd	r25, Z+1	; 0x01
    2df2:	60 91 c8 05 	lds	r22, 0x05C8	; 0x8005c8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd2>
    2df6:	70 91 c9 05 	lds	r23, 0x05C9	; 0x8005c9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd3>
    2dfa:	68 17       	cp	r22, r24
    2dfc:	79 07       	cpc	r23, r25
    2dfe:	30 f5       	brcc	.+76     	; 0x2e4c <__vector_7+0x160>
    2e00:	71 83       	std	Z+1, r23	; 0x01
    2e02:	60 83       	st	Z, r22
    2e04:	85 e0       	ldi	r24, 0x05	; 5
    2e06:	8f 15       	cp	r24, r15
    2e08:	58 f5       	brcc	.+86     	; 0x2e60 <__vector_7+0x174>
    2e0a:	f9 01       	movw	r30, r18
    2e0c:	e0 5b       	subi	r30, 0xB0	; 176
    2e0e:	ff 4f       	sbci	r31, 0xFF	; 255
    2e10:	e4 36       	cpi	r30, 0x64	; 100
    2e12:	f1 05       	cpc	r31, r1
    2e14:	70 f1       	brcs	.+92     	; 0x2e72 <__vector_7+0x186>
    2e16:	e4 56       	subi	r30, 0x64	; 100
    2e18:	f1 09       	sbc	r31, r1
    2e1a:	fa cf       	rjmp	.-12     	; 0x2e10 <__vector_7+0x124>
    2e1c:	81 30       	cpi	r24, 0x01	; 1
    2e1e:	36 e0       	ldi	r19, 0x06	; 6
    2e20:	93 07       	cpc	r25, r19
    2e22:	a1 05       	cpc	r26, r1
    2e24:	b1 05       	cpc	r27, r1
    2e26:	6c f4       	brge	.+26     	; 0x2e42 <__vector_7+0x156>
    2e28:	96 50       	subi	r25, 0x06	; 6
    2e2a:	af 4f       	sbci	r26, 0xFF	; 255
    2e2c:	bf 4f       	sbci	r27, 0xFF	; 255
    2e2e:	80 93 53 02 	sts	0x0253, r24	; 0x800253 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE>
    2e32:	90 93 54 02 	sts	0x0254, r25	; 0x800254 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x1>
    2e36:	a0 93 55 02 	sts	0x0255, r26	; 0x800255 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x2>
    2e3a:	b0 93 56 02 	sts	0x0256, r27	; 0x800256 <_ZN8Internal23Generic_1_kHz_GeneratorL25cumulated_phase_deviationE+0x3>
    2e3e:	8a ef       	ldi	r24, 0xFA	; 250
    2e40:	aa cf       	rjmp	.-172    	; 0x2d96 <__vector_7+0xaa>
    2e42:	89 ef       	ldi	r24, 0xF9	; 249
    2e44:	a8 cf       	rjmp	.-176    	; 0x2d96 <__vector_7+0xaa>
    2e46:	10 92 be 05 	sts	0x05BE, r1	; 0x8005be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc8>
    2e4a:	c7 cf       	rjmp	.-114    	; 0x2dda <__vector_7+0xee>
    2e4c:	a5 e0       	ldi	r26, 0x05	; 5
    2e4e:	af 15       	cp	r26, r15
    2e50:	38 f4       	brcc	.+14     	; 0x2e60 <__vector_7+0x174>
    2e52:	86 17       	cp	r24, r22
    2e54:	97 07       	cpc	r25, r23
    2e56:	c8 f6       	brcc	.-78     	; 0x2e0a <__vector_7+0x11e>
    2e58:	01 96       	adiw	r24, 0x01	; 1
    2e5a:	91 83       	std	Z+1, r25	; 0x01
    2e5c:	80 83       	st	Z, r24
    2e5e:	d5 cf       	rjmp	.-86     	; 0x2e0a <__vector_7+0x11e>
    2e60:	fa 01       	movw	r30, r20
    2e62:	ea 50       	subi	r30, 0x0A	; 10
    2e64:	fb 4f       	sbci	r31, 0xFB	; 251
    2e66:	80 81       	ld	r24, Z
    2e68:	91 81       	ldd	r25, Z+1	; 0x01
    2e6a:	00 97       	sbiw	r24, 0x00	; 0
    2e6c:	71 f2       	breq	.-100    	; 0x2e0a <__vector_7+0x11e>
    2e6e:	01 97       	sbiw	r24, 0x01	; 1
    2e70:	f4 cf       	rjmp	.-24     	; 0x2e5a <__vector_7+0x16e>
    2e72:	b9 01       	movw	r22, r18
    2e74:	66 5a       	subi	r22, 0xA6	; 166
    2e76:	7f 4f       	sbci	r23, 0xFF	; 255
    2e78:	64 36       	cpi	r22, 0x64	; 100
    2e7a:	71 05       	cpc	r23, r1
    2e7c:	18 f0       	brcs	.+6      	; 0x2e84 <__vector_7+0x198>
    2e7e:	64 56       	subi	r22, 0x64	; 100
    2e80:	71 09       	sbc	r23, r1
    2e82:	fa cf       	rjmp	.-12     	; 0x2e78 <__vector_7+0x18c>
    2e84:	80 90 ca 05 	lds	r8, 0x05CA	; 0x8005ca <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd4>
    2e88:	90 90 cb 05 	lds	r9, 0x05CB	; 0x8005cb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd5>
    2e8c:	a0 90 cc 05 	lds	r10, 0x05CC	; 0x8005cc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd6>
    2e90:	b0 90 cd 05 	lds	r11, 0x05CD	; 0x8005cd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd7>
    2e94:	80 91 ce 05 	lds	r24, 0x05CE	; 0x8005ce <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd8>
    2e98:	90 91 cf 05 	lds	r25, 0x05CF	; 0x8005cf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd9>
    2e9c:	a0 91 d0 05 	lds	r26, 0x05D0	; 0x8005d0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xda>
    2ea0:	b0 91 d1 05 	lds	r27, 0x05D1	; 0x8005d1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdb>
    2ea4:	88 15       	cp	r24, r8
    2ea6:	99 05       	cpc	r25, r9
    2ea8:	aa 05       	cpc	r26, r10
    2eaa:	bb 05       	cpc	r27, r11
    2eac:	54 f4       	brge	.+20     	; 0x2ec2 <__vector_7+0x1d6>
    2eae:	80 92 ce 05 	sts	0x05CE, r8	; 0x8005ce <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd8>
    2eb2:	90 92 cf 05 	sts	0x05CF, r9	; 0x8005cf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd9>
    2eb6:	a0 92 d0 05 	sts	0x05D0, r10	; 0x8005d0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xda>
    2eba:	b0 92 d1 05 	sts	0x05D1, r11	; 0x8005d1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdb>
    2ebe:	e0 93 d2 05 	sts	0x05D2, r30	; 0x8005d2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdc>
    2ec2:	a0 91 c7 05 	lds	r26, 0x05C7	; 0x8005c7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd1>
    2ec6:	b0 e0       	ldi	r27, 0x00	; 0
    2ec8:	98 96       	adiw	r26, 0x28	; 40
    2eca:	a4 36       	cpi	r26, 0x64	; 100
    2ecc:	b1 05       	cpc	r27, r1
    2ece:	18 f0       	brcs	.+6      	; 0x2ed6 <__vector_7+0x1ea>
    2ed0:	a4 56       	subi	r26, 0x64	; 100
    2ed2:	b1 09       	sbc	r27, r1
    2ed4:	fa cf       	rjmp	.-12     	; 0x2eca <__vector_7+0x1de>
    2ed6:	2a 17       	cp	r18, r26
    2ed8:	3b 07       	cpc	r19, r27
    2eda:	41 f4       	brne	.+16     	; 0x2eec <__vector_7+0x200>
    2edc:	80 92 d3 05 	sts	0x05D3, r8	; 0x8005d3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdd>
    2ee0:	90 92 d4 05 	sts	0x05D4, r9	; 0x8005d4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xde>
    2ee4:	a0 92 d5 05 	sts	0x05D5, r10	; 0x8005d5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdf>
    2ee8:	b0 92 d6 05 	sts	0x05D6, r11	; 0x8005d6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe0>
    2eec:	11 11       	cpse	r17, r1
    2eee:	2c c0       	rjmp	.+88     	; 0x2f48 <__vector_7+0x25c>
    2ef0:	80 91 ce 05 	lds	r24, 0x05CE	; 0x8005ce <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd8>
    2ef4:	90 91 cf 05 	lds	r25, 0x05CF	; 0x8005cf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd9>
    2ef8:	a0 91 d0 05 	lds	r26, 0x05D0	; 0x8005d0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xda>
    2efc:	b0 91 d1 05 	lds	r27, 0x05D1	; 0x8005d1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdb>
    2f00:	80 93 c3 05 	sts	0x05C3, r24	; 0x8005c3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcd>
    2f04:	90 93 c4 05 	sts	0x05C4, r25	; 0x8005c4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xce>
    2f08:	a0 93 c5 05 	sts	0x05C5, r26	; 0x8005c5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcf>
    2f0c:	b0 93 c6 05 	sts	0x05C6, r27	; 0x8005c6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd0>
    2f10:	80 91 d2 05 	lds	r24, 0x05D2	; 0x8005d2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdc>
    2f14:	80 93 c7 05 	sts	0x05C7, r24	; 0x8005c7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd1>
    2f18:	80 91 d3 05 	lds	r24, 0x05D3	; 0x8005d3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdd>
    2f1c:	90 91 d4 05 	lds	r25, 0x05D4	; 0x8005d4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xde>
    2f20:	a0 91 d5 05 	lds	r26, 0x05D5	; 0x8005d5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdf>
    2f24:	b0 91 d6 05 	lds	r27, 0x05D6	; 0x8005d6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe0>
    2f28:	80 93 bf 05 	sts	0x05BF, r24	; 0x8005bf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc9>
    2f2c:	90 93 c0 05 	sts	0x05C0, r25	; 0x8005c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xca>
    2f30:	a0 93 c1 05 	sts	0x05C1, r26	; 0x8005c1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcb>
    2f34:	b0 93 c2 05 	sts	0x05C2, r27	; 0x8005c2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcc>
    2f38:	10 92 ce 05 	sts	0x05CE, r1	; 0x8005ce <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd8>
    2f3c:	10 92 cf 05 	sts	0x05CF, r1	; 0x8005cf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd9>
    2f40:	10 92 d0 05 	sts	0x05D0, r1	; 0x8005d0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xda>
    2f44:	10 92 d1 05 	sts	0x05D1, r1	; 0x8005d1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdb>
    2f48:	ee 0f       	add	r30, r30
    2f4a:	ff 1f       	adc	r31, r31
    2f4c:	ea 50       	subi	r30, 0x0A	; 10
    2f4e:	fb 4f       	sbci	r31, 0xFB	; 251
    2f50:	80 81       	ld	r24, Z
    2f52:	91 81       	ldd	r25, Z+1	; 0x01
    2f54:	b0 e0       	ldi	r27, 0x00	; 0
    2f56:	a0 e0       	ldi	r26, 0x00	; 0
    2f58:	88 0f       	add	r24, r24
    2f5a:	99 1f       	adc	r25, r25
    2f5c:	aa 1f       	adc	r26, r26
    2f5e:	bb 1f       	adc	r27, r27
    2f60:	24 01       	movw	r4, r8
    2f62:	35 01       	movw	r6, r10
    2f64:	48 1a       	sub	r4, r24
    2f66:	59 0a       	sbc	r5, r25
    2f68:	6a 0a       	sbc	r6, r26
    2f6a:	7b 0a       	sbc	r7, r27
    2f6c:	d3 01       	movw	r26, r6
    2f6e:	c2 01       	movw	r24, r4
    2f70:	66 0f       	add	r22, r22
    2f72:	77 1f       	adc	r23, r23
    2f74:	fb 01       	movw	r30, r22
    2f76:	ea 50       	subi	r30, 0x0A	; 10
    2f78:	fb 4f       	sbci	r31, 0xFB	; 251
    2f7a:	60 81       	ld	r22, Z
    2f7c:	71 81       	ldd	r23, Z+1	; 0x01
    2f7e:	86 0f       	add	r24, r22
    2f80:	97 1f       	adc	r25, r23
    2f82:	a1 1d       	adc	r26, r1
    2f84:	b1 1d       	adc	r27, r1
    2f86:	4a 50       	subi	r20, 0x0A	; 10
    2f88:	5b 4f       	sbci	r21, 0xFB	; 251
    2f8a:	fa 01       	movw	r30, r20
    2f8c:	40 81       	ld	r20, Z
    2f8e:	51 81       	ldd	r21, Z+1	; 0x01
    2f90:	84 0f       	add	r24, r20
    2f92:	95 1f       	adc	r25, r21
    2f94:	a1 1d       	adc	r26, r1
    2f96:	b1 1d       	adc	r27, r1
    2f98:	80 93 ca 05 	sts	0x05CA, r24	; 0x8005ca <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd4>
    2f9c:	90 93 cb 05 	sts	0x05CB, r25	; 0x8005cb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd5>
    2fa0:	a0 93 cc 05 	sts	0x05CC, r26	; 0x8005cc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd6>
    2fa4:	b0 93 cd 05 	sts	0x05CD, r27	; 0x8005cd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd7>
    2fa8:	80 91 d9 05 	lds	r24, 0x05D9	; 0x8005d9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe3>
    2fac:	81 11       	cpse	r24, r1
    2fae:	c6 c0       	rjmp	.+396    	; 0x313c <__vector_7+0x450>
    2fb0:	80 91 c7 05 	lds	r24, 0x05C7	; 0x8005c7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd1>
    2fb4:	90 e0       	ldi	r25, 0x00	; 0
    2fb6:	a9 01       	movw	r20, r18
    2fb8:	4b 59       	subi	r20, 0x9B	; 155
    2fba:	5f 4f       	sbci	r21, 0xFF	; 255
    2fbc:	48 1b       	sub	r20, r24
    2fbe:	59 0b       	sbc	r21, r25
    2fc0:	44 36       	cpi	r20, 0x64	; 100
    2fc2:	51 05       	cpc	r21, r1
    2fc4:	18 f0       	brcs	.+6      	; 0x2fcc <__vector_7+0x2e0>
    2fc6:	44 56       	subi	r20, 0x64	; 100
    2fc8:	51 09       	sbc	r21, r1
    2fca:	fa cf       	rjmp	.-12     	; 0x2fc0 <__vector_7+0x2d4>
    2fcc:	4b 30       	cpi	r20, 0x0B	; 11
    2fce:	51 05       	cpc	r21, r1
    2fd0:	68 f0       	brcs	.+26     	; 0x2fec <__vector_7+0x300>
    2fd2:	8c 59       	subi	r24, 0x9C	; 156
    2fd4:	9f 4f       	sbci	r25, 0xFF	; 255
    2fd6:	82 1b       	sub	r24, r18
    2fd8:	93 0b       	sbc	r25, r19
    2fda:	84 36       	cpi	r24, 0x64	; 100
    2fdc:	91 05       	cpc	r25, r1
    2fde:	18 f0       	brcs	.+6      	; 0x2fe6 <__vector_7+0x2fa>
    2fe0:	84 56       	subi	r24, 0x64	; 100
    2fe2:	91 09       	sbc	r25, r1
    2fe4:	fa cf       	rjmp	.-12     	; 0x2fda <__vector_7+0x2ee>
    2fe6:	02 97       	sbiw	r24, 0x02	; 2
    2fe8:	08 f0       	brcs	.+2      	; 0x2fec <__vector_7+0x300>
    2fea:	a8 c0       	rjmp	.+336    	; 0x313c <__vector_7+0x450>
    2fec:	ce 01       	movw	r24, r28
    2fee:	41 96       	adiw	r24, 0x11	; 17
    2ff0:	0e 94 ef 0c 	call	0x19de	; 0x19de <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17set_DCF77_EncoderERNS_13DCF77_EncoderE>
    2ff4:	88 e0       	ldi	r24, 0x08	; 8
    2ff6:	fe 01       	movw	r30, r28
    2ff8:	71 96       	adiw	r30, 0x11	; 17
    2ffa:	de 01       	movw	r26, r28
    2ffc:	19 96       	adiw	r26, 0x09	; 9
    2ffe:	01 90       	ld	r0, Z+
    3000:	0d 92       	st	X+, r0
    3002:	8a 95       	dec	r24
    3004:	e1 f7       	brne	.-8      	; 0x2ffe <__vector_7+0x312>
    3006:	10 91 52 02 	lds	r17, 0x0252	; 0x800252 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11leap_secondE>
    300a:	91 e0       	ldi	r25, 0x01	; 1
    300c:	11 11       	cpse	r17, r1
    300e:	01 c0       	rjmp	.+2      	; 0x3012 <__vector_7+0x326>
    3010:	90 e0       	ldi	r25, 0x00	; 0
    3012:	8f 89       	ldd	r24, Y+23	; 0x17
    3014:	89 0f       	add	r24, r25
    3016:	8f 8b       	std	Y+23, r24	; 0x17
    3018:	ce 01       	movw	r24, r28
    301a:	41 96       	adiw	r24, 0x11	; 17
    301c:	0e 94 6c 0f 	call	0x1ed8	; 0x1ed8 <_ZN8Internal13DCF77_Encoder14advance_secondEv>
    3020:	ce 01       	movw	r24, r28
    3022:	41 96       	adiw	r24, 0x11	; 17
    3024:	0e 94 5d 0b 	call	0x16ba	; 0x16ba <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv>
    3028:	8f 89       	ldd	r24, Y+23	; 0x17
    302a:	88 23       	and	r24, r24
    302c:	09 f4       	brne	.+2      	; 0x3030 <__vector_7+0x344>
    302e:	f8 c1       	rjmp	.+1008   	; 0x3420 <__vector_7+0x734>
    3030:	80 93 50 02 	sts	0x0250, r24	; 0x800250 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12decoded_timeE+0x6>
    3034:	0e 94 b6 02 	call	0x56c	; 0x56c <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55>
    3038:	18 2f       	mov	r17, r24
    303a:	80 e2       	ldi	r24, 0x20	; 32
    303c:	93 e0       	ldi	r25, 0x03	; 3
    303e:	0e 94 68 09 	call	0x12d0	; 0x12d0 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv>
    3042:	81 17       	cp	r24, r17
    3044:	08 f4       	brcc	.+2      	; 0x3048 <__vector_7+0x35c>
    3046:	18 2f       	mov	r17, r24
    3048:	80 ee       	ldi	r24, 0xE0	; 224
    304a:	92 e0       	ldi	r25, 0x02	; 2
    304c:	0e 94 68 09 	call	0x12d0	; 0x12d0 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv>
    3050:	08 2f       	mov	r16, r24
    3052:	18 17       	cp	r17, r24
    3054:	08 f4       	brcc	.+2      	; 0x3058 <__vector_7+0x36c>
    3056:	01 2f       	mov	r16, r17
    3058:	0e 94 ec 03 	call	0x7d8	; 0x7d8 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50>
    305c:	e8 2e       	mov	r14, r24
    305e:	08 17       	cp	r16, r24
    3060:	08 f4       	brcc	.+2      	; 0x3064 <__vector_7+0x378>
    3062:	e0 2e       	mov	r14, r16
    3064:	0e 94 76 03 	call	0x6ec	; 0x6ec <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51>
    3068:	18 2f       	mov	r17, r24
    306a:	0e 94 00 03 	call	0x600	; 0x600 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52>
    306e:	81 17       	cp	r24, r17
    3070:	08 f4       	brcc	.+2      	; 0x3074 <__vector_7+0x388>
    3072:	18 2f       	mov	r17, r24
    3074:	82 ec       	ldi	r24, 0xC2	; 194
    3076:	93 e0       	ldi	r25, 0x03	; 3
    3078:	0e 94 69 0a 	call	0x14d2	; 0x14d2 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv>
    307c:	08 2f       	mov	r16, r24
    307e:	80 ed       	ldi	r24, 0xD0	; 208
    3080:	93 e0       	ldi	r25, 0x03	; 3
    3082:	0e 94 69 0a 	call	0x14d2	; 0x14d2 <_ZN8Internal7Binning6bins_tIhhLj10EE18get_quality_factorEv>
    3086:	10 17       	cp	r17, r16
    3088:	08 f4       	brcc	.+2      	; 0x308c <__vector_7+0x3a0>
    308a:	01 2f       	mov	r16, r17
    308c:	80 17       	cp	r24, r16
    308e:	08 f4       	brcc	.+2      	; 0x3092 <__vector_7+0x3a6>
    3090:	08 2f       	mov	r16, r24
    3092:	8f b7       	in	r24, 0x3f	; 63
    3094:	f8 94       	cli
    3096:	90 91 8d 03 	lds	r25, 0x038D	; 0x80038d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x9>
    309a:	20 91 8c 03 	lds	r18, 0x038C	; 0x80038c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x8>
    309e:	29 17       	cp	r18, r25
    30a0:	08 f4       	brcc	.+2      	; 0x30a4 <__vector_7+0x3b8>
    30a2:	02 c2       	rjmp	.+1028   	; 0x34a8 <__vector_7+0x7bc>
    30a4:	8f bf       	out	0x3f, r24	; 63
    30a6:	e0 16       	cp	r14, r16
    30a8:	08 f4       	brcc	.+2      	; 0x30ac <__vector_7+0x3c0>
    30aa:	0e 2d       	mov	r16, r14
    30ac:	80 91 ac 02 	lds	r24, 0x02AC	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    30b0:	90 91 ad 02 	lds	r25, 0x02AD	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    30b4:	02 30       	cpi	r16, 0x02	; 2
    30b6:	08 f4       	brcc	.+2      	; 0x30ba <__vector_7+0x3ce>
    30b8:	8a c2       	rjmp	.+1300   	; 0x35ce <__vector_7+0x8e2>
    30ba:	05 97       	sbiw	r24, 0x05	; 5
    30bc:	59 f0       	breq	.+22     	; 0x30d4 <__vector_7+0x3e8>
    30be:	80 91 60 02 	lds	r24, 0x0260	; 0x800260 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    30c2:	81 60       	ori	r24, 0x01	; 1
    30c4:	80 93 60 02 	sts	0x0260, r24	; 0x800260 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    30c8:	85 e0       	ldi	r24, 0x05	; 5
    30ca:	90 e0       	ldi	r25, 0x00	; 0
    30cc:	90 93 ad 02 	sts	0x02AD, r25	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    30d0:	80 93 ac 02 	sts	0x02AC, r24	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    30d4:	54 e0       	ldi	r21, 0x04	; 4
    30d6:	c5 2e       	mov	r12, r21
    30d8:	d1 2c       	mov	r13, r1
    30da:	aa 24       	eor	r10, r10
    30dc:	a3 94       	inc	r10
    30de:	b1 2c       	mov	r11, r1
    30e0:	80 91 ac 02 	lds	r24, 0x02AC	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    30e4:	90 91 ad 02 	lds	r25, 0x02AD	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    30e8:	82 30       	cpi	r24, 0x02	; 2
    30ea:	91 05       	cpc	r25, r1
    30ec:	21 f1       	breq	.+72     	; 0x3136 <__vector_7+0x44a>
    30ee:	08 f0       	brcs	.+2      	; 0x30f2 <__vector_7+0x406>
    30f0:	00 c3       	rjmp	.+1536   	; 0x36f2 <__vector_7+0xa06>
    30f2:	00 97       	sbiw	r24, 0x00	; 0
    30f4:	09 f4       	brne	.+2      	; 0x30f8 <__vector_7+0x40c>
    30f6:	1e c3       	rjmp	.+1596   	; 0x3734 <__vector_7+0xa48>
    30f8:	81 30       	cpi	r24, 0x01	; 1
    30fa:	91 05       	cpc	r25, r1
    30fc:	a9 f7       	brne	.-22     	; 0x30e8 <__vector_7+0x3fc>
    30fe:	01 11       	cpse	r16, r1
    3100:	01 c3       	rjmp	.+1538   	; 0x3704 <__vector_7+0xa18>
    3102:	10 92 ad 02 	sts	0x02AD, r1	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    3106:	10 92 ac 02 	sts	0x02AC, r1	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    310a:	90 91 b6 02 	lds	r25, 0x02B6	; 0x8002b6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    310e:	81 e0       	ldi	r24, 0x01	; 1
    3110:	98 27       	eor	r25, r24
    3112:	90 93 b6 02 	sts	0x02B6, r25	; 0x8002b6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    3116:	10 92 b4 02 	sts	0x02B4, r1	; 0x8002b4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x8>
    311a:	10 92 b3 02 	sts	0x02B3, r1	; 0x8002b3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x7>
    311e:	10 92 b2 02 	sts	0x02B2, r1	; 0x8002b2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x6>
    3122:	80 93 b0 02 	sts	0x02B0, r24	; 0x8002b0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x4>
    3126:	80 93 af 02 	sts	0x02AF, r24	; 0x8002af <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x3>
    312a:	10 92 ae 02 	sts	0x02AE, r1	; 0x8002ae <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x2>
    312e:	80 93 b1 02 	sts	0x02B1, r24	; 0x8002b1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x5>
    3132:	10 92 b5 02 	sts	0x02B5, r1	; 0x8002b5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
    3136:	86 e1       	ldi	r24, 0x16	; 22
    3138:	80 93 d9 05 	sts	0x05D9, r24	; 0x8005d9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe3>
    313c:	90 91 d9 05 	lds	r25, 0x05D9	; 0x8005d9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe3>
    3140:	99 23       	and	r25, r25
    3142:	c1 f0       	breq	.+48     	; 0x3174 <__vector_7+0x488>
    3144:	91 50       	subi	r25, 0x01	; 1
    3146:	90 93 d9 05 	sts	0x05D9, r25	; 0x8005d9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe3>
    314a:	81 e0       	ldi	r24, 0x01	; 1
    314c:	a5 e0       	ldi	r26, 0x05	; 5
    314e:	af 15       	cp	r26, r15
    3150:	08 f0       	brcs	.+2      	; 0x3154 <__vector_7+0x468>
    3152:	80 e0       	ldi	r24, 0x00	; 0
    3154:	20 91 d7 05 	lds	r18, 0x05D7	; 0x8005d7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe1>
    3158:	82 0f       	add	r24, r18
    315a:	80 93 d7 05 	sts	0x05D7, r24	; 0x8005d7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe1>
    315e:	9b 30       	cpi	r25, 0x0B	; 11
    3160:	09 f0       	breq	.+2      	; 0x3164 <__vector_7+0x478>
    3162:	35 c3       	rjmp	.+1642   	; 0x37ce <__vector_7+0xae2>
    3164:	86 30       	cpi	r24, 0x06	; 6
    3166:	08 f4       	brcc	.+2      	; 0x316a <__vector_7+0x47e>
    3168:	30 c3       	rjmp	.+1632   	; 0x37ca <__vector_7+0xade>
    316a:	82 e0       	ldi	r24, 0x02	; 2
    316c:	80 93 d8 05 	sts	0x05D8, r24	; 0x8005d8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe2>
    3170:	10 92 d7 05 	sts	0x05D7, r1	; 0x8005d7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe1>
    3174:	10 92 da 05 	sts	0x05DA, r1	; 0x8005da <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe4>
    3178:	10 92 db 05 	sts	0x05DB, r1	; 0x8005db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe5>
    317c:	80 91 b7 02 	lds	r24, 0x02B7	; 0x8002b7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    3180:	90 91 b8 02 	lds	r25, 0x02B8	; 0x8002b8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    3184:	01 96       	adiw	r24, 0x01	; 1
    3186:	90 93 b8 02 	sts	0x02B8, r25	; 0x8002b8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    318a:	80 93 b7 02 	sts	0x02B7, r24	; 0x8002b7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    318e:	20 91 ac 02 	lds	r18, 0x02AC	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    3192:	30 91 ad 02 	lds	r19, 0x02AD	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    3196:	24 50       	subi	r18, 0x04	; 4
    3198:	31 09       	sbc	r19, r1
    319a:	22 30       	cpi	r18, 0x02	; 2
    319c:	31 05       	cpc	r19, r1
    319e:	b8 f4       	brcc	.+46     	; 0x31ce <__vector_7+0x4e2>
    31a0:	8e 37       	cpi	r24, 0x7E	; 126
    31a2:	94 40       	sbci	r25, 0x04	; 4
    31a4:	a0 f0       	brcs	.+40     	; 0x31ce <__vector_7+0x4e2>
    31a6:	81 e0       	ldi	r24, 0x01	; 1
    31a8:	90 e0       	ldi	r25, 0x00	; 0
    31aa:	a0 e0       	ldi	r26, 0x00	; 0
    31ac:	b0 e0       	ldi	r27, 0x00	; 0
    31ae:	80 93 b9 02 	sts	0x02B9, r24	; 0x8002b9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xd>
    31b2:	90 93 ba 02 	sts	0x02BA, r25	; 0x8002ba <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xe>
    31b6:	a0 93 bb 02 	sts	0x02BB, r26	; 0x8002bb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xf>
    31ba:	b0 93 bc 02 	sts	0x02BC, r27	; 0x8002bc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x10>
    31be:	83 e0       	ldi	r24, 0x03	; 3
    31c0:	90 e0       	ldi	r25, 0x00	; 0
    31c2:	90 93 ad 02 	sts	0x02AD, r25	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    31c6:	80 93 ac 02 	sts	0x02AC, r24	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    31ca:	0e 94 0b 0a 	call	0x1416	; 0x1416 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv>
    31ce:	80 91 ac 02 	lds	r24, 0x02AC	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    31d2:	90 91 ad 02 	lds	r25, 0x02AD	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    31d6:	02 97       	sbiw	r24, 0x02	; 2
    31d8:	02 97       	sbiw	r24, 0x02	; 2
    31da:	08 f0       	brcs	.+2      	; 0x31de <__vector_7+0x4f2>
    31dc:	48 c0       	rjmp	.+144    	; 0x326e <__vector_7+0x582>
    31de:	80 91 b7 02 	lds	r24, 0x02B7	; 0x8002b7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    31e2:	90 91 b8 02 	lds	r25, 0x02B8	; 0x8002b8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    31e6:	88 3e       	cpi	r24, 0xE8	; 232
    31e8:	33 e0       	ldi	r19, 0x03	; 3
    31ea:	93 07       	cpc	r25, r19
    31ec:	08 f4       	brcc	.+2      	; 0x31f0 <__vector_7+0x504>
    31ee:	3f c0       	rjmp	.+126    	; 0x326e <__vector_7+0x582>
    31f0:	88 5e       	subi	r24, 0xE8	; 232
    31f2:	93 40       	sbci	r25, 0x03	; 3
    31f4:	90 93 b8 02 	sts	0x02B8, r25	; 0x8002b8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    31f8:	80 93 b7 02 	sts	0x02B7, r24	; 0x8002b7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    31fc:	80 91 b5 02 	lds	r24, 0x02B5	; 0x8002b5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
    3200:	87 7f       	andi	r24, 0xF7	; 247
    3202:	80 93 b5 02 	sts	0x02B5, r24	; 0x8002b5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
    3206:	8e ea       	ldi	r24, 0xAE	; 174
    3208:	92 e0       	ldi	r25, 0x02	; 2
    320a:	0e 94 6c 0f 	call	0x1ed8	; 0x1ed8 <_ZN8Internal13DCF77_Encoder14advance_secondEv>
    320e:	8e ea       	ldi	r24, 0xAE	; 174
    3210:	92 e0       	ldi	r25, 0x02	; 2
    3212:	0e 94 ac 0d 	call	0x1b58	; 0x1b58 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE>
    3216:	80 91 b6 02 	lds	r24, 0x02B6	; 0x8002b6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    321a:	91 e0       	ldi	r25, 0x01	; 1
    321c:	89 27       	eor	r24, r25
    321e:	80 93 b6 02 	sts	0x02B6, r24	; 0x8002b6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    3222:	80 91 b9 02 	lds	r24, 0x02B9	; 0x8002b9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xd>
    3226:	90 91 ba 02 	lds	r25, 0x02BA	; 0x8002ba <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xe>
    322a:	a0 91 bb 02 	lds	r26, 0x02BB	; 0x8002bb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xf>
    322e:	b0 91 bc 02 	lds	r27, 0x02BC	; 0x8002bc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x10>
    3232:	01 96       	adiw	r24, 0x01	; 1
    3234:	a1 1d       	adc	r26, r1
    3236:	b1 1d       	adc	r27, r1
    3238:	80 93 b9 02 	sts	0x02B9, r24	; 0x8002b9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xd>
    323c:	90 93 ba 02 	sts	0x02BA, r25	; 0x8002ba <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xe>
    3240:	a0 93 bb 02 	sts	0x02BB, r26	; 0x8002bb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xf>
    3244:	b0 93 bc 02 	sts	0x02BC, r27	; 0x8002bc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x10>
    3248:	40 91 bd 02 	lds	r20, 0x02BD	; 0x8002bd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x11>
    324c:	50 91 be 02 	lds	r21, 0x02BE	; 0x8002be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x12>
    3250:	60 91 bf 02 	lds	r22, 0x02BF	; 0x8002bf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x13>
    3254:	70 91 c0 02 	lds	r23, 0x02C0	; 0x8002c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x14>
    3258:	48 17       	cp	r20, r24
    325a:	59 07       	cpc	r21, r25
    325c:	6a 07       	cpc	r22, r26
    325e:	7b 07       	cpc	r23, r27
    3260:	30 f4       	brcc	.+12     	; 0x326e <__vector_7+0x582>
    3262:	82 e0       	ldi	r24, 0x02	; 2
    3264:	90 e0       	ldi	r25, 0x00	; 0
    3266:	90 93 ad 02 	sts	0x02AD, r25	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    326a:	80 93 ac 02 	sts	0x02AC, r24	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    326e:	80 91 e9 05 	lds	r24, 0x05E9	; 0x8005e9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x5>
    3272:	89 30       	cpi	r24, 0x09	; 9
    3274:	10 f0       	brcs	.+4      	; 0x327a <__vector_7+0x58e>
    3276:	0c 94 9d 21 	jmp	0x433a	; 0x433a <__vector_7+0x164e>
    327a:	8f 5f       	subi	r24, 0xFF	; 255
    327c:	80 93 e9 05 	sts	0x05E9, r24	; 0x8005e9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x5>
    3280:	80 91 cf 02 	lds	r24, 0x02CF	; 0x8002cf <LED_B_CNT>
    3284:	80 5f       	subi	r24, 0xF0	; 240
    3286:	80 93 cf 02 	sts	0x02CF, r24	; 0x8002cf <LED_B_CNT>
    328a:	80 91 c1 02 	lds	r24, 0x02C1	; 0x8002c1 <timer_counter>
    328e:	90 91 c2 02 	lds	r25, 0x02C2	; 0x8002c2 <timer_counter+0x1>
    3292:	01 96       	adiw	r24, 0x01	; 1
    3294:	90 93 c2 02 	sts	0x02C2, r25	; 0x8002c2 <timer_counter+0x1>
    3298:	80 93 c1 02 	sts	0x02C1, r24	; 0x8002c1 <timer_counter>
    329c:	80 91 c1 02 	lds	r24, 0x02C1	; 0x8002c1 <timer_counter>
    32a0:	90 91 c2 02 	lds	r25, 0x02C2	; 0x8002c2 <timer_counter+0x1>
    32a4:	68 ee       	ldi	r22, 0xE8	; 232
    32a6:	73 e0       	ldi	r23, 0x03	; 3
    32a8:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    32ac:	89 2b       	or	r24, r25
    32ae:	19 f4       	brne	.+6      	; 0x32b6 <__vector_7+0x5ca>
    32b0:	81 e0       	ldi	r24, 0x01	; 1
    32b2:	80 93 cd 02 	sts	0x02CD, r24	; 0x8002cd <new_second_flag>
    32b6:	80 91 c1 02 	lds	r24, 0x02C1	; 0x8002c1 <timer_counter>
    32ba:	90 91 c2 02 	lds	r25, 0x02C2	; 0x8002c2 <timer_counter+0x1>
    32be:	80 36       	cpi	r24, 0x60	; 96
    32c0:	9a 4e       	sbci	r25, 0xEA	; 234
    32c2:	38 f0       	brcs	.+14     	; 0x32d2 <__vector_7+0x5e6>
    32c4:	81 e0       	ldi	r24, 0x01	; 1
    32c6:	80 93 ce 02 	sts	0x02CE, r24	; 0x8002ce <new_minute_flag>
    32ca:	10 92 c2 02 	sts	0x02C2, r1	; 0x8002c2 <timer_counter+0x1>
    32ce:	10 92 c1 02 	sts	0x02C1, r1	; 0x8002c1 <timer_counter>
    32d2:	80 91 5b 02 	lds	r24, 0x025B	; 0x80025b <ms_ticks>
    32d6:	90 91 5c 02 	lds	r25, 0x025C	; 0x80025c <ms_ticks+0x1>
    32da:	89 2b       	or	r24, r25
    32dc:	49 f0       	breq	.+18     	; 0x32f0 <__vector_7+0x604>
    32de:	80 91 5b 02 	lds	r24, 0x025B	; 0x80025b <ms_ticks>
    32e2:	90 91 5c 02 	lds	r25, 0x025C	; 0x80025c <ms_ticks+0x1>
    32e6:	01 97       	sbiw	r24, 0x01	; 1
    32e8:	90 93 5c 02 	sts	0x025C, r25	; 0x80025c <ms_ticks+0x1>
    32ec:	80 93 5b 02 	sts	0x025B, r24	; 0x80025b <ms_ticks>
    32f0:	98 b5       	in	r25, 0x28	; 40
    32f2:	80 91 cb 02 	lds	r24, 0x02CB	; 0x8002cb <_target_brightness>
    32f6:	98 17       	cp	r25, r24
    32f8:	d1 f0       	breq	.+52     	; 0x332e <__vector_7+0x642>
    32fa:	80 91 59 02 	lds	r24, 0x0259	; 0x800259 <brightness_counter>
    32fe:	90 91 5a 02 	lds	r25, 0x025A	; 0x80025a <brightness_counter+0x1>
    3302:	01 96       	adiw	r24, 0x01	; 1
    3304:	90 93 5a 02 	sts	0x025A, r25	; 0x80025a <brightness_counter+0x1>
    3308:	80 93 59 02 	sts	0x0259, r24	; 0x800259 <brightness_counter>
    330c:	8e 97       	sbiw	r24, 0x2e	; 46
    330e:	98 f0       	brcs	.+38     	; 0x3336 <__vector_7+0x64a>
    3310:	98 b5       	in	r25, 0x28	; 40
    3312:	80 91 cb 02 	lds	r24, 0x02CB	; 0x8002cb <_target_brightness>
    3316:	98 17       	cp	r25, r24
    3318:	10 f0       	brcs	.+4      	; 0x331e <__vector_7+0x632>
    331a:	0c 94 d4 21 	jmp	0x43a8	; 0x43a8 <__vector_7+0x16bc>
    331e:	88 b5       	in	r24, 0x28	; 40
    3320:	8f 5f       	subi	r24, 0xFF	; 255
    3322:	88 bd       	out	0x28, r24	; 40
    3324:	81 30       	cpi	r24, 0x01	; 1
    3326:	19 f4       	brne	.+6      	; 0x332e <__vector_7+0x642>
    3328:	5d 98       	cbi	0x0b, 5	; 11
    332a:	83 e3       	ldi	r24, 0x33	; 51
    332c:	84 bd       	out	0x24, r24	; 36
    332e:	10 92 5a 02 	sts	0x025A, r1	; 0x80025a <brightness_counter+0x1>
    3332:	10 92 59 02 	sts	0x0259, r1	; 0x800259 <brightness_counter>
    3336:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <MODE>
    333a:	82 ff       	sbrs	r24, 2
    333c:	31 c0       	rjmp	.+98     	; 0x33a0 <__vector_7+0x6b4>
    333e:	90 91 58 02 	lds	r25, 0x0258	; 0x800258 <crossfade_flip_counter>
    3342:	80 91 00 01 	lds	r24, 0x0100	; 0x800100 <__data_start>
    3346:	98 13       	cpse	r25, r24
    3348:	0c 94 de 21 	jmp	0x43bc	; 0x43bc <__vector_7+0x16d0>
    334c:	82 ee       	ldi	r24, 0xE2	; 226
    334e:	93 e0       	ldi	r25, 0x03	; 3
    3350:	0e 94 62 02 	call	0x4c4	; 0x4c4 <_Z20putDigitsToInputRegsPhh.constprop.118>
    3354:	0e 94 86 10 	call	0x210c	; 0x210c <_Z16pushToOutputRegsv>
    3358:	80 91 58 02 	lds	r24, 0x0258	; 0x800258 <crossfade_flip_counter>
    335c:	8f 5f       	subi	r24, 0xFF	; 255
    335e:	80 93 58 02 	sts	0x0258, r24	; 0x800258 <crossfade_flip_counter>
    3362:	81 32       	cpi	r24, 0x21	; 33
    3364:	10 f0       	brcs	.+4      	; 0x336a <__vector_7+0x67e>
    3366:	10 92 58 02 	sts	0x0258, r1	; 0x800258 <crossfade_flip_counter>
    336a:	80 91 57 02 	lds	r24, 0x0257	; 0x800257 <crossfade_step_counter>
    336e:	81 50       	subi	r24, 0x01	; 1
    3370:	80 93 57 02 	sts	0x0257, r24	; 0x800257 <crossfade_step_counter>
    3374:	81 11       	cpse	r24, r1
    3376:	14 c0       	rjmp	.+40     	; 0x33a0 <__vector_7+0x6b4>
    3378:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <MODE>
    337c:	81 fd       	sbrc	r24, 1
    337e:	02 c0       	rjmp	.+4      	; 0x3384 <__vector_7+0x698>
    3380:	0c 94 e7 21 	jmp	0x43ce	; 0x43ce <__vector_7+0x16e2>
    3384:	8a e2       	ldi	r24, 0x2A	; 42
    3386:	80 93 57 02 	sts	0x0257, r24	; 0x800257 <crossfade_step_counter>
    338a:	80 91 00 01 	lds	r24, 0x0100	; 0x800100 <__data_start>
    338e:	88 23       	and	r24, r24
    3390:	11 f4       	brne	.+4      	; 0x3396 <__vector_7+0x6aa>
    3392:	0c 94 ea 21 	jmp	0x43d4	; 0x43d4 <__vector_7+0x16e8>
    3396:	80 91 00 01 	lds	r24, 0x0100	; 0x800100 <__data_start>
    339a:	81 50       	subi	r24, 0x01	; 1
    339c:	80 93 00 01 	sts	0x0100, r24	; 0x800100 <__data_start>
    33a0:	80 91 0b 01 	lds	r24, 0x010B	; 0x80010b <debounce_cnt>
    33a4:	80 34       	cpi	r24, 0x40	; 64
    33a6:	28 f4       	brcc	.+10     	; 0x33b2 <__vector_7+0x6c6>
    33a8:	80 91 0b 01 	lds	r24, 0x010B	; 0x80010b <debounce_cnt>
    33ac:	8f 5f       	subi	r24, 0xFF	; 255
    33ae:	80 93 0b 01 	sts	0x010B, r24	; 0x80010b <debounce_cnt>
    33b2:	80 91 08 01 	lds	r24, 0x0108	; 0x800108 <long_press_cnt>
    33b6:	90 91 09 01 	lds	r25, 0x0109	; 0x800109 <long_press_cnt+0x1>
    33ba:	8e 3e       	cpi	r24, 0xEE	; 238
    33bc:	92 40       	sbci	r25, 0x02	; 2
    33be:	48 f4       	brcc	.+18     	; 0x33d2 <__vector_7+0x6e6>
    33c0:	80 91 08 01 	lds	r24, 0x0108	; 0x800108 <long_press_cnt>
    33c4:	90 91 09 01 	lds	r25, 0x0109	; 0x800109 <long_press_cnt+0x1>
    33c8:	01 96       	adiw	r24, 0x01	; 1
    33ca:	90 93 09 01 	sts	0x0109, r25	; 0x800109 <long_press_cnt+0x1>
    33ce:	80 93 08 01 	sts	0x0108, r24	; 0x800108 <long_press_cnt>
    33d2:	68 96       	adiw	r28, 0x18	; 24
    33d4:	0f b6       	in	r0, 0x3f	; 63
    33d6:	f8 94       	cli
    33d8:	de bf       	out	0x3e, r29	; 62
    33da:	0f be       	out	0x3f, r0	; 63
    33dc:	cd bf       	out	0x3d, r28	; 61
    33de:	df 91       	pop	r29
    33e0:	cf 91       	pop	r28
    33e2:	ff 91       	pop	r31
    33e4:	ef 91       	pop	r30
    33e6:	bf 91       	pop	r27
    33e8:	af 91       	pop	r26
    33ea:	9f 91       	pop	r25
    33ec:	8f 91       	pop	r24
    33ee:	7f 91       	pop	r23
    33f0:	6f 91       	pop	r22
    33f2:	5f 91       	pop	r21
    33f4:	4f 91       	pop	r20
    33f6:	3f 91       	pop	r19
    33f8:	2f 91       	pop	r18
    33fa:	1f 91       	pop	r17
    33fc:	0f 91       	pop	r16
    33fe:	ff 90       	pop	r15
    3400:	ef 90       	pop	r14
    3402:	df 90       	pop	r13
    3404:	cf 90       	pop	r12
    3406:	bf 90       	pop	r11
    3408:	af 90       	pop	r10
    340a:	9f 90       	pop	r9
    340c:	8f 90       	pop	r8
    340e:	7f 90       	pop	r7
    3410:	6f 90       	pop	r6
    3412:	5f 90       	pop	r5
    3414:	4f 90       	pop	r4
    3416:	0f 90       	pop	r0
    3418:	0f be       	out	0x3f, r0	; 63
    341a:	0f 90       	pop	r0
    341c:	1f 90       	pop	r1
    341e:	18 95       	reti
    3420:	88 e0       	ldi	r24, 0x08	; 8
    3422:	fe 01       	movw	r30, r28
    3424:	39 96       	adiw	r30, 0x09	; 9
    3426:	aa e4       	ldi	r26, 0x4A	; 74
    3428:	b2 e0       	ldi	r27, 0x02	; 2
    342a:	01 90       	ld	r0, Z+
    342c:	0d 92       	st	X+, r0
    342e:	8a 95       	dec	r24
    3430:	e1 f7       	brne	.-8      	; 0x342a <__vector_7+0x73e>
    3432:	10 92 50 02 	sts	0x0250, r1	; 0x800250 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12decoded_timeE+0x6>
    3436:	8e 89       	ldd	r24, Y+22	; 0x16
    3438:	81 30       	cpi	r24, 0x01	; 1
    343a:	31 f5       	brne	.+76     	; 0x3488 <__vector_7+0x79c>
    343c:	80 91 64 02 	lds	r24, 0x0264	; 0x800264 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x1>
    3440:	18 16       	cp	r1, r24
    3442:	14 f4       	brge	.+4      	; 0x3448 <__vector_7+0x75c>
    3444:	10 92 65 02 	sts	0x0265, r1	; 0x800265 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x2>
    3448:	10 92 64 02 	sts	0x0264, r1	; 0x800264 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x1>
    344c:	10 92 66 02 	sts	0x0266, r1	; 0x800266 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x3>
    3450:	90 91 65 02 	lds	r25, 0x0265	; 0x800265 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x2>
    3454:	88 8d       	ldd	r24, Y+24	; 0x18
    3456:	8e 7f       	andi	r24, 0xFE	; 254
    3458:	97 ff       	sbrs	r25, 7
    345a:	81 60       	ori	r24, 0x01	; 1
    345c:	8b 7f       	andi	r24, 0xFB	; 251
    345e:	87 7f       	andi	r24, 0xF7	; 247
    3460:	88 8f       	std	Y+24, r24	; 0x18
    3462:	ce 01       	movw	r24, r28
    3464:	41 96       	adiw	r24, 0x11	; 17
    3466:	0e 94 5d 0b 	call	0x16ba	; 0x16ba <_ZN8Internal13DCF77_Encoder20autoset_control_bitsEv>
    346a:	98 8d       	ldd	r25, Y+24	; 0x18
    346c:	80 91 51 02 	lds	r24, 0x0251	; 0x800251 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12decoded_timeE+0x7>
    3470:	90 fb       	bst	r25, 0
    3472:	80 f9       	bld	r24, 0
    3474:	92 fb       	bst	r25, 2
    3476:	82 f9       	bld	r24, 2
    3478:	93 fb       	bst	r25, 3
    347a:	83 f9       	bld	r24, 3
    347c:	90 91 63 02 	lds	r25, 0x0263	; 0x800263 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE>
    3480:	90 fb       	bst	r25, 0
    3482:	81 f9       	bld	r24, 1
    3484:	80 93 51 02 	sts	0x0251, r24	; 0x800251 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12decoded_timeE+0x7>
    3488:	8d 89       	ldd	r24, Y+21	; 0x15
    348a:	83 32       	cpi	r24, 0x23	; 35
    348c:	29 f4       	brne	.+10     	; 0x3498 <__vector_7+0x7ac>
    348e:	8e 89       	ldd	r24, Y+22	; 0x16
    3490:	89 35       	cpi	r24, 0x59	; 89
    3492:	11 f4       	brne	.+4      	; 0x3498 <__vector_7+0x7ac>
    3494:	10 92 67 02 	sts	0x0267, r1	; 0x800267 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE+0x4>
    3498:	81 e0       	ldi	r24, 0x01	; 1
    349a:	12 30       	cpi	r17, 0x02	; 2
    349c:	08 f0       	brcs	.+2      	; 0x34a0 <__vector_7+0x7b4>
    349e:	80 e0       	ldi	r24, 0x00	; 0
    34a0:	81 23       	and	r24, r17
    34a2:	80 93 52 02 	sts	0x0252, r24	; 0x800252 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11leap_secondE>
    34a6:	c6 cd       	rjmp	.-1140   	; 0x3034 <__vector_7+0x348>
    34a8:	19 2f       	mov	r17, r25
    34aa:	12 1b       	sub	r17, r18
    34ac:	8f bf       	out	0x3f, r24	; 63
    34ae:	80 e0       	ldi	r24, 0x00	; 0
    34b0:	9d 31       	cpi	r25, 0x1D	; 29
    34b2:	38 f4       	brcc	.+14     	; 0x34c2 <__vector_7+0x7d6>
    34b4:	9d 30       	cpi	r25, 0x0D	; 13
    34b6:	08 f4       	brcc	.+2      	; 0x34ba <__vector_7+0x7ce>
    34b8:	6c c0       	rjmp	.+216    	; 0x3592 <__vector_7+0x8a6>
    34ba:	16 95       	lsr	r17
    34bc:	16 95       	lsr	r17
    34be:	16 c0       	rjmp	.+44     	; 0x34ec <__vector_7+0x800>
    34c0:	82 2f       	mov	r24, r18
    34c2:	96 95       	lsr	r25
    34c4:	21 e0       	ldi	r18, 0x01	; 1
    34c6:	28 0f       	add	r18, r24
    34c8:	91 11       	cpse	r25, r1
    34ca:	fa cf       	rjmp	.-12     	; 0x34c0 <__vector_7+0x7d4>
    34cc:	8d 30       	cpi	r24, 0x0D	; 13
    34ce:	a8 f1       	brcs	.+106    	; 0x353a <__vector_7+0x84e>
    34d0:	8d 30       	cpi	r24, 0x0D	; 13
    34d2:	09 f4       	brne	.+2      	; 0x34d6 <__vector_7+0x7ea>
    34d4:	4c c0       	rjmp	.+152    	; 0x356e <__vector_7+0x882>
    34d6:	8e 30       	cpi	r24, 0x0E	; 14
    34d8:	09 f4       	brne	.+2      	; 0x34dc <__vector_7+0x7f0>
    34da:	4c c0       	rjmp	.+152    	; 0x3574 <__vector_7+0x888>
    34dc:	81 e1       	ldi	r24, 0x11	; 17
    34de:	90 e0       	ldi	r25, 0x00	; 0
    34e0:	18 9f       	mul	r17, r24
    34e2:	90 01       	movw	r18, r0
    34e4:	19 9f       	mul	r17, r25
    34e6:	30 0d       	add	r19, r0
    34e8:	11 24       	eor	r1, r1
    34ea:	13 2f       	mov	r17, r19
    34ec:	00 23       	and	r16, r16
    34ee:	09 f4       	brne	.+2      	; 0x34f2 <__vector_7+0x806>
    34f0:	da cd       	rjmp	.-1100   	; 0x30a6 <__vector_7+0x3ba>
    34f2:	11 23       	and	r17, r17
    34f4:	09 f4       	brne	.+2      	; 0x34f8 <__vector_7+0x80c>
    34f6:	d7 cd       	rjmp	.-1106   	; 0x30a6 <__vector_7+0x3ba>
    34f8:	0e 94 a2 02 	call	0x544	; 0x544 <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.64>
    34fc:	8f 83       	std	Y+7, r24	; 0x07
    34fe:	0e 94 ad 0c 	call	0x195a	; 0x195a <_ZN8Internal7Binning7DecoderIhLj60EE14get_time_valueEv.constprop.58>
    3502:	8e 83       	std	Y+6, r24	; 0x06
    3504:	0e 94 95 0c 	call	0x192a	; 0x192a <_ZN8Internal7Binning7DecoderIhLj24EE14get_time_valueEv.constprop.67>
    3508:	8d 83       	std	Y+5, r24	; 0x05
    350a:	0e 94 7c 0c 	call	0x18f8	; 0x18f8 <_ZN8Internal7Binning7DecoderIhLj7EE14get_time_valueEv.constprop.70>
    350e:	8c 83       	std	Y+4, r24	; 0x04
    3510:	0e 94 63 0c 	call	0x18c6	; 0x18c6 <_ZN8Internal7Binning7DecoderIhLj31EE14get_time_valueEv.constprop.73>
    3514:	8b 83       	std	Y+3, r24	; 0x03
    3516:	0e 94 4a 0c 	call	0x1894	; 0x1894 <_ZN8Internal7Binning7DecoderIhLj12EE14get_time_valueEv.constprop.76>
    351a:	8a 83       	std	Y+2, r24	; 0x02
    351c:	0e 94 da 0c 	call	0x19b4	; 0x19b4 <_ZN8Internal18DCF77_Year_Decoder14get_time_valueEv.constprop.60>
    3520:	89 83       	std	Y+1, r24	; 0x01
    3522:	ce 01       	movw	r24, r28
    3524:	01 96       	adiw	r24, 0x01	; 1
    3526:	0e 94 0d 0b 	call	0x161a	; 0x161a <_ZNK8Internal13DCF77_Encoder11get_weekdayEv>
    352a:	81 11       	cpse	r24, r1
    352c:	01 c0       	rjmp	.+2      	; 0x3530 <__vector_7+0x844>
    352e:	87 e0       	ldi	r24, 0x07	; 7
    3530:	9c 81       	ldd	r25, Y+4	; 0x04
    3532:	98 13       	cpse	r25, r24
    3534:	47 c0       	rjmp	.+142    	; 0x35c4 <__vector_7+0x8d8>
    3536:	0f 5f       	subi	r16, 0xFF	; 255
    3538:	b6 cd       	rjmp	.-1172   	; 0x30a6 <__vector_7+0x3ba>
    353a:	89 30       	cpi	r24, 0x09	; 9
    353c:	60 f0       	brcs	.+24     	; 0x3556 <__vector_7+0x86a>
    353e:	8b 30       	cpi	r24, 0x0B	; 11
    3540:	28 f0       	brcs	.+10     	; 0x354c <__vector_7+0x860>
    3542:	8c 30       	cpi	r24, 0x0C	; 12
    3544:	d1 f4       	brne	.+52     	; 0x357a <__vector_7+0x88e>
    3546:	85 e1       	ldi	r24, 0x15	; 21
    3548:	90 e0       	ldi	r25, 0x00	; 0
    354a:	ca cf       	rjmp	.-108    	; 0x34e0 <__vector_7+0x7f4>
    354c:	8a 30       	cpi	r24, 0x0A	; 10
    354e:	c1 f4       	brne	.+48     	; 0x3580 <__vector_7+0x894>
    3550:	89 e1       	ldi	r24, 0x19	; 25
    3552:	90 e0       	ldi	r25, 0x00	; 0
    3554:	c5 cf       	rjmp	.-118    	; 0x34e0 <__vector_7+0x7f4>
    3556:	87 30       	cpi	r24, 0x07	; 7
    3558:	28 f0       	brcs	.+10     	; 0x3564 <__vector_7+0x878>
    355a:	88 30       	cpi	r24, 0x08	; 8
    355c:	a1 f4       	brne	.+40     	; 0x3586 <__vector_7+0x89a>
    355e:	80 e2       	ldi	r24, 0x20	; 32
    3560:	90 e0       	ldi	r25, 0x00	; 0
    3562:	be cf       	rjmp	.-132    	; 0x34e0 <__vector_7+0x7f4>
    3564:	86 30       	cpi	r24, 0x06	; 6
    3566:	91 f4       	brne	.+36     	; 0x358c <__vector_7+0x8a0>
    3568:	8a e2       	ldi	r24, 0x2A	; 42
    356a:	90 e0       	ldi	r25, 0x00	; 0
    356c:	b9 cf       	rjmp	.-142    	; 0x34e0 <__vector_7+0x7f4>
    356e:	83 e1       	ldi	r24, 0x13	; 19
    3570:	90 e0       	ldi	r25, 0x00	; 0
    3572:	b6 cf       	rjmp	.-148    	; 0x34e0 <__vector_7+0x7f4>
    3574:	82 e1       	ldi	r24, 0x12	; 18
    3576:	90 e0       	ldi	r25, 0x00	; 0
    3578:	b3 cf       	rjmp	.-154    	; 0x34e0 <__vector_7+0x7f4>
    357a:	87 e1       	ldi	r24, 0x17	; 23
    357c:	90 e0       	ldi	r25, 0x00	; 0
    357e:	b0 cf       	rjmp	.-160    	; 0x34e0 <__vector_7+0x7f4>
    3580:	8c e1       	ldi	r24, 0x1C	; 28
    3582:	90 e0       	ldi	r25, 0x00	; 0
    3584:	ad cf       	rjmp	.-166    	; 0x34e0 <__vector_7+0x7f4>
    3586:	84 e2       	ldi	r24, 0x24	; 36
    3588:	90 e0       	ldi	r25, 0x00	; 0
    358a:	aa cf       	rjmp	.-172    	; 0x34e0 <__vector_7+0x7f4>
    358c:	83 e3       	ldi	r24, 0x33	; 51
    358e:	90 e0       	ldi	r25, 0x00	; 0
    3590:	a7 cf       	rjmp	.-178    	; 0x34e0 <__vector_7+0x7f4>
    3592:	99 30       	cpi	r25, 0x09	; 9
    3594:	58 f0       	brcs	.+22     	; 0x35ac <__vector_7+0x8c0>
    3596:	1b 30       	cpi	r17, 0x0B	; 11
    3598:	08 f0       	brcs	.+2      	; 0x359c <__vector_7+0x8b0>
    359a:	24 c7       	rjmp	.+3656   	; 0x43e4 <__vector_7+0x16f8>
    359c:	17 30       	cpi	r17, 0x07	; 7
    359e:	08 f0       	brcs	.+2      	; 0x35a2 <__vector_7+0x8b6>
    35a0:	27 c7       	rjmp	.+3662   	; 0x43f0 <__vector_7+0x1704>
    35a2:	14 30       	cpi	r17, 0x04	; 4
    35a4:	08 f4       	brcc	.+2      	; 0x35a8 <__vector_7+0x8bc>
    35a6:	7f cd       	rjmp	.-1282   	; 0x30a6 <__vector_7+0x3ba>
    35a8:	11 e0       	ldi	r17, 0x01	; 1
    35aa:	1d c7       	rjmp	.+3642   	; 0x43e6 <__vector_7+0x16fa>
    35ac:	95 30       	cpi	r25, 0x05	; 5
    35ae:	30 f0       	brcs	.+12     	; 0x35bc <__vector_7+0x8d0>
    35b0:	16 30       	cpi	r17, 0x06	; 6
    35b2:	08 f0       	brcs	.+2      	; 0x35b6 <__vector_7+0x8ca>
    35b4:	1d c7       	rjmp	.+3642   	; 0x43f0 <__vector_7+0x1704>
    35b6:	13 30       	cpi	r17, 0x03	; 3
    35b8:	b8 f7       	brcc	.-18     	; 0x35a8 <__vector_7+0x8bc>
    35ba:	75 cd       	rjmp	.-1302   	; 0x30a6 <__vector_7+0x3ba>
    35bc:	93 30       	cpi	r25, 0x03	; 3
    35be:	d8 f7       	brcc	.-10     	; 0x35b6 <__vector_7+0x8ca>
    35c0:	16 95       	lsr	r17
    35c2:	94 cf       	rjmp	.-216    	; 0x34ec <__vector_7+0x800>
    35c4:	10 17       	cp	r17, r16
    35c6:	08 f4       	brcc	.+2      	; 0x35ca <__vector_7+0x8de>
    35c8:	6e cd       	rjmp	.-1316   	; 0x30a6 <__vector_7+0x3ba>
    35ca:	00 e0       	ldi	r16, 0x00	; 0
    35cc:	6c cd       	rjmp	.-1320   	; 0x30a6 <__vector_7+0x3ba>
    35ce:	05 97       	sbiw	r24, 0x05	; 5
    35d0:	09 f0       	breq	.+2      	; 0x35d4 <__vector_7+0x8e8>
    35d2:	80 cd       	rjmp	.-1280   	; 0x30d4 <__vector_7+0x3e8>
    35d4:	80 91 60 02 	lds	r24, 0x0260	; 0x800260 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    35d8:	8e 7f       	andi	r24, 0xFE	; 254
    35da:	80 93 60 02 	sts	0x0260, r24	; 0x800260 <_ZN8Internal23DCF77_Frequency_Control17calibration_stateE>
    35de:	0e 94 b6 02 	call	0x56c	; 0x56c <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55>
    35e2:	ee 24       	eor	r14, r14
    35e4:	e3 94       	inc	r14
    35e6:	88 23       	and	r24, r24
    35e8:	09 f4       	brne	.+2      	; 0x35ec <__vector_7+0x900>
    35ea:	79 c0       	rjmp	.+242    	; 0x36de <__vector_7+0x9f2>
    35ec:	e1 2c       	mov	r14, r1
    35ee:	80 e2       	ldi	r24, 0x20	; 32
    35f0:	93 e0       	ldi	r25, 0x03	; 3
    35f2:	0e 94 68 09 	call	0x12d0	; 0x12d0 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv>
    35f6:	11 e0       	ldi	r17, 0x01	; 1
    35f8:	81 11       	cpse	r24, r1
    35fa:	10 e0       	ldi	r17, 0x00	; 0
    35fc:	1e 29       	or	r17, r14
    35fe:	21 f0       	breq	.+8      	; 0x3608 <__vector_7+0x91c>
    3600:	80 ee       	ldi	r24, 0xE0	; 224
    3602:	92 e0       	ldi	r25, 0x02	; 2
    3604:	0e 94 fe 09 	call	0x13fc	; 0x13fc <_ZN8Internal7Binning6bins_tIhhLj60EE5setupEv>
    3608:	80 ee       	ldi	r24, 0xE0	; 224
    360a:	92 e0       	ldi	r25, 0x02	; 2
    360c:	0e 94 68 09 	call	0x12d0	; 0x12d0 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv>
    3610:	ee 24       	eor	r14, r14
    3612:	e3 94       	inc	r14
    3614:	81 11       	cpse	r24, r1
    3616:	e1 2c       	mov	r14, r1
    3618:	e1 2a       	or	r14, r17
    361a:	89 f0       	breq	.+34     	; 0x363e <__vector_7+0x952>
    361c:	e8 e6       	ldi	r30, 0x68	; 104
    361e:	f3 e0       	ldi	r31, 0x03	; 3
    3620:	80 e8       	ldi	r24, 0x80	; 128
    3622:	93 e0       	ldi	r25, 0x03	; 3
    3624:	11 92       	st	Z+, r1
    3626:	8e 17       	cp	r24, r30
    3628:	9f 07       	cpc	r25, r31
    362a:	e1 f7       	brne	.-8      	; 0x3624 <__vector_7+0x938>
    362c:	10 92 80 03 	sts	0x0380, r1	; 0x800380 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
    3630:	10 92 82 03 	sts	0x0382, r1	; 0x800382 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1a>
    3634:	89 e1       	ldi	r24, 0x19	; 25
    3636:	80 93 83 03 	sts	0x0383, r24	; 0x800383 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1b>
    363a:	10 92 81 03 	sts	0x0381, r1	; 0x800381 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x19>
    363e:	0e 94 ec 03 	call	0x7d8	; 0x7d8 <_ZN8Internal7Binning6bins_tIhhLj24EE18get_quality_factorEv.constprop.50>
    3642:	11 e0       	ldi	r17, 0x01	; 1
    3644:	81 11       	cpse	r24, r1
    3646:	10 e0       	ldi	r17, 0x00	; 0
    3648:	e1 2a       	or	r14, r17
    364a:	41 f1       	breq	.+80     	; 0x369c <__vector_7+0x9b0>
    364c:	10 92 84 03 	sts	0x0384, r1	; 0x800384 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE>
    3650:	10 92 85 03 	sts	0x0385, r1	; 0x800385 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x1>
    3654:	10 92 86 03 	sts	0x0386, r1	; 0x800386 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x2>
    3658:	10 92 87 03 	sts	0x0387, r1	; 0x800387 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x3>
    365c:	10 92 88 03 	sts	0x0388, r1	; 0x800388 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x4>
    3660:	10 92 89 03 	sts	0x0389, r1	; 0x800389 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x5>
    3664:	10 92 8a 03 	sts	0x038A, r1	; 0x80038a <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x6>
    3668:	10 92 8b 03 	sts	0x038B, r1	; 0x80038b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
    366c:	10 92 8d 03 	sts	0x038D, r1	; 0x80038d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x9>
    3670:	88 e0       	ldi	r24, 0x08	; 8
    3672:	80 93 8e 03 	sts	0x038E, r24	; 0x80038e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0xa>
    3676:	10 92 8c 03 	sts	0x038C, r1	; 0x80038c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x8>
    367a:	ef e8       	ldi	r30, 0x8F	; 143
    367c:	f3 e0       	ldi	r31, 0x03	; 3
    367e:	8e ea       	ldi	r24, 0xAE	; 174
    3680:	93 e0       	ldi	r25, 0x03	; 3
    3682:	11 92       	st	Z+, r1
    3684:	8e 17       	cp	r24, r30
    3686:	9f 07       	cpc	r25, r31
    3688:	e1 f7       	brne	.-8      	; 0x3682 <__vector_7+0x996>
    368a:	10 92 ae 03 	sts	0x03AE, r1	; 0x8003ae <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
    368e:	10 92 b0 03 	sts	0x03B0, r1	; 0x8003b0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x21>
    3692:	80 e2       	ldi	r24, 0x20	; 32
    3694:	80 93 b1 03 	sts	0x03B1, r24	; 0x8003b1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x22>
    3698:	10 92 af 03 	sts	0x03AF, r1	; 0x8003af <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x20>
    369c:	0e 94 76 03 	call	0x6ec	; 0x6ec <_ZN8Internal7Binning6bins_tIhhLj31EE18get_quality_factorEv.constprop.51>
    36a0:	11 e0       	ldi	r17, 0x01	; 1
    36a2:	81 11       	cpse	r24, r1
    36a4:	10 e0       	ldi	r17, 0x00	; 0
    36a6:	1e 29       	or	r17, r14
    36a8:	81 f0       	breq	.+32     	; 0x36ca <__vector_7+0x9de>
    36aa:	e2 eb       	ldi	r30, 0xB2	; 178
    36ac:	f3 e0       	ldi	r31, 0x03	; 3
    36ae:	11 92       	st	Z+, r1
    36b0:	23 e0       	ldi	r18, 0x03	; 3
    36b2:	ee 3b       	cpi	r30, 0xBE	; 190
    36b4:	f2 07       	cpc	r31, r18
    36b6:	d9 f7       	brne	.-10     	; 0x36ae <__vector_7+0x9c2>
    36b8:	10 92 be 03 	sts	0x03BE, r1	; 0x8003be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
    36bc:	10 92 c0 03 	sts	0x03C0, r1	; 0x8003c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xe>
    36c0:	8d e0       	ldi	r24, 0x0D	; 13
    36c2:	80 93 c1 03 	sts	0x03C1, r24	; 0x8003c1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xf>
    36c6:	10 92 bf 03 	sts	0x03BF, r1	; 0x8003bf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xd>
    36ca:	0e 94 00 03 	call	0x600	; 0x600 <_ZN8Internal7Binning6bins_tIhhLj12EE18get_quality_factorEv.constprop.52>
    36ce:	88 23       	and	r24, r24
    36d0:	09 f0       	breq	.+2      	; 0x36d4 <__vector_7+0x9e8>
    36d2:	11 11       	cpse	r17, r1
    36d4:	0e 94 81 02 	call	0x502	; 0x502 <_ZN8Internal18DCF77_Year_Decoder5setupEv.constprop.99>
    36d8:	84 e0       	ldi	r24, 0x04	; 4
    36da:	90 e0       	ldi	r25, 0x00	; 0
    36dc:	f7 cc       	rjmp	.-1554   	; 0x30cc <__vector_7+0x3e0>
    36de:	80 e2       	ldi	r24, 0x20	; 32
    36e0:	93 e0       	ldi	r25, 0x03	; 3
    36e2:	0e 94 fe 09 	call	0x13fc	; 0x13fc <_ZN8Internal7Binning6bins_tIhhLj60EE5setupEv>
    36e6:	8f ef       	ldi	r24, 0xFF	; 255
    36e8:	80 93 66 03 	sts	0x0366, r24	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    36ec:	80 93 67 03 	sts	0x0367, r24	; 0x800367 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x47>
    36f0:	7e cf       	rjmp	.-260    	; 0x35ee <__vector_7+0x902>
    36f2:	84 30       	cpi	r24, 0x04	; 4
    36f4:	91 05       	cpc	r25, r1
    36f6:	29 f1       	breq	.+74     	; 0x3742 <__vector_7+0xa56>
    36f8:	08 f4       	brcc	.+2      	; 0x36fc <__vector_7+0xa10>
    36fa:	4a c0       	rjmp	.+148    	; 0x3790 <__vector_7+0xaa4>
    36fc:	85 30       	cpi	r24, 0x05	; 5
    36fe:	91 05       	cpc	r25, r1
    3700:	09 f0       	breq	.+2      	; 0x3704 <__vector_7+0xa18>
    3702:	f2 cc       	rjmp	.-1564   	; 0x30e8 <__vector_7+0x3fc>
    3704:	10 92 b8 02 	sts	0x02B8, r1	; 0x8002b8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    3708:	10 92 b7 02 	sts	0x02B7, r1	; 0x8002b7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    370c:	88 e0       	ldi	r24, 0x08	; 8
    370e:	ea e4       	ldi	r30, 0x4A	; 74
    3710:	f2 e0       	ldi	r31, 0x02	; 2
    3712:	ae ea       	ldi	r26, 0xAE	; 174
    3714:	b2 e0       	ldi	r27, 0x02	; 2
    3716:	01 90       	ld	r0, Z+
    3718:	0d 92       	st	X+, r0
    371a:	8a 95       	dec	r24
    371c:	e1 f7       	brne	.-8      	; 0x3716 <__vector_7+0xa2a>
    371e:	8a e4       	ldi	r24, 0x4A	; 74
    3720:	92 e0       	ldi	r25, 0x02	; 2
    3722:	0e 94 ac 0d 	call	0x1b58	; 0x1b58 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE>
    3726:	80 91 b6 02 	lds	r24, 0x02B6	; 0x8002b6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    372a:	91 e0       	ldi	r25, 0x01	; 1
    372c:	89 27       	eor	r24, r25
    372e:	80 93 b6 02 	sts	0x02B6, r24	; 0x8002b6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    3732:	01 cd       	rjmp	.-1534   	; 0x3136 <__vector_7+0x44a>
    3734:	00 23       	and	r16, r16
    3736:	b9 f3       	breq	.-18     	; 0x3726 <__vector_7+0xa3a>
    3738:	b0 92 ad 02 	sts	0x02AD, r11	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    373c:	a0 92 ac 02 	sts	0x02AC, r10	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    3740:	cf cc       	rjmp	.-1634   	; 0x30e0 <__vector_7+0x3f4>
    3742:	0e 94 b6 02 	call	0x56c	; 0x56c <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55>
    3746:	85 36       	cpi	r24, 0x65	; 101
    3748:	90 f0       	brcs	.+36     	; 0x376e <__vector_7+0xa82>
    374a:	80 91 b5 02 	lds	r24, 0x02B5	; 0x8002b5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
    374e:	87 7f       	andi	r24, 0xF7	; 247
    3750:	80 93 b5 02 	sts	0x02B5, r24	; 0x8002b5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
    3754:	8e ea       	ldi	r24, 0xAE	; 174
    3756:	92 e0       	ldi	r25, 0x02	; 2
    3758:	0e 94 6c 0f 	call	0x1ed8	; 0x1ed8 <_ZN8Internal13DCF77_Encoder14advance_secondEv>
    375c:	8e ea       	ldi	r24, 0xAE	; 174
    375e:	92 e0       	ldi	r25, 0x02	; 2
    3760:	0e 94 ac 0d 	call	0x1b58	; 0x1b58 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17local_clock_flushERKNS_13DCF77_EncoderE>
    3764:	10 92 b8 02 	sts	0x02B8, r1	; 0x8002b8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    3768:	10 92 b7 02 	sts	0x02B7, r1	; 0x8002b7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    376c:	dc cf       	rjmp	.-72     	; 0x3726 <__vector_7+0xa3a>
    376e:	83 e0       	ldi	r24, 0x03	; 3
    3770:	90 e0       	ldi	r25, 0x00	; 0
    3772:	90 93 ad 02 	sts	0x02AD, r25	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    3776:	80 93 ac 02 	sts	0x02AC, r24	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    377a:	0e 94 0b 0a 	call	0x1416	; 0x1416 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv>
    377e:	10 92 b9 02 	sts	0x02B9, r1	; 0x8002b9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xd>
    3782:	10 92 ba 02 	sts	0x02BA, r1	; 0x8002ba <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xe>
    3786:	10 92 bb 02 	sts	0x02BB, r1	; 0x8002bb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xf>
    378a:	10 92 bc 02 	sts	0x02BC, r1	; 0x8002bc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x10>
    378e:	d3 cc       	rjmp	.-1626   	; 0x3136 <__vector_7+0x44a>
    3790:	0e 94 b6 02 	call	0x56c	; 0x56c <_ZN8Internal7Binning6bins_tIjmLj100EE18get_quality_factorEv.constprop.55>
    3794:	85 36       	cpi	r24, 0x65	; 101
    3796:	08 f4       	brcc	.+2      	; 0x379a <__vector_7+0xaae>
    3798:	ce cc       	rjmp	.-1636   	; 0x3136 <__vector_7+0x44a>
    379a:	80 91 b7 02 	lds	r24, 0x02B7	; 0x8002b7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    379e:	90 91 b8 02 	lds	r25, 0x02B8	; 0x8002b8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    37a2:	9c 01       	movw	r18, r24
    37a4:	29 5c       	subi	r18, 0xC9	; 201
    37a6:	31 09       	sbc	r19, r1
    37a8:	27 35       	cpi	r18, 0x57	; 87
    37aa:	32 40       	sbci	r19, 0x02	; 2
    37ac:	08 f4       	brcc	.+2      	; 0x37b0 <__vector_7+0xac4>
    37ae:	c3 cc       	rjmp	.-1658   	; 0x3136 <__vector_7+0x44a>
    37b0:	d0 92 ad 02 	sts	0x02AD, r13	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    37b4:	c0 92 ac 02 	sts	0x02AC, r12	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    37b8:	88 3c       	cpi	r24, 0xC8	; 200
    37ba:	91 05       	cpc	r25, r1
    37bc:	08 f0       	brcs	.+2      	; 0x37c0 <__vector_7+0xad4>
    37be:	90 cc       	rjmp	.-1760   	; 0x30e0 <__vector_7+0x3f4>
    37c0:	10 92 b8 02 	sts	0x02B8, r1	; 0x8002b8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    37c4:	10 92 b7 02 	sts	0x02B7, r1	; 0x8002b7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    37c8:	b6 cc       	rjmp	.-1684   	; 0x3136 <__vector_7+0x44a>
    37ca:	80 e0       	ldi	r24, 0x00	; 0
    37cc:	cf cc       	rjmp	.-1634   	; 0x316c <__vector_7+0x480>
    37ce:	91 11       	cpse	r25, r1
    37d0:	d1 cc       	rjmp	.-1630   	; 0x3174 <__vector_7+0x488>
    37d2:	01 e0       	ldi	r16, 0x01	; 1
    37d4:	86 30       	cpi	r24, 0x06	; 6
    37d6:	08 f4       	brcc	.+2      	; 0x37da <__vector_7+0xaee>
    37d8:	00 e0       	ldi	r16, 0x00	; 0
    37da:	80 91 d8 05 	lds	r24, 0x05D8	; 0x8005d8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe2>
    37de:	08 0f       	add	r16, r24
    37e0:	00 93 d8 05 	sts	0x05D8, r16	; 0x8005d8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe2>
    37e4:	10 92 d7 05 	sts	0x05D7, r1	; 0x8005d7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe1>
    37e8:	ce 01       	movw	r24, r28
    37ea:	01 96       	adiw	r24, 0x01	; 1
    37ec:	0e 94 ef 0c 	call	0x19de	; 0x19de <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE17set_DCF77_EncoderERNS_13DCF77_EncoderE>
    37f0:	10 91 52 02 	lds	r17, 0x0252	; 0x800252 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11leap_secondE>
    37f4:	8f 81       	ldd	r24, Y+7	; 0x07
    37f6:	81 0f       	add	r24, r17
    37f8:	8f 83       	std	Y+7, r24	; 0x07
    37fa:	ce 01       	movw	r24, r28
    37fc:	01 96       	adiw	r24, 0x01	; 1
    37fe:	0e 94 6c 0f 	call	0x1ed8	; 0x1ed8 <_ZN8Internal13DCF77_Encoder14advance_secondEv>
    3802:	11 0f       	add	r17, r17
    3804:	8f 81       	ldd	r24, Y+7	; 0x07
    3806:	8b 33       	cpi	r24, 0x3B	; 59
    3808:	49 f4       	brne	.+18     	; 0x381c <__vector_7+0xb30>
    380a:	98 85       	ldd	r25, Y+8	; 0x08
    380c:	93 fb       	bst	r25, 3
    380e:	88 27       	eor	r24, r24
    3810:	80 f9       	bld	r24, 0
    3812:	93 ff       	sbrs	r25, 3
    3814:	04 c0       	rjmp	.+8      	; 0x381e <__vector_7+0xb32>
    3816:	81 e0       	ldi	r24, 0x01	; 1
    3818:	9e 81       	ldd	r25, Y+6	; 0x06
    381a:	91 11       	cpse	r25, r1
    381c:	80 e0       	ldi	r24, 0x00	; 0
    381e:	81 0f       	add	r24, r17
    3820:	80 93 52 02 	sts	0x0252, r24	; 0x800252 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11leap_secondE>
    3824:	81 30       	cpi	r24, 0x01	; 1
    3826:	09 f4       	brne	.+2      	; 0x382a <__vector_7+0xb3e>
    3828:	a5 cc       	rjmp	.-1718   	; 0x3174 <__vector_7+0x488>
    382a:	40 91 5e 03 	lds	r20, 0x035E	; 0x80035e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3e>
    382e:	80 91 5d 03 	lds	r24, 0x035D	; 0x80035d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3d>
    3832:	48 1b       	sub	r20, r24
    3834:	55 0b       	sbc	r21, r21
    3836:	80 91 66 03 	lds	r24, 0x0366	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    383a:	8f 3f       	cpi	r24, 0xFF	; 255
    383c:	09 f0       	breq	.+2      	; 0x3840 <__vector_7+0xb54>
    383e:	bc c0       	rjmp	.+376    	; 0x39b8 <__vector_7+0xccc>
    3840:	80 91 5c 03 	lds	r24, 0x035C	; 0x80035c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3c>
    3844:	88 23       	and	r24, r24
    3846:	09 f4       	brne	.+2      	; 0x384a <__vector_7+0xb5e>
    3848:	6c c0       	rjmp	.+216    	; 0x3922 <__vector_7+0xc36>
    384a:	af ef       	ldi	r26, 0xFF	; 255
    384c:	a8 0f       	add	r26, r24
    384e:	eb ee       	ldi	r30, 0xEB	; 235
    3850:	85 31       	cpi	r24, 0x15	; 21
    3852:	08 f4       	brcc	.+2      	; 0x3856 <__vector_7+0xb6a>
    3854:	e7 e2       	ldi	r30, 0x27	; 39
    3856:	e8 0f       	add	r30, r24
    3858:	f0 e0       	ldi	r31, 0x00	; 0
    385a:	28 2f       	mov	r18, r24
    385c:	30 e0       	ldi	r19, 0x00	; 0
    385e:	b0 e0       	ldi	r27, 0x00	; 0
    3860:	20 5e       	subi	r18, 0xE0	; 224
    3862:	3c 4f       	sbci	r19, 0xFC	; 252
    3864:	a0 5e       	subi	r26, 0xE0	; 224
    3866:	bc 4f       	sbci	r27, 0xFC	; 252
    3868:	bf 01       	movw	r22, r30
    386a:	60 5e       	subi	r22, 0xE0	; 224
    386c:	7c 4f       	sbci	r23, 0xFC	; 252
    386e:	02 30       	cpi	r16, 0x02	; 2
    3870:	09 f4       	brne	.+2      	; 0x3874 <__vector_7+0xb88>
    3872:	65 c0       	rjmp	.+202    	; 0x393e <__vector_7+0xc52>
    3874:	03 30       	cpi	r16, 0x03	; 3
    3876:	09 f4       	brne	.+2      	; 0x387a <__vector_7+0xb8e>
    3878:	79 c0       	rjmp	.+242    	; 0x396c <__vector_7+0xc80>
    387a:	f9 01       	movw	r30, r18
    387c:	90 81       	ld	r25, Z
    387e:	01 11       	cpse	r16, r1
    3880:	8d c0       	rjmp	.+282    	; 0x399c <__vector_7+0xcb0>
    3882:	99 3f       	cpi	r25, 0xF9	; 249
    3884:	08 f4       	brcc	.+2      	; 0x3888 <__vector_7+0xb9c>
    3886:	4f c0       	rjmp	.+158    	; 0x3926 <__vector_7+0xc3a>
    3888:	9f ef       	ldi	r25, 0xFF	; 255
    388a:	90 83       	st	Z, r25
    388c:	9c 91       	ld	r25, X
    388e:	93 30       	cpi	r25, 0x03	; 3
    3890:	08 f0       	brcs	.+2      	; 0x3894 <__vector_7+0xba8>
    3892:	4b c0       	rjmp	.+150    	; 0x392a <__vector_7+0xc3e>
    3894:	1c 92       	st	X, r1
    3896:	db 01       	movw	r26, r22
    3898:	9c 91       	ld	r25, X
    389a:	93 30       	cpi	r25, 0x03	; 3
    389c:	08 f0       	brcs	.+2      	; 0x38a0 <__vector_7+0xbb4>
    389e:	48 c0       	rjmp	.+144    	; 0x3930 <__vector_7+0xc44>
    38a0:	1c 92       	st	X, r1
    38a2:	e1 e0       	ldi	r30, 0x01	; 1
    38a4:	e8 0f       	add	r30, r24
    38a6:	8b 33       	cpi	r24, 0x3B	; 59
    38a8:	08 f0       	brcs	.+2      	; 0x38ac <__vector_7+0xbc0>
    38aa:	e0 e0       	ldi	r30, 0x00	; 0
    38ac:	f0 e0       	ldi	r31, 0x00	; 0
    38ae:	e0 5e       	subi	r30, 0xE0	; 224
    38b0:	fc 4f       	sbci	r31, 0xFC	; 252
    38b2:	90 81       	ld	r25, Z
    38b4:	93 30       	cpi	r25, 0x03	; 3
    38b6:	08 f0       	brcs	.+2      	; 0x38ba <__vector_7+0xbce>
    38b8:	3f c0       	rjmp	.+126    	; 0x3938 <__vector_7+0xc4c>
    38ba:	10 82       	st	Z, r1
    38bc:	8b 33       	cpi	r24, 0x3B	; 59
    38be:	08 f0       	brcs	.+2      	; 0x38c2 <__vector_7+0xbd6>
    38c0:	79 c0       	rjmp	.+242    	; 0x39b4 <__vector_7+0xcc8>
    38c2:	8f 5f       	subi	r24, 0xFF	; 255
    38c4:	80 93 5c 03 	sts	0x035C, r24	; 0x80035c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3c>
    38c8:	4d 30       	cpi	r20, 0x0D	; 13
    38ca:	51 05       	cpc	r21, r1
    38cc:	24 f0       	brlt	.+8      	; 0x38d6 <__vector_7+0xbea>
    38ce:	0e 94 a2 02 	call	0x544	; 0x544 <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.64>
    38d2:	83 30       	cpi	r24, 0x03	; 3
    38d4:	21 f4       	brne	.+8      	; 0x38de <__vector_7+0xbf2>
    38d6:	80 e2       	ldi	r24, 0x20	; 32
    38d8:	93 e0       	ldi	r25, 0x03	; 3
    38da:	0e 94 e7 09 	call	0x13ce	; 0x13ce <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv>
    38de:	8f 81       	ldd	r24, Y+7	; 0x07
    38e0:	81 11       	cpse	r24, r1
    38e2:	53 c1       	rjmp	.+678    	; 0x3b8a <__vector_7+0xe9e>
    38e4:	80 91 1c 03 	lds	r24, 0x031C	; 0x80031c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3c>
    38e8:	8b 33       	cpi	r24, 0x3B	; 59
    38ea:	08 f0       	brcs	.+2      	; 0x38ee <__vector_7+0xc02>
    38ec:	09 c1       	rjmp	.+530    	; 0x3b00 <__vector_7+0xe14>
    38ee:	8f 5f       	subi	r24, 0xFF	; 255
    38f0:	80 93 1c 03 	sts	0x031C, r24	; 0x80031c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3c>
    38f4:	8e 81       	ldd	r24, Y+6	; 0x06
    38f6:	81 11       	cpse	r24, r1
    38f8:	7d c5       	rjmp	.+2810   	; 0x43f4 <__vector_7+0x1708>
    38fa:	0e 94 95 0c 	call	0x192a	; 0x192a <_ZN8Internal7Binning7DecoderIhLj24EE14get_time_valueEv.constprop.67>
    38fe:	84 32       	cpi	r24, 0x24	; 36
    3900:	08 f0       	brcs	.+2      	; 0x3904 <__vector_7+0xc18>
    3902:	04 c1       	rjmp	.+520    	; 0x3b0c <__vector_7+0xe20>
    3904:	0e 94 95 0c 	call	0x192a	; 0x192a <_ZN8Internal7Binning7DecoderIhLj24EE14get_time_valueEv.constprop.67>
    3908:	9d 81       	ldd	r25, Y+5	; 0x05
    390a:	89 17       	cp	r24, r25
    390c:	09 f4       	brne	.+2      	; 0x3910 <__vector_7+0xc24>
    390e:	fe c0       	rjmp	.+508    	; 0x3b0c <__vector_7+0xe20>
    3910:	80 91 80 03 	lds	r24, 0x0380	; 0x800380 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
    3914:	87 31       	cpi	r24, 0x17	; 23
    3916:	08 f0       	brcs	.+2      	; 0x391a <__vector_7+0xc2e>
    3918:	f6 c0       	rjmp	.+492    	; 0x3b06 <__vector_7+0xe1a>
    391a:	8f 5f       	subi	r24, 0xFF	; 255
    391c:	80 93 80 03 	sts	0x0380, r24	; 0x800380 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
    3920:	ec cf       	rjmp	.-40     	; 0x38fa <__vector_7+0xc0e>
    3922:	ab e3       	ldi	r26, 0x3B	; 59
    3924:	97 cf       	rjmp	.-210    	; 0x3854 <__vector_7+0xb68>
    3926:	9a 5f       	subi	r25, 0xFA	; 250
    3928:	b0 cf       	rjmp	.-160    	; 0x388a <__vector_7+0xb9e>
    392a:	92 50       	subi	r25, 0x02	; 2
    392c:	9c 93       	st	X, r25
    392e:	b3 cf       	rjmp	.-154    	; 0x3896 <__vector_7+0xbaa>
    3930:	92 50       	subi	r25, 0x02	; 2
    3932:	fb 01       	movw	r30, r22
    3934:	90 83       	st	Z, r25
    3936:	b5 cf       	rjmp	.-150    	; 0x38a2 <__vector_7+0xbb6>
    3938:	92 50       	subi	r25, 0x02	; 2
    393a:	90 83       	st	Z, r25
    393c:	bf cf       	rjmp	.-130    	; 0x38bc <__vector_7+0xbd0>
    393e:	9c 91       	ld	r25, X
    3940:	9e 3f       	cpi	r25, 0xFE	; 254
    3942:	40 f0       	brcs	.+16     	; 0x3954 <__vector_7+0xc68>
    3944:	9f ef       	ldi	r25, 0xFF	; 255
    3946:	9c 93       	st	X, r25
    3948:	d9 01       	movw	r26, r18
    394a:	9c 91       	ld	r25, X
    394c:	93 30       	cpi	r25, 0x03	; 3
    394e:	20 f4       	brcc	.+8      	; 0x3958 <__vector_7+0xc6c>
    3950:	1c 92       	st	X, r1
    3952:	05 c0       	rjmp	.+10     	; 0x395e <__vector_7+0xc72>
    3954:	9f 5f       	subi	r25, 0xFF	; 255
    3956:	f7 cf       	rjmp	.-18     	; 0x3946 <__vector_7+0xc5a>
    3958:	92 50       	subi	r25, 0x02	; 2
    395a:	f9 01       	movw	r30, r18
    395c:	90 83       	st	Z, r25
    395e:	db 01       	movw	r26, r22
    3960:	9c 91       	ld	r25, X
    3962:	93 30       	cpi	r25, 0x03	; 3
    3964:	88 f0       	brcs	.+34     	; 0x3988 <__vector_7+0xc9c>
    3966:	92 50       	subi	r25, 0x02	; 2
    3968:	fb 01       	movw	r30, r22
    396a:	e7 cf       	rjmp	.-50     	; 0x393a <__vector_7+0xc4e>
    396c:	fb 01       	movw	r30, r22
    396e:	90 81       	ld	r25, Z
    3970:	9e 3f       	cpi	r25, 0xFE	; 254
    3972:	60 f0       	brcs	.+24     	; 0x398c <__vector_7+0xca0>
    3974:	9f ef       	ldi	r25, 0xFF	; 255
    3976:	90 83       	st	Z, r25
    3978:	f9 01       	movw	r30, r18
    397a:	90 81       	ld	r25, Z
    397c:	93 30       	cpi	r25, 0x03	; 3
    397e:	40 f4       	brcc	.+16     	; 0x3990 <__vector_7+0xca4>
    3980:	10 82       	st	Z, r1
    3982:	9c 91       	ld	r25, X
    3984:	93 30       	cpi	r25, 0x03	; 3
    3986:	38 f4       	brcc	.+14     	; 0x3996 <__vector_7+0xcaa>
    3988:	1c 92       	st	X, r1
    398a:	98 cf       	rjmp	.-208    	; 0x38bc <__vector_7+0xbd0>
    398c:	9f 5f       	subi	r25, 0xFF	; 255
    398e:	f3 cf       	rjmp	.-26     	; 0x3976 <__vector_7+0xc8a>
    3990:	92 50       	subi	r25, 0x02	; 2
    3992:	90 83       	st	Z, r25
    3994:	f6 cf       	rjmp	.-20     	; 0x3982 <__vector_7+0xc96>
    3996:	92 50       	subi	r25, 0x02	; 2
    3998:	9c 93       	st	X, r25
    399a:	90 cf       	rjmp	.-224    	; 0x38bc <__vector_7+0xbd0>
    399c:	93 30       	cpi	r25, 0x03	; 3
    399e:	38 f4       	brcc	.+14     	; 0x39ae <__vector_7+0xcc2>
    39a0:	10 82       	st	Z, r1
    39a2:	9c 91       	ld	r25, X
    39a4:	93 30       	cpi	r25, 0x03	; 3
    39a6:	a0 f2       	brcs	.-88     	; 0x3950 <__vector_7+0xc64>
    39a8:	92 50       	subi	r25, 0x02	; 2
    39aa:	9c 93       	st	X, r25
    39ac:	d8 cf       	rjmp	.-80     	; 0x395e <__vector_7+0xc72>
    39ae:	92 50       	subi	r25, 0x02	; 2
    39b0:	90 83       	st	Z, r25
    39b2:	f7 cf       	rjmp	.-18     	; 0x39a2 <__vector_7+0xcb6>
    39b4:	80 e0       	ldi	r24, 0x00	; 0
    39b6:	86 cf       	rjmp	.-244    	; 0x38c4 <__vector_7+0xbd8>
    39b8:	4d 30       	cpi	r20, 0x0D	; 13
    39ba:	51 05       	cpc	r21, r1
    39bc:	24 f0       	brlt	.+8      	; 0x39c6 <__vector_7+0xcda>
    39be:	0e 94 a2 02 	call	0x544	; 0x544 <_ZN8Internal20DCF77_Second_Decoder14get_time_valueEv.constprop.64>
    39c2:	83 30       	cpi	r24, 0x03	; 3
    39c4:	01 f5       	brne	.+64     	; 0x3a06 <__vector_7+0xd1a>
    39c6:	80 e2       	ldi	r24, 0x20	; 32
    39c8:	93 e0       	ldi	r25, 0x03	; 3
    39ca:	0e 94 e7 09 	call	0x13ce	; 0x13ce <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv>
    39ce:	80 91 5e 03 	lds	r24, 0x035E	; 0x80035e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3e>
    39d2:	8e 3c       	cpi	r24, 0xCE	; 206
    39d4:	a0 f0       	brcs	.+40     	; 0x39fe <__vector_7+0xd12>
    39d6:	e0 e2       	ldi	r30, 0x20	; 32
    39d8:	f3 e0       	ldi	r31, 0x03	; 3
    39da:	90 81       	ld	r25, Z
    39dc:	93 33       	cpi	r25, 0x33	; 51
    39de:	88 f5       	brcc	.+98     	; 0x3a42 <__vector_7+0xd56>
    39e0:	10 82       	st	Z, r1
    39e2:	31 96       	adiw	r30, 0x01	; 1
    39e4:	23 e0       	ldi	r18, 0x03	; 3
    39e6:	ec 35       	cpi	r30, 0x5C	; 92
    39e8:	f2 07       	cpc	r31, r18
    39ea:	b9 f7       	brne	.-18     	; 0x39da <__vector_7+0xcee>
    39ec:	82 53       	subi	r24, 0x32	; 50
    39ee:	80 93 5e 03 	sts	0x035E, r24	; 0x80035e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3e>
    39f2:	80 91 5d 03 	lds	r24, 0x035D	; 0x80035d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3d>
    39f6:	83 33       	cpi	r24, 0x33	; 51
    39f8:	38 f5       	brcc	.+78     	; 0x3a48 <__vector_7+0xd5c>
    39fa:	10 92 5d 03 	sts	0x035D, r1	; 0x80035d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3d>
    39fe:	80 91 66 03 	lds	r24, 0x0366	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    3a02:	80 93 67 03 	sts	0x0367, r24	; 0x800367 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x47>
    3a06:	30 91 5c 03 	lds	r19, 0x035C	; 0x80035c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3c>
    3a0a:	01 11       	cpse	r16, r1
    3a0c:	23 c0       	rjmp	.+70     	; 0x3a54 <__vector_7+0xd68>
    3a0e:	e3 2f       	mov	r30, r19
    3a10:	f0 e0       	ldi	r31, 0x00	; 0
    3a12:	e0 5e       	subi	r30, 0xE0	; 224
    3a14:	fc 4f       	sbci	r31, 0xFC	; 252
    3a16:	80 81       	ld	r24, Z
    3a18:	89 3f       	cpi	r24, 0xF9	; 249
    3a1a:	d0 f0       	brcs	.+52     	; 0x3a50 <__vector_7+0xd64>
    3a1c:	8f ef       	ldi	r24, 0xFF	; 255
    3a1e:	80 83       	st	Z, r24
    3a20:	80 91 5f 03 	lds	r24, 0x035F	; 0x80035f <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3f>
    3a24:	38 13       	cpse	r19, r24
    3a26:	05 c0       	rjmp	.+10     	; 0x3a32 <__vector_7+0xd46>
    3a28:	80 91 66 03 	lds	r24, 0x0366	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    3a2c:	8a 5f       	subi	r24, 0xFA	; 250
    3a2e:	80 93 66 03 	sts	0x0366, r24	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    3a32:	81 e0       	ldi	r24, 0x01	; 1
    3a34:	83 0f       	add	r24, r19
    3a36:	3b 33       	cpi	r19, 0x3B	; 59
    3a38:	08 f0       	brcs	.+2      	; 0x3a3c <__vector_7+0xd50>
    3a3a:	80 e0       	ldi	r24, 0x00	; 0
    3a3c:	80 93 5c 03 	sts	0x035C, r24	; 0x80035c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3c>
    3a40:	4e cf       	rjmp	.-356    	; 0x38de <__vector_7+0xbf2>
    3a42:	92 53       	subi	r25, 0x32	; 50
    3a44:	90 83       	st	Z, r25
    3a46:	cd cf       	rjmp	.-102    	; 0x39e2 <__vector_7+0xcf6>
    3a48:	82 53       	subi	r24, 0x32	; 50
    3a4a:	80 93 5d 03 	sts	0x035D, r24	; 0x80035d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3d>
    3a4e:	d7 cf       	rjmp	.-82     	; 0x39fe <__vector_7+0xd12>
    3a50:	8a 5f       	subi	r24, 0xFA	; 250
    3a52:	e5 cf       	rjmp	.-54     	; 0x3a1e <__vector_7+0xd32>
    3a54:	8e ef       	ldi	r24, 0xFE	; 254
    3a56:	80 0f       	add	r24, r16
    3a58:	82 30       	cpi	r24, 0x02	; 2
    3a5a:	58 f7       	brcc	.-42     	; 0x3a32 <__vector_7+0xd46>
    3a5c:	11 e0       	ldi	r17, 0x01	; 1
    3a5e:	03 30       	cpi	r16, 0x03	; 3
    3a60:	09 f0       	breq	.+2      	; 0x3a64 <__vector_7+0xd78>
    3a62:	10 e0       	ldi	r17, 0x00	; 0
    3a64:	8f ef       	ldi	r24, 0xFF	; 255
    3a66:	83 0f       	add	r24, r19
    3a68:	31 11       	cpse	r19, r1
    3a6a:	01 c0       	rjmp	.+2      	; 0x3a6e <__vector_7+0xd82>
    3a6c:	8b e3       	ldi	r24, 0x3B	; 59
    3a6e:	e8 2f       	mov	r30, r24
    3a70:	f0 e0       	ldi	r31, 0x00	; 0
    3a72:	21 e0       	ldi	r18, 0x01	; 1
    3a74:	03 30       	cpi	r16, 0x03	; 3
    3a76:	09 f4       	brne	.+2      	; 0x3a7a <__vector_7+0xd8e>
    3a78:	20 e0       	ldi	r18, 0x00	; 0
    3a7a:	e0 5e       	subi	r30, 0xE0	; 224
    3a7c:	fc 4f       	sbci	r31, 0xFC	; 252
    3a7e:	90 81       	ld	r25, Z
    3a80:	92 0f       	add	r25, r18
    3a82:	90 83       	st	Z, r25
    3a84:	f0 90 5f 03 	lds	r15, 0x035F	; 0x80035f <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x3f>
    3a88:	8f 11       	cpse	r24, r15
    3a8a:	05 c0       	rjmp	.+10     	; 0x3a96 <__vector_7+0xdaa>
    3a8c:	90 91 66 03 	lds	r25, 0x0366	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    3a90:	92 0f       	add	r25, r18
    3a92:	90 93 66 03 	sts	0x0366, r25	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    3a96:	80 31       	cpi	r24, 0x10	; 16
    3a98:	28 f1       	brcs	.+74     	; 0x3ae4 <__vector_7+0xdf8>
    3a9a:	80 51       	subi	r24, 0x10	; 16
    3a9c:	90 91 60 03 	lds	r25, 0x0360	; 0x800360 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x40>
    3aa0:	96 95       	lsr	r25
    3aa2:	96 95       	lsr	r25
    3aa4:	96 95       	lsr	r25
    3aa6:	a1 e6       	ldi	r26, 0x61	; 97
    3aa8:	b3 e0       	ldi	r27, 0x03	; 3
    3aaa:	23 e0       	ldi	r18, 0x03	; 3
    3aac:	40 e0       	ldi	r20, 0x00	; 0
    3aae:	50 91 66 03 	lds	r21, 0x0366	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    3ab2:	e8 2f       	mov	r30, r24
    3ab4:	f0 e0       	ldi	r31, 0x00	; 0
    3ab6:	61 e0       	ldi	r22, 0x01	; 1
    3ab8:	79 2f       	mov	r23, r25
    3aba:	71 70       	andi	r23, 0x01	; 1
    3abc:	71 13       	cpse	r23, r17
    3abe:	60 e0       	ldi	r22, 0x00	; 0
    3ac0:	e0 5e       	subi	r30, 0xE0	; 224
    3ac2:	fc 4f       	sbci	r31, 0xFC	; 252
    3ac4:	70 81       	ld	r23, Z
    3ac6:	76 0f       	add	r23, r22
    3ac8:	70 83       	st	Z, r23
    3aca:	f8 12       	cpse	r15, r24
    3acc:	01 c0       	rjmp	.+2      	; 0x3ad0 <__vector_7+0xde4>
    3ace:	56 0f       	add	r21, r22
    3ad0:	88 23       	and	r24, r24
    3ad2:	a1 f0       	breq	.+40     	; 0x3afc <__vector_7+0xe10>
    3ad4:	81 50       	subi	r24, 0x01	; 1
    3ad6:	96 95       	lsr	r25
    3ad8:	2f 5f       	subi	r18, 0xFF	; 255
    3ada:	45 30       	cpi	r20, 0x05	; 5
    3adc:	29 f4       	brne	.+10     	; 0x3ae8 <__vector_7+0xdfc>
    3ade:	26 30       	cpi	r18, 0x06	; 6
    3ae0:	40 f3       	brcs	.-48     	; 0x3ab2 <__vector_7+0xdc6>
    3ae2:	04 c0       	rjmp	.+8      	; 0x3aec <__vector_7+0xe00>
    3ae4:	84 5d       	subi	r24, 0xD4	; 212
    3ae6:	da cf       	rjmp	.-76     	; 0x3a9c <__vector_7+0xdb0>
    3ae8:	28 30       	cpi	r18, 0x08	; 8
    3aea:	19 f7       	brne	.-58     	; 0x3ab2 <__vector_7+0xdc6>
    3aec:	50 93 66 03 	sts	0x0366, r21	; 0x800366 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Second_DecoderE+0x46>
    3af0:	4f 5f       	subi	r20, 0xFF	; 255
    3af2:	9d 91       	ld	r25, X+
    3af4:	20 e0       	ldi	r18, 0x00	; 0
    3af6:	46 30       	cpi	r20, 0x06	; 6
    3af8:	d1 f6       	brne	.-76     	; 0x3aae <__vector_7+0xdc2>
    3afa:	9b cf       	rjmp	.-202    	; 0x3a32 <__vector_7+0xd46>
    3afc:	8b e3       	ldi	r24, 0x3B	; 59
    3afe:	eb cf       	rjmp	.-42     	; 0x3ad6 <__vector_7+0xdea>
    3b00:	10 92 1c 03 	sts	0x031C, r1	; 0x80031c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3c>
    3b04:	f7 ce       	rjmp	.-530    	; 0x38f4 <__vector_7+0xc08>
    3b06:	10 92 80 03 	sts	0x0380, r1	; 0x800380 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
    3b0a:	f7 ce       	rjmp	.-530    	; 0x38fa <__vector_7+0xc0e>
    3b0c:	8d 81       	ldd	r24, Y+5	; 0x05
    3b0e:	81 11       	cpse	r24, r1
    3b10:	3c c0       	rjmp	.+120    	; 0x3b8a <__vector_7+0xe9e>
    3b12:	0e 94 7c 0c 	call	0x18f8	; 0x18f8 <_ZN8Internal7Binning7DecoderIhLj7EE14get_time_valueEv.constprop.70>
    3b16:	88 30       	cpi	r24, 0x08	; 8
    3b18:	40 f4       	brcc	.+16     	; 0x3b2a <__vector_7+0xe3e>
    3b1a:	80 91 8b 03 	lds	r24, 0x038B	; 0x80038b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
    3b1e:	86 30       	cpi	r24, 0x06	; 6
    3b20:	08 f0       	brcs	.+2      	; 0x3b24 <__vector_7+0xe38>
    3b22:	87 c0       	rjmp	.+270    	; 0x3c32 <__vector_7+0xf46>
    3b24:	8f 5f       	subi	r24, 0xFF	; 255
    3b26:	80 93 8b 03 	sts	0x038B, r24	; 0x80038b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
    3b2a:	0e 94 63 0c 	call	0x18c6	; 0x18c6 <_ZN8Internal7Binning7DecoderIhLj31EE14get_time_valueEv.constprop.73>
    3b2e:	82 33       	cpi	r24, 0x32	; 50
    3b30:	08 f4       	brcc	.+2      	; 0x3b34 <__vector_7+0xe48>
    3b32:	82 c0       	rjmp	.+260    	; 0x3c38 <__vector_7+0xf4c>
    3b34:	8b 81       	ldd	r24, Y+3	; 0x03
    3b36:	81 30       	cpi	r24, 0x01	; 1
    3b38:	41 f5       	brne	.+80     	; 0x3b8a <__vector_7+0xe9e>
    3b3a:	0e 94 4a 0c 	call	0x1894	; 0x1894 <_ZN8Internal7Binning7DecoderIhLj12EE14get_time_valueEv.constprop.76>
    3b3e:	83 31       	cpi	r24, 0x13	; 19
    3b40:	40 f4       	brcc	.+16     	; 0x3b52 <__vector_7+0xe66>
    3b42:	80 91 be 03 	lds	r24, 0x03BE	; 0x8003be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
    3b46:	8b 30       	cpi	r24, 0x0B	; 11
    3b48:	08 f0       	brcs	.+2      	; 0x3b4c <__vector_7+0xe60>
    3b4a:	87 c0       	rjmp	.+270    	; 0x3c5a <__vector_7+0xf6e>
    3b4c:	8f 5f       	subi	r24, 0xFF	; 255
    3b4e:	80 93 be 03 	sts	0x03BE, r24	; 0x8003be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
    3b52:	8a 81       	ldd	r24, Y+2	; 0x02
    3b54:	81 30       	cpi	r24, 0x01	; 1
    3b56:	c9 f4       	brne	.+50     	; 0x3b8a <__vector_7+0xe9e>
    3b58:	89 81       	ldd	r24, Y+1	; 0x01
    3b5a:	8a 39       	cpi	r24, 0x9A	; 154
    3b5c:	b0 f4       	brcc	.+44     	; 0x3b8a <__vector_7+0xe9e>
    3b5e:	80 91 cc 03 	lds	r24, 0x03CC	; 0x8003cc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xa>
    3b62:	89 30       	cpi	r24, 0x09	; 9
    3b64:	08 f0       	brcs	.+2      	; 0x3b68 <__vector_7+0xe7c>
    3b66:	7c c0       	rjmp	.+248    	; 0x3c60 <__vector_7+0xf74>
    3b68:	8f 5f       	subi	r24, 0xFF	; 255
    3b6a:	80 93 cc 03 	sts	0x03CC, r24	; 0x8003cc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xa>
    3b6e:	82 ec       	ldi	r24, 0xC2	; 194
    3b70:	93 e0       	ldi	r25, 0x03	; 3
    3b72:	0e 94 c5 0c 	call	0x198a	; 0x198a <_ZN8Internal7Binning7DecoderIhLj10EE14get_time_valueEv>
    3b76:	81 11       	cpse	r24, r1
    3b78:	08 c0       	rjmp	.+16     	; 0x3b8a <__vector_7+0xe9e>
    3b7a:	80 91 da 03 	lds	r24, 0x03DA	; 0x8003da <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x18>
    3b7e:	89 30       	cpi	r24, 0x09	; 9
    3b80:	08 f0       	brcs	.+2      	; 0x3b84 <__vector_7+0xe98>
    3b82:	71 c0       	rjmp	.+226    	; 0x3c66 <__vector_7+0xf7a>
    3b84:	8f 5f       	subi	r24, 0xFF	; 255
    3b86:	80 93 da 03 	sts	0x03DA, r24	; 0x8003da <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x18>
    3b8a:	11 e0       	ldi	r17, 0x01	; 1
    3b8c:	03 30       	cpi	r16, 0x03	; 3
    3b8e:	21 f0       	breq	.+8      	; 0x3b98 <__vector_7+0xeac>
    3b90:	11 e0       	ldi	r17, 0x01	; 1
    3b92:	01 30       	cpi	r16, 0x01	; 1
    3b94:	09 f0       	breq	.+2      	; 0x3b98 <__vector_7+0xeac>
    3b96:	10 e0       	ldi	r17, 0x00	; 0
    3b98:	8f 81       	ldd	r24, Y+7	; 0x07
    3b9a:	85 31       	cpi	r24, 0x15	; 21
    3b9c:	60 f0       	brcs	.+24     	; 0x3bb6 <__vector_7+0xeca>
    3b9e:	4b ee       	ldi	r20, 0xEB	; 235
    3ba0:	b4 2e       	mov	r11, r20
    3ba2:	b8 0e       	add	r11, r24
    3ba4:	38 e0       	ldi	r19, 0x08	; 8
    3ba6:	3b 15       	cp	r19, r11
    3ba8:	30 f0       	brcs	.+12     	; 0x3bb6 <__vector_7+0xeca>
    3baa:	b3 12       	cpse	r11, r19
    3bac:	5f c0       	rjmp	.+190    	; 0x3c6c <__vector_7+0xf80>
    3bae:	80 ee       	ldi	r24, 0xE0	; 224
    3bb0:	92 e0       	ldi	r25, 0x02	; 2
    3bb2:	0e 94 e7 09 	call	0x13ce	; 0x13ce <_ZN8Internal7Binning7DecoderIhLj60EE17compute_max_indexEv>
    3bb6:	80 ee       	ldi	r24, 0xE0	; 224
    3bb8:	92 e0       	ldi	r25, 0x02	; 2
    3bba:	0e 94 68 09 	call	0x12d0	; 0x12d0 <_ZN8Internal7Binning6bins_tIhhLj60EE18get_quality_factorEv>
    3bbe:	88 23       	and	r24, r24
    3bc0:	09 f4       	brne	.+2      	; 0x3bc4 <__vector_7+0xed8>
    3bc2:	d8 ca       	rjmp	.-2640   	; 0x3174 <__vector_7+0x488>
    3bc4:	8f 81       	ldd	r24, Y+7	; 0x07
    3bc6:	81 31       	cpi	r24, 0x11	; 17
    3bc8:	09 f4       	brne	.+2      	; 0x3bcc <__vector_7+0xee0>
    3bca:	c2 c0       	rjmp	.+388    	; 0x3d50 <__vector_7+0x1064>
    3bcc:	08 f0       	brcs	.+2      	; 0x3bd0 <__vector_7+0xee4>
    3bce:	ab c0       	rjmp	.+342    	; 0x3d26 <__vector_7+0x103a>
    3bd0:	8f 30       	cpi	r24, 0x0F	; 15
    3bd2:	09 f4       	brne	.+2      	; 0x3bd6 <__vector_7+0xeea>
    3bd4:	b3 c0       	rjmp	.+358    	; 0x3d3c <__vector_7+0x1050>
    3bd6:	80 31       	cpi	r24, 0x10	; 16
    3bd8:	09 f4       	brne	.+2      	; 0x3bdc <__vector_7+0xef0>
    3bda:	b3 c0       	rjmp	.+358    	; 0x3d42 <__vector_7+0x1056>
    3bdc:	8f 81       	ldd	r24, Y+7	; 0x07
    3bde:	8d 31       	cpi	r24, 0x1D	; 29
    3be0:	08 f4       	brcc	.+2      	; 0x3be4 <__vector_7+0xef8>
    3be2:	19 c1       	rjmp	.+562    	; 0x3e16 <__vector_7+0x112a>
    3be4:	23 ee       	ldi	r18, 0xE3	; 227
    3be6:	d2 2e       	mov	r13, r18
    3be8:	d8 0e       	add	r13, r24
    3bea:	e7 e0       	ldi	r30, 0x07	; 7
    3bec:	ed 15       	cp	r30, r13
    3bee:	08 f4       	brcc	.+2      	; 0x3bf2 <__vector_7+0xf06>
    3bf0:	12 c1       	rjmp	.+548    	; 0x3e16 <__vector_7+0x112a>
    3bf2:	de 12       	cpse	r13, r30
    3bf4:	be c0       	rjmp	.+380    	; 0x3d72 <__vector_7+0x1086>
    3bf6:	10 92 81 03 	sts	0x0381, r1	; 0x800381 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x19>
    3bfa:	10 92 82 03 	sts	0x0382, r1	; 0x800382 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1a>
    3bfe:	89 e1       	ldi	r24, 0x19	; 25
    3c00:	80 93 83 03 	sts	0x0383, r24	; 0x800383 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1b>
    3c04:	e8 e6       	ldi	r30, 0x68	; 104
    3c06:	f3 e0       	ldi	r31, 0x03	; 3
    3c08:	49 e1       	ldi	r20, 0x19	; 25
    3c0a:	80 e0       	ldi	r24, 0x00	; 0
    3c0c:	90 e0       	ldi	r25, 0x00	; 0
    3c0e:	20 e0       	ldi	r18, 0x00	; 0
    3c10:	31 91       	ld	r19, Z+
    3c12:	38 17       	cp	r19, r24
    3c14:	08 f0       	brcs	.+2      	; 0x3c18 <__vector_7+0xf2c>
    3c16:	a9 c0       	rjmp	.+338    	; 0x3d6a <__vector_7+0x107e>
    3c18:	93 17       	cp	r25, r19
    3c1a:	08 f4       	brcc	.+2      	; 0x3c1e <__vector_7+0xf32>
    3c1c:	93 2f       	mov	r25, r19
    3c1e:	2f 5f       	subi	r18, 0xFF	; 255
    3c20:	28 31       	cpi	r18, 0x18	; 24
    3c22:	b1 f7       	brne	.-20     	; 0x3c10 <__vector_7+0xf24>
    3c24:	90 93 81 03 	sts	0x0381, r25	; 0x800381 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x19>
    3c28:	80 93 82 03 	sts	0x0382, r24	; 0x800382 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1a>
    3c2c:	40 93 83 03 	sts	0x0383, r20	; 0x800383 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x1b>
    3c30:	f2 c0       	rjmp	.+484    	; 0x3e16 <__vector_7+0x112a>
    3c32:	10 92 8b 03 	sts	0x038B, r1	; 0x80038b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
    3c36:	79 cf       	rjmp	.-270    	; 0x3b2a <__vector_7+0xe3e>
    3c38:	0e 94 63 0c 	call	0x18c6	; 0x18c6 <_ZN8Internal7Binning7DecoderIhLj31EE14get_time_valueEv.constprop.73>
    3c3c:	9b 81       	ldd	r25, Y+3	; 0x03
    3c3e:	89 17       	cp	r24, r25
    3c40:	09 f4       	brne	.+2      	; 0x3c44 <__vector_7+0xf58>
    3c42:	78 cf       	rjmp	.-272    	; 0x3b34 <__vector_7+0xe48>
    3c44:	80 91 ae 03 	lds	r24, 0x03AE	; 0x8003ae <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
    3c48:	8e 31       	cpi	r24, 0x1E	; 30
    3c4a:	20 f4       	brcc	.+8      	; 0x3c54 <__vector_7+0xf68>
    3c4c:	8f 5f       	subi	r24, 0xFF	; 255
    3c4e:	80 93 ae 03 	sts	0x03AE, r24	; 0x8003ae <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
    3c52:	6b cf       	rjmp	.-298    	; 0x3b2a <__vector_7+0xe3e>
    3c54:	10 92 ae 03 	sts	0x03AE, r1	; 0x8003ae <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
    3c58:	68 cf       	rjmp	.-304    	; 0x3b2a <__vector_7+0xe3e>
    3c5a:	10 92 be 03 	sts	0x03BE, r1	; 0x8003be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
    3c5e:	79 cf       	rjmp	.-270    	; 0x3b52 <__vector_7+0xe66>
    3c60:	10 92 cc 03 	sts	0x03CC, r1	; 0x8003cc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xa>
    3c64:	84 cf       	rjmp	.-248    	; 0x3b6e <__vector_7+0xe82>
    3c66:	10 92 da 03 	sts	0x03DA, r1	; 0x8003da <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x18>
    3c6a:	8f cf       	rjmp	.-226    	; 0x3b8a <__vector_7+0xe9e>
    3c6c:	19 86       	std	Y+9, r1	; 0x09
    3c6e:	80 91 1c 03 	lds	r24, 0x031C	; 0x80031c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE14Minute_DecoderE+0x3c>
    3c72:	0b e3       	ldi	r16, 0x3B	; 59
    3c74:	08 1b       	sub	r16, r24
    3c76:	3c e3       	ldi	r19, 0x3C	; 60
    3c78:	a3 2e       	mov	r10, r19
    3c7a:	cc 24       	eor	r12, r12
    3c7c:	ca 94       	dec	r12
    3c7e:	d1 2c       	mov	r13, r1
    3c80:	80 2f       	mov	r24, r16
    3c82:	90 e0       	ldi	r25, 0x00	; 0
    3c84:	dc 01       	movw	r26, r24
    3c86:	a0 52       	subi	r26, 0x20	; 32
    3c88:	bd 4f       	sbci	r27, 0xFD	; 253
    3c8a:	7d 01       	movw	r14, r26
    3c8c:	89 85       	ldd	r24, Y+9	; 0x09
    3c8e:	b7 e0       	ldi	r27, 0x07	; 7
    3c90:	bb 16       	cp	r11, r27
    3c92:	e9 f1       	breq	.+122    	; 0x3d0e <__vector_7+0x1022>
    3c94:	48 2f       	mov	r20, r24
    3c96:	50 e0       	ldi	r21, 0x00	; 0
    3c98:	0b 2c       	mov	r0, r11
    3c9a:	02 c0       	rjmp	.+4      	; 0x3ca0 <__vector_7+0xfb4>
    3c9c:	55 95       	asr	r21
    3c9e:	47 95       	ror	r20
    3ca0:	0a 94       	dec	r0
    3ca2:	e2 f7       	brpl	.-8      	; 0x3c9c <__vector_7+0xfb0>
    3ca4:	41 70       	andi	r20, 0x01	; 1
    3ca6:	61 2f       	mov	r22, r17
    3ca8:	c7 01       	movw	r24, r14
    3caa:	0e 94 dc 09 	call	0x13b8	; 0x13b8 <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    3cae:	f7 01       	movw	r30, r14
    3cb0:	80 81       	ld	r24, Z
    3cb2:	d8 16       	cp	r13, r24
    3cb4:	08 f4       	brcc	.+2      	; 0x3cb8 <__vector_7+0xfcc>
    3cb6:	d8 2e       	mov	r13, r24
    3cb8:	8c 15       	cp	r24, r12
    3cba:	08 f4       	brcc	.+2      	; 0x3cbe <__vector_7+0xfd2>
    3cbc:	c8 2e       	mov	r12, r24
    3cbe:	0b 33       	cpi	r16, 0x3B	; 59
    3cc0:	68 f5       	brcc	.+90     	; 0x3d1c <__vector_7+0x1030>
    3cc2:	0f 5f       	subi	r16, 0xFF	; 255
    3cc4:	ce 01       	movw	r24, r28
    3cc6:	09 96       	adiw	r24, 0x09	; 9
    3cc8:	0e 94 29 0d 	call	0x1a52	; 0x1a52 <_ZN3BCD9incrementERNS_5bcd_tE>
    3ccc:	aa 94       	dec	r10
    3cce:	a1 10       	cpse	r10, r1
    3cd0:	d7 cf       	rjmp	.-82     	; 0x3c80 <__vector_7+0xf94>
    3cd2:	e0 ee       	ldi	r30, 0xE0	; 224
    3cd4:	f2 e0       	ldi	r31, 0x02	; 2
    3cd6:	2c e1       	ldi	r18, 0x1C	; 28
    3cd8:	33 e0       	ldi	r19, 0x03	; 3
    3cda:	bf 01       	movw	r22, r30
    3cdc:	db 01       	movw	r26, r22
    3cde:	8d 91       	ld	r24, X+
    3ce0:	bd 01       	movw	r22, r26
    3ce2:	ad 01       	movw	r20, r26
    3ce4:	41 50       	subi	r20, 0x01	; 1
    3ce6:	51 09       	sbc	r21, r1
    3ce8:	8c 19       	sub	r24, r12
    3cea:	da 01       	movw	r26, r20
    3cec:	8c 93       	st	X, r24
    3cee:	26 17       	cp	r18, r22
    3cf0:	37 07       	cpc	r19, r23
    3cf2:	a1 f7       	brne	.-24     	; 0x3cdc <__vector_7+0xff0>
    3cf4:	b6 ef       	ldi	r27, 0xF6	; 246
    3cf6:	bd 15       	cp	r27, r13
    3cf8:	08 f0       	brcs	.+2      	; 0x3cfc <__vector_7+0x1010>
    3cfa:	5d cf       	rjmp	.-326    	; 0x3bb6 <__vector_7+0xeca>
    3cfc:	80 81       	ld	r24, Z
    3cfe:	89 30       	cpi	r24, 0x09	; 9
    3d00:	78 f4       	brcc	.+30     	; 0x3d20 <__vector_7+0x1034>
    3d02:	10 82       	st	Z, r1
    3d04:	31 96       	adiw	r30, 0x01	; 1
    3d06:	6e 17       	cp	r22, r30
    3d08:	7f 07       	cpc	r23, r31
    3d0a:	c1 f7       	brne	.-16     	; 0x3cfc <__vector_7+0x1010>
    3d0c:	54 cf       	rjmp	.-344    	; 0x3bb6 <__vector_7+0xeca>
    3d0e:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZN8Internal16Arithmetic_Tools6parityEh>
    3d12:	41 e0       	ldi	r20, 0x01	; 1
    3d14:	81 11       	cpse	r24, r1
    3d16:	c7 cf       	rjmp	.-114    	; 0x3ca6 <__vector_7+0xfba>
    3d18:	40 e0       	ldi	r20, 0x00	; 0
    3d1a:	c5 cf       	rjmp	.-118    	; 0x3ca6 <__vector_7+0xfba>
    3d1c:	00 e0       	ldi	r16, 0x00	; 0
    3d1e:	d2 cf       	rjmp	.-92     	; 0x3cc4 <__vector_7+0xfd8>
    3d20:	88 50       	subi	r24, 0x08	; 8
    3d22:	80 83       	st	Z, r24
    3d24:	ef cf       	rjmp	.-34     	; 0x3d04 <__vector_7+0x1018>
    3d26:	83 31       	cpi	r24, 0x13	; 19
    3d28:	d9 f0       	breq	.+54     	; 0x3d60 <__vector_7+0x1074>
    3d2a:	b8 f0       	brcs	.+46     	; 0x3d5a <__vector_7+0x106e>
    3d2c:	8a 33       	cpi	r24, 0x3A	; 58
    3d2e:	09 f0       	breq	.+2      	; 0x3d32 <__vector_7+0x1046>
    3d30:	55 cf       	rjmp	.-342    	; 0x3bdc <__vector_7+0xef0>
    3d32:	61 2f       	mov	r22, r17
    3d34:	61 70       	andi	r22, 0x01	; 1
    3d36:	87 e6       	ldi	r24, 0x67	; 103
    3d38:	92 e0       	ldi	r25, 0x02	; 2
    3d3a:	07 c0       	rjmp	.+14     	; 0x3d4a <__vector_7+0x105e>
    3d3c:	10 93 63 02 	sts	0x0263, r17	; 0x800263 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Flag_DecoderE>
    3d40:	4d cf       	rjmp	.-358    	; 0x3bdc <__vector_7+0xef0>
    3d42:	61 2f       	mov	r22, r17
    3d44:	61 70       	andi	r22, 0x01	; 1
    3d46:	84 e6       	ldi	r24, 0x64	; 100
    3d48:	92 e0       	ldi	r25, 0x02	; 2
    3d4a:	0e 94 1d 0c 	call	0x183a	; 0x183a <_ZN8Internal18DCF77_Flag_Decoder9cummulateERab>
    3d4e:	46 cf       	rjmp	.-372    	; 0x3bdc <__vector_7+0xef0>
    3d50:	61 2f       	mov	r22, r17
    3d52:	61 70       	andi	r22, 0x01	; 1
    3d54:	85 e6       	ldi	r24, 0x65	; 101
    3d56:	92 e0       	ldi	r25, 0x02	; 2
    3d58:	f8 cf       	rjmp	.-16     	; 0x3d4a <__vector_7+0x105e>
    3d5a:	61 e0       	ldi	r22, 0x01	; 1
    3d5c:	61 27       	eor	r22, r17
    3d5e:	fa cf       	rjmp	.-12     	; 0x3d54 <__vector_7+0x1068>
    3d60:	61 2f       	mov	r22, r17
    3d62:	61 70       	andi	r22, 0x01	; 1
    3d64:	86 e6       	ldi	r24, 0x66	; 102
    3d66:	92 e0       	ldi	r25, 0x02	; 2
    3d68:	f0 cf       	rjmp	.-32     	; 0x3d4a <__vector_7+0x105e>
    3d6a:	42 2f       	mov	r20, r18
    3d6c:	98 2f       	mov	r25, r24
    3d6e:	83 2f       	mov	r24, r19
    3d70:	56 cf       	rjmp	.-340    	; 0x3c1e <__vector_7+0xf32>
    3d72:	19 86       	std	Y+9, r1	; 0x09
    3d74:	80 91 80 03 	lds	r24, 0x0380	; 0x800380 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Hour_DecoderE+0x18>
    3d78:	07 e1       	ldi	r16, 0x17	; 23
    3d7a:	08 1b       	sub	r16, r24
    3d7c:	98 e1       	ldi	r25, 0x18	; 24
    3d7e:	a9 2e       	mov	r10, r25
    3d80:	bb 24       	eor	r11, r11
    3d82:	ba 94       	dec	r11
    3d84:	c1 2c       	mov	r12, r1
    3d86:	80 2f       	mov	r24, r16
    3d88:	90 e0       	ldi	r25, 0x00	; 0
    3d8a:	9c 01       	movw	r18, r24
    3d8c:	28 59       	subi	r18, 0x98	; 152
    3d8e:	3c 4f       	sbci	r19, 0xFC	; 252
    3d90:	79 01       	movw	r14, r18
    3d92:	89 85       	ldd	r24, Y+9	; 0x09
    3d94:	36 e0       	ldi	r19, 0x06	; 6
    3d96:	d3 16       	cp	r13, r19
    3d98:	09 f4       	brne	.+2      	; 0x3d9c <__vector_7+0x10b0>
    3d9a:	67 c0       	rjmp	.+206    	; 0x3e6a <__vector_7+0x117e>
    3d9c:	48 2f       	mov	r20, r24
    3d9e:	50 e0       	ldi	r21, 0x00	; 0
    3da0:	0d 2c       	mov	r0, r13
    3da2:	02 c0       	rjmp	.+4      	; 0x3da8 <__vector_7+0x10bc>
    3da4:	55 95       	asr	r21
    3da6:	47 95       	ror	r20
    3da8:	0a 94       	dec	r0
    3daa:	e2 f7       	brpl	.-8      	; 0x3da4 <__vector_7+0x10b8>
    3dac:	41 70       	andi	r20, 0x01	; 1
    3dae:	61 2f       	mov	r22, r17
    3db0:	c7 01       	movw	r24, r14
    3db2:	0e 94 dc 09 	call	0x13b8	; 0x13b8 <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    3db6:	d7 01       	movw	r26, r14
    3db8:	8c 91       	ld	r24, X
    3dba:	c8 16       	cp	r12, r24
    3dbc:	08 f4       	brcc	.+2      	; 0x3dc0 <__vector_7+0x10d4>
    3dbe:	c8 2e       	mov	r12, r24
    3dc0:	8b 15       	cp	r24, r11
    3dc2:	08 f4       	brcc	.+2      	; 0x3dc6 <__vector_7+0x10da>
    3dc4:	b8 2e       	mov	r11, r24
    3dc6:	07 31       	cpi	r16, 0x17	; 23
    3dc8:	08 f0       	brcs	.+2      	; 0x3dcc <__vector_7+0x10e0>
    3dca:	56 c0       	rjmp	.+172    	; 0x3e78 <__vector_7+0x118c>
    3dcc:	0f 5f       	subi	r16, 0xFF	; 255
    3dce:	ce 01       	movw	r24, r28
    3dd0:	09 96       	adiw	r24, 0x09	; 9
    3dd2:	0e 94 29 0d 	call	0x1a52	; 0x1a52 <_ZN3BCD9incrementERNS_5bcd_tE>
    3dd6:	aa 94       	dec	r10
    3dd8:	a1 10       	cpse	r10, r1
    3dda:	d5 cf       	rjmp	.-86     	; 0x3d86 <__vector_7+0x109a>
    3ddc:	e8 e6       	ldi	r30, 0x68	; 104
    3dde:	f3 e0       	ldi	r31, 0x03	; 3
    3de0:	af 01       	movw	r20, r30
    3de2:	da 01       	movw	r26, r20
    3de4:	8d 91       	ld	r24, X+
    3de6:	ad 01       	movw	r20, r26
    3de8:	9d 01       	movw	r18, r26
    3dea:	21 50       	subi	r18, 0x01	; 1
    3dec:	31 09       	sbc	r19, r1
    3dee:	8b 19       	sub	r24, r11
    3df0:	d9 01       	movw	r26, r18
    3df2:	8c 93       	st	X, r24
    3df4:	b3 e0       	ldi	r27, 0x03	; 3
    3df6:	40 38       	cpi	r20, 0x80	; 128
    3df8:	5b 07       	cpc	r21, r27
    3dfa:	99 f7       	brne	.-26     	; 0x3de2 <__vector_7+0x10f6>
    3dfc:	87 ef       	ldi	r24, 0xF7	; 247
    3dfe:	48 2e       	mov	r4, r24
    3e00:	4c 14       	cp	r4, r12
    3e02:	48 f4       	brcc	.+18     	; 0x3e16 <__vector_7+0x112a>
    3e04:	80 81       	ld	r24, Z
    3e06:	88 30       	cpi	r24, 0x08	; 8
    3e08:	c8 f5       	brcc	.+114    	; 0x3e7c <__vector_7+0x1190>
    3e0a:	10 82       	st	Z, r1
    3e0c:	31 96       	adiw	r30, 0x01	; 1
    3e0e:	23 e0       	ldi	r18, 0x03	; 3
    3e10:	e0 38       	cpi	r30, 0x80	; 128
    3e12:	f2 07       	cpc	r31, r18
    3e14:	b9 f7       	brne	.-18     	; 0x3e04 <__vector_7+0x1118>
    3e16:	8f 81       	ldd	r24, Y+7	; 0x07
    3e18:	8a 32       	cpi	r24, 0x2A	; 42
    3e1a:	08 f4       	brcc	.+2      	; 0x3e1e <__vector_7+0x1132>
    3e1c:	83 c0       	rjmp	.+262    	; 0x3f24 <__vector_7+0x1238>
    3e1e:	06 ed       	ldi	r16, 0xD6	; 214
    3e20:	d0 2e       	mov	r13, r16
    3e22:	d8 0e       	add	r13, r24
    3e24:	33 e0       	ldi	r19, 0x03	; 3
    3e26:	3d 15       	cp	r19, r13
    3e28:	08 f4       	brcc	.+2      	; 0x3e2c <__vector_7+0x1140>
    3e2a:	7c c0       	rjmp	.+248    	; 0x3f24 <__vector_7+0x1238>
    3e2c:	d3 12       	cpse	r13, r19
    3e2e:	2d c0       	rjmp	.+90     	; 0x3e8a <__vector_7+0x119e>
    3e30:	10 92 8c 03 	sts	0x038C, r1	; 0x80038c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x8>
    3e34:	10 92 8d 03 	sts	0x038D, r1	; 0x80038d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x9>
    3e38:	88 e0       	ldi	r24, 0x08	; 8
    3e3a:	80 93 8e 03 	sts	0x038E, r24	; 0x80038e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0xa>
    3e3e:	e4 e8       	ldi	r30, 0x84	; 132
    3e40:	f3 e0       	ldi	r31, 0x03	; 3
    3e42:	48 e0       	ldi	r20, 0x08	; 8
    3e44:	80 e0       	ldi	r24, 0x00	; 0
    3e46:	90 e0       	ldi	r25, 0x00	; 0
    3e48:	20 e0       	ldi	r18, 0x00	; 0
    3e4a:	31 91       	ld	r19, Z+
    3e4c:	38 17       	cp	r19, r24
    3e4e:	c8 f4       	brcc	.+50     	; 0x3e82 <__vector_7+0x1196>
    3e50:	93 17       	cp	r25, r19
    3e52:	08 f4       	brcc	.+2      	; 0x3e56 <__vector_7+0x116a>
    3e54:	93 2f       	mov	r25, r19
    3e56:	2f 5f       	subi	r18, 0xFF	; 255
    3e58:	27 30       	cpi	r18, 0x07	; 7
    3e5a:	b9 f7       	brne	.-18     	; 0x3e4a <__vector_7+0x115e>
    3e5c:	90 93 8c 03 	sts	0x038C, r25	; 0x80038c <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x8>
    3e60:	80 93 8d 03 	sts	0x038D, r24	; 0x80038d <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x9>
    3e64:	40 93 8e 03 	sts	0x038E, r20	; 0x80038e <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0xa>
    3e68:	5d c0       	rjmp	.+186    	; 0x3f24 <__vector_7+0x1238>
    3e6a:	0e 94 2e 0c 	call	0x185c	; 0x185c <_ZN8Internal16Arithmetic_Tools6parityEh>
    3e6e:	41 e0       	ldi	r20, 0x01	; 1
    3e70:	81 11       	cpse	r24, r1
    3e72:	9d cf       	rjmp	.-198    	; 0x3dae <__vector_7+0x10c2>
    3e74:	40 e0       	ldi	r20, 0x00	; 0
    3e76:	9b cf       	rjmp	.-202    	; 0x3dae <__vector_7+0x10c2>
    3e78:	00 e0       	ldi	r16, 0x00	; 0
    3e7a:	a9 cf       	rjmp	.-174    	; 0x3dce <__vector_7+0x10e2>
    3e7c:	87 50       	subi	r24, 0x07	; 7
    3e7e:	80 83       	st	Z, r24
    3e80:	c5 cf       	rjmp	.-118    	; 0x3e0c <__vector_7+0x1120>
    3e82:	42 2f       	mov	r20, r18
    3e84:	98 2f       	mov	r25, r24
    3e86:	83 2f       	mov	r24, r19
    3e88:	e6 cf       	rjmp	.-52     	; 0x3e56 <__vector_7+0x116a>
    3e8a:	81 e0       	ldi	r24, 0x01	; 1
    3e8c:	89 87       	std	Y+9, r24	; 0x09
    3e8e:	80 91 8b 03 	lds	r24, 0x038B	; 0x80038b <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE15Weekday_DecoderE+0x7>
    3e92:	06 e0       	ldi	r16, 0x06	; 6
    3e94:	08 1b       	sub	r16, r24
    3e96:	b7 e0       	ldi	r27, 0x07	; 7
    3e98:	cb 2e       	mov	r12, r27
    3e9a:	ee 24       	eor	r14, r14
    3e9c:	ea 94       	dec	r14
    3e9e:	f1 2c       	mov	r15, r1
    3ea0:	49 85       	ldd	r20, Y+9	; 0x09
    3ea2:	50 e0       	ldi	r21, 0x00	; 0
    3ea4:	0d 2c       	mov	r0, r13
    3ea6:	02 c0       	rjmp	.+4      	; 0x3eac <__vector_7+0x11c0>
    3ea8:	55 95       	asr	r21
    3eaa:	47 95       	ror	r20
    3eac:	0a 94       	dec	r0
    3eae:	e2 f7       	brpl	.-8      	; 0x3ea8 <__vector_7+0x11bc>
    3eb0:	41 70       	andi	r20, 0x01	; 1
    3eb2:	80 2f       	mov	r24, r16
    3eb4:	90 e0       	ldi	r25, 0x00	; 0
    3eb6:	dc 01       	movw	r26, r24
    3eb8:	ac 57       	subi	r26, 0x7C	; 124
    3eba:	bc 4f       	sbci	r27, 0xFC	; 252
    3ebc:	5d 01       	movw	r10, r26
    3ebe:	61 2f       	mov	r22, r17
    3ec0:	cd 01       	movw	r24, r26
    3ec2:	0e 94 dc 09 	call	0x13b8	; 0x13b8 <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    3ec6:	f5 01       	movw	r30, r10
    3ec8:	80 81       	ld	r24, Z
    3eca:	f8 16       	cp	r15, r24
    3ecc:	08 f4       	brcc	.+2      	; 0x3ed0 <__vector_7+0x11e4>
    3ece:	f8 2e       	mov	r15, r24
    3ed0:	8e 15       	cp	r24, r14
    3ed2:	08 f4       	brcc	.+2      	; 0x3ed6 <__vector_7+0x11ea>
    3ed4:	e8 2e       	mov	r14, r24
    3ed6:	06 30       	cpi	r16, 0x06	; 6
    3ed8:	08 f0       	brcs	.+2      	; 0x3edc <__vector_7+0x11f0>
    3eda:	4f c0       	rjmp	.+158    	; 0x3f7a <__vector_7+0x128e>
    3edc:	0f 5f       	subi	r16, 0xFF	; 255
    3ede:	ce 01       	movw	r24, r28
    3ee0:	09 96       	adiw	r24, 0x09	; 9
    3ee2:	0e 94 29 0d 	call	0x1a52	; 0x1a52 <_ZN3BCD9incrementERNS_5bcd_tE>
    3ee6:	ca 94       	dec	r12
    3ee8:	c1 10       	cpse	r12, r1
    3eea:	da cf       	rjmp	.-76     	; 0x3ea0 <__vector_7+0x11b4>
    3eec:	e4 e8       	ldi	r30, 0x84	; 132
    3eee:	f3 e0       	ldi	r31, 0x03	; 3
    3ef0:	af 01       	movw	r20, r30
    3ef2:	da 01       	movw	r26, r20
    3ef4:	8d 91       	ld	r24, X+
    3ef6:	ad 01       	movw	r20, r26
    3ef8:	9d 01       	movw	r18, r26
    3efa:	21 50       	subi	r18, 0x01	; 1
    3efc:	31 09       	sbc	r19, r1
    3efe:	8e 19       	sub	r24, r14
    3f00:	d9 01       	movw	r26, r18
    3f02:	8c 93       	st	X, r24
    3f04:	b3 e0       	ldi	r27, 0x03	; 3
    3f06:	4b 38       	cpi	r20, 0x8B	; 139
    3f08:	5b 07       	cpc	r21, r27
    3f0a:	99 f7       	brne	.-26     	; 0x3ef2 <__vector_7+0x1206>
    3f0c:	ab ef       	ldi	r26, 0xFB	; 251
    3f0e:	4a 2e       	mov	r4, r26
    3f10:	4f 14       	cp	r4, r15
    3f12:	40 f4       	brcc	.+16     	; 0x3f24 <__vector_7+0x1238>
    3f14:	80 81       	ld	r24, Z
    3f16:	84 30       	cpi	r24, 0x04	; 4
    3f18:	90 f5       	brcc	.+100    	; 0x3f7e <__vector_7+0x1292>
    3f1a:	10 82       	st	Z, r1
    3f1c:	31 96       	adiw	r30, 0x01	; 1
    3f1e:	4e 17       	cp	r20, r30
    3f20:	5f 07       	cpc	r21, r31
    3f22:	c1 f7       	brne	.-16     	; 0x3f14 <__vector_7+0x1228>
    3f24:	8f 81       	ldd	r24, Y+7	; 0x07
    3f26:	84 32       	cpi	r24, 0x24	; 36
    3f28:	08 f4       	brcc	.+2      	; 0x3f2c <__vector_7+0x1240>
    3f2a:	7d c0       	rjmp	.+250    	; 0x4026 <__vector_7+0x133a>
    3f2c:	7c ed       	ldi	r23, 0xDC	; 220
    3f2e:	d7 2e       	mov	r13, r23
    3f30:	d8 0e       	add	r13, r24
    3f32:	e6 e0       	ldi	r30, 0x06	; 6
    3f34:	5e 2e       	mov	r5, r30
    3f36:	5d 14       	cp	r5, r13
    3f38:	08 f4       	brcc	.+2      	; 0x3f3c <__vector_7+0x1250>
    3f3a:	75 c0       	rjmp	.+234    	; 0x4026 <__vector_7+0x133a>
    3f3c:	d5 10       	cpse	r13, r5
    3f3e:	26 c0       	rjmp	.+76     	; 0x3f8c <__vector_7+0x12a0>
    3f40:	10 92 af 03 	sts	0x03AF, r1	; 0x8003af <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x20>
    3f44:	10 92 b0 03 	sts	0x03B0, r1	; 0x8003b0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x21>
    3f48:	80 e2       	ldi	r24, 0x20	; 32
    3f4a:	80 93 b1 03 	sts	0x03B1, r24	; 0x8003b1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x22>
    3f4e:	ef e8       	ldi	r30, 0x8F	; 143
    3f50:	f3 e0       	ldi	r31, 0x03	; 3
    3f52:	40 e2       	ldi	r20, 0x20	; 32
    3f54:	80 e0       	ldi	r24, 0x00	; 0
    3f56:	90 e0       	ldi	r25, 0x00	; 0
    3f58:	20 e0       	ldi	r18, 0x00	; 0
    3f5a:	31 91       	ld	r19, Z+
    3f5c:	38 17       	cp	r19, r24
    3f5e:	90 f4       	brcc	.+36     	; 0x3f84 <__vector_7+0x1298>
    3f60:	93 17       	cp	r25, r19
    3f62:	08 f4       	brcc	.+2      	; 0x3f66 <__vector_7+0x127a>
    3f64:	93 2f       	mov	r25, r19
    3f66:	2f 5f       	subi	r18, 0xFF	; 255
    3f68:	2f 31       	cpi	r18, 0x1F	; 31
    3f6a:	b9 f7       	brne	.-18     	; 0x3f5a <__vector_7+0x126e>
    3f6c:	90 93 af 03 	sts	0x03AF, r25	; 0x8003af <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x20>
    3f70:	80 93 b0 03 	sts	0x03B0, r24	; 0x8003b0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x21>
    3f74:	40 93 b1 03 	sts	0x03B1, r20	; 0x8003b1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x22>
    3f78:	56 c0       	rjmp	.+172    	; 0x4026 <__vector_7+0x133a>
    3f7a:	00 e0       	ldi	r16, 0x00	; 0
    3f7c:	b0 cf       	rjmp	.-160    	; 0x3ede <__vector_7+0x11f2>
    3f7e:	83 50       	subi	r24, 0x03	; 3
    3f80:	80 83       	st	Z, r24
    3f82:	cc cf       	rjmp	.-104    	; 0x3f1c <__vector_7+0x1230>
    3f84:	42 2f       	mov	r20, r18
    3f86:	98 2f       	mov	r25, r24
    3f88:	83 2f       	mov	r24, r19
    3f8a:	ed cf       	rjmp	.-38     	; 0x3f66 <__vector_7+0x127a>
    3f8c:	81 e0       	ldi	r24, 0x01	; 1
    3f8e:	89 87       	std	Y+9, r24	; 0x09
    3f90:	80 91 ae 03 	lds	r24, 0x03AE	; 0x8003ae <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Day_DecoderE+0x1f>
    3f94:	0e e1       	ldi	r16, 0x1E	; 30
    3f96:	08 1b       	sub	r16, r24
    3f98:	6f e1       	ldi	r22, 0x1F	; 31
    3f9a:	c6 2e       	mov	r12, r22
    3f9c:	ee 24       	eor	r14, r14
    3f9e:	ea 94       	dec	r14
    3fa0:	f1 2c       	mov	r15, r1
    3fa2:	49 85       	ldd	r20, Y+9	; 0x09
    3fa4:	50 e0       	ldi	r21, 0x00	; 0
    3fa6:	0d 2c       	mov	r0, r13
    3fa8:	02 c0       	rjmp	.+4      	; 0x3fae <__vector_7+0x12c2>
    3faa:	55 95       	asr	r21
    3fac:	47 95       	ror	r20
    3fae:	0a 94       	dec	r0
    3fb0:	e2 f7       	brpl	.-8      	; 0x3faa <__vector_7+0x12be>
    3fb2:	41 70       	andi	r20, 0x01	; 1
    3fb4:	80 2f       	mov	r24, r16
    3fb6:	90 e0       	ldi	r25, 0x00	; 0
    3fb8:	9c 01       	movw	r18, r24
    3fba:	21 57       	subi	r18, 0x71	; 113
    3fbc:	3c 4f       	sbci	r19, 0xFC	; 252
    3fbe:	59 01       	movw	r10, r18
    3fc0:	61 2f       	mov	r22, r17
    3fc2:	c9 01       	movw	r24, r18
    3fc4:	0e 94 dc 09 	call	0x13b8	; 0x13b8 <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    3fc8:	d5 01       	movw	r26, r10
    3fca:	8c 91       	ld	r24, X
    3fcc:	f8 16       	cp	r15, r24
    3fce:	08 f4       	brcc	.+2      	; 0x3fd2 <__vector_7+0x12e6>
    3fd0:	f8 2e       	mov	r15, r24
    3fd2:	8e 15       	cp	r24, r14
    3fd4:	08 f4       	brcc	.+2      	; 0x3fd8 <__vector_7+0x12ec>
    3fd6:	e8 2e       	mov	r14, r24
    3fd8:	0e 31       	cpi	r16, 0x1E	; 30
    3fda:	08 f0       	brcs	.+2      	; 0x3fde <__vector_7+0x12f2>
    3fdc:	4e c0       	rjmp	.+156    	; 0x407a <__vector_7+0x138e>
    3fde:	0f 5f       	subi	r16, 0xFF	; 255
    3fe0:	ce 01       	movw	r24, r28
    3fe2:	09 96       	adiw	r24, 0x09	; 9
    3fe4:	0e 94 29 0d 	call	0x1a52	; 0x1a52 <_ZN3BCD9incrementERNS_5bcd_tE>
    3fe8:	ca 94       	dec	r12
    3fea:	c1 10       	cpse	r12, r1
    3fec:	da cf       	rjmp	.-76     	; 0x3fa2 <__vector_7+0x12b6>
    3fee:	ef e8       	ldi	r30, 0x8F	; 143
    3ff0:	f3 e0       	ldi	r31, 0x03	; 3
    3ff2:	2e ea       	ldi	r18, 0xAE	; 174
    3ff4:	33 e0       	ldi	r19, 0x03	; 3
    3ff6:	bf 01       	movw	r22, r30
    3ff8:	db 01       	movw	r26, r22
    3ffa:	8d 91       	ld	r24, X+
    3ffc:	bd 01       	movw	r22, r26
    3ffe:	ad 01       	movw	r20, r26
    4000:	41 50       	subi	r20, 0x01	; 1
    4002:	51 09       	sbc	r21, r1
    4004:	8e 19       	sub	r24, r14
    4006:	da 01       	movw	r26, r20
    4008:	8c 93       	st	X, r24
    400a:	26 17       	cp	r18, r22
    400c:	37 07       	cpc	r19, r23
    400e:	a1 f7       	brne	.-24     	; 0x3ff8 <__vector_7+0x130c>
    4010:	b8 ef       	ldi	r27, 0xF8	; 248
    4012:	bf 15       	cp	r27, r15
    4014:	40 f4       	brcc	.+16     	; 0x4026 <__vector_7+0x133a>
    4016:	80 81       	ld	r24, Z
    4018:	87 30       	cpi	r24, 0x07	; 7
    401a:	88 f5       	brcc	.+98     	; 0x407e <__vector_7+0x1392>
    401c:	10 82       	st	Z, r1
    401e:	31 96       	adiw	r30, 0x01	; 1
    4020:	6e 17       	cp	r22, r30
    4022:	7f 07       	cpc	r23, r31
    4024:	c1 f7       	brne	.-16     	; 0x4016 <__vector_7+0x132a>
    4026:	8f 81       	ldd	r24, Y+7	; 0x07
    4028:	8d 32       	cpi	r24, 0x2D	; 45
    402a:	08 f4       	brcc	.+2      	; 0x402e <__vector_7+0x1342>
    402c:	7c c0       	rjmp	.+248    	; 0x4126 <__vector_7+0x143a>
    402e:	53 ed       	ldi	r21, 0xD3	; 211
    4030:	d5 2e       	mov	r13, r21
    4032:	d8 0e       	add	r13, r24
    4034:	e6 e0       	ldi	r30, 0x06	; 6
    4036:	ed 15       	cp	r30, r13
    4038:	08 f4       	brcc	.+2      	; 0x403c <__vector_7+0x1350>
    403a:	75 c0       	rjmp	.+234    	; 0x4126 <__vector_7+0x143a>
    403c:	de 12       	cpse	r13, r30
    403e:	26 c0       	rjmp	.+76     	; 0x408c <__vector_7+0x13a0>
    4040:	10 92 bf 03 	sts	0x03BF, r1	; 0x8003bf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xd>
    4044:	10 92 c0 03 	sts	0x03C0, r1	; 0x8003c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xe>
    4048:	8d e0       	ldi	r24, 0x0D	; 13
    404a:	80 93 c1 03 	sts	0x03C1, r24	; 0x8003c1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xf>
    404e:	e2 eb       	ldi	r30, 0xB2	; 178
    4050:	f3 e0       	ldi	r31, 0x03	; 3
    4052:	4d e0       	ldi	r20, 0x0D	; 13
    4054:	80 e0       	ldi	r24, 0x00	; 0
    4056:	90 e0       	ldi	r25, 0x00	; 0
    4058:	20 e0       	ldi	r18, 0x00	; 0
    405a:	31 91       	ld	r19, Z+
    405c:	38 17       	cp	r19, r24
    405e:	90 f4       	brcc	.+36     	; 0x4084 <__vector_7+0x1398>
    4060:	93 17       	cp	r25, r19
    4062:	08 f4       	brcc	.+2      	; 0x4066 <__vector_7+0x137a>
    4064:	93 2f       	mov	r25, r19
    4066:	2f 5f       	subi	r18, 0xFF	; 255
    4068:	2c 30       	cpi	r18, 0x0C	; 12
    406a:	b9 f7       	brne	.-18     	; 0x405a <__vector_7+0x136e>
    406c:	90 93 bf 03 	sts	0x03BF, r25	; 0x8003bf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xd>
    4070:	80 93 c0 03 	sts	0x03C0, r24	; 0x8003c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xe>
    4074:	40 93 c1 03 	sts	0x03C1, r20	; 0x8003c1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xf>
    4078:	56 c0       	rjmp	.+172    	; 0x4126 <__vector_7+0x143a>
    407a:	00 e0       	ldi	r16, 0x00	; 0
    407c:	b1 cf       	rjmp	.-158    	; 0x3fe0 <__vector_7+0x12f4>
    407e:	86 50       	subi	r24, 0x06	; 6
    4080:	80 83       	st	Z, r24
    4082:	cd cf       	rjmp	.-102    	; 0x401e <__vector_7+0x1332>
    4084:	42 2f       	mov	r20, r18
    4086:	98 2f       	mov	r25, r24
    4088:	83 2f       	mov	r24, r19
    408a:	ed cf       	rjmp	.-38     	; 0x4066 <__vector_7+0x137a>
    408c:	81 e0       	ldi	r24, 0x01	; 1
    408e:	89 87       	std	Y+9, r24	; 0x09
    4090:	80 91 be 03 	lds	r24, 0x03BE	; 0x8003be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE13Month_DecoderE+0xc>
    4094:	0b e0       	ldi	r16, 0x0B	; 11
    4096:	08 1b       	sub	r16, r24
    4098:	4c e0       	ldi	r20, 0x0C	; 12
    409a:	c4 2e       	mov	r12, r20
    409c:	ee 24       	eor	r14, r14
    409e:	ea 94       	dec	r14
    40a0:	f1 2c       	mov	r15, r1
    40a2:	49 85       	ldd	r20, Y+9	; 0x09
    40a4:	50 e0       	ldi	r21, 0x00	; 0
    40a6:	0d 2c       	mov	r0, r13
    40a8:	02 c0       	rjmp	.+4      	; 0x40ae <__vector_7+0x13c2>
    40aa:	55 95       	asr	r21
    40ac:	47 95       	ror	r20
    40ae:	0a 94       	dec	r0
    40b0:	e2 f7       	brpl	.-8      	; 0x40aa <__vector_7+0x13be>
    40b2:	41 70       	andi	r20, 0x01	; 1
    40b4:	80 2f       	mov	r24, r16
    40b6:	90 e0       	ldi	r25, 0x00	; 0
    40b8:	9c 01       	movw	r18, r24
    40ba:	2e 54       	subi	r18, 0x4E	; 78
    40bc:	3c 4f       	sbci	r19, 0xFC	; 252
    40be:	59 01       	movw	r10, r18
    40c0:	61 2f       	mov	r22, r17
    40c2:	c9 01       	movw	r24, r18
    40c4:	0e 94 dc 09 	call	0x13b8	; 0x13b8 <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    40c8:	d5 01       	movw	r26, r10
    40ca:	8c 91       	ld	r24, X
    40cc:	f8 16       	cp	r15, r24
    40ce:	08 f4       	brcc	.+2      	; 0x40d2 <__vector_7+0x13e6>
    40d0:	f8 2e       	mov	r15, r24
    40d2:	8e 15       	cp	r24, r14
    40d4:	08 f4       	brcc	.+2      	; 0x40d8 <__vector_7+0x13ec>
    40d6:	e8 2e       	mov	r14, r24
    40d8:	0b 30       	cpi	r16, 0x0B	; 11
    40da:	08 f0       	brcs	.+2      	; 0x40de <__vector_7+0x13f2>
    40dc:	4f c0       	rjmp	.+158    	; 0x417c <__vector_7+0x1490>
    40de:	0f 5f       	subi	r16, 0xFF	; 255
    40e0:	ce 01       	movw	r24, r28
    40e2:	09 96       	adiw	r24, 0x09	; 9
    40e4:	0e 94 29 0d 	call	0x1a52	; 0x1a52 <_ZN3BCD9incrementERNS_5bcd_tE>
    40e8:	ca 94       	dec	r12
    40ea:	c1 10       	cpse	r12, r1
    40ec:	da cf       	rjmp	.-76     	; 0x40a2 <__vector_7+0x13b6>
    40ee:	e2 eb       	ldi	r30, 0xB2	; 178
    40f0:	f3 e0       	ldi	r31, 0x03	; 3
    40f2:	2e eb       	ldi	r18, 0xBE	; 190
    40f4:	33 e0       	ldi	r19, 0x03	; 3
    40f6:	bf 01       	movw	r22, r30
    40f8:	db 01       	movw	r26, r22
    40fa:	8d 91       	ld	r24, X+
    40fc:	bd 01       	movw	r22, r26
    40fe:	ad 01       	movw	r20, r26
    4100:	41 50       	subi	r20, 0x01	; 1
    4102:	51 09       	sbc	r21, r1
    4104:	8e 19       	sub	r24, r14
    4106:	da 01       	movw	r26, r20
    4108:	8c 93       	st	X, r24
    410a:	26 17       	cp	r18, r22
    410c:	37 07       	cpc	r19, r23
    410e:	a1 f7       	brne	.-24     	; 0x40f8 <__vector_7+0x140c>
    4110:	b8 ef       	ldi	r27, 0xF8	; 248
    4112:	bf 15       	cp	r27, r15
    4114:	40 f4       	brcc	.+16     	; 0x4126 <__vector_7+0x143a>
    4116:	80 81       	ld	r24, Z
    4118:	87 30       	cpi	r24, 0x07	; 7
    411a:	90 f5       	brcc	.+100    	; 0x4180 <__vector_7+0x1494>
    411c:	10 82       	st	Z, r1
    411e:	31 96       	adiw	r30, 0x01	; 1
    4120:	6e 17       	cp	r22, r30
    4122:	7f 07       	cpc	r23, r31
    4124:	c1 f7       	brne	.-16     	; 0x4116 <__vector_7+0x142a>
    4126:	ff 80       	ldd	r15, Y+7	; 0x07
    4128:	e1 e3       	ldi	r30, 0x31	; 49
    412a:	ef 15       	cp	r30, r15
    412c:	08 f0       	brcs	.+2      	; 0x4130 <__vector_7+0x1444>
    412e:	7b c0       	rjmp	.+246    	; 0x4226 <__vector_7+0x153a>
    4130:	3e ec       	ldi	r19, 0xCE	; 206
    4132:	93 2e       	mov	r9, r19
    4134:	9f 0c       	add	r9, r15
    4136:	f4 e0       	ldi	r31, 0x04	; 4
    4138:	f9 15       	cp	r31, r9
    413a:	08 f4       	brcc	.+2      	; 0x413e <__vector_7+0x1452>
    413c:	74 c0       	rjmp	.+232    	; 0x4226 <__vector_7+0x153a>
    413e:	9f 12       	cpse	r9, r31
    4140:	26 c0       	rjmp	.+76     	; 0x418e <__vector_7+0x14a2>
    4142:	10 92 cd 03 	sts	0x03CD, r1	; 0x8003cd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xb>
    4146:	10 92 ce 03 	sts	0x03CE, r1	; 0x8003ce <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xc>
    414a:	8b e0       	ldi	r24, 0x0B	; 11
    414c:	80 93 cf 03 	sts	0x03CF, r24	; 0x8003cf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xd>
    4150:	e2 ec       	ldi	r30, 0xC2	; 194
    4152:	f3 e0       	ldi	r31, 0x03	; 3
    4154:	4b e0       	ldi	r20, 0x0B	; 11
    4156:	80 e0       	ldi	r24, 0x00	; 0
    4158:	90 e0       	ldi	r25, 0x00	; 0
    415a:	20 e0       	ldi	r18, 0x00	; 0
    415c:	31 91       	ld	r19, Z+
    415e:	38 17       	cp	r19, r24
    4160:	90 f4       	brcc	.+36     	; 0x4186 <__vector_7+0x149a>
    4162:	93 17       	cp	r25, r19
    4164:	08 f4       	brcc	.+2      	; 0x4168 <__vector_7+0x147c>
    4166:	93 2f       	mov	r25, r19
    4168:	2f 5f       	subi	r18, 0xFF	; 255
    416a:	2a 30       	cpi	r18, 0x0A	; 10
    416c:	b9 f7       	brne	.-18     	; 0x415c <__vector_7+0x1470>
    416e:	90 93 cd 03 	sts	0x03CD, r25	; 0x8003cd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xb>
    4172:	80 93 ce 03 	sts	0x03CE, r24	; 0x8003ce <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xc>
    4176:	40 93 cf 03 	sts	0x03CF, r20	; 0x8003cf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xd>
    417a:	55 c0       	rjmp	.+170    	; 0x4226 <__vector_7+0x153a>
    417c:	00 e0       	ldi	r16, 0x00	; 0
    417e:	b0 cf       	rjmp	.-160    	; 0x40e0 <__vector_7+0x13f4>
    4180:	86 50       	subi	r24, 0x06	; 6
    4182:	80 83       	st	Z, r24
    4184:	cc cf       	rjmp	.-104    	; 0x411e <__vector_7+0x1432>
    4186:	42 2f       	mov	r20, r18
    4188:	98 2f       	mov	r25, r24
    418a:	83 2f       	mov	r24, r19
    418c:	ed cf       	rjmp	.-38     	; 0x4168 <__vector_7+0x147c>
    418e:	19 86       	std	Y+9, r1	; 0x09
    4190:	80 91 cc 03 	lds	r24, 0x03CC	; 0x8003cc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0xa>
    4194:	09 e0       	ldi	r16, 0x09	; 9
    4196:	08 1b       	sub	r16, r24
    4198:	2a e0       	ldi	r18, 0x0A	; 10
    419a:	c2 2e       	mov	r12, r18
    419c:	dd 24       	eor	r13, r13
    419e:	da 94       	dec	r13
    41a0:	e1 2c       	mov	r14, r1
    41a2:	49 85       	ldd	r20, Y+9	; 0x09
    41a4:	50 e0       	ldi	r21, 0x00	; 0
    41a6:	09 2c       	mov	r0, r9
    41a8:	02 c0       	rjmp	.+4      	; 0x41ae <__vector_7+0x14c2>
    41aa:	55 95       	asr	r21
    41ac:	47 95       	ror	r20
    41ae:	0a 94       	dec	r0
    41b0:	e2 f7       	brpl	.-8      	; 0x41aa <__vector_7+0x14be>
    41b2:	41 70       	andi	r20, 0x01	; 1
    41b4:	80 2f       	mov	r24, r16
    41b6:	90 e0       	ldi	r25, 0x00	; 0
    41b8:	9c 01       	movw	r18, r24
    41ba:	2e 53       	subi	r18, 0x3E	; 62
    41bc:	3c 4f       	sbci	r19, 0xFC	; 252
    41be:	59 01       	movw	r10, r18
    41c0:	61 2f       	mov	r22, r17
    41c2:	c9 01       	movw	r24, r18
    41c4:	0e 94 dc 09 	call	0x13b8	; 0x13b8 <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    41c8:	d5 01       	movw	r26, r10
    41ca:	8c 91       	ld	r24, X
    41cc:	e8 16       	cp	r14, r24
    41ce:	08 f4       	brcc	.+2      	; 0x41d2 <__vector_7+0x14e6>
    41d0:	e8 2e       	mov	r14, r24
    41d2:	8d 15       	cp	r24, r13
    41d4:	08 f4       	brcc	.+2      	; 0x41d8 <__vector_7+0x14ec>
    41d6:	d8 2e       	mov	r13, r24
    41d8:	09 30       	cpi	r16, 0x09	; 9
    41da:	08 f0       	brcs	.+2      	; 0x41de <__vector_7+0x14f2>
    41dc:	4f c0       	rjmp	.+158    	; 0x427c <__vector_7+0x1590>
    41de:	0f 5f       	subi	r16, 0xFF	; 255
    41e0:	ce 01       	movw	r24, r28
    41e2:	09 96       	adiw	r24, 0x09	; 9
    41e4:	0e 94 29 0d 	call	0x1a52	; 0x1a52 <_ZN3BCD9incrementERNS_5bcd_tE>
    41e8:	ca 94       	dec	r12
    41ea:	c1 10       	cpse	r12, r1
    41ec:	da cf       	rjmp	.-76     	; 0x41a2 <__vector_7+0x14b6>
    41ee:	e2 ec       	ldi	r30, 0xC2	; 194
    41f0:	f3 e0       	ldi	r31, 0x03	; 3
    41f2:	2c ec       	ldi	r18, 0xCC	; 204
    41f4:	33 e0       	ldi	r19, 0x03	; 3
    41f6:	bf 01       	movw	r22, r30
    41f8:	db 01       	movw	r26, r22
    41fa:	8d 91       	ld	r24, X+
    41fc:	bd 01       	movw	r22, r26
    41fe:	ad 01       	movw	r20, r26
    4200:	41 50       	subi	r20, 0x01	; 1
    4202:	51 09       	sbc	r21, r1
    4204:	8d 19       	sub	r24, r13
    4206:	da 01       	movw	r26, r20
    4208:	8c 93       	st	X, r24
    420a:	26 17       	cp	r18, r22
    420c:	37 07       	cpc	r19, r23
    420e:	a1 f7       	brne	.-24     	; 0x41f8 <__vector_7+0x150c>
    4210:	ba ef       	ldi	r27, 0xFA	; 250
    4212:	be 15       	cp	r27, r14
    4214:	40 f4       	brcc	.+16     	; 0x4226 <__vector_7+0x153a>
    4216:	80 81       	ld	r24, Z
    4218:	85 30       	cpi	r24, 0x05	; 5
    421a:	90 f5       	brcc	.+100    	; 0x4280 <__vector_7+0x1594>
    421c:	10 82       	st	Z, r1
    421e:	31 96       	adiw	r30, 0x01	; 1
    4220:	6e 17       	cp	r22, r30
    4222:	7f 07       	cpc	r23, r31
    4224:	c1 f7       	brne	.-16     	; 0x4216 <__vector_7+0x152a>
    4226:	e5 e3       	ldi	r30, 0x35	; 53
    4228:	ef 15       	cp	r30, r15
    422a:	10 f0       	brcs	.+4      	; 0x4230 <__vector_7+0x1544>
    422c:	0c 94 ba 18 	jmp	0x3174	; 0x3174 <__vector_7+0x488>
    4230:	0a ec       	ldi	r16, 0xCA	; 202
    4232:	0f 0d       	add	r16, r15
    4234:	05 30       	cpi	r16, 0x05	; 5
    4236:	10 f0       	brcs	.+4      	; 0x423c <__vector_7+0x1550>
    4238:	0c 94 ba 18 	jmp	0x3174	; 0x3174 <__vector_7+0x488>
    423c:	04 30       	cpi	r16, 0x04	; 4
    423e:	39 f5       	brne	.+78     	; 0x428e <__vector_7+0x15a2>
    4240:	10 92 db 03 	sts	0x03DB, r1	; 0x8003db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x19>
    4244:	10 92 dc 03 	sts	0x03DC, r1	; 0x8003dc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x1a>
    4248:	8b e0       	ldi	r24, 0x0B	; 11
    424a:	80 93 dd 03 	sts	0x03DD, r24	; 0x8003dd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x1b>
    424e:	e0 ed       	ldi	r30, 0xD0	; 208
    4250:	f3 e0       	ldi	r31, 0x03	; 3
    4252:	4b e0       	ldi	r20, 0x0B	; 11
    4254:	80 e0       	ldi	r24, 0x00	; 0
    4256:	90 e0       	ldi	r25, 0x00	; 0
    4258:	20 e0       	ldi	r18, 0x00	; 0
    425a:	31 91       	ld	r19, Z+
    425c:	39 17       	cp	r19, r25
    425e:	98 f4       	brcc	.+38     	; 0x4286 <__vector_7+0x159a>
    4260:	83 17       	cp	r24, r19
    4262:	08 f4       	brcc	.+2      	; 0x4266 <__vector_7+0x157a>
    4264:	83 2f       	mov	r24, r19
    4266:	2f 5f       	subi	r18, 0xFF	; 255
    4268:	2a 30       	cpi	r18, 0x0A	; 10
    426a:	b9 f7       	brne	.-18     	; 0x425a <__vector_7+0x156e>
    426c:	90 93 dc 03 	sts	0x03DC, r25	; 0x8003dc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x1a>
    4270:	80 93 db 03 	sts	0x03DB, r24	; 0x8003db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x19>
    4274:	40 93 dd 03 	sts	0x03DD, r20	; 0x8003dd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x1b>
    4278:	0c 94 ba 18 	jmp	0x3174	; 0x3174 <__vector_7+0x488>
    427c:	00 e0       	ldi	r16, 0x00	; 0
    427e:	b0 cf       	rjmp	.-160    	; 0x41e0 <__vector_7+0x14f4>
    4280:	84 50       	subi	r24, 0x04	; 4
    4282:	80 83       	st	Z, r24
    4284:	cc cf       	rjmp	.-104    	; 0x421e <__vector_7+0x1532>
    4286:	42 2f       	mov	r20, r18
    4288:	89 2f       	mov	r24, r25
    428a:	93 2f       	mov	r25, r19
    428c:	ec cf       	rjmp	.-40     	; 0x4266 <__vector_7+0x157a>
    428e:	19 86       	std	Y+9, r1	; 0x09
    4290:	80 91 da 03 	lds	r24, 0x03DA	; 0x8003da <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE12Year_DecoderE+0x18>
    4294:	99 e0       	ldi	r25, 0x09	; 9
    4296:	f9 2e       	mov	r15, r25
    4298:	f8 1a       	sub	r15, r24
    429a:	9a e0       	ldi	r25, 0x0A	; 10
    429c:	c9 2e       	mov	r12, r25
    429e:	dd 24       	eor	r13, r13
    42a0:	da 94       	dec	r13
    42a2:	e1 2c       	mov	r14, r1
    42a4:	49 85       	ldd	r20, Y+9	; 0x09
    42a6:	50 e0       	ldi	r21, 0x00	; 0
    42a8:	00 2e       	mov	r0, r16
    42aa:	02 c0       	rjmp	.+4      	; 0x42b0 <__vector_7+0x15c4>
    42ac:	55 95       	asr	r21
    42ae:	47 95       	ror	r20
    42b0:	0a 94       	dec	r0
    42b2:	e2 f7       	brpl	.-8      	; 0x42ac <__vector_7+0x15c0>
    42b4:	41 70       	andi	r20, 0x01	; 1
    42b6:	af 2c       	mov	r10, r15
    42b8:	b1 2c       	mov	r11, r1
    42ba:	61 2f       	mov	r22, r17
    42bc:	c5 01       	movw	r24, r10
    42be:	80 53       	subi	r24, 0x30	; 48
    42c0:	9c 4f       	sbci	r25, 0xFC	; 252
    42c2:	0e 94 dc 09 	call	0x13b8	; 0x13b8 <_ZN8Internal7Binning5scoreIhhLh1EEEvRT_T0_b>
    42c6:	f5 01       	movw	r30, r10
    42c8:	ee 53       	subi	r30, 0x3E	; 62
    42ca:	fc 4f       	sbci	r31, 0xFC	; 252
    42cc:	86 85       	ldd	r24, Z+14	; 0x0e
    42ce:	e8 16       	cp	r14, r24
    42d0:	08 f4       	brcc	.+2      	; 0x42d4 <__vector_7+0x15e8>
    42d2:	e8 2e       	mov	r14, r24
    42d4:	8d 15       	cp	r24, r13
    42d6:	08 f4       	brcc	.+2      	; 0x42da <__vector_7+0x15ee>
    42d8:	d8 2e       	mov	r13, r24
    42da:	f8 e0       	ldi	r31, 0x08	; 8
    42dc:	ff 15       	cp	r31, r15
    42de:	40 f1       	brcs	.+80     	; 0x4330 <__vector_7+0x1644>
    42e0:	f3 94       	inc	r15
    42e2:	ce 01       	movw	r24, r28
    42e4:	09 96       	adiw	r24, 0x09	; 9
    42e6:	0e 94 29 0d 	call	0x1a52	; 0x1a52 <_ZN3BCD9incrementERNS_5bcd_tE>
    42ea:	ca 94       	dec	r12
    42ec:	c1 10       	cpse	r12, r1
    42ee:	da cf       	rjmp	.-76     	; 0x42a4 <__vector_7+0x15b8>
    42f0:	e2 ec       	ldi	r30, 0xC2	; 194
    42f2:	f3 e0       	ldi	r31, 0x03	; 3
    42f4:	2c ec       	ldi	r18, 0xCC	; 204
    42f6:	33 e0       	ldi	r19, 0x03	; 3
    42f8:	df 01       	movw	r26, r30
    42fa:	1e 96       	adiw	r26, 0x0e	; 14
    42fc:	8c 91       	ld	r24, X
    42fe:	1e 97       	sbiw	r26, 0x0e	; 14
    4300:	8d 19       	sub	r24, r13
    4302:	1e 96       	adiw	r26, 0x0e	; 14
    4304:	8c 93       	st	X, r24
    4306:	1e 97       	sbiw	r26, 0x0e	; 14
    4308:	11 96       	adiw	r26, 0x01	; 1
    430a:	2a 17       	cp	r18, r26
    430c:	3b 07       	cpc	r19, r27
    430e:	a9 f7       	brne	.-22     	; 0x42fa <__vector_7+0x160e>
    4310:	8a ef       	ldi	r24, 0xFA	; 250
    4312:	48 2e       	mov	r4, r24
    4314:	4e 14       	cp	r4, r14
    4316:	10 f0       	brcs	.+4      	; 0x431c <__vector_7+0x1630>
    4318:	0c 94 ba 18 	jmp	0x3174	; 0x3174 <__vector_7+0x488>
    431c:	86 85       	ldd	r24, Z+14	; 0x0e
    431e:	85 30       	cpi	r24, 0x05	; 5
    4320:	48 f4       	brcc	.+18     	; 0x4334 <__vector_7+0x1648>
    4322:	16 86       	std	Z+14, r1	; 0x0e
    4324:	31 96       	adiw	r30, 0x01	; 1
    4326:	ae 17       	cp	r26, r30
    4328:	bf 07       	cpc	r27, r31
    432a:	c1 f7       	brne	.-16     	; 0x431c <__vector_7+0x1630>
    432c:	0c 94 ba 18 	jmp	0x3174	; 0x3174 <__vector_7+0x488>
    4330:	f1 2c       	mov	r15, r1
    4332:	d7 cf       	rjmp	.-82     	; 0x42e2 <__vector_7+0x15f6>
    4334:	84 50       	subi	r24, 0x04	; 4
    4336:	86 87       	std	Z+14, r24	; 0x0e
    4338:	f5 cf       	rjmp	.-22     	; 0x4324 <__vector_7+0x1638>
    433a:	10 92 e9 05 	sts	0x05E9, r1	; 0x8005e9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x5>
    433e:	80 91 e6 05 	lds	r24, 0x05E6	; 0x8005e6 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    4342:	90 91 e7 05 	lds	r25, 0x05E7	; 0x8005e7 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    4346:	8f 35       	cpi	r24, 0x5F	; 95
    4348:	9a 4e       	sbci	r25, 0xEA	; 234
    434a:	00 f5       	brcc	.+64     	; 0x438c <__vector_7+0x16a0>
    434c:	80 91 e6 05 	lds	r24, 0x05E6	; 0x8005e6 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    4350:	90 91 e7 05 	lds	r25, 0x05E7	; 0x8005e7 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    4354:	01 96       	adiw	r24, 0x01	; 1
    4356:	90 93 e7 05 	sts	0x05E7, r25	; 0x8005e7 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    435a:	80 93 e6 05 	sts	0x05E6, r24	; 0x8005e6 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    435e:	80 91 e6 05 	lds	r24, 0x05E6	; 0x8005e6 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    4362:	90 91 e7 05 	lds	r25, 0x05E7	; 0x8005e7 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    4366:	60 e7       	ldi	r22, 0x70	; 112
    4368:	77 e1       	ldi	r23, 0x17	; 23
    436a:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    436e:	89 2b       	or	r24, r25
    4370:	11 f0       	breq	.+4      	; 0x4376 <__vector_7+0x168a>
    4372:	0c 94 40 19 	jmp	0x3280	; 0x3280 <__vector_7+0x594>
    4376:	80 91 e4 05 	lds	r24, 0x05E4	; 0x8005e4 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    437a:	90 91 e5 05 	lds	r25, 0x05E5	; 0x8005e5 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    437e:	01 96       	adiw	r24, 0x01	; 1
    4380:	90 93 e5 05 	sts	0x05E5, r25	; 0x8005e5 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    4384:	80 93 e4 05 	sts	0x05E4, r24	; 0x8005e4 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    4388:	0c 94 40 19 	jmp	0x3280	; 0x3280 <__vector_7+0x594>
    438c:	10 92 e7 05 	sts	0x05E7, r1	; 0x8005e7 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x3>
    4390:	10 92 e6 05 	sts	0x05E6, r1	; 0x8005e6 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x2>
    4394:	80 91 e4 05 	lds	r24, 0x05E4	; 0x8005e4 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    4398:	90 91 e5 05 	lds	r25, 0x05E5	; 0x8005e5 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    439c:	01 96       	adiw	r24, 0x01	; 1
    439e:	90 93 e5 05 	sts	0x05E5, r25	; 0x8005e5 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x1>
    43a2:	80 93 e4 05 	sts	0x05E4, r24	; 0x8005e4 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE>
    43a6:	db cf       	rjmp	.-74     	; 0x435e <__vector_7+0x1672>
    43a8:	88 b5       	in	r24, 0x28	; 40
    43aa:	81 50       	subi	r24, 0x01	; 1
    43ac:	88 bd       	out	0x28, r24	; 40
    43ae:	81 11       	cpse	r24, r1
    43b0:	0c 94 97 19 	jmp	0x332e	; 0x332e <__vector_7+0x642>
    43b4:	5d 9a       	sbi	0x0b, 5	; 11
    43b6:	14 bc       	out	0x24, r1	; 36
    43b8:	0c 94 97 19 	jmp	0x332e	; 0x332e <__vector_7+0x642>
    43bc:	80 91 58 02 	lds	r24, 0x0258	; 0x800258 <crossfade_flip_counter>
    43c0:	81 11       	cpse	r24, r1
    43c2:	0c 94 ac 19 	jmp	0x3358	; 0x3358 <__vector_7+0x66c>
    43c6:	8e ed       	ldi	r24, 0xDE	; 222
    43c8:	93 e0       	ldi	r25, 0x03	; 3
    43ca:	0c 94 a8 19 	jmp	0x3350	; 0x3350 <__vector_7+0x664>
    43ce:	80 e8       	ldi	r24, 0x80	; 128
    43d0:	0c 94 c3 19 	jmp	0x3386	; 0x3386 <__vector_7+0x69a>
    43d4:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <MODE>
    43d8:	8d 7f       	andi	r24, 0xFD	; 253
    43da:	80 93 e6 03 	sts	0x03E6, r24	; 0x8003e6 <MODE>
    43de:	80 e2       	ldi	r24, 0x20	; 32
    43e0:	0c 94 ce 19 	jmp	0x339c	; 0x339c <__vector_7+0x6b0>
    43e4:	13 e0       	ldi	r17, 0x03	; 3
    43e6:	00 23       	and	r16, r16
    43e8:	11 f4       	brne	.+4      	; 0x43ee <__vector_7+0x1702>
    43ea:	0c 94 53 18 	jmp	0x30a6	; 0x30a6 <__vector_7+0x3ba>
    43ee:	84 c8       	rjmp	.-3832   	; 0x34f8 <__vector_7+0x80c>
    43f0:	12 e0       	ldi	r17, 0x02	; 2
    43f2:	f9 cf       	rjmp	.-14     	; 0x43e6 <__vector_7+0x16fa>
    43f4:	03 30       	cpi	r16, 0x03	; 3
    43f6:	09 f0       	breq	.+2      	; 0x43fa <__vector_7+0x170e>
    43f8:	cb cb       	rjmp	.-2154   	; 0x3b90 <__vector_7+0xea4>
    43fa:	11 e0       	ldi	r17, 0x01	; 1
    43fc:	dc cb       	rjmp	.-2120   	; 0x3bb6 <__vector_7+0xeca>

000043fe <_GLOBAL__I_65535_0_main.cpp.o.3555>:
    43fe:	10 92 5c 04 	sts	0x045C, r1	; 0x80045c <Serial+0x3>
    4402:	10 92 5b 04 	sts	0x045B, r1	; 0x80045b <Serial+0x2>
    4406:	88 ee       	ldi	r24, 0xE8	; 232
    4408:	93 e0       	ldi	r25, 0x03	; 3
    440a:	a0 e0       	ldi	r26, 0x00	; 0
    440c:	b0 e0       	ldi	r27, 0x00	; 0
    440e:	80 93 5d 04 	sts	0x045D, r24	; 0x80045d <Serial+0x4>
    4412:	90 93 5e 04 	sts	0x045E, r25	; 0x80045e <Serial+0x5>
    4416:	a0 93 5f 04 	sts	0x045F, r26	; 0x80045f <Serial+0x6>
    441a:	b0 93 60 04 	sts	0x0460, r27	; 0x800460 <Serial+0x7>
    441e:	26 e1       	ldi	r18, 0x16	; 22
    4420:	31 e0       	ldi	r19, 0x01	; 1
    4422:	30 93 5a 04 	sts	0x045A, r19	; 0x80045a <Serial+0x1>
    4426:	20 93 59 04 	sts	0x0459, r18	; 0x800459 <Serial>
    442a:	25 ec       	ldi	r18, 0xC5	; 197
    442c:	30 e0       	ldi	r19, 0x00	; 0
    442e:	30 93 66 04 	sts	0x0466, r19	; 0x800466 <Serial+0xd>
    4432:	20 93 65 04 	sts	0x0465, r18	; 0x800465 <Serial+0xc>
    4436:	24 ec       	ldi	r18, 0xC4	; 196
    4438:	30 e0       	ldi	r19, 0x00	; 0
    443a:	30 93 68 04 	sts	0x0468, r19	; 0x800468 <Serial+0xf>
    443e:	20 93 67 04 	sts	0x0467, r18	; 0x800467 <Serial+0xe>
    4442:	20 ec       	ldi	r18, 0xC0	; 192
    4444:	30 e0       	ldi	r19, 0x00	; 0
    4446:	30 93 6a 04 	sts	0x046A, r19	; 0x80046a <Serial+0x11>
    444a:	20 93 69 04 	sts	0x0469, r18	; 0x800469 <Serial+0x10>
    444e:	21 ec       	ldi	r18, 0xC1	; 193
    4450:	30 e0       	ldi	r19, 0x00	; 0
    4452:	30 93 6c 04 	sts	0x046C, r19	; 0x80046c <Serial+0x13>
    4456:	20 93 6b 04 	sts	0x046B, r18	; 0x80046b <Serial+0x12>
    445a:	22 ec       	ldi	r18, 0xC2	; 194
    445c:	30 e0       	ldi	r19, 0x00	; 0
    445e:	30 93 6e 04 	sts	0x046E, r19	; 0x80046e <Serial+0x15>
    4462:	20 93 6d 04 	sts	0x046D, r18	; 0x80046d <Serial+0x14>
    4466:	26 ec       	ldi	r18, 0xC6	; 198
    4468:	30 e0       	ldi	r19, 0x00	; 0
    446a:	30 93 70 04 	sts	0x0470, r19	; 0x800470 <Serial+0x17>
    446e:	20 93 6f 04 	sts	0x046F, r18	; 0x80046f <Serial+0x16>
    4472:	10 92 72 04 	sts	0x0472, r1	; 0x800472 <Serial+0x19>
    4476:	10 92 73 04 	sts	0x0473, r1	; 0x800473 <Serial+0x1a>
    447a:	10 92 74 04 	sts	0x0474, r1	; 0x800474 <Serial+0x1b>
    447e:	10 92 75 04 	sts	0x0475, r1	; 0x800475 <Serial+0x1c>
    4482:	10 92 ed 05 	sts	0x05ED, r1	; 0x8005ed <Wire+0x3>
    4486:	10 92 ec 05 	sts	0x05EC, r1	; 0x8005ec <Wire+0x2>
    448a:	80 93 ee 05 	sts	0x05EE, r24	; 0x8005ee <Wire+0x4>
    448e:	90 93 ef 05 	sts	0x05EF, r25	; 0x8005ef <Wire+0x5>
    4492:	a0 93 f0 05 	sts	0x05F0, r26	; 0x8005f0 <Wire+0x6>
    4496:	b0 93 f1 05 	sts	0x05F1, r27	; 0x8005f1 <Wire+0x7>
    449a:	88 e2       	ldi	r24, 0x28	; 40
    449c:	91 e0       	ldi	r25, 0x01	; 1
    449e:	90 93 eb 05 	sts	0x05EB, r25	; 0x8005eb <Wire+0x1>
    44a2:	80 93 ea 05 	sts	0x05EA, r24	; 0x8005ea <Wire>
    44a6:	10 92 e9 05 	sts	0x05E9, r1	; 0x8005e9 <_ZN8Internal23DCF77_Frequency_Control17deviation_trackerE+0x5>
    44aa:	20 91 dc 05 	lds	r18, 0x05DC	; 0x8005dc <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE>
    44ae:	30 91 dd 05 	lds	r19, 0x05DD	; 0x8005dd <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x1>
    44b2:	40 91 de 05 	lds	r20, 0x05DE	; 0x8005de <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x2>
    44b6:	50 91 df 05 	lds	r21, 0x05DF	; 0x8005df <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x3>
    44ba:	60 91 e0 05 	lds	r22, 0x05E0	; 0x8005e0 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x4>
    44be:	70 91 e1 05 	lds	r23, 0x05E1	; 0x8005e1 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x5>
    44c2:	80 91 e2 05 	lds	r24, 0x05E2	; 0x8005e2 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x6>
    44c6:	90 91 e3 05 	lds	r25, 0x05E3	; 0x8005e3 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x7>
    44ca:	a1 e0       	ldi	r26, 0x01	; 1
    44cc:	0e 94 0e 2a 	call	0x541c	; 0x541c <__adddi3_s8>
    44d0:	20 93 dc 05 	sts	0x05DC, r18	; 0x8005dc <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE>
    44d4:	30 93 dd 05 	sts	0x05DD, r19	; 0x8005dd <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x1>
    44d8:	40 93 de 05 	sts	0x05DE, r20	; 0x8005de <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x2>
    44dc:	50 93 df 05 	sts	0x05DF, r21	; 0x8005df <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x3>
    44e0:	60 93 e0 05 	sts	0x05E0, r22	; 0x8005e0 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x4>
    44e4:	70 93 e1 05 	sts	0x05E1, r23	; 0x8005e1 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x5>
    44e8:	80 93 e2 05 	sts	0x05E2, r24	; 0x8005e2 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x6>
    44ec:	90 93 e3 05 	sts	0x05E3, r25	; 0x8005e3 <_ZGVN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0x7>
    44f0:	0e 94 1a 2a 	call	0x5434	; 0x5434 <__cmpdi2_s8>
    44f4:	51 f5       	brne	.+84     	; 0x454a <_GLOBAL__I_65535_0_main.cpp.o.3555+0x14c>
    44f6:	8c e2       	ldi	r24, 0x2C	; 44
    44f8:	91 e0       	ldi	r25, 0x01	; 1
    44fa:	90 93 c9 05 	sts	0x05C9, r25	; 0x8005c9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd3>
    44fe:	80 93 c8 05 	sts	0x05C8, r24	; 0x8005c8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd2>
    4502:	10 92 ca 05 	sts	0x05CA, r1	; 0x8005ca <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd4>
    4506:	10 92 cb 05 	sts	0x05CB, r1	; 0x8005cb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd5>
    450a:	10 92 cc 05 	sts	0x05CC, r1	; 0x8005cc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd6>
    450e:	10 92 cd 05 	sts	0x05CD, r1	; 0x8005cd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd7>
    4512:	10 92 ce 05 	sts	0x05CE, r1	; 0x8005ce <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd8>
    4516:	10 92 cf 05 	sts	0x05CF, r1	; 0x8005cf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd9>
    451a:	10 92 d0 05 	sts	0x05D0, r1	; 0x8005d0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xda>
    451e:	10 92 d1 05 	sts	0x05D1, r1	; 0x8005d1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdb>
    4522:	10 92 d2 05 	sts	0x05D2, r1	; 0x8005d2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdc>
    4526:	10 92 d3 05 	sts	0x05D3, r1	; 0x8005d3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdd>
    452a:	10 92 d4 05 	sts	0x05D4, r1	; 0x8005d4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xde>
    452e:	10 92 d5 05 	sts	0x05D5, r1	; 0x8005d5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdf>
    4532:	10 92 d6 05 	sts	0x05D6, r1	; 0x8005d6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe0>
    4536:	10 92 d7 05 	sts	0x05D7, r1	; 0x8005d7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe1>
    453a:	10 92 d8 05 	sts	0x05D8, r1	; 0x8005d8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe2>
    453e:	10 92 d9 05 	sts	0x05D9, r1	; 0x8005d9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe3>
    4542:	10 92 da 05 	sts	0x05DA, r1	; 0x8005da <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe4>
    4546:	10 92 db 05 	sts	0x05DB, r1	; 0x8005db <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe5>
    454a:	80 e4       	ldi	r24, 0x40	; 64
    454c:	80 93 02 06 	sts	0x0602, r24	; 0x800602 <INA+0xc>
    4550:	8a ee       	ldi	r24, 0xEA	; 234
    4552:	95 e0       	ldi	r25, 0x05	; 5
    4554:	90 93 04 06 	sts	0x0604, r25	; 0x800604 <INA+0xe>
    4558:	80 93 03 06 	sts	0x0603, r24	; 0x800603 <INA+0xd>
    455c:	10 92 f6 05 	sts	0x05F6, r1	; 0x8005f6 <INA>
    4560:	10 92 f7 05 	sts	0x05F7, r1	; 0x8005f7 <INA+0x1>
    4564:	10 92 f8 05 	sts	0x05F8, r1	; 0x8005f8 <INA+0x2>
    4568:	10 92 f9 05 	sts	0x05F9, r1	; 0x8005f9 <INA+0x3>
    456c:	10 92 fe 05 	sts	0x05FE, r1	; 0x8005fe <INA+0x8>
    4570:	10 92 ff 05 	sts	0x05FF, r1	; 0x8005ff <INA+0x9>
    4574:	10 92 00 06 	sts	0x0600, r1	; 0x800600 <INA+0xa>
    4578:	10 92 01 06 	sts	0x0601, r1	; 0x800601 <INA+0xb>
    457c:	10 92 fa 05 	sts	0x05FA, r1	; 0x8005fa <INA+0x4>
    4580:	10 92 fb 05 	sts	0x05FB, r1	; 0x8005fb <INA+0x5>
    4584:	10 92 fc 05 	sts	0x05FC, r1	; 0x8005fc <INA+0x6>
    4588:	10 92 fd 05 	sts	0x05FD, r1	; 0x8005fd <INA+0x7>
    458c:	10 92 06 06 	sts	0x0606, r1	; 0x800606 <INA+0x10>
    4590:	10 92 05 06 	sts	0x0605, r1	; 0x800605 <INA+0xf>
    4594:	08 95       	ret

00004596 <main>:
    4596:	cf 93       	push	r28
    4598:	df 93       	push	r29
    459a:	cd b7       	in	r28, 0x3d	; 61
    459c:	de b7       	in	r29, 0x3e	; 62
    459e:	66 97       	sbiw	r28, 0x16	; 22
    45a0:	0f b6       	in	r0, 0x3f	; 63
    45a2:	f8 94       	cli
    45a4:	de bf       	out	0x3e, r29	; 62
    45a6:	0f be       	out	0x3f, r0	; 63
    45a8:	cd bf       	out	0x3d, r28	; 61
    45aa:	78 94       	sei
    45ac:	84 b5       	in	r24, 0x24	; 36
    45ae:	82 60       	ori	r24, 0x02	; 2
    45b0:	84 bd       	out	0x24, r24	; 36
    45b2:	84 b5       	in	r24, 0x24	; 36
    45b4:	81 60       	ori	r24, 0x01	; 1
    45b6:	84 bd       	out	0x24, r24	; 36
    45b8:	85 b5       	in	r24, 0x25	; 37
    45ba:	82 60       	ori	r24, 0x02	; 2
    45bc:	85 bd       	out	0x25, r24	; 37
    45be:	85 b5       	in	r24, 0x25	; 37
    45c0:	81 60       	ori	r24, 0x01	; 1
    45c2:	85 bd       	out	0x25, r24	; 37
    45c4:	80 91 6e 00 	lds	r24, 0x006E	; 0x80006e <__TEXT_REGION_LENGTH__+0x7e006e>
    45c8:	81 60       	ori	r24, 0x01	; 1
    45ca:	80 93 6e 00 	sts	0x006E, r24	; 0x80006e <__TEXT_REGION_LENGTH__+0x7e006e>
    45ce:	10 92 81 00 	sts	0x0081, r1	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    45d2:	80 91 81 00 	lds	r24, 0x0081	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    45d6:	82 60       	ori	r24, 0x02	; 2
    45d8:	80 93 81 00 	sts	0x0081, r24	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    45dc:	80 91 81 00 	lds	r24, 0x0081	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    45e0:	81 60       	ori	r24, 0x01	; 1
    45e2:	80 93 81 00 	sts	0x0081, r24	; 0x800081 <__TEXT_REGION_LENGTH__+0x7e0081>
    45e6:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    45ea:	81 60       	ori	r24, 0x01	; 1
    45ec:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    45f0:	80 91 b1 00 	lds	r24, 0x00B1	; 0x8000b1 <__TEXT_REGION_LENGTH__+0x7e00b1>
    45f4:	84 60       	ori	r24, 0x04	; 4
    45f6:	80 93 b1 00 	sts	0x00B1, r24	; 0x8000b1 <__TEXT_REGION_LENGTH__+0x7e00b1>
    45fa:	80 91 b0 00 	lds	r24, 0x00B0	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
    45fe:	81 60       	ori	r24, 0x01	; 1
    4600:	80 93 b0 00 	sts	0x00B0, r24	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
    4604:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4608:	84 60       	ori	r24, 0x04	; 4
    460a:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    460e:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4612:	82 60       	ori	r24, 0x02	; 2
    4614:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4618:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    461c:	81 60       	ori	r24, 0x01	; 1
    461e:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4622:	80 91 7a 00 	lds	r24, 0x007A	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    4626:	80 68       	ori	r24, 0x80	; 128
    4628:	80 93 7a 00 	sts	0x007A, r24	; 0x80007a <__TEXT_REGION_LENGTH__+0x7e007a>
    462c:	10 92 c1 00 	sts	0x00C1, r1	; 0x8000c1 <__TEXT_REGION_LENGTH__+0x7e00c1>
    4630:	80 ea       	ldi	r24, 0xA0	; 160
    4632:	93 e0       	ldi	r25, 0x03	; 3
    4634:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    4638:	e6 ef       	ldi	r30, 0xF6	; 246
    463a:	f4 e0       	ldi	r31, 0x04	; 4
    463c:	11 92       	st	Z+, r1
    463e:	11 92       	st	Z+, r1
    4640:	25 e0       	ldi	r18, 0x05	; 5
    4642:	ee 3b       	cpi	r30, 0xBE	; 190
    4644:	f2 07       	cpc	r31, r18
    4646:	d1 f7       	brne	.-12     	; 0x463c <main+0xa6>
    4648:	10 92 be 05 	sts	0x05BE, r1	; 0x8005be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc8>
    464c:	10 92 c3 05 	sts	0x05C3, r1	; 0x8005c3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcd>
    4650:	10 92 c4 05 	sts	0x05C4, r1	; 0x8005c4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xce>
    4654:	10 92 c5 05 	sts	0x05C5, r1	; 0x8005c5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcf>
    4658:	10 92 c6 05 	sts	0x05C6, r1	; 0x8005c6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd0>
    465c:	85 e6       	ldi	r24, 0x65	; 101
    465e:	80 93 c7 05 	sts	0x05C7, r24	; 0x8005c7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd1>
    4662:	10 92 bf 05 	sts	0x05BF, r1	; 0x8005bf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xc9>
    4666:	10 92 c0 05 	sts	0x05C0, r1	; 0x8005c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xca>
    466a:	10 92 c1 05 	sts	0x05C1, r1	; 0x8005c1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcb>
    466e:	10 92 c2 05 	sts	0x05C2, r1	; 0x8005c2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xcc>
    4672:	10 92 ca 05 	sts	0x05CA, r1	; 0x8005ca <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd4>
    4676:	10 92 cb 05 	sts	0x05CB, r1	; 0x8005cb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd5>
    467a:	10 92 cc 05 	sts	0x05CC, r1	; 0x8005cc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd6>
    467e:	10 92 cd 05 	sts	0x05CD, r1	; 0x8005cd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd7>
    4682:	10 92 ce 05 	sts	0x05CE, r1	; 0x8005ce <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd8>
    4686:	10 92 cf 05 	sts	0x05CF, r1	; 0x8005cf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd9>
    468a:	10 92 d0 05 	sts	0x05D0, r1	; 0x8005d0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xda>
    468e:	10 92 d1 05 	sts	0x05D1, r1	; 0x8005d1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdb>
    4692:	10 92 d2 05 	sts	0x05D2, r1	; 0x8005d2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdc>
    4696:	10 92 d3 05 	sts	0x05D3, r1	; 0x8005d3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdd>
    469a:	10 92 d4 05 	sts	0x05D4, r1	; 0x8005d4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xde>
    469e:	10 92 d5 05 	sts	0x05D5, r1	; 0x8005d5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xdf>
    46a2:	10 92 d6 05 	sts	0x05D6, r1	; 0x8005d6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xe0>
    46a6:	8c e2       	ldi	r24, 0x2C	; 44
    46a8:	91 e0       	ldi	r25, 0x01	; 1
    46aa:	90 93 c9 05 	sts	0x05C9, r25	; 0x8005c9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd3>
    46ae:	80 93 c8 05 	sts	0x05C8, r24	; 0x8005c8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11DemodulatorE+0xd2>
    46b2:	0e 94 0b 0a 	call	0x1416	; 0x1416 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE24phase_lost_event_handlerEv>
    46b6:	10 92 ad 02 	sts	0x02AD, r1	; 0x8002ad <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x1>
    46ba:	10 92 ac 02 	sts	0x02AC, r1	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    46be:	10 92 b8 02 	sts	0x02B8, r1	; 0x8002b8 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xc>
    46c2:	10 92 b7 02 	sts	0x02B7, r1	; 0x8002b7 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xb>
    46c6:	10 92 b9 02 	sts	0x02B9, r1	; 0x8002b9 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xd>
    46ca:	10 92 ba 02 	sts	0x02BA, r1	; 0x8002ba <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xe>
    46ce:	10 92 bb 02 	sts	0x02BB, r1	; 0x8002bb <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xf>
    46d2:	10 92 bc 02 	sts	0x02BC, r1	; 0x8002bc <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x10>
    46d6:	88 eb       	ldi	r24, 0xB8	; 184
    46d8:	9b e0       	ldi	r25, 0x0B	; 11
    46da:	a0 e0       	ldi	r26, 0x00	; 0
    46dc:	b0 e0       	ldi	r27, 0x00	; 0
    46de:	80 93 bd 02 	sts	0x02BD, r24	; 0x8002bd <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x11>
    46e2:	90 93 be 02 	sts	0x02BE, r25	; 0x8002be <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x12>
    46e6:	a0 93 bf 02 	sts	0x02BF, r26	; 0x8002bf <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x13>
    46ea:	b0 93 c0 02 	sts	0x02C0, r27	; 0x8002c0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x14>
    46ee:	10 92 b4 02 	sts	0x02B4, r1	; 0x8002b4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x8>
    46f2:	10 92 b3 02 	sts	0x02B3, r1	; 0x8002b3 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x7>
    46f6:	10 92 b2 02 	sts	0x02B2, r1	; 0x8002b2 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x6>
    46fa:	81 e0       	ldi	r24, 0x01	; 1
    46fc:	80 93 b0 02 	sts	0x02B0, r24	; 0x8002b0 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x4>
    4700:	80 93 af 02 	sts	0x02AF, r24	; 0x8002af <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x3>
    4704:	10 92 ae 02 	sts	0x02AE, r1	; 0x8002ae <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x2>
    4708:	80 93 b1 02 	sts	0x02B1, r24	; 0x8002b1 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x5>
    470c:	10 92 b5 02 	sts	0x02B5, r1	; 0x8002b5 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x9>
    4710:	8d e8       	ldi	r24, 0x8D	; 141
    4712:	9f e0       	ldi	r25, 0x0F	; 15
    4714:	90 93 02 01 	sts	0x0102, r25	; 0x800102 <_ZN8Internal23Generic_1_kHz_GeneratorL18the_input_providerE+0x1>
    4718:	80 93 01 01 	sts	0x0101, r24	; 0x800101 <_ZN8Internal23Generic_1_kHz_GeneratorL18the_input_providerE>
    471c:	80 e6       	ldi	r24, 0x60	; 96
    471e:	93 e0       	ldi	r25, 0x03	; 3
    4720:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    4724:	3a 9a       	sbi	0x07, 2	; 7
    4726:	42 98       	cbi	0x08, 2	; 8
    4728:	56 9a       	sbi	0x0a, 6	; 10
    472a:	5e 98       	cbi	0x0b, 6	; 11
    472c:	8b e3       	ldi	r24, 0x3B	; 59
    472e:	93 e0       	ldi	r25, 0x03	; 3
    4730:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    4734:	8f b7       	in	r24, 0x3f	; 63
    4736:	f8 94       	cli
    4738:	94 e6       	ldi	r25, 0x64	; 100
    473a:	97 bd       	out	0x27, r25	; 39
    473c:	18 bc       	out	0x28, r1	; 40
    473e:	93 e3       	ldi	r25, 0x33	; 51
    4740:	94 bd       	out	0x24, r25	; 36
    4742:	99 e0       	ldi	r25, 0x09	; 9
    4744:	95 bd       	out	0x25, r25	; 37
    4746:	10 92 6e 00 	sts	0x006E, r1	; 0x80006e <__TEXT_REGION_LENGTH__+0x7e006e>
    474a:	8f bf       	out	0x3f, r24	; 63
    474c:	8b e0       	ldi	r24, 0x0B	; 11
    474e:	93 e0       	ldi	r25, 0x03	; 3
    4750:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    4754:	28 98       	cbi	0x05, 0	; 5
    4756:	20 9a       	sbi	0x04, 0	; 4
    4758:	5f 98       	cbi	0x0b, 7	; 11
    475a:	57 9a       	sbi	0x0a, 7	; 10
    475c:	2c 98       	cbi	0x05, 4	; 5
    475e:	24 9a       	sbi	0x04, 4	; 4
    4760:	5d 98       	cbi	0x0b, 5	; 11
    4762:	55 9a       	sbi	0x0a, 5	; 10
    4764:	8f ee       	ldi	r24, 0xEF	; 239
    4766:	92 e0       	ldi	r25, 0x02	; 2
    4768:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    476c:	9f b7       	in	r25, 0x3f	; 63
    476e:	f8 94       	cli
    4770:	82 e0       	ldi	r24, 0x02	; 2
    4772:	80 93 b0 00 	sts	0x00B0, r24	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
    4776:	24 e0       	ldi	r18, 0x04	; 4
    4778:	20 93 b1 00 	sts	0x00B1, r18	; 0x8000b1 <__TEXT_REGION_LENGTH__+0x7e00b1>
    477c:	29 ef       	ldi	r18, 0xF9	; 249
    477e:	20 93 b3 00 	sts	0x00B3, r18	; 0x8000b3 <__TEXT_REGION_LENGTH__+0x7e00b3>
    4782:	80 93 70 00 	sts	0x0070, r24	; 0x800070 <__TEXT_REGION_LENGTH__+0x7e0070>
    4786:	10 92 b2 00 	sts	0x00B2, r1	; 0x8000b2 <__TEXT_REGION_LENGTH__+0x7e00b2>
    478a:	9f bf       	out	0x3f, r25	; 63
    478c:	80 91 de 02 	lds	r24, 0x02DE	; 0x8002de <RTC>
    4790:	90 91 df 02 	lds	r25, 0x02DF	; 0x8002df <RTC+0x1>
    4794:	00 97       	sbiw	r24, 0x00	; 0
    4796:	11 f0       	breq	.+4      	; 0x479c <main+0x206>
    4798:	0e 94 da 2b 	call	0x57b4	; 0x57b4 <free>
    479c:	86 e0       	ldi	r24, 0x06	; 6
    479e:	90 e0       	ldi	r25, 0x00	; 0
    47a0:	0e 94 3e 2b 	call	0x567c	; 0x567c <malloc>
    47a4:	8c 01       	movw	r16, r24
    47a6:	88 e6       	ldi	r24, 0x68	; 104
    47a8:	d8 01       	movw	r26, r16
    47aa:	8c 93       	st	X, r24
    47ac:	8a ee       	ldi	r24, 0xEA	; 234
    47ae:	95 e0       	ldi	r25, 0x05	; 5
    47b0:	12 96       	adiw	r26, 0x02	; 2
    47b2:	9c 93       	st	X, r25
    47b4:	8e 93       	st	-X, r24
    47b6:	11 97       	sbiw	r26, 0x01	; 1
    47b8:	13 96       	adiw	r26, 0x03	; 3
    47ba:	1c 92       	st	X, r1
    47bc:	13 97       	sbiw	r26, 0x03	; 3
    47be:	80 e2       	ldi	r24, 0x20	; 32
    47c0:	90 e0       	ldi	r25, 0x00	; 0
    47c2:	15 96       	adiw	r26, 0x05	; 5
    47c4:	9c 93       	st	X, r25
    47c6:	8e 93       	st	-X, r24
    47c8:	14 97       	sbiw	r26, 0x04	; 4
    47ca:	10 93 df 02 	sts	0x02DF, r17	; 0x8002df <RTC+0x1>
    47ce:	00 93 de 02 	sts	0x02DE, r16	; 0x8002de <RTC>
    47d2:	0e 94 61 06 	call	0xcc2	; 0xcc2 <_ZN7TwoWire5beginEv.constprop.17>
    47d6:	81 e0       	ldi	r24, 0x01	; 1
    47d8:	f8 01       	movw	r30, r16
    47da:	83 83       	std	Z+3, r24	; 0x03
    47dc:	c8 01       	movw	r24, r16
    47de:	0e 94 ba 08 	call	0x1174	; 0x1174 <_ZN18Adafruit_I2CDevice8detectedEv>
    47e2:	81 11       	cpse	r24, r1
    47e4:	60 c0       	rjmp	.+192    	; 0x48a6 <main+0x310>
    47e6:	88 ec       	ldi	r24, 0xC8	; 200
    47e8:	92 e0       	ldi	r25, 0x02	; 2
    47ea:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    47ee:	8f e9       	ldi	r24, 0x9F	; 159
    47f0:	92 e0       	ldi	r25, 0x02	; 2
    47f2:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    47f6:	3b 98       	cbi	0x07, 3	; 7
    47f8:	43 98       	cbi	0x08, 3	; 8
    47fa:	25 98       	cbi	0x04, 5	; 4
    47fc:	2d 98       	cbi	0x05, 5	; 5
    47fe:	8e e7       	ldi	r24, 0x7E	; 126
    4800:	92 e0       	ldi	r25, 0x02	; 2
    4802:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    4806:	0e 94 61 06 	call	0xcc2	; 0xcc2 <_ZN7TwoWire5beginEv.constprop.17>
    480a:	0e 94 61 08 	call	0x10c2	; 0x10c2 <_ZN6INA21911isConnectedEv.constprop.26>
    480e:	88 23       	and	r24, r24
    4810:	09 f4       	brne	.+2      	; 0x4814 <main+0x27e>
    4812:	5a c0       	rjmp	.+180    	; 0x48c8 <main+0x332>
    4814:	20 e0       	ldi	r18, 0x00	; 0
    4816:	30 e0       	ldi	r19, 0x00	; 0
    4818:	a9 01       	movw	r20, r18
    481a:	60 91 f6 05 	lds	r22, 0x05F6	; 0x8005f6 <INA>
    481e:	70 91 f7 05 	lds	r23, 0x05F7	; 0x8005f7 <INA+0x1>
    4822:	80 91 f8 05 	lds	r24, 0x05F8	; 0x8005f8 <INA+0x2>
    4826:	90 91 f9 05 	lds	r25, 0x05F9	; 0x8005f9 <INA+0x3>
    482a:	0e 94 2c 28 	call	0x5058	; 0x5058 <__cmpsf2>
    482e:	81 11       	cpse	r24, r1
    4830:	35 c0       	rjmp	.+106    	; 0x489c <main+0x306>
    4832:	88 e5       	ldi	r24, 0x58	; 88
    4834:	92 e0       	ldi	r25, 0x02	; 2
    4836:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    483a:	89 e4       	ldi	r24, 0x49	; 73
    483c:	92 e0       	ldi	r25, 0x02	; 2
    483e:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    4842:	8d ec       	ldi	r24, 0xCD	; 205
    4844:	9c ec       	ldi	r25, 0xCC	; 204
    4846:	ac e4       	ldi	r26, 0x4C	; 76
    4848:	b7 e3       	ldi	r27, 0x37	; 55
    484a:	80 93 f6 05 	sts	0x05F6, r24	; 0x8005f6 <INA>
    484e:	90 93 f7 05 	sts	0x05F7, r25	; 0x8005f7 <INA+0x1>
    4852:	a0 93 f8 05 	sts	0x05F8, r26	; 0x8005f8 <INA+0x2>
    4856:	b0 93 f9 05 	sts	0x05F9, r27	; 0x8005f9 <INA+0x3>
    485a:	8d ec       	ldi	r24, 0xCD	; 205
    485c:	9c ec       	ldi	r25, 0xCC	; 204
    485e:	ac ec       	ldi	r26, 0xCC	; 204
    4860:	be e3       	ldi	r27, 0x3E	; 62
    4862:	80 93 fe 05 	sts	0x05FE, r24	; 0x8005fe <INA+0x8>
    4866:	90 93 ff 05 	sts	0x05FF, r25	; 0x8005ff <INA+0x9>
    486a:	a0 93 00 06 	sts	0x0600, r26	; 0x800600 <INA+0xa>
    486e:	b0 93 01 06 	sts	0x0601, r27	; 0x800601 <INA+0xb>
    4872:	80 93 fa 05 	sts	0x05FA, r24	; 0x8005fa <INA+0x4>
    4876:	90 93 fb 05 	sts	0x05FB, r25	; 0x8005fb <INA+0x5>
    487a:	a0 93 fc 05 	sts	0x05FC, r26	; 0x8005fc <INA+0x6>
    487e:	b0 93 fd 05 	sts	0x05FD, r27	; 0x8005fd <INA+0x7>
    4882:	64 ec       	ldi	r22, 0xC4	; 196
    4884:	70 e2       	ldi	r23, 0x20	; 32
    4886:	85 e0       	ldi	r24, 0x05	; 5
    4888:	0e 94 78 08 	call	0x10f0	; 0x10f0 <_ZN6INA21914_writeRegisterEhj.constprop.25>
    488c:	80 e0       	ldi	r24, 0x00	; 0
    488e:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6INA21913_readRegisterEh.constprop.123>
    4892:	bc 01       	movw	r22, r24
    4894:	68 67       	ori	r22, 0x78	; 120
    4896:	80 e0       	ldi	r24, 0x00	; 0
    4898:	0e 94 78 08 	call	0x10f0	; 0x10f0 <_ZN6INA21914_writeRegisterEhj.constprop.25>
    489c:	88 ee       	ldi	r24, 0xE8	; 232
    489e:	93 e0       	ldi	r25, 0x03	; 3
    48a0:	0e 94 8b 10 	call	0x2116	; 0x2116 <_Z4waitj>
    48a4:	15 c0       	rjmp	.+42     	; 0x48d0 <main+0x33a>
    48a6:	8f e0       	ldi	r24, 0x0F	; 15
    48a8:	0e 94 4f 11 	call	0x229e	; 0x229e <_ZN7RTC_I2C13read_registerEh.constprop.41>
    48ac:	68 2f       	mov	r22, r24
    48ae:	67 7f       	andi	r22, 0xF7	; 247
    48b0:	8f e0       	ldi	r24, 0x0F	; 15
    48b2:	0e 94 37 11 	call	0x226e	; 0x226e <_ZN7RTC_I2C14write_registerEhh.constprop.42>
    48b6:	8e e0       	ldi	r24, 0x0E	; 14
    48b8:	0e 94 4f 11 	call	0x229e	; 0x229e <_ZN7RTC_I2C13read_registerEh.constprop.41>
    48bc:	68 2f       	mov	r22, r24
    48be:	6c 61       	ori	r22, 0x1C	; 28
    48c0:	8e e0       	ldi	r24, 0x0E	; 14
    48c2:	0e 94 37 11 	call	0x226e	; 0x226e <_ZN7RTC_I2C14write_registerEhh.constprop.42>
    48c6:	93 cf       	rjmp	.-218    	; 0x47ee <main+0x258>
    48c8:	87 e2       	ldi	r24, 0x27	; 39
    48ca:	92 e0       	ldi	r25, 0x02	; 2
    48cc:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    48d0:	8a ef       	ldi	r24, 0xFA	; 250
    48d2:	91 e0       	ldi	r25, 0x01	; 1
    48d4:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    48d8:	53 98       	cbi	0x0a, 3	; 10
    48da:	5b 9a       	sbi	0x0b, 3	; 11
    48dc:	52 98       	cbi	0x0a, 2	; 10
    48de:	5a 9a       	sbi	0x0b, 2	; 11
    48e0:	39 98       	cbi	0x07, 1	; 7
    48e2:	41 9a       	sbi	0x08, 1	; 8
    48e4:	54 98       	cbi	0x0a, 4	; 10
    48e6:	5c 9a       	sbi	0x0b, 4	; 11
    48e8:	21 9a       	sbi	0x04, 1	; 4
    48ea:	29 98       	cbi	0x05, 1	; 5
    48ec:	22 9a       	sbi	0x04, 2	; 4
    48ee:	2a 98       	cbi	0x05, 2	; 5
    48f0:	23 9a       	sbi	0x04, 3	; 4
    48f2:	2b 98       	cbi	0x05, 3	; 5
    48f4:	83 ee       	ldi	r24, 0xE3	; 227
    48f6:	91 e0       	ldi	r25, 0x01	; 1
    48f8:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    48fc:	89 e1       	ldi	r24, 0x19	; 25
    48fe:	0e 94 b0 0f 	call	0x1f60	; 0x1f60 <_Z13setBrightnessh>
    4902:	82 ee       	ldi	r24, 0xE2	; 226
    4904:	93 e0       	ldi	r25, 0x03	; 3
    4906:	0e 94 62 02 	call	0x4c4	; 0x4c4 <_Z20putDigitsToInputRegsPhh.constprop.118>
    490a:	0e 94 86 10 	call	0x210c	; 0x210c <_Z16pushToOutputRegsv>
    490e:	88 ee       	ldi	r24, 0xE8	; 232
    4910:	93 e0       	ldi	r25, 0x03	; 3
    4912:	0e 94 8b 10 	call	0x2116	; 0x2116 <_Z4waitj>
    4916:	86 ea       	ldi	r24, 0xA6	; 166
    4918:	90 e0       	ldi	r25, 0x00	; 0
    491a:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    491e:	0e 94 61 14 	call	0x28c2	; 0x28c2 <_Z16startDiagnosticsv>
    4922:	80 ea       	ldi	r24, 0xA0	; 160
    4924:	9f e1       	ldi	r25, 0x1F	; 31
    4926:	0e 94 8b 10 	call	0x2116	; 0x2116 <_Z4waitj>
    492a:	0e 94 54 14 	call	0x28a8	; 0x28a8 <_Z15stopDiagnosticsv>
    492e:	88 e6       	ldi	r24, 0x68	; 104
    4930:	90 e0       	ldi	r25, 0x00	; 0
    4932:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    4936:	5c 99       	sbic	0x0b, 4	; 11
    4938:	2d c2       	rjmp	.+1114   	; 0x4d94 <main+0x7fe>
    493a:	88 e9       	ldi	r24, 0x98	; 152
    493c:	91 e0       	ldi	r25, 0x01	; 1
    493e:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    4942:	88 e7       	ldi	r24, 0x78	; 120
    4944:	91 e0       	ldi	r25, 0x01	; 1
    4946:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    494a:	19 82       	std	Y+1, r1	; 0x01
    494c:	1a 82       	std	Y+2, r1	; 0x02
    494e:	1b 82       	std	Y+3, r1	; 0x03
    4950:	81 e0       	ldi	r24, 0x01	; 1
    4952:	8c 83       	std	Y+4, r24	; 0x04
    4954:	8d 83       	std	Y+5, r24	; 0x05
    4956:	1e 82       	std	Y+6, r1	; 0x06
    4958:	ce 01       	movw	r24, r28
    495a:	01 96       	adiw	r24, 0x01	; 1
    495c:	0e 94 72 11 	call	0x22e4	; 0x22e4 <_ZN10RTC_DS32316adjustERK8DateTime.constprop.40>
    4960:	8d e2       	ldi	r24, 0x2D	; 45
    4962:	91 e0       	ldi	r25, 0x01	; 1
    4964:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    4968:	0e 94 10 12 	call	0x2420	; 0x2420 <_Z16getTimeInMinutesv>
    496c:	0e 94 14 10 	call	0x2028	; 0x2028 <_Z11displayTimej>
    4970:	8b e0       	ldi	r24, 0x0B	; 11
    4972:	91 e0       	ldi	r25, 0x01	; 1
    4974:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    4978:	25 9a       	sbi	0x04, 5	; 4
    497a:	8a ee       	ldi	r24, 0xEA	; 234
    497c:	90 e0       	ldi	r25, 0x00	; 0
    497e:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    4982:	1a e0       	ldi	r17, 0x0A	; 10
    4984:	0c e3       	ldi	r16, 0x3C	; 60
    4986:	5a e0       	ldi	r21, 0x0A	; 10
    4988:	25 2e       	mov	r2, r21
    498a:	31 2c       	mov	r3, r1
    498c:	80 91 d0 02 	lds	r24, 0x02D0	; 0x8002d0 <LED_B_REG>
    4990:	88 23       	and	r24, r24
    4992:	09 f4       	brne	.+2      	; 0x4996 <main+0x400>
    4994:	09 c2       	rjmp	.+1042   	; 0x4da8 <main+0x812>
    4996:	90 91 cf 02 	lds	r25, 0x02CF	; 0x8002cf <LED_B_CNT>
    499a:	80 91 d0 02 	lds	r24, 0x02D0	; 0x8002d0 <LED_B_REG>
    499e:	98 17       	cp	r25, r24
    49a0:	08 f4       	brcc	.+2      	; 0x49a4 <main+0x40e>
    49a2:	02 c2       	rjmp	.+1028   	; 0x4da8 <main+0x812>
    49a4:	2b 9a       	sbi	0x05, 3	; 5
    49a6:	80 91 ce 02 	lds	r24, 0x02CE	; 0x8002ce <new_minute_flag>
    49aa:	88 23       	and	r24, r24
    49ac:	51 f0       	breq	.+20     	; 0x49c2 <main+0x42c>
    49ae:	10 92 ce 02 	sts	0x02CE, r1	; 0x8002ce <new_minute_flag>
    49b2:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <MODE>
    49b6:	81 11       	cpse	r24, r1
    49b8:	04 c0       	rjmp	.+8      	; 0x49c2 <main+0x42c>
    49ba:	0e 94 10 12 	call	0x2420	; 0x2420 <_Z16getTimeInMinutesv>
    49be:	0e 94 14 10 	call	0x2028	; 0x2028 <_Z11displayTimej>
    49c2:	80 91 cd 02 	lds	r24, 0x02CD	; 0x8002cd <new_second_flag>
    49c6:	88 23       	and	r24, r24
    49c8:	09 f4       	brne	.+2      	; 0x49cc <main+0x436>
    49ca:	b1 c1       	rjmp	.+866    	; 0x4d2e <main+0x798>
    49cc:	10 92 cd 02 	sts	0x02CD, r1	; 0x8002cd <new_second_flag>
    49d0:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <MODE>
    49d4:	81 ff       	sbrs	r24, 1
    49d6:	11 c0       	rjmp	.+34     	; 0x49fa <main+0x464>
    49d8:	80 91 cc 02 	lds	r24, 0x02CC	; 0x8002cc <selected_digit>
    49dc:	e8 2f       	mov	r30, r24
    49de:	f0 e0       	ldi	r31, 0x00	; 0
    49e0:	ee 51       	subi	r30, 0x1E	; 30
    49e2:	fc 4f       	sbci	r31, 0xFC	; 252
    49e4:	60 81       	ld	r22, Z
    49e6:	70 e0       	ldi	r23, 0x00	; 0
    49e8:	66 0f       	add	r22, r22
    49ea:	67 2f       	mov	r22, r23
    49ec:	66 1f       	adc	r22, r22
    49ee:	77 0b       	sbc	r23, r23
    49f0:	f1 e0       	ldi	r31, 0x01	; 1
    49f2:	6f 27       	eor	r22, r31
    49f4:	61 70       	andi	r22, 0x01	; 1
    49f6:	0e 94 ce 0f 	call	0x1f9c	; 0x1f9c <_Z18setNumitronSegmenthhb.constprop.116>
    49fa:	d0 90 ac 02 	lds	r13, 0x02AC	; 0x8002ac <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE>
    49fe:	21 e0       	ldi	r18, 0x01	; 1
    4a00:	2d 15       	cp	r18, r13
    4a02:	08 f0       	brcs	.+2      	; 0x4a06 <main+0x470>
    4a04:	83 c0       	rjmp	.+262    	; 0x4b0c <main+0x576>
    4a06:	25 98       	cbi	0x04, 5	; 4
    4a08:	80 91 c5 02 	lds	r24, 0x02C5	; 0x8002c5 <_ZZ21handleDCF77ClockStatevE10last_state>
    4a0c:	82 30       	cpi	r24, 0x02	; 2
    4a0e:	08 f0       	brcs	.+2      	; 0x4a12 <main+0x47c>
    4a10:	60 c0       	rjmp	.+192    	; 0x4ad2 <main+0x53c>
    4a12:	90 91 b6 02 	lds	r25, 0x02B6	; 0x8002b6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    4a16:	80 91 b6 02 	lds	r24, 0x02B6	; 0x8002b6 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0xa>
    4a1a:	98 17       	cp	r25, r24
    4a1c:	e1 f3       	breq	.-8      	; 0x4a16 <main+0x480>
    4a1e:	9f b7       	in	r25, 0x3f	; 63
    4a20:	f8 94       	cli
    4a22:	88 e0       	ldi	r24, 0x08	; 8
    4a24:	ee ea       	ldi	r30, 0xAE	; 174
    4a26:	f2 e0       	ldi	r31, 0x02	; 2
    4a28:	de 01       	movw	r26, r28
    4a2a:	1b 96       	adiw	r26, 0x0b	; 11
    4a2c:	01 90       	ld	r0, Z+
    4a2e:	0d 92       	st	X+, r0
    4a30:	8a 95       	dec	r24
    4a32:	e1 f7       	brne	.-8      	; 0x4a2c <main+0x496>
    4a34:	80 91 b4 02 	lds	r24, 0x02B4	; 0x8002b4 <_ZN8Internal22DCF77_Clock_ControllerI13ConfigurationNS_23DCF77_Frequency_ControlEE11Local_ClockE+0x8>
    4a38:	9f bf       	out	0x3f, r25	; 63
    4a3a:	0e 94 3d 0c 	call	0x187a	; 0x187a <_ZN3BCD10int_to_bcdEh>
    4a3e:	8f 83       	std	Y+7, r24	; 0x07
    4a40:	88 89       	ldd	r24, Y+16	; 0x10
    4a42:	8e 83       	std	Y+6, r24	; 0x06
    4a44:	4f 85       	ldd	r20, Y+15	; 0x0f
    4a46:	4d 83       	std	Y+5, r20	; 0x05
    4a48:	9d 85       	ldd	r25, Y+13	; 0x0d
    4a4a:	9b 83       	std	Y+3, r25	; 0x03
    4a4c:	2c 85       	ldd	r18, Y+12	; 0x0c
    4a4e:	2a 83       	std	Y+2, r18	; 0x02
    4a50:	3b 85       	ldd	r19, Y+11	; 0x0b
    4a52:	39 83       	std	Y+1, r19	; 0x01
    4a54:	54 2f       	mov	r21, r20
    4a56:	52 95       	swap	r21
    4a58:	5f 70       	andi	r21, 0x0F	; 15
    4a5a:	4f 70       	andi	r20, 0x0F	; 15
    4a5c:	e4 2e       	mov	r14, r20
    4a5e:	51 9f       	mul	r21, r17
    4a60:	e0 0c       	add	r14, r0
    4a62:	11 24       	eor	r1, r1
    4a64:	48 2f       	mov	r20, r24
    4a66:	42 95       	swap	r20
    4a68:	4f 70       	andi	r20, 0x0F	; 15
    4a6a:	8f 70       	andi	r24, 0x0F	; 15
    4a6c:	f8 2e       	mov	r15, r24
    4a6e:	41 9f       	mul	r20, r17
    4a70:	f0 0c       	add	r15, r0
    4a72:	11 24       	eor	r1, r1
    4a74:	89 2f       	mov	r24, r25
    4a76:	82 95       	swap	r24
    4a78:	8f 70       	andi	r24, 0x0F	; 15
    4a7a:	9f 70       	andi	r25, 0x0F	; 15
    4a7c:	81 9f       	mul	r24, r17
    4a7e:	90 0d       	add	r25, r0
    4a80:	11 24       	eor	r1, r1
    4a82:	82 2f       	mov	r24, r18
    4a84:	82 95       	swap	r24
    4a86:	8f 70       	andi	r24, 0x0F	; 15
    4a88:	2f 70       	andi	r18, 0x0F	; 15
    4a8a:	81 9f       	mul	r24, r17
    4a8c:	20 0d       	add	r18, r0
    4a8e:	11 24       	eor	r1, r1
    4a90:	83 2f       	mov	r24, r19
    4a92:	82 95       	swap	r24
    4a94:	8f 70       	andi	r24, 0x0F	; 15
    4a96:	3f 70       	andi	r19, 0x0F	; 15
    4a98:	81 9f       	mul	r24, r17
    4a9a:	30 0d       	add	r19, r0
    4a9c:	11 24       	eor	r1, r1
    4a9e:	3b 87       	std	Y+11, r19	; 0x0b
    4aa0:	2c 87       	std	Y+12, r18	; 0x0c
    4aa2:	9d 87       	std	Y+13, r25	; 0x0d
    4aa4:	ee 86       	std	Y+14, r14	; 0x0e
    4aa6:	ff 86       	std	Y+15, r15	; 0x0f
    4aa8:	18 8a       	std	Y+16, r1	; 0x10
    4aaa:	ce 01       	movw	r24, r28
    4aac:	0b 96       	adiw	r24, 0x0b	; 11
    4aae:	0e 94 72 11 	call	0x22e4	; 0x22e4 <_ZN10RTC_DS32316adjustERK8DateTime.constprop.40>
    4ab2:	8f 2d       	mov	r24, r15
    4ab4:	90 e0       	ldi	r25, 0x00	; 0
    4ab6:	e0 9e       	mul	r14, r16
    4ab8:	80 0d       	add	r24, r0
    4aba:	91 1d       	adc	r25, r1
    4abc:	11 24       	eor	r1, r1
    4abe:	90 93 c4 02 	sts	0x02C4, r25	; 0x8002c4 <minutes_count+0x1>
    4ac2:	80 93 c3 02 	sts	0x02C3, r24	; 0x8002c3 <minutes_count>
    4ac6:	10 92 c2 02 	sts	0x02C2, r1	; 0x8002c2 <timer_counter+0x1>
    4aca:	10 92 c1 02 	sts	0x02C1, r1	; 0x8002c1 <timer_counter>
    4ace:	0e 94 14 10 	call	0x2028	; 0x2028 <_Z11displayTimej>
    4ad2:	81 e0       	ldi	r24, 0x01	; 1
    4ad4:	0e 94 62 04 	call	0x8c4	; 0x8c4 <pinMode.constprop.43>
    4ad8:	60 e0       	ldi	r22, 0x00	; 0
    4ada:	81 e0       	ldi	r24, 0x01	; 1
    4adc:	0e 94 7e 05 	call	0xafc	; 0xafc <digitalWrite>
    4ae0:	c0 90 03 01 	lds	r12, 0x0103	; 0x800103 <led_brightness>
    4ae4:	ec 2c       	mov	r14, r12
    4ae6:	f1 2c       	mov	r15, r1
    4ae8:	82 e0       	ldi	r24, 0x02	; 2
    4aea:	0e 94 62 04 	call	0x8c4	; 0x8c4 <pinMode.constprop.43>
    4aee:	e1 14       	cp	r14, r1
    4af0:	f1 04       	cpc	r15, r1
    4af2:	09 f0       	breq	.+2      	; 0x4af6 <main+0x560>
    4af4:	5b c1       	rjmp	.+694    	; 0x4dac <main+0x816>
    4af6:	60 e0       	ldi	r22, 0x00	; 0
    4af8:	82 e0       	ldi	r24, 0x02	; 2
    4afa:	0e 94 7e 05 	call	0xafc	; 0xafc <digitalWrite>
    4afe:	83 e0       	ldi	r24, 0x03	; 3
    4b00:	0e 94 62 04 	call	0x8c4	; 0x8c4 <pinMode.constprop.43>
    4b04:	60 e0       	ldi	r22, 0x00	; 0
    4b06:	83 e0       	ldi	r24, 0x03	; 3
    4b08:	0e 94 7e 05 	call	0xafc	; 0xafc <digitalWrite>
    4b0c:	d0 92 c5 02 	sts	0x02C5, r13	; 0x8002c5 <_ZZ21handleDCF77ClockStatevE10last_state>
    4b10:	0e 94 61 08 	call	0x10c2	; 0x10c2 <_ZN6INA21911isConnectedEv.constprop.26>
    4b14:	88 23       	and	r24, r24
    4b16:	09 f4       	brne	.+2      	; 0x4b1a <main+0x584>
    4b18:	0a c1       	rjmp	.+532    	; 0x4d2e <main+0x798>
    4b1a:	87 ea       	ldi	r24, 0xA7	; 167
    4b1c:	91 e0       	ldi	r25, 0x01	; 1
    4b1e:	0e 94 5b 13 	call	0x26b6	; 0x26b6 <_ZN5Print7printlnEPKc.constprop.37>
    4b22:	89 ec       	ldi	r24, 0xC9	; 201
    4b24:	91 e0       	ldi	r25, 0x01	; 1
    4b26:	0e 94 fc 12 	call	0x25f8	; 0x25f8 <_ZN5Print5writeEPKc.part.2.constprop.112>
    4b2a:	82 e0       	ldi	r24, 0x02	; 2
    4b2c:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6INA21913_readRegisterEh.constprop.123>
    4b30:	80 fd       	sbrc	r24, 0
    4b32:	85 c1       	rjmp	.+778    	; 0x4e3e <main+0x8a8>
    4b34:	33 e0       	ldi	r19, 0x03	; 3
    4b36:	96 95       	lsr	r25
    4b38:	87 95       	ror	r24
    4b3a:	3a 95       	dec	r19
    4b3c:	e1 f7       	brne	.-8      	; 0x4b36 <main+0x5a0>
    4b3e:	bc 01       	movw	r22, r24
    4b40:	90 e0       	ldi	r25, 0x00	; 0
    4b42:	80 e0       	ldi	r24, 0x00	; 0
    4b44:	0e 94 31 28 	call	0x5062	; 0x5062 <__floatunsisf>
    4b48:	2f e6       	ldi	r18, 0x6F	; 111
    4b4a:	32 e1       	ldi	r19, 0x12	; 18
    4b4c:	43 e8       	ldi	r20, 0x83	; 131
    4b4e:	5b e3       	ldi	r21, 0x3B	; 59
    4b50:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4b54:	0e 94 45 14 	call	0x288a	; 0x288a <_ZN5Print7printlnEdi.constprop.29>
    4b58:	85 ee       	ldi	r24, 0xE5	; 229
    4b5a:	93 e0       	ldi	r25, 0x03	; 3
    4b5c:	0e 94 2f 05 	call	0xa5e	; 0xa5e <_ZN5Print5printEPK19__FlashStringHelper.constprop.108>
    4b60:	81 e0       	ldi	r24, 0x01	; 1
    4b62:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6INA21913_readRegisterEh.constprop.123>
    4b66:	bc 01       	movw	r22, r24
    4b68:	99 0f       	add	r25, r25
    4b6a:	88 0b       	sbc	r24, r24
    4b6c:	99 0b       	sbc	r25, r25
    4b6e:	0e 94 33 28 	call	0x5066	; 0x5066 <__floatsisf>
    4b72:	2c ea       	ldi	r18, 0xAC	; 172
    4b74:	35 ec       	ldi	r19, 0xC5	; 197
    4b76:	47 e2       	ldi	r20, 0x27	; 39
    4b78:	57 e3       	ldi	r21, 0x37	; 55
    4b7a:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4b7e:	20 e0       	ldi	r18, 0x00	; 0
    4b80:	30 e0       	ldi	r19, 0x00	; 0
    4b82:	4a e7       	ldi	r20, 0x7A	; 122
    4b84:	54 e4       	ldi	r21, 0x44	; 68
    4b86:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4b8a:	0e 94 45 14 	call	0x288a	; 0x288a <_ZN5Print7printlnEdi.constprop.29>
    4b8e:	e2 ee       	ldi	r30, 0xE2	; 226
    4b90:	f3 e0       	ldi	r31, 0x03	; 3
    4b92:	f1 2c       	mov	r15, r1
    4b94:	81 91       	ld	r24, Z+
    4b96:	90 e0       	ldi	r25, 0x00	; 0
    4b98:	0e 94 e5 29 	call	0x53ca	; 0x53ca <__popcounthi2>
    4b9c:	f8 0e       	add	r15, r24
    4b9e:	86 ee       	ldi	r24, 0xE6	; 230
    4ba0:	93 e0       	ldi	r25, 0x03	; 3
    4ba2:	8e 17       	cp	r24, r30
    4ba4:	9f 07       	cpc	r25, r31
    4ba6:	b1 f7       	brne	.-20     	; 0x4b94 <main+0x5fe>
    4ba8:	82 e0       	ldi	r24, 0x02	; 2
    4baa:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6INA21913_readRegisterEh.constprop.123>
    4bae:	80 fd       	sbrc	r24, 0
    4bb0:	4b c1       	rjmp	.+662    	; 0x4e48 <main+0x8b2>
    4bb2:	23 e0       	ldi	r18, 0x03	; 3
    4bb4:	96 95       	lsr	r25
    4bb6:	87 95       	ror	r24
    4bb8:	2a 95       	dec	r18
    4bba:	e1 f7       	brne	.-8      	; 0x4bb4 <main+0x61e>
    4bbc:	bc 01       	movw	r22, r24
    4bbe:	90 e0       	ldi	r25, 0x00	; 0
    4bc0:	80 e0       	ldi	r24, 0x00	; 0
    4bc2:	0e 94 31 28 	call	0x5062	; 0x5062 <__floatunsisf>
    4bc6:	2f e6       	ldi	r18, 0x6F	; 111
    4bc8:	32 e1       	ldi	r19, 0x12	; 18
    4bca:	43 e8       	ldi	r20, 0x83	; 131
    4bcc:	5b e3       	ldi	r21, 0x3B	; 59
    4bce:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4bd2:	2d ec       	ldi	r18, 0xCD	; 205
    4bd4:	3c ec       	ldi	r19, 0xCC	; 204
    4bd6:	4c e4       	ldi	r20, 0x4C	; 76
    4bd8:	5e e3       	ldi	r21, 0x3E	; 62
    4bda:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4bde:	4b 01       	movw	r8, r22
    4be0:	5c 01       	movw	r10, r24
    4be2:	60 91 cb 02 	lds	r22, 0x02CB	; 0x8002cb <_target_brightness>
    4be6:	70 e0       	ldi	r23, 0x00	; 0
    4be8:	90 e0       	ldi	r25, 0x00	; 0
    4bea:	80 e0       	ldi	r24, 0x00	; 0
    4bec:	0e 94 31 28 	call	0x5062	; 0x5062 <__floatunsisf>
    4bf0:	20 e0       	ldi	r18, 0x00	; 0
    4bf2:	30 e0       	ldi	r19, 0x00	; 0
    4bf4:	48 ec       	ldi	r20, 0xC8	; 200
    4bf6:	52 e4       	ldi	r21, 0x42	; 66
    4bf8:	0e 94 93 2a 	call	0x5526	; 0x5526 <__divsf3>
    4bfc:	2b 01       	movw	r4, r22
    4bfe:	3c 01       	movw	r6, r24
    4c00:	6f 2d       	mov	r22, r15
    4c02:	70 e0       	ldi	r23, 0x00	; 0
    4c04:	90 e0       	ldi	r25, 0x00	; 0
    4c06:	80 e0       	ldi	r24, 0x00	; 0
    4c08:	0e 94 31 28 	call	0x5062	; 0x5062 <__floatunsisf>
    4c0c:	6b 8b       	std	Y+19, r22	; 0x13
    4c0e:	7c 8b       	std	Y+20, r23	; 0x14
    4c10:	8d 8b       	std	Y+21, r24	; 0x15
    4c12:	9e 8b       	std	Y+22, r25	; 0x16
    4c14:	2c ee       	ldi	r18, 0xEC	; 236
    4c16:	31 e5       	ldi	r19, 0x51	; 81
    4c18:	4c e4       	ldi	r20, 0x4C	; 76
    4c1a:	51 e4       	ldi	r21, 0x41	; 65
    4c1c:	c3 01       	movw	r24, r6
    4c1e:	b2 01       	movw	r22, r4
    4c20:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4c24:	a5 01       	movw	r20, r10
    4c26:	94 01       	movw	r18, r8
    4c28:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4c2c:	2b 89       	ldd	r18, Y+19	; 0x13
    4c2e:	3c 89       	ldd	r19, Y+20	; 0x14
    4c30:	4d 89       	ldd	r20, Y+21	; 0x15
    4c32:	5e 89       	ldd	r21, Y+22	; 0x16
    4c34:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4c38:	6b 01       	movw	r12, r22
    4c3a:	7c 01       	movw	r14, r24
    4c3c:	2c ee       	ldi	r18, 0xEC	; 236
    4c3e:	31 e5       	ldi	r19, 0x51	; 81
    4c40:	4c e5       	ldi	r20, 0x5C	; 92
    4c42:	51 e4       	ldi	r21, 0x41	; 65
    4c44:	c3 01       	movw	r24, r6
    4c46:	b2 01       	movw	r22, r4
    4c48:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4c4c:	a5 01       	movw	r20, r10
    4c4e:	94 01       	movw	r18, r8
    4c50:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4c54:	2b 89       	ldd	r18, Y+19	; 0x13
    4c56:	3c 89       	ldd	r19, Y+20	; 0x14
    4c58:	4d 89       	ldd	r20, Y+21	; 0x15
    4c5a:	5e 89       	ldd	r21, Y+22	; 0x16
    4c5c:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4c60:	4b 01       	movw	r8, r22
    4c62:	5c 01       	movw	r10, r24
    4c64:	84 e0       	ldi	r24, 0x04	; 4
    4c66:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6INA21913_readRegisterEh.constprop.123>
    4c6a:	bc 01       	movw	r22, r24
    4c6c:	99 0f       	add	r25, r25
    4c6e:	88 0b       	sbc	r24, r24
    4c70:	99 0b       	sbc	r25, r25
    4c72:	0e 94 33 28 	call	0x5066	; 0x5066 <__floatsisf>
    4c76:	20 91 f6 05 	lds	r18, 0x05F6	; 0x8005f6 <INA>
    4c7a:	30 91 f7 05 	lds	r19, 0x05F7	; 0x8005f7 <INA+0x1>
    4c7e:	40 91 f8 05 	lds	r20, 0x05F8	; 0x8005f8 <INA+0x2>
    4c82:	50 91 f9 05 	lds	r21, 0x05F9	; 0x8005f9 <INA+0x3>
    4c86:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4c8a:	20 e0       	ldi	r18, 0x00	; 0
    4c8c:	30 e0       	ldi	r19, 0x00	; 0
    4c8e:	4a e7       	ldi	r20, 0x7A	; 122
    4c90:	54 e4       	ldi	r21, 0x44	; 68
    4c92:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4c96:	2b 01       	movw	r4, r22
    4c98:	3c 01       	movw	r6, r24
    4c9a:	84 ec       	ldi	r24, 0xC4	; 196
    4c9c:	93 e0       	ldi	r25, 0x03	; 3
    4c9e:	0e 94 2f 05 	call	0xa5e	; 0xa5e <_ZN5Print5printEPK19__FlashStringHelper.constprop.108>
    4ca2:	84 e0       	ldi	r24, 0x04	; 4
    4ca4:	0e 94 a7 12 	call	0x254e	; 0x254e <_ZN6INA21913_readRegisterEh.constprop.123>
    4ca8:	bc 01       	movw	r22, r24
    4caa:	99 0f       	add	r25, r25
    4cac:	88 0b       	sbc	r24, r24
    4cae:	99 0b       	sbc	r25, r25
    4cb0:	0e 94 33 28 	call	0x5066	; 0x5066 <__floatsisf>
    4cb4:	20 91 f6 05 	lds	r18, 0x05F6	; 0x8005f6 <INA>
    4cb8:	30 91 f7 05 	lds	r19, 0x05F7	; 0x8005f7 <INA+0x1>
    4cbc:	40 91 f8 05 	lds	r20, 0x05F8	; 0x8005f8 <INA+0x2>
    4cc0:	50 91 f9 05 	lds	r21, 0x05F9	; 0x8005f9 <INA+0x3>
    4cc4:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4cc8:	20 e0       	ldi	r18, 0x00	; 0
    4cca:	30 e0       	ldi	r19, 0x00	; 0
    4ccc:	4a e7       	ldi	r20, 0x7A	; 122
    4cce:	54 e4       	ldi	r21, 0x44	; 68
    4cd0:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4cd4:	42 e0       	ldi	r20, 0x02	; 2
    4cd6:	0e 94 69 13 	call	0x26d2	; 0x26d2 <_ZN5Print10printFloatEdh.constprop.30>
    4cda:	84 ee       	ldi	r24, 0xE4	; 228
    4cdc:	91 e0       	ldi	r25, 0x01	; 1
    4cde:	0e 94 fc 12 	call	0x25f8	; 0x25f8 <_ZN5Print5writeEPKc.part.2.constprop.112>
    4ce2:	c5 01       	movw	r24, r10
    4ce4:	b4 01       	movw	r22, r8
    4ce6:	0e 94 45 14 	call	0x288a	; 0x288a <_ZN5Print7printlnEdi.constprop.29>
    4cea:	8e ef       	ldi	r24, 0xFE	; 254
    4cec:	91 e0       	ldi	r25, 0x01	; 1
    4cee:	0e 94 fc 12 	call	0x25f8	; 0x25f8 <_ZN5Print5writeEPKc.part.2.constprop.112>
    4cf2:	c7 01       	movw	r24, r14
    4cf4:	b6 01       	movw	r22, r12
    4cf6:	0e 94 45 14 	call	0x288a	; 0x288a <_ZN5Print7printlnEdi.constprop.29>
    4cfa:	88 e1       	ldi	r24, 0x18	; 24
    4cfc:	92 e0       	ldi	r25, 0x02	; 2
    4cfe:	0e 94 5b 13 	call	0x26b6	; 0x26b6 <_ZN5Print7printlnEPKc.constprop.37>
    4d02:	a5 01       	movw	r20, r10
    4d04:	94 01       	movw	r18, r8
    4d06:	c7 01       	movw	r24, r14
    4d08:	b6 01       	movw	r22, r12
    4d0a:	0e 94 27 2a 	call	0x544e	; 0x544e <__addsf3>
    4d0e:	20 e0       	ldi	r18, 0x00	; 0
    4d10:	30 e0       	ldi	r19, 0x00	; 0
    4d12:	40 e0       	ldi	r20, 0x00	; 0
    4d14:	5f e3       	ldi	r21, 0x3F	; 63
    4d16:	0e 94 92 28 	call	0x5124	; 0x5124 <__mulsf3>
    4d1a:	a3 01       	movw	r20, r6
    4d1c:	92 01       	movw	r18, r4
    4d1e:	0e 94 93 2a 	call	0x5526	; 0x5526 <__divsf3>
    4d22:	0e 94 45 14 	call	0x288a	; 0x288a <_ZN5Print7printlnEdi.constprop.29>
    4d26:	85 e2       	ldi	r24, 0x25	; 37
    4d28:	92 e0       	ldi	r25, 0x02	; 2
    4d2a:	0e 94 5b 13 	call	0x26b6	; 0x26b6 <_ZN5Print7printlnEPKc.constprop.37>
    4d2e:	4c 99       	sbic	0x09, 4	; 9
    4d30:	03 c0       	rjmp	.+6      	; 0x4d38 <main+0x7a2>
    4d32:	81 e0       	ldi	r24, 0x01	; 1
    4d34:	80 93 ca 02 	sts	0x02CA, r24	; 0x8002ca <MS_mode>
    4d38:	80 91 0b 01 	lds	r24, 0x010B	; 0x80010b <debounce_cnt>
    4d3c:	80 34       	cpi	r24, 0x40	; 64
    4d3e:	e8 f0       	brcs	.+58     	; 0x4d7a <main+0x7e4>
    4d40:	89 b1       	in	r24, 0x09	; 9
    4d42:	90 91 0a 01 	lds	r25, 0x010A	; 0x80010a <STABLE_REG>
    4d46:	89 27       	eor	r24, r25
    4d48:	8c 70       	andi	r24, 0x0C	; 12
    4d4a:	39 f4       	brne	.+14     	; 0x4d5a <main+0x7c4>
    4d4c:	80 91 08 01 	lds	r24, 0x0108	; 0x800108 <long_press_cnt>
    4d50:	90 91 09 01 	lds	r25, 0x0109	; 0x800109 <long_press_cnt+0x1>
    4d54:	8e 3e       	cpi	r24, 0xEE	; 238
    4d56:	92 40       	sbci	r25, 0x02	; 2
    4d58:	80 f0       	brcs	.+32     	; 0x4d7a <main+0x7e4>
    4d5a:	99 b1       	in	r25, 0x09	; 9
    4d5c:	80 91 07 01 	lds	r24, 0x0107	; 0x800107 <TEMP_REG>
    4d60:	98 27       	eor	r25, r24
    4d62:	9c 70       	andi	r25, 0x0C	; 12
    4d64:	09 f4       	brne	.+2      	; 0x4d68 <main+0x7d2>
    4d66:	75 c0       	rjmp	.+234    	; 0x4e52 <main+0x8bc>
    4d68:	10 92 0b 01 	sts	0x010B, r1	; 0x80010b <debounce_cnt>
    4d6c:	89 b1       	in	r24, 0x09	; 9
    4d6e:	80 93 07 01 	sts	0x0107, r24	; 0x800107 <TEMP_REG>
    4d72:	10 92 09 01 	sts	0x0109, r1	; 0x800109 <long_press_cnt+0x1>
    4d76:	10 92 08 01 	sts	0x0108, r1	; 0x800108 <long_press_cnt>
    4d7a:	e0 e0       	ldi	r30, 0x00	; 0
    4d7c:	f0 e0       	ldi	r31, 0x00	; 0
    4d7e:	ef 2b       	or	r30, r31
    4d80:	09 f4       	brne	.+2      	; 0x4d84 <main+0x7ee>
    4d82:	04 ce       	rjmp	.-1016   	; 0x498c <main+0x3f6>
    4d84:	0e 94 6a 05 	call	0xad4	; 0xad4 <_Z17Serial0_availablev>
    4d88:	88 23       	and	r24, r24
    4d8a:	09 f4       	brne	.+2      	; 0x4d8e <main+0x7f8>
    4d8c:	ff cd       	rjmp	.-1026   	; 0x498c <main+0x3f6>
    4d8e:	0e 94 00 00 	call	0	; 0x0 <__vectors>
    4d92:	fc cd       	rjmp	.-1032   	; 0x498c <main+0x3f6>
    4d94:	83 e4       	ldi	r24, 0x43	; 67
    4d96:	91 e0       	ldi	r25, 0x01	; 1
    4d98:	0e 94 09 13 	call	0x2612	; 0x2612 <_ZN5Print7printlnEPK19__FlashStringHelper.constprop.107>
    4d9c:	82 e0       	ldi	r24, 0x02	; 2
    4d9e:	0e 94 f5 0f 	call	0x1fea	; 0x1fea <_ZL11getEEConfigh>
    4da2:	0e 94 01 10 	call	0x2002	; 0x2002 <_Z16configBrightnessh>
    4da6:	dc cd       	rjmp	.-1096   	; 0x4960 <main+0x3ca>
    4da8:	2b 98       	cbi	0x05, 3	; 5
    4daa:	fd cd       	rjmp	.-1030   	; 0x49a6 <main+0x410>
    4dac:	8f ef       	ldi	r24, 0xFF	; 255
    4dae:	e8 16       	cp	r14, r24
    4db0:	f1 04       	cpc	r15, r1
    4db2:	11 f4       	brne	.+4      	; 0x4db8 <main+0x822>
    4db4:	61 e0       	ldi	r22, 0x01	; 1
    4db6:	a0 ce       	rjmp	.-704    	; 0x4af8 <main+0x562>
    4db8:	e5 e1       	ldi	r30, 0x15	; 21
    4dba:	f4 e0       	ldi	r31, 0x04	; 4
    4dbc:	84 91       	lpm	r24, Z
    4dbe:	83 30       	cpi	r24, 0x03	; 3
    4dc0:	21 f1       	breq	.+72     	; 0x4e0a <main+0x874>
    4dc2:	48 f4       	brcc	.+18     	; 0x4dd6 <main+0x840>
    4dc4:	81 30       	cpi	r24, 0x01	; 1
    4dc6:	b9 f0       	breq	.+46     	; 0x4df6 <main+0x860>
    4dc8:	82 30       	cpi	r24, 0x02	; 2
    4dca:	d1 f0       	breq	.+52     	; 0x4e00 <main+0x86a>
    4dcc:	f0 e8       	ldi	r31, 0x80	; 128
    4dce:	ef 16       	cp	r14, r31
    4dd0:	f1 04       	cpc	r15, r1
    4dd2:	84 f7       	brge	.-32     	; 0x4db4 <main+0x81e>
    4dd4:	90 ce       	rjmp	.-736    	; 0x4af6 <main+0x560>
    4dd6:	87 30       	cpi	r24, 0x07	; 7
    4dd8:	11 f1       	breq	.+68     	; 0x4e1e <main+0x888>
    4dda:	88 30       	cpi	r24, 0x08	; 8
    4ddc:	41 f1       	breq	.+80     	; 0x4e2e <main+0x898>
    4dde:	84 30       	cpi	r24, 0x04	; 4
    4de0:	a9 f7       	brne	.-22     	; 0x4dcc <main+0x836>
    4de2:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    4de6:	80 62       	ori	r24, 0x20	; 32
    4de8:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    4dec:	f0 92 8b 00 	sts	0x008B, r15	; 0x80008b <__TEXT_REGION_LENGTH__+0x7e008b>
    4df0:	e0 92 8a 00 	sts	0x008A, r14	; 0x80008a <__TEXT_REGION_LENGTH__+0x7e008a>
    4df4:	84 ce       	rjmp	.-760    	; 0x4afe <main+0x568>
    4df6:	84 b5       	in	r24, 0x24	; 36
    4df8:	80 68       	ori	r24, 0x80	; 128
    4dfa:	84 bd       	out	0x24, r24	; 36
    4dfc:	c7 bc       	out	0x27, r12	; 39
    4dfe:	7f ce       	rjmp	.-770    	; 0x4afe <main+0x568>
    4e00:	84 b5       	in	r24, 0x24	; 36
    4e02:	80 62       	ori	r24, 0x20	; 32
    4e04:	84 bd       	out	0x24, r24	; 36
    4e06:	c8 bc       	out	0x28, r12	; 40
    4e08:	7a ce       	rjmp	.-780    	; 0x4afe <main+0x568>
    4e0a:	80 91 80 00 	lds	r24, 0x0080	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    4e0e:	80 68       	ori	r24, 0x80	; 128
    4e10:	80 93 80 00 	sts	0x0080, r24	; 0x800080 <__TEXT_REGION_LENGTH__+0x7e0080>
    4e14:	f0 92 89 00 	sts	0x0089, r15	; 0x800089 <__TEXT_REGION_LENGTH__+0x7e0089>
    4e18:	e0 92 88 00 	sts	0x0088, r14	; 0x800088 <__TEXT_REGION_LENGTH__+0x7e0088>
    4e1c:	70 ce       	rjmp	.-800    	; 0x4afe <main+0x568>
    4e1e:	80 91 b0 00 	lds	r24, 0x00B0	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
    4e22:	80 68       	ori	r24, 0x80	; 128
    4e24:	80 93 b0 00 	sts	0x00B0, r24	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
    4e28:	c0 92 b3 00 	sts	0x00B3, r12	; 0x8000b3 <__TEXT_REGION_LENGTH__+0x7e00b3>
    4e2c:	68 ce       	rjmp	.-816    	; 0x4afe <main+0x568>
    4e2e:	80 91 b0 00 	lds	r24, 0x00B0	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
    4e32:	80 62       	ori	r24, 0x20	; 32
    4e34:	80 93 b0 00 	sts	0x00B0, r24	; 0x8000b0 <__TEXT_REGION_LENGTH__+0x7e00b0>
    4e38:	c0 92 b4 00 	sts	0x00B4, r12	; 0x8000b4 <__TEXT_REGION_LENGTH__+0x7e00b4>
    4e3c:	60 ce       	rjmp	.-832    	; 0x4afe <main+0x568>
    4e3e:	60 e0       	ldi	r22, 0x00	; 0
    4e40:	70 e0       	ldi	r23, 0x00	; 0
    4e42:	88 ec       	ldi	r24, 0xC8	; 200
    4e44:	92 ec       	ldi	r25, 0xC2	; 194
    4e46:	86 ce       	rjmp	.-756    	; 0x4b54 <main+0x5be>
    4e48:	60 e0       	ldi	r22, 0x00	; 0
    4e4a:	70 e0       	ldi	r23, 0x00	; 0
    4e4c:	88 ec       	ldi	r24, 0xC8	; 200
    4e4e:	92 ec       	ldi	r25, 0xC2	; 194
    4e50:	c0 ce       	rjmp	.-640    	; 0x4bd2 <main+0x63c>
    4e52:	80 93 0a 01 	sts	0x010A, r24	; 0x80010a <STABLE_REG>
    4e56:	98 2f       	mov	r25, r24
    4e58:	9c 70       	andi	r25, 0x0C	; 12
    4e5a:	e9 f4       	brne	.+58     	; 0x4e96 <main+0x900>
    4e5c:	80 91 08 01 	lds	r24, 0x0108	; 0x800108 <long_press_cnt>
    4e60:	90 91 09 01 	lds	r25, 0x0109	; 0x800109 <long_press_cnt+0x1>
    4e64:	8e 3e       	cpi	r24, 0xEE	; 238
    4e66:	92 40       	sbci	r25, 0x02	; 2
    4e68:	70 f0       	brcs	.+28     	; 0x4e86 <main+0x8f0>
    4e6a:	80 91 c9 02 	lds	r24, 0x02C9	; 0x8002c9 <BOTH_FLAG>
    4e6e:	84 60       	ori	r24, 0x04	; 4
    4e70:	80 93 c9 02 	sts	0x02C9, r24	; 0x8002c9 <BOTH_FLAG>
    4e74:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <MODE>
    4e78:	81 ff       	sbrs	r24, 1
    4e7a:	0e 94 61 14 	call	0x28c2	; 0x28c2 <_Z16startDiagnosticsv>
    4e7e:	10 92 09 01 	sts	0x0109, r1	; 0x800109 <long_press_cnt+0x1>
    4e82:	10 92 08 01 	sts	0x0108, r1	; 0x800108 <long_press_cnt>
    4e86:	81 e0       	ldi	r24, 0x01	; 1
    4e88:	80 93 c9 02 	sts	0x02C9, r24	; 0x8002c9 <BOTH_FLAG>
    4e8c:	80 91 0a 01 	lds	r24, 0x010A	; 0x80010a <STABLE_REG>
    4e90:	80 93 05 01 	sts	0x0105, r24	; 0x800105 <PREV_STABLE_REG>
    4e94:	72 cf       	rjmp	.-284    	; 0x4d7a <main+0x7e4>
    4e96:	90 91 c9 02 	lds	r25, 0x02C9	; 0x8002c9 <BOTH_FLAG>
    4e9a:	99 23       	and	r25, r25
    4e9c:	99 f1       	breq	.+102    	; 0x4f04 <main+0x96e>
    4e9e:	28 2f       	mov	r18, r24
    4ea0:	2c 70       	andi	r18, 0x0C	; 12
    4ea2:	2c 30       	cpi	r18, 0x0C	; 12
    4ea4:	79 f5       	brne	.+94     	; 0x4f04 <main+0x96e>
    4ea6:	0e 94 54 14 	call	0x28a8	; 0x28a8 <_Z15stopDiagnosticsv>
    4eaa:	80 91 c9 02 	lds	r24, 0x02C9	; 0x8002c9 <BOTH_FLAG>
    4eae:	82 fd       	sbrc	r24, 2
    4eb0:	1b c0       	rjmp	.+54     	; 0x4ee8 <main+0x952>
    4eb2:	90 91 e6 03 	lds	r25, 0x03E6	; 0x8003e6 <MODE>
    4eb6:	80 91 cc 02 	lds	r24, 0x02CC	; 0x8002cc <selected_digit>
    4eba:	91 ff       	sbrs	r25, 1
    4ebc:	18 c0       	rjmp	.+48     	; 0x4eee <main+0x958>
    4ebe:	90 91 e6 03 	lds	r25, 0x03E6	; 0x8003e6 <MODE>
    4ec2:	91 60       	ori	r25, 0x01	; 1
    4ec4:	90 93 e6 03 	sts	0x03E6, r25	; 0x8003e6 <MODE>
    4ec8:	10 92 c8 02 	sts	0x02C8, r1	; 0x8002c8 <blink_timer_counter>
    4ecc:	60 e0       	ldi	r22, 0x00	; 0
    4ece:	0e 94 ce 0f 	call	0x1f9c	; 0x1f9c <_Z18setNumitronSegmenthhb.constprop.116>
    4ed2:	f0 90 04 01 	lds	r15, 0x0104	; 0x800104 <configured_brightness>
    4ed6:	82 e0       	ldi	r24, 0x02	; 2
    4ed8:	0e 94 f5 0f 	call	0x1fea	; 0x1fea <_ZL11getEEConfigh>
    4edc:	f8 16       	cp	r15, r24
    4ede:	21 f0       	breq	.+8      	; 0x4ee8 <main+0x952>
    4ee0:	8f 2d       	mov	r24, r15
    4ee2:	80 68       	ori	r24, 0x80	; 128
    4ee4:	80 93 c8 02 	sts	0x02C8, r24	; 0x8002c8 <blink_timer_counter>
    4ee8:	10 92 c9 02 	sts	0x02C9, r1	; 0x8002c9 <BOTH_FLAG>
    4eec:	cf cf       	rjmp	.-98     	; 0x4e8c <main+0x8f6>
    4eee:	90 91 e6 03 	lds	r25, 0x03E6	; 0x8003e6 <MODE>
    4ef2:	91 60       	ori	r25, 0x01	; 1
    4ef4:	90 93 e6 03 	sts	0x03E6, r25	; 0x8003e6 <MODE>
    4ef8:	10 92 c8 02 	sts	0x02C8, r1	; 0x8002c8 <blink_timer_counter>
    4efc:	61 e0       	ldi	r22, 0x01	; 1
    4efe:	0e 94 ce 0f 	call	0x1f9c	; 0x1f9c <_Z18setNumitronSegmenthhb.constprop.116>
    4f02:	f2 cf       	rjmp	.-28     	; 0x4ee8 <main+0x952>
    4f04:	38 2f       	mov	r19, r24
    4f06:	34 70       	andi	r19, 0x04	; 4
    4f08:	82 fd       	sbrc	r24, 2
    4f0a:	07 c0       	rjmp	.+14     	; 0x4f1a <main+0x984>
    4f0c:	40 91 08 01 	lds	r20, 0x0108	; 0x800108 <long_press_cnt>
    4f10:	50 91 09 01 	lds	r21, 0x0109	; 0x800109 <long_press_cnt+0x1>
    4f14:	4e 3e       	cpi	r20, 0xEE	; 238
    4f16:	52 40       	sbci	r21, 0x02	; 2
    4f18:	38 f5       	brcc	.+78     	; 0x4f68 <main+0x9d2>
    4f1a:	28 2f       	mov	r18, r24
    4f1c:	28 70       	andi	r18, 0x08	; 8
    4f1e:	83 ff       	sbrs	r24, 3
    4f20:	3d c0       	rjmp	.+122    	; 0x4f9c <main+0xa06>
    4f22:	91 11       	cpse	r25, r1
    4f24:	b3 cf       	rjmp	.-154    	; 0x4e8c <main+0x8f6>
    4f26:	33 23       	and	r19, r19
    4f28:	09 f4       	brne	.+2      	; 0x4f2c <main+0x996>
    4f2a:	5e c0       	rjmp	.+188    	; 0x4fe8 <main+0xa52>
    4f2c:	80 91 05 01 	lds	r24, 0x0105	; 0x800105 <PREV_STABLE_REG>
    4f30:	82 fd       	sbrc	r24, 2
    4f32:	5a c0       	rjmp	.+180    	; 0x4fe8 <main+0xa52>
    4f34:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <MODE>
    4f38:	81 ff       	sbrs	r24, 1
    4f3a:	4a c0       	rjmp	.+148    	; 0x4fd0 <main+0xa3a>
    4f3c:	80 91 cc 02 	lds	r24, 0x02CC	; 0x8002cc <selected_digit>
    4f40:	e8 2e       	mov	r14, r24
    4f42:	f1 2c       	mov	r15, r1
    4f44:	2f ef       	ldi	r18, 0xFF	; 255
    4f46:	e2 1a       	sub	r14, r18
    4f48:	f2 0a       	sbc	r15, r18
    4f4a:	93 e0       	ldi	r25, 0x03	; 3
    4f4c:	e9 22       	and	r14, r25
    4f4e:	ff 24       	eor	r15, r15
    4f50:	60 e0       	ldi	r22, 0x00	; 0
    4f52:	0e 94 ce 0f 	call	0x1f9c	; 0x1f9c <_Z18setNumitronSegmenthhb.constprop.116>
    4f56:	10 92 c8 02 	sts	0x02C8, r1	; 0x8002c8 <blink_timer_counter>
    4f5a:	61 e0       	ldi	r22, 0x01	; 1
    4f5c:	8e 2d       	mov	r24, r14
    4f5e:	0e 94 ce 0f 	call	0x1f9c	; 0x1f9c <_Z18setNumitronSegmenthhb.constprop.116>
    4f62:	e0 92 cc 02 	sts	0x02CC, r14	; 0x8002cc <selected_digit>
    4f66:	92 cf       	rjmp	.-220    	; 0x4e8c <main+0x8f6>
    4f68:	10 92 09 01 	sts	0x0109, r1	; 0x800109 <long_press_cnt+0x1>
    4f6c:	10 92 08 01 	sts	0x0108, r1	; 0x800108 <long_press_cnt>
    4f70:	60 91 cb 02 	lds	r22, 0x02CB	; 0x8002cb <_target_brightness>
    4f74:	70 e0       	ldi	r23, 0x00	; 0
    4f76:	90 e0       	ldi	r25, 0x00	; 0
    4f78:	80 e0       	ldi	r24, 0x00	; 0
    4f7a:	0e 94 33 28 	call	0x5066	; 0x5066 <__floatsisf>
    4f7e:	20 e0       	ldi	r18, 0x00	; 0
    4f80:	30 e0       	ldi	r19, 0x00	; 0
    4f82:	40 e2       	ldi	r20, 0x20	; 32
    4f84:	50 e4       	ldi	r21, 0x40	; 64
    4f86:	0e 94 26 2a 	call	0x544c	; 0x544c <__subsf3>
    4f8a:	0e 94 05 2b 	call	0x560a	; 0x560a <__fixunssfsi>
    4f8e:	60 93 06 01 	sts	0x0106, r22	; 0x800106 <minimum_brightness>
    4f92:	80 91 06 01 	lds	r24, 0x0106	; 0x800106 <minimum_brightness>
    4f96:	0e 94 01 10 	call	0x2002	; 0x2002 <_Z16configBrightnessh>
    4f9a:	78 cf       	rjmp	.-272    	; 0x4e8c <main+0x8f6>
    4f9c:	40 91 08 01 	lds	r20, 0x0108	; 0x800108 <long_press_cnt>
    4fa0:	50 91 09 01 	lds	r21, 0x0109	; 0x800109 <long_press_cnt+0x1>
    4fa4:	4e 3e       	cpi	r20, 0xEE	; 238
    4fa6:	52 40       	sbci	r21, 0x02	; 2
    4fa8:	08 f4       	brcc	.+2      	; 0x4fac <main+0xa16>
    4faa:	bb cf       	rjmp	.-138    	; 0x4f22 <main+0x98c>
    4fac:	10 92 09 01 	sts	0x0109, r1	; 0x800109 <long_press_cnt+0x1>
    4fb0:	10 92 08 01 	sts	0x0108, r1	; 0x800108 <long_press_cnt>
    4fb4:	60 91 cb 02 	lds	r22, 0x02CB	; 0x8002cb <_target_brightness>
    4fb8:	70 e0       	ldi	r23, 0x00	; 0
    4fba:	90 e0       	ldi	r25, 0x00	; 0
    4fbc:	80 e0       	ldi	r24, 0x00	; 0
    4fbe:	0e 94 33 28 	call	0x5066	; 0x5066 <__floatsisf>
    4fc2:	20 e0       	ldi	r18, 0x00	; 0
    4fc4:	30 e0       	ldi	r19, 0x00	; 0
    4fc6:	40 e2       	ldi	r20, 0x20	; 32
    4fc8:	50 e4       	ldi	r21, 0x40	; 64
    4fca:	0e 94 27 2a 	call	0x544e	; 0x544e <__addsf3>
    4fce:	dd cf       	rjmp	.-70     	; 0x4f8a <main+0x9f4>
    4fd0:	60 91 cb 02 	lds	r22, 0x02CB	; 0x8002cb <_target_brightness>
    4fd4:	70 e0       	ldi	r23, 0x00	; 0
    4fd6:	90 e0       	ldi	r25, 0x00	; 0
    4fd8:	80 e0       	ldi	r24, 0x00	; 0
    4fda:	0e 94 33 28 	call	0x5066	; 0x5066 <__floatsisf>
    4fde:	20 e0       	ldi	r18, 0x00	; 0
    4fe0:	30 e0       	ldi	r19, 0x00	; 0
    4fe2:	40 ea       	ldi	r20, 0xA0	; 160
    4fe4:	50 e4       	ldi	r21, 0x40	; 64
    4fe6:	cf cf       	rjmp	.-98     	; 0x4f86 <main+0x9f0>
    4fe8:	22 23       	and	r18, r18
    4fea:	09 f4       	brne	.+2      	; 0x4fee <main+0xa58>
    4fec:	4f cf       	rjmp	.-354    	; 0x4e8c <main+0x8f6>
    4fee:	80 91 05 01 	lds	r24, 0x0105	; 0x800105 <PREV_STABLE_REG>
    4ff2:	83 fd       	sbrc	r24, 3
    4ff4:	4b cf       	rjmp	.-362    	; 0x4e8c <main+0x8f6>
    4ff6:	80 91 e6 03 	lds	r24, 0x03E6	; 0x8003e6 <MODE>
    4ffa:	81 ff       	sbrs	r24, 1
    4ffc:	21 c0       	rjmp	.+66     	; 0x5040 <main+0xaaa>
    4ffe:	20 91 cc 02 	lds	r18, 0x02CC	; 0x8002cc <selected_digit>
    5002:	30 e0       	ldi	r19, 0x00	; 0
    5004:	2e 51       	subi	r18, 0x1E	; 30
    5006:	3c 4f       	sbci	r19, 0xFC	; 252
    5008:	d9 01       	movw	r26, r18
    500a:	9c 91       	ld	r25, X
    500c:	9f 77       	andi	r25, 0x7F	; 127
    500e:	e7 eb       	ldi	r30, 0xB7	; 183
    5010:	f3 e0       	ldi	r31, 0x03	; 3
    5012:	80 e0       	ldi	r24, 0x00	; 0
    5014:	44 91       	lpm	r20, Z
    5016:	94 17       	cp	r25, r20
    5018:	29 f0       	breq	.+10     	; 0x5024 <main+0xa8e>
    501a:	8f 5f       	subi	r24, 0xFF	; 255
    501c:	31 96       	adiw	r30, 0x01	; 1
    501e:	8a 30       	cpi	r24, 0x0A	; 10
    5020:	c9 f7       	brne	.-14     	; 0x5014 <main+0xa7e>
    5022:	80 e0       	ldi	r24, 0x00	; 0
    5024:	90 e0       	ldi	r25, 0x00	; 0
    5026:	01 96       	adiw	r24, 0x01	; 1
    5028:	b1 01       	movw	r22, r2
    502a:	0e 94 8a 29 	call	0x5314	; 0x5314 <__divmodhi4>
    502e:	fc 01       	movw	r30, r24
    5030:	e9 54       	subi	r30, 0x49	; 73
    5032:	fc 4f       	sbci	r31, 0xFC	; 252
    5034:	e4 91       	lpm	r30, Z
    5036:	d9 01       	movw	r26, r18
    5038:	ec 93       	st	X, r30
    503a:	0e 94 b9 0f 	call	0x1f72	; 0x1f72 <_Z10showDigitsv>
    503e:	26 cf       	rjmp	.-436    	; 0x4e8c <main+0x8f6>
    5040:	60 91 cb 02 	lds	r22, 0x02CB	; 0x8002cb <_target_brightness>
    5044:	70 e0       	ldi	r23, 0x00	; 0
    5046:	90 e0       	ldi	r25, 0x00	; 0
    5048:	80 e0       	ldi	r24, 0x00	; 0
    504a:	0e 94 33 28 	call	0x5066	; 0x5066 <__floatsisf>
    504e:	20 e0       	ldi	r18, 0x00	; 0
    5050:	30 e0       	ldi	r19, 0x00	; 0
    5052:	40 ea       	ldi	r20, 0xA0	; 160
    5054:	50 e4       	ldi	r21, 0x40	; 64
    5056:	b9 cf       	rjmp	.-142    	; 0x4fca <main+0xa34>

00005058 <__cmpsf2>:
    5058:	0e 94 6e 28 	call	0x50dc	; 0x50dc <__fp_cmp>
    505c:	08 f4       	brcc	.+2      	; 0x5060 <__cmpsf2+0x8>
    505e:	81 e0       	ldi	r24, 0x01	; 1
    5060:	08 95       	ret

00005062 <__floatunsisf>:
    5062:	e8 94       	clt
    5064:	09 c0       	rjmp	.+18     	; 0x5078 <__floatsisf+0x12>

00005066 <__floatsisf>:
    5066:	97 fb       	bst	r25, 7
    5068:	3e f4       	brtc	.+14     	; 0x5078 <__floatsisf+0x12>
    506a:	90 95       	com	r25
    506c:	80 95       	com	r24
    506e:	70 95       	com	r23
    5070:	61 95       	neg	r22
    5072:	7f 4f       	sbci	r23, 0xFF	; 255
    5074:	8f 4f       	sbci	r24, 0xFF	; 255
    5076:	9f 4f       	sbci	r25, 0xFF	; 255
    5078:	99 23       	and	r25, r25
    507a:	a9 f0       	breq	.+42     	; 0x50a6 <__floatsisf+0x40>
    507c:	f9 2f       	mov	r31, r25
    507e:	96 e9       	ldi	r25, 0x96	; 150
    5080:	bb 27       	eor	r27, r27
    5082:	93 95       	inc	r25
    5084:	f6 95       	lsr	r31
    5086:	87 95       	ror	r24
    5088:	77 95       	ror	r23
    508a:	67 95       	ror	r22
    508c:	b7 95       	ror	r27
    508e:	f1 11       	cpse	r31, r1
    5090:	f8 cf       	rjmp	.-16     	; 0x5082 <__floatsisf+0x1c>
    5092:	fa f4       	brpl	.+62     	; 0x50d2 <__floatsisf+0x6c>
    5094:	bb 0f       	add	r27, r27
    5096:	11 f4       	brne	.+4      	; 0x509c <__floatsisf+0x36>
    5098:	60 ff       	sbrs	r22, 0
    509a:	1b c0       	rjmp	.+54     	; 0x50d2 <__floatsisf+0x6c>
    509c:	6f 5f       	subi	r22, 0xFF	; 255
    509e:	7f 4f       	sbci	r23, 0xFF	; 255
    50a0:	8f 4f       	sbci	r24, 0xFF	; 255
    50a2:	9f 4f       	sbci	r25, 0xFF	; 255
    50a4:	16 c0       	rjmp	.+44     	; 0x50d2 <__floatsisf+0x6c>
    50a6:	88 23       	and	r24, r24
    50a8:	11 f0       	breq	.+4      	; 0x50ae <__floatsisf+0x48>
    50aa:	96 e9       	ldi	r25, 0x96	; 150
    50ac:	11 c0       	rjmp	.+34     	; 0x50d0 <__floatsisf+0x6a>
    50ae:	77 23       	and	r23, r23
    50b0:	21 f0       	breq	.+8      	; 0x50ba <__floatsisf+0x54>
    50b2:	9e e8       	ldi	r25, 0x8E	; 142
    50b4:	87 2f       	mov	r24, r23
    50b6:	76 2f       	mov	r23, r22
    50b8:	05 c0       	rjmp	.+10     	; 0x50c4 <__floatsisf+0x5e>
    50ba:	66 23       	and	r22, r22
    50bc:	71 f0       	breq	.+28     	; 0x50da <__floatsisf+0x74>
    50be:	96 e8       	ldi	r25, 0x86	; 134
    50c0:	86 2f       	mov	r24, r22
    50c2:	70 e0       	ldi	r23, 0x00	; 0
    50c4:	60 e0       	ldi	r22, 0x00	; 0
    50c6:	2a f0       	brmi	.+10     	; 0x50d2 <__floatsisf+0x6c>
    50c8:	9a 95       	dec	r25
    50ca:	66 0f       	add	r22, r22
    50cc:	77 1f       	adc	r23, r23
    50ce:	88 1f       	adc	r24, r24
    50d0:	da f7       	brpl	.-10     	; 0x50c8 <__floatsisf+0x62>
    50d2:	88 0f       	add	r24, r24
    50d4:	96 95       	lsr	r25
    50d6:	87 95       	ror	r24
    50d8:	97 f9       	bld	r25, 7
    50da:	08 95       	ret

000050dc <__fp_cmp>:
    50dc:	99 0f       	add	r25, r25
    50de:	00 08       	sbc	r0, r0
    50e0:	55 0f       	add	r21, r21
    50e2:	aa 0b       	sbc	r26, r26
    50e4:	e0 e8       	ldi	r30, 0x80	; 128
    50e6:	fe ef       	ldi	r31, 0xFE	; 254
    50e8:	16 16       	cp	r1, r22
    50ea:	17 06       	cpc	r1, r23
    50ec:	e8 07       	cpc	r30, r24
    50ee:	f9 07       	cpc	r31, r25
    50f0:	c0 f0       	brcs	.+48     	; 0x5122 <__fp_cmp+0x46>
    50f2:	12 16       	cp	r1, r18
    50f4:	13 06       	cpc	r1, r19
    50f6:	e4 07       	cpc	r30, r20
    50f8:	f5 07       	cpc	r31, r21
    50fa:	98 f0       	brcs	.+38     	; 0x5122 <__fp_cmp+0x46>
    50fc:	62 1b       	sub	r22, r18
    50fe:	73 0b       	sbc	r23, r19
    5100:	84 0b       	sbc	r24, r20
    5102:	95 0b       	sbc	r25, r21
    5104:	39 f4       	brne	.+14     	; 0x5114 <__fp_cmp+0x38>
    5106:	0a 26       	eor	r0, r26
    5108:	61 f0       	breq	.+24     	; 0x5122 <__fp_cmp+0x46>
    510a:	23 2b       	or	r18, r19
    510c:	24 2b       	or	r18, r20
    510e:	25 2b       	or	r18, r21
    5110:	21 f4       	brne	.+8      	; 0x511a <__fp_cmp+0x3e>
    5112:	08 95       	ret
    5114:	0a 26       	eor	r0, r26
    5116:	09 f4       	brne	.+2      	; 0x511a <__fp_cmp+0x3e>
    5118:	a1 40       	sbci	r26, 0x01	; 1
    511a:	a6 95       	lsr	r26
    511c:	8f ef       	ldi	r24, 0xFF	; 255
    511e:	81 1d       	adc	r24, r1
    5120:	81 1d       	adc	r24, r1
    5122:	08 95       	ret

00005124 <__mulsf3>:
    5124:	0e 94 a5 28 	call	0x514a	; 0x514a <__mulsf3x>
    5128:	0c 94 16 29 	jmp	0x522c	; 0x522c <__fp_round>
    512c:	0e 94 08 29 	call	0x5210	; 0x5210 <__fp_pscA>
    5130:	38 f0       	brcs	.+14     	; 0x5140 <__mulsf3+0x1c>
    5132:	0e 94 0f 29 	call	0x521e	; 0x521e <__fp_pscB>
    5136:	20 f0       	brcs	.+8      	; 0x5140 <__mulsf3+0x1c>
    5138:	95 23       	and	r25, r21
    513a:	11 f0       	breq	.+4      	; 0x5140 <__mulsf3+0x1c>
    513c:	0c 94 ff 28 	jmp	0x51fe	; 0x51fe <__fp_inf>
    5140:	0c 94 05 29 	jmp	0x520a	; 0x520a <__fp_nan>
    5144:	11 24       	eor	r1, r1
    5146:	0c 94 4a 29 	jmp	0x5294	; 0x5294 <__fp_szero>

0000514a <__mulsf3x>:
    514a:	0e 94 27 29 	call	0x524e	; 0x524e <__fp_split3>
    514e:	70 f3       	brcs	.-36     	; 0x512c <__mulsf3+0x8>

00005150 <__mulsf3_pse>:
    5150:	95 9f       	mul	r25, r21
    5152:	c1 f3       	breq	.-16     	; 0x5144 <__mulsf3+0x20>
    5154:	95 0f       	add	r25, r21
    5156:	50 e0       	ldi	r21, 0x00	; 0
    5158:	55 1f       	adc	r21, r21
    515a:	62 9f       	mul	r22, r18
    515c:	f0 01       	movw	r30, r0
    515e:	72 9f       	mul	r23, r18
    5160:	bb 27       	eor	r27, r27
    5162:	f0 0d       	add	r31, r0
    5164:	b1 1d       	adc	r27, r1
    5166:	63 9f       	mul	r22, r19
    5168:	aa 27       	eor	r26, r26
    516a:	f0 0d       	add	r31, r0
    516c:	b1 1d       	adc	r27, r1
    516e:	aa 1f       	adc	r26, r26
    5170:	64 9f       	mul	r22, r20
    5172:	66 27       	eor	r22, r22
    5174:	b0 0d       	add	r27, r0
    5176:	a1 1d       	adc	r26, r1
    5178:	66 1f       	adc	r22, r22
    517a:	82 9f       	mul	r24, r18
    517c:	22 27       	eor	r18, r18
    517e:	b0 0d       	add	r27, r0
    5180:	a1 1d       	adc	r26, r1
    5182:	62 1f       	adc	r22, r18
    5184:	73 9f       	mul	r23, r19
    5186:	b0 0d       	add	r27, r0
    5188:	a1 1d       	adc	r26, r1
    518a:	62 1f       	adc	r22, r18
    518c:	83 9f       	mul	r24, r19
    518e:	a0 0d       	add	r26, r0
    5190:	61 1d       	adc	r22, r1
    5192:	22 1f       	adc	r18, r18
    5194:	74 9f       	mul	r23, r20
    5196:	33 27       	eor	r19, r19
    5198:	a0 0d       	add	r26, r0
    519a:	61 1d       	adc	r22, r1
    519c:	23 1f       	adc	r18, r19
    519e:	84 9f       	mul	r24, r20
    51a0:	60 0d       	add	r22, r0
    51a2:	21 1d       	adc	r18, r1
    51a4:	82 2f       	mov	r24, r18
    51a6:	76 2f       	mov	r23, r22
    51a8:	6a 2f       	mov	r22, r26
    51aa:	11 24       	eor	r1, r1
    51ac:	9f 57       	subi	r25, 0x7F	; 127
    51ae:	50 40       	sbci	r21, 0x00	; 0
    51b0:	9a f0       	brmi	.+38     	; 0x51d8 <__mulsf3_pse+0x88>
    51b2:	f1 f0       	breq	.+60     	; 0x51f0 <__mulsf3_pse+0xa0>
    51b4:	88 23       	and	r24, r24
    51b6:	4a f0       	brmi	.+18     	; 0x51ca <__mulsf3_pse+0x7a>
    51b8:	ee 0f       	add	r30, r30
    51ba:	ff 1f       	adc	r31, r31
    51bc:	bb 1f       	adc	r27, r27
    51be:	66 1f       	adc	r22, r22
    51c0:	77 1f       	adc	r23, r23
    51c2:	88 1f       	adc	r24, r24
    51c4:	91 50       	subi	r25, 0x01	; 1
    51c6:	50 40       	sbci	r21, 0x00	; 0
    51c8:	a9 f7       	brne	.-22     	; 0x51b4 <__mulsf3_pse+0x64>
    51ca:	9e 3f       	cpi	r25, 0xFE	; 254
    51cc:	51 05       	cpc	r21, r1
    51ce:	80 f0       	brcs	.+32     	; 0x51f0 <__mulsf3_pse+0xa0>
    51d0:	0c 94 ff 28 	jmp	0x51fe	; 0x51fe <__fp_inf>
    51d4:	0c 94 4a 29 	jmp	0x5294	; 0x5294 <__fp_szero>
    51d8:	5f 3f       	cpi	r21, 0xFF	; 255
    51da:	e4 f3       	brlt	.-8      	; 0x51d4 <__mulsf3_pse+0x84>
    51dc:	98 3e       	cpi	r25, 0xE8	; 232
    51de:	d4 f3       	brlt	.-12     	; 0x51d4 <__mulsf3_pse+0x84>
    51e0:	86 95       	lsr	r24
    51e2:	77 95       	ror	r23
    51e4:	67 95       	ror	r22
    51e6:	b7 95       	ror	r27
    51e8:	f7 95       	ror	r31
    51ea:	e7 95       	ror	r30
    51ec:	9f 5f       	subi	r25, 0xFF	; 255
    51ee:	c1 f7       	brne	.-16     	; 0x51e0 <__mulsf3_pse+0x90>
    51f0:	fe 2b       	or	r31, r30
    51f2:	88 0f       	add	r24, r24
    51f4:	91 1d       	adc	r25, r1
    51f6:	96 95       	lsr	r25
    51f8:	87 95       	ror	r24
    51fa:	97 f9       	bld	r25, 7
    51fc:	08 95       	ret

000051fe <__fp_inf>:
    51fe:	97 f9       	bld	r25, 7
    5200:	9f 67       	ori	r25, 0x7F	; 127
    5202:	80 e8       	ldi	r24, 0x80	; 128
    5204:	70 e0       	ldi	r23, 0x00	; 0
    5206:	60 e0       	ldi	r22, 0x00	; 0
    5208:	08 95       	ret

0000520a <__fp_nan>:
    520a:	9f ef       	ldi	r25, 0xFF	; 255
    520c:	80 ec       	ldi	r24, 0xC0	; 192
    520e:	08 95       	ret

00005210 <__fp_pscA>:
    5210:	00 24       	eor	r0, r0
    5212:	0a 94       	dec	r0
    5214:	16 16       	cp	r1, r22
    5216:	17 06       	cpc	r1, r23
    5218:	18 06       	cpc	r1, r24
    521a:	09 06       	cpc	r0, r25
    521c:	08 95       	ret

0000521e <__fp_pscB>:
    521e:	00 24       	eor	r0, r0
    5220:	0a 94       	dec	r0
    5222:	12 16       	cp	r1, r18
    5224:	13 06       	cpc	r1, r19
    5226:	14 06       	cpc	r1, r20
    5228:	05 06       	cpc	r0, r21
    522a:	08 95       	ret

0000522c <__fp_round>:
    522c:	09 2e       	mov	r0, r25
    522e:	03 94       	inc	r0
    5230:	00 0c       	add	r0, r0
    5232:	11 f4       	brne	.+4      	; 0x5238 <__fp_round+0xc>
    5234:	88 23       	and	r24, r24
    5236:	52 f0       	brmi	.+20     	; 0x524c <__fp_round+0x20>
    5238:	bb 0f       	add	r27, r27
    523a:	40 f4       	brcc	.+16     	; 0x524c <__fp_round+0x20>
    523c:	bf 2b       	or	r27, r31
    523e:	11 f4       	brne	.+4      	; 0x5244 <__fp_round+0x18>
    5240:	60 ff       	sbrs	r22, 0
    5242:	04 c0       	rjmp	.+8      	; 0x524c <__fp_round+0x20>
    5244:	6f 5f       	subi	r22, 0xFF	; 255
    5246:	7f 4f       	sbci	r23, 0xFF	; 255
    5248:	8f 4f       	sbci	r24, 0xFF	; 255
    524a:	9f 4f       	sbci	r25, 0xFF	; 255
    524c:	08 95       	ret

0000524e <__fp_split3>:
    524e:	57 fd       	sbrc	r21, 7
    5250:	90 58       	subi	r25, 0x80	; 128
    5252:	44 0f       	add	r20, r20
    5254:	55 1f       	adc	r21, r21
    5256:	59 f0       	breq	.+22     	; 0x526e <__fp_splitA+0x10>
    5258:	5f 3f       	cpi	r21, 0xFF	; 255
    525a:	71 f0       	breq	.+28     	; 0x5278 <__fp_splitA+0x1a>
    525c:	47 95       	ror	r20

0000525e <__fp_splitA>:
    525e:	88 0f       	add	r24, r24
    5260:	97 fb       	bst	r25, 7
    5262:	99 1f       	adc	r25, r25
    5264:	61 f0       	breq	.+24     	; 0x527e <__fp_splitA+0x20>
    5266:	9f 3f       	cpi	r25, 0xFF	; 255
    5268:	79 f0       	breq	.+30     	; 0x5288 <__fp_splitA+0x2a>
    526a:	87 95       	ror	r24
    526c:	08 95       	ret
    526e:	12 16       	cp	r1, r18
    5270:	13 06       	cpc	r1, r19
    5272:	14 06       	cpc	r1, r20
    5274:	55 1f       	adc	r21, r21
    5276:	f2 cf       	rjmp	.-28     	; 0x525c <__fp_split3+0xe>
    5278:	46 95       	lsr	r20
    527a:	f1 df       	rcall	.-30     	; 0x525e <__fp_splitA>
    527c:	08 c0       	rjmp	.+16     	; 0x528e <__fp_splitA+0x30>
    527e:	16 16       	cp	r1, r22
    5280:	17 06       	cpc	r1, r23
    5282:	18 06       	cpc	r1, r24
    5284:	99 1f       	adc	r25, r25
    5286:	f1 cf       	rjmp	.-30     	; 0x526a <__fp_splitA+0xc>
    5288:	86 95       	lsr	r24
    528a:	71 05       	cpc	r23, r1
    528c:	61 05       	cpc	r22, r1
    528e:	08 94       	sec
    5290:	08 95       	ret

00005292 <__fp_zero>:
    5292:	e8 94       	clt

00005294 <__fp_szero>:
    5294:	bb 27       	eor	r27, r27
    5296:	66 27       	eor	r22, r22
    5298:	77 27       	eor	r23, r23
    529a:	cb 01       	movw	r24, r22
    529c:	97 f9       	bld	r25, 7
    529e:	08 95       	ret

000052a0 <__muluhisi3>:
    52a0:	0e 94 5b 29 	call	0x52b6	; 0x52b6 <__umulhisi3>
    52a4:	a5 9f       	mul	r26, r21
    52a6:	90 0d       	add	r25, r0
    52a8:	b4 9f       	mul	r27, r20
    52aa:	90 0d       	add	r25, r0
    52ac:	a4 9f       	mul	r26, r20
    52ae:	80 0d       	add	r24, r0
    52b0:	91 1d       	adc	r25, r1
    52b2:	11 24       	eor	r1, r1
    52b4:	08 95       	ret

000052b6 <__umulhisi3>:
    52b6:	a2 9f       	mul	r26, r18
    52b8:	b0 01       	movw	r22, r0
    52ba:	b3 9f       	mul	r27, r19
    52bc:	c0 01       	movw	r24, r0
    52be:	a3 9f       	mul	r26, r19
    52c0:	70 0d       	add	r23, r0
    52c2:	81 1d       	adc	r24, r1
    52c4:	11 24       	eor	r1, r1
    52c6:	91 1d       	adc	r25, r1
    52c8:	b2 9f       	mul	r27, r18
    52ca:	70 0d       	add	r23, r0
    52cc:	81 1d       	adc	r24, r1
    52ce:	11 24       	eor	r1, r1
    52d0:	91 1d       	adc	r25, r1
    52d2:	08 95       	ret

000052d4 <__udivmodqi4>:
    52d4:	99 1b       	sub	r25, r25
    52d6:	79 e0       	ldi	r23, 0x09	; 9
    52d8:	04 c0       	rjmp	.+8      	; 0x52e2 <__udivmodqi4_ep>

000052da <__udivmodqi4_loop>:
    52da:	99 1f       	adc	r25, r25
    52dc:	96 17       	cp	r25, r22
    52de:	08 f0       	brcs	.+2      	; 0x52e2 <__udivmodqi4_ep>
    52e0:	96 1b       	sub	r25, r22

000052e2 <__udivmodqi4_ep>:
    52e2:	88 1f       	adc	r24, r24
    52e4:	7a 95       	dec	r23
    52e6:	c9 f7       	brne	.-14     	; 0x52da <__udivmodqi4_loop>
    52e8:	80 95       	com	r24
    52ea:	08 95       	ret

000052ec <__udivmodhi4>:
    52ec:	aa 1b       	sub	r26, r26
    52ee:	bb 1b       	sub	r27, r27
    52f0:	51 e1       	ldi	r21, 0x11	; 17
    52f2:	07 c0       	rjmp	.+14     	; 0x5302 <__udivmodhi4_ep>

000052f4 <__udivmodhi4_loop>:
    52f4:	aa 1f       	adc	r26, r26
    52f6:	bb 1f       	adc	r27, r27
    52f8:	a6 17       	cp	r26, r22
    52fa:	b7 07       	cpc	r27, r23
    52fc:	10 f0       	brcs	.+4      	; 0x5302 <__udivmodhi4_ep>
    52fe:	a6 1b       	sub	r26, r22
    5300:	b7 0b       	sbc	r27, r23

00005302 <__udivmodhi4_ep>:
    5302:	88 1f       	adc	r24, r24
    5304:	99 1f       	adc	r25, r25
    5306:	5a 95       	dec	r21
    5308:	a9 f7       	brne	.-22     	; 0x52f4 <__udivmodhi4_loop>
    530a:	80 95       	com	r24
    530c:	90 95       	com	r25
    530e:	bc 01       	movw	r22, r24
    5310:	cd 01       	movw	r24, r26
    5312:	08 95       	ret

00005314 <__divmodhi4>:
    5314:	97 fb       	bst	r25, 7
    5316:	07 2e       	mov	r0, r23
    5318:	16 f4       	brtc	.+4      	; 0x531e <__divmodhi4+0xa>
    531a:	00 94       	com	r0
    531c:	07 d0       	rcall	.+14     	; 0x532c <__divmodhi4_neg1>
    531e:	77 fd       	sbrc	r23, 7
    5320:	09 d0       	rcall	.+18     	; 0x5334 <__divmodhi4_neg2>
    5322:	0e 94 76 29 	call	0x52ec	; 0x52ec <__udivmodhi4>
    5326:	07 fc       	sbrc	r0, 7
    5328:	05 d0       	rcall	.+10     	; 0x5334 <__divmodhi4_neg2>
    532a:	3e f4       	brtc	.+14     	; 0x533a <__divmodhi4_exit>

0000532c <__divmodhi4_neg1>:
    532c:	90 95       	com	r25
    532e:	81 95       	neg	r24
    5330:	9f 4f       	sbci	r25, 0xFF	; 255
    5332:	08 95       	ret

00005334 <__divmodhi4_neg2>:
    5334:	70 95       	com	r23
    5336:	61 95       	neg	r22
    5338:	7f 4f       	sbci	r23, 0xFF	; 255

0000533a <__divmodhi4_exit>:
    533a:	08 95       	ret

0000533c <__udivmodsi4>:
    533c:	a1 e2       	ldi	r26, 0x21	; 33
    533e:	1a 2e       	mov	r1, r26
    5340:	aa 1b       	sub	r26, r26
    5342:	bb 1b       	sub	r27, r27
    5344:	fd 01       	movw	r30, r26
    5346:	0d c0       	rjmp	.+26     	; 0x5362 <__udivmodsi4_ep>

00005348 <__udivmodsi4_loop>:
    5348:	aa 1f       	adc	r26, r26
    534a:	bb 1f       	adc	r27, r27
    534c:	ee 1f       	adc	r30, r30
    534e:	ff 1f       	adc	r31, r31
    5350:	a2 17       	cp	r26, r18
    5352:	b3 07       	cpc	r27, r19
    5354:	e4 07       	cpc	r30, r20
    5356:	f5 07       	cpc	r31, r21
    5358:	20 f0       	brcs	.+8      	; 0x5362 <__udivmodsi4_ep>
    535a:	a2 1b       	sub	r26, r18
    535c:	b3 0b       	sbc	r27, r19
    535e:	e4 0b       	sbc	r30, r20
    5360:	f5 0b       	sbc	r31, r21

00005362 <__udivmodsi4_ep>:
    5362:	66 1f       	adc	r22, r22
    5364:	77 1f       	adc	r23, r23
    5366:	88 1f       	adc	r24, r24
    5368:	99 1f       	adc	r25, r25
    536a:	1a 94       	dec	r1
    536c:	69 f7       	brne	.-38     	; 0x5348 <__udivmodsi4_loop>
    536e:	60 95       	com	r22
    5370:	70 95       	com	r23
    5372:	80 95       	com	r24
    5374:	90 95       	com	r25
    5376:	9b 01       	movw	r18, r22
    5378:	ac 01       	movw	r20, r24
    537a:	bd 01       	movw	r22, r26
    537c:	cf 01       	movw	r24, r30
    537e:	08 95       	ret

00005380 <__divmodsi4>:
    5380:	05 2e       	mov	r0, r21
    5382:	97 fb       	bst	r25, 7
    5384:	1e f4       	brtc	.+6      	; 0x538c <__divmodsi4+0xc>
    5386:	00 94       	com	r0
    5388:	0e 94 d7 29 	call	0x53ae	; 0x53ae <__negsi2>
    538c:	57 fd       	sbrc	r21, 7
    538e:	07 d0       	rcall	.+14     	; 0x539e <__divmodsi4_neg2>
    5390:	0e 94 9e 29 	call	0x533c	; 0x533c <__udivmodsi4>
    5394:	07 fc       	sbrc	r0, 7
    5396:	03 d0       	rcall	.+6      	; 0x539e <__divmodsi4_neg2>
    5398:	4e f4       	brtc	.+18     	; 0x53ac <__divmodsi4_exit>
    539a:	0c 94 d7 29 	jmp	0x53ae	; 0x53ae <__negsi2>

0000539e <__divmodsi4_neg2>:
    539e:	50 95       	com	r21
    53a0:	40 95       	com	r20
    53a2:	30 95       	com	r19
    53a4:	21 95       	neg	r18
    53a6:	3f 4f       	sbci	r19, 0xFF	; 255
    53a8:	4f 4f       	sbci	r20, 0xFF	; 255
    53aa:	5f 4f       	sbci	r21, 0xFF	; 255

000053ac <__divmodsi4_exit>:
    53ac:	08 95       	ret

000053ae <__negsi2>:
    53ae:	90 95       	com	r25
    53b0:	80 95       	com	r24
    53b2:	70 95       	com	r23
    53b4:	61 95       	neg	r22
    53b6:	7f 4f       	sbci	r23, 0xFF	; 255
    53b8:	8f 4f       	sbci	r24, 0xFF	; 255
    53ba:	9f 4f       	sbci	r25, 0xFF	; 255
    53bc:	08 95       	ret

000053be <__tablejump2__>:
    53be:	ee 0f       	add	r30, r30
    53c0:	ff 1f       	adc	r31, r31
    53c2:	05 90       	lpm	r0, Z+
    53c4:	f4 91       	lpm	r31, Z
    53c6:	e0 2d       	mov	r30, r0
    53c8:	09 94       	ijmp

000053ca <__popcounthi2>:
    53ca:	0e 94 ef 29 	call	0x53de	; 0x53de <__popcountqi2>
    53ce:	8f 93       	push	r24
    53d0:	89 2f       	mov	r24, r25
    53d2:	0e 94 ef 29 	call	0x53de	; 0x53de <__popcountqi2>
    53d6:	99 27       	eor	r25, r25

000053d8 <__popcounthi2_tail>:
    53d8:	0f 90       	pop	r0
    53da:	80 0d       	add	r24, r0
    53dc:	08 95       	ret

000053de <__popcountqi2>:
    53de:	08 2e       	mov	r0, r24
    53e0:	81 70       	andi	r24, 0x01	; 1
    53e2:	06 94       	lsr	r0
    53e4:	06 94       	lsr	r0
    53e6:	81 1d       	adc	r24, r1
    53e8:	06 94       	lsr	r0
    53ea:	81 1d       	adc	r24, r1
    53ec:	06 94       	lsr	r0
    53ee:	81 1d       	adc	r24, r1
    53f0:	06 94       	lsr	r0
    53f2:	81 1d       	adc	r24, r1
    53f4:	06 94       	lsr	r0
    53f6:	81 1d       	adc	r24, r1
    53f8:	06 94       	lsr	r0
    53fa:	80 1d       	adc	r24, r0
    53fc:	08 95       	ret

000053fe <__usmulhisi3>:
    53fe:	0e 94 5b 29 	call	0x52b6	; 0x52b6 <__umulhisi3>

00005402 <__usmulhisi3_tail>:
    5402:	b7 ff       	sbrs	r27, 7
    5404:	08 95       	ret
    5406:	82 1b       	sub	r24, r18
    5408:	93 0b       	sbc	r25, r19
    540a:	08 95       	ret

0000540c <__mulshisi3>:
    540c:	b7 ff       	sbrs	r27, 7
    540e:	0c 94 50 29 	jmp	0x52a0	; 0x52a0 <__muluhisi3>

00005412 <__mulohisi3>:
    5412:	0e 94 50 29 	call	0x52a0	; 0x52a0 <__muluhisi3>
    5416:	82 1b       	sub	r24, r18
    5418:	93 0b       	sbc	r25, r19
    541a:	08 95       	ret

0000541c <__adddi3_s8>:
    541c:	00 24       	eor	r0, r0
    541e:	a7 fd       	sbrc	r26, 7
    5420:	00 94       	com	r0
    5422:	2a 0f       	add	r18, r26
    5424:	30 1d       	adc	r19, r0
    5426:	40 1d       	adc	r20, r0
    5428:	50 1d       	adc	r21, r0
    542a:	60 1d       	adc	r22, r0
    542c:	70 1d       	adc	r23, r0
    542e:	80 1d       	adc	r24, r0
    5430:	90 1d       	adc	r25, r0
    5432:	08 95       	ret

00005434 <__cmpdi2_s8>:
    5434:	00 24       	eor	r0, r0
    5436:	a7 fd       	sbrc	r26, 7
    5438:	00 94       	com	r0
    543a:	2a 17       	cp	r18, r26
    543c:	30 05       	cpc	r19, r0
    543e:	40 05       	cpc	r20, r0
    5440:	50 05       	cpc	r21, r0
    5442:	60 05       	cpc	r22, r0
    5444:	70 05       	cpc	r23, r0
    5446:	80 05       	cpc	r24, r0
    5448:	90 05       	cpc	r25, r0
    544a:	08 95       	ret

0000544c <__subsf3>:
    544c:	50 58       	subi	r21, 0x80	; 128

0000544e <__addsf3>:
    544e:	bb 27       	eor	r27, r27
    5450:	aa 27       	eor	r26, r26
    5452:	0e 94 3e 2a 	call	0x547c	; 0x547c <__addsf3x>
    5456:	0c 94 16 29 	jmp	0x522c	; 0x522c <__fp_round>
    545a:	0e 94 08 29 	call	0x5210	; 0x5210 <__fp_pscA>
    545e:	38 f0       	brcs	.+14     	; 0x546e <__addsf3+0x20>
    5460:	0e 94 0f 29 	call	0x521e	; 0x521e <__fp_pscB>
    5464:	20 f0       	brcs	.+8      	; 0x546e <__addsf3+0x20>
    5466:	39 f4       	brne	.+14     	; 0x5476 <__addsf3+0x28>
    5468:	9f 3f       	cpi	r25, 0xFF	; 255
    546a:	19 f4       	brne	.+6      	; 0x5472 <__addsf3+0x24>
    546c:	26 f4       	brtc	.+8      	; 0x5476 <__addsf3+0x28>
    546e:	0c 94 05 29 	jmp	0x520a	; 0x520a <__fp_nan>
    5472:	0e f4       	brtc	.+2      	; 0x5476 <__addsf3+0x28>
    5474:	e0 95       	com	r30
    5476:	e7 fb       	bst	r30, 7
    5478:	0c 94 ff 28 	jmp	0x51fe	; 0x51fe <__fp_inf>

0000547c <__addsf3x>:
    547c:	e9 2f       	mov	r30, r25
    547e:	0e 94 27 29 	call	0x524e	; 0x524e <__fp_split3>
    5482:	58 f3       	brcs	.-42     	; 0x545a <__addsf3+0xc>
    5484:	ba 17       	cp	r27, r26
    5486:	62 07       	cpc	r22, r18
    5488:	73 07       	cpc	r23, r19
    548a:	84 07       	cpc	r24, r20
    548c:	95 07       	cpc	r25, r21
    548e:	20 f0       	brcs	.+8      	; 0x5498 <__addsf3x+0x1c>
    5490:	79 f4       	brne	.+30     	; 0x54b0 <__addsf3x+0x34>
    5492:	a6 f5       	brtc	.+104    	; 0x54fc <__addsf3x+0x80>
    5494:	0c 94 49 29 	jmp	0x5292	; 0x5292 <__fp_zero>
    5498:	0e f4       	brtc	.+2      	; 0x549c <__addsf3x+0x20>
    549a:	e0 95       	com	r30
    549c:	0b 2e       	mov	r0, r27
    549e:	ba 2f       	mov	r27, r26
    54a0:	a0 2d       	mov	r26, r0
    54a2:	0b 01       	movw	r0, r22
    54a4:	b9 01       	movw	r22, r18
    54a6:	90 01       	movw	r18, r0
    54a8:	0c 01       	movw	r0, r24
    54aa:	ca 01       	movw	r24, r20
    54ac:	a0 01       	movw	r20, r0
    54ae:	11 24       	eor	r1, r1
    54b0:	ff 27       	eor	r31, r31
    54b2:	59 1b       	sub	r21, r25
    54b4:	99 f0       	breq	.+38     	; 0x54dc <__addsf3x+0x60>
    54b6:	59 3f       	cpi	r21, 0xF9	; 249
    54b8:	50 f4       	brcc	.+20     	; 0x54ce <__addsf3x+0x52>
    54ba:	50 3e       	cpi	r21, 0xE0	; 224
    54bc:	68 f1       	brcs	.+90     	; 0x5518 <__addsf3x+0x9c>
    54be:	1a 16       	cp	r1, r26
    54c0:	f0 40       	sbci	r31, 0x00	; 0
    54c2:	a2 2f       	mov	r26, r18
    54c4:	23 2f       	mov	r18, r19
    54c6:	34 2f       	mov	r19, r20
    54c8:	44 27       	eor	r20, r20
    54ca:	58 5f       	subi	r21, 0xF8	; 248
    54cc:	f3 cf       	rjmp	.-26     	; 0x54b4 <__addsf3x+0x38>
    54ce:	46 95       	lsr	r20
    54d0:	37 95       	ror	r19
    54d2:	27 95       	ror	r18
    54d4:	a7 95       	ror	r26
    54d6:	f0 40       	sbci	r31, 0x00	; 0
    54d8:	53 95       	inc	r21
    54da:	c9 f7       	brne	.-14     	; 0x54ce <__addsf3x+0x52>
    54dc:	7e f4       	brtc	.+30     	; 0x54fc <__addsf3x+0x80>
    54de:	1f 16       	cp	r1, r31
    54e0:	ba 0b       	sbc	r27, r26
    54e2:	62 0b       	sbc	r22, r18
    54e4:	73 0b       	sbc	r23, r19
    54e6:	84 0b       	sbc	r24, r20
    54e8:	ba f0       	brmi	.+46     	; 0x5518 <__addsf3x+0x9c>
    54ea:	91 50       	subi	r25, 0x01	; 1
    54ec:	a1 f0       	breq	.+40     	; 0x5516 <__addsf3x+0x9a>
    54ee:	ff 0f       	add	r31, r31
    54f0:	bb 1f       	adc	r27, r27
    54f2:	66 1f       	adc	r22, r22
    54f4:	77 1f       	adc	r23, r23
    54f6:	88 1f       	adc	r24, r24
    54f8:	c2 f7       	brpl	.-16     	; 0x54ea <__addsf3x+0x6e>
    54fa:	0e c0       	rjmp	.+28     	; 0x5518 <__addsf3x+0x9c>
    54fc:	ba 0f       	add	r27, r26
    54fe:	62 1f       	adc	r22, r18
    5500:	73 1f       	adc	r23, r19
    5502:	84 1f       	adc	r24, r20
    5504:	48 f4       	brcc	.+18     	; 0x5518 <__addsf3x+0x9c>
    5506:	87 95       	ror	r24
    5508:	77 95       	ror	r23
    550a:	67 95       	ror	r22
    550c:	b7 95       	ror	r27
    550e:	f7 95       	ror	r31
    5510:	9e 3f       	cpi	r25, 0xFE	; 254
    5512:	08 f0       	brcs	.+2      	; 0x5516 <__addsf3x+0x9a>
    5514:	b0 cf       	rjmp	.-160    	; 0x5476 <__addsf3+0x28>
    5516:	93 95       	inc	r25
    5518:	88 0f       	add	r24, r24
    551a:	08 f0       	brcs	.+2      	; 0x551e <__addsf3x+0xa2>
    551c:	99 27       	eor	r25, r25
    551e:	ee 0f       	add	r30, r30
    5520:	97 95       	ror	r25
    5522:	87 95       	ror	r24
    5524:	08 95       	ret

00005526 <__divsf3>:
    5526:	0e 94 a7 2a 	call	0x554e	; 0x554e <__divsf3x>
    552a:	0c 94 16 29 	jmp	0x522c	; 0x522c <__fp_round>
    552e:	0e 94 0f 29 	call	0x521e	; 0x521e <__fp_pscB>
    5532:	58 f0       	brcs	.+22     	; 0x554a <__divsf3+0x24>
    5534:	0e 94 08 29 	call	0x5210	; 0x5210 <__fp_pscA>
    5538:	40 f0       	brcs	.+16     	; 0x554a <__divsf3+0x24>
    553a:	29 f4       	brne	.+10     	; 0x5546 <__divsf3+0x20>
    553c:	5f 3f       	cpi	r21, 0xFF	; 255
    553e:	29 f0       	breq	.+10     	; 0x554a <__divsf3+0x24>
    5540:	0c 94 ff 28 	jmp	0x51fe	; 0x51fe <__fp_inf>
    5544:	51 11       	cpse	r21, r1
    5546:	0c 94 4a 29 	jmp	0x5294	; 0x5294 <__fp_szero>
    554a:	0c 94 05 29 	jmp	0x520a	; 0x520a <__fp_nan>

0000554e <__divsf3x>:
    554e:	0e 94 27 29 	call	0x524e	; 0x524e <__fp_split3>
    5552:	68 f3       	brcs	.-38     	; 0x552e <__divsf3+0x8>

00005554 <__divsf3_pse>:
    5554:	99 23       	and	r25, r25
    5556:	b1 f3       	breq	.-20     	; 0x5544 <__divsf3+0x1e>
    5558:	55 23       	and	r21, r21
    555a:	91 f3       	breq	.-28     	; 0x5540 <__divsf3+0x1a>
    555c:	95 1b       	sub	r25, r21
    555e:	55 0b       	sbc	r21, r21
    5560:	bb 27       	eor	r27, r27
    5562:	aa 27       	eor	r26, r26
    5564:	62 17       	cp	r22, r18
    5566:	73 07       	cpc	r23, r19
    5568:	84 07       	cpc	r24, r20
    556a:	38 f0       	brcs	.+14     	; 0x557a <__divsf3_pse+0x26>
    556c:	9f 5f       	subi	r25, 0xFF	; 255
    556e:	5f 4f       	sbci	r21, 0xFF	; 255
    5570:	22 0f       	add	r18, r18
    5572:	33 1f       	adc	r19, r19
    5574:	44 1f       	adc	r20, r20
    5576:	aa 1f       	adc	r26, r26
    5578:	a9 f3       	breq	.-22     	; 0x5564 <__divsf3_pse+0x10>
    557a:	35 d0       	rcall	.+106    	; 0x55e6 <__divsf3_pse+0x92>
    557c:	0e 2e       	mov	r0, r30
    557e:	3a f0       	brmi	.+14     	; 0x558e <__divsf3_pse+0x3a>
    5580:	e0 e8       	ldi	r30, 0x80	; 128
    5582:	32 d0       	rcall	.+100    	; 0x55e8 <__divsf3_pse+0x94>
    5584:	91 50       	subi	r25, 0x01	; 1
    5586:	50 40       	sbci	r21, 0x00	; 0
    5588:	e6 95       	lsr	r30
    558a:	00 1c       	adc	r0, r0
    558c:	ca f7       	brpl	.-14     	; 0x5580 <__divsf3_pse+0x2c>
    558e:	2b d0       	rcall	.+86     	; 0x55e6 <__divsf3_pse+0x92>
    5590:	fe 2f       	mov	r31, r30
    5592:	29 d0       	rcall	.+82     	; 0x55e6 <__divsf3_pse+0x92>
    5594:	66 0f       	add	r22, r22
    5596:	77 1f       	adc	r23, r23
    5598:	88 1f       	adc	r24, r24
    559a:	bb 1f       	adc	r27, r27
    559c:	26 17       	cp	r18, r22
    559e:	37 07       	cpc	r19, r23
    55a0:	48 07       	cpc	r20, r24
    55a2:	ab 07       	cpc	r26, r27
    55a4:	b0 e8       	ldi	r27, 0x80	; 128
    55a6:	09 f0       	breq	.+2      	; 0x55aa <__divsf3_pse+0x56>
    55a8:	bb 0b       	sbc	r27, r27
    55aa:	80 2d       	mov	r24, r0
    55ac:	bf 01       	movw	r22, r30
    55ae:	ff 27       	eor	r31, r31
    55b0:	93 58       	subi	r25, 0x83	; 131
    55b2:	5f 4f       	sbci	r21, 0xFF	; 255
    55b4:	3a f0       	brmi	.+14     	; 0x55c4 <__divsf3_pse+0x70>
    55b6:	9e 3f       	cpi	r25, 0xFE	; 254
    55b8:	51 05       	cpc	r21, r1
    55ba:	78 f0       	brcs	.+30     	; 0x55da <__divsf3_pse+0x86>
    55bc:	0c 94 ff 28 	jmp	0x51fe	; 0x51fe <__fp_inf>
    55c0:	0c 94 4a 29 	jmp	0x5294	; 0x5294 <__fp_szero>
    55c4:	5f 3f       	cpi	r21, 0xFF	; 255
    55c6:	e4 f3       	brlt	.-8      	; 0x55c0 <__divsf3_pse+0x6c>
    55c8:	98 3e       	cpi	r25, 0xE8	; 232
    55ca:	d4 f3       	brlt	.-12     	; 0x55c0 <__divsf3_pse+0x6c>
    55cc:	86 95       	lsr	r24
    55ce:	77 95       	ror	r23
    55d0:	67 95       	ror	r22
    55d2:	b7 95       	ror	r27
    55d4:	f7 95       	ror	r31
    55d6:	9f 5f       	subi	r25, 0xFF	; 255
    55d8:	c9 f7       	brne	.-14     	; 0x55cc <__divsf3_pse+0x78>
    55da:	88 0f       	add	r24, r24
    55dc:	91 1d       	adc	r25, r1
    55de:	96 95       	lsr	r25
    55e0:	87 95       	ror	r24
    55e2:	97 f9       	bld	r25, 7
    55e4:	08 95       	ret
    55e6:	e1 e0       	ldi	r30, 0x01	; 1
    55e8:	66 0f       	add	r22, r22
    55ea:	77 1f       	adc	r23, r23
    55ec:	88 1f       	adc	r24, r24
    55ee:	bb 1f       	adc	r27, r27
    55f0:	62 17       	cp	r22, r18
    55f2:	73 07       	cpc	r23, r19
    55f4:	84 07       	cpc	r24, r20
    55f6:	ba 07       	cpc	r27, r26
    55f8:	20 f0       	brcs	.+8      	; 0x5602 <__divsf3_pse+0xae>
    55fa:	62 1b       	sub	r22, r18
    55fc:	73 0b       	sbc	r23, r19
    55fe:	84 0b       	sbc	r24, r20
    5600:	ba 0b       	sbc	r27, r26
    5602:	ee 1f       	adc	r30, r30
    5604:	88 f7       	brcc	.-30     	; 0x55e8 <__divsf3_pse+0x94>
    5606:	e0 95       	com	r30
    5608:	08 95       	ret

0000560a <__fixunssfsi>:
    560a:	0e 94 2f 29 	call	0x525e	; 0x525e <__fp_splitA>
    560e:	88 f0       	brcs	.+34     	; 0x5632 <__fixunssfsi+0x28>
    5610:	9f 57       	subi	r25, 0x7F	; 127
    5612:	98 f0       	brcs	.+38     	; 0x563a <__fixunssfsi+0x30>
    5614:	b9 2f       	mov	r27, r25
    5616:	99 27       	eor	r25, r25
    5618:	b7 51       	subi	r27, 0x17	; 23
    561a:	b0 f0       	brcs	.+44     	; 0x5648 <__fixunssfsi+0x3e>
    561c:	e1 f0       	breq	.+56     	; 0x5656 <__fixunssfsi+0x4c>
    561e:	66 0f       	add	r22, r22
    5620:	77 1f       	adc	r23, r23
    5622:	88 1f       	adc	r24, r24
    5624:	99 1f       	adc	r25, r25
    5626:	1a f0       	brmi	.+6      	; 0x562e <__fixunssfsi+0x24>
    5628:	ba 95       	dec	r27
    562a:	c9 f7       	brne	.-14     	; 0x561e <__fixunssfsi+0x14>
    562c:	14 c0       	rjmp	.+40     	; 0x5656 <__fixunssfsi+0x4c>
    562e:	b1 30       	cpi	r27, 0x01	; 1
    5630:	91 f0       	breq	.+36     	; 0x5656 <__fixunssfsi+0x4c>
    5632:	0e 94 49 29 	call	0x5292	; 0x5292 <__fp_zero>
    5636:	b1 e0       	ldi	r27, 0x01	; 1
    5638:	08 95       	ret
    563a:	0c 94 49 29 	jmp	0x5292	; 0x5292 <__fp_zero>
    563e:	67 2f       	mov	r22, r23
    5640:	78 2f       	mov	r23, r24
    5642:	88 27       	eor	r24, r24
    5644:	b8 5f       	subi	r27, 0xF8	; 248
    5646:	39 f0       	breq	.+14     	; 0x5656 <__fixunssfsi+0x4c>
    5648:	b9 3f       	cpi	r27, 0xF9	; 249
    564a:	cc f3       	brlt	.-14     	; 0x563e <__fixunssfsi+0x34>
    564c:	86 95       	lsr	r24
    564e:	77 95       	ror	r23
    5650:	67 95       	ror	r22
    5652:	b3 95       	inc	r27
    5654:	d9 f7       	brne	.-10     	; 0x564c <__fixunssfsi+0x42>
    5656:	3e f4       	brtc	.+14     	; 0x5666 <__fixunssfsi+0x5c>
    5658:	90 95       	com	r25
    565a:	80 95       	com	r24
    565c:	70 95       	com	r23
    565e:	61 95       	neg	r22
    5660:	7f 4f       	sbci	r23, 0xFF	; 255
    5662:	8f 4f       	sbci	r24, 0xFF	; 255
    5664:	9f 4f       	sbci	r25, 0xFF	; 255
    5666:	08 95       	ret

00005668 <__gesf2>:
    5668:	0e 94 6e 28 	call	0x50dc	; 0x50dc <__fp_cmp>
    566c:	08 f4       	brcc	.+2      	; 0x5670 <__gesf2+0x8>
    566e:	8f ef       	ldi	r24, 0xFF	; 255
    5670:	08 95       	ret

00005672 <__unordsf2>:
    5672:	0e 94 6e 28 	call	0x50dc	; 0x50dc <__fp_cmp>
    5676:	88 0b       	sbc	r24, r24
    5678:	99 0b       	sbc	r25, r25
    567a:	08 95       	ret

0000567c <malloc>:
    567c:	0f 93       	push	r16
    567e:	1f 93       	push	r17
    5680:	cf 93       	push	r28
    5682:	df 93       	push	r29
    5684:	82 30       	cpi	r24, 0x02	; 2
    5686:	91 05       	cpc	r25, r1
    5688:	10 f4       	brcc	.+4      	; 0x568e <malloc+0x12>
    568a:	82 e0       	ldi	r24, 0x02	; 2
    568c:	90 e0       	ldi	r25, 0x00	; 0
    568e:	e0 91 09 06 	lds	r30, 0x0609	; 0x800609 <__flp>
    5692:	f0 91 0a 06 	lds	r31, 0x060A	; 0x80060a <__flp+0x1>
    5696:	30 e0       	ldi	r19, 0x00	; 0
    5698:	20 e0       	ldi	r18, 0x00	; 0
    569a:	b0 e0       	ldi	r27, 0x00	; 0
    569c:	a0 e0       	ldi	r26, 0x00	; 0
    569e:	30 97       	sbiw	r30, 0x00	; 0
    56a0:	99 f4       	brne	.+38     	; 0x56c8 <malloc+0x4c>
    56a2:	21 15       	cp	r18, r1
    56a4:	31 05       	cpc	r19, r1
    56a6:	09 f4       	brne	.+2      	; 0x56aa <malloc+0x2e>
    56a8:	4a c0       	rjmp	.+148    	; 0x573e <malloc+0xc2>
    56aa:	28 1b       	sub	r18, r24
    56ac:	39 0b       	sbc	r19, r25
    56ae:	24 30       	cpi	r18, 0x04	; 4
    56b0:	31 05       	cpc	r19, r1
    56b2:	d8 f5       	brcc	.+118    	; 0x572a <malloc+0xae>
    56b4:	8a 81       	ldd	r24, Y+2	; 0x02
    56b6:	9b 81       	ldd	r25, Y+3	; 0x03
    56b8:	61 15       	cp	r22, r1
    56ba:	71 05       	cpc	r23, r1
    56bc:	89 f1       	breq	.+98     	; 0x5720 <malloc+0xa4>
    56be:	fb 01       	movw	r30, r22
    56c0:	93 83       	std	Z+3, r25	; 0x03
    56c2:	82 83       	std	Z+2, r24	; 0x02
    56c4:	fe 01       	movw	r30, r28
    56c6:	11 c0       	rjmp	.+34     	; 0x56ea <malloc+0x6e>
    56c8:	40 81       	ld	r20, Z
    56ca:	51 81       	ldd	r21, Z+1	; 0x01
    56cc:	02 81       	ldd	r16, Z+2	; 0x02
    56ce:	13 81       	ldd	r17, Z+3	; 0x03
    56d0:	48 17       	cp	r20, r24
    56d2:	59 07       	cpc	r21, r25
    56d4:	e0 f0       	brcs	.+56     	; 0x570e <malloc+0x92>
    56d6:	48 17       	cp	r20, r24
    56d8:	59 07       	cpc	r21, r25
    56da:	99 f4       	brne	.+38     	; 0x5702 <malloc+0x86>
    56dc:	10 97       	sbiw	r26, 0x00	; 0
    56de:	61 f0       	breq	.+24     	; 0x56f8 <malloc+0x7c>
    56e0:	12 96       	adiw	r26, 0x02	; 2
    56e2:	0c 93       	st	X, r16
    56e4:	12 97       	sbiw	r26, 0x02	; 2
    56e6:	13 96       	adiw	r26, 0x03	; 3
    56e8:	1c 93       	st	X, r17
    56ea:	32 96       	adiw	r30, 0x02	; 2
    56ec:	cf 01       	movw	r24, r30
    56ee:	df 91       	pop	r29
    56f0:	cf 91       	pop	r28
    56f2:	1f 91       	pop	r17
    56f4:	0f 91       	pop	r16
    56f6:	08 95       	ret
    56f8:	00 93 09 06 	sts	0x0609, r16	; 0x800609 <__flp>
    56fc:	10 93 0a 06 	sts	0x060A, r17	; 0x80060a <__flp+0x1>
    5700:	f4 cf       	rjmp	.-24     	; 0x56ea <malloc+0x6e>
    5702:	21 15       	cp	r18, r1
    5704:	31 05       	cpc	r19, r1
    5706:	51 f0       	breq	.+20     	; 0x571c <malloc+0xa0>
    5708:	42 17       	cp	r20, r18
    570a:	53 07       	cpc	r21, r19
    570c:	38 f0       	brcs	.+14     	; 0x571c <malloc+0xa0>
    570e:	a9 01       	movw	r20, r18
    5710:	db 01       	movw	r26, r22
    5712:	9a 01       	movw	r18, r20
    5714:	bd 01       	movw	r22, r26
    5716:	df 01       	movw	r26, r30
    5718:	f8 01       	movw	r30, r16
    571a:	c1 cf       	rjmp	.-126    	; 0x569e <malloc+0x22>
    571c:	ef 01       	movw	r28, r30
    571e:	f9 cf       	rjmp	.-14     	; 0x5712 <malloc+0x96>
    5720:	90 93 0a 06 	sts	0x060A, r25	; 0x80060a <__flp+0x1>
    5724:	80 93 09 06 	sts	0x0609, r24	; 0x800609 <__flp>
    5728:	cd cf       	rjmp	.-102    	; 0x56c4 <malloc+0x48>
    572a:	fe 01       	movw	r30, r28
    572c:	e2 0f       	add	r30, r18
    572e:	f3 1f       	adc	r31, r19
    5730:	81 93       	st	Z+, r24
    5732:	91 93       	st	Z+, r25
    5734:	22 50       	subi	r18, 0x02	; 2
    5736:	31 09       	sbc	r19, r1
    5738:	39 83       	std	Y+1, r19	; 0x01
    573a:	28 83       	st	Y, r18
    573c:	d7 cf       	rjmp	.-82     	; 0x56ec <malloc+0x70>
    573e:	20 91 07 06 	lds	r18, 0x0607	; 0x800607 <__brkval>
    5742:	30 91 08 06 	lds	r19, 0x0608	; 0x800608 <__brkval+0x1>
    5746:	23 2b       	or	r18, r19
    5748:	41 f4       	brne	.+16     	; 0x575a <malloc+0xde>
    574a:	20 91 0e 01 	lds	r18, 0x010E	; 0x80010e <__malloc_heap_start>
    574e:	30 91 0f 01 	lds	r19, 0x010F	; 0x80010f <__malloc_heap_start+0x1>
    5752:	30 93 08 06 	sts	0x0608, r19	; 0x800608 <__brkval+0x1>
    5756:	20 93 07 06 	sts	0x0607, r18	; 0x800607 <__brkval>
    575a:	20 91 0c 01 	lds	r18, 0x010C	; 0x80010c <__malloc_heap_end>
    575e:	30 91 0d 01 	lds	r19, 0x010D	; 0x80010d <__malloc_heap_end+0x1>
    5762:	21 15       	cp	r18, r1
    5764:	31 05       	cpc	r19, r1
    5766:	41 f4       	brne	.+16     	; 0x5778 <malloc+0xfc>
    5768:	2d b7       	in	r18, 0x3d	; 61
    576a:	3e b7       	in	r19, 0x3e	; 62
    576c:	40 91 10 01 	lds	r20, 0x0110	; 0x800110 <__malloc_margin>
    5770:	50 91 11 01 	lds	r21, 0x0111	; 0x800111 <__malloc_margin+0x1>
    5774:	24 1b       	sub	r18, r20
    5776:	35 0b       	sbc	r19, r21
    5778:	e0 91 07 06 	lds	r30, 0x0607	; 0x800607 <__brkval>
    577c:	f0 91 08 06 	lds	r31, 0x0608	; 0x800608 <__brkval+0x1>
    5780:	e2 17       	cp	r30, r18
    5782:	f3 07       	cpc	r31, r19
    5784:	a0 f4       	brcc	.+40     	; 0x57ae <malloc+0x132>
    5786:	2e 1b       	sub	r18, r30
    5788:	3f 0b       	sbc	r19, r31
    578a:	28 17       	cp	r18, r24
    578c:	39 07       	cpc	r19, r25
    578e:	78 f0       	brcs	.+30     	; 0x57ae <malloc+0x132>
    5790:	ac 01       	movw	r20, r24
    5792:	4e 5f       	subi	r20, 0xFE	; 254
    5794:	5f 4f       	sbci	r21, 0xFF	; 255
    5796:	24 17       	cp	r18, r20
    5798:	35 07       	cpc	r19, r21
    579a:	48 f0       	brcs	.+18     	; 0x57ae <malloc+0x132>
    579c:	4e 0f       	add	r20, r30
    579e:	5f 1f       	adc	r21, r31
    57a0:	50 93 08 06 	sts	0x0608, r21	; 0x800608 <__brkval+0x1>
    57a4:	40 93 07 06 	sts	0x0607, r20	; 0x800607 <__brkval>
    57a8:	81 93       	st	Z+, r24
    57aa:	91 93       	st	Z+, r25
    57ac:	9f cf       	rjmp	.-194    	; 0x56ec <malloc+0x70>
    57ae:	f0 e0       	ldi	r31, 0x00	; 0
    57b0:	e0 e0       	ldi	r30, 0x00	; 0
    57b2:	9c cf       	rjmp	.-200    	; 0x56ec <malloc+0x70>

000057b4 <free>:
    57b4:	cf 93       	push	r28
    57b6:	df 93       	push	r29
    57b8:	00 97       	sbiw	r24, 0x00	; 0
    57ba:	e9 f0       	breq	.+58     	; 0x57f6 <free+0x42>
    57bc:	fc 01       	movw	r30, r24
    57be:	32 97       	sbiw	r30, 0x02	; 2
    57c0:	13 82       	std	Z+3, r1	; 0x03
    57c2:	12 82       	std	Z+2, r1	; 0x02
    57c4:	a0 91 09 06 	lds	r26, 0x0609	; 0x800609 <__flp>
    57c8:	b0 91 0a 06 	lds	r27, 0x060A	; 0x80060a <__flp+0x1>
    57cc:	ed 01       	movw	r28, r26
    57ce:	30 e0       	ldi	r19, 0x00	; 0
    57d0:	20 e0       	ldi	r18, 0x00	; 0
    57d2:	10 97       	sbiw	r26, 0x00	; 0
    57d4:	a1 f4       	brne	.+40     	; 0x57fe <free+0x4a>
    57d6:	20 81       	ld	r18, Z
    57d8:	31 81       	ldd	r19, Z+1	; 0x01
    57da:	82 0f       	add	r24, r18
    57dc:	93 1f       	adc	r25, r19
    57de:	20 91 07 06 	lds	r18, 0x0607	; 0x800607 <__brkval>
    57e2:	30 91 08 06 	lds	r19, 0x0608	; 0x800608 <__brkval+0x1>
    57e6:	28 17       	cp	r18, r24
    57e8:	39 07       	cpc	r19, r25
    57ea:	09 f0       	breq	.+2      	; 0x57ee <free+0x3a>
    57ec:	61 c0       	rjmp	.+194    	; 0x58b0 <free+0xfc>
    57ee:	f0 93 08 06 	sts	0x0608, r31	; 0x800608 <__brkval+0x1>
    57f2:	e0 93 07 06 	sts	0x0607, r30	; 0x800607 <__brkval>
    57f6:	df 91       	pop	r29
    57f8:	cf 91       	pop	r28
    57fa:	08 95       	ret
    57fc:	ea 01       	movw	r28, r20
    57fe:	ce 17       	cp	r28, r30
    5800:	df 07       	cpc	r29, r31
    5802:	e8 f5       	brcc	.+122    	; 0x587e <free+0xca>
    5804:	4a 81       	ldd	r20, Y+2	; 0x02
    5806:	5b 81       	ldd	r21, Y+3	; 0x03
    5808:	9e 01       	movw	r18, r28
    580a:	41 15       	cp	r20, r1
    580c:	51 05       	cpc	r21, r1
    580e:	b1 f7       	brne	.-20     	; 0x57fc <free+0x48>
    5810:	e9 01       	movw	r28, r18
    5812:	fb 83       	std	Y+3, r31	; 0x03
    5814:	ea 83       	std	Y+2, r30	; 0x02
    5816:	49 91       	ld	r20, Y+
    5818:	59 91       	ld	r21, Y+
    581a:	c4 0f       	add	r28, r20
    581c:	d5 1f       	adc	r29, r21
    581e:	ec 17       	cp	r30, r28
    5820:	fd 07       	cpc	r31, r29
    5822:	61 f4       	brne	.+24     	; 0x583c <free+0x88>
    5824:	80 81       	ld	r24, Z
    5826:	91 81       	ldd	r25, Z+1	; 0x01
    5828:	02 96       	adiw	r24, 0x02	; 2
    582a:	84 0f       	add	r24, r20
    582c:	95 1f       	adc	r25, r21
    582e:	e9 01       	movw	r28, r18
    5830:	99 83       	std	Y+1, r25	; 0x01
    5832:	88 83       	st	Y, r24
    5834:	82 81       	ldd	r24, Z+2	; 0x02
    5836:	93 81       	ldd	r25, Z+3	; 0x03
    5838:	9b 83       	std	Y+3, r25	; 0x03
    583a:	8a 83       	std	Y+2, r24	; 0x02
    583c:	f0 e0       	ldi	r31, 0x00	; 0
    583e:	e0 e0       	ldi	r30, 0x00	; 0
    5840:	12 96       	adiw	r26, 0x02	; 2
    5842:	8d 91       	ld	r24, X+
    5844:	9c 91       	ld	r25, X
    5846:	13 97       	sbiw	r26, 0x03	; 3
    5848:	00 97       	sbiw	r24, 0x00	; 0
    584a:	b9 f5       	brne	.+110    	; 0x58ba <free+0x106>
    584c:	2d 91       	ld	r18, X+
    584e:	3c 91       	ld	r19, X
    5850:	11 97       	sbiw	r26, 0x01	; 1
    5852:	cd 01       	movw	r24, r26
    5854:	02 96       	adiw	r24, 0x02	; 2
    5856:	82 0f       	add	r24, r18
    5858:	93 1f       	adc	r25, r19
    585a:	20 91 07 06 	lds	r18, 0x0607	; 0x800607 <__brkval>
    585e:	30 91 08 06 	lds	r19, 0x0608	; 0x800608 <__brkval+0x1>
    5862:	28 17       	cp	r18, r24
    5864:	39 07       	cpc	r19, r25
    5866:	39 f6       	brne	.-114    	; 0x57f6 <free+0x42>
    5868:	30 97       	sbiw	r30, 0x00	; 0
    586a:	51 f5       	brne	.+84     	; 0x58c0 <free+0x10c>
    586c:	10 92 0a 06 	sts	0x060A, r1	; 0x80060a <__flp+0x1>
    5870:	10 92 09 06 	sts	0x0609, r1	; 0x800609 <__flp>
    5874:	b0 93 08 06 	sts	0x0608, r27	; 0x800608 <__brkval+0x1>
    5878:	a0 93 07 06 	sts	0x0607, r26	; 0x800607 <__brkval>
    587c:	bc cf       	rjmp	.-136    	; 0x57f6 <free+0x42>
    587e:	d3 83       	std	Z+3, r29	; 0x03
    5880:	c2 83       	std	Z+2, r28	; 0x02
    5882:	40 81       	ld	r20, Z
    5884:	51 81       	ldd	r21, Z+1	; 0x01
    5886:	84 0f       	add	r24, r20
    5888:	95 1f       	adc	r25, r21
    588a:	c8 17       	cp	r28, r24
    588c:	d9 07       	cpc	r29, r25
    588e:	61 f4       	brne	.+24     	; 0x58a8 <free+0xf4>
    5890:	4e 5f       	subi	r20, 0xFE	; 254
    5892:	5f 4f       	sbci	r21, 0xFF	; 255
    5894:	88 81       	ld	r24, Y
    5896:	99 81       	ldd	r25, Y+1	; 0x01
    5898:	48 0f       	add	r20, r24
    589a:	59 1f       	adc	r21, r25
    589c:	51 83       	std	Z+1, r21	; 0x01
    589e:	40 83       	st	Z, r20
    58a0:	8a 81       	ldd	r24, Y+2	; 0x02
    58a2:	9b 81       	ldd	r25, Y+3	; 0x03
    58a4:	93 83       	std	Z+3, r25	; 0x03
    58a6:	82 83       	std	Z+2, r24	; 0x02
    58a8:	21 15       	cp	r18, r1
    58aa:	31 05       	cpc	r19, r1
    58ac:	09 f0       	breq	.+2      	; 0x58b0 <free+0xfc>
    58ae:	b0 cf       	rjmp	.-160    	; 0x5810 <free+0x5c>
    58b0:	f0 93 0a 06 	sts	0x060A, r31	; 0x80060a <__flp+0x1>
    58b4:	e0 93 09 06 	sts	0x0609, r30	; 0x800609 <__flp>
    58b8:	9e cf       	rjmp	.-196    	; 0x57f6 <free+0x42>
    58ba:	fd 01       	movw	r30, r26
    58bc:	dc 01       	movw	r26, r24
    58be:	c0 cf       	rjmp	.-128    	; 0x5840 <free+0x8c>
    58c0:	13 82       	std	Z+3, r1	; 0x03
    58c2:	12 82       	std	Z+2, r1	; 0x02
    58c4:	d7 cf       	rjmp	.-82     	; 0x5874 <free+0xc0>

000058c6 <_exit>:
    58c6:	f8 94       	cli

000058c8 <__stop_program>:
    58c8:	ff cf       	rjmp	.-2      	; 0x58c8 <__stop_program>
