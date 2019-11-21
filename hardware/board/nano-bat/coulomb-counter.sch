EESchema Schematic File Version 4
LIBS:nano-bat-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 6
Title "NanoBat"
Date ""
Rev "0.1.0"
Comp "Vertigo Designs"
Comment1 "Author: Ryan Summers"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_US R?
U 1 1 5DDBBCC5
P 5850 3100
F 0 "R?" V 5645 3100 50  0000 C CNN
F 1 "R_US" V 5736 3100 50  0000 C CNN
F 2 "" V 5890 3090 50  0001 C CNN
F 3 "~" H 5850 3100 50  0001 C CNN
	1    5850 3100
	0    1    1    0   
$EndComp
$Comp
L nano-bat:LTC4150CMS-PBF U?
U 1 1 5DDBC5B9
P 4950 3750
AR Path="/5DDBC5B9" Ref="U?"  Part="1" 
AR Path="/5DDB3EB5/5DDBC5B9" Ref="U?"  Part="1" 
F 0 "U?" H 5850 4137 60  0000 C CNN
F 1 "LTC4150CMS-PBF" H 5850 4031 60  0000 C CNN
F 2 "MSOP-10_MS" H 5850 3990 60  0001 C CNN
F 3 "" H 4950 3750 60  0000 C CNN
	1    4950 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DDBD4E7
P 4750 4500
F 0 "C?" H 4865 4546 50  0000 L CNN
F 1 "4.7u" H 4865 4455 50  0000 L CNN
F 2 "" H 4788 4350 50  0001 C CNN
F 3 "~" H 4750 4500 50  0001 C CNN
	1    4750 4500
	1    0    0    -1  
$EndComp
Text HLabel 4700 3100 0    50   Input ~ 0
Vbatt_source
Text HLabel 6900 3100 2    50   Input ~ 0
Vbatt_out
Wire Wire Line
	6850 4600 6850 4450
Wire Wire Line
	6850 4450 6750 4450
Wire Wire Line
	4950 4350 4750 4350
Wire Wire Line
	4950 4650 4750 4650
Wire Wire Line
	6000 3100 6050 3100
Wire Wire Line
	5650 3250 5650 3100
Connection ~ 5650 3100
Wire Wire Line
	5650 3100 5700 3100
Wire Wire Line
	6050 3250 6050 3100
Connection ~ 6050 3100
Text HLabel 8050 3750 2    50   Input ~ 0
~INT
Text HLabel 3600 3850 0    50   Input ~ 0
~SHDN
Text HLabel 8050 3850 2    50   Input ~ 0
POL
Wire Wire Line
	4950 3700 4850 3700
Wire Wire Line
	4850 3700 4850 3100
Wire Wire Line
	4850 3100 5650 3100
Wire Wire Line
	4700 3100 4850 3100
Connection ~ 4850 3100
$Comp
L power:GNDPWR #PWR?
U 1 1 5DDC68A3
P 6850 4600
F 0 "#PWR?" H 6850 4400 50  0001 C CNN
F 1 "GNDPWR" H 6854 4446 50  0000 C CNN
F 2 "" H 6850 4550 50  0001 C CNN
F 3 "" H 6850 4550 50  0001 C CNN
	1    6850 4600
	1    0    0    -1  
$EndComp
Text Notes 3350 3050 0    50   ~ 0
Note that VDD is sourced off the simulated battery,\nsince it is assumed that the battery has infinite supply.\nThis results in a parasitic load whenever a real battery is\nused.
$Comp
L Device:R_US R?
U 1 1 5DF61FF0
P 4000 3650
F 0 "R?" H 4068 3696 50  0000 L CNN
F 1 "10k" H 4068 3605 50  0000 L CNN
F 2 "" V 4040 3640 50  0001 C CNN
F 3 "~" H 4000 3650 50  0001 C CNN
	1    4000 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5DF6450F
P 4300 4500
F 0 "C?" H 4415 4546 50  0000 L CNN
F 1 "4.7u" H 4415 4455 50  0000 L CNN
F 2 "" H 4338 4350 50  0001 C CNN
F 3 "~" H 4300 4500 50  0001 C CNN
	1    4300 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5DF66549
P 4300 4700
F 0 "#PWR?" H 4300 4450 50  0001 C CNN
F 1 "GND" H 4305 4527 50  0000 C CNN
F 2 "" H 4300 4700 50  0001 C CNN
F 3 "" H 4300 4700 50  0001 C CNN
	1    4300 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4700 4300 4650
Wire Wire Line
	4300 4350 4300 4250
Wire Wire Line
	4300 3700 4850 3700
Connection ~ 4850 3700
Wire Wire Line
	6750 3750 7150 3750
Wire Wire Line
	7150 3750 7150 5100
Wire Wire Line
	7150 5100 4550 5100
Wire Wire Line
	4550 5100 4550 3950
Wire Wire Line
	4550 3950 4950 3950
Connection ~ 7150 3750
$Comp
L power:+3.3V #PWR?
U 1 1 5E101A61
P 4000 3450
F 0 "#PWR?" H 4000 3300 50  0001 C CNN
F 1 "+3.3V" H 4015 3623 50  0000 C CNN
F 2 "" H 4000 3450 50  0001 C CNN
F 3 "" H 4000 3450 50  0001 C CNN
	1    4000 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3450 4000 3500
Wire Wire Line
	4000 3850 4000 3800
Connection ~ 4000 3850
Wire Wire Line
	4000 3850 3600 3850
Wire Wire Line
	4000 3850 4950 3850
$Comp
L Device:R_US R?
U 1 1 5E108C6B
P 7600 3550
F 0 "R?" H 7668 3596 50  0000 L CNN
F 1 "10k" H 7668 3505 50  0000 L CNN
F 2 "" V 7640 3540 50  0001 C CNN
F 3 "~" H 7600 3550 50  0001 C CNN
	1    7600 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E108C71
P 7600 3350
F 0 "#PWR?" H 7600 3200 50  0001 C CNN
F 1 "+3.3V" H 7615 3523 50  0000 C CNN
F 2 "" H 7600 3350 50  0001 C CNN
F 3 "" H 7600 3350 50  0001 C CNN
	1    7600 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3350 7600 3400
$Comp
L Device:R_US R?
U 1 1 5E109351
P 7900 3550
F 0 "R?" H 7968 3596 50  0000 L CNN
F 1 "10k" H 7968 3505 50  0000 L CNN
F 2 "" V 7940 3540 50  0001 C CNN
F 3 "~" H 7900 3550 50  0001 C CNN
	1    7900 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E109357
P 7900 3350
F 0 "#PWR?" H 7900 3200 50  0001 C CNN
F 1 "+3.3V" H 7915 3523 50  0000 C CNN
F 2 "" H 7900 3350 50  0001 C CNN
F 3 "" H 7900 3350 50  0001 C CNN
	1    7900 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3350 7900 3400
Wire Wire Line
	6750 3850 7600 3850
Wire Wire Line
	7600 3700 7600 3850
Wire Wire Line
	7150 3750 7900 3750
Connection ~ 7600 3850
Wire Wire Line
	7600 3850 8050 3850
Wire Wire Line
	7900 3700 7900 3750
Connection ~ 7900 3750
Wire Wire Line
	7900 3750 8050 3750
$Comp
L Device:C C?
U 1 1 5E10FA4F
P 3900 4500
F 0 "C?" H 4015 4546 50  0000 L CNN
F 1 "4.7u" H 4015 4455 50  0000 L CNN
F 2 "" H 3938 4350 50  0001 C CNN
F 3 "~" H 3900 4500 50  0001 C CNN
	1    3900 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E10FA55
P 3900 4700
F 0 "#PWR?" H 3900 4450 50  0001 C CNN
F 1 "GND" H 3905 4527 50  0000 C CNN
F 2 "" H 3900 4700 50  0001 C CNN
F 3 "" H 3900 4700 50  0001 C CNN
	1    3900 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4700 3900 4650
Wire Wire Line
	3900 4350 3900 4250
Wire Wire Line
	3900 4250 4300 4250
Connection ~ 4300 4250
Wire Wire Line
	4300 4250 4300 3700
Wire Wire Line
	6050 3100 6900 3100
$EndSCHEMATC
