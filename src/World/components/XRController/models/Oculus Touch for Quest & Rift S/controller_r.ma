//Maya ASCII 2019 scene
//Name: controller_r.ma
//Last modified: Mon, Apr 15, 2019 02:56:58 PM
//Codeset: 1252
file -rdi 1 -ns "controller_materials" -rfn "skel:controller_materialsRN" -op
		 "v=0;" -typ "mayaAscii" "C:/dev/depot/depot/Content/controllers//models/controller_materials.ma";
file -r -ns "controller_materials" -dr 1 -rfn "skel:controller_materialsRN" -op "v=0;"
		 -typ "mayaAscii" "C:/dev/depot/depot/Content/controllers//models/controller_materials.ma";
requires maya "2019";
requires -nodeType "gameFbxExporter" "gameFbxExporter" "1.0";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya 2019";
fileInfo "version" "2019";
fileInfo "cutIdentifier" "201812112215-434d8d9c04";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 17134)\n";
createNode transform -s -n "persp";
	rename -uid "F409049F-4F08-C713-7E65-689A3B4BD51B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -21.721076148572443 1.8091091523829204 -6.3793390956633589 ;
	setAttr ".r" -type "double3" -6.9383527264700611 252.99999999991567 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "55415AD8-49F2-F5E1-6C4C-788DF3753139";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 22.067138017571857;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -0.77271000000000112 -0.85663080317199103 0.025219162416763696 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "8B5C2AE0-4C1B-A742-1DB9-A390585432C1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "43504BEA-47C7-D35B-1CF3-CCBDF1ED4053";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "634030C4-4783-56B1-F177-ED8115387B27";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "C143E5ED-4E4E-4E0F-7AB1-8C82A999E411";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "4735E8EF-4E60-200A-CB12-CCB554BA83E8";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "197BFDB4-46FF-0E89-83C8-D8BD42942BDB";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode joint -n "RIG_controller_world";
	rename -uid "A6A9DEBC-405A-1BC8-21B8-10A1E05C3044";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".jo" -type "double3" -89.999999999999986 0 0 ;
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
createNode joint -n "f_world" -p "RIG_controller_world";
	rename -uid "C6301154-4A03-D49F-91FA-5DB8134E7572";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
	setAttr ".restMatrix" -type "matrix" 1 0 0 0 0 2.2204460492503131e-16 -1.0000000000000002 0
		 0 1.0000000000000002 2.2204460492503131e-16 0 0 0 0 1;
createNode nurbsCurve -n "f_worldShape1" -p "f_world";
	rename -uid "AEE91504-4BA4-BDA8-9A10-4EA480FC4981";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 22;
	setAttr ".cc" -type "nurbsCurve" 
		1 32 0 no 3
		33 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
		 28 29 30 31 32
		33
		-10.335995032651676 -0.0096200733595480994 0.010671893930911756
		-6.2016305965413814 -4.1435710729342592 0.010671893930910838
		-6.2016305965413814 -2.076595573165382 0.010671893930911296
		-5.1569387190127074 -2.076595573165382 0.010671893930911296
		-3.9772391708923411 -3.9666409469327557 0.010671893930910876
		-2.0670594423308679 -5.2148055701399638 0.0106718939309106
		-2.0670594423308679 -6.2111667273207711 0.010671893930910378
		-4.1340349421135336 -6.2111667273207711 0.010671893930910378
		-8.3942525795953316e-05 -10.345117726996346 0.010671893930909461
		4.1338670570446601 -6.2111667273207711 0.010671893930910378
		2.0668915572620024 -6.2111667273207711 0.010671893930910378
		2.0668915572620024 -5.1806350480293615 0.010671893930910607
		3.9807715419962668 -3.962920018896209 0.010671893930910878
		5.1989000076468228 -2.076595573165382 0.010671893930911296
		6.2014627114725194 -2.076595573165382 0.010671893930911296
		6.2014627114725194 -4.1435710729342592 0.010671893930910838
		10.335827147582815 -0.0096200733595480994 0.010671893930911756
		6.2014627114725194 4.1243309262101446 0.010671893930912673
		6.2014627114725194 2.0573554264274931 0.010671893930912214
		5.1989000076468228 2.0573554264274931 0.010671893930912214
		3.9910247657951432 3.9333232893024284 0.01067189393091263
		2.0668915572620024 5.1752036785750652 0.010671893930912906
		2.0668915572620024 6.1919265805966583 0.010671893930913133
		4.1338670570446601 6.1919265805966583 0.010671893930913133
		-8.3942525795953316e-05 10.325877580327356 0.010671893930914051
		-4.1340349421135336 6.1919265805966583 0.010671893930913133
		-2.0670594423308679 6.1919265805966583 0.010671893930913133
		-2.0670594423308679 5.1752036785750652 0.010671893930912906
		-3.9703141104763691 3.9543465324332767 0.010671893930912635
		-5.1911299129733006 2.0573554264274931 0.010671893930912214
		-6.2016305965413814 2.0573554264274931 0.010671893930912214
		-6.2016305965413814 4.1243309262101446 0.010671893930912673
		-10.335581596216974 -0.0096200733595480994 0.010671893930911756
		;
createNode transform -n "f_button_oculus_hmnul" -p "f_world";
	rename -uid "5D3962C7-47CB-87AF-0B42-1B97F612C74A";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -0.94998268883609838 2.3247810857577416 -0.61289872525096956 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 1.6668787942554676e-14 79.000000000000014 -89.999999999999872 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr ".s" -type "double3" 0.99999999999999967 1 0.99999999999999978 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "f_button_oculus" -p "f_button_oculus_hmnul";
	rename -uid "1ABB1869-4B4C-3ADD-BC4C-A08AD71DAC5F";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 2.7755575615628914e-17 1.1102230246251565e-16 0 ;
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".jo" -type "double3" 4.7708320221952744e-15 1.590277340731758e-15 -3.975693351829394e-16 ;
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
	setAttr ".restMatrix" -type "matrix" 4.4408920985006247e-16 -0.98162718344766398 0.19080899537654455 0
		 1 5.5511151231258345e-17 -2.2204460492503135e-15 0 2.3314683517128287e-15 0.19080899537654439 0.9816271834476642 0
		 -0.94998268883609827 -0.61289872525096911 -2.324781085757742 1;
createNode nurbsCurve -n "f_button_oculusShape1" -p "f_button_oculus";
	rename -uid "2D3688A2-4423-1C20-FAB9-8DBBF96F3CCF";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-0.12000000000000009 0.40000000000000002 0.39999999999999997
		-0.12000000000000009 -0.40000000000000002 0.39999999999999997
		-0.11999999999999991 -0.40000000000000002 -0.40000000000000002
		-0.11999999999999991 0.40000000000000002 -0.40000000000000002
		-0.12000000000000009 0.40000000000000002 0.39999999999999997
		;
createNode transform -n "f_button_b_hmnul" -p "f_world";
	rename -uid "FD87A8CF-4719-A8B1-76D3-C5BFC2406126";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0.25458000000000025 -0.89058273723113579 0.086994099855185122 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 1.6668787942554676e-14 79.000000000000014 -89.999999999999872 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr ".s" -type "double3" 0.99999999999999978 1 0.99999999999999967 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "f_button_b" -p "f_button_b_hmnul";
	rename -uid "263E2DF3-482C-F6E0-5778-E685E96A74B8";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".jo" -type "double3" 4.7708320221952744e-15 7.9513867036587899e-16 -4.969616689786743e-16 ;
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
	setAttr ".restMatrix" -type "matrix" 4.4408920985006252e-16 -0.98162718344766409 0.19080899537654455 0
		 1 5.5511151231258345e-17 -2.2204460492503135e-15 0 2.3314683517128283e-15 0.19080899537654439 0.98162718344766409 0
		 0.25458000000000025 0.086994099855184942 0.89058273723113601 1;
createNode nurbsCurve -n "f_button_bShape1" -p "f_button_b";
	rename -uid "7B396CC4-45CA-6E91-0C01-C797BA4D993D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-8.8817841970012528e-17 0.40000000000000002 0.40000000000000002
		-8.8817841970012528e-17 -0.40000000000000002 0.40000000000000002
		8.8817841970012528e-17 -0.40000000000000002 -0.40000000000000002
		8.8817841970012528e-17 0.40000000000000002 -0.40000000000000002
		-8.8817841970012528e-17 0.40000000000000002 0.40000000000000002
		;
createNode transform -n "f_button_a_hmnul" -p "f_world";
	rename -uid "5973A07F-4041-4237-6639-0381F2228D8A";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -0.14917300000000011 0.51105199602178175 -0.12166099730450025 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 1.6668787942554676e-14 79.000000000000014 -89.999999999999872 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr ".s" -type "double3" 0.99999999999999978 1 0.99999999999999967 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "f_button_a" -p "f_button_a_hmnul";
	rename -uid "08947A85-4949-C2DB-070D-848D6E626ECE";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 2.7755575615628914e-17 0 ;
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".jo" -type "double3" 4.7708320221952744e-15 7.9513867036587899e-16 -4.969616689786743e-16 ;
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
	setAttr ".restMatrix" -type "matrix" 4.4408920985006252e-16 -0.98162718344766409 0.19080899537654455 0
		 1 5.5511151231258345e-17 -2.2204460492503135e-15 0 2.3314683517128283e-15 0.19080899537654439 0.98162718344766409 0
		 -0.14917300000000008 -0.12166099730450017 -0.51105199602178186 1;
createNode nurbsCurve -n "f_button_aShape1" -p "f_button_a";
	rename -uid "F9F97FD0-4910-CF64-F36C-2F94D6406128";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		-8.8817841970012528e-17 0.40000000000000002 0.40000000000000002
		-8.8817841970012528e-17 -0.40000000000000002 0.40000000000000002
		8.8817841970012528e-17 -0.40000000000000002 -0.40000000000000002
		8.8817841970012528e-17 0.40000000000000002 -0.40000000000000002
		-8.8817841970012528e-17 0.40000000000000002 0.40000000000000002
		;
createNode transform -n "f_trigger_front_hmnul" -p "f_world";
	rename -uid "FEFC2F8C-4459-E47A-15B3-EB9C467C5118";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -0.95 -2.375219410591269 -0.86003180709468963 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 10.99999999999998 0 180 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr ".s" -type "double3" 1 0.99999999999999978 0.99999999999999978 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "f_trigger_front" -p "f_trigger_front_hmnul";
	rename -uid "C432583A-4242-2CB6-62B1-94866A39F955";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -1.1102230246251565e-16 0 0 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".jo" -type "double3" -1.5062217823006395e-33 -1.3388512521026958e-15 1.2891671274305195e-16 ;
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
	setAttr ".restMatrix" -type "matrix" -1 2.7192621468937821e-32 -1.2246467991473535e-16 0
		 -1.2021465881652132e-16 0.19080899537654425 0.9816271834476642 0 2.3367362543640724e-17 0.98162718344766398 -0.19080899537654425 0
		 -0.94999999999999984 -0.8600318070946904 2.3752194105912694 1;
createNode nurbsCurve -n "f_trigger_frontShape1" -p "f_trigger_front";
	rename -uid "FD512FF2-48BB-2631-6C22-11A0DE169EB2";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 0 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.78361162489122504 0.74999999999999989 -0.46638837510877634
		-1.2643170607829326e-16 0.75 -0.14180581244561224
		-0.78361162489122427 0.74999999999999989 -0.4663883751087759
		-1.1081941875543879 0.74999999999999978 -1.25
		-0.78361162489122449 0.74999999999999956 -2.0336116248912242
		-3.3392053635905195e-16 0.74999999999999944 -2.3581941875543881
		0.78361162489122382 0.74999999999999956 -2.0336116248912246
		1.1081941875543879 0.74999999999999967 -1.2500000000000009
		0.78361162489122504 0.74999999999999989 -0.46638837510877634
		-1.2643170607829326e-16 0.75 -0.14180581244561224
		-0.78361162489122427 0.74999999999999989 -0.4663883751087759
		;
createNode transform -n "f_trigger_grip_hmnul" -p "f_world";
	rename -uid "0EF0B670-467D-0566-85FF-7CA0E36CA51B";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -0.31085952811630446 -0.098306810340279258 -1.8002557061991669 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 179.99880951596296 -79.500004545110414 90.000054446571752 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 0.99999999999999967 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "f_trigger_grip" -p "f_trigger_grip_hmnul";
	rename -uid "EA775D50-45CD-037B-1C61-83BBE037D866";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -2.2204460492503131e-16 5.5511151231257827e-17 -5.5511151231257827e-17 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".jo" -type "double3" 7.9513867036587919e-15 -3.9756933518293967e-15 6.3611093629270335e-15 ;
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
	setAttr ".restMatrix" -type "matrix" -1.7317323286469841e-07 0.98325492202017473 -0.18223544749326309 0
		 0.9999999998031025 3.7864637336126845e-06 1.9479667205279938e-05 0 1.9843506571914908e-05 -0.18223544745400796 -0.98325492182723007 0
		 -0.31085952811630441 -1.8002557061991675 0.09830681034027898 1;
createNode nurbsCurve -n "f_trigger_gripShape1" -p "f_trigger_grip";
	rename -uid "BBF4C5D5-413F-0E80-A527-FB924C986AD6";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 0 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		0.033611624891225045 1.2500000000000007 3.2836116248912233
		-0.75000000000000011 1.2500000000000009 3.6081941875543877
		-1.5336116248912242 1.2500000000000007 3.2836116248912237
		-1.8581941875543879 1.2500000000000007 2.5
		-1.5336116248912246 1.2500000000000004 1.7163883751087756
		-0.75000000000000033 1.2500000000000002 1.3918058124456116
		0.033611624891223824 1.2500000000000004 1.7163883751087754
		0.35819418755438792 1.2500000000000004 2.4999999999999991
		0.033611624891225045 1.2500000000000007 3.2836116248912233
		-0.75000000000000011 1.2500000000000009 3.6081941875543877
		-1.5336116248912242 1.2500000000000007 3.2836116248912237
		;
createNode transform -n "f_thumbstick_hmnul" -p "f_world";
	rename -uid "791226F5-49E3-94D1-5BF0-929C6BC4AACB";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -1.8000000000000025 -1.0134227897071919 -0.4163748997253498 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 90.000000000000213 79.499999999999972 -89.999999999999829 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999978 1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "f_thumbstick" -p "f_thumbstick_hmnul";
	rename -uid "2D162B46-4571-C20E-577A-B68A8028A25D";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 -1.1102230246251565e-16 0 ;
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".jo" -type "double3" 9.5416640443905503e-15 -3.1805546814635168e-15 -2.6483437788300965e-31 ;
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
	setAttr ".restMatrix" -type "matrix" 5.5511151231257817e-16 -0.98325490756395451 0.18223552549214789 0
		 -6.9388939039072284e-16 0.18223552549214786 0.98325490756395428 0 -0.99999999999999989 -6.6613381477509402e-16 -5.6898930012039312e-16 0
		 -1.8000000000000025 -0.41637489972535013 1.0134227897071921 1;
createNode nurbsCurve -n "f_thumbstickShape1" -p "f_thumbstick";
	rename -uid "EB901990-4C9D-7D47-DBFD-6DA847093B33";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 0 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-1.1999999999999997 0.78361162489122382 -0.78361162489122527
		-1.2 1.1081941875543879 -1.400218198317443e-16
		-1.2000000000000002 0.78361162489122427 0.78361162489122405
		-1.2000000000000002 3.2112695072372299e-16 1.1081941875543877
		-1.2000000000000002 -0.78361162489122405 0.78361162489122427
		-1.2 -1.1081941875543881 6.7467010449014387e-17
		-1.1999999999999997 -0.78361162489122438 -0.78361162489122405
		-1.1999999999999997 -5.9521325992805852e-16 -1.1081941875543881
		-1.1999999999999997 0.78361162489122382 -0.78361162489122527
		-1.2 1.1081941875543879 -1.400218198317443e-16
		-1.2000000000000002 0.78361162489122427 0.78361162489122405
		;
createNode joint -n "controller_world";
	rename -uid "F4CC208D-4122-90B9-9393-769705AC66C3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	addAttr -s false -ci true -sn "isCharacter" -ln "isCharacter" -at "message";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -89.999999999999986 0 0 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 2.2204460492503131e-16 -1 0 0 1 2.2204460492503131e-16 0
		 0 0 0 1;
createNode joint -n "b_button_oculus" -p "controller_world";
	rename -uid "0E5624AC-47F6-B60E-DB23-219F5F8C30FB";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.0001272765532787e-13 79.000000000000014 -89.999999999999915 ;
	setAttr ".bps" -type "matrix" 4.4408920985006262e-16 -0.98162718344766398 0.19080899537654444 0
		 1 5.5511151231258197e-17 -1.6653345369377348e-15 0 1.5543122344752192e-15 0.1908089953765445 0.98162718344766398 0
		 -0.94998268883609838 -0.61289872525096911 -2.324781085757742 1;
createNode parentConstraint -n "b_button_oculus_parentConstraint1" -p "b_button_oculus";
	rename -uid "37B48E96-466D-1620-51FA-09B3A55B886E";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_button_oculusW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 5.5511151231257827e-16 -2.2204460492503131e-16 
		0 ;
	setAttr ".tg[0].tor" -type "double3" 4.874014605324059e-14 -1.1131941385122309e-14 
		-1.2722218725854099e-14 ;
	setAttr ".lr" -type "double3" -3.8166656177562201e-14 3.1805546814635195e-15 9.5416640443905487e-15 ;
	setAttr ".rst" -type "double3" -0.94998268883609849 2.324781085757742 -0.61289872525096967 ;
	setAttr ".rsrr" -type "double3" -3.8166656177562201e-14 1.272221872585407e-14 9.5416640443905456e-15 ;
	setAttr -k on ".w0";
createNode joint -n "b_trigger_front" -p "controller_world";
	rename -uid "7FD39700-4FDA-99D2-A7F4-428DAE29C926";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 10.999999999999998 -7.016709298534876e-15 180 ;
	setAttr ".bps" -type "matrix" -1 2.7192621468937816e-32 -1.224646799147353e-16 0
		 -1.2021465881652132e-16 0.1908089953765445 0.98162718344766375 0 2.3367362543640761e-17 0.98162718344766398 -0.1908089953765445 0
		 -0.94999999999999996 -0.8600318070946904 2.3752194105912694 1;
createNode parentConstraint -n "b_trigger_front_parentConstraint1" -p "b_trigger_front";
	rename -uid "14EAA7DC-422A-B658-1078-1990FAA8A949";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_trigger_frontW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 1.1102230246251565e-16 0 6.6613381477509392e-16 ;
	setAttr ".tg[0].tor" -type "double3" 3.1805546814635174e-14 0 1.4124500153760508e-30 ;
	setAttr ".lr" -type "double3" -1.7493050748049341e-14 -8.8278125961003172e-32 1.3476156101741507e-47 ;
	setAttr ".rst" -type "double3" -0.95 -2.3752194105912694 -0.86003180709468974 ;
	setAttr ".rsrr" -type "double3" -3.0215269473903408e-14 -8.8278125961003172e-32 
		2.3276996903008059e-47 ;
	setAttr -k on ".w0";
createNode joint -n "b_trigger_grip" -p "controller_world";
	rename -uid "239C3529-44C6-BC68-107D-E4AC88B565A2";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99880951596307 -79.500004545110428 90.000054446571639 ;
	setAttr -k on ".jox";
	setAttr -k on ".joy";
	setAttr -k on ".joz";
	setAttr ".bps" -type "matrix" -1.7317323242060922e-07 0.98325492202017495 -0.18223544749326298 0
		 0.99999999980310261 3.7864637329465502e-06 1.9479667205279938e-05 0 1.9843506571637359e-05 -0.18223544745400799 -0.9832549218272304 0
		 -0.31085952811630446 -1.8002557061991673 0.098306810340278883 1;
createNode parentConstraint -n "b_trigger_grip_parentConstraint1" -p "b_trigger_grip";
	rename -uid "EAE18224-4282-32C5-AC57-5999D275DBAC";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_trigger_gripW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 2.2204460492503131e-16 -1.1102230246251565e-16 
		-3.3306690738754696e-16 ;
	setAttr ".tg[0].tor" -type "double3" 3.1973641429939482e-14 -1.5902773407317584e-15 
		2.5444437451708134e-14 ;
	setAttr ".lr" -type "double3" -3.8166656177562195e-14 -1.2722218725854078e-14 -3.1805546814635161e-14 ;
	setAttr ".rst" -type "double3" -0.31085952811630452 -0.098306810340279271 -1.8002557061991673 ;
	setAttr ".rsrr" -type "double3" -3.8166656177562201e-14 -1.0593375115320381e-29 
		-3.1805546814635168e-14 ;
	setAttr -k on ".w0";
createNode joint -n "b_thumbstick" -p "controller_world";
	rename -uid "B64728E0-45E7-93F9-F805-E8B15ADC9F59";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 90.000000000000128 79.499999999999972 -89.999999999999901 ;
	setAttr -k on ".jox";
	setAttr -k on ".joy";
	setAttr -k on ".joz";
	setAttr ".bps" -type "matrix" 5.5511151231257827e-16 -0.98325490756395439 0.18223552549214786 0
		 -2.081668171172168e-16 0.18223552549214786 0.98325490756395428 0 -1 -4.4408920985006257e-16 -1.2490009027033018e-16 0
		 -1.8000000000000025 -0.41637489972535013 1.0134227897071921 1;
createNode parentConstraint -n "b_thumbstick_parentConstraint1" -p "b_thumbstick";
	rename -uid "C1D146A2-421E-F10D-FC5A-88965883082F";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_thumbstickW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -1.1102230246251565e-16 1.1102230246251565e-16 
		2.2204460492503131e-16 ;
	setAttr ".tg[0].tor" -type "double3" -8.348956038841731e-14 1.908332808878111e-14 
		3.1805546814635176e-15 ;
	setAttr ".lr" -type "double3" 7.9513867036587935e-14 -1.272221872585407e-14 1.5902773407317497e-15 ;
	setAttr ".rst" -type "double3" -1.8000000000000027 -1.0134227897071921 -0.41637489972535002 ;
	setAttr ".rsrr" -type "double3" 8.4284699058783202e-14 -1.2722218725854065e-14 -3.1805546814635266e-15 ;
	setAttr -k on ".w0";
createNode joint -n "b_button_a" -p "controller_world";
	rename -uid "9C056181-405B-47BA-F953-638BAA63B684";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.3335030354043723e-13 79.000000000000014 -89.999999999999872 ;
	setAttr ".bps" -type "matrix" 4.4408920985006262e-16 -0.98162718344766409 0.19080899537654455 0
		 1 5.5511151231258332e-17 -2.2204460492503131e-15 0 2.3314683517128291e-15 0.19080899537654439 0.9816271834476642 0
		 -0.14917300000000011 -0.12166099730450017 -0.51105199602178186 1;
createNode parentConstraint -n "b_button_a_parentConstraint1" -p "b_button_a";
	rename -uid "9B30516A-4F0C-825D-E60D-7AA565EE32B9";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_button_aW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" 1.5265566588595902e-16 -2.7755575615628914e-17 
		1.1102230246251565e-16 ;
	setAttr ".tg[0].tor" -type "double3" 1.2488475735065257e-14 -7.9513867036587919e-15 
		-1.9597743963342704e-29 ;
	setAttr ".lr" -type "double3" -3.180554681463516e-15 -3.180554681463516e-15 8.8278125961003129e-32 ;
	setAttr ".rst" -type "double3" -0.14917300000000011 0.51105199602178175 -0.12166099730450029 ;
	setAttr ".rsrr" -type "double3" 0 3.180554681463516e-15 0 ;
	setAttr -k on ".w0";
createNode joint -n "b_button_b" -p "controller_world";
	rename -uid "C220CEC8-45B1-8BC9-7D15-30BFFE343835";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 1.3335030354043723e-13 79.000000000000014 -89.999999999999872 ;
	setAttr ".bps" -type "matrix" 4.4408920985006262e-16 -0.98162718344766409 0.19080899537654455 0
		 1 5.5511151231258332e-17 -2.2204460492503131e-15 0 2.3314683517128291e-15 0.19080899537654439 0.9816271834476642 0
		 0.25458000000000025 0.086994099855184942 0.89058273723113601 1;
createNode parentConstraint -n "b_button_b_parentConstraint1" -p "b_button_b";
	rename -uid "AD32E7FE-4FBE-F922-F2F6-F6BECB0A0B99";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_button_bW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tot" -type "double3" -1.9428902930940239e-16 0 0 ;
	setAttr ".tg[0].tor" -type "double3" 1.2488475735065257e-14 -7.9513867036587919e-15 
		-1.9597743963342704e-29 ;
	setAttr ".lr" -type "double3" -3.180554681463516e-15 -3.180554681463516e-15 8.8278125961003129e-32 ;
	setAttr ".rst" -type "double3" 0.25458000000000025 -0.89058273723113601 0.086994099855185136 ;
	setAttr ".rsrr" -type "double3" 0 3.180554681463516e-15 0 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "controller_world_parentConstraint1" -p "controller_world";
	rename -uid "B08462F6-40F7-BA24-A20C-0C8C01BC4348";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_worldW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".tg[0].tor" -type "double3" -1.2722218725854064e-14 0 0 ;
	setAttr ".rsrr" -type "double3" 2.5444437451708134e-14 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "controller_ply";
	rename -uid "6CABDFED-400F-3E82-B1C9-E2B94E1D9EC7";
	addAttr -is true -ci true -k true -sn "currentUVSet" -ln "currentUVSet" -dt "string";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr -k on ".currentUVSet" -type "string" "map1";
createNode mesh -n "controller_plyShape" -p "controller_ply";
	rename -uid "A416C188-45F5-1457-580A-21855199727A";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".vcs" 2;
createNode mesh -n "controller_plyShapeOrig" -p "controller_ply";
	rename -uid "ACF249CF-4EA9-7FC8-06DC-458E6455441C";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 2432 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.6966036 0.652906 0.69784993
		 0.66496801 0.73135388 0.65005153 0.73288125 0.66707426 0.46664202 0.61483461 0.47506678
		 0.57928503 0.44959992 0.59553307 0.45922577 0.57686955 0.48345882 0.54928708 0.4647212
		 0.56172442 0.46790534 0.54971582 0.4940865 0.41684854 0.46951377 0.42912668 0.49971515
		 0.42831168 0.47848302 0.45203462 0.7516368 0.48742875 0.73796463 0.51036376 0.76899898
		 0.49832284 0.75264597 0.52997983 0.72398686 0.62970376 0.7551595 0.62015748 0.75580913
		 0.64769483 0.34648681 0.77630806 0.35090947 0.75036329 0.32545727 0.76907301 0.3198629
		 0.73980135 0.34305739 0.72791994 0.31784248 0.73064595 0.34798521 0.74200499 0.31931561
		 0.73732138 0.69015974 0.49038178 0.71023995 0.50352049 0.69880337 0.47529826 0.72227538
		 0.49132237 0.68814111 0.62718862 0.69309521 0.6380108 0.71574527 0.61415213 0.71971864
		 0.51902449 0.72888589 0.53571218 0.72949547 0.47650844 0.73319936 0.46120122 0.70506978
		 0.46407288 0.70916271 0.45011115 0.7089529 0.53709626 0.70467049 0.52297747 0.68923706
		 0.59140629 0.67794347 0.58462507 0.67216152 0.60563159 0.6634056 0.59968841 0.73440379
		 0.55692405 0.75750148 0.56103212 0.7149514 0.69766659 0.69238454 0.68612176 0.74467856
		 0.59419674 0.77269161 0.616247 0.43150851 0.65671682 0.46773356 0.6480673 0.42334604
		 0.63289422 0.46632013 0.48144609 0.45927992 0.46261126 0.44566688 0.4706232 0.43968967
		 0.4561885 0.3416065 0.79650116 0.32768282 0.79283643 0.40773651 0.38269034 0.42056325
		 0.36379153 0.3814854 0.35717922 0.39140379 0.34260538 0.37723273 0.31625551 0.4026635
		 0.3256698 0.38552061 0.3031674 0.41600844 0.30129021 0.4706654 0.52924871 0.48552528
		 0.52989715 0.4818674 0.48039278 0.46961123 0.49665546 0.48606107 0.51036859 0.47104719
		 0.5087536 0.42374831 0.40179014 0.43665186 0.42185116 0.44324127 0.38863963 0.45027843
		 0.40782824 0.39719829 0.39616722 0.4101671 0.41008562 0.42196739 0.42576417 0.70010549
		 0.50810802 0.68852979 0.52135688 0.68653172 0.50757557 0.66085154 0.51530683 0.66265678
		 0.50000739 0.43797746 0.61392868 0.39860237 0.66030532 0.42750105 0.60028923 0.43555757
		 0.58625853 0.39203718 0.64377207 0.3775306 0.65652972 0.38055205 0.67682749 0.40569496
		 0.62913501 0.66747802 0.67807215 0.43486997 0.26304954 0.42347983 0.24373536 0.41024914
		 0.2735641 0.40191507 0.25508648 0.1762262 0.55137849 0.19243981 0.55769616 0.17339285
		 0.54638731 0.17339285 0.52827764 0.16460729 0.52830255 0.14555514 0.55772048 0.16460729
		 0.54641229 0.16177428 0.55147481 0.28860715 0.54017013 0.21083216 0.56786472 0.0493927
		 0.54019231 0.12716222 0.56788826 0.57407033 0.31209183 0.57271856 0.31965125 0.60223329
		 0.32003421 0.57675487 0.34729967 0.57491297 0.37433189 0.58897805 0.35203207 0.58899403
		 0.37979966 0.52754915 0.3059057 0.51930702 0.28111675 0.50763977 0.29787335 0.54621631
		 0.28824586 0.5421409 0.3041653 0.51209712 0.43613657 0.50834328 0.45837316 0.52676308
		 0.43603712 0.54193324 0.46184167 0.54406834 0.42868161 0.55258197 0.43739247 0.55732989
		 0.41844982 0.57207525 0.42291427 0.51452112 0.31048477 0.49594501 0.31082612 0.55373037
		 0.30570924 0.57638031 0.2917766 0.56546152 0.31102547 0.57564366 0.32961336 0.59654135
		 0.33632368 0.57254207 0.38916299 0.58528948 0.39403072 0.60977638 0.3829515 0.60451525
		 0.40178576 0.64092183 0.39671722 0.6343922 0.41455248 0.51932251 0.1799622 0.49587181
		 0.1716938 0.50040215 0.18576045 0.50321549 0.14707649 0.47683296 0.14313635 0.4869073
		 0.15569371 0.57632691 0.47601345 0.58376104 0.44834498 0.49001956 0.3895441 0.48869964
		 0.35281396 0.46059832 0.37549341 0.47187302 0.34750423 0.4823935 0.32796732 0.49270788
		 0.33094385 0.50269538 0.31819275 0.51947963 0.89556015 0.50057924 0.88968825 0.49599651
		 0.90369982 0.47684479 0.93216187 0.48980573 0.96059901 0.50325137 0.92837864 0.51216072
		 0.95217305 0.48697072 0.91966128 0.67338222 0.75233746 0.68381625 0.77224529 0.70500493
		 0.73364216 0.71861422 0.75022519 0.50732732 0.53089368 0.50614971 0.54891378 0.78678542
		 0.50513667 0.77650201 0.47343829 0.79518282 0.47552165 0.66943532 0.41097999 0.6618582
		 0.42742842 0.63697296 0.51077646 0.64046913 0.49377272 0.57562852 0.49843881 0.54027188
		 0.49016431 0.75472867 0.44398028 0.74444032 0.41380227 0.73316985 0.44062832 0.72707552
		 0.41748014 0.69720125 0.40984344 0.69302988 0.42400354 0.71221286 0.42182595 0.71182114
		 0.43549868 0.49019814 0.25744539 0.47538486 0.23476639 0.4724471 0.26997307 0.45710519
		 0.24851827 0.57046902 0.57413816 0.5363782 0.57381737 0.56910664 0.60064077 0.53561169
		 0.60232061 0.65452868 0.57860523 0.65123481 0.59788853 0.55117381 0.73499745 0.55903113
		 0.76437062 0.58439779 0.72750092 0.59386367 0.75536019 0.47185591 0.68243617 0.43931171
		 0.68793994 0.39532951 0.3981117 0.36866254 0.37422723 0.37037098 0.37215081 0.44921213
		 0.55189598 0.44656363 0.55125409 0.44611213 0.56296843 0.44354981 0.56210983 0.41897431
		 0.61264032 0.83254433 0.34072858 0.81827623 0.32491097 0.81165004 0.35695341 0.79827374
		 0.34249881 0.62508887 0.24078783 0.6336599 0.21438417 0.60400879 0.23284785 0.61058134
		 0.20666446 0.75942326 0.2439612 0.7397272 0.23232122 0.74415404 0.2652697 0.72566104
		 0.25442344 0.83868128 0.30756357 0.82498711 0.2940602 0.80560923 0.31229943 0.88404316
		 0.42759979 0.9100979 0.41771203 0.87581259 0.4079634 0.90089035 0.3966555 0.61765486
		 0.18184865 0.62495363 0.15719961 0.59414923 0.1747608 0.60075825 0.15004328 0.61217862
		 0.48606575 0.61902189 0.46150231 0.80596769 0.76382852 0.78679121 0.74524087 0.79074764
		 0.77730334 0.77252024 0.75746328 0.90142846 0.58276671 0.90375781 0.55958849 0.87542838
		 0.57891822;
	setAttr ".uvst[0].uvsp[250:499]" 0.87773865 0.55772007 0.74002486 0.84376764
		 0.72598976 0.82165295 0.72267985 0.85299557 0.70979291 0.83030117 0.85441166 0.75152254
		 0.83288687 0.73539233 0.83903676 0.76855457 0.81863141 0.7512148 0.89161015 0.62730163
		 0.88426793 0.64846259 0.91847563 0.63548136 0.91033882 0.65831101 0.58253884 0.85000759
		 0.55996597 0.85712534 0.58800304 0.87581801 0.56743473 0.88171798 0.39847493 0.86135525
		 0.42391872 0.83995157 0.38822654 0.83858711 0.41023967 0.820858 0.65072387 0.9107005
		 0.62505555 0.91869825 0.65776706 0.93256271 0.63124371 0.94066077 0.95057088 0.70212513
		 0.92684966 0.69111794 0.93762386 0.72526163 0.91501141 0.71357369 0.92606336 0.74410075
		 0.72517425 0.90705454 0.71430022 0.88647151 0.70322508 0.91634285 0.69370669 0.89527088
		 0.96106178 0.51160371 0.98833793 0.50904906 0.95767194 0.48348963 0.98407233 0.47804707
		 0.82786566 0.25975963 0.84542328 0.27528808 0.84490985 0.24265432 0.86352545 0.25901657
		 0.28194946 0.66279805 0.28216627 0.68480158 0.28860715 0.66503531 0.28860715 0.68490344
		 0.78877282 0.039744455 0.76562595 0.039744455 0.78877282 0.050911147 0.76562595 0.050911147
		 0.57017136 0.039744455 0.55347359 0.039744455 0.57017136 0.050911147 0.55347359 0.050911147
		 0.88077688 0.039744455 0.85968995 0.039744455 0.88077688 0.050911147 0.85968995 0.050911147
		 0.73730326 0.034657728 0.73730326 0.02349104 0.72031808 0.034657728 0.72031808 0.02349104
		 0.46364871 0.02349104 0.46364871 0.034657728 0.48417237 0.02349104 0.48417237 0.034657728
		 0.75927067 0.30849707 0.74302977 0.29714528 0.74313796 0.32863918 0.72745329 0.31841329
		 0.87533593 0.4971627 0.87129861 0.47626621 0.8553378 0.50005597 0.85162622 0.48065412
		 0.72876686 0.78835613 0.71384054 0.76628542 0.71141744 0.79815942 0.69736791 0.77473038
		 0.83302784 0.64879555 0.85227501 0.65748501 0.84046394 0.63224202 0.85996854 0.63944757
		 0.28860715 0.3648499 0.28860715 0.3492178 0.17339285 0.35347241 0.17339285 0.33564964
		 0.17339285 0.36895046 0.28860715 0.38377625 0.16460729 0.26661652 0.0493927 0.28115475
		 0.16460729 0.28511268 0.0493927 0.29653442 0.0493927 0.26341927 0.16460729 0.25054938
		 0.0493927 0.38379905 0.16460729 0.36897328 0.0493927 0.36487272 0.16460729 0.35349482
		 0.16460729 0.38811728 0.0493927 0.40053162 0.0493927 0.51665103 0.16460729 0.50933236
		 0.27581441 0.0053534466 0.25425372 0.0053534466 0.27542332 0.01951112 0.25387922
		 0.01951112 0.52262211 0.0053534466 0.522928 0.01951112 0.5472405 0.0053534466 0.54780632
		 0.01951112 0.78386772 0.0053534466 0.7844311 0.01951112 0.80118155 0.0053534466 0.80171245
		 0.01951112 0.99189687 0.0053534466 0.97382152 0.0053534466 0.98789549 0.01951112
		 0.97021431 0.01951112 0.41783896 0.23183082 0.39949462 0.24126127 0.69001555 0.10831248
		 0.70602775 0.10831248 0.69119209 0.10069048 0.70731705 0.10069048 0.81611991 0.10831248
		 0.81433797 0.10069048 0.80591607 0.10831248 0.80487943 0.10069048 0.55419004 0.0953805
		 0.55224556 0.080619469 0.5325498 0.09538056 0.52894467 0.080619469 0.67408067 0.69921201
		 0.69193333 0.71883249 0.63220894 0.62465811 0.6027776 0.6286729 0.63715434 0.65324253
		 0.60636222 0.66022956 0.43677449 0.85726947 0.4559913 0.84013069 0.44465581 0.82290494
		 0.64651781 0.38126078 0.67446142 0.39598626 0.50843596 0.48586327 0.50822753 0.51267064
		 0.53962505 0.51572621 0.53882611 0.53290147 0.63608241 0.54476947 0.63677466 0.53139406
		 0.60670656 0.5408892 0.60780823 0.52667278 0.58133101 0.26914352 0.55026042 0.26673594
		 0.50346404 0.57536501 0.53787541 0.54966611 0.53724599 0.63705772 0.50304997 0.64164269
		 0.54010576 0.67196333 0.50621712 0.67711288 0.46969506 0.298953 0.48735023 0.28529212
		 0.67924798 0.61502254 0.70516557 0.60112882 0.5639568 0.78675425 0.53075558 0.79414088
		 0.56933665 0.81055963 0.53590059 0.81722808 0.37586129 0.6544131 0.34711406 0.6756736
		 0.3485752 0.6779319 0.45031506 0.528166 0.45303002 0.52841997 0.45365599 0.50508589
		 0.45251542 0.49410802 0.44142973 0.57527244 0.61144274 0.69491291 0.57876813 0.70256871
		 0.61784399 0.71917927 0.79039103 0.29882425 0.77663058 0.28773093 0.77215791 0.31866285
		 0.75434095 0.20969561 0.77536935 0.22203936 0.86021036 0.28979141 0.9365713 0.40737963
		 0.92655784 0.38488543 0.52716619 0.15501241 0.75148541 0.67279816 0.76999021 0.67596245
		 0.77413023 0.64625126 0.66912371 0.48127791 0.6470775 0.47145507 0.77698457 0.78839266
		 0.75963658 0.76761943 0.75989974 0.80070579 0.74339449 0.77895868 0.89733213 0.60563302
		 0.87143487 0.59982091 0.73609364 0.87613046 0.75461286 0.86641318 0.86056936 0.7863161
		 0.87708038 0.76796257 0.9456026 0.64405477 0.93682826 0.66860068 0.58009064 0.93158114
		 0.60081142 0.92575747 0.57402319 0.9068355 0.59428811 0.90103024 0.51824009 0.870417
		 0.50171798 0.87006664 0.49971652 0.98235273 0.47960246 0.99132067 0.46946684 0.96943361
		 0.90402693 0.73166341 0.74784166 0.89619762 0.5646885 0.11565641 0.55764997 0.13777238
		 0.58465481 0.12168231 0.5800553 0.14417781 0.81207699 0.2472281 0.82807416 0.22955547
		 0.28860715 0.58161181 0.28860715 0.56276155 0.22865075 0.58078134 0.80945921 0.039744455
		 0.80945921 0.050911147 0.53410381 0.039744455 0.53410381 0.050911147 0.94807386 0.039744455
		 0.94807386 0.050911147 0.97042108 0.039744455 0.97042108 0.050911147 0.75705218 0.02349104
		 0.75705218 0.034657728 0.97170591 0.02349104 0.94866061 0.02349104 0.97170591 0.034657728
		 0.94866061 0.034657728 0.72840595 0.28773597 0.71345222 0.30978349 0.84678644 0.46191168
		 0.86637849 0.45617196 0.69640499 0.80601251 0.68339413 0.78141332 0.84695315 0.61421847
		 0.86655575 0.61992151 0.17339285 0.30094424 0.17339285 0.31974727 0.28860715 0.31519029
		 0.28860715 0.33114663;
	setAttr ".uvst[0].uvsp[500:749]" 0.28860715 0.29651067 0.17339285 0.28508994
		 0.0493927 0.33116919 0.16460729 0.31976974 0.0493927 0.31521386 0.16460729 0.30096716
		 0.16460729 0.33567238 0.0493927 0.34923828 0.23624597 0.0053534466 0.23564476 0.01951112
		 0.5 0.0053534466 0.5 0.01951112 0.76375401 0.0053534466 0.76435512 0.01951112 0.9524073
		 0.0053534466 0.95090419 0.01951112 0.48992682 0.11478169 0.4581733 0.13049476 0.46964696
		 0.10581121 0.51193869 0.84687203 0.49774703 0.85191929 0.44061363 0.22592972 0.43314964
		 0.21640584 0.72105747 0.10831248 0.74955887 0.10831248 0.72231811 0.10069048 0.74957442
		 0.10069048 0.58795452 0.080619529 0.59361327 0.09538056 0.60332078 0.080619529 0.60907352
		 0.09538056 0.57040191 0.63284463 0.60070932 0.59956288 0.69169378 0.53706586 0.72784138
		 0.33202016 0.69218433 0.3088156 0.71400458 0.35008317 0.68070996 0.32992721 0.43539053
		 0.33723965 0.69245851 0.55205399 0.66242474 0.54822671 0.66282165 0.5349319 0.60910171
		 0.29975656 0.61661798 0.27708137 0.60224038 0.57521981 0.60007566 0.77779478 0.49598882
		 0.77922201 0.46975338 0.7867378 0.50081563 0.8001011 0.4760851 0.80703849 0.39017779
		 0.64182967 0.40367275 0.6273635 0.45093736 0.50526178 0.44965011 0.44224489 0.43298021
		 0.44322672 0.60844839 0.50593728 0.57501227 0.52116466 0.42866188 0.76564324 0.42090818
		 0.72549993 0.40197867 0.75806022 0.39610565 0.73028076 0.75955254 0.27540612 0.90132701
		 0.4932647 0.89719349 0.47040594 0.72239691 0.22307856 0.73584175 0.19996339 0.85405815
		 0.32458264 0.87671828 0.30812779 0.91827607 0.44052464 0.94538897 0.43190289 0.57390738
		 0.16889954 0.63420922 0.55795479 0.60512209 0.5548954 0.63044554 0.57657081 0.7444948
		 0.8108291 0.87607682 0.66811138 0.70225012 0.86282402 0.79421663 0.80836332 0.81241244
		 0.82890439 0.80898178 0.79655057 0.82821256 0.8163687 0.87976927 0.71757203 0.89024377
		 0.70051885 0.55051315 0.91350454 0.55764621 0.93790764 0.93420982 0.53798306 0.93254966
		 0.56186014 0.96206218 0.53795725 0.96111631 0.56431454 0.47510982 0.19152151 0.45702335
		 0.20706743 0.49269193 0.2219575 0.98836887 0.53793228 0.98839229 0.56681669 0.96152836
		 0.67849439 0.78952014 0.87303644 0.77566874 0.85408705 0.76741534 0.88603687 0.53524745
		 0.13100524 0.54290444 0.10867537 0.8795054 0.27439922 0.28860715 0.6225425 0.28860715
		 0.60076225 0.26322153 0.61846226 0.24750748 0.59812397 0.10934222 0.58080351 0.0493927
		 0.56278586 0.59055996 0.039744455 0.59055996 0.050911147 0.92452538 0.039744455 0.92452538
		 0.050911147 0.6816802 0.02349104 0.6816802 0.034657728 0.69975805 0.02349104 0.69975805
		 0.034657728 0.90742052 0.02349104 0.90742052 0.034657728 0.92789638 0.02349104 0.92789638
		 0.034657728 0.83522701 0.039744455 0.83522701 0.050911147 0.71105564 0.27789807 0.69605076
		 0.27002114 0.69697213 0.30129737 0.68300378 0.29459506 0.85974836 0.43665603 0.84025967
		 0.44389349 0.66287309 0.82118666 0.6792019 0.81406099 0.65317887 0.79432011 0.66807771
		 0.78814352 0.82384259 0.66524667 0.84287268 0.67549771 0.17339285 0.2665939 0.28860715
		 0.28113008 0.28860715 0.26339585 0.17339285 0.25052652 0.28860715 0.51662892 0.28860715
		 0.49741504 0.17339285 0.50930721 0.17339285 0.49107718 0.21613227 0.0053534466 0.19881843
		 0.0053534466 0.21556878 0.01951112 0.19828761 0.01951112 0.47737786 0.0053534466
		 0.45275947 0.0053534466 0.47707185 0.01951112 0.45219371 0.01951112 0.72418559 0.0053534466
		 0.72457659 0.01951112 0.74574631 0.0053534466 0.74612081 0.01951112 0.0081031639
		 0.0053534466 0.011983255 0.01951112 0.026178507 0.0053534466 0.029696288 0.01951112
		 0.36718169 0.80867791 0.3603065 0.82033843 0.37656868 0.81675339 0.36811593 0.82692826
		 0.78083861 0.10069048 0.76900953 0.10069048 0.7807405 0.10831248 0.76921952 0.10831248
		 0.66256869 0.10831248 0.67587817 0.10831248 0.66266888 0.10069048 0.67642009 0.10069048
		 0.85190487 0.080619469 0.85578001 0.0953805 0.86497629 0.080619469 0.86681116 0.0953805
		 0.62378699 0.080619469 0.62743628 0.0953805 0.57262367 0.55199111 0.57397264 0.53665149
		 0.62856597 0.59853446 0.43138015 0.80483985 0.61549747 0.3663376 0.68569416 0.43973371
		 0.44824198 0.285431 0.44770429 0.31595618 0.76243091 0.40537414 0.77646923 0.44552088
		 0.78247857 0.39653829 0.79600447 0.44472095 0.62545419 0.34916466 0.50111324 0.60641247
		 0.73122066 0.70814484 0.52621263 0.7722953 0.50617063 0.82172745 0.48250115 0.82720983
		 0.64220363 0.68639946 0.64868927 0.70971787 0.78643286 0.33089232 0.87769097 0.51835674
		 0.9037078 0.51643884 0.70947468 0.2457536 0.89142132 0.44874835 0.66457802 0.64603513
		 0.69078445 0.83926755 0.856426 0.70372844 0.86618817 0.68785328 0.54395741 0.88824242
		 0.52721953 0.92051375 0.90460104 0.53801274 0.52048379 0.97441012 0.9710077 0.65246665
		 0.60648251 0.12793209 0.89704335 0.29381973 0.60789251 0.039744455 0.60789251 0.050911147
		 0.90131152 0.039744455 0.90131152 0.050911147 0.85202283 0.41862631 0.83279198 0.42734489
		 0.8339361 0.69015235 0.81535941 0.67860073 0.17339285 0.1150296 0.17339285 0.13350293
		 0.28860715 0.11502925 0.28860715 0.13433294 0.047592707 0.0053534466 0.049081929
		 0.01951112 0.44948062 0.1987163 0.64340967 0.0953805 0.65386438 0.0953805 0.64306593
		 0.080619469 0.65545428 0.080619499 0.66334945 0.73386526 0.75682318 0.47064865 0.72678965
		 0.57982403 0.6688692 0.34924769 0.70027286 0.36582536 0.74204844 0.37449101 0.72565305
		 0.38732922 0.64520133 0.3133038 0.63506049 0.33390033 0.41515839 0.78634375 0.39640462
		 0.80412561 0.60664701 0.80142301 0.41683331 0.61101174 0.70199096 0.21321876 0.69048101
		 0.23675628 0.80863315 0.27958098 0.79387408 0.2677685 0.85611063 0.37237212 0.86589491
		 0.38823649 0.87944168 0.35850325;
	setAttr ".uvst[0].uvsp[750:999]" 0.88994122 0.37554032 0.93250042 0.51411122
		 0.44920471 0.72077018 0.45721236 0.7562077 0.68305451 0.8709603 0.67301065 0.84703696
		 0.8253426 0.7820648 0.90116304 0.67938346 0.92973542 0.58735287 0.87843329 0.53803766
		 0.53878665 0.86386693 0.53528237 0.83924168 0.95258111 0.618949 0.97862035 0.62579632
		 0.8080458 0.86121535 0.7930944 0.84281671 0.51224452 0.12330065 0.52068961 0.10108097
		 0.8897354 0.32436189 0.90368831 0.34438509 0.91103536 0.31092882 0.92571008 0.33192191
		 0.27651563 0.64053476 0.28860715 0.64436185 0.061476111 0.64051473 0.0493927 0.64433652
		 0.056049824 0.66276956 0.0493927 0.66500813 0.64462614 0.039744455 0.62764347 0.039744455
		 0.64462614 0.050911147 0.62764347 0.050911147 0.66009951 0.02349104 0.66009951 0.034657728
		 0.86731029 0.02349104 0.86731029 0.034657728 0.88679421 0.02349104 0.88679421 0.034657728
		 0.52971786 0.02349104 0.52971786 0.034657728 0.55548549 0.02349104 0.55548549 0.034657728
		 0.67885339 0.26194149 0.66768593 0.28783005 0.8425985 0.40062332 0.83363593 0.38597444
		 0.82357186 0.41089633 0.81507027 0.3975462 0.8224538 0.70609421 0.80420363 0.69294089
		 0.81198436 0.71918267 0.79407889 0.70471847 0.32447267 0.68757969 0.32786083 0.68984866
		 0.28860715 0.47599444 0.17339285 0.47097069 0.16460729 0.13352667 0.0493927 0.13435601
		 0.16460729 0.15382992 0.0493927 0.15559398 0.16460729 0.11505328 0.0493927 0.11505364
		 0.1778769 0.0053534466 0.17736971 0.01951112 0.4283902 0.0053534466 0.42798656 0.01951112
		 0.70568126 0.0053534466 0.70607442 0.01951112 0.93325806 0.0053534466 0.93220711
		 0.01951112 0.37839055 0.84566027 0.79325759 0.10831248 0.79313421 0.10069048 0.64582616
		 0.10831248 0.64668161 0.10069048 0.73829782 0.080619469 0.71489334 0.080619469 0.73403561
		 0.09538056 0.70807683 0.09538056 0.87859029 0.0953805 0.89456373 0.0953805 0.87893409
		 0.080619469 0.89821297 0.080619469 0.62964493 0.74574631 0.36247706 0.34045991 0.36882406
		 0.33009279 0.65447193 0.29040936 0.3954435 0.7724393 0.38074467 0.79221958 0.54554355
		 0.7095505 0.51255673 0.71379554 0.42523524 0.59882736 0.44984925 0.4945567 0.35709965
		 0.69570994 0.71407914 0.18959197 0.91469532 0.36245391 0.55042857 0.16214208 0.84577799
		 0.80083126 0.95778477 0.59243721 0.53494173 0.23631795 0.53852665 0.21173756 0.51161736
		 0.22862223 0.51799786 0.20509818 0.98418844 0.5978291 0.82840562 0.84657955 0.63121998
		 0.13523568 0.67079157 0.17227055 0.69351375 0.18076113 0.67913467 0.15043908 0.70308101
		 0.15969718 0.05583477 0.68477708 0.0493927 0.68487942 0.39323834 0.039744455 0.39323834
		 0.050911147 0.41628411 0.039744455 0.41628411 0.050911147 0.64155459 0.02349104 0.64155459
		 0.034657728 0.50525266 0.02349104 0.50525266 0.034657728 0.66253269 0.25478402 0.65279019
		 0.28164032 0.58224314 0.22575872 0.58217078 0.25366902 0.59783179 0.26091099 0.28860715
		 0.24834304 0.28860715 0.23000537 0.17339285 0.23124334 0.17339285 0.21269558 0.28860715
		 0.45687076 0.17339285 0.45505068 0.16460729 0.17357938 0.0493927 0.17457788 0.0493927
		 0.49743858 0.16460729 0.49110171 0.15970944 0.0053534466 0.15906104 0.01951112 0.40448937
		 0.0053534466 0.40400195 0.01951112 0.68381846 0.0053534466 0.68442625 0.01951112
		 0.91214257 0.0053534466 0.91139668 0.01951112 0.38886419 0.86720175 0.86590183 0.10831248
		 0.88624346 0.10831248 0.86574388 0.10069048 0.88755083 0.10069048 0.76100004 0.080619469
		 0.76100004 0.0953805 0.948502 0.09538056 0.96781003 0.0953805 0.95307851 0.080619469
		 0.96975458 0.080619469 0.75873101 0.36039093 0.52707827 0.26153708 0.50315285 0.27096161
		 0.51603806 0.25450739 0.65211183 0.45470017 0.65732199 0.44040582 0.62467515 0.44367561
		 0.63019216 0.42825636 0.65740061 0.36446649 0.71063948 0.55436808 0.46018901 0.81360286
		 0.4693853 0.83210957 0.44974855 0.79450715 0.48720929 0.74917507 0.51866525 0.74215215
		 0.43321437 0.58494979 0.44985586 0.48183 0.44727027 0.48263538 0.68281627 0.20505267
		 0.67272085 0.22895247 0.92963636 0.48862571 0.41117677 0.69557905 0.38743582 0.70382339
		 0.66161317 0.87934554 0.65247762 0.85495025 0.77609384 0.82146811 0.84415281 0.72116995
		 0.86658293 0.73630726 0.92493737 0.61211544 0.53520066 0.9445765 0.86388326 0.81709766
		 0.84525591 0.83347321 0.65059596 0.16524795 0.65769118 0.14340401 0.93729389 0.35073453
		 0.95027113 0.37384111 0.72498572 0.16902909 0.0493927 0.58163023 0.66518617 0.039744455
		 0.66518617 0.050911147 0.43704763 0.039744455 0.43704763 0.050911147 0.62007833 0.02349104
		 0.62007833 0.034657728 0.83083987 0.02349104 0.83083987 0.034657728 0.84723115 0.02349104
		 0.84723115 0.034657728 0.39457849 0.02349104 0.37236479 0.02349104 0.39457849 0.034657728
		 0.37236479 0.034657728 0.64290196 0.24725978 0.63395715 0.27475545 0.82213467 0.37003809
		 0.80389774 0.38320866 0.79375196 0.37142751 0.60431731 0.84297293 0.62541229 0.83509874
		 0.59820753 0.81489784 0.61731386 0.80769902 0.79862106 0.733639 0.78137898 0.71788019
		 0.77013338 0.72843128 0.28860715 0.43732911 0.17339285 0.43884432 0.17339285 0.42348751
		 0.16460729 0.19320558 0.0493927 0.19336401 0.0493927 0.47601584 0.16460729 0.47099456
		 0.13950203 0.0053534466 0.13898015 0.01951112 0.38084084 0.0053534466 0.38025796
		 0.01951112 0.66457719 0.0053534466 0.66523576 0.01951112 0.89506221 0.0053534466
		 0.89465302 0.01951112 0.33937332 0.81053901 0.32808062 0.80766451 0.80710667 0.080619469
		 0.81392318 0.0953805 0.82951552 0.080619469 0.83606184 0.0953805 0.84911799 0.10069048
		 0.85144949 0.10831248 0.78796446 0.09538056 0.78370219 0.080619469 0.93404549 0.080619469
		 0.92838681 0.0953805 0.6374343 0.76665097 0.74812067 0.7197625 0.71187848 0.39746308
		 0.68672633 0.38001549 0.67548442 0.46532199;
	setAttr ".uvst[0].uvsp[1000:1249]" 0.68127912 0.45187718 0.66020125 0.56118512
		 0.43065935 0.44458866 0.41976157 0.42730093 0.6522041 0.22099058 0.8438192 0.35494176
		 0.66140002 0.19661698 0.77576178 0.25465602 0.79277593 0.23331667 0.86623901 0.33978561
		 0.92478848 0.46387461 0.95242351 0.45699039 0.64212155 0.18977416 0.64231563 0.88615543
		 0.67094833 0.90371335 0.75974125 0.8321538 0.8900888 0.75170982 0.56420046 0.82930088
		 0.54275769 0.96693808 0.56458831 0.96003652 0.87986994 0.80169827 0.96125638 0.39744499
		 0.76716137 0.19009097 0.78923577 0.20309986 0.074765205 0.61846608 0.0493927 0.62253833
		 0.72339058 0.039744455 0.70484734 0.039744455 0.72339058 0.050911147 0.70484734 0.050911147
		 0.45752266 0.039744455 0.45752266 0.050911147 0.4781473 0.039744455 0.4781473 0.050911147
		 0.57617068 0.02349104 0.57617068 0.034657728 0.81146884 0.02349104 0.81146884 0.034657728
		 0.41692284 0.02349104 0.41692284 0.034657728 0.33531836 0.70915961 0.78102988 0.35825911
		 0.61693257 0.26815858 0.75613582 0.73888332 0.85542369 0.57606864 0.85760361 0.55630594
		 0.17339285 0.17355578 0.17339285 0.19318187 0.28860715 0.17455484 0.28860715 0.19334012
		 0.28860715 0.40051052 0.17339285 0.38809478 0.17339285 0.40485504 0.28860715 0.42028868
		 0.0493927 0.24836624 0.16460729 0.2312666 0.0493927 0.43735132 0.16460729 0.42351022
		 0.0493927 0.4203091 0.16460729 0.40487793 0.16460729 0.43886766 0.0493927 0.45689157
		 0.087857366 0.0053534466 0.088606022 0.01951112 0.10493781 0.0053534466 0.10534757
		 0.01951112 0.33542281 0.0053534466 0.31618148 0.0053534466 0.33476421 0.01951112
		 0.31557372 0.01951112 0.59551066 0.0053534466 0.59599817 0.01951112 0.61915922 0.0053534466
		 0.61974216 0.01951112 0.84029055 0.0053534466 0.84093881 0.01951112 0.86049801 0.0053534466
		 0.86101979 0.01951112 0.50148398 0.20537002 0.96153307 0.10069048 0.94734955 0.10069048
		 0.96093774 0.10831248 0.94750023 0.10831248 0.8359741 0.10069048 0.83941996 0.10831248
		 0.91292644 0.0953805 0.9186793 0.080619469 0.64556378 0.78899628 0.57348126 0.66653514
		 0.68852466 0.56661528 0.40811741 0.41182578 0.47924933 0.71736377 0.61782235 0.89401597
		 0.91140121 0.76512265 0.67925256 0.92557269 0.97844583 0.45009682 0.9707787 0.42344627
		 0.80773544 0.21492414 0.74486828 0.039744455 0.74486828 0.050911147 0.51771289 0.039744455
		 0.51771289 0.050911147 0.99263144 0.050911147 0.99263144 0.039744455 0.77438366 0.02349104
		 0.77438366 0.034657728 0.44044903 0.02349104 0.44044903 0.034657728 0.35261261 0.35860234
		 0.75577003 0.33724219 0.85835522 0.53805959 0.85756552 0.51981568 0.74351585 0.74746764
		 0.7278372 0.75767565 0.85175526 0.59547281 0.17339285 0.15380624 0.28860715 0.15557149
		 0.0493927 0.23002987 0.16460729 0.21271895 0.066741921 0.0053534466 0.06779696 0.01951112
		 0.29431874 0.0053534466 0.29392561 0.01951112 0.57160985 0.0053534466 0.5720135 0.01951112
		 0.82212317 0.0053534466 0.82263011 0.01951112 0.46713576 0.18442522 0.97668529 0.10831248
		 0.9771471 0.10069048 0.82515132 0.10069048 0.82818651 0.10831248 0.56892163 0.080619529
		 0.57349825 0.09538056 0.43725568 0.4573468 0.59311485 0.43151209 0.5998767 0.41585103
		 0.70585662 0.57177377 0.44317237 0.47161335 0.63391805 0.86151761 0.64323288 0.82866597
		 0.60645902 0.94789183 0.58458656 0.9540714 0.89741367 0.78225541 0.4999485 0.09305986
		 0.74761438 0.17991717 0.0493927 0.60077035 0.090482593 0.59814107 0.68326592 0.039744455
		 0.68326592 0.050911147 0.49763206 0.039744455 0.49763206 0.050911147 0.59931993 0.02349104
		 0.59931993 0.034657728 0.79477191 0.02349104 0.79477191 0.034657728 0.76977187 0.34770179
		 0.34908479 0.36046082 0.28860715 0.21219662 0.0493927 0.21222214 0.16460729 0.4550747
		 0.12280849 0.0053534466 0.12251192 0.01951112 0.35849252 0.0053534466 0.35781962
		 0.01951112 0.64150751 0.0053534466 0.64218038 0.01951112 0.87719148 0.0053534466
		 0.87748814 0.01951112 0.45811749 0.94466186 0.6924845 0.080619469 0.68112826 0.080619499
		 0.68593812 0.09538056 0.67593682 0.09538053 0.92072892 0.10831248 0.92116165 0.10069048
		 0.65745717 0.62024832 0.50513804 0.24431457 0.43898609 0.57410747 0.61082035 0.86917269
		 0.47987393 0.084005438 0.99260473 0.02349104 0.99260473 0.034657728 0.38680005 0.25611797
		 0.38715276 0.24194497 0.99305528 0.080619469 0.98945034 0.0953805 0.58779204 0.19994584
		 0.41134983 0.88141906 0.37233832 0.039744455 0.37233832 0.050911147 0.40168223 0.88593906
		 0.9913516 0.10831248 0.99102235 0.10069048 0.36951038 0.39593887 0.36284804 0.39005789
		 0.36840501 0.39622998 0.36269638 0.39119083 0.3669897 0.39626226 0.36284003 0.39259928
		 0.36569566 0.39597589 0.3632848 0.3938477 0.36428759 0.39514139 0.37058273 0.38552019
		 0.37305316 0.38770086 0.37206307 0.38633278 0.36886817 0.38521841 0.36721599 0.38543892
		 0.37356532 0.38936469 0.37355158 0.3910315 0.37253022 0.39343268 0.3730748 0.39262718
		 0.36487228 0.38682726 0.36569184 0.38611001 0.36644292 0.38577932 0.370848 0.39521199
		 0.36340332 0.38864046 0.37194872 0.3942928 0.36417878 0.38743415 0.35989323 0.38854349
		 0.3613264 0.38827434 0.36333928 0.38487664 0.36320177 0.3861188 0.36243474 0.387492
		 0.36289823 0.38362429 0.36191824 0.38247061 0.35866615 0.38827989 0.35647216 0.38700739
		 0.35861856 0.37994328 0.3570407 0.37891838 0.3525697 0.38361415 0.35601804 0.37856367
		 0.35222065 0.38235295 0.36083072 0.38153777 0.35380882 0.38505581 0.35488075 0.37853947
		 0.35220638 0.38126537 0.35246 0.38027981 0.35381362 0.37884361 0.3530499 0.37936696
		 0.55968589 0.21854429 0.56383914 0.24638745 0.63434172 0.80114859 0.3883059 0.27669606
		 0.58254057 0.82207322 0.5750227 0.82503593 0.56743485 0.82802618 0.34643802 0.31755888
		 0.35003543 0.31038493 0.34287375 0.32466671;
	setAttr ".uvst[0].uvsp[1250:1499]" 0.33485422 0.34505385 0.32950708 0.34669444
		 0.37065998 0.25721943 0.37397397 0.24267501 0.36391118 0.28020579 0.35156888 0.30732694
		 0.54378384 0.1873548 0.56724203 0.19396235 0.66622007 0.0953805 0.67009515 0.080619529
		 0.35271934 0.81393611 0.35806185 0.80083221 0.36516273 0.78249526 0.3728767 0.75665718
		 0.37006012 0.73581821 0.30521706 0.69770539 0.31024411 0.69998336 0.31572562 0.72105354
		 0.36413354 0.71380478 0.56626409 0.24735066 0.57279134 0.24994338 0.49744388 0.22350879
		 0.56711888 0.40536422 0.58006907 0.40851492 0.92952025 0.24675974 0.92940009 0.23553362
		 0.94074899 0.24617505 0.94119674 0.23538284 0.91867924 0.24658504 0.90718901 0.24638052
		 0.91772133 0.23581453 0.90562361 0.23672059 0.91954941 0.26921672 0.91018516 0.26729158
		 0.9651047 0.19850919 0.9783209 0.20117287 0.96894395 0.20858607 0.98281986 0.20954692
		 0.96332002 0.24578834 0.96616906 0.23642801 0.97641313 0.24723086 0.98174733 0.23820303
		 0.94033068 0.26884639 0.94963938 0.26655781 0.95179987 0.24554059 0.95884317 0.26266858
		 0.92993933 0.26969972 0.96924311 0.21730013 0.95580542 0.21551809 0.95748657 0.20529543
		 0.88836396 0.21865819 0.88839877 0.209755 0.90205389 0.216373 0.90006208 0.20649852
		 0.87460995 0.21126659 0.87273848 0.22003213 0.96862757 0.22664343 0.95444739 0.22565524
		 0.94226831 0.21388087 0.94189137 0.2249998 0.92893344 0.21324128 0.92912972 0.22481439
		 0.91669738 0.22541918 0.90375614 0.22655642 0.91557741 0.21448039 0.8733567 0.22997671
		 0.88989538 0.22800024 0.95337951 0.23586419 0.98485047 0.22802924 0.98507053 0.21814686
		 0.87691683 0.24008051 0.89266425 0.23774645 0.90090472 0.26369667 0.89648682 0.24703602
		 0.88261694 0.24901314 0.89078027 0.25705069 0.96871835 0.25564027 0.88504326 0.19460195
		 0.89315134 0.18759403 0.89654654 0.19184804 0.9004935 0.18317366 0.94364887 0.20229363
		 0.91393507 0.20254807 0.92867482 0.2007229 0.93928766 0.18492314 0.92846173 0.18408367
		 0.93717498 0.17650865 0.92835855 0.17602341 0.91774952 0.18518399 0.91959739 0.17677259
		 0.94764662 0.17893764 0.95085776 0.18753907 0.90929735 0.17947721 0.90628356 0.18829516
		 0.94143867 0.19349048 0.95412719 0.19629671 0.92856681 0.19229034 0.91586816 0.19374815
		 0.90321505 0.19727327 0.89252794 0.20067996 0.87875843 0.20258203 0.97210884 0.1935723
		 0.96077573 0.19045182 0.95652395 0.18253818 0.96397823 0.18672107 0.89122236 0.18673545
		 0.89927948 0.18174729 0.89315134 0.18759403 0.9004935 0.18317366 0.90848982 0.17783567
		 0.90929735 0.17947721 0.91875374 0.17507765 0.92832983 0.17418653 0.91959739 0.17677259
		 0.92835855 0.17602341 0.91967559 0.27104706 0.90937209 0.26895276 0.91954941 0.26921672
		 0.91018516 0.26729158 0.89931256 0.2650063 0.90090472 0.26369667 0.92997539 0.27149209
		 0.92993933 0.26969972 0.88926613 0.25821745 0.89078027 0.25705069 0.88098818 0.24988657
		 0.88261694 0.24901314 0.9379856 0.17477043 0.93717498 0.17650865 0.95775032 0.18106526
		 0.95652395 0.18253818 0.94844413 0.1772631 0.94764662 0.17893764 0.96584785 0.18585423
		 0.96397823 0.18672107 0.97993195 0.20035499 0.9783209 0.20117287 0.97378349 0.19265309
		 0.97210884 0.1935723 0.98451728 0.20897591 0.98281986 0.20954692 0.98659474 0.2284584
		 0.98345375 0.23875144 0.98485047 0.22802924 0.98174733 0.23820303 0.97806478 0.24802494
		 0.97641313 0.24723086 0.97026294 0.25671983 0.96871835 0.25564027 0.98684078 0.21800183
		 0.98507053 0.21814686 0.96046549 0.26390147 0.95052999 0.26819143 0.95884317 0.26266858
		 0.94963938 0.26655781 0.94028199 0.27068681 0.94033068 0.26884639 0.87710518 0.20182301
		 0.88327605 0.19374704 0.87875843 0.20258203 0.88504326 0.19460195 0.87289298 0.21076076
		 0.87460995 0.21126659 0.87518871 0.24071287 0.87691683 0.24008051 0.87162608 0.23047376
		 0.8733567 0.22997671 0.87096214 0.21995397 0.87273848 0.22003213 0.95657885 0.8852222
		 0.95053756 0.87342763 0.97400129 0.87535208 0.97247422 0.86297083 0.97399497 0.75672668
		 0.95656633 0.74685508 0.97628474 0.74592751 0.96290243 0.7373997 0.97276711 0.81604648
		 0.93992043 0.81604844 0.9727391 0.80608213 0.94031489 0.80531871 0.94551229 0.85926259
		 0.9722662 0.85082018 0.97246921 0.76911372 0.95052457 0.75865602 0.94183934 0.84315395
		 0.97260046 0.83856696 0.94550157 0.77282745 0.97226274 0.78126842 0.97274005 0.82601035
		 0.94031763 0.82677728 0.94183207 0.78893995 0.97259831 0.79352403 0.96780598 0.9015491
		 0.96291173 0.89467371 0.97896779 0.89587092 0.97629237 0.88614392 0.96779895 0.7305252
		 0.97108471 0.72377342 0.97896647 0.73620689 0.97109437 0.90829748 0.99207962 0.90688568
		 0.99207962 0.89492291 0.99207962 0.7251786 0.99207962 0.73714817 0.97423768 0.71610081
		 0.99207962 0.71472973 0.99207962 0.8725583 0.99207962 0.86126006 0.9770782 0.7068457
		 0.99207962 0.70465273 0.99207962 0.74850178 0.99207962 0.75952333 0.99207962 0.8052727
		 0.99207962 0.81604737 0.99207962 0.84997869 0.98036659 0.68961364 0.98058486 0.67934543
		 0.99207962 0.68542832 0.99207962 0.67541927 0.99207962 0.77082539 0.97424924 0.91596323
		 0.99207962 0.9173286 0.97708964 0.92521054 0.99207962 0.92740011 0.98077226 0.6678161
		 0.99207962 0.66499317 0.99207962 0.83885473 0.97883117 0.69877166 0.99207962 0.69499594
		 0.99207962 0.78211027 0.98037624 0.94242787 0.99207962 0.94661009 0.98059487 0.95268828
		 0.99207962 0.95661056 0.98078227 0.96420693 0.99207962 0.96702719 0.98021269 0.65568787
		 0.99207962 0.65397263 0.97884154 0.93327779 0.99207962 0.93703336 0.99207962 0.82682067
		 0.97963667 0.64348298 0.99207962 0.64253443 0.99207962 0.79323757 0.98022354 0.97632384
		 0.99207962 0.97803766 0.99207962 0.88357538 0.97964764 0.98851848 0.99207962 0.98946595;
	setAttr ".uvst[0].uvsp[1500:1749]" 0.98673362 0.20823038 0.98203546 0.19928713
		 0.98915213 0.21781246 0.98887223 0.22901875 0.98568171 0.23946749 0.98022133 0.24906175
		 0.97227967 0.25812942 0.96258366 0.26551121 0.95169288 0.27032435 0.94021851 0.27308977
		 0.93002248 0.27383229 0.91984046 0.27343681 0.90831047 0.27112168 0.89723384 0.26671627
		 0.88728929 0.25974086 0.87886167 0.25102699 0.87293249 0.24153852 0.86936653 0.23112272
		 0.86864293 0.21985194 0.8706513 0.21010031 0.87494659 0.20083199 0.88096869 0.19263081
		 0.88870376 0.18561444 0.89769441 0.17988497 0.90743536 0.17569239 0.91765225 0.17286462
		 0.92829245 0.1717882 0.939044 0.17250094 0.94948554 0.17507672 0.95935154 0.17914212
		 0.96828914 0.18472245 0.97596985 0.19145294 0.12473897 0.66661024 0.084091581 0.6652922
		 0.096284129 0.63620716 0.037016131 0.88023734 0.10276788 0.89183658 0.04327945 0.89701712
		 0.11185244 0.73865551 0.17266284 0.74416769 0.16977684 0.79365009 0.18602322 0.77633846
		 0.15932618 0.8392244 0.096814208 0.82898116 0.16048996 0.81552887 0.084541537 0.95015764
		 0.12044535 0.91957575 0.098831512 0.9601329 0.1513326 0.93810004 0.19022493 0.93902797
		 0.20042856 0.97802252 0.17573278 0.98100442 0.15898727 0.9803586 0.13589881 0.97594923
		 0.11384157 0.96813405 0.22163337 0.97222745 0.23725504 0.92908263 0.1663935 0.86192816
		 0.055498045 0.91859025 0.071224242 0.93815327 0.23672652 0.96561486 0.2512297 0.95710897
		 0.26494578 0.94673038 0.27761751 0.93447649 0.032608133 0.86108679 0.036428966 0.80163389
		 0.05167548 0.75574809 0.29118323 0.74973202 0.23623478 0.74484485 0.27714431 0.70982212
		 0.23029107 0.71052182 0.24678409 0.63302279 0.26011124 0.6643452 0.21983659 0.66638315
		 0.17249434 0.71025801 0.066687502 0.71220565 0.031892519 0.82318711 0.030613462 0.84125906
		 0.20722009 0.76573962 0.23070025 0.76321405 0.2729066 0.78168476 0.25348353 0.76882458
		 0.28686643 0.8001098 0.30561936 0.79093575 0.31095374 0.80837661 0.29297227 0.84526259
		 0.31538653 0.83994406 0.31437129 0.85442555 0.30797702 0.88251442 0.284024 0.86671942
		 0.31188858 0.86863899 0.20101209 0.89345479 0.22421783 0.89836848 0.24760365 0.89501601
		 0.18090294 0.8807857 0.10741863 0.61472559 0.17158531 0.63458365 0.23613852 0.61248785
		 0.11906246 0.59646773 0.12788735 0.58569986 0.17215161 0.59640932 0.13885473 0.57683188
		 0.22519809 0.59642762 0.21638006 0.58560234 0.20572348 0.57682705 0.14917289 0.57131582
		 0.17215531 0.56699562 0.19526078 0.57110751 0.43349835 0.061948106 0.41567251 0.061948106
		 0.43349835 0.056052014 0.41567251 0.056052014 0.79165661 0.073948167 0.79165661 0.068051837
		 0.80507457 0.073948167 0.80507457 0.068051837 0.52803874 0.073948167 0.52803874 0.068052076
		 0.54150963 0.073948167 0.54150963 0.068052076 0.18580304 0.83584154 0.19149058 0.8351081
		 0.19014107 0.84956557 0.19523548 0.84689087 0.32074171 0.50443864 0.29925829 0.50443864
		 0.32074171 0.49134612 0.29925829 0.49134612 0.32074171 0.40318191 0.29925829 0.40318191
		 0.32074171 0.38274288 0.29925829 0.38274288 0.26313213 0.85299611 0.27880102 0.86328864
		 0.25312704 0.86355752 0.26452059 0.87886906 0.48328564 0.061948106 0.45846865 0.061948106
		 0.48328564 0.056052014 0.45846865 0.056052014 0.83183312 0.068051837 0.8318336 0.073948167
		 0.81846774 0.068051837 0.81846774 0.073948167 0.56015635 0.073948167 0.56015635 0.068052076
		 0.58229017 0.073948167 0.58229017 0.068052076 0.59132785 0.056052014 0.61018986 0.056051895
		 0.59132785 0.061948106 0.61018986 0.061948106 0.19702293 0.81139755 0.19211261 0.82278305
		 0.19220011 0.80822963 0.18651985 0.82148677 0.32074171 0.47644079 0.29925829 0.47644079
		 0.32074171 0.45993125 0.29925829 0.45993125 0.32074171 0.3620131 0.29925829 0.3620131
		 0.32074171 0.34128296 0.29925829 0.34128296 0.25624478 0.80007005 0.24390274 0.79233545
		 0.26874113 0.78628111 0.25108832 0.77470231 0.26885492 0.83969629 0.28694293 0.843871
		 0.70212305 0.073948167 0.70212305 0.068051837 0.74411261 0.073948167 0.74411261 0.068051837
		 0.26831841 0.88397294 0.29955494 0.90222961 0.16699743 0.81701833 0.17538266 0.79729497
		 0.5013144 0.061948106 0.5013144 0.056052014 0.85164833 0.073948167 0.85164809 0.068051837
		 0.6148783 0.073948167 0.6148783 0.068051837 0.63088053 0.061948106 0.63088053 0.056051895
		 0.17232977 0.66665256 0.20561434 0.80232579 0.20213981 0.79767501 0.32074171 0.44204843
		 0.29925829 0.44204843 0.32074171 0.32084322 0.29925829 0.32084322 0.19005236 0.7816726
		 0.565202 0.061948106 0.53870678 0.061948106 0.565202 0.056052014 0.53870678 0.056052014
		 0.88759089 0.073948167 0.88759089 0.068051837 0.90371108 0.073948167 0.90371108 0.068051837
		 0.99232751 0.061947986 0.98247951 0.061947986 0.99232751 0.056051895 0.98247951 0.056051895
		 0.74502414 0.061947986 0.69398087 0.061948106 0.74502414 0.056051895 0.69398087 0.056051895
		 0.24170494 0.79773307 0.22962797 0.78922117 0.22937298 0.79505545 0.24965757 0.85888284
		 0.2582998 0.8498081 0.32074171 0.28197253 0.29925829 0.28197253 0.32074171 0.26408565
		 0.29925829 0.26408565 0.21513271 0.79107738 0.23043218 0.76971579 0.20919824 0.7720741
		 0.29390562 0.82210064 0.31443763 0.8255263 0.24007559 0.87012565 0.24572164 0.88879347
		 0.22555083 0.87192488 0.22455108 0.89175761 0.1659454 0.83837867 0.51975536 0.061948106
		 0.51975536 0.056052014 0.87141442 0.073948167 0.87141442 0.068051837 0.96836764 0.061947986
		 0.95638436 0.061947986 0.96836764 0.056051895 0.95638436 0.056051895 0.67082161 0.061948106
		 0.65180916 0.061947986 0.67082161 0.056051895 0.65180916 0.056051895 0.84658951 0.061947986
		 0.79368752 0.061947986 0.84658951 0.056051895 0.79368752 0.056051895 0.21684527 0.7966519
		 0.32074171 0.42304301 0.29925829 0.42304301 0.32074171 0.30097985 0.29925829 0.30097985;
	setAttr ".uvst[0].uvsp[1750:1999]" 0.21129268 0.86875594 0.20358223 0.88728011
		 0.91939473 0.073948167 0.91939473 0.068051837 0.93466091 0.073948167 0.93466091 0.068051837
		 0.48894763 0.073948167 0.48894763 0.068052076 0.50278187 0.073948167 0.50278187 0.068052076
		 0.87976617 0.061947986 0.87976617 0.056051895 0.66147888 0.073948167 0.66147888 0.068051837
		 0.26005134 0.8142041 0.25236136 0.80437946 0.26515412 0.8115077 0.22582787 0.86608833
		 0.23838001 0.86453348 0.32074171 0.2475723 0.29925829 0.2475723 0.32074171 0.23266244
		 0.29925829 0.23266244 0.28143835 0.80295932 0.26955026 0.82527149 0.28781676 0.82289338
		 0.17233039 0.85883749 0.16252933 0.56789201 0.26323953 0.8383944 0.94187635 0.061947986
		 0.92753249 0.061947986 0.94187635 0.056051895 0.92753249 0.056051895 0.94957209 0.073948167
		 0.94957209 0.068051837 0.96943069 0.073948167 0.96943069 0.068051837 0.76162446 0.073948167
		 0.76162446 0.068051837 0.77819145 0.073948167 0.77819145 0.068051837 0.51458216 0.073948167
		 0.51458216 0.068052076 0.26384196 0.82602102 0.20288463 0.85670662 0.21350604 0.86337137
		 0.19899867 0.86099571 0.32074171 0.21956575 0.29925829 0.21956575 0.32074171 0.20846581
		 0.29925829 0.20846581 0.28867263 0.92072183 0.47914195 0.073948167 0.47914195 0.068052076
		 0.18180816 0.56793702 0.99185807 0.073948167 0.99185807 0.068051837 0.32074171 0.51553416
		 0.29925829 0.51553416 0.18542688 0.87583822 0.90504926 0.061947986 0.90504926 0.056051895
		 0.37655893 0.98705667 0.35771927 0.99040866 0.33886963 0.98711348 0.33871371 0.88356435
		 0.35755333 0.88021219 0.37640163 0.88350677 0.72442365 0.12531944 0.70776701 0.12531944
		 0.7244277 0.11460605 0.70777124 0.11460605 0.30336046 0.92582488 0.30987799 0.9078337
		 0.4118818 0.9256615 0.40531033 0.90768933 0.6911149 0.11460605 0.69111013 0.12531944
		 0.9742347 0.12531944 0.97423607 0.11460605 0.99088889 0.12531944 0.99089044 0.11460605
		 0.39311677 0.97746426 0.32228291 0.97757095 0.95758075 0.12531944 0.95758182 0.11460605
		 0.4053933 0.96278733 0.30996096 0.96293104 0.92427385 0.12531944 0.92427462 0.11460605
		 0.94092703 0.12531944 0.94092816 0.11460605 0.41191208 0.94479609 0.30338928 0.94495946
		 0.77439731 0.11460605 0.79105198 0.11460605 0.77439249 0.12531944 0.79104805 0.12531944
		 0.87431598 0.12531944 0.87431699 0.11460605 0.89096868 0.12531944 0.8909691 0.11460605
		 0.74108398 0.11460605 0.75774056 0.11460605 0.74108011 0.12531944 0.75773662 0.12531944
		 0.85766309 0.12531944 0.84101015 0.12531944 0.85766453 0.11460605 0.84101194 0.11460605
		 0.82435888 0.11460605 0.82435668 0.12531944 0.90762115 0.12531944 0.90762079 0.11460605
		 0.80770564 0.11460605 0.80770266 0.12531944 0.32215577 0.89315647 0.39298964 0.8930493
		 0.82645822 0.91743791 0.79809248 0.94086558 0.80476242 0.90468699 0.77994663 0.90886223
		 0.76361799 0.92801261 0.7634235 0.95317912 0.77945065 0.97258121 0.80419797 0.97714365
		 0.82609075 0.964733 0.83488345 0.94115198 0.91276389 0.90264821 0.93630016 0.91185081
		 0.91188759 0.93958098 0.94841427 0.93403071 0.8888185 0.91072458 0.87566537 0.93230301
		 0.87946093 0.9572885 0.89843065 0.97398639 0.92369354 0.97458512 0.94343352 0.95880705
		 0.035574146 0.29290134 0.035574146 0.3113032 0.030233918 0.29290134 0.030233882 0.3113032
		 0.030233938 0.27449656 0.035574146 0.27449656 0.03023391 0.25609767 0.035574146 0.25609767
		 0.035574146 0.32970554 0.035574146 0.34810838 0.030233819 0.32970554 0.030233813
		 0.34810838 0.035574146 0.36651102 0.030234054 0.36651102 0.035574146 0.38491264 0.030234121
		 0.38491264 0.035574146 0.40331584 0.030234383 0.40331584 0.035574146 0.42171809 0.030234471
		 0.42171809 0.035574146 0.44011974 0.030234545 0.44011974 0.035574146 0.10241177 0.035574146
		 0.12728263 0.030234639 0.10241177 0.030234583 0.12728263 0.035574146 0.14568439 0.030234285
		 0.14568439 0.035574146 0.16408625 0.030234231 0.16408625 0.035574146 0.18248731 0.030234162
		 0.18248731 0.035574146 0.20088981 0.030234069 0.20088981 0.035574146 0.21929333 0.030234089
		 0.21929333 0.035574146 0.23769541 0.030233867 0.23769541 0.77881277 0.89130098 0.76546001
		 0.89886862 0.74609095 0.92967069 0.75145829 0.91528684 0.74592721 0.95125121 0.75106806
		 0.96571457 0.76481026 0.98234844 0.77804226 0.99012405 0.81439322 0.99148971 0.79925913
		 0.99403572 0.84312534 0.96917152 0.83316398 0.98085046 0.85066742 0.94895196 0.85078275
		 0.93359965 0.8337813 0.90143585 0.84355736 0.91326803 0.81518012 0.89050436 0.80008805
		 0.88772184 0.010029401 0.44011974 0.010028699 0.42171809 0.010027799 0.40331584 0.010027298
		 0.38491264 0.010026798 0.36651102 0.010027098 0.25609767 0.010027398 0.27449957 0.010026396
		 0.34810838 0.010026798 0.23769541 0.010026596 0.32970554 0.010026497 0.21929333 0.010026897
		 0.3113032 0.010026497 0.20088981 0.010028499 0.14568439 0.010028199 0.16408625 0.010027298
		 0.29290134 0.010027198 0.18248731 0.010029601 0.10241177 0.0100292 0.12728263 0.035574146
		 0.6099999 0.035574146 0.62840194 0.029433172 0.6099999 0.029433342 0.62840194 0.029433178
		 0.59159803 0.035574146 0.59159803 0.029433332 0.57319617 0.035574146 0.57319617 0.035574146
		 0.6468038 0.035574146 0.66520697 0.029433519 0.6468038 0.029433776 0.66520697 0.035574146
		 0.68361002 0.029433712 0.68361002 0.035574146 0.70201182 0.029433489 0.70201182 0.035574146
		 0.72041392 0.02943328 0.72041392 0.035574146 0.73881572 0.02943317 0.73881572 0.035574146
		 0.75721759 0.029432714 0.75721759 0.035574146 0.77561945 0.029432513 0.77561945 0.035574146
		 0.44438052 0.035574146 0.46278238 0.029432464 0.44438052 0.029432721 0.46278238 0.035574146
		 0.48118424 0.029433031 0.48118424 0.035574146 0.49958745 0.029433317 0.49958745 0.035574146
		 0.51798928 0.029433506 0.51798928 0.035574146 0.53639114 0.029433567 0.53639114 0.035574146
		 0.55479431;
	setAttr ".uvst[0].uvsp[2000:2249]" 0.029433522 0.55479431 0.87287033 0.90311307
		 0.88490802 0.89349151 0.86159158 0.9216128 0.85855055 0.93672431 0.8618021 0.95815057
		 0.8691957 0.97167891 0.88546181 0.98599452 0.89981663 0.99160492 0.93607879 0.98719269
		 0.92147517 0.99211788 0.96102601 0.96050686 0.95300227 0.97366571 0.96529835 0.93926424
		 0.96298701 0.92402083 0.94102448 0.89482039 0.952595 0.90500301 0.90543747 0.88656723
		 0.92084414 0.88693172 0.0092261257 0.75721759 0.0092267273 0.73881572 0.0092267273
		 0.72041392 0.0092267273 0.70201182 0.0092267273 0.68361002 0.0092267273 0.57319617
		 0.0092267273 0.59159803 0.0092267273 0.6468038 0.0092267273 0.66520697 0.0092267273
		 0.53639114 0.0092267273 0.55479431 0.0092267273 0.62840194 0.0092267273 0.51798928
		 0.0092267273 0.6099999 0.0092267273 0.49958745 0.0092261257 0.48118424 0.0092261257
		 0.46278238 0.0092261257 0.77561945 0.0092261257 0.44438052 0.1355066 0.064386129
		 0.14929673 0.044571236 0.14929673 0.064386129 0.16337621 0.064386129 0.17789687 0.044571236
		 0.17764258 0.064386129 0.1920605 0.064386129 0.20667972 0.044571236 0.20653763 0.064386129
		 0.22099167 0.064386129 0.23532161 0.064386129 0.23403922 0.044571236 0.24945936 0.064386129
		 0.021438699 0.064386129 0.035475601 0.044571236 0.035475601 0.064386129 0.049774006
		 0.064386129 0.064211383 0.064386129 0.064211383 0.044571236 0.078674853 0.064386129
		 0.093118794 0.064386129 0.093118794 0.044571236 0.10744073 0.064386129 0.0076370565
		 0.064386129 0.0076370565 0.044571236 0.26336303 0.064386129 0.26336303 0.044571236
		 0.12159824 0.064386129 0.12159824 0.044571236 0.40573934 0.096014261 0.39560884 0.12348284
		 0.35737431 0.095862016 0.36729619 0.12345719 0.0076370565 0.02878841 0.035475601
		 0.02878841 0.093118794 0.075079106 0.093118794 0.085630886 0.078674853 0.075079069
		 0.078674853 0.085630886 0.035475601 0.075079106 0.049774006 0.075079106 0.44264457
		 0.12729968 0.41733477 0.14167957 0.064211383 0.02878841 0.10744073 0.085630871 0.10744073
		 0.075079106 0.021438699 0.075079106 0.45035452 0.17483242 0.42173794 0.16950238 0.093118794
		 0.02878841 0.12159824 0.075079106 0.12159825 0.085630894 0.0076370565 0.075079106
		 0.17764258 0.075079106 0.1920605 0.075079106 0.39519227 0.17878893 0.40290099 0.16592352
		 0.40739232 0.19358151 0.12159824 0.02878841 0.1355066 0.085630894 0.1355066 0.075079106
		 0.22099167 0.085630879 0.20653763 0.085630879 0.22099167 0.075079106 0.20653763 0.075079069
		 0.24945936 0.075079106 0.26336303 0.075079069 0.16337621 0.075079106 0.35463968 0.19362691
		 0.36688501 0.17887269 0.3810342 0.20305839 0.38102132 0.18388388 0.14929673 0.02878841
		 0.17789687 0.02878841 0.16337621 0.085630879 0.14929673 0.085630879 0.14929673 0.075079106
		 0.24945936 0.085630894 0.23532161 0.085630879 0.23532161 0.075079106 0.34031755 0.16937023
		 0.35933954 0.16602144 0.42593306 0.2159842 0.17764258 0.085630864 0.26336303 0.085630879
		 0.34548202 0.14150533 0.36213291 0.15128303 0.38100424 0.23213798 0.1920605 0.085630886
		 0.021438699 0.085630879 0.0076370565 0.085630879 0.37383977 0.14165646 0.33596879
		 0.2159587 0.035475601 0.085630894 0.38899639 0.14162457 0.31164548 0.17439884 0.20667972
		 0.02878841 0.049774006 0.085630879 0.40053535 0.15120994 0.3201794 0.12677634 0.23403922
		 0.02878841 0.064211383 0.075079106 0.064211383 0.085630879 0.26336303 0.02878841
		 0.12159824 0.098019145 0.1355066 0.098019145 0.14929673 0.098019153 0.20653763 0.098019153
		 0.22099167 0.098019153 0.23532161 0.098019153 0.24945936 0.098019153 0.26336303 0.098019145
		 0.0076370561 0.098019145 0.021438697 0.098019145 0.035475601 0.098019145 0.049774006
		 0.098019153 0.064211383 0.098019153 0.078674853 0.098019145 0.093118794 0.098019145
		 0.10744073 0.098019145 0.16337621 0.098019153 0.17764258 0.098019153 0.1920605 0.098019145
		 0.32234737 0.10685614 0.30821618 0.10847335 0.32104236 0.10283586 0.30848715 0.10427198
		 0.29437235 0.10520208 0.29618546 0.10136613 0.27644581 0.045062065 0.28022438 0.047908679
		 0.27078009 0.058108583 0.27519286 0.059514999 0.2861993 0.034711048 0.28889701 0.038697839
		 0.29892492 0.02835916 0.30021721 0.03304328 0.3130497 0.026698664 0.31278381 0.031565145
		 0.32688087 0.03001222 0.3250902 0.034514412 0.33876914 0.037818313 0.33566362 0.041463643
		 0.3472347 0.049247459 0.34318891 0.051632881 0.35132465 0.062871277 0.34681773 0.063749969
		 0.35046351 0.077069163 0.34604374 0.076373518 0.34484041 0.090136826 0.34103641 0.087985873
		 0.3350549 0.10046138 0.33233562 0.097156793 0.28250796 0.097354129 0.28564015 0.094397575
		 0.27400661 0.085947797 0.27807876 0.084264055 0.26996121 0.072309971 0.2744737 0.072142482
		 0.31431118 0.099636033 0.29308268 0.094586924 0.33382225 0.089859381 0.34249282 0.069825262
		 0.3362577 0.048900127 0.31802404 0.036880493 0.29632783 0.039398551 0.2813341 0.055275276
		 0.28005669 0.077070564 0.24057007 0.80169487 0.24974936 0.80771387 0.22987553 0.79916286
		 0.2189557 0.80042326 0.20912762 0.80532414 0.20157672 0.81327426 0.19721377 0.82331479
		 0.196565 0.8342346 0.19970864 0.84471667 0.20626552 0.85349679 0.21544482 0.85951579
		 0.22613937 0.86204779 0.23705924 0.86078733 0.24688727 0.85588658 0.25443816 0.84793639
		 0.25880116 0.83789593 0.2594499 0.82697606 0.25630629 0.81649399 0.5576756 0.34145796
		 0.5453487 0.34252751 0.55643362 0.33492577 0.54540211 0.33514306 0.52411658 0.40235916
		 0.51322788 0.39993587 0.52576399 0.39408746 0.51389468 0.39082929 0.74919963 0.13243999
		 0.74569815 0.15088287 0.73828089 0.13243999 0.73350269 0.14592935 0.76042569 0.13243999
		 0.75855428 0.15447785 0.52919084 0.37240756 0.51644862 0.36962759 0.53070998 0.36109209
		 0.51795131 0.35831407 0.77238584 0.15636531 0.77311236 0.13243999 0.55690438 0.36314106
		 0.5557642 0.375049 0.54358077 0.36275542 0.54211068 0.37470278 0.78490263 0.13243999
		 0.78466117 0.15715609;
	setAttr ".uvst[0].uvsp[2250:2431]" 0.79723966 0.1571897 0.79606605 0.13243999
		 0.88103026 0.16466074 0.88083571 0.13243997 0.89308619 0.1642538 0.89233273 0.13243999
		 0.80852193 0.15753324 0.80726737 0.13243999 0.52749538 0.38402566 0.51504248 0.38083053
		 0.91571534 0.13243999 0.91527832 0.16248174 0.55283642 0.39726791 0.53997338 0.38874987
		 0.92905682 0.1612933 0.92788202 0.13243999 0.53211766 0.3507798 0.51961762 0.34806713
		 0.53353649 0.34153122 0.52182698 0.33851054 0.94521302 0.15889344 0.93967056 0.13243999
		 0.5574199 0.35322893 0.54462981 0.35225955 0.95729637 0.15684935 0.9510904 0.13243999
		 0.8350082 0.16146263 0.83008552 0.16066925 0.83333063 0.13243999 0.82754922 0.13243999
		 0.84157056 0.13243999 0.84736156 0.13243999 0.84270364 0.16270719 0.84760052 0.16331428
		 0.85990393 0.13243999 0.85800505 0.16416384 0.85413992 0.13243999 0.85291517 0.16377586
		 0.54562092 0.4129774 0.53474426 0.40663669 0.54958189 0.40692976 0.53751528 0.39907467
		 0.52142978 0.41424915 0.51403975 0.41224334 0.52265972 0.40883556 0.51329929 0.40658805
		 0.53487253 0.33403125 0.52458239 0.33102173 0.71652329 0.13243999 0.71185398 0.14377677
		 0.71198893 0.13243999 0.70623577 0.14439936 0.71843743 0.14250718 0.72413456 0.13243999
		 0.72429562 0.14290719 0.72898638 0.13243999 0.98574001 0.14879747 0.98061728 0.15054034
		 0.97754067 0.13243999 0.97292459 0.13243999 0.95888054 0.13243999 0.96351838 0.13243999
		 0.96727699 0.15371852 0.97307783 0.15217012 0.98280716 0.13243999 0.98890948 0.14717826
		 0.70764631 0.13243999 0.70298672 0.14447191 0.70330369 0.13243999 0.69973767 0.14454447
		 0.81422317 0.13243999 0.81901735 0.13244879 0.81790006 0.15879521 0.82393968 0.15968204
		 0.86555886 0.16466439 0.86716068 0.13244 0.8717525 0.16480881 0.87357414 0.13243997
		 0.54097581 0.41671214 0.53571022 0.419076 0.53172696 0.41214806 0.52859724 0.41646013
		 0.55412942 0.32988909 0.54478019 0.32929304 0.53599739 0.32812309 0.52741194 0.32564095
		 0.54192126 0.31991458 0.5458017 0.32180065 0.54348272 0.32429546 0.55015159 0.32526439
		 0.53697366 0.32319155 0.53050321 0.32168722 0.53793091 0.31855354 0.53367203 0.3181242
		 0.52559233 0.42040348 0.52036059 0.41949821 0.51497102 0.41747516 0.51044214 0.41455799
		 0.5063976 0.41053683 0.9920789 0.14555904 0.98807371 0.13243999 0.50328416 0.40539417
		 0.50164652 0.39999625 0.50156444 0.38857734 0.50231916 0.37889326 0.50359249 0.36709195
		 0.50506097 0.35464877 0.5066067 0.34493408 0.50965559 0.33375642 0.51414311 0.32629797
		 0.51835859 0.3223286 0.52399224 0.31962138 0.52936721 0.31821582 0.53053939 0.42027482
		 0.50697023 0.42108035 0.50917166 0.41766804 0.51196492 0.42421603 0.51396227 0.42071936
		 0.51904404 0.42674974 0.5197795 0.42285421 0.52501619 0.42795449 0.52539647 0.42386916
		 0.5321967 0.42760158 0.5309127 0.42369601 0.53731912 0.42606336 0.53622633 0.42237675
		 0.54502207 0.42255038 0.54213613 0.41971689 0.55005157 0.41812545 0.54701674 0.41574082
		 0.55452663 0.41154873 0.55122274 0.40940168 0.55846167 0.39999527 0.55470449 0.39909735
		 0.56168926 0.37609282 0.55783403 0.37543041 0.56287223 0.36373165 0.55901033 0.36288375
		 0.56352365 0.35158536 0.55957949 0.3522118 0.56367517 0.33938357 0.55984402 0.33983216
		 0.56177765 0.33010954 0.55850661 0.33262271 0.55940986 0.32485244 0.55616999 0.32740572
		 0.55409807 0.31847072 0.55179954 0.32226068 0.54938334 0.31461877 0.54713225 0.31853661
		 0.544406 0.31248641 0.54285896 0.31655943 0.53942865 0.31035405 0.5384981 0.31497514
		 0.53405309 0.31029648 0.53383905 0.31461087 0.52867758 0.3102389 0.52919918 0.31464148
		 0.52356833 0.31176692 0.52362776 0.31613186 0.5155195 0.31531948 0.5172497 0.31914887
		 0.51013082 0.32066265 0.51263332 0.32360679 0.50509453 0.32990757 0.50809044 0.33156911
		 0.50175202 0.34171617 0.50490385 0.34328765 0.4998391 0.3534373 0.5032382 0.35370001
		 0.49820682 0.36627507 0.50167918 0.36681283 0.49685565 0.37822339 0.50031972 0.37926051
		 0.4958939 0.38969868 0.49951524 0.38966078 0.49584958 0.40157458 0.49960321 0.40169206
		 0.49782738 0.40890944 0.50132668 0.40751925 0.50111282 0.41481292 0.50459605 0.41301844;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 1783 ".pt";
	setAttr ".pt[0:165]" -type "float3"  0 -3.6711955 2.2115855 0 -10.874293 
		1.0175905 0 -10.507488 -1.8701739 0 -7.4885511 1.7268646 0 -11.733809 1.7853346 0 
		-7.6364932 2.946095 0 -7.3288469 -2.0273888 0 -11.219616 -0.40732718 0 -3.3169179 
		0.4017942 0 -7.4030428 -0.050695419 0 -5.5523524 3.018229 0 -3.8380001 2.6444628 
		0 -5.4992476 1.9728005 0 -7.606451 2.4008875 0 -5.5534458 2.6134746 0 -9.4564552 
		1.4549198 0 -11.364722 1.4077368 0 -9.8255501 2.6213317 0 -9.6907301 2.0954123 0 
		-5.2171302 -1.8271757 0 -5.3353834 0.15049815 0 -9.3159599 -2.0545716 0 -9.4324131 
		-0.25945425 0 -1.2905536 2.3389902 0 -11.551347 -2.6202836 0 -2.7511826 3.0986514 
		0 -3.8632538 2.7476985 0 -4.632813 2.6293747 0 -5.5553722 2.9065301 0 -4.6039991 
		2.8946524 0 -4.6418858 2.8147137 0 -4.5568304 2.0900431 0 -6.4811339 1.8508821 0 
		-6.5534625 2.5251288 0 -7.6382289 2.775249 0 -6.5527816 3.0144677 0 -6.5628495 2.8665354 
		0 -8.6760559 2.2688775 0 -9.7916603 2.4434533 0 -8.7432899 2.8196263 0 -8.7347145 
		2.6397543 0 -8.5066404 1.5976994 0 -10.257318 1.2840533 0 -10.581514 1.8409996 0 
		-11.613176 1.6459942 0 -10.823119 2.3047724 0 -10.752005 2.1414995 0 -12.522306 0.8751936 
		0 -9.5118084 -3.0553777 0 -7.3666863 -2.9892325 0 -8.4635401 -3.0544946 0 -11.433451 
		-2.53195 0 -10.478287 -2.9225507 0 -10.098594 -1.9950285 0 -8.3682585 -2.0593698 
		0 -5.3035889 -2.7769728 0 -6.260262 -2.8863273 0 -6.2682281 -1.958775 0 -4.6556964 
		-2.6951032 0 -3.1011899 -0.49335861 0 -4.201592 -1.5938228 0 -5.2756224 -0.89695644 
		0 -4.2993059 0.2657187 0 -4.2083673 -0.73171031 0 -3.245445 2.7724497 0 -2.9203982 
		3.2249813 0 -3.3592718 2.8894088 0 -2.4331496 2.8797801 0 -2.8350549 2.3843341 0 
		-2.5114732 3.9784513 0 -12.266597 -1.7172437 0 -10.932513 -1.2443147 0 -2.4526653 
		0.62471914 0 -12.056082 0.68107414 0 -12.347101 0.85003328 0 -9.3813896 -1.2085171 
		0 -10.32419 -0.34491539 0 -10.225773 -1.2300253 0 -7.365304 -1.0976584 0 -8.4411707 
		-0.15704727 0 -8.4089794 -1.1689258 0 -6.3689351 0.048619747 0 -6.3242941 -1.0066166 
		0 -1.082427 3.0136909 0 -2.2810371 3.7080162 0 -1.9792168 3.4679554 0 -2.4577665 
		3.9017134 0 -3.8531573 2.7867806 0 -7.3742518 -3.0681796 0 -5.3077946 -2.8439484 
		0 -9.5448761 -3.1542001 0 -12.833171 -0.45993233 0 -2.9690502 3.2705719 0 -12.398541 
		-1.8171797 0 -8.4814062 -3.1439383 0 -10.535468 -3.0228567 0 -6.2613316 -2.9567766 
		0 -3.396358 2.9373398 0 -3.4707136 1.7546195 0 -10.737323 0.90122795 0 -7.4542494 
		1.4592772 0 -11.030022 -0.39997625 0 -3.075026 0.31305158 0 -7.5454774 -0.13263559 
		0 -3.7837152 2.4760375 0 -7.6070557 2.4109411 0 -5.6319418 2.5204487 0 -9.394846 
		1.2133031 0 -11.422324 1.4140978 0 -9.6959476 2.1737037 0 -9.3972683 -0.28483629 
		0 -11.240009 -2.3346405 0 -12.448656 -0.4000206 0 -1.5340185 2.3111861 0 -2.7032766 
		3.0614786 0 -3.8737919 2.689822 0 -5.5550985 2.8798866 0 -4.6819186 2.7621791 0 -3.6468484 
		2.2064712 0 -6.6653094 1.5446303 0 -7.527936 1.9914103 0 -6.5205531 2.4879107 0 -6.5926681 
		2.0531952 0 -7.6396494 2.7946024 0 -6.5332365 2.8679311 0 -8.6825676 2.3107648 0 
		-9.8010139 2.4854898 0 -8.739872 2.6732402 0 -8.4586391 1.3415971 0 -9.532547 1.7530918 
		0 -8.5616302 1.8826938 0 -10.183764 1.0695772 0 -11.065384 1.1754208 0 -10.61327 
		1.8870749 0 -10.41456 1.5445251 0 -11.642307 1.6744618 0 -10.772719 2.184206 0 -1.343207 
		1.5761374 0 -9.5122795 -3.0656645 0 -7.3746881 -2.9941747 0 -8.4707165 -3.065136 
		0 -11.461475 -2.5504131 0 -10.481861 -2.9362483 0 -5.3041396 -2.7722592 0 -6.2604785 
		-2.8843398 0 -3.3861544 -0.66777062 0 -3.1531694 2.6629751 0 -2.9056735 3.2139301 
		0 -3.3363597 2.8541772 0 -2.2701783 2.7428689 0 -2.4588194 1.9395537 0 -2.8775671 
		2.3945448 0 -12.749407 -0.46444798 0 -12.312993 -1.7620726 0 -10.920917 -1.3939285 
		0 -11.833271 -0.41039944 0 -11.638755 -1.443913 0 -2.0342116 0.47314012 0 -3.3475609 
		1.1890477 0 -2.2750566 1.316211 0 -12.043817 0.75237846 0 -12.423423 0.85296154 0 
		-10.892803 0.5106864 0 -11.506002 0.61750364 0 -9.4029341 -1.3655834 0 -10.214085 
		-0.3492198;
	setAttr ".pt[166:331]" 0 -10.179928 -1.4113345 0 -7.4008975 -1.223805 0 -8.4993 
		-0.20507908 0 -8.4743919 -1.3302131 0 -7.4611769 0.95520282 0 -9.4262037 0.72956276 
		0 -10.236386 0.61739922 0 -6.6180844 -1.1036034 0 -8.4728298 0.84534311 0 -1.2305107 
		3.0511947 0 -2.291569 3.7140214 0 -1.8421227 3.3776934 0 -2.4834213 3.9136186 0 -12.013059 
		-2.272357 0 -11.881894 -2.1727929 0 -11.925061 -2.204453 0 -11.725286 -2.061295 0 
		-12.706698 -1.1877122 0 -12.539136 -1.1045656 0 -12.350441 -1.1153111 0 -11.805449 
		-0.9103117 0 -12.590985 0.23531485 0 -12.766424 0.22446918 0 -12.703193 0.18294954 
		0 -12.404344 0.088242054 0 -11.757896 0.057750702 0 1.6187148 -9.2557621 0 1.5867643 
		-8.7420416 0 1.5346022 -7.9625425 0 1.46946 -7.0234857 0 1.3957875 -5.9674473 0 1.3149673 
		-4.8272777 0 1.2327121 -3.6828341 0 1.1490946 -2.4795384 0 1.0734762 -1.33368 0 1.0066693 
		-0.27126718 0 0.93202525 0.77060264 0 2.4149008 -9.3728437 0 2.378016 -8.8474321 
		0 2.3219571 -8.0555115 0 2.2545857 -7.1014991 0 2.1775603 -6.0229325 0 2.0926387 
		-4.8517752 0 2.0057631 -3.6624379 0 1.9154723 -2.4137123 0 4.0582333 -8.8025846 0 
		3.0217252 3.5629437 0 1.8271269 -1.1849617 0 1.7440238 -0.013385534 0 1.6660686 1.0708498 
		0 4.0193133 -8.3353605 0 3.9601989 -7.6300406 0 3.8895159 -6.7846642 0 3.8082361 
		-5.8075829 0 3.7154851 -4.7047143 0 3.618057 -3.5607097 0 3.515506 -2.3418047 0 3.4106729 
		-1.0929186 0 3.3077266 0.14387274 0 3.2149541 1.2566715 0 3.1263783 2.3319862 0 1.5880035 
		2.1538973 0 0.84969527 1.907482 0 0.79233134 2.8534923 0 3.0653477 3.0482388 0 1.5237494 
		3.0098305 0 1.4957929 3.4182925 0 -3.8572741 -2.5407047 0 -0.65161502 0.19855917 
		0 -1.1676676 -0.16538215 0 -1.7284065 -0.54885328 0 -3.5730906 -2.2106066 0 -2.4444714 
		-1.1265904 0 -3.7897422 -2.4599316 0 -3.1466413 -1.7676092 0 -2.8742123 -1.5069438 
		0 -3.3992577 -2.0287828 0 -3.7095721 -2.3637359 0 -0.97775066 0.51274383 0 -4.0116577 
		-2.3105986 0 -2.9168723 -1.1238449 0 -3.7334659 -1.9682572 0 -4.1557631 -2.5214124 
		0 -0.65161502 0.19855917 0 -1.5328426 -0.42291856 0 -2.0001426 -0.76809585 0 -3.5730906 
		-2.2106066 0 -2.4444714 -1.1265904 0 -3.7897422 -2.4599316 0 -3.1466413 -1.7676092 
		0 -2.8742123 -1.5069438 0 -3.3992577 -2.0287828 0 -3.7095721 -2.3637359 0 -3.5367503 
		-2.1654506 0 -3.3690281 -1.9902295 0 -3.1211026 -1.7340496 0 -2.8537397 -1.4768153 
		0 -2.4259701 -1.0997006 0 -1.71117 -0.52462059 0 -1.1530067 -0.13997066 0 -0.64144182 
		0.22889039 0 -0.64144182 0.22889039 0 -1.5181817 -0.39750707 0 -1.9829056 -0.74386305 
		0 -2.4259701 -1.0997006 0 -2.8537397 -1.4768153 0 -3.1211026 -1.7340496 0 -3.3690281 
		-1.9902295 0 -3.5367503 -2.1654506 0 -3.6659722 -2.3111176 0 -3.7414231 -2.4008222 
		0 -3.8056688 -2.4772863 0 -3.7414231 -2.4008222 0 -3.6659722 -2.3111176 0 0.063195229 
		2.8054614 0 0.066217422 2.7548239 0 -1.8069757 -0.16041863 0 -1.9884291 -0.30772185 
		0 -4.2723141 -2.7141037 0 -4.2303982 -2.6379993 0 -4.2303982 -2.6379993 0 -4.6556964 
		-2.6951032 0 -4.6809564 -2.7661388 0 -1.092921 1.0825412 0 -2.9168723 -1.1238449 
		0 -0.89917988 0.57040113 0 -4.0116577 -2.3105986 0 -3.7334659 -1.9682572 0 -4.1557631 
		-2.5214124 0 -3.3778527 -1.575279 0 0.96553791 0.28852853 0 3.2572527 0.75149381 
		0 1.7002478 0.57524967 0 1.0359874 -0.77420354 0 3.3564155 -0.44149435 0 1.7808337 
		-0.56329411 0 1.1044204 -1.8523581 0 3.4591813 -1.6676677 0 1.8656983 -1.7458131 
		0 1.1852013 -3.0389345 0 3.5637531 -2.9133015 0 1.9560978 -2.9958498 0 1.268721 -4.218051 
		0 2.0452418 -4.2198052 0 3.6639042 -4.0976491 0 2.1312604 -5.3959575 0 3.7595038 
		-5.2205348 0 1.3502049 -5.3560939 0 1.4279935 -6.467483 0 2.2133775 -6.5343328 0 
		3.8475323 -6.2734318 0 1.4981837 -7.4757133 0 2.2862349 -7.5621214 0 3.9237542 -7.1903024 
		0 2.3508592 -8.4744959 0 3.9919686 -8.0017471 0 1.5596943 -8.3744726 0 1.6026931 
		-9.0351009 0 4.0418491 -8.6000853 0 2.3984728 -9.1464663 0 1.6273503 -9.3855495 0 
		4.0707355 -8.9277468 0 2.425034 -9.5069408 0 3.0942876 2.7004111 0 1.556222 2.5800781 
		0 0.81297457 2.4348536;
	setAttr ".pt[332:497]" 0 3.0410609 3.3404593 0 3.0116482 3.6934328 0 0.9070425 
		1.3255873 0 3.1660423 1.8409756 0 1.6309782 1.6427597 0 2.46979 0.72436595 0 2.4330418 
		1.2275146 0 2.5145159 0.11922312 0 2.5578268 -0.45761168 0 2.6074941 -1.1088147 0 
		2.6523705 -1.6869259 0 2.7056804 -2.3689766 0 2.751931 -2.9539521 0 2.8051229 -3.6204734 
		0 2.9023936 -4.8075333 0 2.8504114 -4.1772504 0 2.9981871 -5.9646645 0 2.947135 -5.3466053 
		0 3.0860128 -7.0150337 0 3.0399117 -6.4638047 0 3.1645842 -7.9367628 0 3.1235685 
		-7.4594498 0 3.2337055 -8.7020531 0 3.2006645 -8.3411465 0 3.2614293 -8.9892321 0 
		3.2841187 -9.2077103 0 3.3011861 -9.3392143 0 2.3304043 2.6921482 0 2.3031588 3.0803013 
		0 2.3570118 2.3085213 0 2.2829242 3.4254117 0 2.3914955 1.8094708 0 2.2696135 3.7093842 
		0 1.6376133 -9.4279356 0 4.0727229 -8.9696064 0 2.4297352 -9.5488005 0 3.3094754 
		-9.3794451 0 3.0093796 3.7301404 0 0.76772738 3.3078198 0 1.6187148 -9.2557621 0 
		1.5867643 -8.7420416 0 1.5346022 -7.9625425 0 1.46946 -7.0234857 0 1.3957875 -5.9674473 
		0 1.3149673 -4.8272777 0 1.2327121 -3.6828341 0 1.1490946 -2.4795384 0 1.0734762 
		-1.33368 0 1.0066693 -0.27126718 0 0.93202525 0.77060264 0 2.4149008 -9.3728437 0 
		2.378016 -8.8474321 0 2.3219571 -8.0555115 0 2.2545857 -7.1014991 0 2.1775603 -6.0229325 
		0 2.0926387 -4.8517752 0 2.0057631 -3.6624379 0 1.9154723 -2.4137123 0 4.0582333 
		-8.8025846 0 3.0217252 3.5629437 0 1.8271269 -1.1849617 0 1.7440238 -0.013385534 
		0 1.6660686 1.0708498 0 4.0193133 -8.3353605 0 3.9601989 -7.6300406 0 3.8895159 -6.7846642 
		0 3.8082361 -5.8075829 0 3.7154851 -4.7047143 0 3.618057 -3.5607097 0 3.515506 -2.3418047 
		0 3.4106729 -1.0929186 0 3.3077266 0.14387274 0 3.2149541 1.2566715 0 3.1263783 2.3319862 
		0 1.5903989 2.1217763 0 0.85824281 1.8115615 0 0.79233134 2.8534923 0 3.0653477 3.0482388 
		0 1.5237494 3.0098305 0 1.4957929 3.4182925 0 0.96553791 0.28852853 0 3.2572527 0.75149381 
		0 1.7002478 0.57524967 0 1.0359874 -0.77420354 0 3.3564155 -0.44149435 0 1.7808337 
		-0.56329411 0 1.1044204 -1.8523581 0 3.4591813 -1.6676677 0 1.8656983 -1.7458131 
		0 1.1852013 -3.0389345 0 3.5637531 -2.9133015 0 1.9560978 -2.9958498 0 1.268721 -4.218051 
		0 2.0452418 -4.2198052 0 3.6639042 -4.0976491 0 2.1312604 -5.3959575 0 3.7595038 
		-5.2205348 0 1.3502049 -5.3560939 0 1.4279935 -6.467483 0 2.2133775 -6.5343328 0 
		3.8475323 -6.2734318 0 1.4981837 -7.4757133 0 2.2862349 -7.5621214 0 3.9237542 -7.1903024 
		0 2.3508592 -8.4744959 0 3.9919686 -8.0017471 0 1.5596943 -8.3744726 0 1.6026931 
		-9.0351009 0 4.0418491 -8.6000853 0 2.3984728 -9.1464663 0 1.6273503 -9.3855495 0 
		4.0707355 -8.9277468 0 2.425034 -9.5069408 0 3.0942876 2.7004111 0 1.556222 2.5800781 
		0 0.8148849 2.3961127 0 3.0410609 3.3404593 0 3.0116482 3.6934328 0 0.9070425 1.3255873 
		0 3.1660423 1.8409756 0 1.6309782 1.6427597 0 2.46979 0.72436595 0 2.4330418 1.2275146 
		0 2.5145159 0.11922312 0 2.5578268 -0.45761168 0 2.6074941 -1.1088147 0 2.6523705 
		-1.6869259 0 2.7056804 -2.3689766 0 2.751931 -2.9539521 0 2.8051229 -3.6204734 0 
		2.9023936 -4.8075333 0 2.8504114 -4.1772504 0 2.9981871 -5.9646645 0 2.947135 -5.3466053 
		0 3.0860128 -7.0150337 0 3.0399117 -6.4638047 0 3.1645842 -7.9367628 0 3.1235685 
		-7.4594498 0 3.2337055 -8.7020531 0 3.2006645 -8.3411465 0 3.2614293 -8.9892321 0 
		3.2841187 -9.2077103 0 3.3011861 -9.3392143 0 2.3304043 2.6921482 0 2.3031588 3.0803013 
		0 2.3570118 2.3085213 0 2.2829242 3.4254117 0 2.3914955 1.8094708 0 2.2696135 3.7093842 
		0 0.76772738 3.3078198 0 0.099804521 2.3846736 0 3.2609732 2.8781726 0 2.897212 2.65271 
		0 2.4732435 2.353441 0 1.9415859 2.0262842 0 1.4363924 1.6984371 0 3.4141808 3.0178878 
		0 3.420526 3.0459247 0 0.92596036 1.3539504 0 3.2609732 2.8781726 0 2.897212 2.65271 
		0 2.4732435 2.353441 0 1.9415859 2.0262842 0 1.4363924 1.6984371 0 3.4141808 3.0178878 
		0 0.92596036 1.3539504;
	setAttr ".pt[498:663]" 0 -11.190547 0.44658566 0 -12.137928 0.20361328 0 -1.2407914 
		1.7502874 0 0.098662853 2.3870401 0 -2.7322001 1.4633621 0 -3.5617895 1.345066 0 
		-4.4454794 1.2807734 0 -5.434864 1.2332203 0 -6.426856 1.1741331 0 -7.4432316 1.0471983 
		0 -8.4535027 0.91893005 0 -9.4187622 0.78799963 0 -10.223222 0.66472721 0 -12.683786 
		-0.41606474 0 -12.616435 -1.2042384 0 -11.433725 -1.7658615 0 -12.046742 -1.6606369 
		0 -11.014132 -1.9693894 0 -10.171666 -2.0871272 0 -9.3864555 -2.1384473 0 -8.42805 
		-2.127651 0 -7.3108959 -2.0739472 0 -6.3233376 -1.9452231 0 -3.3609686 -1.5641116 
		0 -5.2073846 -1.7779289 0 -4.2663612 -1.6172197 0 0.51288104 1.0543878 0 0.5128451 
		1.0556741 0 -10.257833 -2.5542741 0 -9.393774 -2.6709685 0 -8.4040213 -2.6852884 
		0 -7.3407564 -2.6431787 0 -6.2575235 -2.5603745 0 -11.934555 -0.92861986 0 -11.738611 
		-1.4262958 0 -11.363016 -1.8989978 0 -11.041055 -2.2082558 0 -4.4503384 -2.3070202 
		0 -5.262702 -2.446619 0 -12.063909 -0.41387224 0 -2.089092 4.9460063 0 -1.8266149 
		4.4397755 0 -1.4461637 3.9517035 0 -2.0297873 4.8217602 0 -1.8266149 4.4397755 0 
		-1.5176002 4.0433478 0 -2.029788 4.8217602 0 -0.8708843 3.5471992 0 0.036123991 3.2590554 
		0 -0.87297964 3.5441804 0 0.036123991 3.2590554 0 -5.2685242 -2.3969443 0 -4.464325 
		-2.2714446 0 -9.395155 -2.6729414 0 -10.260165 -2.5671682 0 -8.4085627 -2.6784108 
		0 -6.2616758 -2.5215473 0 -7.3445363 -2.6234536 0 3.7960021 2.2473795 0 3.6922579 
		1.9884442 0 3.833122 1.7641222 0 3.7299688 1.5230666 0 3.6989393 3.5040493 0 3.5962009 
		3.1348495 0 3.7033942 3.350806 0 3.7400932 2.8934593 0 3.6096046 3.0193331 0 3.6411591 
		2.5907087 0 3.7635446 2.6065791 0 3.66418 2.3121507 0 3.7197564 3.1433895 0 3.6934793 
		3.4605639 0 3.6004996 3.1077857 0 3.6223168 2.8274264 0 3.7033942 3.350806 0 3.7400932 
		2.8934593 0 3.6096046 3.0193331 0 3.6411591 2.5907087 0 3.7635446 2.6065791 0 3.66418 
		2.3121507 0 3.7197564 3.1433895 0 3.6934793 3.4605639 0 3.6004996 3.1077857 0 3.6223168 
		2.8274264 0 3.7960021 2.2473795 0 3.6922579 1.9884442 0 3.833122 1.7641222 0 3.7299688 
		1.5230666 0 3.8804398 1.1843308 0 3.9705892 0.077407241 0 3.8643155 -0.10257828 0 
		3.776186 0.96621704 0 3.9218102 0.67708957 0 3.8167734 0.47558498 0 4.017417 -0.50347328 
		0 3.9086866 -0.65309286 0 3.8804398 1.1843308 0 3.9705892 0.077407241 0 3.8643155 
		-0.10257828 0 3.776186 0.96621704 0 3.9218102 0.67708957 0 3.8167734 0.47558498 0 
		4.017417 -0.50347328 0 3.9086866 -0.65309286 0 4.0685577 -1.1297362 0 4.1676259 -2.3353121 
		0 4.2633696 -3.4985166 0 3.9564557 -1.2348366 0 4.0506878 -2.3710585 0 4.1427178 
		-3.4779563 0 4.1143327 -1.6862898 0 3.9998651 -1.7576646 0 4.2125936 -2.8826134 0 
		4.0939078 -2.8921328 0 4.0685577 -1.1297362 0 4.1676259 -2.3353121 0 4.2633696 -3.4985166 
		0 3.9564557 -1.2348366 0 4.0506878 -2.3710585 0 4.1427178 -3.4779563 0 4.1143327 
		-1.6862898 0 3.9998651 -1.7576646 0 4.2125936 -2.8826134 0 4.0939078 -2.8921328 0 
		4.3528337 -4.5715618 0 4.2279129 -4.4878187 0 4.3052063 -4.0019779 0 4.1825633 -3.9513192 
		0 4.3528337 -4.5715618 0 4.2279129 -4.4878187 0 4.3052063 -4.0019779 0 4.1825633 
		-3.9513192 0 4.4377875 -5.5952992 0 4.3091865 -5.4570022 0 4.3928447 -5.0512757 0 
		4.2662201 -4.9426737 0 4.4720793 -6.013732 0 4.3418593 -5.8489909 0 4.4377875 -5.5952992 
		0 4.3091865 -5.4570022 0 4.3928447 -5.0512757 0 4.2662201 -4.9426737 0 4.4720793 
		-6.013732 0 4.3418593 -5.8489909 0 4.5090098 -6.4714723 0 4.566021 -7.2003546 0 4.4306335 
		-6.9512386 0 4.3769016 -6.2755871 0 4.5359678 -6.8169775 0 4.4022326 -6.5940108 0 
		4.5244489 -8.094945 0 4.6642194 -8.4111023 0 4.6154437 -7.8214631 0 4.6486835 -8.2416067 
		0 4.5094748 -7.933835 0 4.477634 -7.5347066 0 4.5915022 -7.5217361 0 4.4548082 -7.2523222 
		0 4.633903 -8.0556974 0 4.4954395 -7.7579241 0 4.6594844 -8.3575382 0 4.5199528 -8.0445776 
		0 4.6154437 -7.8214631 0 4.6486835 -8.2416067 0 4.5094748 -7.933835 0 4.477634 -7.5347066;
	setAttr ".pt[664:829]" 0 4.5915022 -7.5217361 0 4.4548082 -7.2523222 0 4.633903 
		-8.0556974 0 4.4954395 -7.7579241 0 4.6594844 -8.3575382 0 4.5199528 -8.0445776 0 
		4.5090098 -6.4714723 0 4.566021 -7.2003546 0 4.4306335 -6.9512386 0 4.3769016 -6.2755871 
		0 4.5359678 -6.8169775 0 4.4022326 -6.5940108 0 0.18942118 1.3692458 0 0.2416933 
		0.40426311 0 0.34358475 -0.60069245 0 0.47373542 0.21010712 0 0.28448033 -0.071090698 
		0 0.51179343 -0.23577353 0 0.18769139 0.93042439 0 0.43170357 0.6193887 0 0.42615208 
		0.94061816 0 0.42615208 0.94061816 0 0.2416933 0.40426311 0 0.34358475 -0.60069245 
		0 0.47373542 0.21010712 0 0.18942118 1.3692458 0 0.28448033 -0.071090698 0 0.51179343 
		-0.23577353 0 0.18769139 0.93042439 0 0.43170357 0.6193887 0 0.41955972 -1.5263698 
		0 0.50590098 -2.5544741 0 0.56659651 -0.74593139 0 0.6396836 -1.6039206 0 0.72061253 
		-2.571635 0 0.38131893 -1.0467371 0 0.60290658 -1.1647586 0 0.45890951 -1.9865122 
		0 0.67585528 -2.0348792 0 0.54315567 -3.0771153 0 0.76179338 -3.0689325 0 0.41955972 
		-1.5263698 0 0.50590098 -2.5544741 0 0.56659651 -0.74593139 0 0.6396836 -1.6039206 
		0 0.72061253 -2.571635 0 0.38131893 -1.0467371 0 0.60290658 -1.1647586 0 0.45890951 
		-1.9865122 0 0.67585528 -2.0348792 0 0.54315567 -3.0771153 0 0.76179338 -3.0689325 
		0 0.58963573 -3.6821404 0 0.70249963 -4.7561369 0 0.80960691 -3.6459589 0 0.89432251 
		-4.6591091 0 0.97971082 -5.6913919 0 0.64257467 -4.1807704 0 0.84887254 -4.1164465 
		0 0.74173141 -5.2568598 0 0.93388724 -5.1358676 0 0.58963573 -3.6821404 0 0.70249963 
		-4.7561369 0 0.80960691 -3.6459589 0 0.89432251 -4.6591091 0 0.97971082 -5.6913919 
		0 0.64257467 -4.1807704 0 0.84887254 -4.1164465 0 0.74173141 -5.2568598 0 0.93388724 
		-5.1358676 0 0.78620052 -5.8410149 0 0.87827277 -6.8550506 0 1.0583932 -6.6443028 
		0 0.82956171 -6.3169322 0 1.0169046 -6.1394162 0 1.090776 -7.0492063 0 0.78620052 
		-5.8410149 0 0.87827277 -6.8550506 0 1.0583932 -6.6443028 0 0.82956171 -6.3169322 
		0 1.0169046 -6.1394162 0 1.090776 -7.0492063 0 0.9511447 -7.7622981 0 1.1269341 -7.5014153 
		0 0.91247988 -7.2854524 0 0.99075603 -8.1575613 0 1.1845412 -8.2182178 0 1.1568789 
		-7.874495 0 1.1845412 -8.2182178 0 1.1568789 -7.874495 0 0.9511447 -7.7622981 0 1.1269341 
		-7.5014153 0 0.91247988 -7.2854524 0 0.99075603 -8.1575613 0 1.0781317 -9.1906052 
		0 1.2373424 -8.8602657 0 1.0258403 -8.5212746 0 1.060101 -9.0108614 0 1.2218237 -8.6887102 
		0 1.0453248 -8.795351 0 1.2054157 -8.4823418 0 1.0723262 -9.1330929 0 1.2326622 -8.8068409 
		0 1.0258403 -8.5212746 0 1.060101 -9.0108614 0 1.2218237 -8.6887102 0 1.0453248 -8.795351 
		0 1.2054157 -8.4823418 0 1.0723262 -9.1330929 0 1.2326622 -8.8068409 0 -4.091814 
		1.9577736 0 -3.9702625 1.6580445 0 -4.0251932 1.1296772 0 -4.3247175 0.21706414 0 
		-4.6226263 -0.45720983 0 -4.8650246 -0.72276044 0 -5.2484388 -0.89782929 0 -5.6449518 
		-0.90449214 0 -6.0631037 -0.71533465 0 -6.3100915 -0.4497695 0 -6.4213209 -0.078902483 
		0 -6.3863029 0.36236644 0 -6.2300887 0.92546129 0 -6.0244956 1.5011802 0 -5.813416 
		1.9643084 0 -5.6237197 2.1710131 0 -5.3523769 2.2886808 0 -5.0459571 2.3266623 0 
		-4.7789207 2.2956076 0 -4.4881229 2.2161276 0 -4.2650294 2.1179967 0 -0.69414485 
		3.4004881 0 -0.033641815 3.184567 0 0.94911695 3.2902687 0 1.2658788 3.386234 0 1.5874146 
		3.4798031 0 1.803821 3.5361049 0 1.9092962 3.5523639 0 1.803821 3.5361049 0 1.5874146 
		3.4798031 0 1.2658788 3.386234 0 0.94911695 3.2902687 0 -0.033641815 3.184567 0 -0.69414485 
		3.4004881 0 -1.1272687 3.7005129 0 -1.4085557 4.037127 0 -1.5694771 4.3097696 0 -1.6409256 
		4.4172878 0 -1.5694771 4.3097696 0 -1.4085557 4.037127 0 -1.1272687 3.7005129 0 0.46031833 
		3.1927941 0 0.46031833 3.1927941 0 -1.6898689 4.8172274 0 -1.5088551 4.5105429 0 
		-1.1924466 4.1318989 0 -1.7702383 4.93817 0 -1.6898689 4.8172274 0 -1.5088551 4.5105429 
		0 -1.1924466 4.1318989 0 -0.70524311 3.7944136 0 0.037729859 3.5515325 0 2.2232616 
		3.9652522 0 2.1046169 3.9469635 0 1.499508 3.7783797 0 1.8611901 3.8836315;
	setAttr ".pt[830:995]" 0 1.143195 3.6704321 0 0.59336579 3.5607865 0 -0.70524311 
		3.7944136 0 0.037729859 3.5515325 0 2.1046169 3.9469635 0 1.499508 3.7783797 0 1.8611901 
		3.8836315 0 1.143195 3.6704321 0 0.59336579 3.5607865 0 -4.7002106 2.5413237 0 -5.3688359 
		2.514689 0 -3.9130013 2.1052873 0 -4.3614264 2.443526 0 -4.1091762 2.3151021 0 -5.0067878 
		2.574115 0 -3.7874107 1.7508074 0 -3.8711333 1.1676761 0 -5.6529665 2.3319192 0 -5.8424778 
		2.0843279 0 -6.079999 1.5855749 0 -6.3009596 0.945225 0 -6.4738436 0.34940839 0 -4.7888584 
		-0.85501933 0 -5.2179976 -1.0509799 0 -4.521553 -0.55837262 0 -6.5120916 -0.1334846 
		0 -6.393322 -0.54271007 0 -5.6613512 -1.0427749 0 -4.1962442 0.17897487 0 -6.1203661 
		-0.83425164 0 -10.98808 -0.81521606 0 -10.982639 0.05662632 0 -11.227854 0.073660374 
		0 -11.131712 -0.78356171 0 -10.762082 -1.605628 0 -1.151435 1.0119504 0 0.16596508 
		1.6344604 0 -0.60337865 1.8337644 0 -0.48669404 1.3413019 0 -0.39416474 0.9409948 
		0 -0.11273146 0.56958866 0 -0.064298332 0.64228219 0 0.12505895 2.0969794 0 -0.38136601 
		3.2753594 0 -0.3525815 3.6562467 0 -0.44879246 3.3622921 0 -0.62400103 2.8517749 
		0 -0.66095823 2.3504555 0 -0.34391487 3.257031 0 -0.31034184 3.6363533 0 -0.38809073 
		3.3632376 0 -0.53732455 2.8410928 0 -0.59627277 2.3516023 0 -0.46751642 1.345521 
		0 -0.017638743 0.67499417 0 -0.069183171 0.59957236 0 -0.34700394 0.97560263 0 0.16735101 
		1.6287265 0 0.12739778 2.066817 0 -0.55432409 1.8846388 0 -3.8762341 -1.1066796 0 
		-2.365262 -0.63896668 0 -2.8182404 -0.15282321 0 -1.9226304 2.6465137 0 -1.5347872 
		3.2235603 0 -1.1768707 3.7229924 0 -0.96676433 3.9387121 0 -0.92901659 3.5263271 
		0 -1.4524533 0.12598056 0 -1.7486246 0.84687161 0 -2.007432 1.5979441 0 -2.1378043 
		2.3074062 0 -7.5255313 0.33144093 0 -8.479413 0.24962902 0 -9.3901196 0.1575532 0 
		-10.205034 0.067587852 0 -7.5085502 -0.65262461 0 -8.4875679 -0.72710156 0 -9.3901234 
		-0.78133059 0 -10.193184 -0.82954693 0 -6.8698921 -0.59374022 0 -6.9554415 -0.12634873 
		0 -6.9292994 0.35459828 0 -6.8046141 0.94955635 0 0.64306998 4.7358828 0 0.54042506 
		4.5909128 0 0.53970814 4.5909824 0 0.72980785 4.2739735 0 0.84664583 4.4289351 0 
		0.94830954 4.5484204 0 0.84610236 4.4291053 0 0.73047805 4.2746382 0 -0.14631319 
		4.8493066 0 -0.052597761 5.0433598 0 0.021844625 5.2066002 0 -0.051884413 5.043519 
		0 -0.14644504 4.8486919 0 0.0010995865 5.1608472 0 0.61407995 4.6945524 0 0.91998124 
		4.5160799 0 0.0010278225 5.1607685 0 0.61434698 4.6949844 0 0.91957963 4.5165286 
		0 0.42354012 4.4069672 0 0.42295611 4.4071465 0 0.12785125 4.5995407 0 0.24170876 
		4.7936792 0 0.31070304 4.9068022 0 0.33816719 4.951447 0 0.31001115 4.906827 0 0.24311709 
		4.794528 0 0.12755322 4.5996065 0 -0.40310812 5.1428533 0 -0.35303473 5.3416023 0 
		-0.32390189 5.4633665 0 -0.31259775 5.5071492 0 -0.32423234 5.4631596 0 -0.35311055 
		5.3417025 0 -0.40352988 5.1434898 0 1.1636963 4.2892747 0 1.2390406 4.3555651 0 1.2651564 
		4.3781028 0 1.238657 4.3551931 0 1.1645061 4.2890887 0 1.0532653 4.1703606 0 1.052619 
		4.1696162 0 1.369002 4.0757294 0 1.4950508 4.1589537 0 1.5807294 4.2036042 0 1.6081705 
		4.217011 0 1.5809687 4.2031446 0 1.4951637 4.1587782 0 1.3707248 4.0754013 0 -0.69553328 
		5.801506 0 -0.69156647 5.6737533 0 0.89201236 3.9449484 0 0.56898081 4.0012898 0 
		-0.29703355 4.5674734 0 -0.48291445 4.8551998 0 -0.69148159 5.6738205 0 -0.69553351 
		5.801506 0 -0.67906237 5.4646192 0 -0.69396973 5.8452759 0 0.2655865 4.1090307 0 
		0.56913614 4.0006638 0 -0.036947727 4.3020096 0 0.265553 4.1089921 0 -0.036889791 
		4.3021364 0 -0.29570365 4.5678816 0 -0.67703652 5.464375 0 -0.48329926 4.8546405 
		0 -0.60843086 5.1645808 0 -0.61041665 5.1651602 0 1.2052431 3.9292269 0 1.4916965 
		3.9464262 0 1.6802021 3.9726031 0 1.9829094 4.0276079 0 1.9538294 4.0205574 0 1.9542577 
		4.0200615 0 1.8413693 4.0019841 0 1.8413632 4.0018759 0 0.89225507 3.9442875 0 1.2018548 
		3.9278562 0 1.6789159 3.9746399 0 1.4920803 3.9448249 0 1.7094153 3.86659;
	setAttr ".pt[996:1161]" 0 1.4733847 3.8292227 0 1.8880248 3.9001822 0 1.9996202 
		3.9228923 0 2.0374985 3.9342961 0 1.1930376 3.8079712 0 -0.80669761 5.6655788 0 -0.81727672 
		5.8176894 0 -0.78222656 5.4147172 0 -0.81455874 5.8593588 0 -0.71275258 5.1168489 
		0 -0.58693337 4.7897987 0 1.8880343 3.9001689 0 1.9996213 3.9228907 0 1.7094611 3.8667517 
		0 1.4734043 3.8294182 0 1.1925026 3.8060496 0 0.8812567 3.8274176 0 0.5426532 3.8835828 
		0 -0.38983202 4.4890518 0 -0.12982655 4.2167301 0 -0.58686638 4.7898641 0 -0.71283197 
		5.116888 0 0.2078563 3.9992454 0 -0.8066287 5.665627 0 -0.78231263 5.4147692 0 -0.81727552 
		5.8176899 0 0.88126767 3.827462 0 0.54266787 3.8836222 0 -0.38987684 4.4890079 0 
		-0.12984324 4.2167087 0 0.20785737 3.9992459 0 1.8042057 3.6190736 0 1.5996068 3.5431836 
		0 1.3424162 3.4679193 0 1.0379198 3.380811 0 0.69987917 3.3295336 0 0.25094628 3.3230119 
		0 -0.15232384 3.3741486 0 -0.53450167 3.4835961 0 -0.87455618 3.6388257 0 -1.1757454 
		3.8311019 0 -1.4096504 4.0222716 0 -1.5796226 4.2062445 0 -1.7096355 4.3569798 0 
		-1.7754902 4.4529543 0 -1.7881485 4.4675398 0 1.92822 3.651005 0 1.9709017 3.6643889 
		0 1.8042052 3.6190732 0 1.5996069 3.543184 0 1.3424158 3.4679198 0 1.0379194 3.3808107 
		0 0.69987917 3.3295336 0 0.25094628 3.3230119 0 -0.15232384 3.3741486 0 -0.53450203 
		3.4835963 0 -0.87455618 3.6388261 0 -1.1757448 3.8311017 0 -1.4096504 4.0222721 0 
		-1.579622 4.2062445 0 -1.7096351 4.3569798 0 -1.7754898 4.4529543 0 1.9282203 3.6510053 
		0 -1.2511491 5.1676426 0 -1.287111 5.2926302 0 -1.1825479 4.9579868 0 -1.0766066 
		4.705143 0 -0.89600205 4.4235501 0 -0.66023993 4.1634741 0 -0.36825418 3.9399385 
		0 -1.2932067 5.3215761 0 -1.2871115 5.2926307 0 -1.2511492 5.1676426 0 -1.1825484 
		4.9579868 0 -1.0766064 4.705143 0 -0.89600241 4.4235506 0 -0.66023982 4.1634746 0 
		-0.36825442 3.9399388 0 0.89103556 3.8879395 0 0.55875051 3.9446306 0 0.23931408 
		4.0566287 0 -0.080821753 4.2618742 0 -0.34287715 4.5322742 0 -0.53504109 4.8279009 
		0 -0.66283822 5.1476679 0 -0.73236942 5.4487071 0 -0.75008202 5.6776981 0 -0.75704622 
		5.8170047 0 -0.75496674 5.8601885 0 -0.75704694 5.8170047 0 -0.75016022 5.677639 
		0 -0.73117566 5.448545 0 -0.66167045 5.1473198 0 -0.53528953 4.8275528 0 -0.34213758 
		4.5324879 0 -0.080862045 4.2617922 0 0.23933363 4.0566506 0 0.55884552 3.9442911 
		0 0.89117861 3.8875818 0 1.2060072 3.8704712 0 1.4919637 3.8895717 0 1.7026668 3.9208374 
		0 1.8726746 3.9522188 0 1.9858571 3.9725201 0 2.0187581 3.9818094 0 1.9856135 3.9728019 
		0 1.8726821 3.9522753 0 1.7019531 3.9220703 0 1.492191 3.8887436 0 1.2038403 3.8688493 
		0 -0.83436906 0.080842137 0 -0.80542803 0.078057498 0 2.7441335 2.5045242 0 2.3975112 
		2.2595961 0 2.7740595 2.5264015 0 2.6144087 2.4002855 0 1.8844172 1.9074836 0 -2.2099414 
		-0.97611582 0 -2.2134068 -0.9664554 0 -1.4491082 -0.36198819 0 -1.4304645 -0.36888647 
		0 -2.2099545 -0.97612667 0 -3.7144005 -2.263459 0 -3.7941082 -2.3556483 0 -3.8431182 
		-2.4131522 0 -3.8558702 -2.4280291 0 -3.8422079 -2.411994 0 -3.796468 -2.3583467 
		0 -3.7130041 -2.2616081 0 -3.5823765 -2.1166115 0 -3.4170961 -1.9406424 0 -3.1656961 
		-1.6845628 0 -2.8319566 -1.3697169 0 -2.2992649 -0.9155761 0 -1.489544 -0.29692376 
		0 -0.7552582 0.21987924 0 0.012484133 0.7502622 0 0.33963645 0.97494137 0 0.65878075 
		1.1931276 0 0.92387891 1.3733962 0 1.1895452 1.5533876 0 1.4530182 1.7314358 0 1.7111075 
		1.9057441 0 2.0770411 2.153511 0 2.4181852 2.3861179 0 2.6692073 2.5595677 0 2.8905616 
		2.7155488 0 3.0749202 2.848959 0 3.2225614 2.9593053 0 3.3338029 3.0468438 0 3.4265242 
		3.123395 0 3.468118 3.1596925 0 3.4513776 3.1446927 0 3.3672209 3.0742741 0 3.2225144 
		2.9600103 0 3.0749514 2.8491323 0 2.8904984 2.7157433 0 2.668541 2.5594201 0 2.3071916 
		2.310477 0 1.9097718 2.040338 0 1.6014383 1.8319535 0 1.2504781 1.5946971 0 0.88893187 
		1.3497711 0 0.56054109 1.1261504 0 0.16847527 0.85783386 0 -0.66774869 0.28107139;
	setAttr ".pt[1162:1327]" 0 -2.2884436 -0.9080466 0 -2.7830749 -1.3260131 0 -3.1317816 
		-1.6538476 0 -3.4191055 -1.9418842 0 -3.5824955 -2.1169016 0 2.7431333 2.4477484 
		0 2.9650662 2.6041081 0 3.149483 2.7375515 0 3.2968669 2.8486934 0 3.4415205 2.9630358 
		0 3.5256081 3.0335569 0 3.5422759 3.0486646 0 3.5007553 3.0122585 0 3.4080653 2.9356599 
		0 3.2971306 2.8476686 0 2.7438898 2.4477625 0 3.1495321 2.7372601 0 2.9652109 2.6037936 
		0 1.984393 1.9286212 0 2.3818045 2.1987731 0 2.4928606 2.2743223 0 1.7858099 1.7939056 
		0 2.1517429 2.0416741 0 1.3251151 1.4829565 0 0.96359187 1.2379975 0 1.5277101 1.6196128 
		0 1.2642243 1.4415843 0 0.99857104 1.2615746 0 0.73350316 1.0812622 0 0.24323297 
		0.74591863 0 0.4144251 0.86297947 0 0.087324381 0.63822567 0 -2.2240505 -1.0280691 
		0 -3.3430264 -2.0552061 0 -3.5059643 -2.2310553 0 -3.0561726 -1.7667711 0 -3.765161 
		-2.529839 0 -3.7163248 -2.4717741 0 -3.6369534 -2.3784542 0 -3.7642508 -2.5286808 
		0 -3.7778571 -2.5448291 0 -3.7186065 -2.4744525 0 -3.0900011 -1.7975236 0 -2.7565165 
		-1.4823791 0 -3.3408761 -2.0539947 0 -3.5058019 -2.2307494 0 -3.6361704 -2.3769712 
		0 -2.7076893 -1.4386806 0 -2.2131968 -1.0205814 0 -0.59290105 0.16902643 0 0.635252 
		1.0143025 0 1.6760486 1.7202522 0 -0.68037701 0.10778713 0 -1.4145603 -0.40914273 
		0 1.1667304 0.82445818 0 1.9066263 1.3252171 0 1.7304698 1.205995 0 0.84714288 0.60816258 
		0 0.32061762 0.25181225 0 0.17718676 0.15473863 0 0.21440113 0.1799252 0 0.39055765 
		0.29914737 0 1.2738845 0.89697981 0 0.95429683 0.68068403 0 1.8004096 1.25333 0 1.9438405 
		1.3504035 0 0.1402981 0.12977257 0 0.64752072 0.473059 0 1.5677363 1.0958575 0 1.9807293 
		1.3753698 0 1.4735067 1.0320833 0 0.55329108 0.40928471 0 1.1210938 0.86221951 0 
		1.765057 1.2980515 0 1.6117405 1.1942874 0 0.84294295 0.67396808 0 0.3846854 0.36382103 
		0 0.25985122 0.27933371 0 0.2922405 0.30125463 0 0.44555715 0.40501878 0 1.2143546 
		0.92533815 0 0.93620372 0.73708653 0 1.6726118 1.2354852 0 1.7974463 1.3199725 0 
		0.22774564 0.25760472 0 0.66920322 0.55638158 0 1.4701065 1.09843 0 1.8295518 1.3417016 
		0 1.3880943 1.0429245 0 0.5871911 0.50087607 0 0.97827768 1.3461668 0 0.6500597 1.1240301 
		0 0.33499914 0.91079825 0 0.071096539 0.73219001 0 -0.10981694 0.60974836 0 -0.18592104 
		0.55824149 0 -0.14803636 0.58388162 0 -0.00073212385 0.68357664 0 0.23822463 0.84530163 
		0 0.54001188 1.0495502 0 0.86822993 1.2716869 0 1.1832905 1.4849188 0 1.447193 1.6635271 
		0 1.6281066 1.7859688 0 1.7042106 1.8374757 0 1.6663256 1.8118353 0 1.5190214 1.7121402 
		0 1.2800648 1.5504153 0 -0.23887855 0.48427659 0 -0.43031594 0.34926626 0 -0.46882647 
		0.31149381 0 -0.35433614 0.37517035 0 -0.10575575 0.53185755 0 0.24388051 0.76353979 
		0 0.65596592 1.0427595 0 1.0844523 1.3358966 0 1.4791011 1.608544 0 1.7929361 1.8301151 
		0 1.9881202 1.9735521 0 2.0393801 2.0187778 0 1.9383398 1.9571747 0 1.3433211 1.5573218 
		0 1.6964316 1.7961771 0 0.92219388 1.2712375 0 0.48320392 0.97419804 0 0.079544008 
		0.70106143 0 -1.3828363 -0.38726732 0 -1.4578681 -0.27497673 0 -2.7514293 -1.4398787 
		0 -3.3522296 -2.0448871 0 0.72645867 1.1279515 0 -0.93405813 0.00012987852 0 -2.5487044 
		-1.1410151 0 -3.1070328 -1.6985635 0 -3.262074 -1.8536659 0 -3.3883946 -1.9801271 
		0 -3.4707613 -2.0626955 0 -3.2611377 -1.8539593 0 -3.4703929 -2.0628121 0 -2.7868061 
		-1.3784676 0 -2.5775506 -1.1696143 0 -2.660243 -1.2520815 0 -2.9409111 -1.5338633 
		0 -2.5771821 -1.1697311 0 -2.6595488 -1.2522992 0 -2.7858701 -1.3787608 0 -2.9419742 
		-1.5335288 0 -3.1059692 -1.6988976 0 -3.499239 -2.0914116 0 -3.3877006 -1.9803452 
		0 -2.8347602 -1.6400304 0 -2.471031 -1.275898 0 -2.5533972 -1.3584659 0 -2.6797187 
		-1.4849274 0 -2.4425535 -1.247182 0 -2.4713998 -1.2757814 0 -2.5540919 -1.3582484 
		0 -2.8358233 -1.6396959 0 -2.6806552 -1.4846346 0 -3.1549864 -1.9601259 0 -3.3642414 
		-2.1689789 0 -3.3930876 -2.1975782 0 -3.2815497 -2.0865123 0 -2.9998183 -1.8050647 
		0 -3.1559229 -1.959833 0 -3.2822437 -2.0862942;
	setAttr ".pt[1328:1493]" 0 -3.3646107 -2.1688623 0 -3.0008821 -1.8047305 0 -0.62060177 
		-0.38413897 0 -0.54287368 0.32459095 0 -1.4414505 -0.34985721 0 -1.1279982 -0.11046708 
		0 -1.3076011 -0.24670351 0 -0.92430776 0.042417675 0 -0.72109538 0.19351223 0 -0.34315604 
		0.46262735 0 -0.4111369 0.4198449 0 -0.34177631 0.46778411 0 -0.41511068 0.40499601 
		0 -0.72856337 0.16560557 0 -1.1354661 -0.13837364 0 -1.3136888 -0.26945305 0 -1.5147855 
		-0.41264582 0 -1.4454242 -0.36470616 0 -0.54896158 0.30184117 0 -0.93225497 0.012720019 
		0 -1.513406 -0.4074893 0 -1.0145175 -0.61219341 0 -0.84739935 -0.49135625 0 -0.58960813 
		-0.29968056 0 -0.36176768 -0.12685379 0 -0.2704871 -0.053743578 0 -0.35847756 -0.11455896 
		0 -0.58456761 -0.28084391 0 -0.8429665 -0.47479135 0 -1.0127672 -0.60565174 0 0.99917507 
		0.77032208 0 1.0561906 1.4714891 0 0.16938481 0.79048741 0 0.47261247 1.0283296 0 
		0.29748738 0.892115 0 0.67363447 1.1826999 0 0.87630981 1.3366079 0 1.2709099 1.622022 
		0 1.1915823 1.5710756 0 1.266153 1.6233548 0 1.2052784 1.5672377 0 0.90205085 1.3293954 
		0 0.49835339 1.021117 0 0.31847182 0.88623518 0 0.10850984 0.73436993 0 0.18308127 
		0.7866497 0 1.0771749 1.4656093 0 0.70102757 1.1750243 0 0.10375285 0.73570263 0 
		0.61154127 0.54054952 0 0.78329611 0.66688293 0 1.0404059 0.86212766 0 1.262566 1.0349272 
		0 1.3458251 1.1044258 0 1.2512254 1.0381049 0 1.0230305 0.86699611 0 0.76801682 0.67116427 
		0 0.60550666 0.54224014 0 -1.1735464 -0.62887615 0 -1.2719262 -0.57668155 0 -1.3438816 
		-0.6343137 0 -1.2275147 -0.67210144 0 -0.89600366 -0.41661471 0 -0.95847404 -0.33729079 
		0 -1.1380768 -0.47352824 0 -1.0307108 -0.51879662 0 -0.75478417 -0.18440703 0 -0.67863899 
		-0.25346619 0 -0.52622092 -0.14013797 0 -0.55157119 -0.033311218 0 -0.37334991 0.097766712 
		0 -0.33603477 -0.0002592802 0 -0.23722528 0.071186937 0 -0.24161325 0.19302146 0 
		-0.17225254 0.2409603 0 -0.1632081 0.12234452 0 -0.16424294 0.11847688 0 -0.17363249 
		0.23580359 0 -0.24102797 0.056976572 0 -0.24558693 0.17817247 0 -0.34142327 -0.020395532 
		0 -0.37943783 0.07501699 0 -0.53308213 -0.1657771 0 -0.55903941 -0.061217815 0 -0.68585968 
		-0.28044879 0 -0.76273113 -0.21410456 0 -0.96594197 -0.36519727 0 -0.90271306 -0.44168603 
		0 -1.0363853 -0.54000032 0 -1.1441646 -0.49627778 0 -1.2289871 -0.67760432 0 -1.3452613 
		-0.63947046 0 -1.2759 -0.59153032 0 -1.1769648 -0.64164841 0 0.44132206 0.51500911 
		0 0.34120125 0.56540811 0 0.27556932 0.51062292 0 0.39209676 0.47391909 0 0.70937383 
		0.72562528 0 0.64442885 0.80325067 0 0.46930355 0.66703504 0 0.5780248 0.62345964 
		0 0.84545034 0.95762008 0 0.92389101 0.8903591 0 1.0759057 1.005797 0 1.048126 1.1115291 
		0 1.2280064 1.2464097 0 1.2678626 1.1497335 0 1.3694128 1.2244285 0 1.3633982 1.3459967 
		0 1.4379689 1.3982755 0 1.4489896 1.2802174 0 1.4525577 1.2792178 0 1.4427258 1.396943 
		0 1.3825203 1.2207555 0 1.3770946 1.3421589 0 1.2864362 1.1445287 0 1.2489907 1.2405297 
		0 1.0995555 0.99917024 0 1.073867 1.1043166 0 0.94878024 0.88338524 0 0.8728435 0.9499445 
		0 0.67016983 0.79603791 0 0.73249984 0.7191453 0 0.59758335 0.61797959 0 0.49028799 
		0.66115534 0 0.3971729 0.47249678 0 0.28032604 0.5092901 0 0.35489771 0.56157029 
		0 0.45310336 0.51170814 0 -0.099004477 0.42616048 0 0.19798078 0.62811726 0 0.57418865 
		0.88268918 0 0.98332798 1.1595427 0 1.3758675 1.4260122 0 1.7049413 1.6486316 0 1.9304113 
		1.7991853 0 2.0247173 1.8579259 0 1.9770503 1.817765 0 1.7948046 1.6859188 0 1.5012598 
		1.4803724 0 1.1318104 1.2261674 0 0.73054868 0.95224065 0 0.34479052 0.69091958 0 
		0.018322602 0.47368002 0 -0.21215184 0.32635906 0 -0.31654534 0.26606348 0 -0.27844027 
		0.30063435 0 1.2700055 0.67480856 0 1.5201396 0.84352618 0 1.6058033 0.90130711 0 
		1.4869136 0.8211149 0 1.2191001 0.64047253 0 0.92767596 0.4439044 0 0.7490015 0.32338703 
		0 0.76668072 0.33531186 0 0.9724412 0.47409892 0 1.0254782 1.319959 0 1.59893 1.7067572 
		0 1.7953207 1.8392246 0 1.5227568 1.6553779 0 0.9087739 1.241241 0 0.24066177 0.79059368 
		0 -0.16896325 0.51429826 0 -0.12843215 0.54163682 0 0.34328961 0.85981703;
	setAttr ".pt[1494:1659]" 0 1.2110538 0.90232611 0 1.6214807 1.179163 0 1.7620399 
		1.2739716 0 1.5669626 1.1423899 0 1.127527 0.84598655 0 0.64934999 0.52345222 0 0.35617596 
		0.32570437 0 0.38518459 0.34527081 0 0.72280204 0.57299626 0 1.1060895 0.27595726 
		0 0.90032899 0.13717017 0 0.88264972 0.12524536 0 1.0613241 0.24576268 0 1.3527484 
		0.44233075 0 1.6205618 0.6229732 0 1.7394515 0.70316541 0 1.6537879 0.64538455 0 
		1.4036537 0.47666684 0 1.4971558 -0.061126828 0 1.3794783 0.097967505 0 1.6527134 
		0.28227508 0 1.7488323 0.10903203 0 1.255116 -0.22398424 0 1.1171892 -0.078940392 
		0 1.0530422 -0.36068583 0 0.89749664 -0.2271331 0 0.91372049 -0.45425904 0 0.74688429 
		-0.32871395 0 0.85588866 -0.49366802 0 0.68353254 -0.3714537 0 0.88438714 -0.47404444 
		0 0.71506739 -0.3501749 0 0.99794352 -0.39785039 0 0.83770013 -0.26746655 0 1.1808416 
		-0.27408296 0 1.0366254 -0.13328147 0 1.4127399 -0.11806619 0 1.2878648 0.036172748 
		0 1.6643705 0.052061856 0 1.5610995 0.2204805 0 1.90619 0.21476996 0 1.8233892 0.3973881 
		0 2.1087248 0.35178196 0 2.043081 0.54558098 0 2.2474015 0.44491947 0 2.1936936 0.6471622 
		0 2.3059855 0.48483562 0 2.257045 0.68990195 0 2.2767189 0.46469426 0 2.2255104 0.66862321 
		0 2.1638532 0.38896632 0 2.1028774 0.58591461 0 1.9804243 0.26484144 0 1.9039525 
		0.45172989 0 1.270203 0.27978691 0 1.5158068 0.44544828 0 1.7416316 0.59776962 0 
		1.9204408 0.71837795 0 2.0306671 0.79272676 0 2.0590158 0.81184816 0 2.002068 0.77343619 
		0 1.8666924 0.68212378 0 1.6692164 0.54892445 0 1.4334583 0.38990408 0 1.1878554 
		0.2242423 0 0.96202976 0.071921498 0 0.78322047 -0.048686832 0 0.67299414 -0.12303546 
		0 0.64464551 -0.14215681 0 0.70159328 -0.10374513 0 0.83696938 -0.012432843 0 1.0344456 
		0.12076607 0 1.0910332 -0.44940075 0 1.1123739 -0.4347055 0 1.1343393 -0.41989014 
		0 1.9331131 0.11858988 0 1.7596914 0.0019161105 0 2.0704691 0.21153766 0 2.1549854 
		0.26824427 0 2.1769013 0.28332704 0 2.1330318 0.25343651 0 2.0291877 0.18369317 0 
		1.8775247 0.081095278 0 1.6964444 -0.040744781 0 1.5080171 -0.16814065 0 1.3343662 
		-0.28496987 0 1.1974076 -0.37764996 0 1.2386669 -0.34982008 0 1.3899845 -0.2474547 
		0 1.5712297 -0.125503 0 1.0812632 -0.32626751 0 1.1004347 -0.31306595 0 1.1201674 
		-0.29975647 0 1.8377503 0.18399006 0 1.6819561 0.079175591 0 1.9611449 0.26749033 
		0 2.0370708 0.31843305 0 2.0567591 0.33198267 0 2.0173485 0.30513036 0 1.9240595 
		0.24247605 0 1.7878124 0.1503067 0 1.6251377 0.040850937 0 1.455863 -0.073595881 
		0 1.2998629 -0.17855018 0 1.176825 -0.26180965 0 1.2138907 -0.2368086 0 1.3498278 
		-0.14484811 0 1.5126504 -0.035292089 0 1.1434606 -0.28417963 0 1.274727 -0.19563919 
		0 1.5436374 -0.014256597 0 1.8243659 0.17509705 0 1.9855555 0.28382051 0 1.9517846 
		0.26104182 0 1.738855 0.1174193 0 1.446398 -0.079845309 0 1.2112589 -0.23844925 0 
		-4.0086899 1.177964 0 -3.9332068 1.5127095 0 -4.588541 -0.46769595 0 -6.4721246 0.31618357 
		0 -6.5294018 -0.05922246 0 -5.8476043 1.9792045 0 -4.2207603 0.51294219 0 -4.1092443 
		0.85588431 0 -4.4473805 -0.13712263 0 -4.3267303 0.20264006 0 -6.2670913 0.92065191 
		0 -5.9943986 1.6802578 0 -6.147119 1.2714181 0 -5.0548534 0.80997896 0 -5.154285 
		0.45601892 0 -3.9058084 1.2911344 0 -4.0213852 1.3001329 0 -3.8636966 1.6059276 0 
		-3.979845 1.6199712 0 -3.9925895 0.96751797 0 -4.0970993 1.013628 0 -5.6546702 1.727931 
		0 -5.7900877 1.793237 0 -5.5276189 2.0242364 0 -5.6610293 2.0829036 0 -4.2141571 
		0.63769376 0 -4.1081724 0.59284961 0 -4.3397932 -0.098733902 0 -4.4330773 -0.015527248 
		0 -4.3291879 0.27866411 0 -4.2242088 0.2400533 0 -5.8777881 1.0992546 0 -6.0313683 
		1.1093912 0 -5.7623811 1.4489875 0 -5.9134302 1.460161 0 -4.5868778 -0.35378742 0 
		-4.4936585 -0.43401909 0 -6.0781956 0.429919 0 -6.2410841 0.40745354 0 -6.2799311 
		0.031023741 0 -6.1139021 0.097374201 0 -5.2956982 -0.1256249 0 -5.2347469 0.14011312 
		0 -5.4163437 -0.68444967 0 -5.5880241 -0.6406424 0 -5.1862779 -0.97946596 0 -5.3768368 
		-1.0166945 0 -5.211484 -0.87196708 0 -5.0252838 -0.83816409;
	setAttr ".pt[1660:1782]" 0 -5.4857335 -0.86238575 0 -5.6666107 -0.81537461 0 
		-5.8644819 -0.71336079 0 -6.008451 -0.59461546 0 -5.7353973 -0.56965399 0 -5.8753862 
		-0.46194315 0 -6.0583048 -0.8809278 0 -6.2073941 -0.76737976 0 -5.0430603 -0.66930723 
		0 -5.2192001 -0.69556451 0 -5.6882725 -1.0129111 0 -5.8727374 -0.97023153 0 -4.6827693 
		2.2636418 0 -4.7070785 2.1578116 0 -4.6641111 2.3825176 0 -4.1813173 2.1636007 0 
		-4.3436618 2.2637067 0 -4.2656999 2.0816462 0 -4.4170866 2.1706691 0 -3.9773529 1.8072827 
		0 -4.0670748 1.96676 0 -4.0173874 2.0185425 0 -3.9245472 1.8716106 0 -4.9556079 2.2922285 
		0 -5.1241865 2.2759583 0 -4.9905467 2.4173231 0 -5.1725297 2.4002914 0 -4.0401363 
		1.8384771 0 -4.1267033 1.9680078 0 -5.4742656 2.3131168 0 -5.6341214 2.2213526 0 
		-5.5284519 2.2520063 0 -5.3873191 2.3418181 0 -5.2950172 2.2313616 0 -5.4218769 2.1519301 
		0 -5.0259032 2.3739839 0 -5.2160144 2.3632879 0 -4.7211528 2.3361824 0 -4.2374792 
		2.1144295 0 -4.4053822 2.2186959 0 -4.9587393 -0.88550925 0 -4.786129 -0.74688292 
		0 -4.6417599 -0.62120175 0 -4.8107114 -0.74871397 0 -6.4778566 -0.37017798 0 -6.3888206 
		-0.55987811 0 -6.2419577 -0.21240568 0 -6.158452 -0.40394878 0 -5.9967976 -0.31904578 
		0 -6.0819187 -0.14122581 0 -4.8725529 -0.60639453 0 -4.7097826 -0.49446511 0 -4.8038321 
		1.6955271 0 -4.7578559 1.8924562 0 -4.7262087 2.039746 0 -5.3394632 -0.33714461 0 
		-5.3760395 -0.51419973 0 -4.871819 1.4408213 0 -4.9570394 1.1452041 0 -4.5223446 
		2.2161672 0 -4.5017838 2.333797 0 -4.5611649 2.2881238 0 -4.8438005 2.2888312 0 -4.8252263 
		2.410605 0 -4.8714256 2.365768 0 -5.6244116 -0.48210263 0 -5.6581826 -0.31103277 
		0 -5.6721306 -0.10604692 0 -5.6523504 0.15536427 0 -5.5891247 0.48916078 0 -5.4712582 
		0.91714954 0 -5.3639755 1.2689259 0 -5.2653661 1.5646664 0 -5.1713591 1.8203526 0 
		-5.0891342 1.9961469 0 -5.0056224 2.119504 0 -4.9124289 2.2100847 0 -5.1238775 -0.55322099 
		0 -5.0274324 -0.39614606 0 -4.9366274 -0.20000768 0 -4.8358188 0.077182293 0 -4.7390909 
		0.38330913 0 -4.6364384 0.7229588 0 -4.5380068 1.0597394 0 -4.4613838 1.3572624 0 
		-4.4143686 1.6277235 0 -4.4127569 1.8372486 0 -4.43855 1.9899008 0 -4.4887795 2.113925 
		0 -6.161366 -0.20473862 0 -6.195982 0.047642231 0 -6.1578579 0.40485573 0 -5.9451036 
		1.1156516 0 -5.8230019 1.4846966 0 -5.7070923 1.7868785 0 -5.5727854 2.0984404 0 
		-5.4573069 2.2392166 0 -5.3213987 2.3245251 0 -5.1347485 2.3736045 0 -4.9549646 2.3908784 
		0 -4.8050475 2.3860741 0 -4.6593728 2.3597527 0 -4.5130715 2.3196087 0 -4.3710127 
		2.2579477 0 -4.209722 2.1624184 0 -4.0594459 2.0379362 0 -3.9672141 1.8987514 0 -3.9035378 
		1.6613404 0 -3.9474373 1.3247219 0 -4.0289259 1.0170667 0 -4.1521802 0.62072337 0 
		-4.2736602 0.24294138 0 -4.3849602 -0.07392168 0 -4.5471964 -0.43027568 0 -4.6805372 
		-0.58549595 0 -4.8531332 -0.70584798 0 -5.0394588 -0.77610779 0 -5.226727 -0.80491257 
		0 -5.4460044 -0.79341412 0 -5.6284418 -0.74673629 0 -5.7913113 -0.66729856 0 -5.9395542 
		-0.55206466 0 -6.0718193 -0.39431739;
	setAttr -s 1783 ".vt";
	setAttr ".vt[0:165]"  -2.40792561 0.72980487 -2.94139051 -1.96967149 4.9283514 -5.94594193
		 -2.015696764 6.18883133 -4.31865692 -2.21939564 2.8808434 -4.60770798 -0.94942081 4.97423697 -6.75957155
		 -0.95004684 2.34519911 -5.2912941 -2.16769242 4.67811775 -2.65072918 -2.077095032 5.81347179 -5.40614414
		 -2.91458941 1.45756185 -1.85935605 -2.58219123 3.72686911 -3.67617369 -0.94976926 1.26706159 -4.28529072
		 -1.83488727 0.5967685 -3.24123144 -2.33128071 1.76322365 -3.7360239 -1.85059857 2.60278177 -5.0036692619
		 -1.87249851 1.4699856 -4.083460331 -2.07233572 4.00076770782 -5.45568752 -1.67317474 4.97849274 -6.38622952
		 -0.95057172 3.60210896 -6.22344112 -1.74457574 3.79765892 -5.89307117 -2.27269197 3.5221529 -1.69497728
		 -2.75261569 2.59244251 -2.7429409 -2.074873924 5.68526602 -3.63069391 -2.37808418 4.84593344 -4.58647966
		 -2.82705331 -0.52421832 -1.81477189 -0.9496125 7.08581543 -4.46553135 -1.8232851 -0.17373455 -2.92491722
		 -1.40284514 0.55777764 -3.30547619 -1.86027789 1.0017191172 -3.63109398 -1.45115948 1.32442105 -4.23095131
		 -0.95045865 0.85467327 -3.74932575 -1.43125355 0.91358602 -3.72829962 -2.37305498 1.23339367 -3.32343674
		 -2.28029037 2.31512594 -4.166008 -1.86893821 2.014166832 -4.53929567 -1.46303701 2.43148994 -5.20673895
		 -0.94967461 1.76915681 -4.78362465 -1.46325064 1.84815705 -4.71469259 -1.80124283 3.20358896 -5.47246695
		 -1.41749513 3.67410326 -6.11755705 -0.95001143 2.96183205 -5.7814579 -1.44539285 3.047480106 -5.6872344
		 -2.14648962 3.4544704 -5.0521698 -2.0069563389 4.48663282 -5.77068567 -1.69532108 4.37025738 -6.21125698
		 -1.37313449 4.98359108 -6.62958527 -0.95008355 4.25917339 -6.56394577 -1.38779664 4.30525255 -6.44675207
		 -0.95035487 5.82355642 -6.69875002 -1.30469358 6.28359318 -3.22821522 -1.29727948 5.17795944 -2.1887269
		 -1.2977041 5.75901747 -2.70452261 -1.33898139 6.98270035 -4.45075035 -1.31339097 6.70041847 -3.77786827
		 -2.024822712 6.046811104 -4.051782608 -2.12181377 5.21381426 -3.15444422 -1.30821109 4.040280819 -1.26330805
		 -1.30098701 4.57329464 -1.68696749 -2.2132535 4.11350155 -2.15472651 -1.31884456 3.67539978 -0.98029661
		 -2.76615071 1.79727423 -1.30391562 -2.35110903 2.89770746 -1.30388451 -2.62285733 3.086289406 -2.18933296
		 -2.83181167 2.016793728 -2.28251219 -2.68802309 2.47003889 -1.73832846 -1.81937134 0.23649764 -3.0089473724
		 -1.38362467 -0.1522916 -3.072689772 -1.38837624 0.23493147 -3.1243403 -2.23019171 -0.22331527 -2.65646482
		 -2.39885521 0.22536036 -2.60969448 -0.95002335 -0.73348916 -3.24496222 -1.36326826 6.99192047 -5.27467632
		 -2.061424494 6.088414192 -4.84409904 -2.98931527 0.91397309 -1.53869224 -1.64522362 5.68750381 -6.36857796
		 -1.33468854 5.74853373 -6.59856749 -2.30338669 5.29495335 -4.086436272 -2.26261687 5.33455276 -4.98963737
		 -2.20526528 5.72789907 -4.49787378 -2.47641039 4.23148108 -3.13382292 -2.48259711 4.29910898 -4.14206171
		 -2.39037871 4.78895235 -3.62002707 -2.67218709 3.16015768 -3.20877743 -2.55469441 3.66545534 -2.65883875
		 -2.6475718 -0.96563196 -2.048058987 -1.8555932 -0.71348965 -2.99452686 -2.2050848 -0.74436933 -2.72358608
		 -1.40198624 -0.72197342 -3.17973995 -0.94961166 0.53318822 -3.31996918 -0.94999945 5.22121572 -2.15303612
		 -0.9500019 4.075871468 -1.23192322 -0.9500109 6.34953833 -3.19533777 -0.9526037 6.64655161 -6.18661928
		 -0.95001239 -0.15076089 -3.11981106 -0.94977653 7.10786057 -5.29068089 -0.94999814 5.81267214 -2.66873407
		 -0.95018625 6.77916241 -3.75630569 -0.94999933 4.60905409 -1.65227759 -0.94983518 0.22950912 -3.1668489
		 0.37617844 0.85804689 -2.61266661 0.1829266 4.91804743 -5.81927538 0.333206 2.99748611 -4.45676327
		 0.18726417 5.7149992 -5.31502247 0.66923344 1.38098717 -1.69403887 0.43030849 3.83905649 -3.7064209
		 -0.12878823 0.65383887 -3.12987638 -0.048611999 2.59805727 -5.008998394 -0.074338377 1.55574644 -4.07619524
		 0.29845744 4.090771198 -5.30407476 -0.17349607 5.0041131973 -6.41821098 -0.12745672 3.76112223 -5.93482542
		 0.36357775 4.84105253 -4.55621576 -0.20046288 6.78732491 -4.4526844 -0.21817362 6.42433834 -6.024317741
		 0.74042672 -0.38858372 -1.9226023 -0.10024244 -0.17910105 -2.88237762 -0.50814933 0.59198499 -3.28180695
		 -0.45716056 1.33760583 -4.21749258 -0.48229128 0.95986974 -3.72204876 0.13169366 0.7201885 -2.92666006
		 0.31772205 2.56033969 -4.10496998 0.17246073 2.76826286 -4.75967312 -0.058971286 2.016321182 -4.50423193
		 0.16441275 2.26973653 -4.32293129 -0.43021107 2.4225235 -5.21712589 -0.43991947 1.83265269 -4.70058393
		 -0.07224673 3.18590117 -5.49666643 -0.47014561 3.65776205 -6.1432519 -0.44412374 3.033315659 -5.70655632
		 0.33052558 3.55852127 -4.90011787 0.12398785 3.88972759 -5.6428194 0.16440266 3.339468 -5.22216225
		 0.24019676 4.55709362 -5.62667084 0.040516078 4.94498158 -6.12040234 -0.15716612 4.36309767 -6.25017214
		 0.063990653 4.43501759 -5.97954273 -0.48617351 4.98392296 -6.65838432 -0.49720186 4.29425669 -6.4784627
		 0.97061408 -0.11646522 -1.45967221 -0.59268868 6.2889719 -3.22330761 -0.6014992 5.18443155 -2.1902566
		 -0.60015661 5.76792622 -2.70279026 -0.55881411 7.005944252 -4.45553112 -0.58223522 6.70905495 -3.77280617
		 -0.59272289 4.038199425 -1.26594019 -0.59946096 4.57240915 -1.68806946 0.5729807 2.026962519 -1.35919189
		 -0.12441838 0.24509704 -2.90807247 -0.51943302 -0.15412837 -3.059801817 -0.52446079 0.24109113 -3.095268726
		 0.3357293 -0.23634529 -2.50652361 0.53650218 0.25963283 -2.19918656 0.21255559 0.24151111 -2.63605595
		 -0.53257269 6.60692739 -6.14247942 -0.54125738 7.037532806 -5.27546024 0.13619089 6.15742254 -4.76349401
		 0.033590853 6.12183523 -5.71143579 -0.025586534 6.54133415 -5.097420692 0.89572012 0.7805357 -1.25367594
		 0.53210765 1.079256654 -2.26830435 0.73370415 0.47942278 -1.79563379 -0.19799693 5.64571905 -6.39809752
		 -0.53194964 5.78523064 -6.63819218 0.20777787 5.19105816 -5.70174503 0.036222205 5.44424915 -6.061753273
		 0.28580171 5.38425875 -4.018675327 0.29519764 5.28165197 -4.93243265;
	setAttr ".vt[166:331]" 0.22243571 5.79563093 -4.38429689 0.34319675 4.31235123 -3.088546276
		 0.4075202 4.35218954 -4.14711046 0.31597397 4.90230274 -3.5720892 0.40539777 3.25298715 -4.20818996
		 0.35978514 4.34832048 -5.077883244 0.29261729 4.80949354 -5.42689276 0.36158139 3.8608439 -2.75724053
		 0.39781547 3.81374359 -4.65908623 0.67240661 -0.91034204 -2.14085269 -0.039452612 -0.71122622 -3.0027952194
		 0.37130529 -0.76778531 -2.6099081 -0.49404746 -0.71509856 -3.19851995 -0.95090818 7.14270782 -4.87035084
		 -1.35613513 7.02734375 -4.85455036 -0.54754102 7.064757347 -4.86030388 -0.24321079 6.893291 -4.83199549
		 -0.93924612 6.94720554 -5.75949287 -1.37172365 6.82185078 -5.71728516 -0.21617559 6.7328763 -5.61756468
		 0.005429633 6.35788059 -5.44756889 -1.34116983 6.17783546 -6.41314983 -0.96016157 6.2709775 -6.49544668
		 -0.55178648 6.26012182 -6.44307089 -0.22316433 6.15805101 -6.24629259 0.045081317 5.85007286 -5.90782356
		 -1.95661163 3.81852341 5.43723869 -2.9261353 3.57763863 5.16440296 -3.74169564 3.21397018 4.74857235
		 -4.36431551 2.77701283 4.24647284 -4.81660748 2.28582978 3.6816175 -5.10700989 1.75615525 3.071122408
		 -5.23113108 1.22506094 2.45777321 -5.20204115 0.66522193 1.81431651 -5.016229153 0.13010192 1.20357811
		 -4.69403219 -0.36770105 0.63896823 -4.22274303 -0.85131395 0.080711305 -1.99102759 3.47897148 5.89387226
		 -2.9859581 3.23470783 5.6127243 -3.8256371 2.86677694 5.18873453 -4.47257757 2.42345667 4.67804241
		 -4.95156956 1.92268598 4.10024643 -5.27062368 1.37956846 3.47220683 -5.42364359 0.82833731 2.83410072
		 -5.42125845 0.24912 2.16459227 -1.94619751 2.37217569 6.43040895 -1.9236263 -3.29233456 -0.27060926
		 -5.25245333 -0.32108265 1.50604439 -4.91578436 -0.86531913 0.87870467 -4.41665459 -1.36845922 0.29760939
		 -2.86587906 2.15802336 6.17733717 -3.66012573 1.83492076 5.79511976 -4.28314543 1.44757402 5.33709002
		 -4.7695117 0.99967325 4.80790949 -5.12355995 0.4946146 4.2100997 -5.32251596 -0.028673649 3.58938336
		 -5.37057734 -0.58685076 2.92865562 -5.24758196 -1.15887713 2.25179577 -4.9305706 -1.72579968 1.58192694
		 -4.43301296 -2.2358129 0.97914124 -3.6659627 -2.72918224 0.39719614 -3.70771861 -1.87095046 -0.28294688
		 -3.60173225 -1.37858868 -0.52889341 -2.93167019 -1.82291186 -1.030580401 -2.86870718 -3.056793213 0.0085545182
		 -2.93429732 -2.26678991 -0.74304056 -2.4713912 -2.45704269 -0.96124983 -0.94999999 3.19898939 -0.65828466
		 -2.89519691 0.22652793 -0.42508709 -2.73904181 0.66652489 -0.50114274 -2.58032322 1.13862991 -0.58977664
		 -1.67952776 2.89184856 -0.68124199 -2.32277107 1.78553092 -0.65894043 -1.33193839 3.12483692 -0.66490531
		 -2.00031638145 2.45712519 -0.68951607 -2.14059854 2.19057798 -0.68363428 -1.82652235 2.71402025 -0.68523729
		 -1.50303125 3.036653996 -0.67291808 1.26987839 0.23250341 -0.74524724 -0.11966568 3.16112804 -0.85052967
		 0.58610386 2.020358562 -0.8965137 0.1452449 2.85086155 -0.88260436 -0.3641727 3.33858776 -0.81717527
		 0.995197 0.22652793 -0.42508709 0.72854155 0.9778806 -0.55496204 0.58258623 1.38411915 -0.61602342
		 -0.22047222 2.89184856 -0.68124199 0.42277104 1.78553092 -0.65894043 -0.56806159 3.12483692 -0.66490531
		 0.10031646 2.45712519 -0.68951607 0.24059862 2.19057798 -0.68363428 -0.073477626 2.71402025 -0.68523729
		 -0.39696866 3.036653996 -0.67291808 -1.63875937 2.85110044 -0.68564999 -1.78048992 2.67962885 -0.68939924
		 -1.95100212 2.42757607 -0.69352651 -2.089111328 2.16527748 -0.68846226 -2.27004361 1.76283538 -0.66313469
		 -2.52674985 1.11789525 -0.59327471 -2.6853652 0.64648867 -0.50651801 -2.84228349 0.2062757 -0.43516612
		 0.94228357 0.2062757 -0.43516612 0.67486495 0.95784438 -0.56033731 0.5290125 1.36338437 -0.61952126
		 0.37004369 1.76283538 -0.66313469 0.18911141 2.16527748 -0.68846226 0.051002085 2.42757607 -0.69352651
		 -0.11951011 2.67962885 -0.68939924 -0.26124054 2.85110044 -0.68564999 -0.4288035 2.98854494 -0.67742741
		 -0.58895022 3.071122646 -0.67030048 -0.94999999 3.14147758 -0.66419113 -1.3110497 3.071122646 -0.67030048
		 -1.47119641 2.98854494 -0.67742741 0.96023339 -1.43432832 -1.37113309 -2.88544559 -1.41052067 -1.34430325
		 0.99200177 0.98369718 -0.82327855 -2.83119607 1.14807546 -0.84035361 -0.94999999 3.49320889 -0.77910531
		 -0.57603085 3.43419886 -0.79619932 -1.32396913 3.43419886 -0.79619932 -0.58115542 3.67539978 -0.98029661
		 -0.95001268 3.72354722 -0.95740879 -3.1723454 0.0051899403 -1.087731123 -2.48610377 2.020358562 -0.8965137
		 -3.19439602 0.16438939 -0.7347905 -1.78033423 3.16112804 -0.85052967 -2.045244932 2.85086155 -0.88260436
		 -1.53582728 3.33858776 -0.81717527 -2.27184606 2.47656584 -0.90128684 -4.45687103 -0.62703323 0.33850467
		 -4.68796062 -2.004373312 1.25287938 -4.66848993 -1.13774872 0.56249905 -4.86474371 -0.13089192 0.90509546
		 -5.10824013 -1.45746064 1.89895487 -5.097642899 -0.60876983 1.17206383 -5.11929798 0.37396884 1.47838926
		 -5.3258357 -0.89575684 2.56342459 -5.35072184 -0.059942603 1.80575573 -5.23511696 0.92686653 2.11206794
		 -5.3677578 -0.32522595 3.2385273 -5.44286776 0.519876 2.47597384 -5.19116497 1.47466493 2.74338603
		 -5.37159538 1.087281823 3.13252354 -5.24782276 0.21687245 3.88077664 -5.14492798 1.63234842 3.76360893
		 -4.97875595 0.73051548 4.49001932 -4.9938612 2.0029444695 3.35314941 -4.62713289 2.51974463 3.94773841
		 -4.75018311 2.16047764 4.37385511 -4.56053305 1.21294987 5.060482025 -4.097410202 2.98876476 4.48694849
		 -4.19444132 2.63794327 4.92417812 -4.013876915 1.63327396 5.55702829 -3.43309236 3.061818123 5.41267776
		 -3.28675628 2.0048890114 5.99685812 -3.36061239 3.40738916 4.96708345 -2.45933938 3.71620369 5.31889725
		 -2.42291951 2.27911806 6.3209672 -2.50919151 3.37399673 5.77246952 -1.43720376 3.87909937 5.50645018
		 -1.43228149 2.42850542 6.49924135 -1.45558429 3.54095316 5.96598768 -3.29618192 -2.89734936 0.19693831
		 -3.35857558 -2.068150043 -0.51192808 -3.24955511 -1.623914 -0.81093955;
	setAttr ".vt[332:497]" -2.41622639 -3.19076014 -0.14969927 -1.42226791 -3.35254049 -0.34089237
		 -3.93101621 -1.11631489 -0.20927238 -4.061774731 -2.50350904 0.66253328 -4.073417187 -1.63686895 -0.0058907121
		 -4.739779 -1.59707797 0.87271202 -4.48147583 -1.83027828 0.60276353 -4.98750782 -1.3168695 1.19764638
		 -5.17066813 -1.050107598 1.50771916 -5.32005787 -0.7493397 1.85815442 -5.40982866 -0.48272228 2.16964817
		 -5.46778631 -0.16835189 2.53732848 -5.47767591 0.10101056 2.85294151 -5.44545031 0.40767515 3.21279812
		 -5.2690649 0.95256984 3.85496354 -5.38237429 0.66341949 3.5138309 -4.93010473 1.48323858 4.48142576
		 -5.1333971 1.19973528 4.14687014 -4.4408679 1.96451032 5.050523281 -4.72270966 1.71194637 4.75185823
		 -3.79551911 2.38608932 5.55067348 -4.1627326 2.16794062 5.29150915 -2.96398544 2.73417377 5.9678793
		 -3.4059248 2.57024097 5.77090549 -2.49549508 2.86390114 6.12533092 -1.98679447 2.96179581 6.24591446
		 -1.45355594 3.019013882 6.32020044 -3.35959101 -2.51127625 -0.18087187 -2.91360974 -2.69173002 -0.38857114
		 -3.72136092 -2.33276653 0.024245277 -2.45403051 -2.85416794 -0.57124376 -4.1129427 -2.10048318 0.29101226
		 -1.95389414 -2.98949909 -0.71988523 -0.94999999 3.89516115 5.53277445 -0.94999999 2.44844151 6.52116489
		 -0.94999999 3.55953264 5.98926783 -0.94999999 3.034984589 6.34446049 -0.94999999 -3.36976004 -0.36038041
		 -2.6021843 -2.037773609 -1.27004623 0.056611598 3.81852341 5.43723869 1.026135445 3.57763863 5.16440296
		 1.84169555 3.21397018 4.74857235 2.46431541 2.77701283 4.24647284 2.91660762 2.28582978 3.6816175
		 3.20701003 1.75615525 3.071122408 3.33113122 1.22506094 2.45777321 3.30204129 0.66522193 1.81431651
		 3.1162293 0.13010192 1.20357811 2.7940321 -0.36770105 0.63896823 2.32274318 -0.85131395 0.080711305
		 0.091027677 3.47897148 5.89387226 1.085958004 3.23470783 5.6127243 1.92563701 2.86677694 5.18873453
		 2.57257771 2.42345667 4.67804241 3.0515697 1.92268598 4.10024643 3.37062383 1.37956846 3.47220683
		 3.52364373 0.82833731 2.83410072 3.52125859 0.24912 2.16459227 0.046197593 2.37217569 6.43040895
		 0.023626328 -3.29233456 -0.27060926 3.35245347 -0.32108265 1.50604439 3.015784264 -0.86531913 0.87870467
		 2.51665449 -1.36845922 0.29760939 0.96587914 2.15802336 6.17733717 1.76012564 1.83492076 5.79511976
		 2.38314533 1.44757402 5.33709002 2.86951184 0.99967325 4.80790949 3.22356009 0.4946146 4.2100997
		 3.42251611 -0.028673649 3.58938336 3.47057748 -0.58685076 2.92865562 3.3475821 -1.15887713 2.25179577
		 3.030570507 -1.72579968 1.58192694 2.53301311 -2.2358129 0.97914124 1.7659626 -2.72918224 0.39719614
		 1.83403325 -1.85608768 -0.26568872 1.75920367 -1.33490205 -0.47665936 1.031670332 -1.82291186 -1.030580401
		 0.96870726 -3.056793213 0.0085545182 1.034297228 -2.26678991 -0.74304056 0.57139128 -2.45704269 -0.96124983
		 2.55687094 -0.62703323 0.33850467 2.78796077 -2.004373312 1.25287938 2.76848984 -1.13774872 0.56249905
		 2.96474361 -0.13089192 0.90509546 3.20824027 -1.45746064 1.89895487 3.19764304 -0.60876983 1.17206383
		 3.21929812 0.37396884 1.47838926 3.42583585 -0.89575684 2.56342459 3.45072198 -0.059942603 1.80575573
		 3.3351171 0.92686653 2.11206794 3.46775794 -0.32522595 3.2385273 3.5428679 0.519876 2.47597384
		 3.29116511 1.47466493 2.74338603 3.47159553 1.087281823 3.13252354 3.3478229 0.21687245 3.88077664
		 3.24492812 1.63234842 3.76360893 3.078756094 0.73051548 4.49001932 3.093861341 2.0029444695 3.35314941
		 2.72713304 2.51974463 3.94773841 2.85018301 2.16047764 4.37385511 2.66053295 1.21294987 5.060482025
		 2.19741011 2.98876476 4.48694849 2.29444122 2.63794327 4.92417812 2.11387682 1.63327396 5.55702829
		 1.53309226 3.061818123 5.41267776 1.38675618 2.0048890114 5.99685812 1.4606123 3.40738916 4.96708345
		 0.55933934 3.71620369 5.31889725 0.5229196 2.27911806 6.3209672 0.6091916 3.37399673 5.77246952
		 -0.46279618 3.87909937 5.50645018 -0.46771854 2.42850542 6.49924135 -0.44441563 3.54095316 5.96598768
		 1.39618182 -2.89734936 0.19693831 1.45857549 -2.068150043 -0.51192808 1.37897229 -1.60549879 -0.79061389
		 0.51622635 -3.19076014 -0.14969927 -0.47773209 -3.35254049 -0.34089237 2.031016111 -1.11631489 -0.20927238
		 2.16177487 -2.50350904 0.66253328 2.17341733 -1.63686895 -0.0058907121 2.83977914 -1.59707797 0.87271202
		 2.58147573 -1.83027828 0.60276353 3.087507963 -1.3168695 1.19764638 3.27066827 -1.050107598 1.50771916
		 3.42005801 -0.7493397 1.85815442 3.50982881 -0.48272228 2.16964817 3.56778646 -0.16835189 2.53732848
		 3.57767606 0.10101056 2.85294151 3.54545045 0.40767515 3.21279812 3.36906505 0.95256984 3.85496354
		 3.48237443 0.66341949 3.5138309 3.030104876 1.48323858 4.48142576 3.23339725 1.19973528 4.14687014
		 2.54086781 1.96451032 5.050523281 2.82270956 1.71194637 4.75185823 1.89551902 2.38608932 5.55067348
		 2.26273251 2.16794062 5.29150915 1.063985348 2.73417377 5.9678793 1.5059247 2.57024097 5.77090549
		 0.59549516 2.86390114 6.12533092 0.086794436 2.96179581 6.24591446 -0.44644403 3.019013882 6.32020044
		 1.45959091 -2.51127625 -0.18087187 1.013609886 -2.69173002 -0.38857114 1.82136083 -2.33276653 0.024245277
		 0.5540306 -2.85416794 -0.57124376 2.21294284 -2.10048318 0.29101226 0.053894103 -2.98949909 -0.71988523
		 0.70218438 -2.037773609 -1.27004623 1.16374636 -1.242239 -1.1424346 -1.90030265 -3.069572926 0.19140029
		 -2.34951282 -2.77496099 0.12225112 -2.71055198 -2.41334224 0.059901133 -2.97336888 -1.98393512 -0.04234913
		 -3.11945796 -1.56741476 -0.13102232 -1.42548358 -3.21603441 0.19814646 -0.94999999 -3.23322535 0.18730062
		 -3.16740417 -1.13995528 -0.21399504 0.00030267239 -3.069572926 0.19140029 0.44951278 -2.77496099 0.12225112
		 0.81055194 -2.41334224 0.059901133 1.073368788 -1.98393512 -0.04234913 1.21945786 -1.56741476 -0.13102232
		 -0.47451636 -3.21603441 0.19814646 1.26740408 -1.13995528 -0.21399504;
	setAttr ".vt[498:663]" -2.032157898 5.37198067 -5.81856632 -1.70628583 5.96715736 -6.17077065
		 -3.04723835 -0.25474805 -1.49553943 -3.063090086 -1.2428515 -1.14418864 -2.87727857 0.63441885 -2.097781181
		 -2.79672456 1.10836184 -2.45342779 -2.7100172 1.58235288 -2.86312652 -2.62550759 2.10082197 -3.33404207
		 -2.54172421 2.62636137 -3.80049467 -2.46237946 3.19801664 -4.24521494 -2.37497973 3.7672863 -4.68621635
		 -2.28538108 4.31538105 -5.10338116 -2.19791293 4.77924728 -5.44397449 -1.35164046 6.5499258 -6.13386059
		 -0.52832818 6.91033697 -5.70609808 -0.012710288 6.59979343 -4.83393192 -0.22593701 6.85368967 -5.19305277
		 -0.011694074 6.49176121 -4.52237129 0.074732862 6.12939692 -4.04226923 0.108331 5.76245117 -3.62400436
		 0.11017095 5.27785063 -3.15019941 0.11008929 4.69242144 -2.61847448 0.13780238 4.1342802 -2.18905735
		 0.37965173 2.46254015 -0.89842844 0.19187921 3.49265671 -1.71472788 0.28056616 2.94179058 -1.32457066
		 -3.14367557 -0.78363442 -0.27075335 1.24248314 -0.78425962 -0.27141446 -1.71546555 6.40605402 -3.85177946
		 -1.72298622 6.032371521 -3.36140251 -1.73195577 5.54465485 -2.85936642 -1.74625874 4.99196768 -2.34878874
		 -1.76521432 4.4089489 -1.84857464 -1.79392111 6.4315877 -5.50296736 -1.78550482 6.58245373 -5.15615749
		 -1.79075193 6.63100719 -4.73200893 -1.74088609 6.62465525 -4.41639948 -1.84047961 3.37867928 -1.071659207
		 -1.79605448 3.85466051 -1.40804148 -1.77280664 6.23889065 -5.82501793 -0.94999999 -1.42845738 -3.51754904
		 0.036948144 -1.30658031 -3.13319516 0.39258379 -1.25276995 -2.6989336 -0.43711787 -1.39598632 -3.42577386
		 -1.93694806 -1.30658031 -3.13319516 -2.22580671 -1.26287389 -2.78047395 -1.46288204 -1.3959862 -3.4257741
		 0.6294778 -1.33815742 -2.20904183 0.73439056 -1.64758968 -1.61146569 -2.53117537 -1.33560038 -2.20858002
		 -2.63439059 -1.64758968 -1.61146569 -0.13881701 3.83273411 -1.43579006 -0.086383998 3.36788464 -1.096440434
		 -0.13112795 6.03404808 -3.36110687 -0.14031598 6.41366673 -3.84649849 -0.17713028 5.5434866 -2.86507607
		 -0.16511494 4.39161158 -1.87006426 -0.17521679 4.98399496 -2.36054134 1.66248536 -3.021690845 0.7743113
		 1.53538179 -2.8403511 0.85190678 2.048956394 -2.79862213 1.034499884 1.89917469 -2.62651777 1.10345101
		 -0.94999999 -3.60149431 0.097445011 -0.94999999 -3.36552525 0.23067561 -0.017516077 -3.52710009 0.17629403
		 0.89807314 -3.31677628 0.42331687 -0.072719991 -3.31446886 0.29513565 0.82891148 -3.1159339 0.52522516
		 1.27761507 -3.18506193 0.57848275 1.19600368 -2.98816538 0.67601466 0.45459253 -3.43157291 0.28818336
		 -0.48227197 -3.5770216 0.11645776 -0.51866841 -3.35414267 0.2463569 0.384386 -3.22487164 0.39744523
		 -1.88248396 -3.52710009 0.17629403 -2.79807305 -3.31677628 0.42331687 -1.82728004 -3.31446886 0.29513565
		 -2.7289114 -3.1159339 0.52522516 -3.17761517 -3.18506193 0.57848275 -3.096003771 -2.98816538 0.67601466
		 -2.35459256 -3.43157291 0.28818336 -1.41772795 -3.5770216 0.11645776 -1.38133156 -3.35414267 0.2463569
		 -2.28438592 -3.22487164 0.39744523 -3.56248546 -3.021690845 0.7743113 -3.43538189 -2.8403511 0.85190678
		 -3.94895649 -2.79862213 1.034499884 -3.79917479 -2.62651777 1.10345101 2.4065268 -2.53238535 1.34805441
		 2.88121033 -2.02399826 1.9465909 2.68229508 -1.88086867 1.98344684 2.22503686 -2.37120152 1.40498447
		 2.64747024 -2.29944992 1.62236023 2.4575901 -2.1461792 1.67059422 3.044622421 -1.75697184 2.26044512
		 2.83400869 -1.62779689 2.28088975 -4.30652666 -2.53238535 1.34805441 -4.78121042 -2.02399826 1.9465909
		 -4.58229494 -1.88086867 1.98344684 -4.12503672 -2.37120152 1.40498447 -4.54747009 -2.29944992 1.62236023
		 -4.3575902 -2.1461792 1.67059422 -4.94462252 -1.75697184 2.26044512 -4.73400879 -1.62779689 2.28088975
		 3.17489839 -1.4694109 2.59914684 3.27292275 -0.91615683 3.25146914 3.19966674 -0.38242638 3.8809433
		 2.95108867 -1.36080956 2.59564614 3.04006052 -0.8398146 3.21087313 2.96798682 -0.33238077 3.81033707
		 3.23719049 -1.21402144 2.90031123 3.007794857 -1.12110031 2.87876463 3.25457311 -0.66499001 3.54760361
		 3.021656275 -0.60088742 3.49302053 -5.074898243 -1.4694109 2.59914684 -5.17292261 -0.91615683 3.25146914
		 -5.099666595 -0.38242638 3.8809433 -4.85108852 -1.36080956 2.59564614 -4.94006062 -0.8398146 3.21087313
		 -4.86798668 -0.33238077 3.81033707 -5.13719034 -1.21402144 2.90031123 -4.90779495 -1.12110031 2.87876463
		 -5.15457296 -0.66499001 3.54760361 -4.92165613 -0.60088742 3.49302053 2.9799633 0.10936403 4.46219778
		 2.75696492 0.12995303 4.35786581 3.11095548 -0.15161437 4.15359211 2.88228321 -0.11562204 4.066941261
		 -4.8799634 0.10936403 4.46219778 -4.65696478 0.12995303 4.35786581 -5.010955334 -0.15161437 4.15359211
		 -4.78228331 -0.11562204 4.066941261 2.61840296 0.57875574 5.016543388 2.41534233 0.57390785 4.88309431
		 2.82612038 0.32921541 4.7220602 2.61155772 0.33822691 4.60444689 2.40979075 0.77082622 5.24290562
		 2.21818209 0.75356591 5.095425129 -4.51840305 0.57875574 5.016543388 -4.31534243 0.57390785 4.88309431
		 -4.72612047 0.32921541 4.7220602 -4.51155758 0.33822691 4.60444689 -4.30979061 0.77082622 5.24290562
		 -4.11818218 0.75356591 5.095425129 2.14418364 0.98123109 5.49024105 1.54923272 1.31716669 5.88318777
		 1.40666509 1.26030242 5.69093609 1.96777034 0.94934285 5.32624435 1.88395309 1.14050496 5.67647266
		 1.72309828 1.095889211 5.49812174 -0.94999999 1.78524768 6.30969715 -0.94999999 1.87344182 6.5376606
		 0.81269079 1.60300958 6.21845341 -0.020724952 1.7964617 6.44514513 -0.067741811 1.71218002 6.22165489
		 0.71258146 1.52853644 6.0061702728 1.19926548 1.46511686 6.056619167 1.076775789 1.39875686 5.85356522
		 0.40713233 1.71089685 6.34480047 0.33060485 1.63124239 6.1266818 -0.50284326 1.84902728 6.50851107
		 -0.52758658 1.76231253 6.28226519 -2.71269083 1.60300958 6.21845341 -1.87927508 1.7964617 6.44514513
		 -1.83225822 1.71218002 6.22165489 -2.61258149 1.52853644 6.0061702728;
	setAttr ".vt[664:829]" -3.099265575 1.46511686 6.056619167 -2.97677588 1.39875686 5.85356522
		 -2.30713224 1.71089685 6.34480047 -2.23060489 1.63124239 6.1266818 -1.39715672 1.84902728 6.50851107
		 -1.3724134 1.76231253 6.28226519 -4.044183731 0.98123109 5.49024105 -3.44923282 1.31716669 5.88318777
		 -3.30666518 1.26030242 5.69093609 -3.86777043 0.94934285 5.32624435 -3.78395319 1.14050496 5.67647266
		 -3.62309837 1.095889211 5.49812174 1.63408947 -0.77933347 -0.5899123 2.066787004 -0.3229782 -0.081284896
		 2.48068619 0.12855384 0.47213861 1.8743279 -0.34192127 0.13181415 2.2674613 -0.10669482 0.17778552
		 2.080651283 -0.13800997 0.37378347 1.83676171 -0.55905789 -0.3713665 1.60829067 -0.52554613 -0.093842559
		 1.30685925 -0.68338513 -0.25723305 -3.20685935 -0.68338513 -0.25723305 -3.9667871 -0.3229782 -0.081284896
		 -4.38068628 0.12855384 0.47213861 -3.77432799 -0.34192127 0.13181415 -3.53408957 -0.77933347 -0.5899123
		 -4.1674614 -0.10669482 0.17778552 -3.98065138 -0.13800997 0.37378347 -3.73676181 -0.55905789 -0.3713665
		 -3.50829077 -0.52554613 -0.093842559 2.7666266 0.55340505 0.97296476 2.96553421 1.024286509 1.53018761
		 2.28652573 0.089667439 0.65626395 2.56082201 0.48211849 1.12180209 2.75260806 0.92551124 1.64612377
		 2.63056874 0.33270907 0.714028 2.43106031 0.28092599 0.88383257 2.86919999 0.76380134 1.22271085
		 2.65906167 0.6795119 1.3553673 3.0041713715 1.26697981 1.81013548 2.79611158 1.15356958 1.91536295
		 -4.66662645 0.55340505 0.97296476 -4.86553431 1.024286509 1.53018761 -4.18652582 0.089667439 0.65626395
		 -4.46082211 0.48211849 1.12180209 -4.65260792 0.92551124 1.64612377 -4.5305686 0.33270907 0.714028
		 -4.33106041 0.28092599 0.88383257 -4.76919985 0.76380134 1.22271085 -4.55906153 0.6795119 1.3553673
		 -4.90417147 1.26697981 1.81013548 -4.69611168 1.15356958 1.91536295 3.020540714 1.54625225 2.1358881
		 2.95024848 2.026818514 2.72931838 2.81596375 1.41817594 2.22778296 2.73610902 1.88239336 2.77671576
		 2.4993279 2.35584044 3.3355515 3.0028619766 1.76909781 2.41167259 2.79285455 1.63378692 2.48265958
		 2.8492384 2.25756431 2.99929547 2.6427176 2.10099006 3.034877539 -4.92054081 1.54625225 2.1358881
		 -4.85024834 2.026818514 2.72931838 -4.71596384 1.41817594 2.22778296 -4.63610888 1.88239336 2.77671576
		 -4.39932775 2.35584044 3.3355515 -4.90286207 1.76909781 2.41167259 -4.6928544 1.63378692 2.48265958
		 -4.74923849 2.25756431 2.99929547 -4.54271746 2.10099006 3.034877539 2.69486094 2.52740717 3.31360769
		 2.28784537 2.98838878 3.86666179 2.1145587 2.79295468 3.85134816 2.52232599 2.74368525 3.57324696
		 2.33596969 2.56125569 3.57816052 1.88239932 2.97921515 4.069991112 -4.59486103 2.52740717 3.31360769
		 -4.18784523 2.98838878 3.86666179 -4.014558792 2.79295468 3.85134816 -4.42232609 2.74368525 3.57324696
		 -4.23596954 2.56125569 3.57816052 -3.78239942 2.97921515 4.069991112 1.70732689 3.40557671 4.3567214
		 1.57110238 3.1872406 4.31417465 2.037955999 3.18648624 4.098966122 1.34527969 3.58340263 4.57415867
		 0.83851379 3.51683855 4.7013793 1.2277565 3.35880804 4.51568699 -2.73851371 3.51683855 4.7013793
		 -3.1277566 3.35880804 4.51568699 -3.60732698 3.40557671 4.3567214 -3.47110248 3.1872406 4.31417465
		 -3.93795609 3.18648624 4.098966122 -3.24527979 3.58340263 4.57415867 -0.94999999 4.056236744 5.13436842
		 -0.94999999 3.81146145 5.048804283 0.93495816 3.7477169 4.77355766 0.0092955232 3.97537994 5.035481453
		 -0.03319329 3.73344326 4.95526695 0.48504943 3.87501335 4.92033768 0.41323978 3.63846302 4.84387875
		 -0.48795569 4.03038311 5.10270977 -0.51019686 3.78708935 5.019751549 -2.83495808 3.7477169 4.77355766
		 -1.90929556 3.97537994 5.035481453 -1.86680675 3.73344326 4.95526695 -2.38504934 3.87501335 4.92033768
		 -2.31323981 3.63846302 4.84387875 -1.41204429 4.03038311 5.10270977 -1.38980317 3.78708935 5.019751549
		 0.071222603 1.067020297 -3.024793625 0.21317929 1.15610898 -2.81415367 0.32269603 1.44775808 -2.57743502
		 0.36967498 2.053826809 -2.27089071 0.31652659 2.53991795 -2.082708359 0.26479429 2.79389238 -2.071132183
		 0.22020251 3.073133945 -2.17530489 0.21813589 3.2747221 -2.37022972 0.23993045 3.38921928 -2.67388439
		 0.27319187 3.3799305 -2.930161 0.29741734 3.25011158 -3.17120934 0.3006348 3.011968136 -3.37433481
		 0.25458097 2.65231371 -3.577775 0.16461736 2.26165771 -3.76283789 0.021412313 1.92455375 -3.88886213
		 -0.079708397 1.72635329 -3.89736652 -0.18467569 1.53184807 -3.82052898 -0.25128824 1.35964739 -3.68630981
		 -0.26301086 1.24165642 -3.53726435 -0.19607049 1.13599765 -3.35212517 -0.077535033 1.07351625 -3.19151306
		 -2.1640923 -1.35317159 -2.047316551 -2.22767591 -1.57546258 -1.60910439 -2.04564333 -2.1196928 -1.17057586
		 -1.88890564 -2.32605648 -1.060177684 -1.63267827 -2.53360891 -0.94619429 -1.34689581 -2.66996288 -0.86614192
		 -0.95066237 -2.73083019 -0.8215338 -0.55442888 -2.66996288 -0.86614192 -0.26864636 -2.53360891 -0.94619429
		 -0.012419038 -2.32605648 -1.060177684 0.14431858 -2.1196928 -1.17057586 0.32635128 -1.57546258 -1.60910439
		 0.26276755 -1.35317159 -2.047316551 0.090622433 -1.28662205 -2.41389084 -0.17866606 -1.31428552 -2.7228415
		 -0.5446496 -1.37014627 -2.93962336 -0.95066237 -1.38818097 -3.029106855 -1.35667515 -1.37014627 -2.93962336
		 -1.72265863 -1.31428552 -2.7228415 -1.99194717 -1.28662205 -2.41389084 -2.174227 -1.82655621 -1.36623788
		 0.27290237 -1.82655621 -1.36623788 -0.49395511 -1.56367922 -3.25354815 -0.082275026 -1.50084376 -3.0096991062
		 0.22063661 -1.46972609 -2.66217279 -0.95066237 -1.58396578 -3.35420418 -1.40736961 -1.56367922 -3.25354815
		 -1.8190496 -1.50084376 -3.0096991062 -2.12196136 -1.46972609 -2.66217279 0.41427565 -1.54458523 -2.24982834
		 0.48579848 -1.79463112 -1.75690138 -0.95066237 -3.094256878 -0.87099528 -0.47777006 -3.025790215 -0.92117333
		 0.10472942 -2.63894367 -1.13943589 -0.18349028 -2.87241077 -1.011220694;
	setAttr ".vt[830:995]" 0.28103721 -2.40681362 -1.26361859 0.42567587 -2.077075958 -1.48371041
		 -2.3156004 -1.54458523 -2.24982834 -2.38712311 -1.79463112 -1.75690138 -1.42355466 -3.025790215 -0.92117333
		 -2.006054163 -2.63894367 -1.13943589 -1.71783447 -2.87241077 -1.011220694 -2.18236184 -2.40681362 -1.26361859
		 -2.32700062 -2.077075958 -1.48371041 -0.16678584 1.079443336 -3.62076712 -0.078500628 1.42707336 -3.94176245
		 0.19100338 0.90385687 -3.0091443062 -0.09999454 0.95895016 -3.40247631 0.032990575 0.89703691 -3.21213913
		 -0.15610158 1.21633637 -3.79045153 0.34870058 1.018301606 -2.76910925 0.47451144 1.35172856 -2.51940489
		 0.042454123 1.66052353 -3.99244308 0.15260535 1.87907493 -3.96340275 0.30849713 2.24721193 -3.83278704
		 0.40632558 2.67786717 -3.62309241 0.45591396 3.062217712 -3.41162586 0.4149223 2.82193899 -1.96691942
		 0.36799091 3.13448858 -2.083508968 0.46881264 2.53996277 -1.98159027 0.45381218 3.32278824 -3.1893034
		 0.42779964 3.46801615 -2.92530584 0.35710651 3.35206318 -2.30928802 0.52557617 2.0086345673 -2.18760967
		 0.39157492 3.47730875 -2.64305735 0.18498702 5.90164804 -5.08643198 0.19634499 5.4630065 -5.51963282
		 -2.052485704 5.57709694 -5.65075684 -2.070343256 5.95763683 -5.17407513 -2.026452065 6.18385506 -4.57822704
		 1.13019085 0.069742315 -1.081692696 1.5120523 -0.90021276 -0.73424768 1.12820137 -0.61519289 -1.21857154
		 1.30740678 -0.42730391 -0.91399801 1.45198393 -0.27341503 -0.66757977 1.15102816 -0.2284286 -0.34116006
		 1.092383385 -0.28899193 -0.35329026 1.29922676 -1.11101913 -0.98596019 0.32652587 -1.44699669 -1.8283627
		 0.48187333 -1.65183258 -2.0044140816 0.69682848 -1.4567498 -1.90554225 0.83379698 -1.11388695 -1.73788798
		 0.96663457 -0.84474862 -1.50570691 -2.22111559 -1.45655799 -1.80047297 -2.37692404 -1.66300571 -1.97334754
		 -2.60966587 -1.48757339 -1.87566423 -2.78705215 -1.15188408 -1.68920875 -2.97008252 -0.8776648 -1.47393751
		 -3.31929851 -0.43900228 -0.9065187 -3.0051574707 -0.32867771 -0.34631646 -3.063621283 -0.26519459 -0.33437777
		 -3.36670017 -0.31429935 -0.66130328 -3.41861439 -0.89803874 -0.73068774 -3.21484971 -1.09710741 -0.96970963
		 -3.14148784 -0.66515732 -1.21948147 0.42811257 2.49145675 -1.38477731 0.79113138 1.5021143 -0.86314774
		 0.72467124 1.48553181 -1.3327086 -2.52638888 -0.36194158 -2.28457212 -2.45492816 -0.84438664 -2.37917376
		 -2.43333483 -1.2730608 -2.44993162 -2.23991179 -1.48597383 -2.45273829 -2.098995447 -1.29865527 -2.22767186
		 -3.010389328 0.66323632 -0.78921694 -3.069556236 0.45087647 -1.29774809 -2.95344806 0.20474395 -1.802688
		 -2.66897321 -0.084801055 -2.22260523 0.42846647 3.59704518 -3.92848611 0.41127253 4.11489201 -4.36452103
		 0.36941749 4.61628342 -4.77383614 0.30133387 5.068723202 -5.13631105 0.39436001 4.080587387 -3.42796278
		 0.37115842 4.60733461 -3.88023329 0.33120221 5.085727215 -4.30439615 0.26693055 5.51136541 -4.68181849
		 0.41056827 3.73181629 -3.13807583 0.43958038 3.54089522 -3.41454625 0.4396961 3.28735065 -3.6419487
		 0.40592283 2.92752886 -3.87708521 -0.94856524 -2.68947649 -2.046406269 -0.30660462 -2.56566906 -2.025243759
		 -1.59488571 -2.56534529 -2.02563715 -1.8955456 -2.50189066 -1.77208281 -1.57473099 -2.63779044 -1.79114461
		 -0.94788665 -2.74836493 -1.80005538 -0.32547668 -2.63760376 -1.7915014 -0.00462936 -2.50255799 -1.77208018
		 -1.85441804 -2.3514967 -2.49780989 -1.55691326 -2.49538112 -2.54797864 -0.94926751 -2.61422229 -2.5923779
		 -0.34469283 -2.49581718 -2.54770184 -0.046506543 -2.35112357 -2.49756837 -0.64295876 -2.58097339 -2.5798738
		 -0.62423337 -2.65431619 -2.040236235 -0.6358344 -2.71803069 -1.79804921 -1.25736654 -2.58089828 -2.57987022
		 -1.27610826 -2.65466571 -2.040318727 -1.26568162 -2.71805429 -1.79847443 -1.91807306 -2.41525364 -1.99171352
		 0.017904524 -2.41505146 -1.99209511 0.0044548605 -2.3636961 -2.23584461 -0.31242374 -2.517694 -2.27598524
		 -0.62909776 -2.60875273 -2.29804945 -0.94777358 -2.6448071 -2.30663991 -1.2732619 -2.60841894 -2.29840803
		 -1.58557069 -2.51882243 -2.27570558 -1.90568447 -2.36357975 -2.23602676 -0.13005176 -2.36987257 -2.77298069
		 -0.39361483 -2.49428391 -2.84731841 -0.6646384 -2.56973243 -2.89363408 -0.94900453 -2.59727573 -2.90987349
		 -1.23655283 -2.56946349 -2.89369607 -1.50655699 -2.49429607 -2.84740639 -1.77130771 -2.36997986 -2.77350998
		 -1.53610528 -2.72648549 -1.5627892 -1.24320889 -2.79730272 -1.55826235 -0.948816 -2.82162952 -1.55647314
		 -0.65698987 -2.79692507 -1.55826807 -0.36474213 -2.72679758 -1.56229126 -0.064772837 -2.61181283 -1.55854774
		 -1.83519518 -2.6111176 -1.55849862 -1.74468386 -2.72236586 -1.35336363 -1.48474896 -2.82700205 -1.3319515
		 -1.21208632 -2.89216661 -1.31143749 -0.94894153 -2.91259074 -1.30442023 -0.68832815 -2.89205647 -1.31108797
		 -0.41560555 -2.82697082 -1.33180737 -0.15609033 -2.72306299 -1.35233819 -0.68208849 -2.55298638 -3.24851966
		 -0.45547402 -2.4910934 -3.18265986 -2.10975957 -2.4184804 -1.52646804 -2.1897223 -2.28513527 -1.71615446
		 -2.1366334 -2.13522005 -2.43225336 -2.024733782 -2.18614268 -2.66905713 -1.44457531 -2.49116945 -3.18265104
		 -1.21790671 -2.55298615 -3.2485199 -1.64942038 -2.3927784 -3.071840763 -0.95009756 -2.57565308 -3.2696228
		 0.32254881 -2.18730879 -1.92172205 0.29018098 -2.28489995 -1.71576381 0.30638513 -2.13253093 -2.16947865
		 -2.2225368 -2.18727255 -1.92171955 -2.20648074 -2.1326232 -2.16951323 0.23565839 -2.13608909 -2.4317925
		 -0.25173897 -2.39366913 -3.070705891 0.12437698 -2.18567061 -2.66896987 -0.038947914 -2.27807498 -2.88650584
		 -1.86223865 -2.27737164 -2.88778853 0.082209662 -2.56723499 -1.36199188 -0.093455285 -2.71906137 -1.2273649
		 -0.25933915 -2.82640266 -1.14620054 -0.95001912 -3.0052587986 -1.022349119 -1.17225063 -2.98719358 -1.033363938
		 -0.72754568 -2.98715973 -1.032901764 -1.43042886 -2.92167664 -1.080307364 -0.46958402 -2.92161965 -1.080256224
		 0.21021821 -2.4182713 -1.52601624 -1.98492646 -2.56485558 -1.36300075 -1.64017272 -2.82677794 -1.14786208
		 -1.80799723 -2.71845245 -1.22637236 -0.22390983 -2.78800249 -1.078587413;
	setAttr ".vt[996:1161]" -0.030077506 -2.65130377 -1.17791903 -0.44664294 -2.89410353 -1.0060787201
		 -0.69227678 -2.96125627 -0.96163607 -0.94999957 -2.9858973 -0.94839883 0.12724121 -2.50050449 -1.30746686
		 -0.43670014 -2.4294405 -3.23613834 -0.6993559 -2.50020623 -3.31748319 -0.21069151 -2.31624532 -3.09847188
		 -0.94999957 -2.5223999 -3.33695889 -0.0086386623 -2.20204806 -2.91480088 0.15237941 -2.1014328 -2.68836594
		 -1.4533757 -2.89410162 -1.006067276 -1.20772457 -2.96125603 -0.96163476 -1.6761061 -2.78810644 -1.078645349
		 -1.86994874 -2.65141106 -1.17800701 -2.027474642 -2.49927616 -1.30677354 -2.14511204 -2.35433722 -1.47308052
		 -2.22241664 -2.21311808 -1.67046487 -2.16388679 -2.0496099 -2.43944192 -2.23190641 -2.043451786 -2.17327833
		 -2.052406311 -2.10149884 -2.68836522 -1.89141715 -2.20202804 -2.91486001 -2.2529192 -2.10355091 -1.89569461
		 -1.46333504 -2.42949915 -3.23612785 -1.68936574 -2.31622815 -3.098541021 -1.20064259 -2.50020719 -3.31748271
		 0.2451285 -2.35436487 -1.47309721 0.32242855 -2.21314502 -1.67047715 0.26387563 -2.049565554 -2.4394424
		 0.33190277 -2.043432713 -2.17327595 0.35292029 -2.10355163 -1.89569426 -1.47712648 -2.71163964 -0.90743393
		 -1.7066319 -2.57139516 -0.97178841 -1.89754558 -2.40516758 -1.062751651 -2.047161102 -2.20936537 -1.17144561
		 -2.15408993 -2.014706373 -1.3148272 -2.23294711 -1.78697908 -1.5360328 -2.25639749 -1.61091232 -1.76323628
		 -2.23108578 -1.47454715 -2.0090489388 -2.15415072 -1.38213468 -2.25669098 -2.019331932 -1.3276782 -2.50342369
		 -1.84239161 -1.30631065 -2.71596098 -1.62846267 -1.31331086 -2.89293361 -1.38217378 -1.32367206 -3.033307791
		 -1.123734 -1.338732 -3.11422229 -0.94999957 -1.33969569 -3.1278441 -1.2192229 -2.78961253 -0.8613925
		 -0.94999957 -2.81764531 -0.84674358 -0.42287213 -2.71163917 -0.90743393 -0.19336666 -2.5713954 -0.97178853
		 -0.0024538373 -2.40516782 -1.062752008 0.14716187 -2.20936489 -1.17144573 0.25409067 -2.014706373 -1.3148272
		 0.33294806 -1.78697908 -1.5360328 0.35639861 -1.61091232 -1.76323628 0.33108678 -1.47454715 -2.0090491772
		 0.25415164 -1.38213491 -2.25669122 0.11933296 -1.32767844 -2.50342321 -0.057607949 -1.30631089 -2.71596122
		 -0.27153599 -1.3133111 -2.89293337 -0.51782471 -1.32367229 -3.033307552 -0.77626443 -1.33873224 -3.11422205
		 -0.68077642 -2.78961277 -0.8613925 -1.42957377 -1.95824671 -3.20939589 -1.16830564 -2.0027594566 -3.28987074
		 -1.65902436 -1.88771939 -3.070267439 -1.86105359 -1.81426811 -2.89087486 -2.034217834 -1.76377392 -2.65977621
		 -2.15420485 -1.75161695 -2.41185713 -2.22575998 -1.78584218 -2.15409636 -0.94999963 -2.014184713 -3.30739141
		 -0.73169345 -2.0027594566 -3.28987122 -0.47042468 -1.95824671 -3.20939589 -0.24097478 -1.88771915 -3.070267677
		 -0.038945019 -1.81426835 -2.89087462 0.13421854 -1.76377416 -2.65977645 0.25420552 -1.75161743 -2.41185713
		 0.32576081 -1.78584218 -2.1540966 -2.1340003 -2.3894875 -1.49845195 -2.21340752 -2.25169039 -1.69294012
		 -2.24546051 -2.14797139 -1.90865731 -2.22711682 -2.090526342 -2.17134786 -2.15753865 -2.094698429 -2.43757582
		 -2.04497385 -2.14643002 -2.68147087 -1.88190496 -2.24241495 -2.90525293 -1.67217875 -2.35816884 -3.090538263
		 -1.45652258 -2.46380806 -3.21389008 -1.21239305 -2.52997923 -3.28702545 -0.95005548 -2.55261087 -3.30757761
		 -0.68760353 -2.52997875 -3.28702593 -0.44352099 -2.4637394 -3.21389961 -0.22850788 -2.35868454 -3.089860439
		 -0.018796399 -2.24282455 -2.90449524 0.14475849 -2.14613175 -2.68142104 0.25697735 -2.095175028 -2.43731284
		 0.32706049 -2.090465069 -2.17132711 0.34546787 -2.14799213 -1.9086585 0.31367451 -2.25156832 -1.6927228
		 0.23426922 -2.38938022 -1.49820161 0.10971332 -2.53823924 -1.332232 -0.059265878 -2.69076777 -1.19880402
		 -0.23862083 -2.81175208 -1.10908532 -0.45591688 -2.9124465 -1.039772153 -0.71044672 -2.97918868 -0.99333149
		 -0.95001078 -3.00028371811 -0.9815256 -1.18943763 -2.97920752 -0.99359429 -1.44409871 -2.91247869 -1.039796591
		 -1.66110778 -2.81201172 -1.11005867 -1.84157431 -2.69046736 -1.1982764 -2.011365414 -2.53634477 -1.33250451
		 -0.9500553 0.37676346 -0.4576056 -1.95531893 0.36368525 -0.44174278 -0.58002937 -2.62432885 0.11980456
		 -0.099992335 -2.32855368 0.068957493 -1.19210517 -2.65023041 0.12382901 -1.93735468 -2.50734711 0.10706151
		 0.17010444 -1.89595032 -0.011533201 -1.70109105 1.59302866 -0.61691272 -0.95005536 1.58993113 -0.62347567
		 -0.95005536 0.90554821 -0.54356003 -1.86421907 0.89967549 -0.53078902 -0.1990211 1.59304059 -0.61691391
		 -0.4253456 2.98892975 -0.72547078 -0.58800697 3.074878216 -0.71922994 -0.79843986 3.1281352 -0.71498287
		 -0.95017546 3.14194965 -0.71392071 -1.1023761 3.12710094 -0.71510684 -1.31416082 3.07740736 -0.71906066
		 -1.47990656 2.98730612 -0.72569811 -1.64772952 2.84949398 -0.73288238 -1.78687298 2.67886925 -0.73822689
		 -1.95960712 2.42512941 -0.74056673 -2.12754273 2.10083675 -0.73111987 -2.33786845 1.60742056 -0.69184434
		 -2.60617805 0.8932339 -0.59631014 -2.82609057 0.26768947 -0.48756874 -3.048547268 -0.38137317 -0.36888903
		 -3.12802052 -0.65728891 -0.31765246 -3.17572737 -0.92595422 -0.26717341 -3.18448329 -1.14863753 -0.22475864
		 -3.16891074 -1.3714664 -0.18192124 -3.12947917 -1.59222698 -0.13920881 -3.066605091 -1.80842578 -0.097318314
		 -2.93025661 -2.1152761 -0.038235001 -2.75376225 -2.40215158 0.016033575 -2.57524061 -2.61438751 0.054819927
		 -2.37113547 -2.80305529 0.087506413 -2.15063477 -2.96193957 0.11298066 -1.91843033 -3.090933323 0.13162798
		 -1.67789984 -3.19032335 0.14347959 -1.34119344 -3.27495956 0.15156466 -0.95084172 -3.31390524 0.15421268
		 -0.68737555 -3.29803514 0.15334246 -0.3258788 -3.22074747 0.14647338 0.017674506 -3.091262341 0.13125214
		 0.25050658 -2.96204185 0.11290962 0.47100443 -2.80312085 0.087377489 0.67559129 -2.61398053 0.054560333
		 0.91556448 -2.30883431 -0.001642704 1.10037279 -1.97505498 -0.06528312 1.19384909 -1.7166959 -0.1152576
		 1.25801325 -1.42258763 -0.17210951 1.28445148 -1.11935151 -0.23041965 1.26372337 -0.84334576 -0.28280461
		 1.1924417 -0.51315457 -0.3446793 0.95188659 0.19333863 -0.47441006;
	setAttr ".vt[1162:1327]" 0.44099873 1.59824502 -0.69019854 0.2485612 2.054543972 -0.72853088
		 0.072268426 2.39281464 -0.73896694 -0.11207586 2.68049479 -0.73861074 -0.25165749 2.84969854 -0.73279691
		 0.6755895 -2.59544086 0.14769238 0.47100168 -2.78458738 0.18047917 0.2505036 -2.94351721 0.20596573
		 0.0176723 -3.072780132 0.22408688 -0.32587987 -3.20227814 0.23924235 -0.68737566 -3.2795825 0.24602565
		 -0.95084161 -3.29547024 0.24680558 -1.34119368 -3.25650692 0.24424833 -1.67789996 -3.1718626 0.23620278
		 -1.91842532 -3.072399616 0.22473094 -2.57523775 -2.59582615 0.14806375 -2.15063024 -2.94339609 0.20613593
		 -2.37113166 -2.78450227 0.18070865 1.10037255 -1.95650709 0.027885914 0.91556364 -2.29028893 0.09151566
		 -2.75376058 -2.38359141 0.10926911 -3.066604614 -1.78985775 -0.0040478706 -2.93025565 -2.096708536 0.05503431
		 1.25801253 -1.40403581 -0.078920677 1.28445148 -1.10079479 -0.1372028 -3.12947893 -1.57366145 -0.045951329
		 -3.1689105 -1.35290432 -0.088679984 -3.18448329 -1.13007283 -0.13150181 -3.17572784 -0.90738267 -0.17387955
		 1.19244337 -0.4945758 -0.25134283 -3.12802148 -0.63870227 -0.22427717 -3.048548698 -0.36277503 -0.27545065
		 -2.33788633 1.62605989 -0.59799063 -0.11191349 2.69911623 -0.64391023 -0.25149214 2.86850977 -0.63745451
		 0.0723297 2.41147184 -0.64470071 -0.79837751 3.14750004 -0.61766088 -0.58768368 3.094049454 -0.62227523
		 -0.42479187 3.0077037811 -0.62924963 -1.10243881 3.14646578 -0.6177851 -0.9501816 3.1613431 -0.61651403
		 -1.31462252 3.096529484 -0.62207687 -1.95969152 2.4437623 -0.6462388 -2.12759447 2.11944771 -0.63706875
		 -1.78709054 2.69743538 -0.6434406 -1.64792299 2.86827564 -0.63752627 -1.47972035 3.006570816 -0.62959951
		 0.24859709 2.073184967 -0.63450426 0.44101793 1.61688912 -0.59630764 0.9518885 0.21193731 -0.38096374
		 1.26372313 -0.82477725 -0.18952522 1.19384861 -1.6981504 -0.022101715 -2.82609296 0.28629494 -0.39408207
		 -2.60618424 0.91185153 -0.50270879 -1.020712495 -0.99559432 0.17113605 -1.49017167 -1.61592174 0.29070458
		 -1.2619226 -1.46823239 0.2622374 -1.036844492 -0.72765273 0.11949015 -1.33309042 -0.28621495 0.034402683
		 -1.57747197 -0.1659627 0.011224061 -2.11492801 -0.19716316 0.017237961 -2.34317732 -0.34485251 0.045705155
		 -2.56825519 -1.085432172 0.18845239 -2.58438778 -0.81749046 0.1368064 -2.27200961 -1.52686977 0.27353978
		 -2.027627945 -1.64712203 0.29671845 -1.84900117 -0.13503534 0.0052627623 -2.50621891 -0.56028986 0.087230861
		 -2.45976758 -1.33179688 0.23593938 -1.75609851 -1.67804956 0.30267978 -1.098881006 -1.25279498 0.22071168
		 -1.14533234 -0.4812879 0.072003186 -1.12208295 -0.9916566 0.12943718 -1.53067374 -1.53155422 0.23350275
		 -1.33201861 -1.40301394 0.20872653 -1.13612378 -0.75845551 0.084487453 -1.39395881 -0.37425321 0.010432184
		 -1.60665488 -0.26959246 -0.0097412318 -2.074426174 -0.29674757 -0.0045070499 -2.2730813 -0.42528796 0.020269185
		 -2.46897626 -1.069846392 0.14450827 -2.48301697 -0.83664513 0.099558592 -2.21114087 -1.45404863 0.21856338
		 -1.99844503 -1.55870938 0.2387369 -1.84297848 -0.24267517 -0.014929548 -2.41498351 -0.61279237 0.056410819
		 -2.37455463 -1.28426826 0.18583825 -1.7621212 -1.58562684 0.24392515 -1.19011629 -1.21550941 0.17258486
		 -1.23054504 -0.54403359 0.043157503 -2.58893299 -1.16222227 -0.1839446 -2.60550117 -0.88704491 -0.23698521
		 -2.52522159 -0.6228987 -0.28789955 -2.35777688 -0.40164328 -0.33054674 -2.12336373 -0.2499657 -0.35978267
		 -1.85025573 -0.18616024 -0.37208125 -1.57139373 -0.21792263 -0.36595899 -1.3204124 -0.34142226 -0.34215438
		 -1.12758422 -0.54176313 -0.3035385 -1.016166568 -0.79478103 -0.25476915 -0.99959928 -1.069958329 -0.20172842
		 -1.079878569 -1.33410466 -0.15081418 -1.24732304 -1.55536008 -0.10816704 -1.48173594 -1.70703769 -0.078931101
		 -1.75484395 -1.77084315 -0.066632524 -2.033706188 -1.73908043 -0.0727548 -2.28468728 -1.6155808 -0.096559428
		 -2.47751546 -1.41524005 -0.1351752 -1.15808213 -0.12269902 -0.36157757 -1.49431348 0.04052484 -0.3897911
		 -1.86583126 0.078666329 -0.39016014 -2.22547793 -0.010417104 -0.36475325 -2.53069496 -0.2130509 -0.31880665
		 -2.74816322 -0.50371015 -0.25982964 -2.85336208 -0.84936273 -0.19339681 -2.83314586 -1.21017444 -0.1257222
		 -2.68935275 -1.54382253 -0.06472151 -2.43863106 -1.81152558 -0.018589482 -2.10906959 -1.98083615 0.0072840303
		 -1.73899221 -2.02907896 0.010301024 -1.37384212 -1.94775724 -0.0094174445 -0.83561039 -1.45032144 -0.10700033
		 -1.059694767 -1.74630439 -0.049872734 -0.72870445 -1.096715689 -0.17452179 -0.75083077 -0.728701 -0.24549706
		 -0.89981878 -0.39030272 -0.31075871 0.7154668 0.88505185 -0.4977845 0.71546072 0.86642241 -0.59144568
		 -0.93949598 2.095654011 -0.65577531 -0.94948989 2.69855833 -0.65367138 0.25108653 -0.92720509 -0.20074639
		 0.0071130991 0.46696413 -0.467094 -0.95014668 1.84485972 -0.70384467 -1.41794217 2.40279818 -0.7042346
		 -1.36143208 2.55786991 -0.70420408 -1.25529337 2.68426085 -0.70413375 -1.11232662 2.7667284 -0.70403302
		 -0.53830606 2.55754852 -0.7035892 -0.78724813 2.76660252 -0.70379043 -1.36161768 2.082636833 -0.70416927
		 -1.11267459 1.87358248 -0.70396817 -1.25557685 1.95616233 -0.7040807 -0.48198152 2.23738718 -0.70352387
		 -0.78759706 1.8734566 -0.70372546 -0.64462936 1.95592391 -0.70362484 -0.53849161 2.082315445 -0.70355463
		 -1.41800666 2.23775148 -0.70422268 -0.48191661 2.4024334 -0.7035358 -0.94977617 2.79532528 -0.70391381
		 -0.64434636 2.6840229 -0.70367765 -0.48206067 2.23739529 -0.5973649 -0.78767622 1.87346447 -0.59756649
		 -0.64470851 1.95593154 -0.59746557 -0.53857076 2.082323074 -0.59739566 -0.95022577 1.84486783 -0.59768569
		 -1.11275375 1.87359059 -0.5978092 -1.255656 1.9561702 -0.59792173 -1.41808581 2.23775959 -0.59806371
		 -1.36169684 2.082644939 -0.59801036 -0.53838521 2.55755615 -0.59743023 -0.78732729 2.76661015 -0.59763128
		 -0.94985533 2.79533291 -0.59775472 -0.64442545 2.68403101 -0.59751868 -0.48199573 2.4024415 -0.59737682
		 -1.36151123 2.55787802 -0.59804487 -1.25537241 2.68426895 -0.5979749;
	setAttr ".vt[1328:1493]" -1.11240566 2.76673651 -0.59787405 -1.41802132 2.40280628 -0.59807587
		 -0.14904267 0.50237036 -0.11823142 0.24298102 0.10914135 -0.43373233 0.11618763 0.89565384 -0.54579663
		 0.34255058 0.61923265 -0.50876558 0.25395328 0.7771523 -0.53044879 0.37129241 0.44094503 -0.48336273
		 0.33671194 0.26379156 -0.45730382 -0.25327325 -0.059735656 -0.4028917 0.1014027 -0.0043540001 -0.4154909
		 -0.07094419 -0.063003898 -0.40478021 -0.42359197 0.0050573349 -0.41005334 -0.6499548 0.28147888 -0.44708449
		 -0.64411664 0.63691986 -0.49854624 -0.5503847 0.7915709 -0.52211785 -0.23646033 0.96371567 -0.55106986
		 -0.40880811 0.90506518 -0.54035902 -0.56135881 0.12356019 -0.42540139 -0.67869663 0.45976746 -0.47248751
		 -0.054132044 0.96044767 -0.55295837 -0.2600261 0.81335545 -0.20116211 -0.43962938 0.6693778 -0.17802154
		 -0.48349729 0.44464433 -0.1449638 -0.37110436 0.24431074 -0.11745694 -0.15504044 0.16211534 -0.10837176
		 0.06359607 0.23651826 -0.1219593 0.18250269 0.43270576 -0.15186185 0.1460411 0.65887892 -0.18408756
		 -0.028726518 0.80920947 -0.2035577 0.25503355 -0.88474858 0.11442652 0.65554482 -1.26383984 -0.20764926
		 0.50673801 -0.47993609 -0.31055132 0.74075192 -0.750471 -0.27785859 0.6477651 -0.59480119 -0.29731381
		 0.77448422 -0.92816722 -0.25453269 0.74489111 -1.1064589 -0.23014909 0.1642639 -1.44646597 -0.17555608
		 0.51721781 -1.38132894 -0.18974665 0.34659964 -1.44475389 -0.17860088 -0.0077921748 -1.38625813 -0.18097967
		 -0.24180627 -1.11572313 -0.2136723 -0.24594498 -0.75973523 -0.26138178 -0.15659761 -0.60235345 -0.28388169
		 0.15234691 -0.42143989 -0.31293005 -0.018273113 -0.48486549 -0.30178422 -0.14881963 -1.27139211 -0.19421721
		 -0.27553743 -0.93802589 -0.23699838 0.33468109 -0.41972774 -0.31597489 0.13512129 -0.57604539 0.035495892
		 -0.040356338 -0.72508955 0.058206588 -0.077896535 -0.95126677 0.089139089 0.040065348 -1.14874673 0.11381942
		 0.25833338 -1.22512543 0.12069967 0.47477907 -1.14466512 0.10656026 0.58812302 -0.94501334 0.07801716
		 0.54533237 -0.71959054 0.0484263 0.36642712 -0.5738734 0.031633258 0.08239571 0.90121132 -0.2723352
		 0.11875382 0.92430383 -0.34762233 -0.051566243 0.98909765 -0.35478392 -0.045348119 0.94980806 -0.27770665
		 0.29586357 0.65630919 -0.23969448 0.34511685 0.6478824 -0.31059164 0.25651899 0.80580252 -0.33227426
		 0.22941144 0.77475369 -0.25595713 0.37385878 0.46959558 -0.28518859 0.32653505 0.46605262 -0.21258642
		 0.30059883 0.33317944 -0.19304147 0.33927757 0.29244119 -0.25913 0.24554731 0.13779159 -0.23555832
		 0.20057634 0.16814703 -0.16788775 0.094385915 0.08301916 -0.1542061 0.10396842 0.024295894 -0.21731736
		 -0.06837704 -0.034353882 -0.20660642 -0.0895302 0.020431785 -0.14277631 -0.22628723 0.022883032 -0.14135991
		 -0.25070739 -0.031085556 -0.20471804 -0.40803877 0.092025697 -0.14900227 -0.42102483 0.033707235 -0.2118797
		 -0.51137012 0.1809094 -0.16051388 -0.55879211 0.15221041 -0.22722742 -0.60591483 0.34942961 -0.18365252
		 -0.6473884 0.3101286 -0.24891081 -0.62747115 0.48315424 -0.20270546 -0.67613018 0.48841783 -0.2743133
		 -0.64155006 0.6655696 -0.30037236 -0.59056866 0.67219955 -0.2305135 -0.52026594 0.78819281 -0.24819249
		 -0.54781848 0.82022119 -0.32394338 -0.23991722 0.95329571 -0.27569139 -0.23389418 0.9923659 -0.35289544
		 -0.40624139 0.93371516 -0.34218484 -0.36918297 0.90930659 -0.26765814 0.47456962 -0.47816557 -0.036843523
		 0.50980216 -0.45330471 -0.11210342 0.337744 -0.39309612 -0.11752681 0.34552118 -0.43300793 -0.040911168
		 0.6948095 -0.71749955 -0.0081257196 0.74381626 -0.72383976 -0.079410888 0.65082878 -0.5681693 -0.098865755
		 0.62506473 -0.60074222 -0.022717396 0.7775476 -0.90153521 -0.05608486 0.73080587 -0.90712506 0.016765958
		 0.70861042 -1.040851355 0.03505436 0.74795491 -1.079827547 -0.031701535 0.65860897 -1.23720801 -0.0092016617
		 0.61326647 -1.20879805 0.059064515 0.50951505 -1.29692066 0.07249216 0.52028161 -1.35469747 0.0087007787
		 0.34966293 -1.41812217 0.019846622 0.32744271 -1.36460352 0.08438617 0.1906822 -1.36588776 0.086669922
		 0.16732767 -1.41983438 0.022891426 0.0070757652 -1.30163789 0.0808824 -0.0047279657 -1.35962677 0.017467869
		 -0.098701194 -1.21548247 0.070953764 -0.1457559 -1.24476016 0.0042305556 -0.19793016 -1.049362898 0.050192576
		 -0.23874196 -1.089091778 -0.0152248 -0.22322907 -0.91608274 0.032697499 -0.2724739 -0.911394 -0.038550477
		 -0.24288145 -0.73310387 -0.062934056 -0.19164972 -0.72582257 0.0066772611 -0.12463537 -0.60778147 -0.010198087
		 -0.15353428 -0.57572162 -0.08543364 0.15094653 -0.43483484 -0.037661936 0.15541106 -0.39480805 -0.11448204
		 -0.015209349 -0.45823398 -0.1033363 0.02297608 -0.48240575 -0.029302385 -1.20183396 -0.163578 -0.26258248
		 -0.9611972 -0.41304904 -0.21506824 -0.82233459 -0.72843891 -0.15425026 -0.80170625 -1.071435332 -0.088107318
		 -0.90142846 -1.40093982 -0.025072327 -1.11025167 -1.67678642 0.028154802 -1.40292478 -1.86479831 0.065613061
		 -1.74326873 -1.94132161 0.083395712 -2.088709354 -1.89740765 0.079642631 -2.39697576 -1.74036169 0.05444283
		 -2.63195658 -1.49081612 0.010443714 -2.76692319 -1.17898893 -0.047178552 -2.78611851 -0.84139466 -0.11084599
		 -2.68767715 -0.51785505 -0.17306451 -2.48381567 -0.24600132 -0.2276787 -2.19784045 -0.057103604 -0.26925546
		 -1.861624 0.025240913 -0.29130441 -1.5151031 -0.011097044 -0.28953731 -2.16625428 -0.97240698 0.29759851
		 -2.025664806 -1.18183291 0.33830667 -1.78082848 -1.25355518 0.3522481 -1.54630709 -1.15401423 0.33289933
		 -1.43183553 -0.92978632 0.28931382 -1.49097681 -0.68579018 0.24188578 -1.69605756 -0.53619426 0.21280724
		 -1.95111847 -0.5509963 0.21568441 -2.13681364 -0.72327006 0.24917114 -2.63595295 -1.17271864 -0.14724042
		 -2.31364036 -1.65284359 -0.053913638 -1.75233436 -1.81727266 -0.021951914 -1.21467578 -1.58906734 -0.06631048
		 -0.95224148 -1.075007439 -0.16623354 -1.08782661 -0.51562774 -0.27496597 -1.55799055 -0.1726675 -0.34163076
		 -2.14273715 -0.20660233 -0.33503449 -2.56845784 -0.60155332 -0.25826371;
	setAttr ".vt[1494:1659]" -2.39911819 -1.056689978 0.15436387 -2.1684351 -1.40032184 0.22115886
		 -1.76670158 -1.51800573 0.24403417 -1.38189375 -1.35467625 0.21228632 -1.19406581 -0.98675674 0.14077029
		 -1.29110599 -0.5864011 0.062948868 -1.62760782 -0.34094018 0.015235797 -2.046117783 -0.3652277 0.019956887
		 -2.35081124 -0.64789915 0.074902907 -2.13681364 -0.69102335 0.41506612 -1.95111847 -0.51874959 0.3815794
		 -1.69605756 -0.50394756 0.37870216 -1.49097681 -0.65354341 0.40778071 -1.43183553 -0.89753956 0.45520884
		 -1.54630709 -1.12176752 0.49879429 -1.78082848 -1.22130847 0.51814306 -2.025664806 -1.1495862 0.50420165
		 -2.16625428 -0.94016027 0.46349347 -2.41817117 -0.71801448 0.77914131 -2.47062421 -0.73872292 0.64075541
		 -2.45684552 -0.96749425 0.68521917 -2.40580058 -0.92893219 0.81990016 -2.35695291 -0.51556587 0.73955011
		 -2.40386152 -0.51912439 0.59806478 -2.22834325 -0.34617817 0.706864 -2.26461101 -0.33518177 0.56231487
		 -2.048848629 -0.22973073 0.68398976 -2.069668055 -0.20908517 0.53779912 -1.83943725 -0.18111032 0.67477834
		 -1.84254587 -0.15603942 0.52749312 -1.62565398 -0.20517135 0.67921579 -1.6106391 -0.18244624 0.53262115
		 -1.4334265 -0.30004656 0.69789696 -1.40191793 -0.28511679 0.55258334 -1.28538501 -0.45337933 0.72746223
		 -1.24155784 -0.45167196 0.58495343 -1.20028698 -0.64733684 0.76540303 -1.14889991 -0.66201878 0.62584603
		 -1.18725884 -0.85821623 0.80615431 -1.13512206 -0.89079005 0.67030948 -1.24910831 -1.060479999 0.84571004
		 -1.20188415 -1.11038864 0.71300054 -1.37718916 -1.23025346 0.87847137 -1.34113526 -1.29433107 0.74874997
		 -1.55704618 -1.34616053 0.90124094 -1.5360781 -1.42042792 0.77326572 -1.76630497 -1.39541054 0.91057491
		 -1.76319981 -1.47347355 0.78357148 -1.98001266 -1.37070656 0.9060123 -1.99510717 -1.44706678 0.77844357
		 -2.17253494 -1.27640975 0.88744342 -2.20382786 -1.344396 0.75848138 -2.32009721 -1.12263286 0.85779142
		 -2.36418819 -1.17784119 0.72611129 -2.40308762 -0.77499497 0.49520802 -2.39070272 -0.98062754 0.53517926
		 -2.30741668 -1.16970062 0.571931 -2.16327524 -1.31940937 0.60103142 -1.97566462 -1.41169691 0.61897016
		 -1.76721239 -1.43543196 0.62358379 -1.56306183 -1.38775218 0.61431587 -1.38783562 -1.2744081 0.59228432
		 -1.26266861 -1.10907042 0.56014597 -1.20265841 -0.91168123 0.52177709 -1.21504295 -0.70604885 0.48180652
		 -1.29832947 -0.51697564 0.44505411 -1.44247055 -0.36726683 0.41595364 -1.63008165 -0.27497935 0.39801478
		 -1.83853364 -0.25124437 0.39340115 -2.042684317 -0.29892409 0.40266919 -2.21791077 -0.41226828 0.42470109
		 -2.34307766 -0.57760584 0.4568398 -1.83021355 -0.32081625 0.77021694 -1.67012751 -0.33883423 0.77353972
		 -1.98702562 -0.35722461 0.77711475 -2.19014359 -1.025851488 0.90726161 -2.25432038 -0.88080376 0.87888759
		 -2.079645157 -1.14100337 0.92946577 -1.93547988 -1.21161485 0.94337058 -1.77545023 -1.23011422 0.94678712
		 -1.61875188 -1.19323421 0.93979764 -1.48407066 -1.10644042 0.92274725 -1.38816094 -0.97931004 0.8982147
		 -1.34184623 -0.82784981 0.86859459 -1.3516022 -0.66993821 0.83807886 -1.41532576 -0.5246982 0.809668
		 -1.52618277 -0.40987885 0.78752875 -2.12143588 -0.44442344 0.79424345 -2.21774197 -0.57126492 0.81871957
		 -2.26358366 -0.72286338 0.84836632 -1.82741821 -0.37749782 0.70376539 -1.683604 -0.39368439 0.70675027
		 -1.96829176 -0.41020548 0.70996189 -2.15076375 -1.010870218 0.8268801 -2.20841742 -0.88056582 0.80139023
		 -2.051496744 -1.11431766 0.84682727 -1.92198515 -1.1777519 0.85931885 -1.77822173 -1.19437087 0.86238825
		 -1.63745093 -1.1612395 0.85610902 -1.51645923 -1.083267808 0.8407917 -1.43029773 -0.96905953 0.81875283
		 -1.38869107 -0.83299434 0.79214334 -1.39745498 -0.69113356 0.76472944 -1.45470142 -0.56065637 0.73920649
		 -1.55429018 -0.45750773 0.71931732 -2.089039803 -0.48854107 0.72534961 -2.1755569 -0.60248983 0.74733794
		 -2.21673894 -0.73867917 0.7739712 -1.76070499 -0.42964053 0.7138201 -1.53730869 -0.53954393 0.73518306
		 -1.43814576 -0.7646904 0.778947 -1.50961518 -0.99973148 0.82463437 -1.71827555 -1.13468802 0.85086751
		 -1.96649265 -1.10641325 0.84537137 -2.13812327 -0.92813718 0.81071782 -2.15285873 -0.68327636 0.76312166
		 -2.0038046837 -0.48640481 0.72485411 0.20273602 1.41536307 -2.59332681 0.13309586 1.21024859 -2.72295809
		 0.224105 2.52811837 -2.060422659 0.21415341 3.077970505 -3.39415407 0.21335137 3.294312 -3.23508978
		 -0.07795608 1.93419993 -3.91340446 0.26410115 1.85390913 -2.36685133 0.23932755 1.62668014 -2.48256421
		 0.25878632 2.29225159 -2.15512896 0.26774323 2.062045097 -2.26468515 0.18089783 2.67321968 -3.59387159
		 0.02708447 2.1570704 -3.8373282 0.12222588 2.43785048 -3.70926857 0.7920267 2.12243724 -2.9324162
		 0.84518558 2.34913301 -2.80515194 0.57688844 1.30733705 -2.5984714 0.65812421 1.3606261 -2.66075897
		 0.43152988 1.12888443 -2.73481226 0.51273775 1.17993701 -2.79990816 0.6777643 1.51253569 -2.4800539
		 0.74679554 1.54173565 -2.55536366 0.67218059 1.96336961 -3.69130063 0.59298694 1.99842525 -3.79166245
		 0.5247975 1.75169122 -3.77592754 0.44620121 1.78906286 -3.87196636 0.81114876 1.78823173 -2.42592525
		 0.7392782 1.75766146 -2.35051107 0.79426706 2.21926355 -2.12052965 0.86465758 2.22430229 -2.20877504
		 0.84408969 2.025261879 -2.30392599 0.77070892 1.99207771 -2.232131 0.84538561 2.38926673 -3.48852134
		 0.78223264 2.46098852 -3.57037973 0.76010108 2.1566968 -3.60568428 0.69606149 2.2266345 -3.68679571
		 0.85852945 2.47033262 -2.1165452 0.78465831 2.46383882 -2.029819727 0.94852787 2.82413816 -3.25405741
		 0.89230764 2.91681528 -3.32426882 0.91103971 3.12445378 -3.15547729 0.96383095 3.0082638264 -3.10563827
		 0.88586181 2.71066165 -2.58503652 0.87498426 2.54731679 -2.68743014 0.86740738 3.050396681 -2.36594701
		 0.88264316 3.11433315 -2.47369099 0.13931954 3.082871914 -2.10340595 0.13200295 3.19676566 -2.18007112
		 0.78162897 3.041725397 -2.16975856 0.77638042 2.93172383 -2.09355998;
	setAttr ".vt[1660:1782]" 0.79684246 3.17405963 -2.31167388 0.8131336 3.24099278 -2.42561793
		 0.83873451 3.28892136 -2.57556057 0.85936153 3.30153322 -2.70691776 0.90127671 3.15252566 -2.58287168
		 0.92079157 3.16866469 -2.70672154 0.15142548 3.46961641 -2.58868837 0.1646415 3.48738694 -2.72000718
		 0.85123962 2.85618377 -2.18687654 0.85643256 2.95738244 -2.26181769 0.13107979 3.35059166 -2.33768082
		 0.13733494 3.42148447 -2.45125294 0.20371367 1.20956373 -3.47320557 0.26819104 1.27463341 -3.43244505
		 0.049003586 1.14079666 -3.52331448 0.11006439 1.0088583231 -3.17245913 0.066621669 1.039977431 -3.30368423
		 0.24493383 1.09202683 -3.17367315 0.21208075 1.12320864 -3.29387808 0.025295377 1.085035086 -2.89231777
		 -0.055930972 1.050157428 -3.016917229 0.18584907 0.99942237 -3.017965078 0.26966465 1.026468277 -2.89807892
		 0.23311819 1.33168972 -3.62391806 0.27767301 1.42411411 -3.70007229 0.090209849 1.2866118 -3.70393491
		 0.14523685 1.38611901 -3.78641081 0.37844971 1.1008296 -2.93930674 0.30395263 1.079347849 -3.047355413
		 -0.20234001 1.58057439 -3.89369106 -0.15514457 1.70638442 -3.927737 0.32343471 1.63822293 -3.89022899
		 0.23741615 1.5227505 -3.86456871 0.34863737 1.53182769 -3.76318955 0.42649648 1.63497329 -3.78690362
		 -0.28702533 1.32595968 -3.69994354 -0.26697338 1.42636311 -3.78965139 -0.26346281 1.19248521 -3.52866745
		 -0.16147983 1.061524868 -3.17595434 -0.22381675 1.093343258 -3.3120389 0.15650952 2.92212439 -2.036614895
		 0.17962277 2.76650596 -2.019623041 0.77928865 2.63148069 -2.010279179 0.77669609 2.77971268 -2.030998707
		 0.19707119 3.42401719 -3.053839445 0.18386471 3.4743495 -2.91447115 0.89973247 3.22718167 -3.014775991
		 0.88386047 3.28120041 -2.87725163 0.93994707 3.15792179 -2.83887577 0.95560956 3.11157227 -2.97034645
		 0.85099173 2.73947382 -2.13307905 0.85355771 2.60212374 -2.10765886 0.52995712 1.55415249 -3.24967957
		 0.43186373 1.4326998 -3.32515621 0.34572443 1.3432312 -3.38297749 0.88537967 2.8383038 -2.50115943
		 0.87852359 2.94511962 -2.43091989 0.63162965 1.71549881 -3.1563201 0.72007418 1.90591764 -3.051121712
		 0.20455138 1.15308869 -3.36925602 0.053132012 1.083993316 -3.41779041 -0.24832039 1.1365205 -3.42464447
		 0.21705414 1.27748454 -3.56631613 0.064926103 1.20731056 -3.61791563 -0.27992469 1.25282872 -3.61859703
		 0.89230824 3.053257227 -2.57115436 0.90394795 2.9846077 -2.67357492 0.90920937 2.88908887 -2.78304172
		 0.90249753 2.74849319 -2.90385723 0.8730377 2.54998207 -3.039142609 0.80690992 2.27705431 -3.19420385
		 0.72828227 2.047524691 -3.31645083 0.63718867 1.85034978 -3.41501617 0.52770978 1.67550325 -3.49585581
		 0.43021449 1.54649353 -3.54264069 0.34601656 1.44305909 -3.56256342 0.27234435 1.35117209 -3.56125689
		 0.85739881 2.83854914 -2.28532839 0.86165226 2.71178937 -2.31564307 0.86220473 2.56831741 -2.36830997
		 0.85475779 2.37931824 -2.45650053 0.82910109 2.17789102 -2.5611999 0.78427345 1.9567399 -2.67969847
		 0.71675879 1.7391336 -2.79887319 0.62793273 1.5520606 -2.90932322 0.5171681 1.39332271 -3.021045923
		 0.41022345 1.2877543 -3.12500262 0.325562 1.2243247 -3.21422529 0.26208144 1.18742728 -3.30135226
		 0.96651226 3.1830523 -2.97831368 0.97563767 3.074169874 -3.12181211 0.95899218 2.87650108 -3.28135681
		 0.84918046 2.41472602 -3.53037763 0.75909346 2.1691525 -3.65384936 0.66412896 1.96010697 -3.74698544
		 0.5087595 1.7371726 -3.83561277 0.40147707 1.60904503 -3.84826183 0.31815323 1.49843693 -3.82296181
		 0.24018288 1.38057184 -3.75417662 0.18683262 1.28204298 -3.67292166 0.16506812 1.2094866 -3.59556103
		 0.15267906 1.14980996 -3.50956297 0.15378568 1.096731305 -3.41634035 0.16426775 1.056532502 -3.3144803
		 0.20529248 1.023651719 -3.18607044 0.27000892 1.010754824 -3.048691034 0.3499569 1.034231305 -2.93298292
		 0.49565521 1.12109864 -2.78243923 0.64900231 1.31135762 -2.63607979 0.74432534 1.50592971 -2.52299619
		 0.81178659 1.76572835 -2.38645172 0.84631014 2.015359402 -2.25830078 0.86844438 2.22944093 -2.15551925
		 0.86146891 2.48873591 -2.058460474 0.8561663 2.63301659 -2.047520638 0.8534559 2.77949071 -2.073642492
		 0.85363442 2.90778327 -2.13167548 0.85912013 3.015819788 -2.21090722 0.87131917 3.11970925 -2.32629514
		 0.88754475 3.18758893 -2.44085288 0.90822327 3.22930503 -2.56200624 0.92897058 3.24580956 -2.69374466
		 0.94996107 3.23306823 -2.83875108;
	setAttr -s 5112 ".ed";
	setAttr ".ed[0:165]"  862 499 0 499 498 0 498 862 0 499 73 0 73 498 0 60 293 0
		 293 535 0 535 60 0 293 292 0 292 535 0 535 294 0 294 58 0 58 535 0 294 286 0 286 58 0
		 854 852 0 852 890 0 890 854 0 852 523 0 523 890 0 112 152 0 152 185 0 185 112 0 152 512 0
		 512 185 0 537 511 0 511 499 0 499 537 0 511 187 0 187 499 0 881 281 0 281 882 0 882 881 0
		 281 501 0 501 882 0 883 889 0 889 887 0 887 883 0 889 888 0 888 887 0 154 860 0 860 156 0
		 156 154 0 860 186 0 186 156 0 863 531 0 531 7 0 7 863 0 531 537 0 537 7 0 514 185 0
		 185 153 0 153 514 0 512 153 0 155 101 0 101 191 0 191 155 0 101 861 0 861 191 0 153 181 0
		 181 514 0 181 182 0 182 514 0 533 864 0 864 534 0 534 533 0 864 2 0 2 534 0 512 93 0
		 93 153 0 512 183 0 183 93 0 73 16 0 16 498 0 16 1 0 1 498 0 183 91 0 91 184 0 184 183 0
		 91 511 0 511 184 0 59 290 0 290 63 0 63 59 0 290 60 0 60 63 0 245 257 0 257 247 0
		 247 245 0 257 255 0 255 247 0 880 548 0 548 881 0 881 880 0 548 281 0 282 244 0 244 157 0
		 157 282 0 244 865 0 865 157 0 867 877 0 877 137 0 137 867 0 877 113 0 113 137 0 286 284 0
		 284 58 0 284 288 0 288 58 0 550 248 0 248 245 0 245 550 0 284 287 0 287 288 0 284 285 0
		 285 287 0 891 892 0 892 246 0 246 891 0 892 145 0 145 246 0 250 282 0 282 251 0 251 250 0
		 282 891 0 891 251 0 246 253 0 253 891 0 253 251 0 182 111 0 111 513 0 513 182 0 111 515 0
		 515 513 0 111 552 0 552 515 0 552 516 0 516 515 0 295 60 0 290 295 0 59 283 0 283 290 0
		 240 242 0 242 293 0 293 240 0 242 292 0 236 283 0 283 235 0 235 236 0 283 898 0 898 235 0
		 236 238 0 238 283 0 238 290 0 498 510 0 510 862 0 177 175 0 175 540 0 540 177 0 175 545 0
		 545 540 0 524 685 0 685 490 0 490 524 0 685 693 0 693 490 0;
	setAttr ".ed[166:331]" 683 684 0 684 497 0 497 683 0 684 525 0 525 497 0 693 585 0
		 585 490 0 585 487 0 487 490 0 497 559 0 559 683 0 497 495 0 495 559 0 106 121 0 121 847 0
		 847 106 0 849 119 0 119 850 0 850 849 0 119 913 0 913 850 0 842 104 0 104 115 0 115 842 0
		 115 117 0 117 842 0 117 839 0 839 842 0 853 857 0 857 522 0 522 853 0 857 520 0 520 522 0
		 859 856 0 856 173 0 173 859 0 856 910 0 910 173 0 173 857 0 857 859 0 842 843 0 843 104 0
		 843 118 0 118 104 0 117 844 0 844 839 0 117 116 0 116 844 0 116 840 0 840 844 0 116 106 0
		 106 840 0 121 848 0 848 847 0 121 122 0 122 848 0 913 851 0 851 850 0 913 912 0 912 851 0
		 170 174 0 174 902 0 902 170 0 174 903 0 903 902 0 232 837 0 837 835 0 835 232 0 364 836 0
		 836 834 0 834 364 0 520 173 0 173 519 0 519 520 0 173 167 0 167 519 0 522 852 0 852 853 0
		 522 523 0 858 102 0 102 846 0 846 858 0 102 158 0 158 846 0 158 98 0 98 846 0 98 845 0
		 845 846 0 841 845 0 845 118 0 118 841 0 98 118 0 411 828 0 828 830 0 830 411 0 827 480 0
		 480 449 0 449 827 0 480 391 0 391 449 0 828 480 0 480 829 0 829 828 0 38 46 0 46 17 0
		 17 38 0 46 45 0 45 17 0 89 55 0 55 288 0 288 89 0 55 58 0 152 189 0 189 91 0 91 152 0
		 189 188 0 188 91 0 174 171 0 171 903 0 171 904 0 904 903 0 552 551 0 551 516 0 551 517 0
		 517 516 0 555 554 0 554 519 0 519 555 0 554 520 0 160 163 0 163 108 0 108 160 0 163 132 0
		 132 108 0 131 99 0 99 172 0 172 131 0 99 162 0 162 172 0 147 114 0 114 178 0 178 147 0
		 114 176 0 176 178 0 529 6 0 6 530 0 530 529 0 6 57 0 57 530 0 2 526 0 526 534 0 2 53 0
		 53 526 0 32 3 0 3 33 0 33 32 0 3 13 0 13 33 0 63 62 0 62 59 0 62 8 0 8 59 0 268 267 0
		 267 250 0 250 268 0 267 249 0;
	setAttr ".ed[332:497]" 249 250 0 239 243 0 243 278 0 278 239 0 243 279 0 279 278 0
		 238 241 0 241 290 0 241 295 0 207 196 0 196 311 0 311 207 0 196 313 0 313 311 0 202 334 0
		 334 215 0 215 202 0 334 336 0 336 215 0 343 210 0 210 342 0 342 343 0 210 304 0 304 342 0
		 349 311 0 311 346 0 346 349 0 311 208 0 208 346 0 320 205 0 205 355 0 355 320 0 205 352 0
		 352 355 0 363 361 0 361 335 0 335 363 0 361 226 0 226 335 0 167 518 0 518 519 0 167 169 0
		 169 518 0 387 425 0 425 376 0 376 387 0 425 424 0 424 376 0 382 371 0 371 444 0 444 382 0
		 371 442 0 442 444 0 458 457 0 457 420 0 420 458 0 457 392 0 392 420 0 464 465 0 465 386 0
		 386 464 0 465 427 0 427 386 0 383 470 0 470 436 0 436 383 0 470 471 0 471 436 0 407 406 0
		 406 447 0 447 407 0 406 446 0 446 447 0 544 542 0 542 86 0 86 544 0 542 84 0 84 86 0
		 404 586 0 586 451 0 451 404 0 586 558 0 558 451 0 643 646 0 646 396 0 396 643 0 646 435 0
		 435 396 0 646 642 0 642 435 0 592 587 0 587 416 0 416 592 0 587 403 0 403 416 0 327 211 0
		 211 668 0 668 327 0 211 661 0 661 668 0 310 628 0 628 220 0 220 310 0 628 626 0 626 220 0
		 488 580 0 580 489 0 489 488 0 580 561 0 561 489 0 598 599 0 599 595 0 595 598 0 599 596 0
		 596 595 0 636 637 0 637 640 0 640 636 0 637 641 0 641 640 0 576 577 0 577 582 0 582 576 0
		 577 583 0 583 582 0 625 607 0 607 624 0 624 625 0 607 604 0 604 624 0 563 566 0 566 565 0
		 565 563 0 566 567 0 567 565 0 198 725 0 725 305 0 305 198 0 725 714 0 714 305 0 192 768 0
		 768 323 0 323 192 0 768 770 0 770 323 0 378 418 0 418 695 0 695 378 0 418 701 0 701 695 0
		 746 749 0 749 373 0 373 746 0 749 438 0 438 373 0 617 731 0 731 629 0 629 617 0 731 728 0
		 728 629 0 617 727 0 727 731 0 617 621 0 621 727 0 736 738 0 738 635 0;
	setAttr ".ed[498:663]" 635 736 0 738 631 0 631 635 0 635 645 0 645 736 0 645 739 0
		 739 736 0 611 607 0 607 718 0 718 611 0 607 722 0 722 718 0 718 704 0 704 611 0 704 606 0
		 606 611 0 559 589 0 589 683 0 589 679 0 679 683 0 740 729 0 729 732 0 732 740 0 729 733 0
		 733 732 0 765 761 0 761 766 0 766 765 0 761 762 0 762 766 0 721 716 0 716 722 0 722 721 0
		 716 718 0 676 684 0 684 682 0 682 676 0 683 682 0 819 540 0 540 824 0 824 819 0 545 824 0
		 855 784 0 784 851 0 851 855 0 784 785 0 785 851 0 844 792 0 792 839 0 844 791 0 791 792 0
		 800 801 0 801 834 0 834 800 0 801 826 0 826 834 0 42 1 0 1 43 0 43 42 0 16 43 0 75 22 0
		 22 80 0 80 75 0 22 79 0 79 80 0 69 86 0 86 92 0 92 69 0 86 65 0 65 92 0 128 107 0
		 107 174 0 174 128 0 107 171 0 549 550 0 550 522 0 522 549 0 550 523 0 288 143 0 143 89 0
		 287 143 0 143 144 0 144 89 0 144 96 0 96 89 0 90 94 0 94 138 0 138 90 0 94 140 0
		 140 138 0 117 10 0 10 116 0 117 29 0 29 10 0 536 55 0 55 530 0 530 536 0 55 56 0
		 56 530 0 82 81 0 81 61 0 61 82 0 81 20 0 20 61 0 151 146 0 146 118 0 118 151 0 146 104 0
		 533 71 0 71 864 0 533 532 0 532 71 0 36 35 0 35 28 0 28 36 0 35 10 0 10 28 0 265 235 0
		 235 266 0 266 265 0 235 234 0 234 266 0 278 277 0 277 239 0 277 233 0 233 239 0 285 254 0
		 254 248 0 248 285 0 254 258 0 258 248 0 237 243 0 243 292 0 292 237 0 243 294 0 294 292 0
		 508 41 0 41 507 0 507 508 0 41 3 0 3 507 0 309 308 0 308 209 0 209 309 0 308 198 0
		 198 209 0 342 303 0 303 343 0 303 222 0 222 343 0 346 220 0 220 349 0 220 312 0 312 349 0
		 352 321 0 321 355 0 352 217 0 217 321 0 835 362 0 362 232 0 835 364 0 364 362 0 74 187 0
		 187 47 0 47 74 0 187 188 0;
	setAttr ".ed[664:829]" 188 47 0 514 156 0 156 185 0 186 185 0 517 166 0 166 516 0
		 517 164 0 164 166 0 388 423 0 423 377 0 377 388 0 423 421 0 421 377 0 441 439 0 439 382 0
		 382 441 0 439 371 0 458 402 0 402 457 0 458 419 0 419 402 0 464 428 0 428 465 0 464 398 0
		 398 428 0 470 395 0 395 471 0 395 437 0 437 471 0 445 475 0 475 405 0 405 445 0 475 477 0
		 477 405 0 830 481 0 481 411 0 830 831 0 831 481 0 569 560 0 560 449 0 449 569 0 560 369 0
		 369 449 0 397 435 0 642 397 0 602 592 0 592 402 0 402 602 0 416 402 0 573 576 0 576 230 0
		 230 573 0 576 329 0 329 230 0 221 614 0 614 310 0 310 221 0 614 628 0 577 486 0 486 583 0
		 585 486 0 486 487 0 585 583 0 594 597 0 597 598 0 598 594 0 597 599 0 641 670 0 670 640 0
		 641 673 0 673 670 0 572 579 0 579 574 0 574 572 0 579 580 0 580 574 0 624 622 0 622 625 0
		 622 623 0 623 625 0 658 659 0 659 651 0 651 658 0 659 652 0 652 651 0 714 199 0 199 305 0
		 714 706 0 706 199 0 770 767 0 767 323 0 767 193 0 193 323 0 418 379 0 379 701 0 379 694 0
		 694 701 0 749 760 0 760 438 0 760 372 0 372 438 0 729 639 0 639 733 0 639 627 0 627 733 0
		 729 637 0 637 639 0 729 744 0 744 637 0 623 633 0 633 724 0 724 623 0 633 720 0 720 724 0
		 724 719 0 719 623 0 719 625 0 719 722 0 722 625 0 733 726 0 726 732 0 733 728 0 728 726 0
		 758 765 0 765 759 0 759 758 0 766 759 0 717 721 0 721 719 0 719 717 0 683 677 0 677 682 0
		 679 677 0 826 333 0 333 834 0 826 369 0 369 333 0 831 546 0 546 481 0 831 825 0 825 546 0
		 819 539 0 539 540 0 819 818 0 818 539 0 850 786 0 786 849 0 786 787 0 787 849 0 785 850 0
		 785 786 0 837 798 0 798 835 0 837 797 0 797 798 0 89 56 0 96 56 0 78 6 0 6 80 0 80 78 0
		 6 54 0 54 80 0 182 141 0 141 111 0 181 141 0 17 126 0;
	setAttr ".ed[830:995]" 126 39 0 39 17 0 126 127 0 127 39 0 102 159 0 159 158 0
		 102 157 0 157 159 0 24 95 0 95 141 0 141 24 0 95 142 0 142 141 0 124 116 0 116 35 0
		 35 124 0 528 54 0 54 529 0 529 528 0 36 33 0 33 34 0 34 36 0 13 34 0 27 30 0 30 11 0
		 11 27 0 30 26 0 26 11 0 236 264 0 264 238 0 264 263 0 263 238 0 276 254 0 254 277 0
		 277 276 0 254 233 0 286 233 0 233 284 0 286 239 0 255 521 0 521 247 0 255 256 0 256 521 0
		 140 139 0 139 553 0 553 140 0 139 555 0 555 553 0 242 237 0 68 901 0 901 502 0 502 68 0
		 901 900 0 900 502 0 198 307 0 307 209 0 305 307 0 323 203 0 203 192 0 323 325 0 325 203 0
		 341 223 0 223 342 0 342 341 0 223 303 0 312 348 0 348 349 0 312 219 0 219 348 0 354 355 0
		 355 216 0 216 354 0 321 216 0 361 359 0 359 226 0 359 329 0 329 226 0 516 154 0 154 515 0
		 166 154 0 48 527 0 527 50 0 50 48 0 527 528 0 528 50 0 389 420 0 420 378 0 378 389 0
		 420 418 0 436 384 0 384 438 0 438 436 0 384 373 0 416 457 0 416 456 0 456 457 0 461 463 0
		 463 400 0 400 461 0 463 426 0 426 400 0 466 469 0 469 397 0 397 466 0 469 435 0 445 476 0
		 476 475 0 445 409 0 409 476 0 368 366 0 366 474 0 474 368 0 366 443 0 443 474 0 538 69 0
		 69 541 0 541 538 0 69 178 0 178 541 0 366 649 0 649 443 0 649 658 0 658 443 0 654 643 0
		 643 437 0 437 654 0 396 437 0 603 608 0 608 401 0 401 603 0 608 419 0 419 401 0 332 578 0
		 578 230 0 230 332 0 578 573 0 626 312 0 626 638 0 638 312 0 581 484 0 484 575 0 575 581 0
		 484 485 0 485 575 0 495 494 0 494 559 0 494 557 0 557 559 0 638 639 0 639 636 0 636 638 0
		 574 578 0 578 572 0 574 581 0 581 578 0 603 610 0 610 606 0 606 603 0 610 611 0 650 656 0
		 656 653 0 653 650 0 656 657 0 657 653 0 583 584 0 584 582 0;
	setAttr ".ed[996:1161]" 585 584 0 302 712 0 712 200 0 200 302 0 712 705 0 705 200 0
		 767 322 0 322 193 0 767 757 0 757 322 0 380 678 0 678 415 0 415 380 0 678 699 0 699 415 0
		 748 746 0 746 433 0 433 748 0 373 433 0 742 641 0 641 744 0 744 742 0 742 673 0 742 745 0
		 745 673 0 597 688 0 688 599 0 688 691 0 691 599 0 633 631 0 631 720 0 738 720 0 730 731 0
		 731 725 0 725 730 0 727 725 0 772 773 0 773 768 0 768 772 0 773 769 0 769 768 0 734 723 0
		 723 720 0 720 734 0 723 724 0 689 692 0 692 685 0 685 689 0 692 693 0 895 543 0 543 896 0
		 896 895 0 543 823 0 823 896 0 789 847 0 847 788 0 788 789 0 848 788 0 859 782 0 782 856 0
		 782 783 0 783 856 0 824 874 0 874 807 0 807 824 0 874 873 0 873 807 0 837 838 0 838 797 0
		 838 815 0 815 797 0 96 49 0 49 56 0 96 88 0 88 49 0 54 21 0 21 80 0 21 75 0 84 25 0
		 25 86 0 25 65 0 100 128 0 128 170 0 170 100 0 162 905 0 905 172 0 162 861 0 861 905 0
		 151 150 0 150 149 0 149 151 0 150 113 0 113 149 0 135 4 0 4 161 0 161 135 0 4 47 0
		 47 161 0 95 90 0 90 142 0 138 142 0 100 119 0 119 120 0 120 100 0 119 122 0 122 120 0
		 57 82 0 82 19 0 19 57 0 61 19 0 74 44 0 44 73 0 73 74 0 44 16 0 28 30 0 30 14 0 14 28 0
		 27 14 0 30 29 0 29 26 0 29 87 0 87 26 0 235 264 0 265 264 0 285 233 0 140 551 0 551 138 0
		 553 551 0 509 15 0 15 508 0 508 509 0 15 41 0 208 197 0 197 309 0 309 208 0 197 308 0
		 326 192 0 192 328 0 328 326 0 203 328 0 304 341 0 304 213 0 213 341 0 349 207 0 348 207 0
		 204 320 0 320 354 0 354 204 0 76 510 0 510 22 0 22 76 0 510 509 0 509 22 0 509 79 0
		 508 79 0 423 389 0 389 421 0 378 421 0 383 372 0 372 441 0 441 383 0 372 439 0 456 392 0
		 456 417 0 417 392 0 461 425 0;
	setAttr ".ed[1162:1327]" 425 463 0 461 388 0 388 425 0 385 434 0 434 466 0 466 385 0
		 434 469 0 410 476 0 476 411 0 411 410 0 476 478 0 478 411 0 474 444 0 444 368 0 444 367 0
		 367 368 0 539 176 0 176 540 0 176 177 0 391 569 0 391 562 0 562 569 0 395 650 0 650 437 0
		 650 654 0 608 602 0 602 419 0 582 329 0 582 226 0 638 219 0 636 219 0 485 577 0 577 575 0
		 485 486 0 626 627 0 627 638 0 581 573 0 575 573 0 610 604 0 604 611 0 652 656 0 656 651 0
		 652 657 0 585 594 0 594 584 0 585 597 0 706 302 0 302 199 0 706 712 0 757 194 0 194 322 0
		 757 754 0 754 194 0 699 694 0 694 415 0 379 415 0 433 374 0 374 748 0 374 735 0 735 748 0
		 627 728 0 627 629 0 759 648 0 648 773 0 773 759 0 648 669 0 669 773 0 693 597 0 693 688 0
		 728 730 0 730 726 0 759 772 0 772 758 0 723 717 0 717 724 0 692 686 0 686 693 0 686 688 0
		 818 541 0 541 539 0 818 817 0 817 541 0 787 848 0 848 849 0 787 788 0 783 855 0 855 856 0
		 783 784 0 796 833 0 833 878 0 878 796 0 833 879 0 879 878 0 796 815 0 815 833 0 838 833 0
		 15 42 0 42 18 0 18 15 0 43 18 0 190 191 0 191 160 0 160 190 0 191 163 0 183 70 0
		 70 93 0 184 70 0 125 127 0 127 109 0 109 125 0 126 109 0 135 108 0 108 136 0 136 135 0
		 108 133 0 133 136 0 113 159 0 159 137 0 150 159 0 150 158 0 150 98 0 124 123 0 123 121 0
		 121 124 0 123 105 0 105 121 0 84 67 0 67 25 0 84 85 0 85 67 0 535 19 0 19 60 0 535 536 0
		 536 19 0 60 61 0 61 63 0 36 5 0 5 35 0 34 5 0 238 262 0 262 241 0 263 262 0 513 514 0
		 513 156 0 139 144 0 144 555 0 144 554 0 305 210 0 210 307 0 199 210 0 204 325 0 325 193 0
		 193 204 0 213 340 0 340 341 0 213 301 0 301 340 0 347 309 0 309 345 0 345 347 0 209 345 0
		 206 350 0 350 318 0 318 206 0 350 353 0 353 318 0;
	setAttr ".ed[1328:1493]" 358 368 0 368 328 0 328 358 0 367 328 0 503 0 0 0 502 0
		 502 503 0 0 68 0 392 418 0 392 379 0 372 436 0 455 393 0 393 456 0 456 455 0 393 417 0
		 462 463 0 463 387 0 387 462 0 468 469 0 469 384 0 384 468 0 434 384 0 474 382 0 474 473 0
		 473 382 0 442 365 0 365 444 0 365 367 0 178 539 0 408 481 0 481 280 0 280 408 0 546 280 0
		 440 656 0 656 395 0 395 440 0 603 422 0 422 610 0 401 422 0 212 572 0 572 332 0 332 212 0
		 316 640 0 640 218 0 218 316 0 670 218 0 581 483 0 483 484 0 574 483 0 491 496 0 496 564 0
		 564 491 0 496 570 0 570 564 0 614 617 0 617 628 0 629 628 0 575 576 0 603 609 0 609 608 0
		 606 609 0 654 644 0 644 643 0 654 655 0 655 644 0 586 559 0 559 558 0 586 589 0 705 299 0
		 299 200 0 705 710 0 710 299 0 317 756 0 756 195 0 195 317 0 756 741 0 741 195 0 430 375 0
		 375 737 0 737 430 0 375 734 0 734 737 0 884 266 0 266 885 0 885 884 0 234 885 0 691 596 0
		 691 707 0 707 596 0 762 659 0 659 766 0 762 652 0 766 648 0 659 648 0 727 714 0 727 715 0
		 715 714 0 769 770 0 769 771 0 771 770 0 734 738 0 738 737 0 679 680 0 680 677 0 679 681 0
		 681 680 0 542 822 0 822 543 0 543 542 0 822 823 0 789 840 0 840 847 0 789 790 0 790 840 0
		 857 781 0 781 859 0 781 782 0 821 812 0 812 822 0 822 821 0 812 813 0 813 822 0 806 825 0
		 825 816 0 816 806 0 831 816 0 18 37 0 37 15 0 37 41 0 7 76 0 76 863 0 123 125 0 125 105 0
		 123 127 0 133 126 0 126 136 0 133 109 0 553 518 0 518 551 0 518 517 0 244 869 0 869 865 0
		 869 868 0 868 865 0 124 5 0 5 123 0 85 893 0 893 67 0 85 894 0 894 893 0 20 63 0
		 20 62 0 37 13 0 13 41 0 30 10 0 506 505 0 505 81 0 81 506 0 505 20 0 240 241 0 241 261 0
		 261 240 0 262 261 0 276 258 0 276 275 0 275 258 0;
	setAttr ".ed[1494:1659]" 287 549 0 549 143 0 287 550 0 898 234 0 898 291 0 291 234 0
		 199 304 0 302 304 0 320 322 0 322 205 0 194 205 0 341 300 0 300 223 0 340 300 0 345 221 0
		 221 347 0 310 347 0 350 218 0 218 353 0 218 319 0 319 353 0 359 360 0 360 329 0 360 230 0
		 327 366 0 366 358 0 358 327 0 32 507 0 32 506 0 506 507 0 417 415 0 415 392 0 385 433 0
		 433 434 0 385 374 0 403 456 0 403 455 0 462 426 0 462 399 0 399 426 0 435 468 0 468 396 0
		 443 473 0 443 390 0 390 473 0 85 543 0 543 894 0 895 894 0 548 229 0 229 281 0 548 370 0
		 370 229 0 390 651 0 651 440 0 440 390 0 610 400 0 400 604 0 422 400 0 584 226 0 584 335 0
		 636 316 0 316 219 0 297 598 0 598 224 0 224 297 0 595 224 0 496 489 0 489 570 0 561 570 0
		 629 626 0 661 669 0 669 668 0 661 662 0 662 669 0 608 605 0 605 602 0 609 605 0 653 654 0
		 653 655 0 556 558 0 558 557 0 557 556 0 201 299 0 299 687 0 687 201 0 710 687 0 754 317 0
		 317 194 0 754 756 0 737 735 0 735 430 0 374 430 0 228 334 0 334 689 0 689 228 0 334 692 0
		 675 755 0 755 672 0 672 675 0 755 753 0 753 672 0 675 745 0 745 755 0 675 673 0 707 601 0
		 601 596 0 707 711 0 711 601 0 762 764 0 764 652 0 764 657 0 589 591 0 591 679 0 591 681 0
		 715 706 0 715 709 0 709 706 0 771 767 0 771 752 0 752 767 0 737 736 0 736 735 0 681 678 0
		 678 680 0 681 696 0 696 678 0 364 212 0 212 362 0 332 362 0 544 822 0 544 821 0 840 791 0
		 790 791 0 845 775 0 775 846 0 775 776 0 776 846 0 820 811 0 811 821 0 821 820 0 811 812 0
		 803 829 0 829 802 0 802 803 0 829 827 0 827 802 0 5 39 0 39 123 0 45 136 0 136 17 0
		 139 96 0 139 88 0 115 148 0 148 87 0 87 115 0 148 97 0 97 87 0 908 907 0 907 110 0
		 110 908 0 907 168 0 168 110 0 125 130 0 130 105 0 130 120 0 120 105 0;
	setAttr ".ed[1660:1825]" 179 24 0 24 181 0 181 179 0 87 66 0 66 26 0 97 66 0
		 11 64 0 64 0 0 0 11 0 64 68 0 31 12 0 12 27 0 27 31 0 12 14 0 261 242 0 261 260 0
		 260 242 0 275 252 0 252 258 0 275 274 0 274 252 0 549 554 0 554 143 0 528 49 0 49 50 0
		 529 49 0 302 213 0 200 213 0 193 320 0 339 340 0 340 214 0 214 339 0 301 214 0 208 347 0
		 347 346 0 353 205 0 205 318 0 353 352 0 203 358 0 203 357 0 357 358 0 365 328 0 365 326 0
		 93 179 0 179 153 0 283 72 0 72 898 0 72 899 0 899 898 0 393 380 0 380 417 0 434 373 0
		 453 414 0 414 455 0 455 453 0 414 393 0 461 460 0 460 388 0 460 423 0 386 431 0 431 464 0
		 431 467 0 467 464 0 473 441 0 473 472 0 472 441 0 409 478 0 409 448 0 448 478 0 72 900 0
		 900 899 0 72 502 0 658 390 0 624 399 0 399 622 0 624 426 0 225 335 0 335 594 0 594 225 0
		 217 319 0 319 674 0 674 217 0 319 670 0 670 674 0 674 671 0 671 217 0 595 300 0 300 224 0
		 595 600 0 600 300 0 567 557 0 494 567 0 620 621 0 621 614 0 614 620 0 661 666 0 666 662 0
		 666 667 0 667 662 0 602 593 0 593 592 0 605 593 0 646 645 0 645 642 0 646 647 0 647 645 0
		 569 570 0 570 560 0 561 560 0 296 201 0 201 690 0 690 296 0 687 690 0 314 743 0 743 196 0
		 196 314 0 743 740 0 740 196 0 450 682 0 682 381 0 381 450 0 677 381 0 429 376 0 376 723 0
		 723 429 0 376 717 0 601 708 0 708 615 0 615 601 0 708 713 0 713 615 0 711 708 0 764 750 0
		 750 657 0 750 653 0 591 588 0 588 681 0 588 696 0 709 712 0 709 713 0 713 712 0 752 757 0
		 752 753 0 753 757 0 735 739 0 739 748 0 696 699 0 696 700 0 700 699 0 849 122 0 833 880 0
		 880 879 0 833 548 0 819 809 0 809 818 0 819 808 0 808 809 0 774 775 0 775 841 0 841 774 0
		 810 811 0 811 817 0 817 810 0 820 817 0 803 828 0 803 804 0;
	setAttr ".ed[1826:1991]" 804 828 0 37 34 0 37 40 0 40 34 0 4 45 0 45 44 0 44 4 0
		 46 44 0 11 66 0 66 64 0 189 190 0 190 161 0 161 189 0 160 161 0 105 122 0 134 131 0
		 131 129 0 129 134 0 131 107 0 107 129 0 256 246 0 246 521 0 256 253 0 146 148 0 148 104 0
		 909 165 0 165 860 0 860 909 0 165 101 0 101 860 0 136 4 0 78 57 0 78 82 0 95 52 0
		 52 90 0 52 48 0 48 90 0 256 271 0 271 253 0 271 270 0 270 253 0 58 536 0 53 527 0
		 527 526 0 53 21 0 21 527 0 59 72 0 8 72 0 298 214 0 214 296 0 296 298 0 214 201 0
		 315 314 0 314 207 0 207 315 0 339 337 0 337 224 0 224 339 0 337 297 0 344 306 0 306 345 0
		 345 344 0 306 221 0 219 351 0 351 348 0 316 351 0 357 356 0 356 211 0 211 357 0 356 324 0
		 324 211 0 336 338 0 338 215 0 336 363 0 363 338 0 427 387 0 387 429 0 429 427 0 453 413 0
		 413 454 0 454 453 0 413 404 0 404 454 0 459 460 0 460 401 0 401 459 0 460 422 0 467 466 0
		 466 432 0 432 467 0 397 432 0 472 440 0 440 470 0 470 472 0 447 408 0 408 482 0 482 447 0
		 280 482 0 409 568 0 568 448 0 409 563 0 563 568 0 399 428 0 428 622 0 428 632 0 632 622 0
		 668 649 0 649 327 0 671 321 0 671 664 0 664 321 0 303 618 0 618 222 0 618 613 0 613 222 0
		 492 491 0 491 571 0 571 492 0 564 571 0 612 615 0 615 618 0 618 612 0 615 619 0 619 618 0
		 660 664 0 664 663 0 663 660 0 664 665 0 665 663 0 586 590 0 590 589 0 590 591 0 634 642 0
		 642 635 0 635 634 0 562 564 0 564 569 0 886 885 0 885 291 0 291 886 0 740 313 0 732 313 0
		 202 296 0 296 686 0 686 202 0 690 686 0 717 424 0 424 721 0 765 371 0 371 761 0 765 442 0
		 771 667 0 667 752 0 667 663 0 663 752 0 616 715 0 715 621 0 621 616 0 616 709 0 616 619 0
		 619 709 0 647 739 0 647 747 0 747 739 0 609 702 0 702 605 0;
	setAttr ".ed[1992:2157]" 609 698 0 698 702 0 702 697 0 697 605 0 697 593 0 710 707 0
		 707 687 0 710 711 0 756 745 0 745 741 0 742 741 0 749 750 0 750 760 0 749 751 0 751 750 0
		 701 698 0 698 695 0 701 702 0 837 370 0 370 838 0 232 370 0 779 852 0 852 778 0 778 779 0
		 854 778 0 794 774 0 774 843 0 843 794 0 841 843 0 831 805 0 805 816 0 830 805 0 34 39 0
		 40 39 0 46 16 0 46 43 0 25 64 0 64 65 0 66 65 0 112 190 0 190 152 0 177 149 0 149 175 0
		 113 175 0 133 134 0 134 109 0 129 109 0 147 146 0 146 114 0 147 148 0 909 908 0 908 165 0
		 110 165 0 94 88 0 88 140 0 115 29 0 78 9 0 9 82 0 9 81 0 112 155 0 155 190 0 64 67 0
		 67 68 0 24 51 0 51 95 0 51 52 0 12 32 0 32 14 0 33 14 0 184 532 0 532 70 0 184 531 0
		 531 532 0 252 257 0 245 252 0 270 251 0 270 269 0 269 251 0 20 504 0 504 62 0 505 504 0
		 142 111 0 142 552 0 215 298 0 298 202 0 206 195 0 195 315 0 315 206 0 195 314 0 338 337 0
		 337 215 0 337 298 0 344 307 0 307 343 0 343 344 0 315 351 0 351 206 0 351 350 0 204 356 0
		 356 325 0 354 356 0 363 225 0 225 338 0 42 510 0 510 1 0 427 375 0 375 386 0 429 375 0
		 459 458 0 458 389 0 389 459 0 465 462 0 462 427 0 471 384 0 471 468 0 479 451 0 451 477 0
		 477 479 0 451 405 0 543 84 0 391 448 0 448 562 0 568 562 0 397 634 0 634 432 0 413 590 0
		 590 404 0 324 216 0 216 666 0 666 324 0 216 660 0 660 666 0 613 306 0 306 222 0 613 620 0
		 620 306 0 297 225 0 225 598 0 600 601 0 601 612 0 612 600 0 673 674 0 675 674 0 580 560 0
		 579 560 0 632 623 0 632 633 0 563 571 0 571 568 0 565 571 0 244 870 0 870 869 0 244 249 0
		 249 870 0 308 730 0 730 198 0 365 758 0 758 326 0 772 326 0 421 716 0 716 377 0 421 703 0
		 703 716 0 763 761 0 761 439 0 439 763 0;
	setAttr ".ed[2158:2323]" 769 662 0 662 771 0 647 644 0 644 747 0 644 751 0 751 747 0
		 606 698 0 704 698 0 687 691 0 691 690 0 742 743 0 743 741 0 744 743 0 763 760 0 760 764 0
		 764 763 0 703 695 0 695 704 0 704 703 0 817 538 0 820 538 0 779 853 0 779 780 0 780 853 0
		 793 794 0 794 842 0 842 793 0 836 800 0 836 799 0 799 800 0 18 40 0 18 38 0 38 40 0
		 74 4 0 124 106 0 132 99 0 99 134 0 134 132 0 255 272 0 272 256 0 272 271 0 98 151 0
		 907 906 0 906 168 0 906 103 0 103 168 0 107 130 0 130 129 0 128 130 0 179 180 0 180 24 0
		 180 51 0 536 57 0 48 94 0 50 94 0 258 245 0 273 272 0 272 257 0 257 273 0 138 552 0
		 52 526 0 526 48 0 301 201 0 301 299 0 194 318 0 317 318 0 339 298 0 209 344 0 348 315 0
		 325 357 0 360 362 0 362 230 0 394 381 0 381 414 0 414 394 0 381 412 0 412 414 0 385 431 0
		 431 374 0 431 430 0 454 394 0 394 453 0 459 423 0 385 467 0 472 383 0 479 404 0 479 454 0
		 504 503 0 503 62 0 503 8 0 405 556 0 556 445 0 556 566 0 566 445 0 630 632 0 632 398 0
		 398 630 0 333 579 0 579 212 0 212 333 0 321 660 0 223 612 0 612 303 0 565 492 0 565 493 0
		 493 492 0 619 613 0 616 613 0 671 672 0 672 664 0 672 665 0 590 587 0 587 591 0 587 588 0
		 630 634 0 634 631 0 631 630 0 556 567 0 732 197 0 197 313 0 726 197 0 871 870 0 870 267 0
		 267 871 0 424 377 0 377 721 0 758 442 0 753 665 0 619 713 0 751 653 0 751 655 0 700 593 0
		 697 700 0 705 708 0 708 710 0 754 755 0 755 756 0 746 751 0 746 747 0 694 702 0 694 697 0
		 449 826 0 826 827 0 823 814 0 814 896 0 814 897 0 897 896 0 858 777 0 777 854 0 854 858 0
		 777 778 0 824 808 0 807 808 0 804 830 0 804 805 0 38 39 0 75 77 0 77 22 0 77 76 0
		 186 112 0 186 155 0 176 149 0 114 149 0 132 133 0 160 135 0 147 92 0;
	setAttr ".ed[2324:2489]" 92 148 0 92 97 0 555 518 0 128 120 0 70 179 0 70 180 0
		 92 66 0 50 88 0 242 259 0 259 237 0 260 259 0 274 257 0 274 273 0 529 56 0 239 294 0
		 213 299 0 317 206 0 340 224 0 310 346 0 319 352 0 357 327 0 506 12 0 12 505 0 412 393 0
		 412 380 0 386 430 0 403 453 0 403 413 0 422 461 0 467 398 0 432 398 0 390 472 0 479 452 0
		 452 454 0 452 394 0 502 8 0 566 409 0 426 604 0 560 333 0 600 223 0 567 493 0 494 493 0
		 616 620 0 663 666 0 592 588 0 593 588 0 643 647 0 649 648 0 648 658 0 741 314 0 734 429 0
		 663 753 0 593 696 0 713 705 0 753 754 0 748 747 0 697 699 0 875 874 0 874 545 0 545 875 0
		 823 813 0 813 814 0 776 858 0 776 777 0 809 810 0 810 818 0 801 827 0 801 802 0 38 43 0
		 537 184 0 47 189 0 51 534 0 534 52 0 129 125 0 171 172 0 172 904 0 905 904 0 114 151 0
		 163 162 0 162 132 0 131 171 0 92 178 0 79 78 0 79 9 0 893 901 0 901 67 0 180 533 0
		 533 51 0 532 180 0 269 250 0 269 268 0 237 279 0 259 279 0 9 507 0 507 81 0 21 528 0
		 240 295 0 293 295 0 513 154 0 313 208 0 338 297 0 222 344 0 316 350 0 354 324 0 336 227 0
		 227 363 0 227 361 0 509 42 0 169 517 0 169 164 0 388 424 0 419 459 0 465 399 0 437 468 0
		 538 544 0 544 69 0 558 405 0 432 630 0 590 403 0 324 661 0 620 221 0 574 488 0 488 483 0
		 596 600 0 675 671 0 668 648 0 630 633 0 568 564 0 726 308 0 772 192 0 378 703 0 760 439 0
		 669 769 0 690 688 0 744 740 0 763 762 0 703 718 0 538 821 0 780 857 0 780 781 0 792 793 0
		 793 839 0 798 799 0 799 835 0 836 835 0 804 797 0 797 805 0 804 798 0 803 798 0 803 799 0
		 802 800 0 800 803 0 810 812 0 813 809 0 809 814 0 808 814 0 810 813 0 873 878 0 878 807 0
		 878 795 0 795 807 0 795 808 0 795 897 0 897 808 0 797 816 0 815 816 0;
	setAttr ".ed[2490:2655]" 815 806 0 796 806 0 779 783 0 783 780 0 782 780 0 784 778 0
		 778 785 0 777 785 0 779 784 0 787 775 0 775 788 0 788 774 0 774 789 0 777 786 0 776 786 0
		 776 787 0 774 790 0 794 790 0 793 791 0 791 794 0 331 501 0 501 229 0 229 331 0 391 478 0
		 480 478 0 677 412 0 680 412 0 183 152 0 511 188 0 155 860 0 163 861 0 187 73 0 508 9 0
		 53 75 0 53 77 0 71 77 0 77 864 0 862 537 0 862 7 0 76 862 0 532 863 0 863 71 0 863 77 0
		 2 77 0 549 520 0 287 248 0 247 550 0 247 523 0 175 876 0 876 545 0 876 875 0 877 175 0
		 877 876 0 452 450 0 450 394 0 477 406 0 406 479 0 406 452 0 407 452 0 407 450 0 680 380 0
		 407 676 0 676 450 0 475 446 0 446 477 0 866 676 0 407 866 0 828 478 0 410 475 0 410 446 0
		 410 408 0 408 446 0 410 481 0 249 282 0 159 865 0 865 137 0 868 867 0 867 865 0 872 866 0
		 866 447 0 447 872 0 868 866 0 866 867 0 872 867 0 869 676 0 676 868 0 870 684 0 684 869 0
		 684 871 0 871 525 0 482 872 0 874 825 0 825 873 0 806 873 0 825 875 0 875 546 0 546 876 0
		 876 280 0 280 877 0 877 482 0 867 482 0 231 232 0 232 360 0 360 231 0 370 231 0 231 229 0
		 330 231 0 231 359 0 359 330 0 229 330 0 330 331 0 333 364 0 879 795 0 879 832 0 832 795 0
		 879 547 0 547 832 0 880 547 0 880 83 0 83 547 0 881 83 0 881 23 0 23 83 0 882 23 0
		 882 500 0 500 23 0 882 889 0 889 500 0 524 884 0 884 685 0 885 685 0 685 886 0 886 689 0
		 887 689 0 689 883 0 886 883 0 883 500 0 883 289 0 289 500 0 227 330 0 330 361 0 330 228 0
		 228 331 0 227 228 0 228 336 0 692 202 0 228 888 0 888 331 0 228 887 0 291 289 0 289 886 0
		 505 31 0 31 504 0 36 14 0 0 31 0 31 11 0 504 0 0 888 501 0 889 501 0 548 838 0 806 878 0
		 854 145 0 145 858 0 890 145 0 890 521 0 521 145 0;
	setAttr ".ed[2656:2821]" 523 521 0 282 892 0 157 892 0 145 102 0 892 102 0 894 83 0
		 83 893 0 23 893 0 895 547 0 547 894 0 896 832 0 832 895 0 897 832 0 899 291 0 899 289 0
		 900 500 0 500 899 0 901 23 0 23 900 0 903 103 0 103 902 0 903 168 0 904 168 0 904 110 0
		 905 110 0 905 165 0 912 855 0 912 911 0 911 855 0 861 165 0 167 906 0 906 169 0 907 169 0
		 169 908 0 908 164 0 164 909 0 909 166 0 855 910 0 911 910 0 154 909 0 911 906 0 906 910 0
		 911 103 0 912 902 0 902 911 0 913 170 0 170 912 0 100 913 0 910 167 0 945 924 0 924 946 0
		 946 945 0 924 930 0 930 946 0 944 943 0 943 927 0 927 944 0 943 925 0 925 927 0 963 964 0
		 964 944 0 944 963 0 964 943 0 955 965 0 965 917 0 917 955 0 965 966 0 966 917 0 948 922 0
		 922 968 0 968 948 0 922 967 0 967 968 0 970 946 0 946 969 0 969 970 0 946 947 0 947 969 0
		 947 971 0 971 969 0 947 948 0 948 971 0 972 945 0 945 970 0 970 972 0 933 916 0 916 917 0
		 917 933 0 916 918 0 918 917 0 934 921 0 921 915 0 915 934 0 921 920 0 920 915 0 934 974 0
		 974 921 0 934 973 0 973 974 0 933 941 0 941 916 0 941 940 0 940 916 0 931 939 0 939 914 0
		 914 931 0 939 938 0 938 914 0 937 936 0 936 928 0 928 937 0 936 915 0 915 928 0 934 975 0
		 975 973 0 934 935 0 935 975 0 972 963 0 963 945 0 944 945 0 927 924 0 924 944 0 928 914 0
		 914 937 0 938 937 0 930 947 0 930 923 0 923 947 0 931 940 0 940 939 0 931 916 0 933 977 0
		 977 941 0 933 976 0 976 977 0 966 933 0 966 976 0 936 935 0 935 915 0 935 978 0 978 975 0
		 935 926 0 926 978 0 925 926 0 926 936 0 936 925 0 925 937 0 937 927 0 927 938 0 938 924 0
		 939 930 0 930 938 0 939 923 0 940 923 0 941 922 0 922 940 0 922 923 0 941 967 0 977 967 0
		 923 948 0 964 979 0 979 943 0 979 942 0 942 943 0 942 925 0 942 926 0;
	setAttr ".ed[2822:2987]" 942 980 0 980 926 0 980 978 0 942 981 0 981 980 0 979 981 0
		 948 982 0 982 971 0 968 982 0 983 984 0 984 962 0 962 983 0 984 985 0 985 962 0 931 918 0
		 931 932 0 932 918 0 920 928 0 920 929 0 929 928 0 929 914 0 929 919 0 919 914 0 919 932 0
		 932 914 0 958 959 0 959 987 0 987 958 0 959 986 0 986 987 0 960 988 0 988 959 0 959 960 0
		 988 986 0 987 989 0 989 958 0 989 957 0 957 958 0 960 990 0 990 988 0 960 961 0 961 990 0
		 961 985 0 985 990 0 961 962 0 950 949 0 949 932 0 932 950 0 949 918 0 951 950 0 950 919 0
		 919 951 0 929 952 0 952 919 0 952 951 0 929 953 0 953 952 0 920 953 0 920 954 0 954 953 0
		 921 954 0 974 991 0 991 921 0 991 954 0 955 992 0 992 965 0 955 956 0 956 992 0 949 955 0
		 955 918 0 956 957 0 957 993 0 993 956 0 989 993 0 949 956 0 949 957 0 957 950 0 950 958 0
		 958 951 0 951 959 0 952 960 0 960 951 0 952 961 0 953 961 0 953 962 0 954 962 0 991 983 0
		 983 954 0 956 994 0 994 992 0 993 994 0 1096 1097 0 1097 984 0 984 1096 0 1097 985 0
		 1097 1098 0 1098 985 0 1098 990 0 1099 1100 0 1100 988 0 988 1099 0 1100 986 0 1085 1086 0
		 1086 963 0 963 1085 0 1086 964 0 1087 979 0 979 1086 0 1086 1087 0 1084 1085 0 1085 972 0
		 972 1084 0 1088 981 0 981 1087 0 1087 1088 0 1089 980 0 980 1088 0 1088 1089 0 1101 987 0
		 987 1100 0 1100 1101 0 1103 993 0 993 1102 0 1102 1103 0 989 1102 0 1104 994 0 994 1103 0
		 1103 1104 0 1074 965 0 965 1105 0 1105 1074 0 992 1105 0 1075 966 0 966 1074 0 1074 1075 0
		 1077 1078 0 1078 977 0 977 1077 0 1078 967 0 1078 1079 0 1079 967 0 1079 968 0 1079 1080 0
		 1080 968 0 1080 982 0 977 1076 0 1076 1077 0 976 1076 0 1081 1082 0 1082 971 0 971 1081 0
		 1082 969 0 1083 970 0 970 1082 0 1082 1083 0 972 1083 0 1083 1084 0 1080 1081 0 1081 982 0
		 976 1075 0 1075 1076 0 1094 1095 0 1095 991 0 991 1094 0 1095 983 0 1093 1094 0;
	setAttr ".ed[2988:3153]" 1094 974 0 974 1093 0 1090 978 0 978 1089 0 1089 1090 0
		 1091 975 0 975 1090 0 1090 1091 0 1091 1092 0 1092 975 0 1092 973 0 1092 1093 0 1093 973 0
		 1036 1037 0 1037 1063 0 1063 1036 0 1037 1062 0 1062 1063 0 1071 1053 0 1053 1072 0
		 1072 1071 0 1053 1052 0 1052 1072 0 1066 1041 0 1041 1067 0 1067 1066 0 1041 1057 0
		 1057 1067 0 1037 1038 0 1038 1062 0 1038 1061 0 1061 1062 0 1070 1054 0 1054 1071 0
		 1071 1070 0 1054 1053 0 1038 1039 0 1039 1061 0 1039 1059 0 1059 1061 0 1070 1055 0
		 1055 1054 0 1070 1069 0 1069 1055 0 1060 1059 0 1059 1040 0 1040 1060 0 1039 1040 0
		 1069 1056 0 1056 1055 0 1069 1068 0 1068 1056 0 1034 1035 0 1035 1065 0 1065 1034 0
		 1035 1064 0 1064 1065 0 1068 1057 0 1057 1056 0 1068 1067 0 1051 1050 0 1050 1073 0
		 1073 1051 0 1035 1036 0 1036 1064 0 1063 1064 0 1066 1060 0 1060 1041 0 1040 1041 0
		 1052 1073 0 1073 1072 0 1052 1051 0 1065 1033 0 1033 1034 0 1065 1018 0 1018 1033 0
		 1065 1015 0 1015 1018 0 1050 1026 0 1026 1073 0 1026 1025 0 1025 1073 0 1050 1049 0
		 1049 1026 0 1049 1023 0 1023 1026 0 1062 1016 0 1016 1063 0 1062 1017 0 1017 1016 0
		 1049 1048 0 1048 1023 0 1048 1022 0 1022 1023 0 1072 1024 0 1024 1071 0 1024 1006 0
		 1006 1071 0 1067 1002 0 1002 1066 0 1002 1004 0 1004 1066 0 1061 1017 0 1061 1020 0
		 1020 1017 0 1046 1045 0 1045 996 0 996 1046 0 1045 995 0 995 996 0 1006 1070 0 1006 1005 0
		 1005 1070 0 1032 1013 0 1013 1031 0 1031 1032 0 1013 1012 0 1012 1031 0 1045 1044 0
		 1044 995 0 1044 997 0 997 995 0 1018 1032 0 1032 1033 0 1018 1013 0 1059 1020 0 1059 1019 0
		 1019 1020 0 1048 1047 0 1047 1022 0 1047 1000 0 1000 1022 0 1005 1069 0 1005 1003 0
		 1003 1069 0 1029 1010 0 1010 1028 0 1028 1029 0 1010 1009 0 1009 1028 0 1047 1046 0
		 1046 1000 0 996 1000 0 1009 1027 0 1027 1028 0 1009 1007 0 1007 1027 0 1044 1058 0
		 1058 997 0 1058 998 0 998 997 0 1030 1011 0 1011 1029 0 1029 1030 0 1011 1010 0 1060 1019 0
		 1060 1021 0 1021 1019 0 1058 1043 0 1043 998 0 1043 999 0 999 998 0 1003 1068 0 1003 1001 0
		 1001 1068 0 1012 1030 0;
	setAttr ".ed[3154:3319]" 1030 1031 0 1012 1011 0 1007 1042 0 1042 1027 0 1007 1008 0
		 1008 1042 0 1064 1015 0 1064 1014 0 1014 1015 0 1001 1067 0 1001 1002 0 1008 1043 0
		 1043 1042 0 1008 999 0 1016 1014 0 1014 1063 0 1066 1021 0 1004 1021 0 1025 1072 0
		 1025 1024 0 992 1104 0 1104 1105 0 1095 1096 0 1096 983 0 1098 1099 0 1099 990 0
		 989 1101 0 1101 1102 0 1013 1075 0 1075 1012 0 1074 1012 0 1018 1076 0 1076 1013 0
		 1015 1077 0 1077 1018 0 1014 1077 0 1014 1078 0 1016 1078 0 1016 1079 0 1017 1079 0
		 1017 1080 0 1020 1080 0 1020 1081 0 1019 1081 0 1019 1082 0 1021 1083 0 1083 1019 0
		 1004 1084 0 1084 1021 0 1002 1084 0 1002 1085 0 1001 1085 0 1001 1086 0 1003 1087 0
		 1087 1001 0 1005 1088 0 1088 1003 0 1006 1089 0 1089 1005 0 1024 1090 0 1090 1006 0
		 1025 1091 0 1091 1024 0 1026 1091 0 1026 1092 0 1023 1092 0 1023 1093 0 1022 1093 0
		 1022 1094 0 1000 1094 0 1000 1095 0 1095 996 0 996 1096 0 995 1096 0 995 1097 0 997 1097 0
		 997 1098 0 998 1098 0 998 1099 0 999 1099 0 999 1100 0 1008 1101 0 1101 999 0 1007 1102 0
		 1102 1008 0 1009 1103 0 1103 1007 0 1010 1104 0 1104 1009 0 1011 1105 0 1105 1010 0
		 1074 1011 0 1117 1210 0 1210 1209 0 1209 1117 0 1213 1112 0 1112 1180 0 1180 1213 0
		 1293 1106 0 1106 1287 0 1287 1293 0 1106 1270 0 1270 1287 0 1285 1292 0 1292 1286 0
		 1286 1285 0 1168 1109 0 1109 1169 0 1169 1168 0 1109 1108 0 1108 1169 0 1110 1174 0
		 1174 1173 0 1173 1110 0 1172 1171 0 1171 1108 0 1108 1172 0 1171 1170 0 1170 1108 0
		 1110 1175 0 1175 1174 0 1110 1111 0 1111 1175 0 1285 1283 0 1283 1292 0 1283 1112 0
		 1112 1292 0 1112 1181 0 1181 1180 0 1112 1167 0 1167 1181 0 1176 1111 0 1111 1178 0
		 1178 1176 0 1111 1179 0 1179 1178 0 1111 1177 0 1177 1179 0 1213 1185 0 1185 1112 0
		 1185 1292 0 1191 1211 0 1211 1292 0 1292 1191 0 1211 1293 0 1293 1292 0 1214 1107 0
		 1107 1215 0 1215 1214 0 1107 1116 0 1116 1215 0 1205 1194 0 1194 1113 0 1113 1205 0
		 1293 1115 0 1115 1106 0 1211 1288 0 1288 1293 0 1292 1212 0 1212 1191 0 1185 1186 0
		 1186 1292 0 1186 1212 0 1106 1107 0 1107 1271 0 1271 1106 0;
	setAttr ".ed[3320:3485]" 1107 1272 0 1272 1271 0 1271 1270 0 1274 1273 0 1273 1214 0
		 1214 1274 0 1273 1107 0 1275 1274 0 1274 1193 0 1193 1275 0 1214 1193 0 1193 1192 0
		 1192 1275 0 1277 1189 0 1189 1188 0 1188 1277 0 1183 1278 0 1278 1187 0 1187 1183 0
		 1110 1282 0 1282 1111 0 1282 1281 0 1281 1111 0 1280 1111 0 1281 1280 0 1109 1283 0
		 1283 1108 0 1109 1112 0 1283 1284 0 1284 1108 0 1284 1110 0 1110 1108 0 1284 1282 0
		 1209 1197 0 1197 1290 0 1290 1209 0 1204 1205 0 1205 1290 0 1290 1204 0 1195 1196 0
		 1196 1291 0 1291 1195 0 1196 1200 0 1200 1291 0 1206 1291 0 1291 1207 0 1207 1206 0
		 1291 1208 0 1208 1207 0 1200 1199 0 1199 1291 0 1199 1202 0 1202 1291 0 1291 1203 0
		 1203 1208 0 1202 1203 0 1172 1173 0 1173 1148 0 1148 1172 0 1173 1147 0 1147 1148 0
		 1189 1135 0 1135 1188 0 1135 1136 0 1136 1188 0 1207 1125 0 1125 1206 0 1125 1126 0
		 1126 1206 0 1216 1234 0 1234 1232 0 1232 1216 0 1234 1250 0 1250 1232 0 1257 1246 0
		 1246 1256 0 1256 1257 0 1246 1240 0 1240 1256 0 1269 1248 0 1248 1268 0 1268 1269 0
		 1248 1244 0 1244 1268 0 1230 1468 0 1468 1226 0 1226 1230 0 1468 1467 0 1467 1226 0
		 1197 1195 0 1195 1290 0 1291 1290 0 1171 1150 0 1150 1170 0 1171 1149 0 1149 1150 0
		 1138 1183 0 1183 1137 0 1137 1138 0 1187 1137 0 1204 1127 0 1127 1205 0 1127 1128 0
		 1128 1205 0 1155 1156 0 1156 1180 0 1180 1155 0 1156 1213 0 1251 1237 0 1237 1233 0
		 1233 1251 0 1237 1219 0 1219 1233 0 1255 1241 0 1241 1254 0 1254 1255 0 1241 1247 0
		 1247 1254 0 1267 1245 0 1245 1266 0 1266 1267 0 1245 1249 0 1249 1266 0 1223 1222 0
		 1222 1472 0 1472 1223 0 1222 1473 0 1473 1472 0 1224 1469 0 1469 1230 0 1230 1224 0
		 1469 1468 0 1173 1108 0 1172 1149 0 1148 1149 0 1187 1136 0 1136 1137 0 1187 1188 0
		 1126 1204 0 1204 1206 0 1126 1127 0 1214 1131 0 1131 1193 0 1131 1132 0 1132 1193 0
		 1288 1117 0 1117 1293 0 1288 1210 0 1237 1234 0 1234 1219 0 1216 1219 0 1240 1255 0
		 1255 1256 0 1240 1241 0 1244 1267 0 1267 1268 0 1244 1245 0 1279 1278 0 1278 1184 0
		 1184 1279 0 1183 1184 0 1219 1460 0 1460 1233 0 1460 1459 0 1459 1233 0 1169 1170 0;
	setAttr ".ed[3486:3651]" 1170 1151 0 1151 1169 0 1150 1151 0 1138 1184 0 1138 1139 0
		 1139 1184 0 1128 1194 0 1128 1129 0 1129 1194 0 1213 1157 0 1157 1185 0 1156 1157 0
		 1117 1115 0 1117 1114 0 1114 1115 0 1238 1251 0 1251 1220 0 1220 1238 0 1233 1220 0
		 1247 1253 0 1253 1254 0 1247 1243 0 1243 1253 0 1249 1265 0 1265 1266 0 1249 1235 0
		 1235 1265 0 1278 1277 0 1277 1187 0 1233 1458 0 1458 1220 0 1459 1458 0 1167 1154 0
		 1154 1181 0 1167 1153 0 1153 1154 0 1177 1141 0 1141 1179 0 1141 1142 0 1142 1179 0
		 1202 1198 0 1198 1121 0 1121 1202 0 1198 1120 0 1120 1121 0 1191 1161 0 1161 1211 0
		 1191 1160 0 1160 1161 0 1222 1240 0 1240 1228 0 1228 1222 0 1246 1228 0 1226 1244 0
		 1244 1230 0 1248 1230 0 1263 1250 0 1250 1262 0 1262 1263 0 1234 1262 0 1228 1221 0
		 1221 1474 0 1474 1228 0 1221 1475 0 1475 1474 0 1277 1276 0 1276 1189 0 1276 1190 0
		 1190 1189 0 1227 1466 0 1466 1231 0 1231 1227 0 1466 1465 0 1465 1231 0 1216 1461 0
		 1461 1219 0 1461 1460 0 1176 1175 0 1109 1167 0 1168 1167 0 1169 1152 0 1152 1168 0
		 1151 1152 0 1139 1182 0 1182 1184 0 1139 1140 0 1140 1182 0 1200 1119 0 1119 1199 0
		 1200 1118 0 1118 1119 0 1186 1159 0 1159 1212 0 1186 1158 0 1158 1159 0 1288 1162 0
		 1162 1210 0 1288 1289 0 1289 1162 0 1239 1238 0 1238 1221 0 1221 1239 0 1220 1221 0
		 1243 1252 0 1252 1253 0 1243 1242 0 1242 1252 0 1235 1264 0 1264 1265 0 1235 1236 0
		 1236 1264 0 1228 1473 0 1474 1473 0 1465 1217 0 1217 1231 0 1465 1464 0 1464 1217 0
		 1185 1158 0 1157 1158 0 1178 1143 0 1143 1176 0 1143 1144 0 1144 1176 0 1201 1122 0
		 1122 1203 0 1203 1201 0 1122 1123 0 1123 1203 0 1210 1163 0 1163 1209 0 1162 1163 0
		 1215 1130 0 1130 1214 0 1130 1131 0 1241 1229 0 1229 1247 0 1241 1223 0 1223 1229 0
		 1231 1249 0 1249 1227 0 1245 1227 0 1261 1237 0 1237 1260 0 1260 1261 0 1251 1260 0
		 1458 1475 0 1475 1220 0 1229 1471 0 1471 1225 0 1225 1229 0 1471 1470 0 1470 1225 0
		 1232 1461 0 1232 1462 0 1462 1461 0 1199 1198 0 1168 1153 0 1152 1153 0 1177 1140 0
		 1140 1141 0 1177 1182 0 1199 1120 0 1119 1120 0 1212 1160 0 1159 1160 0 1211 1289 0;
	setAttr ".ed[3652:3817]" 1161 1289 0 1246 1239 0 1239 1228 0 1248 1224 0 1248 1242 0
		 1242 1224 0 1236 1263 0 1263 1264 0 1236 1250 0 1273 1272 0 1470 1224 0 1224 1225 0
		 1470 1469 0 1287 1292 0 1287 1286 0 1116 1115 0 1115 1113 0 1113 1116 0 1114 1113 0
		 1195 1166 0 1166 1196 0 1195 1165 0 1165 1166 0 1175 1145 0 1145 1174 0 1145 1146 0
		 1146 1174 0 1192 1133 0 1133 1190 0 1190 1192 0 1133 1134 0 1134 1190 0 1208 1124 0
		 1124 1207 0 1124 1125 0 1129 1215 0 1215 1194 0 1129 1130 0 1243 1224 0 1243 1225 0
		 1235 1218 0 1218 1236 0 1235 1217 0 1217 1218 0 1259 1238 0 1238 1258 0 1258 1259 0
		 1239 1258 0 1223 1471 0 1472 1471 0 1182 1279 0 1182 1280 0 1280 1279 0 1114 1290 0
		 1290 1113 0 1181 1155 0 1154 1155 0 1142 1178 0 1142 1143 0 1121 1201 0 1201 1202 0
		 1121 1122 0 1241 1222 0 1244 1227 0 1226 1227 0 1234 1261 0 1261 1262 0 1196 1118 0
		 1166 1118 0 1146 1173 0 1146 1147 0 1134 1189 0 1134 1135 0 1123 1208 0 1123 1124 0
		 1236 1232 0 1218 1232 0 1239 1257 0 1257 1258 0 1242 1269 0 1269 1252 0 1177 1280 0
		 1464 1218 0 1464 1463 0 1463 1218 0 1206 1290 0 1106 1116 0 1197 1165 0 1197 1164 0
		 1164 1165 0 1144 1175 0 1144 1145 0 1132 1192 0 1132 1133 0 1209 1164 0 1163 1164 0
		 1194 1116 0 1243 1229 0 1235 1231 0 1251 1259 0 1259 1260 0 1276 1192 0 1276 1275 0
		 1467 1227 0 1467 1466 0 1463 1232 0 1463 1462 0 1117 1290 0 1322 1323 0 1323 1328 0
		 1328 1322 0 1317 1316 0 1316 1313 0 1313 1317 0 1303 1302 0 1302 1318 0 1318 1303 0
		 1302 1317 0 1317 1318 0 1319 1320 0 1320 1312 0 1312 1319 0 1320 1315 0 1315 1312 0
		 1302 1316 0 1302 1294 0 1294 1316 0 1305 1313 0 1313 1294 0 1294 1305 0 1328 1324 0
		 1324 1322 0 1328 1327 0 1327 1324 0 1306 1314 0 1314 1305 0 1305 1306 0 1314 1313 0
		 1327 1321 0 1321 1324 0 1327 1326 0 1326 1321 0 1304 1312 0 1312 1307 0 1307 1304 0
		 1315 1307 0 1312 1325 0 1325 1319 0 1325 1329 0 1329 1319 0 1315 1306 0 1306 1307 0
		 1315 1314 0 1325 1321 0 1321 1329 0 1326 1329 0 1326 1295 0 1295 1329 0 1326 1296 0
		 1296 1295 0 1311 1324 0 1324 1299 0 1299 1311 0 1321 1299 0 1319 1301 0 1301 1320 0;
	setAttr ".ed[3818:3983]" 1319 1308 0 1308 1301 0 1300 1310 0 1310 1322 0 1322 1300 0
		 1310 1323 0 1329 1308 0 1295 1308 0 1311 1322 0 1311 1300 0 1318 1320 0 1320 1303 0
		 1301 1303 0 1323 1298 0 1298 1328 0 1310 1298 0 1309 1325 0 1325 1304 0 1304 1309 0
		 1327 1296 0 1327 1297 0 1297 1296 0 1318 1314 0 1314 1320 0 1321 1309 0 1309 1299 0
		 1328 1297 0 1298 1297 0 1313 1318 0 1350 1330 0 1330 1349 0 1349 1350 0 1330 1357 0
		 1357 1349 0 1330 1356 0 1356 1357 0 1330 1355 0 1355 1356 0 1330 1354 0 1354 1355 0
		 1330 1353 0 1353 1354 0 1330 1352 0 1352 1353 0 1330 1351 0 1351 1352 0 1350 1351 0
		 1377 1378 0 1378 1358 0 1358 1377 0 1378 1379 0 1379 1358 0 1358 1385 0 1385 1377 0
		 1358 1384 0 1384 1385 0 1358 1383 0 1383 1384 0 1358 1382 0 1382 1383 0 1358 1381 0
		 1381 1382 0 1358 1380 0 1380 1381 0 1379 1380 0 1386 1393 0 1393 1387 0 1387 1386 0
		 1393 1392 0 1392 1387 0 1387 1388 0 1388 1386 0 1388 1389 0 1389 1386 0 1388 1419 0
		 1419 1389 0 1419 1418 0 1418 1389 0 1390 1395 0 1395 1391 0 1391 1390 0 1395 1394 0
		 1394 1391 0 1391 1392 0 1392 1390 0 1393 1390 0 1395 1396 0 1396 1394 0 1396 1397 0
		 1397 1394 0 1396 1399 0 1399 1397 0 1399 1398 0 1398 1397 0 1399 1400 0 1400 1398 0
		 1400 1401 0 1401 1398 0 1400 1403 0 1403 1401 0 1403 1402 0 1402 1401 0 1403 1404 0
		 1404 1402 0 1404 1405 0 1405 1402 0 1404 1406 0 1406 1405 0 1406 1407 0 1407 1405 0
		 1406 1408 0 1408 1407 0 1408 1409 0 1409 1407 0 1408 1410 0 1410 1409 0 1410 1411 0
		 1411 1409 0 1410 1412 0 1412 1411 0 1412 1413 0 1413 1411 0 1412 1415 0 1415 1413 0
		 1415 1414 0 1414 1413 0 1415 1416 0 1416 1414 0 1416 1417 0 1417 1414 0 1416 1421 0
		 1421 1417 0 1421 1420 0 1420 1417 0 1419 1420 0 1420 1418 0 1421 1418 0 1389 1357 0
		 1357 1386 0 1393 1356 0 1356 1390 0 1395 1355 0 1355 1396 0 1399 1354 0 1354 1400 0
		 1403 1353 0 1353 1404 0 1406 1352 0 1352 1408 0 1410 1351 0 1351 1412 0 1415 1350 0
		 1350 1416 0 1421 1349 0 1349 1418 0 1408 1351 0 1405 1337 0 1337 1402 0 1337 1339 0
		 1339 1402 0 1406 1353 0 1401 1338 0 1338 1398 0 1338 1331 0 1331 1398 0 1401 1339 0;
	setAttr ".ed[3984:4149]" 1339 1338 0 1336 1397 0 1397 1331 0 1331 1336 0 1344 1419 0
		 1419 1348 0 1348 1344 0 1388 1348 0 1403 1354 0 1336 1335 0 1335 1397 0 1335 1394 0
		 1344 1345 0 1345 1419 0 1345 1420 0 1333 1391 0 1391 1335 0 1335 1333 0 1420 1343 0
		 1343 1417 0 1345 1343 0 1399 1355 0 1389 1349 0 1333 1392 0 1333 1334 0 1334 1392 0
		 1343 1342 0 1342 1417 0 1342 1414 0 1346 1409 0 1409 1341 0 1341 1346 0 1411 1341 0
		 1392 1332 0 1332 1387 0 1334 1332 0 1414 1347 0 1347 1413 0 1342 1347 0 1390 1355 0
		 1416 1349 0 1332 1348 0 1348 1387 0 1347 1341 0 1341 1413 0 1407 1337 0 1407 1340 0
		 1340 1337 0 1386 1356 0 1415 1351 0 1346 1340 0 1340 1409 0 1422 1429 0 1429 1423 0
		 1423 1422 0 1429 1428 0 1428 1423 0 1423 1424 0 1424 1422 0 1424 1425 0 1425 1422 0
		 1424 1455 0 1455 1425 0 1455 1454 0 1454 1425 0 1426 1431 0 1431 1427 0 1427 1426 0
		 1431 1430 0 1430 1427 0 1427 1428 0 1428 1426 0 1429 1426 0 1431 1432 0 1432 1430 0
		 1432 1433 0 1433 1430 0 1432 1435 0 1435 1433 0 1435 1434 0 1434 1433 0 1435 1436 0
		 1436 1434 0 1436 1437 0 1437 1434 0 1436 1439 0 1439 1437 0 1439 1438 0 1438 1437 0
		 1439 1440 0 1440 1438 0 1440 1441 0 1441 1438 0 1440 1442 0 1442 1441 0 1442 1443 0
		 1443 1441 0 1442 1444 0 1444 1443 0 1444 1445 0 1445 1443 0 1444 1446 0 1446 1445 0
		 1446 1447 0 1447 1445 0 1446 1448 0 1448 1447 0 1448 1449 0 1449 1447 0 1448 1451 0
		 1451 1449 0 1451 1450 0 1450 1449 0 1451 1452 0 1452 1450 0 1452 1453 0 1453 1450 0
		 1452 1457 0 1457 1453 0 1457 1456 0 1456 1453 0 1455 1456 0 1456 1454 0 1457 1454 0
		 1425 1385 0 1385 1422 0 1429 1384 0 1384 1426 0 1431 1383 0 1383 1432 0 1435 1382 0
		 1382 1436 0 1439 1381 0 1381 1440 0 1442 1380 0 1380 1444 0 1446 1379 0 1379 1448 0
		 1451 1378 0 1378 1452 0 1457 1377 0 1377 1454 0 1444 1379 0 1441 1365 0 1365 1438 0
		 1365 1367 0 1367 1438 0 1366 1437 0 1437 1367 0 1367 1366 0 1442 1381 0 1366 1434 0
		 1366 1359 0 1359 1434 0 1364 1433 0 1433 1359 0 1359 1364 0 1372 1455 0 1455 1376 0
		 1376 1372 0 1424 1376 0 1361 1427 0 1427 1363 0 1363 1361 0 1430 1363 0 1371 1453 0;
	setAttr ".ed[4150:4315]" 1453 1373 0 1373 1371 0 1456 1373 0 1439 1382 0 1364 1363 0
		 1363 1433 0 1372 1373 0 1373 1455 0 1435 1383 0 1454 1385 0 1361 1428 0 1361 1362 0
		 1362 1428 0 1371 1450 0 1371 1370 0 1370 1450 0 1360 1423 0 1423 1362 0 1362 1360 0
		 1450 1375 0 1375 1449 0 1370 1375 0 1426 1383 0 1457 1378 0 1360 1376 0 1376 1423 0
		 1375 1447 0 1375 1369 0 1369 1447 0 1374 1445 0 1445 1369 0 1369 1374 0 1441 1368 0
		 1368 1365 0 1443 1368 0 1422 1384 0 1448 1378 0 1374 1368 0 1368 1445 0 1270 1459 0
		 1459 1287 0 1270 1458 0 1459 1286 0 1460 1286 0 1460 1285 0 1461 1285 0 1285 1462 0
		 1462 1283 0 1462 1284 0 1463 1284 0 1463 1282 0 1464 1282 0 1464 1281 0 1465 1281 0
		 1465 1280 0 1466 1280 0 1466 1279 0 1467 1279 0 1467 1278 0 1468 1278 0 1468 1277 0
		 1469 1277 0 1469 1276 0 1470 1276 0 1470 1275 0 1471 1275 0 1275 1472 0 1472 1274 0
		 1274 1473 0 1473 1273 0 1273 1474 0 1474 1272 0 1272 1475 0 1475 1271 0 1271 1458 0
		 1562 1504 0 1504 1563 0 1563 1562 0 1564 1503 0 1503 1565 0 1565 1564 0 1548 1511 0
		 1511 1549 0 1549 1548 0 1511 1550 0 1550 1549 0 1551 1510 0 1510 1552 0 1552 1551 0
		 1554 1508 0 1508 1555 0 1555 1554 0 1508 1556 0 1556 1555 0 1557 1556 0 1556 1507 0
		 1507 1557 0 1508 1507 0 1507 1558 0 1558 1557 0 1559 1506 0 1506 1560 0 1560 1559 0
		 1553 1509 0 1509 1554 0 1554 1553 0 1509 1508 0 1551 1550 0 1550 1510 0 1511 1510 0
		 1553 1552 0 1552 1509 0 1510 1509 0 1503 1548 0 1548 1565 0 1503 1511 0 1504 1564 0
		 1564 1563 0 1504 1503 0 1561 1505 0 1505 1562 0 1562 1561 0 1505 1504 0 1561 1560 0
		 1560 1505 0 1506 1505 0 1559 1558 0 1558 1506 0 1507 1506 0 1491 1500 0 1500 1490 0
		 1490 1491 0 1500 1499 0 1499 1490 0 1509 1478 0 1478 1508 0 1478 1479 0 1479 1508 0
		 1529 1528 0 1528 1531 0 1531 1529 0 1528 1530 0 1530 1531 0 1556 1537 0 1537 1555 0
		 1556 1535 0 1535 1537 0 1492 1501 0 1501 1491 0 1491 1492 0 1501 1500 0 1508 1480 0
		 1480 1507 0 1479 1480 0 1526 1528 0 1528 1527 0 1527 1526 0 1529 1527 0 1555 1539 0
		 1539 1554 0 1537 1539 0 1493 1502 0 1502 1492 0 1492 1493 0 1502 1501 0 1507 1481 0;
	setAttr ".ed[4316:4481]" 1481 1506 0 1480 1481 0 1525 1524 0 1524 1527 0 1527 1525 0
		 1524 1526 0 1554 1541 0 1541 1553 0 1539 1541 0 1548 1517 0 1517 1565 0 1548 1513 0
		 1513 1517 0 1476 1484 0 1484 1494 0 1494 1476 0 1484 1502 0 1502 1494 0 1506 1482 0
		 1482 1505 0 1481 1482 0 1522 1524 0 1524 1523 0 1523 1522 0 1525 1523 0 1546 1515 0
		 1515 1547 0 1547 1546 0 1515 1514 0 1514 1547 0 1553 1543 0 1543 1552 0 1541 1543 0
		 1565 1519 0 1519 1564 0 1517 1519 0 1496 1478 0 1478 1495 0 1495 1496 0 1478 1477 0
		 1477 1495 0 1504 1483 0 1483 1503 0 1483 1484 0 1484 1503 0 1518 1520 0 1520 1519 0
		 1519 1518 0 1520 1521 0 1521 1519 0 1542 1544 0 1544 1543 0 1543 1542 0 1544 1545 0
		 1545 1543 0 1551 1547 0 1547 1550 0 1551 1545 0 1545 1547 0 1563 1523 0 1523 1562 0
		 1563 1521 0 1521 1523 0 1477 1494 0 1494 1495 0 1477 1476 0 1505 1483 0 1482 1483 0
		 1520 1523 0 1520 1522 0 1544 1547 0 1544 1546 0 1552 1545 0 1564 1521 0 1497 1479 0
		 1479 1496 0 1496 1497 0 1502 1485 0 1485 1494 0 1493 1485 0 1517 1516 0 1516 1519 0
		 1516 1518 0 1541 1540 0 1540 1543 0 1540 1542 0 1550 1514 0 1514 1549 0 1562 1525 0
		 1525 1561 0 1498 1480 0 1480 1497 0 1497 1498 0 1486 1495 0 1495 1485 0 1485 1486 0
		 1512 1516 0 1516 1513 0 1513 1512 0 1538 1540 0 1540 1539 0 1539 1538 0 1549 1513 0
		 1514 1513 0 1561 1527 0 1527 1560 0 1499 1481 0 1481 1498 0 1498 1499 0 1487 1496 0
		 1496 1486 0 1486 1487 0 1515 1513 0 1515 1512 0 1537 1536 0 1536 1539 0 1536 1538 0
		 1560 1529 0 1529 1559 0 1500 1482 0 1482 1499 0 1488 1497 0 1497 1487 0 1487 1488 0
		 1503 1476 0 1476 1511 0 1534 1536 0 1536 1535 0 1535 1534 0 1559 1531 0 1531 1558 0
		 1501 1483 0 1483 1500 0 1489 1498 0 1498 1488 0 1488 1489 0 1511 1477 0 1477 1510 0
		 1533 1532 0 1532 1535 0 1535 1533 0 1532 1534 0 1558 1533 0 1533 1557 0 1531 1533 0
		 1484 1501 0 1499 1489 0 1489 1490 0 1510 1478 0 1530 1532 0 1532 1531 0 1557 1535 0
		 1522 1567 0 1567 1524 0 1522 1566 0 1566 1567 0 1520 1568 0 1568 1522 0 1568 1566 0
		 1546 1570 0 1570 1515 0 1546 1569 0 1569 1570 0 1544 1571 0 1571 1546 0 1571 1569 0;
	setAttr ".ed[4482:4647]" 1542 1571 0 1542 1572 0 1572 1571 0 1540 1573 0 1573 1542 0
		 1573 1572 0 1538 1573 0 1538 1574 0 1574 1573 0 1536 1575 0 1575 1538 0 1575 1574 0
		 1534 1575 0 1534 1576 0 1576 1575 0 1532 1577 0 1577 1534 0 1577 1576 0 1530 1577 0
		 1530 1578 0 1578 1577 0 1528 1579 0 1579 1530 0 1579 1578 0 1526 1579 0 1526 1580 0
		 1580 1579 0 1567 1526 0 1567 1580 0 1518 1568 0 1518 1581 0 1581 1568 0 1516 1582 0
		 1582 1518 0 1582 1581 0 1512 1582 0 1512 1583 0 1583 1582 0 1570 1512 0 1570 1583 0
		 1566 1585 0 1585 1567 0 1566 1584 0 1584 1585 0 1568 1586 0 1586 1566 0 1586 1584 0
		 1569 1587 0 1587 1570 0 1587 1588 0 1588 1570 0 1571 1589 0 1589 1569 0 1589 1587 0
		 1572 1590 0 1590 1571 0 1590 1589 0 1573 1591 0 1591 1572 0 1591 1590 0 1574 1591 0
		 1574 1592 0 1592 1591 0 1575 1592 0 1575 1593 0 1593 1592 0 1576 1593 0 1576 1594 0
		 1594 1593 0 1577 1594 0 1577 1595 0 1595 1594 0 1578 1595 0 1578 1596 0 1596 1595 0
		 1579 1596 0 1579 1597 0 1597 1596 0 1580 1597 0 1580 1598 0 1598 1597 0 1567 1598 0
		 1585 1598 0 1581 1599 0 1599 1568 0 1599 1586 0 1582 1600 0 1600 1581 0 1600 1599 0
		 1583 1601 0 1601 1582 0 1601 1600 0 1588 1583 0 1588 1601 0 1602 1610 0 1610 1603 0
		 1603 1602 0 1610 1604 0 1604 1603 0 1610 1605 0 1605 1604 0 1610 1606 0 1606 1605 0
		 1610 1607 0 1607 1606 0 1610 1608 0 1608 1607 0 1610 1609 0 1609 1608 0 1585 1602 0
		 1602 1598 0 1603 1598 0 1603 1597 0 1603 1596 0 1604 1596 0 1604 1595 0 1604 1594 0
		 1605 1594 0 1605 1593 0 1605 1592 0 1606 1592 0 1606 1591 0 1606 1590 0 1607 1590 0
		 1607 1589 0 1607 1587 0 1608 1587 0 1608 1588 0 1608 1601 0 1609 1601 0 1609 1600 0
		 1609 1599 0 1610 1599 0 1610 1586 0 1610 1584 0 1602 1584 0 1255 1257 0 1255 1258 0
		 1255 1259 0 1255 1260 0 1255 1261 0 1255 1262 0 1255 1263 0 1255 1264 0 1255 1265 0
		 1255 1266 0 1255 1267 0 1255 1268 0 1255 1269 0 1255 1252 0 1255 1253 0 1634 1733 0
		 1733 1694 0 1694 1634 0 1733 1734 0 1734 1694 0 1652 1739 0 1739 1653 0 1653 1652 0
		 1739 1740 0 1740 1653 0 1626 1611 0 1611 1628 0 1628 1626 0 1611 1612 0 1612 1628 0;
	setAttr ".ed[4648:4813]" 1630 1618 0 1618 1626 0 1626 1630 0 1618 1611 0 1624 1742 0
		 1742 1718 0 1718 1624 0 1742 1743 0 1743 1718 0 1617 1618 0 1618 1637 0 1637 1617 0
		 1630 1637 0 1644 1642 0 1642 1731 0 1731 1644 0 1642 1730 0 1730 1731 0 1637 1641 0
		 1641 1617 0 1641 1620 0 1620 1617 0 1619 1620 0 1620 1638 0 1638 1619 0 1641 1638 0
		 1615 1650 0 1650 1614 0 1614 1615 0 1650 1649 0 1649 1614 0 1613 1619 0 1619 1647 0
		 1647 1613 0 1638 1647 0 1625 1741 0 1741 1624 0 1624 1625 0 1741 1742 0 1643 1621 0
		 1621 1649 0 1649 1643 0 1621 1614 0 1648 1729 0 1729 1642 0 1642 1648 0 1729 1730 0
		 1643 1623 0 1623 1621 0 1643 1645 0 1645 1623 0 1717 1744 0 1744 1712 0 1712 1717 0
		 1744 1745 0 1745 1712 0 1622 1623 0 1623 1633 0 1633 1622 0 1645 1633 0 1634 1632 0
		 1632 1733 0 1632 1732 0 1732 1733 0 1616 1622 0 1622 1635 0 1635 1616 0 1633 1635 0
		 1657 1656 0 1656 1658 0 1658 1657 0 1656 1659 0 1659 1658 0 1660 1661 0 1661 1670 0
		 1670 1660 0 1661 1671 0 1671 1670 0 1663 1667 0 1667 1662 0 1662 1663 0 1667 1666 0
		 1666 1662 0 1670 1657 0 1657 1660 0 1658 1660 0 1666 1661 0 1661 1662 0 1666 1671 0
		 1709 1727 0 1727 1651 0 1651 1709 0 1727 1728 0 1728 1651 0 1716 1737 0 1737 1715 0
		 1715 1716 0 1737 1738 0 1738 1715 0 1740 1625 0 1625 1653 0 1740 1741 0 1728 1648 0
		 1648 1651 0 1728 1729 0 1713 1712 0 1712 1746 0 1746 1713 0 1745 1746 0 1675 1698 0
		 1698 1676 0 1676 1675 0 1698 1699 0 1699 1676 0 1680 1681 0 1681 1679 0 1679 1680 0
		 1681 1682 0 1682 1679 0 1695 1696 0 1696 1685 0 1685 1695 0 1696 1686 0 1686 1685 0
		 1691 1692 0 1692 1690 0 1690 1691 0 1692 1689 0 1689 1690 0 1682 1612 0 1612 1679 0
		 1682 1628 0 1690 1616 0 1616 1691 0 1635 1691 0 1692 1686 0 1686 1689 0 1696 1689 0
		 1685 1723 0 1723 1695 0 1723 1724 0 1724 1695 0 1675 1680 0 1680 1698 0 1675 1681 0
		 1720 1721 0 1721 1674 0 1674 1720 0 1721 1697 0 1697 1674 0 1702 1703 0 1703 1701 0
		 1701 1702 0 1703 1700 0 1700 1701 0 1705 1707 0 1707 1704 0 1704 1705 0 1707 1706 0
		 1706 1704 0 1701 1613 0 1613 1702 0 1647 1702 0 1706 1615 0 1615 1704 0 1706 1650 0;
	setAttr ".ed[4814:4979]" 1703 1659 0 1659 1700 0 1656 1700 0 1663 1705 0 1705 1667 0
		 1663 1707 0 1708 1665 0 1665 1726 0 1726 1708 0 1665 1725 0 1725 1726 0 1734 1693 0
		 1693 1694 0 1734 1735 0 1735 1693 0 1714 1713 0 1713 1747 0 1747 1714 0 1746 1747 0
		 1722 1683 0 1683 1736 0 1736 1722 0 1683 1684 0 1684 1736 0 1673 1714 0 1714 1748 0
		 1748 1673 0 1747 1748 0 1672 1673 0 1673 1719 0 1719 1672 0 1748 1719 0 1684 1735 0
		 1735 1736 0 1684 1693 0 1709 1708 0 1708 1727 0 1726 1727 0 1738 1652 0 1652 1715 0
		 1738 1739 0 1725 1655 0 1655 1716 0 1716 1725 0 1655 1654 0 1654 1716 0 1669 1668 0
		 1668 1737 0 1737 1669 0 1668 1710 0 1710 1737 0 1632 1644 0 1644 1732 0 1731 1732 0
		 1743 1717 0 1717 1718 0 1743 1744 0 1720 1699 0 1699 1721 0 1720 1676 0 1723 1697 0
		 1697 1724 0 1723 1674 0 1725 1715 0 1715 1726 0 1715 1727 0 1652 1727 0 1652 1728 0
		 1653 1728 0 1653 1729 0 1625 1729 0 1625 1730 0 1624 1730 0 1624 1731 0 1718 1731 0
		 1718 1732 0 1717 1732 0 1732 1712 0 1712 1733 0 1712 1734 0 1713 1734 0 1713 1735 0
		 1714 1735 0 1673 1736 0 1736 1714 0 1710 1738 0 1710 1711 0 1711 1738 0 1711 1739 0
		 1711 1646 0 1646 1739 0 1646 1740 0 1646 1639 0 1639 1740 0 1639 1741 0 1639 1640 0
		 1640 1741 0 1640 1742 0 1640 1636 0 1636 1742 0 1636 1743 0 1636 1631 0 1631 1743 0
		 1631 1744 0 1631 1627 0 1627 1744 0 1627 1745 0 1627 1629 0 1629 1745 0 1745 1687 0
		 1687 1746 0 1629 1687 0 1746 1688 0 1688 1747 0 1687 1688 0 1747 1677 0 1677 1748 0
		 1688 1677 0 1748 1678 0 1678 1719 0 1677 1678 0 1673 1722 0 1672 1722 0 1725 1664 0
		 1664 1655 0 1665 1664 0 1716 1669 0 1654 1669 0 1659 1776 0 1776 1658 0 1776 1777 0
		 1777 1658 0 1658 1778 0 1778 1660 0 1777 1778 0 1660 1779 0 1779 1661 0 1778 1779 0
		 1661 1780 0 1780 1662 0 1779 1780 0 1662 1781 0 1781 1663 0 1780 1781 0 1663 1782 0
		 1782 1707 0 1781 1782 0 1707 1749 0 1749 1706 0 1782 1749 0 1749 1650 0 1749 1750 0
		 1750 1650 0 1750 1649 0 1750 1751 0 1751 1649 0 1751 1643 0 1751 1752 0 1752 1643 0
		 1752 1645 0 1752 1753 0 1753 1645 0 1645 1754 0 1754 1633 0 1753 1754 0 1633 1755 0;
	setAttr ".ed[4980:5111]" 1755 1635 0 1754 1755 0 1635 1756 0 1756 1691 0 1755 1756 0
		 1691 1757 0 1757 1692 0 1756 1757 0 1692 1758 0 1758 1686 0 1757 1758 0 1686 1759 0
		 1759 1685 0 1758 1759 0 1685 1760 0 1760 1723 0 1759 1760 0 1723 1761 0 1761 1674 0
		 1760 1761 0 1761 1720 0 1761 1762 0 1762 1720 0 1762 1676 0 1762 1763 0 1763 1676 0
		 1763 1675 0 1763 1764 0 1764 1675 0 1764 1681 0 1764 1765 0 1765 1681 0 1765 1682 0
		 1765 1766 0 1766 1682 0 1766 1628 0 1766 1767 0 1767 1628 0 1767 1626 0 1767 1768 0
		 1768 1626 0 1768 1630 0 1768 1769 0 1769 1630 0 1630 1770 0 1770 1637 0 1769 1770 0
		 1770 1641 0 1770 1771 0 1771 1641 0 1771 1638 0 1771 1772 0 1772 1638 0 1772 1647 0
		 1772 1773 0 1773 1647 0 1773 1702 0 1773 1774 0 1774 1702 0 1774 1703 0 1774 1775 0
		 1775 1703 0 1775 1659 0 1775 1776 0 1651 1750 0 1750 1709 0 1749 1709 0 1648 1751 0
		 1751 1651 0 1642 1752 0 1752 1648 0 1644 1752 0 1644 1753 0 1632 1753 0 1632 1754 0
		 1634 1754 0 1634 1755 0 1694 1755 0 1694 1756 0 1693 1756 0 1693 1757 0 1684 1757 0
		 1684 1758 0 1683 1758 0 1683 1759 0 1722 1759 0 1722 1760 0 1672 1760 0 1672 1761 0
		 1719 1762 0 1762 1672 0 1678 1763 0 1763 1719 0 1677 1764 0 1764 1678 0 1688 1765 0
		 1765 1677 0 1687 1766 0 1766 1688 0 1629 1767 0 1767 1687 0 1627 1768 0 1768 1629 0
		 1631 1769 0 1769 1627 0 1636 1770 0 1770 1631 0 1640 1770 0 1640 1771 0 1639 1771 0
		 1639 1772 0 1646 1772 0 1646 1773 0 1711 1773 0 1711 1774 0 1710 1774 0 1710 1775 0
		 1668 1775 0 1668 1776 0 1669 1776 0 1669 1777 0 1654 1777 0 1654 1778 0 1655 1778 0
		 1655 1779 0 1664 1779 0 1664 1780 0 1665 1781 0 1781 1664 0 1665 1782 0 1708 1782 0
		 1749 1708 0;
	setAttr -s 10005 ".n";
	setAttr ".n[0:165]" -type "float3"  -0.93012851 -0.31639799 -0.18642212 -0.79264104
		 -0.51804304 -0.32148349 -0.88996571 -0.44654852 -0.092495658 -0.79264104 -0.51804304
		 -0.32148349 -0.74421799 -0.65492338 -0.13120565 -0.88996571 -0.44654852 -0.092495658
		 -0.81668323 0.44178563 -0.37128687 -0.69553143 0.56431758 -0.44472659 -0.60513681
		 0.6211403 -0.4979901 -0.69553143 0.56431758 -0.44472659 -0.57686752 0.64719594 -0.49835861
		 -0.60513681 0.6211403 -0.4979901 -0.60513681 0.6211403 -0.4979901 -0.45186505 0.66529441
		 -0.59430742 -0.31906772 0.74305308 -0.58827537 -0.45186505 0.66529441 -0.59430742
		 -0.21979007 0.77321953 -0.59483093 -0.31906772 0.74305308 -0.58827537 0.98435187
		 0.0063033937 -0.17610115 0.95777249 0.14541641 -0.24804428 0.94987291 0.1108272 -0.29233336
		 0.95777249 0.14541641 -0.24804428 0.89207023 0.25964049 -0.36986148 0.94987291 0.1108272
		 -0.29233336 0.74127632 -0.46019942 -0.48859584 0.3364042 -0.62996179 -0.69998598
		 0.7299282 -0.31120253 -0.60857034 0.3364042 -0.62996179 -0.69998598 0.33076423 -0.41769329
		 -0.84624308 0.7299282 -0.31120253 -0.60857034 -0.81417054 -0.39761481 -0.42311803
		 -0.5273779 -0.57616562 -0.62442428 -0.79264104 -0.51804304 -0.32148349 -0.5273779
		 -0.57616562 -0.62442428 -0.48219365 -0.7564888 -0.44183025 -0.79264104 -0.51804304
		 -0.32148349 -0.86808842 -0.44404003 0.22192562 -0.82382631 -0.4893733 0.28604895
		 -0.86053807 -0.48004016 0.17039862 -0.82382631 -0.4893733 0.28604895 -0.80061978
		 -0.55641729 0.22227867 -0.86053807 -0.48004016 0.17039862 -0.90957713 -0.40539381
		 -0.091242857 -0.87118334 -0.4780964 0.11163983 -0.79711467 -0.60289466 0.033559222
		 -0.87118334 -0.4780964 0.11163983 -0.77877641 -0.61276221 0.13427515 -0.79711467
		 -0.60289466 0.033559222 0.95724863 0.0030751403 -0.28925002 0.97058749 -0.082424134
		 -0.2261994 0.91186607 -0.11888491 -0.39289516 0.97058749 -0.082424134 -0.2261994
		 0.91797256 -0.17251985 -0.35716003 0.91186607 -0.11888491 -0.39289516 -0.93268538
		 -0.13941853 -0.33265674 -0.81836426 -0.27305993 -0.50568587 -0.92902386 -0.25379157
		 -0.26926669 -0.81836426 -0.27305993 -0.50568587 -0.81417054 -0.39761481 -0.42311803
		 -0.92902386 -0.25379157 -0.26926669 0.68826032 -0.12656619 -0.714338 0.7299282 -0.31120253
		 -0.60857034 0.34239918 -0.1664394 -0.92469496 0.7299282 -0.31120253 -0.60857034 0.33076423
		 -0.41769329 -0.84624308 0.34239918 -0.1664394 -0.92469496 0.92047763 -0.2551837 -0.29597667
		 0.9741255 -0.14827041 -0.17057365 0.91407585 -0.35735875 -0.19172904 0.9741255 -0.14827041
		 -0.17057365 0.97028315 -0.18760987 -0.15281723 0.91407585 -0.35735875 -0.19172904
		 0.34239918 -0.1664394 -0.92469496 0.33061299 0.038162164 -0.94299453 0.68826032 -0.12656619
		 -0.714338 0.33061299 0.038162164 -0.94299453 0.63626152 0.047949523 -0.76998192 0.68826032
		 -0.12656619 -0.714338 -0.78218156 0.0097510191 -0.62297428 -0.89806581 0.012964822
		 -0.43967003 -0.70814073 0.2359145 -0.66549313 -0.89806581 0.012964822 -0.43967003
		 -0.86301792 0.1582863 -0.4797349 -0.70814073 0.2359145 -0.66549313 0.34239918 -0.1664394
		 -0.92469496 0.33076423 -0.41769329 -0.84624308 -0.063669272 -0.20758377 -0.976143
		 0.33076423 -0.41769329 -0.84624308 -0.076087862 -0.46115249 -0.88405263 -0.063669272
		 -0.20758377 -0.976143 -0.74421799 -0.65492338 -0.13120565 -0.74379373 -0.66658401
		 0.04936171 -0.88996571 -0.44654852 -0.092495658 -0.74379373 -0.66658401 0.04936171
		 -0.85921848 -0.50882035 0.053342801 -0.88996571 -0.44654852 -0.092495658 -0.076087862
		 -0.46115249 -0.88405263 -0.066994667 -0.66711468 -0.74193645 -0.53863394 -0.39507368
		 -0.74417084 -0.066994667 -0.66711468 -0.74193645 -0.5273779 -0.57616562 -0.62442428
		 -0.53863394 -0.39507368 -0.74417084 -0.92835766 0.24807025 -0.27679095 -0.85178143
		 0.39670947 -0.3421841 -0.93701845 0.23326164 -0.25997195 -0.85178143 0.39670947 -0.3421841
		 -0.81668323 0.44178563 -0.37128687 -0.93701845 0.23326164 -0.25997195 0.42743999
		 0.82819861 -0.36246678 0.4969826 0.79852229 -0.33966228 0.522425 0.78543979 -0.33189824
		 0.4969826 0.79852229 -0.33966228 0.55302399 0.77081436 -0.31624314 0.522425 0.78543979
		 -0.33189824 -0.90797877 -0.33900374 0.24627426 -0.80772716 -0.46222955 0.36595172
		 -0.86808842 -0.44404003 0.22192562 -0.80772716 -0.46222955 0.36595172 -0.82382631
		 -0.4893733 0.28604895 -0.86808842 -0.44404003 0.22192562 0.91770685 -0.2941469 -0.26700526
		 0.87393111 -0.42873058 -0.22898576 0.91907173 -0.34422615 -0.19187368 0.87393111
		 -0.42873058 -0.22898576 0.88074434 -0.44626716 -0.15854022 0.91907173 -0.34422615
		 -0.19187368 0.84886909 -0.52644503 -0.047717161 0.88521045 -0.46502122 0.012557453
		 0.88781506 -0.4541381 -0.074451387 0.88521045 -0.46502122 0.012557453 0.86711419
		 -0.49382347 -0.065202512 0.88781506 -0.4541381 -0.074451387 -0.21979007 0.77321953
		 -0.59483093 3.2959051e-06 0.79200685 -0.6105122 -0.31906772 0.74305308 -0.58827537
		 3.2959051e-06 0.79200685 -0.6105122 0.0012789979 0.78851217 -0.61501783 -0.31906772
		 0.74305308 -0.58827537 0.68886167 0.5182839 -0.50680506 0.50226986 0.60720193 -0.61565471
		 0.62297237 0.55108547 -0.5551669 0.0012789979 0.78851217 -0.61501783 3.2959051e-06
		 0.79200685 -0.6105122 0.35883802 0.72143924 -0.59225053 3.2959051e-06 0.79200685
		 -0.6105122 0.21979031 0.77321947 -0.59483093 0.35883802 0.72143924 -0.59225053 0.92502838
		 -0.14334965 -0.35181442 0.94648951 -0.18457772 -0.26474261 0.93137014 -0.051763251
		 -0.36037517 0.94648951 -0.18457772 -0.26474261 0.96979862 -0.023734571 -0.24274935
		 0.93137014 -0.051763251 -0.36037517 0.66571611 0.66116691 -0.34594846 0.67432106
		 0.65689319 -0.33731648 0.64954567 0.6889717 -0.32157168 0.67432106 0.65689319 -0.33731648
		 0.64183253 0.70173794 -0.30921662 0.64954567 0.6889717 -0.32157168 0.61282641 0.73132116
		 -0.29935464 0.62252432 0.71912515 -0.30874345 0.64183253 0.70173794 -0.30921662 0.62252432
		 0.71912515 -0.30874345 0.64954567 0.6889717 -0.32157168 0.64183253 0.70173794 -0.30921662
		 0.63626152 0.047949523 -0.76998192;
	setAttr ".n[166:331]" -type "float3"  0.65161461 0.27763927 -0.70591414 0.88600153
		 0.0087278998 -0.46360022 0.65161461 0.27763927 -0.70591414 0.89197224 0.15639158
		 -0.42417824 0.88600153 0.0087278998 -0.46360022 0.65161461 0.27763927 -0.70591414
		 0.68152291 0.39510205 -0.61597145 0.89197224 0.15639158 -0.42417824 0.68152291 0.39510205
		 -0.61597145 0.90524489 0.19736239 -0.37627095 0.89197224 0.15639158 -0.42417824 -0.75056648
		 0.54247338 -0.37732294 -0.81668323 0.44178563 -0.37128687 -0.85178143 0.39670947
		 -0.3421841 -0.92835766 0.24807025 -0.27679095 -0.94312739 0.17473699 -0.28280324
		 -0.85178143 0.39670947 -0.3421841 -0.55690426 0.76804179 -0.31617942 -0.4969824 0.79852241
		 -0.33966219 -0.5239284 0.78465462 -0.33138528 -0.4969824 0.79852241 -0.33966219 -0.42743978
		 0.82819867 -0.36246687 -0.5239284 0.78465462 -0.33138528 -0.65837318 0.67193615 -0.33918512
		 -0.65965414 0.67610246 -0.32824066 -0.68077242 0.64806932 -0.34140167 -0.65965414
		 0.67610246 -0.32824066 -0.69439465 0.63764364 -0.33350655 -0.68077242 0.64806932
		 -0.34140167 -0.65837318 0.67193615 -0.33918512 -0.62679553 0.71712458 -0.3047289
		 -0.65965414 0.67610246 -0.32824066 -0.62679553 0.71712458 -0.3047289 -0.61589116
		 0.72865236 -0.29957265 -0.65965414 0.67610246 -0.32824066 -0.88996571 -0.44654852
		 -0.092495658 -0.95242596 -0.30469197 -0.0068982346 -0.93012851 -0.31639799 -0.18642212
		 0.77927482 -0.60622829 -0.15880199 0.8810299 -0.46884376 -0.063022435 0.79248166
		 -0.59161836 -0.14819098 0.8810299 -0.46884376 -0.063022435 0.91380185 -0.40232408
		 0.055691745 0.79248166 -0.59161836 -0.14819098 0.35638639 0.92904472 -0.099321157
		 0.47107208 0.87495649 -0.1119919 0.7171827 0.64725733 -0.25827673 0.47107208 0.87495649
		 -0.1119919 0.71733934 0.6447286 -0.26410103 0.7171827 0.64725733 -0.25827673 -0.71733922
		 0.64472872 -0.26410088 -0.46809345 0.87671947 -0.11068612 -0.71716875 0.64727598
		 -0.25826871 -0.46809345 0.87671947 -0.11068612 -0.35780936 0.92865992 -0.097791538
		 -0.71716875 0.64727598 -0.25826871 0.71733934 0.6447286 -0.26410103 0.72858721 0.62933987
		 -0.27035534 0.7171827 0.64725733 -0.25827673 0.72858721 0.62933987 -0.27035534 0.73542416
		 0.62647527 -0.25822467 0.7171827 0.64725733 -0.25827673 -0.71733922 0.64472872 -0.26410088
		 -0.71716875 0.64727598 -0.25826871 -0.72858703 0.62934005 -0.27035528 -0.71716875
		 0.64727598 -0.25826871 -0.7354241 0.62647527 -0.2582249 -0.72858703 0.62934005 -0.27035528
		 0.61167496 -0.55709314 0.5616948 0.67842782 -0.54016006 0.49795863 0.79398781 -0.44336423
		 0.41594645 0.943694 -0.23213789 0.2356983 0.95236969 -0.21862268 0.21259385 0.98496509
		 -0.12044101 0.12384583 0.95236969 -0.21862268 0.21259385 0.98849189 -0.10907687 0.10481438
		 0.98496509 -0.12044101 0.12384583 0.45031467 -0.58704752 0.67274946 0.48213807 -0.71444237
		 0.50706506 0.29238617 -0.7137385 0.63646495 0.29238617 -0.7137385 0.63646495 0.30444002
		 -0.58477902 0.75189739 0.45031467 -0.58704752 0.67274946 0.30444002 -0.58477902 0.75189739
		 0.44422942 -0.53850567 0.71601111 0.45031467 -0.58704752 0.67274946 0.94581515 0.21763749
		 -0.24097225 0.94769126 0.22303414 -0.22833541 0.8826375 0.32687086 -0.33779654 0.94769126
		 0.22303414 -0.22833541 0.8875711 0.34191197 -0.30872923 0.8826375 0.32687086 -0.33779654
		 0.9833976 0.13789546 -0.1179578 0.99005365 0.081190743 -0.11489934 0.9556306 0.21656448
		 -0.19967481 0.99005365 0.081190743 -0.11489934 0.99221611 0.067236632 -0.10481612
		 0.9556306 0.21656448 -0.19967481 0.9833976 0.13789546 -0.1179578 0.9556306 0.21656448
		 -0.19967481 0.94769126 0.22303414 -0.22833541 0.45031467 -0.58704752 0.67274946 0.59563684
		 -0.57091284 0.56504452 0.48213807 -0.71444237 0.50706506 0.59563684 -0.57091284 0.56504452
		 0.72316688 -0.60477269 0.3335861 0.48213807 -0.71444237 0.50706506 0.44422942 -0.53850567
		 0.71601111 0.30444002 -0.58477902 0.75189739 0.48150185 -0.53988522 0.69042009 0.30444002
		 -0.58477902 0.75189739 0.33709374 -0.62744665 0.70191061 0.48150185 -0.53988522 0.69042009
		 0.48150185 -0.53988522 0.69042009 0.33709374 -0.62744665 0.70191061 0.57124817 -0.55763233
		 0.60226387 0.33709374 -0.62744665 0.70191061 0.61167496 -0.55709314 0.5616948 0.57124817
		 -0.55763233 0.60226387 0.79398781 -0.44336423 0.41594645 0.67842782 -0.54016006 0.49795863
		 0.8623786 -0.36824733 0.34741479 0.67842782 -0.54016006 0.49795863 0.86391014 -0.36709058
		 0.34482422 0.8623786 -0.36824733 0.34741479 0.98496509 -0.12044101 0.12384583 0.98849189
		 -0.10907687 0.10481438 0.99742973 -0.069281936 0.018275481 0.98849189 -0.10907687
		 0.10481438 0.99854934 -0.052945275 0.0098013068 0.99742973 -0.069281936 0.018275481
		 0.99181116 -0.10112387 0.078003936 0.99321145 -0.1083044 0.042439837 0.99920672 -0.039429139
		 0.0055972142 0.99321145 -0.1083044 0.042439837 0.99884129 -0.042590592 -0.022409128
		 0.99920672 -0.039429139 0.0055972142 -0.50449312 -0.61063224 0.61042196 -0.50870937
		 -0.58424139 0.63235807 -0.42194641 -0.58782262 0.69023609 -0.30805421 -0.52883554
		 0.79084486 -0.30161199 -0.55574477 0.77471155 -0.16887671 -0.48919937 0.85566622
		 0.8875711 0.34191197 -0.30872923 0.9556306 0.21656448 -0.19967481 0.88261151 0.35036644
		 -0.31343305 0.9556306 0.21656448 -0.19967481 0.9613905 0.19663273 -0.19251972 0.88261151
		 0.35036644 -0.31343305 0.94581515 0.21763749 -0.24097225 0.8826375 0.32687086 -0.33779654
		 0.95777249 0.14541641 -0.24804428 0.8826375 0.32687086 -0.33779654 0.89207023 0.25964049
		 -0.36986148 0.95777249 0.14541641 -0.24804428 0.98587775 -0.12583847 -0.11049762
		 0.96844184 -0.21371609 -0.12824138 0.96756029 -0.25263074 0.0021767577 0.96844184
		 -0.21371609 -0.12824138 0.9482643 -0.31728086 -0.011299993 0.96756029 -0.25263074
		 0.0021767577 0.9482643 -0.31728086 -0.011299993 0.87653941 -0.46207604 0.1347755
		 0.96756029 -0.25263074 0.0021767577 0.87653941 -0.46207604 0.1347755 0.89240193 -0.38005844
		 0.24325781;
	setAttr ".n[332:497]" -type "float3"  0.96756029 -0.25263074 0.0021767577 0.78256196
		 -0.43312281 0.4472152 0.89240193 -0.38005844 0.24325781 0.72316688 -0.60477269 0.3335861
		 0.89240193 -0.38005844 0.24325781 0.87653941 -0.46207604 0.1347755 0.72316688 -0.60477269
		 0.3335861 0.50392032 -0.61096156 0.61056554 0.42129797 -0.58849984 0.69005507 0.50739568
		 -0.58528161 0.63245159 0.16858619 -0.4895359 0.85553098 0.30792359 -0.52924275 0.79062325
		 0.12957968 -0.47134644 0.87237698 0.30792359 -0.52924275 0.79062325 0.24072877 -0.49322212
		 0.8359316 0.12957968 -0.47134644 0.87237698 0.42129797 -0.58849984 0.69005507 0.30792359
		 -0.52924275 0.79062325 0.30101588 -0.55650347 0.77439868 -0.4253405 -0.78144211 0.45654538
		 -0.42978662 -0.84429204 0.32008505 -0.032404736 -0.85560393 0.51661581 -0.42978662
		 -0.84429204 0.32008505 -0.035561107 -0.93088824 0.36356911 -0.032404736 -0.85560393
		 0.51661581 0.004186573 0.78563541 -0.61867559 -0.31374761 0.74101484 -0.59368294
		 0.0012789979 0.78851217 -0.61501783 -0.31374761 0.74101484 -0.59368294 -0.31906772
		 0.74305308 -0.58827537 0.0012789979 0.78851217 -0.61501783 0.3364042 -0.62996179
		 -0.69998598 0.33820435 -0.80303121 -0.49067163 -0.066994667 -0.66711468 -0.74193645
		 0.33820435 -0.80303121 -0.49067163 -0.079354182 -0.84946537 -0.5216431 -0.066994667
		 -0.66711468 -0.74193645 0.99321145 -0.1083044 0.042439837 0.99082285 -0.13514519
		 -0.0024256725 0.99884129 -0.042590592 -0.022409128 0.99082285 -0.13514519 -0.0024256725
		 0.99592543 -0.065987624 -0.061466716 0.99884129 -0.042590592 -0.022409128 0.68152291
		 0.39510205 -0.61597145 0.67833167 0.49581343 -0.5422501 0.90524489 0.19736239 -0.37627095
		 0.67833167 0.49581343 -0.5422501 0.9076317 0.26611984 -0.3246305 0.90524489 0.19736239
		 -0.37627095 0.66993523 0.55959487 -0.48789385 0.66472489 0.57283485 -0.47958425 0.88261151
		 0.35036644 -0.31343305 0.66472489 0.57283485 -0.47958425 0.8875711 0.34191197 -0.30872923
		 0.88261151 0.35036644 -0.31343305 0.72701013 -0.67494905 -0.12609559 0.88985777 -0.44543105
		 -0.098713525 0.70267147 -0.70893914 0.060481738 0.88985777 -0.44543105 -0.098713525
		 0.85077262 -0.52461046 0.031141339 0.70267147 -0.70893914 0.060481738 0.93836027
		 -0.33586019 0.081718937 0.92805707 -0.37237456 0.0068738195 0.98445475 -0.16798913
		 -0.051268566 0.92805707 -0.37237456 0.0068738195 0.95649779 -0.26564014 -0.12061216
		 0.98445475 -0.16798913 -0.051268566 0.27770972 -0.95375407 -0.11502393 0.54202789
		 -0.83049709 -0.12837587 0.25580376 -0.92671645 -0.27524731 0.54202789 -0.83049709
		 -0.12837587 0.55469638 -0.79980075 -0.22941385 0.25580376 -0.92671645 -0.27524731
		 -0.61394888 0.57949507 -0.53595918 -0.82895839 0.37836966 -0.41190335 -0.58405626
		 0.61048996 -0.53495818 -0.82895839 0.37836966 -0.41190335 -0.81080323 0.41160041
		 -0.41615283 -0.58405626 0.61048996 -0.53495818 -0.70814073 0.2359145 -0.66549313
		 -0.86301792 0.1582863 -0.4797349 -0.68197066 0.37910682 -0.62545508 -0.86301792 0.1582863
		 -0.4797349 -0.87014186 0.24288155 -0.42879102 -0.68197066 0.37910682 -0.62545508
		 -0.81184357 -0.49291548 0.31296062 -0.83737296 -0.47044823 0.27836117 -0.66899717
		 -0.58427984 0.45941254 -0.83737296 -0.47044823 0.27836117 -0.70671803 -0.57864982
		 0.40707994 -0.66899717 -0.58427984 0.45941254 -0.93701845 0.23326164 -0.25997195
		 -0.99385732 -0.044407714 -0.10136847 -0.92835766 0.24807025 -0.27679095 -0.99385732
		 -0.044407714 -0.10136847 -0.99225181 -0.032287393 -0.11997435 -0.92835766 0.24807025
		 -0.27679095 -0.13865659 0.98450696 -0.1073332 -0.22170463 0.97056782 -0.094048455
		 -0.14018399 0.98431885 -0.1070743 -0.22170463 0.97056782 -0.094048455 -0.22109844
		 0.97065252 -0.094599843 -0.14018399 0.98431885 -0.1070743 0.0030450723 0.99508286
		 0.098999023 0.012053722 0.99620962 0.086145997 0.0029300759 0.99514323 0.098393977
		 0.012053722 0.99620962 0.086145997 0.012159568 0.99622971 0.085898608 0.0029300759
		 0.99514323 0.098393977 -0.62679553 0.71712458 -0.3047289 -0.59551769 0.74356097 -0.3040984
		 -0.61589116 0.72865236 -0.29957265 -0.59551769 0.74356097 -0.3040984 -0.58303452
		 0.7539584 -0.3026838 -0.61589116 0.72865236 -0.29957265 -0.89113158 0.25189582 -0.37740296
		 -0.83608109 0.043210968 -0.54690146 -0.92472774 0.17890209 -0.33596522 -0.83608109
		 0.043210968 -0.54690146 -0.86290973 -0.028915389 -0.50453019 -0.92472774 0.17890209
		 -0.33596522 -0.71078163 -0.70237446 -0.038205586 -0.70617557 -0.70771348 0.021393267
		 -0.75190932 -0.64099795 0.15412341 -0.70617557 -0.70771348 0.021393267 -0.71521515
		 -0.66329634 0.22023894 -0.75190932 -0.64099795 0.15412341 -0.99611503 -0.026723288
		 0.08390899 -0.96778452 -0.22675686 -0.10942759 -0.98604631 -0.10706043 0.12747854
		 -0.96778452 -0.22675686 -0.10942759 -0.94941574 -0.30610654 -0.070061281 -0.98604631
		 -0.10706043 0.12747854 -0.91529256 0.37830669 -0.13828798 -0.92472774 0.17890209
		 -0.33596522 -0.95036972 0.29702017 -0.092608824 -0.92472774 0.17890209 -0.33596522
		 -0.95328742 0.096820876 -0.28612733 -0.95036972 0.29702017 -0.092608824 -0.55454308
		 0.58676463 -0.59007567 -0.64400381 0.52878302 -0.55285406 -0.53344876 0.76866406
		 -0.35297021 -0.64400381 0.52878302 -0.55285406 -0.61965823 0.71474433 -0.32429045
		 -0.53344876 0.76866406 -0.35297021 -0.71351361 -0.54620427 0.43881565 -0.64304936
		 -0.58069563 0.49927956 -0.69413286 -0.40319315 0.59633458 -0.64304936 -0.58069563
		 0.49927956 -0.61370939 -0.45667991 0.64405292 -0.69413286 -0.40319315 0.59633458
		 0.88261151 0.35036644 -0.31343305 0.9613905 0.19663273 -0.19251972 0.88974154 0.33450446
		 -0.31059104 0.9613905 0.19663273 -0.19251972 0.96690524 0.16734321 -0.19258898 0.88974154
		 0.33450446 -0.31059104 0.95328736 0.096820898 -0.28612736 0.96933353 0.020001357
		 -0.24493349 0.88492769 -0.10373009 -0.45402977 0.96933353 0.020001357 -0.24493349
		 0.89223808 -0.18061014 -0.41387334 0.88492769 -0.10373009 -0.45402977 0.23498091
		 0.7034077 -0.67082161 0.22208382 0.47460511 -0.85172105 0.11890284 0.72156405 -0.6820612;
	setAttr ".n[498:663]" -type "float3"  0.22208382 0.47460511 -0.85172105 0.11524539
		 0.48986095 -0.86414969 0.11890284 0.72156405 -0.6820612 0.98604625 -0.10706042 0.12747897
		 0.96423936 -0.19491331 0.17958628 0.94941574 -0.30610654 -0.070060946 0.96423936
		 -0.19491331 0.17958628 0.91979563 -0.39163825 -0.02440328 0.94941574 -0.30610654
		 -0.070060946 0.87622833 0.44893658 -0.17515676 0.91529262 0.37830672 -0.13828768
		 0.89113146 0.25189599 -0.3774032 0.91529262 0.37830672 -0.13828768 0.92472762 0.1789021
		 -0.33596557 0.89113146 0.25189599 -0.3774032 0.4567548 0.63459885 -0.62342554 0.4395465
		 0.8138395 -0.38008437 0.55454308 0.58676451 -0.59007573 0.4395465 0.8138395 -0.38008437
		 0.53344887 0.768664 -0.35297024 0.55454308 0.58676451 -0.59007573 0.69417828 -0.71369714
		 0.093557164 0.67357516 -0.67343462 0.30460188 0.68389821 -0.69566905 0.21983585 0.67357516
		 -0.67343462 0.30460188 0.61875415 -0.67276931 0.40561649 0.68389821 -0.69566905 0.21983585
		 -0.28490084 -0.89029545 -0.35525417 -0.54972237 -0.78133655 -0.295497 -0.25864512
		 -0.92851871 -0.26637512 -0.54972237 -0.78133655 -0.295497 -0.49723831 -0.84923148
		 -0.17765106 -0.25864512 -0.92851871 -0.26637512 0.76262319 -0.33768669 0.55170059
		 0.74743193 -0.2455506 0.61729276 0.69413269 -0.40319318 0.5963347 0.74743193 -0.2455506
		 0.61729276 0.67820299 -0.32044953 0.66132653 0.69413269 -0.40319318 0.5963347 0.47210178
		 0.88009399 0.050541528 0.53548026 0.84271103 0.055668723 0.54572451 0.83303243 -0.090783715
		 0.54572451 0.83303243 -0.090783715 0.53548026 0.84271103 0.055668723 0.6182031 0.78266275
		 -0.072553232 0.53548026 0.84271103 0.055668723 0.61290234 0.78715676 0.06881085 0.6182031
		 0.78266275 -0.072553232 0.87990391 0.007325714 0.47509518 0.84353757 -0.080505975
		 0.53100199 0.91375625 -0.098637752 0.39410675 0.84353757 -0.080505975 0.53100199
		 0.87230206 -0.18841381 0.4512088 0.91375625 -0.098637752 0.39410675 -0.10468805 0.98155522
		 -0.15996785 -0.19862846 0.96809608 -0.15276378 -0.1014488 0.99478662 -0.010376175
		 -0.19862846 0.96809608 -0.15276378 -0.17865086 0.98390675 -0.0033727451 -0.1014488
		 0.99478662 -0.010376175 -0.91577828 0.38634938 0.10992865 -0.85203022 0.48356515
		 0.20052257 -0.88634229 0.45655909 0.077143863 -0.85203022 0.48356515 0.20052257 -0.81899047
		 0.54733723 0.17226891 -0.88634229 0.45655909 0.077143863 0.095163785 0.92400521 -0.37034875
		 0.07313925 0.93511117 -0.34672436 -4.7087823e-09 0.94813716 -0.3178615 0.07313925
		 0.93511117 -0.34672436 2.4899773e-09 0.9502337 -0.31153798 -4.7087823e-09 0.94813716
		 -0.3178615 0.29548532 0.74379659 0.59954572 0.29588681 0.74259543 0.60083526 0.31197733
		 0.72111118 0.61860228 0.29588681 0.74259543 0.60083526 0.3127068 0.71885157 0.6208598
		 0.31197733 0.72111118 0.61860228 0.29118228 0.47289562 0.83161443 0.28941974 0.47179961
		 0.83285135 0.27110666 0.45066246 0.85053194 0.28941974 0.47179961 0.83285135 0.26879594
		 0.45038101 0.85141397 0.27110666 0.45066246 0.85053194 0.19400916 0.8448723 0.49854916
		 0.19711177 0.84324688 0.50008172 0.23147768 0.8254928 0.51476181 0.19711177 0.84324688
		 0.50008172 0.23185742 0.82350528 0.51776558 0.23147768 0.8254928 0.51476181 -0.32448152
		 0.53416067 0.78063059 -0.33355924 0.55968386 0.75861204 -0.32638103 0.53523654 0.7791003
		 -0.33355924 0.55968386 0.75861204 -0.33525011 0.56155723 0.75647926 -0.32638103 0.53523654
		 0.7791003 -0.1509596 0.8582601 0.49051076 -0.19400939 0.84487212 0.49854937 -0.15370195
		 0.85866535 0.48894733 -0.19400939 0.84487212 0.49854937 -0.19711208 0.84324664 0.50008196
		 -0.15370195 0.85866535 0.48894733 -0.8923229 -0.25754091 -0.37071893 -0.81875205
		 -0.36172491 -0.44587016 -0.88227218 -0.33192629 -0.33379751 -0.81875205 -0.36172491
		 -0.44587016 -0.80618304 -0.42576826 -0.4108409 -0.88227218 -0.33192629 -0.33379751
		 -0.22208379 0.47460502 -0.85172111 -0.20785077 0.33230296 -0.91998523 -0.33128238
		 0.4475016 -0.83065897 -0.20785077 0.33230296 -0.91998523 -0.30740866 0.30223039 -0.90230632
		 -0.33128238 0.4475016 -0.83065897 0.86735314 -0.40589643 -0.28800458 0.8423624 -0.4770897
		 -0.25062132 0.79089379 -0.4894425 -0.36733231 0.8423624 -0.4770897 -0.25062132 0.7663247
		 -0.55176407 -0.3290939 0.79089379 -0.4894425 -0.36733231 0.57753158 0.18429324 -0.79529446
		 0.49843189 0.22990093 -0.83588946 0.6131354 0.31114647 -0.72612178 0.49843189 0.22990093
		 -0.83588946 0.52849185 0.36313975 -0.7673499 0.6131354 0.31114647 -0.72612178 0.98269844
		 -0.096447617 0.15811902 0.99167472 -0.055488948 0.11619886 0.96124232 -0.188466 0.20123065
		 0.99167472 -0.055488948 0.11619886 0.97691041 -0.14264692 0.15905328 0.96124232 -0.188466
		 0.20123065 0.99167472 -0.055488948 0.11619886 0.98269844 -0.096447617 0.15811902
		 0.99667215 0.041085243 0.070403539 0.98269844 -0.096447617 0.15811902 0.9932242 -0.0087956851
		 0.11588071 0.99667215 0.041085243 0.070403539 -0.81284922 -0.4784762 0.33216959 -0.86590815
		 -0.40442336 0.29435492 -0.79579848 -0.49526188 0.34845439 -0.86590815 -0.40442336
		 0.29435492 -0.85526127 -0.41593531 0.30907276 -0.79579848 -0.49526188 0.34845439
		 -0.79579848 -0.49526188 0.34845439 -0.73183274 -0.5647639 0.38139564 -0.81284922
		 -0.4784762 0.33216959 -0.73183274 -0.5647639 0.38139564 -0.73959738 -0.56028932 0.37292314
		 -0.81284922 -0.4784762 0.33216959 -0.99322432 -0.0087954206 0.11587936 -0.9826985
		 -0.096447773 0.15811874 -0.99667209 0.041085526 0.070404261 -0.9826985 -0.096447773
		 0.15811874 -0.99167472 -0.055488743 0.11619899 -0.99667209 0.041085526 0.070404261
		 -0.99667209 0.041085526 0.070404261 -0.99171531 0.12469342 0.030859886 -0.99322432
		 -0.0087954206 0.11587936 -0.99171531 0.12469342 0.030859886 -0.99369061 0.088797055
		 0.068512991 -0.99322432 -0.0087954206 0.11587936 -0.72858703 0.62934005 -0.27035528
		 -0.78121978 0.58209282 -0.22552949 -0.71733922 0.64472872 -0.26410088 -0.78121978
		 0.58209282 -0.22552949;
	setAttr ".n[664:829]" -type "float3"  -0.77449965 0.58775276 -0.2338738 -0.71733922
		 0.64472872 -0.26410088 0.50772685 -0.70784688 -0.49108678 0.5075776 -0.70706111 -0.49237138
		 0.51890272 -0.6734969 -0.52644271 0.5075776 -0.70706111 -0.49237138 0.51623851 -0.67142302
		 -0.53168505 0.51890272 -0.6734969 -0.52644271 -0.068799622 -0.94210726 -0.32817766
		 -0.12171646 -0.93548667 -0.33173761 -0.069227219 -0.94233048 -0.32744598 -0.12171646
		 -0.93548667 -0.33173761 -0.12377691 -0.93460798 -0.33344746 -0.069227219 -0.94233048
		 -0.32744598 -0.56683737 -0.56456071 -0.59997213 -0.60295159 -0.51767623 -0.60700965
		 -0.57867056 -0.56688106 -0.58633292 -0.60295159 -0.51767623 -0.60700965 -0.60614604
		 -0.518094 -0.60346133 -0.57867056 -0.56688106 -0.58633292 -0.29994154 -0.52478766
		 -0.79663855 -0.29459292 -0.44859552 -0.84378731 -0.32423702 -0.43482167 -0.8401193
		 -0.29459292 -0.44859552 -0.84378731 -0.32631224 -0.35117254 -0.87760937 -0.32423702
		 -0.43482167 -0.8401193 0.6552788 -0.44682911 0.60905951 0.66361415 -0.44271731 0.6030072
		 0.66622055 -0.43346632 0.60684198 0.66361415 -0.44271731 0.6030072 0.67687756 -0.42175564
		 0.60329008 0.66622055 -0.43346632 0.60684198 0.3968856 0.59215504 0.70130897 0.39038706
		 0.61397225 0.6860292 0.35777205 0.75904965 0.54391432 0.39038706 0.61397225 0.6860292
		 0.35332295 0.76934952 0.53222573 0.35777205 0.75904965 0.54391432 0.88670772 0.14194137
		 -0.44000229 0.8518967 0.47329825 -0.22418913 0.88447142 0.1740979 -0.43289754 0.8518967
		 0.47329825 -0.22418913 0.84769994 0.48380938 -0.21756218 0.88447142 0.1740979 -0.43289754
		 0.21894304 -0.96970546 -0.1083296 -1.008353e-08 -0.99134809 -0.13125917 0.21057875
		 -0.97165477 -0.10744102 -1.008353e-08 -0.99134809 -0.13125917 -3.720225e-09 -0.99086541
		 -0.1348543 0.21057875 -0.97165477 -0.10744102 -0.85919809 -0.48444107 0.16460696
		 -0.85921848 -0.50882035 0.053342801 -0.73281074 -0.64050424 0.22965774 -0.85921848
		 -0.50882035 0.053342801 -0.74379373 -0.66658401 0.04936171 -0.73281074 -0.64050424
		 0.22965774 -0.96419519 0.074526288 -0.25450623 -0.9874559 -0.11463584 -0.10857955
		 -0.96034122 0.11816627 -0.25254992 -0.9874559 -0.11463584 -0.10857955 -0.99050325
		 -0.098636396 -0.095782034 -0.96034122 0.11816627 -0.25254992 -0.016132163 -0.9561851
		 -0.29231793 -0.25864512 -0.92851871 -0.26637512 0.0092711216 -0.99634093 -0.084963664
		 -0.25864512 -0.92851871 -0.26637512 -0.21331783 -0.97568089 -0.050421182 0.0092711216
		 -0.99634093 -0.084963664 0.95247233 -0.25448704 0.16742986 0.94800043 -0.29165193
		 0.12741399 0.99321145 -0.1083044 0.042439837 0.94800043 -0.29165193 0.12741399 0.99082285
		 -0.13514519 -0.0024256725 0.99321145 -0.1083044 0.042439837 0.66782451 0.56758571
		 -0.48151523 0.68886167 0.5182839 -0.50680506 0.8826375 0.32687086 -0.33779654 0.68886167
		 0.5182839 -0.50680506 0.89207023 0.25964049 -0.36986148 0.8826375 0.32687086 -0.33779654
		 0.004186573 0.78563541 -0.61867559 0.0012789979 0.78851217 -0.61501783 0.36015362
		 0.72838491 -0.58287632 0.0012789979 0.78851217 -0.61501783 0.35883802 0.72143924
		 -0.59225053 0.36015362 0.72838491 -0.58287632 0.36015362 0.72838491 -0.58287632 0.36309412
		 0.72296119 -0.58778375 0.004186573 0.78563541 -0.61867559 0.36309412 0.72296119 -0.58778375
		 0.0013146511 0.7780149 -0.62824446 0.004186573 0.78563541 -0.61867559 -0.010605128
		 0.66258413 -0.74891239 -0.01057572 0.73238289 -0.68081093 0.38260716 0.61384785 -0.69050896
		 -0.01057572 0.73238289 -0.68081093 0.38275144 0.67897731 -0.62649113 0.38260716 0.61384785
		 -0.69050896 0.33709374 -0.62744665 0.70191061 0.30444002 -0.58477902 0.75189739 0.022424145
		 -0.66519088 0.74633658 0.30444002 -0.58477902 0.75189739 0.043621261 -0.61468589
		 0.78756487 0.022424145 -0.66519088 0.74633658 -0.57174337 0.63146019 -0.52380115
		 -0.31374761 0.74101484 -0.59368294 -0.58405626 0.61048996 -0.53495818 -0.31374761
		 0.74101484 -0.59368294 -0.32588497 0.72924906 -0.60166001 -0.58405626 0.61048996
		 -0.53495818 -0.94822347 0.17536439 -0.26480111 -0.99366605 -0.076975398 -0.081869029
		 -0.94439751 0.20088205 -0.26030707 -0.99366605 -0.076975398 -0.081869029 -0.99455112
		 -0.061164558 -0.084421247 -0.94439751 0.20088205 -0.26030707 0.73730987 -0.66395348
		 0.12465921 0.52199394 -0.82231838 0.22652781 0.72316688 -0.60477269 0.3335861 0.52199394
		 -0.82231838 0.22652781 0.48213807 -0.71444237 0.50706506 0.72316688 -0.60477269 0.3335861
		 -0.89806581 0.012964822 -0.43967003 -0.78218156 0.0097510191 -0.62297428 -0.91943806
		 -0.082366675 -0.38451183 -0.78218156 0.0097510191 -0.62297428 -0.80168015 -0.1433944
		 -0.58029908 -0.91943806 -0.082366675 -0.38451183 -0.34780723 -0.70427561 0.61889088
		 0.0028407953 -0.73492831 0.67813885 -0.29926378 -0.64756119 0.70078933 0.0028407953
		 -0.73492831 0.67813885 0.022424145 -0.66519088 0.74633658 -0.29926378 -0.64756119
		 0.70078933 0.14340958 0.98228014 -0.12066268 0.14542714 0.98199761 -0.12054735 0.2226181
		 0.97021776 -0.095491774 0.14542714 0.98199761 -0.12054735 0.22173667 0.97032684 -0.09642987
		 0.2226181 0.97021776 -0.095491774 0.0029300759 0.99514323 0.098393977 -9.380266e-11
		 0.99479401 0.1019064 0.0030450723 0.99508286 0.098999023 -9.380266e-11 0.99479401
		 0.1019064 0 0.99476773 0.10216255 0.0030450723 0.99508286 0.098999023 0.14413276
		 0.91121817 -0.38588497 0.16060381 0.90573794 -0.39223114 0.31457058 0.87103868 -0.37727579
		 0.16060381 0.90573794 -0.39223114 0.33319247 0.86045909 -0.38547754 0.31457058 0.87103868
		 -0.37727579 -0.41306806 0.83266705 -0.36883643 -0.33319232 0.86045927 -0.38547722
		 -0.42743978 0.82819867 -0.36246687 -0.33319232 0.86045927 -0.38547722 -0.31457061
		 0.87103879 -0.37727538 -0.42743978 0.82819867 -0.36246687 -0.95545799 -0.28689316
		 0.06922663 -0.85299242 -0.46219856 0.24243841 -0.95275867 -0.28984371 0.090783171
		 -0.85299242 -0.46219856 0.24243841 -0.83737296 -0.47044823 0.27836117 -0.95275867
		 -0.28984371 0.090783171 -0.96933359 0.020001331 -0.24493331 -0.89223802 -0.18060999
		 -0.41387355;
	setAttr ".n[830:995]" -type "float3"  -0.9782964 -0.062963068 -0.19741279 -0.89223802
		 -0.18060999 -0.41387355 -0.8923229 -0.25754091 -0.37071893 -0.9782964 -0.062963068
		 -0.19741279 -0.98604631 -0.10706043 0.12747854 -0.95585531 0.067680299 0.2859371
		 -0.99611503 -0.026723288 0.08390899 -0.95585531 0.067680299 0.2859371 -0.95988935
		 0.14305149 0.24114031 -0.99611503 -0.026723288 0.08390899 -0.95036972 0.29702017
		 -0.092608824 -0.88634229 0.45655909 0.077143863 -0.91529256 0.37830669 -0.13828798
		 -0.88634229 0.45655909 0.077143863 -0.84507138 0.53322715 0.039027624 -0.91529256
		 0.37830669 -0.13828798 -0.53344876 0.76866406 -0.35297021 -0.61965823 0.71474433
		 -0.32429045 -0.46586853 0.87810957 -0.10904182 -0.61965823 0.71474433 -0.32429045
		 -0.54572439 0.83303255 -0.090783723 -0.46586853 0.87810957 -0.10904182 -0.50449312
		 -0.61063224 0.61042196 -0.42194641 -0.58782262 0.69023609 -0.4174799 -0.58068693
		 0.69893724 -0.42194641 -0.58782262 0.69023609 -0.30805421 -0.52883554 0.79084486
		 -0.4174799 -0.58068693 0.69893724 -0.43165109 -0.88671279 -0.16558304 -0.48219365
		 -0.7564888 -0.44183025 -0.053536456 -0.97797751 -0.20172703 -0.48219365 -0.7564888
		 -0.44183025 -0.079354182 -0.84946537 -0.5216431 -0.053536456 -0.97797751 -0.20172703
		 0.68826032 -0.12656619 -0.714338 0.91186607 -0.11888491 -0.39289516 0.7299282 -0.31120253
		 -0.60857034 0.91186607 -0.11888491 -0.39289516 0.91797256 -0.17251985 -0.35716003
		 0.7299282 -0.31120253 -0.60857034 0.90524489 0.19736239 -0.37627095 0.9076317 0.26611984
		 -0.3246305 0.9676066 0.064224936 -0.24415694 0.9076317 0.26611984 -0.3246305 0.97221839
		 0.11331404 -0.2048201 0.9676066 0.064224936 -0.24415694 0.9782964 -0.062963076 -0.19741277
		 0.97736865 -0.14100714 -0.15769419 0.89232278 -0.25754094 -0.37071919 0.97736865
		 -0.14100714 -0.15769419 0.88227212 -0.33192644 -0.33379745 0.89232278 -0.25754094
		 -0.37071919 0.34963697 0.67372322 -0.65103847 0.33128217 0.44750169 -0.83065897 0.23498091
		 0.7034077 -0.67082161 0.33128217 0.44750169 -0.83065897 0.22208382 0.47460511 -0.85172105
		 0.23498091 0.7034077 -0.67082161 0.96423936 -0.19491331 0.17958628 0.98604625 -0.10706042
		 0.12747897 0.9396283 -0.020910252 0.34155738 0.98604625 -0.10706042 0.12747897 0.95585525
		 0.067680299 0.28593716 0.9396283 -0.020910252 0.34155738 0.91529262 0.37830672 -0.13828768
		 0.87622833 0.44893658 -0.17515676 0.84507138 0.53322715 0.03902752 0.87622833 0.44893658
		 -0.17515676 0.80272067 0.59628236 0.0093241446 0.84507138 0.53322715 0.03902752 0.4395465
		 0.8138395 -0.38008437 0.38407055 0.91507345 -0.12300549 0.53344887 0.768664 -0.35297024
		 0.38407055 0.91507345 -0.12300549 0.46586859 0.87810951 -0.10904163 0.53344887 0.768664
		 -0.35297024 0.52595329 -0.4911319 0.69437927 0.56593031 -0.60112667 0.56424254 0.61370909
		 -0.45667976 0.64405334 0.56593031 -0.60112667 0.56424254 0.64296454 -0.5810802 0.49894121
		 0.61370909 -0.45667976 0.64405334 0.50392032 -0.61096156 0.61056554 0.50739568 -0.58528161
		 0.63245159 0.53688282 -0.597399 0.59571069 0.50739568 -0.58528161 0.63245159 0.55670995
		 -0.57437807 0.60013658 0.53688282 -0.597399 0.59571069 0.11445726 -0.4403846 0.89048356
		 -3.6723953e-09 -0.44563508 0.89521468 0.12957968 -0.47134644 0.87237698 -3.6723953e-09
		 -0.44563508 0.89521468 1.9906951e-05 -0.46412241 0.8857711 0.12957968 -0.47134644
		 0.87237698 0.69126981 0.72096562 -0.048524126 0.6182031 0.78266275 -0.072553232 0.61290234
		 0.78715676 0.06881085 0.90266579 0.080930799 0.42266381 0.87990391 0.007325714 0.47509518
		 0.9396283 -0.020910252 0.34155738 0.87990391 0.007325714 0.47509518 0.91375625 -0.098637752
		 0.39410675 0.9396283 -0.020910252 0.34155738 -0.3961418 -0.43828011 0.8068347 -0.49116686
		 -0.41526991 0.76570618 -0.44400099 -0.49979246 0.74368715 -0.49116686 -0.41526991
		 0.76570618 -0.52595341 -0.4911319 0.69437915 -0.44400099 -0.49979246 0.74368715 -0.94045079
		 0.30391505 0.15227585 -0.88359076 0.40293342 0.23856232 -0.91577828 0.38634938 0.10992865
		 -0.88359076 0.40293342 0.23856232 -0.85203022 0.48356515 0.20052257 -0.91577828 0.38634938
		 0.10992865 0.52341431 0.72123271 -0.45371884 0.61359018 0.68689013 -0.38947281 0.62696201
		 0.68292665 -0.37487298 0.73542416 0.62647527 -0.25822467 0.72858721 0.62933987 -0.27035534
		 0.61359018 0.68689013 -0.38947281 0.72858721 0.62933987 -0.27035534 0.62696201 0.68292665
		 -0.37487298 0.61359018 0.68689013 -0.38947281 0.27760646 0.76709026 0.57836598 0.2764979
		 0.76477247 0.58195525 0.29548532 0.74379659 0.59954572 0.2764979 0.76477247 0.58195525
		 0.29588681 0.74259543 0.60083526 0.29548532 0.74379659 0.59954572 0.27110666 0.45066246
		 0.85053194 0.26879594 0.45038101 0.85141397 0.24902312 0.43473467 0.86544394 0.26879594
		 0.45038101 0.85141397 0.24575466 0.43451297 0.86648899 0.24902312 0.43473467 0.86544394
		 0.079947963 0.86113411 0.50205213 0.030203188 0.86249089 0.50517046 0.077561609 0.86159992
		 0.50162709 0.030203188 0.86249089 0.50517046 0.029479792 0.86287451 0.50455773 0.077561609
		 0.86159992 0.50162709 -0.32638103 0.53523654 0.7791003 -0.31555271 0.51544052 0.79671043
		 -0.32448152 0.53416067 0.78063059 -0.31555271 0.51544052 0.79671043 -0.31416574 0.51417923
		 0.7980724 -0.32448152 0.53416067 0.78063059 -0.041193504 0.36156121 0.93143791 -0.041504882
		 0.36149424 0.93145007 -0.074956074 0.36567569 0.92771918 -0.041504882 0.36149424
		 0.93145007 -0.07577572 0.36613336 0.92747205 -0.074956074 0.36567569 0.92771918 -0.88227218
		 -0.33192629 -0.33379751 -0.80618304 -0.42576826 -0.4108409 -0.86735314 -0.40589628
		 -0.28800467 -0.80618304 -0.42576826 -0.4108409 -0.79089415 -0.48944259 -0.36733145
		 -0.86735314 -0.40589628 -0.28800467 -0.30740866 0.30223039 -0.90230632 -0.40731302
		 0.27633089 -0.87048113 -0.33128238 0.4475016 -0.83065897 -0.40731302 0.27633089 -0.87048113
		 -0.43430242 0.41366851 -0.80016232 -0.33128238 0.4475016 -0.83065897;
	setAttr ".n[996:1161]" -type "float3"  0.8423624 -0.4770897 -0.25062132 0.81282449
		 -0.54455125 -0.20683396 0.7663247 -0.55176407 -0.3290939 0.81282449 -0.54455125 -0.20683396
		 0.74616408 -0.59838611 -0.29184449 0.7663247 -0.55176407 -0.3290939 0.49843189 0.22990093
		 -0.83588946 0.40731317 0.27633068 -0.87048107 0.52849185 0.36313975 -0.7673499 0.40731317
		 0.27633068 -0.87048107 0.43430254 0.41366848 -0.80016226 0.52849185 0.36313975 -0.7673499
		 0.91527843 -0.31700131 0.24854678 0.89910555 -0.34260762 0.27245054 0.94963765 -0.23590943
		 0.20624042 0.89910555 -0.34260762 0.27245054 0.93530929 -0.26380089 0.23580833 0.94963765
		 -0.23590943 0.20624042 0.89910555 -0.34260762 0.27245054 0.91527843 -0.31700131 0.24854678
		 0.85526156 -0.41593534 0.30907187 0.91527843 -0.31700131 0.24854678 0.86590803 -0.40442324
		 0.29435557 0.85526156 -0.41593534 0.30907187 -0.93530941 -0.26380077 0.23580822 -0.89910519
		 -0.34260765 0.27245152 -0.94963771 -0.23590939 0.20624019 -0.89910519 -0.34260765
		 0.27245152 -0.91527879 -0.31700131 0.24854559 -0.94963771 -0.23590939 0.20624019
		 -0.94963771 -0.23590939 0.20624019 -0.97691035 -0.14264688 0.15905356 -0.93530941
		 -0.26380077 0.23580822 -0.97691035 -0.14264688 0.15905356 -0.96124238 -0.18846612
		 0.20123024 -0.93530941 -0.26380077 0.23580822 -0.97691035 -0.14264688 0.15905356
		 -0.99167472 -0.055488743 0.11619899 -0.96124238 -0.18846612 0.20123024 -0.99167472
		 -0.055488743 0.11619899 -0.9826985 -0.096447773 0.15811874 -0.96124238 -0.18846612
		 0.20123024 0.51890272 -0.6734969 -0.52644271 0.51623851 -0.67142302 -0.53168505 0.53044623
		 -0.61862451 -0.57959509 0.51623851 -0.67142302 -0.53168505 0.53510725 -0.6176129
		 -0.57638049 0.53044623 -0.61862451 -0.57959509 -2.4428772e-07 -0.94398689 -0.32998288
		 -0.068799622 -0.94210726 -0.32817766 -1.0508118e-07 -0.94437635 -0.32886669 -0.068799622
		 -0.94210726 -0.32817766 -0.069227219 -0.94233048 -0.32744598 -1.0508118e-07 -0.94437635
		 -0.32886669 -0.53044653 -0.61862522 -0.57959402 -0.56683737 -0.56456071 -0.59997213
		 -0.53510714 -0.61761302 -0.57638055 -0.56683737 -0.56456071 -0.59997213 -0.57867056
		 -0.56688106 -0.58633292 -0.53510714 -0.61761302 -0.57638055 -0.32423702 -0.43482167
		 -0.8401193 -0.32631224 -0.35117254 -0.87760937 -0.40751436 -0.33869645 -0.84806645
		 -0.32631224 -0.35117254 -0.87760937 -0.42018101 -0.29680479 -0.85752833 -0.40751436
		 -0.33869645 -0.84806645 -0.16887671 -0.48919937 0.85566622 -4.3214975e-05 -0.4849695
		 0.87453103 -0.12955745 -0.47123605 0.87243992 -4.3214975e-05 -0.4849695 0.87453103
		 1.9906951e-05 -0.46412241 0.8857711 -0.12955745 -0.47123605 0.87243992 0.53688282
		 -0.597399 0.59571069 0.55670995 -0.57437807 0.60013658 0.61110395 -0.51976138 0.59699255
		 0.55670995 -0.57437807 0.60013658 0.65177745 -0.45854723 0.60408658 0.61110395 -0.51976138
		 0.59699255 0.66361415 -0.44271731 0.6030072 0.6552788 -0.44682911 0.60905951 0.55457008
		 -0.51859391 0.65077835 0.6552788 -0.44682911 0.60905951 0.52656579 -0.52479887 0.66881585
		 0.55457008 -0.51859391 0.65077835 0.32746288 0.81152576 0.48393592 0.32677278 0.81287789
		 0.48212975 0.34905195 0.81888616 0.45561847 0.32677278 0.81287789 0.48212975 0.34853649
		 0.81942892 0.45503694 0.34905195 0.81888616 0.45561847 0.35777205 0.75904965 0.54391432
		 0.35332295 0.76934952 0.53222573 0.32746288 0.81152576 0.48393592 0.35332295 0.76934952
		 0.53222573 0.32677278 0.81287789 0.48212975 0.32746288 0.81152576 0.48393592 0.49031574
		 -0.87075937 -0.03699496 0.64821285 -0.75886965 0.062745087 0.51479596 -0.85696727
		 -0.024335563 0.64821285 -0.75886965 0.062745087 0.68308419 -0.72472131 0.090415925
		 0.51479596 -0.85696727 -0.024335563 -0.31374761 0.74101484 -0.59368294 0.004186573
		 0.78563541 -0.61867559 -0.32588497 0.72924906 -0.60166001 0.004186573 0.78563541
		 -0.61867559 0.0013146511 0.7780149 -0.62824446 -0.32588497 0.72924906 -0.60166001
		 -0.95327145 0.1485182 -0.26308912 -0.82895839 0.37836966 -0.41190335 -0.96034122
		 0.11816627 -0.25254992 -0.82895839 0.37836966 -0.41190335 -0.84694433 0.34486905
		 -0.40466115 -0.96034122 0.11816627 -0.25254992 0.65161461 0.27763927 -0.70591414
		 0.63626152 0.047949523 -0.76998192 0.33500862 0.3051841 -0.89142126 0.63626152 0.047949523
		 -0.76998192 0.33061299 0.038162164 -0.94299453 0.33500862 0.3051841 -0.89142126 -0.032404736
		 -0.85560393 0.51661581 0.36588356 -0.80065459 0.47442752 -0.022763075 -0.80480301
		 0.59310538 0.36588356 -0.80065459 0.47442752 0.37653664 -0.74603742 0.54922521 -0.022763075
		 -0.80480301 0.59310538 0.9482643 -0.31728086 -0.011299993 0.96844184 -0.21371609
		 -0.12824138 0.9141947 -0.39514223 -0.090059273 0.96844184 -0.21371609 -0.12824138
		 0.91907173 -0.34422615 -0.19187368 0.9141947 -0.39514223 -0.090059273 -0.02864201
		 0.30136704 -0.95307791 -0.014954747 0.49889234 -0.86653495 0.33500862 0.3051841 -0.89142126
		 -0.014954747 0.49889234 -0.86653495 0.38540682 0.48070183 -0.78764671 0.33500862
		 0.3051841 -0.89142126 0.38070709 -0.67710155 0.62975836 0.33709374 -0.62744665 0.70191061
		 0.0028407953 -0.73492831 0.67813885 0.33709374 -0.62744665 0.70191061 0.022424145
		 -0.66519088 0.74633658 0.0028407953 -0.73492831 0.67813885 -0.64610577 0.53980261
		 -0.53959292 -0.84694433 0.34486905 -0.40466115 -0.61394888 0.57949507 -0.53595918
		 -0.84694433 0.34486905 -0.40466115 -0.82895839 0.37836966 -0.41190335 -0.61394888
		 0.57949507 -0.53595918 -0.34780723 -0.70427561 0.61889088 -0.66899717 -0.58427984
		 0.45941254 -0.391835 -0.72205901 0.57017201 -0.66899717 -0.58427984 0.45941254 -0.70671803
		 -0.57864982 0.40707994 -0.391835 -0.72205901 0.57017201 -0.50098377 -0.62869781 0.59477252
		 -0.21360292 -0.63727045 0.74044591 -0.41219616 -0.70674402 0.57498449 -0.21360292
		 -0.63727045 0.74044591 -0.123022 -0.72941476 0.67291874 -0.41219616 -0.70674402 0.57498449
		 0.10360128 0.98950291 -0.10075074 0.10502146 0.98936504 -0.10063436 0.09984716 0.99382174
		 -0.048464917 0.10502146 0.98936504 -0.10063436;
	setAttr ".n[1162:1327]" -type "float3"  0.099953003 0.99380678 -0.048554007 0.09984716
		 0.99382174 -0.048464917 -0.0029302216 0.99514323 0.098394036 -0.0030453084 0.99508286
		 0.098999053 -9.380266e-11 0.99479401 0.1019064 -0.0030453084 0.99508286 0.098999053
		 0 0.99476773 0.10216255 -9.380266e-11 0.99479401 0.1019064 0 0.92504132 -0.37986654
		 -0.14413276 0.91121817 -0.38588491 -6.5220274e-09 0.92252094 -0.38594708 -0.14413276
		 0.91121817 -0.38588491 -0.16060381 0.90573794 -0.39223114 -6.5220274e-09 0.92252094
		 -0.38594708 0.522425 0.78543979 -0.33189824 0.55302399 0.77081436 -0.31624314 0.57939976
		 0.75763476 -0.30047542 0.55302399 0.77081436 -0.31624314 0.59358704 0.74638152 -0.30094695
		 0.57939976 0.75763476 -0.30047542 0.38275144 0.67897731 -0.62649113 0.37362751 0.7054376
		 -0.60229582 0.67467684 0.55009466 -0.49214536 0.37362751 0.7054376 -0.60229582 0.66993523
		 0.55959487 -0.48789385 0.67467684 0.55009466 -0.49214536 -0.41306806 0.83266705 -0.36883643
		 -0.42743978 0.82819867 -0.36246687 -0.4969824 0.79852241 -0.33966219 -0.69916707
		 -0.65848303 0.27850592 -0.80086201 -0.57534444 0.16612875 -0.92035902 -0.37694597
		 0.10416847 -0.80086201 -0.57534444 0.16612875 -0.93191361 -0.35778713 0.059375178
		 -0.92035902 -0.37694597 0.10416847 -0.9782964 -0.062963068 -0.19741279 -0.8923229
		 -0.25754091 -0.37071893 -0.97736859 -0.14100708 -0.15769473 -0.8923229 -0.25754091
		 -0.37071893 -0.88227218 -0.33192629 -0.33379751 -0.97736859 -0.14100708 -0.15769473
		 -0.22208379 0.47460502 -0.85172111 -0.33128238 0.4475016 -0.83065897 -0.23498093
		 0.70340776 -0.67082155 -0.33128238 0.4475016 -0.83065897 -0.34963721 0.67372322 -0.65103829
		 -0.23498093 0.70340776 -0.67082155 -0.96423942 -0.19491337 0.17958604 -0.93962836
		 -0.020910287 0.34155723 -0.98604631 -0.10706043 0.12747854 -0.93962836 -0.020910287
		 0.34155723 -0.95585531 0.067680299 0.2859371 -0.98604631 -0.10706043 0.12747854 -0.91529256
		 0.37830669 -0.13828798 -0.84507138 0.53322715 0.039027624 -0.87622839 0.44893649
		 -0.17515661 -0.84507138 0.53322715 0.039027624 -0.80272084 0.59628206 0.0093244677
		 -0.87622839 0.44893649 -0.17515661 -0.43954647 0.81383955 -0.38008425 -0.53344876
		 0.76866406 -0.35297021 -0.38407043 0.91507351 -0.12300577 -0.53344876 0.76866406
		 -0.35297021 -0.46586853 0.87810957 -0.10904182 -0.38407043 0.91507351 -0.12300577
		 -0.64304936 -0.58069563 0.49927956 -0.56593013 -0.60112673 0.56424266 -0.61370939
		 -0.45667991 0.64405292 -0.56593013 -0.60112673 0.56424266 -0.52595341 -0.4911319
		 0.69437915 -0.61370939 -0.45667991 0.64405292 0.89197224 0.15639158 -0.42417824 0.90524489
		 0.19736239 -0.37627095 0.95724863 0.0030751403 -0.28925002 0.90524489 0.19736239
		 -0.37627095 0.9676066 0.064224936 -0.24415694 0.95724863 0.0030751403 -0.28925002
		 -0.40434167 0.60560542 -0.68538302 -0.6723485 0.4826518 -0.56124395 -0.38063785 0.67287791
		 -0.63431078 -0.6723485 0.4826518 -0.56124395 -0.64610577 0.53980261 -0.53959292 -0.38063785
		 0.67287791 -0.63431078 0.96778458 -0.22675689 -0.10942706 0.94941574 -0.30610654
		 -0.070060946 0.86735314 -0.40589643 -0.28800458 0.94941574 -0.30610654 -0.070060946
		 0.8423624 -0.4770897 -0.25062132 0.86735314 -0.40589643 -0.28800458 0.55454308 0.58676451
		 -0.59007573 0.64400381 0.52878296 -0.55285406 0.52849185 0.36313975 -0.7673499 0.64400381
		 0.52878296 -0.55285406 0.6131354 0.31114647 -0.72612178 0.52849185 0.36313975 -0.7673499
		 0.9396283 -0.020910252 0.34155738 0.91375625 -0.098637752 0.39410675 0.96423936 -0.19491331
		 0.17958628 0.91375625 -0.098637752 0.39410675 0.9330942 -0.27843967 0.2276105 0.96423936
		 -0.19491331 0.17958628 0.99039871 0.13805851 -0.0070875781 0.97362667 0.2217422 -0.053679608
		 0.94045085 0.30391511 0.1522755 0.97362667 0.2217422 -0.053679608 0.91577828 0.38634938
		 0.1099285 0.94045085 0.30391511 0.1522755 0.76876324 0.58771342 -0.25218257 0.69677716
		 0.65538877 -0.29149112 0.69126981 0.72096562 -0.048524126 0.69677716 0.65538877 -0.29149112
		 0.6182031 0.78266275 -0.072553232 0.69126981 0.72096562 -0.048524126 0.56593031 -0.60112667
		 0.56424254 0.52595329 -0.4911319 0.69437927 0.50122505 -0.6025297 0.62107283 0.52595329
		 -0.4911319 0.69437927 0.44400093 -0.49979264 0.74368709 0.50122505 -0.6025297 0.62107283
		 1.6920271e-07 0.90156043 -0.43265316 -1.0348368e-09 0.98572814 -0.16834511 0.11578543
		 0.89565569 -0.42941198 -1.0348368e-09 0.98572814 -0.16834511 0.1046882 0.98155522
		 -0.15996787 0.11578543 0.89565569 -0.42941198 3.1035574e-06 -0.93095028 -0.36514589
		 -0.016132163 -0.9561851 -0.29231793 0.28278285 -0.89740258 -0.33867756 -0.016132163
		 -0.9561851 -0.29231793 0.25580376 -0.92671645 -0.27524731 0.28278285 -0.89740258
		 -0.33867756 -1.0348368e-09 0.98572814 -0.16834511 0 0.9998076 -0.019616352 0.1046882
		 0.98155522 -0.15996787 0 0.9998076 -0.019616352 0.10144903 0.99478662 -0.01037617
		 0.1046882 0.98155522 -0.15996787 0.40155101 0.91504091 0.038170338 0.47210178 0.88009399
		 0.050541528 0.46586859 0.87810951 -0.10904163 0.47210178 0.88009399 0.050541528 0.54572451
		 0.83303243 -0.090783715 0.46586859 0.87810951 -0.10904163 0.91455388 0.24283937 0.32345054
		 0.91421568 0.17089504 0.3674297 0.95988941 0.14305152 0.24114016 0.91421568 0.17089504
		 0.3674297 0.95585525 0.067680299 0.28593716 0.95988941 0.14305152 0.24114016 -0.3444958
		 -0.49623245 0.79691654 -0.32263941 -0.43072465 0.84284049 -0.44400099 -0.49979246
		 0.74368715 -0.32263941 -0.43072465 0.84284049 -0.3961418 -0.43828011 0.8068347 -0.44400099
		 -0.49979246 0.74368715 -0.88634229 0.45655909 0.077143863 -0.81899047 0.54733723
		 0.17226891 -0.84507138 0.53322715 0.039027624 -0.81899047 0.54733723 0.17226891 -0.77474165
		 0.61663938 0.1397543 -0.84507138 0.53322715 0.039027624 0.29571632 0.80126733 -0.52011776
		 0.33662209 0.78737885 -0.51644957 0.4217701 0.75874799 -0.49639851 0.33662209 0.78737885
		 -0.51644957 0.45606259 0.74945891 -0.47991487;
	setAttr ".n[1328:1493]" -type "float3"  0.4217701 0.75874799 -0.49639851 -0.7354241
		 0.62647527 -0.2582249 -0.61358994 0.68688977 -0.3894738 -0.72858703 0.62934005 -0.27035528
		 -0.61358994 0.68688977 -0.3894738 -0.6269623 0.68292677 -0.37487233 -0.72858703 0.62934005
		 -0.27035528 0.3042852 0.49247506 0.81540102 0.30355406 0.49165434 0.81616843 0.29118228
		 0.47289562 0.83161443 0.30355406 0.49165434 0.81616843 0.28941974 0.47179961 0.83285135
		 0.29118228 0.47289562 0.83161443 0.079947963 0.86113411 0.50205213 0.077561609 0.86159992
		 0.50162709 0.11502039 0.8602491 0.49673113 0.077561609 0.86159992 0.50162709 0.11467732
		 0.86272967 0.4924902 0.11502039 0.8602491 0.49673113 -0.34114078 0.613186 0.71247876
		 -0.34018785 0.58482361 0.73637867 -0.340325 0.61168188 0.71415973 -0.34018785 0.58482361
		 0.73637867 -0.33917063 0.58358926 0.73782575 -0.340325 0.61168188 0.71415973 -0.1420496
		 0.38666236 0.91121572 -0.11235481 0.37527913 0.92007715 -0.14233997 0.3863664 0.91129595
		 -0.11235481 0.37527913 0.92007715 -0.11288161 0.37554526 0.91990405 -0.14233997 0.3863664
		 0.91129595 0.23147768 0.8254928 0.51476181 0.23185742 0.82350528 0.51776558 0.26056817
		 0.79786515 0.54361337 0.23185742 0.82350528 0.51776558 0.25992668 0.79439211 0.5489803
		 0.26056817 0.79786515 0.54361337 -0.8423624 -0.4770897 -0.25062126 -0.7663247 -0.55176443
		 -0.32909331 -0.81282449 -0.54455101 -0.20683452 -0.7663247 -0.55176443 -0.32909331
		 -0.74616396 -0.59838611 -0.29184493 -0.81282449 -0.54455101 -0.20683452 -0.43430242
		 0.41366851 -0.80016232 -0.40731302 0.27633089 -0.87048113 -0.5284915 0.36313981 -0.76735014
		 -0.40731302 0.27633089 -0.87048113 -0.49843156 0.22990026 -0.83588988 -0.5284915
		 0.36313981 -0.76735014 0.75190514 -0.64638537 -0.12970968 0.70816219 -0.66876483
		 -0.22640654 0.78628993 -0.59350204 -0.17176591 0.70816219 -0.66876483 -0.22640654
		 0.72612756 -0.63597137 -0.26130283 0.78628993 -0.59350204 -0.17176591 0.64496869
		 0.11921461 -0.75485313 0.57753158 0.18429324 -0.79529446 0.68394971 0.24827434 -0.685983
		 0.57753158 0.18429324 -0.79529446 0.6131354 0.31114647 -0.72612178 0.68394971 0.24827434
		 -0.685983 0.81284916 -0.47847632 0.33216956 0.79579872 -0.49526185 0.34845382 0.86590803
		 -0.40442324 0.29435557 0.79579872 -0.49526185 0.34845382 0.85526156 -0.41593534 0.30907187
		 0.86590803 -0.40442324 0.29435557 0.79579872 -0.49526185 0.34845382 0.81284916 -0.47847632
		 0.33216956 0.7318328 -0.56476372 0.38139573 0.81284916 -0.47847632 0.33216956 0.73959714
		 -0.56028956 0.37292308 0.7318328 -0.56476372 0.38139573 0.78121978 0.58209294 -0.22552928
		 0.77449965 0.58775276 -0.2338739 0.83923376 0.51459718 -0.1757171 0.77449965 0.58775276
		 -0.2338739 0.83977365 0.51384705 -0.17533247 0.83923376 0.51459718 -0.1757171 -0.89910519
		 -0.34260765 0.27245152 -0.85526127 -0.41593531 0.30907276 -0.91527879 -0.31700131
		 0.24854559 -0.85526127 -0.41593531 0.30907276 -0.86590815 -0.40442336 0.29435492
		 -0.91527879 -0.31700131 0.24854559 0.56683779 -0.56456149 -0.59997106 0.57867056
		 -0.5668816 -0.58633238 0.60295141 -0.51767588 -0.60701007 0.57867056 -0.5668816 -0.58633238
		 0.60614532 -0.51809299 -0.60346293 0.60295141 -0.51767588 -0.60701007 0.068799913
		 -0.9421072 -0.32817775 0.069227457 -0.94233036 -0.32744619 0.12171621 -0.93548667
		 -0.33173758 0.069227457 -0.94233036 -0.32744619 0.12377658 -0.93460804 -0.33344734
		 0.12171621 -0.93548667 -0.33173758 -0.50772673 -0.70784646 -0.49108756 -0.51890349
		 -0.67349744 -0.52644128 -0.5075776 -0.70706081 -0.49237174 -0.51890349 -0.67349744
		 -0.52644128 -0.51623899 -0.67142355 -0.53168392 -0.5075776 -0.70706081 -0.49237174
		 0.29994154 -0.52478766 -0.79663855 0.32423678 -0.43482146 -0.84011954 0.29459289
		 -0.44859549 -0.84378737 0.32423678 -0.43482146 -0.84011954 0.32631207 -0.3511723
		 -0.87760949 0.29459289 -0.44859549 -0.84378737 -0.66948789 -0.43299505 0.60357368
		 -0.64559716 -0.46000129 0.60959256 -0.67226803 -0.43231627 0.60096449 -0.64559716
		 -0.46000129 0.60959256 -0.65016234 -0.47131267 0.59594744 -0.67226803 -0.43231627
		 0.60096449 0.56886053 0.80065662 0.18800721 0.51661456 0.83232933 0.20084153 0.3614679
		 0.84571934 0.39255539 0.51661456 0.83232933 0.20084153 0.35235655 0.84859878 0.39462003
		 0.3614679 0.84571934 0.39255539 0.51958138 -0.098033421 0.84877831 0.51601946 -0.10358655
		 0.85029042 0.46627539 0.28802931 0.83643669 0.51601946 -0.10358655 0.85029042 0.46281099
		 0.30277535 0.83314651 0.46627539 0.28802931 0.83643669 -0.71794385 0.11222038 0.6869958
		 -0.83874369 -0.13274075 0.5280993 -0.73908877 0.084054291 0.66834319 -0.83874369
		 -0.13274075 0.5280993 -0.84358191 -0.15269114 0.51483488 -0.73908877 0.084054291
		 0.66834319 0.64821285 -0.75886965 0.062745087 0.77952623 -0.59475404 0.19648542 0.68308419
		 -0.72472131 0.090415925 0.77952623 -0.59475404 0.19648542 0.79619288 -0.56303084
		 0.22152469 0.68308419 -0.72472131 0.090415925 -0.32588497 0.72924906 -0.60166001
		 0.0013146511 0.7780149 -0.62824446 -0.35205185 0.70722651 -0.6130988 0.0013146511
		 0.7780149 -0.62824446 -0.0051630624 0.76245844 -0.64701664 -0.35205185 0.70722651
		 -0.6130988 -0.84694433 0.34486905 -0.40466115 -0.86179024 0.29454303 -0.41299146
		 -0.96034122 0.11816627 -0.25254992 -0.86179024 0.29454303 -0.41299146 -0.96419519
		 0.074526288 -0.25450623 -0.96034122 0.11816627 -0.25254992 -0.49723831 -0.84923148
		 -0.17765106 -0.44819206 -0.89387316 -0.010710707 -0.25864512 -0.92851871 -0.26637512
		 -0.44819206 -0.89387316 -0.010710707 -0.21331783 -0.97568089 -0.050421182 -0.25864512
		 -0.92851871 -0.26637512 0.9527114 -0.23152786 0.19681422 0.95247233 -0.25448704 0.16742986
		 0.99181116 -0.10112387 0.078003936 0.95247233 -0.25448704 0.16742986 0.99321145 -0.1083044
		 0.042439837 0.99181116 -0.10112387 0.078003936 0.98445475 -0.16798913 -0.051268566
		 0.95649779 -0.26564014 -0.12061216 0.98891973 -0.10389588 -0.1060351;
	setAttr ".n[1494:1659]" -type "float3"  0.95649779 -0.26564014 -0.12061216 0.97028315
		 -0.18760987 -0.15281723 0.98891973 -0.10389588 -0.1060351 0.73730987 -0.66395348
		 0.12465921 0.86099923 -0.50851738 0.0095073199 0.77202576 -0.6290518 -0.090939701
		 0.86099923 -0.50851738 0.0095073199 0.86711419 -0.49382347 -0.065202512 0.77202576
		 -0.6290518 -0.090939701 0.39331985 -0.91465795 0.093275592 -0.035208944 -0.99446833
		 0.098959707 0.37514684 -0.91056329 -0.17360695 -0.035208944 -0.99446833 0.098959707
		 -0.053536456 -0.97797751 -0.20172703 0.37514684 -0.91056329 -0.17360695 -0.014954747
		 0.49889234 -0.86653495 -0.010605128 0.66258413 -0.74891239 0.38540682 0.48070183
		 -0.78764671 -0.010605128 0.66258413 -0.74891239 0.38260716 0.61384785 -0.69050896
		 0.38540682 0.48070183 -0.78764671 0.9527114 -0.23152786 0.19681422 0.95236969 -0.21862268
		 0.21259385 0.86953312 -0.37816122 0.31765753 0.95236969 -0.21862268 0.21259385 0.86391014
		 -0.36709058 0.34482422 0.86953312 -0.37816122 0.31765753 -0.81080323 0.41160041 -0.41615283
		 -0.94822347 0.17536439 -0.26480111 -0.80045074 0.44189459 -0.40497869 -0.94822347
		 0.17536439 -0.26480111 -0.94439751 0.20088205 -0.26030707 -0.80045074 0.44189459
		 -0.40497869 -0.43165109 -0.88671279 -0.16558304 -0.44340107 -0.89237684 0.084017992
		 -0.74421799 -0.65492338 -0.13120565 -0.44340107 -0.89237684 0.084017992 -0.74379373
		 -0.66658401 0.04936171 -0.74421799 -0.65492338 -0.13120565 -0.29926378 -0.64756119
		 0.70078933 -0.21360292 -0.63727045 0.74044591 -0.605304 -0.58354694 0.5413686 -0.21360292
		 -0.63727045 0.74044591 -0.50098377 -0.62869781 0.59477252 -0.605304 -0.58354694 0.5413686
		 -0.21360292 -0.63727045 0.74044591 0.043621261 -0.61468589 0.78756487 -0.123022 -0.72941476
		 0.67291874 0.043621261 -0.61468589 0.78756487 0.044924513 -0.73209339 0.67972136
		 -0.123022 -0.72941476 0.67291874 0.10360128 0.98950291 -0.10075074 0.14542714 0.98199761
		 -0.12054735 0.10502146 0.98936504 -0.10063436 0.14542714 0.98199761 -0.12054735 0.14340958
		 0.98228014 -0.12066268 0.10502146 0.98936504 -0.10063436 0.16060381 0.90573794 -0.39223114
		 0.14413276 0.91121817 -0.38588497 -6.5220274e-09 0.92252094 -0.38594708 0.14413276
		 0.91121817 -0.38588497 0 0.92504132 -0.37986654 -6.5220274e-09 0.92252094 -0.38594708
		 0.38260716 0.61384785 -0.69050896 0.38275144 0.67897731 -0.62649113 0.67833167 0.49581343
		 -0.5422501 0.38275144 0.67897731 -0.62649113 0.67467684 0.55009466 -0.49214536 0.67833167
		 0.49581343 -0.5422501 -0.95636612 -0.28819978 0.048007 -0.86130869 -0.4629555 0.20933108
		 -0.95545799 -0.28689316 0.06922663 -0.86130869 -0.4629555 0.20933108 -0.85299242
		 -0.46219856 0.24243841 -0.95545799 -0.28689316 0.06922663 -0.95328742 0.096820876
		 -0.28612733 -0.88492739 -0.10372999 -0.45403042 -0.96933359 0.020001331 -0.24493331
		 -0.88492739 -0.10372999 -0.45403042 -0.89223802 -0.18060999 -0.41387355 -0.96933359
		 0.020001331 -0.24493331 -0.11524539 0.48986074 -0.86414987 -0.22208379 0.47460502
		 -0.85172111 -0.11890273 0.72156405 -0.68206114 -0.22208379 0.47460502 -0.85172111
		 -0.23498093 0.70340776 -0.67082155 -0.11890273 0.72156405 -0.68206114 -0.98604631
		 -0.10706043 0.12747854 -0.94941574 -0.30610654 -0.070061281 -0.96423942 -0.19491337
		 0.17958604 -0.94941574 -0.30610654 -0.070061281 -0.91979563 -0.39163819 -0.024403272
		 -0.96423942 -0.19491337 0.17958604 -0.92472774 0.17890209 -0.33596522 -0.91529256
		 0.37830669 -0.13828798 -0.89113158 0.25189582 -0.37740296 -0.91529256 0.37830669
		 -0.13828798 -0.87622839 0.44893649 -0.17515661 -0.89113158 0.25189582 -0.37740296
		 -0.45675501 0.63459867 -0.62342548 -0.55454308 0.58676463 -0.59007567 -0.43954647
		 0.81383955 -0.38008425 -0.55454308 0.58676463 -0.59007567 -0.53344876 0.76866406
		 -0.35297021 -0.43954647 0.81383955 -0.38008425 -0.9748649 -0.16152059 -0.15345861
		 -0.95242596 -0.30469197 -0.0068982346 -0.9874559 -0.11463584 -0.10857955 -0.95242596
		 -0.30469197 -0.0068982346 -0.95636612 -0.28819978 0.048007 -0.9874559 -0.11463584
		 -0.10857955 -0.9874559 -0.11463584 -0.10857955 -0.95636612 -0.28819978 0.048007 -0.99050325
		 -0.098636396 -0.095782034 -0.95636612 -0.28819978 0.048007 -0.95545799 -0.28689316
		 0.06922663 -0.99050325 -0.098636396 -0.095782034 0.97736865 -0.14100714 -0.15769419
		 0.96778458 -0.22675689 -0.10942706 0.88227212 -0.33192644 -0.33379745 0.96778458
		 -0.22675689 -0.10942706 0.86735314 -0.40589643 -0.28800458 0.88227212 -0.33192644
		 -0.33379745 0.4567548 0.63459885 -0.62342554 0.43430254 0.41366848 -0.80016226 0.34963697
		 0.67372322 -0.65103847 0.43430254 0.41366848 -0.80016226 0.33128217 0.44750169 -0.83065897
		 0.34963697 0.67372322 -0.65103847 0.96423936 -0.19491331 0.17958628 0.9330942 -0.27843967
		 0.2276105 0.91979563 -0.39163825 -0.02440328 0.9330942 -0.27843967 0.2276105 0.88484603
		 -0.46572709 0.012075986 0.91979563 -0.39163825 -0.02440328 0.97362667 0.2217422 -0.053679608
		 0.99039871 0.13805851 -0.0070875781 0.96933353 0.020001357 -0.24493349 0.99039871
		 0.13805851 -0.0070875781 0.9782964 -0.062963076 -0.19741277 0.96933353 0.020001357
		 -0.24493349 0.7907533 0.39577127 -0.46698427 0.71985048 0.46630284 -0.51417595 0.76876324
		 0.58771342 -0.25218257 0.71985048 0.46630284 -0.51417595 0.69677716 0.65538877 -0.29149112
		 0.76876324 0.58771342 -0.25218257 0.56726664 -0.64461851 0.51251882 0.50122505 -0.6025297
		 0.62107283 0.50392032 -0.61096156 0.61056554 0.50122505 -0.6025297 0.62107283 0.41738749
		 -0.58084655 0.69885975 0.50392032 -0.61096156 0.61056554 0.11578543 0.89565569 -0.42941198
		 0.11890284 0.72156405 -0.6820612 1.6920271e-07 0.90156043 -0.43265316 0.11890284
		 0.72156405 -0.6820612 1.5065052e-07 0.72771388 -0.68588078 1.6920271e-07 0.90156043
		 -0.43265316 0.57442969 -0.77200139 -0.27211109 0.55469638 -0.79980075 -0.22941385
		 0.79248166 -0.59161836 -0.14819098 0.55469638 -0.79980075 -0.22941385 0.77927482
		 -0.60622829 -0.15880199 0.79248166 -0.59161836 -0.14819098 0.12957968 -0.47134644
		 0.87237698;
	setAttr ".n[1660:1825]" -type "float3"  0.24072877 -0.49322212 0.8359316 0.11445726
		 -0.4403846 0.89048356 0.24072877 -0.49322212 0.8359316 0.218674 -0.43946049 0.87123829
		 0.11445726 -0.4403846 0.89048356 0.38407055 0.91507345 -0.12300549 0.33875236 0.9406206
		 0.021902878 0.46586859 0.87810951 -0.10904163 0.33875236 0.9406206 0.021902878 0.40155101
		 0.91504091 0.038170338 0.46586859 0.87810951 -0.10904163 0.91421568 0.17089504 0.3674297
		 0.90266579 0.080930799 0.42266381 0.95585525 0.067680299 0.28593716 0.90266579 0.080930799
		 0.42266381 0.9396283 -0.020910252 0.34155738 0.95585525 0.067680299 0.28593716 -0.49116686
		 -0.41526991 0.76570618 -0.5889678 -0.38176879 0.71229875 -0.52595341 -0.4911319 0.69437915
		 -0.5889678 -0.38176879 0.71229875 -0.61370939 -0.45667991 0.64405292 -0.52595341
		 -0.4911319 0.69437915 -0.84507138 0.53322715 0.039027624 -0.77474165 0.61663938 0.1397543
		 -0.80272084 0.59628206 0.0093244677 -0.77474165 0.61663938 0.1397543 -0.73119551
		 0.67256457 0.1140615 -0.80272084 0.59628206 0.0093244677 0.4217701 0.75874799 -0.49639851
		 0.45606259 0.74945891 -0.47991487 0.52341431 0.72123271 -0.45371884 0.45606259 0.74945891
		 -0.47991487 0.61359018 0.68689013 -0.38947281 0.52341431 0.72123271 -0.45371884 0.31555307
		 0.515441 0.79671001 0.31416598 0.51417959 0.7980721 0.3042852 0.49247506 0.81540102
		 0.31416598 0.51417959 0.7980721 0.30355406 0.49165434 0.81616843 0.3042852 0.49247506
		 0.81540102 0.11502039 0.8602491 0.49673113 0.11467732 0.86272967 0.4924902 0.15095969
		 0.8582598 0.49051121 0.11467732 0.86272967 0.4924902 0.1537019 0.85866529 0.48894745
		 0.15095969 0.8582598 0.49051121 -0.34018785 0.58482361 0.73637867 -0.33525011 0.56155723
		 0.75647926 -0.33917063 0.58358926 0.73782575 -0.33525011 0.56155723 0.75647926 -0.33355924
		 0.55968386 0.75861204 -0.33917063 0.58358926 0.73782575 -0.074956074 0.36567569 0.92771918
		 -0.07577572 0.36613336 0.92747205 -0.11235481 0.37527913 0.92007715 -0.07577572 0.36613336
		 0.92747205 -0.11288161 0.37554526 0.91990405 -0.11235481 0.37527913 0.92007715 0.26056817
		 0.79786515 0.54361337 0.25992668 0.79439211 0.5489803 0.27760646 0.76709026 0.57836598
		 0.25992668 0.79439211 0.5489803 0.2764979 0.76477247 0.58195525 0.27760646 0.76709026
		 0.57836598 -0.86735314 -0.40589628 -0.28800467 -0.79089415 -0.48944259 -0.36733145
		 -0.8423624 -0.4770897 -0.25062126 -0.79089415 -0.48944259 -0.36733145 -0.7663247
		 -0.55176443 -0.32909331 -0.8423624 -0.4770897 -0.25062126 -0.5284915 0.36313981 -0.76735014
		 -0.49843156 0.22990026 -0.83588988 -0.61313552 0.31114647 -0.72612166 -0.49843156
		 0.22990026 -0.83588988 -0.57753152 0.18429323 -0.79529452 -0.61313552 0.31114647
		 -0.72612166 0.72612756 -0.63597137 -0.26130283 0.74616408 -0.59838611 -0.29184449
		 0.78628993 -0.59350204 -0.17176591 0.74616408 -0.59838611 -0.29184449 0.81282449
		 -0.54455125 -0.20683396 0.78628993 -0.59350204 -0.17176591 0.68394971 0.24827434
		 -0.685983 0.74836832 0.18324523 -0.63746846 0.64496869 0.11921461 -0.75485313 0.74836832
		 0.18324523 -0.63746846 0.70336312 0.058660511 -0.70840609 0.64496869 0.11921461 -0.75485313
		 0.94963765 -0.23590943 0.20624042 0.93530929 -0.26380089 0.23580833 0.97691041 -0.14264692
		 0.15905328 0.93530929 -0.26380089 0.23580833 0.96124232 -0.188466 0.20123065 0.97691041
		 -0.14264692 0.15905328 -4.3264666e-07 -0.84903073 0.5283435 -2.4171189e-07 -0.84889865
		 0.52855563 0.13018231 -0.84189945 0.52369636 -2.4171189e-07 -0.84889865 0.52855563
		 0.12811297 -0.84183431 0.52431101 0.13018231 -0.84189945 0.52369636 0.72858721 0.62933987
		 -0.27035534 0.71733934 0.6447286 -0.26410103 0.78121978 0.58209294 -0.22552928 0.71733934
		 0.6447286 -0.26410103 0.77449965 0.58775276 -0.2338739 0.78121978 0.58209294 -0.22552928
		 0.53044623 -0.61862451 -0.57959509 0.53510725 -0.6176129 -0.57638049 0.56683779 -0.56456149
		 -0.59997106 0.53510725 -0.6176129 -0.57638049 0.57867056 -0.5668816 -0.58633238 0.56683779
		 -0.56456149 -0.59997106 -2.4428772e-07 -0.94398689 -0.32998288 -1.0508118e-07 -0.94437635
		 -0.32886669 0.068799913 -0.9421072 -0.32817775 -1.0508118e-07 -0.94437635 -0.32886669
		 0.069227457 -0.94233036 -0.32744619 0.068799913 -0.9421072 -0.32817775 -0.51890349
		 -0.67349744 -0.52644128 -0.53044653 -0.61862522 -0.57959402 -0.51623899 -0.67142355
		 -0.53168392 -0.53044653 -0.61862522 -0.57959402 -0.53510714 -0.61761302 -0.57638055
		 -0.51623899 -0.67142355 -0.53168392 0.32423678 -0.43482146 -0.84011954 0.40751436
		 -0.33869639 -0.84806651 0.32631207 -0.3511723 -0.87760949 0.40751436 -0.33869639
		 -0.84806651 0.42018104 -0.29680482 -0.85752833 0.32631207 -0.3511723 -0.87760949
		 0.55457008 -0.51859391 0.65077835 0.52656579 -0.52479887 0.66881585 0.31457791 -0.61584848
		 0.72233742 0.52656579 -0.52479887 0.66881585 0.30158725 -0.61487603 0.72867864 0.31457791
		 -0.61584848 0.72233742 0.34905195 0.81888616 0.45561847 0.34853649 0.81942892 0.45503694
		 0.35235655 0.84859878 0.39462003 0.34853649 0.81942892 0.45503694 0.3614679 0.84571934
		 0.39255539 0.35235655 0.84859878 0.39462003 0.46627539 0.28802931 0.83643669 0.46281099
		 0.30277535 0.83314651 0.3968856 0.59215504 0.70130897 0.46281099 0.30277535 0.83314651
		 0.39038706 0.61397225 0.6860292 0.3968856 0.59215504 0.70130897 0.84963298 -0.38971886
		 0.35530695 0.85071683 -0.39023918 0.35212827 0.84345555 -0.15000275 0.51583129 0.85071683
		 -0.39023918 0.35212827 0.83982152 -0.13512158 0.52577752 0.84345555 -0.15000275 0.51583129
		 0.84963298 -0.38971886 0.35530695 0.79619288 -0.56303084 0.22152469 0.85071683 -0.39023918
		 0.35212827 0.79619288 -0.56303084 0.22152469 0.77952623 -0.59475404 0.19648542 0.85071683
		 -0.39023918 0.35212827 -0.86130869 -0.4629555 0.20933108 -0.85919809 -0.48444107
		 0.16460696 -0.73861933 -0.59579629 0.31538579 -0.85919809 -0.48444107 0.16460696
		 -0.73281074 -0.64050424 0.22965774;
	setAttr ".n[1826:1991]" -type "float3"  -0.73861933 -0.59579629 0.31538579 0.72829878
		 -0.59829605 -0.3340998 0.91407585 -0.35735875 -0.19172904 0.72701013 -0.67494905
		 -0.12609559 0.91407585 -0.35735875 -0.19172904 0.88985777 -0.44543105 -0.098713525
		 0.72701013 -0.67494905 -0.12609559 -0.063669272 -0.20758377 -0.976143 -0.076087862
		 -0.46115249 -0.88405263 -0.53478605 -0.18802212 -0.82380313 -0.076087862 -0.46115249
		 -0.88405263 -0.53863394 -0.39507368 -0.74417084 -0.53478605 -0.18802212 -0.82380313
		 0.68236667 -0.59323454 0.42713988 0.37653664 -0.74603742 0.54922521 0.66991252 -0.64588416
		 0.36612967 0.37653664 -0.74603742 0.54922521 0.36588356 -0.80065459 0.47442752 0.66991252
		 -0.64588416 0.36612967 0.39331985 -0.91465795 0.093275592 0.70267147 -0.70893914
		 0.060481738 0.37298584 -0.86664462 0.3313739 0.70267147 -0.70893914 0.060481738 0.66674429
		 -0.70133001 0.25216717 0.37298584 -0.86664462 0.3313739 0.88781506 -0.4541381 -0.074451387
		 0.86711419 -0.49382347 -0.065202512 0.9141947 -0.39514223 -0.090059273 0.86711419
		 -0.49382347 -0.065202512 0.86099923 -0.50851738 0.0095073199 0.9141947 -0.39514223
		 -0.090059273 0.9141947 -0.39514223 -0.090059273 0.86099923 -0.50851738 0.0095073199
		 0.9482643 -0.31728086 -0.011299993 0.86099923 -0.50851738 0.0095073199 0.87653941
		 -0.46207604 0.1347755 0.9482643 -0.31728086 -0.011299993 0.38070709 -0.67710155 0.62975836
		 0.38512903 -0.70779485 0.59220099 0.67842782 -0.54016006 0.49795863 0.38512903 -0.70779485
		 0.59220099 0.68573606 -0.55833334 0.46693674 0.67842782 -0.54016006 0.49795863 -0.44819206
		 -0.89387316 -0.010710707 -0.49723831 -0.84923148 -0.17765106 -0.66046876 -0.74906677
		 0.051768582 -0.49723831 -0.84923148 -0.17765106 -0.71623492 -0.69401139 -0.073182829
		 -0.66046876 -0.74906677 0.051768582 -0.81668323 0.44178563 -0.37128687 -0.60513681
		 0.6211403 -0.4979901 -0.80045074 0.44189459 -0.40497869 -0.60513681 0.6211403 -0.4979901
		 -0.57174337 0.63146019 -0.52380115 -0.80045074 0.44189459 -0.40497869 -0.93701845
		 0.23326164 -0.25997195 -0.81668323 0.44178563 -0.37128687 -0.94439751 0.20088205
		 -0.26030707 -0.81668323 0.44178563 -0.37128687 -0.80045074 0.44189459 -0.40497869
		 -0.94439751 0.20088205 -0.26030707 0.0028407953 -0.73492831 0.67813885 -0.34780723
		 -0.70427561 0.61889088 -0.0096910028 -0.76888633 0.63931209 -0.34780723 -0.70427561
		 0.61889088 -0.391835 -0.72205901 0.57017201 -0.0096910028 -0.76888633 0.63931209
		 0.092684746 0.99569553 -5.476435e-05 0.09984716 0.99382174 -0.048464917 0.092627145
		 0.99570084 -1.745846e-05 0.09984716 0.99382174 -0.048464917 0.099953003 0.99380678
		 -0.048554007 0.092627145 0.99570084 -1.745846e-05 0.63626152 0.047949523 -0.76998192
		 0.88600153 0.0087278998 -0.46360022 0.68826032 -0.12656619 -0.714338 0.88600153 0.0087278998
		 -0.46360022 0.91186607 -0.11888491 -0.39289516 0.68826032 -0.12656619 -0.714338 0.37362751
		 0.7054376 -0.60229582 0.36309412 0.72296119 -0.58778375 0.66993523 0.55959487 -0.48789385
		 0.36309412 0.72296119 -0.58778375 0.66472489 0.57283485 -0.47958425 0.66993523 0.55959487
		 -0.48789385 -0.97736859 -0.14100708 -0.15769473 -0.88227218 -0.33192629 -0.33379751
		 -0.96778452 -0.22675686 -0.10942759 -0.88227218 -0.33192629 -0.33379751 -0.86735314
		 -0.40589628 -0.28800467 -0.96778452 -0.22675686 -0.10942759 -0.45675501 0.63459867
		 -0.62342548 -0.34963721 0.67372322 -0.65103829 -0.43430242 0.41366851 -0.80016232
		 -0.34963721 0.67372322 -0.65103829 -0.33128238 0.4475016 -0.83065897 -0.43430242
		 0.41366851 -0.80016232 -0.96423942 -0.19491337 0.17958604 -0.91979563 -0.39163819
		 -0.024403272 -0.93309426 -0.27843961 0.22761048 -0.91979563 -0.39163819 -0.024403272
		 -0.88484609 -0.46572685 0.012076274 -0.93309426 -0.27843961 0.22761048 -0.97362667
		 0.2217422 -0.05367988 -0.96933359 0.020001331 -0.24493331 -0.99039871 0.13805851
		 -0.0070874756 -0.96933359 0.020001331 -0.24493331 -0.9782964 -0.062963068 -0.19741279
		 -0.99039871 0.13805851 -0.0070874756 -0.79075313 0.39577124 -0.46698463 -0.76876318
		 0.58771336 -0.25218275 -0.71985048 0.46630287 -0.51417601 -0.76876318 0.58771336
		 -0.25218275 -0.69677722 0.65538889 -0.29149094 -0.71985048 0.46630287 -0.51417601
		 -0.11578536 0.89565569 -0.42941198 1.6920271e-07 0.90156043 -0.43265316 -0.11890273
		 0.72156405 -0.68206114 1.6920271e-07 0.90156043 -0.43265316 1.5065052e-07 0.72771388
		 -0.68588078 -0.11890273 0.72156405 -0.68206114 -0.93083125 -0.34618571 0.11708372
		 -0.70258355 -0.59789497 0.38587296 -0.92035902 -0.37694597 0.10416847 -0.70258355
		 -0.59789497 0.38587296 -0.69916707 -0.65848303 0.27850592 -0.92035902 -0.37694597
		 0.10416847 0.94941574 -0.30610654 -0.070060946 0.91979563 -0.39163825 -0.02440328
		 0.8423624 -0.4770897 -0.25062132 0.91979563 -0.39163825 -0.02440328 0.81282449 -0.54455125
		 -0.20683396 0.8423624 -0.4770897 -0.25062132 0.52849185 0.36313975 -0.7673499 0.43430254
		 0.41366848 -0.80016226 0.55454308 0.58676451 -0.59007573 0.43430254 0.41366848 -0.80016226
		 0.4567548 0.63459885 -0.62342554 0.55454308 0.58676451 -0.59007573 0.88838315 -0.36353132
		 0.28039333 0.84142148 -0.53691828 0.061062895 0.9330942 -0.27843967 0.2276105 0.84142148
		 -0.53691828 0.061062895 0.88484603 -0.46572709 0.012075986 0.9330942 -0.27843967
		 0.2276105 0.95036978 0.29702014 -0.092608355 0.97362667 0.2217422 -0.053679608 0.95328736
		 0.096820898 -0.28612736 0.97362667 0.2217422 -0.053679608 0.96933353 0.020001357
		 -0.24493349 0.95328736 0.096820898 -0.28612736 0.61965829 0.71474427 -0.32429034
		 0.69677716 0.65538877 -0.29149112 0.64400381 0.52878296 -0.55285406 0.69677716 0.65538877
		 -0.29149112 0.71985048 0.46630284 -0.51417595 0.64400381 0.52878296 -0.55285406 0.11890284
		 0.72156405 -0.6820612 0.11578543 0.89565569 -0.42941198 0.23498091 0.7034077 -0.67082161
		 0.11578543 0.89565569 -0.42941198 0.22692274 0.87896758 -0.41943064 0.23498091 0.7034077
		 -0.67082161 0.11524539 0.48986095 -0.86414969 3.6526138e-09 0.50518793 -0.86300939
		 0.11890284 0.72156405 -0.6820612;
	setAttr ".n[1992:2157]" -type "float3"  3.6526138e-09 0.50518793 -0.86300939
		 1.5065052e-07 0.72771388 -0.68588078 0.11890284 0.72156405 -0.6820612 0.28278285
		 -0.89740258 -0.33867756 0.25580376 -0.92671645 -0.27524731 0.57442969 -0.77200139
		 -0.27211109 0.25580376 -0.92671645 -0.27524731 0.55469638 -0.79980075 -0.22941385
		 0.57442969 -0.77200139 -0.27211109 0.68029237 -0.63774472 0.36122558 0.66948342 -0.57591569
		 0.46916208 0.81264901 -0.51394463 0.27470443 0.66948342 -0.57591569 0.46916208 0.84187806
		 -0.41726008 0.34225038 0.81264901 -0.51394463 0.27470443 0.29520726 0.94529283 -0.13883141
		 0.26381338 0.96451396 0.010739069 0.38407055 0.91507345 -0.12300549 0.26381338 0.96451396
		 0.010739069 0.33875236 0.9406206 0.021902878 0.38407055 0.91507345 -0.12300549 0.90259761
		 0.33155316 0.27457246 0.91455388 0.24283937 0.32345054 0.95433265 0.23017305 0.19044563
		 0.91455388 0.24283937 0.32345054 0.95988941 0.14305152 0.24114016 0.95433265 0.23017305
		 0.19044563 -0.24072877 -0.49322236 0.83593142 -0.21867406 -0.43946084 0.87123811
		 -0.3444958 -0.49623245 0.79691654 -0.21867406 -0.43946084 0.87123811 -0.32263941
		 -0.43072465 0.84284049 -0.3444958 -0.49623245 0.79691654 -0.74619633 0.66526973 -0.024643268
		 -0.67144459 0.73605621 0.085926354 -0.6912697 0.7209658 -0.048524193 -0.67144459
		 0.73605621 0.085926354 -0.6129024 0.7871567 0.068810761 -0.6912697 0.7209658 -0.048524193
		 0.33662209 0.78737885 -0.51644957 0.29571632 0.80126733 -0.52011776 0.21643715 0.84992361
		 -0.48040071 0.29571632 0.80126733 -0.52011776 0.1869642 0.8849932 -0.42641699 0.21643715
		 0.84992361 -0.48040071 -0.21643713 0.84992361 -0.48040074 -0.095164016 0.92400497
		 -0.37034938 -0.1869643 0.88499308 -0.42641714 -0.095164016 0.92400497 -0.37034938
		 -0.073139474 0.93511087 -0.34672505 -0.1869643 0.88499308 -0.42641714 0.33524978
		 0.56155717 0.75647944 0.33355889 0.55968374 0.75861228 0.32638034 0.5352357 0.77910113
		 0.33355889 0.55968374 0.75861228 0.32448089 0.53415972 0.78063154 0.32638034 0.5352357
		 0.77910113 0.15095969 0.8582598 0.49051121 0.1537019 0.85866529 0.48894745 0.19400916
		 0.8448723 0.49854916 0.1537019 0.85866529 0.48894745 0.19711177 0.84324688 0.50008172
		 0.19400916 0.8448723 0.49854916 -0.3406193 0.63712019 0.6914162 -0.34114078 0.613186
		 0.71247876 -0.3397907 0.63587171 0.69297141 -0.34114078 0.613186 0.71247876 -0.340325
		 0.61168188 0.71415973 -0.3397907 0.63587171 0.69297141 -0.19540413 0.40759248 0.89201212
		 -0.16913281 0.39655676 0.90229529 -0.19352606 0.40794095 0.89226222 -0.16913281 0.39655676
		 0.90229529 -0.16850346 0.39656377 0.90240997 -0.19352606 0.40794095 0.89226222 -0.26056805
		 0.79786563 0.5436126 -0.2776064 0.76709038 0.57836586 -0.25992653 0.79439247 0.54897982
		 -0.2776064 0.76709038 0.57836586 -0.27649781 0.76477224 0.58195561 -0.25992653 0.79439247
		 0.54897982 -0.81282449 -0.54455101 -0.20683452 -0.74616396 -0.59838611 -0.29184493
		 -0.78628999 -0.59350193 -0.171766 -0.74616396 -0.59838611 -0.29184493 -0.72612768
		 -0.63597143 -0.26130229 -0.78628999 -0.59350193 -0.171766 -0.68394983 0.24827453
		 -0.68598282 -0.64496899 0.11921457 -0.75485289 -0.74836844 0.18324494 -0.63746846
		 -0.64496899 0.11921457 -0.75485289 -0.70336324 0.058660399 -0.70840603 -0.74836844
		 0.18324494 -0.63746846 0.79434162 0.11472136 -0.59654039 0.83608097 0.043210939 -0.54690164
		 0.74469376 -0.0094315102 -0.66733974 0.83608097 0.043210939 -0.54690164 0.7812379
		 -0.073283188 -0.61991686 0.74469376 -0.0094315102 -0.66733974 0.28197029 0.95635796
		 -0.076630376 0.2226181 0.97021776 -0.095491774 0.27705577 0.95775622 -0.077091351
		 0.2226181 0.97021776 -0.095491774 0.22173667 0.97032684 -0.09642987 0.27705577 0.95775622
		 -0.077091351 0.83923376 0.51459718 -0.1757171 0.83977365 0.51384705 -0.17533247 0.88672918
		 0.44609693 -0.12127996 0.83977365 0.51384705 -0.17533247 0.87074721 0.46904618 -0.14763103
		 0.88672918 0.44609693 -0.12127996 -0.13018239 -0.84189945 0.5236963 -0.23851486 -0.82499886
		 0.51233542 -0.12811278 -0.84183425 0.52431113 -0.23851486 -0.82499886 0.51233542
		 -0.23052561 -0.82578701 0.51471716 -0.12811278 -0.84183425 0.52431113 -4.3264666e-07
		 -0.84903073 0.5283435 -0.13018239 -0.84189945 0.5236963 -2.4171189e-07 -0.84889865
		 0.52855563 -0.13018239 -0.84189945 0.5236963 -0.12811278 -0.84183425 0.52431113 -2.4171189e-07
		 -0.84889865 0.52855563 0.60295141 -0.51767588 -0.60701007 0.60614532 -0.51809299
		 -0.60346293 0.5978182 -0.48864752 -0.63548166 0.60614532 -0.51809299 -0.60346293
		 0.59050089 -0.48748806 -0.6431672 0.5978182 -0.48864752 -0.63548166 0.12171621 -0.93548667
		 -0.33173758 0.12377658 -0.93460804 -0.33344734 0.17668948 -0.92028069 -0.34909073
		 0.12377658 -0.93460804 -0.33344734 0.17829134 -0.91847205 -0.35301736 0.17668948
		 -0.92028069 -0.34909073 -0.47528508 -0.74442452 -0.46897364 -0.50772673 -0.70784646
		 -0.49108756 -0.47748458 -0.74552077 -0.4649809 -0.50772673 -0.70784646 -0.49108756
		 -0.5075776 -0.70706081 -0.49237174 -0.47748458 -0.74552077 -0.4649809 -0.40751436
		 -0.33869645 -0.84806645 -0.42018101 -0.29680479 -0.85752833 -0.46464869 -0.31858951
		 -0.8261975 -0.42018101 -0.29680479 -0.85752833 -0.46643996 -0.31340149 -0.82717186
		 -0.46464869 -0.31858951 -0.8261975 -0.55541396 -0.50682408 0.65927589 -0.54099041
		 -0.52289921 0.65871525 -0.64559716 -0.46000129 0.60959256 -0.54099041 -0.52289921
		 0.65871525 -0.65016234 -0.47131267 0.59594744 -0.64559716 -0.46000129 0.60959256
		 0.51661456 0.83232933 0.20084153 0.56886053 0.80065662 0.18800721 0.74227232 0.6699174
		 -0.015570381 0.56886053 0.80065662 0.18800721 0.7618475 0.64734834 -0.022991056 0.74227232
		 0.6699174 -0.015570381 0.57768112 -0.41161108 0.70488358 0.56921959 -0.40738598 0.71416086
		 0.51958138 -0.098033421 0.84877831 0.56921959 -0.40738598 0.71416086 0.51601946 -0.10358655
		 0.85029042 0.51958138 -0.098033421 0.84877831 0.11350171 0.50804573 0.85381901;
	setAttr ".n[2158:2323]" -type "float3"  0.12696666 0.50559807 0.85337567 0.24525651
		 0.46928447 0.84830499 0.12696666 0.50559807 0.85337567 0.29722872 0.44836178 0.84298682
		 0.24525651 0.46928447 0.84830499 -0.849778 -0.38864005 0.35614073 -0.85152197 -0.38648582
		 0.35431486 -0.79619294 -0.56303072 0.22152479 -0.85152197 -0.38648582 0.35431486
		 -0.77952623 -0.59475404 0.19648537 -0.79619294 -0.56303072 0.22152479 -0.73861933
		 -0.59579629 0.31538579 -0.72815764 -0.57819343 0.36807442 -0.86130869 -0.4629555
		 0.20933108 -0.72815764 -0.57819343 0.36807442 -0.85299242 -0.46219856 0.24243841
		 -0.86130869 -0.4629555 0.20933108 -0.93268538 -0.13941853 -0.33265674 -0.92902386
		 -0.25379157 -0.26926669 -0.9748649 -0.16152059 -0.15345861 0.68573606 -0.55833334
		 0.46693674 0.38512903 -0.70779485 0.59220099 0.68236667 -0.59323454 0.42713988 0.38512903
		 -0.70779485 0.59220099 0.37653664 -0.74603742 0.54922521 0.68236667 -0.59323454 0.42713988
		 0.37298584 -0.86664462 0.3313739 0.66674429 -0.70133001 0.25216717 0.36588356 -0.80065459
		 0.47442752 0.66674429 -0.70133001 0.25216717 0.66991252 -0.64588416 0.36612967 0.36588356
		 -0.80065459 0.47442752 0.67467684 0.55009466 -0.49214536 0.88974154 0.33450446 -0.31059104
		 0.67833167 0.49581343 -0.5422501 0.88974154 0.33450446 -0.31059104 0.9076317 0.26611984
		 -0.3246305 0.67833167 0.49581343 -0.5422501 0.87393111 -0.42873058 -0.22898576 0.81938154
		 -0.54549026 -0.1762221 0.88074434 -0.44626716 -0.15854022 0.81938154 -0.54549026
		 -0.1762221 0.81391865 -0.56645876 -0.12907723 0.88074434 -0.44626716 -0.15854022
		 0.38512903 -0.70779485 0.59220099 0.38070709 -0.67710155 0.62975836 -0.0096910028
		 -0.76888633 0.63931209 0.38070709 -0.67710155 0.62975836 0.0028407953 -0.73492831
		 0.67813885 -0.0096910028 -0.76888633 0.63931209 -0.66046876 -0.74906677 0.051768582
		 -0.71623492 -0.69401139 -0.073182829 -0.79605806 -0.5959397 0.10558139 -0.71623492
		 -0.69401139 -0.073182829 -0.8421036 -0.53925997 -0.0077600824 -0.79605806 -0.5959397
		 0.10558139 -0.94439751 0.20088205 -0.26030707 -0.99455112 -0.061164558 -0.084421247
		 -0.93701845 0.23326164 -0.25997195 -0.99455112 -0.061164558 -0.084421247 -0.99385732
		 -0.044407714 -0.10136847 -0.93701845 0.23326164 -0.25997195 -0.72815764 -0.57819343
		 0.36807442 -0.70671803 -0.57864982 0.40707994 -0.85299242 -0.46219856 0.24243841
		 -0.70671803 -0.57864982 0.40707994 -0.83737296 -0.47044823 0.27836117 -0.85299242
		 -0.46219856 0.24243841 0.043621261 -0.61468589 0.78756487 -0.21360292 -0.63727045
		 0.74044591 0.022424145 -0.66519088 0.74633658 -0.21360292 -0.63727045 0.74044591
		 -0.29926378 -0.64756119 0.70078933 0.022424145 -0.66519088 0.74633658 -0.94770986
		 -0.29965261 0.10979202 -0.94532084 -0.30246815 0.12198975 -0.99366605 -0.076975398
		 -0.081869029 -0.94532084 -0.30246815 0.12198975 -0.99455112 -0.061164558 -0.084421247
		 -0.99366605 -0.076975398 -0.081869029 0.061020538 0.99757218 0.033558533 0.092684746
		 0.99569553 -5.476435e-05 0.061661288 0.99751633 0.034045201 0.092684746 0.99569553
		 -5.476435e-05 0.092627145 0.99570084 -1.745846e-05 0.061661288 0.99751633 0.034045201
		 -0.0030453084 0.99508286 0.098999053 -0.0029302216 0.99514323 0.098394036 -0.012053555
		 0.99620956 0.08614628 -0.0029302216 0.99514323 0.098394036 -0.01215928 0.99622965
		 0.085898787 -0.012053555 0.99620956 0.08614628 0.36015362 0.72838491 -0.58287632
		 0.35883802 0.72143924 -0.59225053 0.66782451 0.56758571 -0.48151523 0.35883802 0.72143924
		 -0.59225053 0.68886167 0.5182839 -0.50680506 0.66782451 0.56758571 -0.48151523 -0.68077242
		 0.64806932 -0.34140167 -0.69439465 0.63764364 -0.33350655 -0.70365733 0.62070233
		 -0.34582508 -0.69439465 0.63764364 -0.33350655 -0.71019608 0.61450416 -0.34352025
		 -0.70365733 0.62070233 -0.34582508 -0.96778452 -0.22675686 -0.10942759 -0.86735314
		 -0.40589628 -0.28800467 -0.94941574 -0.30610654 -0.070061281 -0.86735314 -0.40589628
		 -0.28800467 -0.8423624 -0.4770897 -0.25062126 -0.94941574 -0.30610654 -0.070061281
		 -0.55454308 0.58676463 -0.59007567 -0.5284915 0.36313981 -0.76735014 -0.64400381
		 0.52878302 -0.55285406 -0.5284915 0.36313981 -0.76735014 -0.61313552 0.31114647 -0.72612166
		 -0.64400381 0.52878302 -0.55285406 -0.93962836 -0.020910287 0.34155723 -0.96423942
		 -0.19491337 0.17958604 -0.91375619 -0.098637827 0.39410689 -0.96423942 -0.19491337
		 0.17958604 -0.93309426 -0.27843961 0.22761048 -0.91375619 -0.098637827 0.39410689
		 -0.99039871 0.13805851 -0.0070874756 -0.94045079 0.30391505 0.15227585 -0.97362667
		 0.2217422 -0.05367988 -0.94045079 0.30391505 0.15227585 -0.91577828 0.38634938 0.10992865
		 -0.97362667 0.2217422 -0.05367988 -0.76876318 0.58771336 -0.25218275 -0.6912697 0.7209658
		 -0.048524193 -0.69677722 0.65538889 -0.29149094 -0.6912697 0.7209658 -0.048524193
		 -0.61820269 0.78266305 -0.072553277 -0.69677722 0.65538889 -0.29149094 -0.56593013
		 -0.60112673 0.56424266 -0.50122488 -0.60252964 0.62107295 -0.52595341 -0.4911319
		 0.69437915 -0.50122488 -0.60252964 0.62107295 -0.44400099 -0.49979246 0.74368715
		 -0.52595341 -0.4911319 0.69437915 -0.10468805 0.98155522 -0.15996785 -1.0348368e-09
		 0.98572814 -0.16834511 -0.11578536 0.89565569 -0.42941198 -1.0348368e-09 0.98572814
		 -0.16834511 1.6920271e-07 0.90156043 -0.43265316 -0.11578536 0.89565569 -0.42941198
		 -0.83737296 -0.47044823 0.27836117 -0.81184357 -0.49291548 0.31296062 -0.95275867
		 -0.28984371 0.090783171 -0.81184357 -0.49291548 0.31296062 -0.94770986 -0.29965261
		 0.10979202 -0.95275867 -0.28984371 0.090783171 0.88484603 -0.46572709 0.012075986
		 0.78628993 -0.59350204 -0.17176591 0.91979563 -0.39163825 -0.02440328 0.78628993
		 -0.59350204 -0.17176591 0.81282449 -0.54455125 -0.20683396 0.91979563 -0.39163825
		 -0.02440328 0.71985048 0.46630284 -0.51417595 0.7907533 0.39577127 -0.46698427 0.68394971
		 0.24827434 -0.685983 0.7907533 0.39577127 -0.46698427 0.74836832 0.18324523 -0.63746846
		 0.68394971 0.24827434 -0.685983 0.91375625 -0.098637752 0.39410675 0.87230206 -0.18841381
		 0.4512088;
	setAttr ".n[2324:2489]" -type "float3"  0.9330942 -0.27843967 0.2276105 0.87230206
		 -0.18841381 0.4512088 0.88838315 -0.36353132 0.28039333 0.9330942 -0.27843967 0.2276105
		 0.97362667 0.2217422 -0.053679608 0.95036978 0.29702014 -0.092608355 0.91577828 0.38634938
		 0.1099285 0.95036978 0.29702014 -0.092608355 0.88634223 0.45655921 0.077144049 0.91577828
		 0.38634938 0.1099285 0.54572451 0.83303243 -0.090783715 0.6182031 0.78266275 -0.072553232
		 0.61965829 0.71474427 -0.32429034 0.6182031 0.78266275 -0.072553232 0.69677716 0.65538877
		 -0.29149112 0.61965829 0.71474427 -0.32429034 0.11578543 0.89565569 -0.42941198 0.1046882
		 0.98155522 -0.15996787 0.22692274 0.87896758 -0.41943064 0.1046882 0.98155522 -0.15996787
		 0.19862905 0.96809596 -0.15276375 0.22692274 0.87896758 -0.41943064 -0.71623492 -0.69401139
		 -0.073182829 -0.75529945 -0.63782752 -0.15066114 -0.8421036 -0.53925997 -0.0077600824
		 -0.75529945 -0.63782752 -0.15066114 -0.88248169 -0.46918821 -0.032992579 -0.8421036
		 -0.53925997 -0.0077600824 -0.82382631 -0.4893733 0.28604895 -0.80772716 -0.46222955
		 0.36595172 -0.69390869 -0.61758167 0.37024802 -0.80772716 -0.46222955 0.36595172
		 -0.64956242 -0.56560254 0.50809693 -0.69390869 -0.61758167 0.37024802 0.19862905
		 0.96809596 -0.15276375 0.17865126 0.98390669 -0.0033727167 0.29520726 0.94529283
		 -0.13883141 0.17865126 0.98390669 -0.0033727167 0.26381338 0.96451396 0.010739069
		 0.29520726 0.94529283 -0.13883141 0.88359052 0.4029333 0.2385636 0.90259761 0.33155316
		 0.27457246 0.94045085 0.30391511 0.1522755 0.90259761 0.33155316 0.27457246 0.95433265
		 0.23017305 0.19044563 0.94045085 0.30391511 0.1522755 -0.5889678 -0.38176879 0.71229875
		 -0.67820311 -0.32044935 0.66132653 -0.61370939 -0.45667991 0.64405292 -0.67820311
		 -0.32044935 0.66132653 -0.69413286 -0.40319315 0.59633458 -0.61370939 -0.45667991
		 0.64405292 -0.80272084 0.59628206 0.0093244677 -0.73119551 0.67256457 0.1140615 -0.74619633
		 0.66526973 -0.024643268 -0.73119551 0.67256457 0.1140615 -0.67144459 0.73605621 0.085926354
		 -0.74619633 0.66526973 -0.024643268 -0.82580101 -0.25954992 0.50068605 -0.80175674
		 -0.15959506 0.57594752 -0.87230206 -0.18841383 0.4512088 -0.80175674 -0.15959506
		 0.57594752 -0.84353751 -0.080506176 0.5310021 -0.87230206 -0.18841383 0.4512088 -0.095164016
		 0.92400497 -0.37034938 -4.7087823e-09 0.94813716 -0.3178615 -0.073139474 0.93511087
		 -0.34672505 -4.7087823e-09 0.94813716 -0.3178615 2.4899773e-09 0.9502337 -0.31153798
		 -0.073139474 0.93511087 -0.34672505 0.32638034 0.5352357 0.77910113 0.32448089 0.53415972
		 0.78063154 0.31555307 0.515441 0.79671001 0.32448089 0.53415972 0.78063154 0.31416598
		 0.51417959 0.7980721 0.31555307 0.515441 0.79671001 0.041193329 0.36156088 0.93143803
		 0.074956283 0.36567539 0.9277193 0.041504707 0.361494 0.93145019 0.074956283 0.36567539
		 0.9277193 0.075775929 0.36613315 0.92747211 0.041504707 0.361494 0.93145019 -0.33520916
		 0.66561925 0.66677272 -0.3406193 0.63712019 0.6914162 -0.3344219 0.66352332 0.66925246
		 -0.3406193 0.63712019 0.6914162 -0.3397907 0.63587171 0.69297141 -0.3344219 0.66352332
		 0.66925246 -0.1420496 0.38666236 0.91121572 -0.14233997 0.3863664 0.91129595 -0.16913281
		 0.39655676 0.90229529 -0.14233997 0.3863664 0.91129595 -0.16850346 0.39656377 0.90240997
		 -0.16913281 0.39655676 0.90229529 -0.23147784 0.82549328 0.51476103 -0.26056805 0.79786563
		 0.5436126 -0.23185752 0.8235057 0.51776487 -0.26056805 0.79786563 0.5436126 -0.25992653
		 0.79439247 0.54897982 -0.23185752 0.8235057 0.51776487 -0.75190514 -0.64638531 -0.1297098
		 -0.78628999 -0.59350193 -0.171766 -0.70816225 -0.66876489 -0.22640628 -0.78628999
		 -0.59350193 -0.171766 -0.72612768 -0.63597143 -0.26130229 -0.70816225 -0.66876489
		 -0.22640628 -0.61313552 0.31114647 -0.72612166 -0.57753152 0.18429323 -0.79529452
		 -0.68394983 0.24827453 -0.68598282 -0.57753152 0.18429323 -0.79529452 -0.64496899
		 0.11921457 -0.75485289 -0.68394983 0.24827453 -0.68598282 0.74469376 -0.0094315102
		 -0.66733974 0.70336312 0.058660511 -0.70840609 0.79434162 0.11472136 -0.59654039
		 0.70336312 0.058660511 -0.70840609 0.74836832 0.18324523 -0.63746846 0.79434162 0.11472136
		 -0.59654039 -0.70016509 -0.70296383 0.124943 -0.70617557 -0.70771348 0.021393267
		 -0.75339526 -0.65675414 -0.032705158 -0.70617557 -0.70771348 0.021393267 -0.70841551
		 -0.70209795 -0.072152309 -0.75339526 -0.65675414 -0.032705158 0.65264231 -0.63557816
		 0.4124299 0.65819585 -0.63280147 0.4078486 0.58537602 -0.68597525 0.43217221 0.65819585
		 -0.63280147 0.4078486 0.56022608 -0.7029261 0.43822554 0.58537602 -0.68597525 0.43217221
		 0.65819585 -0.63280147 0.4078486 0.65264231 -0.63557816 0.4124299 0.73959714 -0.56028956
		 0.37292308 0.65264231 -0.63557816 0.4124299 0.7318328 -0.56476372 0.38139573 0.73959714
		 -0.56028956 0.37292308 0.88672918 0.44609693 -0.12127996 0.87074721 0.46904618 -0.14763103
		 0.93051976 0.3595235 -0.069826864 0.87074721 0.46904618 -0.14763103 0.89666319 0.42552492
		 -0.12216229 0.93051976 0.3595235 -0.069826864 -0.23851486 -0.82499886 0.51233542
		 -0.3531245 -0.7954151 0.49256262 -0.23052561 -0.82578701 0.51471716 -0.3531245 -0.7954151
		 0.49256262 -0.33985937 -0.79776627 0.49806082 -0.23052561 -0.82578701 0.51471716
		 -0.78121978 0.58209282 -0.22552949 -0.8392337 0.51459718 -0.17571713 -0.77449965
		 0.58775276 -0.2338738 -0.8392337 0.51459718 -0.17571713 -0.8397736 0.51384705 -0.17533244
		 -0.77449965 0.58775276 -0.2338738 0.5978182 -0.48864752 -0.63548166 0.59050089 -0.48748806
		 -0.6431672 0.57056201 -0.45061255 -0.68659109 0.59050089 -0.48748806 -0.6431672 0.56423944
		 -0.44840118 -0.69323176 0.57056201 -0.45061255 -0.68659109 0.17668948 -0.92028069
		 -0.34909073 0.17829134 -0.91847205 -0.35301736 0.23512594 -0.89620274 -0.37621328
		 0.17829134 -0.91847205 -0.35301736 0.23716046 -0.89561921 -0.37632591 0.23512594
		 -0.89620274 -0.37621328;
	setAttr ".n[2490:2655]" -type "float3"  -0.43774304 -0.77958697 -0.44791204 -0.47528508
		 -0.74442452 -0.46897364 -0.43977731 -0.77848542 -0.44783524 -0.47528508 -0.74442452
		 -0.46897364 -0.47748458 -0.74552077 -0.4649809 -0.43977731 -0.77848542 -0.44783524
		 -0.46464869 -0.31858951 -0.8261975 -0.46643996 -0.31340149 -0.82717186 -0.48216516
		 -0.33646566 -0.80889285 -0.46643996 -0.31340149 -0.82717186 -0.48336339 -0.33645496
		 -0.80818182 -0.48216516 -0.33646566 -0.80889285 -0.30805421 -0.52883554 0.79084486
		 -0.24072877 -0.49322236 0.83593142 -0.4174799 -0.58068693 0.69893724 -0.24072877
		 -0.49322236 0.83593142 -0.3444958 -0.49623245 0.79691654 -0.4174799 -0.58068693 0.69893724
		 -0.55541396 -0.50682408 0.65927589 -0.31441548 -0.61719799 0.72125554 -0.54099041
		 -0.52289921 0.65871525 -0.31441548 -0.61719799 0.72125554 -0.3023043 -0.61586541
		 0.72754514 -0.54099041 -0.52289921 0.65871525 0.8518967 0.47329825 -0.22418913 0.74227232
		 0.6699174 -0.015570381 0.84769994 0.48380938 -0.21756218 0.74227232 0.6699174 -0.015570381
		 0.7618475 0.64734834 -0.022991056 0.84769994 0.48380938 -0.21756218 0.61135775 -0.6978792
		 -0.37310365 0.60885972 -0.69424534 -0.38381401 0.53369033 -0.76362509 -0.36338878
		 0.60885972 -0.69424534 -0.38381401 0.52585727 -0.76661444 -0.36847854 0.53369033
		 -0.76362509 -0.36338878 0 0.51590192 0.85664767 1.5856789e-09 0.51590192 0.85664767
		 0.11350171 0.50804573 0.85381901 1.5856789e-09 0.51590192 0.85664767 0.12696666 0.50559807
		 0.85337567 0.11350171 0.50804573 0.85381901 -0.39270163 -0.91642118 -0.077185772
		 -0.37645355 -0.92337018 -0.075300708 -0.21894319 -0.9697054 -0.1083298 -0.37645355
		 -0.92337018 -0.075300708 -0.21057878 -0.97165477 -0.10744124 -0.21894319 -0.9697054
		 -0.1083298 -0.0096910028 -0.76888633 0.63931209 -0.022763075 -0.80480301 0.59310538
		 0.38512903 -0.70779485 0.59220099 -0.022763075 -0.80480301 0.59310538 0.37653664
		 -0.74603742 0.54922521 0.38512903 -0.70779485 0.59220099 -0.035561107 -0.93088824
		 0.36356911 0.37298584 -0.86664462 0.3313739 -0.032404736 -0.85560393 0.51661581 0.37298584
		 -0.86664462 0.3313739 0.36588356 -0.80065459 0.47442752 -0.032404736 -0.85560393
		 0.51661581 0.36309412 0.72296119 -0.58778375 0.37362751 0.7054376 -0.60229582 0.0013146511
		 0.7780149 -0.62824446 0.37362751 0.7054376 -0.60229582 -0.0051630624 0.76245844 -0.64701664
		 0.0013146511 0.7780149 -0.62824446 0.29238617 -0.7137385 0.63646495 0.29188693 -0.91357374
		 0.28316966 0.044924513 -0.73209339 0.67972136 0.29188693 -0.91357374 0.28316966 0.034750782
		 -0.95857573 0.28271008 0.044924513 -0.73209339 0.67972136 0.99174976 0.018404676
		 -0.12686089 0.99259633 0.05307449 -0.10925005 0.99455869 -0.019491998 -0.10233814
		 0.99259633 0.05307449 -0.10925005 0.99726993 0.0090507055 -0.073285475 0.99455869
		 -0.019491998 -0.10233814 0.68236667 -0.59323454 0.42713988 0.86690909 -0.40894362
		 0.28501546 0.68573606 -0.55833334 0.46693674 0.86690909 -0.40894362 0.28501546 0.86953312
		 -0.37816122 0.31765753 0.68573606 -0.55833334 0.46693674 -0.048498362 0.026742736
		 -0.99846518 -0.02864201 0.30136704 -0.95307791 0.33061299 0.038162164 -0.94299453
		 -0.02864201 0.30136704 -0.95307791 0.33500862 0.3051841 -0.89142126 0.33061299 0.038162164
		 -0.94299453 -0.123022 -0.72941476 0.67291874 0.044924513 -0.73209339 0.67972136 -0.1624411
		 -0.93307263 0.32091793 0.044924513 -0.73209339 0.67972136 0.034750782 -0.95857573
		 0.28271008 -0.1624411 -0.93307263 0.32091793 -0.41219616 -0.70674402 0.57498449 -0.42855948
		 -0.82762933 0.36244506 -0.70258355 -0.59789497 0.38587296 -0.42855948 -0.82762933
		 0.36244506 -0.69916707 -0.65848303 0.27850592 -0.70258355 -0.59789497 0.38587296
		 -0.73957157 -0.55123562 0.38622946 -0.7812252 -0.51439792 0.35366929 -0.50098377
		 -0.62869781 0.59477252 -0.7812252 -0.51439792 0.35366929 -0.605304 -0.58354694 0.5413686
		 -0.50098377 -0.62869781 0.59477252 0.061020538 0.99757218 0.033558533 0.061661288
		 0.99751633 0.034045201 0.049199522 0.99727863 0.054906111 0.061661288 0.99751633
		 0.034045201 0.049208779 0.99728262 0.054826129 0.049199522 0.99727863 0.054906111
		 -0.012053555 0.99620956 0.08614628 -0.01215928 0.99622965 0.085898787 -0.034354277
		 0.99675715 0.072766773 -0.01215928 0.99622965 0.085898787 -0.03451227 0.99672753
		 0.073096506 -0.034354277 0.99675715 0.072766773 0.66782451 0.56758571 -0.48151523
		 0.66472489 0.57283485 -0.47958425 0.36015362 0.72838491 -0.58287632 0.66472489 0.57283485
		 -0.47958425 0.36309412 0.72296119 -0.58778375 0.36015362 0.72838491 -0.58287632 -0.38063785
		 0.67287791 -0.63431078 -0.64610577 0.53980261 -0.53959292 -0.35205185 0.70722651
		 -0.6130988 -0.64610577 0.53980261 -0.53959292 -0.61394888 0.57949507 -0.53595918
		 -0.35205185 0.70722651 -0.6130988 -0.94941574 -0.30610654 -0.070061281 -0.8423624
		 -0.4770897 -0.25062126 -0.91979563 -0.39163819 -0.024403272 -0.8423624 -0.4770897
		 -0.25062126 -0.81282449 -0.54455101 -0.20683452 -0.91979563 -0.39163819 -0.024403272
		 -0.45675501 0.63459867 -0.62342548 -0.43430242 0.41366851 -0.80016232 -0.55454308
		 0.58676463 -0.59007567 -0.43430242 0.41366851 -0.80016232 -0.5284915 0.36313981 -0.76735014
		 -0.55454308 0.58676463 -0.59007567 -0.88838303 -0.36353129 0.28039363 -0.93309426
		 -0.27843961 0.22761048 -0.84142154 -0.53691816 0.06106282 -0.93309426 -0.27843961
		 0.22761048 -0.88484609 -0.46572685 0.012076274 -0.84142154 -0.53691816 0.06106282
		 -0.95036972 0.29702017 -0.092608824 -0.95328742 0.096820876 -0.28612733 -0.97362667
		 0.2217422 -0.05367988 -0.95328742 0.096820876 -0.28612733 -0.96933359 0.020001331
		 -0.24493331 -0.97362667 0.2217422 -0.05367988 -0.71985048 0.46630287 -0.51417601
		 -0.69677722 0.65538889 -0.29149094 -0.64400381 0.52878302 -0.55285406 -0.69677722
		 0.65538889 -0.29149094 -0.61965823 0.71474433 -0.32429045 -0.64400381 0.52878302
		 -0.55285406 -0.11890273 0.72156405 -0.68206114 -0.23498093 0.70340776 -0.67082155
		 -0.11578536 0.89565569 -0.42941198 -0.23498093 0.70340776 -0.67082155;
	setAttr ".n[2656:2821]" -type "float3"  -0.22692254 0.87896758 -0.41943067 -0.11578536
		 0.89565569 -0.42941198 1.5065052e-07 0.72771388 -0.68588078 3.6526138e-09 0.50518793
		 -0.86300939 -0.11890273 0.72156405 -0.68206114 3.6526138e-09 0.50518793 -0.86300939
		 -0.11524539 0.48986074 -0.86414987 -0.11890273 0.72156405 -0.68206114 -0.063669272
		 -0.20758377 -0.976143 -0.048498362 0.026742736 -0.99846518 0.34239918 -0.1664394
		 -0.92469496 -0.048498362 0.026742736 -0.99846518 0.33061299 0.038162164 -0.94299453
		 0.34239918 -0.1664394 -0.92469496 -0.94312739 0.17473699 -0.28280324 -0.98937279
		 -0.03184282 -0.14187141 -0.94806212 0.035624702 -0.31608409 -0.98937279 -0.03184282
		 -0.14187141 -0.98052412 -0.14094472 -0.13677351 -0.94806212 0.035624702 -0.31608409
		 0.84142148 -0.53691828 0.061062895 0.75190514 -0.64638537 -0.12970968 0.88484603
		 -0.46572709 0.012075986 0.75190514 -0.64638537 -0.12970968 0.78628993 -0.59350204
		 -0.17176591 0.88484603 -0.46572709 0.012075986 0.64400381 0.52878296 -0.55285406
		 0.71985048 0.46630284 -0.51417595 0.6131354 0.31114647 -0.72612178 0.71985048 0.46630284
		 -0.51417595 0.68394971 0.24827434 -0.685983 0.6131354 0.31114647 -0.72612178 0.84117317
		 -0.43054742 0.32719505 0.7985394 -0.5934661 0.10066183 0.88838315 -0.36353132 0.28039333
		 0.7985394 -0.5934661 0.10066183 0.84142148 -0.53691828 0.061062895 0.88838315 -0.36353132
		 0.28039333 0.99039871 0.13805851 -0.0070875781 0.99760145 0.060670424 0.033323545
		 0.9782964 -0.062963076 -0.19741277 0.99760145 0.060670424 0.033323545 0.97736865
		 -0.14100714 -0.15769419 0.9782964 -0.062963076 -0.19741277 0.89113146 0.25189599
		 -0.3774032 0.84246266 0.32896164 -0.42666247 0.87622833 0.44893658 -0.17515676 0.84246266
		 0.32896164 -0.42666247 0.82323712 0.52408975 -0.21819857 0.87622833 0.44893658 -0.17515676
		 0.23498091 0.7034077 -0.67082161 0.22692274 0.87896758 -0.41943064 0.34963697 0.67372322
		 -0.65103847 0.22692274 0.87896758 -0.41943064 0.33656952 0.85112232 -0.40287942 0.34963697
		 0.67372322 -0.65103847 0.50122505 -0.6025297 0.62107283 0.44400093 -0.49979264 0.74368709
		 0.41738749 -0.58084655 0.69885975 0.44400093 -0.49979264 0.74368709 0.3444958 -0.49623245
		 0.79691654 0.41738749 -0.58084655 0.69885975 -0.98052412 -0.14094472 -0.13677351
		 -0.98937279 -0.03184282 -0.14187141 -0.93191361 -0.35778713 0.059375178 -0.98937279
		 -0.03184282 -0.14187141 -0.92035902 -0.37694597 0.10416847 -0.93191361 -0.35778713
		 0.059375178 0.1046882 0.98155522 -0.15996787 0.10144903 0.99478662 -0.01037617 0.19862905
		 0.96809596 -0.15276375 0.10144903 0.99478662 -0.01037617 0.17865126 0.98390669 -0.0033727167
		 0.19862905 0.96809596 -0.15276375 0.81899005 0.54733753 0.17226993 0.85202986 0.48356512
		 0.20052405 0.88634223 0.45655921 0.077144049 0.85202986 0.48356512 0.20052405 0.91577828
		 0.38634938 0.1099285 0.88634223 0.45655921 0.077144049 -0.76262301 -0.33768654 0.55170095
		 -0.69413286 -0.40319315 0.59633458 -0.74743199 -0.24555066 0.61729276 -0.69413286
		 -0.40319315 0.59633458 -0.67820311 -0.32044935 0.66132653 -0.74743199 -0.24555066
		 0.61729276 -0.54572439 0.83303255 -0.090783723 -0.61820269 0.78266305 -0.072553277
		 -0.5354799 0.84271127 0.055669025 -0.61820269 0.78266305 -0.072553277 -0.6129024
		 0.7871567 0.068810761 -0.5354799 0.84271127 0.055669025 -0.5354799 0.84271127 0.055669025
		 -0.47210178 0.88009399 0.050541978 -0.54572439 0.83303255 -0.090783723 -0.87230206
		 -0.18841383 0.4512088 -0.84353751 -0.080506176 0.5310021 -0.91375619 -0.098637827
		 0.39410689 -0.84353751 -0.080506176 0.5310021 -0.87990433 0.0073255389 0.47509438
		 -0.91375619 -0.098637827 0.39410689 -0.52341425 0.72123277 -0.45371887 -0.6269623
		 0.68292677 -0.37487233 -0.61358994 0.68688977 -0.3894738 0.34018767 0.58482325 0.73637909
		 0.33917072 0.58358961 0.73782539 0.33524978 0.56155717 0.75647944 0.33917072 0.58358961
		 0.73782539 0.33355889 0.55968374 0.75861228 0.33524978 0.56155717 0.75647944 0.074956283
		 0.36567539 0.9277193 0.11235453 0.37527892 0.92007726 0.075775929 0.36613315 0.92747211
		 0.11235453 0.37527892 0.92007726 0.112881 0.37554491 0.91990429 0.075775929 0.36613315
		 0.92747211 -0.32743424 0.69310963 0.64217275 -0.33520916 0.66561925 0.66677272 -0.32710731
		 0.69093674 0.64467603 -0.33520916 0.66561925 0.66677272 -0.3344219 0.66352332 0.66925246
		 -0.32710731 0.69093674 0.64467603 -0.24902248 0.43473443 0.86544424 -0.2204455 0.4177703
		 0.88140333 -0.24575427 0.43451282 0.86648917 -0.2204455 0.4177703 0.88140333 -0.21762443
		 0.41820142 0.88189977 -0.24575427 0.43451282 0.86648917 -0.030203206 0.86249101 0.50517035
		 -0.029479798 0.86287451 0.50455773 6.5211564e-10 0.8681522 0.49629802 -0.029479798
		 0.86287451 0.50455773 -6.1800687e-10 0.87078965 0.4916558 6.5211564e-10 0.8681522
		 0.49629802 -0.72668976 -0.68118644 -0.088921554 -0.75190514 -0.64638531 -0.1297098
		 -0.70020288 -0.68892664 -0.18733934 -0.75190514 -0.64638531 -0.1297098 -0.70816225
		 -0.66876489 -0.22640628 -0.70020288 -0.68892664 -0.18733934 -0.79434162 0.11472113
		 -0.59654039 -0.7446934 -0.0094307875 -0.66734004 -0.83608109 0.043210968 -0.54690146
		 -0.7446934 -0.0094307875 -0.66734004 -0.7812382 -0.073283084 -0.6199165 -0.83608109
		 0.043210968 -0.54690146 0.70695823 -0.70701146 0.018570693 0.70841533 -0.70209807
		 -0.072152399 0.71078157 -0.70237446 -0.038205367 0.70841533 -0.70209807 -0.072152399
		 0.70679855 -0.69232178 -0.14534892 0.71078157 -0.70237446 -0.038205367 0.86290985
		 -0.02891545 -0.50453001 0.88492769 -0.10373009 -0.45402977 0.80402195 -0.14282677
		 -0.57719076 0.88492769 -0.10373009 -0.45402977 0.82191318 -0.21510127 -0.52743733
		 0.80402195 -0.14282677 -0.57719076 0.93051976 0.3595235 -0.069826864 0.92648262 0.36668301
		 -0.084697075 0.96307296 0.26830584 -0.022416137 0.92648262 0.36668301 -0.084697075
		 0.95390373 0.29560938 -0.051795207 0.96307296 0.26830584 -0.022416137 0.89666319
		 0.42552492 -0.12216229 0.92648262 0.36668301 -0.084697075;
	setAttr ".n[2822:2987]" -type "float3"  0.93051976 0.3595235 -0.069826864 -0.3531245
		 -0.7954151 0.49256262 -0.46244329 -0.75534153 0.46433327 -0.33985937 -0.79776627
		 0.49806082 -0.46244329 -0.75534153 0.46433327 -0.43342936 -0.76325685 0.47914296
		 -0.33985937 -0.79776627 0.49806082 -0.8392337 0.51459718 -0.17571713 -0.88672912
		 0.44609696 -0.1212803 -0.8397736 0.51384705 -0.17533244 -0.88672912 0.44609696 -0.1212803
		 -0.87074733 0.46904624 -0.14763044 -0.8397736 0.51384705 -0.17533244 0.57056201 -0.45061255
		 -0.68659109 0.56423944 -0.44840118 -0.69323176 0.55265272 -0.41289163 -0.72394443
		 0.56423944 -0.44840118 -0.69323176 0.55059057 -0.41213393 -0.7259447 0.55265272 -0.41289163
		 -0.72394443 0.23512594 -0.89620274 -0.37621328 0.23716046 -0.89561921 -0.37632591
		 0.29681978 -0.87354064 -0.38577819 0.23716046 -0.89561921 -0.37632591 0.29842237
		 -0.87544674 -0.38018033 0.29681978 -0.87354064 -0.38577819 -0.39671078 -0.82033885
		 -0.41190383 -0.43774304 -0.77958697 -0.44791204 -0.39743471 -0.81896949 -0.41392595
		 -0.43774304 -0.77958697 -0.44791204 -0.43977731 -0.77848542 -0.44783524 -0.39743471
		 -0.81896949 -0.41392595 -0.48216516 -0.33646566 -0.80889285 -0.48336339 -0.33645496
		 -0.80818182 -0.51137477 -0.3614687 -0.77963853 -0.48336339 -0.33645496 -0.80818182
		 -0.50905997 -0.35963398 -0.78199834 -0.51137477 -0.3614687 -0.77963853 0.95236969
		 -0.21862268 0.21259385 0.943694 -0.23213789 0.2356983 0.86391014 -0.36709058 0.34482422
		 0.943694 -0.23213789 0.2356983 0.8623786 -0.36824733 0.34741479 0.86391014 -0.36709058
		 0.34482422 -0.65694159 -0.42287427 0.62418348 -0.64138877 -0.4597483 0.6142084 -0.64686763
		 -0.43477044 0.62652767 -0.64138877 -0.4597483 0.6142084 -0.6111387 -0.50926143 0.60593915
		 -0.64686763 -0.43477044 0.62652767 -0.24525645 0.46928442 0.84830505 -0.50122029
		 0.3280544 0.80072373 -0.2972286 0.44836187 0.84298682 -0.50122029 0.3280544 0.80072373
		 -0.57241267 0.27098668 0.77389276 -0.2972286 0.44836187 0.84298682 0.67143077 -0.59053069
		 -0.44772115 0.60885972 -0.69424534 -0.38381401 0.66947699 -0.5999741 -0.43798584
		 0.60885972 -0.69424534 -0.38381401 0.61135775 -0.6978792 -0.37310365 0.66947699 -0.5999741
		 -0.43798584 -0.12696664 0.50559783 0.85337579 1.5856789e-09 0.51590192 0.85664767
		 -0.11350168 0.50804555 0.85381913 1.5856789e-09 0.51590192 0.85664767 0 0.51590192
		 0.85664767 -0.11350168 0.50804555 0.85381913 -0.37645355 -0.92337018 -0.075300708
		 -0.39270163 -0.91642118 -0.077185772 -0.49031594 -0.87075925 -0.036995079 -0.39270163
		 -0.91642118 -0.077185772 -0.51479602 -0.85696727 -0.024335688 -0.49031594 -0.87075925
		 -0.036995079 -0.70671803 -0.57864982 0.40707994 -0.72815764 -0.57819343 0.36807442
		 -0.391835 -0.72205901 0.57017201 -0.72815764 -0.57819343 0.36807442 -0.41665173 -0.74148256
		 0.52593243 -0.391835 -0.72205901 0.57017201 -0.035208944 -0.99446833 0.098959707
		 -0.035561107 -0.93088824 0.36356911 -0.44340107 -0.89237684 0.084017992 -0.035561107
		 -0.93088824 0.36356911 -0.42978662 -0.84429204 0.32008505 -0.44340107 -0.89237684
		 0.084017992 -0.42855948 -0.82762933 0.36244506 -0.41219616 -0.70674402 0.57498449
		 -0.1624411 -0.93307263 0.32091793 -0.41219616 -0.70674402 0.57498449 -0.123022 -0.72941476
		 0.67291874 -0.1624411 -0.93307263 0.32091793 0.33820435 -0.80303121 -0.49067163 0.72829878
		 -0.59829605 -0.3340998 0.37514684 -0.91056329 -0.17360695 0.72829878 -0.59829605
		 -0.3340998 0.72701013 -0.67494905 -0.12609559 0.37514684 -0.91056329 -0.17360695
		 0.67842782 -0.54016006 0.49795863 0.68573606 -0.55833334 0.46693674 0.86391014 -0.36709058
		 0.34482422 0.68573606 -0.55833334 0.46693674 0.86953312 -0.37816122 0.31765753 0.86391014
		 -0.36709058 0.34482422 0.84318101 -0.50984794 0.17058967 0.93836027 -0.33586019 0.081718937
		 0.85478699 -0.45962551 0.24100544 0.93836027 -0.33586019 0.081718937 0.94800043 -0.29165193
		 0.12741399 0.85478699 -0.45962551 0.24100544 0.57939976 0.75763476 -0.30047542 0.59358704
		 0.74638152 -0.30094695 0.61282641 0.73132116 -0.29935464 0.59358704 0.74638152 -0.30094695
		 0.62252432 0.71912515 -0.30874345 0.61282641 0.73132116 -0.29935464 0.52199394 -0.82231838
		 0.22652781 0.29188693 -0.91357374 0.28316966 0.48213807 -0.71444237 0.50706506 0.29188693
		 -0.91357374 0.28316966 0.29238617 -0.7137385 0.63646495 0.48213807 -0.71444237 0.50706506
		 0.98640817 -0.018608412 -0.16325642 0.98868454 -0.064504348 -0.13543282 0.97058749
		 -0.082424134 -0.2261994 0.98868454 -0.064504348 -0.13543282 0.9741255 -0.14827041
		 -0.17057365 0.97058749 -0.082424134 -0.2261994 0.39331985 -0.91465795 0.093275592
		 0.37298584 -0.86664462 0.3313739 -0.035208944 -0.99446833 0.098959707 0.37298584
		 -0.86664462 0.3313739 -0.035561107 -0.93088824 0.36356911 -0.035208944 -0.99446833
		 0.098959707 -0.82895839 0.37836966 -0.41190335 -0.95327145 0.1485182 -0.26308912
		 -0.81080323 0.41160041 -0.41615283 -0.95327145 0.1485182 -0.26308912 -0.94822347
		 0.17536439 -0.26480111 -0.81080323 0.41160041 -0.41615283 -0.014954747 0.49889234
		 -0.86653495 -0.42708302 0.45469457 -0.78157085 -0.010605128 0.66258413 -0.74891239
		 -0.42708302 0.45469457 -0.78157085 -0.40434167 0.60560542 -0.68538302 -0.010605128
		 0.66258413 -0.74891239 -0.092685223 0.99569547 -5.4998807e-05 -0.092627555 0.99570084
		 -1.7648745e-05 -0.09811414 0.99425793 -0.042717364 -0.092627555 0.99570084 -1.7648745e-05
		 -0.097048432 0.99433506 -0.043352004 -0.09811414 0.99425793 -0.042717364 -0.60513681
		 0.6211403 -0.4979901 -0.31906772 0.74305308 -0.58827537 -0.57174337 0.63146019 -0.52380115
		 -0.31906772 0.74305308 -0.58827537 -0.31374761 0.74101484 -0.59368294 -0.57174337
		 0.63146019 -0.52380115 -0.68197066 0.37910682 -0.62545508 -0.87014186 0.24288155
		 -0.42879102 -0.6723485 0.4826518 -0.56124395 -0.87014186 0.24288155 -0.42879102 -0.86179024
		 0.29454303 -0.41299146 -0.6723485 0.4826518 -0.56124395 -0.94312739 0.17473699 -0.28280324
		 -0.92835766 0.24807025 -0.27679095 -0.98937279 -0.03184282 -0.14187141;
	setAttr ".n[2988:3153]" -type "float3"  -0.92835766 0.24807025 -0.27679095 -0.99225181
		 -0.032287393 -0.11997435 -0.98937279 -0.03184282 -0.14187141 -0.79853934 -0.5934661
		 0.10066207 -0.84142154 -0.53691816 0.06106282 -0.72668976 -0.68118644 -0.088921554
		 -0.84142154 -0.53691816 0.06106282 -0.75190514 -0.64638531 -0.1297098 -0.72668976
		 -0.68118644 -0.088921554 -0.84246284 0.3289614 -0.4266623 -0.79434162 0.11472113
		 -0.59654039 -0.89113158 0.25189582 -0.37740296 -0.79434162 0.11472113 -0.59654039
		 -0.83608109 0.043210968 -0.54690146 -0.89113158 0.25189582 -0.37740296 -0.88838303
		 -0.36353129 0.28039363 -0.84117335 -0.4305473 0.32719478 -0.87230206 -0.18841383
		 0.4512088 -0.84117335 -0.4305473 0.32719478 -0.82580101 -0.25954992 0.50068605 -0.87230206
		 -0.18841383 0.4512088 -0.99760145 0.060670413 0.033323776 -0.95433259 0.23017307
		 0.190446 -0.99039871 0.13805851 -0.0070874756 -0.95433259 0.23017307 0.190446 -0.94045079
		 0.30391505 0.15227585 -0.99039871 0.13805851 -0.0070874756 -0.87622839 0.44893649
		 -0.17515661 -0.80272084 0.59628206 0.0093244677 -0.82323724 0.52408963 -0.21819825
		 -0.80272084 0.59628206 0.0093244677 -0.74619633 0.66526973 -0.024643268 -0.82323724
		 0.52408963 -0.21819825 -0.22692254 0.87896758 -0.41943067 -0.33656943 0.85112244
		 -0.40287921 -0.19862846 0.96809608 -0.15276378 -0.33656943 0.85112244 -0.40287921
		 -0.29520696 0.94529289 -0.13883157 -0.19862846 0.96809608 -0.15276378 -0.75190932
		 -0.64099795 0.15412341 -0.71521515 -0.66329634 0.22023894 -0.77749598 -0.49843588
		 0.38348624 -0.71521515 -0.66329634 0.22023894 -0.71351361 -0.54620427 0.43881565
		 -0.77749598 -0.49843588 0.38348624 0.92472762 0.1789021 -0.33596557 0.95328736 0.096820898
		 -0.28612736 0.86290985 -0.02891545 -0.50453001 0.95328736 0.096820898 -0.28612736
		 0.88492769 -0.10373009 -0.45402977 0.86290985 -0.02891545 -0.50453001 0.84117317
		 -0.43054742 0.32719505 0.8258009 -0.25954971 0.50068641 0.77749598 -0.498436 0.38348609
		 0.8258009 -0.25954971 0.50068641 0.76262319 -0.33768669 0.55170059 0.77749598 -0.498436
		 0.38348609 0.99611503 -0.026723308 0.083909132 0.99760145 0.060670424 0.033323545
		 0.95988941 0.14305152 0.24114016 0.99760145 0.060670424 0.033323545 0.95433265 0.23017305
		 0.19044563 0.95988941 0.14305152 0.24114016 0.82323712 0.52408975 -0.21819857 0.76876324
		 0.58771342 -0.25218257 0.74619621 0.66526979 -0.024643697 0.76876324 0.58771342 -0.25218257
		 0.69126981 0.72096562 -0.048524126 0.74619621 0.66526979 -0.024643697 0.33656952
		 0.85112232 -0.40287942 0.29520726 0.94529283 -0.13883141 0.4395465 0.8138395 -0.38008437
		 0.29520726 0.94529283 -0.13883141 0.38407055 0.91507345 -0.12300549 0.4395465 0.8138395
		 -0.38008437 0.68389821 -0.69566905 0.21983585 0.68029237 -0.63774472 0.36122558 0.79013193
		 -0.59283513 0.1556858 0.68029237 -0.63774472 0.36122558 0.81264901 -0.51394463 0.27470443
		 0.79013193 -0.59283513 0.1556858 0.3444958 -0.49623245 0.79691654 0.44400093 -0.49979264
		 0.74368709 0.32263929 -0.43072468 0.84284049 0.44400093 -0.49979264 0.74368709 0.39614168
		 -0.43828055 0.80683452 0.32263929 -0.43072468 0.84284049 0.88634223 0.45655921 0.077144049
		 0.84507138 0.53322715 0.03902752 0.81899005 0.54733753 0.17226993 0.84507138 0.53322715
		 0.03902752 0.77474153 0.61663949 0.13975419 0.81899005 0.54733753 0.17226993 -0.1014488
		 0.99478662 -0.010376175 0 0.9998076 -0.019616352 -0.10468805 0.98155522 -0.15996785
		 0 0.9998076 -0.019616352 -1.0348368e-09 0.98572814 -0.16834511 -0.10468805 0.98155522
		 -0.15996785 -0.54572439 0.83303255 -0.090783723 -0.47210178 0.88009399 0.050541978
		 -0.46586853 0.87810957 -0.10904182 -0.47210178 0.88009399 0.050541978 -0.40155089
		 0.91504091 0.038170327 -0.46586853 0.87810957 -0.10904182 -0.95585531 0.067680299
		 0.2859371 -0.9142158 0.17089504 0.36742944 -0.95988935 0.14305149 0.24114031 -0.9142158
		 0.17089504 0.36742944 -0.91455412 0.24283938 0.32344982 -0.95988935 0.14305149 0.24114031
		 -0.336622 0.78737897 -0.51644945 -0.21643713 0.84992361 -0.48040074 -0.2957164 0.80126756
		 -0.5201174 -0.21643713 0.84992361 -0.48040074 -0.1869643 0.88499308 -0.42641714 -0.2957164
		 0.80126756 -0.5201174 0.33520973 0.66561973 0.66677195 0.33442259 0.66352415 0.6692512
		 0.34061921 0.63711923 0.69141716 0.33442259 0.66352415 0.6692512 0.33979046 0.63587093
		 0.69297224 0.34061921 0.63711923 0.69141716 0.14204992 0.38666168 0.91121596 0.16913258
		 0.39655685 0.90229529 0.14234002 0.38636595 0.91129613 0.16913258 0.39655685 0.90229529
		 0.16850318 0.39656407 0.90240991 0.14234002 0.38636595 0.91129613 -0.2776064 0.76709038
		 0.57836586 -0.29548475 0.74379599 0.59954679 -0.27649781 0.76477224 0.58195561 -0.29548475
		 0.74379599 0.59954679 -0.29588619 0.74259478 0.60083634 -0.27649781 0.76477224 0.58195561
		 -0.27110609 0.4506627 0.850532 -0.24902248 0.43473443 0.86544424 -0.26879522 0.45038098
		 0.8514142 -0.24902248 0.43473443 0.86544424 -0.24575427 0.43451282 0.86648917 -0.26879522
		 0.45038098 0.8514142 -0.079947859 0.86113447 0.50205153 -0.077561542 0.86160022 0.50162667
		 -0.030203206 0.86249101 0.50517035 -0.077561542 0.86160022 0.50162667 -0.029479798
		 0.86287451 0.50455773 -0.030203206 0.86249101 0.50517035 -0.71342742 0.60620093 -0.35148507
		 -0.71066809 0.60826373 -0.35350537 -0.71019608 0.61450416 -0.34352025 -0.71066809
		 0.60826373 -0.35350537 -0.70365733 0.62070233 -0.34582508 -0.71019608 0.61450416
		 -0.34352025 -0.83608109 0.043210968 -0.54690146 -0.7812382 -0.073283084 -0.6199165
		 -0.86290973 -0.028915389 -0.50453019 -0.7812382 -0.073283084 -0.6199165 -0.80402255
		 -0.14282681 -0.57718992 -0.86290973 -0.028915389 -0.50453019 -0.71078163 -0.70237446
		 -0.038205586 -0.72668976 -0.68118644 -0.088921554 -0.70679861 -0.69232184 -0.1453487
		 -0.72668976 -0.68118644 -0.088921554 -0.70020288 -0.68892664 -0.18733934 -0.70679861
		 -0.69232184 -0.1453487 0.82353824 -0.29291677 -0.48578241;
	setAttr ".n[3154:3319]" -type "float3"  0.82191318 -0.21510127 -0.52743733 0.89223808
		 -0.18061014 -0.41387334 0.82191318 -0.21510127 -0.52743733 0.88492769 -0.10373009
		 -0.45402977 0.89223808 -0.18061014 -0.41387334 0.20785081 0.33230326 -0.91998512
		 0.11613957 0.34341073 -0.93197674 0.22208382 0.47460511 -0.85172105 0.11613957 0.34341073
		 -0.93197674 0.11524539 0.48986095 -0.86414969 0.22208382 0.47460511 -0.85172105 0.35312429
		 -0.79541498 0.49256295 0.33985928 -0.79776627 0.49806088 0.46244287 -0.75534159 0.46433359
		 0.33985928 -0.79776627 0.49806088 0.43342894 -0.76325703 0.47914305 0.46244287 -0.75534159
		 0.46433359 0.99369055 0.088796861 0.068514034 0.99171531 0.1246936 0.030858919 0.9932242
		 -0.0087956851 0.11588071 0.99171531 0.1246936 0.030858919 0.99667215 0.041085243
		 0.070403539 0.9932242 -0.0087956851 0.11588071 0.99171531 0.1246936 0.030858919 0.99369055
		 0.088796861 0.068514034 0.97633153 0.21588755 -0.01301176 0.99369055 0.088796861
		 0.068514034 0.98431438 0.17459179 0.025355186 0.97633153 0.21588755 -0.01301176 -0.73183274
		 -0.5647639 0.38139564 -0.65264249 -0.63557798 0.41242996 -0.73959738 -0.56028932
		 0.37292314 -0.65264249 -0.63557798 0.41242996 -0.65819585 -0.63280165 0.40784827
		 -0.73959738 -0.56028932 0.37292314 -0.9630729 0.2683059 -0.022416309 -0.98431444
		 0.17459159 0.025354717 -0.95390373 0.29560953 -0.051794756 -0.98431444 0.17459159
		 0.025354717 -0.97633159 0.21588723 -0.01301077 -0.95390373 0.29560953 -0.051794756
		 -0.95390373 0.29560953 -0.051794756 -0.92648244 0.36668327 -0.08469779 -0.9630729
		 0.2683059 -0.022416309 -0.92648244 0.36668327 -0.08469779 -0.93051976 0.35952348
		 -0.069826998 -0.9630729 0.2683059 -0.022416309 0.48216528 -0.33646578 -0.80889273
		 0.51137507 -0.36146855 -0.77963841 0.48336327 -0.33645484 -0.80818194 0.51137507
		 -0.36146855 -0.77963841 0.50906092 -0.3596341 -0.78199762 0.48336327 -0.33645484
		 -0.80818194 0.39671072 -0.82033861 -0.41190436 0.39743474 -0.81896943 -0.41392598
		 0.43774295 -0.77958691 -0.44791225 0.39743474 -0.81896943 -0.41392598 0.43977752
		 -0.77848542 -0.447835 0.43774295 -0.77958691 -0.44791225 -0.23512602 -0.89620292
		 -0.37621278 -0.29681993 -0.87354052 -0.38577825 -0.23716074 -0.89561933 -0.37632531
		 -0.29681993 -0.87354052 -0.38577825 -0.29842263 -0.87544656 -0.3801806 -0.23716074
		 -0.89561933 -0.37632531 -0.57056242 -0.45061237 -0.68659091 -0.55265284 -0.41289157
		 -0.72394437 -0.56423956 -0.44840088 -0.69323182 -0.55265284 -0.41289157 -0.72394437
		 -0.55059034 -0.41213372 -0.72594494 -0.56423956 -0.44840088 -0.69323182 -0.55841357
		 -0.57325959 0.59962296 -0.50870937 -0.58424139 0.63235807 -0.53850287 -0.59634423
		 0.5953052 -0.50870937 -0.58424139 0.63235807 -0.50449312 -0.61063224 0.61042196 -0.53850287
		 -0.59634423 0.5953052 0.5751313 -0.81610006 0.056609854 0.57511753 -0.81711262 0.039582022
		 0.52983224 -0.79857737 -0.28557315 0.57511753 -0.81711262 0.039582022 0.53029341
		 -0.79814941 -0.28591332 0.52983224 -0.79857737 -0.28557315 0.73321784 -0.44885704
		 -0.51080227 0.67143077 -0.59053069 -0.44772115 0.7168414 -0.49226522 -0.49377456
		 0.67143077 -0.59053069 -0.44772115 0.66947699 -0.5999741 -0.43798584 0.7168414 -0.49226522
		 -0.49377456 -0.79619294 -0.56303072 0.22152479 -0.77952623 -0.59475404 0.19648537
		 -0.68308413 -0.72472131 0.090415999 -0.77952623 -0.59475404 0.19648537 -0.64821291
		 -0.75886959 0.062745206 -0.68308413 -0.72472131 0.090415999 -0.0096910028 -0.76888633
		 0.63931209 -0.391835 -0.72205901 0.57017201 -0.022763075 -0.80480301 0.59310538 -0.391835
		 -0.72205901 0.57017201 -0.41665173 -0.74148256 0.52593243 -0.022763075 -0.80480301
		 0.59310538 -0.44340107 -0.89237684 0.084017992 -0.42978662 -0.84429204 0.32008505
		 -0.74379373 -0.66658401 0.04936171 -0.42978662 -0.84429204 0.32008505 -0.73281074
		 -0.64050424 0.22965774 -0.74379373 -0.66658401 0.04936171 -0.44819206 -0.89387316
		 -0.010710707 -0.42855948 -0.82762933 0.36244506 -0.21331783 -0.97568089 -0.050421182
		 -0.42855948 -0.82762933 0.36244506 -0.1624411 -0.93307263 0.32091793 -0.21331783
		 -0.97568089 -0.050421182 0.74127632 -0.46019942 -0.48859584 0.72829878 -0.59829605
		 -0.3340998 0.3364042 -0.62996179 -0.69998598 0.72829878 -0.59829605 -0.3340998 0.33820435
		 -0.80303121 -0.49067163 0.3364042 -0.62996179 -0.69998598 0.77927482 -0.60622829
		 -0.15880199 0.77202576 -0.6290518 -0.090939701 0.8810299 -0.46884376 -0.063022435
		 0.77202576 -0.6290518 -0.090939701 0.86711419 -0.49382347 -0.065202512 0.8810299
		 -0.46884376 -0.063022435 0.66674429 -0.70133001 0.25216717 0.84318101 -0.50984794
		 0.17058967 0.66991252 -0.64588416 0.36612967 0.84318101 -0.50984794 0.17058967 0.85478699
		 -0.45962551 0.24100544 0.66991252 -0.64588416 0.36612967 0.54202789 -0.83049709 -0.12837587
		 0.27770972 -0.95375407 -0.11502393 0.52199394 -0.82231838 0.22652781 0.27770972 -0.95375407
		 -0.11502393 0.29188693 -0.91357374 0.28316966 0.52199394 -0.82231838 0.22652781 0.98640817
		 -0.018608412 -0.16325642 0.99174976 0.018404676 -0.12686089 0.98868454 -0.064504348
		 -0.13543282 0.99174976 0.018404676 -0.12686089 0.99455869 -0.019491998 -0.10233814
		 0.98868454 -0.064504348 -0.13543282 -0.01057572 0.73238289 -0.68081093 -0.0051630624
		 0.76245844 -0.64701664 0.38275144 0.67897731 -0.62649113 -0.0051630624 0.76245844
		 -0.64701664 0.37362751 0.7054376 -0.60229582 0.38275144 0.67897731 -0.62649113 0.30444002
		 -0.58477902 0.75189739 0.29238617 -0.7137385 0.63646495 0.043621261 -0.61468589 0.78756487
		 0.29238617 -0.7137385 0.63646495 0.044924513 -0.73209339 0.67972136 0.043621261 -0.61468589
		 0.78756487 -0.95327145 0.1485182 -0.26308912 -0.99213576 -0.088875271 -0.088135086
		 -0.94822347 0.17536439 -0.26480111 -0.99213576 -0.088875271 -0.088135086 -0.99366605
		 -0.076975398 -0.081869029 -0.94822347 0.17536439 -0.26480111 0.74127632 -0.46019942
		 -0.48859584 0.92047763 -0.2551837 -0.29597667 0.72829878 -0.59829605 -0.3340998 0.92047763
		 -0.2551837 -0.29597667 0.91407585 -0.35735875 -0.19172904;
	setAttr ".n[3320:3485]" -type "float3"  0.72829878 -0.59829605 -0.3340998 -0.69916707
		 -0.65848303 0.27850592 -0.42855948 -0.82762933 0.36244506 -0.66046876 -0.74906677
		 0.051768582 -0.42855948 -0.82762933 0.36244506 -0.44819206 -0.89387316 -0.010710707
		 -0.66046876 -0.74906677 0.051768582 -0.02864201 0.30136704 -0.95307791 -0.45709223
		 0.27158695 -0.84693992 -0.014954747 0.49889234 -0.86653495 -0.45709223 0.27158695
		 -0.84693992 -0.42708302 0.45469457 -0.78157085 -0.014954747 0.49889234 -0.86653495
		 -0.7812252 -0.51439792 0.35366929 -0.81184357 -0.49291548 0.31296062 -0.605304 -0.58354694
		 0.5413686 -0.81184357 -0.49291548 0.31296062 -0.66899717 -0.58427984 0.45941254 -0.605304
		 -0.58354694 0.5413686 -0.53478605 -0.18802212 -0.82380313 -0.53863394 -0.39507368
		 -0.74417084 -0.80168015 -0.1433944 -0.58029908 -0.53863394 -0.39507368 -0.74417084
		 -0.81836426 -0.27305993 -0.50568587 -0.80168015 -0.1433944 -0.58029908 0.41306844
		 0.83266687 -0.36883649 0.4969826 0.79852229 -0.33966228 0.42743999 0.82819861 -0.36246678
		 -0.09811414 0.99425793 -0.042717364 -0.097048432 0.99433506 -0.043352004 -0.10047233
		 0.99080729 -0.090588324 -0.097048432 0.99433506 -0.043352004 -0.10102354 0.99077535
		 -0.090324454 -0.10047233 0.99080729 -0.090588324 -0.99385732 -0.044407714 -0.10136847
		 -0.99455112 -0.061164558 -0.084421247 -0.93838298 -0.32069081 0.12882055 -0.99455112
		 -0.061164558 -0.084421247 -0.94532084 -0.30246815 0.12198975 -0.93838298 -0.32069081
		 0.12882055 0.33500862 0.3051841 -0.89142126 0.38540682 0.48070183 -0.78764671 0.65161461
		 0.27763927 -0.70591414 0.38540682 0.48070183 -0.78764671 0.68152291 0.39510205 -0.61597145
		 0.65161461 0.27763927 -0.70591414 -0.75190932 -0.64099795 0.15412341 -0.79853934
		 -0.5934661 0.10066207 -0.71078163 -0.70237446 -0.038205586 -0.79853934 -0.5934661
		 0.10066207 -0.72668976 -0.68118644 -0.088921554 -0.71078163 -0.70237446 -0.038205586
		 -0.79075313 0.39577124 -0.46698463 -0.74836844 0.18324494 -0.63746846 -0.84246284
		 0.3289614 -0.4266623 -0.74836844 0.18324494 -0.63746846 -0.79434162 0.11472113 -0.59654039
		 -0.84246284 0.3289614 -0.4266623 -0.77749598 -0.49843588 0.38348624 -0.84117335 -0.4305473
		 0.32719478 -0.75190932 -0.64099795 0.15412341 -0.84117335 -0.4305473 0.32719478 -0.79853934
		 -0.5934661 0.10066207 -0.75190932 -0.64099795 0.15412341 -0.99760145 0.060670413
		 0.033323776 -0.97736859 -0.14100708 -0.15769473 -0.99611503 -0.026723288 0.08390899
		 -0.97736859 -0.14100708 -0.15769473 -0.96778452 -0.22675686 -0.10942759 -0.99611503
		 -0.026723288 0.08390899 -0.84246284 0.3289614 -0.4266623 -0.82323724 0.52408963 -0.21819825
		 -0.79075313 0.39577124 -0.46698463 -0.82323724 0.52408963 -0.21819825 -0.76876318
		 0.58771336 -0.25218275 -0.79075313 0.39577124 -0.46698463 -0.34963721 0.67372322
		 -0.65103829 -0.45675501 0.63459867 -0.62342548 -0.33656943 0.85112244 -0.40287921
		 -0.45675501 0.63459867 -0.62342548 -0.43954647 0.81383955 -0.38008425 -0.33656943
		 0.85112244 -0.40287921 -0.77749598 -0.49843588 0.38348624 -0.71351361 -0.54620427
		 0.43881565 -0.76262301 -0.33768654 0.55170095 -0.71351361 -0.54620427 0.43881565
		 -0.69413286 -0.40319315 0.59633458 -0.76262301 -0.33768654 0.55170095 -0.85919809
		 -0.48444107 0.16460696 -0.95242596 -0.30469197 -0.0068982346 -0.85921848 -0.50882035
		 0.053342801 -0.95242596 -0.30469197 -0.0068982346 -0.88996571 -0.44654852 -0.092495658
		 -0.85921848 -0.50882035 0.053342801 0.89113146 0.25189599 -0.3774032 0.92472762 0.1789021
		 -0.33596557 0.83608097 0.043210939 -0.54690164 0.92472762 0.1789021 -0.33596557 0.86290985
		 -0.02891545 -0.50453001 0.83608097 0.043210939 -0.54690164 0.99611503 -0.026723308
		 0.083909132 0.98604625 -0.10706042 0.12747897 0.96778458 -0.22675689 -0.10942706
		 0.98604625 -0.10706042 0.12747897 0.94941574 -0.30610654 -0.070060946 0.96778458
		 -0.22675689 -0.10942706 0.91529262 0.37830672 -0.13828768 0.95036978 0.29702014 -0.092608355
		 0.92472762 0.1789021 -0.33596557 0.95036978 0.29702014 -0.092608355 0.95328736 0.096820898
		 -0.28612736 0.92472762 0.1789021 -0.33596557 0.55454308 0.58676451 -0.59007573 0.53344887
		 0.768664 -0.35297024 0.64400381 0.52878296 -0.55285406 0.53344887 0.768664 -0.35297024
		 0.61965829 0.71474427 -0.32429034 0.64400381 0.52878296 -0.55285406 0.71377647 -0.54512227
		 0.43973276 0.69413269 -0.40319318 0.5963347 0.64296454 -0.5810802 0.49894121 0.69413269
		 -0.40319318 0.5963347 0.61370909 -0.45667976 0.64405334 0.64296454 -0.5810802 0.49894121
		 -0.54972237 -0.78133655 -0.295497 -0.75529945 -0.63782752 -0.15066114 -0.49723831
		 -0.84923148 -0.17765106 -0.75529945 -0.63782752 -0.15066114 -0.71623492 -0.69401139
		 -0.073182829 -0.49723831 -0.84923148 -0.17765106 0.24072877 -0.49322212 0.8359316
		 0.3444958 -0.49623245 0.79691654 0.218674 -0.43946049 0.87123829 0.3444958 -0.49623245
		 0.79691654 0.32263929 -0.43072468 0.84284049 0.218674 -0.43946049 0.87123829 0.74619621
		 0.66526979 -0.024643697 0.69126981 0.72096562 -0.048524126 0.67144448 0.73605633
		 0.085926555 0.69126981 0.72096562 -0.048524126 0.61290234 0.78715676 0.06881085 0.67144448
		 0.73605633 0.085926555 0.8258009 -0.25954971 0.50068641 0.80175674 -0.15959474 0.57594758
		 0.76262319 -0.33768669 0.55170059 0.80175674 -0.15959474 0.57594758 0.74743193 -0.2455506
		 0.61729276 0.76262319 -0.33768669 0.55170059 -0.29520696 0.94529289 -0.13883157 -0.38407043
		 0.91507351 -0.12300577 -0.26381335 0.96451396 0.010739088 -0.38407043 0.91507351
		 -0.12300577 -0.33875218 0.94062066 0.021902727 -0.26381335 0.96451396 0.010739088
		 -0.95988935 0.14305149 0.24114031 -0.91455412 0.24283938 0.32344982 -0.95433259 0.23017307
		 0.190446 -0.91455412 0.24283938 0.32344982 -0.90259784 0.33155322 0.2745716 -0.95433259
		 0.23017307 0.190446 -0.82580101 -0.25954992 0.50068605 -0.76262301 -0.33768654 0.55170095
		 -0.80175674 -0.15959506 0.57594752 -0.76262301 -0.33768654 0.55170095 -0.74743199
		 -0.24555066 0.61729276 -0.80175674 -0.15959506 0.57594752;
	setAttr ".n[3486:3651]" -type "float3"  0.32743379 0.69310868 0.64217401 0.32710695
		 0.69093621 0.6446768 0.33520973 0.66561973 0.66677195 0.32710695 0.69093621 0.6446768
		 0.33442259 0.66352415 0.6692512 0.33520973 0.66561973 0.66677195 0.24902312 0.43473467
		 0.86544394 0.24575466 0.43451297 0.86648899 0.22044605 0.41777027 0.88140315 0.24575466
		 0.43451297 0.86648899 0.21762472 0.41820118 0.88189977 0.22044605 0.41777027 0.88140315
		 -6.1800687e-10 0.87078965 0.4916558 0.029479792 0.86287451 0.50455773 6.5211564e-10
		 0.8681522 0.49629802 0.029479792 0.86287451 0.50455773 0.030203188 0.86249089 0.50517046
		 6.5211564e-10 0.8681522 0.49629802 -0.31555271 0.51544052 0.79671043 -0.30428547
		 0.49247494 0.81540102 -0.31416574 0.51417923 0.7980724 -0.30428547 0.49247494 0.81540102
		 -0.30355439 0.4916546 0.81616819 -0.31416574 0.51417923 0.7980724 -0.11502025 0.86024946
		 0.49673048 -0.1509596 0.8582601 0.49051076 -0.11467726 0.86273003 0.49248967 -0.1509596
		 0.8582601 0.49051076 -0.15370195 0.85866535 0.48894733 -0.11467726 0.86273003 0.49248967
		 0.71310717 0.60654432 -0.35154256 0.71192688 0.61515325 -0.33874276 0.71044743 0.60859865
		 -0.35337245 0.71192688 0.61515325 -0.33874276 0.7034108 0.62330443 -0.3416208 0.71044743
		 0.60859865 -0.35337245 -0.89223802 -0.18060999 -0.41387355 -0.8235386 -0.29291645
		 -0.48578197 -0.8923229 -0.25754091 -0.37071893 -0.8235386 -0.29291645 -0.48578197
		 -0.81875205 -0.36172491 -0.44587016 -0.8923229 -0.25754091 -0.37071893 3.6526138e-09
		 0.50518793 -0.86300939 1.4083836e-09 0.36224294 -0.93208373 -0.11524539 0.48986074
		 -0.86414987 1.4083836e-09 0.36224294 -0.93208373 -0.11613956 0.34341037 -0.93197691
		 -0.11524539 0.48986074 -0.86414987 0.89232278 -0.25754094 -0.37071919 0.88227212
		 -0.33192644 -0.33379745 0.81875181 -0.36172512 -0.44587043 0.88227212 -0.33192644
		 -0.33379745 0.80618274 -0.42576846 -0.41084126 0.81875181 -0.36172512 -0.44587043
		 0.30740851 0.30223018 -0.90230644 0.20785081 0.33230326 -0.91998512 0.33128217 0.44750169
		 -0.83065897 0.20785081 0.33230326 -0.91998512 0.22208382 0.47460511 -0.85172105 0.33128217
		 0.44750169 -0.83065897 0.23851517 -0.82499856 0.51233572 0.2305261 -0.82578707 0.51471686
		 0.35312429 -0.79541498 0.49256295 0.2305261 -0.82578707 0.51471686 0.33985928 -0.79776627
		 0.49806088 0.35312429 -0.79541498 0.49256295 -0.65264249 -0.63557798 0.41242996 -0.5853762
		 -0.68597502 0.43217239 -0.65819585 -0.63280165 0.40784827 -0.5853762 -0.68597502
		 0.43217239 -0.5602262 -0.70292634 0.438225 -0.65819585 -0.63280165 0.40784827 -0.98431444
		 0.17459159 0.025354717 -0.99369061 0.088797055 0.068512991 -0.97633159 0.21588723
		 -0.01301077 -0.99369061 0.088797055 0.068512991 -0.99171531 0.12469342 0.030859886
		 -0.97633159 0.21588723 -0.01301077 0.46464884 -0.31858966 -0.82619739 0.48216528
		 -0.33646578 -0.80889273 0.46644002 -0.31340149 -0.8271718 0.48216528 -0.33646578
		 -0.80889273 0.48336327 -0.33645484 -0.80818194 0.46644002 -0.31340149 -0.8271718
		 0.43774295 -0.77958691 -0.44791225 0.43977752 -0.77848542 -0.447835 0.4752849 -0.74442452
		 -0.46897376 0.43977752 -0.77848542 -0.447835 0.47748464 -0.74552083 -0.46498072 0.4752849
		 -0.74442452 -0.46897376 -0.17668915 -0.92028058 -0.34909105 -0.23512602 -0.89620292
		 -0.37621278 -0.17829098 -0.91847205 -0.35301757 -0.23512602 -0.89620292 -0.37621278
		 -0.23716074 -0.89561933 -0.37632531 -0.17829098 -0.91847205 -0.35301757 -0.59781921
		 -0.4886483 -0.63548017 -0.57056242 -0.45061237 -0.68659091 -0.59050184 -0.48748872
		 -0.64316589 -0.57056242 -0.45061237 -0.68659091 -0.56423956 -0.44840088 -0.69323182
		 -0.59050184 -0.48748872 -0.64316589 0.31457791 -0.61584848 0.72233742 0.30158725
		 -0.61487603 0.72867864 0.00034282292 -0.68230063 0.73107165 0.30158725 -0.61487603
		 0.72867864 -0.00031369008 -0.68952036 0.72426623 0.00034282292 -0.68230063 0.73107165
		 0.57511753 -0.81711262 0.039582022 0.5751313 -0.81610006 0.056609854 0.59836185 -0.7026462
		 0.38503423 0.5751313 -0.81610006 0.056609854 0.59490943 -0.69914359 0.39658672 0.59836185
		 -0.7026462 0.38503423 0.84827763 -0.13669483 -0.51160491 0.73321784 -0.44885704 -0.51080227
		 0.83275515 -0.20973356 -0.5123775 0.73321784 -0.44885704 -0.51080227 0.7168414 -0.49226522
		 -0.49377456 0.83275515 -0.20973356 -0.5123775 0.21057875 -0.97165477 -0.10744102
		 0.37645343 -0.92337024 -0.075300537 0.21894304 -0.96970546 -0.1083296 0.37645343
		 -0.92337024 -0.075300537 0.3927016 -0.91642118 -0.077185832 0.21894304 -0.96970546
		 -0.1083296 -0.72815764 -0.57819343 0.36807442 -0.73861933 -0.59579629 0.31538579
		 -0.41665173 -0.74148256 0.52593243 -0.73861933 -0.59579629 0.31538579 -0.4253405
		 -0.78144211 0.45654538 -0.41665173 -0.74148256 0.52593243 -0.44340107 -0.89237684
		 0.084017992 -0.43165109 -0.88671279 -0.16558304 -0.035208944 -0.99446833 0.098959707
		 -0.43165109 -0.88671279 -0.16558304 -0.053536456 -0.97797751 -0.20172703 -0.035208944
		 -0.99446833 0.098959707 0.33709374 -0.62744665 0.70191061 0.38070709 -0.67710155
		 0.62975836 0.61167496 -0.55709314 0.5616948 0.38070709 -0.67710155 0.62975836 0.67842782
		 -0.54016006 0.49795863 0.61167496 -0.55709314 0.5616948 0.85077262 -0.52461046 0.031141339
		 0.92805707 -0.37237456 0.0068738195 0.84318101 -0.50984794 0.17058967 0.92805707
		 -0.37237456 0.0068738195 0.93836027 -0.33586019 0.081718937 0.84318101 -0.50984794
		 0.17058967 -0.061020445 0.99757224 0.033558425 -0.06166118 0.99751633 0.034045137
		 -0.092685223 0.99569547 -5.4998807e-05 -0.06166118 0.99751633 0.034045137 -0.092627555
		 0.99570084 -1.7648745e-05 -0.092685223 0.99569547 -5.4998807e-05 0.72316688 -0.60477269
		 0.3335861 0.87653941 -0.46207604 0.1347755 0.73730987 -0.66395348 0.12465921 0.87653941
		 -0.46207604 0.1347755 0.86099923 -0.50851738 0.0095073199 0.73730987 -0.66395348
		 0.12465921 0.99259633 0.05307449 -0.10925005 0.99300951 0.064716294 -0.098710999
		 0.99726993 0.0090507055 -0.073285475 0.99300951 0.064716294 -0.098710999;
	setAttr ".n[3652:3817]" -type "float3"  0.99845052 0.017415494 -0.05285177 0.99726993
		 0.0090507055 -0.073285475 0.85478699 -0.45962551 0.24100544 0.94800043 -0.29165193
		 0.12741399 0.86690909 -0.40894362 0.28501546 0.94800043 -0.29165193 0.12741399 0.95247233
		 -0.25448704 0.16742986 0.86690909 -0.40894362 0.28501546 -0.048498362 0.026742736
		 -0.99846518 -0.52018863 0.015460366 -0.85391146 -0.02864201 0.30136704 -0.95307791
		 -0.52018863 0.015460366 -0.85391146 -0.45709223 0.27158695 -0.84693992 -0.02864201
		 0.30136704 -0.95307791 -0.80045074 0.44189459 -0.40497869 -0.57174337 0.63146019
		 -0.52380115 -0.81080323 0.41160041 -0.41615283 -0.57174337 0.63146019 -0.52380115
		 -0.58405626 0.61048996 -0.53495818 -0.81080323 0.41160041 -0.41615283 -0.010605128
		 0.66258413 -0.74891239 -0.40434167 0.60560542 -0.68538302 -0.01057572 0.73238289
		 -0.68081093 -0.40434167 0.60560542 -0.68538302 -0.38063785 0.67287791 -0.63431078
		 -0.01057572 0.73238289 -0.68081093 0.31457058 0.87103868 -0.37727579 0.33319247 0.86045909
		 -0.38547754 0.42743999 0.82819861 -0.36246678 0.33319247 0.86045909 -0.38547754 0.41306844
		 0.83266687 -0.36883649 0.42743999 0.82819861 -0.36246678 -0.049208559 0.99728262
		 0.05482614 -0.06166118 0.99751633 0.034045137 -0.04919932 0.99727869 0.054906093
		 -0.06166118 0.99751633 0.034045137 -0.061020445 0.99757224 0.033558425 -0.04919932
		 0.99727869 0.054906093 0.38540682 0.48070183 -0.78764671 0.38260716 0.61384785 -0.69050896
		 0.68152291 0.39510205 -0.61597145 0.38260716 0.61384785 -0.69050896 0.67833167 0.49581343
		 -0.5422501 0.68152291 0.39510205 -0.61597145 -0.42708302 0.45469457 -0.78157085 -0.68197066
		 0.37910682 -0.62545508 -0.40434167 0.60560542 -0.68538302 -0.68197066 0.37910682
		 -0.62545508 -0.6723485 0.4826518 -0.56124395 -0.40434167 0.60560542 -0.68538302 -0.84142154
		 -0.53691816 0.06106282 -0.88484609 -0.46572685 0.012076274 -0.75190514 -0.64638531
		 -0.1297098 -0.88484609 -0.46572685 0.012076274 -0.78628999 -0.59350193 -0.171766
		 -0.75190514 -0.64638531 -0.1297098 -0.64400381 0.52878302 -0.55285406 -0.61313552
		 0.31114647 -0.72612166 -0.71985048 0.46630287 -0.51417601 -0.61313552 0.31114647
		 -0.72612166 -0.68394983 0.24827453 -0.68598282 -0.71985048 0.46630287 -0.51417601
		 -0.84117335 -0.4305473 0.32719478 -0.88838303 -0.36353129 0.28039363 -0.79853934
		 -0.5934661 0.10066207 -0.88838303 -0.36353129 0.28039363 -0.84142154 -0.53691816
		 0.06106282 -0.79853934 -0.5934661 0.10066207 -0.99039871 0.13805851 -0.0070874756
		 -0.9782964 -0.062963068 -0.19741279 -0.99760145 0.060670413 0.033323776 -0.9782964
		 -0.062963068 -0.19741279 -0.97736859 -0.14100708 -0.15769473 -0.99760145 0.060670413
		 0.033323776 -0.89113158 0.25189582 -0.37740296 -0.87622839 0.44893649 -0.17515661
		 -0.84246284 0.3289614 -0.4266623 -0.87622839 0.44893649 -0.17515661 -0.82323724 0.52408963
		 -0.21819825 -0.84246284 0.3289614 -0.4266623 -0.23498093 0.70340776 -0.67082155 -0.34963721
		 0.67372322 -0.65103829 -0.22692254 0.87896758 -0.41943067 -0.34963721 0.67372322
		 -0.65103829 -0.33656943 0.85112244 -0.40287921 -0.22692254 0.87896758 -0.41943067
		 -0.50122488 -0.60252964 0.62107295 -0.4174799 -0.58068693 0.69893724 -0.44400099
		 -0.49979246 0.74368715 -0.4174799 -0.58068693 0.69893724 -0.3444958 -0.49623245 0.79691654
		 -0.44400099 -0.49979246 0.74368715 0.75190932 -0.64099783 0.1541238 0.71078157 -0.70237446
		 -0.038205367 0.7985394 -0.5934661 0.10066183 0.71078157 -0.70237446 -0.038205367
		 0.72668993 -0.68118626 -0.088921688 0.7985394 -0.5934661 0.10066183 0.7907533 0.39577127
		 -0.46698427 0.84246266 0.32896164 -0.42666247 0.74836832 0.18324523 -0.63746846 0.84246266
		 0.32896164 -0.42666247 0.79434162 0.11472136 -0.59654039 0.74836832 0.18324523 -0.63746846
		 0.77749598 -0.498436 0.38348609 0.75190932 -0.64099783 0.1541238 0.84117317 -0.43054742
		 0.32719505 0.75190932 -0.64099783 0.1541238 0.7985394 -0.5934661 0.10066183 0.84117317
		 -0.43054742 0.32719505 0.99760145 0.060670424 0.033323545 0.99611503 -0.026723308
		 0.083909132 0.97736865 -0.14100714 -0.15769419 0.99611503 -0.026723308 0.083909132
		 0.96778458 -0.22675689 -0.10942706 0.97736865 -0.14100714 -0.15769419 0.84246266
		 0.32896164 -0.42666247 0.7907533 0.39577127 -0.46698427 0.82323712 0.52408975 -0.21819857
		 0.7907533 0.39577127 -0.46698427 0.76876324 0.58771342 -0.25218257 0.82323712 0.52408975
		 -0.21819857 0.34963697 0.67372322 -0.65103847 0.33656952 0.85112232 -0.40287942 0.4567548
		 0.63459885 -0.62342554 0.33656952 0.85112232 -0.40287942 0.4395465 0.8138395 -0.38008437
		 0.4567548 0.63459885 -0.62342554 0.69413269 -0.40319318 0.5963347 0.71377647 -0.54512227
		 0.43973276 0.76262319 -0.33768669 0.55170059 0.71377647 -0.54512227 0.43973276 0.77749598
		 -0.498436 0.38348609 0.76262319 -0.33768669 0.55170059 -0.93838298 -0.32069081 0.12882055
		 -0.93083125 -0.34618571 0.11708372 -0.99385732 -0.044407714 -0.10136847 -0.93083125
		 -0.34618571 0.11708372 -0.99225181 -0.032287393 -0.11997435 -0.99385732 -0.044407714
		 -0.10136847 0.61370909 -0.45667976 0.64405334 0.5889678 -0.38176891 0.71229869 0.52595329
		 -0.4911319 0.69437927 0.5889678 -0.38176891 0.71229869 0.49116701 -0.41527027 0.76570594
		 0.52595329 -0.4911319 0.69437927 0.73119545 0.67256457 0.11406217 0.77474153 0.61663949
		 0.13975419 0.80272067 0.59628236 0.0093241446 0.77474153 0.61663949 0.13975419 0.84507138
		 0.53322715 0.03902752 0.80272067 0.59628236 0.0093241446 -0.12955745 -0.47123605
		 0.87243992 -0.11445728 -0.44038436 0.89048368 -0.24072877 -0.49322236 0.83593142
		 -0.11445728 -0.44038436 0.89048368 -0.21867406 -0.43946084 0.87123811 -0.24072877
		 -0.49322236 0.83593142 -0.38407043 0.91507351 -0.12300577 -0.46586853 0.87810957
		 -0.10904182 -0.33875218 0.94062066 0.021902727 -0.46586853 0.87810957 -0.10904182
		 -0.40155089 0.91504091 0.038170327 -0.33875218 0.94062066 0.021902727 -0.93962836
		 -0.020910287 0.34155723 -0.90266615 0.080931105 0.42266291;
	setAttr ".n[3818:3983]" -type "float3"  -0.95585531 0.067680299 0.2859371 -0.90266615
		 0.080931105 0.42266291 -0.9142158 0.17089504 0.36742944 -0.95585531 0.067680299 0.2859371
		 -0.2957164 0.80126756 -0.5201174 -0.42177019 0.75874835 -0.49639788 -0.336622 0.78737897
		 -0.51644945 -0.42177019 0.75874835 -0.49639788 -0.45606256 0.74945855 -0.47991541
		 -0.336622 0.78737897 -0.51644945 0.34061921 0.63711923 0.69141716 0.33979046 0.63587093
		 0.69297224 0.3411406 0.61318523 0.71247947 0.33979046 0.63587093 0.69297224 0.34032527
		 0.61168218 0.71415937 0.3411406 0.61318523 0.71247947 0.1954039 0.40759307 0.89201188
		 0.19352563 0.40794137 0.8922621 0.16913258 0.39655685 0.90229529 0.19352563 0.40794137
		 0.8922621 0.16850318 0.39656407 0.90240991 0.16913258 0.39655685 0.90229529 -0.29548475
		 0.74379599 0.59954679 -0.31197703 0.72111118 0.61860251 -0.29588619 0.74259478 0.60083634
		 -0.31197703 0.72111118 0.61860251 -0.31270665 0.71885163 0.6208598 -0.29588619 0.74259478
		 0.60083634 -0.29118222 0.47289532 0.83161467 -0.27110609 0.4506627 0.850532 -0.28941929
		 0.47179914 0.83285177 -0.27110609 0.4506627 0.850532 -0.26879522 0.45038098 0.8514142
		 -0.28941929 0.47179914 0.83285177 -0.19400939 0.84487212 0.49854937 -0.23147784 0.82549328
		 0.51476103 -0.19711208 0.84324664 0.50008196 -0.23147784 0.82549328 0.51476103 -0.23185752
		 0.8235057 0.51776487 -0.19711208 0.84324664 0.50008196 -0.86290973 -0.028915389 -0.50453019
		 -0.80402255 -0.14282681 -0.57718992 -0.88492739 -0.10372999 -0.45403042 -0.80402255
		 -0.14282681 -0.57718992 -0.82191366 -0.21510129 -0.52743661 -0.88492739 -0.10372999
		 -0.45403042 -0.28122997 0.95654869 -0.076969527 -0.27601728 0.95801836 -0.077558026
		 -0.22170463 0.97056782 -0.094048455 -0.27601728 0.95801836 -0.077558026 -0.22109844
		 0.97065252 -0.094599843 -0.22170463 0.97056782 -0.094048455 0.89223808 -0.18061014
		 -0.41387334 0.89232278 -0.25754094 -0.37071919 0.82353824 -0.29291677 -0.48578241
		 0.89232278 -0.25754094 -0.37071919 0.81875181 -0.36172512 -0.44587043 0.82353824
		 -0.29291677 -0.48578241 0.11613957 0.34341073 -0.93197674 1.4083836e-09 0.36224294
		 -0.93208373 0.11524539 0.48986095 -0.86414969 1.4083836e-09 0.36224294 -0.93208373
		 3.6526138e-09 0.50518793 -0.86300939 0.11524539 0.48986095 -0.86414969 0.50827122
		 -0.72902346 0.45845962 0.58537602 -0.68597525 0.43217221 0.56022608 -0.7029261 0.43822554
		 0.97633153 0.21588755 -0.01301176 0.98431438 0.17459179 0.025355186 0.95390373 0.29560938
		 -0.051795207 0.98431438 0.17459179 0.025355186 0.96307296 0.26830584 -0.022416137
		 0.95390373 0.29560938 -0.051795207 -0.46244329 -0.75534153 0.46433327 -0.5602262
		 -0.70292634 0.438225 -0.43342936 -0.76325685 0.47914296 -0.5602262 -0.70292634 0.438225
		 -0.50827134 -0.7290231 0.45845997 -0.43342936 -0.76325685 0.47914296 -0.89666325
		 0.42552501 -0.12216194 -0.93051976 0.35952348 -0.069826998 -0.92648244 0.36668327
		 -0.08469779 0.5379439 -0.38301003 -0.75094587 0.53397948 -0.38281325 -0.75387001
		 0.51137507 -0.36146855 -0.77963841 0.53397948 -0.38281325 -0.75387001 0.50906092
		 -0.3596341 -0.78199762 0.51137507 -0.36146855 -0.77963841 0.35376933 -0.84988517
		 -0.39056686 0.35585928 -0.850133 -0.38812113 0.39671072 -0.82033861 -0.41190436 0.35585928
		 -0.850133 -0.38812113 0.39743474 -0.81896943 -0.41392598 0.39671072 -0.82033861 -0.41190436
		 -0.29681993 -0.87354052 -0.38577825 -0.3537696 -0.84988523 -0.39056647 -0.29842263
		 -0.87544656 -0.3801806 -0.3537696 -0.84988523 -0.39056647 -0.35585943 -0.85013306
		 -0.38812092 -0.29842263 -0.87544656 -0.3801806 -0.55265284 -0.41289157 -0.72394437
		 -0.53794384 -0.38301039 -0.75094575 -0.55059034 -0.41213372 -0.72594494 -0.53794384
		 -0.38301039 -0.75094575 -0.5339784 -0.38281298 -0.7538709 -0.55059034 -0.41213372
		 -0.72594494 0.16858619 -0.4895359 0.85553098 0.12957968 -0.47134644 0.87237698 -4.3214975e-05
		 -0.4849695 0.87453103 0.12957968 -0.47134644 0.87237698 1.9906951e-05 -0.46412241
		 0.8857711 -4.3214975e-05 -0.4849695 0.87453103 0.4337998 0.37651876 0.81856662 0.4766866
		 0.34924915 0.80671859 0.64683652 0.20140633 0.73555285 0.4766866 0.34924915 0.80671859
		 0.68440616 0.15793434 0.71178997 0.64683652 0.20140633 0.73555285 0.51865786 -0.77787167
		 -0.35483754 0.51830542 -0.77796841 -0.35514036 0.53029341 -0.79814941 -0.28591332
		 0.51830542 -0.77796841 -0.35514036 0.52983224 -0.79857737 -0.28557315 0.53029341
		 -0.79814941 -0.28591332 -0.50122029 0.3280544 0.80072373 -0.71794385 0.11222038 0.6869958
		 -0.57241267 0.27098668 0.77389276 -0.71794385 0.11222038 0.6869958 -0.73908877 0.084054291
		 0.66834319 -0.57241267 0.27098668 0.77389276 -0.49031594 -0.87075925 -0.036995079
		 -0.51479602 -0.85696727 -0.024335688 -0.64821291 -0.75886959 0.062745206 -0.51479602
		 -0.85696727 -0.024335688 -0.68308413 -0.72472131 0.090415999 -0.64821291 -0.75886959
		 0.062745206 -0.41665173 -0.74148256 0.52593243 -0.4253405 -0.78144211 0.45654538
		 -0.022763075 -0.80480301 0.59310538 -0.4253405 -0.78144211 0.45654538 -0.032404736
		 -0.85560393 0.51661581 -0.022763075 -0.80480301 0.59310538 -0.96419519 0.074526288
		 -0.25450623 -0.96157086 0.0059225257 -0.27449298 -0.9874559 -0.11463584 -0.10857955
		 -0.96157086 0.0059225257 -0.27449298 -0.9748649 -0.16152059 -0.15345861 -0.9874559
		 -0.11463584 -0.10857955 0.7299282 -0.31120253 -0.60857034 0.91797256 -0.17251985
		 -0.35716003 0.74127632 -0.46019942 -0.48859584 0.91797256 -0.17251985 -0.35716003
		 0.92047763 -0.2551837 -0.29597667 0.74127632 -0.46019942 -0.48859584 0.77927482 -0.60622829
		 -0.15880199 0.55469638 -0.79980075 -0.22941385 0.77202576 -0.6290518 -0.090939701
		 0.55469638 -0.79980075 -0.22941385 0.54202789 -0.83049709 -0.12837587 0.77202576
		 -0.6290518 -0.090939701 0.70267147 -0.70893914 0.060481738 0.85077262 -0.52461046
		 0.031141339 0.66674429 -0.70133001 0.25216717 0.85077262 -0.52461046 0.031141339
		 0.84318101 -0.50984794 0.17058967 0.66674429 -0.70133001 0.25216717;
	setAttr ".n[3984:4149]" -type "float3"  0.37514684 -0.91056329 -0.17360695 0.72701013
		 -0.67494905 -0.12609559 0.39331985 -0.91465795 0.093275592 0.72701013 -0.67494905
		 -0.12609559 0.70267147 -0.70893914 0.060481738 0.39331985 -0.91465795 0.093275592
		 0.27770972 -0.95375407 -0.11502393 0.0092711216 -0.99634093 -0.084963664 0.29188693
		 -0.91357374 0.28316966 0.0092711216 -0.99634093 -0.084963664 0.034750782 -0.95857573
		 0.28271008 0.29188693 -0.91357374 0.28316966 0.67467684 0.55009466 -0.49214536 0.66993523
		 0.55959487 -0.48789385 0.88974154 0.33450446 -0.31059104 0.66993523 0.55959487 -0.48789385
		 0.88261151 0.35036644 -0.31343305 0.88974154 0.33450446 -0.31059104 0.86690909 -0.40894362
		 0.28501546 0.95247233 -0.25448704 0.16742986 0.86953312 -0.37816122 0.31765753 0.95247233
		 -0.25448704 0.16742986 0.9527114 -0.23152786 0.19681422 0.86953312 -0.37816122 0.31765753
		 -0.063669272 -0.20758377 -0.976143 -0.53478605 -0.18802212 -0.82380313 -0.048498362
		 0.026742736 -0.99846518 -0.53478605 -0.18802212 -0.82380313 -0.52018863 0.015460366
		 -0.85391146 -0.048498362 0.026742736 -0.99846518 0.034750782 -0.95857573 0.28271008
		 0.0092711216 -0.99634093 -0.084963664 -0.1624411 -0.93307263 0.32091793 0.0092711216
		 -0.99634093 -0.084963664 -0.21331783 -0.97568089 -0.050421182 -0.1624411 -0.93307263
		 0.32091793 -0.01057572 0.73238289 -0.68081093 -0.38063785 0.67287791 -0.63431078
		 -0.0051630624 0.76245844 -0.64701664 -0.38063785 0.67287791 -0.63431078 -0.35205185
		 0.70722651 -0.6130988 -0.0051630624 0.76245844 -0.64701664 0.034354188 0.99675709
		 0.072767153 0.049199522 0.99727863 0.054906111 0.034512252 0.99672753 0.073097005
		 0.049199522 0.99727863 0.054906111 0.049208779 0.99728262 0.054826129 0.034512252
		 0.99672753 0.073097005 -0.034354277 0.99675715 0.072766773 -0.03451227 0.99672753
		 0.073096506 -0.04919932 0.99727869 0.054906093 -0.03451227 0.99672753 0.073096506
		 -0.049208559 0.99728262 0.05482614 -0.04919932 0.99727869 0.054906093 -0.35205185
		 0.70722651 -0.6130988 -0.61394888 0.57949507 -0.53595918 -0.32588497 0.72924906 -0.60166001
		 -0.61394888 0.57949507 -0.53595918 -0.58405626 0.61048996 -0.53495818 -0.32588497
		 0.72924906 -0.60166001 -0.33319232 0.86045927 -0.38547722 -0.16060381 0.90573794
		 -0.39223114 -0.31457061 0.87103879 -0.37727538 -0.16060381 0.90573794 -0.39223114
		 -0.14413276 0.91121817 -0.38588491 -0.31457061 0.87103879 -0.37727538 -0.88484609
		 -0.46572685 0.012076274 -0.91979563 -0.39163819 -0.024403272 -0.78628999 -0.59350193
		 -0.171766 -0.91979563 -0.39163819 -0.024403272 -0.81282449 -0.54455101 -0.20683452
		 -0.78628999 -0.59350193 -0.171766 -0.71985048 0.46630287 -0.51417601 -0.68394983
		 0.24827453 -0.68598282 -0.79075313 0.39577124 -0.46698463 -0.68394983 0.24827453
		 -0.68598282 -0.74836844 0.18324494 -0.63746846 -0.79075313 0.39577124 -0.46698463
		 -0.91375619 -0.098637827 0.39410689 -0.93309426 -0.27843961 0.22761048 -0.87230206
		 -0.18841383 0.4512088 -0.93309426 -0.27843961 0.22761048 -0.88838303 -0.36353129
		 0.28039363 -0.87230206 -0.18841383 0.4512088 -0.97362667 0.2217422 -0.05367988 -0.91577828
		 0.38634938 0.10992865 -0.95036972 0.29702017 -0.092608824 -0.91577828 0.38634938
		 0.10992865 -0.88634229 0.45655909 0.077143863 -0.95036972 0.29702017 -0.092608824
		 -0.69677722 0.65538889 -0.29149094 -0.61820269 0.78266305 -0.072553277 -0.61965823
		 0.71474433 -0.32429045 -0.61820269 0.78266305 -0.072553277 -0.54572439 0.83303255
		 -0.090783723 -0.61965823 0.71474433 -0.32429045 -0.11578536 0.89565569 -0.42941198
		 -0.22692254 0.87896758 -0.41943067 -0.10468805 0.98155522 -0.15996785 -0.22692254
		 0.87896758 -0.41943067 -0.19862846 0.96809608 -0.15276378 -0.10468805 0.98155522
		 -0.15996785 -0.94532084 -0.30246815 0.12198975 -0.94770986 -0.29965261 0.10979202
		 -0.7812252 -0.51439792 0.35366929 -0.94770986 -0.29965261 0.10979202 -0.81184357
		 -0.49291548 0.31296062 -0.7812252 -0.51439792 0.35366929 0.7985394 -0.5934661 0.10066183
		 0.72668993 -0.68118626 -0.088921688 0.84142148 -0.53691828 0.061062895 0.72668993
		 -0.68118626 -0.088921688 0.75190514 -0.64638537 -0.12970968 0.84142148 -0.53691828
		 0.061062895 0.84246266 0.32896164 -0.42666247 0.89113146 0.25189599 -0.3774032 0.79434162
		 0.11472136 -0.59654039 0.89113146 0.25189599 -0.3774032 0.83608097 0.043210939 -0.54690164
		 0.79434162 0.11472136 -0.59654039 0.88838315 -0.36353132 0.28039333 0.87230206 -0.18841381
		 0.4512088 0.84117317 -0.43054742 0.32719505 0.87230206 -0.18841381 0.4512088 0.8258009
		 -0.25954971 0.50068641 0.84117317 -0.43054742 0.32719505 0.94045085 0.30391511 0.1522755
		 0.95433265 0.23017305 0.19044563 0.99039871 0.13805851 -0.0070875781 0.95433265 0.23017305
		 0.19044563 0.99760145 0.060670424 0.033323545 0.99039871 0.13805851 -0.0070875781
		 0.87622833 0.44893658 -0.17515676 0.82323712 0.52408975 -0.21819857 0.80272067 0.59628236
		 0.0093241446 0.82323712 0.52408975 -0.21819857 0.74619621 0.66526979 -0.024643697
		 0.80272067 0.59628236 0.0093241446 0.22692274 0.87896758 -0.41943064 0.19862905 0.96809596
		 -0.15276375 0.33656952 0.85112232 -0.40287942 0.19862905 0.96809596 -0.15276375 0.29520726
		 0.94529283 -0.13883141 0.33656952 0.85112232 -0.40287942 0.71377647 -0.54512227 0.43973276
		 0.71574968 -0.66269231 0.22032075 0.77749598 -0.498436 0.38348609 0.71574968 -0.66269231
		 0.22032075 0.75190932 -0.64099783 0.1541238 0.77749598 -0.498436 0.38348609 -0.93083125
		 -0.34618571 0.11708372 -0.92035902 -0.37694597 0.10416847 -0.99225181 -0.032287393
		 -0.11997435 -0.92035902 -0.37694597 0.10416847 -0.98937279 -0.03184282 -0.14187141
		 -0.99225181 -0.032287393 -0.11997435 0.52595329 -0.4911319 0.69437927 0.49116701
		 -0.41527027 0.76570594 0.44400093 -0.49979264 0.74368709 0.49116701 -0.41527027 0.76570594
		 0.39614168 -0.43828055 0.80683452 0.44400093 -0.49979264 0.74368709 0.94045085 0.30391511
		 0.1522755 0.91577828 0.38634938 0.1099285 0.88359052 0.4029333 0.2385636 0.91577828
		 0.38634938 0.1099285;
	setAttr ".n[4150:4315]" -type "float3"  0.85202986 0.48356512 0.20052405 0.88359052
		 0.4029333 0.2385636 1.9906951e-05 -0.46412241 0.8857711 -3.6723953e-09 -0.44563508
		 0.89521468 -0.12955745 -0.47123605 0.87243992 -3.6723953e-09 -0.44563508 0.89521468
		 -0.11445728 -0.44038436 0.89048368 -0.12955745 -0.47123605 0.87243992 -0.6912697
		 0.7209658 -0.048524193 -0.6129024 0.7871567 0.068810761 -0.61820269 0.78266305 -0.072553277
		 -0.91375619 -0.098637827 0.39410689 -0.87990433 0.0073255389 0.47509438 -0.93962836
		 -0.020910287 0.34155723 -0.87990433 0.0073255389 0.47509438 -0.90266615 0.080931105
		 0.42266291 -0.93962836 -0.020910287 0.34155723 -0.42177019 0.75874835 -0.49639788
		 -0.52341425 0.72123277 -0.45371887 -0.45606256 0.74945855 -0.47991541 -0.52341425
		 0.72123277 -0.45371887 -0.61358994 0.68688977 -0.3894738 -0.45606256 0.74945855 -0.47991541
		 0.3411406 0.61318523 0.71247947 0.34032527 0.61168218 0.71415937 0.34018767 0.58482325
		 0.73637909 0.34032527 0.61168218 0.71415937 0.33917072 0.58358961 0.73782539 0.34018767
		 0.58482325 0.73637909 0.14204992 0.38666168 0.91121596 0.14234002 0.38636595 0.91129613
		 0.11235453 0.37527892 0.92007726 0.14234002 0.38636595 0.91129613 0.112881 0.37554491
		 0.91990429 0.11235453 0.37527892 0.92007726 -0.31197703 0.72111118 0.61860251 -0.32743424
		 0.69310963 0.64217275 -0.31270665 0.71885163 0.6208598 -0.32743424 0.69310963 0.64217275
		 -0.32710731 0.69093674 0.64467603 -0.31270665 0.71885163 0.6208598 -0.2204455 0.4177703
		 0.88140333 -0.19540413 0.40759248 0.89201212 -0.21762443 0.41820142 0.88189977 -0.19540413
		 0.40759248 0.89201212 -0.19352606 0.40794095 0.89226222 -0.21762443 0.41820142 0.88189977
		 0 0.36081392 0.93263781 -8.5700911e-08 0.36071479 0.9326762 -0.041193504 0.36156121
		 0.93143791 -8.5700911e-08 0.36071479 0.9326762 -0.041504882 0.36149424 0.93145007
		 -0.041193504 0.36156121 0.93143791 -0.74836844 0.18324494 -0.63746846 -0.70336324
		 0.058660399 -0.70840603 -0.79434162 0.11472113 -0.59654039 -0.70336324 0.058660399
		 -0.70840603 -0.7446934 -0.0094307875 -0.66734004 -0.79434162 0.11472113 -0.59654039
		 0.80402195 -0.14282677 -0.57719076 0.7812379 -0.073283188 -0.61991686 0.86290985
		 -0.02891545 -0.50453001 0.7812379 -0.073283188 -0.61991686 0.83608097 0.043210939
		 -0.54690164 0.86290985 -0.02891545 -0.50453001 0.46244287 -0.75534159 0.46433359
		 0.43342894 -0.76325703 0.47914305 0.56022608 -0.7029261 0.43822554 0.43342894 -0.76325703
		 0.47914305 0.50827122 -0.72902346 0.45845962 0.56022608 -0.7029261 0.43822554 -0.5853762
		 -0.68597502 0.43217239 -0.50827134 -0.7290231 0.45845997 -0.5602262 -0.70292634 0.438225
		 -0.88672912 0.44609696 -0.1212803 -0.93051976 0.35952348 -0.069826998 -0.87074733
		 0.46904624 -0.14763044 -0.93051976 0.35952348 -0.069826998 -0.89666325 0.42552501
		 -0.12216194 -0.87074733 0.46904624 -0.14763044 0.55265272 -0.41289163 -0.72394443
		 0.55059057 -0.41213393 -0.7259447 0.5379439 -0.38301003 -0.75094587 0.55059057 -0.41213393
		 -0.7259447 0.53397948 -0.38281325 -0.75387001 0.5379439 -0.38301003 -0.75094587 0.29681978
		 -0.87354064 -0.38577819 0.29842237 -0.87544674 -0.38018033 0.35376933 -0.84988517
		 -0.39056686 0.29842237 -0.87544674 -0.38018033 0.35585928 -0.850133 -0.38812113 0.35376933
		 -0.84988517 -0.39056686 -0.3537696 -0.84988523 -0.39056647 -0.39671078 -0.82033885
		 -0.41190383 -0.35585943 -0.85013306 -0.38812092 -0.39671078 -0.82033885 -0.41190383
		 -0.39743471 -0.81896949 -0.41392595 -0.35585943 -0.85013306 -0.38812092 -0.50905997
		 -0.35963398 -0.78199834 -0.5339784 -0.38281298 -0.7538709 -0.51137477 -0.3614687
		 -0.77963853 -0.5339784 -0.38281298 -0.7538709 -0.53794384 -0.38301039 -0.75094575
		 -0.51137477 -0.3614687 -0.77963853 0.78256196 -0.43312281 0.4472152 0.72316688 -0.60477269
		 0.3335861 0.59563684 -0.57091284 0.56504452 0.68891954 -0.40973327 0.59792012 0.70094502
		 -0.38806212 0.59840107 0.67687756 -0.42175564 0.60329008 0.70094502 -0.38806212 0.59840107
		 0.66622055 -0.43346632 0.60684198 0.67687756 -0.42175564 0.60329008 0.4766866 0.34924915
		 0.80671859 0.4337998 0.37651876 0.81856662 0.29722872 0.44836178 0.84298682 0.4337998
		 0.37651876 0.81856662 0.24525651 0.46928447 0.84830499 0.29722872 0.44836178 0.84298682
		 0.53369033 -0.76362509 -0.36338878 0.52585727 -0.76661444 -0.36847854 0.51865786
		 -0.77787167 -0.35483754 0.52585727 -0.76661444 -0.36847854 0.51830542 -0.77796841
		 -0.35514036 0.51865786 -0.77787167 -0.35483754 -0.2972286 0.44836187 0.84298682 -0.12696664
		 0.50559783 0.85337579 -0.24525645 0.46928442 0.84830505 -0.12696664 0.50559783 0.85337579
		 -0.11350168 0.50804555 0.85381913 -0.24525645 0.46928442 0.84830505 -3.720225e-09
		 -0.99086541 -0.1348543 -1.008353e-08 -0.99134809 -0.13125917 -0.21057878 -0.97165477
		 -0.10744124 -1.008353e-08 -0.99134809 -0.13125917 -0.21894319 -0.9697054 -0.1083298
		 -0.21057878 -0.97165477 -0.10744124 -0.42978662 -0.84429204 0.32008505 -0.4253405
		 -0.78144211 0.45654538 -0.73281074 -0.64050424 0.22965774 -0.4253405 -0.78144211
		 0.45654538 -0.73861933 -0.59579629 0.31538579 -0.73281074 -0.64050424 0.22965774
		 -0.5273779 -0.57616562 -0.62442428 -0.81417054 -0.39761481 -0.42311803 -0.53863394
		 -0.39507368 -0.74417084 -0.81417054 -0.39761481 -0.42311803 -0.81836426 -0.27305993
		 -0.50568587 -0.53863394 -0.39507368 -0.74417084 0.37514684 -0.91056329 -0.17360695
		 -0.053536456 -0.97797751 -0.20172703 0.33820435 -0.80303121 -0.49067163 -0.053536456
		 -0.97797751 -0.20172703 -0.079354182 -0.84946537 -0.5216431 0.33820435 -0.80303121
		 -0.49067163 -0.45709223 0.27158695 -0.84693992 -0.70814073 0.2359145 -0.66549313
		 -0.42708302 0.45469457 -0.78157085 -0.70814073 0.2359145 -0.66549313 -0.68197066
		 0.37910682 -0.62545508 -0.42708302 0.45469457 -0.78157085 0.66991252 -0.64588416
		 0.36612967 0.85478699 -0.45962551 0.24100544 0.68236667 -0.59323454 0.42713988 0.85478699
		 -0.45962551 0.24100544 0.86690909 -0.40894362 0.28501546;
	setAttr ".n[4316:4481]" -type "float3"  0.68236667 -0.59323454 0.42713988 0.99082285
		 -0.13514519 -0.0024256725 0.98445475 -0.16798913 -0.051268566 0.99592543 -0.065987624
		 -0.061466716 0.98445475 -0.16798913 -0.051268566 0.98891973 -0.10389588 -0.1060351
		 0.99592543 -0.065987624 -0.061466716 0.77202576 -0.6290518 -0.090939701 0.54202789
		 -0.83049709 -0.12837587 0.73730987 -0.66395348 0.12465921 0.54202789 -0.83049709
		 -0.12837587 0.52199394 -0.82231838 0.22652781 0.73730987 -0.66395348 0.12465921 0.88985777
		 -0.44543105 -0.098713525 0.95649779 -0.26564014 -0.12061216 0.85077262 -0.52461046
		 0.031141339 0.95649779 -0.26564014 -0.12061216 0.92805707 -0.37237456 0.0068738195
		 0.85077262 -0.52461046 0.031141339 0.94800043 -0.29165193 0.12741399 0.93836027 -0.33586019
		 0.081718937 0.99082285 -0.13514519 -0.0024256725 0.93836027 -0.33586019 0.081718937
		 0.98445475 -0.16798913 -0.051268566 0.99082285 -0.13514519 -0.0024256725 -0.016132163
		 -0.9561851 -0.29231793 0.0092711216 -0.99634093 -0.084963664 0.25580376 -0.92671645
		 -0.27524731 0.0092711216 -0.99634093 -0.084963664 0.27770972 -0.95375407 -0.11502393
		 0.25580376 -0.92671645 -0.27524731 -0.96034122 0.11816627 -0.25254992 -0.99050325
		 -0.098636396 -0.095782034 -0.95327145 0.1485182 -0.26308912 -0.99050325 -0.098636396
		 -0.095782034 -0.99213576 -0.088875271 -0.088135086 -0.95327145 0.1485182 -0.26308912
		 -0.79605806 -0.5959397 0.10558139 -0.80086201 -0.57534444 0.16612875 -0.66046876
		 -0.74906677 0.051768582 -0.80086201 -0.57534444 0.16612875 -0.69916707 -0.65848303
		 0.27850592 -0.66046876 -0.74906677 0.051768582 -0.52018863 0.015460366 -0.85391146
		 -0.78218156 0.0097510191 -0.62297428 -0.45709223 0.27158695 -0.84693992 -0.78218156
		 0.0097510191 -0.62297428 -0.70814073 0.2359145 -0.66549313 -0.45709223 0.27158695
		 -0.84693992 -0.53478605 -0.18802212 -0.82380313 -0.80168015 -0.1433944 -0.58029908
		 -0.52018863 0.015460366 -0.85391146 -0.80168015 -0.1433944 -0.58029908 -0.78218156
		 0.0097510191 -0.62297428 -0.52018863 0.015460366 -0.85391146 -0.10047233 0.99080729
		 -0.090588324 -0.10102354 0.99077535 -0.090324454 -0.14018399 0.98431885 -0.1070743
		 -0.10102354 0.99077535 -0.090324454 -0.13865659 0.98450696 -0.1073332 -0.14018399
		 0.98431885 -0.1070743 0.012053722 0.99620962 0.086145997 0.034354188 0.99675709 0.072767153
		 0.012159568 0.99622971 0.085898608 0.034354188 0.99675709 0.072767153 0.034512252
		 0.99672753 0.073097005 0.012159568 0.99622971 0.085898608 -0.99213576 -0.088875271
		 -0.088135086 -0.95275867 -0.28984371 0.090783171 -0.99366605 -0.076975398 -0.081869029
		 -0.95275867 -0.28984371 0.090783171 -0.94770986 -0.29965261 0.10979202 -0.99366605
		 -0.076975398 -0.081869029 -0.6723485 0.4826518 -0.56124395 -0.86179024 0.29454303
		 -0.41299146 -0.64610577 0.53980261 -0.53959292 -0.86179024 0.29454303 -0.41299146
		 -0.84694433 0.34486905 -0.40466115 -0.64610577 0.53980261 -0.53959292 -0.59551769
		 0.74356097 -0.3040984 -0.55690426 0.76804179 -0.31617942 -0.58303452 0.7539584 -0.3026838
		 -0.55690426 0.76804179 -0.31617942 -0.5239284 0.78465462 -0.33138528 -0.58303452
		 0.7539584 -0.3026838 0.91186607 -0.11888491 -0.39289516 0.88600153 0.0087278998 -0.46360022
		 0.95724863 0.0030751403 -0.28925002 0.88600153 0.0087278998 -0.46360022 0.89197224
		 0.15639158 -0.42417824 0.95724863 0.0030751403 -0.28925002 -0.92472774 0.17890209
		 -0.33596522 -0.86290973 -0.028915389 -0.50453019 -0.95328742 0.096820876 -0.28612733
		 -0.86290973 -0.028915389 -0.50453019 -0.88492739 -0.10372999 -0.45403042 -0.95328742
		 0.096820876 -0.28612733 -0.84117335 -0.4305473 0.32719478 -0.77749598 -0.49843588
		 0.38348624 -0.82580101 -0.25954992 0.50068605 -0.77749598 -0.49843588 0.38348624
		 -0.76262301 -0.33768654 0.55170095 -0.82580101 -0.25954992 0.50068605 -0.99611503
		 -0.026723288 0.08390899 -0.95988935 0.14305149 0.24114031 -0.99760145 0.060670413
		 0.033323776 -0.95988935 0.14305149 0.24114031 -0.95433259 0.23017307 0.190446 -0.99760145
		 0.060670413 0.033323776 -0.82323724 0.52408963 -0.21819825 -0.74619633 0.66526973
		 -0.024643268 -0.76876318 0.58771336 -0.25218275 -0.74619633 0.66526973 -0.024643268
		 -0.6912697 0.7209658 -0.048524193 -0.76876318 0.58771336 -0.25218275 -0.33656943
		 0.85112244 -0.40287921 -0.43954647 0.81383955 -0.38008425 -0.29520696 0.94529289
		 -0.13883157 -0.43954647 0.81383955 -0.38008425 -0.38407043 0.91507351 -0.12300577
		 -0.29520696 0.94529289 -0.13883157 -0.71521515 -0.66329634 0.22023894 -0.66149753
		 -0.68423098 0.30700004 -0.71351361 -0.54620427 0.43881565 -0.66149753 -0.68423098
		 0.30700004 -0.64304936 -0.58069563 0.49927956 -0.71351361 -0.54620427 0.43881565
		 -0.86130869 -0.4629555 0.20933108 -0.95636612 -0.28819978 0.048007 -0.85919809 -0.48444107
		 0.16460696 -0.95636612 -0.28819978 0.048007 -0.95242596 -0.30469197 -0.0068982346
		 -0.85919809 -0.48444107 0.16460696 0.88974154 0.33450446 -0.31059104 0.96690524 0.16734321
		 -0.19258898 0.9076317 0.26611984 -0.3246305 0.96690524 0.16734321 -0.19258898 0.97221839
		 0.11331404 -0.2048201 0.9076317 0.26611984 -0.3246305 0.96933353 0.020001357 -0.24493349
		 0.9782964 -0.062963076 -0.19741277 0.89223808 -0.18061014 -0.41387334 0.9782964 -0.062963076
		 -0.19741277 0.89232278 -0.25754094 -0.37071919 0.89223808 -0.18061014 -0.41387334
		 0.95988941 0.14305152 0.24114016 0.95585525 0.067680299 0.28593716 0.99611503 -0.026723308
		 0.083909132 0.95585525 0.067680299 0.28593716 0.98604625 -0.10706042 0.12747897 0.99611503
		 -0.026723308 0.083909132 0.95036978 0.29702014 -0.092608355 0.91529262 0.37830672
		 -0.13828768 0.88634223 0.45655921 0.077144049 0.91529262 0.37830672 -0.13828768 0.84507138
		 0.53322715 0.03902752 0.88634223 0.45655921 0.077144049 0.53344887 0.768664 -0.35297024
		 0.46586859 0.87810951 -0.10904163 0.61965829 0.71474427 -0.32429034 0.46586859 0.87810951
		 -0.10904163 0.54572451 0.83303243 -0.090783715 0.61965829 0.71474427 -0.32429034
		 3.1035574e-06 -0.93095028 -0.36514589 -0.28490084 -0.89029545 -0.35525417 -0.016132163
		 -0.9561851 -0.29231793;
	setAttr ".n[4482:4647]" -type "float3"  -0.28490084 -0.89029545 -0.35525417 -0.25864512
		 -0.92851871 -0.26637512 -0.016132163 -0.9561851 -0.29231793 0.69413269 -0.40319318
		 0.5963347 0.67820299 -0.32044953 0.66132653 0.61370909 -0.45667976 0.64405334 0.67820299
		 -0.32044953 0.66132653 0.5889678 -0.38176891 0.71229869 0.61370909 -0.45667976 0.64405334
		 0.80272067 0.59628236 0.0093241446 0.74619621 0.66526979 -0.024643697 0.73119545
		 0.67256457 0.11406217 0.74619621 0.66526979 -0.024643697 0.67144448 0.73605633 0.085926555
		 0.73119545 0.67256457 0.11406217 0.84353757 -0.080505975 0.53100199 0.80175674 -0.15959474
		 0.57594758 0.87230206 -0.18841381 0.4512088 0.80175674 -0.15959474 0.57594758 0.8258009
		 -0.25954971 0.50068641 0.87230206 -0.18841381 0.4512088 -0.19862846 0.96809608 -0.15276378
		 -0.29520696 0.94529289 -0.13883157 -0.17865086 0.98390675 -0.0033727451 -0.29520696
		 0.94529289 -0.13883157 -0.26381335 0.96451396 0.010739088 -0.17865086 0.98390675
		 -0.0033727451 -0.95433259 0.23017307 0.190446 -0.90259784 0.33155322 0.2745716 -0.94045079
		 0.30391505 0.15227585 -0.90259784 0.33155322 0.2745716 -0.88359076 0.40293342 0.23856232
		 -0.94045079 0.30391505 0.15227585 0.21643715 0.84992361 -0.48040071 0.1869642 0.8849932
		 -0.42641699 0.095163785 0.92400521 -0.37034875 0.1869642 0.8849932 -0.42641699 0.07313925
		 0.93511117 -0.34672436 0.095163785 0.92400521 -0.37034875 0.31197733 0.72111118 0.61860228
		 0.3127068 0.71885157 0.6208598 0.32743379 0.69310868 0.64217401 0.3127068 0.71885157
		 0.6208598 0.32710695 0.69093621 0.6446768 0.32743379 0.69310868 0.64217401 0.22044605
		 0.41777027 0.88140315 0.21762472 0.41820118 0.88189977 0.1954039 0.40759307 0.89201188
		 0.21762472 0.41820118 0.88189977 0.19352563 0.40794137 0.8922621 0.1954039 0.40759307
		 0.89201188 0 0.36081392 0.93263781 0.041193329 0.36156088 0.93143803 -8.5700911e-08
		 0.36071479 0.9326762 0.041193329 0.36156088 0.93143803 0.041504707 0.361494 0.93145019
		 -8.5700911e-08 0.36071479 0.9326762 -0.30428547 0.49247494 0.81540102 -0.29118222
		 0.47289532 0.83161467 -0.30355439 0.4916546 0.81616819 -0.29118222 0.47289532 0.83161467
		 -0.28941929 0.47179914 0.83285177 -0.30355439 0.4916546 0.81616819 -0.079947859 0.86113447
		 0.50205153 -0.11502025 0.86024946 0.49673048 -0.077561542 0.86160022 0.50162667 -0.11502025
		 0.86024946 0.49673048 -0.11467726 0.86273003 0.49248967 -0.077561542 0.86160022 0.50162667
		 -0.88492739 -0.10372999 -0.45403042 -0.82191366 -0.21510129 -0.52743661 -0.89223802
		 -0.18060999 -0.41387355 -0.82191366 -0.21510129 -0.52743661 -0.8235386 -0.29291645
		 -0.48578197 -0.89223802 -0.18060999 -0.41387355 -0.11524539 0.48986074 -0.86414987
		 -0.11613956 0.34341037 -0.93197691 -0.22208379 0.47460502 -0.85172111 -0.11613956
		 0.34341037 -0.93197691 -0.20785077 0.33230296 -0.91998523 -0.22208379 0.47460502
		 -0.85172111 0.88227212 -0.33192644 -0.33379745 0.86735314 -0.40589643 -0.28800458
		 0.80618274 -0.42576846 -0.41084126 0.86735314 -0.40589643 -0.28800458 0.79089379
		 -0.4894425 -0.36733231 0.80618274 -0.42576846 -0.41084126 0.43430254 0.41366848 -0.80016226
		 0.40731317 0.27633068 -0.87048107 0.33128217 0.44750169 -0.83065897 0.40731317 0.27633068
		 -0.87048107 0.30740851 0.30223018 -0.90230644 0.33128217 0.44750169 -0.83065897 0.13018231
		 -0.84189945 0.52369636 0.12811297 -0.84183431 0.52431101 0.23851517 -0.82499856 0.51233572
		 0.12811297 -0.84183431 0.52431101 0.2305261 -0.82578707 0.51471686 0.23851517 -0.82499856
		 0.51233572 0.40751436 -0.33869639 -0.84806651 0.46464884 -0.31858966 -0.82619739
		 0.42018104 -0.29680482 -0.85752833 0.46464884 -0.31858966 -0.82619739 0.46644002
		 -0.31340149 -0.8271718 0.42018104 -0.29680482 -0.85752833 0.4752849 -0.74442452 -0.46897376
		 0.47748464 -0.74552083 -0.46498072 0.50772685 -0.70784688 -0.49108678 0.47748464
		 -0.74552083 -0.46498072 0.5075776 -0.70706111 -0.49237138 0.50772685 -0.70784688
		 -0.49108678 -0.12171646 -0.93548667 -0.33173761 -0.17668915 -0.92028058 -0.34909105
		 -0.12377691 -0.93460798 -0.33344746 -0.17668915 -0.92028058 -0.34909105 -0.17829098
		 -0.91847205 -0.35301757 -0.12377691 -0.93460798 -0.33344746 -0.60295159 -0.51767623
		 -0.60700965 -0.59781921 -0.4886483 -0.63548017 -0.60614604 -0.518094 -0.60346133
		 -0.59781921 -0.4886483 -0.63548017 -0.59050184 -0.48748872 -0.64316589 -0.60614604
		 -0.518094 -0.60346133 -0.31441548 -0.61719799 0.72125554 0.00034282292 -0.68230063
		 0.73107165 -0.3023043 -0.61586541 0.72754514 0.00034282292 -0.68230063 0.73107165
		 -0.00031369008 -0.68952036 0.72426623 -0.3023043 -0.61586541 0.72754514 0.59836185
		 -0.7026462 0.38503423 0.59490943 -0.69914359 0.39658672 0.57768112 -0.41161108 0.70488358
		 0.59490943 -0.69914359 0.39658672 0.56921959 -0.40738598 0.71416086 0.57768112 -0.41161108
		 0.70488358 0.88447142 0.1740979 -0.43289754 0.84827763 -0.13669483 -0.51160491 0.88670772
		 0.14194137 -0.44000229 0.84827763 -0.13669483 -0.51160491 0.83275515 -0.20973356
		 -0.5123775 0.88670772 0.14194137 -0.44000229 0.51479596 -0.85696727 -0.024335563
		 0.3927016 -0.91642118 -0.077185832 0.49031574 -0.87075937 -0.03699496 0.3927016 -0.91642118
		 -0.077185832 0.37645343 -0.92337024 -0.075300537 0.49031574 -0.87075937 -0.03699496
		 0 -0.84515989 0.53451353 0 -0.88055027 0.47395274 0 -0.84295207 0.53798866 0 -0.88055027
		 0.47395274 0 -0.88064158 0.47378308 0 -0.84295207 0.53798866 0 -0.88055027 0.47395274
		 0 -0.87557888 0.48307517 0 -0.88064158 0.47378308 0 -0.87557888 0.48307517 0 -0.8748107
		 0.48446488 0 -0.88064158 0.47378308 0 -0.86066961 0.5091638 0 -0.8613438 0.50802255
		 0 -0.87557888 0.48307517 0 -0.8613438 0.50802255 0 -0.8748107 0.48446488 0 -0.87557888
		 0.48307517 0 -0.86066961 0.5091638;
	setAttr ".n[4648:4813]" -type "float3"  0 -0.80657881 0.59112656 0 -0.8613438
		 0.50802255 0 0.24779539 0.96881241 0 0.19757247 0.98028827 0 0.24857074 0.96861374
		 0 0.10640408 0.99432296 0 0.10790394 0.99416131 0 -0.010688237 0.9999429 0 0.10790394
		 0.99416131 -0.0002814412 -0.11450076 0.9934231 0 -0.010688237 0.9999429 0 0.24779539
		 0.96881241 0 0.24857074 0.96861374 0 0.10640408 0.99432296 0 0.24857074 0.96861374
		 0 0.10790394 0.99416131 0 0.10640408 0.99432296 -0.001662273 -0.45680934 0.88956308
		 -0.00010996064 -0.4603259 0.88774997 -0.00042272027 -0.2922914 0.95632923 -0.00010996064
		 -0.4603259 0.88774997 -0.004957248 -0.34693021 0.93787783 -0.00042272027 -0.2922914
		 0.95632923 -0.00042272027 -0.2922914 0.95632923 -0.004957248 -0.34693021 0.93787783
		 -0.0002814412 -0.11450076 0.9934231 -0.004957248 -0.34693021 0.93787783 -0.013620067
		 -0.22313058 0.97469342 -0.0002814412 -0.11450076 0.9934231 -0.0002814412 -0.11450076
		 0.9934231 -0.013620067 -0.22313058 0.97469342 0 -0.010688237 0.9999429 0 -0.84515989
		 0.53451353 0 -0.84295207 0.53798866 0 -0.7662155 0.64258367 0 -0.84295207 0.53798866
		 0 -0.76780874 0.64067912 0 -0.7662155 0.64258367 0 -0.7662155 0.64258367 0 -0.76780874
		 0.64067912 -0.00099813403 -0.62827343 0.77799195 0 -0.76780874 0.64067912 0 -0.64480311
		 0.76434869 -0.00099813403 -0.62827343 0.77799195 0.97565186 0.11294302 -0.18800886
		 0.99370307 0.070529297 -0.087062441 0.96650428 0.15188582 -0.20688199 0.99370307
		 0.070529297 -0.087062441 0.98362082 0.12265611 -0.13208164 0.96650428 0.15188582
		 -0.20688199 0.98362082 0.12265611 -0.13208164 0.98538363 0.11730297 -0.12352782 0.96650428
		 0.15188582 -0.20688199 0.99900895 0.016343864 -0.041400295 0.9927302 0.039518643
		 -0.11368838 0.99825782 -0.058177676 0.0098317629 0.9927302 0.039518643 -0.11368838
		 0.99819398 -0.058265794 -0.014626472 0.99825782 -0.058177676 0.0098317629 0.99370307
		 0.070529297 -0.087062441 0.97565186 0.11294302 -0.18800886 0.99900895 0.016343864
		 -0.041400295 0.97565186 0.11294302 -0.18800886 0.9927302 0.039518643 -0.11368838
		 0.99900895 0.016343864 -0.041400295 0.95137417 -0.25783339 0.16854995 0.92755467
		 -0.29698923 0.22680318 0.88569969 -0.36514568 0.28671357 0.77108419 -0.46336704 0.43671519
		 0.88569969 -0.36514568 0.28671357 0.80593812 -0.43371964 0.40292811 0.88569969 -0.36514568
		 0.28671357 0.92755467 -0.29698923 0.22680318 0.80593812 -0.43371964 0.40292811 0.99825782
		 -0.058177676 0.0098317629 0.99819398 -0.058265794 -0.014626472 0.9861899 -0.14722848
		 0.07585045 0.99819398 -0.058265794 -0.014626472 0.98255378 -0.16394547 0.087806553
		 0.9861899 -0.14722848 0.07585045 0.9861899 -0.14722848 0.07585045 0.98255378 -0.16394547
		 0.087806553 0.95137417 -0.25783339 0.16854995 0.98255378 -0.16394547 0.087806553
		 0.92755467 -0.29698923 0.22680318 0.95137417 -0.25783339 0.16854995 0.77108419 -0.46336704
		 0.43671519 0.80593812 -0.43371964 0.40292811 0.62800616 -0.53386772 0.56620973 0.80593812
		 -0.43371964 0.40292811 0.5696159 -0.54398459 0.6161319 0.62800616 -0.53386772 0.56620973
		 0.36465278 -0.55874795 0.74486846 0.52412891 -0.55671656 0.64448082 0.5696159 -0.54398459
		 0.6161319 0.52412891 -0.55671656 0.64448082 0.62800616 -0.53386772 0.56620973 0.5696159
		 -0.54398459 0.6161319 0.36465278 -0.55874795 0.74486846 0.37227005 -0.55790365 0.7417267
		 0.52412891 -0.55671656 0.64448082 -0.68791437 -0.68155271 0.24951908 -0.80061978
		 -0.55641729 0.22227867 -0.69390869 -0.61758167 0.37024802 -0.80061978 -0.55641729
		 0.22227867 -0.82382631 -0.4893733 0.28604895 -0.69390869 -0.61758167 0.37024802 0.3444958
		 -0.49623245 0.79691654 0.24072877 -0.49322212 0.8359316 0.41738749 -0.58084655 0.69885975
		 0.24072877 -0.49322212 0.8359316 0.30792359 -0.52924275 0.79062325 0.41738749 -0.58084655
		 0.69885975 0.71078157 -0.70237446 -0.038205367 0.70679855 -0.69232178 -0.14534892
		 0.72668993 -0.68118626 -0.088921688 0.70679855 -0.69232178 -0.14534892 0.70020294
		 -0.68892664 -0.18733911 0.72668993 -0.68118626 -0.088921688 -0.066994667 -0.66711468
		 -0.74193645 -0.076087862 -0.46115249 -0.88405263 0.3364042 -0.62996179 -0.69998598
		 -0.076087862 -0.46115249 -0.88405263 0.33076423 -0.41769329 -0.84624308 0.3364042
		 -0.62996179 -0.69998598 -0.48219365 -0.7564888 -0.44183025 -0.5273779 -0.57616562
		 -0.62442428 -0.079354182 -0.84946537 -0.5216431 -0.5273779 -0.57616562 -0.62442428
		 -0.066994667 -0.66711468 -0.74193645 -0.079354182 -0.84946537 -0.5216431 0.9741255
		 -0.14827041 -0.17057365 0.92047763 -0.2551837 -0.29597667 0.97058749 -0.082424134
		 -0.2261994 0.92047763 -0.2551837 -0.29597667 0.91797256 -0.17251985 -0.35716003 0.97058749
		 -0.082424134 -0.2261994 0.95649779 -0.26564014 -0.12061216 0.88985777 -0.44543105
		 -0.098713525 0.97028315 -0.18760987 -0.15281723 0.88985777 -0.44543105 -0.098713525
		 0.91407585 -0.35735875 -0.19172904 0.97028315 -0.18760987 -0.15281723 -0.79264104
		 -0.51804304 -0.32148349 -0.48219365 -0.7564888 -0.44183025 -0.74421799 -0.65492338
		 -0.13120565 -0.48219365 -0.7564888 -0.44183025 -0.43165109 -0.88671279 -0.16558304
		 -0.74421799 -0.65492338 -0.13120565 -0.99050325 -0.098636396 -0.095782034 -0.95545799
		 -0.28689316 0.06922663 -0.99213576 -0.088875271 -0.088135086 -0.95545799 -0.28689316
		 0.06922663 -0.95275867 -0.28984371 0.090783171 -0.99213576 -0.088875271 -0.088135086
		 -0.86179024 0.29454303 -0.41299146 -0.87014186 0.24288155 -0.42879102 -0.96419519
		 0.074526288 -0.25450623 -0.87014186 0.24288155 -0.42879102 -0.96157086 0.0059225257
		 -0.27449298 -0.96419519 0.074526288 -0.25450623 -0.89806581 0.012964822 -0.43967003
		 -0.91943806 -0.082366675 -0.38451183 -0.96157086 0.0059225257 -0.27449298 -0.79264104
		 -0.51804304 -0.32148349 -0.93012851 -0.31639799 -0.18642212;
	setAttr ".n[4814:4979]" -type "float3"  -0.81417054 -0.39761481 -0.42311803 -0.93012851
		 -0.31639799 -0.18642212 -0.92902386 -0.25379157 -0.26926669 -0.81417054 -0.39761481
		 -0.42311803 -0.95242596 -0.30469197 -0.0068982346 -0.9748649 -0.16152059 -0.15345861
		 -0.93012851 -0.31639799 -0.18642212 -0.9748649 -0.16152059 -0.15345861 -0.92902386
		 -0.25379157 -0.26926669 -0.93012851 -0.31639799 -0.18642212 -0.91943806 -0.082366675
		 -0.38451183 -0.80168015 -0.1433944 -0.58029908 -0.93268538 -0.13941853 -0.33265674
		 -0.80168015 -0.1433944 -0.58029908 -0.81836426 -0.27305993 -0.50568587 -0.93268538
		 -0.13941853 -0.33265674 -0.91943806 -0.082366675 -0.38451183 -0.93268538 -0.13941853
		 -0.33265674 -0.96157086 0.0059225257 -0.27449298 -0.93268538 -0.13941853 -0.33265674
		 -0.9748649 -0.16152059 -0.15345861 -0.96157086 0.0059225257 -0.27449298 -0.87014186
		 0.24288155 -0.42879102 -0.86301792 0.1582863 -0.4797349 -0.96157086 0.0059225257
		 -0.27449298 -0.86301792 0.1582863 -0.4797349 -0.89806581 0.012964822 -0.43967003
		 -0.96157086 0.0059225257 -0.27449298 0.66472489 0.57283485 -0.47958425 0.66782451
		 0.56758571 -0.48151523 0.8875711 0.34191197 -0.30872923 0.66782451 0.56758571 -0.48151523
		 0.8826375 0.32687086 -0.33779654 0.8875711 0.34191197 -0.30872923 0.68886167 0.5182839
		 -0.50680506 0.35883802 0.72143924 -0.59225053 0.50226986 0.60720193 -0.61565471 0.35883802
		 0.72143924 -0.59225053 0.21979031 0.77321947 -0.59483093 0.50226986 0.60720193 -0.61565471
		 -0.45186505 0.66529441 -0.59430742 -0.60513681 0.6211403 -0.4979901 -0.57686752 0.64719594
		 -0.49835861 -0.69553143 0.56431758 -0.44472659 -0.81668323 0.44178563 -0.37128687
		 -0.75056648 0.54247338 -0.37732294 0.62297237 0.55108547 -0.5551669 0.79221582 0.36309776
		 -0.49046317 0.68886167 0.5182839 -0.50680506 0.79221582 0.36309776 -0.49046317 0.89207023
		 0.25964049 -0.36986148 0.68886167 0.5182839 -0.50680506 0.8810299 -0.46884376 -0.063022435
		 0.90672559 -0.40019855 0.13300301 0.91380185 -0.40232408 0.055691745 0.90672559 -0.40019855
		 0.13300301 0.9301455 -0.2840606 0.23267767 0.91380185 -0.40232408 0.055691745 0.86711419
		 -0.49382347 -0.065202512 0.88521045 -0.46502122 0.012557453 0.8810299 -0.46884376
		 -0.063022435 0.88521045 -0.46502122 0.012557453 0.90672559 -0.40019855 0.13300301
		 0.8810299 -0.46884376 -0.063022435 0.71574968 -0.66269231 0.22032075 0.70695823 -0.70701146
		 0.018570693 0.75190932 -0.64099783 0.1541238 0.70695823 -0.70701146 0.018570693 0.71078157
		 -0.70237446 -0.038205367 0.75190932 -0.64099783 0.1541238 0.64296454 -0.5810802 0.49894121
		 0.67357516 -0.67343462 0.30460188 0.71377647 -0.54512227 0.43973276 0.67357516 -0.67343462
		 0.30460188 0.71574968 -0.66269231 0.22032075 0.71377647 -0.54512227 0.43973276 0.67357516
		 -0.67343462 0.30460188 0.69417828 -0.71369714 0.093557164 0.71574968 -0.66269231
		 0.22032075 0.69417828 -0.71369714 0.093557164 0.70695823 -0.70701146 0.018570693
		 0.71574968 -0.66269231 0.22032075 0.72668993 -0.68118626 -0.088921688 0.70020294
		 -0.68892664 -0.18733911 0.75190514 -0.64638537 -0.12970968 0.70020294 -0.68892664
		 -0.18733911 0.70816219 -0.66876483 -0.22640654 0.75190514 -0.64638537 -0.12970968
		 0.69417828 -0.71369714 0.093557164 0.73042887 -0.68069965 -0.055872288 0.70695823
		 -0.70701146 0.018570693 0.73042887 -0.68069965 -0.055872288 0.70841533 -0.70209807
		 -0.072152399 0.70695823 -0.70701146 0.018570693 0.56593031 -0.60112667 0.56424254
		 0.61875415 -0.67276931 0.40561649 0.64296454 -0.5810802 0.49894121 0.61875415 -0.67276931
		 0.40561649 0.67357516 -0.67343462 0.30460188 0.64296454 -0.5810802 0.49894121 0.75157243
		 -0.65963441 0.0046215109 0.73042887 -0.68069965 -0.055872288 0.69417828 -0.71369714
		 0.093557164 0.30792359 -0.52924275 0.79062325 0.42129797 -0.58849984 0.69005507 0.41738749
		 -0.58084655 0.69885975 0.42129797 -0.58849984 0.69005507 0.50392032 -0.61096156 0.61056554
		 0.41738749 -0.58084655 0.69885975 0.30792359 -0.52924275 0.79062325 0.16858619 -0.4895359
		 0.85553098 0.30101588 -0.55650347 0.77439868 0.50122505 -0.6025297 0.62107283 0.56726664
		 -0.64461851 0.51251882 0.56593031 -0.60112667 0.56424254 0.56726664 -0.64461851 0.51251882
		 0.61875415 -0.67276931 0.40561649 0.56593031 -0.60112667 0.56424254 0.56726664 -0.64461851
		 0.51251882 0.68029237 -0.63774472 0.36122558 0.61875415 -0.67276931 0.40561649 0.68029237
		 -0.63774472 0.36122558 0.68389821 -0.69566905 0.21983585 0.61875415 -0.67276931 0.40561649
		 0.68029237 -0.63774472 0.36122558 0.56726664 -0.64461851 0.51251882 0.66948342 -0.57591569
		 0.46916208 0.56726664 -0.64461851 0.51251882 0.50392032 -0.61096156 0.61056554 0.66948342
		 -0.57591569 0.46916208 0.66571611 0.66116691 -0.34594846 0.7034108 0.62330443 -0.3416208
		 0.67432106 0.65689319 -0.33731648 0.7034108 0.62330443 -0.3416208 0.71192688 0.61515325
		 -0.33874276 0.67432106 0.65689319 -0.33731648 0.88781506 -0.4541381 -0.074451387
		 0.9141947 -0.39514223 -0.090059273 0.88074434 -0.44626716 -0.15854022 0.9141947 -0.39514223
		 -0.090059273 0.91907173 -0.34422615 -0.19187368 0.88074434 -0.44626716 -0.15854022
		 0.81391865 -0.56645876 -0.12907723 0.84886909 -0.52644503 -0.047717161 0.88074434
		 -0.44626716 -0.15854022 0.84886909 -0.52644503 -0.047717161 0.88781506 -0.4541381
		 -0.074451387 0.88074434 -0.44626716 -0.15854022 0.78623915 -0.61425519 0.06722039
		 0.75157243 -0.65963441 0.0046215109 0.68389821 -0.69566905 0.21983585 0.75157243
		 -0.65963441 0.0046215109 0.69417828 -0.71369714 0.093557164 0.68389821 -0.69566905
		 0.21983585 0.81391865 -0.56645876 -0.12907723 0.75157243 -0.65963441 0.0046215109
		 0.84886909 -0.52644503 -0.047717161 0.75157243 -0.65963441 0.0046215109 0.78623915
		 -0.61425519 0.06722039 0.84886909 -0.52644503 -0.047717161 0.81938154 -0.54549026
		 -0.1762221 0.73042887 -0.68069965 -0.055872288 0.81391865 -0.56645876 -0.12907723
		 0.73042887 -0.68069965 -0.055872288 0.75157243 -0.65963441 0.0046215109 0.81391865
		 -0.56645876 -0.12907723;
	setAttr ".n[4980:5145]" -type "float3"  0.71044743 0.60859865 -0.35337245 0.71414864
		 0.60475481 -0.35251015 0.71310717 0.60654432 -0.35154256 0.71414864 0.60475481 -0.35251015
		 0.71625853 0.60345072 -0.35045815 0.71310717 0.60654432 -0.35154256 -0.35780936 0.92865992
		 -0.097791538 -0.46809345 0.87671947 -0.11068612 -0.28122997 0.95654869 -0.076969527
		 -0.46809345 0.87671947 -0.11068612 -0.27601728 0.95801836 -0.077558026 -0.28122997
		 0.95654869 -0.076969527 0.79013193 -0.59283513 0.1556858 0.78623915 -0.61425519 0.06722039
		 0.68389821 -0.69566905 0.21983585 -0.83874369 -0.13274075 0.5280993 -0.85152197 -0.38648582
		 0.35431486 -0.84358191 -0.15269114 0.51483488 -0.85152197 -0.38648582 0.35431486
		 -0.849778 -0.38864005 0.35614073 -0.84358191 -0.15269114 0.51483488 0.61110395 -0.51976138
		 0.59699255 0.65177745 -0.45854723 0.60408658 0.68891954 -0.40973327 0.59792012 0.65177745
		 -0.45854723 0.60408658 0.70094502 -0.38806212 0.59840107 0.68891954 -0.40973327 0.59792012
		 0.81264901 -0.51394463 0.27470443 0.84187806 -0.41726008 0.34225038 0.90672559 -0.40019855
		 0.13300301 0.84187806 -0.41726008 0.34225038 0.9301455 -0.2840606 0.23267767 0.90672559
		 -0.40019855 0.13300301 0.79013193 -0.59283513 0.1556858 0.81264901 -0.51394463 0.27470443
		 0.88521045 -0.46502122 0.012557453 0.81264901 -0.51394463 0.27470443 0.90672559 -0.40019855
		 0.13300301 0.88521045 -0.46502122 0.012557453 0.88521045 -0.46502122 0.012557453
		 0.84886909 -0.52644503 -0.047717161 0.79013193 -0.59283513 0.1556858 0.84886909 -0.52644503
		 -0.047717161 0.78623915 -0.61425519 0.06722039 0.79013193 -0.59283513 0.1556858 -0.56726664
		 -0.64461857 0.5125187 -0.50449312 -0.61063224 0.61042196 -0.50122488 -0.60252964
		 0.62107295 -0.50449312 -0.61063224 0.61042196 -0.4174799 -0.58068693 0.69893724 -0.50122488
		 -0.60252964 0.62107295 -0.69390869 -0.61758167 0.37024802 -0.64956242 -0.56560254
		 0.50809693 -0.56726664 -0.64461857 0.5125187 -0.64956242 -0.56560254 0.50809693 -0.50449312
		 -0.61063224 0.61042196 -0.56726664 -0.64461857 0.5125187 -0.62648195 -0.67408586
		 0.39131656 -0.56726664 -0.64461857 0.5125187 -0.56593013 -0.60112673 0.56424266 -0.56726664
		 -0.64461857 0.5125187 -0.50122488 -0.60252964 0.62107295 -0.56593013 -0.60112673
		 0.56424266 -0.68791437 -0.68155271 0.24951908 -0.69390869 -0.61758167 0.37024802
		 -0.62648195 -0.67408586 0.39131656 -0.69390869 -0.61758167 0.37024802 -0.56726664
		 -0.64461857 0.5125187 -0.62648195 -0.67408586 0.39131656 -0.30805421 -0.52883554
		 0.79084486 -0.42194641 -0.58782262 0.69023609 -0.30161199 -0.55574477 0.77471155
		 -0.16887671 -0.48919937 0.85566622 -0.12955745 -0.47123605 0.87243992 -0.30805421
		 -0.52883554 0.79084486 -0.12955745 -0.47123605 0.87243992 -0.24072877 -0.49322236
		 0.83593142 -0.30805421 -0.52883554 0.79084486 0.84345555 -0.15000275 0.51583129 0.83982152
		 -0.13512158 0.52577752 0.79544348 -0.016758094 0.60579604 0.83982152 -0.13512158
		 0.52577752 0.78355843 0.0064176577 0.62128496 0.79544348 -0.016758094 0.60579604
		 -0.67248189 -0.4191359 0.60999441 -0.65694159 -0.42287427 0.62418348 -0.66486955
		 -0.4268066 0.61301279 -0.65694159 -0.42287427 0.62418348 -0.64686763 -0.43477044
		 0.62652767 -0.66486955 -0.4268066 0.61301279 -0.92056596 -0.37973565 0.091428481
		 -0.90797877 -0.33900374 0.24627426 -0.87525612 -0.47335771 0.099293411 -0.90797877
		 -0.33900374 0.24627426 -0.86808842 -0.44404003 0.22192562 -0.87525612 -0.47335771
		 0.099293411 -0.87525612 -0.47335771 0.099293411 -0.86808842 -0.44404003 0.22192562
		 -0.85472596 -0.50365257 0.12560892 -0.86808842 -0.44404003 0.22192562 -0.86053807
		 -0.48004016 0.17039862 -0.85472596 -0.50365257 0.12560892 -0.85472596 -0.50365257
		 0.12560892 -0.86053807 -0.48004016 0.17039862 -0.91220772 -0.40779898 0.039712567
		 -0.86053807 -0.48004016 0.17039862 -0.87118334 -0.4780964 0.11163983 -0.91220772
		 -0.40779898 0.039712567 0.35638639 0.92904472 -0.099321157 0.28197029 0.95635796
		 -0.076630376 0.47107208 0.87495649 -0.1119919 0.28197029 0.95635796 -0.076630376
		 0.27705577 0.95775622 -0.077091351 0.47107208 0.87495649 -0.1119919 -0.71625888 0.60345107
		 -0.35045686 -0.71414876 0.60465193 -0.35268623 -0.71342742 0.60620093 -0.35148507
		 -0.71414876 0.60465193 -0.35268623 -0.71066809 0.60826373 -0.35350537 -0.71342742
		 0.60620093 -0.35148507 -0.79711467 -0.60289466 0.033559222 -0.75339526 -0.65675414
		 -0.032705158 -0.90957713 -0.40539381 -0.091242857 -0.75339526 -0.65675414 -0.032705158
		 -0.92696548 -0.27002645 -0.2604242 -0.90957713 -0.40539381 -0.091242857 -0.87118334
		 -0.4780964 0.11163983 -0.90957713 -0.40539381 -0.091242857 -0.91220772 -0.40779898
		 0.039712567 -0.90957713 -0.40539381 -0.091242857 -0.94860303 -0.2766856 -0.1536144
		 -0.91220772 -0.40779898 0.039712567 -0.66149753 -0.68423098 0.30700004 -0.62648195
		 -0.67408586 0.39131656 -0.64304936 -0.58069563 0.49927956 -0.62648195 -0.67408586
		 0.39131656 -0.56593013 -0.60112673 0.56424266 -0.64304936 -0.58069563 0.49927956
		 -0.68791437 -0.68155271 0.24951908 -0.62648195 -0.67408586 0.39131656 -0.70016509
		 -0.70296383 0.124943 -0.62648195 -0.67408586 0.39131656 -0.66149753 -0.68423098 0.30700004
		 -0.70016509 -0.70296383 0.124943 -0.70617557 -0.70771348 0.021393267 -0.70016509
		 -0.70296383 0.124943 -0.71521515 -0.66329634 0.22023894 -0.70016509 -0.70296383 0.124943
		 -0.66149753 -0.68423098 0.30700004 -0.71521515 -0.66329634 0.22023894 -0.70679861
		 -0.69232184 -0.1453487 -0.70841551 -0.70209795 -0.072152309 -0.71078163 -0.70237446
		 -0.038205586 -0.70841551 -0.70209795 -0.072152309 -0.70617557 -0.70771348 0.021393267
		 -0.71078163 -0.70237446 -0.038205586 -0.68791437 -0.68155271 0.24951908 -0.70016509
		 -0.70296383 0.124943 -0.77877641 -0.61276221 0.13427515 -0.70016509 -0.70296383 0.124943
		 -0.79711467 -0.60289466 0.033559222 -0.77877641 -0.61276221 0.13427515 -0.70016509
		 -0.70296383 0.124943 -0.75339526 -0.65675414 -0.032705158 -0.79711467 -0.60289466
		 0.033559222 -0.95091486 -0.11880712 -0.28573725;
	setAttr ".n[5146:5311]" -type "float3"  -0.94860303 -0.2766856 -0.1536144 -0.92696548
		 -0.27002645 -0.2604242 -0.94860303 -0.2766856 -0.1536144 -0.90957713 -0.40539381
		 -0.091242857 -0.92696548 -0.27002645 -0.2604242 -0.93838298 -0.32069081 0.12882055
		 -0.94532084 -0.30246815 0.12198975 -0.73957157 -0.55123562 0.38622946 -0.94532084
		 -0.30246815 0.12198975 -0.7812252 -0.51439792 0.35366929 -0.73957157 -0.55123562
		 0.38622946 -0.66899717 -0.58427984 0.45941254 -0.34780723 -0.70427561 0.61889088
		 -0.605304 -0.58354694 0.5413686 -0.34780723 -0.70427561 0.61889088 -0.29926378 -0.64756119
		 0.70078933 -0.605304 -0.58354694 0.5413686 -0.70258355 -0.59789497 0.38587296 -0.73957157
		 -0.55123562 0.38622946 -0.41219616 -0.70674402 0.57498449 -0.73957157 -0.55123562
		 0.38622946 -0.50098377 -0.62869781 0.59477252 -0.41219616 -0.70674402 0.57498449
		 -0.93083125 -0.34618571 0.11708372 -0.93838298 -0.32069081 0.12882055 -0.70258355
		 -0.59789497 0.38587296 -0.93838298 -0.32069081 0.12882055 -0.73957157 -0.55123562
		 0.38622946 -0.70258355 -0.59789497 0.38587296 -0.80061978 -0.55641729 0.22227867
		 -0.68791437 -0.68155271 0.24951908 -0.77877641 -0.61276221 0.13427515 -0.77877641
		 -0.61276221 0.13427515 -0.87118334 -0.4780964 0.11163983 -0.80061978 -0.55641729
		 0.22227867 -0.87118334 -0.4780964 0.11163983 -0.86053807 -0.48004016 0.17039862 -0.80061978
		 -0.55641729 0.22227867 -0.53850287 -0.59634423 0.5953052 -0.6111387 -0.50926143 0.60593915
		 -0.55841357 -0.57325959 0.59962296 -0.6111387 -0.50926143 0.60593915 -0.64138877
		 -0.4597483 0.6142084 -0.55841357 -0.57325959 0.59962296 -0.001662273 -0.45680934
		 0.88956308 -0.00099813403 -0.62827343 0.77799195 -0.00010996064 -0.4603259 0.88774997
		 -0.00099813403 -0.62827343 0.77799195 0 -0.64480311 0.76434869 -0.00010996064 -0.4603259
		 0.88774997 0.98587775 -0.12583847 -0.11049762 0.98435187 0.0063033937 -0.17610115
		 0.96979862 -0.023734571 -0.24274935 0.98435187 0.0063033937 -0.17610115 0.94987291
		 0.1108272 -0.29233336 0.96979862 -0.023734571 -0.24274935 0.94987291 0.1108272 -0.29233336
		 0.9169172 0.13778298 -0.37453797 0.96979862 -0.023734571 -0.24274935 0.9169172 0.13778298
		 -0.37453797 0.93137014 -0.051763251 -0.36037517 0.96979862 -0.023734571 -0.24274935
		 0.94987291 0.1108272 -0.29233336 0.89207023 0.25964049 -0.36986148 0.9169172 0.13778298
		 -0.37453797 0.89207023 0.25964049 -0.36986148 0.79221582 0.36309776 -0.49046317 0.9169172
		 0.13778298 -0.37453797 0.92502838 -0.14334965 -0.35181442 0.91770685 -0.2941469 -0.26700526
		 0.94648951 -0.18457772 -0.26474261 0.91770685 -0.2941469 -0.26700526 0.91907173 -0.34422615
		 -0.19187368 0.94648951 -0.18457772 -0.26474261 0.98587775 -0.12583847 -0.11049762
		 0.96979862 -0.023734571 -0.24274935 0.96844184 -0.21371609 -0.12824138 0.96979862
		 -0.023734571 -0.24274935 0.94648951 -0.18457772 -0.26474261 0.96844184 -0.21371609
		 -0.12824138 0.91907173 -0.34422615 -0.19187368 0.96844184 -0.21371609 -0.12824138
		 0.94648951 -0.18457772 -0.26474261 -0.8421036 -0.53925997 -0.0077600824 -0.87525612
		 -0.47335771 0.099293411 -0.79605806 -0.5959397 0.10558139 -0.87525612 -0.47335771
		 0.099293411 -0.85472596 -0.50365257 0.12560892 -0.79605806 -0.5959397 0.10558139
		 -0.88248169 -0.46918821 -0.032992579 -0.92056596 -0.37973565 0.091428481 -0.8421036
		 -0.53925997 -0.0077600824 -0.92056596 -0.37973565 0.091428481 -0.87525612 -0.47335771
		 0.099293411 -0.8421036 -0.53925997 -0.0077600824 -0.67226803 -0.43231627 0.60096449
		 -0.67248189 -0.4191359 0.60999441 -0.66948789 -0.43299505 0.60357368 -0.67248189
		 -0.4191359 0.60999441 -0.66486955 -0.4268066 0.61301279 -0.66948789 -0.43299505 0.60357368
		 0.64683652 0.20140633 0.73555285 0.68440616 0.15793434 0.71178997 0.78355843 0.0064176577
		 0.62128496 0.68440616 0.15793434 0.71178997 0.79544348 -0.016758094 0.60579604 0.78355843
		 0.0064176577 0.62128496 -0.94806212 0.035624702 -0.31608409 -0.98052412 -0.14094472
		 -0.13677351 -0.95091486 -0.11880712 -0.28573725 -0.98052412 -0.14094472 -0.13677351
		 -0.94860303 -0.2766856 -0.1536144 -0.95091486 -0.11880712 -0.28573725 -0.93191361
		 -0.35778713 0.059375178 -0.91220772 -0.40779898 0.039712567 -0.98052412 -0.14094472
		 -0.13677351 -0.91220772 -0.40779898 0.039712567 -0.94860303 -0.2766856 -0.1536144
		 -0.98052412 -0.14094472 -0.13677351 -0.80086201 -0.57534444 0.16612875 -0.85472596
		 -0.50365257 0.12560892 -0.93191361 -0.35778713 0.059375178 -0.85472596 -0.50365257
		 0.12560892 -0.91220772 -0.40779898 0.039712567 -0.93191361 -0.35778713 0.059375178
		 -0.79605806 -0.5959397 0.10558139 -0.85472596 -0.50365257 0.12560892 -0.80086201
		 -0.57534444 0.16612875 0.99920672 -0.039429139 0.0055972142 0.99884129 -0.042590592
		 -0.022409128 0.99845052 0.017415494 -0.05285177 0.99884129 -0.042590592 -0.022409128
		 0.99726993 0.0090507055 -0.073285475 0.99845052 0.017415494 -0.05285177 0.99884129
		 -0.042590592 -0.022409128 0.99592543 -0.065987624 -0.061466716 0.99726993 0.0090507055
		 -0.073285475 0.99592543 -0.065987624 -0.061466716 0.99455869 -0.019491998 -0.10233814
		 0.99726993 0.0090507055 -0.073285475 0.99592543 -0.065987624 -0.061466716 0.98891973
		 -0.10389588 -0.1060351 0.99455869 -0.019491998 -0.10233814 0.98891973 -0.10389588
		 -0.1060351 0.98868454 -0.064504348 -0.13543282 0.99455869 -0.019491998 -0.10233814
		 0.99742973 -0.069281936 0.018275481 0.99854934 -0.052945275 0.0098013068 0.99765497
		 0.0039275577 -0.068331093 0.99854934 -0.052945275 0.0098013068 0.99833912 0.010227256
		 -0.056695357 0.99765497 0.0039275577 -0.068331093 0.98891973 -0.10389588 -0.1060351
		 0.97028315 -0.18760987 -0.15281723 0.98868454 -0.064504348 -0.13543282 0.97028315
		 -0.18760987 -0.15281723 0.9741255 -0.14827041 -0.17057365 0.98868454 -0.064504348
		 -0.13543282 0.9613905 0.19663273 -0.19251972 0.99300951 0.064716294 -0.098710999
		 0.96690524 0.16734321 -0.19258898 0.99300951 0.064716294 -0.098710999 0.99259633
		 0.05307449 -0.10925005 0.96690524 0.16734321 -0.19258898 0.97221839 0.11331404 -0.2048201
		 0.96690524 0.16734321 -0.19258898;
	setAttr ".n[5312:5477]" -type "float3"  0.99174976 0.018404676 -0.12686089 0.96690524
		 0.16734321 -0.19258898 0.99259633 0.05307449 -0.10925005 0.99174976 0.018404676 -0.12686089
		 0.9676066 0.064224936 -0.24415694 0.97221839 0.11331404 -0.2048201 0.98640817 -0.018608412
		 -0.16325642 0.97221839 0.11331404 -0.2048201 0.99174976 0.018404676 -0.12686089 0.98640817
		 -0.018608412 -0.16325642 0.99005365 0.081190743 -0.11489934 0.99765497 0.0039275577
		 -0.068331093 0.99221611 0.067236632 -0.10481612 0.99765497 0.0039275577 -0.068331093
		 0.99833912 0.010227256 -0.056695357 0.99221611 0.067236632 -0.10481612 0.97058749
		 -0.082424134 -0.2261994 0.95724863 0.0030751403 -0.28925002 0.98640817 -0.018608412
		 -0.16325642 0.95724863 0.0030751403 -0.28925002 0.9676066 0.064224936 -0.24415694
		 0.98640817 -0.018608412 -0.16325642 0.9556306 0.21656448 -0.19967481 0.8875711 0.34191197
		 -0.30872923 0.94769126 0.22303414 -0.22833541 0.61167496 -0.55709314 0.5616948 0.79398781
		 -0.44336423 0.41594645 0.57124817 -0.55763233 0.60226387 0.99221611 0.067236632 -0.10481612
		 0.99833912 0.010227256 -0.056695357 0.99300951 0.064716294 -0.098710999 0.99833912
		 0.010227256 -0.056695357 0.99845052 0.017415494 -0.05285177 0.99300951 0.064716294
		 -0.098710999 0.99854934 -0.052945275 0.0098013068 0.99920672 -0.039429139 0.0055972142
		 0.99833912 0.010227256 -0.056695357 0.99920672 -0.039429139 0.0055972142 0.99845052
		 0.017415494 -0.05285177 0.99833912 0.010227256 -0.056695357 0.98849189 -0.10907687
		 0.10481438 0.99181116 -0.10112387 0.078003936 0.99854934 -0.052945275 0.0098013068
		 0.99181116 -0.10112387 0.078003936 0.99920672 -0.039429139 0.0055972142 0.99854934
		 -0.052945275 0.0098013068 0.95236969 -0.21862268 0.21259385 0.9527114 -0.23152786
		 0.19681422 0.98849189 -0.10907687 0.10481438 0.9527114 -0.23152786 0.19681422 0.99181116
		 -0.10112387 0.078003936 0.98849189 -0.10907687 0.10481438 0.9556306 0.21656448 -0.19967481
		 0.99221611 0.067236632 -0.10481612 0.9613905 0.19663273 -0.19251972 0.99221611 0.067236632
		 -0.10481612 0.99300951 0.064716294 -0.098710999 0.9613905 0.19663273 -0.19251972
		 -0.00023212653 -0.054265451 0.99852651 -0.00040330476 -0.075794563 0.99712336 -0.18478414
		 -0.053366818 0.98132908 -0.18478414 -0.053366818 0.98132908 -0.00040330476 -0.075794563
		 0.99712336 -0.19467403 -0.076370284 0.97789037 0.18531656 -0.053456482 0.98122382
		 0.36092412 -0.073994495 0.92965508 0.19567835 -0.0761237 0.97770911 0.19567835 -0.0761237
		 0.97770911 0.36092412 -0.073994495 0.92965508 0.36621115 -0.090698048 0.92610109
		 0.17828718 -0.11575329 0.97714627 0.35286242 -0.12141623 0.92776412 0.18531656 -0.053456482
		 0.98122382 0.18531656 -0.053456482 0.98122382 0.35286242 -0.12141623 0.92776412 0.36092412
		 -0.073994495 0.92965508 -0.46210364 -0.27920711 0.84172654 -0.62292427 -0.22755653
		 0.74845403 -0.50693315 -0.27122268 0.81820357 -0.50693315 -0.27122268 0.81820357
		 -0.62292427 -0.22755653 0.74845403 -0.64487427 -0.23600335 0.72693855 -0.51667219
		 -0.11415896 0.84853852 -0.53749067 -0.12579302 0.83383447 -0.65565902 -0.16405188
		 0.73701978 -0.65565902 -0.16405188 0.73701978 -0.53749067 -0.12579302 0.83383447
		 -0.65951771 -0.16586044 0.73316211 -0.17772716 -0.11537422 0.97729313 -0.18478414
		 -0.053366818 0.98132908 -0.35340846 -0.1215774 0.92753512 -0.35340846 -0.1215774
		 0.92753512 -0.18478414 -0.053366818 0.98132908 -0.3605594 -0.074506201 0.92975575
		 -0.35340846 -0.1215774 0.92753512 -0.3605594 -0.074506201 0.92975575 -0.50692272
		 -0.16564408 0.84592634 -0.50692272 -0.16564408 0.84592634 -0.3605594 -0.074506201
		 0.92975575 -0.51667219 -0.11415896 0.84853852 -0.00016755793 -0.1137844 0.99350548
		 -0.00023212653 -0.054265451 0.99852651 -0.17772716 -0.11537422 0.97729313 -0.17772716
		 -0.11537422 0.97729313 -0.00023212653 -0.054265451 0.99852651 -0.18478414 -0.053366818
		 0.98132908 -0.53445613 -0.23397557 0.81216508 -0.3547616 -0.22466049 0.90756369 -0.50693315
		 -0.27122268 0.81820357 -0.50693315 -0.27122268 0.81820357 -0.3547616 -0.22466049
		 0.90756369 -0.3191624 -0.27806228 0.90598935 0.53403181 -0.23570159 0.81194508 0.50696921
		 -0.27252999 0.81774664 0.35368818 -0.22545807 0.90778482 0.35368818 -0.22545807 0.90778482
		 0.50696921 -0.27252999 0.81774664 0.31761101 -0.27876565 0.90631837 0.50696921 -0.27252999
		 0.81774664 0.53403181 -0.23570159 0.81194508 0.64510244 -0.23624541 0.72665739 0.64510244
		 -0.23624541 0.72665739 0.53403181 -0.23570159 0.81194508 0.65582258 -0.21891651 0.72247648
		 -0.53445613 -0.23397557 0.81216508 -0.54351324 -0.17077732 0.82184458 -0.3547616
		 -0.22466049 0.90756369 -0.3547616 -0.22466049 0.90756369 -0.54351324 -0.17077732
		 0.82184458 -0.36974683 -0.14976081 0.9169836 -0.18962458 -0.21230957 0.95862776 -0.19849926
		 -0.13927267 0.97015524 -4.579389e-06 -0.20536305 0.97868586 -4.579389e-06 -0.20536305
		 0.97868586 -0.19849926 -0.13927267 0.97015524 -2.4438816e-05 -0.13617381 0.99068499
		 0.20005243 -0.13873513 0.96991318 0.37054855 -0.14943115 0.91671377 0.19124611 -0.21198665
		 0.95837706 0.19124611 -0.21198665 0.95837706 0.37054855 -0.14943115 0.91671377 0.35368818
		 -0.22545807 0.90778482 0.65582258 -0.21891651 0.72247648 0.53403181 -0.23570159 0.81194508
		 0.6613012 -0.18672158 0.72650927 0.6613012 -0.18672158 0.72650927 0.53403181 -0.23570159
		 0.81194508 0.54291487 -0.17168413 0.82205111 -0.00016755793 -0.1137844 0.99350548
		 0.17828718 -0.11575329 0.97714627 -0.00023212653 -0.054265451 0.99852651 -0.00023212653
		 -0.054265451 0.99852651 0.17828718 -0.11575329 0.97714627 0.18531656 -0.053456482
		 0.98122382 0.19567835 -0.0761237 0.97770911 -0.00040330476 -0.075794563 0.99712336
		 0.18531656 -0.053456482 0.98122382 0.18531656 -0.053456482 0.98122382 -0.00040330476
		 -0.075794563 0.99712336 -0.00023212653 -0.054265451 0.99852651 0.19124611 -0.21198665
		 0.95837706 -4.579389e-06 -0.20536305 0.97868586 0.20005243 -0.13873513 0.96991318
		 0.20005243 -0.13873513 0.96991318 -4.579389e-06 -0.20536305 0.97868586 -2.4438816e-05
		 -0.13617381 0.99068499;
	setAttr ".n[5478:5643]" -type "float3"  -0.18478414 -0.053366818 0.98132908 -0.19467403
		 -0.076370284 0.97789037 -0.3605594 -0.074506201 0.92975575 -0.3605594 -0.074506201
		 0.92975575 -0.19467403 -0.076370284 0.97789037 -0.36602008 -0.090822712 0.92616439
		 -0.19849926 -0.13927267 0.97015524 -0.18962458 -0.21230957 0.95862776 -0.36974683
		 -0.14976081 0.9169836 -0.36974683 -0.14976081 0.9169836 -0.18962458 -0.21230957 0.95862776
		 -0.3547616 -0.22466049 0.90756369 -0.54351324 -0.17077732 0.82184458 -0.53445613
		 -0.23397557 0.81216508 -0.66206652 -0.18624362 0.72593474 -0.66206652 -0.18624362
		 0.72593474 -0.53445613 -0.23397557 0.81216508 -0.65620953 -0.21840483 0.72227997
		 -0.50693315 -0.27122268 0.81820357 -0.64487427 -0.23600335 0.72693855 -0.53445613
		 -0.23397557 0.81216508 -0.53445613 -0.23397557 0.81216508 -0.64487427 -0.23600335
		 0.72693855 -0.65620953 -0.21840483 0.72227997 0.37054855 -0.14943115 0.91671377 0.54291487
		 -0.17168413 0.82205111 0.35368818 -0.22545807 0.90778482 0.35368818 -0.22545807 0.90778482
		 0.54291487 -0.17168413 0.82205111 0.53403181 -0.23570159 0.81194508 0.6613012 -0.18672158
		 0.72650927 0.54291487 -0.17168413 0.82205111 0.65793276 -0.16594417 0.73456591 0.65793276
		 -0.16594417 0.73456591 0.54291487 -0.17168413 0.82205111 0.53740299 -0.12647058 0.83378845
		 0.36621115 -0.090698048 0.92610109 0.53740299 -0.12647058 0.83378845 0.37054855 -0.14943115
		 0.91671377 0.37054855 -0.14943115 0.91671377 0.53740299 -0.12647058 0.83378845 0.54291487
		 -0.17168413 0.82205111 0.19567835 -0.0761237 0.97770911 0.36621115 -0.090698048 0.92610109
		 0.20005243 -0.13873513 0.96991318 0.20005243 -0.13873513 0.96991318 0.36621115 -0.090698048
		 0.92610109 0.37054855 -0.14943115 0.91671377 -0.00040330476 -0.075794563 0.99712336
		 0.19567835 -0.0761237 0.97770911 -2.4438816e-05 -0.13617381 0.99068499 -2.4438816e-05
		 -0.13617381 0.99068499 0.19567835 -0.0761237 0.97770911 0.20005243 -0.13873513 0.96991318
		 -0.19849926 -0.13927267 0.97015524 -0.19467403 -0.076370284 0.97789037 -2.4438816e-05
		 -0.13617381 0.99068499 -2.4438816e-05 -0.13617381 0.99068499 -0.19467403 -0.076370284
		 0.97789037 -0.00040330476 -0.075794563 0.99712336 -0.19467403 -0.076370284 0.97789037
		 -0.19849926 -0.13927267 0.97015524 -0.36602008 -0.090822712 0.92616439 -0.36602008
		 -0.090822712 0.92616439 -0.19849926 -0.13927267 0.97015524 -0.36974683 -0.14976081
		 0.9169836 -0.54351324 -0.17077732 0.82184458 -0.53749067 -0.12579302 0.83383447 -0.36974683
		 -0.14976081 0.9169836 -0.36974683 -0.14976081 0.9169836 -0.53749067 -0.12579302 0.83383447
		 -0.36602008 -0.090822712 0.92616439 -0.53749067 -0.12579302 0.83383447 -0.54351324
		 -0.17077732 0.82184458 -0.65951771 -0.16586044 0.73316211 -0.65951771 -0.16586044
		 0.73316211 -0.54351324 -0.17077732 0.82184458 -0.66206652 -0.18624362 0.72593474
		 -0.3605594 -0.074506201 0.92975575 -0.36602008 -0.090822712 0.92616439 -0.51667219
		 -0.11415896 0.84853852 -0.51667219 -0.11415896 0.84853852 -0.36602008 -0.090822712
		 0.92616439 -0.53749067 -0.12579302 0.83383447 0.35286242 -0.12141623 0.92776412 0.50717872
		 -0.16427046 0.84604079 0.36092412 -0.073994495 0.92965508 0.36092412 -0.073994495
		 0.92965508 0.50717872 -0.16427046 0.84604079 0.51694053 -0.11286481 0.84854817 0.36092412
		 -0.073994495 0.92965508 0.51694053 -0.11286481 0.84854817 0.36621115 -0.090698048
		 0.92610109 0.36621115 -0.090698048 0.92610109 0.51694053 -0.11286481 0.84854817 0.53740299
		 -0.12647058 0.83378845 0.51694053 -0.11286481 0.84854817 0.6540947 -0.16415186 0.73838627
		 0.53740299 -0.12647058 0.83378845 0.53740299 -0.12647058 0.83378845 0.6540947 -0.16415186
		 0.73838627 0.65793276 -0.16594417 0.73456591 0.6540947 -0.16415186 0.73838627 0.51694053
		 -0.11286481 0.84854817 0.62987006 -0.20124289 0.75017661 0.62987006 -0.20124289 0.75017661
		 0.51694053 -0.11286481 0.84854817 0.50717872 -0.16427046 0.84604079 -0.50692272 -0.16564408
		 0.84592634 -0.51667219 -0.11415896 0.84853852 -0.63118929 -0.2043373 0.74822879 -0.63118929
		 -0.2043373 0.74822879 -0.51667219 -0.11415896 0.84853852 -0.65565902 -0.16405188
		 0.73701978 0.59000885 -0.18982364 0.7847653 0.53004152 -0.15187888 0.83425945 0.40839505
		 -0.27482226 0.87045169 0.40839505 -0.27482226 0.87045169 0.53004152 -0.15187888 0.83425945
		 0.37517846 -0.21042758 0.9027521 -0.3547616 -0.22466049 0.90756369 -0.18962458 -0.21230957
		 0.95862776 -0.3191624 -0.27806228 0.90598935 -0.3191624 -0.27806228 0.90598935 -0.18962458
		 -0.21230957 0.95862776 -0.1689273 -0.27055258 0.94776839 0.35368818 -0.22545807 0.90778482
		 0.31761101 -0.27876565 0.90631837 0.19124611 -0.21198665 0.95837706 0.19124611 -0.21198665
		 0.95837706 0.31761101 -0.27876565 0.90631837 0.16988601 -0.27053687 0.9476015 0.19124611
		 -0.21198665 0.95837706 0.16988601 -0.27053687 0.9476015 -4.579389e-06 -0.20536305
		 0.97868586 -4.579389e-06 -0.20536305 0.97868586 0.16988601 -0.27053687 0.9476015
		 0.00049100752 -0.2642101 0.96446502 0.00049100752 -0.2642101 0.96446502 -0.1689273
		 -0.27055258 0.94776839 -4.579389e-06 -0.20536305 0.97868586 -4.579389e-06 -0.20536305
		 0.97868586 -0.1689273 -0.27055258 0.94776839 -0.18962458 -0.21230957 0.95862776 -0.13012503
		 -0.32267326 0.93752307 0.00048660766 -0.32613274 0.94532388 -0.12231718 -0.25012863
		 0.96045518 -0.12231718 -0.25012863 0.96045518 0.00048660766 -0.32613274 0.94532388
		 0.00023809724 -0.25885412 0.9659164 0.13087921 -0.3228555 0.93735528 0.12293234 -0.25010043
		 0.96038401 0.00048660766 -0.32613274 0.94532388 0.00048660766 -0.32613274 0.94532388
		 0.12293234 -0.25010043 0.96038401 0.00023809724 -0.25885412 0.9659164 -0.12231718
		 -0.25012863 0.96045518 -0.2459424 -0.23739985 0.93976253 -0.13012503 -0.32267326
		 0.93752307 -0.13012503 -0.32267326 0.93752307 -0.2459424 -0.23739985 0.93976253 -0.26140428
		 -0.31279165 0.9131425 0.12293234 -0.25010043 0.96038401 0.13087921 -0.3228555 0.93735528
		 0.24637519 -0.23798141 0.93950206 0.24637519 -0.23798141 0.93950206;
	setAttr ".n[5644:5809]" -type "float3"  0.13087921 -0.3228555 0.93735528 0.26118359
		 -0.31249976 0.91330558 0.24637519 -0.23798141 0.93950206 0.26118359 -0.31249976 0.91330558
		 0.37517846 -0.21042758 0.9027521 0.37517846 -0.21042758 0.9027521 0.26118359 -0.31249976
		 0.91330558 0.40839505 -0.27482226 0.87045169 -0.14592117 -0.31929818 0.93635231 -0.28485143
		 -0.31415522 0.90563029 -0.1689273 -0.27055258 0.94776839 -0.1689273 -0.27055258 0.94776839
		 -0.28485143 -0.31415522 0.90563029 -0.3191624 -0.27806228 0.90598935 0.00051546155
		 -0.31722647 0.94834965 -0.14592117 -0.31929818 0.93635231 0.00049100752 -0.2642101
		 0.96446502 0.00049100752 -0.2642101 0.96446502 -0.14592117 -0.31929818 0.93635231
		 -0.1689273 -0.27055258 0.94776839 0.16988601 -0.27053687 0.9476015 0.14680211 -0.31929654
		 0.93621516 0.00049100752 -0.2642101 0.96446502 0.00049100752 -0.2642101 0.96446502
		 0.14680211 -0.31929654 0.93621516 0.00051546155 -0.31722647 0.94834965 0.14680211
		 -0.31929654 0.93621516 0.16988601 -0.27053687 0.9476015 0.28340176 -0.31427929 0.90604192
		 0.28340176 -0.31427929 0.90604192 0.16988601 -0.27053687 0.9476015 0.31761101 -0.27876565
		 0.90631837 0.28340176 -0.31427929 0.90604192 0.31761101 -0.27876565 0.90631837 0.46157613
		 -0.27889916 0.84211802 0.46157613 -0.27889916 0.84211802 0.31761101 -0.27876565 0.90631837
		 0.50696921 -0.27252999 0.81774664 0.64510244 -0.23624541 0.72665739 0.62394047 -0.22677031
		 0.74784589 0.50696921 -0.27252999 0.81774664 0.50696921 -0.27252999 0.81774664 0.62394047
		 -0.22677031 0.74784589 0.46157613 -0.27889916 0.84211802 -0.62292427 -0.22755653
		 0.74845403 -0.46210364 -0.27920711 0.84172654 -0.5907889 -0.19021317 0.78408384 -0.5907889
		 -0.19021317 0.78408384 -0.46210364 -0.27920711 0.84172654 -0.41043133 -0.27567658
		 0.86922294 -0.28485143 -0.31415522 0.90563029 -0.46210364 -0.27920711 0.84172654
		 -0.3191624 -0.27806228 0.90598935 -0.3191624 -0.27806228 0.90598935 -0.46210364 -0.27920711
		 0.84172654 -0.50693315 -0.27122268 0.81820357 -0.41043133 -0.27567658 0.86922294
		 -0.26140428 -0.31279165 0.9131425 -0.3750228 -0.21139589 0.90259051 -0.3750228 -0.21139589
		 0.90259051 -0.26140428 -0.31279165 0.9131425 -0.2459424 -0.23739985 0.93976253 -0.46210364
		 -0.27920711 0.84172654 -0.28485143 -0.31415522 0.90563029 -0.41043133 -0.27567658
		 0.86922294 -0.41043133 -0.27567658 0.86922294 -0.28485143 -0.31415522 0.90563029
		 -0.26140428 -0.31279165 0.9131425 -0.13012503 -0.32267326 0.93752307 -0.26140428
		 -0.31279165 0.9131425 -0.14592117 -0.31929818 0.93635231 -0.14592117 -0.31929818
		 0.93635231 -0.26140428 -0.31279165 0.9131425 -0.28485143 -0.31415522 0.90563029 0.00048660766
		 -0.32613274 0.94532388 -0.13012503 -0.32267326 0.93752307 0.00051546155 -0.31722647
		 0.94834965 0.00051546155 -0.31722647 0.94834965 -0.13012503 -0.32267326 0.93752307
		 -0.14592117 -0.31929818 0.93635231 0.14680211 -0.31929654 0.93621516 0.13087921 -0.3228555
		 0.93735528 0.00051546155 -0.31722647 0.94834965 0.00051546155 -0.31722647 0.94834965
		 0.13087921 -0.3228555 0.93735528 0.00048660766 -0.32613274 0.94532388 0.13087921
		 -0.3228555 0.93735528 0.14680211 -0.31929654 0.93621516 0.26118359 -0.31249976 0.91330558
		 0.26118359 -0.31249976 0.91330558 0.14680211 -0.31929654 0.93621516 0.28340176 -0.31427929
		 0.90604192 0.26118359 -0.31249976 0.91330558 0.28340176 -0.31427929 0.90604192 0.40839505
		 -0.27482226 0.87045169 0.40839505 -0.27482226 0.87045169 0.28340176 -0.31427929 0.90604192
		 0.46157613 -0.27889916 0.84211802 0.62394047 -0.22677031 0.74784589 0.59000885 -0.18982364
		 0.7847653 0.46157613 -0.27889916 0.84211802 0.46157613 -0.27889916 0.84211802 0.59000885
		 -0.18982364 0.7847653 0.40839505 -0.27482226 0.87045169 -0.5907889 -0.19021317 0.78408384
		 -0.41043133 -0.27567658 0.86922294 -0.53096557 -0.15271167 0.83351946 -0.53096557
		 -0.15271167 0.83351946 -0.41043133 -0.27567658 0.86922294 -0.3750228 -0.21139589
		 0.90259051 0.66500455 0.15795948 0.72994363 0.53306389 0.20010805 0.82207036 0.53004152
		 -0.15187888 0.83425945 0.53004152 -0.15187888 0.83425945 0.53306389 0.20010805 0.82207036
		 0.37517846 -0.21042758 0.9027521 0.53306389 0.20010805 0.82207036 0.37346143 0.22229357
		 0.90061766 0.37517846 -0.21042758 0.9027521 0.37517846 -0.21042758 0.9027521 0.37346143
		 0.22229357 0.90061766 0.24637519 -0.23798141 0.93950206 0.19302225 0.25481811 0.94752842
		 -0.00013867521 0.2623567 0.96497095 0.12293234 -0.25010043 0.96038401 0.12293234
		 -0.25010043 0.96038401 -0.00013867521 0.2623567 0.96497095 0.00023809724 -0.25885412
		 0.9659164 0.25237843 -0.63117743 0.73343045 0.48624721 -0.58798587 0.64640254 0.17828718
		 -0.11575329 0.97714627 0.17828718 -0.11575329 0.97714627 0.48624721 -0.58798587 0.64640254
		 0.35286242 -0.12141623 0.92776412 0.65957421 -0.52810347 0.53485382 0.50717872 -0.16427046
		 0.84604079 0.48624721 -0.58798587 0.64640254 0.48624721 -0.58798587 0.64640254 0.50717872
		 -0.16427046 0.84604079 0.35286242 -0.12141623 0.92776412 -1.1081309e-05 -0.61910087
		 0.78531152 0.25237843 -0.63117743 0.73343045 -0.00016755793 -0.1137844 0.99350548
		 -0.00016755793 -0.1137844 0.99350548 0.25237843 -0.63117743 0.73343045 0.17828718
		 -0.11575329 0.97714627 0.75955433 -0.45584241 0.46398813 0.62987006 -0.20124289 0.75017661
		 0.65957421 -0.52810347 0.53485382 0.65957421 -0.52810347 0.53485382 0.62987006 -0.20124289
		 0.75017661 0.50717872 -0.16427046 0.84604079 0.84927577 -0.38672286 0.35941085 0.6540947
		 -0.16415186 0.73838627 0.75955433 -0.45584241 0.46398813 0.75955433 -0.45584241 0.46398813
		 0.6540947 -0.16415186 0.73838627 0.62987006 -0.20124289 0.75017661 -0.19275536 0.25337106
		 0.94797075 -0.12231718 -0.25012863 0.96045518 -0.00013867521 0.2623567 0.96497095
		 -0.00013867521 0.2623567 0.96497095 -0.12231718 -0.25012863 0.96045518 0.00023809724
		 -0.25885412 0.9659164 -0.53146321 0.19640996 0.82399637 -0.3750228 -0.21139589 0.90259051;
	setAttr ".n[5810:5975]" -type "float3"  -0.37371653 0.22269444 0.90041274 -0.37371653
		 0.22269444 0.90041274 -0.3750228 -0.21139589 0.90259051 -0.2459424 -0.23739985 0.93976253
		 -0.66706169 0.16273378 0.72701204 -0.53096557 -0.15271167 0.83351946 -0.53146321
		 0.19640996 0.82399637 -0.53146321 0.19640996 0.82399637 -0.53096557 -0.15271167 0.83351946
		 -0.3750228 -0.21139589 0.90259051 -0.85317665 0.070078336 0.51689321 -0.62292427
		 -0.22755653 0.74845403 -0.77709448 0.13477702 0.61478394 -0.77709448 0.13477702 0.61478394
		 -0.62292427 -0.22755653 0.74845403 -0.5907889 -0.19021317 0.78408384 -0.91463107
		 0.009812952 0.40417033 -0.64487427 -0.23600335 0.72693855 -0.85317665 0.070078336
		 0.51689321 -0.85317665 0.070078336 0.51689321 -0.64487427 -0.23600335 0.72693855
		 -0.62292427 -0.22755653 0.74845403 -0.94814426 -0.18008016 0.26190373 -0.90823257
		 -0.29116482 0.30056056 -0.66206652 -0.18624362 0.72593474 -0.66206652 -0.18624362
		 0.72593474 -0.90823257 -0.29116482 0.30056056 -0.65951771 -0.16586044 0.73316211
		 -0.90823257 -0.29116482 0.30056056 -0.85031408 -0.38868654 0.35480803 -0.65951771
		 -0.16586044 0.73316211 -0.65951771 -0.16586044 0.73316211 -0.85031408 -0.38868654
		 0.35480803 -0.65565902 -0.16405188 0.73701978 -0.85031408 -0.38868654 0.35480803
		 -0.76197439 -0.46288791 0.45291254 -0.65565902 -0.16405188 0.73701978 -0.65565902
		 -0.16405188 0.73701978 -0.76197439 -0.46288791 0.45291254 -0.63118929 -0.2043373
		 0.74822879 -0.94814426 -0.18008016 0.26190373 -0.66206652 -0.18624362 0.72593474
		 -0.95052665 -0.074735895 0.30151883 -0.95052665 -0.074735895 0.30151883 -0.66206652
		 -0.18624362 0.72593474 -0.65620953 -0.21840483 0.72227997 -0.65998846 -0.53541827
		 0.52701283 -0.48542133 -0.58857781 0.64648461 -0.50692272 -0.16564408 0.84592634
		 -0.50692272 -0.16564408 0.84592634 -0.48542133 -0.58857781 0.64648461 -0.35340846
		 -0.1215774 0.92753512 -0.25235975 -0.6311959 0.73342097 -0.17772716 -0.11537422 0.97729313
		 -0.48542133 -0.58857781 0.64648461 -0.48542133 -0.58857781 0.64648461 -0.17772716
		 -0.11537422 0.97729313 -0.35340846 -0.1215774 0.92753512 -1.1081309e-05 -0.61910087
		 0.78531152 -0.00016755793 -0.1137844 0.99350548 -0.25235975 -0.6311959 0.73342097
		 -0.25235975 -0.6311959 0.73342097 -0.00016755793 -0.1137844 0.99350548 -0.17772716
		 -0.11537422 0.97729313 -0.76197439 -0.46288791 0.45291254 -0.65998846 -0.53541827
		 0.52701283 -0.63118929 -0.2043373 0.74822879 -0.63118929 -0.2043373 0.74822879 -0.65998846
		 -0.53541827 0.52701283 -0.50692272 -0.16564408 0.84592634 -0.95052665 -0.074735895
		 0.30151883 -0.65620953 -0.21840483 0.72227997 -0.91463107 0.009812952 0.40417033
		 -0.91463107 0.009812952 0.40417033 -0.65620953 -0.21840483 0.72227997 -0.64487427
		 -0.23600335 0.72693855 0.85403085 0.072134726 0.51519698 0.77298194 0.12765272 0.62145287
		 0.62394047 -0.22677031 0.74784589 0.62394047 -0.22677031 0.74784589 0.77298194 0.12765272
		 0.62145287 0.59000885 -0.18982364 0.7847653 0.91584915 0.011287354 0.40136385 0.85403085
		 0.072134726 0.51519698 0.64510244 -0.23624541 0.72665739 0.64510244 -0.23624541 0.72665739
		 0.85403085 0.072134726 0.51519698 0.62394047 -0.22677031 0.74784589 0.90591639 -0.29030457
		 0.30828348 0.65793276 -0.16594417 0.73456591 0.84927577 -0.38672286 0.35941085 0.84927577
		 -0.38672286 0.35941085 0.65793276 -0.16594417 0.73456591 0.6540947 -0.16415186 0.73838627
		 0.94773877 -0.18050161 0.26307866 0.6613012 -0.18672158 0.72650927 0.90591639 -0.29030457
		 0.30828348 0.90591639 -0.29030457 0.30828348 0.6613012 -0.18672158 0.72650927 0.65793276
		 -0.16594417 0.73456591 0.94773877 -0.18050161 0.26307866 0.95059848 -0.075025454
		 0.30122033 0.6613012 -0.18672158 0.72650927 0.6613012 -0.18672158 0.72650927 0.95059848
		 -0.075025454 0.30122033 0.65582258 -0.21891651 0.72247648 0.95059848 -0.075025454
		 0.30122033 0.91584915 0.011287354 0.40136385 0.65582258 -0.21891651 0.72247648 0.65582258
		 -0.21891651 0.72247648 0.91584915 0.011287354 0.40136385 0.64510244 -0.23624541 0.72665739
		 -0.82585567 -0.52158868 -0.21426073 -0.68961793 -0.67576855 -0.26031503 -0.82331222
		 -0.5417766 -0.16921911 -0.82331222 -0.5417766 -0.16921911 -0.68961793 -0.67576855
		 -0.26031503 -0.68388832 -0.70274276 -0.19608526 0.82331318 -0.54177821 -0.1692092
		 0.82585567 -0.52158862 -0.21426101 0.92425954 -0.36260659 -0.11941828 0.92425954
		 -0.36260659 -0.11941828 0.82585567 -0.52158862 -0.21426101 0.92512214 -0.35047013
		 -0.14601274 -8.6267892e-07 -0.98556447 -0.16930069 -3.1045602e-07 -0.96570492 -0.259642
		 0.17550375 -0.96855807 -0.1763341 0.17550375 -0.96855807 -0.1763341 -3.1045602e-07
		 -0.96570492 -0.259642 0.190558 -0.94413209 -0.26889071 -0.68961793 -0.67576855 -0.26031503
		 -0.53688169 -0.7957238 -0.28032419 -0.68388832 -0.70274276 -0.19608526 -0.68388832
		 -0.70274276 -0.19608526 -0.53688169 -0.7957238 -0.28032419 -0.53172362 -0.82287788
		 -0.20035475 0.68388933 -0.70275885 -0.1960239 0.68961817 -0.6757682 -0.26031554 0.82331318
		 -0.54177821 -0.1692092 0.82331318 -0.54177821 -0.1692092 0.68961817 -0.6757682 -0.26031554
		 0.82585567 -0.52158862 -0.21426101 -0.53688169 -0.7957238 -0.28032419 -0.36999646
		 -0.88594502 -0.27964994 -0.53172362 -0.82287788 -0.20035475 -0.53172362 -0.82287788
		 -0.20035475 -0.36999646 -0.88594502 -0.27964994 -0.35803533 -0.91413486 -0.19017918
		 0.68961817 -0.6757682 -0.26031554 0.68388933 -0.70275885 -0.1960239 0.53688151 -0.79572374
		 -0.28032479 0.53688151 -0.79572374 -0.28032479 0.68388933 -0.70275885 -0.1960239
		 0.53175455 -0.82287854 -0.20026992 -0.17550887 -0.96855807 -0.17632902 -0.35803533
		 -0.91413486 -0.19017918 -0.19055866 -0.94413215 -0.26889008 -0.19055866 -0.94413215
		 -0.26889008 -0.35803533 -0.91413486 -0.19017918 -0.36999646 -0.88594502 -0.27964994
		 0.53688151 -0.79572374 -0.28032479 0.53175455 -0.82287854 -0.20026992 0.36999604
		 -0.88594502 -0.27965042 0.36999604 -0.88594502 -0.27965042 0.53175455 -0.82287854
		 -0.20026992 0.3580741 -0.91412437 -0.19015688;
	setAttr ".n[5976:6141]" -type "float3"  -0.9827438 -0.17353094 -0.064043701 -0.92512244
		 -0.35046938 -0.14601281 -0.9850297 -0.1653185 -0.048849404 -0.9850297 -0.1653185
		 -0.048849404 -0.92512244 -0.35046938 -0.14601281 -0.92425919 -0.36260539 -0.11942492
		 0.36999604 -0.88594502 -0.27965042 0.3580741 -0.91412437 -0.19015688 0.190558 -0.94413209
		 -0.26889071 0.190558 -0.94413209 -0.26889071 0.3580741 -0.91412437 -0.19015688 0.17550375
		 -0.96855807 -0.1763341 0.98274374 -0.17353162 -0.064042836 0.99979985 -0.020005144
		 -8.654365e-06 0.98502958 -0.16532035 -0.048845481 -0.92512244 -0.35046938 -0.14601281
		 -0.82585567 -0.52158868 -0.21426073 -0.92425919 -0.36260539 -0.11942492 -0.92425919
		 -0.36260539 -0.11942492 -0.82585567 -0.52158868 -0.21426073 -0.82331222 -0.5417766
		 -0.16921911 -8.6267892e-07 -0.98556447 -0.16930069 -0.17550887 -0.96855807 -0.17632902
		 -3.1045602e-07 -0.96570492 -0.259642 -3.1045602e-07 -0.96570492 -0.259642 -0.17550887
		 -0.96855807 -0.17632902 -0.19055866 -0.94413215 -0.26889008 0.92425954 -0.36260659
		 -0.11941828 0.92512214 -0.35047013 -0.14601274 0.98502958 -0.16532035 -0.048845481
		 0.98502958 -0.16532035 -0.048845481 0.92512214 -0.35047013 -0.14601274 0.98274374
		 -0.17353162 -0.064042836 -0.9827438 -0.17353094 -0.064043701 -0.9850297 -0.1653185
		 -0.048849404 -0.99979991 -0.02000485 -8.8203005e-06 -0.99979991 -0.02000485 -8.8203005e-06
		 -0.9850297 -0.1653185 -0.048849404 -0.99967945 0.0046092304 0.02489385 -0.99967945
		 0.0046092304 0.02489385 -0.9850297 -0.1653185 -0.048849404 -0.98607475 -0.16506045
		 -0.020289164 0.99979985 -0.020005144 -8.654365e-06 0.99967986 0.0045940261 0.024879837
		 0.98502958 -0.16532035 -0.048845481 0.98502958 -0.16532035 -0.048845481 0.99967986
		 0.0045940261 0.024879837 0.98607355 -0.16508797 -0.020121446 0.99979985 -0.020005144
		 -8.654365e-06 0.98792142 0.14317748 0.059257731 0.99967986 0.0045940261 0.024879837
		 0.99967986 0.0045940261 0.024879837 0.98792142 0.14317748 0.059257731 0.97708696
		 0.18197863 0.11038506 -0.82331222 -0.5417766 -0.16921911 -0.68388832 -0.70274276
		 -0.19608526 -0.84453672 -0.5318898 -0.062055841 -0.84453672 -0.5318898 -0.062055841
		 -0.68388832 -0.70274276 -0.19608526 -0.71464962 -0.69683558 -0.060795546 0.98792142
		 0.14317748 0.059257731 0.94586945 0.29202005 0.14161657 0.97708696 0.18197863 0.11038506
		 0.97708696 0.18197863 0.11038506 0.94586945 0.29202005 0.14161657 0.9219147 0.32185042
		 0.21560517 0.92425954 -0.36260659 -0.11941828 0.93639958 -0.34837872 -0.042285495
		 0.82331318 -0.54177821 -0.1692092 0.82331318 -0.54177821 -0.1692092 0.93639958 -0.34837872
		 -0.042285495 0.84460104 -0.53184879 -0.06153046 0.17550375 -0.96855807 -0.1763341
		 0.18345518 -0.98301864 -0.0043018237 -8.6267892e-07 -0.98556447 -0.16930069 -8.6267892e-07
		 -0.98556447 -0.16930069 0.18345518 -0.98301864 -0.0043018237 7.2400508e-06 -0.99999422
		 0.0033927732 -0.68388832 -0.70274276 -0.19608526 -0.53172362 -0.82287788 -0.20035475
		 -0.71464962 -0.69683558 -0.060795546 -0.71464962 -0.69683558 -0.060795546 -0.53172362
		 -0.82287788 -0.20035475 -0.5661363 -0.82284099 -0.049217846 0.74168551 0.57852089
		 0.33943513 0.5873152 0.69577211 0.4134756 0.70601887 0.56867754 0.42207012 0.70601887
		 0.56867754 0.42207012 0.5873152 0.69577211 0.4134756 0.55151862 0.67345387 0.49222672
		 0.82331318 -0.54177821 -0.1692092 0.84460104 -0.53184879 -0.06153046 0.68388933 -0.70275885
		 -0.1960239 0.68388933 -0.70275885 -0.1960239 0.84460104 -0.53184879 -0.06153046 0.71516764
		 -0.6964888 -0.058639437 -0.98792154 0.14317212 0.059268456 -0.9770726 0.18177967
		 0.11083881 -0.94587272 0.29199788 0.14164044 -0.94587272 0.29199788 0.14164044 -0.9770726
		 0.18177967 0.11083881 -0.92208213 0.32114401 0.21594234 0.5873152 0.69577211 0.4134756
		 0.40571824 0.78513932 0.46791986 0.55151862 0.67345387 0.49222672 0.55151862 0.67345387
		 0.49222672 0.40571824 0.78513932 0.46791986 0.37670907 0.74324107 0.55288601 -0.99979991
		 -0.02000485 -8.8203005e-06 -0.99967945 0.0046092304 0.02489385 -0.98792154 0.14317212
		 0.059268456 -0.98792154 0.14317212 0.059268456 -0.99967945 0.0046092304 0.02489385
		 -0.9770726 0.18177967 0.11083881 -0.53172362 -0.82287788 -0.20035475 -0.35803533
		 -0.91413486 -0.19017918 -0.5661363 -0.82284099 -0.049217846 -0.5661363 -0.82284099
		 -0.049217846 -0.35803533 -0.91413486 -0.19017918 -0.3797709 -0.92462087 -0.029160324
		 0.94586945 0.29202005 0.14161657 0.86335725 0.43999541 0.24701895 0.9219147 0.32185042
		 0.21560517 0.9219147 0.32185042 0.21560517 0.86335725 0.43999541 0.24701895 0.8305639
		 0.453058 0.3238858 0.68388933 -0.70275885 -0.1960239 0.71516764 -0.6964888 -0.058639437
		 0.53175455 -0.82287854 -0.20026992 0.53175455 -0.82287854 -0.20026992 0.71516764
		 -0.6964888 -0.058639437 0.56699514 -0.82236117 -0.047314011 -0.74136674 0.57894194
		 0.33941349 -0.70569617 0.57016468 0.42060092 -0.58731711 0.69579023 0.41344237 -0.58731711
		 0.69579023 0.41344237 -0.70569617 0.57016468 0.42060092 -0.55164635 0.67209756 0.49393436
		 0.86335725 0.43999541 0.24701895 0.74168551 0.57852089 0.33943513 0.8305639 0.453058
		 0.3238858 0.8305639 0.453058 0.3238858 0.74168551 0.57852089 0.33943513 0.70601887
		 0.56867754 0.42207012 -0.58731711 0.69579023 0.41344237 -0.55164635 0.67209756 0.49393436
		 -0.40572292 0.78517342 0.46785858 -0.40572292 0.78517342 0.46785858 -0.55164635 0.67209756
		 0.49393436 -0.37683344 0.74312919 0.55295169 0.40571824 0.78513932 0.46791986 0.20350741
		 0.84128827 0.50081807 0.37670907 0.74324107 0.55288601 0.37670907 0.74324107 0.55288601
		 0.20350741 0.84128827 0.50081807 0.19355707 0.78818721 0.58420599 -0.86347258 0.43997294
		 0.24665542 -0.83045763 0.45438099 0.32230112 -0.74136674 0.57894194 0.33941349 -0.74136674
		 0.57894194 0.33941349 -0.83045763 0.45438099 0.32230112 -0.70569617 0.57016468 0.42060092
		 -0.35803533 -0.91413486 -0.19017918 -0.17550887 -0.96855807 -0.17632902 -0.3797709
		 -0.92462087 -0.029160324 -0.3797709 -0.92462087 -0.029160324;
	setAttr ".n[6142:6307]" -type "float3"  -0.17550887 -0.96855807 -0.17632902 -0.18347128
		 -0.98301554 -0.0043255161 0.20350741 0.84128827 0.50081807 1.1607822e-06 0.85791206
		 0.51379651 0.19355707 0.78818721 0.58420599 0.19355707 0.78818721 0.58420599 1.1607822e-06
		 0.85791206 0.51379651 -2.7003476e-05 0.8066569 0.59102005 0.53175455 -0.82287854
		 -0.20026992 0.56699514 -0.82236117 -0.047314011 0.3580741 -0.91412437 -0.19015688
		 0.3580741 -0.91412437 -0.19015688 0.56699514 -0.82236117 -0.047314011 0.37997225
		 -0.92453861 -0.02914484 -0.94587272 0.29199788 0.14164044 -0.92208213 0.32114401
		 0.21594234 -0.86347258 0.43997294 0.24665542 -0.86347258 0.43997294 0.24665542 -0.92208213
		 0.32114401 0.21594234 -0.83045763 0.45438099 0.32230112 -0.40572292 0.78517342 0.46785858
		 -0.37683344 0.74312919 0.55295169 -0.20348969 0.84130281 0.50080085 -0.20348969 0.84130281
		 0.50080085 -0.37683344 0.74312919 0.55295169 -0.19357388 0.78765184 0.58492196 -0.9850297
		 -0.1653185 -0.048849404 -0.92425919 -0.36260539 -0.11942492 -0.98607475 -0.16506045
		 -0.020289164 -0.98607475 -0.16506045 -0.020289164 -0.92425919 -0.36260539 -0.11942492
		 -0.9363203 -0.34840104 -0.043829914 0.3580741 -0.91412437 -0.19015688 0.37997225
		 -0.92453861 -0.02914484 0.17550375 -0.96855807 -0.1763341 0.17550375 -0.96855807
		 -0.1763341 0.37997225 -0.92453861 -0.02914484 0.18345518 -0.98301864 -0.0043018237
		 -0.20348969 0.84130281 0.50080085 -0.19357388 0.78765184 0.58492196 1.1607822e-06
		 0.85791206 0.51379651 1.1607822e-06 0.85791206 0.51379651 -0.19357388 0.78765184
		 0.58492196 -2.7003476e-05 0.8066569 0.59102005 -0.84453672 -0.5318898 -0.062055841
		 -0.9363203 -0.34840104 -0.043829914 -0.82331222 -0.5417766 -0.16921911 -0.82331222
		 -0.5417766 -0.16921911 -0.9363203 -0.34840104 -0.043829914 -0.92425919 -0.36260539
		 -0.11942492 -0.17550887 -0.96855807 -0.17632902 -8.6267892e-07 -0.98556447 -0.16930069
		 -0.18347128 -0.98301554 -0.0043255161 -0.18347128 -0.98301554 -0.0043255161 -8.6267892e-07
		 -0.98556447 -0.16930069 7.2400508e-06 -0.99999422 0.0033927732 0.98502958 -0.16532035
		 -0.048845481 0.98607355 -0.16508797 -0.020121446 0.92425954 -0.36260659 -0.11941828
		 0.92425954 -0.36260659 -0.11941828 0.98607355 -0.16508797 -0.020121446 0.93639958
		 -0.34837872 -0.042285495 -0.77709448 0.13477702 0.61478394 -0.5907889 -0.19021317
		 0.78408384 -0.66706169 0.16273378 0.72701204 -0.66706169 0.16273378 0.72701204 -0.5907889
		 -0.19021317 0.78408384 -0.53096557 -0.15271167 0.83351946 0.77298194 0.12765272 0.62145287
		 0.66500455 0.15795948 0.72994363 0.59000885 -0.18982364 0.7847653 0.59000885 -0.18982364
		 0.7847653 0.66500455 0.15795948 0.72994363 0.53004152 -0.15187888 0.83425945 0.37346143
		 0.22229357 0.90061766 0.19302225 0.25481811 0.94752842 0.24637519 -0.23798141 0.93950206
		 0.24637519 -0.23798141 0.93950206 0.19302225 0.25481811 0.94752842 0.12293234 -0.25010043
		 0.96038401 -0.37371653 0.22269444 0.90041274 -0.2459424 -0.23739985 0.93976253 -0.19275536
		 0.25337106 0.94797075 -0.19275536 0.25337106 0.94797075 -0.2459424 -0.23739985 0.93976253
		 -0.12231718 -0.25012863 0.96045518 -0.9770726 0.18177967 0.11083881 -0.91463107 0.009812952
		 0.40417033 -0.92208213 0.32114401 0.21594234 -0.92208213 0.32114401 0.21594234 -0.91463107
		 0.009812952 0.40417033 -0.85317665 0.070078336 0.51689321 -0.99967945 0.0046092304
		 0.02489385 -0.95052665 -0.074735895 0.30151883 -0.9770726 0.18177967 0.11083881 -0.9770726
		 0.18177967 0.11083881 -0.95052665 -0.074735895 0.30151883 -0.91463107 0.009812952
		 0.40417033 -0.98607475 -0.16506045 -0.020289164 -0.94814426 -0.18008016 0.26190373
		 -0.99967945 0.0046092304 0.02489385 -0.99967945 0.0046092304 0.02489385 -0.94814426
		 -0.18008016 0.26190373 -0.95052665 -0.074735895 0.30151883 -0.98607475 -0.16506045
		 -0.020289164 -0.9363203 -0.34840104 -0.043829914 -0.94814426 -0.18008016 0.26190373
		 -0.94814426 -0.18008016 0.26190373 -0.9363203 -0.34840104 -0.043829914 -0.90823257
		 -0.29116482 0.30056056 -0.9363203 -0.34840104 -0.043829914 -0.84453672 -0.5318898
		 -0.062055841 -0.90823257 -0.29116482 0.30056056 -0.90823257 -0.29116482 0.30056056
		 -0.84453672 -0.5318898 -0.062055841 -0.85031408 -0.38868654 0.35480803 -0.84453672
		 -0.5318898 -0.062055841 -0.71464962 -0.69683558 -0.060795546 -0.85031408 -0.38868654
		 0.35480803 -0.85031408 -0.38868654 0.35480803 -0.71464962 -0.69683558 -0.060795546
		 -0.76197439 -0.46288791 0.45291254 -0.71464962 -0.69683558 -0.060795546 -0.5661363
		 -0.82284099 -0.049217846 -0.76197439 -0.46288791 0.45291254 -0.76197439 -0.46288791
		 0.45291254 -0.5661363 -0.82284099 -0.049217846 -0.65998846 -0.53541827 0.52701283
		 -0.5661363 -0.82284099 -0.049217846 -0.3797709 -0.92462087 -0.029160324 -0.65998846
		 -0.53541827 0.52701283 -0.65998846 -0.53541827 0.52701283 -0.3797709 -0.92462087
		 -0.029160324 -0.48542133 -0.58857781 0.64648461 -0.18347128 -0.98301554 -0.0043255161
		 -0.25235975 -0.6311959 0.73342097 -0.3797709 -0.92462087 -0.029160324 -0.3797709
		 -0.92462087 -0.029160324 -0.25235975 -0.6311959 0.73342097 -0.48542133 -0.58857781
		 0.64648461 7.2400508e-06 -0.99999422 0.0033927732 -1.1081309e-05 -0.61910087 0.78531152
		 -0.18347128 -0.98301554 -0.0043255161 -0.18347128 -0.98301554 -0.0043255161 -1.1081309e-05
		 -0.61910087 0.78531152 -0.25235975 -0.6311959 0.73342097 7.2400508e-06 -0.99999422
		 0.0033927732 0.18345518 -0.98301864 -0.0043018237 -1.1081309e-05 -0.61910087 0.78531152
		 -1.1081309e-05 -0.61910087 0.78531152 0.18345518 -0.98301864 -0.0043018237 0.25237843
		 -0.63117743 0.73343045 0.18345518 -0.98301864 -0.0043018237 0.37997225 -0.92453861
		 -0.02914484 0.25237843 -0.63117743 0.73343045 0.25237843 -0.63117743 0.73343045 0.37997225
		 -0.92453861 -0.02914484 0.48624721 -0.58798587 0.64640254 0.56699514 -0.82236117
		 -0.047314011 0.65957421 -0.52810347 0.53485382 0.37997225 -0.92453861 -0.02914484
		 0.37997225 -0.92453861 -0.02914484 0.65957421 -0.52810347 0.53485382 0.48624721 -0.58798587
		 0.64640254 0.71516764 -0.6964888 -0.058639437 0.75955433 -0.45584241 0.46398813;
	setAttr ".n[6308:6473]" -type "float3"  0.56699514 -0.82236117 -0.047314011 0.56699514
		 -0.82236117 -0.047314011 0.75955433 -0.45584241 0.46398813 0.65957421 -0.52810347
		 0.53485382 0.84460104 -0.53184879 -0.06153046 0.84927577 -0.38672286 0.35941085 0.71516764
		 -0.6964888 -0.058639437 0.71516764 -0.6964888 -0.058639437 0.84927577 -0.38672286
		 0.35941085 0.75955433 -0.45584241 0.46398813 0.93639958 -0.34837872 -0.042285495
		 0.90591639 -0.29030457 0.30828348 0.84460104 -0.53184879 -0.06153046 0.84460104 -0.53184879
		 -0.06153046 0.90591639 -0.29030457 0.30828348 0.84927577 -0.38672286 0.35941085 0.98607355
		 -0.16508797 -0.020121446 0.94773877 -0.18050161 0.26307866 0.93639958 -0.34837872
		 -0.042285495 0.93639958 -0.34837872 -0.042285495 0.94773877 -0.18050161 0.26307866
		 0.90591639 -0.29030457 0.30828348 0.98607355 -0.16508797 -0.020121446 0.99967986
		 0.0045940261 0.024879837 0.94773877 -0.18050161 0.26307866 0.94773877 -0.18050161
		 0.26307866 0.99967986 0.0045940261 0.024879837 0.95059848 -0.075025454 0.30122033
		 0.99967986 0.0045940261 0.024879837 0.97708696 0.18197863 0.11038506 0.95059848 -0.075025454
		 0.30122033 0.95059848 -0.075025454 0.30122033 0.97708696 0.18197863 0.11038506 0.91584915
		 0.011287354 0.40136385 0.97708696 0.18197863 0.11038506 0.9219147 0.32185042 0.21560517
		 0.91584915 0.011287354 0.40136385 0.91584915 0.011287354 0.40136385 0.9219147 0.32185042
		 0.21560517 0.85403085 0.072134726 0.51519698 0.9219147 0.32185042 0.21560517 0.8305639
		 0.453058 0.3238858 0.85403085 0.072134726 0.51519698 0.85403085 0.072134726 0.51519698
		 0.8305639 0.453058 0.3238858 0.77298194 0.12765272 0.62145287 0.66500455 0.15795948
		 0.72994363 0.77298194 0.12765272 0.62145287 0.70601887 0.56867754 0.42207012 0.70601887
		 0.56867754 0.42207012 0.77298194 0.12765272 0.62145287 0.8305639 0.453058 0.3238858
		 0.70601887 0.56867754 0.42207012 0.55151862 0.67345387 0.49222672 0.66500455 0.15795948
		 0.72994363 0.66500455 0.15795948 0.72994363 0.55151862 0.67345387 0.49222672 0.53306389
		 0.20010805 0.82207036 0.55151862 0.67345387 0.49222672 0.37670907 0.74324107 0.55288601
		 0.53306389 0.20010805 0.82207036 0.53306389 0.20010805 0.82207036 0.37670907 0.74324107
		 0.55288601 0.37346143 0.22229357 0.90061766 0.37670907 0.74324107 0.55288601 0.19355707
		 0.78818721 0.58420599 0.37346143 0.22229357 0.90061766 0.37346143 0.22229357 0.90061766
		 0.19355707 0.78818721 0.58420599 0.19302225 0.25481811 0.94752842 0.19355707 0.78818721
		 0.58420599 -2.7003476e-05 0.8066569 0.59102005 0.19302225 0.25481811 0.94752842 0.19302225
		 0.25481811 0.94752842 -2.7003476e-05 0.8066569 0.59102005 -0.00013867521 0.2623567
		 0.96497095 -0.19357388 0.78765184 0.58492196 -0.19275536 0.25337106 0.94797075 -2.7003476e-05
		 0.8066569 0.59102005 -2.7003476e-05 0.8066569 0.59102005 -0.19275536 0.25337106 0.94797075
		 -0.00013867521 0.2623567 0.96497095 -0.37683344 0.74312919 0.55295169 -0.37371653
		 0.22269444 0.90041274 -0.19357388 0.78765184 0.58492196 -0.19357388 0.78765184 0.58492196
		 -0.37371653 0.22269444 0.90041274 -0.19275536 0.25337106 0.94797075 -0.55164635 0.67209756
		 0.49393436 -0.53146321 0.19640996 0.82399637 -0.37683344 0.74312919 0.55295169 -0.37683344
		 0.74312919 0.55295169 -0.53146321 0.19640996 0.82399637 -0.37371653 0.22269444 0.90041274
		 -0.70569617 0.57016468 0.42060092 -0.66706169 0.16273378 0.72701204 -0.55164635 0.67209756
		 0.49393436 -0.55164635 0.67209756 0.49393436 -0.66706169 0.16273378 0.72701204 -0.53146321
		 0.19640996 0.82399637 -0.83045763 0.45438099 0.32230112 -0.77709448 0.13477702 0.61478394
		 -0.70569617 0.57016468 0.42060092 -0.70569617 0.57016468 0.42060092 -0.77709448 0.13477702
		 0.61478394 -0.66706169 0.16273378 0.72701204 -0.92208213 0.32114401 0.21594234 -0.85317665
		 0.070078336 0.51689321 -0.83045763 0.45438099 0.32230112 -0.83045763 0.45438099 0.32230112
		 -0.85317665 0.070078336 0.51689321 -0.77709448 0.13477702 0.61478394 -0.025488971
		 0.99342752 -0.1115888 -0.036283147 0.99257123 -0.11612879 -0.021933373 0.99869138
		 -0.046200376 -0.027330991 0.98015064 -0.19636133 -0.016977005 0.9808929 -0.19380626
		 -0.028424954 0.9792276 -0.20076185 -0.014320244 0.98486871 -0.17270942 0.00051810418
		 0.9829675 -0.18377863 0.01033839 0.98030055 -0.19724093 0.00051810418 0.9829675 -0.18377863
		 0.015371389 0.97930419 -0.20180927 0.01033839 0.98030055 -0.19724093 0.01240135 0.98226076
		 -0.18710962 -0.014332035 0.98207635 -0.18793781 0.011704195 0.98138601 -0.19168858
		 -0.030463839 0.97905922 -0.20128331 -0.017362731 0.98083842 -0.19404776 -0.028516144
		 0.97912157 -0.20126535 -0.017362731 0.98083842 -0.19404776 -0.0074008834 0.98175561
		 -0.19000292 -0.028516144 0.97912157 -0.20126535 0.0078467363 0.98167419 -0.19040523
		 0.018636679 0.98153532 -0.19037084 0.0014466489 0.9818002 -0.18991129 -0.0091792503
		 0.98162609 -0.19059381 -0.025847454 0.98117161 -0.19140063 -0.0074008834 0.98175561
		 -0.19000292 -0.025847454 0.98117161 -0.19140063 -0.028755952 0.98138535 -0.1898838
		 -0.0074008834 0.98175561 -0.19000292 0.018636679 0.98153532 -0.19037084 0.0078467363
		 0.98167419 -0.19040523 0.022061137 0.98067737 -0.19438432 0.0078467363 0.98167419
		 -0.19040523 0.020842869 0.98037148 -0.19605453 0.022061137 0.98067737 -0.19438432
		 0.01240135 0.98226076 -0.18710962 0.010531281 0.98336107 -0.1813563 -0.014332035
		 0.98207635 -0.18793781 0.010531281 0.98336107 -0.1813563 -0.016977005 0.9808929 -0.19380626
		 -0.014332035 0.98207635 -0.18793781 -0.028424954 0.9792276 -0.20076185 -0.016977005
		 0.9808929 -0.19380626 -0.028278874 0.97890484 -0.20235033 -0.016977005 0.9808929
		 -0.19380626 -0.02924596 0.97895294 -0.20197985 -0.028278874 0.97890484 -0.20235033
		 0.037216883 0.97806984 -0.20492516 0.020842869 0.98037148 -0.19605453 0.035273142
		 0.97812873 -0.20498772 0.020842869 0.98037148 -0.19605453 0.034556162 0.97798556
		 -0.20579152 0.035273142 0.97812873 -0.20498772;
	setAttr ".n[6474:6639]" -type "float3"  0.020842869 0.98037148 -0.19605453 0.034129892
		 0.97773737 -0.20703802 0.034556162 0.97798556 -0.20579152 -0.027330991 0.98015064
		 -0.19636133 -0.027025172 0.98072845 -0.19349761 -0.016977005 0.9808929 -0.19380626
		 -0.027025172 0.98072845 -0.19349761 -0.014332035 0.98207635 -0.18793781 -0.016977005
		 0.9808929 -0.19380626 -0.027305584 0.98427391 -0.1745259 -0.031533089 0.98450094
		 -0.17252125 -0.014332035 0.98207635 -0.18793781 -0.031533089 0.98450094 -0.17252125
		 -0.014320244 0.98486871 -0.17270942 -0.014332035 0.98207635 -0.18793781 0.036062535
		 0.98483026 -0.16973157 0.022106459 0.98361266 -0.17893423 0.039793048 0.98918307
		 -0.14118555 0.022106459 0.98361266 -0.17893423 0.02541915 0.9900586 -0.13833955 0.039793048
		 0.98918307 -0.14118555 0.020854704 0.9987781 -0.044803556 0.036688007 0.99354804
		 -0.10731383 0.020257374 0.99494255 -0.098381795 -0.014320244 0.98486871 -0.17270942
		 -0.0032346742 0.99087799 -0.1347231 0.00051810418 0.9829675 -0.18377863 -0.031533089
		 0.98450094 -0.17252125 -0.035521664 0.99099785 -0.12907931 -0.014320244 0.98486871
		 -0.17270942 -0.027305584 0.98427391 -0.1745259 -0.014332035 0.98207635 -0.18793781
		 -0.029207129 0.98303866 -0.18105774 -0.027025172 0.98072845 -0.19349761 -0.028800638
		 0.98175973 -0.1879317 -0.014332035 0.98207635 -0.18793781 -0.014332035 0.98207635
		 -0.18793781 -0.028800638 0.98175973 -0.1879317 -0.029207129 0.98303866 -0.18105774
		 0.00051810418 0.9829675 -0.18377863 0.022106459 0.98361266 -0.17893423 0.017451877
		 0.98004645 -0.19800086 0.022106459 0.98361266 -0.17893423 0.019052492 0.97917914
		 -0.20210187 0.017451877 0.98004645 -0.19800086 0.00051810418 0.9829675 -0.18377863
		 0.017451877 0.98004645 -0.19800086 0.015371389 0.97930419 -0.20180927 0.004823863
		 0.97902209 -0.20369713 0.017222285 0.97762656 -0.20964186 0.036062535 0.98483026
		 -0.16973157 0.017222285 0.97762656 -0.20964186 0.022106459 0.98361266 -0.17893423
		 0.036062535 0.98483026 -0.16973157 -0.010266506 0.98088086 -0.19433816 0.004823863
		 0.97902209 -0.20369713 0.029421085 0.98468405 -0.17184795 0.004823863 0.97902209
		 -0.20369713 0.036062535 0.98483026 -0.16973157 0.029421085 0.98468405 -0.17184795
		 0.029421085 0.98468405 -0.17184795 0.028411111 0.98360199 -0.17810094 -0.010266506
		 0.98088086 -0.19433816 -0.017509706 0.98362195 -0.17939121 0.02660059 0.98185259
		 -0.18777093 0.026256694 0.98088694 -0.1927989 0.027431859 0.97951543 -0.19949198
		 -0.0096154697 0.9851436 -0.1714633 0.027704254 0.98033869 -0.19536768 0.0078467363
		 0.98167419 -0.19040523 0.015568924 0.9850508 -0.17155924 0.020842869 0.98037148 -0.19605453
		 0.015568924 0.9850508 -0.17155924 0.015347347 0.98482221 -0.17288633 0.020842869
		 0.98037148 -0.19605453 0.013530302 0.98609298 -0.16564272 0.020842869 0.98037148
		 -0.19605453 0.015347347 0.98482221 -0.17288633 -0.0074008834 0.98175561 -0.19000292
		 -0.017362731 0.98083842 -0.19404776 0.010531281 0.98336107 -0.1813563 -0.017362731
		 0.98083842 -0.19404776 -0.016977005 0.9808929 -0.19380626 0.010531281 0.98336107
		 -0.1813563 0.010531281 0.98336107 -0.1813563 0.015383655 0.98446393 -0.17491163 -0.0074008834
		 0.98175561 -0.19000292 0.015383655 0.98446393 -0.17491163 0.0078467363 0.98167419
		 -0.19040523 -0.0074008834 0.98175561 -0.19000292 0.0078467363 0.98167419 -0.19040523
		 0.015383655 0.98446393 -0.17491163 0.015568924 0.9850508 -0.17155924 -0.021933373
		 0.99869138 -0.046200376 -0.013397996 0.9999038 -0.0035853693 -0.001253791 0.99972582
		 -0.023382369 0.013252334 0.9998818 -0.0077962349 0.020854704 0.9987781 -0.044803556
		 -0.001253791 0.99972582 -0.023382369 -0.011643963 0.99985266 0.012612369 -0.010221565
		 0.99852622 0.053300064 -0.001797453 0.99950927 0.031272728 -0.001797453 0.99950927
		 0.031272728 -0.010221565 0.99852622 0.053300064 -0.0017418769 0.99712044 0.075814016
		 0.012242986 0.99961746 0.024800431 -0.001797453 0.99950927 0.031272728 0.010770557
		 0.99865693 0.050678391 0.010770557 0.99865693 0.050678391 -0.001797453 0.99950927
		 0.031272728 0.0010697377 0.99710083 0.076084144 -0.0017418769 0.99712044 0.075814016
		 0.0006434684 0.99680036 0.079928823 -0.001797453 0.99950927 0.031272728 0.0006434684
		 0.99680036 0.079928823 -1.5042299e-05 0.99675936 0.080441169 -0.001797453 0.99950927
		 0.031272728 0.0010697377 0.99710083 0.076084144 -0.001797453 0.99950927 0.031272728
		 -0.001308878 0.99675643 0.080466434 -0.001797453 0.99950927 0.031272728 -1.5042299e-05
		 0.99675936 0.080441169 -0.001308878 0.99675643 0.080466434 0.14775704 0.19311918
		 0.96998602 -0.035223279 0.19514202 0.9801423 0.14630744 0.19316152 0.97019726 -0.035223279
		 0.19514202 0.9801423 -0.035019007 0.19514352 0.98014933 0.14630744 0.19316152 0.97019726
		 -0.99989104 0.0028818685 0.014478927 -0.99988335 0.0029822115 0.014979157 -0.99269307
		 0.023561195 0.1183443 -0.99988335 0.0029822115 0.014979157 -0.99264503 0.02363874
		 0.11873091 -0.99269307 0.023561195 0.1183443 -0.69107223 -0.14105758 -0.70888782
		 -0.70623749 -0.13813116 -0.69436908 -0.79627305 -0.11810046 -0.59329718 -0.70623749
		 -0.13813116 -0.69436908 -0.8019141 -0.11659212 -0.58595222 -0.79627305 -0.11810046
		 -0.59329718 0.67212284 0.7377764 -0.062744901 -0.36407039 0.90560395 -0.2175643 0.6049841
		 0.78032064 0.15841061 -0.36407039 0.90560395 -0.2175643 -0.32767034 0.88251865 -0.33733222
		 0.6049841 0.78032064 0.15841061 0.055481628 -0.15715538 0.98601419 0.055481568 -0.15715542
		 0.98601419 0.37310362 -0.17145835 0.91180903 0.055481568 -0.15715542 0.98601419 0.37310359
		 -0.17145838 0.91180903 0.37310362 -0.17145835 0.91180903 0.78497946 -0.432675 -0.44339556
		 0.78497946 -0.43267494 -0.44339556 0.56072176 -0.47758481 -0.67639035 0.78497946
		 -0.43267494 -0.44339556 0.56072181 -0.47758484 -0.67639023 0.56072176 -0.47758481
		 -0.67639035 -0.55805326 0.79969186 0.22151637 -0.648215 0.70237237 0.29409251 -0.39904389
		 0.83030343 0.38905033 -0.648215 0.70237237 0.29409251 -0.46455085 0.73956847 0.48706368
		 -0.39904389 0.83030343 0.38905033 -0.013397996 0.9999038 -0.0035853693;
	setAttr ".n[6640:6805]" -type "float3"  -0.011643963 0.99985266 0.012612369 -0.001253791
		 0.99972582 -0.023382369 -0.011643963 0.99985266 0.012612369 -0.001797453 0.99950927
		 0.031272728 -0.001253791 0.99972582 -0.023382369 0.41279534 0.17784809 0.89329171
		 0.2830517 0.18727574 0.94064313 0.4104462 0.17805576 0.89433217 0.2830517 0.18727574
		 0.94064313 0.28069004 0.1874115 0.94132358 0.4104462 0.17805576 0.89433217 -0.93656313
		 0.06843929 0.34375221 -0.9367156 0.068359256 0.34335241 -0.97454476 0.043776885 0.21987751
		 -0.9367156 0.068359256 0.34335241 -0.97462058 0.043711986 0.21955417 -0.97454476
		 0.043776885 0.21987751 -0.85442793 -0.10144287 -0.50957072 -0.86080712 -0.099353909
		 -0.49913913 -0.90503609 -0.083054416 -0.41714704 -0.86080712 -0.099353909 -0.49913913
		 -0.90764272 -0.081957333 -0.41166449 -0.90503609 -0.083054416 -0.41714704 0.90782762
		 0.081881218 0.41127181 0.96286726 0.052716319 0.26477841 0.90807724 0.081775256 0.41074145
		 0.96286726 0.052716319 0.26477841 0.96298575 0.052633408 0.2643638 0.90807724 0.081775256
		 0.41074145 -0.30603975 0.95176619 0.021927396 -0.35655802 0.92965341 -0.092794798
		 0.56496143 0.65264553 -0.5048489 -0.35655802 0.92965341 -0.092794798 0.65822017 0.69340277
		 -0.29315326 0.56496143 0.65264553 -0.5048489 0.64572418 -0.20545961 0.73540914 0.64572418
		 -0.20545958 0.73540914 0.8404609 -0.25505781 0.47809097 0.64572418 -0.20545958 0.73540914
		 0.8404609 -0.25505778 0.47809103 0.8404609 -0.25505781 0.47809097 0.2688328 -0.50526941
		 -0.82001936 0.2688328 -0.50526941 -0.82001936 -0.055481497 -0.5123896 -0.85695899
		 0.2688328 -0.50526941 -0.82001936 -0.05548149 -0.51238954 -0.85695899 -0.055481497
		 -0.5123896 -0.85695899 -0.45822603 0.63844103 -0.61840278 -0.2646037 0.61196798 -0.74530536
		 -0.53431696 0.51674837 -0.66893691 -0.2646037 0.61196798 -0.74530536 -0.31032225
		 0.48849598 -0.81551933 -0.53431696 0.51674837 -0.66893691 -0.64943403 0.76033252
		 0.011396603 -0.75347078 0.65550447 0.050948311 -0.55805326 0.79969186 0.22151637
		 -0.75347078 0.65550447 0.050948311 -0.648215 0.70237237 0.29409251 -0.55805326 0.79969186
		 0.22151637 0.0078467363 0.98167419 -0.19040523 0.0014466489 0.9818002 -0.18991129
		 -0.0074008834 0.98175561 -0.19000292 0.0014466489 0.9818002 -0.18991129 -0.0091792503
		 0.98162609 -0.19059381 -0.0074008834 0.98175561 -0.19000292 0.2830517 0.18727574
		 0.94064313 0.14775704 0.19311918 0.96998602 0.28069004 0.1874115 0.94132358 0.14775704
		 0.19311918 0.96998602 0.14630744 0.19316152 0.97019726 0.28069004 0.1874115 0.94132358
		 -0.97454476 0.043776885 0.21987751 -0.97462058 0.043711986 0.21955417 -0.99264503
		 0.02363874 0.11873091 -0.97462058 0.043711986 0.21955417 -0.99269307 0.023561195
		 0.1183443 -0.99264503 0.02363874 0.11873091 -0.79627305 -0.11810046 -0.59329718 -0.8019141
		 -0.11659212 -0.58595222 -0.85442793 -0.10144287 -0.50957072 -0.8019141 -0.11659212
		 -0.58595222 -0.86080712 -0.099353909 -0.49913913 -0.85442793 -0.10144287 -0.50957072
		 -0.94623095 -0.063165508 -0.31726497 -0.94626337 -0.063146822 -0.31717208 -0.95026916
		 -0.060809679 -0.30543527 -0.94626337 -0.063146822 -0.31717208 -0.95034635 -0.060763501
		 -0.30520427 -0.95026916 -0.060809679 -0.30543527 -0.014320244 0.98486871 -0.17270942
		 -0.035521664 0.99099785 -0.12907931 -0.025488971 0.99342752 -0.1115888 -0.035521664
		 0.99099785 -0.12907931 -0.036283147 0.99257123 -0.11612879 -0.025488971 0.99342752
		 -0.1115888 -0.35655802 0.92965341 -0.092794798 -0.36407039 0.90560395 -0.2175643
		 0.65822017 0.69340277 -0.29315326 -0.36407039 0.90560395 -0.2175643 0.67212284 0.7377764
		 -0.062744901 0.65822017 0.69340277 -0.29315326 0.37310362 -0.17145835 0.91180903
		 0.37310359 -0.17145838 0.91180903 0.64572418 -0.20545961 0.73540914 0.37310359 -0.17145838
		 0.91180903 0.64572418 -0.20545958 0.73540914 0.64572418 -0.20545961 0.73540914 0.56072176
		 -0.47758481 -0.67639035 0.56072181 -0.47758484 -0.67639023 0.2688328 -0.50526941
		 -0.82001936 0.56072181 -0.47758484 -0.67639023 0.2688328 -0.50526941 -0.82001936
		 0.2688328 -0.50526941 -0.82001936 0.00094530825 0.98637795 -0.16449189 -0.0096154697
		 0.9851436 -0.1714633 0.028900549 0.97911006 -0.20126651 -0.0096154697 0.9851436 -0.1714633
		 0.027431859 0.97951543 -0.19949198 0.028900549 0.97911006 -0.20126651 0.65822017
		 0.69340277 -0.29315326 0.75365961 0.58975446 -0.29014966 0.56496143 0.65264553 -0.5048489
		 0.75365961 0.58975446 -0.29014966 0.64576745 0.54203963 -0.53775221 0.56496143 0.65264553
		 -0.5048489 0.5412513 0.1641873 0.82467544 0.41279534 0.17784809 0.89329171 0.53965914
		 0.16438779 0.82567835 0.41279534 0.17784809 0.89329171 0.4104462 0.17805576 0.89433217
		 0.53965914 0.16438779 0.82567835 -0.9367156 0.068359256 0.34335241 -0.93656313 0.06843929
		 0.34375221 -0.88823253 0.089702062 0.45055139 -0.93656313 0.06843929 0.34375221 -0.88796169
		 0.089804769 0.45106441 -0.88823253 0.089702062 0.45055139 -0.90503609 -0.083054416
		 -0.41714704 -0.90764272 -0.081957333 -0.41166449 -0.92950875 -0.072013341 -0.36170095
		 -0.90764272 -0.081957333 -0.41166449 -0.9303993 -0.071571797 -0.35949215 -0.92950875
		 -0.072013341 -0.36170095 0.98912752 0.028714754 0.1442299 0.96298575 0.052633408
		 0.2643638 0.98905647 0.028808342 0.14469759 0.96298575 0.052633408 0.2643638 0.96286726
		 0.052716319 0.26477841 0.98905647 0.028808342 0.14469759 -0.014320244 0.98486871
		 -0.17270942 -0.025488971 0.99342752 -0.1115888 -0.0032346742 0.99087799 -0.1347231
		 -0.025488971 0.99342752 -0.1115888 0.0024400481 0.99501276 -0.099718072 -0.0032346742
		 0.99087799 -0.1347231 -0.2186086 0.96927512 0.11276535 -0.30603975 0.95176619 0.021927396
		 0.40364069 0.62074822 -0.67212045 -0.30603975 0.95176619 0.021927396 0.56496143 0.65264553
		 -0.5048489 0.40364069 0.62074822 -0.67212045 0.8404609 -0.25505781 0.47809097 0.8404609
		 -0.25505778 0.47809103 0.93382555 -0.31427085 0.17089069 0.8404609 -0.25505778 0.47809103
		 0.93382555 -0.31427085 0.17089078;
	setAttr ".n[6806:6971]" -type "float3"  0.93382555 -0.31427085 0.17089069 -0.055481497
		 -0.5123896 -0.85695899 -0.05548149 -0.51238954 -0.85695899 -0.37310377 -0.49808645
		 -0.78275377 -0.05548149 -0.51238954 -0.85695899 -0.37310374 -0.49808648 -0.78275377
		 -0.37310377 -0.49808645 -0.78275377 -0.0096154697 0.9851436 -0.1714633 -0.017509706
		 0.98362195 -0.17939121 0.027704254 0.98033869 -0.19536768 -0.017509706 0.98362195
		 -0.17939121 0.026256694 0.98088694 -0.1927989 0.027704254 0.98033869 -0.19536768
		 0.40364069 0.62074822 -0.67212045 0.56496143 0.65264553 -0.5048489 0.45690548 0.50446743
		 -0.73263228 0.56496143 0.65264553 -0.5048489 0.64576745 0.54203963 -0.53775221 0.45690548
		 0.50446743 -0.73263228 0.83737302 0.10673551 0.53610998 0.74921149 0.12932794 0.64958179
		 0.83685559 0.1068907 0.53688645 0.74921149 0.12932794 0.64958179 0.74828601 0.12953293
		 0.65060687 0.83685559 0.1068907 0.53688645 -0.72911221 0.13363573 0.67122042 -0.72830802
		 0.13380392 0.67205948 -0.6390574 0.15018772 0.75435358 -0.72830802 0.13380392 0.67205948
		 -0.63787037 0.15038113 0.75531912 -0.6390574 0.15018772 0.75435358 -0.0032010295
		 -0.19526137 -0.98074603 0.17386475 -0.19229513 -0.96581244 -0.0033110012 -0.19524235
		 -0.98074943 0.17386475 -0.19229513 -0.96581244 0.17807084 -0.1920587 -0.96509284
		 -0.0033110012 -0.19524235 -0.98074943 0.9465977 -0.062954955 -0.31621116 0.95473266
		 -0.05808261 -0.29173961 0.9466362 -0.062932692 -0.3161003 0.95473266 -0.05808261
		 -0.29173961 0.95489907 -0.057977963 -0.29121521 0.9466362 -0.062932692 -0.3161003
		 -0.2646037 0.61196798 -0.74530536 0.14546184 0.97726816 0.15423298 -0.038127344 0.59910846
		 -0.79975957 0.14546184 0.97726816 0.15423298 0.021630611 0.98284453 0.18316314 -0.038127344
		 0.59910846 -0.79975957 -0.39904389 0.83030343 0.38905033 0.21860838 0.85791886 -0.46495759
		 -0.55805326 0.79969186 0.22151637 0.21860838 0.85791886 -0.46495759 0.30603927 0.87542796
		 -0.37412018 -0.55805326 0.79969186 0.22151637 -0.84046096 -0.41448706 -0.34903556
		 -0.84046096 -0.41448703 -0.34903559 -0.93382549 -0.35527405 -0.041835975 -0.84046096
		 -0.41448703 -0.34903559 -0.93382549 -0.35527408 -0.04183599 -0.93382549 -0.35527405
		 -0.041835975 -0.038127344 0.59910846 -0.79975957 0.19405505 0.6020593 -0.77451098
		 -0.049446177 0.47649387 -0.87778622 0.19405505 0.6020593 -0.77451098 0.21674402 0.48205832
		 -0.84890622 -0.049446177 0.47649387 -0.87778622 -0.017509706 0.98362195 -0.17939121
		 -0.018320339 0.98204398 -0.18776053 0.02660059 0.98185259 -0.18777093 -0.018320339
		 0.98204398 -0.18776053 0.02649295 0.98268747 -0.18336712 0.02660059 0.98185259 -0.18777093
		 -0.19111679 0.84847528 0.49352214 -0.22505635 0.76258546 0.60647595 0.040891044 0.852144
		 0.5217073 -0.22505635 0.76258546 0.60647595 0.04111658 0.7687127 0.63827121 0.040891044
		 0.852144 0.5217073 0.67212284 0.7377764 -0.062744901 0.76815343 0.63944489 -0.032411538
		 0.65822017 0.69340277 -0.29315326 0.76815343 0.63944489 -0.032411538 0.75365961 0.58975446
		 -0.29014966 0.65822017 0.69340277 -0.29315326 0.037216883 0.97806984 -0.20492516
		 0.022061137 0.98067737 -0.19438432 0.020842869 0.98037148 -0.19605453 -0.016977005
		 0.9808929 -0.19380626 -0.017362731 0.98083842 -0.19404776 -0.02924596 0.97895294
		 -0.20197985 -0.017362731 0.98083842 -0.19404776 -0.030463839 0.97905922 -0.20128331
		 -0.02924596 0.97895294 -0.20197985 0.6391989 0.15016448 0.75423825 0.5412513 0.1641873
		 0.82467544 0.63802338 0.15035596 0.75519484 0.5412513 0.1641873 0.82467544 0.53965914
		 0.16438779 0.82567835 0.63802338 0.15035596 0.75519484 -0.88823253 0.089702062 0.45055139
		 -0.88796169 0.089804769 0.45106441 -0.81977582 0.11182383 0.56166095 -0.88796169
		 0.089804769 0.45106441 -0.81923372 0.11197598 0.56242114 -0.81977582 0.11182383 0.56166095
		 0.33235753 -0.18409969 -0.92501122 0.53701907 -0.1646937 -0.82733697 0.34533903 -0.18298285
		 -0.9204663 0.53701907 -0.1646937 -0.82733697 0.55052382 -0.16280708 -0.8187902 0.34533903
		 -0.18298285 -0.9204663 0.98899043 -0.0288947 -0.14513123 0.99995708 0.0018087345
		 0.0090874732 0.98911721 -0.028727947 -0.1442977 0.99995708 0.0018087345 0.0090874732
		 0.99994946 0.0019632112 0.0098605603 0.98911721 -0.028727947 -0.1442977 0.93072647
		 -0.071413241 -0.35867587 0.94221801 -0.065413743 -0.32855186 0.9315027 -0.071024917
		 -0.35673267 0.94221801 -0.065413743 -0.32855186 0.94240075 -0.065312847 -0.32804731
		 0.9315027 -0.071024917 -0.35673267 -0.10480963 0.98006856 0.16876194 -0.2186086 0.96927512
		 0.11276535 0.19405505 0.6020593 -0.77451098 -0.2186086 0.96927512 0.11276535 0.40364069
		 0.62074822 -0.67212045 0.19405505 0.6020593 -0.77451098 0.93382555 -0.31427085 0.17089069
		 0.93382555 -0.31427085 0.17089078 0.91455704 -0.37595648 -0.14913805 0.93382555 -0.31427085
		 0.17089078 0.91455698 -0.37595657 -0.14913811 0.91455704 -0.37595648 -0.14913805
		 -0.37310377 -0.49808645 -0.78275377 -0.37310374 -0.49808648 -0.78275377 -0.6457243
		 -0.46408537 -0.60635376 -0.37310374 -0.49808648 -0.78275377 -0.64572436 -0.46408528
		 -0.60635376 -0.6457243 -0.46408537 -0.60635376 -0.2646037 0.61196798 -0.74530536
		 -0.038127344 0.59910846 -0.79975957 -0.31032225 0.48849598 -0.81551933 -0.038127344
		 0.59910846 -0.79975957 -0.049446177 0.47649387 -0.87778622 -0.31032225 0.48849598
		 -0.81551933 0.040891044 0.852144 0.5217073 0.04111658 0.7687127 0.63827121 0.26885116
		 0.84092826 0.46963683 0.04111658 0.7687127 0.63827121 0.30215782 0.75728339 0.57898408
		 0.26885116 0.84092826 0.46963683 -0.028755952 0.98138535 -0.1898838 -0.028516144
		 0.97912157 -0.20126535 -0.0074008834 0.98175561 -0.19000292 0.99995708 0.0018087345
		 0.0090874732 0.98912752 0.028714754 0.1442299 0.99994946 0.0019632112 0.0098605603
		 0.98912752 0.028714754 0.1442299 0.98905647 0.028808342 0.14469759 0.99994946 0.0019632112
		 0.0098605603 -0.54144621 0.16416234 0.82455242 -0.53990906 0.16435647 0.82552111
		 -0.43843839 0.175493 0.88146126;
	setAttr ".n[6972:7137]" -type "float3"  -0.53990906 0.16435647 0.82552111 -0.43653384
		 0.17567499 0.88236982 -0.43843839 0.175493 0.88146126 -0.16707236 -0.19252551 -0.96696472
		 -0.17051679 -0.19227625 -0.9664129 -0.32887316 -0.18431059 -0.9262138 -0.17051679
		 -0.19227625 -0.9664129 -0.34320143 -0.18322989 -0.92121637 -0.32887316 -0.18431059
		 -0.9262138 0.90447247 -0.083283871 -0.41832206 0.93072647 -0.071413241 -0.35867587
		 0.90730625 -0.08209718 -0.41237772 0.93072647 -0.071413241 -0.35867587 0.9315027
		 -0.071024917 -0.35673267 0.90730625 -0.08209718 -0.41237772 -0.94198489 -0.065541744
		 -0.32919401 -0.9421764 -0.065436341 -0.32866651 -0.94623095 -0.063165508 -0.31726497
		 -0.9421764 -0.065436341 -0.32866651 -0.94626337 -0.063146822 -0.31717208 -0.94623095
		 -0.063165508 -0.31726497 0.32767019 0.94467527 -0.014860622 0.25174847 0.96401209
		 0.085460134 -0.59627163 0.67488307 -0.4347333 0.25174847 0.96401209 0.085460134 -0.45822603
		 0.63844103 -0.61840278 -0.59627163 0.67488307 -0.4347333 0.040891044 0.852144 0.5217073
		 -0.021630593 0.8443495 -0.53535604 -0.19111679 0.84847528 0.49352214 -0.021630593
		 0.8443495 -0.53535604 0.10480976 0.84712541 -0.52095437 -0.19111679 0.84847528 0.49352214
		 -0.91455704 -0.29358831 0.27819294 -0.91455704 -0.29358831 0.27819294 -0.78497946
		 -0.23687001 0.5724507 -0.91455704 -0.29358831 0.27819294 -0.78497946 -0.23687001
		 0.5724507 -0.78497946 -0.23687001 0.5724507 0.45690548 0.50446743 -0.73263228 0.21674402
		 0.48205832 -0.84890622 0.40364069 0.62074822 -0.67212045 0.21674402 0.48205832 -0.84890622
		 0.19405505 0.6020593 -0.77451098 0.40364069 0.62074822 -0.67212045 -0.59627163 0.67488307
		 -0.4347333 -0.69115853 0.55691218 -0.46059605 -0.66262239 0.71705204 -0.21625885
		 -0.69115853 0.55691218 -0.46059605 -0.76752532 0.60466319 -0.21280815 -0.66262239
		 0.71705204 -0.21625885 0.67212284 0.7377764 -0.062744901 0.6049841 0.78032064 0.15841061
		 0.76815343 0.63944489 -0.032411538 0.6049841 0.78032064 0.15841061 0.69133544 0.68814605
		 0.2202507 0.76815343 0.63944489 -0.032411538 -0.00049255748 0.99612606 0.087935455
		 -1.5042299e-05 0.99675936 0.080441169 0.0006434684 0.99680036 0.079928823 0.74921149
		 0.12932794 0.64958179 0.6391989 0.15016448 0.75423825 0.74828601 0.12953293 0.65060687
		 0.6391989 0.15016448 0.75423825 0.63802338 0.15035596 0.75519484 0.74828601 0.12953293
		 0.65060687 -0.72830802 0.13380392 0.67205948 -0.72911221 0.13363573 0.67122042 -0.81923372
		 0.11197598 0.56242114 -0.72911221 0.13363573 0.67122042 -0.81977582 0.11182383 0.56166095
		 -0.81923372 0.11197598 0.56242114 0.17386475 -0.19229513 -0.96581244 0.33235753 -0.18409969
		 -0.92501122 0.17807084 -0.1920587 -0.96509284 0.33235753 -0.18409969 -0.92501122
		 0.34533903 -0.18298285 -0.9204663 0.17807084 -0.1920587 -0.96509284 0.95473266 -0.05808261
		 -0.29173961 0.98899043 -0.0288947 -0.14513123 0.95489907 -0.057977963 -0.29121521
		 0.98899043 -0.0288947 -0.14513123 0.98911721 -0.028727947 -0.1442977 0.95489907 -0.057977963
		 -0.29121521 0.94221801 -0.065413743 -0.32855186 0.9465977 -0.062954955 -0.31621116
		 0.94240075 -0.065312847 -0.32804731 0.9465977 -0.062954955 -0.31621116 0.9466362
		 -0.062932692 -0.3161003 0.94240075 -0.065312847 -0.32804731 0.021630611 0.98284453
		 0.18316314 -0.10480963 0.98006856 0.16876194 -0.038127344 0.59910846 -0.79975957
		 -0.10480963 0.98006856 0.16876194 0.19405505 0.6020593 -0.77451098 -0.038127344 0.59910846
		 -0.79975957 -0.55805326 0.79969186 0.22151637 0.30603927 0.87542796 -0.37412018 -0.64943403
		 0.76033252 0.011396603 0.30603927 0.87542796 -0.37412018 0.35655773 0.89754069 -0.25939807
		 -0.64943403 0.76033252 0.011396603 -0.6457243 -0.46408537 -0.60635376 -0.64572436
		 -0.46408528 -0.60635376 -0.84046096 -0.41448706 -0.34903556 -0.64572436 -0.46408528
		 -0.60635376 -0.84046096 -0.41448703 -0.34903559 -0.84046096 -0.41448706 -0.34903556
		 0.019052492 0.97917914 -0.20210187 0.022106459 0.98361266 -0.17893423 0.017222285
		 0.97762656 -0.20964186 -0.66262239 0.71705204 -0.21625885 -0.76752532 0.60466319
		 -0.21280815 -0.64943403 0.76033252 0.011396603 -0.76752532 0.60466319 -0.21280815
		 -0.75347078 0.65550447 0.050948311 -0.64943403 0.76033252 0.011396603 -0.014320244
		 0.98486871 -0.17270942 0.01033839 0.98030055 -0.19724093 -0.014332035 0.98207635
		 -0.18793781 0.01033839 0.98030055 -0.19724093 0.011704195 0.98138601 -0.19168858
		 -0.014332035 0.98207635 -0.18793781 0.02541915 0.9900586 -0.13833955 -0.0032346742
		 0.99087799 -0.1347231 0.020257374 0.99494255 -0.098381795 -0.0032346742 0.99087799
		 -0.1347231 0.0024400481 0.99501276 -0.099718072 0.020257374 0.99494255 -0.098381795
		 0.68331718 -0.14257742 -0.71606511 0.8057217 -0.11565867 -0.58089215 0.69910532 -0.13951716
		 -0.70127511 0.8057217 -0.11565867 -0.58089215 0.81322587 -0.11360687 -0.57075137
		 0.69910532 -0.13951716 -0.70127511 -0.30557746 0.18592133 0.9338392 -0.30315033 0.18607317
		 0.93459976 -0.16809507 0.19248401 0.96679574 -0.30315033 0.18607317 0.93459976 -0.16635585
		 0.19254172 0.967085 -0.16809507 0.19248401 0.96679574 -0.97455293 -0.043770257 -0.21984249
		 -0.97472382 -0.043624263 -0.21911266 -0.99363679 -0.021993706 -0.11046363 -0.97472382
		 -0.043624263 -0.21911266 -0.99372756 -0.021835908 -0.10967544 -0.99363679 -0.021993706
		 -0.11046363 -0.5442332 -0.16392316 -0.82276326 -0.55896401 -0.16191295 -0.81323022
		 -0.69107223 -0.14105758 -0.70888782 -0.55896401 -0.16191295 -0.81323022 -0.70623749
		 -0.13813116 -0.69436908 -0.69107223 -0.14105758 -0.70888782 -0.92950875 -0.072013341
		 -0.36170095 -0.9303993 -0.071571797 -0.35949215 -0.94198489 -0.065541744 -0.32919401
		 -0.9303993 -0.071571797 -0.35949215 -0.9421764 -0.065436341 -0.32866651 -0.94198489
		 -0.065541744 -0.32919401 0.35655773 0.89754069 -0.25939807 0.36407024 0.92158991
		 -0.13462865 -0.64943403 0.76033252 0.011396603 0.36407024 0.92158991 -0.13462865
		 -0.66262239 0.71705204 -0.21625885 -0.64943403 0.76033252 0.011396603 -0.2517482
		 0.86318189 -0.43765271;
	setAttr ".n[7138:7303]" -type "float3"  -0.1454618 0.84992588 -0.50642556 0.46489322
		 0.81605947 0.34339657 -0.1454618 0.84992588 -0.50642556 0.26885116 0.84092826 0.46963683
		 0.46489322 0.81605947 0.34339657 -0.5607217 -0.19196017 0.80544549 -0.5607217 -0.19196017
		 0.80544549 -0.26883239 -0.16427554 0.94907463 -0.5607217 -0.19196017 0.80544549 -0.26883233
		 -0.16427553 0.94907469 -0.26883239 -0.16427554 0.94907463 -0.59627163 0.67488307
		 -0.4347333 -0.45822603 0.63844103 -0.61840278 -0.69115853 0.55691218 -0.46059605
		 -0.45822603 0.63844103 -0.61840278 -0.53431696 0.51674837 -0.66893691 -0.69115853
		 0.55691218 -0.46059605 0.028900549 0.97911006 -0.20126651 0.030813206 0.97880077
		 -0.20248365 0.00094530825 0.98637795 -0.16449189 0.030813206 0.97880077 -0.20248365
		 0.013530302 0.98609298 -0.16564272 0.00094530825 0.98637795 -0.16449189 0.0024400481
		 0.99501276 -0.099718072 -0.001253791 0.99972582 -0.023382369 0.020257374 0.99494255
		 -0.098381795 -0.001253791 0.99972582 -0.023382369 0.020854704 0.9987781 -0.044803556
		 0.020257374 0.99494255 -0.098381795 0.90807724 0.081775256 0.41074145 0.83737302
		 0.10673551 0.53610998 0.90782762 0.081881218 0.41127181 0.83737302 0.10673551 0.53610998
		 0.83685559 0.1068907 0.53688645 0.90782762 0.081881218 0.41127181 -0.6390574 0.15018772
		 0.75435358 -0.63787037 0.15038113 0.75531912 -0.54144621 0.16416234 0.82455242 -0.63787037
		 0.15038113 0.75531912 -0.53990906 0.16435647 0.82552111 -0.54144621 0.16416234 0.82455242
		 -0.0032010295 -0.19526137 -0.98074603 -0.0033110012 -0.19524235 -0.98074943 -0.16707236
		 -0.19252551 -0.96696472 -0.0033110012 -0.19524235 -0.98074943 -0.17051679 -0.19227625
		 -0.9664129 -0.16707236 -0.19252551 -0.96696472 -0.45822603 0.63844103 -0.61840278
		 0.25174847 0.96401209 0.085460134 -0.2646037 0.61196798 -0.74530536 0.25174847 0.96401209
		 0.085460134 0.14546184 0.97726816 0.15423298 -0.2646037 0.61196798 -0.74530536 0.10480976
		 0.84712541 -0.52095437 0.21860838 0.85791886 -0.46495759 -0.19111679 0.84847528 0.49352214
		 0.21860838 0.85791886 -0.46495759 -0.39904389 0.83030343 0.38905033 -0.19111679 0.84847528
		 0.49352214 -0.93382549 -0.35527405 -0.041835975 -0.93382549 -0.35527408 -0.04183599
		 -0.91455704 -0.29358831 0.27819294 -0.93382549 -0.35527408 -0.04183599 -0.91455704
		 -0.29358831 0.27819294 -0.91455704 -0.29358831 0.27819294 8.3409657e-05 0.99629682
		 0.085980266 -0.001308878 0.99675643 0.080466434 -1.5042299e-05 0.99675936 0.080441169
		 0.53701907 -0.1646937 -0.82733697 0.68331718 -0.14257742 -0.71606511 0.55052382 -0.16280708
		 -0.8187902 0.68331718 -0.14257742 -0.71606511 0.69910532 -0.13951716 -0.70127511
		 0.55052382 -0.16280708 -0.8187902 -0.16809507 0.19248401 0.96679574 -0.16635585 0.19254172
		 0.967085 -0.035223279 0.19514202 0.9801423 -0.16635585 0.19254172 0.967085 -0.035019007
		 0.19514352 0.98014933 -0.035223279 0.19514202 0.9801423 -0.99363679 -0.021993706
		 -0.11046363 -0.99372756 -0.021835908 -0.10967544 -0.99989104 0.0028818685 0.014478927
		 -0.99372756 -0.021835908 -0.10967544 -0.99988335 0.0029822115 0.014979157 -0.99989104
		 0.0028818685 0.014478927 -0.32887316 -0.18431059 -0.9262138 -0.34320143 -0.18322989
		 -0.92121637 -0.5442332 -0.16392316 -0.82276326 -0.34320143 -0.18322989 -0.92121637
		 -0.55896401 -0.16191295 -0.81323022 -0.5442332 -0.16392316 -0.82276326 -0.32767034
		 0.88251865 -0.33733222 -0.2517482 0.86318189 -0.43765271 0.6049841 0.78032064 0.15841061
		 -0.2517482 0.86318189 -0.43765271 0.46489322 0.81605947 0.34339657 0.6049841 0.78032064
		 0.15841061 -0.26883239 -0.16427554 0.94907463 -0.26883233 -0.16427553 0.94907469
		 0.055481628 -0.15715538 0.98601419 -0.26883233 -0.16427553 0.94907469 0.055481568
		 -0.15715542 0.98601419 0.055481628 -0.15715538 0.98601419 0.91455704 -0.37595648
		 -0.14913805 0.91455698 -0.37595657 -0.14913811 0.78497946 -0.432675 -0.44339556 0.91455698
		 -0.37595657 -0.14913811 0.78497946 -0.43267494 -0.44339556 0.78497946 -0.432675 -0.44339556
		 0.030813206 0.97880077 -0.20248365 0.034129892 0.97773737 -0.20703802 0.013530302
		 0.98609298 -0.16564272 0.034129892 0.97773737 -0.20703802 0.020842869 0.98037148
		 -0.19605453 0.013530302 0.98609298 -0.16564272 0.26885116 0.84092826 0.46963683 0.30215782
		 0.75728339 0.57898408 0.46489322 0.81605947 0.34339657 0.30215782 0.75728339 0.57898408
		 0.52702659 0.72966319 0.43570009 0.46489322 0.81605947 0.34339657 -0.001797453 0.99950927
		 0.031272728 0.012242986 0.99961746 0.024800431 -0.001253791 0.99972582 -0.023382369
		 0.012242986 0.99961746 0.024800431 0.013252334 0.9998818 -0.0077962349 -0.001253791
		 0.99972582 -0.023382369 0.022106459 0.98361266 -0.17893423 0.00051810418 0.9829675
		 -0.18377863 0.02541915 0.9900586 -0.13833955 0.00051810418 0.9829675 -0.18377863
		 -0.0032346742 0.99087799 -0.1347231 0.02541915 0.9900586 -0.13833955 0.8057217 -0.11565867
		 -0.58089215 0.86056828 -0.099448942 -0.49953189 0.81322587 -0.11360687 -0.57075137
		 0.86056828 -0.099448942 -0.49953189 0.86521125 -0.097888686 -0.49175939 0.81322587
		 -0.11360687 -0.57075137 -0.43843839 0.175493 0.88146126 -0.43653384 0.17567499 0.88236982
		 -0.30557746 0.18592133 0.9338392 -0.43653384 0.17567499 0.88236982 -0.30315033 0.18607317
		 0.93459976 -0.30557746 0.18592133 0.9338392 -0.95026916 -0.060809679 -0.30543527
		 -0.95034635 -0.060763501 -0.30520427 -0.97455293 -0.043770257 -0.21984249 -0.95034635
		 -0.060763501 -0.30520427 -0.97472382 -0.043624263 -0.21911266 -0.97455293 -0.043770257
		 -0.21984249 0.86056828 -0.099448942 -0.49953189 0.90447247 -0.083283871 -0.41832206
		 0.86521125 -0.097888686 -0.49175939 0.90447247 -0.083283871 -0.41832206 0.90730625
		 -0.08209718 -0.41237772 0.86521125 -0.097888686 -0.49175939 0.020257374 0.99494255
		 -0.098381795 0.036688007 0.99354804 -0.10731383 0.02541915 0.9900586 -0.13833955
		 0.036688007 0.99354804 -0.10731383 0.039793048 0.98918307 -0.14118555 0.02541915
		 0.9900586 -0.13833955 -0.66262239 0.71705204 -0.21625885 0.36407024 0.92158991 -0.13462865;
	setAttr ".n[7304:7469]" -type "float3"  -0.59627163 0.67488307 -0.4347333 0.36407024
		 0.92158991 -0.13462865 0.32767019 0.94467527 -0.014860622 -0.59627163 0.67488307
		 -0.4347333 0.26885116 0.84092826 0.46963683 -0.1454618 0.84992588 -0.50642556 0.040891044
		 0.852144 0.5217073 -0.1454618 0.84992588 -0.50642556 -0.021630593 0.8443495 -0.53535604
		 0.040891044 0.852144 0.5217073 -0.78497946 -0.23687001 0.5724507 -0.78497946 -0.23687001
		 0.5724507 -0.5607217 -0.19196017 0.80544549 -0.78497946 -0.23687001 0.5724507 -0.5607217
		 -0.19196017 0.80544549 -0.5607217 -0.19196017 0.80544549 0.02649295 0.98268747 -0.18336712
		 -0.018320339 0.98204398 -0.18776053 0.028411111 0.98360199 -0.17810094 -0.018320339
		 0.98204398 -0.18776053 -0.010266506 0.98088086 -0.19433816 0.028411111 0.98360199
		 -0.17810094 -0.39904389 0.83030343 0.38905033 -0.46455085 0.73956847 0.48706368 -0.19111679
		 0.84847528 0.49352214 -0.46455085 0.73956847 0.48706368 -0.22505635 0.76258546 0.60647595
		 -0.19111679 0.84847528 0.49352214 0.46489322 0.81605947 0.34339657 0.52702659 0.72966319
		 0.43570009 0.6049841 0.78032064 0.15841061 0.52702659 0.72966319 0.43570009 0.69133544
		 0.68814605 0.2202507 0.6049841 0.78032064 0.15841061 0.0024400481 0.99501276 -0.099718072
		 -0.025488971 0.99342752 -0.1115888 -0.001253791 0.99972582 -0.023382369 -0.025488971
		 0.99342752 -0.1115888 -0.021933373 0.99869138 -0.046200376 -0.001253791 0.99972582
		 -0.023382369 -0.0007465969 0.9999997 -7.0979811e-05 -0.00074694323 0.9999997 -7.0947302e-05
		 -0.00074694236 0.9999997 -7.2928473e-05 -0.00074664014 0.9999997 -7.1976086e-05 -0.00074686878
		 0.9999997 -7.2192241e-05 -0.00074686843 0.9999997 -7.328279e-05 -0.64308751 -0.0004218602
		 0.76579255 -0.34238681 -0.00018318059 0.93955904 -0.64308769 -0.0004218976 0.76579243
		 -0.34238681 -0.00018318059 0.93955904 -0.34238684 -0.0001834585 0.93955904 -0.64308769
		 -0.0004218976 0.76579243 -0.00074664003 0.9999997 -7.2876479e-05 -0.00074673363 0.9999997
		 -7.3060117e-05 -0.00074662181 0.9999997 -7.2990239e-05 -0.00074673363 0.9999997 -7.3060117e-05
		 -0.00074660825 0.9999997 -7.339655e-05 -0.00074662181 0.9999997 -7.2990239e-05 -0.34238684
		 -0.0001834585 0.93955904 -0.34238681 -0.00018318059 0.93955904 -0.00038809419 7.5961165e-05
		 0.99999994 -0.34238681 -0.00018318059 0.93955904 -0.00038789271 7.6612894e-05 0.99999994
		 -0.00038809419 7.5961165e-05 0.99999994 0.34165323 0.00032449223 0.93982601 0.3416529
		 0.00032357397 0.93982613 -0.00038789271 7.6612894e-05 0.99999994 0.3416529 0.00032357397
		 0.93982613 -0.00038809419 7.5961165e-05 0.99999994 -0.00038789271 7.6612894e-05 0.99999994
		 -0.0007465969 0.9999997 -7.0979811e-05 -0.00074694236 0.9999997 -7.2928473e-05 -0.00074676197
		 0.9999997 -7.2975614e-05 -0.00074694236 0.9999997 -7.2928473e-05 -0.0007465966 0.9999997
		 -7.2049224e-05 -0.00074676197 0.9999997 -7.2975614e-05 0.64248872 0.00053448934 0.76629496
		 0.6424886 0.00053438696 0.76629502 0.34165323 0.00032449223 0.93982601 0.6424886
		 0.00053438696 0.76629502 0.3416529 0.00032357397 0.93982613 0.34165323 0.00032449223
		 0.93982601 -0.00074676197 0.9999997 -7.2975614e-05 -0.0007465966 0.9999997 -7.2049224e-05
		 -0.00074683368 0.9999997 -7.3016236e-05 -0.0007465966 0.9999997 -7.2049224e-05 -0.00074665307
		 0.9999997 -7.3238909e-05 -0.00074683368 0.9999997 -7.3016236e-05 0.98473942 0.00074710097
		 0.17403361 0.98473948 0.00074709929 0.17403348 0.86583102 0.00068222743 0.50033611
		 0.98473948 0.00074709929 0.17403348 0.86583114 0.00068239972 0.50033587 0.86583102
		 0.00068222743 0.50033611 -0.00074662181 0.9999997 -7.2990239e-05 -0.00074672513 0.9999997
		 -7.2613184e-05 -0.00074664003 0.9999997 -7.2876479e-05 -0.00074672513 0.9999997 -7.2613184e-05
		 -0.00074662175 0.9999997 -7.3221025e-05 -0.00074664003 0.9999997 -7.2876479e-05 0.86583102
		 0.00068222743 0.50033611 0.86583114 0.00068239972 0.50033587 0.64248872 0.00053448934
		 0.76629496 0.86583114 0.00068239972 0.50033587 0.6424886 0.00053438696 0.76629502
		 0.64248872 0.00053448934 0.76629496 -0.00074672513 0.9999997 -7.2613184e-05 -0.00074683368
		 0.9999997 -7.3016236e-05 -0.00074662175 0.9999997 -7.3221025e-05 -0.00074683368 0.9999997
		 -7.3016236e-05 -0.00074665307 0.9999997 -7.3238909e-05 -0.00074662175 0.9999997 -7.3221025e-05
		 -0.98473948 -0.00074769853 -0.17403343 -0.86583054 -0.00068417686 -0.50033689 -0.9847396
		 -0.00074769865 -0.17403263 -0.86583054 -0.00068417686 -0.50033689 -0.86583096 -0.00068410457
		 -0.50033617 -0.9847396 -0.00074769865 -0.17403263 0.64308828 0.00042123123 -0.76579195
		 0.64308751 0.00042190086 -0.76579255 0.86621904 0.00060923398 -0.49966407 0.64308751
		 0.00042190086 -0.76579255 0.86621922 0.00060887315 -0.4996638 0.86621904 0.00060923398
		 -0.49966407 -0.86621946 -0.00060752087 0.49966338 -0.98487508 -0.00072110089 0.17326427
		 -0.8662191 -0.00060775661 0.49966401 -0.98487508 -0.00072110089 0.17326427 -0.98487496
		 -0.00072109676 0.17326511 -0.8662191 -0.00060775661 0.49966401 0.34238544 0.00018844641
		 -0.93955958 0.00038873102 -7.1007409e-05 -0.99999994 0.34238505 0.00018948819 -0.9395597
		 0.00038873102 -7.1007409e-05 -0.99999994 0.00038970599 -6.9747846e-05 -0.99999994
		 0.34238505 0.00018948819 -0.9395597 -0.98487508 -0.00072110089 0.17326427 -0.98473948
		 -0.00074769853 -0.17403343 -0.98487496 -0.00072109676 0.17326511 -0.98473948 -0.00074769853
		 -0.17403343 -0.9847396 -0.00074769865 -0.17403263 -0.98487496 -0.00072109676 0.17326511
		 0.64308751 0.00042190086 -0.76579255 0.64308828 0.00042123123 -0.76579195 0.34238505
		 0.00018948819 -0.9395597 0.64308828 0.00042123123 -0.76579195 0.34238544 0.00018844641
		 -0.93955958 0.34238505 0.00018948819 -0.9395597 -0.64308769 -0.0004218976 0.76579243
		 -0.86621946 -0.00060752087 0.49966338 -0.64308751 -0.0004218602 0.76579255 -0.86621946
		 -0.00060752087 0.49966338 -0.8662191 -0.00060775661 0.49966401 -0.64308751 -0.0004218602
		 0.76579255 -0.3416529 -0.00032592082 -0.93982613 0.00038970599 -6.9747846e-05 -0.99999994
		 -0.34165406 -0.00032717062 -0.93982571 0.00038970599 -6.9747846e-05 -0.99999994 0.00038873102
		 -7.1007409e-05 -0.99999994 -0.34165406 -0.00032717062 -0.93982571 0.98487508 0.00072169129
		 -0.17326455 0.98487502 0.00072169403 -0.17326465 0.98473942 0.00074710097 0.17403361
		 0.98487502 0.00072169403 -0.17326465 0.98473948 0.00074709929 0.17403348 0.98473942
		 0.00074710097 0.17403361;
	setAttr ".n[7470:7635]" -type "float3"  -0.86583054 -0.00068417686 -0.50033689
		 -0.6424877 -0.00053828431 -0.76629585 -0.86583096 -0.00068410457 -0.50033617 -0.6424877
		 -0.00053828431 -0.76629585 -0.64248818 -0.00053821929 -0.76629543 -0.86583096 -0.00068410457
		 -0.50033617 -0.00074670184 0.9999997 -7.3250274e-05 -0.00074663968 0.9999997 -7.2887844e-05
		 -0.00074673363 0.9999997 -7.3060117e-05 -0.00074663968 0.9999997 -7.2887844e-05 -0.00074660825
		 0.9999997 -7.339655e-05 -0.00074673363 0.9999997 -7.3060117e-05 0.86621904 0.00060923398
		 -0.49966407 0.86621922 0.00060887315 -0.4996638 0.98487508 0.00072169129 -0.17326455
		 0.86621922 0.00060887315 -0.4996638 0.98487502 0.00072169403 -0.17326465 0.98487508
		 0.00072169129 -0.17326455 -0.6424877 -0.00053828431 -0.76629585 -0.3416529 -0.00032592082
		 -0.93982613 -0.64248818 -0.00053821929 -0.76629543 -0.3416529 -0.00032592082 -0.93982613
		 -0.34165406 -0.00032717062 -0.93982571 -0.64248818 -0.00053821929 -0.76629543 -0.00074664014
		 0.9999997 -7.1976086e-05 -0.00074686843 0.9999997 -7.328279e-05 -0.00074670184 0.9999997
		 -7.3250274e-05 -0.00074686843 0.9999997 -7.328279e-05 -0.00074663968 0.9999997 -7.2887844e-05
		 -0.00074670184 0.9999997 -7.3250274e-05 -0.19685917 0.94442493 -0.26326412 0.012814744
		 0.98962951 -0.14307064 -0.067283362 0.92772835 -0.36714166 0.012814744 0.98962951
		 -0.14307064 0.099592991 0.92599976 -0.36415061 -0.067283362 0.92772835 -0.36714166
		 0.099592991 0.92599976 -0.36415061 0.012814744 0.98962951 -0.14307064 0.22568204
		 0.9400481 -0.25568968 0.012814744 0.98962951 -0.14307064 0.25198349 0.96329921 -0.092514358
		 0.22568204 0.9400481 -0.25568968 0.25198349 0.96329921 -0.092514358 0.012814744 0.98962951
		 -0.14307064 0.16619545 0.98487353 0.049022753 0.012814744 0.98962951 -0.14307064
		 0.0084615694 0.99467653 0.10269832 0.16619545 0.98487353 0.049022753 0.0084615694
		 0.99467653 0.10269832 0.012814744 0.98962951 -0.14307064 -0.14741598 0.98812193 0.043400094
		 0.012814744 0.98962951 -0.14307064 -0.22850421 0.96827632 -0.10112784 -0.14741598
		 0.98812193 0.043400094 -0.19685917 0.94442493 -0.26326412 -0.22850421 0.96827632
		 -0.10112784 0.012814744 0.98962951 -0.14307064 -0.071245298 0.9319815 -0.35543582
		 -0.19784537 0.94836754 -0.24790376 0.015299965 0.9909991 -0.13299133 -0.19784537
		 0.94836754 -0.24790376 -0.22492632 0.97068518 -0.08472573 0.015299965 0.9909991 -0.13299133
		 -0.071245298 0.9319815 -0.35543582 0.015299965 0.9909991 -0.13299133 0.095635399
		 0.92919481 -0.35700268 0.015299965 0.9909991 -0.13299133 0.22470784 0.9413116 -0.25187072
		 0.095635399 0.92919481 -0.35700268 0.22470784 0.9413116 -0.25187072 0.015299965 0.9909991
		 -0.13299133 0.25557676 0.96266156 -0.089237124 0.015299965 0.9909991 -0.13299133
		 0.17380238 0.98325467 0.054799333 0.25557676 0.96266156 -0.089237124 0.17380238 0.98325467
		 0.054799333 0.015299965 0.9909991 -0.13299133 0.017649043 0.99345571 0.11284618 0.015299965
		 0.9909991 -0.13299133 -0.13982005 0.98849177 0.057744283 0.017649043 0.99345571 0.11284618
		 -0.22492632 0.97068518 -0.08472573 -0.13982005 0.98849177 0.057744283 0.015299965
		 0.9909991 -0.13299133 0.30804622 0.75160545 -0.58326393 0.42605075 0.77031708 -0.47443897
		 0.51379979 0.04232334 -0.85686553 0.42605075 0.77031708 -0.47443897 0.76329935 0.058262944
		 -0.64341241 0.51379979 0.04232334 -0.85686553 0.51379979 0.04232334 -0.85686553 0.18126944
		 0.016662888 -0.98329228 0.30804622 0.75160545 -0.58326393 0.18126944 0.016662888
		 -0.98329228 0.093962297 0.75629228 -0.64745116 0.30804622 0.75160545 -0.58326393
		 0.18126944 0.016662888 -0.98329228 -0.14707437 0.031833887 -0.98861301 0.093962297
		 0.75629228 -0.64745116 -0.14707437 0.031833887 -0.98861301 -0.067467272 0.73630053
		 -0.6732828 0.093962297 0.75629228 -0.64745116 0.54036313 0.7917456 -0.28486228 0.55982584
		 0.81886059 -0.12673752 0.93528461 0.11221866 -0.33563316 0.55982584 0.81886059 -0.12673752
		 0.9891296 0.1464574 -0.013148695 0.93528461 0.11221866 -0.33563316 0.93528461 0.11221866
		 -0.33563316 0.76329935 0.058262944 -0.64341241 0.54036313 0.7917456 -0.28486228 0.76329935
		 0.058262944 -0.64341241 0.42605075 0.77031708 -0.47443897 0.54036313 0.7917456 -0.28486228
		 0.55982584 0.81886059 -0.12673752 0.53535014 0.83940905 0.093769222 0.9891296 0.1464574
		 -0.013148695 0.53535014 0.83940905 0.093769222 0.92016524 0.20882225 0.33119366 0.9891296
		 0.1464574 -0.013148695 0.53535014 0.83940905 0.093769222 0.43036905 0.87665498 0.21507798
		 0.92016524 0.20882225 0.33119366 0.43036905 0.87665498 0.21507798 0.75309092 0.23997985
		 0.61258769 0.92016524 0.20882225 0.33119366 0.43036905 0.87665498 0.21507798 0.27572143
		 0.88385224 0.37786627 0.75309092 0.23997985 0.61258769 0.27572143 0.88385224 0.37786627
		 0.47551495 0.28692508 0.83160061 0.75309092 0.23997985 0.61258769 0.27572143 0.88385224
		 0.37786627 0.11476772 0.90793115 0.40309981 0.47551495 0.28692508 0.83160061 0.11476772
		 0.90793115 0.40309981 0.16562961 0.29506844 0.94101083 0.47551495 0.28692508 0.83160061
		 0.11476772 0.90793115 0.40309981 -0.10796458 0.89635772 0.42998433 0.16562961 0.29506844
		 0.94101083 -0.10796458 0.89635772 0.42998433 -0.19060513 0.30998525 0.9314391 0.16562961
		 0.29506844 0.94101083 -0.10796458 0.89635772 0.42998433 -0.24947551 0.90441126 0.34612468
		 -0.19060513 0.30998525 0.9314391 -0.24947551 0.90441126 0.34612468 -0.49837539 0.2859486
		 0.81844693 -0.19060513 0.30998525 0.9314391 -0.24947551 0.90441126 0.34612468 -0.42941746
		 0.87679118 0.21642072 -0.49837539 0.2859486 0.81844693 -0.42941746 0.87679118 0.21642072
		 -0.76651514 0.26721427 0.58399582 -0.49837539 0.2859486 0.81844693 -0.42941746 0.87679118
		 0.21642072 -0.50244921 0.86151338 0.073071547 -0.76651514 0.26721427 0.58399582 -0.50244921
		 0.86151338 0.073071547 -0.92822909 0.21688366 0.30224523 -0.76651514 0.26721427 0.58399582
		 -0.50244921 0.86151338 0.073071547 -0.55540001 0.81983227 -0.13930494 -0.92822909
		 0.21688366 0.30224523 -0.55540001 0.81983227 -0.13930494;
	setAttr ".n[7636:7801]" -type "float3"  -0.98273903 0.17861982 -0.048155941 -0.92822909
		 0.21688366 0.30224523 -0.55540001 0.81983227 -0.13930494 -0.49918804 0.81507939 -0.29403558
		 -0.98273903 0.17861982 -0.048155941 -0.49918804 0.81507939 -0.29403558 -0.92279804
		 0.12019683 -0.36605528 -0.98273903 0.17861982 -0.048155941 -0.49918804 0.81507939
		 -0.29403558 -0.40024868 0.77422297 -0.4902854 -0.92279804 0.12019683 -0.36605528
		 -0.40024868 0.77422297 -0.4902854 -0.73810178 0.085661948 -0.66922927 -0.92279804
		 0.12019683 -0.36605528 -0.40024868 0.77422297 -0.4902854 -0.27101567 0.76311505 -0.58669066
		 -0.73810178 0.085661948 -0.66922927 -0.27101567 0.76311505 -0.58669066 -0.4846223
		 0.041122906 -0.87375635 -0.73810178 0.085661948 -0.66922927 -0.14707437 0.031833887
		 -0.98861301 -0.4846223 0.041122906 -0.87375635 -0.067467272 0.73630053 -0.6732828
		 -0.4846223 0.041122906 -0.87375635 -0.27101567 0.76311505 -0.58669066 -0.067467272
		 0.73630053 -0.6732828 0.093962297 0.75629228 -0.64745116 0.099592991 0.92599976 -0.36415061
		 0.30804622 0.75160545 -0.58326393 0.54036313 0.7917456 -0.28486228 0.42605075 0.77031708
		 -0.47443897 0.22568204 0.9400481 -0.25568968 0.55982584 0.81886059 -0.12673752 0.25198349
		 0.96329921 -0.092514358 0.53535014 0.83940905 0.093769222 0.43036905 0.87665498 0.21507798
		 0.16619545 0.98487353 0.049022753 0.27572143 0.88385224 0.37786627 -0.10796458 0.89635772
		 0.42998433 0.11476772 0.90793115 0.40309981 0.0084615694 0.99467653 0.10269832 -0.42941746
		 0.87679118 0.21642072 -0.24947551 0.90441126 0.34612468 -0.14741598 0.98812193 0.043400094
		 -0.50244921 0.86151338 0.073071547 -0.22850421 0.96827632 -0.10112784 -0.55540001
		 0.81983227 -0.13930494 -0.40024868 0.77422297 -0.4902854 -0.49918804 0.81507939 -0.29403558
		 -0.19685917 0.94442493 -0.26326412 -0.27101567 0.76311505 -0.58669066 -0.067283362
		 0.92772835 -0.36714166 -0.067467272 0.73630053 -0.6732828 -0.50244921 0.86151338
		 0.073071547 -0.42941746 0.87679118 0.21642072 -0.22850421 0.96827632 -0.10112784
		 -0.42941746 0.87679118 0.21642072 -0.14741598 0.98812193 0.043400094 -0.22850421
		 0.96827632 -0.10112784 -0.19060513 0.30998525 0.9314391 -0.18961796 0.14289194 0.97140461
		 0.16562961 0.29506844 0.94101083 -0.18961796 0.14289194 0.97140461 0.1576018 0.13929494
		 0.97762907 0.16562961 0.29506844 0.94101083 -0.14741598 0.98812193 0.043400094 -0.24947551
		 0.90441126 0.34612468 0.0084615694 0.99467653 0.10269832 -0.24947551 0.90441126 0.34612468
		 -0.10796458 0.89635772 0.42998433 0.0084615694 0.99467653 0.10269832 0.47551495 0.28692508
		 0.83160061 0.48581451 0.11889835 0.86593735 0.75309092 0.23997985 0.61258769 0.48581451
		 0.11889835 0.86593735 0.75543153 0.084160127 0.64980018 0.75309092 0.23997985 0.61258769
		 0.48581451 0.11889835 0.86593735 0.47551495 0.28692508 0.83160061 0.1576018 0.13929494
		 0.97762907 0.47551495 0.28692508 0.83160061 0.16562961 0.29506844 0.94101083 0.1576018
		 0.13929494 0.97762907 0.93393254 0.039271947 0.35528538 0.92016524 0.20882225 0.33119366
		 0.75543153 0.084160127 0.64980018 0.92016524 0.20882225 0.33119366 0.75309092 0.23997985
		 0.61258769 0.75543153 0.084160127 0.64980018 -0.15760462 -0.13929565 -0.97762853
		 -0.14707437 0.031833887 -0.98861301 0.18962041 -0.14289106 -0.97140425 -0.14707437
		 0.031833887 -0.98861301 0.18126944 0.016662888 -0.98329228 0.18962041 -0.14289106
		 -0.97140425 0.0084615694 0.99467653 0.10269832 0.11476772 0.90793115 0.40309981 0.16619545
		 0.98487353 0.049022753 0.11476772 0.90793115 0.40309981 0.27572143 0.88385224 0.37786627
		 0.16619545 0.98487353 0.049022753 0.93393254 0.039271947 0.35528538 0.99978572 -0.010355108
		 0.017923187 0.92016524 0.20882225 0.33119366 0.99978572 -0.010355108 0.017923187
		 0.9891296 0.1464574 -0.013148695 0.92016524 0.20882225 0.33119366 -0.15760462 -0.13929565
		 -0.97762853 -0.48581517 -0.11889651 -0.86593717 -0.14707437 0.031833887 -0.98861301
		 -0.48581517 -0.11889651 -0.86593717 -0.4846223 0.041122906 -0.87375635 -0.14707437
		 0.031833887 -0.98861301 0.94505048 -0.058731597 -0.32160574 0.93528461 0.11221866
		 -0.33563316 0.99978572 -0.010355108 0.017923187 0.93528461 0.11221866 -0.33563316
		 0.9891296 0.1464574 -0.013148695 0.99978572 -0.010355108 0.017923187 -0.73810178
		 0.085661948 -0.66922927 -0.4846223 0.041122906 -0.87375635 -0.75543201 -0.084158979
		 -0.64979982 -0.4846223 0.041122906 -0.87375635 -0.48581517 -0.11889651 -0.86593717
		 -0.75543201 -0.084158979 -0.64979982 0.16619545 0.98487353 0.049022753 0.43036905
		 0.87665498 0.21507798 0.25198349 0.96329921 -0.092514358 0.43036905 0.87665498 0.21507798
		 0.53535014 0.83940905 0.093769222 0.25198349 0.96329921 -0.092514358 0.099592991
		 0.92599976 -0.36415061 0.093962297 0.75629228 -0.64745116 -0.067283362 0.92772835
		 -0.36714166 0.093962297 0.75629228 -0.64745116 -0.067467272 0.73630053 -0.6732828
		 -0.067283362 0.92772835 -0.36714166 0.93528461 0.11221866 -0.33563316 0.94505048
		 -0.058731597 -0.32160574 0.76329935 0.058262944 -0.64341241 0.94505048 -0.058731597
		 -0.32160574 0.77632946 -0.10002319 -0.62234074 0.76329935 0.058262944 -0.64341241
		 -0.75543201 -0.084158979 -0.64979982 -0.93393201 -0.039268468 -0.35528716 -0.73810178
		 0.085661948 -0.66922927 -0.93393201 -0.039268468 -0.35528716 -0.92279804 0.12019683
		 -0.36605528 -0.73810178 0.085661948 -0.66922927 -0.77632987 0.10002702 0.62233955
		 -0.76651514 0.26721427 0.58399582 -0.94505179 0.058732931 0.3216016 -0.76651514 0.26721427
		 0.58399582 -0.92822909 0.21688366 0.30224523 -0.94505179 0.058732931 0.3216016 0.51379979
		 0.04232334 -0.85686553 0.76329935 0.058262944 -0.64341241 0.51397008 -0.12925236
		 -0.84801447 0.76329935 0.058262944 -0.64341241 0.77632946 -0.10002319 -0.62234074
		 0.51397008 -0.12925236 -0.84801447 -0.98273903 0.17861982 -0.048155941 -0.92279804
		 0.12019683 -0.36605528 -0.99978578 0.010357288 -0.017921042 -0.92279804 0.12019683
		 -0.36605528 -0.93393201 -0.039268468 -0.35528716;
	setAttr ".n[7802:7967]" -type "float3"  -0.99978578 0.010357288 -0.017921042
		 0.55982584 0.81886059 -0.12673752 0.54036313 0.7917456 -0.28486228 0.25198349 0.96329921
		 -0.092514358 0.54036313 0.7917456 -0.28486228 0.22568204 0.9400481 -0.25568968 0.25198349
		 0.96329921 -0.092514358 -0.27101567 0.76311505 -0.58669066 -0.40024868 0.77422297
		 -0.4902854 -0.067283362 0.92772835 -0.36714166 -0.40024868 0.77422297 -0.4902854
		 -0.19685917 0.94442493 -0.26326412 -0.067283362 0.92772835 -0.36714166 0.51397008
		 -0.12925236 -0.84801447 0.18962041 -0.14289106 -0.97140425 0.51379979 0.04232334
		 -0.85686553 0.18962041 -0.14289106 -0.97140425 0.18126944 0.016662888 -0.98329228
		 0.51379979 0.04232334 -0.85686553 -0.99978578 0.010357288 -0.017921042 -0.94505179
		 0.058732931 0.3216016 -0.98273903 0.17861982 -0.048155941 -0.94505179 0.058732931
		 0.3216016 -0.92822909 0.21688366 0.30224523 -0.98273903 0.17861982 -0.048155941 -0.19060513
		 0.30998525 0.9314391 -0.49837539 0.2859486 0.81844693 -0.18961796 0.14289194 0.97140461
		 -0.49837539 0.2859486 0.81844693 -0.51397097 0.12925497 0.84801358 -0.18961796 0.14289194
		 0.97140461 0.42605075 0.77031708 -0.47443897 0.30804622 0.75160545 -0.58326393 0.22568204
		 0.9400481 -0.25568968 0.30804622 0.75160545 -0.58326393 0.099592991 0.92599976 -0.36415061
		 0.22568204 0.9400481 -0.25568968 -0.19685917 0.94442493 -0.26326412 -0.49918804 0.81507939
		 -0.29403558 -0.22850421 0.96827632 -0.10112784 -0.49918804 0.81507939 -0.29403558
		 -0.55540001 0.81983227 -0.13930494 -0.22850421 0.96827632 -0.10112784 -0.77632987
		 0.10002702 0.62233955 -0.51397097 0.12925497 0.84801358 -0.76651514 0.26721427 0.58399582
		 -0.51397097 0.12925497 0.84801358 -0.49837539 0.2859486 0.81844693 -0.76651514 0.26721427
		 0.58399582 0.29693741 0.75586712 -0.58351785 0.41796881 0.77269208 -0.47775418 0.49062201
		 0.048283543 -0.87003374 0.41796881 0.77269208 -0.47775418 0.74591935 0.060414974
		 -0.6632905 0.49062201 0.048283543 -0.87003374 0.49062201 0.048283543 -0.87003374
		 0.15462671 0.026017699 -0.98763031 0.29693741 0.75586712 -0.58351785 0.15462671 0.026017699
		 -0.98763031 0.084900059 0.75462884 -0.65063608 0.29693741 0.75586712 -0.58351785
		 0.15462671 0.026017699 -0.98763031 -0.17363529 0.043263197 -0.9838593 0.084900059
		 0.75462884 -0.65063608 -0.17363529 0.043263197 -0.9838593 -0.076644704 0.75209498
		 -0.65458292 0.084900059 0.75462884 -0.65063608 0.5375188 0.7913968 -0.29114366 0.56143892
		 0.81670618 -0.13333182 0.92653668 0.1100319 -0.35975367 0.56143892 0.81670618 -0.13333182
		 0.98933071 0.14050457 -0.038513135 0.92653668 0.1100319 -0.35975367 0.92653668 0.1100319
		 -0.35975367 0.74591935 0.060414974 -0.6632905 0.5375188 0.7913968 -0.29114366 0.74591935
		 0.060414974 -0.6632905 0.41796881 0.77269208 -0.47775418 0.5375188 0.7913968 -0.29114366
		 0.56143892 0.81670618 -0.13333182 0.54309052 0.83505422 0.087960817 0.98933071 0.14050457
		 -0.038513135 0.54309052 0.83505422 0.087960817 0.93013829 0.19962139 0.30821112 0.98933071
		 0.14050457 -0.038513135 0.54309052 0.83505422 0.087960817 0.44168299 0.87165052 0.21246535
		 0.93013829 0.19962139 0.30821112 0.44168299 0.87165052 0.21246535 0.77096397 0.22880802
		 0.59435803 0.93013829 0.19962139 0.30821112 0.44168299 0.87165052 0.21246535 0.29156029
		 0.87806332 0.37946984 0.77096397 0.22880802 0.59435803 0.29156029 0.87806332 0.37946984
		 0.49974102 0.27512586 0.82131886 0.77096397 0.22880802 0.59435803 0.29156029 0.87806332
		 0.37946984 0.13150813 0.90286189 0.40932378 0.49974102 0.27512586 0.82131886 0.13150813
		 0.90286189 0.40932378 0.19299613 0.28400981 0.93919694 0.49974102 0.27512586 0.82131886
		 0.13150813 0.90286189 0.40932378 -0.090485454 0.89237207 0.4421362 0.19299613 0.28400981
		 0.93919694 -0.090485454 0.89237207 0.4421362 -0.16326249 0.30121875 0.93947464 0.19299613
		 0.28400981 0.93919694 -0.090485454 0.89237207 0.4421362 -0.23416643 0.90218878 0.36224499
		 -0.16326249 0.30121875 0.93947464 -0.23416643 0.90218878 0.36224499 -0.47413418 0.28027934
		 0.8346498 -0.16326249 0.30121875 0.93947464 -0.23416643 0.90218878 0.36224499 -0.41773838
		 0.87705851 0.23719828 -0.47413418 0.28027934 0.8346498 -0.41773838 0.87705851 0.23719828
		 -0.74865103 0.26569161 0.60739571 -0.47413418 0.28027934 0.8346498 -0.41773838 0.87705851
		 0.23719828 -0.49472952 0.86375791 0.095734105 -0.74865103 0.26569161 0.60739571 -0.49472952
		 0.86375791 0.095734105 -0.91827059 0.21936154 0.32963556 -0.74865103 0.26569161 0.60739571
		 -0.49472952 0.86375791 0.095734105 -0.54311633 0.83119881 -0.11888303 -0.91827059
		 0.21936154 0.32963556 -0.54311633 0.83119881 -0.11888303 -0.98251325 0.18516503 -0.019534215
		 -0.91827059 0.21936154 0.32963556 -0.54311633 0.83119881 -0.11888303 -0.5108285 0.81406999
		 -0.27630472 -0.98251325 0.18516503 -0.019534215 -0.5108285 0.81406999 -0.27630472
		 -0.93159729 0.12976074 -0.33954182 -0.98251325 0.18516503 -0.019534215 -0.5108285
		 0.81406999 -0.27630472 -0.41810066 0.77433163 -0.47497615 -0.93159729 0.12976074
		 -0.33954182 -0.41810066 0.77433163 -0.47497615 -0.75542253 0.097322173 -0.64797002
		 -0.93159729 0.12976074 -0.33954182 -0.41810066 0.77433163 -0.47497615 -0.2784034
		 0.77880383 -0.56209981 -0.75542253 0.097322173 -0.64797002 -0.2784034 0.77880383
		 -0.56209981 -0.50787616 0.053404201 -0.8597731 -0.75542253 0.097322173 -0.64797002
		 -0.17363529 0.043263197 -0.9838593 -0.50787616 0.053404201 -0.8597731 -0.076644704
		 0.75209498 -0.65458292 -0.50787616 0.053404201 -0.8597731 -0.2784034 0.77880383 -0.56209981
		 -0.076644704 0.75209498 -0.65458292 0.29693741 0.75586712 -0.58351785 0.084900059
		 0.75462884 -0.65063608 0.095635399 0.92919481 -0.35700268 0.41796881 0.77269208 -0.47775418
		 0.22470784 0.9413116 -0.25187072 0.5375188 0.7913968 -0.29114366 0.56143892 0.81670618
		 -0.13333182 0.25557676 0.96266156 -0.089237124 0.54309052 0.83505422 0.087960817;
	setAttr ".n[7968:8133]" -type "float3"  0.44168299 0.87165052 0.21246535 0.17380238
		 0.98325467 0.054799333 0.29156029 0.87806332 0.37946984 -0.090485454 0.89237207 0.4421362
		 0.13150813 0.90286189 0.40932378 0.017649043 0.99345571 0.11284618 -0.41773838 0.87705851
		 0.23719828 -0.23416643 0.90218878 0.36224499 -0.13982005 0.98849177 0.057744283 -0.49472952
		 0.86375791 0.095734105 -0.22492632 0.97068518 -0.08472573 -0.54311633 0.83119881
		 -0.11888303 -0.41810066 0.77433163 -0.47497615 -0.5108285 0.81406999 -0.27630472
		 -0.19784537 0.94836754 -0.24790376 -0.076644704 0.75209498 -0.65458292 -0.2784034
		 0.77880383 -0.56209981 -0.071245298 0.9319815 -0.35543582 -0.49472952 0.86375791
		 0.095734105 -0.41773838 0.87705851 0.23719828 -0.22492632 0.97068518 -0.08472573
		 -0.41773838 0.87705851 0.23719828 -0.13982005 0.98849177 0.057744283 -0.22492632
		 0.97068518 -0.08472573 -0.16326249 0.30121875 0.93947464 -0.16226649 0.13370521 0.97764641
		 0.19299613 0.28400981 0.93919694 -0.16226649 0.13370521 0.97764641 0.18496455 0.1279072
		 0.97438592 0.19299613 0.28400981 0.93919694 0.50988775 0.10668048 0.85360044 0.49974102
		 0.27512586 0.82131886 0.18496455 0.1279072 0.97438592 0.49974102 0.27512586 0.82131886
		 0.19299613 0.28400981 0.93919694 0.18496455 0.1279072 0.97438592 -0.13982005 0.98849177
		 0.057744283 -0.23416643 0.90218878 0.36224499 0.017649043 0.99345571 0.11284618 -0.23416643
		 0.90218878 0.36224499 -0.090485454 0.89237207 0.4421362 0.017649043 0.99345571 0.11284618
		 0.49974102 0.27512586 0.82131886 0.50988775 0.10668048 0.85360044 0.77096397 0.22880802
		 0.59435803 0.50988775 0.10668048 0.85360044 0.77331007 0.072587319 0.62985921 0.77096397
		 0.22880802 0.59435803 0.94346189 0.029738506 0.33014441 0.93013829 0.19962139 0.30821112
		 0.77331007 0.072587319 0.62985921 0.93013829 0.19962139 0.30821112 0.77096397 0.22880802
		 0.59435803 0.77331007 0.072587319 0.62985921 -0.18496577 -0.12790696 -0.97438568
		 -0.17363529 0.043263197 -0.9838593 0.1622698 -0.13370465 -0.97764593 -0.17363529
		 0.043263197 -0.9838593 0.15462671 0.026017699 -0.98763031 0.1622698 -0.13370465 -0.97764593
		 0.93557829 -0.061119355 -0.34778976 0.92653668 0.1100319 -0.35975367 0.99981654 -0.016695531
		 -0.0093868058 0.92653668 0.1100319 -0.35975367 0.98933071 0.14050457 -0.038513135
		 0.99981654 -0.016695531 -0.0093868058 -0.77331215 -0.072589464 -0.62985641 -0.75542253
		 0.097322173 -0.64797002 -0.50988674 -0.10668129 -0.85360098 -0.75542253 0.097322173
		 -0.64797002 -0.50787616 0.053404201 -0.8597731 -0.50988674 -0.10668129 -0.85360098
		 0.017649043 0.99345571 0.11284618 0.13150813 0.90286189 0.40932378 0.17380238 0.98325467
		 0.054799333 0.13150813 0.90286189 0.40932378 0.29156029 0.87806332 0.37946984 0.17380238
		 0.98325467 0.054799333 0.94346189 0.029738506 0.33014441 0.99981654 -0.016695531
		 -0.0093868058 0.93013829 0.19962139 0.30821112 0.99981654 -0.016695531 -0.0093868058
		 0.98933071 0.14050457 -0.038513135 0.93013829 0.19962139 0.30821112 -0.18496577 -0.12790696
		 -0.97438568 -0.50988674 -0.10668129 -0.85360098 -0.17363529 0.043263197 -0.9838593
		 -0.50988674 -0.10668129 -0.85360098 -0.50787616 0.053404201 -0.8597731 -0.17363529
		 0.043263197 -0.9838593 0.17380238 0.98325467 0.054799333 0.44168299 0.87165052 0.21246535
		 0.25557676 0.96266156 -0.089237124 0.44168299 0.87165052 0.21246535 0.54309052 0.83505422
		 0.087960817 0.25557676 0.96266156 -0.089237124 0.084900059 0.75462884 -0.65063608
		 -0.076644704 0.75209498 -0.65458292 0.095635399 0.92919481 -0.35700268 -0.076644704
		 0.75209498 -0.65458292 -0.071245298 0.9319815 -0.35543582 0.095635399 0.92919481
		 -0.35700268 0.92653668 0.1100319 -0.35975367 0.93557829 -0.061119355 -0.34778976
		 0.74591935 0.060414974 -0.6632905 0.93557829 -0.061119355 -0.34778976 0.7584973 -0.098167442
		 -0.64423984 0.74591935 0.060414974 -0.6632905 -0.75542253 0.097322173 -0.64797002
		 -0.77331215 -0.072589464 -0.62985641 -0.93159729 0.12976074 -0.33954182 -0.77331215
		 -0.072589464 -0.62985641 -0.94346136 -0.029740443 -0.33014566 -0.93159729 0.12976074
		 -0.33954182 0.48992783 -0.12337662 -0.86298835 0.49062201 0.048283543 -0.87003374
		 0.7584973 -0.098167442 -0.64423984 0.49062201 0.048283543 -0.87003374 0.74591935
		 0.060414974 -0.6632905 0.7584973 -0.098167442 -0.64423984 -0.98251325 0.18516503
		 -0.019534215 -0.93159729 0.12976074 -0.33954182 -0.99981654 0.01669541 0.0093874885
		 -0.93159729 0.12976074 -0.33954182 -0.94346136 -0.029740443 -0.33014566 -0.99981654
		 0.01669541 0.0093874885 0.56143892 0.81670618 -0.13333182 0.5375188 0.7913968 -0.29114366
		 0.25557676 0.96266156 -0.089237124 0.5375188 0.7913968 -0.29114366 0.22470784 0.9413116
		 -0.25187072 0.25557676 0.96266156 -0.089237124 -0.071245298 0.9319815 -0.35543582
		 -0.2784034 0.77880383 -0.56209981 -0.19784537 0.94836754 -0.24790376 -0.2784034 0.77880383
		 -0.56209981 -0.41810066 0.77433163 -0.47497615 -0.19784537 0.94836754 -0.24790376
		 0.48992783 -0.12337662 -0.86298835 0.1622698 -0.13370465 -0.97764593 0.49062201 0.048283543
		 -0.87003374 0.1622698 -0.13370465 -0.97764593 0.15462671 0.026017699 -0.98763031
		 0.49062201 0.048283543 -0.87003374 -0.98251325 0.18516503 -0.019534215 -0.99981654
		 0.01669541 0.0093874885 -0.91827059 0.21936154 0.32963556 -0.99981654 0.01669541
		 0.0093874885 -0.93558019 0.061118547 0.34778479 -0.91827059 0.21936154 0.32963556
		 -0.75849658 0.098167956 0.64424062 -0.74865103 0.26569161 0.60739571 -0.93558019
		 0.061118547 0.34778479 -0.74865103 0.26569161 0.60739571 -0.91827059 0.21936154 0.32963556
		 -0.93558019 0.061118547 0.34778479 -0.16226649 0.13370521 0.97764641 -0.16326249
		 0.30121875 0.93947464 -0.48992991 0.12337685 0.86298716 -0.16326249 0.30121875 0.93947464
		 -0.47413418 0.28027934 0.8346498 -0.48992991 0.12337685 0.86298716 0.41796881 0.77269208
		 -0.47775418 0.29693741 0.75586712 -0.58351785 0.22470784 0.9413116 -0.25187072 0.29693741
		 0.75586712 -0.58351785;
	setAttr ".n[8134:8299]" -type "float3"  0.095635399 0.92919481 -0.35700268 0.22470784
		 0.9413116 -0.25187072 -0.5108285 0.81406999 -0.27630472 -0.54311633 0.83119881 -0.11888303
		 -0.19784537 0.94836754 -0.24790376 -0.54311633 0.83119881 -0.11888303 -0.22492632
		 0.97068518 -0.08472573 -0.19784537 0.94836754 -0.24790376 -0.75849658 0.098167956
		 0.64424062 -0.48992991 0.12337685 0.86298716 -0.74865103 0.26569161 0.60739571 -0.48992991
		 0.12337685 0.86298716 -0.47413418 0.28027934 0.8346498 -0.74865103 0.26569161 0.60739571
		 0.01033839 0.98030055 -0.19724093 0.015371389 0.97930419 -0.20180927 0.64576745 0.54203963
		 -0.53775221 0.015371389 0.97930419 -0.20180927 0.45690548 0.50446743 -0.73263228
		 0.64576745 0.54203963 -0.53775221 0.01033839 0.98030055 -0.19724093 0.64576745 0.54203963
		 -0.53775221 0.011704195 0.98138601 -0.19168858 0.64576745 0.54203963 -0.53775221
		 0.75365961 0.58975446 -0.29014966 0.011704195 0.98138601 -0.19168858 0.011704195
		 0.98138601 -0.19168858 0.75365961 0.58975446 -0.29014966 0.01240135 0.98226076 -0.18710962
		 0.75365961 0.58975446 -0.29014966 0.76815343 0.63944489 -0.032411538 0.01240135 0.98226076
		 -0.18710962 0.010531281 0.98336107 -0.1813563 0.01240135 0.98226076 -0.18710962 0.69133544
		 0.68814605 0.2202507 0.01240135 0.98226076 -0.18710962 0.76815343 0.63944489 -0.032411538
		 0.69133544 0.68814605 0.2202507 0.010531281 0.98336107 -0.1813563 0.69133544 0.68814605
		 0.2202507 0.015383655 0.98446393 -0.17491163 0.69133544 0.68814605 0.2202507 0.52702659
		 0.72966319 0.43570009 0.015383655 0.98446393 -0.17491163 0.015383655 0.98446393 -0.17491163
		 0.52702659 0.72966319 0.43570009 0.015568924 0.9850508 -0.17155924 0.52702659 0.72966319
		 0.43570009 0.30215782 0.75728339 0.57898408 0.015568924 0.9850508 -0.17155924 0.015568924
		 0.9850508 -0.17155924 0.30215782 0.75728339 0.57898408 0.015347347 0.98482221 -0.17288633
		 0.30215782 0.75728339 0.57898408 0.04111658 0.7687127 0.63827121 0.015347347 0.98482221
		 -0.17288633 0.015347347 0.98482221 -0.17288633 0.04111658 0.7687127 0.63827121 0.013530302
		 0.98609298 -0.16564272 0.04111658 0.7687127 0.63827121 -0.22505635 0.76258546 0.60647595
		 0.013530302 0.98609298 -0.16564272 0.013530302 0.98609298 -0.16564272 -0.22505635
		 0.76258546 0.60647595 0.00094530825 0.98637795 -0.16449189 -0.22505635 0.76258546
		 0.60647595 -0.46455085 0.73956847 0.48706368 0.00094530825 0.98637795 -0.16449189
		 0.00094530825 0.98637795 -0.16449189 -0.46455085 0.73956847 0.48706368 -0.0096154697
		 0.9851436 -0.1714633 -0.46455085 0.73956847 0.48706368 -0.648215 0.70237237 0.29409251
		 -0.0096154697 0.9851436 -0.1714633 -0.0096154697 0.9851436 -0.1714633 -0.648215 0.70237237
		 0.29409251 -0.017509706 0.98362195 -0.17939121 -0.648215 0.70237237 0.29409251 -0.75347078
		 0.65550447 0.050948311 -0.017509706 0.98362195 -0.17939121 -0.017509706 0.98362195
		 -0.17939121 -0.75347078 0.65550447 0.050948311 -0.018320339 0.98204398 -0.18776053
		 -0.75347078 0.65550447 0.050948311 -0.76752532 0.60466319 -0.21280815 -0.018320339
		 0.98204398 -0.18776053 -0.018320339 0.98204398 -0.18776053 -0.76752532 0.60466319
		 -0.21280815 -0.010266506 0.98088086 -0.19433816 -0.76752532 0.60466319 -0.21280815
		 -0.69115853 0.55691218 -0.46059605 -0.010266506 0.98088086 -0.19433816 0.004823863
		 0.97902209 -0.20369713 -0.010266506 0.98088086 -0.19433816 -0.53431696 0.51674837
		 -0.66893691 -0.010266506 0.98088086 -0.19433816 -0.69115853 0.55691218 -0.46059605
		 -0.53431696 0.51674837 -0.66893691 0.017222285 0.97762656 -0.20964186 0.004823863
		 0.97902209 -0.20369713 -0.31032225 0.48849598 -0.81551933 0.004823863 0.97902209
		 -0.20369713 -0.53431696 0.51674837 -0.66893691 -0.31032225 0.48849598 -0.81551933
		 0.019052492 0.97917914 -0.20210187 0.017222285 0.97762656 -0.20964186 -0.049446177
		 0.47649387 -0.87778622 0.017222285 0.97762656 -0.20964186 -0.31032225 0.48849598
		 -0.81551933 -0.049446177 0.47649387 -0.87778622 0.017451877 0.98004645 -0.19800086
		 0.019052492 0.97917914 -0.20210187 0.21674402 0.48205832 -0.84890622 0.019052492
		 0.97917914 -0.20210187 -0.049446177 0.47649387 -0.87778622 0.21674402 0.48205832
		 -0.84890622 0.015371389 0.97930419 -0.20180927 0.017451877 0.98004645 -0.19800086
		 0.45690548 0.50446743 -0.73263228 0.017451877 0.98004645 -0.19800086 0.21674402 0.48205832
		 -0.84890622 0.45690548 0.50446743 -0.73263228 -0.042327259 -0.82064033 -0.56987536
		 -0.32334986 -0.71186829 -0.62344879 -0.29196784 -0.79374748 -0.53359133 -0.49264908
		 -0.78348863 -0.37873796 -0.72838914 -0.6388315 -0.24767636 -0.65769517 -0.72779667
		 -0.1942911 -0.7124598 -0.69979596 0.05183319 -0.792606 -0.53319967 0.29575974 -0.71567881
		 -0.63241601 0.29640144 -0.792606 -0.53319967 0.29575974 -0.59889704 -0.6087209 0.52036637
		 -0.71567881 -0.63241601 0.29640144 -0.43878353 -0.55223668 0.70887494 -0.48594961
		 -0.44439906 0.75257057 -0.2051046 -0.55288154 0.80762249 0.28465429 -0.55840623 0.77920115
		 0.55961812 -0.45619497 0.69189137 0.50530493 -0.56288719 0.65408325 0.55961812 -0.45619497
		 0.69189137 0.64122593 -0.62270963 0.44839939 0.50530493 -0.56288719 0.65408325 0.73075831
		 -0.64873397 0.2124536 0.64122593 -0.62270963 0.44839939 0.80930561 -0.5512709 0.20279244
		 0.64122593 -0.62270963 0.44839939 0.55961812 -0.45619497 0.69189137 0.80930561 -0.5512709
		 0.20279244 0.73075831 -0.64873397 0.2124536 0.80930561 -0.5512709 0.20279244 0.69775999
		 -0.71570289 -0.030006269 0.61427641 -0.7421456 -0.26811269 0.68030512 -0.65472209
		 -0.32942969 0.42779902 -0.79387093 -0.43215385 0.043418024 -0.52477723 0.85013157
		 0.048082873 -0.41398668 0.90901214 0.28465429 -0.55840623 0.77920115 0.048082873
		 -0.41398668 0.90901214 0.55961812 -0.45619497 0.69189137 0.28465429 -0.55840623 0.77920115
		 -0.43878353 -0.55223668 0.70887494 -0.59889704 -0.6087209 0.52036637 -0.48594961
		 -0.44439906 0.75257057 -0.59889704 -0.6087209 0.52036637 -0.792606 -0.53319967 0.29575974;
	setAttr ".n[8300:8465]" -type "float3"  -0.48594961 -0.44439906 0.75257057 0.043418024
		 -0.52477723 0.85013157 -0.2051046 -0.55288154 0.80762249 0.048082873 -0.41398668
		 0.90901214 -0.2051046 -0.55288154 0.80762249 -0.48594961 -0.44439906 0.75257057 0.048082873
		 -0.41398668 0.90901214 -0.65769517 -0.72779667 -0.1942911 -0.72838914 -0.6388315
		 -0.24767636 -0.7124598 -0.69979596 0.05183319 -0.72838914 -0.6388315 -0.24767636
		 -0.792606 -0.53319967 0.29575974 -0.7124598 -0.69979596 0.05183319 -0.29196784 -0.79374748
		 -0.53359133 -0.32334986 -0.71186829 -0.62344879 -0.49264908 -0.78348863 -0.37873796
		 -0.32334986 -0.71186829 -0.62344879 -0.72838914 -0.6388315 -0.24767636 -0.49264908
		 -0.78348863 -0.37873796 0.21036851 -0.79941374 -0.56274569 0.23298331 -0.71814346
		 -0.65573525 -0.042327259 -0.82064033 -0.56987536 0.23298331 -0.71814346 -0.65573525
		 -0.32334986 -0.71186829 -0.62344879 -0.042327259 -0.82064033 -0.56987536 0.21036851
		 -0.79941374 -0.56274569 0.42779902 -0.79387093 -0.43215385 0.23298331 -0.71814346
		 -0.65573525 0.42779902 -0.79387093 -0.43215385 0.68030512 -0.65472209 -0.32942969
		 0.23298331 -0.71814346 -0.65573525 0.61427641 -0.7421456 -0.26811269 0.69775999 -0.71570289
		 -0.030006269 0.68030512 -0.65472209 -0.32942969 0.69775999 -0.71570289 -0.030006269
		 0.80930561 -0.5512709 0.20279244 0.68030512 -0.65472209 -0.32942969 0.22711881 0.4512428
		 -0.86301619 0.21133277 0.52617317 -0.82369912 0.66317832 0.51307803 -0.54492706 0.21133277
		 0.52617317 -0.82369912 0.61708659 0.58371001 -0.52771842 0.66317832 0.51307803 -0.54492706
		 0.048082873 -0.41398668 0.90901214 0.059016276 0.19047642 0.97991621 0.55961812 -0.45619497
		 0.69189137 0.059016276 0.19047642 0.97991621 0.68687063 0.13867611 0.71342671 0.55961812
		 -0.45619497 0.69189137 0.83399731 -0.15306093 -0.53011405 0.68873268 0.46838924 -0.55340654
		 0.97169209 -0.091850847 -0.21766458 0.68873268 0.46838924 -0.55340654 0.75939751
		 0.57907236 -0.29663214 0.97169209 -0.091850847 -0.21766458 0.50530493 -0.56288719
		 0.65408325 0.64122593 -0.62270963 0.44839939 0.68604422 0.090344153 0.72192883 0.64122593
		 -0.62270963 0.44839939 0.89296323 0.037665606 0.44855103 0.68604422 0.090344153 0.72192883
		 -0.31521058 0.45736107 -0.83154261 -0.29330167 0.53186631 -0.79441321 0.22711881
		 0.4512428 -0.86301619 -0.29330167 0.53186631 -0.79441321 0.21133277 0.52617317 -0.82369912
		 0.22711881 0.4512428 -0.86301619 0.80930561 -0.5512709 0.20279244 0.55961812 -0.45619497
		 0.69189137 0.99333918 0.021986321 0.11310982 0.55961812 -0.45619497 0.69189137 0.68687063
		 0.13867611 0.71342671 0.99333918 0.021986321 0.11310982 0.46558899 0.49398541 -0.73430604
		 0.68873268 0.46838924 -0.55340654 0.59574831 -0.20073007 -0.77768338 0.68873268 0.46838924
		 -0.55340654 0.83399731 -0.15306093 -0.53011405 0.59574831 -0.20073007 -0.77768338
		 0.28465429 -0.55840623 0.77920115 0.50530493 -0.56288719 0.65408325 0.39640734 0.12721299
		 0.90921837 0.50530493 -0.56288719 0.65408325 0.68604422 0.090344153 0.72192883 0.39640734
		 0.12721299 0.90921837 -0.71005118 0.52857012 -0.46523216 -0.66070235 0.5981254 -0.45356187
		 -0.31521058 0.45736107 -0.83154261 -0.66070235 0.5981254 -0.45356187 -0.29330167
		 0.53186631 -0.79441321 -0.31521058 0.45736107 -0.83154261 0.68030512 -0.65472209
		 -0.32942969 0.80930561 -0.5512709 0.20279244 0.83500266 -0.10499188 -0.54013634 0.80930561
		 -0.5512709 0.20279244 0.99333918 0.021986321 0.11310982 0.83500266 -0.10499188 -0.54013634
		 0.2856178 -0.2308376 -0.93012714 0.23586616 0.40415969 -0.88375455 0.59574831 -0.20073007
		 -0.77768338 0.23586616 0.40415969 -0.88375455 0.46558899 0.49398541 -0.73430604 0.59574831
		 -0.20073007 -0.77768338 0.043418024 -0.52477723 0.85013157 0.28465429 -0.55840623
		 0.77920115 0.058949258 0.14207548 0.98809898 0.28465429 -0.55840623 0.77920115 0.39640734
		 0.12721299 0.90921837 0.058949258 0.14207548 0.98809898 -0.65769517 -0.72779667 -0.1942911
		 -0.7124598 -0.69979596 0.05183319 -0.89294231 -0.13362223 -0.42988271 -0.7124598
		 -0.69979596 0.05183319 -0.99216169 -0.069746792 -0.10368506 -0.89294231 -0.13362223
		 -0.42988271 -0.53281021 0.84550226 -0.035202879 -0.4896417 0.77449208 -0.40051597
		 -0.71895194 0.69394362 0.039374985 -0.4896417 0.77449208 -0.40051597 -0.66070235
		 0.5981254 -0.45356187 -0.71895194 0.69394362 0.039374985 0.23298331 -0.71814346 -0.65573525
		 0.68030512 -0.65472209 -0.32942969 0.285961 -0.18284103 -0.94063568 0.68030512 -0.65472209
		 -0.32942969 0.83500266 -0.10499188 -0.54013634 0.285961 -0.18284103 -0.94063568 -0.046072863
		 0.46483988 -0.88419521 0.23586616 0.40415969 -0.88375455 -0.058942396 -0.23802955
		 -0.96946776 0.23586616 0.40415969 -0.88375455 0.2856178 -0.2308376 -0.93012714 -0.058942396
		 -0.23802955 -0.96946776 -0.65181261 0.69549412 0.30237108 -0.80244219 0.59140545
		 0.079536781 -0.83401179 0.057104539 0.54878354 -0.80244219 0.59140545 0.079536781
		 -0.97166616 -0.0041098776 0.2363219 -0.83401179 0.057104539 0.54878354 -0.2051046
		 -0.55288154 0.80762249 0.043418024 -0.52477723 0.85013157 -0.28562036 0.13489041
		 0.94880217 0.043418024 -0.52477723 0.85013157 0.058949258 0.14207548 0.98809898 -0.28562036
		 0.13489041 0.94880217 -0.49264908 -0.78348863 -0.37873796 -0.65769517 -0.72779667
		 -0.1942911 -0.68605512 -0.18630324 -0.70329183 -0.65769517 -0.72779667 -0.1942911
		 -0.89294231 -0.13362223 -0.42988271 -0.68605512 -0.18630324 -0.70329183 0.043614555
		 0.8020646 0.59564263 0.03232244 0.92563105 0.37704432 -0.44079179 0.77448338 0.45373791
		 0.03232244 0.92563105 0.37704432 -0.32666764 0.90519053 0.27187937 -0.44079179 0.77448338
		 0.45373791 -0.32334986 -0.71186829 -0.62344879 -0.39687604 -0.17513826 -0.90100831
		 -0.72838914 -0.6388315 -0.24767636 -0.39687604 -0.17513826 -0.90100831 -0.89402133
		 -0.085487083 -0.43979293 -0.72838914 -0.6388315 -0.24767636 -0.5361836 0.50527197
		 -0.67617112 -0.32736462 0.41050333 -0.85106957 -0.68605512 -0.18630324 -0.70329183;
	setAttr ".n[8466:8631]" -type "float3"  -0.32736462 0.41050333 -0.85106957 -0.39639619
		 -0.22316155 -0.89054418 -0.68605512 -0.18630324 -0.70329183 -0.22322586 0.75627315
		 0.61499685 -0.49197683 0.68131405 0.54200554 -0.28562036 0.13489041 0.94880217 -0.49197683
		 0.68131405 0.54200554 -0.59572667 0.10477304 0.79632431 -0.28562036 0.13489041 0.94880217
		 -0.59889704 -0.6087209 0.52036637 -0.43878353 -0.55223668 0.70887494 -0.83401179
		 0.057104539 0.54878354 -0.43878353 -0.55223668 0.70887494 -0.59572667 0.10477304
		 0.79632431 -0.83401179 0.057104539 0.54878354 -0.042327259 -0.82064033 -0.56987536
		 -0.29196784 -0.79374748 -0.53359133 -0.058942396 -0.23802955 -0.96946776 -0.29196784
		 -0.79374748 -0.53359133 -0.39639619 -0.22316155 -0.89054418 -0.058942396 -0.23802955
		 -0.96946776 -0.44079179 0.77448338 0.45373791 -0.32666764 0.90519053 0.27187937 -0.71895194
		 0.69394362 0.039374985 -0.32666764 0.90519053 0.27187937 -0.53281021 0.84550226 -0.035202879
		 -0.71895194 0.69394362 0.039374985 -0.32334986 -0.71186829 -0.62344879 0.23298331
		 -0.71814346 -0.65573525 -0.39687604 -0.17513826 -0.90100831 0.23298331 -0.71814346
		 -0.65573525 0.285961 -0.18284103 -0.94063568 -0.39687604 -0.17513826 -0.90100831
		 -0.39639619 -0.22316155 -0.89054418 -0.32736462 0.41050333 -0.85106957 -0.058942396
		 -0.23802955 -0.96946776 -0.32736462 0.41050333 -0.85106957 -0.046072863 0.46483988
		 -0.88419521 -0.058942396 -0.23802955 -0.96946776 -0.59572667 0.10477304 0.79632431
		 -0.49197683 0.68131405 0.54200554 -0.83401179 0.057104539 0.54878354 -0.49197683
		 0.68131405 0.54200554 -0.65181261 0.69549412 0.30237108 -0.83401179 0.057104539 0.54878354
		 -0.43878353 -0.55223668 0.70887494 -0.2051046 -0.55288154 0.80762249 -0.59572667
		 0.10477304 0.79632431 -0.2051046 -0.55288154 0.80762249 -0.28562036 0.13489041 0.94880217
		 -0.59572667 0.10477304 0.79632431 -0.29196784 -0.79374748 -0.53359133 -0.49264908
		 -0.78348863 -0.37873796 -0.39639619 -0.22316155 -0.89054418 -0.49264908 -0.78348863
		 -0.37873796 -0.68605512 -0.18630324 -0.70329183 -0.39639619 -0.22316155 -0.89054418
		 0.50761437 0.76378542 0.3986972 0.37618953 0.89726216 0.23108891 0.043614555 0.8020646
		 0.59564263 0.37618953 0.89726216 0.23108891 0.03232244 0.92563105 0.37704432 0.043614555
		 0.8020646 0.59564263 -0.71895194 0.69394362 0.039374985 -0.66070235 0.5981254 -0.45356187
		 -0.77265054 0.63154453 0.064518243 -0.66070235 0.5981254 -0.45356187 -0.71005118
		 0.52857012 -0.46523216 -0.77265054 0.63154453 0.064518243 -0.89294231 -0.13362223
		 -0.42988271 -0.73743069 0.48445275 -0.47063953 -0.68605512 -0.18630324 -0.70329183
		 -0.73743069 0.48445275 -0.47063953 -0.5361836 0.50527197 -0.67617112 -0.68605512
		 -0.18630324 -0.70329183 0.058949258 0.14207548 0.98809898 0.04867341 0.71211118 0.7003774
		 -0.28562036 0.13489041 0.94880217 0.04867341 0.71211118 0.7003774 -0.22322586 0.75627315
		 0.61499685 -0.28562036 0.13489041 0.94880217 -0.71567881 -0.63241601 0.29640144 -0.59889704
		 -0.6087209 0.52036637 -0.97166616 -0.0041098776 0.2363219 -0.59889704 -0.6087209
		 0.52036637 -0.83401179 0.057104539 0.54878354 -0.97166616 -0.0041098776 0.2363219
		 0.21036851 -0.79941374 -0.56274569 -0.042327259 -0.82064033 -0.56987536 0.2856178
		 -0.2308376 -0.93012714 -0.042327259 -0.82064033 -0.56987536 -0.058942396 -0.23802955
		 -0.96946776 0.2856178 -0.2308376 -0.93012714 0.73409975 0.67755198 -0.044953484 0.54403603
		 0.83335453 -0.097698405 0.50761437 0.76378542 0.3986972 0.54403603 0.83335453 -0.097698405
		 0.37618953 0.89726216 0.23108891 0.50761437 0.76378542 0.3986972 -0.47371694 0.71809894
		 0.50982958 -0.44079179 0.77448338 0.45373791 -0.77265054 0.63154453 0.064518243 -0.44079179
		 0.77448338 0.45373791 -0.71895194 0.69394362 0.039374985 -0.77265054 0.63154453 0.064518243
		 -0.77541512 0.59636539 -0.20755646 -0.73743069 0.48445275 -0.47063953 -0.99216169
		 -0.069746792 -0.10368506 -0.73743069 0.48445275 -0.47063953 -0.89294231 -0.13362223
		 -0.42988271 -0.99216169 -0.069746792 -0.10368506 0.30979678 0.75026727 0.584059 0.04867341
		 0.71211118 0.7003774 0.39640734 0.12721299 0.90921837 0.04867341 0.71211118 0.7003774
		 0.058949258 0.14207548 0.98809898 0.39640734 0.12721299 0.90921837 -0.7124598 -0.69979596
		 0.05183319 -0.71567881 -0.63241601 0.29640144 -0.99216169 -0.069746792 -0.10368506
		 -0.71567881 -0.63241601 0.29640144 -0.97166616 -0.0041098776 0.2363219 -0.99216169
		 -0.069746792 -0.10368506 0.42779902 -0.79387093 -0.43215385 0.21036851 -0.79941374
		 -0.56274569 0.59574831 -0.20073007 -0.77768338 0.21036851 -0.79941374 -0.56274569
		 0.2856178 -0.2308376 -0.93012714 0.59574831 -0.20073007 -0.77768338 0.61708659 0.58371001
		 -0.52771842 0.45731854 0.76380903 -0.45547289 0.73409975 0.67755198 -0.044953484
		 0.45731854 0.76380903 -0.45547289 0.54403603 0.83335453 -0.097698405 0.73409975 0.67755198
		 -0.044953484 0.046872463 0.74773997 0.66233522 0.043614555 0.8020646 0.59564263 -0.47371694
		 0.71809894 0.50982958 0.043614555 0.8020646 0.59564263 -0.44079179 0.77448338 0.45373791
		 -0.47371694 0.71809894 0.50982958 -0.97166616 -0.0041098776 0.2363219 -0.80244219
		 0.59140545 0.079536781 -0.99216169 -0.069746792 -0.10368506 -0.80244219 0.59140545
		 0.079536781 -0.77541512 0.59636539 -0.20755646 -0.99216169 -0.069746792 -0.10368506
		 0.68604422 0.090344153 0.72192883 0.56654382 0.66939116 0.48056594 0.39640734 0.12721299
		 0.90921837 0.56654382 0.66939116 0.48056594 0.30979678 0.75026727 0.584059 0.39640734
		 0.12721299 0.90921837 0.61427641 -0.7421456 -0.26811269 0.42779902 -0.79387093 -0.43215385
		 0.83399731 -0.15306093 -0.53011405 0.42779902 -0.79387093 -0.43215385 0.59574831
		 -0.20073007 -0.77768338 0.83399731 -0.15306093 -0.53011405 0.21133277 0.52617317
		 -0.82369912 0.15661731 0.72116911 -0.67482305 0.61708659 0.58371001 -0.52771842 0.15661731
		 0.72116911 -0.67482305 0.45731854 0.76380903 -0.45547289 0.61708659 0.58371001 -0.52771842
		 0.54553038 0.70660186 0.45067772;
	setAttr ".n[8632:8797]" -type "float3"  0.50761437 0.76378542 0.3986972 0.046872463
		 0.74773997 0.66233522 0.50761437 0.76378542 0.3986972 0.043614555 0.8020646 0.59564263
		 0.046872463 0.74773997 0.66233522 -0.792606 -0.53319967 0.29575974 -0.72838914 -0.6388315
		 -0.24767636 -0.97284192 0.044166636 0.22721766 -0.72838914 -0.6388315 -0.24767636
		 -0.89402133 -0.085487083 -0.43979293 -0.97284192 0.044166636 0.22721766 0.69786716
		 0.68028677 0.22403429 0.56654382 0.66939116 0.48056594 0.89296323 0.037665606 0.44855103
		 0.56654382 0.66939116 0.48056594 0.68604422 0.090344153 0.72192883 0.89296323 0.037665606
		 0.44855103 0.69775999 -0.71570289 -0.030006269 0.61427641 -0.7421456 -0.26811269
		 0.97169209 -0.091850847 -0.21766458 0.61427641 -0.7421456 -0.26811269 0.83399731
		 -0.15306093 -0.53011405 0.97169209 -0.091850847 -0.21766458 -0.29330167 0.53186631
		 -0.79441321 -0.21736392 0.72538823 -0.65311933 0.21133277 0.52617317 -0.82369912
		 -0.21736392 0.72538823 -0.65311933 0.15661731 0.72116911 -0.67482305 0.21133277 0.52617317
		 -0.82369912 0.78892976 0.61392856 -0.026107874 0.73409975 0.67755198 -0.044953484
		 0.54553038 0.70660186 0.45067772 0.73409975 0.67755198 -0.044953484 0.50761437 0.76378542
		 0.3986972 0.54553038 0.70660186 0.45067772 -0.48594961 -0.44439906 0.75257057 -0.792606
		 -0.53319967 0.29575974 -0.59645009 0.15315285 0.78790319 -0.792606 -0.53319967 0.29575974
		 -0.97284192 0.044166636 0.22721766 -0.59645009 0.15315285 0.78790319 0.99214202 -0.026216066
		 0.12233952 0.8193289 0.57313806 -0.014590286 0.89296323 0.037665606 0.44855103 0.8193289
		 0.57313806 -0.014590286 0.69786716 0.68028677 0.22403429 0.89296323 0.037665606 0.44855103
		 0.73075831 -0.64873397 0.2124536 0.69775999 -0.71570289 -0.030006269 0.99214202 -0.026216066
		 0.12233952 0.69775999 -0.71570289 -0.030006269 0.97169209 -0.091850847 -0.21766458
		 0.99214202 -0.026216066 0.12233952 -0.66070235 0.5981254 -0.45356187 -0.4896417 0.77449208
		 -0.40051597 -0.29330167 0.53186631 -0.79441321 -0.4896417 0.77449208 -0.40051597
		 -0.21736392 0.72538823 -0.65311933 -0.29330167 0.53186631 -0.79441321 0.66317832
		 0.51307803 -0.54492706 0.61708659 0.58371001 -0.52771842 0.78892976 0.61392856 -0.026107874
		 0.61708659 0.58371001 -0.52771842 0.73409975 0.67755198 -0.044953484 0.78892976 0.61392856
		 -0.026107874 0.048082873 -0.41398668 0.90901214 -0.48594961 -0.44439906 0.75257057
		 0.059016276 0.19047642 0.97991621 -0.48594961 -0.44439906 0.75257057 -0.59645009
		 0.15315285 0.78790319 0.059016276 0.19047642 0.97991621 0.75939751 0.57907236 -0.29663214
		 0.8193289 0.57313806 -0.014590286 0.97169209 -0.091850847 -0.21766458 0.8193289 0.57313806
		 -0.014590286 0.99214202 -0.026216066 0.12233952 0.97169209 -0.091850847 -0.21766458
		 0.64122593 -0.62270963 0.44839939 0.73075831 -0.64873397 0.2124536 0.89296323 0.037665606
		 0.44855103 0.73075831 -0.64873397 0.2124536 0.99214202 -0.026216066 0.12233952 0.89296323
		 0.037665606 0.44855103 0.23586616 0.40415969 -0.88375455 -0.046072863 0.46483988
		 -0.88419521 0.023290453 0.96467495 -0.26241156 -0.046072863 0.46483988 -0.88419521
		 -0.0017559553 0.97508729 -0.22181448 0.023290453 0.96467495 -0.26241156 -0.32736462
		 0.41050333 -0.85106957 -0.03161655 0.96527511 -0.25931522 -0.046072863 0.46483988
		 -0.88419521 -0.03161655 0.96527511 -0.25931522 -0.0017559553 0.97508729 -0.22181448
		 -0.046072863 0.46483988 -0.88419521 -0.80244219 0.59140545 0.079536781 -0.65181261
		 0.69549412 0.30237108 -0.075078018 0.98214674 -0.17248484 -0.65181261 0.69549412
		 0.30237108 -0.017949386 0.98375994 -0.17858931 -0.075078018 0.98214674 -0.17248484
		 -0.49197683 0.68131405 0.54200554 -0.045321416 0.99059665 -0.12908998 -0.65181261
		 0.69549412 0.30237108 -0.045321416 0.99059665 -0.12908998 -0.017949386 0.98375994
		 -0.17858931 -0.65181261 0.69549412 0.30237108 -0.49197683 0.68131405 0.54200554 -0.22322586
		 0.75627315 0.61499685 -0.045321416 0.99059665 -0.12908998 -0.22322586 0.75627315
		 0.61499685 -0.0049305335 0.98546976 -0.16977938 -0.045321416 0.99059665 -0.12908998
		 0.04867341 0.71211118 0.7003774 0.0040744441 0.99222213 -0.12441312 -0.22322586 0.75627315
		 0.61499685 0.0040744441 0.99222213 -0.12441312 -0.0049305335 0.98546976 -0.16977938
		 -0.22322586 0.75627315 0.61499685 0.04867341 0.71211118 0.7003774 0.30979678 0.75026727
		 0.584059 0.0040744441 0.99222213 -0.12441312 0.30979678 0.75026727 0.584059 0.0076111737
		 0.98531753 -0.17056212 0.0040744441 0.99222213 -0.12441312 0.56654382 0.66939116
		 0.48056594 0.052504938 0.98947954 -0.13480915 0.30979678 0.75026727 0.584059 0.052504938
		 0.98947954 -0.13480915 0.0076111737 0.98531753 -0.17056212 0.30979678 0.75026727
		 0.584059 0.56654382 0.66939116 0.48056594 0.69786716 0.68028677 0.22403429 0.052504938
		 0.98947954 -0.13480915 0.69786716 0.68028677 0.22403429 0.019293239 0.98331779 -0.18086989
		 0.052504938 0.98947954 -0.13480915 0.8193289 0.57313806 -0.014590286 0.076754771
		 0.9804244 -0.18131942 0.69786716 0.68028677 0.22403429 0.076754771 0.9804244 -0.18131942
		 0.019293239 0.98331779 -0.18086989 0.69786716 0.68028677 0.22403429 0.8193289 0.57313806
		 -0.014590286 0.75939751 0.57907236 -0.29663214 0.076754771 0.9804244 -0.18131942
		 0.75939751 0.57907236 -0.29663214 0.020761678 0.98050916 -0.19537328 0.076754771
		 0.9804244 -0.18131942 0.68873268 0.46838924 -0.55340654 0.064777471 0.9706434 -0.23163614
		 0.75939751 0.57907236 -0.29663214 0.064777471 0.9706434 -0.23163614 0.020761678 0.98050916
		 -0.19537328 0.75939751 0.57907236 -0.29663214 0.68873268 0.46838924 -0.55340654 0.46558899
		 0.49398541 -0.73430604 0.064777471 0.9706434 -0.23163614 0.46558899 0.49398541 -0.73430604
		 0.013057411 0.97835469 -0.20652266 0.064777471 0.9706434 -0.23163614 0.23586616 0.40415969
		 -0.88375455 0.023290453 0.96467495 -0.26241156 0.46558899 0.49398541 -0.73430604
		 0.023290453 0.96467495 -0.26241156 0.013057411 0.97835469 -0.20652266;
	setAttr ".n[8798:8963]" -type "float3"  0.46558899 0.49398541 -0.73430604 -0.32736462
		 0.41050333 -0.85106957 -0.5361836 0.50527197 -0.67617112 -0.03161655 0.96527511 -0.25931522
		 -0.5361836 0.50527197 -0.67617112 -0.014794827 0.97862989 -0.20509672 -0.03161655
		 0.96527511 -0.25931522 -0.73743069 0.48445275 -0.47063953 -0.069225743 0.97214222
		 -0.22393598 -0.5361836 0.50527197 -0.67617112 -0.069225743 0.97214222 -0.22393598
		 -0.014794827 0.97862989 -0.20509672 -0.5361836 0.50527197 -0.67617112 -0.73743069
		 0.48445275 -0.47063953 -0.77541512 0.59636539 -0.20755646 -0.069225743 0.97214222
		 -0.22393598 -0.77541512 0.59636539 -0.20755646 -0.021262022 0.98097074 -0.19298789
		 -0.069225743 0.97214222 -0.22393598 -0.80244219 0.59140545 0.079536781 -0.075078018
		 0.98214674 -0.17248484 -0.77541512 0.59636539 -0.20755646 -0.075078018 0.98214674
		 -0.17248484 -0.021262022 0.98097074 -0.19298789 -0.77541512 0.59636539 -0.20755646
		 0.023290453 0.96467495 -0.26241156 -0.0017559553 0.97508729 -0.22181448 -0.17384304
		 0.88125443 0.43951023 -0.0017559553 0.97508729 -0.22181448 0.030569514 0.93784505
		 0.3457053 -0.17384304 0.88125443 0.43951023 -0.03161655 0.96527511 -0.25931522 0.24233206
		 0.8769964 0.41491261 -0.0017559553 0.97508729 -0.22181448 0.24233206 0.8769964 0.41491261
		 0.030569514 0.93784505 0.3457053 -0.0017559553 0.97508729 -0.22181448 -0.017949386
		 0.98375994 -0.17858931 0.42948014 0.7910043 -0.43572816 -0.075078018 0.98214674 -0.17248484
		 0.42948014 0.7910043 -0.43572816 0.591263 0.75529855 -0.28272277 -0.075078018 0.98214674
		 -0.17248484 -0.045321416 0.99059665 -0.12908998 0.36099017 0.69636947 -0.62028682
		 -0.017949386 0.98375994 -0.17858931 0.36099017 0.69636947 -0.62028682 0.42948014
		 0.7910043 -0.43572816 -0.017949386 0.98375994 -0.17858931 -0.0049305335 0.98546976
		 -0.16977938 0.14840107 0.75427246 -0.6395703 -0.045321416 0.99059665 -0.12908998
		 0.14840107 0.75427246 -0.6395703 0.36099017 0.69636947 -0.62028682 -0.045321416 0.99059665
		 -0.12908998 0.0040744441 0.99222213 -0.12441312 -0.035480864 0.66984361 -0.74165404
		 -0.0049305335 0.98546976 -0.16977938 -0.035480864 0.66984361 -0.74165404 0.14840107
		 0.75427246 -0.6395703 -0.0049305335 0.98546976 -0.16977938 0.0040744441 0.99222213
		 -0.12441312 0.0076111737 0.98531753 -0.17056212 -0.035480864 0.66984361 -0.74165404
		 0.0076111737 0.98531753 -0.17056212 -0.20499857 0.75788015 -0.61934906 -0.035480864
		 0.66984361 -0.74165404 0.0076111737 0.98531753 -0.17056212 0.052504938 0.98947954
		 -0.13480915 -0.20499857 0.75788015 -0.61934906 0.052504938 0.98947954 -0.13480915
		 -0.41538295 0.70399034 -0.57606822 -0.20499857 0.75788015 -0.61934906 0.052504938
		 0.98947954 -0.13480915 0.019293239 0.98331779 -0.18086989 -0.41538295 0.70399034
		 -0.57606822 0.019293239 0.98331779 -0.18086989 -0.46040797 0.80021727 -0.38428742
		 -0.41538295 0.70399034 -0.57606822 0.019293239 0.98331779 -0.18086989 0.076754771
		 0.9804244 -0.18131942 -0.46040797 0.80021727 -0.38428742 0.076754771 0.9804244 -0.18131942
		 -0.60477078 0.7672115 -0.21363239 -0.46040797 0.80021727 -0.38428742 0.076754771
		 0.9804244 -0.18131942 0.020761678 0.98050916 -0.19537328 -0.60477078 0.7672115 -0.21363239
		 0.020761678 0.98050916 -0.19537328 -0.5046106 0.86245728 -0.039186448 -0.60477078
		 0.7672115 -0.21363239 0.020761678 0.98050916 -0.19537328 0.064777471 0.9706434 -0.23163614
		 -0.5046106 0.86245728 -0.039186448 0.064777471 0.9706434 -0.23163614 -0.51260912
		 0.83750713 0.18924506 -0.5046106 0.86245728 -0.039186448 0.064777471 0.9706434 -0.23163614
		 0.013057411 0.97835469 -0.20652266 -0.51260912 0.83750713 0.18924506 0.013057411
		 0.97835469 -0.20652266 -0.31006116 0.91569346 0.2556707 -0.51260912 0.83750713 0.18924506
		 0.013057411 0.97835469 -0.20652266 0.023290453 0.96467495 -0.26241156 -0.31006116
		 0.91569346 0.2556707 0.023290453 0.96467495 -0.26241156 -0.17384304 0.88125443 0.43951023
		 -0.31006116 0.91569346 0.2556707 -0.014794827 0.97862989 -0.20509672 0.35737044 0.90860409
		 0.21615978 -0.03161655 0.96527511 -0.25931522 0.35737044 0.90860409 0.21615978 0.24233206
		 0.8769964 0.41491261 -0.03161655 0.96527511 -0.25931522 -0.069225743 0.97214222 -0.22393598
		 0.54797632 0.82678735 0.12706143 -0.014794827 0.97862989 -0.20509672 0.54797632 0.82678735
		 0.12706143 0.35737044 0.90860409 0.21615978 -0.014794827 0.97862989 -0.20509672 -0.021262022
		 0.98097074 -0.19298789 0.51451594 0.85176003 -0.098884873 -0.069225743 0.97214222
		 -0.22393598 0.51451594 0.85176003 -0.098884873 0.54797632 0.82678735 0.12706143 -0.069225743
		 0.97214222 -0.22393598 -0.075078018 0.98214674 -0.17248484 0.591263 0.75529855 -0.28272277
		 -0.021262022 0.98097074 -0.19298789 0.591263 0.75529855 -0.28272277 0.51451594 0.85176003
		 -0.098884873 -0.021262022 0.98097074 -0.19298789 2.7845127e-07 0.98162705 -0.19080968
		 3.6140777e-09 0.98162717 -0.19080895 2.2355104e-07 0.98162729 -0.19080845 2.2355104e-07
		 0.98162729 -0.19080845 3.6140777e-09 0.98162717 -0.19080895 4.6292493e-07 0.98162711
		 -0.19080925 4.6292493e-07 0.98162711 -0.19080925 3.6140777e-09 0.98162717 -0.19080895
		 6.5292403e-07 0.98162717 -0.19080895 6.5292403e-07 0.98162717 -0.19080895 3.6140777e-09
		 0.98162717 -0.19080895 4.1283585e-07 0.98162723 -0.19080876 4.1283585e-07 0.98162723
		 -0.19080876 3.6140777e-09 0.98162717 -0.19080895 -3.1968699e-07 0.98162717 -0.19080904
		 -3.1968699e-07 0.98162717 -0.19080904 3.6140777e-09 0.98162717 -0.19080895 -1.329845e-06
		 0.98162717 -0.1908091 -1.329845e-06 0.98162717 -0.1908091 3.6140777e-09 0.98162717
		 -0.19080895 -2.5988625e-06 0.98162735 -0.19080828 -0.17384304 0.88125443 0.43951023
		 -0.0002931185 0.98150337 -0.1914448 -0.31006116 0.91569346 0.2556707 -0.0002931185
		 0.98150337 -0.1914448 -0.00052718789 0.98182762 -0.1897743 -0.31006116 0.91569346
		 0.2556707 -0.31006116 0.91569346 0.2556707 0.00074934203 0.98177826 -0.19002858 -0.51260912
		 0.83750713 0.18924506 -0.51260912 0.83750713 0.18924506 0.00019060554 0.98149663
		 -0.1914793 -0.5046106 0.86245728 -0.039186448;
	setAttr ".n[8964:9129]" -type "float3"  0.00019060554 0.98149663 -0.1914793 -0.0010796748
		 0.98171556 -0.19035079 -0.5046106 0.86245728 -0.039186448 -0.5046106 0.86245728 -0.039186448
		 6.6118009e-05 0.98183423 -0.18974058 -0.60477078 0.7672115 -0.21363239 -0.60477078
		 0.7672115 -0.21363239 0.00058727094 0.98155022 -0.19120374 -0.46040797 0.80021727
		 -0.38428742 0.00058727094 0.98155022 -0.19120374 -0.0011282712 0.98156214 -0.19113989
		 -0.46040797 0.80021727 -0.38428742 -0.46040797 0.80021727 -0.38428742 -0.0006492954
		 0.981794 -0.18994772 -0.41538295 0.70399034 -0.57606822 -0.41538295 0.70399034 -0.57606822
		 0.00070819817 0.98163998 -0.19074181 -0.20499857 0.75788015 -0.61934906 0.00070819817
		 0.98163998 -0.19074181 -0.00064817979 0.98143852 -0.19177586 -0.20499857 0.75788015
		 -0.61934906 -0.20499857 0.75788015 -0.61934906 -0.0010626783 0.98167479 -0.190561
		 -0.035480864 0.66984361 -0.74165404 -0.035480864 0.66984361 -0.74165404 0.00049746141
		 0.98172373 -0.19031112 0.14840107 0.75427246 -0.6395703 0.00049746141 0.98172373
		 -0.19031112 0.00013569168 0.98140329 -0.19195716 0.14840107 0.75427246 -0.6395703
		 0.14840107 0.75427246 -0.6395703 -0.0009762625 0.98153299 -0.19129044 0.36099017
		 0.69636947 -0.62028682 0.36099017 0.69636947 -0.62028682 5.4414832e-05 0.98176199
		 -0.1901141 0.42948014 0.7910043 -0.43572816 5.4414832e-05 0.98176199 -0.1901141 0.00085623271
		 0.9814716 -0.1916059 0.42948014 0.7910043 -0.43572816 0.42948014 0.7910043 -0.43572816
		 -0.00043529208 0.98143554 -0.19179171 0.591263 0.75529855 -0.28272277 0.591263 0.75529855
		 -0.28272277 -0.0004158208 0.98173708 -0.19024217 0.51451594 0.85176003 -0.098884873
		 -0.0004158208 0.98173708 -0.19024217 0.0011733798 0.98161298 -0.19087853 0.51451594
		 0.85176003 -0.098884873 0.51451594 0.85176003 -0.098884873 0.00031159775 0.98142695
		 -0.19183597 0.54797632 0.82678735 0.12706143 0.54797632 0.82678735 0.12706143 -0.00068854418
		 0.98166096 -0.19063394 0.35737044 0.90860409 0.21615978 -0.00068854418 0.98166096
		 -0.19063394 0.00094354956 0.98176068 -0.19011845 0.35737044 0.90860409 0.21615978
		 0.35737044 0.90860409 0.21615978 0.00090997381 0.98151165 -0.19140038 0.24233206
		 0.8769964 0.41491261 0.24233206 0.8769964 0.41491261 -0.00064075046 0.98156875 -0.19110826
		 0.030569514 0.93784505 0.3457053 -0.00064075046 0.98156875 -0.19110826 0.00027327795
		 0.98184544 -0.18968245 0.030569514 0.93784505 0.3457053 0.030569514 0.93784505 0.3457053
		 0.0010869242 0.98165035 -0.19068682 -0.17384304 0.88125443 0.43951023 1.7275713e-07
		 0.98192596 -0.18926552 2.0084649e-08 0.98192573 -0.18926682 -8.1118884e-08 0.98192567
		 -0.18926705 -8.1118884e-08 0.98192567 -0.18926705 2.0084649e-08 0.98192573 -0.18926682
		 1.1655665e-08 0.98192567 -0.18926692 1.1655665e-08 0.98192567 -0.18926692 2.0084649e-08
		 0.98192573 -0.18926682 2.5074414e-09 0.98192567 -0.18926692 2.5074414e-09 0.98192567
		 -0.18926692 2.0084649e-08 0.98192573 -0.18926682 -1.9837341e-08 0.98192567 -0.18926682
		 -1.9837341e-08 0.98192567 -0.18926682 2.0084649e-08 0.98192573 -0.18926682 -3.6127414e-08
		 0.98192573 -0.18926682 -3.6127414e-08 0.98192573 -0.18926682 2.0084649e-08 0.98192573
		 -0.18926682 -2.5547243e-08 0.98192573 -0.18926671 -2.5547243e-08 0.98192573 -0.18926671
		 2.0084649e-08 0.98192573 -0.18926682 -1.7121351e-08 0.98192573 -0.18926676 -1.7121351e-08
		 0.98192573 -0.18926676 2.0084649e-08 0.98192573 -0.18926682 -5.0008857e-08 0.98192567
		 -0.18926683 -5.0008857e-08 0.98192567 -0.18926683 2.0084649e-08 0.98192573 -0.18926682
		 -1.0700861e-08 0.98192567 -0.18926688 -1.0700861e-08 0.98192567 -0.18926688 2.0084649e-08
		 0.98192573 -0.18926682 1.1902684e-07 0.98192567 -0.18926686 1.1902684e-07 0.98192567
		 -0.18926686 2.0084649e-08 0.98192573 -0.18926682 1.2209729e-07 0.98192573 -0.18926682
		 1.2209729e-07 0.98192573 -0.18926682 2.0084649e-08 0.98192573 -0.18926682 2.6449852e-08
		 0.98192567 -0.18926696 2.6449852e-08 0.98192567 -0.18926696 2.0084649e-08 0.98192573
		 -0.18926682 1.8945168e-07 0.98192567 -0.18926705 1.8945168e-07 0.98192567 -0.18926705
		 2.0084649e-08 0.98192573 -0.18926682 -8.1377777e-08 0.98192561 -0.18926722 -8.1377777e-08
		 0.98192561 -0.18926722 2.0084649e-08 0.98192573 -0.18926682 1.9390319e-07 0.98192567
		 -0.18926705 1.9390319e-07 0.98192567 -0.18926705 2.0084649e-08 0.98192573 -0.18926682
		 2.7640706e-07 0.9819262 -0.18926422 0.8140077 -0.14577225 0.56226498 0.84117657 -0.19220328
		 0.50545019 0.77288181 -0.16966349 0.61144745 0.77288181 -0.16966349 0.61144745 0.84117657
		 -0.19220328 0.50545019 0.79759943 -0.25106287 0.5484547 0.99554688 0.059147645 0.073403083
		 0.99855983 0.036190044 0.03960469 0.99294412 0.012467938 0.11792573 0.99294412 0.012467938
		 0.11792573 0.99855983 0.036190044 0.03960469 0.9975034 -0.020986903 0.06742762 -0.037678778
		 0.84683788 0.53051478 -0.11906549 0.86970663 0.47899252 -0.061853666 0.74993193 0.6586169
		 -0.061853666 0.74993193 0.6586169 -0.11906549 0.86970663 0.47899252 -0.13803945 0.76429105
		 0.629924 -0.033036016 0.88092172 0.47210756 -0.11936526 0.88846105 0.44315782 -0.037678778
		 0.84683788 0.53051478 -0.037678778 0.84683788 0.53051478 -0.11936526 0.88846105 0.44315782
		 -0.11906549 0.86970663 0.47899252 0.9709118 -0.092157476 0.22099145 0.97552758 -0.14276533
		 0.16722421 0.94622165 -0.14812894 0.28761497 0.94622165 -0.14812894 0.28761497 0.97552758
		 -0.14276533 0.16722421 0.94765759 -0.21811017 0.23318037 -0.11909441 0.89119059 0.43771657
		 -0.11936526 0.88846105 0.44315782 -0.033938471 0.89047128 0.45377204 -0.033938471
		 0.89047128 0.45377204 -0.11936526 0.88846105 0.44315782 -0.033036016 0.88092172 0.47210756
		 0.93239331 -0.044445012 0.35870236 0.96102184 0.00078277924 0.27647129 0.93946993
		 -0.077349998 0.33378613 0.93946993 -0.077349998 0.33378613 0.96102184 0.00078277924
		 0.27647129 0.96516716 -0.029112052 0.26000935 -0.033938471 0.89047128 0.45377204
		 -0.039628282 0.89588815 0.44250882 -0.11909441 0.89119059 0.43771657 -0.11909441
		 0.89119059 0.43771657 -0.039628282 0.89588815 0.44250882 -0.117473 0.89397079 0.4324539
		 -0.10593458 0.91081566 0.39898956;
	setAttr ".n[9130:9295]" -type "float3"  -0.117473 0.89397079 0.4324539 -0.036257889
		 0.91869962 0.39328912 -0.036257889 0.91869962 0.39328912 -0.117473 0.89397079 0.4324539
		 -0.039628282 0.89588815 0.44250882 0.24483137 -0.67837805 -0.69271988 0.28872585
		 -0.68702167 -0.66681224 0.20758815 -0.8466441 -0.49000099 0.20758815 -0.8466441 -0.49000099
		 0.28872585 -0.68702167 -0.66681224 0.25880882 -0.83924967 -0.47820288 -0.073632821
		 0.96124595 0.26567736 -0.10593458 0.91081566 0.39898956 -0.024208138 0.96178079 0.27274847
		 -0.024208138 0.96178079 0.27274847 -0.10593458 0.91081566 0.39898956 -0.036257889
		 0.91869962 0.39328912 0.98444933 -0.041013248 0.17081402 0.98876518 -0.080704249
		 0.12581851 0.9709118 -0.092157476 0.22099145 0.9709118 -0.092157476 0.22099145 0.98876518
		 -0.080704249 0.12581851 0.97552758 -0.14276533 0.16722421 0.24405086 -0.8848083 -0.39693007
		 0.18525596 -0.88973159 -0.41720247 0.25880882 -0.83924967 -0.47820288 0.25880882
		 -0.83924967 -0.47820288 0.18525596 -0.88973159 -0.41720247 0.20758815 -0.8466441
		 -0.49000099 0.97619259 0.04364983 0.21246825 0.97731459 0.012753333 0.21140859 0.96102184
		 0.00078277924 0.27647129 0.96102184 0.00078277924 0.27647129 0.97731459 0.012753333
		 0.21140859 0.96516716 -0.029112052 0.26000935 0.18525596 -0.88973159 -0.41720247
		 0.24405086 -0.8848083 -0.39693007 0.17408653 -0.91032523 -0.37550217 0.17408653 -0.91032523
		 -0.37550217 0.24405086 -0.8848083 -0.39693007 0.22675508 -0.91107523 -0.3442733 0.90547043
		 -0.20357221 0.37239981 0.89830774 -0.28800708 0.33180591 0.85287708 -0.25211638 0.45720676
		 0.85287708 -0.25211638 0.45720676 0.89830774 -0.28800708 0.33180591 0.8346625 -0.33550254
		 0.43677974 0.16227844 -0.93599635 -0.31237236 0.17408653 -0.91032523 -0.37550217
		 0.21970636 -0.93398058 -0.28179666 0.21970636 -0.93398058 -0.28179666 0.17408653
		 -0.91032523 -0.37550217 0.22675508 -0.91107523 -0.3442733 0.8140077 -0.14577225 0.56226498
		 0.88641703 -0.090639353 0.45392665 0.84117657 -0.19220328 0.50545019 0.84117657 -0.19220328
		 0.50545019 0.88641703 -0.090639353 0.45392665 0.89922941 -0.12593493 0.41895932 0.11733487
		 -0.98153555 -0.15106454 0.16227844 -0.93599635 -0.31237236 0.1775814 -0.97070426
		 -0.16185832 0.1775814 -0.97070426 -0.16185832 0.16227844 -0.93599635 -0.31237236
		 0.21970636 -0.93398058 -0.28179666 0.14847006 0.7327792 -0.6640718 0.10172829 0.86887616
		 -0.48446423 0.18551236 0.7425769 -0.6435563 0.18551236 0.7425769 -0.6435563 0.10172829
		 0.86887616 -0.48446423 0.14064579 0.87965566 -0.45433983 0.2195747 0.62007886 -0.75318599
		 0.25899196 0.42127138 -0.86916834 0.1790296 0.62062836 -0.76339298 0.1790296 0.62062836
		 -0.76339298 0.25899196 0.42127138 -0.86916834 0.21801293 0.42802292 -0.87707853 0.29915142
		 0.016235681 -0.95406753 0.25589535 0.042136524 -0.96578574 0.28435728 0.24180746
		 -0.92772305 0.28435728 0.24180746 -0.92772305 0.25589535 0.042136524 -0.96578574
		 0.24024057 0.2543312 -0.93680316 0.1790296 0.62062836 -0.76339298 0.14847006 0.7327792
		 -0.6640718 0.2195747 0.62007886 -0.75318599 0.2195747 0.62007886 -0.75318599 0.14847006
		 0.7327792 -0.6640718 0.18551236 0.7425769 -0.6435563 0.28435728 0.24180746 -0.92772305
		 0.24024057 0.2543312 -0.93680316 0.25899196 0.42127138 -0.86916834 0.25899196 0.42127138
		 -0.86916834 0.24024057 0.2543312 -0.93680316 0.21801293 0.42802292 -0.87707853 0.98471177
		 0.14297129 0.099508815 0.99132013 0.092927694 0.092999108 0.98409432 0.10872291 0.14049074
		 0.98409432 0.10872291 0.14049074 0.99132013 0.092927694 0.092999108 0.98707616 0.061295416
		 0.14806609 0.99293703 0.11859999 0.0031805588 0.99494433 0.10042413 -0.00090149738
		 0.99490738 0.095672689 0.031718355 0.99490738 0.095672689 0.031718355 0.99494433
		 0.10042413 -0.00090149738 0.99719942 0.074175164 0.0095585138 0.99294412 0.012467938
		 0.11792573 0.9975034 -0.020986903 0.06742762 0.98444933 -0.041013248 0.17081402 0.98444933
		 -0.041013248 0.17081402 0.9975034 -0.020986903 0.06742762 0.98876518 -0.080704249
		 0.12581851 0.98409432 0.10872291 0.14049074 0.98707616 0.061295416 0.14806609 0.97619259
		 0.04364983 0.21246825 0.97619259 0.04364983 0.21246825 0.98707616 0.061295416 0.14806609
		 0.97731459 0.012753333 0.21140859 0.80460697 -0.2838816 0.52155429 0.85287708 -0.25211638
		 0.45720676 0.79191601 -0.3329134 0.51189619 0.79191601 -0.3329134 0.51189619 0.85287708
		 -0.25211638 0.45720676 0.8346625 -0.33550254 0.43677974 -0.11451844 -0.075023293
		 0.99058419 -0.18290424 -0.08039546 0.97983807 -0.10495754 -0.2558918 0.96099079 -0.10495754
		 -0.2558918 0.96099079 -0.18290424 -0.08039546 0.97983807 -0.16428274 -0.25754148
		 0.95219934 -0.19559795 0.14626321 0.96971571 -0.11805826 0.17027174 0.97829944 -0.18073212
		 0.52187628 0.83365524 -0.18073212 0.52187628 0.83365524 -0.11805826 0.17027174 0.97829944
		 -0.10153943 0.52595305 0.84443063 -0.083700195 -0.71693808 0.69209403 -0.057953656
		 -0.80332959 0.59270817 -0.022282131 -0.73627317 0.67631745 -0.022282131 -0.73627317
		 0.67631745 -0.057953656 -0.80332959 0.59270817 0.012589769 -0.8264913 0.56280869
		 0.11621848 -0.99086916 0.068349071 0.060808294 -0.92140913 0.38380671 0.062484022
		 -0.99417537 0.087813042 0.062484022 -0.99417537 0.087813042 0.060808294 -0.92140913
		 0.38380671 -0.013078053 -0.89816016 0.43947384 -0.18073212 0.52187628 0.83365524
		 -0.10153943 0.52595305 0.84443063 -0.13803945 0.76429105 0.629924 -0.13803945 0.76429105
		 0.629924 -0.10153943 0.52595305 0.84443063 -0.061853666 0.74993193 0.6586169 0.062484022
		 -0.99417537 0.087813042 0.11733487 -0.98153555 -0.15106454 0.11621848 -0.99086916
		 0.068349071 0.11621848 -0.99086916 0.068349071 0.11733487 -0.98153555 -0.15106454
		 0.1775814 -0.97070426 -0.16185832 0.060808294 -0.92140913 0.38380671 0.012589769
		 -0.8264913 0.56280869 -0.013078053 -0.89816016 0.43947384 -0.013078053 -0.89816016
		 0.43947384 0.012589769 -0.8264913 0.56280869;
	setAttr ".n[9296:9461]" -type "float3"  -0.057953656 -0.80332959 0.59270817 -0.022282131
		 -0.73627317 0.67631745 -0.04534262 -0.63396341 0.77203268 -0.083700195 -0.71693808
		 0.69209403 -0.083700195 -0.71693808 0.69209403 -0.04534262 -0.63396341 0.77203268
		 -0.10251462 -0.60993779 0.78579044 -0.18290424 -0.08039546 0.97983807 -0.11451844
		 -0.075023293 0.99058419 -0.19559795 0.14626321 0.96971571 -0.19559795 0.14626321
		 0.96971571 -0.11451844 -0.075023293 0.99058419 -0.11805826 0.17027174 0.97829944
		 -0.085303381 -0.40547618 0.91011667 -0.14591765 -0.40237567 0.90377092 -0.069144383
		 -0.52465922 0.84849972 -0.069144383 -0.52465922 0.84849972 -0.14591765 -0.40237567
		 0.90377092 -0.12297726 -0.50916779 0.85183614 0.017758593 0.99955523 0.023957158
		 0.095932543 0.96316254 -0.25122684 -0.017956723 0.99952519 0.025037887 -0.017956723
		 0.99952519 0.025037887 0.095932543 0.96316254 -0.25122684 0.056836959 0.954638 -0.29229409
		 0.26584616 -0.15144147 -0.95204586 0.3107022 -0.1937291 -0.93055528 0.26287225 -0.4433547
		 -0.85693336 0.26287225 -0.4433547 -0.85693336 0.3107022 -0.1937291 -0.93055528 0.3044529
		 -0.45696247 -0.8357594 -0.017956723 0.99952519 0.025037887 -0.073632821 0.96124595
		 0.26567736 0.017758593 0.99955523 0.023957158 0.017758593 0.99955523 0.023957158
		 -0.073632821 0.96124595 0.26567736 -0.024208138 0.96178079 0.27274847 0.26287225
		 -0.4433547 -0.85693336 0.3044529 -0.45696247 -0.8357594 0.24483137 -0.67837805 -0.69271988
		 0.24483137 -0.67837805 -0.69271988 0.3044529 -0.45696247 -0.8357594 0.28872585 -0.68702167
		 -0.66681224 0.095932543 0.96316254 -0.25122684 0.14064579 0.87965566 -0.45433983
		 0.056836959 0.954638 -0.29229409 0.056836959 0.954638 -0.29229409 0.14064579 0.87965566
		 -0.45433983 0.10172829 0.86887616 -0.48446423 0.25589535 0.042136524 -0.96578574
		 0.29915142 0.016235681 -0.95406753 0.26584616 -0.15144147 -0.95204586 0.26584616
		 -0.15144147 -0.95204586 0.29915142 0.016235681 -0.95406753 0.3107022 -0.1937291 -0.93055528
		 0.9848277 0.14661823 0.092830651 0.98507309 0.14838958 0.087243915 0.99235058 0.11340746
		 0.048775468 0.99235058 0.11340746 0.048775468 0.98507309 0.14838958 0.087243915 0.99212068
		 0.12261903 0.0257132 0.77288181 -0.16966349 0.61144745 0.79759943 -0.25106287 0.5484547
		 0.76600975 -0.19597217 0.61222875 0.76600975 -0.19597217 0.61222875 0.79759943 -0.25106287
		 0.5484547 0.75794399 -0.28827482 0.58516544 0.76308024 -0.31325921 0.56531161 0.80460697
		 -0.2838816 0.52155429 0.76268858 -0.33473009 0.55340934 0.76268858 -0.33473009 0.55340934
		 0.80460697 -0.2838816 0.52155429 0.79191601 -0.3329134 0.51189619 0.79384434 -0.28212863
		 0.53871566 0.79032964 -0.23934364 0.56399798 0.74718249 -0.31063291 0.58755893 0.74718249
		 -0.31063291 0.58755893 0.79032964 -0.23934364 0.56399798 0.76916862 -0.21294096 0.60252446
		 0.74652034 -0.33035803 0.57755601 0.76308024 -0.31325921 0.56531161 0.74946409 -0.32772443
		 0.5752393 0.74946409 -0.32772443 0.5752393 0.76308024 -0.31325921 0.56531161 0.76268858
		 -0.33473009 0.55340934 0.78844774 -0.29147691 0.54165614 0.74652034 -0.33035803 0.57755601
		 0.78314161 -0.30704355 0.54075271 0.78314161 -0.30704355 0.54075271 0.74652034 -0.33035803
		 0.57755601 0.74946409 -0.32772443 0.5752393 0.74718249 -0.31063291 0.58755893 0.76916862
		 -0.21294096 0.60252446 0.75794399 -0.28827482 0.58516544 0.75794399 -0.28827482 0.58516544
		 0.76916862 -0.21294096 0.60252446 0.76600975 -0.19597217 0.61222875 0.98471177 0.14297129
		 0.099508815 0.9848277 0.14661823 0.092830651 0.99132013 0.092927694 0.092999108 0.99132013
		 0.092927694 0.092999108 0.9848277 0.14661823 0.092830651 0.99235058 0.11340746 0.048775468
		 0.99490738 0.095672689 0.031718355 0.99719942 0.074175164 0.0095585138 0.99554688
		 0.059147645 0.073403083 0.99554688 0.059147645 0.073403083 0.99719942 0.074175164
		 0.0095585138 0.99855983 0.036190044 0.03960469 0.99212068 0.12261903 0.0257132 0.99220908
		 0.11271106 0.05307883 0.99293703 0.11859999 0.0031805588 0.99293703 0.11859999 0.0031805588
		 0.99220908 0.11271106 0.05307883 0.99441063 0.10214379 0.026722506 0.99667221 0.076648191
		 0.027739977 0.99969727 0.023667211 0.0067227138 0.99494433 0.10042413 -0.00090149738
		 0.99494433 0.10042413 -0.00090149738 0.99969727 0.023667211 0.0067227138 0.99958205
		 0.023160409 -0.017300433 0.88641703 -0.090639353 0.45392665 0.93239331 -0.044445012
		 0.35870236 0.89922941 -0.12593493 0.41895932 0.89922941 -0.12593493 0.41895932 0.93239331
		 -0.044445012 0.35870236 0.93946993 -0.077349998 0.33378613 0.94622165 -0.14812894
		 0.28761497 0.94765759 -0.21811017 0.23318037 0.90547043 -0.20357221 0.37239981 0.90547043
		 -0.20357221 0.37239981 0.94765759 -0.21811017 0.23318037 0.89830774 -0.28800708 0.33180591
		 -0.14591765 -0.40237567 0.90377092 -0.085303381 -0.40547618 0.91011667 -0.16428274
		 -0.25754148 0.95219934 -0.16428274 -0.25754148 0.95219934 -0.085303381 -0.40547618
		 0.91011667 -0.10495754 -0.2558918 0.96099079 -0.10251462 -0.60993779 0.78579044 -0.04534262
		 -0.63396341 0.77203268 -0.12297726 -0.50916779 0.85183614 -0.12297726 -0.50916779
		 0.85183614 -0.04534262 -0.63396341 0.77203268 -0.069144383 -0.52465922 0.84849972
		 0.99235058 0.11340746 0.048775468 0.99212068 0.12261903 0.0257132 0.99490738 0.095672689
		 0.031718355 0.99490738 0.095672689 0.031718355 0.99212068 0.12261903 0.0257132 0.99293703
		 0.11859999 0.0031805588 0.99235058 0.11340746 0.048775468 0.99490738 0.095672689
		 0.031718355 0.99132013 0.092927694 0.092999108 0.99132013 0.092927694 0.092999108
		 0.99490738 0.095672689 0.031718355 0.99554688 0.059147645 0.073403083 0.99132013
		 0.092927694 0.092999108 0.99554688 0.059147645 0.073403083 0.98707616 0.061295416
		 0.14806609 0.98707616 0.061295416 0.14806609 0.99554688 0.059147645 0.073403083 0.99294412
		 0.012467938 0.11792573 0.98707616 0.061295416 0.14806609 0.99294412 0.012467938 0.11792573
		 0.97731459 0.012753333 0.21140859;
	setAttr ".n[9462:9627]" -type "float3"  0.97731459 0.012753333 0.21140859 0.99294412
		 0.012467938 0.11792573 0.98444933 -0.041013248 0.17081402 0.97731459 0.012753333
		 0.21140859 0.98444933 -0.041013248 0.17081402 0.96516716 -0.029112052 0.26000935
		 0.96516716 -0.029112052 0.26000935 0.98444933 -0.041013248 0.17081402 0.9709118 -0.092157476
		 0.22099145 0.96516716 -0.029112052 0.26000935 0.9709118 -0.092157476 0.22099145 0.93946993
		 -0.077349998 0.33378613 0.93946993 -0.077349998 0.33378613 0.9709118 -0.092157476
		 0.22099145 0.94622165 -0.14812894 0.28761497 0.93946993 -0.077349998 0.33378613 0.94622165
		 -0.14812894 0.28761497 0.89922941 -0.12593493 0.41895932 0.89922941 -0.12593493 0.41895932
		 0.94622165 -0.14812894 0.28761497 0.90547043 -0.20357221 0.37239981 0.84117657 -0.19220328
		 0.50545019 0.89922941 -0.12593493 0.41895932 0.85287708 -0.25211638 0.45720676 0.85287708
		 -0.25211638 0.45720676 0.89922941 -0.12593493 0.41895932 0.90547043 -0.20357221 0.37239981
		 0.84117657 -0.19220328 0.50545019 0.85287708 -0.25211638 0.45720676 0.79759943 -0.25106287
		 0.5484547 0.79759943 -0.25106287 0.5484547 0.85287708 -0.25211638 0.45720676 0.80460697
		 -0.2838816 0.52155429 0.79759943 -0.25106287 0.5484547 0.80460697 -0.2838816 0.52155429
		 0.75794399 -0.28827482 0.58516544 0.75794399 -0.28827482 0.58516544 0.80460697 -0.2838816
		 0.52155429 0.76308024 -0.31325921 0.56531161 0.74652034 -0.33035803 0.57755601 0.74718249
		 -0.31063291 0.58755893 0.76308024 -0.31325921 0.56531161 0.76308024 -0.31325921 0.56531161
		 0.74718249 -0.31063291 0.58755893 0.75794399 -0.28827482 0.58516544 0.99494433 0.10042413
		 -0.00090149738 0.99958205 0.023160409 -0.017300433 0.99719942 0.074175164 0.0095585138
		 0.99719942 0.074175164 0.0095585138 0.99958205 0.023160409 -0.017300433 0.99959904
		 0.013854669 -0.024693318 0.99719942 0.074175164 0.0095585138 0.99959904 0.013854669
		 -0.024693318 0.99855983 0.036190044 0.03960469 0.99855983 0.036190044 0.03960469
		 0.99959904 0.013854669 -0.024693318 0.99962246 -0.014724227 -0.023197317 0.99855983
		 0.036190044 0.03960469 0.99962246 -0.014724227 -0.023197317 0.9975034 -0.020986903
		 0.06742762 0.9975034 -0.020986903 0.06742762 0.99962246 -0.014724227 -0.023197317
		 0.99806845 -0.058751523 0.020190615 0.9975034 -0.020986903 0.06742762 0.99806845
		 -0.058751523 0.020190615 0.98876518 -0.080704249 0.12581851 0.98876518 -0.080704249
		 0.12581851 0.99806845 -0.058751523 0.020190615 0.99053353 -0.11264179 0.078455001
		 0.98876518 -0.080704249 0.12581851 0.99053353 -0.11264179 0.078455001 0.97552758
		 -0.14276533 0.16722421 0.97552758 -0.14276533 0.16722421 0.99053353 -0.11264179 0.078455001
		 0.97763354 -0.176231 0.11478364 0.97552758 -0.14276533 0.16722421 0.97763354 -0.176231
		 0.11478364 0.94765759 -0.21811017 0.23318037 0.94765759 -0.21811017 0.23318037 0.97763354
		 -0.176231 0.11478364 0.94548726 -0.25758672 0.19925603 0.94765759 -0.21811017 0.23318037
		 0.94548726 -0.25758672 0.19925603 0.89830774 -0.28800708 0.33180591 0.89830774 -0.28800708
		 0.33180591 0.94548726 -0.25758672 0.19925603 0.88327062 -0.33885923 0.32404858 0.89830774
		 -0.28800708 0.33180591 0.88327062 -0.33885923 0.32404858 0.8346625 -0.33550254 0.43677974
		 0.8346625 -0.33550254 0.43677974 0.88327062 -0.33885923 0.32404858 0.80905223 -0.4098348
		 0.4212718 0.79191601 -0.3329134 0.51189619 0.8346625 -0.33550254 0.43677974 0.7659052
		 -0.43893552 0.46981364 0.7659052 -0.43893552 0.46981364 0.8346625 -0.33550254 0.43677974
		 0.80905223 -0.4098348 0.4212718 0.76268858 -0.33473009 0.55340934 0.79191601 -0.3329134
		 0.51189619 0.76538384 -0.41145536 0.49486566 0.76538384 -0.41145536 0.49486566 0.79191601
		 -0.3329134 0.51189619 0.7659052 -0.43893552 0.46981364 0.74946409 -0.32772443 0.5752393
		 0.76268858 -0.33473009 0.55340934 0.77386409 -0.3807067 0.50615889 0.77386409 -0.3807067
		 0.50615889 0.76268858 -0.33473009 0.55340934 0.76538384 -0.41145536 0.49486566 0.78314161
		 -0.30704355 0.54075271 0.74946409 -0.32772443 0.5752393 0.77661312 -0.33819517 0.53150356
		 0.77661312 -0.33819517 0.53150356 0.74946409 -0.32772443 0.5752393 0.77386409 -0.3807067
		 0.50615889 0.74718249 -0.31063291 0.58755893 0.74652034 -0.33035803 0.57755601 0.79384434
		 -0.28212863 0.53871566 0.79384434 -0.28212863 0.53871566 0.74652034 -0.33035803 0.57755601
		 0.78844774 -0.29147691 0.54165614 0.99220908 0.11271106 0.05307883 0.99212068 0.12261903
		 0.0257132 0.98541772 0.13872856 0.098520584 0.98541772 0.13872856 0.098520584 0.99212068
		 0.12261903 0.0257132 0.98507309 0.14838958 0.087243915 0.99494433 0.10042413 -0.00090149738
		 0.99293703 0.11859999 0.0031805588 0.99667221 0.076648191 0.027739977 0.99667221
		 0.076648191 0.027739977 0.99293703 0.11859999 0.0031805588 0.99441063 0.10214379
		 0.026722506 0.14064579 0.87965566 -0.45433983 0.82415336 0.50098389 -0.26417109 0.18551236
		 0.7425769 -0.6435563 0.18551236 0.7425769 -0.6435563 0.82415336 0.50098389 -0.26417109
		 0.83439988 0.43652043 -0.33649188 0.2195747 0.62007886 -0.75318599 0.18551236 0.7425769
		 -0.6435563 0.83342212 0.40246427 -0.37872165 0.83342212 0.40246427 -0.37872165 0.18551236
		 0.7425769 -0.6435563 0.83439988 0.43652043 -0.33649188 0.25899196 0.42127138 -0.86916834
		 0.2195747 0.62007886 -0.75318599 0.86092812 0.31787977 -0.3971841 0.86092812 0.31787977
		 -0.3971841 0.2195747 0.62007886 -0.75318599 0.83342212 0.40246427 -0.37872165 0.28435728
		 0.24180746 -0.92772305 0.25899196 0.42127138 -0.86916834 0.8650167 0.24722378 -0.43660799
		 0.8650167 0.24722378 -0.43660799 0.25899196 0.42127138 -0.86916834 0.86092812 0.31787977
		 -0.3971841 0.29915142 0.016235681 -0.95406753 0.28435728 0.24180746 -0.92772305 0.88492531
		 0.13600668 -0.44543165 0.88492531 0.13600668 -0.44543165 0.28435728 0.24180746 -0.92772305
		 0.8650167 0.24722378 -0.43660799 0.3107022 -0.1937291 -0.93055528;
	setAttr ".n[9628:9793]" -type "float3"  0.29915142 0.016235681 -0.95406753 0.87934518
		 0.017327918 -0.47586957 0.87934518 0.017327918 -0.47586957 0.29915142 0.016235681
		 -0.95406753 0.88492531 0.13600668 -0.44543165 0.3044529 -0.45696247 -0.8357594 0.3107022
		 -0.1937291 -0.93055528 0.89406925 -0.14989558 -0.42210358 0.89406925 -0.14989558
		 -0.42210358 0.3107022 -0.1937291 -0.93055528 0.87934518 0.017327918 -0.47586957 0.3044529
		 -0.45696247 -0.8357594 0.89406925 -0.14989558 -0.42210358 0.28872585 -0.68702167
		 -0.66681224 0.28872585 -0.68702167 -0.66681224 0.89406925 -0.14989558 -0.42210358
		 0.88464952 -0.34522939 -0.31338775 0.28872585 -0.68702167 -0.66681224 0.88464952
		 -0.34522939 -0.31338775 0.25880882 -0.83924967 -0.47820288 0.25880882 -0.83924967
		 -0.47820288 0.88464952 -0.34522939 -0.31338775 0.83379543 -0.52450413 -0.17228071
		 0.25880882 -0.83924967 -0.47820288 0.83379543 -0.52450413 -0.17228071 0.24405086
		 -0.8848083 -0.39693007 0.24405086 -0.8848083 -0.39693007 0.83379543 -0.52450413 -0.17228071
		 0.81761885 -0.57152182 -0.069729328 0.24405086 -0.8848083 -0.39693007 0.81761885
		 -0.57152182 -0.069729328 0.22675508 -0.91107523 -0.3442733 0.22675508 -0.91107523
		 -0.3442733 0.81761885 -0.57152182 -0.069729328 0.77109426 -0.63653159 0.01552933
		 0.21970636 -0.93398058 -0.28179666 0.22675508 -0.91107523 -0.3442733 0.7455188 -0.64773113
		 0.15699054 0.7455188 -0.64773113 0.15699054 0.22675508 -0.91107523 -0.3442733 0.77109426
		 -0.63653159 0.01552933 0.1775814 -0.97070426 -0.16185832 0.21970636 -0.93398058 -0.28179666
		 0.64847261 -0.70075256 0.29737028 0.64847261 -0.70075256 0.29737028 0.21970636 -0.93398058
		 -0.28179666 0.7455188 -0.64773113 0.15699054 0.11621848 -0.99086916 0.068349071 0.1775814
		 -0.97070426 -0.16185832 0.57509154 -0.67549497 0.46149349 0.57509154 -0.67549497
		 0.46149349 0.1775814 -0.97070426 -0.16185832 0.64847261 -0.70075256 0.29737028 0.060808294
		 -0.92140913 0.38380671 0.11621848 -0.99086916 0.068349071 0.53135806 -0.59190702
		 0.60605663 0.53135806 -0.59190702 0.60605663 0.11621848 -0.99086916 0.068349071 0.57509154
		 -0.67549497 0.46149349 0.012589769 -0.8264913 0.56280869 0.060808294 -0.92140913
		 0.38380671 0.4938972 -0.55804008 0.66682595 0.4938972 -0.55804008 0.66682595 0.060808294
		 -0.92140913 0.38380671 0.53135806 -0.59190702 0.60605663 -0.022282131 -0.73627317
		 0.67631745 0.012589769 -0.8264913 0.56280869 0.46807352 -0.53735918 0.70153564 0.46807352
		 -0.53735918 0.70153564 0.012589769 -0.8264913 0.56280869 0.4938972 -0.55804008 0.66682595
		 -0.04534262 -0.63396341 0.77203268 -0.022282131 -0.73627317 0.67631745 0.48025066
		 -0.48995304 0.72753376 0.48025066 -0.48995304 0.72753376 -0.022282131 -0.73627317
		 0.67631745 0.46807352 -0.53735918 0.70153564 -0.069144383 -0.52465922 0.84849972
		 -0.04534262 -0.63396341 0.77203268 0.45165512 -0.4517507 0.76936918 0.45165512 -0.4517507
		 0.76936918 -0.04534262 -0.63396341 0.77203268 0.48025066 -0.48995304 0.72753376 -0.069144383
		 -0.52465922 0.84849972 0.45165512 -0.4517507 0.76936918 -0.085303381 -0.40547618
		 0.91011667 -0.085303381 -0.40547618 0.91011667 0.45165512 -0.4517507 0.76936918 0.46473366
		 -0.40033609 0.78978074 -0.085303381 -0.40547618 0.91011667 0.46473366 -0.40033609
		 0.78978074 -0.10495754 -0.2558918 0.96099079 -0.10495754 -0.2558918 0.96099079 0.46473366
		 -0.40033609 0.78978074 0.43881738 -0.35493302 0.82550704 -0.10495754 -0.2558918 0.96099079
		 0.43881738 -0.35493302 0.82550704 -0.11451844 -0.075023293 0.99058419 -0.11451844
		 -0.075023293 0.99058419 0.43881738 -0.35493302 0.82550704 0.45300505 -0.30192474
		 0.83882529 -0.11451844 -0.075023293 0.99058419 0.45300505 -0.30192474 0.83882529
		 -0.11805826 0.17027174 0.97829944 -0.11805826 0.17027174 0.97829944 0.45300505 -0.30192474
		 0.83882529 0.46549901 -0.21178062 0.85933673 -0.11805826 0.17027174 0.97829944 0.46549901
		 -0.21178062 0.85933673 -0.10153943 0.52595305 0.84443063 -0.10153943 0.52595305 0.84443063
		 0.46549901 -0.21178062 0.85933673 0.48636022 -0.0055401935 0.87374085 -0.10153943
		 0.52595305 0.84443063 0.48636022 -0.0055401935 0.87374085 -0.061853666 0.74993193
		 0.6586169 -0.061853666 0.74993193 0.6586169 0.48636022 -0.0055401935 0.87374085 0.57531905
		 0.1576432 0.80259371 -0.061853666 0.74993193 0.6586169 0.57531905 0.1576432 0.80259371
		 -0.037678778 0.84683788 0.53051478 -0.037678778 0.84683788 0.53051478 0.57531905
		 0.1576432 0.80259371 0.67852038 0.32685801 0.65785551 -0.037678778 0.84683788 0.53051478
		 0.67852038 0.32685801 0.65785551 -0.033036016 0.88092172 0.47210756 -0.033036016
		 0.88092172 0.47210756 0.67852038 0.32685801 0.65785551 0.7168358 0.46307534 0.52125591
		 -0.033938471 0.89047128 0.45377204 -0.033036016 0.88092172 0.47210756 0.74112403
		 0.52488786 0.41860235 0.74112403 0.52488786 0.41860235 -0.033036016 0.88092172 0.47210756
		 0.7168358 0.46307534 0.52125591 -0.033938471 0.89047128 0.45377204 0.74112403 0.52488786
		 0.41860235 -0.039628282 0.89588815 0.44250882 -0.039628282 0.89588815 0.44250882
		 0.74112403 0.52488786 0.41860235 0.71736073 0.58484918 0.37860933 -0.039628282 0.89588815
		 0.44250882 0.71736073 0.58484918 0.37860933 -0.036257889 0.91869962 0.39328912 -0.036257889
		 0.91869962 0.39328912 0.71736073 0.58484918 0.37860933 0.76246107 0.59004515 0.26551804
		 -0.036257889 0.91869962 0.39328912 0.76246107 0.59004515 0.26551804 -0.024208138
		 0.96178079 0.27274847 -0.024208138 0.96178079 0.27274847 0.76246107 0.59004515 0.26551804
		 0.70686007 0.68986601 0.15631273 -0.024208138 0.96178079 0.27274847 0.70686007 0.68986601
		 0.15631273 0.017758593 0.99955523 0.023957158 0.017758593 0.99955523 0.023957158
		 0.70686007 0.68986601 0.15631273 0.7790696 0.62536299 -0.044403657 0.017758593 0.99955523
		 0.023957158 0.7790696 0.62536299 -0.044403657 0.095932543 0.96316254 -0.25122684
		 0.095932543 0.96316254 -0.25122684 0.7790696 0.62536299 -0.044403657;
	setAttr ".n[9794:9959]" -type "float3"  0.79160225 0.58195096 -0.18627651 0.095932543
		 0.96316254 -0.25122684 0.79160225 0.58195096 -0.18627651 0.14064579 0.87965566 -0.45433983
		 0.14064579 0.87965566 -0.45433983 0.79160225 0.58195096 -0.18627651 0.82415336 0.50098389
		 -0.26417109 0.98409432 0.10872291 0.14049074 0.88464952 -0.34522939 -0.31338775 0.98471177
		 0.14297129 0.099508815 0.98471177 0.14297129 0.099508815 0.88464952 -0.34522939 -0.31338775
		 0.89406925 -0.14989558 -0.42210358 0.97619259 0.04364983 0.21246825 0.83379543 -0.52450413
		 -0.17228071 0.98409432 0.10872291 0.14049074 0.98409432 0.10872291 0.14049074 0.83379543
		 -0.52450413 -0.17228071 0.88464952 -0.34522939 -0.31338775 0.96102184 0.00078277924
		 0.27647129 0.81761885 -0.57152182 -0.069729328 0.97619259 0.04364983 0.21246825 0.97619259
		 0.04364983 0.21246825 0.81761885 -0.57152182 -0.069729328 0.83379543 -0.52450413
		 -0.17228071 0.96102184 0.00078277924 0.27647129 0.93239331 -0.044445012 0.35870236
		 0.81761885 -0.57152182 -0.069729328 0.81761885 -0.57152182 -0.069729328 0.93239331
		 -0.044445012 0.35870236 0.77109426 -0.63653159 0.01552933 0.93239331 -0.044445012
		 0.35870236 0.88641703 -0.090639353 0.45392665 0.77109426 -0.63653159 0.01552933 0.77109426
		 -0.63653159 0.01552933 0.88641703 -0.090639353 0.45392665 0.7455188 -0.64773113 0.15699054
		 0.88641703 -0.090639353 0.45392665 0.8140077 -0.14577225 0.56226498 0.7455188 -0.64773113
		 0.15699054 0.7455188 -0.64773113 0.15699054 0.8140077 -0.14577225 0.56226498 0.64847261
		 -0.70075256 0.29737028 0.8140077 -0.14577225 0.56226498 0.77288181 -0.16966349 0.61144745
		 0.64847261 -0.70075256 0.29737028 0.64847261 -0.70075256 0.29737028 0.77288181 -0.16966349
		 0.61144745 0.57509154 -0.67549497 0.46149349 0.77288181 -0.16966349 0.61144745 0.76600975
		 -0.19597217 0.61222875 0.57509154 -0.67549497 0.46149349 0.57509154 -0.67549497 0.46149349
		 0.76600975 -0.19597217 0.61222875 0.53135806 -0.59190702 0.60605663 0.76600975 -0.19597217
		 0.61222875 0.76916862 -0.21294096 0.60252446 0.53135806 -0.59190702 0.60605663 0.53135806
		 -0.59190702 0.60605663 0.76916862 -0.21294096 0.60252446 0.4938972 -0.55804008 0.66682595
		 0.76916862 -0.21294096 0.60252446 0.79032964 -0.23934364 0.56399798 0.4938972 -0.55804008
		 0.66682595 0.4938972 -0.55804008 0.66682595 0.79032964 -0.23934364 0.56399798 0.46807352
		 -0.53735918 0.70153564 0.79032964 -0.23934364 0.56399798 0.79384434 -0.28212863 0.53871566
		 0.46807352 -0.53735918 0.70153564 0.46807352 -0.53735918 0.70153564 0.79384434 -0.28212863
		 0.53871566 0.48025066 -0.48995304 0.72753376 0.79384434 -0.28212863 0.53871566 0.78844774
		 -0.29147691 0.54165614 0.48025066 -0.48995304 0.72753376 0.48025066 -0.48995304 0.72753376
		 0.78844774 -0.29147691 0.54165614 0.45165512 -0.4517507 0.76936918 0.78314161 -0.30704355
		 0.54075271 0.46473366 -0.40033609 0.78978074 0.78844774 -0.29147691 0.54165614 0.78844774
		 -0.29147691 0.54165614 0.46473366 -0.40033609 0.78978074 0.45165512 -0.4517507 0.76936918
		 0.77661312 -0.33819517 0.53150356 0.43881738 -0.35493302 0.82550704 0.78314161 -0.30704355
		 0.54075271 0.78314161 -0.30704355 0.54075271 0.43881738 -0.35493302 0.82550704 0.46473366
		 -0.40033609 0.78978074 0.77386409 -0.3807067 0.50615889 0.45300505 -0.30192474 0.83882529
		 0.77661312 -0.33819517 0.53150356 0.77661312 -0.33819517 0.53150356 0.45300505 -0.30192474
		 0.83882529 0.43881738 -0.35493302 0.82550704 0.76538384 -0.41145536 0.49486566 0.46549901
		 -0.21178062 0.85933673 0.77386409 -0.3807067 0.50615889 0.77386409 -0.3807067 0.50615889
		 0.46549901 -0.21178062 0.85933673 0.45300505 -0.30192474 0.83882529 0.7659052 -0.43893552
		 0.46981364 0.48636022 -0.0055401935 0.87374085 0.76538384 -0.41145536 0.49486566
		 0.76538384 -0.41145536 0.49486566 0.48636022 -0.0055401935 0.87374085 0.46549901
		 -0.21178062 0.85933673 0.80905223 -0.4098348 0.4212718 0.57531905 0.1576432 0.80259371
		 0.7659052 -0.43893552 0.46981364 0.7659052 -0.43893552 0.46981364 0.57531905 0.1576432
		 0.80259371 0.48636022 -0.0055401935 0.87374085 0.88327062 -0.33885923 0.32404858
		 0.67852038 0.32685801 0.65785551 0.80905223 -0.4098348 0.4212718 0.80905223 -0.4098348
		 0.4212718 0.67852038 0.32685801 0.65785551 0.57531905 0.1576432 0.80259371 0.94548726
		 -0.25758672 0.19925603 0.7168358 0.46307534 0.52125591 0.88327062 -0.33885923 0.32404858
		 0.88327062 -0.33885923 0.32404858 0.7168358 0.46307534 0.52125591 0.67852038 0.32685801
		 0.65785551 0.97763354 -0.176231 0.11478364 0.74112403 0.52488786 0.41860235 0.94548726
		 -0.25758672 0.19925603 0.94548726 -0.25758672 0.19925603 0.74112403 0.52488786 0.41860235
		 0.7168358 0.46307534 0.52125591 0.97763354 -0.176231 0.11478364 0.99053353 -0.11264179
		 0.078455001 0.74112403 0.52488786 0.41860235 0.74112403 0.52488786 0.41860235 0.99053353
		 -0.11264179 0.078455001 0.71736073 0.58484918 0.37860933 0.99053353 -0.11264179 0.078455001
		 0.99806845 -0.058751523 0.020190615 0.71736073 0.58484918 0.37860933 0.71736073 0.58484918
		 0.37860933 0.99806845 -0.058751523 0.020190615 0.76246107 0.59004515 0.26551804 0.99806845
		 -0.058751523 0.020190615 0.99962246 -0.014724227 -0.023197317 0.76246107 0.59004515
		 0.26551804 0.76246107 0.59004515 0.26551804 0.99962246 -0.014724227 -0.023197317
		 0.70686007 0.68986601 0.15631273 0.99962246 -0.014724227 -0.023197317 0.99959904
		 0.013854669 -0.024693318 0.70686007 0.68986601 0.15631273 0.70686007 0.68986601 0.15631273
		 0.99959904 0.013854669 -0.024693318 0.7790696 0.62536299 -0.044403657 0.99959904
		 0.013854669 -0.024693318 0.99958205 0.023160409 -0.017300433 0.7790696 0.62536299
		 -0.044403657 0.7790696 0.62536299 -0.044403657 0.99958205 0.023160409 -0.017300433
		 0.79160225 0.58195096 -0.18627651 0.99958205 0.023160409 -0.017300433 0.99969727
		 0.023667211 0.0067227138 0.79160225 0.58195096 -0.18627651;
	setAttr ".n[9960:10004]" -type "float3"  0.79160225 0.58195096 -0.18627651 0.99969727
		 0.023667211 0.0067227138 0.82415336 0.50098389 -0.26417109 0.99969727 0.023667211
		 0.0067227138 0.99667221 0.076648191 0.027739977 0.82415336 0.50098389 -0.26417109
		 0.82415336 0.50098389 -0.26417109 0.99667221 0.076648191 0.027739977 0.83439988 0.43652043
		 -0.33649188 0.99667221 0.076648191 0.027739977 0.99441063 0.10214379 0.026722506
		 0.83439988 0.43652043 -0.33649188 0.83439988 0.43652043 -0.33649188 0.99441063 0.10214379
		 0.026722506 0.83342212 0.40246427 -0.37872165 0.99441063 0.10214379 0.026722506 0.99220908
		 0.11271106 0.05307883 0.83342212 0.40246427 -0.37872165 0.83342212 0.40246427 -0.37872165
		 0.99220908 0.11271106 0.05307883 0.86092812 0.31787977 -0.3971841 0.99220908 0.11271106
		 0.05307883 0.98541772 0.13872856 0.098520584 0.86092812 0.31787977 -0.3971841 0.86092812
		 0.31787977 -0.3971841 0.98541772 0.13872856 0.098520584 0.8650167 0.24722378 -0.43660799
		 0.98507309 0.14838958 0.087243915 0.88492531 0.13600668 -0.44543165 0.98541772 0.13872856
		 0.098520584 0.98541772 0.13872856 0.098520584 0.88492531 0.13600668 -0.44543165 0.8650167
		 0.24722378 -0.43660799 0.88492531 0.13600668 -0.44543165 0.98507309 0.14838958 0.087243915
		 0.87934518 0.017327918 -0.47586957 0.87934518 0.017327918 -0.47586957 0.98507309
		 0.14838958 0.087243915 0.9848277 0.14661823 0.092830651 0.98471177 0.14297129 0.099508815
		 0.89406925 -0.14989558 -0.42210358 0.9848277 0.14661823 0.092830651 0.9848277 0.14661823
		 0.092830651 0.89406925 -0.14989558 -0.42210358 0.87934518 0.017327918 -0.47586957;
	setAttr -s 3335 -ch 10005 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 0 2 1
		f 3 3 4 -2
		mu 0 3 2 3 1
		f 3 5 6 7
		mu 0 3 4 6 5
		f 3 8 9 -7
		mu 0 3 6 7 5
		f 3 10 11 12
		mu 0 3 5 9 8
		f 3 13 14 -12
		mu 0 3 9 10 8
		f 3 15 16 17
		mu 0 3 11 13 12
		f 3 18 19 -17
		mu 0 3 13 14 12
		f 3 20 21 22
		mu 0 3 15 17 16
		f 3 23 24 -22
		mu 0 3 17 18 16
		f 3 25 26 27
		mu 0 3 19 20 2
		f 3 28 29 -27
		mu 0 3 20 21 2
		f 3 30 31 32
		mu 0 3 22 24 23
		f 3 33 34 -32
		mu 0 3 24 25 23
		f 3 35 36 37
		mu 0 3 26 28 27
		f 3 38 39 -37
		mu 0 3 28 29 27
		f 3 40 41 42
		mu 0 3 30 32 31
		f 3 43 44 -42
		mu 0 3 32 33 31
		f 3 45 46 47
		mu 0 3 34 36 35
		f 3 48 49 -47
		mu 0 3 36 19 35
		f 3 50 51 52
		mu 0 3 37 16 38
		f 3 -25 53 -52
		mu 0 3 16 18 38
		f 3 54 55 56
		mu 0 3 39 41 40
		f 3 57 58 -56
		mu 0 3 41 42 40
		f 3 59 60 -53
		mu 0 3 38 43 37
		f 3 61 62 -61
		mu 0 3 43 44 37
		f 3 63 64 65
		mu 0 3 45 47 46
		f 3 66 67 -65
		mu 0 3 47 48 46
		f 3 -54 68 69
		mu 0 3 38 18 49
		f 3 70 71 -69
		mu 0 3 18 50 49
		f 3 72 73 -5
		mu 0 3 3 51 1
		f 3 74 75 -74
		mu 0 3 51 52 1
		f 3 76 77 78
		mu 0 3 50 54 53
		f 3 79 80 -78
		mu 0 3 54 20 53
		f 3 81 82 83
		mu 0 3 55 57 56
		f 3 84 85 -83
		mu 0 3 57 4 56
		f 3 86 87 88
		mu 0 3 58 60 59
		f 3 89 90 -88
		mu 0 3 60 61 59
		f 3 91 92 93
		mu 0 3 62 63 22
		f 3 94 -31 -93
		mu 0 3 63 24 22
		f 3 95 96 97
		mu 0 3 64 66 65
		f 3 98 99 -97
		mu 0 3 66 67 65
		f 3 100 101 102
		mu 0 3 68 70 69
		f 3 103 104 -102
		mu 0 3 70 71 69
		f 3 105 106 -15
		mu 0 3 10 72 8
		f 3 107 108 -107
		mu 0 3 72 73 8
		f 3 109 110 111
		mu 0 3 74 75 58
		f 3 -108 112 113
		mu 0 3 73 72 76
		f 3 114 115 -113
		mu 0 3 72 77 76
		f 3 116 117 118
		mu 0 3 78 80 79
		f 3 119 120 -118
		mu 0 3 80 81 79
		f 3 121 122 123
		mu 0 3 82 64 83
		f 3 124 125 -123
		mu 0 3 64 78 83
		f 3 126 127 -119
		mu 0 3 79 84 78
		f 3 128 -126 -128
		mu 0 3 84 83 78
		f 3 129 130 131
		mu 0 3 44 86 85
		f 3 132 133 -131
		mu 0 3 86 87 85
		f 3 134 135 -133
		mu 0 3 86 88 87
		f 3 136 137 -136
		mu 0 3 88 89 87
		f 3 138 -85 139
		mu 0 3 90 4 57
		f 3 140 141 -82
		mu 0 3 55 91 57
		f 3 142 143 144
		mu 0 3 92 93 6
		f 3 145 -9 -144
		mu 0 3 93 7 6
		f 3 146 147 148
		mu 0 3 94 91 95
		f 3 149 150 -148
		mu 0 3 91 96 95
		f 3 151 152 -147
		mu 0 3 94 97 91
		f 3 153 -142 -153
		mu 0 3 97 57 91
		f 3 154 155 -3
		mu 0 3 1 98 0
		f 3 156 157 158
		mu 0 3 99 101 100
		f 3 159 160 -158
		mu 0 3 101 102 100
		f 3 161 162 163
		mu 0 3 103 105 104
		f 3 164 165 -163
		mu 0 3 105 106 104
		f 3 166 167 168
		mu 0 3 107 109 108
		f 3 169 170 -168
		mu 0 3 109 110 108
		f 3 171 172 -166
		mu 0 3 106 111 104
		f 3 173 174 -173
		mu 0 3 111 112 104
		f 3 -169 175 176
		mu 0 3 107 108 113
		f 3 177 178 -176
		mu 0 3 108 114 113
		f 3 179 180 181
		mu 0 3 115 117 116
		f 3 182 183 184
		mu 0 3 118 120 119
		f 3 185 186 -184
		mu 0 3 120 121 119
		f 3 187 188 189
		mu 0 3 122 124 123
		f 3 190 191 -190
		mu 0 3 123 125 122
		f 3 192 193 -192
		mu 0 3 125 126 122
		f 3 194 195 196
		mu 0 3 127 129 128
		f 3 197 198 -196
		mu 0 3 129 130 128
		f 3 199 200 201
		mu 0 3 131 133 132
		f 3 202 203 -201
		mu 0 3 133 134 132
		f 3 -202 204 205
		mu 0 3 131 132 129
		f 3 206 207 -188
		mu 0 3 122 135 124
		f 3 208 209 -208
		mu 0 3 135 136 124
		f 3 -193 210 211
		mu 0 3 126 125 137
		f 3 212 213 -211
		mu 0 3 125 138 137
		f 3 -214 214 215
		mu 0 3 137 138 139
		f 3 216 217 -215
		mu 0 3 138 115 139
		f 3 -181 218 219
		mu 0 3 116 117 140
		f 3 220 221 -219
		mu 0 3 117 141 140
		f 3 -187 222 223
		mu 0 3 119 121 142
		f 3 224 225 -223
		mu 0 3 121 143 142
		f 3 226 227 228
		mu 0 3 144 146 145
		f 3 229 230 -228
		mu 0 3 146 147 145
		f 3 231 232 233
		mu 0 3 148 150 149
		f 3 234 235 236
		mu 0 3 151 153 152
		f 3 237 238 239
		mu 0 3 130 132 154
		f 3 240 241 -239
		mu 0 3 132 155 154
		f 3 -197 242 243
		mu 0 3 127 128 13
		f 3 244 -19 -243
		mu 0 3 128 14 13
		f 3 245 246 247
		mu 0 3 156 158 157
		f 3 248 249 -247
		mu 0 3 158 159 157
		f 3 250 251 -250
		mu 0 3 159 160 157
		f 3 252 253 -252
		mu 0 3 160 161 157
		f 3 254 255 256
		mu 0 3 162 161 136
		f 3 -253 257 -256
		mu 0 3 161 160 136
		f 3 258 259 260
		mu 0 3 163 165 164
		f 3 261 262 263
		mu 0 3 166 168 167
		f 3 264 265 -263
		mu 0 3 168 169 167
		f 3 266 267 268
		mu 0 3 165 168 170
		f 3 269 270 271
		mu 0 3 171 173 172
		f 3 272 273 -271
		mu 0 3 173 174 172
		f 3 274 275 276
		mu 0 3 175 176 73
		f 3 277 -109 -276
		mu 0 3 176 8 73
		f 3 278 279 280
		mu 0 3 17 178 177
		f 3 281 282 -280
		mu 0 3 178 179 177
		f 3 283 284 -230
		mu 0 3 146 180 147
		f 3 285 286 -285
		mu 0 3 180 181 147
		f 3 287 288 -137
		mu 0 3 88 182 89
		f 3 289 290 -289
		mu 0 3 182 183 89
		f 3 291 292 293
		mu 0 3 184 185 154
		f 3 294 -240 -293
		mu 0 3 185 130 154
		f 3 295 296 297
		mu 0 3 186 188 187
		f 3 298 299 -297
		mu 0 3 188 189 187
		f 3 300 301 302
		mu 0 3 190 192 191
		f 3 303 304 -302
		mu 0 3 192 193 191
		f 3 305 306 307
		mu 0 3 194 196 195
		f 3 308 309 -307
		mu 0 3 196 197 195
		f 3 310 311 312
		mu 0 3 198 200 199
		f 3 313 314 -312
		mu 0 3 200 201 199
		f 3 -68 315 316
		mu 0 3 46 48 202
		f 3 317 318 -316
		mu 0 3 48 203 202
		f 3 319 320 321
		mu 0 3 204 206 205
		f 3 322 323 -321
		mu 0 3 206 207 205
		f 3 324 325 -84
		mu 0 3 56 208 55
		f 3 326 327 -326
		mu 0 3 208 209 55
		f 3 328 329 330
		mu 0 3 210 211 82
		f 3 331 332 -330
		mu 0 3 211 212 82
		f 3 333 334 335
		mu 0 3 213 215 214
		f 3 336 337 -335
		mu 0 3 215 216 214
		f 3 338 339 -154
		mu 0 3 97 217 57
		f 3 340 -140 -340
		mu 0 3 217 90 57
		f 3 341 342 343
		mu 0 3 218 220 219
		f 3 344 345 -343
		mu 0 3 220 221 219
		f 3 346 347 348
		mu 0 3 222 224 223
		f 3 349 350 -348
		mu 0 3 224 225 223
		f 3 351 352 353
		mu 0 3 226 228 227
		f 3 354 355 -353
		mu 0 3 228 229 227
		f 3 356 357 358
		mu 0 3 230 219 231
		f 3 359 360 -358
		mu 0 3 219 232 231
		f 3 361 362 363
		mu 0 3 233 235 234
		f 3 364 365 -363
		mu 0 3 235 236 234
		f 3 366 367 368
		mu 0 3 237 239 238
		f 3 369 370 -368
		mu 0 3 239 240 238
		f 3 -242 371 372
		mu 0 3 154 155 241
		f 3 373 374 -372
		mu 0 3 155 242 241
		f 3 375 376 377
		mu 0 3 243 245 244
		f 3 378 379 -377
		mu 0 3 245 246 244
		f 3 380 381 382
		mu 0 3 247 249 248
		f 3 383 384 -382
		mu 0 3 249 250 248
		f 3 385 386 387
		mu 0 3 251 253 252
		f 3 388 389 -387
		mu 0 3 253 254 252
		f 3 390 391 392
		mu 0 3 255 257 256
		f 3 393 394 -392
		mu 0 3 257 258 256
		f 3 395 396 397
		mu 0 3 259 261 260
		f 3 398 399 -397
		mu 0 3 261 262 260
		f 3 400 401 402
		mu 0 3 263 265 264
		f 3 403 404 -402
		mu 0 3 265 266 264
		f 3 405 406 407
		mu 0 3 267 269 268
		f 3 408 409 -407
		mu 0 3 269 270 268
		f 3 410 411 412
		mu 0 3 271 273 272
		f 3 413 414 -412
		mu 0 3 273 274 272
		f 3 415 416 417
		mu 0 3 275 277 276
		f 3 -417 418 419
		mu 0 3 276 277 278
		f 3 420 421 -419
		mu 0 3 277 279 278
		f 3 422 423 424
		mu 0 3 280 282 281
		f 3 425 426 -424
		mu 0 3 282 283 281
		f 3 427 428 429
		mu 0 3 284 286 285
		f 3 430 431 -429
		mu 0 3 286 287 285
		f 3 432 433 434
		mu 0 3 288 290 289
		f 3 435 436 -434
		mu 0 3 290 291 289
		f 3 437 438 439
		mu 0 3 292 294 293
		f 3 440 441 -439
		mu 0 3 294 295 293
		f 3 442 443 444
		mu 0 3 296 298 297
		f 3 445 446 -444
		mu 0 3 298 299 297
		f 3 447 448 449
		mu 0 3 300 302 301
		f 3 450 451 -449
		mu 0 3 302 303 301
		f 3 452 453 454
		mu 0 3 304 306 305
		f 3 455 456 -454
		mu 0 3 306 307 305
		f 3 457 458 459
		mu 0 3 308 310 309
		f 3 460 461 -459
		mu 0 3 310 311 309
		f 3 462 463 464
		mu 0 3 312 314 313
		f 3 465 466 -464
		mu 0 3 314 315 313
		f 3 467 468 469
		mu 0 3 316 318 317
		f 3 470 471 -469
		mu 0 3 318 319 317
		f 3 472 473 474
		mu 0 3 320 322 321
		f 3 475 476 -474
		mu 0 3 322 323 321
		f 3 477 478 479
		mu 0 3 324 326 325
		f 3 480 481 -479
		mu 0 3 326 327 325
		f 3 482 483 484
		mu 0 3 328 330 329
		f 3 485 486 -484
		mu 0 3 330 331 329
		f 3 487 488 489
		mu 0 3 332 334 333
		f 3 490 491 -489
		mu 0 3 334 335 333
		f 3 -488 492 493
		mu 0 3 334 332 336
		f 3 494 495 -493
		mu 0 3 332 337 336
		f 3 496 497 498
		mu 0 3 338 340 339
		f 3 499 500 -498
		mu 0 3 340 341 339
		f 3 501 502 -499
		mu 0 3 339 342 338
		f 3 503 504 -503
		mu 0 3 342 343 338
		f 3 505 506 507
		mu 0 3 344 346 345
		f 3 508 509 -507
		mu 0 3 346 347 345
		f 3 510 511 -508
		mu 0 3 345 348 344
		f 3 512 513 -512
		mu 0 3 348 349 344
		f 3 514 515 -177
		mu 0 3 113 350 107
		f 3 516 517 -516
		mu 0 3 350 351 107
		f 3 518 519 520
		mu 0 3 352 354 353
		f 3 521 522 -520
		mu 0 3 354 355 353
		f 3 523 524 525
		mu 0 3 356 358 357
		f 3 526 527 -525
		mu 0 3 358 359 357
		f 3 528 529 530
		mu 0 3 360 362 361
		f 3 531 -510 -530
		mu 0 3 362 363 361
		f 3 532 533 534
		mu 0 3 364 366 365
		f 3 -167 535 -534
		mu 0 3 366 367 365
		f 3 536 537 538
		mu 0 3 368 100 369
		f 3 -161 539 -538
		mu 0 3 100 102 369
		f 3 540 541 542
		mu 0 3 370 372 371
		f 3 543 544 -542
		mu 0 3 372 373 371
		f 3 -212 545 546
		mu 0 3 374 376 375
		f 3 547 548 -546
		mu 0 3 376 377 375
		f 3 549 550 551
		mu 0 3 378 380 379
		f 3 552 553 -551
		mu 0 3 380 381 379
		f 3 554 555 556
		mu 0 3 382 52 383
		f 3 -75 557 -556
		mu 0 3 52 51 383
		f 3 558 559 560
		mu 0 3 384 386 385
		f 3 561 562 -560
		mu 0 3 386 387 385
		f 3 563 564 565
		mu 0 3 388 268 389
		f 3 566 567 -565
		mu 0 3 268 390 389
		f 3 568 569 570
		mu 0 3 391 392 146
		f 3 571 -284 -570
		mu 0 3 392 180 146
		f 3 572 573 574
		mu 0 3 393 74 128
		f 3 575 -245 -574
		mu 0 3 74 14 128
		f 3 -277 576 577
		mu 0 3 175 73 394
		f 3 -114 578 -577
		mu 0 3 73 76 394
		f 3 579 580 -578
		mu 0 3 394 395 175
		f 3 581 582 -581
		mu 0 3 395 396 175
		f 3 583 584 585
		mu 0 3 397 399 398
		f 3 586 587 -585
		mu 0 3 399 400 398
		f 3 -213 588 589
		mu 0 3 138 125 401
		f 3 590 591 -589
		mu 0 3 125 402 401
		f 3 592 593 594
		mu 0 3 403 176 199
		f 3 595 596 -594
		mu 0 3 176 404 199
		f 3 597 598 599
		mu 0 3 405 407 406
		f 3 600 601 -599
		mu 0 3 407 408 406
		f 3 602 603 604
		mu 0 3 409 410 136
		f 3 605 -210 -604
		mu 0 3 410 124 136
		f 3 -64 606 607
		mu 0 3 47 45 411
		f 3 608 609 -607
		mu 0 3 45 412 411
		f 3 610 611 612
		mu 0 3 413 415 414
		f 3 613 614 -612
		mu 0 3 415 416 414
		f 3 615 616 617
		mu 0 3 417 95 418
		f 3 618 619 -617
		mu 0 3 95 419 418
		f 3 620 621 -336
		mu 0 3 214 420 213
		f 3 622 623 -622
		mu 0 3 420 421 213
		f 3 624 625 626
		mu 0 3 77 422 75
		f 3 627 628 -626
		mu 0 3 422 423 75
		f 3 629 630 631
		mu 0 3 424 215 7
		f 3 632 633 -631
		mu 0 3 215 9 7
		f 3 634 635 636
		mu 0 3 425 427 426
		f 3 637 638 -636
		mu 0 3 427 206 426
		f 3 639 640 641
		mu 0 3 428 430 429
		f 3 642 643 -641
		mu 0 3 430 316 429
		f 3 644 645 -354
		mu 0 3 227 431 226
		f 3 646 647 -646
		mu 0 3 431 432 226
		f 3 648 649 -359
		mu 0 3 231 289 230
		f 3 650 651 -650
		mu 0 3 289 433 230
		f 3 -366 652 653
		mu 0 3 234 236 434
		f 3 654 655 -653
		mu 0 3 236 435 434
		f 3 -234 656 657
		mu 0 3 148 149 436
		f 3 658 659 -657
		mu 0 3 149 151 436
		f 3 660 661 662
		mu 0 3 437 21 438
		f 3 663 664 -662
		mu 0 3 21 439 438
		f 3 665 666 -51
		mu 0 3 37 31 16
		f 3 -45 667 -667
		mu 0 3 31 33 16
		f 3 -291 668 669
		mu 0 3 89 183 440
		f 3 670 671 -669
		mu 0 3 183 441 440
		f 3 672 673 674
		mu 0 3 442 444 443
		f 3 675 676 -674
		mu 0 3 444 445 443
		f 3 677 678 679
		mu 0 3 446 447 247
		f 3 680 -381 -679
		mu 0 3 447 249 247
		f 3 -386 681 682
		mu 0 3 253 251 448
		f 3 683 684 -682
		mu 0 3 251 449 448
		f 3 -391 685 686
		mu 0 3 257 255 450
		f 3 687 688 -686
		mu 0 3 255 451 450
		f 3 689 690 -399
		mu 0 3 261 452 262
		f 3 691 692 -691
		mu 0 3 452 453 262
		f 3 693 694 695
		mu 0 3 454 456 455
		f 3 696 697 -695
		mu 0 3 456 457 455
		f 3 -261 698 699
		mu 0 3 163 164 458
		f 3 700 701 -699
		mu 0 3 164 459 458
		f 3 702 703 704
		mu 0 3 460 461 167
		f 3 705 706 -704
		mu 0 3 461 462 167
		f 3 707 -422 708
		mu 0 3 463 278 279
		f 3 709 710 711
		mu 0 3 464 280 448
		f 3 -425 712 -711
		mu 0 3 280 281 448
		f 3 713 714 715
		mu 0 3 465 467 466
		f 3 716 717 -715
		mu 0 3 467 468 466
		f 3 718 719 720
		mu 0 3 469 470 288
		f 3 721 -433 -720
		mu 0 3 470 290 288
		f 3 722 723 -456
		mu 0 3 471 473 472
		f 3 -174 724 725
		mu 0 3 112 111 473
		f 3 726 -724 -725
		mu 0 3 111 472 473
		f 3 727 728 729
		mu 0 3 474 475 296
		f 3 730 -443 -729
		mu 0 3 475 298 296
		f 3 -452 731 732
		mu 0 3 301 303 476
		f 3 733 734 -732
		mu 0 3 303 477 476
		f 3 735 736 737
		mu 0 3 478 480 479
		f 3 738 739 -737
		mu 0 3 480 481 479
		f 3 740 741 -460
		mu 0 3 309 482 308
		f 3 742 743 -742
		mu 0 3 482 483 308
		f 3 744 745 746
		mu 0 3 484 486 485
		f 3 747 748 -746
		mu 0 3 486 487 485
		f 3 -472 749 750
		mu 0 3 317 319 488
		f 3 751 752 -750
		mu 0 3 319 489 488
		f 3 753 754 -477
		mu 0 3 323 490 321
		f 3 755 756 -755
		mu 0 3 490 491 321
		f 3 757 758 -481
		mu 0 3 326 492 327
		f 3 759 760 -759
		mu 0 3 492 493 327
		f 3 761 762 -486
		mu 0 3 330 494 331
		f 3 763 764 -763
		mu 0 3 494 495 331
		f 3 765 766 -522
		mu 0 3 496 498 497
		f 3 767 768 -767
		mu 0 3 498 499 497
		f 3 -766 769 770
		mu 0 3 498 496 500
		f 3 771 772 -770
		mu 0 3 496 501 500
		f 3 773 774 775
		mu 0 3 502 504 503
		f 3 776 777 -775
		mu 0 3 504 505 503
		f 3 778 779 -776
		mu 0 3 503 506 502
		f 3 780 -744 -780
		mu 0 3 506 507 502
		f 3 781 782 -781
		mu 0 3 506 347 507
		f 3 -509 -458 -783
		mu 0 3 347 346 507
		f 3 -523 783 784
		mu 0 3 353 355 508
		f 3 785 786 -784
		mu 0 3 355 509 508
		f 3 787 788 789
		mu 0 3 510 356 511
		f 3 -526 790 -789
		mu 0 3 356 357 511
		f 3 791 792 793
		mu 0 3 512 360 513
		f 3 -531 -782 -793
		mu 0 3 360 361 513
		f 3 -536 794 795
		mu 0 3 365 367 514
		f 3 -518 796 -795
		mu 0 3 367 515 514
		f 3 -554 797 798
		mu 0 3 152 517 516
		f 3 799 800 -798
		mu 0 3 517 518 516
		f 3 -702 801 802
		mu 0 3 458 459 519
		f 3 803 804 -802
		mu 0 3 459 520 519
		f 3 -537 805 806
		mu 0 3 100 368 521
		f 3 807 808 -806
		mu 0 3 368 522 521
		f 3 809 810 -185
		mu 0 3 523 525 524
		f 3 811 812 -811
		mu 0 3 525 526 524
		f 3 -545 813 -224
		mu 0 3 371 373 523
		f 3 814 -810 -814
		mu 0 3 373 525 523
		f 3 -233 815 816
		mu 0 3 527 529 528
		f 3 817 818 -816
		mu 0 3 529 530 528
		f 3 -275 819 -596
		mu 0 3 176 175 404
		f 3 -583 820 -820
		mu 0 3 175 396 404
		f 3 821 822 823
		mu 0 3 531 200 385
		f 3 824 825 -823
		mu 0 3 200 532 385
		f 3 -130 826 827
		mu 0 3 86 44 533
		f 3 -62 828 -827
		mu 0 3 44 43 533
		f 3 829 830 831
		mu 0 3 534 536 535
		f 3 832 833 -831
		mu 0 3 536 537 535
		f 3 -249 834 835
		mu 0 3 159 158 538
		f 3 836 837 -835
		mu 0 3 158 65 538
		f 3 838 839 840
		mu 0 3 539 540 533
		f 3 841 842 -840
		mu 0 3 540 541 533
		f 3 843 844 845
		mu 0 3 542 138 543
		f 3 -590 -614 -845
		mu 0 3 138 401 543
		f 3 846 847 848
		mu 0 3 544 532 198
		f 3 -825 -311 -848
		mu 0 3 532 200 198
		f 3 849 850 851
		mu 0 3 413 205 545
		f 3 -324 852 -851
		mu 0 3 205 207 545
		f 3 853 854 855
		mu 0 3 546 548 547
		f 3 856 857 -855
		mu 0 3 548 549 547
		f 3 858 859 -152
		mu 0 3 94 550 97
		f 3 860 861 -860
		mu 0 3 550 551 97
		f 3 862 863 864
		mu 0 3 552 422 420
		f 3 865 -623 -864
		mu 0 3 422 421 420
		f 3 -106 866 867
		mu 0 3 72 10 421
		f 3 868 -624 -867
		mu 0 3 10 213 421
		f 3 -91 869 870
		mu 0 3 59 61 553
		f 3 871 872 -870
		mu 0 3 61 554 553
		f 3 873 874 875
		mu 0 3 400 556 555
		f 3 876 877 -875
		mu 0 3 556 184 555
		f 3 -632 -146 878
		mu 0 3 424 7 93
		f 3 879 880 881
		mu 0 3 557 559 558
		f 3 882 883 -881
		mu 0 3 559 560 558
		f 3 -644 884 885
		mu 0 3 429 316 561
		f 3 -470 886 -885
		mu 0 3 316 317 561
		f 3 -475 887 888
		mu 0 3 320 321 562
		f 3 889 890 -888
		mu 0 3 321 563 562
		f 3 891 892 893
		mu 0 3 564 565 227
		f 3 894 -645 -893
		mu 0 3 565 431 227
		f 3 -652 895 896
		mu 0 3 230 433 566
		f 3 897 898 -896
		mu 0 3 433 567 566
		f 3 899 900 901
		mu 0 3 568 234 569
		f 3 -654 902 -901
		mu 0 3 234 434 569
		f 3 903 904 -370
		mu 0 3 239 570 240
		f 3 905 906 -905
		mu 0 3 570 468 240
		f 3 -138 907 908
		mu 0 3 87 89 30
		f 3 -670 909 -908
		mu 0 3 89 440 30
		f 3 910 911 912
		mu 0 3 571 573 572
		f 3 913 914 -912
		mu 0 3 573 544 572
		f 3 915 916 917
		mu 0 3 574 252 324
		f 3 918 -478 -917
		mu 0 3 252 326 324
		f 3 919 920 921
		mu 0 3 260 575 331
		f 3 922 -487 -921
		mu 0 3 575 329 331
		f 3 -713 923 -683
		mu 0 3 448 281 253
		f 3 924 925 -924
		mu 0 3 281 576 253
		f 3 926 927 928
		mu 0 3 577 579 578
		f 3 929 930 -928
		mu 0 3 579 580 578
		f 3 931 932 933
		mu 0 3 581 582 463
		f 3 934 -708 -933
		mu 0 3 582 278 463
		f 3 -694 935 936
		mu 0 3 456 454 583
		f 3 937 938 -936
		mu 0 3 454 584 583
		f 3 939 940 941
		mu 0 3 585 587 586
		f 3 942 943 -941
		mu 0 3 587 588 586
		f 3 944 945 946
		mu 0 3 589 591 590
		f 3 947 948 -946
		mu 0 3 591 195 590
		f 3 949 950 -943
		mu 0 3 587 592 588
		f 3 951 952 -951
		mu 0 3 592 593 588
		f 3 953 954 955
		mu 0 3 594 275 453
		f 3 -418 956 -955
		mu 0 3 275 276 453
		f 3 957 958 959
		mu 0 3 595 597 596
		f 3 960 961 -959
		mu 0 3 597 449 596
		f 3 962 963 964
		mu 0 3 598 599 466
		f 3 965 -716 -964
		mu 0 3 599 465 466
		f 3 -437 966 -651
		mu 0 3 289 291 433
		f 3 967 968 -967
		mu 0 3 291 600 433
		f 3 969 970 971
		mu 0 3 601 603 602
		f 3 972 973 -971
		mu 0 3 603 604 602
		f 3 974 975 -179
		mu 0 3 114 605 113
		f 3 976 977 -976
		mu 0 3 605 606 113
		f 3 978 979 980
		mu 0 3 607 608 300
		f 3 -771 -448 -980
		mu 0 3 608 302 300
		f 3 -738 981 982
		mu 0 3 478 479 609
		f 3 983 984 -982
		mu 0 3 479 610 609
		f 3 985 986 987
		mu 0 3 611 613 612
		f 3 988 -514 -987
		mu 0 3 613 614 612
		f 3 989 990 991
		mu 0 3 615 617 616
		f 3 992 993 -991
		mu 0 3 617 618 616
		f 3 -457 994 995
		mu 0 3 305 307 619
		f 3 -727 996 -995
		mu 0 3 307 620 619
		f 3 997 998 999
		mu 0 3 621 623 622
		f 3 1000 1001 -999
		mu 0 3 623 624 622
		f 3 -756 1002 1003
		mu 0 3 491 490 625
		f 3 1004 1005 -1003
		mu 0 3 490 626 625
		f 3 1006 1007 1008
		mu 0 3 627 629 628
		f 3 1009 1010 -1008
		mu 0 3 629 630 628
		f 3 1011 1012 1013
		mu 0 3 631 328 632
		f 3 -485 1014 -1013
		mu 0 3 328 329 632
		f 3 1015 1016 1017
		mu 0 3 633 634 501
		f 3 -451 -773 -1017
		mu 0 3 634 500 501
		f 3 -1016 1018 -734
		mu 0 3 634 633 635
		f 3 1019 1020 -1019
		mu 0 3 633 636 635
		f 3 1021 1022 -731
		mu 0 3 637 639 638
		f 3 1023 1024 -1023
		mu 0 3 639 640 638
		f 3 1025 1026 -777
		mu 0 3 504 341 505
		f 3 -500 1027 -1027
		mu 0 3 341 340 505
		f 3 1028 1029 1030
		mu 0 3 641 643 642
		f 3 -494 1031 -1030
		mu 0 3 643 644 642
		f 3 1032 1033 1034
		mu 0 3 645 647 646
		f 3 1035 1036 -1034
		mu 0 3 647 648 646
		f 3 1037 1038 1039
		mu 0 3 649 651 650
		f 3 1040 -778 -1039
		mu 0 3 651 652 650
		f 3 1041 1042 1043
		mu 0 3 653 655 654
		f 3 1044 -165 -1043
		mu 0 3 655 656 654
		f 3 1045 1046 1047
		mu 0 3 657 659 658
		f 3 1048 1049 -1047
		mu 0 3 659 660 658
		f 3 1050 1051 1052
		mu 0 3 661 663 662
		f 3 -220 1053 -1052
		mu 0 3 663 664 662
		f 3 1054 1055 -200
		mu 0 3 665 667 666
		f 3 1056 1057 -1056
		mu 0 3 667 668 666
		f 3 1058 1059 1060
		mu 0 3 669 671 670
		f 3 1061 1062 -1060
		mu 0 3 671 672 670
		f 3 1063 1064 -818
		mu 0 3 529 673 530
		f 3 1065 1066 -1065
		mu 0 3 673 674 530
		f 3 -821 1067 1068
		mu 0 3 404 396 675
		f 3 1069 1070 -1068
		mu 0 3 396 676 675
		f 3 1071 1072 -826
		mu 0 3 532 677 385
		f 3 1073 -561 -1073
		mu 0 3 677 384 385
		f 3 1074 1075 -410
		mu 0 3 270 678 268
		f 3 1076 -567 -1076
		mu 0 3 678 390 268
		f 3 1077 1078 1079
		mu 0 3 679 391 144
		f 3 -571 -227 -1079
		mu 0 3 391 146 144
		f 3 -305 1080 1081
		mu 0 3 191 193 680
		f 3 1082 1083 -1081
		mu 0 3 193 42 680
		f 3 1084 1085 1086
		mu 0 3 409 682 681;
	setAttr ".fc[500:999]"
		f 3 1087 1088 -1086
		mu 0 3 682 71 681
		f 3 1089 1090 1091
		mu 0 3 683 685 684
		f 3 1092 1093 -1091
		mu 0 3 685 686 684
		f 3 1094 1095 -842
		mu 0 3 540 397 541
		f 3 -586 1096 -1096
		mu 0 3 397 398 541
		f 3 1097 1098 1099
		mu 0 3 679 120 687
		f 3 1100 1101 -1099
		mu 0 3 120 141 687
		f 3 1102 1103 1104
		mu 0 3 201 405 688
		f 3 -600 1105 -1104
		mu 0 3 405 406 688
		f 3 1106 1107 1108
		mu 0 3 437 689 3
		f 3 1109 -73 -1108
		mu 0 3 689 51 3
		f 3 1110 1111 1112
		mu 0 3 414 548 690
		f 3 -854 1113 -1112
		mu 0 3 548 546 690
		f 3 1114 1115 -857
		mu 0 3 548 691 549
		f 3 1116 1117 -1116
		mu 0 3 691 692 549
		f 3 -149 1118 -859
		mu 0 3 94 95 550
		f 3 -616 1119 -1119
		mu 0 3 95 417 550
		f 3 -625 1120 -866
		mu 0 3 422 77 421
		f 3 -115 -868 -1121
		mu 0 3 77 72 421
		f 3 -588 1121 1122
		mu 0 3 398 400 182
		f 3 -876 1123 -1122
		mu 0 3 400 555 182
		f 3 1124 1125 1126
		mu 0 3 693 694 425
		f 3 1127 -635 -1126
		mu 0 3 694 427 425
		f 3 1128 1129 1130
		mu 0 3 232 695 428
		f 3 1131 -640 -1130
		mu 0 3 695 430 428
		f 3 1132 1133 1134
		mu 0 3 696 320 697
		f 3 -889 1135 -1134
		mu 0 3 320 562 697
		f 3 -356 1136 -894
		mu 0 3 227 229 564
		f 3 1137 1138 -1137
		mu 0 3 229 698 564
		f 3 -357 1139 -344
		mu 0 3 219 230 218
		f 3 -897 1140 -1140
		mu 0 3 230 566 218
		f 3 1141 1142 1143
		mu 0 3 699 233 568
		f 3 -364 -900 -1143
		mu 0 3 233 234 568
		f 3 1144 1145 1146
		mu 0 3 700 98 386
		f 3 1147 1148 -1146
		mu 0 3 98 693 386
		f 3 -1149 1149 -562
		mu 0 3 386 693 387
		f 3 -1127 1150 -1150
		mu 0 3 693 425 387
		f 3 1151 1152 -676
		mu 0 3 444 574 445
		f 3 -918 1153 -1153
		mu 0 3 574 324 445
		f 3 1154 1155 1156
		mu 0 3 259 495 446
		f 3 1157 -678 -1156
		mu 0 3 495 447 446
		f 3 -926 1158 -389
		mu 0 3 253 576 254
		f 3 1159 1160 -1159
		mu 0 3 576 701 254
		f 3 -927 1161 1162
		mu 0 3 579 577 245
		f 3 1163 1164 -1162
		mu 0 3 577 442 245
		f 3 1165 1166 1167
		mu 0 3 702 703 581
		f 3 1168 -932 -1167
		mu 0 3 703 582 581
		f 3 1169 1170 1171
		mu 0 3 704 583 163
		f 3 1172 1173 -1171
		mu 0 3 583 705 163
		f 3 1174 1175 -942
		mu 0 3 586 248 585
		f 3 1176 1177 -1176
		mu 0 3 248 706 585
		f 3 1178 1179 -807
		mu 0 3 521 197 100
		f 3 1180 -159 -1180
		mu 0 3 197 99 100
		f 3 -266 1181 -705
		mu 0 3 167 169 460
		f 3 1182 1183 -1182
		mu 0 3 169 707 460
		f 3 1184 1185 -692
		mu 0 3 452 708 453
		f 3 1186 -956 -1186
		mu 0 3 708 594 453
		f 3 1187 1188 -961
		mu 0 3 597 464 449
		f 3 -712 -685 -1189
		mu 0 3 464 448 449
		f 3 -455 1189 -717
		mu 0 3 467 709 468
		f 3 1190 -907 -1190
		mu 0 3 709 240 468
		f 3 -969 1191 -898
		mu 0 3 433 600 567
		f 3 -981 1192 -1192
		mu 0 3 600 710 567
		f 3 -974 1193 1194
		mu 0 3 602 604 471
		f 3 1195 -723 -1194
		mu 0 3 604 473 471
		f 3 1196 1197 -968
		mu 0 3 711 712 607
		f 3 -768 -979 -1198
		mu 0 3 712 608 607
		f 3 -985 1198 -966
		mu 0 3 609 610 713
		f 3 -972 1199 -1199
		mu 0 3 610 714 713
		f 3 1200 1201 -989
		mu 0 3 613 311 614
		f 3 -461 -506 -1202
		mu 0 3 311 310 614
		f 3 -749 1202 1203
		mu 0 3 485 487 617
		f 3 1204 -993 -1203
		mu 0 3 487 618 617
		f 3 -997 1205 1206
		mu 0 3 619 620 474
		f 3 1207 -728 -1206
		mu 0 3 620 475 474
		f 3 -753 1208 1209
		mu 0 3 488 489 621
		f 3 1210 -998 -1209
		mu 0 3 489 623 621
		f 3 -1006 1211 1212
		mu 0 3 625 626 715
		f 3 1213 1214 -1212
		mu 0 3 626 716 715
		f 3 1215 1216 -1011
		mu 0 3 630 493 628
		f 3 -760 1217 -1217
		mu 0 3 493 492 628
		f 3 1218 1219 -1014
		mu 0 3 632 717 631
		f 3 1220 1221 -1220
		mu 0 3 717 718 631
		f 3 -769 1222 -786
		mu 0 3 497 499 335
		f 3 1223 -492 -1223
		mu 0 3 499 333 335
		f 3 1224 1225 1226
		mu 0 3 719 721 720
		f 3 1227 1228 -1226
		mu 0 3 721 722 720
		f 3 -172 1229 -1208
		mu 0 3 111 106 637
		f 3 1230 -1022 -1230
		mu 0 3 106 639 637
		f 3 -787 1231 1232
		mu 0 3 508 509 641
		f 3 -491 -1029 -1232
		mu 0 3 509 643 641
		f 3 -790 1233 1234
		mu 0 3 510 511 645
		f 3 -1227 -1033 -1234
		mu 0 3 511 647 645
		f 3 1235 1236 -1041
		mu 0 3 651 512 652
		f 3 -794 -779 -1237
		mu 0 3 512 513 652
		f 3 1237 1238 -1045
		mu 0 3 655 723 656
		f 3 1239 -1231 -1239
		mu 0 3 723 724 656
		f 3 -809 1240 1241
		mu 0 3 521 522 590
		f 3 1242 1243 -1241
		mu 0 3 522 725 590
		f 3 -813 1244 1245
		mu 0 3 524 526 664
		f 3 1246 -1054 -1245
		mu 0 3 526 662 664
		f 3 -1058 1247 1248
		mu 0 3 666 668 370
		f 3 1249 -541 -1248
		mu 0 3 668 372 370
		f 3 1250 1251 1252
		mu 0 3 726 728 727
		f 3 1253 1254 -1252
		mu 0 3 728 729 727
		f 3 1255 1256 -1251
		mu 0 3 726 674 728
		f 3 -1066 1257 -1257
		mu 0 3 674 673 728
		f 3 1258 1259 1260
		mu 0 3 694 382 730
		f 3 -557 1261 -1260
		mu 0 3 382 383 730
		f 3 1262 1263 1264
		mu 0 3 731 40 186
		f 3 1265 -296 -1264
		mu 0 3 40 188 186
		f 3 -72 1266 1267
		mu 0 3 49 50 732
		f 3 -79 1268 -1267
		mu 0 3 50 53 732
		f 3 1269 1270 1271
		mu 0 3 733 537 734
		f 3 -833 1272 -1271
		mu 0 3 537 536 734
		f 3 1273 1274 1275
		mu 0 3 683 187 735
		f 3 1276 1277 -1275
		mu 0 3 187 736 735
		f 3 -105 1278 1279
		mu 0 3 69 71 538
		f 3 -1088 1280 -1279
		mu 0 3 71 682 538
		f 3 -1281 1281 -836
		mu 0 3 538 682 159
		f 3 1282 -251 -1282
		mu 0 3 682 160 159
		f 3 1283 1284 1285
		mu 0 3 542 737 117
		f 3 1286 1287 -1285
		mu 0 3 737 738 117
		f 3 -1075 1288 1289
		mu 0 3 678 270 739
		f 3 1290 1291 -1289
		mu 0 3 270 740 739
		f 3 -8 1292 1293
		mu 0 3 4 5 688
		f 3 1294 1295 -1293
		mu 0 3 5 403 688
		f 3 -86 1296 1297
		mu 0 3 56 4 406
		f 3 -1294 -1106 -1297
		mu 0 3 4 688 406
		f 3 -611 1298 1299
		mu 0 3 415 413 741
		f 3 -852 1300 -1299
		mu 0 3 413 545 741
		f 3 -339 1301 1302
		mu 0 3 217 97 742
		f 3 -862 1303 -1302
		mu 0 3 97 551 742
		f 3 -132 1304 -63
		mu 0 3 44 85 37
		f 3 1305 -666 -1305
		mu 0 3 85 31 37
		f 3 1306 1307 -877
		mu 0 3 556 395 184
		f 3 1308 -292 -1308
		mu 0 3 395 185 184
		f 3 -887 1309 1310
		mu 0 3 561 317 228
		f 3 -751 1311 -1310
		mu 0 3 317 488 228
		f 3 1312 1313 1314
		mu 0 3 699 563 491
		f 3 -890 -757 -1314
		mu 0 3 563 321 491
		f 3 -1139 1315 1316
		mu 0 3 564 698 743
		f 3 1317 1318 -1316
		mu 0 3 698 744 743
		f 3 1319 1320 1321
		mu 0 3 745 428 746
		f 3 -642 1322 -1321
		mu 0 3 428 429 746
		f 3 1323 1324 1325
		mu 0 3 747 749 748
		f 3 1326 1327 -1325
		mu 0 3 749 750 748
		f 3 1328 1329 1330
		mu 0 3 751 585 697
		f 3 -1178 1331 -1330
		mu 0 3 585 706 697
		f 3 1332 1333 1334
		mu 0 3 752 753 558
		f 3 1335 -882 -1334
		mu 0 3 753 557 558
		f 3 -390 1336 -919
		mu 0 3 252 254 326
		f 3 1337 -758 -1337
		mu 0 3 254 492 326
		f 3 -765 1338 -922
		mu 0 3 331 495 260
		f 3 -1155 -398 -1339
		mu 0 3 495 259 260
		f 3 1339 1340 1341
		mu 0 3 754 755 576
		f 3 1342 -1160 -1341
		mu 0 3 755 701 576
		f 3 1343 1344 1345
		mu 0 3 756 579 243
		f 3 -1163 -376 -1345
		mu 0 3 579 245 243
		f 3 1346 1347 1348
		mu 0 3 757 582 575
		f 3 -1169 1349 -1348
		mu 0 3 582 703 575
		f 3 -1175 1350 -383
		mu 0 3 248 586 247
		f 3 1351 1352 -1351
		mu 0 3 586 758 247
		f 3 1353 1354 -385
		mu 0 3 250 759 248
		f 3 1355 -1177 -1355
		mu 0 3 759 706 248
		f 3 -949 1356 -1242
		mu 0 3 590 195 521
		f 3 -310 -1179 -1357
		mu 0 3 195 197 521
		f 3 1357 1358 1359
		mu 0 3 760 458 761
		f 3 -803 1360 -1359
		mu 0 3 458 519 761
		f 3 1361 1362 1363
		mu 0 3 762 763 452
		f 3 -990 -1185 -1363
		mu 0 3 763 708 452
		f 3 -986 1364 1365
		mu 0 3 764 595 765
		f 3 -960 1366 -1365
		mu 0 3 595 596 765
		f 3 1367 1368 1369
		mu 0 3 766 767 598
		f 3 -983 -963 -1369
		mu 0 3 767 599 598
		f 3 1370 1371 1372
		mu 0 3 768 770 769
		f 3 -733 1373 -1372
		mu 0 3 770 771 769
		f 3 -970 1374 1375
		mu 0 3 603 601 772
		f 3 -984 1376 -1375
		mu 0 3 601 773 772
		f 3 1377 1378 1379
		mu 0 3 774 776 775
		f 3 1380 1381 -1379
		mu 0 3 776 777 775
		f 3 1382 1383 -722
		mu 0 3 778 780 779
		f 3 -490 1384 -1384
		mu 0 3 780 781 779
		f 3 -1200 1385 -714
		mu 0 3 713 714 304
		f 3 -1195 -453 -1386
		mu 0 3 714 306 304
		f 3 -958 1386 1387
		mu 0 3 782 611 783
		f 3 -988 1388 -1387
		mu 0 3 611 612 783
		f 3 -954 1389 1390
		mu 0 3 784 786 785
		f 3 1391 1392 -1390
		mu 0 3 786 787 785
		f 3 -414 1393 1394
		mu 0 3 788 790 789
		f 3 1395 -515 -1394
		mu 0 3 790 791 789
		f 3 -1002 1396 1397
		mu 0 3 622 624 792
		f 3 1398 1399 -1397
		mu 0 3 624 793 792
		f 3 1400 1401 1402
		mu 0 3 794 796 795
		f 3 1403 1404 -1402
		mu 0 3 796 797 795
		f 3 1405 1406 1407
		mu 0 3 798 800 799
		f 3 1408 1409 -1407
		mu 0 3 800 801 799
		f 3 1410 1411 1412
		mu 0 3 802 418 803
		f 3 -620 1413 -1412
		mu 0 3 418 419 803
		f 3 -1025 1414 -446
		mu 0 3 638 640 804
		f 3 1415 1416 -1415
		mu 0 3 640 805 804
		f 3 -528 1417 1418
		mu 0 3 806 808 807
		f 3 1419 -748 -1418
		mu 0 3 808 809 807
		f 3 -791 1420 -1225
		mu 0 3 810 806 811
		f 3 -1419 1421 -1421
		mu 0 3 806 807 811
		f 3 -1032 1422 -471
		mu 0 3 642 644 812
		f 3 1423 1424 -1423
		mu 0 3 644 813 812
		f 3 -1037 1425 -476
		mu 0 3 646 648 814
		f 3 1426 1427 -1426
		mu 0 3 648 815 814
		f 3 -1410 1428 1429
		mu 0 3 816 649 817
		f 3 -1040 -1028 -1429
		mu 0 3 649 650 817
		f 3 -797 1430 1431
		mu 0 3 514 515 818
		f 3 1432 1433 -1431
		mu 0 3 515 819 818
		f 3 1434 1435 1436
		mu 0 3 269 820 659
		f 3 1437 -1049 -1436
		mu 0 3 820 660 659
		f 3 -1051 1438 1439
		mu 0 3 663 661 821
		f 3 1440 1441 -1439
		mu 0 3 661 822 821
		f 3 1442 1443 -206
		mu 0 3 823 824 665
		f 3 1444 -1055 -1444
		mu 0 3 824 667 665
		f 3 1445 1446 1447
		mu 0 3 825 827 826
		f 3 1448 1449 -1447
		mu 0 3 827 828 826
		f 3 1450 1451 1452
		mu 0 3 829 831 830
		f 3 -804 1453 -1452
		mu 0 3 831 832 830
		f 3 1454 1455 -1261
		mu 0 3 730 833 694
		f 3 1456 -1128 -1456
		mu 0 3 833 427 694
		f 3 -48 1457 1458
		mu 0 3 34 35 700
		f 3 -1287 1459 1460
		mu 0 3 738 737 733
		f 3 1461 -1270 -1460
		mu 0 3 737 537 733
		f 3 -1278 1462 1463
		mu 0 3 735 736 536
		f 3 1464 -1273 -1463
		mu 0 3 736 734 536
		f 3 1465 1466 -1124
		mu 0 3 555 241 182
		f 3 1467 -290 -1467
		mu 0 3 241 183 182
		f 3 1468 1469 -99
		mu 0 3 66 834 67
		f 3 1470 1471 -1470
		mu 0 3 834 835 67
		f 3 -1284 1472 1473
		mu 0 3 737 542 836
		f 3 -846 -1300 -1473
		mu 0 3 542 543 836
		f 3 -1292 1474 1475
		mu 0 3 739 740 837
		f 3 1476 1477 -1475
		mu 0 3 740 838 837
		f 3 -602 1478 -1298
		mu 0 3 406 408 56
		f 3 1479 -325 -1479
		mu 0 3 408 208 56
		f 3 1480 1481 -1457
		mu 0 3 833 207 427
		f 3 -323 -638 -1482
		mu 0 3 207 206 427
		f 3 -1115 1482 -592
		mu 0 3 691 548 416
		f 3 -1111 -615 -1483
		mu 0 3 548 414 416
		f 3 1483 1484 1485
		mu 0 3 839 840 407
		f 3 1486 -601 -1485
		mu 0 3 840 408 407
		f 3 1487 1488 1489
		mu 0 3 92 217 841
		f 3 -1303 1490 -1489
		mu 0 3 217 742 841
		f 3 -863 1491 -628
		mu 0 3 422 552 423
		f 3 1492 1493 -1492
		mu 0 3 552 842 423
		f 3 -579 1494 1495
		mu 0 3 394 76 393
		f 3 1496 -573 -1495
		mu 0 3 76 74 393
		f 3 -151 1497 -619
		mu 0 3 95 96 419
		f 3 1498 1499 -1498
		mu 0 3 96 843 419
		f 3 -1312 1500 -355
		mu 0 3 228 488 229
		f 3 -1210 1501 -1501
		mu 0 3 488 621 229
		f 3 1502 1503 -362
		mu 0 3 233 625 235
		f 3 -1213 1504 -1504
		mu 0 3 625 715 235
		f 3 -892 1505 1506
		mu 0 3 565 564 844
		f 3 -1317 1507 -1506
		mu 0 3 564 743 844
		f 3 1508 1509 -1322
		mu 0 3 746 469 745
		f 3 -721 1510 -1510
		mu 0 3 469 288 745
		f 3 1511 1512 -1327
		mu 0 3 749 769 750
		f 3 1513 1514 -1513
		mu 0 3 769 845 750
		f 3 1515 1516 -906
		mu 0 3 570 846 468
		f 3 1517 -718 -1517
		mu 0 3 846 466 468
		f 3 1518 1519 1520
		mu 0 3 284 587 751
		f 3 -940 -1329 -1520
		mu 0 3 587 585 751
		f 3 -320 1521 -639
		mu 0 3 206 204 426
		f 3 1522 1523 -1522
		mu 0 3 204 839 426
		f 3 1524 1525 -1161
		mu 0 3 701 628 254
		f 3 -1218 -1338 -1526
		mu 0 3 628 492 254
		f 3 -1166 1526 1527
		mu 0 3 703 702 632
		f 3 1528 -1219 -1527
		mu 0 3 702 717 632
		f 3 -427 1529 -925
		mu 0 3 281 283 576
		f 3 1530 -1342 -1530
		mu 0 3 283 754 576
		f 3 -1344 1531 -930
		mu 0 3 579 756 580
		f 3 1532 1533 -1532
		mu 0 3 756 847 580
		f 3 -420 1534 1535
		mu 0 3 276 278 757
		f 3 -935 -1347 -1535
		mu 0 3 278 582 757
		f 3 -944 1536 -1352
		mu 0 3 586 588 758
		f 3 1537 1538 -1537
		mu 0 3 588 848 758
		f 3 1539 1540 -1477
		mu 0 3 740 659 838
		f 3 -1046 1541 -1541
		mu 0 3 659 657 838
		f 3 -95 1542 1543
		mu 0 3 849 851 850
		f 3 1544 1545 -1543
		mu 0 3 851 852 850
		f 3 1546 1547 1548
		mu 0 3 848 853 762
		f 3 -1204 -1362 -1548
		mu 0 3 853 763 762
		f 3 -1201 1549 1550
		mu 0 3 854 764 578
		f 3 -1366 1551 -1550
		mu 0 3 764 765 578
		f 3 -996 1552 -1191
		mu 0 3 709 855 240
		f 3 1553 -371 -1553
		mu 0 3 855 238 240
		f 3 -1193 1554 1555
		mu 0 3 567 710 768
		f 3 -450 -1371 -1555
		mu 0 3 710 770 768
		f 3 1556 1557 1558
		mu 0 3 856 858 857
		f 3 -445 1559 -1558
		mu 0 3 858 859 857
		f 3 1560 1561 -1381
		mu 0 3 776 860 777
		f 3 -442 1562 -1562
		mu 0 3 860 861 777
		f 3 -1385 1563 -436
		mu 0 3 779 781 711
		f 3 -1224 -1197 -1564
		mu 0 3 781 712 711
		f 3 -432 1564 1565
		mu 0 3 862 864 863
		f 3 1566 1567 -1565
		mu 0 3 864 865 863
		f 3 -1188 1568 1569
		mu 0 3 866 782 867
		f 3 -1388 1570 -1569
		mu 0 3 782 783 867
		f 3 -992 1571 -1187
		mu 0 3 615 616 786
		f 3 1572 -1392 -1572
		mu 0 3 616 787 786
		f 3 1573 1574 1575
		mu 0 3 868 788 869
		f 3 -1395 -978 -1575
		mu 0 3 788 789 869
		f 3 1576 1577 1578
		mu 0 3 870 792 871
		f 3 -1400 1579 -1578
		mu 0 3 792 793 871
		f 3 -1215 1580 1581
		mu 0 3 715 716 794
		f 3 1582 -1401 -1581
		mu 0 3 716 796 794
		f 3 1583 1584 -1408
		mu 0 3 799 718 798
		f 3 -1221 1585 -1585
		mu 0 3 718 717 798
		f 3 1586 1587 1588
		mu 0 3 872 224 873
		f 3 1589 -1042 -1588
		mu 0 3 224 874 873
		f 3 1590 1591 1592
		mu 0 3 875 877 876
		f 3 1593 1594 -1592
		mu 0 3 877 878 876
		f 3 -1591 1595 1596
		mu 0 3 877 875 636
		f 3 1597 -1021 -1596
		mu 0 3 875 635 636
		f 3 -1417 1598 1599
		mu 0 3 804 805 879
		f 3 1600 1601 -1599
		mu 0 3 805 880 879
		f 3 1602 1603 -1420
		mu 0 3 808 881 809
		f 3 1604 -1205 -1604
		mu 0 3 881 882 809
		f 3 1605 1606 -517
		mu 0 3 350 883 351
		f 3 1607 -1433 -1607
		mu 0 3 883 884 351
		f 3 -1425 1608 -752
		mu 0 3 812 813 885
		f 3 1609 1610 -1609
		mu 0 3 813 886 885
		f 3 -1428 1611 -754
		mu 0 3 814 815 887
		f 3 1612 1613 -1612
		mu 0 3 815 888 887
		f 3 -1584 1614 1615
		mu 0 3 889 816 890
		f 3 -1430 -497 -1615
		mu 0 3 816 817 890
		f 3 -1434 1616 1617
		mu 0 3 818 819 891
		f 3 1618 1619 -1617
		mu 0 3 819 892 891
		f 3 1620 1621 -660
		mu 0 3 151 766 436
		f 3 -1370 1622 -1622
		mu 0 3 766 598 436
		f 3 -406 1623 -1435
		mu 0 3 269 267 820
		f 3 1624 -1448 -1624
		mu 0 3 267 893 820
		f 3 -216 1625 -548
		mu 0 3 376 821 377
		f 3 -1442 1626 -1626
		mu 0 3 821 822 377
		f 3 1627 1628 -254
		mu 0 3 894 896 895
		f 3 1629 1630 -1629
		mu 0 3 896 897 895
		f 3 1631 1632 1633
		mu 0 3 898 899 825
		f 3 1634 -1446 -1633
		mu 0 3 899 827 825
		f 3 1635 1636 1637
		mu 0 3 900 902 901
		f 3 1638 1639 -1637
		mu 0 3 902 903 901
		f 3 1640 1641 -1474
		mu 0 3 836 535 737
		f 3 -834 -1462 -1642
		mu 0 3 535 537 737
		f 3 1642 1643 -274
		mu 0 3 904 735 534
		f 3 -1464 -830 -1644
		mu 0 3 735 536 534
		f 3 -1307 1644 -582
		mu 0 3 395 556 396
		f 3 1645 -1070 -1645
		mu 0 3 556 676 396
		f 3 1646 1647 1648
		mu 0 3 123 906 905
		f 3 1649 1650 -1648
		mu 0 3 906 907 905
		f 3 1651 1652 1653
		mu 0 3 908 910 909
		f 3 1654 1655 -1653
		mu 0 3 910 911 909
		f 3 1656 1657 -1461
		mu 0 3 733 912 738
		f 3 1658 1659 -1658
		mu 0 3 912 687 738
		f 3 1660 1661 1662
		mu 0 3 913 539 43
		f 3 -841 -829 -1662
		mu 0 3 539 533 43
		f 3 -1118 1663 1664
		mu 0 3 549 692 914
		f 3 -1651 1665 -1664
		mu 0 3 692 915 914
		f 3 1666 1667 1668
		mu 0 3 547 916 753
		f 3 1669 -1336 -1668
		mu 0 3 916 557 753
		f 3 1670 1671 1672
		mu 0 3 917 918 546
		f 3 1673 -1114 -1672
		mu 0 3 918 690 546
		f 3 -1490 1674 -143
		mu 0 3 92 841 93
		f 3 1675 1676 -1675
		mu 0 3 841 919 93
		f 3 -1494 1677 1678
		mu 0 3 423 842 920
		f 3 1679 1680 -1678
		mu 0 3 842 921 920
		f 3 1681 1682 -1496
		mu 0 3 393 185 394
		f 3 -1309 -580 -1683
		mu 0 3 185 395 394
		f 3 -915 1683 1684
		mu 0 3 572 544 675
		f 3 -849 1685 -1684
		mu 0 3 544 198 675
		f 3 -1502 1686 -1138
		mu 0 3 229 621 698
		f 3 -1000 1687 -1687
		mu 0 3 621 622 698
		f 3 -1315 1688 -1142
		mu 0 3 699 491 233
		f 3 -1004 -1503 -1689
		mu 0 3 491 625 233
		f 3 1689 1690 1691
		mu 0 3 922 743 923
		f 3 -1319 1692 -1691
		mu 0 3 743 744 923
		f 3 -361 1693 1694
		mu 0 3 231 232 745
		f 3 -1131 -1320 -1694
		mu 0 3 232 428 745
		f 3 -1328 1695 1696
		mu 0 3 748 750 235
		f 3 1697 -365 -1696
		mu 0 3 750 236 235
		f 3 -1136 1698 -1331
		mu 0 3 697 562 751
		f 3 1699 1700 -1699
		mu 0 3 562 924 751
		f 3 -1356 1701 -1332
		mu 0 3 706 759 697
		f 3 1702 -1135 -1702
		mu 0 3 759 696 697
		f 3 1703 1704 -70
		mu 0 3 49 913 38
		f 3 -1663 -60 -1705
		mu 0 3 913 43 38
		f 3 1705 1706 -150
		mu 0 3 91 925 96
		f 3 1707 1708 -1707
		mu 0 3 925 926 96
		f 3 1709 1710 -1343
		mu 0 3 755 627 701
		f 3 -1009 -1525 -1711
		mu 0 3 627 628 701
		f 3 -1350 1711 -923
		mu 0 3 575 703 329
		f 3 -1528 -1015 -1712
		mu 0 3 703 632 329
		f 3 1712 1713 1714
		mu 0 3 927 928 754
		f 3 1715 -1340 -1714
		mu 0 3 928 755 754
		f 3 1716 1717 -1164
		mu 0 3 577 929 442
		f 3 1718 -673 -1718
		mu 0 3 929 444 442
		f 3 1719 1720 -393
		mu 0 3 256 930 255
		f 3 1721 1722 -1721
		mu 0 3 930 931 255
		f 3 -1353 1723 -680
		mu 0 3 247 758 446
		f 3 1724 1725 -1724
		mu 0 3 758 932 446
		f 3 -939 1726 -1173
		mu 0 3 583 584 705
		f 3 1727 1728 -1727
		mu 0 3 584 933 705
		f 3 -1708 1729 1730
		mu 0 3 926 925 560
		f 3 1731 -884 -1730
		mu 0 3 925 558 560
		f 3 -953 1732 -1538
		mu 0 3 588 593 848
		f 3 -747 -1547 -1733
		mu 0 3 593 853 848
		f 3 -741 1733 1734
		mu 0 3 934 935 847
		f 3 1735 -1534 -1734
		mu 0 3 935 580 847
		f 3 1736 1737 1738
		mu 0 3 936 238 937
		f 3 -1554 -1207 -1738
		mu 0 3 238 855 937
		f 3 1739 1740 1741
		mu 0 3 435 845 938
		f 3 1742 1743 -1741
		mu 0 3 845 771 938
		f 3 1744 1745 -1742
		mu 0 3 938 939 435
		f 3 -1560 1746 1747
		mu 0 3 857 859 844
		f 3 1748 1749 -1747
		mu 0 3 859 940 844
		f 3 1750 -977 1751
		mu 0 3 941 606 605
		f 3 1752 1753 1754
		mu 0 3 942 943 778
		f 3 -495 -1383 -1754
		mu 0 3 943 780 778
		f 3 1755 1756 -1567
		mu 0 3 864 944 865
		f 3 1757 1758 -1757
		mu 0 3 944 945 865
		f 3 -710 1759 1760
		mu 0 3 946 866 947
		f 3 -1570 1761 -1760
		mu 0 3 866 867 947
		f 3 -421 1762 1763
		mu 0 3 948 950 949
		f 3 1764 1765 -1763
		mu 0 3 950 951 949
		f 3 1766 1767 -703
		mu 0 3 952 954 953
		f 3 -1563 1768 -1768
		mu 0 3 954 955 953
		f 3 1769 1770 1771
		mu 0 3 956 870 957
		f 3 -1579 1772 -1771
		mu 0 3 870 871 957
		f 3 1773 1774 1775
		mu 0 3 958 959 220
		f 3 1776 1777 -1775
		mu 0 3 959 960 220
		f 3 1778 1779 1780
		mu 0 3 961 963 962
		f 3 -796 1781 -1780
		mu 0 3 963 964 962
		f 3 1782 1783 1784
		mu 0 3 965 244 966
		f 3 1785 -1236 -1784
		mu 0 3 244 967 966
		f 3 1786 1787 1788
		mu 0 3 879 969 968
		f 3 1789 1790 -1788
		mu 0 3 969 970 968
		f 3 1791 -1787 -1602
		mu 0 3 880 969 879
		f 3 1792 1793 -1605
		mu 0 3 881 971 882
		f 3 1794 -994 -1794
		mu 0 3 971 972 882
		f 3 1795 1796 -1608
		mu 0 3 883 973 884
		f 3 1797 -1619 -1797
		mu 0 3 973 974 884
		f 3 -1611 1798 -1211
		mu 0 3 885 886 975
		f 3 1799 1800 -1799
		mu 0 3 886 976 975
		f 3 -1614 1801 -1005
		mu 0 3 887 888 977
		f 3 1802 1803 -1802
		mu 0 3 888 978 977
		f 3 -1222 1804 1805
		mu 0 3 979 889 980
		f 3 -1616 -505 -1805
		mu 0 3 889 890 980
		f 3 -1620 1806 -1010
		mu 0 3 891 892 981
		f 3 1807 1808 -1807
		mu 0 3 892 982 981
		f 3 -183 1809 -1101
		mu 0 3 120 118 141
		f 3 -1246 -222 -1810
		mu 0 3 118 140 141
		f 3 -1254 1810 1811
		mu 0 3 983 984 62
		f 3 1812 -92 -1811
		mu 0 3 984 63 62
		f 3 -808 1813 1814
		mu 0 3 985 987 986
		f 3 1815 1816 -1814
		mu 0 3 987 988 986
		f 3 1817 1818 1819
		mu 0 3 989 896 990
		f 3 -1628 -255 -1819
		mu 0 3 896 894 990
		f 3 1820 1821 1822
		mu 0 3 991 899 992
		f 3 -1632 1823 -1822
		mu 0 3 899 898 992
		f 3 -1636 1824 -269
		mu 0 3 902 900 993
		f 3 1825 1826 -1825
		mu 0 3 900 994 993
		f 3 -1481 1827 -853
		mu 0 3 207 833 545
		f 3 1828 1829 -1828
		mu 0 3 833 995 545
		f 3 1830 1831 1832
		mu 0 3 996 174 689
		f 3 -273 1833 -1832
		mu 0 3 174 173 689
		f 3 -1667 1834 1835
		mu 0 3 916 547 914
		f 3 -858 -1665 -1835
		mu 0 3 547 549 914
		f 3 1836 1837 1838
		mu 0 3 178 731 684
		f 3 -1265 1839 -1838
		mu 0 3 731 186 684
		f 3 -1288 1840 -221
		mu 0 3 117 738 141
		f 3 -1660 -1102 -1841
		mu 0 3 738 687 141
		f 3 1841 1842 1843
		mu 0 3 997 190 998
		f 3 1844 1845 -1843
		mu 0 3 190 392 998
		f 3 -873 1846 1847
		mu 0 3 553 554 79
		f 3 1848 -127 -1847
		mu 0 3 554 84 79
		f 3 1849 1850 -606
		mu 0 3 410 906 124
		f 3 -1647 -189 -1851
		mu 0 3 906 123 124
		f 3 1851 1852 1853
		mu 0 3 999 1000 32
		f 3 1854 1855 -1853
		mu 0 3 1000 41 32
		f 3 -1276 1856 -1090
		mu 0 3 683 735 685
		f 3 -1643 -1831 -1857
		mu 0 3 735 904 685
		f 3 -822 1857 -314
		mu 0 3 200 531 201
		f 3 1858 -1103 -1858
		mu 0 3 531 405 201
		f 3 1859 1860 -1095
		mu 0 3 540 1001 397
		f 3 1861 1862 -1861
		mu 0 3 1001 571 397
		f 3 1863 1864 -1849
		mu 0 3 554 1002 84
		f 3 1865 1866 -1865
		mu 0 3 1002 1003 84
		f 3 -13 1867 -1295
		mu 0 3 5 8 403
		f 3 -278 -593 -1868
		mu 0 3 8 176 403
		f 3 -319 1868 1869
		mu 0 3 202 203 573
		f 3 1870 1871 -1869
		mu 0 3 203 677 573
		f 3 -141 1872 -1706
		mu 0 3 91 55 925
		f 3 -328 1873 -1873
		mu 0 3 55 209 925
		f 3 1874 1875 1876
		mu 0 3 1004 923 956
		f 3 1877 -1770 -1876
		mu 0 3 923 870 956
		f 3 1878 1879 1880
		mu 0 3 1005 958 218;
	setAttr ".fc[1000:1499]"
		f 3 -1776 -342 -1880
		mu 0 3 958 220 218
		f 3 1881 1882 1883
		mu 0 3 922 1006 857
		f 3 1884 -1559 -1883
		mu 0 3 1006 856 857
		f 3 1885 1886 1887
		mu 0 3 1007 1008 746
		f 3 1888 -1509 -1887
		mu 0 3 1008 469 746
		f 3 -899 1889 1890
		mu 0 3 566 567 1009
		f 3 -1556 1891 -1890
		mu 0 3 567 768 1009
		f 3 1892 1893 1894
		mu 0 3 924 1010 286
		f 3 1895 1896 -1894
		mu 0 3 1010 1011 286
		f 3 -351 1897 1898
		mu 0 3 223 225 1012
		f 3 1899 1900 -1898
		mu 0 3 225 237 1012
		f 3 1901 1902 1903
		mu 0 3 258 243 965
		f 3 -378 -1783 -1903
		mu 0 3 243 244 965
		f 3 1904 1905 1906
		mu 0 3 927 1014 1013
		f 3 1907 1908 -1906
		mu 0 3 1014 271 1013
		f 3 1909 1910 1911
		mu 0 3 1015 929 596
		f 3 1912 -1367 -1911
		mu 0 3 929 765 596
		f 3 1913 1914 1915
		mu 0 3 931 581 1016
		f 3 -934 1916 -1915
		mu 0 3 581 463 1016
		f 3 1917 1918 1919
		mu 0 3 932 762 261
		f 3 -1364 -690 -1919
		mu 0 3 762 452 261
		f 3 1920 1921 1922
		mu 0 3 264 760 1017
		f 3 -1360 1923 -1922
		mu 0 3 760 761 1017
		f 3 -1728 1924 1925
		mu 0 3 933 584 1018
		f 3 1926 1927 -1925
		mu 0 3 584 1019 1018
		f 3 1928 1929 -1735
		mu 0 3 847 450 934
		f 3 1930 1931 -1930
		mu 0 3 450 1020 934
		f 3 1932 1933 -430
		mu 0 3 285 592 284
		f 3 -950 -1519 -1934
		mu 0 3 592 587 284
		f 3 -1746 1934 -656
		mu 0 3 435 939 434
		f 3 1935 1936 -1935
		mu 0 3 939 1021 434
		f 3 1937 1938 -647
		mu 0 3 431 1022 432
		f 3 1939 1940 -1939
		mu 0 3 1022 1023 432
		f 3 1941 1942 1943
		mu 0 3 1024 774 1025
		f 3 -1380 1944 -1943
		mu 0 3 774 775 1025
		f 3 1945 1946 1947
		mu 0 3 1026 1028 1027
		f 3 1948 1949 -1947
		mu 0 3 1028 1029 1027
		f 3 1950 1951 1952
		mu 0 3 1030 1032 1031
		f 3 1953 1954 -1952
		mu 0 3 1032 1033 1031
		f 3 1955 1956 -1396
		mu 0 3 790 1034 791
		f 3 1957 -1606 -1957
		mu 0 3 1034 1035 791
		f 3 1958 1959 1960
		mu 0 3 1036 948 1037
		f 3 -1764 -502 -1960
		mu 0 3 948 949 1037
		f 3 1961 1962 -1184
		mu 0 3 1038 1039 952
		f 3 -1382 -1767 -1963
		mu 0 3 1039 954 952
		f 3 1963 1964 1965
		mu 0 3 1040 803 843
		f 3 -1414 -1500 -1965
		mu 0 3 803 419 843
		f 3 -1778 1966 -345
		mu 0 3 220 960 221
		f 3 -521 1967 -1967
		mu 0 3 960 1041 221
		f 3 1968 1969 1970
		mu 0 3 222 956 1042
		f 3 -1772 1971 -1970
		mu 0 3 956 957 1042
		f 3 -792 1972 1973
		mu 0 3 1043 967 246
		f 3 -1786 -380 -1973
		mu 0 3 967 244 246
		f 3 -524 1974 1975
		mu 0 3 1044 1045 249
		f 3 1976 -384 -1975
		mu 0 3 1045 250 249
		f 3 1977 1978 -1613
		mu 0 3 1046 1048 1047
		f 3 1979 1980 -1979
		mu 0 3 1048 1049 1047
		f 3 1981 1982 1983
		mu 0 3 1050 1051 337
		f 3 -1424 -496 -1983
		mu 0 3 1051 336 337
		f 3 -1982 1984 -1610
		mu 0 3 1051 1050 1052
		f 3 1985 1986 -1985
		mu 0 3 1050 1053 1052
		f 3 -1766 1987 -504
		mu 0 3 342 1054 343
		f 3 1988 1989 -1988
		mu 0 3 1054 1055 343
		f 3 -1571 1990 1991
		mu 0 3 1056 1058 1057
		f 3 1992 1993 -1991
		mu 0 3 1058 1059 1057
		f 3 1994 1995 -1992
		mu 0 3 1057 1060 1056
		f 3 1996 -1762 -1996
		mu 0 3 1060 1061 1056
		f 3 -1580 1997 1998
		mu 0 3 1062 1064 1063
		f 3 1999 -1601 -1998
		mu 0 3 1064 1065 1063
		f 3 2000 2001 -1404
		mu 0 3 1066 1068 1067
		f 3 -1020 2002 -2002
		mu 0 3 1068 1069 1067
		f 3 -762 2003 2004
		mu 0 3 1070 1072 1071
		f 3 2005 2006 -2004
		mu 0 3 1072 1073 1071
		f 3 -482 2007 2008
		mu 0 3 1074 1076 1075
		f 3 2009 -1994 -2008
		mu 0 3 1076 1077 1075
		f 3 -1064 2010 2011
		mu 0 3 1078 150 852
		f 3 -232 2012 -2011
		mu 0 3 150 148 852
		f 3 2013 2014 2015
		mu 0 3 1079 1081 1080
		f 3 -16 2016 -2015
		mu 0 3 1081 1082 1080
		f 3 2017 2018 2019
		mu 0 3 1083 989 1084
		f 3 -1820 2020 -2019
		mu 0 3 989 990 1084
		f 3 -1454 2021 2022
		mu 0 3 830 832 1085
		f 3 -701 2023 -2022
		mu 0 3 832 1086 1085
		f 3 -1301 2024 -1641
		mu 0 3 741 545 1087
		f 3 -1830 2025 -2025
		mu 0 3 545 995 1087
		f 3 -1834 2026 -1110
		mu 0 3 689 173 51
		f 3 2027 -558 -2027
		mu 0 3 173 383 51
		f 3 2028 2029 -1077
		mu 0 3 678 916 390
		f 3 -1836 2030 -2030
		mu 0 3 916 914 390
		f 3 2031 2032 -21
		mu 0 3 15 731 17
		f 3 -1837 -279 -2033
		mu 0 3 731 178 17
		f 3 2033 2034 -157
		mu 0 3 99 681 101
		f 3 -1089 2035 -2035
		mu 0 3 681 71 101
		f 3 2036 2037 -1465
		mu 0 3 736 997 734
		f 3 -1844 2038 -2038
		mu 0 3 997 998 734
		f 3 -306 2039 2040
		mu 0 3 196 194 410
		f 3 2041 -1850 -2040
		mu 0 3 194 906 410
		f 3 2042 2043 -1852
		mu 0 3 999 908 1000
		f 3 -1654 2044 -2044
		mu 0 3 908 909 1000
		f 3 2045 2046 -587
		mu 0 3 399 676 400
		f 3 -1646 -874 -2047
		mu 0 3 676 556 400
		f 3 -191 2047 -591
		mu 0 3 125 123 402
		f 3 -1649 -1117 -2048
		mu 0 3 123 905 402
		f 3 2048 2049 -1859
		mu 0 3 531 1088 405
		f 3 2050 -598 -2050
		mu 0 3 1088 407 405
		f 3 2051 2052 -2032
		mu 0 3 15 39 731
		f 3 -57 -1263 -2053
		mu 0 3 39 40 731
		f 3 -1670 2053 2054
		mu 0 3 557 916 739
		f 3 -2029 -1290 -2054
		mu 0 3 916 678 739
		f 3 2055 2056 -839
		mu 0 3 539 1089 540
		f 3 2057 -1860 -2057
		mu 0 3 1089 1001 540
		f 3 2058 2059 -1674
		mu 0 3 918 204 690
		f 3 -322 2060 -2060
		mu 0 3 204 205 690
		f 3 -1269 2061 2062
		mu 0 3 732 53 412
		f 3 2063 2064 -2062
		mu 0 3 53 36 412
		f 3 2065 -87 2066
		mu 0 3 920 60 58
		f 3 -1867 2067 -129
		mu 0 3 84 1003 83
		f 3 2068 2069 -2068
		mu 0 3 1003 1090 83
		f 3 -1480 2070 2071
		mu 0 3 208 408 1091
		f 3 -1487 2072 -2071
		mu 0 3 408 840 1091
		f 3 -843 2073 -828
		mu 0 3 533 541 86
		f 3 2074 -135 -2074
		mu 0 3 541 88 86
		f 3 2075 2076 -349
		mu 0 3 223 1004 222
		f 3 -1877 -1969 -2077
		mu 0 3 1004 956 222
		f 3 2077 2078 2079
		mu 0 3 747 795 1005
		f 3 2080 -1879 -2079
		mu 0 3 795 958 1005
		f 3 2081 2082 -1899
		mu 0 3 1012 1006 223
		f 3 2083 -2076 -2083
		mu 0 3 1006 1004 223
		f 3 2084 2085 2086
		mu 0 3 1007 561 226
		f 3 -1311 -352 -2086
		mu 0 3 561 228 226
		f 3 2087 2088 -2080
		mu 0 3 1005 1009 747
		f 3 2089 -1324 -2089
		mu 0 3 1009 749 747
		f 3 -1313 2090 2091
		mu 0 3 563 699 1010
		f 3 -1144 2092 -2091
		mu 0 3 699 568 1010
		f 3 -1901 2093 2094
		mu 0 3 1012 237 936
		f 3 -369 -1737 -2094
		mu 0 3 237 238 936
		f 3 2095 2096 -555
		mu 0 3 382 98 52
		f 3 -155 -76 -2097
		mu 0 3 98 1 52
		f 3 -395 2097 2098
		mu 0 3 256 258 800
		f 3 -1904 2099 -2098
		mu 0 3 258 965 800
		f 3 2100 2101 2102
		mu 0 3 1015 251 574
		f 3 -388 -916 -2102
		mu 0 3 251 252 574
		f 3 2103 2104 -394
		mu 0 3 257 756 258
		f 3 -1346 -1902 -2105
		mu 0 3 756 243 258
		f 3 -400 2105 -920
		mu 0 3 260 262 575
		f 3 2106 -1349 -2106
		mu 0 3 262 757 575
		f 3 2107 2108 2109
		mu 0 3 1092 272 457
		f 3 2110 -698 -2109
		mu 0 3 272 455 457
		f 3 -1437 2111 -409
		mu 0 3 269 659 270
		f 3 -1540 -1291 -2112
		mu 0 3 659 740 270
		f 3 2112 2113 -1183
		mu 0 3 169 933 707
		f 3 -1926 2114 -2114
		mu 0 3 933 1018 707
		f 3 -1917 2115 2116
		mu 0 3 1016 463 1093
		f 3 -709 -1959 -2116
		mu 0 3 463 279 1093
		f 3 2117 2118 -1908
		mu 0 3 1014 1094 271
		f 3 -1956 -411 -2119
		mu 0 3 1094 273 271
		f 3 2119 2120 2121
		mu 0 3 1011 569 1095
		f 3 2122 2123 -2121
		mu 0 3 569 1096 1095
		f 3 -1941 2124 2125
		mu 0 3 432 1023 1008
		f 3 2126 2127 -2125
		mu 0 3 1023 1097 1008
		f 3 2128 2129 -1557
		mu 0 3 856 936 858
		f 3 -1739 -730 -2130
		mu 0 3 936 937 858
		f 3 2130 2131 2132
		mu 0 3 1098 1099 1026
		f 3 -1789 -1946 -2132
		mu 0 3 1099 1028 1026
		f 3 -735 2133 -1744
		mu 0 3 476 477 1100
		f 3 -1598 2134 -2134
		mu 0 3 477 1101 1100
		f 3 -441 2135 -1769
		mu 0 3 1102 481 1103
		f 3 -739 2136 -2136
		mu 0 3 481 480 1103
		f 3 -1932 2137 -743
		mu 0 3 482 1104 483
		f 3 2138 -774 -2138
		mu 0 3 1104 1105 483
		f 3 -1928 2139 2140
		mu 0 3 1106 312 1107
		f 3 -465 2141 -2140
		mu 0 3 312 313 1107
		f 3 -1469 2142 2143
		mu 0 3 834 66 1108
		f 3 2144 2145 -2143
		mu 0 3 66 212 1108
		f 3 2146 2147 -643
		mu 0 3 430 1109 316
		f 3 -1031 -468 -2148
		mu 0 3 1109 318 316
		f 3 2148 2149 -1703
		mu 0 3 759 1110 696
		f 3 -1235 2150 -2150
		mu 0 3 1110 1111 696
		f 3 -677 2151 2152
		mu 0 3 443 445 1112
		f 3 2153 2154 -2152
		mu 0 3 445 1113 1112
		f 3 2155 2156 2157
		mu 0 3 1114 1044 447
		f 3 -1976 -681 -2157
		mu 0 3 1044 249 447
		f 3 2158 2159 -1427
		mu 0 3 1115 1116 1046
		f 3 -1759 -1978 -2160
		mu 0 3 1116 1048 1046
		f 3 2160 2161 -1989
		mu 0 3 1054 1117 1055
		f 3 2162 2163 -2162
		mu 0 3 1117 1118 1055
		f 3 -1389 2164 -1993
		mu 0 3 1058 349 1059
		f 3 -513 2165 -2165
		mu 0 3 349 348 1059
		f 3 -1773 2166 2167
		mu 0 3 1119 1062 1120
		f 3 -1999 -1416 -2167
		mu 0 3 1062 1063 1120
		f 3 -2003 2168 2169
		mu 0 3 1067 1069 1121
		f 3 -1018 2170 -2169
		mu 0 3 1069 1122 1121
		f 3 2171 2172 2173
		mu 0 3 1123 1070 1124
		f 3 -2005 -1793 -2173
		mu 0 3 1070 1071 1124
		f 3 2174 2175 2176
		mu 0 3 1125 1074 1126
		f 3 -2009 -2166 -2176
		mu 0 3 1074 1075 1126
		f 3 -1244 2177 -947
		mu 0 3 590 725 589
		f 3 -1824 2178 -2178
		mu 0 3 725 1127 589
		f 3 -2014 2179 -244
		mu 0 3 1081 1079 1128
		f 3 2180 2181 -2180
		mu 0 3 1079 1129 1128
		f 3 2182 2183 2184
		mu 0 3 1130 1083 1131
		f 3 -2020 -207 -2184
		mu 0 3 1083 1084 1131
		f 3 -236 2185 -552
		mu 0 3 379 1132 378
		f 3 2186 2187 -2186
		mu 0 3 1132 1133 378
		f 3 -1455 2188 -1829
		mu 0 3 833 730 995
		f 3 2189 2190 -2189
		mu 0 3 730 171 995
		f 3 -1107 2191 -1833
		mu 0 3 689 437 996
		f 3 -663 -1093 -2192
		mu 0 3 437 438 996
		f 3 -844 2192 -217
		mu 0 3 138 542 115
		f 3 -1286 -180 -2193
		mu 0 3 542 117 115
		f 3 2193 2194 2195
		mu 0 3 189 192 997
		f 3 -301 -1842 -2195
		mu 0 3 192 190 997
		f 3 2196 2197 -872
		mu 0 3 61 1134 554
		f 3 2198 -1864 -2198
		mu 0 3 1134 1002 554
		f 3 -258 2199 -605
		mu 0 3 136 160 409
		f 3 -1283 -1085 -2200
		mu 0 3 160 682 409
		f 3 2200 2201 -1655
		mu 0 3 910 1135 911
		f 3 2202 2203 -2202
		mu 0 3 1135 1136 911
		f 3 -1846 2204 2205
		mu 0 3 998 392 912
		f 3 -569 2206 -2205
		mu 0 3 392 391 912
		f 3 2207 2208 -1661
		mu 0 3 913 1137 539
		f 3 2209 -2056 -2209
		mu 0 3 1137 1089 539
		f 3 -1296 2210 -1105
		mu 0 3 688 403 201
		f 3 -595 -315 -2211
		mu 0 3 403 199 201
		f 3 -1863 2211 -584
		mu 0 3 397 571 399
		f 3 -913 2212 -2212
		mu 0 3 571 572 399
		f 3 -629 2213 -111
		mu 0 3 75 423 58
		f 3 -1679 -2067 -2214
		mu 0 3 423 920 58
		f 3 2214 2215 2216
		mu 0 3 1138 1134 60
		f 3 -2197 -90 -2216
		mu 0 3 1134 61 60
		f 3 -1097 2217 -2075
		mu 0 3 541 398 88
		f 3 -1123 -288 -2218
		mu 0 3 398 182 88
		f 3 2218 2219 -1862
		mu 0 3 1001 202 571
		f 3 -1870 -911 -2220
		mu 0 3 202 573 571
		f 3 -1693 2220 -1878
		mu 0 3 923 744 870
		f 3 2221 -1577 -2221
		mu 0 3 744 792 870
		f 3 -1505 2222 -1697
		mu 0 3 235 715 748
		f 3 -1582 2223 -2223
		mu 0 3 715 794 748
		f 3 -1882 2224 -2084
		mu 0 3 1006 922 1004
		f 3 -1692 -1875 -2225
		mu 0 3 922 923 1004
		f 3 -1323 2225 -1888
		mu 0 3 746 429 1007
		f 3 -886 -2085 -2226
		mu 0 3 429 561 1007
		f 3 -1141 2226 -1881
		mu 0 3 218 566 1005
		f 3 -1891 -2088 -2227
		mu 0 3 566 1009 1005
		f 3 -891 2227 -1700
		mu 0 3 562 563 924
		f 3 -2092 -1893 -2228
		mu 0 3 563 1010 924
		f 3 2228 2229 -1518
		mu 0 3 846 436 466
		f 3 -1623 -965 -2230
		mu 0 3 436 598 466
		f 3 2230 2231 2232
		mu 0 3 1139 962 928
		f 3 2233 2234 -2232
		mu 0 3 962 1140 928
		f 3 2235 2236 -1529
		mu 0 3 702 930 717
		f 3 2237 -1586 -2237
		mu 0 3 930 798 717
		f 3 2238 2239 -1907
		mu 0 3 1013 1139 927
		f 3 -2233 -1713 -2240
		mu 0 3 1139 928 927
		f 3 -1910 2240 -1719
		mu 0 3 929 1015 444
		f 3 -2103 -1152 -2241
		mu 0 3 1015 574 444
		f 3 -2236 2241 -1722
		mu 0 3 930 702 931
		f 3 -1168 -1914 -2242
		mu 0 3 702 581 931
		f 3 -1726 2242 -1157
		mu 0 3 446 932 259
		f 3 -1920 -396 -2243
		mu 0 3 932 261 259
		f 3 -2108 2243 -413
		mu 0 3 272 1092 271
		f 3 2244 -1909 -2244
		mu 0 3 1092 1013 271
		f 3 2245 2246 -2072
		mu 0 3 1091 752 208
		f 3 2247 -327 -2247
		mu 0 3 752 209 208
		f 3 2248 2249 -696
		mu 0 3 455 1141 454
		f 3 2250 2251 -2250
		mu 0 3 1141 1142 454
		f 3 2252 2253 2254
		mu 0 3 1143 1020 451
		f 3 -1931 -689 -2254
		mu 0 3 1020 450 451
		f 3 2255 2256 2257
		mu 0 3 516 1144 766
		f 3 -736 -1368 -2257
		mu 0 3 1144 767 766
		f 3 -903 2258 -2123
		mu 0 3 569 434 1096
		f 3 -1937 -1951 -2259
		mu 0 3 434 1021 1096
		f 3 2259 2260 -895
		mu 0 3 565 1145 431
		f 3 -1948 -1938 -2261
		mu 0 3 1145 1022 431
		f 3 -2142 2261 -1944
		mu 0 3 1025 1146 1024
		f 3 2262 2263 -2262
		mu 0 3 1146 1147 1024
		f 3 -1950 2264 -1940
		mu 0 3 1027 1029 1148
		f 3 -1986 2265 -2265
		mu 0 3 1029 1149 1148
		f 3 2266 2267 -1936
		mu 0 3 1150 1151 1032
		f 3 2268 -1954 -2268
		mu 0 3 1151 1033 1032
		f 3 2269 2270 -1958
		mu 0 3 1034 1152 1035
		f 3 2271 -1796 -2271
		mu 0 3 1152 1153 1035
		f 3 2272 2273 2274
		mu 0 3 1154 1036 1155
		f 3 -1961 -501 -2274
		mu 0 3 1036 1037 1155
		f 3 -2251 2275 -466
		mu 0 3 314 868 315
		f 3 -1576 -1751 -2276
		mu 0 3 868 869 315
		f 3 -1968 2276 2277
		mu 0 3 221 1041 695
		f 3 -785 2278 -2277
		mu 0 3 1041 1156 695
		f 3 2279 2280 2281
		mu 0 3 1157 1108 211
		f 3 -2146 -332 -2281
		mu 0 3 1108 212 211
		f 3 2282 2283 -1974
		mu 0 3 246 443 1043
		f 3 -2153 -529 -2284
		mu 0 3 443 1112 1043
		f 3 -788 2284 -1977
		mu 0 3 1045 1110 250
		f 3 -2149 -1354 -2285
		mu 0 3 1110 759 250
		f 3 -2269 -1595 2285
		mu 0 3 1158 876 878
		f 3 -1987 2286 -1800
		mu 0 3 1052 1053 970
		f 3 -1949 -1791 -2287
		mu 0 3 1053 968 970
		f 3 -2007 2287 -1795
		mu 0 3 971 1118 972
		f 3 2288 -1573 -2288
		mu 0 3 1118 1159 972
		f 3 2289 -1997 2290
		mu 0 3 1160 1061 1060
		f 3 2291 2292 -1399
		mu 0 3 1161 1162 1064
		f 3 -1792 -2000 -2293
		mu 0 3 1162 1065 1064
		f 3 2293 2294 -1583
		mu 0 3 1163 1164 1066
		f 3 -1597 -2001 -2295
		mu 0 3 1164 1068 1066
		f 3 -483 2295 -2006
		mu 0 3 1072 1165 1073
		f 3 2296 -2164 -2296
		mu 0 3 1165 1166 1073
		f 3 -761 2297 -2010
		mu 0 3 1076 1167 1077
		f 3 2298 -1995 -2298
		mu 0 3 1167 1168 1077
		f 3 -264 2299 2300
		mu 0 3 166 167 1169
		f 3 -707 -800 -2300
		mu 0 3 167 462 1169
		f 3 2301 2302 -1050
		mu 0 3 1170 1172 1171
		f 3 2303 2304 -2303
		mu 0 3 1172 1173 1171
		f 3 2305 2306 2307
		mu 0 3 1174 1175 1082
		f 3 2308 -2017 -2307
		mu 0 3 1175 1080 1082
		f 3 -539 2309 -1816
		mu 0 3 987 669 988
		f 3 -1061 2310 -2310
		mu 0 3 669 670 988
		f 3 -1827 2311 -260
		mu 0 3 993 994 1086
		f 3 2312 -2024 -2312
		mu 0 3 994 1085 1086
		f 3 -2191 2313 -2026
		mu 0 3 995 171 1087
		f 3 -272 -832 -2314
		mu 0 3 171 172 1087
		f 3 2314 2315 -559
		mu 0 3 384 1176 386
		f 3 2316 -1147 -2316
		mu 0 3 1176 700 386
		f 3 -668 2317 -23
		mu 0 3 16 33 15
		f 3 2318 -2052 -2318
		mu 0 3 33 39 15
		f 3 -1181 2319 -2034
		mu 0 3 99 197 681
		f 3 -309 2320 -2320
		mu 0 3 197 196 681
		f 3 -300 2321 -1277
		mu 0 3 187 189 736
		f 3 -2196 -2037 -2322
		mu 0 3 189 997 736
		f 3 -1840 2322 -1092
		mu 0 3 684 186 683
		f 3 -298 -1274 -2323
		mu 0 3 186 187 683
		f 3 2323 2324 -2042
		mu 0 3 194 1177 906
		f 3 2325 -1650 -2325
		mu 0 3 1177 907 906
		f 3 -878 2326 -1466
		mu 0 3 555 184 241
		f 3 -294 -373 -2327
		mu 0 3 184 154 241
		f 3 -2207 2327 -1659
		mu 0 3 912 391 687
		f 3 -1078 -1100 -2328
		mu 0 3 391 679 687
		f 3 -1268 2328 -1704
		mu 0 3 49 732 913
		f 3 2329 -2208 -2329
		mu 0 3 732 1137 913
		f 3 -2326 2330 -1666
		mu 0 3 915 389 914
		f 3 -568 -2031 -2331
		mu 0 3 389 390 914
		f 3 -2213 2331 -2046
		mu 0 3 399 572 676
		f 3 -1685 -1071 -2332
		mu 0 3 572 675 676
		f 3 -879 2332 2333
		mu 0 3 424 93 1178
		f 3 -1677 2334 -2333
		mu 0 3 93 919 1178
		f 3 -1681 2335 -2066
		mu 0 3 920 921 60
		f 3 2336 -2217 -2336
		mu 0 3 921 1138 60
		f 3 -1686 2337 -1069
		mu 0 3 675 198 404
		f 3 -313 -597 -2338
		mu 0 3 198 199 404
		f 3 -334 2338 -633
		mu 0 3 215 213 9
		f 3 -869 -14 -2339
		mu 0 3 213 10 9
		f 3 -1318 2339 -2222
		mu 0 3 744 698 792
		f 3 -1688 -1398 -2340
		mu 0 3 698 622 792
		f 3 -2224 2340 -1326
		mu 0 3 748 794 747
		f 3 -1403 -2078 -2341
		mu 0 3 794 795 747
		f 3 -1508 2341 -1748
		mu 0 3 844 743 857
		f 3 -1690 -1884 -2342
		mu 0 3 743 922 857
		f 3 -1511 2342 -1695
		mu 0 3 745 288 231
		f 3 -435 -649 -2343
		mu 0 3 288 289 231
		f 3 -1515 2343 -1698
		mu 0 3 750 845 236
		f 3 -1740 -655 -2344
		mu 0 3 845 435 236
		f 3 -1701 2344 -1521
		mu 0 3 751 924 284
		f 3 -1895 -428 -2345
		mu 0 3 924 286 284
		f 3 -1484 2345 2346
		mu 0 3 840 839 918
		f 3 -1523 -2059 -2346
		mu 0 3 839 204 918
		f 3 -2235 2347 -1716
		mu 0 3 928 1140 755
		f 3 2348 -1710 -2348
		mu 0 3 1140 627 755
		f 3 -1720 2349 -2238
		mu 0 3 930 256 798
		f 3 -2099 -1406 -2350
		mu 0 3 256 800 798
		f 3 -1531 2350 -1715
		mu 0 3 754 283 927
		f 3 2351 -1905 -2351
		mu 0 3 283 1014 927
		f 3 -1552 2352 -929
		mu 0 3 578 765 577
		f 3 -1913 -1717 -2353
		mu 0 3 765 929 577
		f 3 -1723 2353 -688
		mu 0 3 255 931 451
		f 3 -1916 2354 -2354
		mu 0 3 931 1016 451
		f 3 -1539 2355 -1725
		mu 0 3 758 848 932
		f 3 -1549 -1918 -2356
		mu 0 3 848 762 932
		f 3 2356 2357 -2245
		mu 0 3 1092 1179 1013
		f 3 2358 -2239 -2358
		mu 0 3 1179 1139 1013
		f 3 -1335 2359 -2248
		mu 0 3 752 558 209
		f 3 -1732 -1874 -2360
		mu 0 3 558 925 209
		f 3 -2252 2360 -938
		mu 0 3 454 1142 584
		f 3 -463 -1927 -2361
		mu 0 3 1142 1019 584
		f 3 -931 2361 -1551
		mu 0 3 578 580 854
		f 3 -1736 -462 -2362
		mu 0 3 580 935 854
		f 3 -706 2362 -801
		mu 0 3 518 1180 516
		f 3 -2137 -2256 -2363
		mu 0 3 1180 1144 516
		f 3 -1374 -1743 -1514
		mu 0 3 769 771 845
		f 3 -1750 2363 -1507
		mu 0 3 844 940 565
		f 3 -2133 -2260 -2364
		mu 0 3 940 1145 565
		f 3 -467 2364 -2263
		mu 0 3 1146 941 1147
		f 3 -1752 2365 -2365
		mu 0 3 941 605 1147
		f 3 -2266 2366 -2127
		mu 0 3 1148 1149 942
		f 3 -1984 -1753 -2367
		mu 0 3 1149 943 942
		f 3 -1953 2367 -2124
		mu 0 3 1030 1031 944
		f 3 -1980 -1758 -2368
		mu 0 3 1031 945 944
		f 3 -423 2368 -2272
		mu 0 3 1152 946 1153
		f 3 -1761 2369 -2369
		mu 0 3 946 947 1153
		f 3 -416 2370 -1765
		mu 0 3 950 784 951
		f 3 -1391 -2161 -2371
		mu 0 3 784 785 951
		f 3 2371 2372 -952
		mu 0 3 1181 1182 484
		f 3 -1422 -745 -2373
		mu 0 3 1182 486 484
		f 3 -1405 2373 -2081
		mu 0 3 795 797 958
		f 3 -2170 -1774 -2374
		mu 0 3 797 959 958
		f 3 -1038 2374 -1785
		mu 0 3 966 801 965
		f 3 -1409 -2100 -2375
		mu 0 3 801 800 965
		f 3 -1981 2375 -1803
		mu 0 3 1047 1049 878
		f 3 -1955 -2286 -2376
		mu 0 3 1049 1158 878
		f 3 -1393 -2289 -2163
		mu 0 3 1117 1159 1118
		f 3 -2370 2376 -1798
		mu 0 3 973 1061 974
		f 3 -2290 -1808 -2377
		mu 0 3 1061 1160 974
		f 3 -1801 2377 -1001
		mu 0 3 975 976 1161
		f 3 -1790 -2292 -2378
		mu 0 3 976 1162 1161
		f 3 -1804 2378 -1214
		mu 0 3 977 978 1163
		f 3 -1594 -2294 -2379
		mu 0 3 978 1164 1163
		f 3 -1012 2379 -2297
		mu 0 3 1165 979 1166
		f 3 -1806 -1990 -2380
		mu 0 3 979 980 1166
		f 3 -2291 2380 -1809
		mu 0 3 982 1168 981
		f 3 -2299 -1216 -2381
		mu 0 3 1168 1167 981
		f 3 -257 -209 -2021
		mu 0 3 162 136 135
		f 3 2381 2382 2383
		mu 0 3 1183 1184 102
		f 3 -1059 -540 -2383
		mu 0 3 1184 369 102
		f 3 -2302 2384 2385
		mu 0 3 1172 1170 828
		f 3 -1438 -1450 -2385
		mu 0 3 1170 826 828
		f 3 -1631 2386 -248
		mu 0 3 895 897 1174
		f 3 2387 -2306 -2387
		mu 0 3 897 1175 1174
		f 3 2388 2389 -1815
		mu 0 3 986 991 985
		f 3 -1823 -1243 -2390
		mu 0 3 991 992 985
		f 3 -553 2390 -2301
		mu 0 3 1185 1186 903
		f 3 2391 -1640 -2391
		mu 0 3 1186 901 903
		f 3 -270 2392 -2028
		mu 0 3 173 171 383
		f 3 -2190 -1262 -2393
		mu 0 3 171 730 383
		f 3 -26 2393 -81
		mu 0 3 20 19 53
		f 3 -49 -2064 -2394
		mu 0 3 19 36 53
		f 3 -1094 2394 -1839
		mu 0 3 684 686 178
		f 3 -665 -282 -2395
		mu 0 3 686 179 178
		f 3 2395 2396 -2058
		mu 0 3 1089 46 1001
		f 3 -317 -2219 -2397
		mu 0 3 46 202 1001
		f 3 -2039 2397 -1272
		mu 0 3 734 998 733
		f 3 -2206 -1657 -2398
		mu 0 3 998 912 733
		f 3 2398 2399 -286
		mu 0 3 180 191 181
		f 3 -1082 2400 -2400
		mu 0 3 191 680 181
		f 3 -2321 2401 -1087
		mu 0 3 681 196 409
		f 3 -2041 -603 -2402
		mu 0 3 196 410 409
		f 3 2402 2403 -299
		mu 0 3 188 193 189
		f 3 -304 -2194 -2404
		mu 0 3 193 192 189
		f 3 -1845 2404 -572
		mu 0 3 392 190 180
		f 3 -303 -2399 -2405
		mu 0 3 190 191 180
		f 3 -566 2405 -948
		mu 0 3 591 1177 195
		f 3 -2324 -308 -2406
		mu 0 3 1177 194 195
		f 3 -563 2406 -824
		mu 0 3 385 387 531
		f 3 2407 -2049 -2407
		mu 0 3 387 1088 531
		f 3 2408 2409 -1476
		mu 0 3 837 559 739
		f 3 -880 -2055 -2410
		mu 0 3 559 557 739
		f 3 2410 2411 -2210
		mu 0 3 1137 45 1089
		f 3 -66 -2396 -2412
		mu 0 3 45 46 1089
		f 3 -2063 2412 -2330
		mu 0 3 732 412 1137
		f 3 -609 -2411 -2413
		mu 0 3 412 45 1137
		f 3 -2070 2413 -124
		mu 0 3 83 1090 82
		f 3 2414 -331 -2414
		mu 0 3 1090 210 82
		f 3 -630 2415 -337
		mu 0 3 215 424 216
		f 3 -2334 2416 -2416
		mu 0 3 424 1178 216
		f 3 2417 2418 -2051
		mu 0 3 1088 426 407
		f 3 -1524 -1486 -2419
		mu 0 3 426 839 407
		f 3 -1872 2419 -914
		mu 0 3 573 677 544
		f 3 -1072 -847 -2420
		mu 0 3 677 532 544
		f 3 -1488 2420 -341
		mu 0 3 217 92 90
		f 3 -145 2421 -2421
		mu 0 3 92 6 90
		f 3 -1306 2422 -43
		mu 0 3 31 85 30
		f 3 -134 -909 -2423
		mu 0 3 85 87 30
		f 3 -346 2423 -360
		mu 0 3 219 221 232
		f 3 -2278 -1129 -2424
		mu 0 3 221 695 232
		f 3 -2082 2424 -1885
		mu 0 3 1006 1012 856
		f 3 -2095 -2129 -2425
		mu 0 3 1012 936 856
		f 3 -648 2425 -2087
		mu 0 3 226 432 1007
		f 3 -2126 -1886 -2426
		mu 0 3 432 1008 1007
		f 3 -1892 2426 -2090
		mu 0 3 1009 768 749
		f 3 -1373 -1512 -2427
		mu 0 3 768 769 749
		f 3 -2093 2427 -1896
		mu 0 3 1010 568 1011
		f 3 -902 -2120 -2428
		mu 0 3 568 569 1011
		f 3 2428 2429 -1900
		mu 0 3 225 1187 237
		f 3 2430 -367 -2430
		mu 0 3 1187 239 237
		f 3 -1125 2431 -1259
		mu 0 3 694 693 382
		f 3 -1148 -2096 -2432
		mu 0 3 693 98 382
		f 3 -375 2432 -1468
		mu 0 3 241 242 183
		f 3 2433 -671 -2433
		mu 0 3 242 441 183
		f 3 -1165 2434 -379
		mu 0 3 245 442 246
		f 3 -675 -2283 -2435
		mu 0 3 442 443 246
		f 3 -962 2435 -1912
		mu 0 3 596 449 1015
		f 3 -684 -2101 -2436
		mu 0 3 449 251 1015
		f 3 -2104 2436 -1533
		mu 0 3 756 257 847
		f 3 -687 -1929 -2437
		mu 0 3 257 450 847
		f 3 -693 2437 -2107
		mu 0 3 262 453 757
		f 3 -957 -1536 -2438
		mu 0 3 453 276 757
		f 3 2438 2439 -945
		mu 0 3 1188 267 388
		f 3 -408 -564 -2440
		mu 0 3 267 268 388
		f 3 -415 2440 -2111
		mu 0 3 272 274 455
		f 3 -1574 -2249 -2441
		mu 0 3 274 1141 455
		f 3 -2355 2441 -2255
		mu 0 3 451 1016 1143
		f 3 -2117 -2273 -2442
		mu 0 3 1016 1093 1143
		f 3 -2270 2442 -426
		mu 0 3 282 1094 283;
	setAttr ".fc[1500:1999]"
		f 3 -2118 -2352 -2443
		mu 0 3 1094 1014 283
		f 3 -1897 2443 -431
		mu 0 3 286 1011 287
		f 3 -2122 -1756 -2444
		mu 0 3 1011 1095 287
		f 3 -2128 2444 -1889
		mu 0 3 1008 1097 469
		f 3 -1755 -719 -2445
		mu 0 3 1097 470 469
		f 3 -1377 2445 2446
		mu 0 3 772 773 292
		f 3 -740 -438 -2446
		mu 0 3 773 294 292
		f 3 -447 2447 -1749
		mu 0 3 297 299 1098
		f 3 -1600 -2131 -2448
		mu 0 3 299 1099 1098
		f 3 -2135 2448 -1745
		mu 0 3 1100 1101 1150
		f 3 -1593 -2267 -2449
		mu 0 3 1101 1151 1150
		f 3 -1933 2449 -2372
		mu 0 3 1189 862 1190
		f 3 -1566 -1228 -2450
		mu 0 3 862 863 1190
		f 3 -2253 2450 -2139
		mu 0 3 1104 1154 1105
		f 3 -2275 -1026 -2451
		mu 0 3 1154 1155 1105
		f 3 -2115 2451 -1962
		mu 0 3 1038 1106 1039
		f 3 -2141 -1945 -2452
		mu 0 3 1106 1107 1039
		f 3 -2279 2452 -1132
		mu 0 3 695 1156 430
		f 3 -1233 -2147 -2453
		mu 0 3 1156 1109 430
		f 3 -2151 2453 -1133
		mu 0 3 696 1111 320
		f 3 -1035 -473 -2454
		mu 0 3 1111 322 320
		f 3 -1154 2454 -2154
		mu 0 3 445 324 1113
		f 3 -480 -2175 -2455
		mu 0 3 324 325 1113
		f 3 -764 2455 -1158
		mu 0 3 495 494 447
		f 3 -2172 -2158 -2456
		mu 0 3 494 1114 447
		f 3 -1229 2456 -1036
		mu 0 3 720 722 1115
		f 3 -1568 -2159 -2457
		mu 0 3 722 1116 1115
		f 3 -1972 2457 -1240
		mu 0 3 723 1119 724
		f 3 -2168 -1024 -2458
		mu 0 3 1119 1120 724
		f 3 -2171 2458 -1777
		mu 0 3 1121 1122 352
		f 3 -772 -519 -2459
		mu 0 3 1122 354 352
		f 3 -2156 2459 -527
		mu 0 3 358 1123 359
		f 3 -2174 -1603 -2460
		mu 0 3 1123 1124 359
		f 3 -2155 2460 -532
		mu 0 3 362 1125 363
		f 3 -2177 -511 -2461
		mu 0 3 1125 1126 363
		f 3 -2439 2461 -1625
		mu 0 3 267 1188 893
		f 3 -2179 -1634 -2462
		mu 0 3 1188 1191 893
		f 3 -2182 2462 -195
		mu 0 3 1128 1129 1192
		f 3 2463 -1443 -2463
		mu 0 3 1129 1193 1192
		f 3 2464 2465 -547
		mu 0 3 375 1130 374
		f 3 -2185 -194 -2466
		mu 0 3 1130 1131 374
		f 3 2466 2467 -817
		mu 0 3 528 1133 527
		f 3 -2187 2468 -2468
		mu 0 3 1133 1132 527
		f 3 -2313 2469 2470
		mu 0 3 1194 1196 1195
		f 3 2471 -819 -2470
		mu 0 3 1196 1197 1195
		f 3 -1826 2472 -2472
		mu 0 3 1196 1198 1197
		f 3 2473 -2467 -2473
		mu 0 3 1198 1199 1197
		f 3 2474 2475 -1638
		mu 0 3 1200 1201 1198
		f 3 -2188 -2474 -2476
		mu 0 3 1201 1199 1198
		f 3 -2392 -550 -2475
		mu 0 3 1200 1202 1201
		f 3 -1635 -1821 2476
		mu 0 3 1203 1205 1204
		f 3 2477 2478 -2386
		mu 0 3 1206 1208 1207
		f 3 -1817 2479 -2479
		mu 0 3 1208 1209 1207
		f 3 -2477 2480 -1449
		mu 0 3 1203 1204 1206
		f 3 -2389 -2478 -2481
		mu 0 3 1204 1208 1206
		f 3 2481 2482 -1063
		mu 0 3 1210 1212 1211
		f 3 2483 2484 -2483
		mu 0 3 1212 1213 1211
		f 3 -2485 2485 -2311
		mu 0 3 1211 1213 1209
		f 3 2486 2487 -2486
		mu 0 3 1213 1214 1209
		f 3 -2488 -2304 -2480
		mu 0 3 1209 1214 1207
		f 3 -2471 2488 -2023
		mu 0 3 1194 1195 1215
		f 3 -1067 2489 -2489
		mu 0 3 1195 1216 1215
		f 3 -2490 2490 -1453
		mu 0 3 1215 1216 1217
		f 3 -1256 2491 -2491
		mu 0 3 1216 1218 1217
		f 3 2492 2493 -2181
		mu 0 3 1219 1221 1220
		f 3 -1057 2494 -2494
		mu 0 3 1221 1222 1220
		f 3 -1445 -2464 -2495
		mu 0 3 1222 1223 1220
		f 3 2495 2496 -544
		mu 0 3 1224 1226 1225
		f 3 -2309 2497 -2497
		mu 0 3 1226 1227 1225
		f 3 -2493 2498 -1250
		mu 0 3 1221 1219 1224
		f 3 -2016 -2496 -2499
		mu 0 3 1219 1226 1224
		f 3 2499 2500 -1247
		mu 0 3 1228 1230 1229
		f 3 -1053 2501 2502
		mu 0 3 1231 1229 1232
		f 3 -2501 -1818 -2502
		mu 0 3 1229 1230 1232
		f 3 -2498 2503 -815
		mu 0 3 1225 1227 1233
		f 3 -2388 2504 -2504
		mu 0 3 1227 1234 1233
		f 3 -2505 2505 -812
		mu 0 3 1233 1234 1228
		f 3 -1630 -2500 -2506
		mu 0 3 1234 1230 1228
		f 3 -2503 2506 -1441
		mu 0 3 1231 1232 1235
		f 3 -2018 2507 -2507
		mu 0 3 1232 1236 1235
		f 3 2508 2509 -2183
		mu 0 3 1237 1238 1236
		f 3 -1627 -2508 -2510
		mu 0 3 1238 1235 1236
		f 3 -2465 -549 -2509
		mu 0 3 1237 1239 1238
		f 3 2510 2511 2512
		mu 0 3 1240 1241 850
		f 3 -34 -1544 -2512
		mu 0 3 1241 849 850
		f 3 -2113 2513 -1729
		mu 0 3 933 169 705
		f 3 -265 2514 -2514
		mu 0 3 169 168 705
		f 3 -1782 2515 -2234
		mu 0 3 962 964 1140
		f 3 -1432 2516 -2516
		mu 0 3 964 1242 1140
		f 3 -77 2517 -281
		mu 0 3 177 50 17
		f 3 -71 -24 -2518
		mu 0 3 50 18 17
		f 3 -29 2518 -664
		mu 0 3 21 20 439
		f 3 -80 -283 -2519
		mu 0 3 20 54 439
		f 3 -55 2519 -1856
		mu 0 3 41 39 32
		f 3 -2319 -44 -2520
		mu 0 3 39 33 32
		f 3 -2403 2520 -1083
		mu 0 3 193 188 42
		f 3 -1266 -59 -2521
		mu 0 3 188 40 42
		f 3 -30 2521 -4
		mu 0 3 2 21 3
		f 3 -661 -1109 -2522
		mu 0 3 21 437 3
		f 3 -1151 2522 -2408
		mu 0 3 387 425 1088
		f 3 -637 -2418 -2523
		mu 0 3 425 426 1088
		f 3 -1871 2523 -1074
		mu 0 3 677 203 384
		f 3 2524 -2315 -2524
		mu 0 3 203 1176 384
		f 3 -608 2525 2526
		mu 0 3 47 411 1176
		f 3 -1 2527 -28
		mu 0 3 2 0 19
		f 3 2528 -50 -2528
		mu 0 3 0 35 19
		f 3 -1145 2529 -156
		mu 0 3 98 700 0
		f 3 -1458 -2529 -2530
		mu 0 3 700 35 0
		f 3 -610 2530 2531
		mu 0 3 411 412 34
		f 3 -2065 -46 -2531
		mu 0 3 412 36 34
		f 3 -2532 2532 -2526
		mu 0 3 411 34 1176
		f 3 -1459 -2317 -2533
		mu 0 3 34 700 1176
		f 3 -318 2533 -2525
		mu 0 3 203 48 1176
		f 3 -67 -2527 -2534
		mu 0 3 48 47 1176
		f 3 -1682 2534 -295
		mu 0 3 185 393 130
		f 3 -575 -199 -2535
		mu 0 3 393 128 130
		f 3 -1497 2535 -110
		mu 0 3 74 76 75
		f 3 -116 -627 -2536
		mu 0 3 76 77 75
		f 3 -11 -10 -634
		mu 0 3 9 5 7
		f 3 -6 -139 -2422
		mu 0 3 6 4 90
		f 3 -89 2536 -112
		mu 0 3 58 59 74
		f 3 2537 -576 -2537
		mu 0 3 59 14 74
		f 3 2538 2539 -160
		mu 0 3 101 1243 102
		f 3 2540 -2384 -2540
		mu 0 3 1243 1183 102
		f 3 -104 2541 -2036
		mu 0 3 71 70 101
		f 3 2542 -2539 -2542
		mu 0 3 70 1243 101
		f 3 2543 2544 -2359
		mu 0 3 1179 961 1139
		f 3 -1781 -2231 -2545
		mu 0 3 961 962 1139
		f 3 2545 2546 -2110
		mu 0 3 457 265 1092
		f 3 2547 -2357 -2547
		mu 0 3 265 1179 1092
		f 3 -401 2548 -2548
		mu 0 3 265 263 1179
		f 3 2549 -2544 -2549
		mu 0 3 263 961 1179
		f 3 -2517 2550 -2349
		mu 0 3 1140 1242 627
		f 3 -1618 -1007 -2551
		mu 0 3 1242 629 627
		f 3 2551 2552 -2550
		mu 0 3 263 1244 961
		f 3 -535 -1779 -2553
		mu 0 3 1244 963 961
		f 3 2553 2554 -697
		mu 0 3 456 266 457
		f 3 -404 -2546 -2555
		mu 0 3 266 265 457
		f 3 2555 -2552 2556
		mu 0 3 1245 1244 263
		f 3 -267 2557 -2515
		mu 0 3 168 165 705
		f 3 -259 -1174 -2558
		mu 0 3 165 163 705
		f 3 -262 -1639 -268
		mu 0 3 168 166 170
		f 3 -1170 2558 -937
		mu 0 3 583 704 456
		f 3 2559 -2554 -2559
		mu 0 3 704 266 456
		f 3 2560 2561 -2560
		mu 0 3 704 760 266
		f 3 -1921 -405 -2562
		mu 0 3 760 264 266
		f 3 -2561 2562 -1358
		mu 0 3 760 704 458
		f 3 -1172 -700 -2563
		mu 0 3 704 163 458
		f 3 -333 2563 -122
		mu 0 3 82 212 64
		f 3 -2145 -96 -2564
		mu 0 3 212 66 64
		f 3 -1280 2564 2565
		mu 0 3 69 538 67
		f 3 -838 -100 -2565
		mu 0 3 538 65 67
		f 3 2566 2567 -1472
		mu 0 3 835 68 67
		f 3 -103 -2566 -2568
		mu 0 3 68 69 67
		f 3 2568 2569 2570
		mu 0 3 1246 1245 264
		f 3 -2557 -403 -2570
		mu 0 3 1245 263 264
		f 3 2571 2572 -2567
		mu 0 3 835 1247 68
		f 3 -2569 2573 -2573
		mu 0 3 1247 1248 68
		f 3 2574 2575 -1471
		mu 0 3 834 1249 835
		f 3 -2556 -2572 -2576
		mu 0 3 1249 1247 835
		f 3 2576 2577 -2144
		mu 0 3 1108 1250 834
		f 3 -533 -2575 -2578
		mu 0 3 1250 1249 834
		f 3 -170 2578 2579
		mu 0 3 1251 1250 1157
		f 3 -2577 -2280 -2579
		mu 0 3 1250 1108 1157
		f 3 2580 -2571 -1923
		mu 0 3 1017 1246 264
		f 3 2581 2582 -1062
		mu 0 3 671 831 672
		f 3 -1451 2583 -2583
		mu 0 3 831 829 672
		f 3 -805 2584 2585
		mu 0 3 1252 1253 1183
		f 3 -2582 -2382 -2585
		mu 0 3 1253 1184 1183
		f 3 -1361 2586 2587
		mu 0 3 1254 1252 1243
		f 3 -2586 -2541 -2587
		mu 0 3 1252 1183 1243
		f 3 -1924 2588 2589
		mu 0 3 1255 1254 70
		f 3 -2588 -2543 -2589
		mu 0 3 1254 1243 70
		f 3 -101 2590 -2590
		mu 0 3 70 68 1255
		f 3 -2574 -2581 -2591
		mu 0 3 68 1248 1255
		f 3 2591 2592 2593
		mu 0 3 1256 148 846
		f 3 -658 -2229 -2593
		mu 0 3 148 436 846
		f 3 -1546 2594 2595
		mu 0 3 850 852 1256
		f 3 -2013 -2592 -2595
		mu 0 3 852 148 1256
		f 3 2596 2597 2598
		mu 0 3 1257 1256 570
		f 3 -2594 -1516 -2598
		mu 0 3 1256 846 570
		f 3 -2513 2599 2600
		mu 0 3 1240 850 1257
		f 3 -2596 -2597 -2600
		mu 0 3 850 1256 1257
		f 3 -659 -2469 -235
		mu 0 3 151 149 153
		f 3 -799 2601 -237
		mu 0 3 152 516 151
		f 3 -2258 -1621 -2602
		mu 0 3 516 766 151
		f 3 -1255 2602 -2484
		mu 0 3 727 729 1258
		f 3 2603 2604 -2603
		mu 0 3 729 1259 1258
		f 3 -2604 2605 2606
		mu 0 3 1260 983 1261
		f 3 -1812 2607 -2606
		mu 0 3 983 62 1261
		f 3 -2608 2608 2609
		mu 0 3 1261 62 1262
		f 3 -94 2610 -2609
		mu 0 3 62 22 1262
		f 3 -2611 2611 2612
		mu 0 3 1262 22 1263
		f 3 -33 2613 -2612
		mu 0 3 22 23 1263
		f 3 -2614 2614 2615
		mu 0 3 1263 23 1264
		f 3 2616 2617 -2615
		mu 0 3 23 28 1264
		f 3 2618 2619 -162
		mu 0 3 1265 802 1266
		f 3 -1413 2620 -2620
		mu 0 3 802 803 1266
		f 3 -1044 2621 2622
		mu 0 3 1267 1266 1040
		f 3 -2621 -1964 -2622
		mu 0 3 1266 803 1040
		f 3 2623 2624 -38
		mu 0 3 27 1267 26
		f 3 -2623 2625 -2625
		mu 0 3 1267 1040 26
		f 3 -36 2626 -2618
		mu 0 3 28 26 1264
		f 3 2627 2628 -2627
		mu 0 3 26 1268 1264
		f 3 2629 2630 -2431
		mu 0 3 1187 1257 239
		f 3 -2599 -904 -2631
		mu 0 3 1257 570 239
		f 3 -2601 2631 2632
		mu 0 3 1240 1257 872
		f 3 -2630 2633 -2632
		mu 0 3 1257 1187 872
		f 3 -1587 2634 -350
		mu 0 3 224 872 225
		f 3 -2634 -2429 -2635
		mu 0 3 872 1187 225
		f 3 -1238 2635 -1971
		mu 0 3 1042 874 222
		f 3 -1590 -347 -2636
		mu 0 3 874 224 222
		f 3 -2633 2636 2637
		mu 0 3 1240 872 1269
		f 3 2638 -40 -2637
		mu 0 3 872 1270 1269
		f 3 -1589 -2624 -2639
		mu 0 3 872 873 1270
		f 3 2639 2640 -1966
		mu 0 3 843 1268 1040
		f 3 -2628 -2626 -2641
		mu 0 3 1268 26 1040
		f 3 -2073 2641 2642
		mu 0 3 1091 840 917
		f 3 -2347 -1671 -2642
		mu 0 3 840 918 917
		f 3 -850 2643 -2061
		mu 0 3 205 413 690
		f 3 -613 -1113 -2644
		mu 0 3 413 414 690
		f 3 2644 2645 -1669
		mu 0 3 753 917 547
		f 3 -1673 -856 -2646
		mu 0 3 917 546 547
		f 3 -2246 2646 -1333
		mu 0 3 752 1091 753
		f 3 -2643 -2645 -2647
		mu 0 3 1091 917 753
		f 3 -2511 -2638 2647
		mu 0 3 1241 1240 1269
		f 3 -39 2648 -2648
		mu 0 3 29 28 25
		f 3 -2617 -35 -2649
		mu 0 3 28 23 25
		f 3 -1545 2649 -2012
		mu 0 3 852 851 1078
		f 3 -1813 -1258 -2650
		mu 0 3 851 1271 1078
		f 3 -2584 2650 -2482
		mu 0 3 1210 1217 1212
		f 3 -2492 -1253 -2651
		mu 0 3 1217 1218 1212
		f 3 -2308 2651 2652
		mu 0 3 156 11 81
		f 3 -18 2653 -2652
		mu 0 3 11 12 81
		f 3 2654 2655 -2654
		mu 0 3 12 553 81
		f 3 -1848 -121 -2656
		mu 0 3 553 79 81
		f 3 -20 2656 -2655
		mu 0 3 12 14 553
		f 3 -2538 -871 -2657
		mu 0 3 14 59 553
		f 3 -125 2657 -117
		mu 0 3 78 64 80
		f 3 -98 2658 -2658
		mu 0 3 64 65 80
		f 3 -2653 2659 -246
		mu 0 3 156 81 158
		f 3 -120 2660 -2660
		mu 0 3 81 80 158
		f 3 -837 -2661 -2659
		mu 0 3 65 158 80
		f 3 2661 2662 -1478
		mu 0 3 838 1262 837
		f 3 -2613 2663 -2663
		mu 0 3 1262 1263 837
		f 3 2664 2665 -1542
		mu 0 3 657 1261 838
		f 3 -2610 -2662 -2666
		mu 0 3 1261 1262 838
		f 3 2666 2667 -1048
		mu 0 3 658 1260 657
		f 3 -2607 -2665 -2668
		mu 0 3 1260 1261 657
		f 3 -2305 2668 -2667
		mu 0 3 1171 1173 1259
		f 3 -2487 -2605 -2669
		mu 0 3 1173 1258 1259
		f 3 -1709 2669 -1499
		mu 0 3 96 926 843
		f 3 2670 -2640 -2670
		mu 0 3 926 1268 843
		f 3 2671 2672 -1731
		mu 0 3 560 1264 926
		f 3 -2629 -2671 -2673
		mu 0 3 1264 1268 926
		f 3 2673 2674 -883
		mu 0 3 559 1263 560
		f 3 -2616 -2672 -2675
		mu 0 3 1263 1264 560
		f 3 -2664 -2674 -2409
		mu 0 3 837 1263 559
		f 3 -231 2675 2676
		mu 0 3 145 147 1136
		f 3 2677 -2204 -2676
		mu 0 3 147 911 1136
		f 3 -287 2678 -2678
		mu 0 3 147 181 911
		f 3 2679 -1656 -2679
		mu 0 3 181 909 911
		f 3 -2401 2680 -2680
		mu 0 3 181 680 909
		f 3 2681 -2045 -2681
		mu 0 3 680 1000 909
		f 3 -226 2682 -543
		mu 0 3 142 143 1272
		f 3 2683 2684 -2683
		mu 0 3 143 1273 1272
		f 3 -1084 2685 -2682
		mu 0 3 680 42 1000
		f 3 -58 -1855 -2686
		mu 0 3 42 41 1000
		f 3 2686 2687 -374
		mu 0 3 155 1135 242
		f 3 -2201 2688 -2688
		mu 0 3 1135 910 242
		f 3 -2434 2689 2690
		mu 0 3 441 242 908
		f 3 -2689 -1652 -2690
		mu 0 3 242 910 908
		f 3 -672 2691 2692
		mu 0 3 440 441 999
		f 3 -2691 -2043 -2692
		mu 0 3 441 908 999
		f 3 -1249 2693 -203
		mu 0 3 133 1272 134
		f 3 -2685 2694 -2694
		mu 0 3 1272 1273 134
		f 3 -41 2695 -1854
		mu 0 3 32 30 999
		f 3 -910 -2693 -2696
		mu 0 3 30 440 999
		f 3 -238 -198 -205
		mu 0 3 132 130 129
		f 3 -182 -1440 -218
		mu 0 3 115 116 139
		f 3 -2695 2696 2697
		mu 0 3 134 1273 1135
		f 3 2698 -2203 -2697
		mu 0 3 1273 1136 1135
		f 3 2699 2700 -2684
		mu 0 3 143 145 1273
		f 3 -2677 -2699 -2701
		mu 0 3 145 1136 1273
		f 3 2701 2702 -225
		mu 0 3 121 144 143
		f 3 -229 -2700 -2703
		mu 0 3 144 145 143
		f 3 -1098 2703 -186
		mu 0 3 120 679 121
		f 3 -1080 -2702 -2704
		mu 0 3 679 144 121
		f 3 -204 2704 -241
		mu 0 3 132 134 155
		f 3 -2698 -2687 -2705
		mu 0 3 134 1135 155
		f 3 2705 2706 2707
		mu 0 3 1274 1275 1276
		f 3 -2707 2708 2709
		mu 0 3 1276 1275 1277
		f 3 2710 2711 2712
		mu 0 3 1278 1279 1280
		f 3 -2712 2713 2714
		mu 0 3 1280 1279 1281
		f 3 2715 2716 2717
		mu 0 3 1282 1283 1278
		f 3 -2717 2718 -2711
		mu 0 3 1278 1283 1279
		f 3 2719 2720 2721
		mu 0 3 1284 1285 1286
		f 3 -2721 2722 2723
		mu 0 3 1286 1285 1287
		f 3 2724 2725 2726
		mu 0 3 1288 1289 1290
		f 3 -2726 2727 2728
		mu 0 3 1290 1289 1291
		f 3 2729 2730 2731
		mu 0 3 1292 1276 1293
		f 3 -2731 2732 2733
		mu 0 3 1293 1276 1294
		f 3 -2734 2734 2735
		mu 0 3 1293 1294 1295
		f 3 -2735 2736 2737
		mu 0 3 1295 1294 1288
		f 3 2738 2739 2740
		mu 0 3 1296 1274 1292
		f 3 -2740 -2708 -2730
		mu 0 3 1292 1274 1276
		f 3 2741 2742 2743
		mu 0 3 1297 1298 1286
		f 3 -2743 2744 2745
		mu 0 3 1286 1298 1299
		f 3 2746 2747 2748
		mu 0 3 1300 1301 1302
		f 3 -2748 2749 2750
		mu 0 3 1302 1301 1303
		f 3 -2747 2751 2752
		mu 0 3 1301 1300 1304
		f 3 -2752 2753 2754
		mu 0 3 1304 1300 1305
		f 3 2755 2756 -2742
		mu 0 3 1297 1306 1298
		f 3 -2757 2757 2758
		mu 0 3 1298 1306 1307
		f 3 2759 2760 2761
		mu 0 3 1308 1309 1310
		f 3 -2761 2762 2763
		mu 0 3 1310 1309 1311
		f 3 2764 2765 2766
		mu 0 3 1312 1313 1314
		f 3 -2766 2767 2768
		mu 0 3 1314 1313 1302
		f 3 -2754 2769 2770
		mu 0 3 1305 1300 1315
		f 3 -2770 2771 2772
		mu 0 3 1315 1300 1316
		f 3 2773 2774 -2739
		mu 0 3 1296 1282 1274
		f 3 -2775 -2718 2775
		mu 0 3 1274 1282 1278
		f 3 2776 2777 -2713
		mu 0 3 1280 1275 1278
		f 3 -2778 -2706 -2776
		mu 0 3 1278 1275 1274
		f 3 2778 2779 -2767
		mu 0 3 1314 1310 1312
		f 3 -2780 -2764 2780
		mu 0 3 1312 1310 1311
		f 3 -2710 2781 -2733
		mu 0 3 1276 1277 1294
		f 3 -2782 2782 2783
		mu 0 3 1294 1277 1317
		f 3 -2760 2784 2785
		mu 0 3 1309 1308 1307
		f 3 -2785 2786 -2759
		mu 0 3 1307 1308 1298
		f 3 -2756 2787 2788
		mu 0 3 1306 1297 1318
		f 3 -2788 2789 2790
		mu 0 3 1318 1297 1319
		f 3 -2724 2791 -2744
		mu 0 3 1286 1287 1297
		f 3 -2792 2792 -2790
		mu 0 3 1297 1287 1319
		f 3 2793 2794 -2768
		mu 0 3 1313 1316 1302
		f 3 -2795 -2772 -2749
		mu 0 3 1302 1316 1300
		f 3 -2773 2795 2796
		mu 0 3 1315 1316 1320
		f 3 -2796 2797 2798
		mu 0 3 1320 1316 1321
		f 3 2799 2800 2801
		mu 0 3 1281 1321 1313
		f 3 -2801 -2798 -2794
		mu 0 3 1313 1321 1316
		f 3 -2715 2802 2803
		mu 0 3 1280 1281 1312
		f 3 -2803 -2802 -2765
		mu 0 3 1312 1281 1313
		f 3 -2777 2804 2805
		mu 0 3 1275 1280 1311
		f 3 -2805 -2804 -2781
		mu 0 3 1311 1280 1312
		f 3 2806 2807 -2763
		mu 0 3 1309 1277 1311
		f 3 -2808 -2709 -2806
		mu 0 3 1311 1277 1275
		f 3 -2807 2808 -2783
		mu 0 3 1277 1309 1317
		f 3 -2809 -2786 2809
		mu 0 3 1317 1309 1307
		f 3 2810 2811 -2758
		mu 0 3 1306 1289 1307
		f 3 -2812 2812 -2810
		mu 0 3 1307 1289 1317
		f 3 -2811 2813 -2728
		mu 0 3 1289 1306 1291
		f 3 -2814 -2789 2814
		mu 0 3 1291 1306 1318
		f 3 -2784 2815 -2737
		mu 0 3 1294 1317 1288
		f 3 -2816 -2813 -2725
		mu 0 3 1288 1317 1289
		f 3 2816 2817 -2719
		mu 0 3 1283 1322 1279
		f 3 -2818 2818 2819
		mu 0 3 1279 1322 1323
		f 3 -2820 2820 -2714
		mu 0 3 1279 1323 1281
		f 3 -2821 2821 -2800
		mu 0 3 1281 1323 1321
		f 3 2822 2823 -2822
		mu 0 3 1323 1324 1321
		f 3 -2824 2824 -2799
		mu 0 3 1321 1324 1320
		f 3 -2823 2825 2826
		mu 0 3 1324 1323 1325
		f 3 -2826 -2819 2827
		mu 0 3 1325 1323 1322
		f 3 -2738 2828 2829
		mu 0 3 1295 1288 1326
		f 3 -2829 -2727 2830
		mu 0 3 1326 1288 1290
		f 3 2831 2832 2833
		mu 0 3 1327 1328 1329
		f 3 -2833 2834 2835
		mu 0 3 1329 1328 1330
		f 3 -2787 2836 -2745
		mu 0 3 1298 1308 1299
		f 3 -2837 2837 2838
		mu 0 3 1299 1308 1331
		f 3 -2751 2839 -2769
		mu 0 3 1302 1303 1314
		f 3 -2840 2840 2841
		mu 0 3 1314 1303 1332
		f 3 -2842 2842 -2779
		mu 0 3 1314 1332 1310
		f 3 -2843 2843 2844
		mu 0 3 1310 1332 1333
		f 3 2845 2846 -2845
		mu 0 3 1333 1331 1310
		f 3 -2847 -2838 -2762
		mu 0 3 1310 1331 1308
		f 3 2847 2848 2849
		mu 0 3 1334 1335 1336
		f 3 -2849 2850 2851
		mu 0 3 1336 1335 1337
		f 3 2852 2853 2854
		mu 0 3 1338 1339 1335
		f 3 -2854 2855 -2851
		mu 0 3 1335 1339 1337
		f 3 2856 2857 -2850
		mu 0 3 1336 1340 1334
		f 3 -2858 2858 2859
		mu 0 3 1334 1340 1341
		f 3 -2853 2860 2861
		mu 0 3 1339 1338 1342
		f 3 -2861 2862 2863
		mu 0 3 1342 1338 1343
		f 3 -2864 2864 2865
		mu 0 3 1342 1343 1330
		f 3 -2865 2866 -2836
		mu 0 3 1330 1343 1329
		f 3 2867 2868 2869
		mu 0 3 1344 1345 1331
		f 3 -2869 2870 -2839
		mu 0 3 1331 1345 1299
		f 3 2871 2872 2873
		mu 0 3 1346 1344 1333
		f 3 -2873 -2870 -2846
		mu 0 3 1333 1344 1331
		f 3 2874 2875 -2844
		mu 0 3 1332 1347 1333
		f 3 -2876 2876 -2874
		mu 0 3 1333 1347 1346
		f 3 -2875 2877 2878
		mu 0 3 1347 1332 1348
		f 3 -2878 -2841 2879
		mu 0 3 1348 1332 1303
		f 3 -2880 2880 2881
		mu 0 3 1348 1303 1349
		f 3 -2881 -2750 2882
		mu 0 3 1349 1303 1301
		f 3 2883 2884 -2753
		mu 0 3 1304 1350 1301
		f 3 -2885 2885 -2883
		mu 0 3 1301 1350 1349
		f 3 -2720 2886 2887
		mu 0 3 1285 1284 1351
		f 3 -2887 2888 2889
		mu 0 3 1351 1284 1352
		f 3 2890 2891 -2871
		mu 0 3 1345 1284 1299
		f 3 -2892 -2722 -2746
		mu 0 3 1299 1284 1286
		f 3 2892 2893 2894
		mu 0 3 1352 1341 1353
		f 3 -2894 -2859 2895
		mu 0 3 1353 1341 1340
		f 3 -2891 2896 -2889
		mu 0 3 1284 1345 1352
		f 3 -2897 2897 -2893
		mu 0 3 1352 1345 1341
		f 3 -2860 2898 2899
		mu 0 3 1334 1341 1344
		f 3 -2899 -2898 -2868
		mu 0 3 1344 1341 1345
		f 3 -2848 2900 2901
		mu 0 3 1335 1334 1346
		f 3 -2901 -2900 -2872
		mu 0 3 1346 1334 1344
		f 3 2902 2903 -2877
		mu 0 3 1347 1338 1346
		f 3 -2904 -2855 -2902
		mu 0 3 1346 1338 1335
		f 3 -2903 2904 -2863
		mu 0 3 1338 1347 1343
		f 3 -2905 -2879 2905
		mu 0 3 1343 1347 1348
		f 3 -2906 2906 -2867
		mu 0 3 1343 1348 1329
		f 3 -2907 -2882 2907
		mu 0 3 1329 1348 1349
		f 3 2908 2909 -2886
		mu 0 3 1350 1327 1349
		f 3 -2910 -2834 -2908
		mu 0 3 1349 1327 1329
		f 3 -2890 2910 2911
		mu 0 3 1351 1352 1354
		f 3 -2911 -2895 2912
		mu 0 3 1354 1352 1353
		f 3 2913 2914 2915
		mu 0 3 1355 1356 1357
		f 3 -2915 2916 -2835
		mu 0 3 1357 1356 1358
		f 3 2917 2918 -2917
		mu 0 3 1356 1359 1358
		f 3 -2919 2919 -2866
		mu 0 3 1358 1359 1360
		f 3 2920 2921 2922
		mu 0 3 1361 1362 1363
		f 3 -2922 2923 -2856
		mu 0 3 1363 1362 1364
		f 3 2924 2925 2926
		mu 0 3 1365 1366 1367
		f 3 -2926 2927 -2716
		mu 0 3 1367 1366 1368
		f 3 2928 2929 2930
		mu 0 3 1369 1370 1366
		f 3 -2930 -2817 -2928
		mu 0 3 1366 1370 1368
		f 3 2931 2932 2933
		mu 0 3 1371 1365 1372
		f 3 -2933 -2927 -2774
		mu 0 3 1372 1365 1367
		f 3 2934 2935 2936
		mu 0 3 1373 1374 1369
		f 3 -2936 -2828 -2929
		mu 0 3 1369 1374 1370
		f 3 2937 2938 2939
		mu 0 3 1375 1376 1373
		f 3 -2939 -2827 -2935
		mu 0 3 1373 1376 1374
		f 3 2940 2941 2942
		mu 0 3 1377 1378 1362
		f 3 -2942 -2852 -2924
		mu 0 3 1362 1378 1364
		f 3 2943 2944 2945
		mu 0 3 1379 1380 1381
		f 3 -2945 -2896 2946
		mu 0 3 1381 1380 1382
		f 3 2947 2948 2949
		mu 0 3 1383 1384 1379
		f 3 -2949 -2913 -2944
		mu 0 3 1379 1384 1380
		f 3 2950 2951 2952
		mu 0 3 1385 1386 1387
		f 3 -2952 -2888 2953
		mu 0 3 1387 1386 1388
		f 3 2954 2955 2956
		mu 0 3 1389 1390 1385
		f 3 -2956 -2723 -2951
		mu 0 3 1385 1390 1386
		f 3 2957 2958 2959
		mu 0 3 1391 1392 1393
		f 3 -2959 2960 -2815
		mu 0 3 1393 1392 1394
		f 3 2961 2962 -2961
		mu 0 3 1392 1395 1394
		f 3 -2963 2963 -2729
		mu 0 3 1394 1395 1396
		f 3 2964 2965 -2964
		mu 0 3 1395 1397 1396
		f 3 -2966 2966 -2831
		mu 0 3 1396 1397 1398
		f 3 -2960 2967 2968
		mu 0 3 1391 1393 1399
		f 3 -2968 -2791 2969
		mu 0 3 1399 1393 1400
		f 3 2970 2971 2972
		mu 0 3 1401 1402 1403
		f 3 -2972 2973 -2736
		mu 0 3 1403 1402 1404
		f 3 2974 2975 2976
		mu 0 3 1405 1406 1402
		f 3 -2976 -2732 -2974
		mu 0 3 1402 1406 1404
		f 3 -2934 2977 2978
		mu 0 3 1371 1372 1405
		f 3 -2978 -2741 -2975
		mu 0 3 1405 1372 1406
		f 3 2979 2980 -2967
		mu 0 3 1397 1401 1398
		f 3 -2981 -2973 -2830
		mu 0 3 1398 1401 1403
		f 3 -2970 2981 2982
		mu 0 3 1399 1400 1389
		f 3 -2982 -2793 -2955
		mu 0 3 1389 1400 1390
		f 3 2983 2984 2985
		mu 0 3 1407 1408 1409
		f 3 -2985 2986 -2909
		mu 0 3 1409 1408 1410
		f 3 2987 2988 2989
		mu 0 3 1411 1407 1412
		f 3 -2989 -2986 -2884
		mu 0 3 1412 1407 1409
		f 3 2990 2991 2992
		mu 0 3 1413 1414 1375
		f 3 -2992 -2825 -2938
		mu 0 3 1375 1414 1376
		f 3 2993 2994 2995
		mu 0 3 1415 1416 1413
		f 3 -2995 -2797 -2991
		mu 0 3 1413 1416 1414
		f 3 2996 2997 -2994
		mu 0 3 1415 1417 1416
		f 3 -2998 2998 -2771
		mu 0 3 1416 1417 1418
		f 3 2999 3000 -2999
		mu 0 3 1417 1411 1418
		f 3 -3001 -2990 -2755
		mu 0 3 1418 1411 1412
		f 3 3001 3002 3003
		mu 0 3 1419 1420 1421
		f 3 -3003 3004 3005
		mu 0 3 1421 1420 1422
		f 3 3006 3007 3008
		mu 0 3 1423 1424 1425
		f 3 -3008 3009 3010
		mu 0 3 1425 1424 1426
		f 3 3011 3012 3013
		mu 0 3 1427 1428 1429
		f 3 -3013 3014 3015
		mu 0 3 1429 1428 1430
		f 3 3016 3017 -3005
		mu 0 3 1420 1431 1422
		f 3 -3018 3018 3019
		mu 0 3 1422 1431 1432
		f 3 3020 3021 3022
		mu 0 3 1433 1434 1423
		f 3 -3022 3023 -3007
		mu 0 3 1423 1434 1424
		f 3 3024 3025 -3019
		mu 0 3 1431 1435 1432
		f 3 -3026 3026 3027
		mu 0 3 1432 1435 1436
		f 3 -3021 3028 3029
		mu 0 3 1434 1433 1437
		f 3 -3029 3030 3031
		mu 0 3 1437 1433 1438
		f 3 3032 3033 3034
		mu 0 3 1439 1436 1440
		f 3 -3034 -3027 3035
		mu 0 3 1440 1436 1435
		f 3 -3032 3036 3037
		mu 0 3 1437 1438 1441
		f 3 -3037 3038 3039
		mu 0 3 1441 1438 1442
		f 3 3040 3041 3042
		mu 0 3 1443 1444 1445
		f 3 -3042 3043 3044
		mu 0 3 1445 1444 1446
		f 3 -3040 3045 3046
		mu 0 3 1441 1442 1430
		f 3 -3046 3047 -3016
		mu 0 3 1430 1442 1429
		f 3 3048 3049 3050
		mu 0 3 1447 1448 1449
		f 3 3051 3052 -3044
		mu 0 3 1444 1419 1446
		f 3 -3053 -3004 3053
		mu 0 3 1446 1419 1421
		f 3 3054 3055 -3012
		mu 0 3 1427 1439 1428;
	setAttr ".fc[2000:2499]"
		f 3 -3056 -3035 3056
		mu 0 3 1428 1439 1440
		f 3 -3011 3057 3058
		mu 0 3 1425 1426 1449
		f 3 -3058 3059 -3051
		mu 0 3 1449 1426 1447
		f 3 -3043 3060 3061
		mu 0 3 1443 1445 1450
		f 3 -3061 3062 3063
		mu 0 3 1450 1445 1451
		f 3 -3063 3064 3065
		mu 0 3 1451 1445 1452
		f 3 3066 3067 -3050
		mu 0 3 1448 1453 1449
		f 3 -3068 3068 3069
		mu 0 3 1449 1453 1454
		f 3 3070 3071 -3067
		mu 0 3 1448 1455 1453
		f 3 -3072 3072 3073
		mu 0 3 1453 1455 1456
		f 3 -3006 3074 3075
		mu 0 3 1421 1422 1457
		f 3 -3075 3076 3077
		mu 0 3 1457 1422 1458
		f 3 3078 3079 -3073
		mu 0 3 1455 1459 1456
		f 3 -3080 3080 3081
		mu 0 3 1456 1459 1460
		f 3 3082 3083 -3009
		mu 0 3 1425 1461 1423
		f 3 -3084 3084 3085
		mu 0 3 1423 1461 1462
		f 3 3086 3087 -3014
		mu 0 3 1429 1463 1427
		f 3 -3088 3088 3089
		mu 0 3 1427 1463 1464
		f 3 -3020 3090 -3077
		mu 0 3 1422 1432 1458
		f 3 -3091 3091 3092
		mu 0 3 1458 1432 1465
		f 3 3093 3094 3095
		mu 0 3 1466 1467 1468
		f 3 -3095 3096 3097
		mu 0 3 1468 1467 1469
		f 3 -3086 3098 -3023
		mu 0 3 1423 1462 1433
		f 3 -3099 3099 3100
		mu 0 3 1433 1462 1470
		f 3 3101 3102 3103
		mu 0 3 1471 1472 1473
		f 3 -3103 3104 3105
		mu 0 3 1473 1472 1474
		f 3 3106 3107 -3097
		mu 0 3 1467 1475 1469
		f 3 -3108 3108 3109
		mu 0 3 1469 1475 1476
		f 3 -3064 3110 3111
		mu 0 3 1450 1451 1471
		f 3 -3111 3112 -3102
		mu 0 3 1471 1451 1472
		f 3 -3028 3113 -3092
		mu 0 3 1432 1436 1465
		f 3 -3114 3114 3115
		mu 0 3 1465 1436 1477
		f 3 3116 3117 -3081
		mu 0 3 1459 1478 1460
		f 3 -3118 3118 3119
		mu 0 3 1460 1478 1479
		f 3 -3101 3120 -3031
		mu 0 3 1433 1470 1438
		f 3 -3121 3121 3122
		mu 0 3 1438 1470 1480
		f 3 3123 3124 3125
		mu 0 3 1481 1482 1483
		f 3 -3125 3126 3127
		mu 0 3 1483 1482 1484
		f 3 3128 3129 -3119
		mu 0 3 1478 1466 1479
		f 3 -3130 -3096 3130
		mu 0 3 1479 1466 1468
		f 3 -3128 3131 3132
		mu 0 3 1483 1484 1485
		f 3 -3132 3133 3134
		mu 0 3 1485 1484 1486
		f 3 3135 3136 -3109
		mu 0 3 1475 1487 1476
		f 3 -3137 3137 3138
		mu 0 3 1476 1487 1488
		f 3 3139 3140 3141
		mu 0 3 1489 1490 1481
		f 3 -3141 3142 -3124
		mu 0 3 1481 1490 1482
		f 3 -3033 3143 -3115
		mu 0 3 1436 1439 1477
		f 3 -3144 3144 3145
		mu 0 3 1477 1439 1491
		f 3 3146 3147 -3138
		mu 0 3 1487 1492 1488
		f 3 -3148 3148 3149
		mu 0 3 1488 1492 1493
		f 3 -3123 3150 -3039
		mu 0 3 1438 1480 1442
		f 3 -3151 3151 3152
		mu 0 3 1442 1480 1494
		f 3 -3106 3153 3154
		mu 0 3 1473 1474 1489
		f 3 -3154 3155 -3140
		mu 0 3 1489 1474 1490
		f 3 -3135 3156 3157
		mu 0 3 1485 1486 1495
		f 3 -3157 3158 3159
		mu 0 3 1495 1486 1496
		f 3 -3045 3160 -3065
		mu 0 3 1445 1446 1452
		f 3 -3161 3161 3162
		mu 0 3 1452 1446 1497
		f 3 -3153 3163 -3048
		mu 0 3 1442 1494 1429
		f 3 -3164 3164 -3087
		mu 0 3 1429 1494 1463
		f 3 -3160 3165 3166
		mu 0 3 1495 1496 1498
		f 3 -3166 3167 -3149
		mu 0 3 1498 1496 1499
		f 3 3168 3169 -3076
		mu 0 3 1457 1497 1421
		f 3 -3170 -3162 -3054
		mu 0 3 1421 1497 1446
		f 3 -3055 3170 -3145
		mu 0 3 1439 1427 1491
		f 3 -3171 -3090 3171
		mu 0 3 1491 1427 1464
		f 3 -3070 3172 -3059
		mu 0 3 1449 1454 1425
		f 3 -3173 3173 -3083
		mu 0 3 1425 1454 1461
		f 3 -2954 3174 3175
		mu 0 3 1387 1388 1383
		f 3 -3175 -2912 -2948
		mu 0 3 1383 1388 1384
		f 3 3176 3177 -2987
		mu 0 3 1408 1355 1410
		f 3 -3178 -2916 -2832
		mu 0 3 1410 1355 1357
		f 3 3178 3179 -2920
		mu 0 3 1359 1361 1360
		f 3 -3180 -2923 -2862
		mu 0 3 1360 1361 1363
		f 3 -2947 3180 3181
		mu 0 3 1381 1382 1377
		f 3 -3181 -2857 -2941
		mu 0 3 1377 1382 1378
		f 3 3182 3183 -3105
		mu 0 3 1500 1389 1501
		f 3 -3184 -2957 3184
		mu 0 3 1501 1389 1385
		f 3 3185 3186 -3113
		mu 0 3 1502 1399 1500
		f 3 -3187 -2983 -3183
		mu 0 3 1500 1399 1389
		f 3 3187 3188 -3066
		mu 0 3 1503 1391 1502
		f 3 -3189 -2969 -3186
		mu 0 3 1502 1391 1399
		f 3 -3163 3189 -3188
		mu 0 3 1503 1504 1391
		f 3 -3190 3190 -2958
		mu 0 3 1391 1504 1392
		f 3 -3169 3191 -3191
		mu 0 3 1504 1505 1392
		f 3 -3192 3192 -2962
		mu 0 3 1392 1505 1395
		f 3 -3078 3193 -3193
		mu 0 3 1505 1506 1395
		f 3 -3194 3194 -2965
		mu 0 3 1395 1506 1397
		f 3 -3093 3195 -3195
		mu 0 3 1506 1507 1397
		f 3 -3196 3196 -2980
		mu 0 3 1397 1507 1401
		f 3 -3116 3197 -3197
		mu 0 3 1507 1508 1401
		f 3 -3198 3198 -2971
		mu 0 3 1401 1508 1402
		f 3 3199 3200 -3146
		mu 0 3 1509 1405 1508
		f 3 -3201 -2977 -3199
		mu 0 3 1508 1405 1402
		f 3 3201 3202 -3172
		mu 0 3 1510 1371 1509
		f 3 -3203 -2979 -3200
		mu 0 3 1509 1371 1405
		f 3 -3089 3203 -3202
		mu 0 3 1510 1511 1371
		f 3 -3204 3204 -2932
		mu 0 3 1371 1511 1365
		f 3 -3165 3205 -3205
		mu 0 3 1511 1512 1365
		f 3 -3206 3206 -2925
		mu 0 3 1365 1512 1366
		f 3 3207 3208 -3152
		mu 0 3 1513 1369 1512
		f 3 -3209 -2931 -3207
		mu 0 3 1512 1369 1366
		f 3 3209 3210 -3122
		mu 0 3 1514 1373 1513
		f 3 -3211 -2937 -3208
		mu 0 3 1513 1373 1369
		f 3 3211 3212 -3100
		mu 0 3 1515 1375 1514
		f 3 -3213 -2940 -3210
		mu 0 3 1514 1375 1373
		f 3 3213 3214 -3085
		mu 0 3 1516 1413 1515
		f 3 -3215 -2993 -3212
		mu 0 3 1515 1413 1375
		f 3 3215 3216 -3174
		mu 0 3 1517 1415 1516
		f 3 -3217 -2996 -3214
		mu 0 3 1516 1415 1413
		f 3 -3069 3217 -3216
		mu 0 3 1517 1518 1415
		f 3 -3218 3218 -2997
		mu 0 3 1415 1518 1417
		f 3 -3074 3219 -3219
		mu 0 3 1518 1519 1417
		f 3 -3220 3220 -3000
		mu 0 3 1417 1519 1411
		f 3 -3082 3221 -3221
		mu 0 3 1519 1520 1411
		f 3 -3222 3222 -2988
		mu 0 3 1411 1520 1407
		f 3 -3120 3223 -3223
		mu 0 3 1520 1521 1407
		f 3 -3224 3224 -2984
		mu 0 3 1407 1521 1408
		f 3 -3177 3225 3226
		mu 0 3 1355 1408 1522
		f 3 -3226 -3225 -3131
		mu 0 3 1522 1408 1521
		f 3 -3098 3227 -3227
		mu 0 3 1522 1523 1355
		f 3 -3228 3228 -2914
		mu 0 3 1355 1523 1356
		f 3 -3110 3229 -3229
		mu 0 3 1523 1524 1356
		f 3 -3230 3230 -2918
		mu 0 3 1356 1524 1359
		f 3 -3139 3231 -3231
		mu 0 3 1524 1525 1359
		f 3 -3232 3232 -3179
		mu 0 3 1359 1525 1361
		f 3 -3150 3233 -3233
		mu 0 3 1525 1526 1361
		f 3 -3234 3234 -2921
		mu 0 3 1361 1526 1362
		f 3 3235 3236 -3168
		mu 0 3 1527 1377 1526
		f 3 -3237 -2943 -3235
		mu 0 3 1526 1377 1362
		f 3 3237 3238 -3159
		mu 0 3 1528 1381 1527
		f 3 -3239 -3182 -3236
		mu 0 3 1527 1381 1377
		f 3 3239 3240 -3134
		mu 0 3 1529 1379 1528
		f 3 -3241 -2946 -3238
		mu 0 3 1528 1379 1381
		f 3 3241 3242 -3127
		mu 0 3 1530 1383 1529
		f 3 -3243 -2950 -3240
		mu 0 3 1529 1383 1379
		f 3 3243 3244 -3143
		mu 0 3 1531 1387 1530
		f 3 -3245 -3176 -3242
		mu 0 3 1530 1387 1383
		f 3 -3185 3245 -3156
		mu 0 3 1501 1385 1531
		f 3 -3246 -2953 -3244
		mu 0 3 1531 1385 1387
		f 3 3246 3247 3248
		mu 0 3 1532 1533 1534
		f 3 3249 3250 3251
		mu 0 3 1535 1536 1537
		f 3 3252 3253 3254
		mu 0 3 1538 1539 1540
		f 3 3255 3256 -3254
		mu 0 3 1539 1541 1540
		f 3 3257 3258 3259
		mu 0 3 1542 1543 1544
		f 3 3260 3261 3262
		mu 0 3 1545 1546 1547
		f 3 3263 3264 -3262
		mu 0 3 1546 1548 1547
		f 3 3265 3266 3267
		mu 0 3 1549 1550 1551
		f 3 3268 3269 3270
		mu 0 3 1552 1553 1548
		f 3 3271 3272 -3270
		mu 0 3 1553 1554 1548
		f 3 -3266 3273 3274
		mu 0 3 1550 1549 1555
		f 3 3275 3276 -3274
		mu 0 3 1549 1556 1555
		f 3 3277 3278 -3258
		mu 0 3 1542 1557 1543
		f 3 3279 3280 -3279
		mu 0 3 1557 1536 1543
		f 3 -3251 3281 3282
		mu 0 3 1537 1536 1558
		f 3 3283 3284 -3282
		mu 0 3 1536 1559 1558
		f 3 3285 3286 3287
		mu 0 3 1560 1556 1561
		f 3 3288 3289 -3287
		mu 0 3 1556 1562 1561
		f 3 3290 3291 -3289
		mu 0 3 1556 1563 1562
		f 3 3292 3293 -3250
		mu 0 3 1535 1564 1536
		f 3 3294 -3281 -3294
		mu 0 3 1564 1543 1536
		f 3 3295 3296 3297
		mu 0 3 1565 1566 1543
		f 3 3298 3299 -3297
		mu 0 3 1566 1538 1543
		f 3 3300 3301 3302
		mu 0 3 1567 1568 1569
		f 3 3303 3304 -3302
		mu 0 3 1568 1570 1569
		f 3 3305 3306 3307
		mu 0 3 1571 1572 1573
		f 3 3308 3309 -3253
		mu 0 3 1538 1574 1539
		f 3 3310 3311 -3299
		mu 0 3 1566 1575 1538
		f 3 -3298 3312 3313
		mu 0 3 1565 1543 1576
		f 3 3314 3315 -3295
		mu 0 3 1564 1577 1543
		f 3 -3316 3316 -3313
		mu 0 3 1543 1577 1576
		f 3 3317 3318 3319
		mu 0 3 1539 1568 1578
		f 3 3320 3321 -3319
		mu 0 3 1568 1579 1578
		f 3 -3320 3322 -3256
		mu 0 3 1539 1578 1541
		f 3 3323 3324 3325
		mu 0 3 1580 1581 1567
		f 3 3326 -3301 -3325
		mu 0 3 1581 1568 1567
		f 3 3327 3328 3329
		mu 0 3 1582 1580 1583
		f 3 -3326 3330 -3329
		mu 0 3 1580 1567 1583
		f 3 3331 3332 -3330
		mu 0 3 1583 1584 1582
		f 3 3333 3334 3335
		mu 0 3 1585 1586 1587
		f 3 3336 3337 3338
		mu 0 3 1588 1589 1590
		f 3 3339 3340 -3276
		mu 0 3 1549 1591 1556
		f 3 3341 3342 -3341
		mu 0 3 1591 1592 1556
		f 3 3343 -3343 3344
		mu 0 3 1593 1556 1592
		f 3 -3264 3345 3346
		mu 0 3 1548 1546 1557
		f 3 3347 -3280 -3346
		mu 0 3 1546 1536 1557
		f 3 3348 3349 -3347
		mu 0 3 1557 1594 1548
		f 3 3350 3351 -3350
		mu 0 3 1594 1549 1548
		f 3 -3351 3352 -3340
		mu 0 3 1549 1594 1591
		f 3 3353 3354 3355
		mu 0 3 1534 1595 1596
		f 3 3356 3357 3358
		mu 0 3 1597 1571 1596
		f 3 3359 3360 3361
		mu 0 3 1598 1599 1600
		f 3 -3361 3362 3363
		mu 0 3 1600 1599 1601
		f 3 3364 3365 3366
		mu 0 3 1602 1600 1603
		f 3 -3366 3367 3368
		mu 0 3 1603 1600 1604
		f 3 3369 3370 -3364
		mu 0 3 1601 1605 1600
		f 3 3371 3372 -3371
		mu 0 3 1605 1606 1600
		f 3 -3368 3373 3374
		mu 0 3 1604 1600 1607
		f 3 -3373 3375 -3374
		mu 0 3 1600 1606 1607
		f 3 3376 3377 3378
		mu 0 3 1608 1609 1610
		f 3 3379 3380 -3378
		mu 0 3 1609 1611 1610
		f 3 3381 3382 -3335
		mu 0 3 1612 1613 1614
		f 3 3383 3384 -3383
		mu 0 3 1613 1615 1614
		f 3 3385 3386 -3367
		mu 0 3 1616 1617 1618
		f 3 3387 3388 -3387
		mu 0 3 1617 1619 1618
		f 3 3389 3390 3391
		mu 0 3 1620 1621 1622
		f 3 3392 3393 -3391
		mu 0 3 1621 1623 1622
		f 3 3394 3395 3396
		mu 0 3 1624 1625 1626
		f 3 3397 3398 -3396
		mu 0 3 1625 1627 1626
		f 3 3399 3400 3401
		mu 0 3 1628 1629 1630
		f 3 3402 3403 -3401
		mu 0 3 1629 1631 1630
		f 3 3404 3405 3406
		mu 0 3 1632 1633 1634
		f 3 3407 3408 -3406
		mu 0 3 1633 1635 1634
		f 3 3409 3410 -3355
		mu 0 3 1595 1598 1596
		f 3 -3362 3411 -3411
		mu 0 3 1598 1600 1596
		f 3 -3272 3412 3413
		mu 0 3 1636 1637 1638
		f 3 3414 3415 -3413
		mu 0 3 1637 1639 1638
		f 3 3416 3417 3418
		mu 0 3 1640 1641 1642
		f 3 -3339 3419 -3418
		mu 0 3 1641 1643 1642
		f 3 3420 3421 -3357
		mu 0 3 1644 1645 1646
		f 3 3422 3423 -3422
		mu 0 3 1645 1647 1646
		f 3 3424 3425 3426
		mu 0 3 1648 1649 1650
		f 3 3427 -3252 -3426
		mu 0 3 1649 1651 1650
		f 3 3428 3429 3430
		mu 0 3 1652 1653 1654
		f 3 3431 3432 -3430
		mu 0 3 1653 1655 1654
		f 3 3433 3434 3435
		mu 0 3 1656 1657 1658
		f 3 3436 3437 -3435
		mu 0 3 1657 1659 1658
		f 3 3438 3439 3440
		mu 0 3 1660 1661 1662
		f 3 3441 3442 -3440
		mu 0 3 1661 1663 1662
		f 3 3443 3444 3445
		mu 0 3 1664 1665 1666
		f 3 3446 3447 -3445
		mu 0 3 1665 1667 1666
		f 3 3448 3449 3450
		mu 0 3 1668 1669 1632
		f 3 3451 -3405 -3450
		mu 0 3 1669 1633 1632
		f 3 -3268 3452 -3352
		mu 0 3 1549 1551 1548
		f 3 -3377 -3271 -3453
		mu 0 3 1551 1552 1548
		f 3 -3269 3453 -3415
		mu 0 3 1637 1608 1639
		f 3 -3379 3454 -3454
		mu 0 3 1608 1610 1639
		f 3 -3420 3455 3456
		mu 0 3 1642 1643 1615
		f 3 3457 -3385 -3456
		mu 0 3 1643 1614 1615
		f 3 -3389 3458 3459
		mu 0 3 1618 1619 1644
		f 3 3460 -3421 -3459
		mu 0 3 1619 1645 1644
		f 3 3461 3462 -3331
		mu 0 3 1670 1671 1672
		f 3 3463 3464 -3463
		mu 0 3 1671 1673 1672
		f 3 -3312 3465 3466
		mu 0 3 1538 1575 1532
		f 3 3467 -3247 -3466
		mu 0 3 1575 1533 1532
		f 3 3468 3469 -3432
		mu 0 3 1653 1621 1655
		f 3 -3390 3470 -3470
		mu 0 3 1621 1620 1655
		f 3 -3399 3471 3472
		mu 0 3 1626 1627 1656
		f 3 3473 -3434 -3472
		mu 0 3 1627 1657 1656
		f 3 -3404 3474 3475
		mu 0 3 1630 1631 1660
		f 3 3476 -3439 -3475
		mu 0 3 1631 1661 1660
		f 3 3477 3478 3479
		mu 0 3 1674 1589 1675
		f 3 -3337 3480 -3479
		mu 0 3 1589 1588 1675
		f 3 3481 3482 -3433
		mu 0 3 1655 1676 1654
		f 3 3483 3484 -3483
		mu 0 3 1676 1677 1654
		f 3 3485 3486 3487
		mu 0 3 1678 1636 1679
		f 3 -3414 3488 -3487
		mu 0 3 1636 1638 1679
		f 3 -3417 3489 -3481
		mu 0 3 1641 1640 1680
		f 3 3490 3491 -3490
		mu 0 3 1640 1681 1680
		f 3 -3424 3492 -3306
		mu 0 3 1646 1647 1682
		f 3 3493 3494 -3493
		mu 0 3 1647 1683 1682
		f 3 -3293 3495 3496
		mu 0 3 1684 1651 1685
		f 3 -3428 3497 -3496
		mu 0 3 1651 1649 1685
		f 3 -3467 3498 -3309
		mu 0 3 1538 1532 1574
		f 3 3499 3500 -3499
		mu 0 3 1532 1686 1574
		f 3 3501 3502 3503
		mu 0 3 1687 1652 1688
		f 3 -3431 3504 -3503
		mu 0 3 1652 1654 1688
		f 3 -3438 3505 3506
		mu 0 3 1658 1659 1689
		f 3 3507 3508 -3506
		mu 0 3 1659 1690 1689
		f 3 -3443 3509 3510
		mu 0 3 1662 1663 1691
		f 3 3511 3512 -3510
		mu 0 3 1663 1692 1691
		f 3 3513 3514 -3338
		mu 0 3 1589 1585 1590
		f 3 -3336 -3458 -3515
		mu 0 3 1585 1587 1590
		f 3 -3505 3515 3516
		mu 0 3 1688 1654 1693
		f 3 -3485 3517 -3516
		mu 0 3 1654 1677 1693
		f 3 -3285 3518 3519
		mu 0 3 1694 1695 1696
		f 3 3520 3521 -3519
		mu 0 3 1695 1697 1696
		f 3 3522 3523 -3292
		mu 0 3 1698 1699 1700
		f 3 3524 3525 -3524
		mu 0 3 1699 1701 1700
		f 3 3526 3527 3528
		mu 0 3 1702 1703 1704
		f 3 3529 3530 -3528
		mu 0 3 1703 1705 1704
		f 3 -3296 3531 3532
		mu 0 3 1706 1707 1708
		f 3 3533 3534 -3532
		mu 0 3 1707 1709 1708
		f 3 3535 3536 3537
		mu 0 3 1665 1710 1711
		f 3 -3398 3538 -3537
		mu 0 3 1710 1712 1711
		f 3 3539 3540 -3407
		mu 0 3 1634 1713 1632
		f 3 -3403 3541 -3541
		mu 0 3 1713 1714 1632
		f 3 3542 3543 3544
		mu 0 3 1715 1716 1717
		f 3 -3393 3545 -3544
		mu 0 3 1716 1718 1717
		f 3 3546 3547 3548
		mu 0 3 1711 1719 1720
		f 3 3549 3550 -3548
		mu 0 3 1719 1721 1720
		f 3 3551 3552 -3334
		mu 0 3 1585 1722 1586
		f 3 3553 3554 -3553
		mu 0 3 1722 1723 1586
		f 3 3555 3556 3557
		mu 0 3 1724 1725 1726
		f 3 3558 3559 -3557
		mu 0 3 1725 1727 1726
		f 3 3560 3561 -3471
		mu 0 3 1620 1728 1655
		f 3 3562 -3482 -3562
		mu 0 3 1728 1676 1655
		f 3 3563 -3277 -3286
		mu 0 3 1560 1555 1556
		f 3 -3348 3564 -3284
		mu 0 3 1536 1546 1559
		f 3 -3261 3565 -3565
		mu 0 3 1546 1545 1559
		f 3 -3263 3566 3567
		mu 0 3 1729 1678 1730
		f 3 -3488 3568 -3567
		mu 0 3 1678 1679 1730
		f 3 -3492 3569 3570
		mu 0 3 1680 1681 1731
		f 3 3571 3572 -3570
		mu 0 3 1681 1732 1731
		f 3 -3370 3573 3574
		mu 0 3 1733 1734 1735
		f 3 3575 3576 -3574
		mu 0 3 1734 1736 1735
		f 3 -3317 3577 3578
		mu 0 3 1737 1738 1739
		f 3 3579 3580 -3578
		mu 0 3 1738 1740 1739
		f 3 -3468 3581 3582
		mu 0 3 1741 1742 1743
		f 3 3583 3584 -3582
		mu 0 3 1742 1744 1743
		f 3 3585 3586 3587
		mu 0 3 1745 1687 1719
		f 3 -3504 3588 -3587
		mu 0 3 1687 1688 1719
		f 3 -3509 3589 3590
		mu 0 3 1689 1690 1746
		f 3 3591 3592 -3590
		mu 0 3 1690 1747 1746
		f 3 -3513 3593 3594
		mu 0 3 1691 1692 1748
		f 3 3595 3596 -3594
		mu 0 3 1692 1749 1748
		f 3 -3538 3597 -3447
		mu 0 3 1665 1711 1667
		f 3 -3549 3598 -3598
		mu 0 3 1711 1720 1667
		f 3 -3560 3599 3600
		mu 0 3 1726 1727 1750
		f 3 3601 3602 -3600
		mu 0 3 1727 1751 1750
		f 3 -3486 -3265 -3273
		mu 0 3 1554 1547 1548
		f 3 -3315 3603 -3580
		mu 0 3 1738 1684 1740
		f 3 -3497 3604 -3604
		mu 0 3 1684 1685 1740
		f 3 3605 3606 -3288
		mu 0 3 1752 1753 1754
		f 3 3607 3608 -3607
		mu 0 3 1753 1755 1754
		f 3 3609 3610 3611
		mu 0 3 1756 1757 1758
		f 3 3612 3613 -3611
		mu 0 3 1757 1759 1758
		f 3 -3248 3614 3615
		mu 0 3 1760 1741 1761
		f 3 -3583 3616 -3615
		mu 0 3 1741 1743 1761
		f 3 3617 3618 -3303
		mu 0 3 1762 1763 1670
		f 3 3619 -3462 -3619
		mu 0 3 1763 1671 1670
		f 3 -3437 3620 3621
		mu 0 3 1764 1765 1766
		f 3 3622 3623 -3621
		mu 0 3 1765 1664 1766
		f 3 3624 3625 -3558
		mu 0 3 1726 1767 1724
		f 3 -3442 3626 -3626
		mu 0 3 1767 1768 1724
		f 3 3627 3628 3629
		mu 0 3 1769 1770 1771
		f 3 -3429 3630 -3629
		mu 0 3 1770 1772 1771
		f 3 3631 3632 -3517
		mu 0 3 1693 1721 1688
		f 3 -3550 -3589 -3633
		mu 0 3 1721 1719 1688
		f 3 3633 3634 3635
		mu 0 3 1766 1773 1774
		f 3 3636 3637 -3635
		mu 0 3 1773 1775 1774
		f 3 -3392 3638 -3561
		mu 0 3 1620 1622 1728
		f 3 3639 3640 -3639
		mu 0 3 1622 1776 1728
		f 3 -3527 -3372 3641
		mu 0 3 1777 1606 1605
		f 3 -3566 3642 -3521
		mu 0 3 1695 1729 1697
		f 3 -3568 3643 -3643
		mu 0 3 1729 1730 1697
		f 3 -3523 3644 3645
		mu 0 3 1699 1698 1732
		f 3 3646 -3573 -3645
		mu 0 3 1698 1731 1732
		f 3 -3642 3647 -3530
		mu 0 3 1703 1733 1705
		f 3 -3575 3648 -3648
		mu 0 3 1733 1735 1705
		f 3 -3314 3649 -3534
		mu 0 3 1707 1737 1709
		f 3 -3579 3650 -3650
		mu 0 3 1737 1739 1709
		f 3 -3311 3651 -3584
		mu 0 3 1742 1706 1744
		f 3 -3533 3652 -3652
		mu 0 3 1706 1708 1744
		f 3 3653 3654 -3539
		mu 0 3 1712 1745 1711
		f 3 -3588 -3547 -3655
		mu 0 3 1745 1719 1711
		f 3 -3542 3655 -3451
		mu 0 3 1632 1714 1668
		f 3 3656 3657 -3656
		mu 0 3 1714 1778 1668
		f 3 -3597 3658 3659
		mu 0 3 1748 1749 1715
		f 3 3660 -3543 -3659
		mu 0 3 1749 1716 1715
		f 3 -3321 -3327 3661
		mu 0 3 1579 1568 1581
		f 3 -3638 3662 3663
		mu 0 3 1774 1775 1668
		f 3 3664 -3449 -3663
		mu 0 3 1775 1669 1668
		f 3 -3255 3665 -3300
		mu 0 3 1538 1540 1543
		f 3 3666 -3259 -3666
		mu 0 3 1540 1544 1543
		f 3 3667 3668 3669
		mu 0 3 1570 1574 1573
		f 3 -3501 3670 -3669
		mu 0 3 1574 1686 1573
		f 3 -3360 3671 3672
		mu 0 3 1779 1780 1781
		f 3 3673 3674 -3672
		mu 0 3 1780 1782 1781
		f 3 3675 3676 -3275
		mu 0 3 1783 1784 1785
		f 3 3677 3678 -3677
		mu 0 3 1784 1786 1785
		f 3 3679 3680 3681
		mu 0 3 1787 1788 1789
		f 3 3682 3683 -3681
		mu 0 3 1788 1790 1789
		f 3 3684 3685 -3369
		mu 0 3 1791 1792 1616
		f 3 3686 -3386 -3686
		mu 0 3 1792 1617 1616
		f 3 -3495 3687 3688
		mu 0 3 1682 1683 1762
		f 3 3689 -3618 -3688
		mu 0 3 1683 1763 1762
		f 3 -3592 3690 -3658
		mu 0 3 1778 1793 1668
		f 3 3691 -3664 -3691
		mu 0 3 1793 1774 1668
		f 3 -3596 3692 3693
		mu 0 3 1794 1795 1796
		f 3 3694 3695 -3693
		mu 0 3 1795 1750 1796
		f 3 3696 3697 3698
		mu 0 3 1797 1798 1799
		f 3 -3586 3699 -3698
		mu 0 3 1798 1800 1799
		f 3 -3624 3700 -3634
		mu 0 3 1766 1664 1773
		f 3 -3446 3701 -3701
		mu 0 3 1664 1666 1773
		f 3 -3571 3702 -3480
		mu 0 3 1675 1801 1674
		f 3 3703 3704 -3703
		mu 0 3 1801 1593 1674
		f 3 3705 3706 -3671
		mu 0 3 1686 1596 1573
		f 3 -3358 -3308 -3707
		mu 0 3 1596 1571 1573
		f 3 -3283 3707 -3427
		mu 0 3 1650 1694 1648
		f 3 -3520 3708 -3708
		mu 0 3 1694 1696 1648
		f 3 -3526 3709 -3290
		mu 0 3 1700 1701 1752
		f 3 3710 -3606 -3710
		mu 0 3 1701 1753 1752
		f 3 -3529 3711 3712
		mu 0 3 1802 1803 1756
		f 3 3713 -3610 -3712
		mu 0 3 1803 1757 1756
		f 3 -3623 3714 -3444
		mu 0 3 1664 1765 1665
		f 3 -3474 -3536 -3715
		mu 0 3 1765 1710 1665
		f 3 -3477 3715 -3627
		mu 0 3 1768 1713 1724
		f 3 -3540 3716 -3716
		mu 0 3 1713 1634 1724
		f 3 -3546 3717 3718
		mu 0 3 1717 1718 1769
		f 3 -3469 -3628 -3718
		mu 0 3 1718 1770 1769
		f 3 -3612 -3376 -3713
		mu 0 3 1804 1607 1606
		f 3 -3363 3719 -3576
		mu 0 3 1734 1779 1736
		f 3 -3673 3720 -3720
		mu 0 3 1779 1781 1736
		f 3 -3679 3721 -3267
		mu 0 3 1785 1786 1805
		f 3 3722 -3380 -3722
		mu 0 3 1786 1806 1805
		f 3 -3684 3723 -3555
		mu 0 3 1789 1790 1612
		f 3 3724 -3382 -3724
		mu 0 3 1790 1613 1612
		f 3 -3614 3725 -3375
		mu 0 3 1758 1759 1791
		f 3 3726 -3685 -3726
		mu 0 3 1759 1792 1791
		f 3 -3661 3727 -3394
		mu 0 3 1623 1794 1622
		f 3 -3694 3728 -3728
		mu 0 3 1794 1796 1622
		f 3 -3700 3729 3730
		mu 0 3 1807 1808 1624
		f 3 -3654 -3395 -3730
		mu 0 3 1808 1625 1624
		f 3 -3593 3731 3732
		mu 0 3 1746 1747 1628
		f 3 -3657 -3400 -3732
		mu 0 3 1747 1629 1628
		f 3 -3647 3733 -3704
		mu 0 3 1801 1563 1593
		f 3 -3291 -3344 -3734
		mu 0 3 1563 1556 1593
		f 3 -3603 3734 -3696
		mu 0 3 1750 1751 1796
		f 3 3735 3736 -3735
		mu 0 3 1751 1809 1796
		f 3 -3365 3737 -3412
		mu 0 3 1600 1602 1596
		f 3 -3460 -3359 -3738
		mu 0 3 1602 1597 1596
		f 3 -3318 3738 -3304
		mu 0 3 1568 1539 1570
		f 3 -3310 -3668 -3739
		mu 0 3 1539 1574 1570
		f 3 -3410 3739 -3674
		mu 0 3 1780 1810 1782
		f 3 3740 3741 -3740
		mu 0 3 1810 1811 1782
		f 3 -3609 3742 -3564
		mu 0 3 1754 1755 1783
		f 3 3743 -3676 -3743
		mu 0 3 1755 1784 1783
		f 3 -3465 3744 -3332
		mu 0 3 1672 1673 1787
		f 3 3745 -3680 -3745
		mu 0 3 1673 1788 1787
		f 3 -3354 3746 -3741
		mu 0 3 1810 1760 1811
		f 3 -3616 3747 -3747
		mu 0 3 1760 1761 1811
		f 3 -3307 3748 -3670
		mu 0 3 1573 1572 1570
		f 3 -3689 -3305 -3749
		mu 0 3 1572 1569 1570
		f 3 -3692 3749 -3636
		mu 0 3 1774 1793 1766
		f 3 -3508 -3622 -3750
		mu 0 3 1793 1764 1766
		f 3 -3695 3750 -3601
		mu 0 3 1750 1795 1726
		f 3 -3512 -3625 -3751
		mu 0 3 1795 1767 1726
		f 3 -3631 3751 3752
		mu 0 3 1771 1772 1797
		f 3 -3502 -3697 -3752
		mu 0 3 1772 1798 1797
		f 3 -3554 3753 -3682
		mu 0 3 1723 1722 1584
		f 3 3754 -3333 -3754
		mu 0 3 1722 1582 1584
		f 3 -3409 3755 -3717
		mu 0 3 1634 1635 1724
		f 3 3756 -3556 -3756
		mu 0 3 1635 1725 1724
		f 3 -3737 3757 -3729
		mu 0 3 1796 1809 1622
		f 3 3758 -3640 -3758
		mu 0 3 1809 1776 1622
		f 3 -3500 3759 -3706
		mu 0 3 1686 1532 1596
		f 3 -3249 -3356 -3760
		mu 0 3 1532 1534 1596
		f 3 3760 3761 3762
		mu 0 3 1812 1813 1814
		f 3 3763 3764 3765
		mu 0 3 1815 1816 1817
		f 3 3766 3767 3768
		mu 0 3 1818 1819 1820
		f 3 3769 3770 -3768
		mu 0 3 1819 1821 1820
		f 3 3771 3772 3773
		mu 0 3 1822 1823 1824
		f 3 3774 3775 -3773
		mu 0 3 1823 1825 1824
		f 3 -3770 3776 -3764
		mu 0 3 1821 1819 1826
		f 3 3777 3778 -3777
		mu 0 3 1819 1827 1826
		f 3 3779 3780 3781
		mu 0 3 1828 1829 1830
		f 3 -3765 -3779 -3781
		mu 0 3 1829 1831 1830
		f 3 -3763 3782 3783
		mu 0 3 1812 1814 1832
		f 3 3784 3785 -3783
		mu 0 3 1814 1833 1832
		f 3 3786 3787 3788
		mu 0 3 1834 1835 1828
		f 3 3789 -3780 -3788
		mu 0 3 1835 1829 1828
		f 3 -3786 3790 3791
		mu 0 3 1832 1833 1836
		f 3 3792 3793 -3791
		mu 0 3 1833 1837 1836
		f 3 3794 3795 3796
		mu 0 3 1838 1839 1840
		f 3 -3776 3797 -3796
		mu 0 3 1839 1841 1840
		f 3 3798 3799 -3774
		mu 0 3 1824 1842 1822
		f 3 3800 3801 -3800
		mu 0 3 1842 1843 1822
		f 3 -3798 3802 3803
		mu 0 3 1840 1841 1834
		f 3 3804 -3787 -3803
		mu 0 3 1841 1835 1834
		f 3 3805 3806 -3801
		mu 0 3 1842 1836 1843
		f 3 -3794 3807 -3807
		mu 0 3 1836 1837 1843
		f 3 -3808 3808 3809
		mu 0 3 1844 1845 1846
		f 3 3810 3811 -3809
		mu 0 3 1845 1847 1846
		f 3 3812 3813 3814
		mu 0 3 1848 1849 1850
		f 3 -3792 3815 -3814
		mu 0 3 1849 1851 1850
		f 3 -3772 3816 3817
		mu 0 3 1852 1853 1854
		f 3 3818 3819 -3817
		mu 0 3 1853 1855 1854
		f 3 3820 3821 3822
		mu 0 3 1856 1857 1858
		f 3 3823 -3761 -3822
		mu 0 3 1857 1859 1858
		f 3 -3802 3824 -3819
		mu 0 3 1853 1844 1855
		f 3 -3810 3825 -3825
		mu 0 3 1844 1846 1855
		f 3 -3813 3826 -3784
		mu 0 3 1849 1848 1858
		f 3 3827 -3823 -3827
		mu 0 3 1848 1856 1858
		f 3 3828 3829 -3769
		mu 0 3 1820 1852 1818
		f 3 -3818 3830 -3830
		mu 0 3 1852 1854 1818
		f 3 -3762 3831 3832
		mu 0 3 1860 1859 1861
		f 3 -3824 3833 -3832
		mu 0 3 1859 1857 1861
		f 3 3834 3835 3836
		mu 0 3 1862 1863 1838
		f 3 -3799 -3795 -3836
		mu 0 3 1863 1839 1838
		f 3 -3793 3837 -3811
		mu 0 3 1845 1864 1847
		f 3 3838 3839 -3838
		mu 0 3 1864 1865 1847
		f 3 3840 3841 -3829
		mu 0 3 1866 1867 1823
		f 3 -3805 -3775 -3842
		mu 0 3 1867 1825 1823
		f 3 -3816 3842 3843
		mu 0 3 1850 1851 1862
		f 3 -3806 -3835 -3843
		mu 0 3 1851 1863 1862
		f 3 -3785 3844 -3839
		mu 0 3 1864 1860 1865
		f 3 -3833 3845 -3845
		mu 0 3 1860 1861 1865
		f 3 -3766 3846 -3771
		mu 0 3 1815 1817 1866
		f 3 -3790 -3841 -3847
		mu 0 3 1817 1867 1866;
	setAttr ".fc[2500:2999]"
		f 3 3847 3848 3849
		mu 0 3 1868 1869 1870
		f 3 3850 3851 -3849
		mu 0 3 1869 1871 1870
		f 3 -3851 3852 3853
		mu 0 3 1871 1869 1872
		f 3 3854 3855 -3853
		mu 0 3 1869 1873 1872
		f 3 -3855 3856 3857
		mu 0 3 1873 1869 1874
		f 3 3858 3859 -3857
		mu 0 3 1869 1875 1874
		f 3 -3859 3860 3861
		mu 0 3 1875 1869 1876
		f 3 3862 3863 -3861
		mu 0 3 1869 1877 1876
		f 3 3864 -3863 -3848
		mu 0 3 1868 1877 1869
		f 3 3865 3866 3867
		mu 0 3 1878 1879 1880
		f 3 3868 3869 -3867
		mu 0 3 1879 1881 1880
		f 3 -3868 3870 3871
		mu 0 3 1878 1880 1882
		f 3 3872 3873 -3871
		mu 0 3 1880 1883 1882
		f 3 -3873 3874 3875
		mu 0 3 1883 1880 1884
		f 3 3876 3877 -3875
		mu 0 3 1880 1885 1884
		f 3 -3877 3878 3879
		mu 0 3 1885 1880 1886
		f 3 3880 3881 -3879
		mu 0 3 1880 1887 1886
		f 3 3882 -3881 -3870
		mu 0 3 1881 1887 1880
		f 3 3883 3884 3885
		mu 0 3 1888 1889 1890
		f 3 3886 3887 -3885
		mu 0 3 1889 1891 1890
		f 3 3888 3889 -3886
		mu 0 3 1890 1892 1888
		f 3 3890 3891 -3890
		mu 0 3 1892 1893 1888
		f 3 3892 3893 -3891
		mu 0 3 1892 1894 1893
		f 3 3894 3895 -3894
		mu 0 3 1894 1895 1893
		f 3 3896 3897 3898
		mu 0 3 1896 1897 1898
		f 3 3899 3900 -3898
		mu 0 3 1897 1899 1898
		f 3 3901 3902 -3899
		mu 0 3 1898 1891 1896
		f 3 -3887 3903 -3903
		mu 0 3 1891 1889 1896
		f 3 3904 3905 -3900
		mu 0 3 1897 1900 1899
		f 3 3906 3907 -3906
		mu 0 3 1900 1901 1899
		f 3 3908 3909 -3907
		mu 0 3 1900 1902 1901
		f 3 3910 3911 -3910
		mu 0 3 1902 1903 1901
		f 3 3912 3913 -3911
		mu 0 3 1902 1904 1903
		f 3 3914 3915 -3914
		mu 0 3 1904 1905 1903
		f 3 3916 3917 -3915
		mu 0 3 1904 1906 1905
		f 3 3918 3919 -3918
		mu 0 3 1906 1907 1905
		f 3 3920 3921 -3919
		mu 0 3 1906 1908 1907
		f 3 3922 3923 -3922
		mu 0 3 1908 1909 1907
		f 3 3924 3925 -3923
		mu 0 3 1910 1911 1912
		f 3 3926 3927 -3926
		mu 0 3 1911 1913 1912
		f 3 3928 3929 -3927
		mu 0 3 1911 1914 1913
		f 3 3930 3931 -3930
		mu 0 3 1914 1915 1913
		f 3 3932 3933 -3931
		mu 0 3 1914 1916 1915
		f 3 3934 3935 -3934
		mu 0 3 1916 1917 1915
		f 3 3936 3937 -3935
		mu 0 3 1916 1918 1917
		f 3 3938 3939 -3938
		mu 0 3 1918 1919 1917
		f 3 3940 3941 -3939
		mu 0 3 1918 1920 1919
		f 3 3942 3943 -3942
		mu 0 3 1920 1921 1919
		f 3 3944 3945 -3943
		mu 0 3 1920 1922 1921
		f 3 3946 3947 -3946
		mu 0 3 1922 1923 1921
		f 3 3948 3949 -3947
		mu 0 3 1922 1924 1923
		f 3 3950 3951 -3950
		mu 0 3 1924 1925 1923
		f 3 3952 3953 -3895
		mu 0 3 1894 1925 1895
		f 3 -3951 3954 -3954
		mu 0 3 1925 1924 1895
		f 3 3955 3956 -3892
		mu 0 3 1926 1871 1927
		f 3 -3904 3957 3958
		mu 0 3 1928 1929 1872
		f 3 3959 3960 -3905
		mu 0 3 1930 1873 1931
		f 3 3961 3962 -3913
		mu 0 3 1932 1874 1933
		f 3 -3921 3963 3964
		mu 0 3 1934 1935 1875
		f 3 -3929 3965 3966
		mu 0 3 1936 1937 1876
		f 3 3967 3968 -3937
		mu 0 3 1938 1877 1939
		f 3 -3945 3969 3970
		mu 0 3 1940 1941 1868
		f 3 3971 3972 -3955
		mu 0 3 1942 1870 1943
		f 3 -3933 3973 -3968
		mu 0 3 1938 1936 1877
		f 3 -3967 -3864 -3974
		mu 0 3 1936 1876 1877
		f 3 3974 3975 -3924
		mu 0 3 1909 1944 1907
		f 3 3976 3977 -3976
		mu 0 3 1944 1945 1907
		f 3 -3966 3978 -3862
		mu 0 3 1876 1937 1875
		f 3 -3925 -3965 -3979
		mu 0 3 1937 1934 1875
		f 3 3979 3980 -3916
		mu 0 3 1905 1946 1903
		f 3 3981 3982 -3981
		mu 0 3 1946 1947 1903
		f 3 -3980 3983 3984
		mu 0 3 1946 1905 1945
		f 3 -3920 -3978 -3984
		mu 0 3 1905 1907 1945
		f 3 3985 3986 3987
		mu 0 3 1948 1901 1947
		f 3 -3912 -3983 -3987
		mu 0 3 1901 1903 1947
		f 3 3988 3989 3990
		mu 0 3 1949 1894 1950
		f 3 -3893 3991 -3990
		mu 0 3 1894 1892 1950
		f 3 -3964 3992 -3860
		mu 0 3 1875 1935 1874
		f 3 -3917 -3963 -3993
		mu 0 3 1935 1933 1874
		f 3 3993 3994 -3986
		mu 0 3 1948 1951 1901
		f 3 3995 -3908 -3995
		mu 0 3 1951 1899 1901
		f 3 3996 3997 -3989
		mu 0 3 1949 1952 1894
		f 3 3998 -3953 -3998
		mu 0 3 1952 1925 1894
		f 3 3999 4000 4001
		mu 0 3 1953 1898 1951
		f 3 -3901 -3996 -4001
		mu 0 3 1898 1899 1951
		f 3 -3952 4002 4003
		mu 0 3 1923 1925 1954
		f 3 -3999 4004 -4003
		mu 0 3 1925 1952 1954
		f 3 -3962 4005 -3858
		mu 0 3 1874 1932 1873
		f 3 -3909 -3961 -4006
		mu 0 3 1932 1931 1873
		f 3 -3956 4006 -3852
		mu 0 3 1871 1926 1870
		f 3 -3896 -3973 -4007
		mu 0 3 1926 1943 1870
		f 3 -4000 4007 -3902
		mu 0 3 1898 1953 1891
		f 3 4008 4009 -4008
		mu 0 3 1953 1955 1891
		f 3 4010 4011 -4004
		mu 0 3 1954 1956 1923
		f 3 4012 -3948 -4012
		mu 0 3 1956 1921 1923
		f 3 4013 4014 4015
		mu 0 3 1957 1915 1958
		f 3 -3936 4016 -4015
		mu 0 3 1915 1917 1958
		f 3 -3888 4017 4018
		mu 0 3 1890 1891 1959
		f 3 -4010 4019 -4018
		mu 0 3 1891 1955 1959
		f 3 -3944 4020 4021
		mu 0 3 1919 1921 1960
		f 3 -4013 4022 -4021
		mu 0 3 1921 1956 1960
		f 3 -3897 4023 -3960
		mu 0 3 1930 1928 1873
		f 3 -3959 -3856 -4024
		mu 0 3 1928 1872 1873
		f 3 -3949 4024 -3972
		mu 0 3 1942 1940 1870
		f 3 -3971 -3850 -4025
		mu 0 3 1940 1868 1870
		f 3 4025 4026 -4019
		mu 0 3 1959 1950 1890
		f 3 -3992 -3889 -4027
		mu 0 3 1950 1892 1890
		f 3 4027 4028 -4022
		mu 0 3 1960 1958 1919
		f 3 -4017 -3940 -4029
		mu 0 3 1958 1917 1919
		f 3 -3928 4029 -3975
		mu 0 3 1912 1913 1961
		f 3 4030 4031 -4030
		mu 0 3 1913 1962 1961
		f 3 -3884 4032 -3958
		mu 0 3 1929 1927 1872
		f 3 -3957 -3854 -4033
		mu 0 3 1927 1871 1872
		f 3 -3970 4033 -3865
		mu 0 3 1868 1941 1877
		f 3 -3941 -3969 -4034
		mu 0 3 1941 1939 1877
		f 3 4034 4035 -4014
		mu 0 3 1957 1962 1915
		f 3 -4031 -3932 -4036
		mu 0 3 1962 1913 1915
		f 3 4036 4037 4038
		mu 0 3 1963 1964 1965
		f 3 4039 4040 -4038
		mu 0 3 1964 1966 1965
		f 3 4041 4042 -4039
		mu 0 3 1965 1967 1963
		f 3 4043 4044 -4043
		mu 0 3 1967 1968 1963
		f 3 4045 4046 -4044
		mu 0 3 1967 1969 1968
		f 3 4047 4048 -4047
		mu 0 3 1969 1970 1968
		f 3 4049 4050 4051
		mu 0 3 1971 1972 1973
		f 3 4052 4053 -4051
		mu 0 3 1972 1974 1973
		f 3 4054 4055 -4052
		mu 0 3 1973 1966 1971
		f 3 -4040 4056 -4056
		mu 0 3 1966 1964 1971
		f 3 4057 4058 -4053
		mu 0 3 1972 1975 1974
		f 3 4059 4060 -4059
		mu 0 3 1975 1976 1974
		f 3 4061 4062 -4060
		mu 0 3 1975 1977 1976
		f 3 4063 4064 -4063
		mu 0 3 1977 1978 1976
		f 3 4065 4066 -4064
		mu 0 3 1977 1979 1978
		f 3 4067 4068 -4067
		mu 0 3 1979 1980 1978
		f 3 4069 4070 -4068
		mu 0 3 1979 1981 1980
		f 3 4071 4072 -4071
		mu 0 3 1981 1982 1980
		f 3 4073 4074 -4072
		mu 0 3 1981 1983 1982
		f 3 4075 4076 -4075
		mu 0 3 1983 1984 1982
		f 3 4077 4078 -4076
		mu 0 3 1983 1985 1984
		f 3 4079 4080 -4079
		mu 0 3 1985 1986 1984
		f 3 4081 4082 -4080
		mu 0 3 1987 1988 1989
		f 3 4083 4084 -4083
		mu 0 3 1988 1990 1989
		f 3 4085 4086 -4084
		mu 0 3 1988 1991 1990
		f 3 4087 4088 -4087
		mu 0 3 1991 1992 1990
		f 3 4089 4090 -4088
		mu 0 3 1991 1993 1992
		f 3 4091 4092 -4091
		mu 0 3 1993 1994 1992
		f 3 4093 4094 -4092
		mu 0 3 1993 1995 1994
		f 3 4095 4096 -4095
		mu 0 3 1995 1996 1994
		f 3 4097 4098 -4096
		mu 0 3 1995 1997 1996
		f 3 4099 4100 -4099
		mu 0 3 1997 1998 1996
		f 3 4101 4102 -4100
		mu 0 3 1997 1999 1998
		f 3 4103 4104 -4103
		mu 0 3 1999 2000 1998
		f 3 4105 4106 -4048
		mu 0 3 1969 2000 1970
		f 3 -4104 4107 -4107
		mu 0 3 2000 1999 1970
		f 3 -4045 4108 4109
		mu 0 3 2001 2002 1882
		f 3 4110 4111 -4057
		mu 0 3 2003 1883 2004
		f 3 4112 4113 -4058
		mu 0 3 2005 1884 2006
		f 3 4114 4115 -4066
		mu 0 3 2007 1885 2008
		f 3 -4074 4116 4117
		mu 0 3 2009 2010 1886
		f 3 -4082 4118 4119
		mu 0 3 2011 2012 1887
		f 3 4120 4121 -4090
		mu 0 3 2013 1881 2014
		f 3 -4098 4122 4123
		mu 0 3 2015 2016 1879
		f 3 -4108 4124 4125
		mu 0 3 2017 2018 1878
		f 3 -4086 4126 -4121
		mu 0 3 2013 2011 1881
		f 3 -4120 -3883 -4127
		mu 0 3 2011 1887 1881
		f 3 4127 4128 -4077
		mu 0 3 1984 2019 1982
		f 3 4129 4130 -4129
		mu 0 3 2019 2020 1982
		f 3 4131 4132 4133
		mu 0 3 2021 1980 2020
		f 3 -4073 -4131 -4133
		mu 0 3 1980 1982 2020
		f 3 -4119 4134 -3882
		mu 0 3 1887 2012 1886
		f 3 -4078 -4118 -4135
		mu 0 3 2012 2009 1886
		f 3 -4132 4135 -4069
		mu 0 3 1980 2021 1978
		f 3 4136 4137 -4136
		mu 0 3 2021 2022 1978
		f 3 4138 4139 4140
		mu 0 3 2023 1976 2022
		f 3 -4065 -4138 -4140
		mu 0 3 1976 1978 2022
		f 3 4141 4142 4143
		mu 0 3 2024 1969 2025
		f 3 -4046 4144 -4143
		mu 0 3 1969 1967 2025
		f 3 4145 4146 4147
		mu 0 3 2026 1973 2027
		f 3 -4054 4148 -4147
		mu 0 3 1973 1974 2027
		f 3 4149 4150 4151
		mu 0 3 2028 1998 2029
		f 3 -4105 4152 -4151
		mu 0 3 1998 2000 2029
		f 3 -4117 4153 -3880
		mu 0 3 1886 2010 1885
		f 3 -4070 -4116 -4154
		mu 0 3 2010 2008 1885
		f 3 4154 4155 -4139
		mu 0 3 2023 2027 1976
		f 3 -4149 -4061 -4156
		mu 0 3 2027 1974 1976
		f 3 4156 4157 -4142
		mu 0 3 2024 2029 1969
		f 3 -4153 -4106 -4158
		mu 0 3 2029 2000 1969
		f 3 -4115 4158 -3878
		mu 0 3 1885 2007 1884
		f 3 -4062 -4114 -4159
		mu 0 3 2007 2006 1884
		f 3 -4049 4159 -4109
		mu 0 3 2002 2017 1882
		f 3 -4126 -3872 -4160
		mu 0 3 2017 1878 1882
		f 3 -4146 4160 -4055
		mu 0 3 1973 2026 1966
		f 3 4161 4162 -4161
		mu 0 3 2026 2030 1966
		f 3 -4150 4163 -4101
		mu 0 3 1998 2028 1996
		f 3 4164 4165 -4164
		mu 0 3 2028 2031 1996
		f 3 4166 4167 4168
		mu 0 3 2032 1965 2030
		f 3 -4041 -4163 -4168
		mu 0 3 1965 1966 2030
		f 3 -4097 4169 4170
		mu 0 3 1994 1996 2033
		f 3 -4166 4171 -4170
		mu 0 3 1996 2031 2033
		f 3 -4050 4172 -4113
		mu 0 3 2005 2004 1884
		f 3 -4112 -3876 -4173
		mu 0 3 2004 1883 1884
		f 3 -4125 4173 -3866
		mu 0 3 1878 2018 1879
		f 3 -4102 -4124 -4174
		mu 0 3 2018 2015 1879
		f 3 4174 4175 -4167
		mu 0 3 2032 2025 1965
		f 3 -4145 -4042 -4176
		mu 0 3 2025 1967 1965
		f 3 -4171 4176 -4093
		mu 0 3 1994 2033 1992
		f 3 4177 4178 -4177
		mu 0 3 2033 2034 1992
		f 3 4179 4180 4181
		mu 0 3 2035 1990 2034
		f 3 -4089 -4179 -4181
		mu 0 3 1990 1992 2034
		f 3 -4128 4182 4183
		mu 0 3 2019 1984 2036
		f 3 -4081 4184 -4183
		mu 0 3 1984 1986 2036
		f 3 -4037 4185 -4111
		mu 0 3 2003 2001 1883
		f 3 -4110 -3874 -4186
		mu 0 3 2001 1882 1883
		f 3 -4094 4186 -4123
		mu 0 3 2016 2014 1879
		f 3 -4122 -3869 -4187
		mu 0 3 2014 1881 1879
		f 3 4187 4188 -4180
		mu 0 3 2035 2037 1990
		f 3 -4185 -4085 -4189
		mu 0 3 2037 1989 1990
		f 3 -3257 4189 4190
		mu 0 3 1540 1541 1677
		f 3 4191 -3518 -4190
		mu 0 3 1541 1693 1677
		f 3 -4191 4192 -3667
		mu 0 3 1540 1677 1544
		f 3 -3484 4193 -4193
		mu 0 3 1677 1676 1544
		f 3 -4194 4194 -3260
		mu 0 3 1544 1676 1542
		f 3 -3563 4195 -4195
		mu 0 3 1676 1728 1542
		f 3 -3278 4196 4197
		mu 0 3 1557 1542 1776
		f 3 -4196 -3641 -4197
		mu 0 3 1542 1728 1776
		f 3 -4198 4198 -3349
		mu 0 3 1557 1776 1594
		f 3 -3759 4199 -4199
		mu 0 3 1776 1809 1594
		f 3 -4200 4200 -3353
		mu 0 3 1594 1809 1591
		f 3 -3736 4201 -4201
		mu 0 3 1809 1751 1591
		f 3 -4202 4202 -3342
		mu 0 3 1591 1751 1592
		f 3 -3602 4203 -4203
		mu 0 3 1751 1727 1592
		f 3 -4204 4204 -3345
		mu 0 3 1592 1727 1593
		f 3 -3559 4205 -4205
		mu 0 3 1727 1725 1593
		f 3 -4206 4206 -3705
		mu 0 3 1593 1725 1674
		f 3 -3757 4207 -4207
		mu 0 3 1725 1635 1674
		f 3 -4208 4208 -3478
		mu 0 3 1674 1635 1589
		f 3 -3408 4209 -4209
		mu 0 3 1635 1633 1589
		f 3 -4210 4210 -3514
		mu 0 3 1589 1633 1585
		f 3 -3452 4211 -4211
		mu 0 3 1633 1669 1585
		f 3 -4212 4212 -3552
		mu 0 3 1585 1669 1722
		f 3 -3665 4213 -4213
		mu 0 3 1669 1775 1722
		f 3 -4214 4214 -3755
		mu 0 3 1722 1775 1582
		f 3 -3637 4215 -4215
		mu 0 3 1775 1773 1582
		f 3 -3328 4216 4217
		mu 0 3 1580 1582 1666
		f 3 -4216 -3702 -4217
		mu 0 3 1582 1773 1666
		f 3 -3324 4218 4219
		mu 0 3 1581 1580 1667
		f 3 -4218 -3448 -4219
		mu 0 3 1580 1666 1667
		f 3 -3662 4220 4221
		mu 0 3 1579 1581 1720
		f 3 -4220 -3599 -4221
		mu 0 3 1581 1667 1720
		f 3 -3322 4222 4223
		mu 0 3 1578 1579 1721
		f 3 -4222 -3551 -4223
		mu 0 3 1579 1720 1721
		f 3 -3323 4224 -4192
		mu 0 3 1541 1578 1693
		f 3 -4224 -3632 -4225
		mu 0 3 1578 1721 1693
		f 3 4225 4226 4227
		mu 0 3 2038 2039 2040
		f 3 4228 4229 4230
		mu 0 3 2041 2042 2043
		f 3 4231 4232 4233
		mu 0 3 2044 2045 2046
		f 3 4234 4235 -4233
		mu 0 3 2045 2047 2046
		f 3 4236 4237 4238
		mu 0 3 2048 2049 2050
		f 3 4239 4240 4241
		mu 0 3 2051 2052 2053
		f 3 4242 4243 -4241
		mu 0 3 2052 2054 2053
		f 3 4244 4245 4246
		mu 0 3 2055 2054 2056
		f 3 -4243 4247 -4246
		mu 0 3 2054 2052 2056
		f 3 -4247 4248 4249
		mu 0 3 2055 2056 2057
		f 3 4250 4251 4252
		mu 0 3 2058 2059 2060
		f 3 4253 4254 4255
		mu 0 3 2061 2062 2051
		f 3 4256 -4240 -4255
		mu 0 3 2062 2052 2051
		f 3 4257 4258 -4237
		mu 0 3 2048 2047 2049
		f 3 -4235 4259 -4259
		mu 0 3 2047 2045 2049
		f 3 4260 4261 -4254
		mu 0 3 2063 2050 2064
		f 3 -4238 4262 -4262
		mu 0 3 2050 2049 2064
		f 3 -4230 4263 4264
		mu 0 3 2043 2042 2044
		f 3 4265 -4232 -4264
		mu 0 3 2042 2045 2044
		f 3 -4227 4266 4267
		mu 0 3 2040 2039 2041
		f 3 4268 -4229 -4267
		mu 0 3 2039 2042 2041
		f 3 4269 4270 4271
		mu 0 3 2065 2066 2038
		f 3 4272 -4226 -4271
		mu 0 3 2066 2039 2038
		f 3 4273 4274 -4270
		mu 0 3 2065 2060 2066
		f 3 -4252 4275 -4275
		mu 0 3 2060 2059 2066
		f 3 4276 4277 -4251
		mu 0 3 2058 2057 2059
		f 3 -4249 4278 -4278
		mu 0 3 2057 2056 2059
		f 3 4279 4280 4281
		mu 0 3 2067 2068 2069
		f 3 4282 4283 -4281
		mu 0 3 2068 2070 2069
		f 3 4284 4285 -4257
		mu 0 3 2062 2071 2052
		f 3 4286 4287 -4286
		mu 0 3 2071 2072 2052
		f 3 4288 4289 4290
		mu 0 3 2073 2074 2075
		f 3 4291 4292 -4290
		mu 0 3 2074 2076 2075
		f 3 -4244 4293 4294
		mu 0 3 2053 2054 2077
		f 3 4295 4296 -4294
		mu 0 3 2054 2078 2077
		f 3 4297 4298 4299
		mu 0 3 2079 2080 2067
		f 3 4300 -4280 -4299
		mu 0 3 2080 2068 2067
		f 3 -4248 4301 4302
		mu 0 3 2056 2052 2081
		f 3 -4288 4303 -4302
		mu 0 3 2052 2072 2081
		f 3 4304 4305 4306
		mu 0 3 2082 2074 2083
		f 3 -4289 4307 -4306
		mu 0 3 2074 2073 2083
		f 3 -4242 4308 4309
		mu 0 3 2051 2053 2084
		f 3 -4295 4310 -4309
		mu 0 3 2053 2077 2084
		f 3 4311 4312 4313
		mu 0 3 2085 2086 2079
		f 3 4314 -4298 -4313
		mu 0 3 2086 2080 2079
		f 3 -4279 4315 4316
		mu 0 3 2059 2056 2087
		f 3 -4303 4317 -4316
		mu 0 3 2056 2081 2087
		f 3 4318 4319 4320
		mu 0 3 2088 2089 2083
		f 3 4321 -4307 -4320
		mu 0 3 2089 2082 2083
		f 3 -4256 4322 4323
		mu 0 3 2061 2051 2090
		f 3 -4310 4324 -4323
		mu 0 3 2051 2084 2090
		f 3 -4265 4325 4326
		mu 0 3 2043 2044 2091
		f 3 4327 4328 -4326
		mu 0 3 2044 2092 2091
		f 3 4329 4330 4331
		mu 0 3 2093 2094 2095
		f 3 4332 4333 -4331
		mu 0 3 2094 2086 2095
		f 3 -4276 4334 4335
		mu 0 3 2066 2059 2096
		f 3 -4317 4336 -4335
		mu 0 3 2059 2087 2096
		f 3 4337 4338 4339
		mu 0 3 2097 2089 2098
		f 3 -4319 4340 -4339
		mu 0 3 2089 2088 2098
		f 3 4341 4342 4343
		mu 0 3 2099 2100 2101
		f 3 4344 4345 -4343
		mu 0 3 2100 2102 2101
		f 3 -4261 4346 4347
		mu 0 3 2050 2063 2103
		f 3 -4324 4348 -4347
		mu 0 3 2063 2104 2103
		f 3 -4231 4349 4350
		mu 0 3 2041 2043 2105
		f 3 -4327 4351 -4350
		mu 0 3 2043 2091 2105
		f 3 4352 4353 4354
		mu 0 3 2106 2107 2108
		f 3 4355 4356 -4354
		mu 0 3 2107 2109 2108
		f 3 4357 4358 -4269
		mu 0 3 2039 2110 2042
		f 3 4359 4360 -4359
		mu 0 3 2110 2111 2042
		f 3 4361 4362 4363
		mu 0 3 2112 2113 2105
		f 3 4364 4365 -4363
		mu 0 3 2113 2114 2105
		f 3 4366 4367 4368
		mu 0 3 2115 2116 2103
		f 3 4369 4370 -4368
		mu 0 3 2116 2117 2103
		f 3 -4258 4371 4372
		mu 0 3 2047 2048 2101
		f 3 4373 4374 -4372
		mu 0 3 2048 2117 2101
		f 3 -4228 4375 4376
		mu 0 3 2038 2040 2098
		f 3 4377 4378 -4376
		mu 0 3 2040 2114 2098
		f 3 -4357 4379 4380
		mu 0 3 2108 2109 2095
		f 3 4381 -4332 -4380
		mu 0 3 2109 2093 2095
		f 3 -4273 4382 -4358
		mu 0 3 2039 2066 2110
		f 3 -4336 4383 -4383
		mu 0 3 2066 2096 2110
		f 3 -4365 4384 -4379
		mu 0 3 2114 2113 2098
		f 3 4385 -4340 -4385
		mu 0 3 2113 2097 2098
		f 3 -4370 4386 -4375
		mu 0 3 2117 2116 2101
		f 3 4387 -4344 -4387
		mu 0 3 2116 2099 2101
		f 3 -4239 4388 -4374
		mu 0 3 2048 2050 2117
		f 3 -4348 -4371 -4389
		mu 0 3 2050 2103 2117
		f 3 -4268 4389 -4378
		mu 0 3 2040 2041 2114
		f 3 -4351 -4366 -4390
		mu 0 3 2041 2105 2114
		f 3 4390 4391 4392
		mu 0 3 2118 2119 2106
		f 3 -4287 -4353 -4392
		mu 0 3 2119 2107 2106
		f 3 -4334 4393 4394
		mu 0 3 2095 2086 2120
		f 3 -4312 4395 -4394
		mu 0 3 2086 2085 2120
		f 3 4396 4397 -4352
		mu 0 3 2091 2121 2105
		f 3 4398 -4364 -4398
		mu 0 3 2121 2112 2105
		f 3 4399 4400 -4349
		mu 0 3 2104 2122 2103
		f 3 4401 -4369 -4401
		mu 0 3 2122 2115 2103
		f 3 -4236 4402 4403
		mu 0 3 2046 2047 2102
		f 3 -4373 -4346 -4403
		mu 0 3 2047 2101 2102
		f 3 -4272 4404 4405
		mu 0 3 2065 2038 2088
		f 3 -4377 -4341 -4405
		mu 0 3 2038 2098 2088
		f 3 4406 4407 4408
		mu 0 3 2123 2124 2118
		f 3 -4304 -4391 -4408
		mu 0 3 2124 2119 2118
		f 3 4409 4410 4411
		mu 0 3 2125 2108 2120
		f 3 -4381 -4395 -4411
		mu 0 3 2108 2095 2120
		f 3 4412 4413 4414
		mu 0 3 2126 2121 2092
		f 3 -4397 -4329 -4414
		mu 0 3 2121 2091 2092
		f 3 4415 4416 4417
		mu 0 3 2127 2128 2084
		f 3 -4400 -4325 -4417
		mu 0 3 2128 2090 2084
		f 3 -4234 4418 -4328
		mu 0 3 2044 2046 2092
		f 3 -4404 4419 -4419
		mu 0 3 2046 2102 2092
		f 3 -4274 4420 4421
		mu 0 3 2060 2065 2083
		f 3 -4406 -4321 -4421
		mu 0 3 2065 2088 2083
		f 3 4422 4423 4424
		mu 0 3 2070 2129 2123
		f 3 -4318 -4407 -4424
		mu 0 3 2129 2124 2123
		f 3 4425 4426 4427
		mu 0 3 2130 2106 2125
		f 3 -4355 -4410 -4427
		mu 0 3 2106 2108 2125
		f 3 -4345 4428 -4420
		mu 0 3 2102 2100 2092
		f 3 4429 -4415 -4429
		mu 0 3 2100 2126 2092
		f 3 4430 4431 -4311
		mu 0 3 2077 2131 2084
		f 3 4432 -4418 -4432
		mu 0 3 2131 2127 2084
		f 3 -4253 4433 4434
		mu 0 3 2058 2060 2073
		f 3 -4422 -4308 -4434
		mu 0 3 2060 2083 2073
		f 3 4435 4436 -4283
		mu 0 3 2068 2132 2070
		f 3 -4337 -4423 -4437
		mu 0 3 2132 2129 2070
		f 3 4437 4438 4439
		mu 0 3 2133 2118 2130
		f 3 -4393 -4426 -4439
		mu 0 3 2118 2106 2130
		f 3 -4266 4440 4441
		mu 0 3 2045 2042 2134
		f 3 -4361 -4330 -4441
		mu 0 3 2042 2111 2134
		f 3 4442 4443 4444
		mu 0 3 2135 2131 2078
		f 3 -4431 -4297 -4444
		mu 0 3 2131 2077 2078
		f 3 -4277 4445 4446
		mu 0 3 2057 2058 2075
		f 3 -4435 -4291 -4446
		mu 0 3 2058 2073 2075
		f 3 4447 4448 -4301
		mu 0 3 2080 2136 2068
		f 3 -4384 -4436 -4449
		mu 0 3 2136 2132 2068
		f 3 4449 4450 4451
		mu 0 3 2137 2123 2133
		f 3 -4409 -4438 -4451
		mu 0 3 2123 2118 2133
		f 3 -4260 4452 4453
		mu 0 3 2049 2045 2138
		f 3 -4442 -4382 -4453
		mu 0 3 2045 2134 2138
		f 3 4454 4455 4456
		mu 0 3 2139 2140 2078
		f 3 4457 -4445 -4456
		mu 0 3 2140 2135 2078
		f 3 -4250 4458 4459
		mu 0 3 2055 2057 2139
		f 3 -4447 4460 -4459
		mu 0 3 2057 2075 2139
		f 3 -4333 4461 -4315
		mu 0 3 2086 2094 2080
		f 3 -4360 -4448 -4462
		mu 0 3 2094 2136 2080
		f 3 -4284 4462 4463
		mu 0 3 2069 2070 2137
		f 3 -4425 -4450 -4463
		mu 0 3 2070 2123 2137
		f 3 -4263 4464 -4285
		mu 0 3 2064 2049 2141
		f 3 -4454 -4356 -4465
		mu 0 3 2049 2138 2141
		f 3 4465 4466 -4293
		mu 0 3 2076 2140 2075
		f 3 -4455 -4461 -4467
		mu 0 3 2140 2139 2075
		f 3 -4245 4467 -4296
		mu 0 3 2054 2055 2078
		f 3 -4460 -4457 -4468
		mu 0 3 2055 2139 2078
		f 3 -4338 4468 4469
		mu 0 3 2089 2097 2142
		f 3 4470 4471 -4469
		mu 0 3 2097 2143 2142
		f 3 4472 4473 -4386
		mu 0 3 2113 2144 2097
		f 3 4474 -4471 -4474
		mu 0 3 2144 2143 2097
		f 3 -4342 4475 4476
		mu 0 3 2100 2099 2145
		f 3 4477 4478 -4476
		mu 0 3 2099 2146 2145
		f 3 4479 4480 -4388
		mu 0 3 2116 2147 2099
		f 3 4481 -4478 -4481
		mu 0 3 2147 2146 2099
		f 3 -4367 4482 -4480
		mu 0 3 2116 2115 2147
		f 3 4483 4484 -4483
		mu 0 3 2115 2148 2147
		f 3 4485 4486 -4402
		mu 0 3 2122 2149 2115
		f 3 4487 -4484 -4487
		mu 0 3 2149 2148 2115
		f 3 -4416 4488 -4486
		mu 0 3 2128 2127 2150
		f 3 4489 4490 -4489
		mu 0 3 2127 2151 2150
		f 3 4491 4492 -4433
		mu 0 3 2131 2152 2127
		f 3 4493 -4490 -4493
		mu 0 3 2152 2151 2127
		f 3 -4443 4494 -4492
		mu 0 3 2131 2135 2152
		f 3 4495 4496 -4495
		mu 0 3 2135 2153 2152
		f 3 4497 4498 -4458
		mu 0 3 2140 2154 2135
		f 3 4499 -4496 -4499
		mu 0 3 2154 2153 2135
		f 3 -4466 4500 -4498
		mu 0 3 2140 2076 2154
		f 3 4501 4502 -4501
		mu 0 3 2076 2155 2154
		f 3 4503 4504 -4292
		mu 0 3 2074 2156 2076
		f 3 4505 -4502 -4505
		mu 0 3 2156 2155 2076
		f 3 -4305 4506 -4504
		mu 0 3 2074 2082 2156
		f 3 4507 4508 -4507
		mu 0 3 2082 2157 2156
		f 3 -4470 4509 -4322
		mu 0 3 2089 2142 2082
		f 3 4510 -4508 -4510
		mu 0 3 2142 2157 2082
		f 3 -4362 4511 -4473
		mu 0 3 2113 2112 2144
		f 3 4512 4513 -4512
		mu 0 3 2112 2158 2144
		f 3 4514 4515 -4399
		mu 0 3 2121 2159 2112
		f 3 4516 -4513 -4516
		mu 0 3 2159 2158 2112
		f 3 -4413 4517 -4515
		mu 0 3 2121 2126 2159
		f 3 4518 4519 -4518
		mu 0 3 2126 2160 2159
		f 3 -4477 4520 -4430
		mu 0 3 2100 2145 2126
		f 3 4521 -4519 -4521
		mu 0 3 2145 2160 2126
		f 3 -4472 4522 4523
		mu 0 3 2161 2162 2163
		f 3 4524 4525 -4523
		mu 0 3 2162 2164 2163
		f 3 4526 4527 -4475
		mu 0 3 2165 2166 2162
		f 3 4528 -4525 -4528
		mu 0 3 2166 2164 2162
		f 3 4529 4530 -4479
		mu 0 3 2167 2168 2169
		f 3 4531 4532 -4531
		mu 0 3 2168 2170 2169
		f 3 4533 4534 -4482
		mu 0 3 2171 2172 2167
		f 3 4535 -4530 -4535
		mu 0 3 2172 2168 2167
		f 3 4536 4537 -4485
		mu 0 3 2173 2174 2171
		f 3 4538 -4534 -4538
		mu 0 3 2174 2172 2171
		f 3 4539 4540 -4488
		mu 0 3 2175 2176 2173
		f 3 4541 -4537 -4541
		mu 0 3 2176 2174 2173
		f 3 -4491 4542 -4540
		mu 0 3 2175 2177 2176
		f 3 4543 4544 -4543
		mu 0 3 2177 2178 2176
		f 3 -4494 4545 -4544
		mu 0 3 2177 2179 2178
		f 3 4546 4547 -4546
		mu 0 3 2179 2180 2178
		f 3 -4497 4548 -4547
		mu 0 3 2179 2181 2180
		f 3 4549 4550 -4549
		mu 0 3 2181 2182 2180
		f 3 -4500 4551 -4550
		mu 0 3 2181 2183 2182
		f 3 4552 4553 -4552
		mu 0 3 2183 2184 2182
		f 3 -4503 4554 -4553
		mu 0 3 2183 2185 2184
		f 3 4555 4556 -4555
		mu 0 3 2185 2186 2184
		f 3 -4506 4557 -4556
		mu 0 3 2185 2187 2186
		f 3 4558 4559 -4558
		mu 0 3 2187 2188 2186
		f 3 -4509 4560 -4559
		mu 0 3 2187 2189 2188
		f 3 4561 4562 -4561
		mu 0 3 2189 2190 2188
		f 3 -4511 4563 -4562
		mu 0 3 2189 2161 2190
		f 3 -4524 4564 -4564
		mu 0 3 2161 2163 2190
		f 3 4565 4566 -4514
		mu 0 3 2191 2192 2165
		f 3 4567 -4527 -4567
		mu 0 3 2192 2166 2165
		f 3 4568 4569 -4517
		mu 0 3 2193 2194 2191
		f 3 4570 -4566 -4570
		mu 0 3 2194 2192 2191
		f 3 4571 4572 -4520
		mu 0 3 2195 2196 2193
		f 3 4573 -4569 -4573
		mu 0 3 2196 2194 2193
		f 3 -4533 4574 -4522
		mu 0 3 2169 2170 2195
		f 3 4575 -4572 -4575
		mu 0 3 2170 2196 2195
		f 3 4576 4577 4578
		mu 0 3 2197 2198 2199
		f 3 -4578 4579 4580
		mu 0 3 2199 2198 2200
		f 3 -4580 4581 4582
		mu 0 3 2200 2198 2201
		f 3 -4582 4583 4584
		mu 0 3 2201 2198 2202
		f 3 -4584 4585 4586
		mu 0 3 2202 2198 2203
		f 3 -4586 4587 4588
		mu 0 3 2203 2198 2204
		f 3 -4588 4589 4590
		mu 0 3 2204 2198 2205
		f 3 4591 4592 -4565
		mu 0 3 2163 2197 2190
		f 3 -4579 4593 -4593
		mu 0 3 2197 2199 2190
		f 3 -4594 4594 -4563
		mu 0 3 2190 2199 2188
		f 3 -4595 4595 -4560
		mu 0 3 2188 2199 2186
		f 3 -4581 4596 -4596
		mu 0 3 2199 2200 2186
		f 3 -4597 4597 -4557
		mu 0 3 2186 2200 2184
		f 3 -4598 4598 -4554
		mu 0 3 2184 2200 2182
		f 3 -4583 4599 -4599
		mu 0 3 2200 2201 2182
		f 3 -4600 4600 -4551
		mu 0 3 2182 2201 2180
		f 3 -4601 4601 -4548
		mu 0 3 2180 2201 2178
		f 3 -4585 4602 -4602
		mu 0 3 2201 2202 2178
		f 3 -4603 4603 -4545
		mu 0 3 2178 2202 2176
		f 3 -4604 4604 -4542
		mu 0 3 2176 2202 2174
		f 3 -4587 4605 -4605
		mu 0 3 2202 2203 2174
		f 3 -4606 4606 -4539
		mu 0 3 2174 2203 2172
		f 3 -4607 4607 -4536
		mu 0 3 2172 2203 2168;
	setAttr ".fc[3000:3334]"
		f 3 -4589 4608 -4608
		mu 0 3 2203 2204 2168
		f 3 -4609 4609 -4532
		mu 0 3 2168 2204 2170
		f 3 -4610 4610 -4576
		mu 0 3 2170 2204 2196
		f 3 -4591 4611 -4611
		mu 0 3 2204 2205 2196
		f 3 -4612 4612 -4574
		mu 0 3 2196 2205 2194
		f 3 -4613 4613 -4571
		mu 0 3 2194 2205 2192
		f 3 -4590 4614 -4614
		mu 0 3 2205 2198 2192
		f 3 -4615 4615 -4568
		mu 0 3 2192 2198 2166
		f 3 -4616 4616 -4529
		mu 0 3 2166 2198 2164
		f 3 -4577 4617 -4617
		mu 0 3 2198 2197 2164
		f 3 -4618 -4592 -4526
		mu 0 3 2164 2197 2163
		f 3 -3473 4618 -3397
		mu 0 3 2206 2207 2208
		f 3 -4619 4619 -3731
		mu 0 3 2208 2207 2209
		f 3 -4620 4620 -3699
		mu 0 3 2209 2207 2210
		f 3 -4621 4621 -3753
		mu 0 3 2210 2207 2211
		f 3 -4622 4622 -3630
		mu 0 3 2211 2207 2212
		f 3 -4623 4623 -3719
		mu 0 3 2212 2207 2213
		f 3 -4624 4624 -3545
		mu 0 3 2213 2207 2214
		f 3 -4625 4625 -3660
		mu 0 3 2214 2207 2215
		f 3 -4626 4626 -3595
		mu 0 3 2215 2207 2216
		f 3 -4627 4627 -3511
		mu 0 3 2216 2207 2217
		f 3 -4628 4628 -3441
		mu 0 3 2217 2207 2218
		f 3 -4629 4629 -3476
		mu 0 3 2218 2207 2219
		f 3 -4630 4630 -3402
		mu 0 3 2219 2207 2220
		f 3 -4631 4631 -3733
		mu 0 3 2220 2207 2221
		f 3 -4632 4632 -3591
		mu 0 3 2221 2207 2222
		f 3 -4633 -3436 -3507
		mu 0 3 2222 2207 2223
		f 3 4633 4634 4635
		mu 0 3 2224 2225 2226
		f 3 -4635 4636 4637
		mu 0 3 2226 2225 2227
		f 3 4638 4639 4640
		mu 0 3 2228 2229 2230
		f 3 -4640 4641 4642
		mu 0 3 2230 2229 2231
		f 3 4643 4644 4645
		mu 0 3 2232 2233 2234
		f 3 -4645 4646 4647
		mu 0 3 2234 2233 2235
		f 3 4648 4649 4650
		mu 0 3 2236 2237 2232
		f 3 -4650 4651 -4644
		mu 0 3 2232 2237 2233
		f 3 4652 4653 4654
		mu 0 3 2238 2239 2240
		f 3 -4654 4655 4656
		mu 0 3 2240 2239 2241
		f 3 4657 4658 4659
		mu 0 3 2242 2237 2243
		f 3 -4659 -4649 4660
		mu 0 3 2243 2237 2236
		f 3 4661 4662 4663
		mu 0 3 2244 2245 2246
		f 3 -4663 4664 4665
		mu 0 3 2246 2245 2247
		f 3 4666 4667 -4660
		mu 0 3 2243 2248 2242
		f 3 -4668 4668 4669
		mu 0 3 2242 2248 2249
		f 3 4670 4671 4672
		mu 0 3 2250 2249 2251
		f 3 -4672 -4669 4673
		mu 0 3 2251 2249 2248
		f 3 4674 4675 4676
		mu 0 3 2252 2253 2254
		f 3 -4676 4677 4678
		mu 0 3 2254 2253 2255
		f 3 4679 4680 4681
		mu 0 3 2256 2250 2257
		f 3 -4681 -4673 4682
		mu 0 3 2257 2250 2251
		f 3 4683 4684 4685
		mu 0 3 2258 2259 2238
		f 3 -4685 4686 -4653
		mu 0 3 2238 2259 2239
		f 3 4687 4688 4689
		mu 0 3 2260 2261 2255
		f 3 -4689 4690 -4679
		mu 0 3 2255 2261 2254
		f 3 4691 4692 4693
		mu 0 3 2262 2263 2245
		f 3 -4693 4694 -4665
		mu 0 3 2245 2263 2247
		f 3 -4688 4695 4696
		mu 0 3 2261 2260 2264
		f 3 -4696 4697 4698
		mu 0 3 2264 2260 2265
		f 3 4699 4700 4701
		mu 0 3 2266 2267 2268
		f 3 -4701 4702 4703
		mu 0 3 2268 2267 2269
		f 3 4704 4705 4706
		mu 0 3 2270 2264 2271
		f 3 -4706 -4699 4707
		mu 0 3 2271 2264 2265
		f 3 4708 4709 -4634
		mu 0 3 2224 2272 2225
		f 3 -4710 4710 4711
		mu 0 3 2225 2272 2273
		f 3 4712 4713 4714
		mu 0 3 2274 2270 2275
		f 3 -4714 -4707 4715
		mu 0 3 2275 2270 2271
		f 3 4716 4717 4718
		mu 0 3 2276 2277 2278
		f 3 -4718 4719 4720
		mu 0 3 2278 2277 2279
		f 3 4721 4722 4723
		mu 0 3 2280 2281 2282
		f 3 -4723 4724 4725
		mu 0 3 2282 2281 2283
		f 3 4726 4727 4728
		mu 0 3 2284 2285 2286
		f 3 -4728 4729 4730
		mu 0 3 2286 2285 2287
		f 3 4731 4732 -4724
		mu 0 3 2282 2276 2280
		f 3 -4733 -4719 4733
		mu 0 3 2280 2276 2278
		f 3 -4731 4734 4735
		mu 0 3 2286 2287 2281
		f 3 -4735 4736 -4725
		mu 0 3 2281 2287 2283
		f 3 4737 4738 4739
		mu 0 3 2288 2289 2290
		f 3 -4739 4740 4741
		mu 0 3 2290 2289 2291
		f 3 4742 4743 4744
		mu 0 3 2292 2293 2294
		f 3 -4744 4745 4746
		mu 0 3 2294 2293 2295
		f 3 -4643 4747 4748
		mu 0 3 2230 2231 2258
		f 3 -4748 4749 -4684
		mu 0 3 2258 2231 2259
		f 3 -4742 4750 4751
		mu 0 3 2290 2291 2262
		f 3 -4751 4752 -4692
		mu 0 3 2262 2291 2263
		f 3 4753 4754 4755
		mu 0 3 2296 2268 2297
		f 3 -4755 -4704 4756
		mu 0 3 2297 2268 2269
		f 3 4757 4758 4759
		mu 0 3 2298 2299 2300
		f 3 -4759 4760 4761
		mu 0 3 2300 2299 2301
		f 3 4762 4763 4764
		mu 0 3 2302 2303 2304
		f 3 -4764 4765 4766
		mu 0 3 2304 2303 2305
		f 3 4767 4768 4769
		mu 0 3 2306 2307 2308
		f 3 -4769 4770 4771
		mu 0 3 2308 2307 2309
		f 3 4772 4773 4774
		mu 0 3 2310 2311 2312
		f 3 -4774 4775 4776
		mu 0 3 2312 2311 2313
		f 3 -4767 4777 4778
		mu 0 3 2304 2305 2235
		f 3 -4778 4779 -4648
		mu 0 3 2235 2305 2234
		f 3 4780 4781 -4775
		mu 0 3 2312 2274 2310
		f 3 -4782 -4715 4782
		mu 0 3 2310 2274 2275
		f 3 4783 4784 -4776
		mu 0 3 2311 2309 2313
		f 3 -4785 -4771 4785
		mu 0 3 2313 2309 2307
		f 3 4786 4787 -4770
		mu 0 3 2308 2314 2306
		f 3 -4788 4788 4789
		mu 0 3 2306 2314 2315
		f 3 -4758 4790 4791
		mu 0 3 2299 2298 2302
		f 3 -4791 4792 -4763
		mu 0 3 2302 2298 2303
		f 3 4793 4794 4795
		mu 0 3 2316 2317 2318
		f 3 -4795 4796 4797
		mu 0 3 2318 2317 2319
		f 3 4798 4799 4800
		mu 0 3 2320 2321 2322
		f 3 -4800 4801 4802
		mu 0 3 2322 2321 2323
		f 3 4803 4804 4805
		mu 0 3 2324 2325 2326
		f 3 -4805 4806 4807
		mu 0 3 2326 2325 2327
		f 3 4808 4809 -4801
		mu 0 3 2322 2256 2320
		f 3 -4810 -4682 4810
		mu 0 3 2320 2256 2257
		f 3 -4808 4811 4812
		mu 0 3 2326 2327 2252
		f 3 -4812 4813 -4675
		mu 0 3 2252 2327 2253
		f 3 4814 4815 -4802
		mu 0 3 2321 2279 2323
		f 3 -4816 -4720 4816
		mu 0 3 2323 2279 2277
		f 3 -4727 4817 4818
		mu 0 3 2285 2284 2324
		f 3 -4818 4819 -4804
		mu 0 3 2324 2284 2325
		f 3 4820 4821 4822
		mu 0 3 2328 2329 2330
		f 3 -4822 4823 4824
		mu 0 3 2330 2329 2331
		f 3 -4638 4825 4826
		mu 0 3 2226 2227 2332
		f 3 -4826 4827 4828
		mu 0 3 2332 2227 2333
		f 3 4829 4830 4831
		mu 0 3 2334 2296 2335
		f 3 -4831 -4756 4832
		mu 0 3 2335 2296 2297
		f 3 4833 4834 4835
		mu 0 3 2336 2337 2338
		f 3 -4835 4836 4837
		mu 0 3 2338 2337 2339
		f 3 4838 4839 4840
		mu 0 3 2340 2334 2341
		f 3 -4840 -4832 4841
		mu 0 3 2341 2334 2335
		f 3 4842 4843 4844
		mu 0 3 2342 2340 2343
		f 3 -4844 -4841 4845
		mu 0 3 2343 2340 2341
		f 3 -4838 4846 4847
		mu 0 3 2338 2339 2333
		f 3 -4847 4848 -4829
		mu 0 3 2333 2339 2332
		f 3 4849 4850 -4738
		mu 0 3 2288 2328 2289
		f 3 -4851 -4823 4851
		mu 0 3 2289 2328 2330
		f 3 -4747 4852 4853
		mu 0 3 2294 2295 2228
		f 3 -4853 4854 -4639
		mu 0 3 2228 2295 2229
		f 3 4855 4856 4857
		mu 0 3 2331 2344 2292
		f 3 -4857 4858 4859
		mu 0 3 2292 2344 2345
		f 3 4860 4861 4862
		mu 0 3 2346 2347 2293
		f 3 -4862 4863 4864
		mu 0 3 2293 2347 2348
		f 3 4865 4866 -4711
		mu 0 3 2272 2244 2273
		f 3 -4867 -4664 4867
		mu 0 3 2273 2244 2246
		f 3 -4657 4868 4869
		mu 0 3 2240 2241 2266
		f 3 -4869 4870 -4700
		mu 0 3 2266 2241 2267
		f 3 -4794 4871 4872
		mu 0 3 2317 2316 2301
		f 3 -4872 4873 -4762
		mu 0 3 2301 2316 2300
		f 3 -4789 4874 4875
		mu 0 3 2315 2314 2349
		f 3 -4875 4876 -4798
		mu 0 3 2349 2314 2350
		f 3 -4825 4877 4878
		mu 0 3 2330 2331 2294
		f 3 -4878 -4858 -4745
		mu 0 3 2294 2331 2292
		f 3 -4879 4879 -4852
		mu 0 3 2330 2294 2289
		f 3 -4880 -4854 4880
		mu 0 3 2289 2294 2228
		f 3 -4881 4881 -4741
		mu 0 3 2289 2228 2291
		f 3 -4882 -4641 4882
		mu 0 3 2291 2228 2230
		f 3 -4883 4883 -4753
		mu 0 3 2291 2230 2263
		f 3 -4884 -4749 4884
		mu 0 3 2263 2230 2258
		f 3 -4885 4885 -4695
		mu 0 3 2263 2258 2247
		f 3 -4886 -4686 4886
		mu 0 3 2247 2258 2238
		f 3 -4887 4887 -4666
		mu 0 3 2247 2238 2246
		f 3 -4888 -4655 4888
		mu 0 3 2246 2238 2240
		f 3 -4889 4889 -4868
		mu 0 3 2246 2240 2273
		f 3 -4890 -4870 4890
		mu 0 3 2273 2240 2266
		f 3 -4712 4891 4892
		mu 0 3 2225 2273 2268
		f 3 -4892 -4891 -4702
		mu 0 3 2268 2273 2266
		f 3 -4893 4893 -4637
		mu 0 3 2225 2268 2227
		f 3 -4894 -4754 4894
		mu 0 3 2227 2268 2296
		f 3 -4895 4895 -4828
		mu 0 3 2227 2296 2333
		f 3 -4896 -4830 4896
		mu 0 3 2333 2296 2334
		f 3 4897 4898 -4839
		mu 0 3 2340 2338 2334
		f 3 -4899 -4848 -4897
		mu 0 3 2334 2338 2333
		f 3 -4865 4899 -4746
		mu 0 3 2293 2348 2295
		f 3 -4900 4900 4901
		mu 0 3 2295 2348 2351
		f 3 -4902 4902 -4855
		mu 0 3 2295 2351 2229
		f 3 -4903 4903 4904
		mu 0 3 2229 2351 2352
		f 3 -4905 4905 -4642
		mu 0 3 2229 2352 2231
		f 3 -4906 4906 4907
		mu 0 3 2231 2352 2353
		f 3 -4908 4908 -4750
		mu 0 3 2231 2353 2259
		f 3 -4909 4909 4910
		mu 0 3 2259 2353 2354
		f 3 -4911 4911 -4687
		mu 0 3 2259 2354 2239
		f 3 -4912 4912 4913
		mu 0 3 2239 2354 2355
		f 3 -4914 4914 -4656
		mu 0 3 2239 2355 2241
		f 3 -4915 4915 4916
		mu 0 3 2241 2355 2356
		f 3 -4917 4917 -4871
		mu 0 3 2241 2356 2267
		f 3 -4918 4918 4919
		mu 0 3 2267 2356 2357
		f 3 -4920 4920 -4703
		mu 0 3 2267 2357 2269
		f 3 -4921 4921 4922
		mu 0 3 2269 2357 2358
		f 3 -4757 4923 4924
		mu 0 3 2297 2269 2359
		f 3 -4924 -4923 4925
		mu 0 3 2359 2269 2358
		f 3 -4833 4926 4927
		mu 0 3 2335 2297 2360
		f 3 -4927 -4925 4928
		mu 0 3 2360 2297 2359
		f 3 -4842 4929 4930
		mu 0 3 2341 2335 2361
		f 3 -4930 -4928 4931
		mu 0 3 2361 2335 2360
		f 3 -4846 4932 4933
		mu 0 3 2343 2341 2362
		f 3 -4933 -4931 4934
		mu 0 3 2362 2341 2361
		f 3 -4898 4935 -4836
		mu 0 3 2338 2340 2336
		f 3 -4936 -4843 4936
		mu 0 3 2336 2340 2342
		f 3 -4856 4937 4938
		mu 0 3 2344 2331 2363
		f 3 -4938 -4824 4939
		mu 0 3 2363 2331 2329
		f 3 -4743 4940 -4863
		mu 0 3 2293 2292 2346
		f 3 -4941 -4860 4941
		mu 0 3 2346 2292 2345
		f 3 4942 4943 -4721
		mu 0 3 2364 2365 2366
		f 3 -4944 4944 4945
		mu 0 3 2366 2365 2367
		f 3 -4734 4946 4947
		mu 0 3 2368 2366 2369
		f 3 -4947 -4946 4948
		mu 0 3 2369 2366 2367
		f 3 -4722 4949 4950
		mu 0 3 2370 2368 2371
		f 3 -4950 -4948 4951
		mu 0 3 2371 2368 2369
		f 3 -4736 4952 4953
		mu 0 3 2372 2370 2373
		f 3 -4953 -4951 4954
		mu 0 3 2373 2370 2371
		f 3 -4729 4955 4956
		mu 0 3 2374 2372 2375
		f 3 -4956 -4954 4957
		mu 0 3 2375 2372 2373
		f 3 -4820 4958 4959
		mu 0 3 2376 2374 2377
		f 3 -4959 -4957 4960
		mu 0 3 2377 2374 2375
		f 3 -4807 4961 4962
		mu 0 3 2378 2376 2379
		f 3 -4962 -4960 4963
		mu 0 3 2379 2376 2377
		f 3 -4963 4964 -4814
		mu 0 3 2378 2379 2380
		f 3 -4965 4965 4966
		mu 0 3 2380 2379 2381
		f 3 -4967 4967 -4678
		mu 0 3 2380 2381 2382
		f 3 -4968 4968 4969
		mu 0 3 2382 2381 2383
		f 3 -4970 4970 -4690
		mu 0 3 2382 2383 2384
		f 3 -4971 4971 4972
		mu 0 3 2384 2383 2385
		f 3 -4973 4973 -4698
		mu 0 3 2384 2385 2386
		f 3 -4974 4974 4975
		mu 0 3 2386 2385 2387
		f 3 -4708 4976 4977
		mu 0 3 2388 2386 2389
		f 3 -4977 -4976 4978
		mu 0 3 2389 2386 2387
		f 3 -4716 4979 4980
		mu 0 3 2390 2388 2391
		f 3 -4980 -4978 4981
		mu 0 3 2391 2388 2389
		f 3 -4783 4982 4983
		mu 0 3 2392 2390 2393
		f 3 -4983 -4981 4984
		mu 0 3 2393 2390 2391
		f 3 -4773 4985 4986
		mu 0 3 2394 2392 2395
		f 3 -4986 -4984 4987
		mu 0 3 2395 2392 2393
		f 3 -4784 4988 4989
		mu 0 3 2396 2394 2397
		f 3 -4989 -4987 4990
		mu 0 3 2397 2394 2395
		f 3 -4772 4991 4992
		mu 0 3 2398 2396 2399
		f 3 -4992 -4990 4993
		mu 0 3 2399 2396 2397
		f 3 -4787 4994 4995
		mu 0 3 2400 2398 2401
		f 3 -4995 -4993 4996
		mu 0 3 2401 2398 2399
		f 3 -4877 4997 4998
		mu 0 3 2402 2400 2403
		f 3 -4998 -4996 4999
		mu 0 3 2403 2400 2401
		f 3 -4999 5000 -4796
		mu 0 3 2402 2403 2404
		f 3 -5001 5001 5002
		mu 0 3 2404 2403 2405
		f 3 -5003 5003 -4874
		mu 0 3 2404 2405 2406
		f 3 -5004 5004 5005
		mu 0 3 2406 2405 2407
		f 3 -5006 5006 -4760
		mu 0 3 2406 2407 2408
		f 3 -5007 5007 5008
		mu 0 3 2408 2407 2409
		f 3 -5009 5009 -4793
		mu 0 3 2408 2409 2410
		f 3 -5010 5010 5011
		mu 0 3 2410 2409 2411
		f 3 -5012 5012 -4766
		mu 0 3 2410 2411 2412
		f 3 -5013 5013 5014
		mu 0 3 2412 2411 2413
		f 3 -5015 5015 -4780
		mu 0 3 2412 2413 2414
		f 3 -5016 5016 5017
		mu 0 3 2414 2413 2415
		f 3 -5018 5018 -4646
		mu 0 3 2414 2415 2416
		f 3 -5019 5019 5020
		mu 0 3 2416 2415 2417
		f 3 -5021 5021 -4651
		mu 0 3 2416 2417 2418
		f 3 -5022 5022 5023
		mu 0 3 2418 2417 2419
		f 3 -4661 5024 5025
		mu 0 3 2420 2418 2421
		f 3 -5025 -5024 5026
		mu 0 3 2421 2418 2419
		f 3 -5026 5027 -4667
		mu 0 3 2420 2421 2422
		f 3 -5028 5028 5029
		mu 0 3 2422 2421 2423
		f 3 -5030 5030 -4674
		mu 0 3 2422 2423 2424
		f 3 -5031 5031 5032
		mu 0 3 2424 2423 2425
		f 3 -5033 5033 -4683
		mu 0 3 2424 2425 2426
		f 3 -5034 5034 5035
		mu 0 3 2426 2425 2427
		f 3 -5036 5036 -4811
		mu 0 3 2426 2427 2428
		f 3 -5037 5037 5038
		mu 0 3 2428 2427 2429
		f 3 -5039 5039 -4799
		mu 0 3 2428 2429 2430
		f 3 -5040 5040 5041
		mu 0 3 2430 2429 2431
		f 3 -5042 5042 -4815
		mu 0 3 2430 2431 2364
		f 3 -5043 5043 -4943
		mu 0 3 2364 2431 2365
		f 3 5044 5045 -4740
		mu 0 3 2290 2381 2288
		f 3 -5046 -4966 5046
		mu 0 3 2288 2381 2379
		f 3 5047 5048 -4752
		mu 0 3 2262 2383 2290
		f 3 -5049 -4969 -5045
		mu 0 3 2290 2383 2381
		f 3 5049 5050 -4694
		mu 0 3 2245 2385 2262
		f 3 -5051 -4972 -5048
		mu 0 3 2262 2385 2383
		f 3 -4662 5051 -5050
		mu 0 3 2245 2244 2385
		f 3 -5052 5052 -4975
		mu 0 3 2385 2244 2387
		f 3 -4866 5053 -5053
		mu 0 3 2244 2272 2387
		f 3 -5054 5054 -4979
		mu 0 3 2387 2272 2389
		f 3 -4709 5055 -5055
		mu 0 3 2272 2224 2389
		f 3 -5056 5056 -4982
		mu 0 3 2389 2224 2391
		f 3 -4636 5057 -5057
		mu 0 3 2224 2226 2391
		f 3 -5058 5058 -4985
		mu 0 3 2391 2226 2393
		f 3 -4827 5059 -5059
		mu 0 3 2226 2332 2393
		f 3 -5060 5060 -4988
		mu 0 3 2393 2332 2395
		f 3 -4849 5061 -5061
		mu 0 3 2332 2339 2395
		f 3 -5062 5062 -4991
		mu 0 3 2395 2339 2397
		f 3 -4837 5063 -5063
		mu 0 3 2339 2337 2397
		f 3 -5064 5064 -4994
		mu 0 3 2397 2337 2399
		f 3 -4834 5065 -5065
		mu 0 3 2337 2336 2399
		f 3 -5066 5066 -4997
		mu 0 3 2399 2336 2401
		f 3 -4937 5067 -5067
		mu 0 3 2336 2342 2401
		f 3 -5068 5068 -5000
		mu 0 3 2401 2342 2403
		f 3 5069 5070 -4845
		mu 0 3 2343 2405 2342
		f 3 -5071 -5002 -5069
		mu 0 3 2342 2405 2403
		f 3 5071 5072 -4934
		mu 0 3 2362 2407 2343
		f 3 -5073 -5005 -5070
		mu 0 3 2343 2407 2405
		f 3 5073 5074 -4935
		mu 0 3 2361 2409 2362
		f 3 -5075 -5008 -5072
		mu 0 3 2362 2409 2407
		f 3 5075 5076 -4932
		mu 0 3 2360 2411 2361
		f 3 -5077 -5011 -5074
		mu 0 3 2361 2411 2409
		f 3 5077 5078 -4929
		mu 0 3 2359 2413 2360
		f 3 -5079 -5014 -5076
		mu 0 3 2360 2413 2411
		f 3 5079 5080 -4926
		mu 0 3 2358 2415 2359
		f 3 -5081 -5017 -5078
		mu 0 3 2359 2415 2413
		f 3 5081 5082 -4922
		mu 0 3 2357 2417 2358
		f 3 -5083 -5020 -5080
		mu 0 3 2358 2417 2415
		f 3 5083 5084 -4919
		mu 0 3 2356 2419 2357
		f 3 -5085 -5023 -5082
		mu 0 3 2357 2419 2417
		f 3 5085 5086 -4916
		mu 0 3 2355 2421 2356
		f 3 -5087 -5027 -5084
		mu 0 3 2356 2421 2419
		f 3 -4913 5087 -5086
		mu 0 3 2355 2354 2421
		f 3 -5088 5088 -5029
		mu 0 3 2421 2354 2423
		f 3 -4910 5089 -5089
		mu 0 3 2354 2353 2423
		f 3 -5090 5090 -5032
		mu 0 3 2423 2353 2425
		f 3 -4907 5091 -5091
		mu 0 3 2353 2352 2425
		f 3 -5092 5092 -5035
		mu 0 3 2425 2352 2427
		f 3 -4904 5093 -5093
		mu 0 3 2352 2351 2427
		f 3 -5094 5094 -5038
		mu 0 3 2427 2351 2429
		f 3 -4901 5095 -5095
		mu 0 3 2351 2348 2429
		f 3 -5096 5096 -5041
		mu 0 3 2429 2348 2431
		f 3 -4864 5097 -5097
		mu 0 3 2348 2347 2431
		f 3 -5098 5098 -5044
		mu 0 3 2431 2347 2365
		f 3 -4861 5099 -5099
		mu 0 3 2347 2346 2365
		f 3 -5100 5100 -4945
		mu 0 3 2365 2346 2367
		f 3 -4942 5101 -5101
		mu 0 3 2346 2345 2367
		f 3 -5102 5102 -4949
		mu 0 3 2367 2345 2369
		f 3 -4859 5103 -5103
		mu 0 3 2345 2344 2369
		f 3 -5104 5104 -4952
		mu 0 3 2369 2344 2371
		f 3 -4939 5105 -5105
		mu 0 3 2344 2363 2371
		f 3 -5106 5106 -4955
		mu 0 3 2371 2363 2373
		f 3 5107 5108 -4940
		mu 0 3 2329 2375 2363
		f 3 -5109 -4958 -5107
		mu 0 3 2363 2375 2373
		f 3 -5108 5109 -4961
		mu 0 3 2375 2329 2377
		f 3 -5110 -4821 5110
		mu 0 3 2377 2329 2328
		f 3 -5047 5111 -4850
		mu 0 3 2288 2379 2328
		f 3 -5112 -4964 -5111
		mu 0 3 2328 2379 2377;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vcs" 2;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "265B7C6F-4B3C-2241-8B1F-B9B0073CC4BE";
	setAttr -s 4 ".lnk";
	setAttr -s 4 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "E810A990-4506-03AD-7537-D390D065A37E";
	setAttr ".bsdt[0].bscd" -type "Int32Array" 1 0 ;
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "CE8A3863-4960-16D7-444E-7BBF69463472";
createNode displayLayerManager -n "layerManager";
	rename -uid "3C98C463-4A10-66FC-2D05-31873BA20E0D";
	setAttr -s 4 ".dli[1:3]"  1 2 3;
	setAttr -s 4 ".dli";
createNode displayLayer -n "defaultLayer";
	rename -uid "0CCBC873-45C3-BBC5-1004-3BB85D894587";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "C8A9600D-4C94-CF7C-7BA8-77AC69AB2F34";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "D49562BF-43F6-E300-B47E-F2A136A7B4AF";
	setAttr ".g" yes;
createNode objectSet -n "ALL_CONTROLS";
	rename -uid "6AA432B0-4A31-1C34-75CD-CC97861C7B14";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
createNode displayLayer -n "geom_lyr";
	rename -uid "85486888-4EFF-AD1B-B0E7-F5B332A59D75";
	setAttr ".dt" 2;
	setAttr ".do" 1;
createNode displayLayer -n "skel_lyr";
	rename -uid "ECA55003-46F1-A27A-7372-9E86B57100D1";
	setAttr ".dt" 2;
	setAttr ".v" no;
	setAttr ".do" 2;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "6DDC7830-4231-961D-8C19-3D927B8CDEB2";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 0\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1606\n            -height 1222\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n"
		+ "            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n"
		+ "            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n"
		+ "            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n"
		+ "            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n"
		+ "                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n"
		+ "                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -autoFitTime 0\n"
		+ "                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 0\n                -outliner \"graphEditor1OutlineEd\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n"
		+ "                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n"
		+ "                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n"
		+ "                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n"
		+ "                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n"
		+ "                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n"
		+ "                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n"
		+ "                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n"
		+ "                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n"
		+ "        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 0\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1606\\n    -height 1222\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 0\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1606\\n    -height 1222\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "43EE1090-4CCD-5A31-C483-4FB6ABDE5B5A";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode shapeEditorManager -n "skel:shapeEditorManager";
	rename -uid "53645316-46C3-10B6-A48C-2DB379E05D28";
	setAttr ".bsdt[0].bscd" -type "Int32Array" 0 ;
createNode poseInterpolatorManager -n "skel:poseInterpolatorManager";
	rename -uid "72C54173-43DA-D96F-21F7-76B59A1E2C1B";
createNode renderLayerManager -n "skel:renderLayerManager";
	rename -uid "6BD4D784-4D72-DA2C-77F7-C99171D64A78";
createNode renderLayer -n "skel:defaultRenderLayer";
	rename -uid "CDD4A347-4026-5416-DF2E-C78F7868102C";
	setAttr ".g" yes;
createNode displayLayer -n "skel:layer1";
	rename -uid "20FFF1CD-4963-68C1-B0BF-18881803B611";
	setAttr ".dt" 1;
	setAttr ".do" 1;
createNode groupId -n "skel:controller_r_model:skinCluster4GroupId";
	rename -uid "13E18508-44B3-F14F-4967-65ADFA4B6E2B";
	setAttr ".ihi" 0;
createNode objectSet -n "skel:controller_r_model:skinCluster4Set";
	rename -uid "CBAFC56C-47CE-212B-3B6A-988E3CCDBCDD";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode skinCluster -n "skel:controller_r_model:skinCluster4";
	rename -uid "2697EFAB-467F-5DC2-D56B-1FB4BCA339AB";
	setAttr -s 1783 ".wl";
	setAttr ".wl[0:499].w"
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1;
	setAttr ".wl[500:999].w"
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1;
	setAttr ".wl[1000:1499].w"
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 2 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 1 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 5 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 6 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1;
	setAttr ".wl[1500:1782].w"
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1;
	setAttr -s 7 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 2.2204460492503131e-16 1 0 0 -1 2.2204460492503131e-16 0
		 0 0 0 1;
	setAttr ".pm[1]" -type "matrix" 3.7225206499202955e-16 1 1.6241456239936769e-15 0
		 -0.9816271834476642 1.3935328430292702e-16 0.1908089953765445 0 0.19080899537654455 -1.6104913569152088e-15 0.9816271834476642 0
		 -0.15804890596294502 0.94998268883609482 2.3990148993774789 1;
	setAttr ".pm[2]" -type "matrix" -1 -1.2021465881652137e-16 2.3367362543640767e-17 0
		 2.465190328815663e-32 0.19080899537654458 0.9816271834476642 0 -1.2246467991473535e-16 0.98162718344766442 -0.19080899537654458 0
		 -0.94999999999999984 -2.1674781349853172 1.2974438300075544 1;
	setAttr ".pm[3]" -type "matrix" -1.731732323306484e-07 0.99999999980310283 1.9843506571697011e-05 0
		 0.98325492202017495 3.7864637330241338e-06 -0.18223544745400794 0 -0.18223544749326304 1.9479667205204894e-05 -0.98325492182723029 0
		 1.788025215756684 0.31086442967408939 -0.23140358049153201 1;
	setAttr ".pm[4]" -type "matrix" 4.1389166139684261e-16 -2.0373745723590204e-16 -1 0
		 -0.98325490756395473 0.18223552549214794 -5.8375150803397511e-16 0 0.18223552549214794 0.98325490756395484 -1.0352000636944804e-16 0
		 -0.594084298169408 -0.92057463276356122 -1.8000000000000027 1;
	setAttr ".pm[5]" -type "matrix" 4.7817233497834657e-16 1 2.1690581743244457e-15 0
		 -0.98162718344766398 -8.9350936779175366e-18 0.1908089953765445 0 0.19080899537654433 -2.3733689273782858e-15 0.98162718344766386 0
		 -0.021912424173356339 0.14917299999999892 0.52487654412234896 1;
	setAttr ".pm[6]" -type "matrix" 4.7817233497834657e-16 1 2.1690581743244457e-15 0
		 -0.98162718344766398 -8.9350936779175366e-18 0.1908089953765445 0 0.19080899537654433 -2.3733689273782858e-15 0.98162718344766386 0
		 -0.084535424173356133 -0.25457999999999814 -0.89081948077236617 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 7 ".ma";
	setAttr -s 7 ".dpf[0:6]"  4 4 4 4 4 4 4;
	setAttr -s 7 ".lw";
	setAttr -s 7 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 4;
	setAttr ".bm" 1;
	setAttr ".ucm" yes;
	setAttr -s 7 ".ifcl";
	setAttr -s 7 ".ifcl";
createNode dagPose -n "skel:controller_r_model:bindPose1";
	rename -uid "F2AAA7A9-4BE4-5FEB-2FC6-B688D2CDE6BC";
	setAttr -s 7 ".wm";
	setAttr -s 7 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 -0.70710678118654746 0 0 0.70710678118654757 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.94998268883609838 2.324781085757742
		 -0.61289872525096967 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.4497752229234771 0.44977522292347777 -0.54562097544370092 0.54562097544370181 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.94999999999999996 -2.3752194105912694
		 -0.86003180709468985 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 5.8688597017880821e-18 0.095845752520223967 0.99539619836717885 6.0950438410690468e-17 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.31085952811630446 -0.098306810340279285
		 -1.8002557061991673 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.54365769422219645 0.54364881609363302 0.4521571091408465 -0.45214624285333677 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.8000000000000025 -1.0134227897071921
		 -0.41637489972534991 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.70414041702702235 -0.064701415046437671 -0.70414041702702201 0.06470141504643756 1
		 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.14917300000000011 0.51105199602178186
		 -0.12166099730450028 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.44977522292347688 0.44977522292347794 -0.5456209754437007 0.54562097544370203 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.25458000000000025 -0.89058273723113601
		 0.086994099855185136 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.44977522292347688 0.44977522292347794 -0.5456209754437007 0.54562097544370203 1
		 1 1 yes;
	setAttr -s 7 ".m";
	setAttr -s 7 ".p";
	setAttr ".bp" yes;
createNode groupParts -n "skel:controller_r_model:skinCluster4GroupParts";
	rename -uid "78923AF9-415D-D3A7-B48B-F4AD36BBABE3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode tweak -n "skel:controller_r_model:tweak4";
	rename -uid "CE21C04C-479A-6B22-4BCE-3C9DF60E9B35";
	setAttr -s 1783 ".vl[0].vt";
	setAttr ".vl[0].vt[0:165]" -type "float3"  -0.03371096 0.15882054 -0.01021727 
		-0.027575402 0.11675683 -0.068996921 -0.028219754 0.13953881 -0.086643629 -0.031071538 
		0.1354921 -0.040331807 -0.013291892 0.10536599 -0.069639318 -0.013300655 0.12592189 
		-0.032832786 -0.030347694 0.16288979 -0.065493651 -0.029079331 0.124314 -0.0813886 
		-0.040804252 0.17396903 -0.020405866 -0.036150679 0.14853358 -0.052176166 -0.01329677 
		0.14000593 -0.017738864 -0.025688421 0.15462276 -0.0083547607 -0.032637931 0.14769568 
		-0.024685128 -0.025908381 0.12994863 -0.036438946 -0.02621498 0.14283156 -0.0205798 
		-0.029012701 0.12362038 -0.056010749 -0.023424447 0.1105928 -0.0696989 -0.013308004 
		0.11287183 -0.05042953 -0.024424061 0.11749701 -0.053167224 -0.031817686 0.17627032 
		-0.04931014 -0.038536619 0.16159883 -0.0362942 -0.029048234 0.14917029 -0.079593718 
		-0.03329318 0.13578929 -0.067843072 -0.039578747 0.1745932 0.0073390566 -0.013294575 
		0.13748257 -0.099201411 -0.025525991 0.15905116 0.0024322786 -0.019639833 0.15372334 
		-0.0078088869 -0.02604389 0.14916469 -0.01402407 -0.020316232 0.14076668 -0.018541897 
		-0.013306421 0.14750944 -0.011965428 -0.02003755 0.14780381 -0.012790202 -0.033222768 
		0.15347189 -0.017267512 -0.031924065 0.14167589 -0.032411762 -0.026165135 0.13644987 
		-0.028198335 -0.020482518 0.12710567 -0.034040861 -0.013295445 0.13302927 -0.024768198 
		-0.020485509 0.13399431 -0.025874201 -0.025217399 0.12338547 -0.044850253 -0.019844932 
		0.11435421 -0.051437452 -0.01330016 0.11905959 -0.041465644 -0.020235499 0.12037872 
		-0.042664722 -0.030050855 0.12926963 -0.048362587 -0.028097389 0.11921042 -0.06281285 
		-0.023734495 0.11304241 -0.061183602 -0.019223884 0.10718581 -0.069770277 -0.013301169 
		0.10810477 -0.059628427 -0.019429153 0.10974547 -0.060273536 -0.013304968 0.1062175 
		-0.081529789 -0.018265709 0.15480499 -0.087970302 -0.018161913 0.16935784 -0.07249143 
		-0.018167857 0.16213669 -0.080626234 -0.018745739 0.1376895 -0.097757801 -0.018387474 
		0.14710985 -0.093805864 -0.028347518 0.14327505 -0.084655352 -0.029705392 0.15583779 
		-0.07299339 -0.018314956 0.1823137 -0.056563932 -0.018213818 0.17638247 -0.064026125 
		-0.030985549 0.16983384 -0.057589021 -0.018463824 0.18627585 -0.051455598 -0.03872611 
		0.18174519 -0.02516184 -0.032915525 0.18174562 -0.040567905 -0.036720004 0.16934934 
		-0.043208051 -0.039645363 0.16804484 -0.02823511 -0.037632324 0.17566341 -0.034580544 
		-0.025471199 0.15787475 -0.003310967 -0.019370746 0.15698235 0.0021320814 -0.019437267 
		0.15625924 -0.0032890406 -0.031222684 0.16280949 0.0031264133 -0.033583973 0.16346428 
		-0.0031550454 -0.013300327 0.15457053 0.010268847 -0.019085756 0.12615454 -0.097886883 
		-0.028859943 0.13218261 -0.085237794 -0.041850414 0.17845832 -0.012795623 -0.023033131 
		0.11083992 -0.079625055 -0.018685639 0.10762006 -0.08047948 -0.032247413 0.1427899 
		-0.07412935 -0.031676635 0.13014509 -0.074683741 -0.030873714 0.13702977 -0.080190584 
		-0.034669746 0.15612648 -0.059240744 -0.034756359 0.14201114 -0.060187526 -0.033465303 
		0.14931962 -0.067045338 -0.037410621 0.15507713 -0.044242207 -0.035765722 0.16277626 
		-0.051316373 -0.037066005 0.17132717 0.013518848 -0.025978304 0.15807663 0.00998885 
		-0.030871186 0.16186979 0.01042117 -0.019627808 0.15548365 0.010107628 -0.013294564 
		0.15352044 -0.0074646403 -0.013299992 0.1698575 -0.07309702 -0.013300027 0.18275309 
		-0.057062201 -0.013300152 0.15526527 -0.088893533 -0.013336452 0.11338733 -0.093051724 
		-0.013300173 0.15632266 0.0021106524 -0.013296871 0.12593047 -0.099510051 -0.013299974 
		0.16263773 -0.081377417 -0.013302607 0.14741173 -0.094908275 -0.01329999 0.17686813 
		-0.064526759 -0.013297693 0.15566412 -0.0032131276 0.0052664983 0.16342267 -0.01201266 
		0.0025609722 0.11853015 -0.068852663 0.0046648839 0.13760532 -0.041964807 0.0026216984 
		0.1255897 -0.080009982 0.0093692681 0.17628346 -0.019333823 0.0060243187 0.14811012 
		-0.05374679 -0.0018030353 0.15618174 -0.0091537442 -0.00068056799 0.12987404 -0.036372803 
		-0.0010407373 0.14293328 -0.021780452 0.0041784043 0.12574296 -0.057270803 -0.0024289449 
		0.11014505 -0.070057586 -0.0017843941 0.11691245 -0.052655704 0.0050900886 0.13621299 
		-0.067774728 -0.0028064803 0.13766243 -0.095022552 -0.0030544307 0.11565956 -0.089940734 
		0.010365974 0.17308357 0.0054401727 -0.0014033942 0.15964672 0.002507414 -0.0071140905 
		0.1540547 -0.0082877902 -0.006400248 0.14095511 -0.018726483 -0.006752078 0.14789133 
		-0.013438175 0.0018437112 0.15902677 -0.010082644 0.0044481088 0.14253043 -0.035844754 
		0.0024144503 0.13336459 -0.038755681 -0.00082559802 0.13694076 -0.028228497 0.0023017784 
		0.13947897 -0.031776305 -0.0060229548 0.12696025 -0.03391533 -0.0061588725 0.13419183 
		-0.02565714 -0.0010114543 0.12304668 -0.044602621 -0.0065820385 0.11399448 -0.051208667 
		-0.0062177326 0.12010822 -0.042466424 0.0046273582 0.13139835 -0.049819291 0.00173583 
		0.12100053 -0.054456186 0.0023016373 0.12688974 -0.046752557 0.0033627546 0.12122661 
		-0.063799314 0.0005672251 0.11431438 -0.069229744 -0.0022003257 0.1124976 -0.061083362 
		0.00089586916 0.11628641 -0.062090248 -0.006806429 0.10678263 -0.069774918 -0.006960826 
		0.10930152 -0.060119595 0.013588597 0.1795646 0.001630513 -0.0082976418 0.1548737 
		-0.088045605 -0.0084209889 0.16933641 -0.072582036 -0.008402192 0.16216095 -0.080750965 
		-0.0078233974 0.13762257 -0.09808322 -0.0081512928 0.14718072 -0.093926765 -0.0082981205 
		0.18227684 -0.056534793 -0.0083924532 0.17636703 -0.064013727 0.00802173 0.18097132 
		-0.028377475 -0.0017418573 0.15928699 -0.0034313635 -0.0072720624 0.15716279 0.0021577964 
		-0.0073424513 0.15666625 -0.0033752809 0.0047002104 0.16490868 0.003308834 0.0075110304 
		0.16921139 -0.0036348596 0.0029757782 0.16309522 -0.0033811554 -0.0074560177 0.1140053 
		-0.092496984 -0.0075776032 0.12614356 -0.098525457 0.0019066725 0.13331109 -0.086203918 
		0.00047027195 0.12003991 -0.08570569 -0.00035821149 0.12863612 -0.09157867 0.012540082 
		0.18244854 -0.010927501 0.0074495072 0.16824375 -0.015109593 0.010271858 0.17486113 
		-0.0067119193 -0.0027719571 0.11042663 -0.079040065 -0.0074472949 0.10706532 -0.080993228 
		0.0029088901 0.12017557 -0.072674818 0.00050711085 0.11513546 -0.076219492 0.0040012239 
		0.14373855 -0.075379625 0.0041327667 0.13094595 -0.073943131;
	setAttr ".vl[0].vt[166:331]" 0.0031141001 0.13861986 -0.081138842 0.0048047546 
		0.15676036 -0.060372919 0.005705283 0.14194046 -0.060930654 0.0044236355 0.14999077 
		-0.06863223 0.0056755687 0.14108536 -0.045541819 0.005036992 0.12890965 -0.060876485 
		0.0040966421 0.12402351 -0.067332909 0.0050621396 0.16139863 -0.054051813 0.0055694166 
		0.13477279 -0.053392403 0.0094136922 0.17002806 0.012744788 -0.00055233657 0.15796088 
		0.0099571673 0.0051982738 0.1634613 0.010748995 -0.0069166645 0.15522073 0.010011381 
		-0.013312714 0.13181509 -0.099997908 -0.018985892 0.1320363 -0.098382808 -0.0076655741 
		0.13195576 -0.098906599 -0.0034049512 0.13235208 -0.096506067 -0.013149446 0.11936711 
		-0.09726087 -0.01920413 0.11995801 -0.095505908 -0.0030264582 0.1213541 -0.09426026 
		7.6014861e-05 0.12373406 -0.089010328 -0.018776378 0.1102159 -0.086489692 -0.013442262 
		0.10906376 -0.087793685 -0.0077250106 0.10979702 -0.087641701 -0.0031243006 0.11255191 
		-0.08621271 0.00063113845 0.11729048 -0.081901021 -0.027392562 0.27612135 -0.053459328 
		-0.040965892 0.27230164 -0.050086942 -0.05238374 0.26648003 -0.044995584 -0.061100416 
		0.25945061 -0.03887818 -0.067432508 0.25154266 -0.032001618 -0.071498141 0.24299572 
		-0.024586173 -0.073235832 0.23440883 -0.017150853 -0.072828576 0.22540045 -0.0093131075 
		-0.070227206 0.2168501 -0.0018214269 -0.065716453 0.20894556 0.0051478148 -0.059118401 
		0.20112997 0.011918395 -0.027874386 0.28251421 -0.0487056 -0.041803412 0.27857816 
		-0.04528591 -0.05355892 0.27264228 -0.040134877 -0.062616087 0.26549262 -0.033928394 
		-0.069321975 0.25740346 -0.026917605 -0.073788732 0.24861091 -0.019313958 -0.075931013 
		0.23967741 -0.011596721 -0.075897619 0.2303043 -0.0034876799 -0.027246766 0.29002571 
		-0.03321046 -0.026930768 0.19621147 0.046092685 -0.073534347 0.22108462 0.0044951579 
		-0.068820983 0.21230188 0.012114468 -0.061833166 0.20416653 0.019158429 -0.040122308 
		0.28648272 -0.030212328 -0.051241759 0.28113168 -0.025688892 -0.059964035 0.27471927 
		-0.020266037 -0.066773161 0.26731074 -0.013995427 -0.071729839 0.25894141 -0.0069246045 
		-0.074515224 0.25025138 0.00040143108 -0.075188085 0.24100117 0.0082159126 -0.073466145 
		0.23152515 0.01622428 -0.06902799 0.22214699 0.024161195 -0.062062182 0.21370798 
		0.031301375 -0.051323477 0.20556074 0.038208552 -0.051908061 0.19603875 0.026193306 
		-0.050424252 0.1925955 0.019300241 -0.041043382 0.18557188 0.025520766 -0.0401619 
		0.20011976 0.042795107 -0.041080162 0.18959744 0.031735059 -0.034599476 0.18654251 
		0.034398597 -0.0133 0.19078402 -0.04478585 -0.040532757 0.19404879 -0.0031713911 
		-0.038346585 0.19298401 -0.0093313484 -0.036124524 0.19174314 -0.015940819 -0.023513388 
		0.19046262 -0.040485881 -0.032518797 0.19077484 -0.024997432 -0.018647138 0.19069134 
		-0.043747716 -0.02800443 0.19034678 -0.034399752 -0.029968379 0.19042912 -0.030668091 
		-0.025571313 0.19040668 -0.037996285 -0.021042438 0.19057915 -0.042513154 0.017778298 
		0.18956655 -0.0032550478 -0.0016753195 0.18809259 -0.044255797 0.0082054539 0.18744881 
		-0.028285019 0.0020334285 0.18764354 -0.03991206 -0.0050984179 0.18855955 -0.04674023 
		0.013932758 0.19404879 -0.0031713911 0.010199582 0.19223054 -0.013690328 0.0081562074 
		0.19137567 -0.019377669 -0.0030866109 0.19046262 -0.040485881 0.0059187943 0.19077484 
		-0.024997432 -0.0079528624 0.19069134 -0.043747716 0.0014044304 0.19034678 -0.034399752 
		0.0033683807 0.19042912 -0.030668091 -0.0010286868 0.19040668 -0.037996285 -0.0055575613 
		0.19057915 -0.042513154 -0.022942631 0.19040091 -0.039915405 -0.024926858 0.19034842 
		-0.037514802 -0.02731403 0.19029063 -0.033986066 -0.029247558 0.19036153 -0.030313885 
		-0.031780612 0.19071612 -0.024679694 -0.035374496 0.19169416 -0.015650535 -0.037595112 
		0.19290875 -0.0090508414 -0.039791968 0.19390768 -0.0028878602 0.01319197 0.19390768 
		-0.0028878602 0.0094481092 0.19215529 -0.013409821 0.0074061751 0.19132671 -0.01908738 
		0.0051806117 0.19071612 -0.024679694 0.0026475599 0.19036153 -0.030313885 0.00071402919 
		0.19029063 -0.033986066 -0.0016731415 0.19034842 -0.037514802 -0.0036573675 0.19040091 
		-0.039915405 -0.006003249 0.19051602 -0.041839629 -0.0082453033 0.1906158 -0.042995717 
		-0.0133 0.19070134 -0.043980688 -0.018354695 0.1906158 -0.042995717 -0.02059675 0.19051602 
		-0.041839629 0.013443268 0.18080415 0.020080596 -0.04039624 0.18117976 0.019747289 
		0.013888025 0.1884741 -0.01377176 -0.039636746 0.18823506 -0.016073056 -0.0133 0.18909253 
		-0.048904926 -0.0080644321 0.18885322 -0.048078779 -0.018535567 0.18885322 -0.048078779 
		-0.0081361756 0.18627585 -0.051455598 -0.013300178 0.18659627 -0.052129664 -0.044412836 
		0.18477178 -7.2658542e-05 -0.034805454 0.18744881 -0.028285019 -0.044721544 0.18971294 
		-0.0023014513 -0.024924679 0.18809259 -0.044255797 -0.028633429 0.18764354 -0.03991206 
		-0.021501582 0.18855955 -0.04674023 -0.031805843 0.187382 -0.034671921 -0.062396195 
		0.20473906 0.008778465 -0.065631449 0.21754032 0.028061222 -0.065358862 0.207875 
		0.015928483 -0.068106413 0.21267134 0.0018324868 -0.071515359 0.22658537 0.020404447 
		-0.071367003 0.21640891 0.008522776 -0.071670175 0.22069746 -0.005235564 -0.0745617 
		0.23588794 0.012540596 -0.074910104 0.22528058 0.00083919644 -0.073291637 0.22956896 
		-0.012976131 -0.075148612 0.24533939 0.0045531616 -0.07620015 0.23466364 -0.007278264 
		-0.072676308 0.2384074 -0.020645309 -0.075202338 0.24385533 -0.015221944 -0.07346952 
		0.25433087 -0.0030362143 -0.072028995 0.25269052 -0.022852879 -0.069702581 0.2628603 
		-0.010227216 -0.069914058 0.2469441 -0.028041223 -0.064779863 0.25526834 -0.035276424 
		-0.066502564 0.26123399 -0.030246686 -0.06384746 0.27084675 -0.016981296 -0.057363741 
		0.26281726 -0.041842707 -0.058722179 0.26893848 -0.036931206 -0.056194276 0.27779841 
		-0.022865837 -0.048063293 0.27577749 -0.042865455 -0.046014588 0.28395602 -0.028068446 
		-0.047048572 0.26953918 -0.047703449 -0.03443075 0.27446455 -0.052026853 -0.033920873 
		0.28849354 -0.031907652 -0.035128683 0.28081459 -0.047235955 -0.020120854 0.27709031 
		-0.05430739 -0.020051941 0.2909894 -0.033999074 -0.02037818 0.28352383 -0.049573343 
		-0.046146546 0.20275715 0.04056289 -0.047020059 0.19283301 0.0289541 -0.04549377 
		0.18864685 0.022734797;
	setAttr ".vl[0].vt[332:497]" -0.033827171 0.19790421 0.044670641 -0.019911751 
		0.19522752 0.046935566 -0.055034228 0.1970702 0.015628409 -0.056864846 0.20927547 
		0.035049126 -0.057027839 0.19991754 0.022916166 -0.066356905 0.21221797 0.022359092 
		-0.062740661 0.20843869 0.025623893 -0.069825113 0.21676706 0.018436173 -0.072389357 
		0.22110808 0.014701504 -0.074480809 0.22601417 0.010490756 -0.075737603 0.23037508 
		0.006758112 -0.076549008 0.2355226 0.0023569264 -0.076687463 0.23994118 -0.0014141479 
		-0.076236308 0.24497917 -0.0057074539 -0.07376691 0.25396949 -0.013335976 -0.075353242 
		0.24919364 -0.0092878724 -0.069021463 0.26273996 -0.020765342 -0.071867563 0.25805619 
		-0.016796293 -0.062172152 0.27070734 -0.027503146 -0.066117935 0.26652604 -0.023967251 
		-0.053137269 0.27770942 -0.033405252 -0.058278255 0.27408114 -0.030351169 -0.041495796 
		0.28355032 -0.038278434 -0.047682948 0.28079268 -0.035983372 -0.034936931 0.28575462 
		-0.040094618 -0.027815122 0.2874428 -0.041465141 -0.020349784 0.28848279 -0.042266194 
		-0.047034275 0.1974678 0.035157867 -0.040790536 0.19456001 0.037684221 -0.052099053 
		0.20033944 0.03265873 -0.034356426 0.19200259 0.03995835 -0.057581197 0.20407417 
		0.029406762 -0.027354518 0.1899216 0.041852988 -0.0133 0.27745885 -0.054532256 -0.0133 
		0.2912963 -0.03427818 -0.0133 0.28384978 -0.049833458 -0.0133 0.28882244 -0.042489786 
		-0.0133 0.19495468 0.04717664 -0.036430579 0.18221936 0.02852883 0.00079256238 0.27612135 
		-0.053459328 0.014365897 0.27230164 -0.050086942 0.025783738 0.26648003 -0.044995584 
		0.034500416 0.25945061 -0.03887818 0.040832508 0.25154266 -0.032001618 0.044898141 
		0.24299572 -0.024586173 0.046635836 0.23440883 -0.017150853 0.046228576 0.22540045 
		-0.0093131075 0.04362721 0.2168501 -0.0018214269 0.03911645 0.20894556 0.0051478148 
		0.032518405 0.20112997 0.011918395 0.0012743875 0.28251421 -0.0487056 0.015203412 
		0.27857816 -0.04528591 0.026958918 0.27264228 -0.040134877 0.036016088 0.26549262 
		-0.033928394 0.042721976 0.25740346 -0.026917605 0.047188733 0.24861091 -0.019313958 
		0.049331013 0.23967741 -0.011596721 0.04929762 0.2303043 -0.0034876799 0.00064676633 
		0.29002571 -0.03321046 0.00033076858 0.19621147 0.046092685 0.046934348 0.22108462 
		0.0044951579 0.04222098 0.21230188 0.012114468 0.035233162 0.20416653 0.019158429 
		0.013522308 0.28648272 -0.030212328 0.02464176 0.28113168 -0.025688892 0.033364035 
		0.27471927 -0.020266037 0.040173166 0.26731074 -0.013995427 0.045129843 0.25894141 
		-0.0069246045 0.047915224 0.25025138 0.00040143108 0.048588086 0.24100117 0.0082159126 
		0.046866149 0.23152515 0.01622428 0.042427987 0.22214699 0.024161195 0.035462182 
		0.21370798 0.031301375 0.024723476 0.20556074 0.038208552 0.025676465 0.19628036 
		0.025985228 0.024628852 0.19332677 0.018688628 0.014443384 0.18557188 0.025520766 
		0.013561902 0.20011976 0.042795107 0.014480161 0.18959744 0.031735059 0.0079994779 
		0.18654251 0.034398597 0.035796192 0.20473906 0.008778465 0.03903145 0.21754032 0.028061222 
		0.038758859 0.207875 0.015928483 0.04150641 0.21267134 0.0018324868 0.044915363 0.22658537 
		0.020404447 0.044767004 0.21640891 0.008522776 0.045070175 0.22069746 -0.005235564 
		0.047961701 0.23588794 0.012540596 0.048310108 0.22528058 0.00083919644 0.046691641 
		0.22956896 -0.012976131 0.048548613 0.24533939 0.0045531616 0.04960015 0.23466364 
		-0.007278264 0.046076313 0.2384074 -0.020645309 0.048602339 0.24385533 -0.015221944 
		0.04686952 0.25433087 -0.0030362143 0.045428995 0.25269052 -0.022852879 0.043102585 
		0.2628603 -0.010227216 0.043314058 0.2469441 -0.028041223 0.038179863 0.25526834 
		-0.035276424 0.03990256 0.26123399 -0.030246686 0.03724746 0.27084675 -0.016981296 
		0.030763742 0.26281726 -0.041842707 0.032122176 0.26893848 -0.036931206 0.029594276 
		0.27779841 -0.022865837 0.021463292 0.27577749 -0.042865455 0.019414587 0.28395602 
		-0.028068446 0.020448573 0.26953918 -0.047703449 0.0078307511 0.27446455 -0.052026853 
		0.0073208744 0.28849354 -0.031907652 0.0085286824 0.28081459 -0.047235955 -0.0064791464 
		0.27709031 -0.05430739 -0.0065480596 0.2909894 -0.033999074 -0.0062218187 0.28352383 
		-0.049573343 0.019546546 0.20275715 0.04056289 0.020420058 0.19283301 0.0289541 0.019305613 
		0.18893141 0.022476982 0.0072271689 0.19790421 0.044670641 -0.0066882493 0.19522752 
		0.046935566 0.028434226 0.1970702 0.015628409 0.030264849 0.20927547 0.035049126 
		0.030427843 0.19991754 0.022916166 0.039756909 0.21221797 0.022359092 0.036140662 
		0.20843869 0.025623893 0.043225113 0.21676706 0.018436173 0.045789357 0.22110808 
		0.014701504 0.047880813 0.22601417 0.010490756 0.049137603 0.23037508 0.006758112 
		0.049949009 0.2355226 0.0023569264 0.050087463 0.23994118 -0.0014141479 0.049636308 
		0.24497917 -0.0057074539 0.04716691 0.25396949 -0.013335976 0.048753243 0.24919364 
		-0.0092878724 0.042421468 0.26273996 -0.020765342 0.04526756 0.25805619 -0.016796293 
		0.035572149 0.27070734 -0.027503146 0.039517935 0.26652604 -0.023967251 0.026537266 
		0.27770942 -0.033405252 0.031678256 0.27408114 -0.030351169 0.014895795 0.28355032 
		-0.038278434 0.021082945 0.28079268 -0.035983372 0.0083369324 0.28575462 -0.040094618 
		0.0012151221 0.2874428 -0.041465141 -0.0062502166 0.28848279 -0.042266194 0.020434273 
		0.1974678 0.035157867 0.014190539 0.19456001 0.037684221 0.025499051 0.20033944 0.03265873 
		0.0077564283 0.19200259 0.03995835 0.0309812 0.20407417 0.029406762 0.00075451744 
		0.1899216 0.041852988 0.009830581 0.18221936 0.02852883 0.016292449 0.18400592 0.017391346 
		-0.026604237 0.2026796 0.042974021 -0.032893181 0.20171152 0.038849454 -0.037947729 
		0.20083863 0.033786792 -0.041627165 0.19940712 0.027775092 -0.043672413 0.1981657 
		0.021943806 -0.019956769 0.20277405 0.045024481 -0.0133 0.20262222 0.045265153 -0.044343658 
		0.19700408 0.015959375 4.2374136e-06 0.2026796 0.042974021 0.006293179 0.20171152 
		0.038849454 0.011347727 0.20083863 0.033786792 0.015027163 0.19940712 0.027775092 
		0.017072409 0.1981657 0.021943806 -0.0066432292 0.20277405 0.045024481 0.017743656 
		0.19700408 0.015959375;
	setAttr ".vl[0].vt[498:663]" -0.02845021 0.11854008 -0.075207733 -0.023888001 
		0.11360922 -0.083540201 -0.042661335 0.17906246 0.0035664719 -0.042883262 0.18398136 
		0.01739992 -0.040281899 0.17063107 -0.0088818669 -0.039154142 0.16565202 -0.015517065 
		-0.037940241 0.15991624 -0.022152944 -0.036757108 0.15332341 -0.029411504 -0.035584141 
		0.14679308 -0.036769062 -0.034473311 0.140567 -0.044772234 -0.033249717 0.13439298 
		-0.052742008 -0.031995334 0.12855268 -0.060415342 -0.030770781 0.12378436 -0.066909462 
		-0.018922966 0.11412595 -0.091698952 -0.0073965946 0.12011464 -0.096744709 -0.00017794404 
		0.13232496 -0.092397109 -0.0031631181 0.12729727 -0.095951654 -0.00016371704 0.13668682 
		-0.090884648 0.0010462601 0.14340824 -0.085811548 0.001516634 0.14926395 -0.08067432 
		0.0015423934 0.15589722 -0.073889904 0.00154125 0.16334137 -0.065693907 0.0019292333 
		0.1693532 -0.057879921 0.0053151241 0.18742201 -0.034475561 0.0026863089 0.17599382 
		-0.048897196 0.0039279261 0.18145601 -0.041185066 -0.044011459 0.19620946 0.010970882 
		0.017394764 0.19620021 0.010979635 -0.024016518 0.1460751 -0.089684747 -0.024121808 
		0.15294036 -0.084453195 -0.02424738 0.15996888 -0.07762517 -0.024447622 0.16711697 
		-0.069887541 -0.024713 0.17411996 -0.061725285 -0.025114896 0.12295847 -0.090042219 
		-0.024997067 0.1278138 -0.092154346 -0.025070528 0.13375188 -0.092834093 -0.024372404 
		0.13817042 -0.09274517 -0.025766715 0.18499678 -0.047301508 -0.025144763 0.18028742 
		-0.053965248 -0.024819292 0.11844976 -0.08734446 -0.0133 0.15075432 0.019998401 0.00051727402 
		0.15613528 0.018292123 0.0054961732 0.16221493 0.017538778 -0.0061196503 0.15203917 
		0.019543808 -0.027117273 0.15613528 0.018292123 -0.031161293 0.16107337 0.017680235 
		-0.020480348 0.15203917 0.019543804 0.0088126892 0.16907343 0.018734204 0.010281468 
		0.17743948 0.023066256 -0.035436455 0.16907988 0.018698405 -0.036881469 0.17743948 
		0.023066256 -0.0019434382 0.17989895 -0.053658281 -0.001209376 0.18464984 -0.047150392 
		-0.0018357914 0.15294451 -0.084476672 -0.0019644238 0.14614902 -0.089791335 -0.002479824 
		0.15988894 -0.077608809 -0.0023116092 0.17381911 -0.061482564 -0.0024530352 0.16695243 
		-0.069775932 0.023274794 0.21084036 0.04230367 0.021495346 0.2119267 0.039764915 
		0.028685389 0.21448301 0.039180711 0.026588446 0.21544832 0.036771249 -0.0133 0.20136423 
		0.050420921 -0.0133 0.20322947 0.047117352 -0.00024522506 0.20246813 0.049379401 
		0.012573024 0.20592645 0.046434868 -0.0010180799 0.2041319 0.046402562 0.011604761 
		0.20735316 0.043623075 0.017886611 0.20809877 0.044590868 0.016744051 0.20946421 
		0.041834317 0.0063642953 0.20403457 0.048042022 -0.0067518074 0.20163041 0.050078303 
		-0.0072613577 0.20344901 0.046957996 0.005381404 0.20556425 0.045148201 -0.026354775 
		0.20246813 0.049379401 -0.039173022 0.20592645 0.046434868 -0.025581921 0.2041319 
		0.046402562 -0.038204759 0.20735316 0.043623075 -0.044486612 0.20809877 0.044590868 
		-0.043344054 0.20946421 0.041834317 -0.032964297 0.20403457 0.048042022 -0.019848192 
		0.20163041 0.050078303 -0.019338641 0.20344901 0.046957996 -0.031981401 0.20556425 
		0.045148201 -0.049874797 0.21084036 0.04230367 -0.048095345 0.2119267 0.039764915 
		-0.05528539 0.21448301 0.039180711 -0.053188447 0.21544832 0.036771249 0.033691376 
		0.21887277 0.035453394 0.040336944 0.22725227 0.028335975 0.037552129 0.22776827 
		0.02633216 0.031150516 0.21966979 0.033196822 0.037064582 0.22271305 0.032192297 
		0.03440626 0.22338833 0.03004651 0.042624716 0.23164624 0.024597606 0.039676122 0.23193246 
		0.022789156 -0.060291372 0.21887277 0.035453394 -0.066936947 0.22725227 0.028335975 
		-0.064152129 0.22776827 0.02633216 -0.057750516 0.21966979 0.033196822 -0.063664578 
		0.22271305 0.032192297 -0.061006263 0.22338833 0.03004651 -0.069224715 0.23164624 
		0.024597606 -0.066276126 0.23193246 0.022789156 0.044448577 0.23638806 0.02057175 
		0.045820918 0.24552058 0.012826198 0.044795334 0.2543332 0.0053539742 0.041315243 
		0.23633905 0.019051334 0.042560846 0.24495223 0.011757405 0.041551817 0.25334471 
		0.0046533309 0.045320667 0.24060437 0.0169963 0.042109128 0.24030271 0.015695401 
		0.045564022 0.24966645 0.0093098627 0.04230319 0.24890229 0.0084124291 -0.071048573 
		0.23638806 0.02057175 -0.072420917 0.24552058 0.012826198 -0.07139533 0.2543332 0.0053539742 
		-0.067915238 0.23633905 0.019051334 -0.069160849 0.24495223 0.011757405 -0.068151817 
		0.25334471 0.0046533309 -0.071920663 0.24060437 0.0169963 -0.068709128 0.24030271 
		0.015695401 -0.072164021 0.24966645 0.0093098627 -0.068903185 0.24890229 0.0084124291 
		0.041719485 0.26247078 -0.0015310964 0.038597509 0.26101011 -0.0018193407 0.043553378 
		0.25815028 0.0021225987 0.040351965 0.25693718 0.0016187086 -0.068319485 0.26247078 
		-0.0015310964 -0.065197505 0.26101011 -0.0018193407 -0.070153378 0.25815028 0.0021225987 
		-0.066951968 0.25693718 0.0016187086 0.036657643 0.2702316 -0.0081025818 0.033814792 
		0.26836333 -0.0080347098 0.039565686 0.26610887 -0.0046090172 0.036561809 0.26446226 
		-0.0047351751 0.033737071 0.27340066 -0.010791569 0.031054549 0.27133596 -0.010549921 
		-0.063257642 0.2702316 -0.0081025818 -0.060414795 0.26836333 -0.0080347098 -0.066165686 
		0.26610887 -0.0046090172 -0.063161805 0.26446226 -0.0047351751 -0.06033707 0.27340066 
		-0.010791569 -0.057654552 0.27133596 -0.010549921 0.030018572 0.2768634 -0.013737237 
		0.021689259 0.28236464 -0.018440336 0.019693311 0.2796731 -0.017644236 0.027548784 
		0.27456743 -0.013290798 0.026375344 0.27947062 -0.015967067 0.024123376 0.27697372 
		-0.015342447 -0.0133 0.28833574 -0.02499347 -0.0133 0.29152727 -0.026228184 0.011377671 
		0.28705835 -0.022442136 -0.00029014933 0.29023203 -0.025150463 -0.00094838534 0.28710318 
		-0.023970522 0.0099761402 0.28408641 -0.021399509 0.016789718 0.28479266 -0.020511638 
		0.015074861 0.28194994 -0.019582598 0.0056998525 0.28882721 -0.023952557 0.0046284678 
		0.28577355 -0.022837391 -0.0070398059 0.29111916 -0.025886381 -0.0073862122 0.28795171 
		-0.024672374 -0.037977673 0.28705835 -0.022442136 -0.026309852 0.29023203 -0.025150463 
		-0.025651615 0.28710318 -0.023970522 -0.036576141 0.28408641 -0.021399509;
	setAttr ".vl[0].vt[664:829]" -0.043389719 0.28479266 -0.020511638 -0.041674864 
		0.28194994 -0.019582598 -0.03229985 0.28882721 -0.023952557 -0.031228468 0.28577355 
		-0.022837391 -0.019560194 0.29111916 -0.025886381 -0.019213788 0.28795171 -0.024672374 
		-0.056618571 0.2768634 -0.013737237 -0.048289258 0.28236464 -0.018440336 -0.046293311 
		0.2796731 -0.017644236 -0.054148786 0.27456743 -0.013290798 -0.052975345 0.27947062 
		-0.015967067 -0.050723378 0.27697372 -0.015342447 0.022877252 0.19174123 0.010910668 
		0.028935019 0.19886202 0.004521695 0.034729607 0.20660995 -0.0017997538 0.026240591 
		0.20184541 0.0047868979 0.031744458 0.202489 0.0014937274 0.029129118 0.20523298 
		0.001932139 0.025714664 0.19480088 0.0078268107 0.02251607 0.19868621 0.0073576458 
		0.018296029 0.19639875 0.0095673921 -0.044896033 0.19639875 0.0095673921 -0.055535018 
		0.19886202 0.004521695 -0.061329607 0.20660995 -0.0017997538 -0.05284059 0.20184541 
		0.0047868979 -0.049477253 0.19174123 0.010910668 -0.058344461 0.202489 0.0014937274 
		-0.055729121 0.20523298 0.001932139 -0.052314665 0.19480088 0.0078268107 -0.049116071 
		0.19868621 0.0073576458 0.038732771 0.21362151 -0.0077476706 0.041517477 0.22142263 
		-0.014340011 0.03201136 0.2091877 -0.0012553441 0.035851508 0.21570525 -0.0067496588 
		0.038536511 0.22304574 -0.012957158 0.036827963 0.2099964 -0.004657927 0.034034844 
		0.21237366 -0.0039329641 0.040168799 0.21711797 -0.010693219 0.037226863 0.21897516 
		-0.0095131667 0.042058401 0.2253419 -0.017737718 0.039145563 0.22681509 -0.016149973 
		-0.06533277 0.21362151 -0.0077476706 -0.068117477 0.22142263 -0.014340011 -0.058611363 
		0.2091877 -0.0012553441 -0.062451508 0.21570525 -0.0067496588 -0.065136507 0.22304574 
		-0.012957158 -0.063427962 0.2099964 -0.004657927 -0.060634844 0.21237366 -0.0039329641 
		-0.066768795 0.21711797 -0.010693219 -0.063826859 0.21897516 -0.0095131667 -0.068658404 
		0.2253419 -0.017737718 -0.065745562 0.22681509 -0.016149973 0.042287569 0.22990245 
		-0.021647532 0.041303478 0.23821047 -0.02837546 0.039423492 0.23118897 -0.019854464 
		0.038305525 0.23887402 -0.026353506 0.03499059 0.24669772 -0.032981765 0.042040069 
		0.23376343 -0.024767369 0.039099965 0.23475724 -0.022873016 0.039889339 0.24199015 
		-0.031605899 0.036998045 0.24248829 -0.02941386 -0.068887569 0.22990245 -0.021647532 
		-0.067903474 0.23821047 -0.02837546 -0.066023491 0.23118897 -0.019854464 -0.064905524 
		0.23887402 -0.026353506 -0.06159059 0.24669772 -0.032981765 -0.068640068 0.23376343 
		-0.024767369 -0.065699965 0.23475724 -0.022873016 -0.066489339 0.24199015 -0.031605899 
		-0.063598044 0.24248829 -0.02941386 0.037728053 0.24639052 -0.035383701 0.032029834 
		0.25413328 -0.041837443 0.029603822 0.25391889 -0.039101366 0.035312563 0.25002545 
		-0.038411595 0.032703575 0.25009423 -0.035857581 0.02635359 0.25697988 -0.041709013 
		-0.064328052 0.24639052 -0.035383701 -0.058629833 0.25413328 -0.041837443 -0.056203824 
		0.25391889 -0.039101366 -0.061912566 0.25002545 -0.038411595 -0.059303574 0.25009423 
		-0.035857581 -0.052953593 0.25697988 -0.041709013 0.023902576 0.26099411 -0.047678076 
		0.021995433 0.26039845 -0.044621367 0.028531384 0.25738555 -0.044610806 0.018833917 
		0.26403823 -0.050167635 0.011739193 0.26581931 -0.049235739 0.017188592 0.26321962 
		-0.047023311 -0.03833919 0.26581931 -0.049235739 -0.043788593 0.26321962 -0.047023311 
		-0.050502576 0.26099411 -0.047678076 -0.048595436 0.26039845 -0.044621367 -0.055131387 
		0.25738555 -0.044610806 -0.045433916 0.26403823 -0.050167635 -0.0133 0.27188116 -0.056787316 
		-0.0133 0.27068326 -0.053360458 0.013089415 0.26682979 -0.052468035 0.00013013733 
		0.27049673 -0.055655319 -0.00046470607 0.26937374 -0.052268207 0.006790692 0.26888475 
		-0.054250188 0.0057853567 0.26781431 -0.050938483 -0.0068313796 0.27143794 -0.056425363 
		-0.0071427561 0.27027655 -0.053019252 -0.039689414 0.26682979 -0.052468035 -0.026730137 
		0.27049673 -0.055655319 -0.026135294 0.26937374 -0.052268207 -0.03339069 0.26888475 
		-0.054250188 -0.032385357 0.26781431 -0.050938483 -0.01976862 0.27143794 -0.056425363 
		-0.019457245 0.27027655 -0.053019252 0.00099711644 0.1576529 -0.014938281 0.00298451 
		0.16060185 -0.01618553 0.0045177443 0.16391592 -0.02026861 0.0051754499 0.16820754 
		-0.028753571 0.0044313725 0.17084208 -0.035558853 0.00370712 0.17100416 -0.039114498 
		0.0030828351 0.16954574 -0.043023877 0.0030539024 0.16681679 -0.045846105 0.0033590263 
		0.16256562 -0.047449067 0.0038246862 0.15897775 -0.047319029 0.0041638426 0.15560308 
		-0.045501564 0.004208887 0.15275931 -0.042167556 0.0035641335 0.14991117 -0.037132394 
		0.0023046429 0.14732027 -0.031663209 0.00029977239 0.14555594 -0.026943753 -0.0011159176 
		0.14543688 -0.024168948 -0.0025854597 0.1465126 -0.021445874 -0.0035180354 0.14839166 
		-0.019035066 -0.0036821521 0.1504783 -0.017383195 -0.0027449869 0.15307026 -0.015903965 
		-0.0010854905 0.15531883 -0.015029229 -0.030297292 0.17133757 0.018944401 -0.031187464 
		0.17747255 0.022056475 -0.028639007 0.18361194 0.0296757 -0.026444679 0.18515752 
		0.032564789 -0.022857497 0.18675329 0.035470523 -0.018856542 0.18787402 0.037379481 
		-0.013309273 0.18849853 0.038231622 -0.0077620042 0.18787402 0.037379481 -0.0037610491 
		0.18675329 0.035470523 -0.00017386655 0.18515752 0.032564789 0.0020204601 0.18361194 
		0.0296757 0.0045689181 0.17747255 0.022056475 0.0036787458 0.17133757 0.018944401 
		0.0012687141 0.16620554 0.018012708 -0.0025013248 0.16188022 0.018399997 -0.0076250946 
		0.15884528 0.019182049 -0.013309273 0.15759251 0.019434534 -0.018993452 0.15884528 
		0.019182049 -0.02411722 0.16188022 0.018399997 -0.027887261 0.16620554 0.018012708 
		-0.030439178 0.18087268 0.025571788 0.0038206333 0.18087268 0.025571788 -0.0069153714 
		0.15445033 0.021891508 -0.0011518503 0.15786423 0.021011813 0.0030889125 0.16272959 
		0.020576166 -0.013309273 0.15304115 0.022175521 -0.019703174 0.15445033 0.021891508 
		-0.025466694 0.15786423 0.021011813 -0.02970746 0.16272959 0.020576166 0.0057998588 
		0.16850241 0.021624193 0.0068011787 0.17540339 0.025124835 -0.013309273 0.18780607 
		0.043319598 -0.0066887806 0.18710358 0.042361062 0.0014662119 0.18404791 0.036945213 
		-0.0025688638 0.18584292 0.040213753;
	setAttr ".vl[0].vt[830:995]" 0.0039345208 0.18230934 0.033695392 0.0059594624 
		0.17922807 0.029079063 -0.032418404 0.16850241 0.021624193 -0.033419725 0.17540339 
		0.025124835 -0.019929765 0.18710358 0.042361062 -0.028084759 0.18404791 0.036945213 
		-0.024049683 0.18584292 0.040213753 -0.030553065 0.18230934 0.033695392 -0.03257801 
		0.17922807 0.029079063 -0.0023350017 0.14930926 -0.015112208 -0.0010990088 0.14481533 
		-0.019979028 0.0026740474 0.15787199 -0.012653998 -0.0013999236 0.15236534 -0.013425304 
		0.00046186804 0.15503006 -0.012558518 -0.0021854222 0.14693369 -0.017028712 0.0048818081 
		0.16123247 -0.014256226 0.0066431602 0.16472834 -0.018924203 0.00059435773 0.14410581 
		-0.023247335 0.0021364749 0.14451237 -0.026307048 0.00431896 0.146341 -0.031460971 
		0.0056885583 0.14927672 -0.037490144 0.0063827955 0.15223724 -0.042871043 0.0058089122 
		0.17246313 -0.039507143 0.0051518725 0.17083088 -0.043882843 0.0065633771 0.17225775 
		-0.035559479 0.0063533704 0.15534976 -0.046519034 0.0059891948 0.15904573 -0.048552223 
		0.0049994909 0.16766998 -0.046928883 0.0073580663 0.16937347 -0.028120887 0.0054820487 
		0.1629972 -0.048682325 0.0025898183 0.12878996 -0.082623072 0.0027488298 0.12272514 
		-0.076482087 -0.028734799 0.12088941 -0.07807935 -0.028984806 0.12756296 -0.083406918 
		-0.028370328 0.13590483 -0.086573973 0.015822671 0.18485631 -0.00097639253 0.021168733 
		0.18972054 0.012602978 0.015794819 0.18294001 0.0086127007 0.018303694 0.18720403 
		0.0059822546 0.020327775 0.19065389 0.0038278105 0.016114395 0.19522376 0.0031980004 
		0.015293367 0.19505394 0.0040458869 0.018189175 0.18619657 0.015554268 0.0045713619 
		0.17440292 0.020257954 0.0067462265 0.17193821 0.023125656 0.0097555984 0.17332241 
		0.020394497 0.011673158 0.17566958 0.015594417 0.013532884 0.17892012 0.011826481 
		-0.031095618 0.17479339 0.020391813 -0.033276938 0.17237315 0.023282079 -0.036535323 
		0.17374071 0.020826027 -0.039018732 0.17635109 0.016126378 -0.041581154 0.17936489 
		0.012287308 -0.04647018 0.18730874 0.0061460319 -0.042072203 0.19515158 0.0046014879 
		-0.042890698 0.19531871 0.0037127244 -0.047133803 0.19074176 0.0044001909 -0.0478606 
		0.18977037 0.012572543 -0.045007896 0.18642408 0.015359504 -0.043980829 0.18292727 
		0.0093122022 0.0059935758 0.18061313 -0.034880396 0.011075839 0.18791594 -0.021029603 
		0.010145398 0.18134208 -0.020797445 -0.035369445 0.168016 0.0050671822 -0.034368996 
		0.16669157 0.011821412 -0.034066688 0.16570097 0.01782285 -0.031358764 0.16566166 
		0.020803634 -0.029385936 0.1688126 0.018181173 -0.04214545 0.18895097 -0.0092853094 
		-0.042973787 0.18183154 -0.0063122706 -0.041348271 0.17476237 -0.0028664141 -0.037365627 
		0.16888353 0.0011872135 0.0059985304 0.1450012 -0.050358631 0.0057578152 0.1388967 
		-0.057608489 0.0051718447 0.1331663 -0.06462796 0.0042186743 0.12809165 -0.070962124 
		0.0055210399 0.15200853 -0.057128225 0.0051962179 0.14567673 -0.064502694 0.0046368311 
		0.13973846 -0.071200177 0.0037370278 0.13445455 -0.077159114 0.0057479558 0.15606695 
		-0.052245423 0.0061541256 0.15219636 -0.049572531 0.0061557456 0.14901273 -0.046022907 
		0.0056829196 0.14572081 -0.040985405 -0.013279913 0.17135032 0.037652671 -0.0042924648 
		0.1716466 0.035919368 -0.022328399 0.17164108 0.035914835 -0.026537638 0.17519085 
		0.035026468 -0.022046234 0.17492399 0.036929067 -0.013270414 0.17479923 0.038477108 
		-0.0045566736 0.17491898 0.036926452 -6.4811044e-05 0.1751909 0.035035811 -0.025961852 
		0.16503067 0.032920953 -0.021796785 0.16432831 0.034935337 -0.013289745 0.16370672 
		0.036599111 -0.0048256996 0.16433218 0.034941442 -0.00065109157 0.16503404 0.03291573 
		-0.0090014227 0.16388178 0.036133628 -0.0087392675 0.1714367 0.037160426 -0.0089016818 
		0.17482731 0.038052429 -0.017603131 0.16388182 0.036132578 -0.017865516 0.17143555 
		0.037165321 -0.017719543 0.17482136 0.03805276 -0.026853023 0.17211601 0.033813551 
		0.00025066335 0.17211068 0.03381072 6.2368046e-05 0.16869818 0.033091746 -0.0043739323 
		0.16813621 0.035247717 -0.0088073686 0.16782731 0.036522537 -0.01326883 0.16770706 
		0.037027299 -0.017825667 0.1678223 0.036517866 -0.02219799 0.16814013 0.035263512 
		-0.026679583 0.16869563 0.033090118 -0.0018207247 0.16117828 0.033178218 -0.0055106077 
		0.16013755 0.034919973 -0.0093049379 0.15948913 0.035976253 -0.013286063 0.15926178 
		0.036361862 -0.017311739 0.15948826 0.035972487 -0.021091798 0.16013631 0.034920145 
		-0.024798308 0.16117087 0.033179719 -0.021505473 0.17812096 0.038170796 -0.017404925 
		0.17818433 0.039162237 -0.013283424 0.17820938 0.039502814 -0.0091978582 0.17818426 
		0.039156951 -0.00510639 0.17812793 0.038175166 -0.00090681971 0.17818034 0.036565378 
		-0.025692733 0.17818102 0.036555648 -0.024425574 0.18105291 0.038113121 -0.020786485 
		0.18135269 0.039578028 -0.016969208 0.18163988 0.040490333 -0.013285181 0.18173812 
		0.040776271 -0.009636594 0.18164478 0.040488791 -0.0058184778 0.1813547 0.039577592 
		-0.0021852646 0.18106727 0.038122881 -0.0095492387 0.15452074 0.03574181 -0.0063766362 
		0.15544277 0.034875307 -0.029536635 0.17862946 0.033858724 -0.030656112 0.17597385 
		0.031991895 -0.029912867 0.16594845 0.029893082 -0.028346272 0.16263321 0.030605998 
		-0.020224053 0.15544289 0.034876373 -0.017050695 0.15452074 0.035741806 -0.023091886 
		0.15699424 0.033498898 -0.013301366 0.15422529 0.036059145 0.0045156833 0.1730959 
		0.030622322 0.0040625338 0.17597932 0.031988598 0.0042893919 0.16962731 0.029855434 
		-0.031115515 0.17309593 0.030621815 -0.030890731 0.16962683 0.029856725 0.0032992174 
		0.16595492 0.029905247 -0.0035243456 0.15701012 0.033511367 0.0017412778 0.16263443 
		0.030599389 -0.0005452708 0.15958893 0.031893048 -0.026071342 0.15957096 0.031883202 
		0.0011509353 0.18093212 0.035941292 -0.001308374 0.18281689 0.03806686 -0.0036307483 
		0.1839532 0.039569639 -0.013300268 0.18568711 0.042073622 -0.016411509 0.18553291 
		0.041820709 -0.010185639 0.18553938 0.041820236 -0.020026004 0.1848757 0.040903471 
		-0.0065741763 0.18487641 0.040902674 0.0029430548 0.17863578 0.0338558 -0.027788971 
		0.18091799 0.035907976 -0.022962417 0.18392994 0.039574891 -0.025311962 0.1828308 
		0.038058333 -0.0031347375 0.18489979 0.039032035;
	setAttr ".vl[0].vt[996:1161]" -0.00042108507 0.18350914 0.037118252 -0.0062530013 
		0.1859149 0.040517449 -0.0096918745 0.1865371 0.041457586 -0.013299994 0.18672243 
		0.041802563 0.0017813769 0.18169548 0.035007063 -0.0061138021 0.15469408 0.034012169 
		-0.0097909831 0.15355524 0.035002887 -0.0029496811 0.1566214 0.032427434 -0.013299994 
		0.15328258 0.035313599 -0.00012094127 0.1591928 0.030828673 0.0021333117 0.16236287 
		0.029420059 -0.02034726 0.18591507 0.040517423 -0.016908145 0.18653712 0.041457586 
		-0.023465486 0.18489897 0.039033491 -0.026179282 0.18350792 0.037119754 -0.028384645 
		0.18170518 0.034989867 -0.030031569 0.17937689 0.03296072 -0.031113833 0.17661349 
		0.030983653 -0.030294415 0.16584782 0.028694538 -0.03124669 0.16957411 0.028608326 
		-0.028733687 0.16236289 0.029420983 -0.02647984 0.15919197 0.030828392 -0.031540867 
		0.17346027 0.029449712 -0.02048669 0.15469421 0.034012988 -0.023651121 0.15662044 
		0.032427195 -0.016808996 0.15355524 0.035002902 0.0034317989 0.17937665 0.032961108 
		0.0045139999 0.17661333 0.030984031 0.0036942589 0.16584781 0.028693918 0.0046466389 
		0.16957414 0.028608058 0.0049408842 0.17346029 0.029449724 -0.02067977 0.18729593 
		0.037962954 -0.023892846 0.18639497 0.035999533 -0.026565637 0.18512149 0.033672348 
		-0.028660255 0.18359977 0.030931115 -0.030157259 0.18159242 0.028205888 -0.031261258 
		0.17849554 0.025017707 -0.031589564 0.17531469 0.022552773 -0.031235201 0.17187332 
		0.020643661 -0.03015811 0.16840634 0.019349886 -0.028270647 0.16495207 0.018587494 
		-0.025793482 0.16197655 0.01828835 -0.022798477 0.15949894 0.018386353 -0.019350434 
		0.15753371 0.018531408 -0.015732275 0.15640089 0.018742248 -0.013299994 0.15621018 
		0.01875574 -0.01706912 0.18794051 0.039054576 -0.013299994 0.18814559 0.039447036 
		-0.0059202099 0.18729593 0.037962947 -0.0027071333 0.18639496 0.035999537 -3.4353721e-05 
		0.18512148 0.033672348 0.0020602662 0.18359977 0.030931108 0.0035572692 0.18159242 
		0.028205888 0.0046612727 0.17849554 0.025017707 0.0049895807 0.17531469 0.022552773 
		0.0046352148 0.17187332 0.020643661 0.003558123 0.16840634 0.019349888 0.0016706615 
		0.16495208 0.018587498 -0.00080651126 0.16197655 0.018288352 -0.0038015039 0.15949894 
		0.018386355 -0.0072495458 0.15753371 0.018531412 -0.010867702 0.15640089 0.018742252 
		-0.0095308702 0.18794051 0.03905458 -0.020014033 0.15506846 0.027415454 -0.016356278 
		0.15394183 0.028038632 -0.023226341 0.15701626 0.026428072 -0.026054751 0.15952776 
		0.025399754 -0.028479049 0.16276315 0.024692835 -0.030158868 0.16623402 0.024522638 
		-0.03116064 0.16984266 0.02500179 -0.013299995 0.15369652 0.028198587 -0.010243708 
		0.15394181 0.028038632 -0.0065859454 0.15506846 0.027415454 -0.0033736469 0.15701626 
		0.026428068 -0.00054523029 0.15952776 0.025399758 0.0018790596 0.16276313 0.024692839 
		0.0035588774 0.166234 0.024522644 0.0045606513 0.16984266 0.02500179 -0.029876005 
		0.17902169 0.033452824 -0.030987706 0.17629886 0.031523667 -0.031436447 0.17327881 
		0.030071599 -0.031179635 0.16960113 0.029267369 -0.03020554 0.16587394 0.029325778 
		-0.028629635 0.1624594 0.030050021 -0.026346669 0.15932646 0.031393811 -0.023410503 
		0.15673247 0.033014365 -0.020391317 0.15500554 0.034493312 -0.016973503 0.15398166 
		0.03541971 -0.013300776 0.15369391 0.035736553 -0.0096264491 0.15398166 0.035419703 
		-0.0062092938 0.15500541 0.034492351 -0.0031991103 0.15674196 0.033021584 -0.00026314959 
		0.15933707 0.031399544 0.0020266189 0.1624601 0.030045845 0.0035976828 0.16587763 
		0.02933245 0.004578847 0.16960143 0.02926651 0.00483655 0.17327879 0.03007189 0.004391443 
		0.17630188 0.031521957 0.0032797691 0.17902519 0.033451322 0.0015359866 0.18134876 
		0.03553535 -0.00082972227 0.18321675 0.03767075 -0.0033406916 0.18447281 0.039364528 
		-0.0063828365 0.18544319 0.040774252 -0.0099462541 0.18609336 0.041708641 -0.013300151 
		0.18625864 0.042003971 -0.016652126 0.18608969 0.041708905 -0.020217381 0.18544285 
		0.040774703 -0.023255508 0.18445918 0.039368164 -0.025782041 0.18322414 0.037666544 
		-0.028159115 0.18134494 0.035508826 -0.013300775 0.19359353 -0.0052746884 -0.027374465 
		0.1938156 -0.0050915941 -0.0081204111 0.20167728 0.036740605 -0.0013998927 0.2009654 
		0.032599751 -0.016689472 0.20173362 0.037103225 -0.027122965 0.20149887 0.035102859 
		0.0023814621 0.19983855 0.026543304 -0.023815274 0.19136323 -0.0223024 -0.013300775 
		0.19127135 -0.022259034 -0.013300775 0.19239017 -0.012677675 -0.026099067 0.19256896 
		-0.012595457 -0.0027862955 0.19136322 -0.022302568 -0.0059548384 0.18984342 -0.041845016 
		-0.0082320981 0.18993078 -0.043048296 -0.011178158 0.18999025 -0.043793894 -0.013302457 
		0.19000512 -0.043987297 -0.015433266 0.18998851 -0.043779414 -0.018398251 0.18993315 
		-0.043083701 -0.020718692 0.18984023 -0.041822284 -0.023068214 0.18973964 -0.039892916 
		-0.025016222 0.18966483 -0.03750417 -0.0274345 0.18963207 -0.033951811 -0.029785598 
		0.18976432 -0.029411715 -0.032730158 0.19031419 -0.022503886 -0.036486492 0.19165167 
		-0.012505274 -0.039565269 0.19317405 -0.003747653 -0.04267966 0.19483556 0.0053392244 
		-0.043792289 0.19555287 0.0092020445 -0.044460185 0.19625957 0.012963359 -0.044582766 
		0.19685338 0.016080925 -0.04436475 0.19745311 0.01920053 -0.043812707 0.19805108 
		0.022291178 -0.042932473 0.19863755 0.025317961 -0.041023593 0.19946472 0.029613866 
		-0.038552672 0.20022447 0.033630121 -0.036053367 0.20076749 0.036601424 -0.033195898 
		0.2012251 0.039242774 -0.030108886 0.20158173 0.041467153 -0.026858024 0.2018428 
		0.043273065 -0.023490598 0.20200872 0.044664528 -0.018776707 0.20212191 0.045849435 
		-0.013311784 0.20215899 0.046394672 -0.0096232574 0.2021468 0.046172492 -0.004562303 
		0.20205063 0.045090463 0.00024744307 0.20183754 0.043277673 0.0035070921 0.20158073 
		0.041468587 0.0065940619 0.20122328 0.039243691 0.0094582783 0.20076385 0.036595728 
		0.012817902 0.19997701 0.032323681 0.015405219 0.19908604 0.02765077 0.016713887 
		0.1983864 0.024033742 0.017612185 0.19759047 0.019916227 0.017982321 0.19677413 0.015670922 
		0.017692126 0.19604075 0.011806841 0.016694184 0.1951745 0.0071841641 0.013326412 
		0.19335827 -0.0027067412;
	setAttr ".vl[0].vt[1162:1327]" 0.0061739823 0.19033723 -0.022375433 0.0034798568 
		0.18980058 -0.028763616 0.001011758 0.18965447 -0.033499405 -0.001569062 0.18965946 
		-0.037526928 -0.0035232047 0.18974085 -0.03989578 0.0094582532 0.2020677 0.036336172 
		0.0065940237 0.20252672 0.038984224 0.0035070505 0.20288353 0.04120924 0.00024741222 
		0.20313722 0.043018922 -0.0045623183 0.2033494 0.044831894 -0.0096232593 0.20344436 
		0.045914154 -0.013311783 0.20345528 0.046136584 -0.018776711 0.20341948 0.045591097 
		-0.0234906 0.20330684 0.044406075 -0.026857955 0.20314623 0.043013595 -0.03605333 
		0.2020729 0.036341567 -0.030108823 0.20288591 0.041207545 -0.033195842 0.20252992 
		0.038983032 0.015405215 0.20039041 0.027391098 0.012817891 0.20128122 0.032064047 
		-0.038552649 0.20152977 0.033370279 -0.042932466 0.19994333 0.025058009 -0.041023578 
		0.20077048 0.02935392 0.017612176 0.19889511 0.019656502 0.017982321 0.19807917 0.015411127 
		-0.043812703 0.19935669 0.022031261 -0.044364747 0.19875848 0.018940661 -0.044582766 
		0.19815898 0.015821019 -0.044460189 0.19756569 0.012703357 0.016694207 0.19648121 
		0.0069240611 -0.0437923 0.19686013 0.008941832 -0.042679682 0.1961437 0.0050788503 
		-0.032730408 0.19162814 -0.022764837 -0.0015667889 0.19098526 -0.037787627 -0.0035208899 
		0.19107564 -0.040159136 0.0010126157 0.19097419 -0.033760607 -0.011177286 0.19135275 
		-0.044065002 -0.0082275718 0.19128816 -0.043316692 -0.005947086 0.19119051 -0.042107854 
		-0.015434143 0.19135101 -0.044050522 -0.013302542 0.19136882 -0.044258803 -0.018404715 
		0.19129093 -0.043351412 -0.027435681 0.19095266 -0.034212671 -0.029786322 0.19108105 
		-0.029672269 -0.025019268 0.19099183 -0.037764095 -0.023070922 0.19107464 -0.040155858 
		-0.020716084 0.19118561 -0.042091992 0.0034803592 0.19111694 -0.02902459 0.006174251 
		0.1916517 -0.022636445 0.013326439 0.19466652 -0.0029671222 0.017692124 0.19734666 
		0.011546882 0.01671388 0.19969058 0.023774106 -0.039565302 0.19448286 -0.0040081292 
		-0.036486581 0.19296208 -0.012765922 -0.014289975 0.20239592 0.01393832 -0.020862404 
		0.20406987 0.022622904 -0.017666917 0.20367134 0.020555254 -0.014515823 0.20167287 
		0.010187138 -0.018663267 0.20048164 0.0040070093 -0.022084607 0.20015714 0.0023234778 
		-0.029608993 0.20024134 0.0027602843 -0.032804482 0.20063987 0.0048279352 -0.035955574 
		0.20263834 0.015196051 -0.036181428 0.20191529 0.011444867 -0.031808134 0.20382956 
		0.021376178 -0.02838679 0.20415406 0.023059709 -0.025886016 0.20007369 0.0018904947 
		-0.035087064 0.20122124 0.0078440579 -0.034436747 0.20330316 0.018645156 -0.024585379 
		0.20423752 0.023492694 -0.015384334 0.20308997 0.017539131 -0.016034653 0.20100805 
		0.0067380304 -0.015709162 0.20181213 0.013883193 -0.021429433 0.20326905 0.02144176 
		-0.018648261 0.20292218 0.019642195 -0.015905732 0.20118283 0.010618377 -0.019515423 
		0.20014605 0.0052395449 -0.022493169 0.19986363 0.0037742944 -0.029041966 0.19993691 
		0.0041544661 -0.03182314 0.20028378 0.0059540314 -0.034565669 0.20202312 0.014977849 
		-0.034762237 0.20139383 0.011713032 -0.030955972 0.2030599 0.020356681 -0.02797823 
		0.20334232 0.021821931 -0.0258017 0.199791 0.0033974524 -0.03380977 0.20078976 0.008579093 
		-0.033243764 0.20260175 0.017979756 -0.024669698 0.20341496 0.022198776 -0.016661627 
		0.2024162 0.017017132 -0.017227631 0.20060422 0.0076164701 -0.036245063 0.19742478 
		0.016271112 -0.036477018 0.19668221 0.012418629 -0.035353102 0.19596942 0.0087205814 
		-0.033008877 0.19537236 0.0056230058 -0.029727092 0.19496305 0.0034995198 -0.025903581 
		0.19479087 0.0026062434 -0.021999512 0.19487658 0.0030509168 -0.018485773 0.19520985 
		0.0047799116 -0.015786178 0.19575047 0.0075846836 -0.014226332 0.19643325 0.011126935 
		-0.01399439 0.1971758 0.014979418 -0.0151183 0.19788861 0.018677466 -0.017462522 
		0.19848567 0.021775041 -0.020744303 0.19889498 0.023898527 -0.024567815 0.19906715 
		0.024791803 -0.028471887 0.19898143 0.024347126 -0.031985622 0.19864817 0.022618132 
		-0.034685217 0.19810756 0.019813361 -0.016213151 0.19493791 0.0017177863 -0.020920388 
		0.19454293 -0.00056734774 -0.026121637 0.19453776 -0.0011013286 -0.031156691 0.19489346 
		0.00014583945 -0.035429731 0.19553672 0.0029827126 -0.038474284 0.19636239 0.0070519419 
		-0.03994707 0.19729245 0.011891078 -0.039664041 0.19823989 0.016942441 -0.037650939 
		0.19909391 0.021613516 -0.034140836 0.19973975 0.025361357 -0.029526975 0.20010199 
		0.027731705 -0.024345892 0.20014422 0.028407106 -0.019233789 0.19986816 0.027268602 
		-0.011698546 0.198502 0.020304499 -0.014835726 0.19930179 0.024448261 -0.010201862 
		0.1975567 0.01535402 -0.010511631 0.19656305 0.010201814 -0.012597463 0.19564939 
		0.0054642381 0.010016535 0.19303103 -0.012390726 0.01001645 0.19171977 -0.012129914 
		-0.013152944 0.19081916 -0.029339157 -0.013292858 0.1908486 -0.037779815 0.0035152114 
		0.19718955 0.012980871 9.9583391e-05 0.19346069 -0.006537498 -0.013302053 0.19014618 
		-0.025828036 -0.019851191 0.19014072 -0.033639174 -0.019060049 0.19014116 -0.03581018 
		-0.017574107 0.19014214 -0.037579652 -0.015572573 0.19014354 -0.038734198 -0.0075362846 
		0.19014975 -0.03580568 -0.011021473 0.19014694 -0.038732436 -0.019062648 0.19014163 
		-0.029156916 -0.015577444 0.19014445 -0.026230155 -0.017578077 0.19014287 -0.02738627 
		-0.0067477413 0.19015068 -0.031323422 -0.011026359 0.19014785 -0.026228392 -0.009024811 
		0.19014926 -0.027382936 -0.0075388825 0.19015025 -0.029152416 -0.019852092 0.19014089 
		-0.031328522 -0.0067468323 0.1901505 -0.033634067 -0.013296867 0.19014521 -0.039134555 
		-0.0090208491 0.19014852 -0.037576322 -0.0067488495 0.19163689 -0.031323534 -0.011027467 
		0.19163407 -0.026228502 -0.0090259193 0.19163549 -0.027383041 -0.0075399908 0.19163647 
		-0.029152524 -0.013303161 0.1916324 -0.025828147 -0.015578552 0.19163068 -0.026230268 
		-0.017579185 0.1916291 -0.02738638 -0.019853201 0.19162712 -0.031328633 -0.019063756 
		0.19162786 -0.029157029 -0.0075373929 0.19163598 -0.035805788 -0.011022582 0.19163316 
		-0.038732544 -0.013297974 0.19163144 -0.039134659 -0.0090219565 0.19163474 -0.037576433 
		-0.0067479401 0.19163673 -0.033634182 -0.019061157 0.19162738 -0.035810292 -0.017575214 
		0.19162837 -0.037579764;
	setAttr ".vl[0].vt[1328:1493]" -0.015573679 0.19162977 -0.038734309 -0.019852299 
		0.19162695 -0.033639289 -0.0020865973 0.19834477 -0.007033186 0.0034017342 0.19392775 
		-0.0015279793 0.0016266268 0.19235885 -0.012539154 0.0047957082 0.19287729 -0.0086692572 
		0.0035553458 0.19257373 -0.010880132 0.0051980936 0.19323292 -0.0061732307 0.004713967 
		0.19359775 -0.0036930824 -0.0035458254 0.19435953 0.00083629921 0.0014196378 0.19418314 
		6.0956001e-05 -0.00099321862 0.19433308 0.00088205456 -0.0059302878 0.19425926 -7.0802686e-05 
		-0.0090993671 0.19374083 -0.0039407047 -0.0090176333 0.19302036 -0.0089168781 -0.0077053858 
		0.19269036 -0.011081993 -0.0033104445 0.19228503 -0.01349202 -0.0057233134 0.19243498 
		-0.012670913 -0.0078590233 0.19404438 -0.0017298431 -0.0095017524 0.19338518 -0.0064367447 
		-0.00075784861 0.1922586 -0.013446268 -0.0036403653 0.19718374 -0.011386978 -0.0061548115 
		0.19750771 -0.0093712891 -0.0067689619 0.19797051 -0.0062250211 -0.0051954612 0.19835562 
		-0.0034203504 -0.0021705662 0.1984828 -0.0022696147 0.00089034496 0.19829258 -0.0033112557 
		0.0025550376 0.19787394 -0.0060578808 0.0020445753 0.19742277 -0.0092243049 -0.00040217125 
		0.1971502 -0.011328933 0.0035704698 0.20160198 0.01238648 0.009177627 0.19709292 
		0.017693758 0.007094332 0.19565229 0.0067191054 0.010370526 0.19610998 0.010506594 
		0.0090687117 0.19583762 0.0083272168 0.010842779 0.19643655 0.012994342 0.010428475 
		0.19677792 0.015490425 0.0022996946 0.19754222 0.020250523 0.0072410493 0.19734356 
		0.019338606 0.004852395 0.19749959 0.020226555 -0.00010909045 0.19746628 0.019407613 
		-0.0033852877 0.19700859 0.015620124 -0.0034432297 0.19634067 0.010636293 -0.0021923666 
		0.19602567 0.008432948 0.0021328568 0.19561899 0.0059001585 -0.00025582357 0.19577503 
		0.0067881169 -0.0020834748 0.19728097 0.017799489 -0.0038575241 0.19668204 0.013132363 
		0.0046855351 0.19557635 0.0058761882 0.001891698 0.20049694 0.0080646351 -0.00056498876 
		0.2008149 0.010151254 -0.0010905515 0.20124796 0.013317735 0.00056091486 0.20159347 
		0.016082454 0.0036166674 0.20168981 0.017151756 0.006646907 0.20149185 0.016025312 
		0.0082337223 0.20109224 0.013230186 0.0076346532 0.20067798 0.010074267 0.0051299799 
		0.20044288 0.0080342274 0.00115354 0.19618732 -0.012616959 0.0016625535 0.1951333 
		-0.012940254 -0.00072192738 0.19503303 -0.013847366 -0.00063487369 0.19611211 -0.013297314 
		0.0041420897 0.19664428 -0.0091883289 0.0048316359 0.19565172 -0.0090703545 0.0035912658 
		0.19534817 -0.011281234 0.0032117602 0.1964166 -0.010846552 0.0052340231 0.19600737 
		-0.0065743388 0.0045714905 0.19702379 -0.0065247361 0.0042083836 0.19729742 -0.0046645124 
		0.0047498858 0.19637218 -0.0040941769 0.0034376623 0.19670218 -0.0019290824 0.0028080686 
		0.19764958 -0.0023540584 0.0013214028 0.19784112 -0.0011622682 0.0014555579 0.19695756 
		-0.00034014255 -0.00095727859 0.19710752 0.00048095436 -0.0012534228 0.19800115 -0.00028604502 
		-0.0031680213 0.19802096 -0.00032036239 -0.0035099033 0.19713396 0.0004351977 -0.0057125427 
		0.19791397 -0.0012883598 -0.0058943476 0.19703369 -0.00047190124 -0.0071591819 0.19775282 
		-0.0025327317 -0.0078230891 0.19681883 -0.0021309459 -0.0084828073 0.19742887 -0.0048920144 
		-0.0090634376 0.19651526 -0.0043418007 -0.0087845959 0.19716214 -0.0067641595 -0.009465822 
		0.19615962 -0.00683785 -0.008981701 0.19579479 -0.0093179755 -0.0082679614 0.19677281 
		-0.0094107939 -0.007283723 0.19652531 -0.011034699 -0.0076694586 0.1954648 -0.011483097 
		-0.0033588412 0.19614032 -0.01334614 -0.0032745185 0.19505948 -0.013893123 -0.0056873793 
		0.19520941 -0.013072012 -0.0051685618 0.19625279 -0.012730291 0.0066439747 0.1994842 
		0.0066943178 0.0071372301 0.19843055 0.0063462658 0.004728416 0.19835463 0.0055033457 
		0.0048372964 0.19942725 0.0060621109 0.0097273327 0.19988625 0.010044994 0.010413428 
		0.19888826 0.010133756 0.0091116028 0.19861588 0.0079543702 0.0087509062 0.19968197 
		0.0084103914 0.010885666 0.19921482 0.012621493 0.010231283 0.20023473 0.012699751 
		0.0099205459 0.20049077 0.014571919 0.010471368 0.19955619 0.015117586 0.0092205256 
		0.19987118 0.017320912 0.0085857306 0.20082691 0.016923172 0.0071332105 0.20101489 
		0.01815689 0.0072839428 0.20012182 0.018965764 0.004895281 0.20027786 0.019853711 
		0.0045841979 0.20118141 0.019104449 0.0026695509 0.20121339 0.019122429 0.0023425873 
		0.20032048 0.019877682 9.9060715e-05 0.20113236 0.01822293 -6.6191518e-05 0.20024456 
		0.019034775 -0.0013818167 0.20099336 0.017016755 -0.0020405827 0.20005924 0.017426642 
		-0.0027710223 0.2007027 0.014691079 -0.0033423875 0.19978686 0.015247284 -0.003125207 
		0.20045777 0.012825158 -0.0038146346 0.1994603 0.012759516 -0.0034003402 0.19911893 
		0.010263454 -0.0026830961 0.20009349 0.010161516 -0.0017448951 0.19985723 0.0085089402 
		-0.0021494799 0.19880393 0.0080601033 0.0021132515 0.19947274 0.0060876878 0.0021757549 
		0.19839726 0.0055273129 -0.00021293089 0.19855329 0.0064152759 0.00032166511 0.19958977 
		0.0067536803 -0.016825676 0.19632386 0.0022900919 -0.013456761 0.19698906 0.0057826866 
		-0.011512685 0.1978405 0.010198145 -0.011223888 0.1987665 0.015000095 -0.012619998 
		0.19964899 0.019613158 -0.015543523 0.20039417 0.02347501 -0.019640947 0.20091859 
		0.026107177 -0.024405763 0.20116755 0.027178502 -0.029241931 0.20111501 0.026563708 
		-0.033557661 0.20076221 0.024365064 -0.03684739 0.20014621 0.020871425 -0.038736925 
		0.19933951 0.016505845 -0.03900566 0.19844817 0.011779525 -0.037627481 0.1975771 
		0.0072499705 -0.034773421 0.19681251 0.0034440185 -0.030769767 0.19623043 0.00079945044 
		-0.026062736 0.19592175 -0.00035337301 -0.021211443 0.19594648 0.00015535862 -0.03032756 
		0.20416638 0.013613699 -0.028359307 0.20473629 0.016545659 -0.024931598 0.20493148 
		0.017549772 -0.021648299 0.20466059 0.016156198 -0.020045698 0.20405039 0.013017008 
		-0.020873675 0.20338641 0.0096010622 -0.023744807 0.20297931 0.0075067198 -0.027315659 
		0.20301959 0.0077139484 -0.029915391 0.20348841 0.01012578 -0.03690334 0.19793864 
		0.01641806 -0.032390963 0.19924521 0.02313981 -0.024532681 0.19969268 0.025441818 
		-0.01700546 0.19907166 0.022246942 -0.013331381 0.19767274 0.015050104 -0.015229573 
		0.19615048 0.0072187884 -0.021811867 0.19521718 0.0024173451 -0.029998319 0.19530952 
		0.0028924327 -0.035958409 0.19638431 0.0084217461;
	setAttr ".vl[0].vt[1494:1659]" -0.033587653 0.2021611 0.01479366 -0.030358091 
		0.20309623 0.019604506 -0.024733823 0.20341648 0.021252081 -0.019346513 0.20297201 
		0.018965468 -0.016716922 0.20197079 0.013814596 -0.018075483 0.20088129 0.008209615 
		-0.022786509 0.20021331 0.0047731623 -0.02864565 0.2002794 0.0051131877 -0.032911357 
		0.20104864 0.0090705883 -0.029915391 0.20581093 0.0096743265 -0.027315659 0.20534211 
		0.0072624944 -0.023744807 0.20530184 0.0070552649 -0.020873675 0.20570894 0.0091496073 
		-0.020045698 0.20637293 0.012565555 -0.021648299 0.20698312 0.015704745 -0.024931598 
		0.20725401 0.017098319 -0.028359307 0.20705883 0.016094206 -0.03032756 0.20648891 
		0.013162244 -0.033854395 0.21090798 0.010052202 -0.034588739 0.20897058 0.010342121 
		-0.034395836 0.20959307 0.01354492 -0.033681206 0.21147861 0.013005051 -0.03299734 
		0.2103537 0.0072179222 -0.03365406 0.20837292 0.0072677415 -0.031196805 0.2098961 
		0.0048464946 -0.031704552 0.20787242 0.0046925447 -0.02868388 0.20957586 0.0032162301 
		-0.028975353 0.20752919 0.0029271923 -0.025752122 0.20944691 0.0025355446 -0.025795642 
		0.20738491 0.0021845519 -0.022759156 0.20950903 0.0028723988 -0.022548947 0.20745671 
		0.0025542474 -0.020067971 0.20977056 0.0042006518 -0.01962685 0.20773618 0.0039916351 
		-0.017995391 0.21018448 0.0063473098 -0.01738181 0.20818935 0.0063234074 -0.016804017 
		0.21071565 0.0090627158 -0.016084598 0.20876186 0.0092682624 -0.016621623 0.21128616 
		0.012015026 -0.015891708 0.20938434 0.012471059 -0.017487517 0.21183994 0.01484672 
		-0.016826378 0.20998201 0.015545441 -0.019280648 0.2122986 0.017223546 -0.018775893 
		0.21048251 0.018120633 -0.021798646 0.21261738 0.018846245 -0.021505093 0.21082573 
		0.019885991 -0.02472827 0.21274805 0.019535748 -0.024684798 0.21097001 0.020628627 
		-0.027720178 0.21268418 0.019189892 -0.0279315 0.21089822 0.020258935 -0.030415488 
		0.21242422 0.017869737 -0.03085359 0.21061875 0.018821543 -0.032481361 0.21200909 
		0.01571686 -0.033098634 0.21016556 0.016489776 -0.033643227 0.20693292 0.010849929 
		-0.033469837 0.20749252 0.013728785 -0.032303832 0.20800704 0.016375808 -0.030285854 
		0.20841445 0.018471731 -0.027659304 0.20866559 0.019763757 -0.024740973 0.20873018 
		0.020096047 -0.021882866 0.20860043 0.019428529 -0.019429699 0.20829199 0.017841714 
		-0.017677361 0.20784205 0.015526986 -0.016837217 0.20730488 0.012763537 -0.017010601 
		0.2067453 0.0098846834 -0.018176613 0.20623076 0.0072376588 -0.020194588 0.20582336 
		0.0051417351 -0.022821143 0.20557222 0.0038497106 -0.02573947 0.20550762 0.0035174207 
		-0.02859758 0.20563738 0.0041849366 -0.031050751 0.20594582 0.0057717557 -0.032803088 
		0.20639576 0.0080864821 -0.02562299 0.21078305 0.0044914265 -0.023381785 0.21082956 
		0.004743679 -0.027818359 0.21087961 0.0050011445 -0.030662009 0.21270168 0.014361921 
		-0.031560484 0.21230443 0.012331252 -0.029115032 0.21301253 0.015974047 -0.027096719 
		0.21320719 0.016962608 -0.024856303 0.21325502 0.0172216 -0.022662526 0.21315718 
		0.016705278 -0.020776989 0.21291846 0.015490166 -0.019434253 0.21257502 0.01371034 
		-0.018785847 0.21216033 0.011589897 -0.018922431 0.2117331 0.0093791345 -0.01981456 
		0.21133536 0.0073457737 -0.021366559 0.21102542 0.0057383031 -0.029700102 0.21111941 
		0.0062219272 -0.031048387 0.21146208 0.0079977084 -0.031690173 0.21187714 0.010120086 
		-0.025583856 0.20985273 0.0052849702 -0.023570456 0.20989451 0.0055115805 -0.027556084 
		0.20993948 0.0057428759 -0.030110693 0.21157633 0.014152183 -0.030917844 0.21121947 
		0.012327922 -0.028720954 0.21185559 0.015600448 -0.026907792 0.21203047 0.016488526 
		-0.024895104 0.21207345 0.016721195 -0.022924313 0.21198553 0.016257351 -0.021230429 
		0.21177109 0.015165748 -0.020024167 0.21146254 0.013566833 -0.019441675 0.21109001 
		0.01166192 -0.01956437 0.21070622 0.0096758697 -0.020365819 0.2103489 0.0078491885 
		-0.021760063 0.21007045 0.0064051072 -0.029246558 0.21015491 0.0068395743 -0.030457797 
		0.21046273 0.0084348572 -0.031034345 0.21083561 0.010341507 -0.02464987 0.20999348 
		0.0060149664 -0.021522321 0.21029258 0.0075536142 -0.020134041 0.21090527 0.010705666 
		-0.021134613 0.21154489 0.01399624 -0.024055857 0.21191216 0.015885632 -0.027530897 
		0.21183521 0.015489784 -0.029933726 0.21135005 0.01299392 -0.030140022 0.2106837 
		0.0095658693 -0.028053265 0.21014796 0.0068096681 0.0028383043 0.16369343 -0.01981508 
		0.001863342 0.16187859 -0.016943481 0.00313747 0.17115408 -0.035393659 0.0029981476 
		0.15248185 -0.043091588 0.0029869191 0.15470874 -0.046120372 -0.0010913851 0.14521235 
		-0.0270788 0.003697416 0.1668641 -0.025954727 0.0033505857 0.1652441 -0.022773519 
		0.0036230085 0.16982821 -0.032091521 0.0037484053 0.16829441 -0.028868631 0.0025325697 
		0.1496858 -0.037425075 0.00037918257 0.14627741 -0.030198986 0.0017111623 0.14807025 
		-0.034129906 0.011088374 0.15894619 -0.029714121 0.011832598 0.16072789 -0.032887861 
		0.0080764377 0.16362141 -0.018302718 0.0092137391 0.16274938 -0.019048765 0.0060414183 
		0.16171263 -0.015804386 0.0071783285 0.16080129 -0.016519118 0.0094887 0.16527925 
		-0.021175504 0.010455137 0.16422492 -0.021584298 0.0094105285 0.14832179 -0.027487174 
		0.0083018169 0.14691673 -0.027977956 0.0073471651 0.14713702 -0.024523675 0.0062468168 
		0.14579248 -0.025046878 0.011356083 0.16603705 -0.025035242 0.010349895 0.16709286 
		-0.02460726 0.011119739 0.17031258 -0.03106969 0.012105206 0.16907716 -0.031140232 
		0.011817256 0.16774504 -0.028353667 0.010789925 0.16875017 -0.027889088 0.011835398 
		0.15116072 -0.033449735 0.010951257 0.1500147 -0.034453839 0.010641415 0.14952043 
		-0.030193755 0.0097448612 0.14838487 -0.031172886 0.012019413 0.17036837 -0.034584656 
		0.010985216 0.17158253 -0.034493744 0.013279391 0.1544432 -0.039537936 0.012492307 
		0.15346023 -0.040835414 0.012754556 0.15582332 -0.043742351 0.013493633 0.15652107 
		-0.042115696 0.012402065 0.16380949 -0.03794926 0.01224978 0.16237599 -0.035662439 
		0.012143703 0.16687675 -0.042705555 0.012357004 0.16536833 -0.043600667 0.0019504735 
		0.17055233 -0.043160208 0.0018480413 0.16947901 -0.044754717 0.010942806 0.16962339 
		-0.042584158 0.010869326 0.17069016 -0.041044138;
	setAttr ".vl[0].vt[1660:1782]" 0.011155794 0.16763657 -0.044436835 0.011383871 
		0.16604136 -0.045373894 0.011742283 0.16394216 -0.046044897 0.012031062 0.16210316 
		-0.046221465 0.012617874 0.1638398 -0.044135358 0.012891082 0.1621059 -0.044361304 
		0.0021199568 0.16375837 -0.048574626 0.002304981 0.16191991 -0.048823416 0.011917355 
		0.16938373 -0.039986573 0.011990055 0.16833456 -0.041403349 0.0018351171 0.16727248 
		-0.046908285 0.0019226891 0.16568246 -0.047900781 0.0028519914 0.15137513 -0.016933892 
		0.0037546745 0.15194577 -0.017844867 0.00068605022 0.1506736 -0.015971156 0.0015409014 
		0.15558559 -0.014124018 0.00093270338 0.15374842 -0.014559685 0.0034290736 0.15556858 
		-0.015288377 0.0029691304 0.15388572 -0.015724925 0.00035413526 0.15950756 -0.015190491 
		-0.00078303361 0.15776317 -0.014702201 0.0026018871 0.15774849 -0.013991916 0.0037753051 
		0.1594269 -0.014370556 0.0032636547 0.14926516 -0.018643655 0.0038874222 0.14819899 
		-0.019937595 0.0012629379 0.14814492 -0.018012565 0.0020333158 0.14699025 -0.01940567 
		0.005298296 0.15884972 -0.015411614 0.0042553367 0.15733704 -0.015110866 -0.0028327601 
		0.14548834 -0.02212804 -0.002172024 0.14501169 -0.023889381 0.0045280862 0.14553681 
		-0.022935119 0.003323826 0.14589605 -0.021318508 0.0048809233 0.14731535 -0.021445591 
		0.0059709507 0.14698336 -0.022889629 -0.0040183547 0.1482008 -0.018563436 -0.0037376273 
		0.14694488 -0.019969089 -0.0036884793 0.15059866 -0.016694792 -0.0022607176 0.15553665 
		-0.014861348 -0.0031334346 0.15363146 -0.015306802 0.0021911333 0.17148739 -0.040909737 
		0.0025147188 0.17172529 -0.038731083 0.010910041 0.17185611 -0.036840733 0.010873745 
		0.17156602 -0.038915977 0.0027589968 0.15724626 -0.047936246 0.002574106 0.15919742 
		-0.048640888 0.012596254 0.15779313 -0.045180544 0.012374046 0.15971848 -0.045936804 
		0.013159259 0.16025575 -0.044210903 0.013378534 0.15841515 -0.04356201 0.011913884 
		0.1701369 -0.038352631 0.011949808 0.17049278 -0.036429737 0.0074193995 0.15450449 
		-0.021758135 0.0060460921 0.15344782 -0.020057801 0.0048401421 0.15263832 -0.018805239 
		0.012395316 0.16498378 -0.039736256 0.01229933 0.16596714 -0.041231673 0.0088428147 
		0.15581152 -0.024016984 0.010081039 0.1572843 -0.026682846 0.0028637194 0.15283042 
		-0.016143244 0.00074384816 0.15215094 -0.015175908 -0.0034764854 0.15205498 -0.015911289 
		0.0030387579 0.15007158 -0.017884789 0.00090896542 0.14934918 -0.01690235 -0.0039189458 
		0.14933965 -0.017539607 0.012492315 0.16400385 -0.042745598 0.012655271 0.16256995 
		-0.041784506 0.012728931 0.16103742 -0.040447243 0.012634966 0.15934601 -0.0384789 
		0.012222528 0.15745202 -0.035699748 0.011296739 0.15528116 -0.031878762 0.010195952 
		0.1535697 -0.028665349 0.0089206416 0.15218978 -0.025904898 0.007387937 0.15105802 
		-0.023457045 0.0060230028 0.15040304 -0.021650912 0.004844232 0.15012412 -0.020202832 
		0.0038128209 0.1501424 -0.018916411 0.012003583 0.16800541 -0.039739691 0.012063132 
		0.16758101 -0.037965048 0.012070866 0.16684367 -0.035956446 0.011966609 0.165609 
		-0.033310454 0.011607415 0.1641432 -0.030490471 0.010979828 0.16248423 -0.027394356 
		0.010034623 0.16081578 -0.024347873 0.0087910583 0.15926948 -0.021728851 0.0072403536 
		0.15770537 -0.019506514 0.0057431282 0.15624997 -0.018028557 0.004557868 0.15500085 
		-0.017140543 0.0036691402 0.15378107 -0.016623981 0.013531172 0.15830362 -0.044562731 
		0.013658928 0.15629464 -0.043038379 0.01342589 0.15406102 -0.040271014 0.011888526 
		0.15057471 -0.033806164 0.010627309 0.14884612 -0.030368138 0.0092978058 0.14754221 
		-0.027441498 0.007122633 0.14630143 -0.024320412 0.0056206789 0.14612433 -0.022526633 
		0.0044541452 0.14647853 -0.020978114 0.0033625602 0.14744154 -0.019328009 0.0026156567 
		0.14857911 -0.017948605 0.0023109536 0.14966215 -0.016932817 0.0021375068 0.15086612 
		-0.016097344 0.0021529994 0.15217124 -0.015354243 0.0022997486 0.15359728 -0.014791457 
		0.0028740948 0.15539502 -0.014331129 0.0037801249 0.15731832 -0.014150567 0.0048993966 
		0.15893824 -0.014479241 0.0069391727 0.16104585 -0.015695384 0.0090860324 0.16309489 
		-0.018359009 0.010420554 0.16467807 -0.021083012 0.011365012 0.16658968 -0.024720198 
		0.011848342 0.16838379 -0.028215032 0.012158222 0.16982274 -0.031212173 0.012060565 
		0.17118156 -0.034842305 0.011986328 0.17133471 -0.036862232 0.011948382 0.17096901 
		-0.038912866 0.011950882 0.17015655 -0.040708967 0.012027682 0.16904731 -0.042221475 
		0.012198469 0.16743188 -0.043675929 0.012425627 0.16582806 -0.044626247 0.012715125 
		0.16413192 -0.045210268 0.013005588 0.16228758 -0.045441329 0.013299455 0.16025749 
		-0.045262959;
createNode objectSet -n "skel:controller_r_model:tweakSet4";
	rename -uid "8B2DDC92-4D37-D605-4546-CAA2BB1EB237";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skel:controller_r_model:groupId80";
	rename -uid "EABF42A6-41F1-518A-51FF-90849C333C85";
	setAttr ".ihi" 0;
createNode groupParts -n "skel:controller_r_model:groupParts26";
	rename -uid "881838B6-4828-4EC0-03CD-EE8924D83E1F";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode materialInfo -n "skel:controller_r_model:controller_materialInfo1";
	rename -uid "327EE77E-4A43-63BD-1A67-A58F5F7B1077";
createNode shadingEngine -n "skel:controller_r_model:controllerSG";
	rename -uid "60DC425B-4352-A011-E23A-EFA36F7C28D1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode file -n "skel:controller_r_model:file2";
	rename -uid "31714184-4713-6B86-CDF8-73A6A3D650A1";
	setAttr ".ftn" -type "string" "C:/dev/depot/depot/Content/controllers//controller_bc.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "skel:controller_r_model:place2dTexture3";
	rename -uid "D5D9D0E2-49C8-7F3E-FF1D-C89660F2E4C0";
createNode reference -n "skel:controller_materialsRN";
	rename -uid "21E89B60-49BD-E162-E156-EAB4246A3555";
	setAttr -s 5 ".phl";
	setAttr ".phl[1]" 0;
	setAttr ".phl[2]" 0;
	setAttr ".phl[3]" 0;
	setAttr ".phl[4]" 0;
	setAttr ".phl[5]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"skel:controller_materialsRN"
		"controller_materialsRN" 0
		"controller_materialsRN" 5
		5 3 "skel:controller_materialsRN" "controller_materials:place2dTexture1.message" 
		"skel:controller_materialsRN.placeHolderList[1]" ""
		5 3 "skel:controller_materialsRN" "controller_materials:bcfile.message" 
		"skel:controller_materialsRN.placeHolderList[2]" ""
		5 3 "skel:controller_materialsRN" "controller_materials:controllerMTL.message" 
		"skel:controller_materialsRN.placeHolderList[3]" ""
		5 3 "skel:controller_materialsRN" "controller_materials:controller_plySG.message" 
		"skel:controller_materialsRN.placeHolderList[4]" ""
		5 4 "skel:controller_materialsRN" "controller_materials:controller_plySG.dagSetMembers" 
		"skel:controller_materialsRN.placeHolderList[5]" "";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode nodeGraphEditorInfo -n "skel:hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "2B1F5DF9-4A64-77B7-D12F-95A46B745516";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -385.75992286484444 -177.38094533246689 ;
	setAttr ".tgi[0].vh" -type "double2" 376.2361137194772 372.61903281249761 ;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "E31998AF-40B7-545C-9C71-E2B2FD451CFA";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -716.80155881845258 -246.42856163638021 ;
	setAttr ".tgi[0].vh" -type "double2" 725.13489182064893 258.33332306808938 ;
	setAttr -s 8 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 465.71429443359375;
	setAttr ".tgi[0].ni[0].y" 40;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" 201.42857360839844;
	setAttr ".tgi[0].ni[1].y" 184.28572082519531;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" -610;
	setAttr ".tgi[0].ni[2].y" 40;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 89.747886657714844;
	setAttr ".tgi[0].ni[3].y" 19.411764144897461;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" -548.5714111328125;
	setAttr ".tgi[0].ni[4].y" -108.57142639160156;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 214.28572082519531;
	setAttr ".tgi[0].ni[5].y" 40;
	setAttr ".tgi[0].ni[5].nvs" 18304;
	setAttr ".tgi[0].ni[6].x" -98.571426391601563;
	setAttr ".tgi[0].ni[6].y" -108.57142639160156;
	setAttr ".tgi[0].ni[6].nvs" 18304;
	setAttr ".tgi[0].ni[7].x" -280;
	setAttr ".tgi[0].ni[7].y" 32.857143402099609;
	setAttr ".tgi[0].ni[7].nvs" 18304;
createNode gameFbxExporter -n "gameExporterPreset1";
	rename -uid "94DF35D6-41F7-BF21-4A23-86AD258EAD64";
	setAttr ".pn" -type "string" "Model Default";
	setAttr ".ils" yes;
	setAttr ".ilu" yes;
	setAttr ".esi" 3;
	setAttr ".ssn" -type "string" "GameExport";
	setAttr ".fv" -type "string" "FBX201800";
	setAttr ".exp" -type "string" "C:/dev/depot/depot/Content/controllers//Export";
	setAttr ".exf" -type "string" "controller_r";
createNode gameFbxExporter -n "gameExporterPreset2";
	rename -uid "1D9A7777-4EE1-A194-142C-F0B0AB4188B7";
	setAttr ".pn" -type "string" "Anim Default";
	setAttr ".ils" yes;
	setAttr ".eti" 2;
	setAttr ".ssn" -type "string" "";
	setAttr ".spt" 2;
	setAttr ".ic" no;
	setAttr ".ebm" yes;
	setAttr ".fv" -type "string" "FBX201800";
createNode gameFbxExporter -n "gameExporterPreset3";
	rename -uid "57C5687A-4BF9-8CDB-74C8-EB90EA09585B";
	setAttr ".pn" -type "string" "TE Anim Default";
	setAttr ".ils" yes;
	setAttr ".eti" 3;
	setAttr ".ssn" -type "string" "";
	setAttr ".ebm" yes;
	setAttr ".fv" -type "string" "FBX201800";
createNode objectSet -n "GameExport";
	rename -uid "4A6DBD57-46AA-DEDF-FAAB-2B8A3F94CA43";
	setAttr ".ihi" 0;
	setAttr -s 8 ".dsm";
	setAttr ".an" -type "string" "gCharacterSet";
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "39581FA0-466E-25BE-D6D6-C5ACE034A4DF";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -716.64382565811547 -594.03576672262602 ;
	setAttr ".tgi[0].vh" -type "double2" 632.16564455453545 544.1717989855656 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 368.57144165039063;
	setAttr ".tgi[0].ni[0].y" 184.28572082519531;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -245.71427917480469;
	setAttr ".tgi[0].ni[1].y" 207.14285278320313;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" 61.428569793701172;
	setAttr ".tgi[0].ni[2].y" 207.14285278320313;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -552.85711669921875;
	setAttr ".tgi[0].ni[3].y" 184.28572082519531;
	setAttr ".tgi[0].ni[3].nvs" 1923;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".etmr" no;
	setAttr ".tmr" 4096;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 4 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".u";
select -ne :defaultRenderingList1;
	setAttr -s 3 ".r";
select -ne :defaultTextureList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".tx";
select -ne :initialShadingGroup;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".fs" 1;
	setAttr ".ef" 10;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr -k off ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off ".enpt";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr";
connectAttr "skel:controller_materialsRN.phl[1]" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "skel:controller_materialsRN.phl[2]" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "skel:controller_materialsRN.phl[3]" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "skel:controller_materialsRN.phl[4]" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "controller_plyShape.iog" "skel:controller_materialsRN.phl[5]";
connectAttr "RIG_controller_world.s" "f_world.is";
connectAttr "controller_world_parentConstraint1.ctx" "controller_world.tx";
connectAttr "controller_world_parentConstraint1.cty" "controller_world.ty";
connectAttr "controller_world_parentConstraint1.ctz" "controller_world.tz";
connectAttr "controller_world_parentConstraint1.crx" "controller_world.rx";
connectAttr "controller_world_parentConstraint1.cry" "controller_world.ry";
connectAttr "controller_world_parentConstraint1.crz" "controller_world.rz";
connectAttr "controller_world.s" "b_button_oculus.is";
connectAttr "b_button_oculus_parentConstraint1.ctx" "b_button_oculus.tx";
connectAttr "b_button_oculus_parentConstraint1.cty" "b_button_oculus.ty";
connectAttr "b_button_oculus_parentConstraint1.ctz" "b_button_oculus.tz";
connectAttr "b_button_oculus_parentConstraint1.crx" "b_button_oculus.rx";
connectAttr "b_button_oculus_parentConstraint1.cry" "b_button_oculus.ry";
connectAttr "b_button_oculus_parentConstraint1.crz" "b_button_oculus.rz";
connectAttr "b_button_oculus.ro" "b_button_oculus_parentConstraint1.cro";
connectAttr "b_button_oculus.pim" "b_button_oculus_parentConstraint1.cpim";
connectAttr "b_button_oculus.rp" "b_button_oculus_parentConstraint1.crp";
connectAttr "b_button_oculus.rpt" "b_button_oculus_parentConstraint1.crt";
connectAttr "b_button_oculus.jo" "b_button_oculus_parentConstraint1.cjo";
connectAttr "f_button_oculus.t" "b_button_oculus_parentConstraint1.tg[0].tt";
connectAttr "f_button_oculus.rp" "b_button_oculus_parentConstraint1.tg[0].trp";
connectAttr "f_button_oculus.rpt" "b_button_oculus_parentConstraint1.tg[0].trt";
connectAttr "f_button_oculus.r" "b_button_oculus_parentConstraint1.tg[0].tr";
connectAttr "f_button_oculus.ro" "b_button_oculus_parentConstraint1.tg[0].tro";
connectAttr "f_button_oculus.s" "b_button_oculus_parentConstraint1.tg[0].ts";
connectAttr "f_button_oculus.pm" "b_button_oculus_parentConstraint1.tg[0].tpm";
connectAttr "f_button_oculus.jo" "b_button_oculus_parentConstraint1.tg[0].tjo";
connectAttr "f_button_oculus.ssc" "b_button_oculus_parentConstraint1.tg[0].tsc";
connectAttr "f_button_oculus.is" "b_button_oculus_parentConstraint1.tg[0].tis";
connectAttr "b_button_oculus_parentConstraint1.w0" "b_button_oculus_parentConstraint1.tg[0].tw"
		;
connectAttr "controller_world.s" "b_trigger_front.is";
connectAttr "b_trigger_front_parentConstraint1.ctx" "b_trigger_front.tx";
connectAttr "b_trigger_front_parentConstraint1.cty" "b_trigger_front.ty";
connectAttr "b_trigger_front_parentConstraint1.ctz" "b_trigger_front.tz";
connectAttr "b_trigger_front_parentConstraint1.crx" "b_trigger_front.rx";
connectAttr "b_trigger_front_parentConstraint1.cry" "b_trigger_front.ry";
connectAttr "b_trigger_front_parentConstraint1.crz" "b_trigger_front.rz";
connectAttr "b_trigger_front.ro" "b_trigger_front_parentConstraint1.cro";
connectAttr "b_trigger_front.pim" "b_trigger_front_parentConstraint1.cpim";
connectAttr "b_trigger_front.rp" "b_trigger_front_parentConstraint1.crp";
connectAttr "b_trigger_front.rpt" "b_trigger_front_parentConstraint1.crt";
connectAttr "b_trigger_front.jo" "b_trigger_front_parentConstraint1.cjo";
connectAttr "f_trigger_front.t" "b_trigger_front_parentConstraint1.tg[0].tt";
connectAttr "f_trigger_front.rp" "b_trigger_front_parentConstraint1.tg[0].trp";
connectAttr "f_trigger_front.rpt" "b_trigger_front_parentConstraint1.tg[0].trt";
connectAttr "f_trigger_front.r" "b_trigger_front_parentConstraint1.tg[0].tr";
connectAttr "f_trigger_front.ro" "b_trigger_front_parentConstraint1.tg[0].tro";
connectAttr "f_trigger_front.s" "b_trigger_front_parentConstraint1.tg[0].ts";
connectAttr "f_trigger_front.pm" "b_trigger_front_parentConstraint1.tg[0].tpm";
connectAttr "f_trigger_front.jo" "b_trigger_front_parentConstraint1.tg[0].tjo";
connectAttr "f_trigger_front.ssc" "b_trigger_front_parentConstraint1.tg[0].tsc";
connectAttr "f_trigger_front.is" "b_trigger_front_parentConstraint1.tg[0].tis";
connectAttr "b_trigger_front_parentConstraint1.w0" "b_trigger_front_parentConstraint1.tg[0].tw"
		;
connectAttr "controller_world.s" "b_trigger_grip.is";
connectAttr "b_trigger_grip_parentConstraint1.ctx" "b_trigger_grip.tx";
connectAttr "b_trigger_grip_parentConstraint1.cty" "b_trigger_grip.ty";
connectAttr "b_trigger_grip_parentConstraint1.ctz" "b_trigger_grip.tz";
connectAttr "b_trigger_grip_parentConstraint1.crx" "b_trigger_grip.rx";
connectAttr "b_trigger_grip_parentConstraint1.cry" "b_trigger_grip.ry";
connectAttr "b_trigger_grip_parentConstraint1.crz" "b_trigger_grip.rz";
connectAttr "b_trigger_grip.jo" "b_trigger_grip_parentConstraint1.cjo";
connectAttr "b_trigger_grip.ro" "b_trigger_grip_parentConstraint1.cro";
connectAttr "b_trigger_grip.pim" "b_trigger_grip_parentConstraint1.cpim";
connectAttr "b_trigger_grip.rp" "b_trigger_grip_parentConstraint1.crp";
connectAttr "b_trigger_grip.rpt" "b_trigger_grip_parentConstraint1.crt";
connectAttr "f_trigger_grip.t" "b_trigger_grip_parentConstraint1.tg[0].tt";
connectAttr "f_trigger_grip.rp" "b_trigger_grip_parentConstraint1.tg[0].trp";
connectAttr "f_trigger_grip.rpt" "b_trigger_grip_parentConstraint1.tg[0].trt";
connectAttr "f_trigger_grip.r" "b_trigger_grip_parentConstraint1.tg[0].tr";
connectAttr "f_trigger_grip.ro" "b_trigger_grip_parentConstraint1.tg[0].tro";
connectAttr "f_trigger_grip.s" "b_trigger_grip_parentConstraint1.tg[0].ts";
connectAttr "f_trigger_grip.pm" "b_trigger_grip_parentConstraint1.tg[0].tpm";
connectAttr "f_trigger_grip.jo" "b_trigger_grip_parentConstraint1.tg[0].tjo";
connectAttr "f_trigger_grip.ssc" "b_trigger_grip_parentConstraint1.tg[0].tsc";
connectAttr "f_trigger_grip.is" "b_trigger_grip_parentConstraint1.tg[0].tis";
connectAttr "b_trigger_grip_parentConstraint1.w0" "b_trigger_grip_parentConstraint1.tg[0].tw"
		;
connectAttr "controller_world.s" "b_thumbstick.is";
connectAttr "b_thumbstick_parentConstraint1.ctx" "b_thumbstick.tx";
connectAttr "b_thumbstick_parentConstraint1.cty" "b_thumbstick.ty";
connectAttr "b_thumbstick_parentConstraint1.ctz" "b_thumbstick.tz";
connectAttr "b_thumbstick_parentConstraint1.crx" "b_thumbstick.rx";
connectAttr "b_thumbstick_parentConstraint1.cry" "b_thumbstick.ry";
connectAttr "b_thumbstick_parentConstraint1.crz" "b_thumbstick.rz";
connectAttr "b_thumbstick.jo" "b_thumbstick_parentConstraint1.cjo";
connectAttr "b_thumbstick.ro" "b_thumbstick_parentConstraint1.cro";
connectAttr "b_thumbstick.pim" "b_thumbstick_parentConstraint1.cpim";
connectAttr "b_thumbstick.rp" "b_thumbstick_parentConstraint1.crp";
connectAttr "b_thumbstick.rpt" "b_thumbstick_parentConstraint1.crt";
connectAttr "f_thumbstick.t" "b_thumbstick_parentConstraint1.tg[0].tt";
connectAttr "f_thumbstick.rp" "b_thumbstick_parentConstraint1.tg[0].trp";
connectAttr "f_thumbstick.rpt" "b_thumbstick_parentConstraint1.tg[0].trt";
connectAttr "f_thumbstick.r" "b_thumbstick_parentConstraint1.tg[0].tr";
connectAttr "f_thumbstick.ro" "b_thumbstick_parentConstraint1.tg[0].tro";
connectAttr "f_thumbstick.s" "b_thumbstick_parentConstraint1.tg[0].ts";
connectAttr "f_thumbstick.pm" "b_thumbstick_parentConstraint1.tg[0].tpm";
connectAttr "f_thumbstick.jo" "b_thumbstick_parentConstraint1.tg[0].tjo";
connectAttr "f_thumbstick.ssc" "b_thumbstick_parentConstraint1.tg[0].tsc";
connectAttr "f_thumbstick.is" "b_thumbstick_parentConstraint1.tg[0].tis";
connectAttr "b_thumbstick_parentConstraint1.w0" "b_thumbstick_parentConstraint1.tg[0].tw"
		;
connectAttr "controller_world.s" "b_button_a.is";
connectAttr "b_button_a_parentConstraint1.ctx" "b_button_a.tx";
connectAttr "b_button_a_parentConstraint1.cty" "b_button_a.ty";
connectAttr "b_button_a_parentConstraint1.ctz" "b_button_a.tz";
connectAttr "b_button_a_parentConstraint1.crx" "b_button_a.rx";
connectAttr "b_button_a_parentConstraint1.cry" "b_button_a.ry";
connectAttr "b_button_a_parentConstraint1.crz" "b_button_a.rz";
connectAttr "b_button_a.ro" "b_button_a_parentConstraint1.cro";
connectAttr "b_button_a.pim" "b_button_a_parentConstraint1.cpim";
connectAttr "b_button_a.rp" "b_button_a_parentConstraint1.crp";
connectAttr "b_button_a.rpt" "b_button_a_parentConstraint1.crt";
connectAttr "b_button_a.jo" "b_button_a_parentConstraint1.cjo";
connectAttr "f_button_a.t" "b_button_a_parentConstraint1.tg[0].tt";
connectAttr "f_button_a.rp" "b_button_a_parentConstraint1.tg[0].trp";
connectAttr "f_button_a.rpt" "b_button_a_parentConstraint1.tg[0].trt";
connectAttr "f_button_a.r" "b_button_a_parentConstraint1.tg[0].tr";
connectAttr "f_button_a.ro" "b_button_a_parentConstraint1.tg[0].tro";
connectAttr "f_button_a.s" "b_button_a_parentConstraint1.tg[0].ts";
connectAttr "f_button_a.pm" "b_button_a_parentConstraint1.tg[0].tpm";
connectAttr "f_button_a.jo" "b_button_a_parentConstraint1.tg[0].tjo";
connectAttr "f_button_a.ssc" "b_button_a_parentConstraint1.tg[0].tsc";
connectAttr "f_button_a.is" "b_button_a_parentConstraint1.tg[0].tis";
connectAttr "b_button_a_parentConstraint1.w0" "b_button_a_parentConstraint1.tg[0].tw"
		;
connectAttr "controller_world.s" "b_button_b.is";
connectAttr "b_button_b_parentConstraint1.ctx" "b_button_b.tx";
connectAttr "b_button_b_parentConstraint1.cty" "b_button_b.ty";
connectAttr "b_button_b_parentConstraint1.ctz" "b_button_b.tz";
connectAttr "b_button_b_parentConstraint1.crx" "b_button_b.rx";
connectAttr "b_button_b_parentConstraint1.cry" "b_button_b.ry";
connectAttr "b_button_b_parentConstraint1.crz" "b_button_b.rz";
connectAttr "b_button_b.ro" "b_button_b_parentConstraint1.cro";
connectAttr "b_button_b.pim" "b_button_b_parentConstraint1.cpim";
connectAttr "b_button_b.rp" "b_button_b_parentConstraint1.crp";
connectAttr "b_button_b.rpt" "b_button_b_parentConstraint1.crt";
connectAttr "b_button_b.jo" "b_button_b_parentConstraint1.cjo";
connectAttr "f_button_b.t" "b_button_b_parentConstraint1.tg[0].tt";
connectAttr "f_button_b.rp" "b_button_b_parentConstraint1.tg[0].trp";
connectAttr "f_button_b.rpt" "b_button_b_parentConstraint1.tg[0].trt";
connectAttr "f_button_b.r" "b_button_b_parentConstraint1.tg[0].tr";
connectAttr "f_button_b.ro" "b_button_b_parentConstraint1.tg[0].tro";
connectAttr "f_button_b.s" "b_button_b_parentConstraint1.tg[0].ts";
connectAttr "f_button_b.pm" "b_button_b_parentConstraint1.tg[0].tpm";
connectAttr "f_button_b.jo" "b_button_b_parentConstraint1.tg[0].tjo";
connectAttr "f_button_b.ssc" "b_button_b_parentConstraint1.tg[0].tsc";
connectAttr "f_button_b.is" "b_button_b_parentConstraint1.tg[0].tis";
connectAttr "b_button_b_parentConstraint1.w0" "b_button_b_parentConstraint1.tg[0].tw"
		;
connectAttr "controller_world.ro" "controller_world_parentConstraint1.cro";
connectAttr "controller_world.pim" "controller_world_parentConstraint1.cpim";
connectAttr "controller_world.rp" "controller_world_parentConstraint1.crp";
connectAttr "controller_world.rpt" "controller_world_parentConstraint1.crt";
connectAttr "controller_world.jo" "controller_world_parentConstraint1.cjo";
connectAttr "f_world.t" "controller_world_parentConstraint1.tg[0].tt";
connectAttr "f_world.rp" "controller_world_parentConstraint1.tg[0].trp";
connectAttr "f_world.rpt" "controller_world_parentConstraint1.tg[0].trt";
connectAttr "f_world.r" "controller_world_parentConstraint1.tg[0].tr";
connectAttr "f_world.ro" "controller_world_parentConstraint1.tg[0].tro";
connectAttr "f_world.s" "controller_world_parentConstraint1.tg[0].ts";
connectAttr "f_world.pm" "controller_world_parentConstraint1.tg[0].tpm";
connectAttr "f_world.jo" "controller_world_parentConstraint1.tg[0].tjo";
connectAttr "f_world.ssc" "controller_world_parentConstraint1.tg[0].tsc";
connectAttr "f_world.is" "controller_world_parentConstraint1.tg[0].tis";
connectAttr "controller_world_parentConstraint1.w0" "controller_world_parentConstraint1.tg[0].tw"
		;
connectAttr "skel:controller_r_model:skinCluster4GroupId.id" "controller_plyShape.iog.og[4].gid"
		;
connectAttr "skel:controller_r_model:skinCluster4Set.mwc" "controller_plyShape.iog.og[4].gco"
		;
connectAttr "skel:controller_r_model:groupId80.id" "controller_plyShape.iog.og[5].gid"
		;
connectAttr "skel:controller_r_model:tweakSet4.mwc" "controller_plyShape.iog.og[5].gco"
		;
connectAttr "skel:controller_r_model:skinCluster4.og[0]" "controller_plyShape.i"
		;
connectAttr "skel:controller_r_model:tweak4.vl[0].vt[0]" "controller_plyShape.twl"
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "skel:controller_r_model:controllerSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "skel:controller_r_model:controllerSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "f_world.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "f_trigger_grip.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "f_trigger_front.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "f_thumbstick.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "f_button_oculus.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "f_button_b.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "f_button_a.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "layerManager.dli[1]" "geom_lyr.id";
connectAttr "layerManager.dli[2]" "skel_lyr.id";
connectAttr "shapeEditorManager.obsv[0]" "skel:shapeEditorManager.bsdt[0].bdpv";
connectAttr "skel:renderLayerManager.rlmi[0]" "skel:defaultRenderLayer.rlid";
connectAttr "layerManager.dli[3]" "skel:layer1.id";
connectAttr "skel:controller_r_model:skinCluster4GroupId.msg" "skel:controller_r_model:skinCluster4Set.gn"
		 -na;
connectAttr "controller_plyShape.iog.og[4]" "skel:controller_r_model:skinCluster4Set.dsm"
		 -na;
connectAttr "skel:controller_r_model:skinCluster4.msg" "skel:controller_r_model:skinCluster4Set.ub[0]"
		;
connectAttr "skel:controller_r_model:skinCluster4GroupParts.og" "skel:controller_r_model:skinCluster4.ip[0].ig"
		;
connectAttr "skel:controller_r_model:skinCluster4GroupId.id" "skel:controller_r_model:skinCluster4.ip[0].gi"
		;
connectAttr "controller_world.wm" "skel:controller_r_model:skinCluster4.ma[0]";
connectAttr "b_button_oculus.wm" "skel:controller_r_model:skinCluster4.ma[1]";
connectAttr "b_trigger_front.wm" "skel:controller_r_model:skinCluster4.ma[2]";
connectAttr "b_trigger_grip.wm" "skel:controller_r_model:skinCluster4.ma[3]";
connectAttr "b_thumbstick.wm" "skel:controller_r_model:skinCluster4.ma[4]";
connectAttr "b_button_a.wm" "skel:controller_r_model:skinCluster4.ma[5]";
connectAttr "b_button_b.wm" "skel:controller_r_model:skinCluster4.ma[6]";
connectAttr "controller_world.liw" "skel:controller_r_model:skinCluster4.lw[0]";
connectAttr "b_button_oculus.liw" "skel:controller_r_model:skinCluster4.lw[1]";
connectAttr "b_trigger_front.liw" "skel:controller_r_model:skinCluster4.lw[2]";
connectAttr "b_trigger_grip.liw" "skel:controller_r_model:skinCluster4.lw[3]";
connectAttr "b_thumbstick.liw" "skel:controller_r_model:skinCluster4.lw[4]";
connectAttr "b_button_a.liw" "skel:controller_r_model:skinCluster4.lw[5]";
connectAttr "b_button_b.liw" "skel:controller_r_model:skinCluster4.lw[6]";
connectAttr "controller_world.obcc" "skel:controller_r_model:skinCluster4.ifcl[0]"
		;
connectAttr "b_button_oculus.obcc" "skel:controller_r_model:skinCluster4.ifcl[1]"
		;
connectAttr "b_trigger_front.obcc" "skel:controller_r_model:skinCluster4.ifcl[2]"
		;
connectAttr "b_trigger_grip.obcc" "skel:controller_r_model:skinCluster4.ifcl[3]"
		;
connectAttr "b_thumbstick.obcc" "skel:controller_r_model:skinCluster4.ifcl[4]";
connectAttr "b_button_a.obcc" "skel:controller_r_model:skinCluster4.ifcl[5]";
connectAttr "b_button_b.obcc" "skel:controller_r_model:skinCluster4.ifcl[6]";
connectAttr "skel:controller_r_model:bindPose1.msg" "skel:controller_r_model:skinCluster4.bp"
		;
connectAttr "controller_world.msg" "skel:controller_r_model:bindPose1.m[0]";
connectAttr "b_button_oculus.msg" "skel:controller_r_model:bindPose1.m[1]";
connectAttr "b_trigger_front.msg" "skel:controller_r_model:bindPose1.m[2]";
connectAttr "b_trigger_grip.msg" "skel:controller_r_model:bindPose1.m[3]";
connectAttr "b_thumbstick.msg" "skel:controller_r_model:bindPose1.m[4]";
connectAttr "b_button_a.msg" "skel:controller_r_model:bindPose1.m[5]";
connectAttr "b_button_b.msg" "skel:controller_r_model:bindPose1.m[6]";
connectAttr "skel:controller_r_model:bindPose1.w" "skel:controller_r_model:bindPose1.p[0]"
		;
connectAttr "skel:controller_r_model:bindPose1.m[0]" "skel:controller_r_model:bindPose1.p[1]"
		;
connectAttr "skel:controller_r_model:bindPose1.m[0]" "skel:controller_r_model:bindPose1.p[2]"
		;
connectAttr "skel:controller_r_model:bindPose1.m[0]" "skel:controller_r_model:bindPose1.p[3]"
		;
connectAttr "skel:controller_r_model:bindPose1.m[0]" "skel:controller_r_model:bindPose1.p[4]"
		;
connectAttr "skel:controller_r_model:bindPose1.m[0]" "skel:controller_r_model:bindPose1.p[5]"
		;
connectAttr "skel:controller_r_model:bindPose1.m[0]" "skel:controller_r_model:bindPose1.p[6]"
		;
connectAttr "controller_world.bps" "skel:controller_r_model:bindPose1.wm[0]";
connectAttr "b_button_oculus.bps" "skel:controller_r_model:bindPose1.wm[1]";
connectAttr "b_trigger_front.bps" "skel:controller_r_model:bindPose1.wm[2]";
connectAttr "b_trigger_grip.bps" "skel:controller_r_model:bindPose1.wm[3]";
connectAttr "b_thumbstick.bps" "skel:controller_r_model:bindPose1.wm[4]";
connectAttr "b_button_a.bps" "skel:controller_r_model:bindPose1.wm[5]";
connectAttr "b_button_b.bps" "skel:controller_r_model:bindPose1.wm[6]";
connectAttr "skel:controller_r_model:tweak4.og[0]" "skel:controller_r_model:skinCluster4GroupParts.ig"
		;
connectAttr "skel:controller_r_model:skinCluster4GroupId.id" "skel:controller_r_model:skinCluster4GroupParts.gi"
		;
connectAttr "skel:controller_r_model:groupParts26.og" "skel:controller_r_model:tweak4.ip[0].ig"
		;
connectAttr "skel:controller_r_model:groupId80.id" "skel:controller_r_model:tweak4.ip[0].gi"
		;
connectAttr "skel:controller_r_model:groupId80.msg" "skel:controller_r_model:tweakSet4.gn"
		 -na;
connectAttr "controller_plyShape.iog.og[5]" "skel:controller_r_model:tweakSet4.dsm"
		 -na;
connectAttr "skel:controller_r_model:tweak4.msg" "skel:controller_r_model:tweakSet4.ub[0]"
		;
connectAttr "controller_plyShapeOrig.w" "skel:controller_r_model:groupParts26.ig"
		;
connectAttr "skel:controller_r_model:groupId80.id" "skel:controller_r_model:groupParts26.gi"
		;
connectAttr "skel:controller_r_model:controllerSG.msg" "skel:controller_r_model:controller_materialInfo1.sg"
		;
connectAttr ":defaultColorMgtGlobals.cme" "skel:controller_r_model:file2.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "skel:controller_r_model:file2.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "skel:controller_r_model:file2.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "skel:controller_r_model:file2.ws";
connectAttr "skel:controller_r_model:place2dTexture3.c" "skel:controller_r_model:file2.c"
		;
connectAttr "skel:controller_r_model:place2dTexture3.tf" "skel:controller_r_model:file2.tf"
		;
connectAttr "skel:controller_r_model:place2dTexture3.rf" "skel:controller_r_model:file2.rf"
		;
connectAttr "skel:controller_r_model:place2dTexture3.mu" "skel:controller_r_model:file2.mu"
		;
connectAttr "skel:controller_r_model:place2dTexture3.mv" "skel:controller_r_model:file2.mv"
		;
connectAttr "skel:controller_r_model:place2dTexture3.s" "skel:controller_r_model:file2.s"
		;
connectAttr "skel:controller_r_model:place2dTexture3.wu" "skel:controller_r_model:file2.wu"
		;
connectAttr "skel:controller_r_model:place2dTexture3.wv" "skel:controller_r_model:file2.wv"
		;
connectAttr "skel:controller_r_model:place2dTexture3.re" "skel:controller_r_model:file2.re"
		;
connectAttr "skel:controller_r_model:place2dTexture3.of" "skel:controller_r_model:file2.of"
		;
connectAttr "skel:controller_r_model:place2dTexture3.r" "skel:controller_r_model:file2.ro"
		;
connectAttr "skel:controller_r_model:place2dTexture3.n" "skel:controller_r_model:file2.n"
		;
connectAttr "skel:controller_r_model:place2dTexture3.vt1" "skel:controller_r_model:file2.vt1"
		;
connectAttr "skel:controller_r_model:place2dTexture3.vt2" "skel:controller_r_model:file2.vt2"
		;
connectAttr "skel:controller_r_model:place2dTexture3.vt3" "skel:controller_r_model:file2.vt3"
		;
connectAttr "skel:controller_r_model:place2dTexture3.vc1" "skel:controller_r_model:file2.vc1"
		;
connectAttr "skel:controller_r_model:place2dTexture3.o" "skel:controller_r_model:file2.uv"
		;
connectAttr "skel:controller_r_model:place2dTexture3.ofs" "skel:controller_r_model:file2.fs"
		;
connectAttr "b_trigger_grip_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "b_trigger_front_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "b_thumbstick_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "b_button_oculus_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "controller_world_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "b_button_a_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr "b_button_b_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn"
		;
connectAttr "f_button_oculus.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn";
connectAttr "controller_ply.iog" "GameExport.dsm" -na;
connectAttr "controller_world.iog" "GameExport.dsm" -na;
connectAttr "b_button_oculus.iog" "GameExport.dsm" -na;
connectAttr "b_trigger_front.iog" "GameExport.dsm" -na;
connectAttr "b_trigger_grip.iog" "GameExport.dsm" -na;
connectAttr "b_thumbstick.iog" "GameExport.dsm" -na;
connectAttr "b_button_a.iog" "GameExport.dsm" -na;
connectAttr "b_button_b.iog" "GameExport.dsm" -na;
connectAttr "skel:controller_r_model:controllerSG.pa" ":renderPartition.st" -na;
connectAttr "skel:controller_r_model:place2dTexture3.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "skel:defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "skel:controller_r_model:file2.msg" ":defaultTextureList1.tx" -na;
// End of controller_r.ma
