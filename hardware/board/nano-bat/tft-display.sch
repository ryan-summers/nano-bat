EESchema Schematic File Version 4
LIBS:nano-bat-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
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
L Connector_Generic:Conn_2Rows-45Pins J?
U 1 1 5E7D047E
P 5300 3850
F 0 "J?" H 5350 5167 50  0000 C CNN
F 1 "Conn_2Rows-45Pins" H 5350 5076 50  0000 C CNN
F 2 "" H 5300 3850 50  0001 C CNN
F 3 "~" H 5300 3850 50  0001 C CNN
	1    5300 3850
	1    0    0    -1  
$EndComp
NoConn ~ 5100 2750
NoConn ~ 5600 4750
NoConn ~ 5600 4850
NoConn ~ 5100 4850
NoConn ~ 5100 4950
Text Label 5700 2750 0    50   ~ 0
IM0
Text Label 5000 2850 2    50   ~ 0
IM1
Text Label 5000 2950 2    50   ~ 0
IM3
Text Label 5000 3050 2    50   ~ 0
VSYNC
Text Label 5000 3150 2    50   ~ 0
DOTCLK
Text Label 5700 3150 0    50   ~ 0
ENABLE
Text Label 5000 4150 2    50   ~ 0
SDO
Text Label 5000 4250 2    50   ~ 0
RD
Text Label 5000 4350 2    50   ~ 0
WR
Text Label 5000 4450 2    50   ~ 0
FMARK
Text Label 5000 4550 2    50   ~ 0
VCC
$Comp
L power:GND #PWR?
U 1 1 5E7D3FEB
P 5000 5050
F 0 "#PWR?" H 5000 4800 50  0001 C CNN
F 1 "GND" H 5005 4877 50  0000 C CNN
F 2 "" H 5000 5050 50  0001 C CNN
F 3 "" H 5000 5050 50  0001 C CNN
	1    5000 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 5050 5000 4650
Wire Wire Line
	5000 4650 5100 4650
Text Label 4950 4750 2    50   ~ 0
LED_K
Wire Wire Line
	5100 4750 4950 4750
Wire Wire Line
	5100 4550 5000 4550
Wire Wire Line
	5100 4450 5000 4450
Wire Wire Line
	5100 4350 5000 4350
Wire Wire Line
	5100 4250 5000 4250
Wire Wire Line
	5100 4150 5000 4150
Text Label 5700 2850 0    50   ~ 0
IM2
Text Label 5700 2950 0    50   ~ 0
RESET
Text Label 5700 3050 0    50   ~ 0
HSYNC
Text Label 5700 4150 0    50   ~ 0
SDI
Text Label 5700 4250 0    50   ~ 0
RS_SCL
Text Label 5700 4350 0    50   ~ 0
~CS
Text Label 5700 4450 0    50   ~ 0
VCC
$Comp
L power:GND #PWR?
U 1 1 5E7D5AE2
P 5700 5100
F 0 "#PWR?" H 5700 4850 50  0001 C CNN
F 1 "GND" H 5705 4927 50  0000 C CNN
F 2 "" H 5700 5100 50  0001 C CNN
F 3 "" H 5700 5100 50  0001 C CNN
	1    5700 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5100 5700 4550
Wire Wire Line
	5700 4550 5600 4550
Text Label 5750 4650 0    50   ~ 0
LED_A
Wire Wire Line
	5750 4650 5600 4650
Wire Wire Line
	5700 4450 5600 4450
Wire Wire Line
	5700 4350 5600 4350
Wire Wire Line
	5700 4250 5600 4250
Wire Wire Line
	5700 4150 5600 4150
Text Label 5000 3250 2    50   ~ 0
DB17
Text Label 5000 3350 2    50   ~ 0
DB15
Text Label 5000 3450 2    50   ~ 0
DB13
Text Label 5000 3550 2    50   ~ 0
DB11
Text Label 5000 3650 2    50   ~ 0
DB9
Text Label 5000 3750 2    50   ~ 0
DB7
Text Label 5000 3850 2    50   ~ 0
DB5
Text Label 5000 3950 2    50   ~ 0
DB3
Text Label 5000 4050 2    50   ~ 0
DB1
Text Label 5700 3250 0    50   ~ 0
DB16
Text Label 5700 3350 0    50   ~ 0
DB14
Text Label 5700 3450 0    50   ~ 0
DB12
Text Label 5700 3550 0    50   ~ 0
DB10
Text Label 5700 3650 0    50   ~ 0
DB8
Text Label 5700 3750 0    50   ~ 0
DB6
Text Label 5700 3850 0    50   ~ 0
DB4
Text Label 5700 3950 0    50   ~ 0
DB2
Text Label 5700 4050 0    50   ~ 0
DB0
Wire Wire Line
	5700 4050 5600 4050
Wire Wire Line
	5700 3950 5600 3950
Wire Wire Line
	5700 3850 5600 3850
Wire Wire Line
	5700 3750 5600 3750
Wire Wire Line
	5700 3650 5600 3650
Wire Wire Line
	5700 3550 5600 3550
Wire Wire Line
	5700 3450 5600 3450
Wire Wire Line
	5700 3350 5600 3350
Wire Wire Line
	5700 3250 5600 3250
Wire Wire Line
	5700 3150 5600 3150
Wire Wire Line
	5700 3050 5600 3050
Wire Wire Line
	5700 2950 5600 2950
Wire Wire Line
	5700 2850 5600 2850
Wire Wire Line
	5700 2750 5600 2750
Wire Wire Line
	5000 2850 5100 2850
Wire Wire Line
	5000 2950 5100 2950
Wire Wire Line
	5000 3050 5100 3050
Wire Wire Line
	5000 3150 5100 3150
Wire Wire Line
	5000 3250 5100 3250
Wire Wire Line
	5000 3350 5100 3350
Wire Wire Line
	5000 3450 5100 3450
Wire Wire Line
	5000 3550 5100 3550
Wire Wire Line
	5000 3650 5100 3650
Wire Wire Line
	5000 3750 5100 3750
Wire Wire Line
	5000 3850 5100 3850
Wire Wire Line
	5000 3950 5100 3950
Wire Wire Line
	5000 4050 5100 4050
$EndSCHEMATC
