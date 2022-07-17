EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 8268 4331
encoding utf-8
Sheet 1 1
Title "Lynx Rotax 380 wiring diagram"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 5439 1362
Wire Wire Line
	6389 1362 5439 1362
Wire Wire Line
	6389 2062 6389 1362
Wire Wire Line
	7289 2062 6389 2062
Wire Wire Line
	6739 1812 6789 1812
Connection ~ 6739 1812
Connection ~ 6739 1362
Wire Wire Line
	6739 1362 6739 1812
Wire Wire Line
	6739 912  6739 1362
Wire Wire Line
	6539 912  6739 912 
Wire Wire Line
	6739 912  6889 912 
Connection ~ 6739 912 
Wire Wire Line
	6889 1362 6739 1362
$Comp
L Motor:Motor_DC M1
U 1 1 61BDD721
P 6989 1812
F 0 "M1" V 7284 1762 50  0000 C CNN
F 1 "Engine hours" V 7193 1762 50  0000 C CNN
F 2 "" H 6989 1722 50  0001 C CNN
F 3 "~" H 6989 1722 50  0001 C CNN
	1    6989 1812
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4539 1812 6739 1812
Wire Wire Line
	7289 1812 7289 1362
Wire Wire Line
	7289 2062 7289 1812
Connection ~ 7289 1812
Text Label 5989 912  0    50   ~ 0
yellow
Text Label 6589 2062 0    50   ~ 0
yellow-black
Text Label 4639 1962 0    50   ~ 0
red
Text Label 4639 1812 0    50   ~ 0
red-blue
Text Label 6539 912  0    50   ~ 0
gray
Text Label 4989 1212 0    50   ~ 0
black
Text Label 4989 1012 0    50   ~ 0
red
Wire Wire Line
	5989 1962 4539 1962
Wire Wire Line
	5989 912  6139 912 
Connection ~ 5989 912 
Wire Wire Line
	5989 912  5989 1962
Wire Wire Line
	5439 1362 5289 1362
Wire Wire Line
	5439 912  5589 912 
Connection ~ 5439 912 
Wire Wire Line
	5439 962  5439 912 
Wire Wire Line
	5289 912  5439 912 
Wire Wire Line
	7289 1362 7289 912 
Connection ~ 7289 1362
Wire Wire Line
	7189 1362 7289 1362
Wire Wire Line
	7289 912  7189 912 
Wire Wire Line
	1139 862  1589 862 
$Comp
L Device:Battery BT1
U 1 1 61BCC383
P 5439 1162
F 0 "BT1" H 5547 1208 50  0000 L CNN
F 1 "Battery 12V" H 5547 1117 50  0000 L CNN
F 2 "" V 5439 1222 50  0001 C CNN
F 3 "~" V 5439 1222 50  0001 C CNN
	1    5439 1162
	1    0    0    -1  
$EndComp
Wire Wire Line
	5889 912  5989 912 
Wire Wire Line
	5289 1212 5289 1362
NoConn ~ 4539 2112
$Comp
L Switch:SW_SPST SW1
U 1 1 61C06D1E
P 6339 912
F 0 "SW1" H 6339 1147 50  0000 C CNN
F 1 "Light switch" H 6339 1056 50  0000 C CNN
F 2 "" H 6339 912 50  0001 C CNN
F 3 "~" H 6339 912 50  0001 C CNN
	1    6339 912 
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 61BDA5E0
P 7039 1362
F 0 "D2" H 7032 1107 50  0000 C CNN
F 1 "Backlight leds 12V" H 7032 1198 50  0000 C CNN
F 2 "" H 7039 1362 50  0001 C CNN
F 3 "~" H 7039 1362 50  0001 C CNN
	1    7039 1362
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D1
U 1 1 61BD4D6C
P 7039 912
F 0 "D1" H 7032 657 50  0000 C CNN
F 1 "Headlight leds 12V" H 7032 748 50  0000 C CNN
F 2 "" H 7039 912 50  0001 C CNN
F 3 "~" H 7039 912 50  0001 C CNN
	1    7039 912 
	-1   0    0    1   
$EndComp
$Comp
L Device:Fuse F1
U 1 1 61BCEDD6
P 5739 912
F 0 "F1" V 5542 912 50  0000 C CNN
F 1 "7.5A" V 5633 912 50  0000 C CNN
F 2 "" V 5669 912 50  0001 C CNN
F 3 "~" H 5739 912 50  0001 C CNN
	1    5739 912 
	0    1    1    0   
$EndComp
Wire Wire Line
	4939 1212 5289 1212
Wire Wire Line
	5289 1012 5289 912 
Wire Wire Line
	4939 1012 5289 1012
Text Label 3989 1212 0    50   ~ 0
yellow-black
Text Label 4089 1012 0    50   ~ 0
yellow
Wire Wire Line
	3989 1212 4439 1212
Wire Wire Line
	3989 1012 4439 1012
$Comp
L snowmobile-parts:866080 U1
U 1 1 61BC7807
P 4689 1112
F 0 "U1" H 4689 1437 50  0000 C CNN
F 1 "866080" H 4689 1346 50  0000 C CNN
F 2 "" H 4689 1262 50  0001 C CNN
F 3 "" H 4689 1262 50  0001 C CNN
	1    4689 1112
	1    0    0    -1  
$EndComp
Text Label 2289 2112 0    50   ~ 0
black
Text Label 1989 1712 0    50   ~ 0
yellow-black
NoConn ~ 2889 1962
Connection ~ 2639 2112
Wire Wire Line
	2639 2112 2889 2112
Connection ~ 1889 1712
Wire Wire Line
	2539 1812 2889 1812
Wire Wire Line
	2539 1712 2539 1812
Wire Wire Line
	1889 1712 2539 1712
$Comp
L snowmobile-parts:KEY U2
U 1 1 61BC1045
P 3289 1562
F 0 "U2" H 3714 1577 50  0000 C CNN
F 1 "Key lock" H 3714 1486 50  0000 C CNN
F 2 "" H 3639 1262 50  0001 C CNN
F 3 "" H 3639 1262 50  0001 C CNN
	1    3289 1562
	1    0    0    -1  
$EndComp
Wire Wire Line
	2639 2112 1889 2112
$Comp
L power:GND #PWR?
U 1 1 61BE8B69
P 2639 2262
F 0 "#PWR?" H 2639 2012 50  0001 C CNN
F 1 "GND" H 2644 2089 50  0000 C CNN
F 2 "" H 2639 2262 50  0001 C CNN
F 3 "" H 2639 2262 50  0001 C CNN
	1    2639 2262
	1    0    0    -1  
$EndComp
Wire Wire Line
	2639 2112 2639 2262
$Comp
L power:GND #PWR?
U 1 1 61BCCA7F
P 1139 962
F 0 "#PWR?" H 1139 712 50  0001 C CNN
F 1 "GND" H 1144 789 50  0000 C CNN
F 2 "" H 1139 962 50  0001 C CNN
F 3 "" H 1139 962 50  0001 C CNN
	1    1139 962 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1489 1712 1889 1712
Wire Wire Line
	1489 1312 1489 1712
Wire Wire Line
	1589 1312 1489 1312
$Comp
L Switch:SW_SPST SW2
U 1 1 61BD51C3
P 1889 1912
F 0 "SW2" V 1935 1824 50  0000 R CNN
F 1 "Shutdown switch" V 1844 1824 50  0000 R CNN
F 2 "" H 1889 1912 50  0001 C CNN
F 3 "~" H 1889 1912 50  0001 C CNN
	1    1889 1912
	0    -1   -1   0   
$EndComp
Text Label 1189 862  0    50   ~ 0
brown
$Comp
L snowmobile-parts:PICKUP_COIL U4
U 1 1 61BCB114
P 889 912
F 0 "U4" H 926 1187 50  0000 C CNN
F 1 "Pickup coil" H 926 1096 50  0000 C CNN
F 2 "" H 889 912 50  0001 C CNN
F 3 "" H 889 912 50  0001 C CNN
	1    889  912 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1589 1162 1489 1162
Wire Wire Line
	1589 1012 1489 1012
$Comp
L Connector:TestPoint TP?
U 1 1 61BC7915
P 1489 1162
F 0 "TP?" V 1684 1234 50  0001 C CNN
F 1 "Spark plug" V 1592 1234 50  0000 C CNN
F 2 "" H 1689 1162 50  0001 C CNN
F 3 "~" H 1689 1162 50  0001 C CNN
	1    1489 1162
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 61BC5F8D
P 1489 1012
F 0 "TP?" V 1684 1084 50  0001 C CNN
F 1 "Spark plug" V 1592 1084 50  0000 C CNN
F 2 "" H 1689 1012 50  0001 C CNN
F 3 "~" H 1689 1012 50  0001 C CNN
	1    1489 1012
	0    -1   -1   0   
$EndComp
Text Label 3039 1212 0    50   ~ 0
white
Text Label 3039 1012 0    50   ~ 0
green
Wire Wire Line
	2939 1212 3389 1212
Wire Wire Line
	2939 1012 3389 1012
Wire Wire Line
	2939 1312 2839 1312
Wire Wire Line
	2939 1212 2939 1312
Wire Wire Line
	2939 862  2839 862 
Wire Wire Line
	2939 1012 2939 862 
$Comp
L snowmobile-parts:Stator C1
U 1 1 61BAEC22
P 3689 1112
F 0 "C1" H 3650 1510 50  0000 C CNN
F 1 "Stator" H 3650 1419 50  0000 C CNN
F 2 "" H 3689 1112 50  0001 C CNN
F 3 "" H 3689 1112 50  0001 C CNN
	1    3689 1112
	1    0    0    -1  
$EndComp
$Comp
L snowmobile-parts:CDI U3
U 1 1 61BAAE07
P 2139 1112
F 0 "U3" H 2114 1627 50  0000 C CNN
F 1 "CDI" H 2114 1536 50  0000 C CNN
F 2 "" H 1889 1312 50  0001 C CNN
F 3 "" H 1889 1312 50  0001 C CNN
	1    2139 1112
	1    0    0    -1  
$EndComp
$EndSCHEMATC
