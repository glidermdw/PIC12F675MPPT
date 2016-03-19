EESchema Schematic File Version 2
LIBS:12f675-mppt-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:microchip_pic12mcu
LIBS:12f675-mppt-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Simple MPPT with 12F675 v4"
Date "2016-03-19"
Rev "1.4"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PIC12F629-I/P IC1
U 1 1 55C335F1
P 4550 3700
F 0 "IC1" H 4000 4250 50  0000 L CNN
F 1 "PIC12F629-I/P" H 4000 4150 50  0000 L CNN
F 2 "" H 4550 3700 60  0000 C CNN
F 3 "" H 4550 3700 60  0000 C CNN
	1    4550 3700
	1    0    0    -1  
$EndComp
$Comp
L 7805 U1
U 1 1 55C337A7
P 2650 3450
F 0 "U1" H 2800 3254 60  0000 C CNN
F 1 "7805" H 2650 3650 60  0000 C CNN
F 2 "" H 2650 3450 60  0000 C CNN
F 3 "" H 2650 3450 60  0000 C CNN
	1    2650 3450
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_GDS Q1
U 1 1 55C339A5
P 8500 5400
F 0 "Q1" H 8750 5300 50  0000 R CNN
F 1 "BUK9511-55A127" H 8700 5100 50  0000 R CNN
F 2 "" H 8700 5500 29  0000 C CNN
F 3 "" H 8500 5400 60  0000 C CNN
	1    8500 5400
	-1   0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 55C33F64
P 7050 4250
F 0 "R4" V 7130 4250 50  0000 C CNN
F 1 "300k" V 7050 4250 50  0000 C CNN
F 2 "" V 6980 4250 30  0000 C CNN
F 3 "" H 7050 4250 30  0000 C CNN
	1    7050 4250
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 55C34015
P 6900 5300
F 0 "R3" V 6980 5300 50  0000 C CNN
F 1 "10k" V 6900 5300 50  0000 C CNN
F 2 "" V 6830 5300 30  0000 C CNN
F 3 "" H 6900 5300 30  0000 C CNN
	1    6900 5300
	1    0    0    -1  
$EndComp
$Comp
L LM358N-RESCUE-12f675-mppt U2
U 2 1 55C3383E
P 7500 4850
F 0 "U2" H 7450 5050 60  0000 L CNN
F 1 "LM358N" H 7450 4600 60  0000 L CNN
F 2 "" H 7500 4850 60  0000 C CNN
F 3 "" H 7500 4850 60  0000 C CNN
	2    7500 4850
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_GDS Q2
U 1 1 55C35281
P 7450 2300
F 0 "Q2" V 7650 2550 50  0000 R CNN
F 1 "BUK9511-55A127" V 7750 2600 50  0000 R CNN
F 2 "" H 7650 2400 29  0000 C CNN
F 3 "" H 7450 2300 60  0000 C CNN
	1    7450 2300
	0    -1   -1   0   
$EndComp
$Comp
L INDUCTOR L1
U 1 1 55C35536
P 8900 2200
F 0 "L1" V 8850 2200 50  0000 C CNN
F 1 "330uH" V 9000 2200 50  0000 C CNN
F 2 "" H 8900 2200 60  0000 C CNN
F 3 "" H 8900 2200 60  0000 C CNN
	1    8900 2200
	0    -1   -1   0   
$EndComp
$Comp
L D_Schottky D1
U 1 1 55C35659
P 7950 2200
F 0 "D1" H 8000 2100 50  0000 C CNN
F 1 "1N5822A" H 7900 2000 50  0000 C CNN
F 2 "" H 7950 2200 60  0000 C CNN
F 3 "" H 7950 2200 60  0000 C CNN
	1    7950 2200
	-1   0    0    -1  
$EndComp
$Comp
L D_Schottky D2
U 1 1 55C356EB
P 8400 2500
F 0 "D2" V 8400 2350 50  0000 C CNN
F 1 "1N5822A" V 8500 2250 50  0000 C CNN
F 2 "" H 8400 2500 60  0000 C CNN
F 3 "" H 8400 2500 60  0000 C CNN
	1    8400 2500
	0    -1   1    0   
$EndComp
$Comp
L CP C1
U 1 1 55C3588B
P 9500 2500
F 0 "C1" H 9525 2600 50  0000 L CNN
F 1 "100u" H 9525 2400 50  0000 L CNN
F 2 "" H 9538 2350 30  0000 C CNN
F 3 "" H 9500 2500 60  0000 C CNN
	1    9500 2500
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_EBC Q4
U 1 1 55C35D82
P 6500 2800
F 0 "Q4" H 6800 2700 50  0000 R CNN
F 1 "2N2222A" H 7000 2850 50  0000 R CNN
F 2 "" H 6700 2900 29  0000 C CNN
F 3 "" H 6500 2800 60  0000 C CNN
	1    6500 2800
	1    0    0    -1  
$EndComp
$Comp
L Q_PNP_EBC Q5
U 1 1 55C35E2B
P 6500 3300
F 0 "Q5" H 6800 3350 50  0000 R CNN
F 1 "2N2907A" H 7000 3200 50  0000 R CNN
F 2 "" H 6700 3400 29  0000 C CNN
F 3 "" H 6500 3300 60  0000 C CNN
	1    6500 3300
	1    0    0    1   
$EndComp
$Comp
L CP C2
U 1 1 55C35FB2
P 7250 2750
F 0 "C2" H 7275 2850 50  0000 L CNN
F 1 "1u" H 7275 2650 50  0000 L CNN
F 2 "" H 7288 2600 30  0000 C CNN
F 3 "" H 7250 2750 60  0000 C CNN
	1    7250 2750
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_EBC Q3
U 1 1 55C3651D
P 5750 3000
F 0 "Q3" H 5700 3150 50  0000 R CNN
F 1 "2N2222A" H 5700 3250 50  0000 R CNN
F 2 "" H 5950 3100 29  0000 C CNN
F 3 "" H 5750 3000 60  0000 C CNN
	1    5750 3000
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 55C36B81
P 5850 2500
F 0 "R9" V 5930 2500 50  0000 C CNN
F 1 "10k" V 5850 2500 50  0000 C CNN
F 2 "" V 5780 2500 30  0000 C CNN
F 3 "" H 5850 2500 30  0000 C CNN
	1    5850 2500
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 55C36CF2
P 5450 3150
F 0 "R7" V 5530 3150 50  0000 C CNN
F 1 "1k" V 5450 3150 50  0000 C CNN
F 2 "" V 5380 3150 30  0000 C CNN
F 3 "" H 5450 3150 30  0000 C CNN
	1    5450 3150
	1    0    0    -1  
$EndComp
$Comp
L D D3
U 1 1 55C36E30
P 5350 2350
F 0 "D3" H 5350 2450 50  0000 C CNN
F 1 "1N4001" H 5350 2250 50  0000 C CNN
F 2 "" H 5350 2350 60  0000 C CNN
F 3 "" H 5350 2350 60  0000 C CNN
	1    5350 2350
	-1   0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 55C376F8
P 6100 2700
F 0 "R10" V 6180 2700 50  0000 C CNN
F 1 "1k" V 6100 2700 50  0000 C CNN
F 2 "" V 6030 2700 30  0000 C CNN
F 3 "" H 6100 2700 30  0000 C CNN
	1    6100 2700
	0    1    1    0   
$EndComp
Text GLabel 1550 2200 0    60   Input ~ 0
S+
Text GLabel 1600 5600 0    60   Input ~ 0
S-
$Comp
L R R5
U 1 1 55C3A8B1
P 1850 3200
F 0 "R5" V 1930 3200 50  0000 C CNN
F 1 "300k" V 1850 3200 50  0000 C CNN
F 2 "" V 1780 3200 30  0000 C CNN
F 3 "" H 1850 3200 30  0000 C CNN
	1    1850 3200
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 55C3B177
P 4550 4400
F 0 "R8" V 4630 4400 50  0000 C CNN
F 1 "100k" V 4550 4400 50  0000 C CNN
F 2 "" V 4480 4400 30  0000 C CNN
F 3 "" H 4550 4400 30  0000 C CNN
	1    4550 4400
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 55C3BCB8
P 4900 4900
F 0 "R6" V 4980 4900 50  0000 C CNN
F 1 "1k" V 4900 4900 50  0000 C CNN
F 2 "" V 4830 4900 30  0000 C CNN
F 3 "" H 4900 4900 30  0000 C CNN
	1    4900 4900
	-1   0    0    1   
$EndComp
$Comp
L LED D4
U 1 1 55C3BFD1
P 4900 5350
F 0 "D4" H 4900 5450 50  0000 C CNN
F 1 "LED" H 4900 5250 50  0000 C CNN
F 2 "" H 4900 5350 60  0000 C CNN
F 3 "" H 4900 5350 60  0000 C CNN
	1    4900 5350
	0    -1   -1   0   
$EndComp
$Comp
L D D5
U 1 1 55C3D464
P 2250 2900
F 0 "D5" H 2250 3000 50  0000 C CNN
F 1 "1N4007" H 2250 2800 50  0000 C CNN
F 2 "" H 2250 2900 60  0000 C CNN
F 3 "" H 2250 2900 60  0000 C CNN
	1    2250 2900
	0    1    -1   0   
$EndComp
$Comp
L C C4
U 1 1 55C3DB01
P 3750 3700
F 0 "C4" H 3775 3800 50  0000 L CNN
F 1 "0.1u" H 3775 3600 50  0000 L CNN
F 2 "" H 3788 3550 30  0000 C CNN
F 3 "" H 3750 3700 60  0000 C CNN
	1    3750 3700
	1    0    0    -1  
$EndComp
$Comp
L CP C3
U 1 1 55C3DBAA
P 3100 3700
F 0 "C3" H 3125 3800 50  0000 L CNN
F 1 "100u" H 3125 3600 50  0000 L CNN
F 2 "" H 3138 3550 30  0000 C CNN
F 3 "" H 3100 3700 60  0000 C CNN
	1    3100 3700
	1    0    0    -1  
$EndComp
Text GLabel 10000 2200 2    60   Output ~ 0
L+
Text GLabel 10000 2750 2    60   Output ~ 0
L-
Text Label 5100 2350 2    60   ~ 0
BootStrap
Text Label 7050 3600 2    60   ~ 0
PV-Current
Text Label 4200 4400 2    60   ~ 0
PV-Voltage
Text Notes 8900 5200 2    60   ~ 0
Heat Sink
$Comp
L R R11
U 1 1 55C4C21C
P 6400 3600
F 0 "R11" V 6480 3600 50  0000 C CNN
F 1 "100k" V 6400 3600 50  0000 C CNN
F 2 "" V 6330 3600 30  0000 C CNN
F 3 "" H 6400 3600 30  0000 C CNN
	1    6400 3600
	0    1    1    0   
$EndComp
$Comp
L R R12
U 1 1 55C48C57
P 1850 4050
F 0 "R12" V 1930 4050 50  0000 C CNN
F 1 "47k" V 1850 4050 50  0000 C CNN
F 2 "" V 1780 4050 30  0000 C CNN
F 3 "" H 1850 4050 30  0000 C CNN
	1    1850 4050
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 55CA080E
P 6700 5300
F 0 "R2" V 6780 5300 50  0000 C CNN
F 1 "300k" V 6700 5300 50  0000 C CNN
F 2 "" V 6630 5300 30  0000 C CNN
F 3 "" H 6700 5300 30  0000 C CNN
	1    6700 5300
	-1   0    0    1   
$EndComp
$Comp
L R R13
U 1 1 55CA08C8
P 7050 3950
F 0 "R13" V 7130 3950 50  0000 C CNN
F 1 "10k" V 7050 3950 50  0000 C CNN
F 2 "" V 6980 3950 30  0000 C CNN
F 3 "" H 7050 3950 30  0000 C CNN
	1    7050 3950
	0    1    1    0   
$EndComp
Text Notes 1400 3650 0    60   ~ 0
Max 25V
$Comp
L LED D9
U 1 1 55CCC105
P 5650 5350
F 0 "D9" H 5650 5450 50  0000 C CNN
F 1 "LED" H 5650 5250 50  0000 C CNN
F 2 "" H 5650 5350 60  0000 C CNN
F 3 "" H 5650 5350 60  0000 C CNN
	1    5650 5350
	0    -1   -1   0   
$EndComp
$Comp
L LED D8
U 1 1 55CCC217
P 5650 4850
F 0 "D8" H 5650 4950 50  0000 C CNN
F 1 "LED" H 5650 4750 50  0000 C CNN
F 2 "" H 5650 4850 60  0000 C CNN
F 3 "" H 5650 4850 60  0000 C CNN
	1    5650 4850
	0    -1   -1   0   
$EndComp
$Comp
L R R14
U 1 1 55CCC2B4
P 5650 4200
F 0 "R14" V 5730 4200 50  0000 C CNN
F 1 "4.7k" V 5650 4200 50  0000 C CNN
F 2 "" V 5580 4200 30  0000 C CNN
F 3 "" H 5650 4200 30  0000 C CNN
	1    5650 4200
	1    0    0    -1  
$EndComp
Text Label 5350 3500 0    60   ~ 0
3.6v
$Comp
L CP C5
U 1 1 55CDDBD9
P 6100 4900
F 0 "C5" H 6125 5000 50  0000 L CNN
F 1 "10u" H 6125 4800 50  0000 L CNN
F 2 "" H 6138 4750 30  0000 C CNN
F 3 "" H 6100 4900 60  0000 C CNN
	1    6100 4900
	1    0    0    -1  
$EndComp
$Comp
L CP C6
U 1 1 55D02AF9
P 5200 5150
F 0 "C6" H 5100 5400 50  0000 L CNN
F 1 "10u" H 5000 5300 50  0000 L CNN
F 2 "" H 5238 5000 30  0000 C CNN
F 3 "" H 5200 5150 60  0000 C CNN
	1    5200 5150
	1    0    0    -1  
$EndComp
Text Label 8550 6000 0    60   ~ 0
3.6v
$Comp
L LM358N-RESCUE-12f675-mppt U2
U 1 1 56E669E2
P 8850 4350
F 0 "U2" H 8800 4550 60  0000 L CNN
F 1 "LM358N" H 8800 4100 60  0000 L CNN
F 2 "" H 8850 4350 60  0000 C CNN
F 3 "" H 8850 4350 60  0000 C CNN
	1    8850 4350
	0    -1   -1   0   
$EndComp
$Comp
L R R1
U 1 1 56E67518
P 9200 4850
F 0 "R1" V 9280 4850 50  0000 C CNN
F 1 "4.7k" V 9200 4850 50  0000 C CNN
F 2 "" V 9130 4850 50  0000 C CNN
F 3 "" H 9200 4850 50  0000 C CNN
	1    9200 4850
	0    1    1    0   
$EndComp
$Comp
L R R15
U 1 1 56E68956
P 9650 4300
F 0 "R15" V 9730 4300 50  0000 C CNN
F 1 "10k" V 9650 4300 50  0000 C CNN
F 2 "" V 9580 4300 50  0000 C CNN
F 3 "" H 9650 4300 50  0000 C CNN
	1    9650 4300
	-1   0    0    1   
$EndComp
$Comp
L D D6
U 1 1 56E7C16F
P 3100 2200
F 0 "D6" H 3100 2300 50  0000 C CNN
F 1 "1N4007" H 3100 2100 50  0000 C CNN
F 2 "" H 3100 2200 60  0000 C CNN
F 3 "" H 3100 2200 60  0000 C CNN
	1    3100 2200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2150 4000 3850 4000
Wire Wire Line
	2650 3700 2650 5600
Connection ~ 2650 4000
Wire Wire Line
	3050 3400 3850 3400
Wire Wire Line
	7400 5600 7400 5250
Wire Wire Line
	3500 2350 3500 6100
Connection ~ 3500 3400
Wire Wire Line
	6900 5450 6900 5600
Connection ~ 6900 5600
Wire Wire Line
	7200 4250 8000 4250
Wire Wire Line
	7000 4950 6900 4950
Wire Wire Line
	6900 4250 6900 5150
Connection ~ 6900 4950
Wire Wire Line
	6700 4750 7000 4750
Wire Wire Line
	8400 2650 8400 5200
Wire Wire Line
	8400 2750 10000 2750
Wire Wire Line
	8100 2200 8600 2200
Wire Wire Line
	8400 2200 8400 2350
Connection ~ 8400 2200
Wire Wire Line
	9200 2200 10000 2200
Wire Wire Line
	9500 2200 9500 2350
Wire Wire Line
	7650 2200 7800 2200
Wire Wire Line
	6600 3000 6600 3100
Wire Wire Line
	6600 3050 7450 3050
Wire Wire Line
	7450 3050 7450 2500
Connection ~ 6600 3050
Wire Wire Line
	6600 3500 7750 3500
Wire Wire Line
	7750 3500 7750 2200
Connection ~ 7750 2200
Wire Wire Line
	6300 2700 6300 3300
Wire Wire Line
	7250 2900 7250 3500
Connection ~ 7250 3500
Wire Wire Line
	5850 3200 5850 5600
Connection ~ 5850 5600
Wire Wire Line
	5850 2650 5850 2800
Wire Wire Line
	5250 3400 5450 3400
Wire Wire Line
	5450 3400 5450 3300
Wire Wire Line
	5450 3000 5550 3000
Wire Wire Line
	5500 2350 7250 2350
Wire Wire Line
	6600 2350 6600 2600
Connection ~ 5850 2350
Wire Wire Line
	5200 2350 3500 2350
Wire Wire Line
	6250 2700 6300 2700
Connection ~ 6300 2800
Wire Wire Line
	5950 2700 5850 2700
Connection ~ 5850 2700
Connection ~ 2250 2200
Connection ~ 2650 5600
Connection ~ 1850 2200
Wire Wire Line
	1850 3050 1850 2200
Wire Wire Line
	1850 3350 1850 3900
Wire Wire Line
	2100 3500 1850 3500
Connection ~ 1850 3500
Wire Wire Line
	4900 5550 4900 5600
Connection ~ 4900 5600
Wire Wire Line
	4900 5150 4900 5050
Wire Wire Line
	2250 3050 2250 3400
Wire Wire Line
	2250 2750 2250 2200
Wire Wire Line
	3100 3850 3100 4000
Connection ~ 3100 4000
Wire Wire Line
	3100 3550 3100 3400
Connection ~ 3100 3400
Wire Wire Line
	3750 3850 3750 4000
Connection ~ 3750 4000
Wire Wire Line
	3750 3550 3750 3400
Connection ~ 3750 3400
Wire Wire Line
	7250 2350 7250 2600
Connection ~ 6600 2350
Connection ~ 7400 5600
Connection ~ 7400 4450
Wire Wire Line
	9500 2750 9500 2650
Connection ~ 8400 2750
Connection ~ 9500 2750
Connection ~ 9500 2200
Wire Notes Line
	5900 5850 9800 5850
Wire Wire Line
	5250 3600 6250 3600
Wire Wire Line
	1850 4200 1850 5600
Connection ~ 1850 5600
Wire Wire Line
	6700 3950 6700 5150
Wire Wire Line
	6700 5450 6700 5600
Connection ~ 6700 5600
Wire Wire Line
	6700 3950 6900 3950
Connection ~ 6700 4750
Wire Wire Line
	7200 3950 8400 3950
Connection ~ 8400 3950
Wire Wire Line
	5650 4350 5650 4650
Wire Wire Line
	5650 5050 5650 5150
Wire Wire Line
	5650 5550 5650 5600
Connection ~ 5650 5600
Wire Wire Line
	5650 4050 6000 4050
Wire Wire Line
	6100 5050 6100 5600
Connection ~ 6100 5600
Wire Wire Line
	6100 4750 6100 3600
Connection ~ 6100 3600
Wire Notes Line
	5900 3500 5900 5850
Wire Notes Line
	5900 3500 6500 3500
Wire Notes Line
	6500 3500 6700 3750
Wire Notes Line
	6700 3750 9800 3750
Wire Wire Line
	3500 6100 8150 6100
Wire Wire Line
	8150 6100 8150 4450
Wire Wire Line
	5250 3900 5250 4300
Wire Wire Line
	5250 4300 4900 4300
Wire Wire Line
	4900 4300 4900 4750
Wire Wire Line
	5200 5300 5200 5600
Connection ~ 5200 5600
Wire Wire Line
	2100 3500 2100 4400
Wire Wire Line
	2100 4400 4400 4400
Wire Wire Line
	4700 4400 5400 4400
Wire Wire Line
	5400 4400 5400 3800
Wire Wire Line
	5400 3800 5250 3800
Wire Wire Line
	5200 5000 5200 4400
Connection ~ 5200 4400
Wire Wire Line
	5650 4500 5500 4500
Wire Wire Line
	5500 3500 5500 6000
Connection ~ 5650 4500
Wire Wire Line
	6000 4050 6000 4450
Wire Wire Line
	5500 3500 5250 3500
Wire Wire Line
	8850 5400 8700 5400
Wire Wire Line
	5500 6000 8850 6000
Wire Wire Line
	8850 6000 8850 5400
Connection ~ 5500 4500
Wire Wire Line
	6000 4450 8450 4450
Wire Wire Line
	9450 5600 1600 5600
Wire Wire Line
	8000 4250 8000 4850
Wire Wire Line
	8000 4850 8750 4850
Wire Wire Line
	8850 3850 8850 3600
Wire Wire Line
	6550 3600 9650 3600
Wire Wire Line
	9450 4450 9450 5600
Connection ~ 8400 5600
Wire Wire Line
	9050 4850 8950 4850
Wire Wire Line
	9450 4450 9250 4450
Connection ~ 9450 4850
Connection ~ 8150 4450
Wire Wire Line
	9650 5100 9650 4450
Wire Wire Line
	9650 3600 9650 4150
Connection ~ 8850 3600
Wire Notes Line
	9800 3750 9800 5850
Wire Wire Line
	9350 4850 9450 4850
Wire Wire Line
	9650 5100 8950 5100
Wire Wire Line
	8950 5100 8950 4850
Wire Wire Line
	1550 2200 2950 2200
Wire Wire Line
	7250 2200 3250 2200
$Comp
L CP C7
U 1 1 56E7CE1F
P 3300 2750
F 0 "C7" H 3325 2850 50  0000 L CNN
F 1 "47u" H 3325 2650 50  0000 L CNN
F 2 "" H 3338 2600 30  0000 C CNN
F 3 "" H 3300 2750 60  0000 C CNN
	1    3300 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2600 3300 2200
Connection ~ 3300 2200
Wire Wire Line
	2150 4000 2150 3100
Wire Wire Line
	2150 3100 3300 3100
Wire Wire Line
	3300 3100 3300 2900
$Comp
L R R16
U 1 1 56ECB4B6
P 3900 5000
F 0 "R16" V 3980 5000 50  0000 C CNN
F 1 "10k" V 3900 5000 50  0000 C CNN
F 2 "" V 3830 5000 50  0000 C CNN
F 3 "" H 3900 5000 50  0000 C CNN
	1    3900 5000
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 5000 3500 5000
Connection ~ 3500 5000
Wire Wire Line
	5250 3700 5450 3700
Wire Wire Line
	5450 3700 5450 4650
Wire Wire Line
	5450 4650 3400 4650
Wire Wire Line
	4150 4650 4150 5000
Wire Wire Line
	4150 5000 4050 5000
$Comp
L SW_PUSH SW1
U 1 1 56ECBA1E
P 3100 4650
F 0 "SW1" H 3250 4760 50  0000 C CNN
F 1 "Write OP-AMP DIFF" H 3100 4570 50  0000 C CNN
F 2 "" H 3100 4650 50  0000 C CNN
F 3 "" H 3100 4650 50  0000 C CNN
	1    3100 4650
	1    0    0    -1  
$EndComp
Connection ~ 4150 4650
Wire Wire Line
	2800 4650 2650 4650
Connection ~ 2650 4650
$EndSCHEMATC
