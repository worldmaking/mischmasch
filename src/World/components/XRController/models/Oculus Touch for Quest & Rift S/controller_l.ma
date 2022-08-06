//Maya ASCII 2019 scene
//Name: controller_l.ma
//Last modified: Mon, Apr 15, 2019 02:58:29 PM
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
	rename -uid "FD53868B-451A-1E89-A783-6B97DE39C31D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -10.947954351018844 15.94045105933246 -15.266186797937824 ;
	setAttr ".r" -type "double3" -41.73835273044542 221.39999999991943 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "D19C5579-4E88-3F93-EC0B-D3832E54BB21";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 24.110986053803849;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.94999992847442627 -0.11095547676086426 -1.7706067562103271 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "25082353-48A8-04A2-4860-21A8A80A6459";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "2F02A5F6-41BD-8864-1038-2CB757BBE266";
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
	rename -uid "A7BCE3E1-4D0F-E576-8A20-16A0EE8149C9";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "67CFB211-4F84-85B6-AEB6-04B7E5AA6BA1";
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
	rename -uid "BEAC3E94-46AB-2B71-8263-48B86DE52A4C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "BDA388B7-4FFD-0787-6C3F-33AEBB24B19F";
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
	rename -uid "E191F830-4919-F58B-D4E2-1080E80C04E4";
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
	rename -uid "0BEC1694-4504-4E10-4F64-5A8205A69237";
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
	rename -uid "2AFF28DA-479C-1B4A-ED05-04A01EFAA049";
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
createNode transform -n "f_button_menu_hmnul" -p "f_world";
	rename -uid "1DF92455-414A-A2BE-2453-16A9A95FC47B";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0.95001731116390153 2.3247810857577416 -0.61289872525096956 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 179.99999999999994 -79.000000000000014 90 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr ".s" -type "double3" 0.99999999999999978 1 0.99999999999999956 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "f_button_menu" -p "f_button_menu_hmnul";
	rename -uid "7FDAD193-4314-B37A-0B7E-D09A1EFFE547";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 -1.1102230246251565e-16 0 ;
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".jo" -type "double3" -1.590277340731758e-15 -2.6483437788300939e-31 -1.9083328088781097e-14 ;
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
	setAttr ".restMatrix" -type "matrix" 0 0.98162718344766398 -0.19080899537654444 0
		 1 1.6653345369377333e-16 1.1102230246251567e-15 0 1.165734175856414e-15 -0.19080899537654436 -0.98162718344766375 0
		 0.95001731116390142 -0.61289872525096911 -2.324781085757742 1;
createNode nurbsCurve -n "f_button_menuShape" -p "f_button_menu";
	rename -uid "EE0DF6B5-4780-CA0C-009A-438C7A841520";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		1 4 0 no 3
		5 0 1 2 3 4
		5
		0.11999999999999991 0.40000000000000002 0.40000000000000002
		0.11999999999999991 -0.40000000000000002 0.40000000000000002
		0.12000000000000009 -0.40000000000000002 -0.39999999999999997
		0.12000000000000009 0.40000000000000002 -0.39999999999999997
		0.11999999999999991 0.40000000000000002 0.40000000000000002
		;
createNode transform -n "f_button_y_hmnul" -p "f_world";
	rename -uid "8252BDF0-4AC0-FEFF-F029-7C965621281D";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" -0.2545751810073853 -0.89058268392422102 0.086994374095481899 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 179.99999999999994 -79.000000000000014 90 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr ".s" -type "double3" 0.99999999999999978 1 0.99999999999999956 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "f_button_y" -p "f_button_y_hmnul";
	rename -uid "04B0FECE-45B4-C018-FD68-9F97BCC79972";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 2.7755575615628914e-17 0 1.1102230246251565e-16 ;
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".jo" -type "double3" -1.590277340731758e-15 -2.6483437788300939e-31 -1.9083328088781097e-14 ;
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
	setAttr ".restMatrix" -type "matrix" 0 0.98162718344766398 -0.19080899537654444 0
		 1 1.6653345369377333e-16 1.1102230246251567e-15 0 1.165734175856414e-15 -0.19080899537654436 -0.98162718344766375 0
		 -0.2545751810073853 0.086994374095481719 0.89058268392422113 1;
createNode nurbsCurve -n "f_button_yShape1" -p "f_button_y";
	rename -uid "959F664F-4359-7419-949C-A9AA9E603EC9";
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
createNode transform -n "f_button_x_hmnul" -p "f_world";
	rename -uid "4DD45006-4CEF-EA4E-F7F9-4ABFDFB7446F";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0.14917255640029914 0.51105205390559683 -0.12166069951809239 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" 179.99999999999994 -79.000000000000014 90 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr ".s" -type "double3" 0.99999999999999978 1 0.99999999999999956 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "f_button_x" -p "f_button_x_hmnul";
	rename -uid "A1364A59-46E0-DD15-BD30-9095372DDBF7";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 3.4694469519536142e-18 0 1.1102230246251565e-16 ;
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".jo" -type "double3" -1.590277340731758e-15 -2.6483437788300939e-31 -1.9083328088781097e-14 ;
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
	setAttr ".restMatrix" -type "matrix" 0 0.98162718344766398 -0.19080899537654444 0
		 1 1.6653345369377333e-16 1.1102230246251567e-15 0 1.165734175856414e-15 -0.19080899537654436 -0.98162718344766375 0
		 0.14917255640029914 -0.12166069951809232 -0.51105205390559705 1;
createNode nurbsCurve -n "f_button_xShape1" -p "f_button_x";
	rename -uid "581F49EA-4CF9-8B52-FAA1-55B2C22E10B5";
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
	rename -uid "E93D5DDC-4C06-9612-072F-9787B3630C6E";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0.95 -2.3752194691008084 -0.86003179572158728 ;
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
	rename -uid "63B5BFBB-41CA-3118-6FF8-0DBB3EF4D95F";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
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
		 0.94999999999999996 -0.86003179572158805 2.3752194691008088 1;
createNode nurbsCurve -n "f_trigger_frontShape1" -p "f_trigger_front";
	rename -uid "980A4D76-4796-F6D3-012F-F8AC06641DA5";
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
	rename -uid "A7EB8A0A-4F5B-AF07-4F10-E18FC35E09B8";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0.31085510253906246 -0.097918850357390605 -1.79830165223494 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" -0.0011904840358931382 79.500004545109562 -90.00005444657134 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr ".s" -type "double3" 0.99999999999999967 1 0.99999999999999978 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "f_trigger_grip" -p "f_trigger_grip_hmnul";
	rename -uid "24F81DD4-446C-82E5-79C0-A4A0078A6F71";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 -5.5511151231257827e-17 0 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".jo" -type "double3" -2.9420130803537528e-14 -1.3517357396219944e-14 9.0447023754118785e-15 ;
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
	setAttr ".restMatrix" -type "matrix" -1.7317323175447536e-07 -0.98325492202017206 0.18223544749327761 0
		 0.99999999980310261 -3.7864637299489489e-06 -1.9479667192734421e-05 0 1.984350655881428e-05 0.18223544745402265 0.98325492182722751 0
		 0.3108551025390624 -1.7983016522349404 0.09791885035739023 1;
createNode nurbsCurve -n "f_trigger_gripShape1" -p "f_trigger_grip";
	rename -uid "8DABDBE4-4431-C907-07EE-08BE10575EA2";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 0 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.533611624891225 -1.2500000000000004 -1.7163883751087761
		0.74999999999999989 -1.2500000000000002 -1.3918058124456119
		-0.033611624891224268 -1.2500000000000004 -1.7163883751087756
		-0.35819418755438792 -1.2500000000000004 -2.4999999999999991
		-0.03361162489122449 -1.2500000000000007 -3.2836116248912237
		0.74999999999999967 -1.2500000000000009 -3.6081941875543877
		1.5336116248912237 -1.2500000000000007 -3.2836116248912242
		1.8581941875543879 -1.2500000000000007 -2.5
		1.533611624891225 -1.2500000000000004 -1.7163883751087761
		0.74999999999999989 -1.2500000000000002 -1.3918058124456119
		-0.033611624891224268 -1.2500000000000004 -1.7163883751087756
		;
createNode transform -n "f_thumbstick_hmnul" -p "f_world";
	rename -uid "AE5AAFC5-42E7-836A-8D4A-85BB01460A86";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 1.8000000238418579 -1.0134227177445241 -0.41637452692404908 ;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr ".r" -type "double3" -89.999999999999858 -79.499999999999986 89.999999999999929 ;
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on ".ro";
	setAttr ".s" -type "double3" 0.99999999999999989 1 1 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
createNode joint -n "f_thumbstick" -p "f_thumbstick_hmnul";
	rename -uid "72972C20-43B2-358C-791B-CC8DC5F64824";
	addAttr -s false -ci true -sn "isControl" -ln "isControl" -at "message";
	addAttr -ci true -sn "restMatrix" -ln "restMatrix" -dt "matrix";
	setAttr -l on -k off ".v";
	setAttr ".t" -type "double3" 0 0 2.2204460492503131e-16 ;
	setAttr -l on ".ro";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".jo" -type "double3" 1.5902773407317571e-14 -6.3611093629270297e-14 1.2722218725854053e-14 ;
	setAttr -l on ".jox";
	setAttr -l on ".joy";
	setAttr -l on ".joz";
	setAttr ".ds" 2;
	setAttr -l on -cb off ".radi";
	setAttr ".restMatrix" -type "matrix" 3.3306690738754691e-16 0.98325490756395473 -0.18223552549214742 0
		 -1.5959455978986629e-15 -0.18223552549214744 -0.98325490756395473 0 -1 6.6613381477509383e-16 1.5126788710517768e-15 0
		 1.8000000238418576 -0.41637452692404942 1.0134227177445243 1;
createNode nurbsCurve -n "f_thumbstickShape1" -p "f_thumbstick";
	rename -uid "59C024C7-4CAE-2F5B-0CD1-B787C540376F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovc" 17;
	setAttr ".cc" -type "nurbsCurve" 
		3 8 0 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		1.2000000000000002 0.78361162489122382 -0.78361162489122482
		1.2 1.1081941875543879 3.9288523198833084e-16
		1.1999999999999997 0.78361162489122427 0.78361162489122449
		1.1999999999999997 3.2112695072372299e-16 1.1081941875543881
		1.1999999999999997 -0.78361162489122405 0.78361162489122471
		1.2 -1.1081941875543881 6.0037406226908956e-16
		1.2000000000000002 -0.78361162489122438 -0.7836116248912236
		1.2000000000000002 -5.9521325992805852e-16 -1.1081941875543877
		1.2000000000000002 0.78361162489122382 -0.78361162489122482
		1.2 1.1081941875543879 3.9288523198833084e-16
		1.1999999999999997 0.78361162489122427 0.78361162489122449
		;
createNode joint -n "controller_world";
	rename -uid "F329FA8C-4D84-C2D0-E311-C3AD24D8862E";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".jo" -type "double3" -90 0 0 ;
	setAttr ".ssc" no;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 2.2204460492503131e-16 -1 0 0 1 2.2204460492503131e-16 0
		 0 0 0 1;
	setAttr -k on ".liw";
	setAttr ".fbxID" 5;
createNode joint -n "b_button_menu" -p "controller_world";
	rename -uid "8B06ED91-403B-1A34-6EBB-C5B63D2B8809";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".jo" -type "double3" -179.99999999999986 -79 89.999999999999872 ;
	setAttr ".bps" -type "matrix" 3.3306690738754691e-16 0.98162718344766386 -0.19080899537654458 0
		 1 -4.4408920985006262e-16 -1.1102230246251575e-16 0 -2.2204460492503128e-16 -0.19080899537654458 -0.98162718344766386 0
		 0.95001733303070068 -0.61289870738983099 -2.3247811794281006 1;
	setAttr -k on ".liw";
	setAttr ".fbxID" 5;
createNode parentConstraint -n "b_button_menu_parentConstraint1" -p "b_button_menu";
	rename -uid "0968F5DA-4DB2-5011-F4C4-72B2FB651655";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_button_menuW0" -dv 1 -min 0 -at "double";
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
	setAttr ".tg[0].tot" -type "double3" 3.5406125198367278e-08 2.186679926019508e-08 
		8.854130451041442e-08 ;
	setAttr ".tg[0].tor" -type "double3" 7.5969157864981525e-14 -2.7034714792439894e-14 
		1.9083328088781075e-14 ;
	setAttr ".lr" -type "double3" -6.9972202992197363e-14 2.2263882770244605e-14 -1.9083328088781113e-14 ;
	setAttr ".rst" -type "double3" 0.95001733303070068 2.3247811794281006 -0.61289870738983154 ;
	setAttr ".rsrr" -type "double3" -6.9972202992197363e-14 2.2263882770244605e-14 -1.9083328088781113e-14 ;
	setAttr -k on ".w0";
createNode joint -n "b_button_y" -p "controller_world";
	rename -uid "A360F199-454C-7875-2FEF-1085B4AFF07A";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".s" -type "double3" 0.99999999999999989 1 0.99999999999999989 ;
	setAttr ".jo" -type "double3" -179.99999999999986 -79 89.999999999999872 ;
	setAttr ".bps" -type "matrix" 3.3306690738754691e-16 0.98162718344766386 -0.19080899537654458 0
		 1 -4.4408920985006262e-16 -1.1102230246251575e-16 0 -2.2204460492503128e-16 -0.19080899537654458 -0.98162718344766386 0
		 -0.25457519292831421 0.086994372308254048 0.89058268070220947 1;
	setAttr -k on ".liw";
	setAttr ".fbxID" 5;
createNode parentConstraint -n "b_button_y_parentConstraint1" -p "b_button_y";
	rename -uid "79374852-434E-5998-1D19-08A7E527952B";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_button_yW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
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
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -6.9972202992197363e-14 2.2263882770244605e-14 -1.9083328088781113e-14 ;
	setAttr ".rst" -type "double3" -0.2545751810073853 -0.89058268392422113 0.086994374095481913 ;
	setAttr ".rsrr" -type "double3" -7.9513867036587948e-14 9.5416640443905377e-15 -1.908332808878111e-14 ;
	setAttr -k on ".w0";
createNode joint -n "b_button_x" -p "controller_world";
	rename -uid "96B99FA6-4719-6570-440F-CC985B71BF16";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".s" -type "double3" 0.99999999999999978 0.99999999999999989 0.99999999999999989 ;
	setAttr ".jo" -type "double3" -179.99999999999986 -79.000000000000014 89.999999999999872 ;
	setAttr ".bps" -type "matrix" 5.5511151231257817e-16 0.98162718344766364 -0.19080899537654444 0
		 0.99999999999999978 -4.9960036108132034e-16 -1.1102230246251575e-16 0 -1.1102230246251564e-16 -0.19080899537654436 -0.98162718344766386 0
		 0.14917255938053131 -0.12166070193052281 -0.51105207204818726 1;
	setAttr -k on ".liw";
	setAttr ".fbxID" 5;
createNode parentConstraint -n "b_button_x_parentConstraint1" -p "b_button_x";
	rename -uid "D288025D-42A2-B71E-CD2C-69981193AE07";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_button_xW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
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
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -6.6791648310733855e-14 1.9083328088781088e-14 -2.5444437451708147e-14 ;
	setAttr ".rst" -type "double3" 0.14917255640029914 0.51105205390559705 -0.12166069951809243 ;
	setAttr ".rsrr" -type "double3" -7.3152757673660908e-14 3.1805546814635018e-15 -2.544443745170814e-14 ;
	setAttr -k on ".w0";
createNode joint -n "b_trigger_front" -p "controller_world";
	rename -uid "E292F033-4D3E-8B06-D181-DC9FFC071CD7";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".s" -type "double3" 1 0.99999999999999967 0.99999999999999989 ;
	setAttr ".jo" -type "double3" 10.999999999999998 7.016709298534876e-15 -180 ;
	setAttr ".bps" -type "matrix" -1 -2.7192621468937816e-32 1.224646799147353e-16 0
		 1.2021465881652127e-16 0.19080899537654444 0.98162718344766342 0 -2.3367362543640757e-17 0.98162718344766386 -0.19080899537654447 0
		 0.94999998807907104 -0.86003178358078058 2.3752195835113525 1;
	setAttr -k on ".liw";
	setAttr ".fbxID" 5;
createNode parentConstraint -n "b_trigger_front_parentConstraint1" -p "b_trigger_front";
	rename -uid "0A444A5E-4E00-47D7-ED44-D79CA7907442";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_trigger_frontW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
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
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" -3.0215269473903408e-14 -2.6777025042053994e-15 -1.3775585171583647e-14 ;
	setAttr ".rst" -type "double3" 0.95 -2.3752194691008088 -0.8600317957215875 ;
	setAttr ".rsrr" -type "double3" -1.7493050748049341e-14 -2.6777025042053994e-15 
		-1.3775585171583647e-14 ;
	setAttr -k on ".w0";
createNode joint -n "b_trigger_grip" -p "controller_world";
	rename -uid "6F5F703D-4C56-C1E9-A8AA-6D9DF70491BF";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".s" -type "double3" 0.99999999999999967 0.99999999999999978 0.99999999999999956 ;
	setAttr ".jo" -type "double3" -0.0011904840360946938 79.500004545109562 -90.000054446571525 ;
	setAttr ".bps" -type "matrix" -1.7317323175447536e-07 -0.98325492202017162 0.18223544749327772 0
		 0.99999999980310217 -3.7864637303930347e-06 -1.9479667193289526e-05 0 1.9843506559258352e-05 0.18223544745402268 0.98325492182722685 0
		 0.31085509061813354 -1.7983016967773438 0.097918853163718775 1;
	setAttr -k on ".liw";
	setAttr ".fbxID" 5;
createNode parentConstraint -n "b_trigger_grip_parentConstraint1" -p "b_trigger_grip";
	rename -uid "F96B3D8A-45C3-31ED-8D07-66BA3D9147D3";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_trigger_gripW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
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
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 5.7249984266343308e-14 2.8624992133171654e-14 1.5902773407317603e-14 ;
	setAttr ".rst" -type "double3" 0.3108551025390624 -0.097918850357390633 -1.7983016522349404 ;
	setAttr ".rsrr" -type "double3" 6.0430538947806828e-14 1.5902773407317578e-14 1.5902773407317596e-14 ;
	setAttr -k on ".w0";
createNode joint -n "b_thumbstick" -p "controller_world";
	rename -uid "BF29ACE8-470A-8C60-DCB2-66BD6A532282";
	addAttr -is true -ci true -k true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 
		1 -at "bool";
	addAttr -ci true -h true -sn "fbxID" -ln "filmboxTypeID" -at "short";
	setAttr ".s" -type "double3" 0.99999999999999989 0.99999999999999978 1.0000000000000002 ;
	setAttr ".jo" -type "double3" -89.999999999999929 -79.499999999999986 89.999999999999929 ;
	setAttr ".bps" -type "matrix" 1.1102230246251564e-16 0.98325490756395462 -0.1822355254921475 0
		 -1.1102230246251565e-16 -0.1822355254921475 -0.98325490756395428 0 -1.0000000000000004 1.1102230246251565e-16 5.5511151231257876e-17 0
		 1.8000000715255737 -0.41637453436851524 1.0134227275848389 1;
	setAttr -k on ".liw";
	setAttr ".fbxID" 5;
createNode parentConstraint -n "b_thumbstick_parentConstraint1" -p "b_thumbstick";
	rename -uid "D844C2C5-43F7-28B9-C879-E5BCC1EBA550";
	addAttr -dcb 0 -ci true -k true -sn "w0" -ln "f_thumbstickW0" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
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
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 6.679164831073383e-14 -6.1623246953355493e-15 -2.2263882770244614e-14 ;
	setAttr ".rst" -type "double3" 1.8000000238418576 -1.0134227177445243 -0.41637452692404919 ;
	setAttr ".rsrr" -type "double3" 1.0018747246610075e-13 3.677516350442191e-15 -7.9513867036587584e-16 ;
	setAttr -k on ".w0";
createNode parentConstraint -n "controller_world_parentConstraint1" -p "controller_world";
	rename -uid "98FB5B6D-48CC-78C1-BFC4-C09AB45AED5D";
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
	setAttr ".lr" -type "double3" 2.5444437451708134e-14 0 0 ;
	setAttr ".rsrr" -type "double3" 2.5444437451708134e-14 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "controller_ply";
	rename -uid "2669BEA6-48D1-21CE-41A2-5D96D7B49718";
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
	rename -uid "1B9E7EE5-4A69-721D-FFE2-3D9E72E4824D";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.50034617003984749 0.4983370581176132 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".vcs" 2;
createNode mesh -n "controller_plyShapeOrig" -p "controller_ply";
	rename -uid "A01D5BE0-4163-4614-044A-8E8866643C02";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 2432 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.92952025 0.24675974 0.94074899
		 0.24617505 0.92940009 0.23553362 0.94119674 0.23538284 0.91867924 0.24658504 0.91772133
		 0.23581453 0.90718901 0.24638052 0.90562361 0.23672059 0.91954941 0.26921672 0.91018516
		 0.26729158 0.9651047 0.19850919 0.96894395 0.20858607 0.9783209 0.20117287 0.98281986
		 0.20954692 0.96332002 0.24578834 0.97641313 0.24723086 0.96616906 0.23642801 0.98174733
		 0.23820303 0.94033068 0.26884639 0.94963938 0.26655781 0.95179987 0.24554059 0.95884317
		 0.26266858 0.92993933 0.26969972 0.96924311 0.21730013 0.95580542 0.21551809 0.95748657
		 0.20529543 0.88836396 0.21865819 0.90205389 0.216373 0.88839877 0.209755 0.90006208
		 0.20649852 0.87460995 0.21126659 0.87273848 0.22003213 0.96862757 0.22664343 0.95444739
		 0.22565524 0.94226831 0.21388087 0.92893344 0.21324128 0.94189137 0.2249998 0.92912972
		 0.22481439 0.91669738 0.22541918 0.91557741 0.21448039 0.90375614 0.22655642 0.8733567
		 0.22997671 0.88989538 0.22800024 0.95337951 0.23586419 0.98485047 0.22802924 0.98507053
		 0.21814686 0.87691683 0.24008051 0.89266425 0.23774645 0.90090472 0.26369667 0.89648682
		 0.24703602 0.88261694 0.24901314 0.89078027 0.25705069 0.96871835 0.25564027 0.88504326
		 0.19460195 0.89654654 0.19184804 0.89315134 0.18759403 0.9004935 0.18317366 0.94364887
		 0.20229363 0.91393507 0.20254807 0.92867482 0.2007229 0.93928766 0.18492314 0.93717498
		 0.17650865 0.92846173 0.18408367 0.92835855 0.17602341 0.91774952 0.18518399 0.91959739
		 0.17677259 0.94764662 0.17893764 0.95085776 0.18753907 0.90929735 0.17947721 0.90628356
		 0.18829516 0.94143867 0.19349048 0.95412719 0.19629671 0.92856681 0.19229034 0.91586816
		 0.19374815 0.90321505 0.19727327 0.89252794 0.20067996 0.87875843 0.20258203 0.97210884
		 0.1935723 0.96077573 0.19045182 0.95652395 0.18253818 0.96397823 0.18672107 0.89122236
		 0.18673545 0.89315134 0.18759403 0.89927948 0.18174729 0.9004935 0.18317366 0.90848982
		 0.17783567 0.90929735 0.17947721 0.91875374 0.17507765 0.91959739 0.17677259 0.92832983
		 0.17418653 0.92835855 0.17602341 0.91967559 0.27104706 0.91954941 0.26921672 0.90937209
		 0.26895276 0.91018516 0.26729158 0.89931256 0.2650063 0.90090472 0.26369667 0.92997539
		 0.27149209 0.92993933 0.26969972 0.88926613 0.25821745 0.89078027 0.25705069 0.88098818
		 0.24988657 0.88261694 0.24901314 0.9379856 0.17477043 0.93717498 0.17650865 0.95775032
		 0.18106526 0.94844413 0.1772631 0.95652395 0.18253818 0.94764662 0.17893764 0.96584785
		 0.18585423 0.96397823 0.18672107 0.97993195 0.20035499 0.97378349 0.19265309 0.9783209
		 0.20117287 0.97210884 0.1935723 0.98451728 0.20897591 0.98281986 0.20954692 0.98659474
		 0.2284584 0.98485047 0.22802924 0.98345375 0.23875144 0.98174733 0.23820303 0.97806478
		 0.24802494 0.97641313 0.24723086 0.97026294 0.25671983 0.96871835 0.25564027 0.98684078
		 0.21800183 0.98507053 0.21814686 0.96046549 0.26390147 0.95884317 0.26266858 0.95052999
		 0.26819143 0.94963938 0.26655781 0.94028199 0.27068681 0.94033068 0.26884639 0.87710518
		 0.20182301 0.87875843 0.20258203 0.88327605 0.19374704 0.88504326 0.19460195 0.87289298
		 0.21076076 0.87460995 0.21126659 0.87518871 0.24071287 0.87691683 0.24008051 0.87162608
		 0.23047376 0.8733567 0.22997671 0.87096214 0.21995397 0.87273848 0.22003213 0.95657885
		 0.8852222 0.97400129 0.87535208 0.95053756 0.87342763 0.97247422 0.86297083 0.97399497
		 0.75672668 0.97628474 0.74592751 0.95656633 0.74685508 0.96290243 0.7373997 0.97276711
		 0.81604648 0.9727391 0.80608213 0.93992043 0.81604844 0.94031489 0.80531871 0.94551229
		 0.85926259 0.9722662 0.85082018 0.97246921 0.76911372 0.95052457 0.75865602 0.94183934
		 0.84315395 0.97260046 0.83856696 0.94550157 0.77282745 0.97226274 0.78126842 0.97274005
		 0.82601035 0.94031763 0.82677728 0.94183207 0.78893995 0.97259831 0.79352403 0.96780598
		 0.9015491 0.97896779 0.89587092 0.96291173 0.89467371 0.97629237 0.88614392 0.96779895
		 0.7305252 0.97896647 0.73620689 0.97108471 0.72377342 0.97109437 0.90829748 0.99207962
		 0.90688568 0.99207962 0.89492291 0.99207962 0.7251786 0.99207962 0.73714817 0.97423768
		 0.71610081 0.99207962 0.71472973 0.99207962 0.8725583 0.99207962 0.86126006 0.9770782
		 0.7068457 0.99207962 0.70465273 0.99207962 0.74850178 0.99207962 0.75952333 0.99207962
		 0.8052727 0.99207962 0.81604737 0.99207962 0.84997869 0.98036659 0.68961364 0.99207962
		 0.68542832 0.98058486 0.67934543 0.99207962 0.67541927 0.99207962 0.77082539 0.97424924
		 0.91596323 0.97708964 0.92521054 0.99207962 0.9173286 0.99207962 0.92740011 0.98077226
		 0.6678161 0.99207962 0.66499317 0.99207962 0.83885473 0.97883117 0.69877166 0.99207962
		 0.69499594 0.99207962 0.78211027 0.98037624 0.94242787 0.98059487 0.95268828 0.99207962
		 0.94661009 0.99207962 0.95661056 0.98078227 0.96420693 0.99207962 0.96702719 0.98021269
		 0.65568787 0.99207962 0.65397263 0.97884154 0.93327779 0.99207962 0.93703336 0.99207962
		 0.82682067 0.97963667 0.64348298 0.99207962 0.64253443 0.99207962 0.79323757 0.98022354
		 0.97632384 0.99207962 0.97803766 0.99207962 0.88357538 0.97964764 0.98851848 0.99207962
		 0.98946595 0.98673362 0.20823038 0.98203546 0.19928713 0.98915213 0.21781246 0.98887223
		 0.22901875 0.98568171 0.23946749 0.98022133 0.24906175 0.97227967 0.25812942 0.96258366
		 0.26551121 0.95169288 0.27032435 0.94021851 0.27308977 0.93002248 0.27383229 0.91984046
		 0.27343681 0.90831047 0.27112168 0.89723384 0.26671627 0.88728929 0.25974086 0.87886167
		 0.25102699 0.87293249 0.24153852 0.86936653 0.23112272 0.86864293 0.21985194 0.8706513
		 0.21010031 0.87494659 0.20083199 0.88096869 0.19263081 0.88870376 0.18561444 0.89769441
		 0.17988497;
	setAttr ".uvst[0].uvsp[250:499]" 0.90743536 0.17569239 0.91765225 0.17286462
		 0.92829245 0.1717882 0.939044 0.17250094 0.94948554 0.17507672 0.95935154 0.17914212
		 0.96828914 0.18472245 0.97596985 0.19145294 0.12473897 0.66661024 0.096284129 0.63620716
		 0.084091581 0.6652922 0.037016131 0.88023734 0.04327945 0.89701712 0.10276788 0.89183658
		 0.11185244 0.73865551 0.16977684 0.79365009 0.17266284 0.74416769 0.18602322 0.77633846
		 0.15932618 0.8392244 0.16048996 0.81552887 0.096814208 0.82898116 0.084541537 0.95015764
		 0.098831512 0.9601329 0.12044535 0.91957575 0.1513326 0.93810004 0.19022493 0.93902797
		 0.17573278 0.98100442 0.20042856 0.97802252 0.15898727 0.9803586 0.13589881 0.97594923
		 0.11384157 0.96813405 0.22163337 0.97222745 0.23725504 0.92908263 0.1663935 0.86192816
		 0.055498045 0.91859025 0.071224242 0.93815327 0.23672652 0.96561486 0.2512297 0.95710897
		 0.26494578 0.94673038 0.27761751 0.93447649 0.032608133 0.86108679 0.036428966 0.80163389
		 0.05167548 0.75574809 0.29118323 0.74973202 0.27714431 0.70982212 0.23623478 0.74484485
		 0.23029107 0.71052182 0.24678409 0.63302279 0.21983659 0.66638315 0.26011124 0.6643452
		 0.17249434 0.71025801 0.066687502 0.71220565 0.031892519 0.82318711 0.030613462 0.84125906
		 0.20722009 0.76573962 0.23070025 0.76321405 0.2729066 0.78168476 0.25348353 0.76882458
		 0.28686643 0.8001098 0.30561936 0.79093575 0.31095374 0.80837661 0.29297227 0.84526259
		 0.31437129 0.85442555 0.31538653 0.83994406 0.30797702 0.88251442 0.31188858 0.86863899
		 0.284024 0.86671942 0.20101209 0.89345479 0.22421783 0.89836848 0.24760365 0.89501601
		 0.18090294 0.8807857 0.17158531 0.63458365 0.10741863 0.61472559 0.23613852 0.61248785
		 0.11906246 0.59646773 0.17215161 0.59640932 0.12788735 0.58569986 0.13885473 0.57683188
		 0.22519809 0.59642762 0.21638006 0.58560234 0.20572348 0.57682705 0.14917289 0.57131582
		 0.17215531 0.56699562 0.19526078 0.57110751 0.43349835 0.061948106 0.43349835 0.056052014
		 0.41567251 0.061948106 0.41567251 0.056052014 0.79165661 0.073948167 0.80507457 0.073948167
		 0.79165661 0.068051837 0.80507457 0.068051837 0.52803874 0.073948167 0.54150963 0.073948167
		 0.52803874 0.068052076 0.54150963 0.068052076 0.18580304 0.83584154 0.19014107 0.84956557
		 0.19149058 0.8351081 0.19523548 0.84689087 0.32074171 0.50443864 0.32074171 0.49134612
		 0.29925829 0.50443864 0.29925829 0.49134612 0.32074171 0.40318191 0.32074171 0.38274288
		 0.29925829 0.40318191 0.29925829 0.38274288 0.26313213 0.85299611 0.25312704 0.86355752
		 0.27880102 0.86328864 0.26452059 0.87886906 0.48328564 0.061948106 0.48328564 0.056052014
		 0.45846865 0.061948106 0.45846865 0.056052014 0.83183312 0.068051837 0.81846774 0.068051837
		 0.8318336 0.073948167 0.81846774 0.073948167 0.56015635 0.073948167 0.58229017 0.073948167
		 0.56015635 0.068052076 0.58229017 0.068052076 0.59132785 0.056052014 0.59132785 0.061948106
		 0.61018986 0.056051895 0.61018986 0.061948106 0.19702293 0.81139755 0.19220011 0.80822963
		 0.19211261 0.82278305 0.18651985 0.82148677 0.32074171 0.47644079 0.32074171 0.45993125
		 0.29925829 0.47644079 0.29925829 0.45993125 0.32074171 0.3620131 0.32074171 0.34128296
		 0.29925829 0.3620131 0.29925829 0.34128296 0.25624478 0.80007005 0.26874113 0.78628111
		 0.24390274 0.79233545 0.25108832 0.77470231 0.26885492 0.83969629 0.28694293 0.843871
		 0.70212305 0.073948167 0.74411261 0.073948167 0.70212305 0.068051837 0.74411261 0.068051837
		 0.26831841 0.88397294 0.29955494 0.90222961 0.16699743 0.81701833 0.17538266 0.79729497
		 0.5013144 0.061948106 0.5013144 0.056052014 0.85164833 0.073948167 0.85164809 0.068051837
		 0.6148783 0.073948167 0.6148783 0.068051837 0.63088053 0.061948106 0.63088053 0.056051895
		 0.17232977 0.66665256 0.20561434 0.80232579 0.20213981 0.79767501 0.32074171 0.44204843
		 0.29925829 0.44204843 0.32074171 0.32084322 0.29925829 0.32084322 0.19005236 0.7816726
		 0.565202 0.061948106 0.565202 0.056052014 0.53870678 0.061948106 0.53870678 0.056052014
		 0.88759089 0.073948167 0.90371108 0.073948167 0.88759089 0.068051837 0.90371108 0.068051837
		 0.99232751 0.061947986 0.99232751 0.056051895 0.98247951 0.061947986 0.98247951 0.056051895
		 0.74502414 0.061947986 0.74502414 0.056051895 0.69398087 0.061948106 0.69398087 0.056051895
		 0.22962797 0.78922117 0.24170494 0.79773307 0.22937298 0.79505545 0.24965757 0.85888284
		 0.2582998 0.8498081 0.32074171 0.28197253 0.32074171 0.26408565 0.29925829 0.28197253
		 0.29925829 0.26408565 0.23043218 0.76971579 0.21513271 0.79107738 0.20919824 0.7720741
		 0.29390562 0.82210064 0.31443763 0.8255263 0.24007559 0.87012565 0.22555083 0.87192488
		 0.24572164 0.88879347 0.22455108 0.89175761 0.1659454 0.83837867 0.51975536 0.061948106
		 0.51975536 0.056052014 0.87141442 0.073948167 0.87141442 0.068051837 0.96836764 0.061947986
		 0.96836764 0.056051895 0.95638436 0.061947986 0.95638436 0.056051895 0.67082161 0.061948106
		 0.67082161 0.056051895 0.65180916 0.061947986 0.65180916 0.056051895 0.84658951 0.061947986
		 0.84658951 0.056051895 0.79368752 0.061947986 0.79368752 0.056051895 0.21684527 0.7966519
		 0.32074171 0.42304301 0.29925829 0.42304301 0.32074171 0.30097985 0.29925829 0.30097985
		 0.21129268 0.86875594 0.20358223 0.88728011 0.91939473 0.073948167 0.93466091 0.073948167
		 0.91939473 0.068051837 0.93466091 0.068051837 0.48894763 0.073948167 0.50278187 0.073948167
		 0.48894763 0.068052076 0.50278187 0.068052076 0.87976617 0.061947986 0.87976617 0.056051895
		 0.66147888 0.073948167 0.66147888 0.068051837 0.26005134 0.8142041 0.26515412 0.8115077
		 0.25236136 0.80437946 0.22582787 0.86608833 0.23838001 0.86453348 0.32074171 0.2475723
		 0.32074171 0.23266244 0.29925829 0.2475723 0.29925829 0.23266244 0.26955026 0.82527149;
	setAttr ".uvst[0].uvsp[500:749]" 0.28143835 0.80295932 0.28781676 0.82289338
		 0.17233039 0.85883749 0.16252933 0.56789201 0.26323953 0.8383944 0.94187635 0.061947986
		 0.94187635 0.056051895 0.92753249 0.061947986 0.92753249 0.056051895 0.94957209 0.073948167
		 0.96943069 0.073948167 0.94957209 0.068051837 0.96943069 0.068051837 0.76162446 0.073948167
		 0.77819145 0.073948167 0.76162446 0.068051837 0.77819145 0.068051837 0.51458216 0.073948167
		 0.51458216 0.068052076 0.26384196 0.82602102 0.20288463 0.85670662 0.19899867 0.86099571
		 0.21350604 0.86337137 0.32074171 0.21956575 0.32074171 0.20846581 0.29925829 0.21956575
		 0.29925829 0.20846581 0.28867263 0.92072183 0.47914195 0.073948167 0.47914195 0.068052076
		 0.18180816 0.56793702 0.99185807 0.073948167 0.99185807 0.068051837 0.32074171 0.51553416
		 0.29925829 0.51553416 0.18542688 0.87583822 0.90504926 0.061947986 0.90504926 0.056051895
		 0.82764429 0.57898694 0.80035573 0.57898694 0.81400001 0.58139342 0.80035573 0.50401312
		 0.82764333 0.50401258 0.81400001 0.50160658 0.72442365 0.12531944 0.7244277 0.11460605
		 0.70776701 0.12531944 0.70777124 0.11460605 0.77471244 0.5345729 0.85328645 0.5345729
		 0.77945101 0.52155364 0.848548 0.52155316 0.6911149 0.11460605 0.69111013 0.12531944
		 0.9742347 0.12531944 0.99088889 0.12531944 0.97423607 0.11460605 0.99089044 0.11460605
		 0.8396433 0.57205969 0.78835666 0.57205969 0.95758075 0.12531944 0.95758182 0.11460605
		 0.848548 0.56144643 0.77945101 0.56144643 0.92427385 0.12531944 0.94092703 0.12531944
		 0.92427462 0.11460605 0.94092816 0.11460605 0.85328746 0.54842716 0.77471244 0.54842716
		 0.77439731 0.11460605 0.77439249 0.12531944 0.79105198 0.11460605 0.79104805 0.12531944
		 0.87431598 0.12531944 0.89096868 0.12531944 0.87431699 0.11460605 0.8909691 0.11460605
		 0.74108398 0.11460605 0.74108011 0.12531944 0.75774056 0.11460605 0.75773662 0.12531944
		 0.85766309 0.12531944 0.85766453 0.11460605 0.84101015 0.12531944 0.84101194 0.11460605
		 0.82435888 0.11460605 0.82435668 0.12531944 0.90762115 0.12531944 0.90762079 0.11460605
		 0.80770564 0.11460605 0.80770266 0.12531944 0.78835666 0.51094019 0.8396433 0.51093978
		 0.37811089 0.56933928 0.35630354 0.55678004 0.34995264 0.59301585 0.3315255 0.56117374
		 0.31536627 0.58046728 0.31539354 0.60563457 0.33159113 0.62489462 0.35637763 0.62923878
		 0.37816012 0.6166358 0.38674474 0.59297818 0.38050196 0.44457901 0.38050097 0.48152217
		 0.40424976 0.45322135 0.416886 0.47510803 0.35675475 0.45322049 0.34411657 0.47510448
		 0.34850308 0.49999303 0.36786312 0.51623678 0.39313316 0.51623678 0.41249374 0.49999532
		 0.035574146 0.29290134 0.030233918 0.29290134 0.035574146 0.3113032 0.030233882 0.3113032
		 0.030233938 0.27449656 0.035574146 0.27449656 0.03023391 0.25609767 0.035574146 0.25609767
		 0.035574146 0.32970554 0.030233819 0.32970554 0.035574146 0.34810838 0.030233813
		 0.34810838 0.035574146 0.36651102 0.030234054 0.36651102 0.035574146 0.38491264 0.030234121
		 0.38491264 0.035574146 0.40331584 0.030234383 0.40331584 0.035574146 0.42171809 0.030234471
		 0.42171809 0.035574146 0.44011974 0.030234545 0.44011974 0.035574146 0.10241177 0.030234639
		 0.10241177 0.035574146 0.12728263 0.030234583 0.12728263 0.035574146 0.14568439 0.030234285
		 0.14568439 0.035574146 0.16408625 0.030234231 0.16408625 0.035574146 0.18248731 0.030234162
		 0.18248731 0.035574146 0.20088981 0.030234069 0.20088981 0.035574146 0.21929333 0.030234089
		 0.21929333 0.035574146 0.23769541 0.030233867 0.23769541 0.33023685 0.54362315 0.31695133
		 0.55130821 0.29785451 0.58227974 0.3030948 0.56784916 0.29788092 0.60386091 0.30314913
		 0.61827832 0.31703731 0.63479054 0.33033741 0.6424492 0.36669889 0.64349443 0.3515878
		 0.64617372 0.39523321 0.620924 0.3853752 0.63269025 0.40259683 0.60063875 0.40257689
		 0.58528596 0.38529271 0.55327332 0.39517257 0.56501883 0.36659577 0.5425061 0.35147983
		 0.53985667 0.010029401 0.44011974 0.010028699 0.42171809 0.010027799 0.40331584 0.010027298
		 0.38491264 0.010026798 0.36651102 0.010027098 0.25609767 0.010027398 0.27449957 0.010026396
		 0.34810838 0.010026798 0.23769541 0.010026596 0.32970554 0.010026497 0.21929333 0.010026897
		 0.3113032 0.010026497 0.20088981 0.010028499 0.14568439 0.010028199 0.16408625 0.010027298
		 0.29290134 0.010027198 0.18248731 0.010029601 0.10241177 0.0100292 0.12728263 0.035574146
		 0.6099999 0.029433172 0.6099999 0.035574146 0.62840194 0.029433342 0.62840194 0.029433178
		 0.59159803 0.035574146 0.59159803 0.029433332 0.57319617 0.035574146 0.57319617 0.035574146
		 0.6468038 0.029433519 0.6468038 0.035574146 0.66520697 0.029433776 0.66520697 0.035574146
		 0.68361002 0.029433712 0.68361002 0.035574146 0.70201182 0.029433489 0.70201182 0.035574146
		 0.72041392 0.02943328 0.72041392 0.035574146 0.73881572 0.02943317 0.73881572 0.035574146
		 0.75721759 0.029432714 0.75721759 0.035574146 0.77561945 0.029432513 0.77561945 0.035574146
		 0.44438052 0.029432464 0.44438052 0.035574146 0.46278238 0.029432721 0.46278238 0.035574146
		 0.48118424 0.029433031 0.48118424 0.035574146 0.49958745 0.029433317 0.49958745 0.035574146
		 0.51798928 0.029433506 0.51798928 0.035574146 0.53639114 0.029433567 0.53639114 0.035574146
		 0.55479431 0.029433522 0.55479431 0.34063059 0.44598898 0.35243702 0.43608487 0.32979345
		 0.46475074 0.32711133 0.47993016 0.3308697 0.50127321 0.33858168 0.51462269 0.35518256
		 0.52854878 0.36966616 0.53381753 0.40581369 0.52854729 0.39133081 0.53381717 0.43012154
		 0.50127774 0.42241183 0.51462317 0.43388936 0.47993994 0.43121746 0.46475565 0.40856916
		 0.43608379 0.42037776 0.4459894 0.37279662 0.4286761 0.38820755 0.42867541 0.0092261257
		 0.75721759 0.0092267273 0.73881572 0.0092267273 0.72041392 0.0092267273 0.70201182
		 0.0092267273 0.68361002;
	setAttr ".uvst[0].uvsp[750:999]" 0.0092267273 0.57319617 0.0092267273 0.59159803
		 0.0092267273 0.6468038 0.0092267273 0.66520697 0.0092267273 0.53639114 0.0092267273
		 0.55479431 0.0092267273 0.62840194 0.0092267273 0.51798928 0.0092267273 0.6099999
		 0.0092267273 0.49958745 0.0092261257 0.48118424 0.0092261257 0.46278238 0.0092261257
		 0.77561945 0.0092261257 0.44438052 0.1355066 0.064386129 0.14929673 0.064386129 0.14929673
		 0.044571236 0.16337621 0.064386129 0.17764258 0.064386129 0.17789687 0.044571236
		 0.1920605 0.064386129 0.20653763 0.064386129 0.20667972 0.044571236 0.22099167 0.064386129
		 0.23532161 0.064386129 0.24945936 0.064386129 0.23403922 0.044571236 0.021438699
		 0.064386129 0.035475601 0.064386129 0.035475601 0.044571236 0.049774006 0.064386129
		 0.064211383 0.064386129 0.064211383 0.044571236 0.078674853 0.064386129 0.093118794
		 0.064386129 0.10744073 0.064386129 0.093118794 0.044571236 0.0076370565 0.064386129
		 0.0076370565 0.044571236 0.26336303 0.064386129 0.26336303 0.044571236 0.12159824
		 0.064386129 0.12159824 0.044571236 0.40573934 0.096014261 0.35737431 0.095862016
		 0.39560884 0.12348284 0.36729619 0.12345719 0.0076370565 0.02878841 0.035475601 0.02878841
		 0.093118794 0.075079106 0.078674853 0.075079069 0.093118794 0.085630886 0.078674853
		 0.085630886 0.035475601 0.075079106 0.049774006 0.075079106 0.44264457 0.12729968
		 0.41733477 0.14167957 0.064211383 0.02878841 0.10744073 0.085630871 0.10744073 0.075079106
		 0.021438699 0.075079106 0.45035452 0.17483242 0.42173794 0.16950238 0.093118794 0.02878841
		 0.12159824 0.075079106 0.12159825 0.085630894 0.0076370565 0.075079106 0.17764258
		 0.075079106 0.1920605 0.075079106 0.39519227 0.17878893 0.40739232 0.19358151 0.40290099
		 0.16592352 0.12159824 0.02878841 0.1355066 0.085630894 0.1355066 0.075079106 0.22099167
		 0.085630879 0.22099167 0.075079106 0.20653763 0.085630879 0.20653763 0.075079069
		 0.24945936 0.075079106 0.26336303 0.075079069 0.16337621 0.075079106 0.35463968 0.19362691
		 0.3810342 0.20305839 0.36688501 0.17887269 0.38102132 0.18388388 0.14929673 0.02878841
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
		 0.32234737 0.10685614 0.32104236 0.10283586 0.30821618 0.10847335 0.30848715 0.10427198
		 0.29437235 0.10520208 0.29618546 0.10136613 0.27644581 0.045062065 0.27078009 0.058108583
		 0.28022438 0.047908679 0.27519286 0.059514999 0.2861993 0.034711048 0.28889701 0.038697839
		 0.29892492 0.02835916 0.30021721 0.03304328 0.3130497 0.026698664 0.31278381 0.031565145
		 0.32688087 0.03001222 0.3250902 0.034514412 0.33876914 0.037818313 0.33566362 0.041463643
		 0.3472347 0.049247459 0.34318891 0.051632881 0.35132465 0.062871277 0.34681773 0.063749969
		 0.35046351 0.077069163 0.34604374 0.076373518 0.34484041 0.090136826 0.34103641 0.087985873
		 0.3350549 0.10046138 0.33233562 0.097156793 0.28250796 0.097354129 0.28564015 0.094397575
		 0.27400661 0.085947797 0.27807876 0.084264055 0.26996121 0.072309971 0.2744737 0.072142482
		 0.31431118 0.099636033 0.33382225 0.089859381 0.29308268 0.094586924 0.34249282 0.069825262
		 0.3362577 0.048900127 0.31802404 0.036880493 0.29632783 0.039398551 0.2813341 0.055275276
		 0.28005669 0.077070564 0.24057007 0.80169487 0.22987553 0.79916286 0.24974936 0.80771387
		 0.2189557 0.80042326 0.20912762 0.80532414 0.20157672 0.81327426 0.19721377 0.82331479
		 0.196565 0.8342346 0.19970864 0.84471667 0.20626552 0.85349679 0.21544482 0.85951579
		 0.22613937 0.86204779 0.23705924 0.86078733 0.24688727 0.85588658 0.25443816 0.84793639
		 0.25880116 0.83789593 0.2594499 0.82697606 0.25630629 0.81649399 0.5576756 0.34145796
		 0.55643362 0.33492577 0.5453487 0.34252751 0.54540211 0.33514306 0.52411658 0.40235916
		 0.52576399 0.39408746 0.51322788 0.39993587 0.51389468 0.39082929 0.74919963 0.13243999
		 0.73828089 0.13243999 0.74569815 0.15088287 0.73350269 0.14592935 0.76042569 0.13243999
		 0.75855428 0.15447785 0.52919084 0.37240756 0.53070998 0.36109209 0.51644862 0.36962759
		 0.51795131 0.35831407 0.77238584 0.15636531 0.77311236 0.13243999 0.55690438 0.36314106
		 0.54358077 0.36275542 0.5557642 0.375049 0.54211068 0.37470278 0.78490263 0.13243999
		 0.78466117 0.15715609 0.79723966 0.1571897 0.79606605 0.13243999 0.88103026 0.16466074
		 0.89308619 0.1642538 0.88083571 0.13243997 0.89233273 0.13243999 0.80852193 0.15753324
		 0.80726737 0.13243999 0.52749538 0.38402566 0.51504248 0.38083053 0.91571534 0.13243999
		 0.91527832 0.16248174 0.55283642 0.39726791 0.53997338 0.38874987 0.92905682 0.1612933
		 0.92788202 0.13243999 0.53211766 0.3507798 0.53353649 0.34153122 0.51961762 0.34806713
		 0.52182698 0.33851054 0.94521302 0.15889344 0.93967056 0.13243999 0.5574199 0.35322893
		 0.54462981 0.35225955;
	setAttr ".uvst[0].uvsp[1000:1249]" 0.95729637 0.15684935 0.9510904 0.13243999
		 0.8350082 0.16146263 0.83333063 0.13243999 0.83008552 0.16066925 0.82754922 0.13243999
		 0.84157056 0.13243999 0.84270364 0.16270719 0.84736156 0.13243999 0.84760052 0.16331428
		 0.85990393 0.13243999 0.85413992 0.13243999 0.85800505 0.16416384 0.85291517 0.16377586
		 0.54562092 0.4129774 0.54958189 0.40692976 0.53474426 0.40663669 0.53751528 0.39907467
		 0.52142978 0.41424915 0.52265972 0.40883556 0.51403975 0.41224334 0.51329929 0.40658805
		 0.53487253 0.33403125 0.52458239 0.33102173 0.71652329 0.13243999 0.71198893 0.13243999
		 0.71185398 0.14377677 0.70623577 0.14439936 0.71843743 0.14250718 0.72429562 0.14290719
		 0.72413456 0.13243999 0.72898638 0.13243999 0.98574001 0.14879747 0.97754067 0.13243999
		 0.98061728 0.15054034 0.97292459 0.13243999 0.95888054 0.13243999 0.96727699 0.15371852
		 0.96351838 0.13243999 0.97307783 0.15217012 0.98280716 0.13243999 0.98890948 0.14717826
		 0.70764631 0.13243999 0.70330369 0.13243999 0.70298672 0.14447191 0.69973767 0.14454447
		 0.81422317 0.13243999 0.81790006 0.15879521 0.81901735 0.13244879 0.82393968 0.15968204
		 0.86555886 0.16466439 0.8717525 0.16480881 0.86716068 0.13244 0.87357414 0.13243997
		 0.54097581 0.41671214 0.53172696 0.41214806 0.53571022 0.419076 0.52859724 0.41646013
		 0.55412942 0.32988909 0.54478019 0.32929304 0.53599739 0.32812309 0.52741194 0.32564095
		 0.54192126 0.31991458 0.54348272 0.32429546 0.5458017 0.32180065 0.55015159 0.32526439
		 0.53697366 0.32319155 0.53050321 0.32168722 0.53793091 0.31855354 0.53367203 0.3181242
		 0.52559233 0.42040348 0.52036059 0.41949821 0.51497102 0.41747516 0.51044214 0.41455799
		 0.5063976 0.41053683 0.9920789 0.14555904 0.98807371 0.13243999 0.50328416 0.40539417
		 0.50164652 0.39999625 0.50156444 0.38857734 0.50231916 0.37889326 0.50359249 0.36709195
		 0.50506097 0.35464877 0.5066067 0.34493408 0.50965559 0.33375642 0.51414311 0.32629797
		 0.51835859 0.3223286 0.52399224 0.31962138 0.52936721 0.31821582 0.53053939 0.42027482
		 0.50697023 0.42108035 0.51196492 0.42421603 0.50917166 0.41766804 0.51396227 0.42071936
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
		 0.49782738 0.40890944 0.50132668 0.40751925 0.50111282 0.41481292 0.50459605 0.41301844
		 0.73135388 0.65005153 0.6966036 0.652906 0.69784993 0.66496801 0.73288125 0.66707426
		 0.44959992 0.59553307 0.46664202 0.61483461 0.47506678 0.57928503 0.45922577 0.57686955
		 0.4647212 0.56172442 0.48345882 0.54928708 0.46790534 0.54971582 0.4940865 0.41684854
		 0.46951377 0.42912668 0.47848302 0.45203462 0.49971515 0.42831168 0.76899898 0.49832284
		 0.7516368 0.48742875 0.73796463 0.51036376 0.75264597 0.52997983 0.7551595 0.62015748
		 0.72398686 0.62970376 0.75580913 0.64769483 0.34648681 0.77630806 0.35090947 0.75036329
		 0.3198629 0.73980135 0.32545727 0.76907301 0.34305739 0.72791994 0.31784248 0.73064595
		 0.31931561 0.73732138 0.34798521 0.74200499 0.69015974 0.49038178 0.71023995 0.50352049
		 0.72227538 0.49132237 0.69880337 0.47529826 0.71574527 0.61415213 0.68814111 0.62718862
		 0.69309521 0.6380108 0.71971864 0.51902449 0.72888589 0.53571218 0.70506978 0.46407288
		 0.72949547 0.47650844 0.73319936 0.46120122 0.70916271 0.45011115 0.7089529 0.53709626
		 0.70467049 0.52297747 0.68923706 0.59140629 0.67794347 0.58462507 0.6634056 0.59968841
		 0.67216152 0.60563159 0.73440379 0.55692405 0.75750148 0.56103212 0.7149514 0.69766659
		 0.69238454 0.68612176 0.74467856 0.59419674 0.77269161 0.616247 0.42334604 0.63289422
		 0.43150851 0.65671682 0.46773356 0.6480673 0.44566688 0.4706232 0.46632013 0.48144609
		 0.45927992 0.46261126 0.43968967 0.4561885 0.3416065 0.79650116 0.32768282 0.79283643
		 0.3814854 0.35717922 0.40773651 0.38269034 0.42056325 0.36379153 0.39140379 0.34260538
		 0.37723273 0.31625551 0.4026635 0.3256698 0.41600844 0.30129021 0.38552061 0.3031674
		 0.4706654 0.52924871 0.48552528 0.52989715 0.4818674 0.48039278 0.46961123 0.49665546
		 0.48606107 0.51036859 0.47104719 0.5087536 0.42374831 0.40179014 0.43665186 0.42185116
		 0.45027843 0.40782824 0.44324127 0.38863963 0.39719829 0.39616722 0.4101671 0.41008562
		 0.42196739 0.42576417 0.68852979 0.52135688 0.70010549 0.50810802 0.68653172 0.50757557
		 0.66085154 0.51530683 0.66265678 0.50000739 0.43797746 0.61392868 0.39860237 0.66030532;
	setAttr ".uvst[0].uvsp[1250:1499]" 0.43555757 0.58625853 0.42750105 0.60028923
		 0.39203718 0.64377207 0.3775306 0.65652972 0.38055205 0.67682749 0.40569496 0.62913501
		 0.66747802 0.67807215 0.43486997 0.26304954 0.42347983 0.24373536 0.40191507 0.25508648
		 0.41024914 0.2735641 0.17339285 0.54638731 0.1762262 0.55137849 0.19243981 0.55769616
		 0.17339285 0.52827764 0.16460729 0.54641229 0.16460729 0.52830255 0.14555514 0.55772048
		 0.16177428 0.55147481 0.28860715 0.54017013 0.21083216 0.56786472 0.0493927 0.54019231
		 0.12716222 0.56788826 0.57407033 0.31209183 0.57271856 0.31965125 0.60223329 0.32003421
		 0.58897805 0.35203207 0.57675487 0.34729967 0.57491297 0.37433189 0.58899403 0.37979966
		 0.52754915 0.3059057 0.51930702 0.28111675 0.50763977 0.29787335 0.54621631 0.28824586
		 0.5421409 0.3041653 0.52676308 0.43603712 0.51209712 0.43613657 0.50834328 0.45837316
		 0.54193324 0.46184167 0.55732989 0.41844982 0.54406834 0.42868161 0.55258197 0.43739247
		 0.57207525 0.42291427 0.51452112 0.31048477 0.49594501 0.31082612 0.55373037 0.30570924
		 0.57638031 0.2917766 0.56546152 0.31102547 0.57564366 0.32961336 0.59654135 0.33632368
		 0.57254207 0.38916299 0.58528948 0.39403072 0.64092183 0.39671722 0.60977638 0.3829515
		 0.60451525 0.40178576 0.6343922 0.41455248 0.51932251 0.1799622 0.49587181 0.1716938
		 0.50040215 0.18576045 0.50321549 0.14707649 0.47683296 0.14313635 0.4869073 0.15569371
		 0.57632691 0.47601345 0.58376104 0.44834498 0.46059832 0.37549341 0.49001956 0.3895441
		 0.48869964 0.35281396 0.47187302 0.34750423 0.4823935 0.32796732 0.49270788 0.33094385
		 0.50269538 0.31819275 0.51947963 0.89556015 0.50057924 0.88968825 0.49599651 0.90369982
		 0.50325137 0.92837864 0.47684479 0.93216187 0.48980573 0.96059901 0.51216072 0.95217305
		 0.48697072 0.91966128 0.70500493 0.73364216 0.67338222 0.75233746 0.68381625 0.77224529
		 0.71861422 0.75022519 0.50732732 0.53089368 0.50614971 0.54891378 0.77650201 0.47343829
		 0.78678542 0.50513667 0.79518282 0.47552165 0.66943532 0.41097999 0.6618582 0.42742842
		 0.63697296 0.51077646 0.64046913 0.49377272 0.54027188 0.49016431 0.57562852 0.49843881
		 0.75472867 0.44398028 0.74444032 0.41380227 0.72707552 0.41748014 0.73316985 0.44062832
		 0.71221286 0.42182595 0.69720125 0.40984344 0.69302988 0.42400354 0.71182114 0.43549868
		 0.4724471 0.26997307 0.49019814 0.25744539 0.47538486 0.23476639 0.45710519 0.24851827
		 0.56910664 0.60064077 0.57046902 0.57413816 0.5363782 0.57381737 0.53561169 0.60232061
		 0.65452868 0.57860523 0.65123481 0.59788853 0.58439779 0.72750092 0.55117381 0.73499745
		 0.55903113 0.76437062 0.59386367 0.75536019 0.43931171 0.68793994 0.47185591 0.68243617
		 0.39532951 0.3981117 0.37037098 0.37215081 0.36866254 0.37422723 0.44611213 0.56296843
		 0.44921213 0.55189598 0.44656363 0.55125409 0.44354981 0.56210983 0.41897431 0.61264032
		 0.81165004 0.35695341 0.83254433 0.34072858 0.81827623 0.32491097 0.79827374 0.34249881
		 0.60400879 0.23284785 0.62508887 0.24078783 0.6336599 0.21438417 0.61058134 0.20666446
		 0.74415404 0.2652697 0.75942326 0.2439612 0.7397272 0.23232122 0.72566104 0.25442344
		 0.83868128 0.30756357 0.82498711 0.2940602 0.80560923 0.31229943 0.87581259 0.4079634
		 0.88404316 0.42759979 0.9100979 0.41771203 0.90089035 0.3966555 0.59414923 0.1747608
		 0.61765486 0.18184865 0.62495363 0.15719961 0.60075825 0.15004328 0.61217862 0.48606575
		 0.61902189 0.46150231 0.79074764 0.77730334 0.80596769 0.76382852 0.78679121 0.74524087
		 0.77252024 0.75746328 0.87542838 0.57891822 0.90142846 0.58276671 0.90375781 0.55958849
		 0.87773865 0.55772007 0.72267985 0.85299557 0.74002486 0.84376764 0.72598976 0.82165295
		 0.70979291 0.83030117 0.83903676 0.76855457 0.85441166 0.75152254 0.83288687 0.73539233
		 0.81863141 0.7512148 0.91847563 0.63548136 0.89161015 0.62730163 0.88426793 0.64846259
		 0.91033882 0.65831101 0.58800304 0.87581801 0.58253884 0.85000759 0.55996597 0.85712534
		 0.56743473 0.88171798 0.38822654 0.83858711 0.39847493 0.86135525 0.42391872 0.83995157
		 0.41023967 0.820858 0.65776706 0.93256271 0.65072387 0.9107005 0.62505555 0.91869825
		 0.63124371 0.94066077 0.95057088 0.70212513 0.92684966 0.69111794 0.93762386 0.72526163
		 0.91501141 0.71357369 0.92606336 0.74410075 0.70322508 0.91634285 0.72517425 0.90705454
		 0.71430022 0.88647151 0.69370669 0.89527088 0.95767194 0.48348963 0.96106178 0.51160371
		 0.98833793 0.50904906 0.98407233 0.47804707 0.84490985 0.24265432 0.82786566 0.25975963
		 0.84542328 0.27528808 0.86352545 0.25901657 0.28860715 0.66503531 0.28194946 0.66279805
		 0.28216627 0.68480158 0.28860715 0.68490344 0.78877282 0.050911147 0.78877282 0.039744455
		 0.76562595 0.039744455 0.76562595 0.050911147 0.57017136 0.050911147 0.57017136 0.039744455
		 0.55347359 0.039744455 0.55347359 0.050911147 0.88077688 0.050911147 0.88077688 0.039744455
		 0.85968995 0.039744455 0.85968995 0.050911147 0.72031808 0.034657728 0.73730326 0.034657728
		 0.73730326 0.02349104 0.72031808 0.02349104 0.48417237 0.02349104 0.46364871 0.02349104
		 0.46364871 0.034657728 0.48417237 0.034657728 0.74313796 0.32863918 0.75927067 0.30849707
		 0.74302977 0.29714528 0.72745329 0.31841329 0.8553378 0.50005597 0.87533593 0.4971627
		 0.87129861 0.47626621 0.85162622 0.48065412 0.71141744 0.79815942 0.72876686 0.78835613
		 0.71384054 0.76628542 0.69736791 0.77473038 0.84046394 0.63224202 0.83302784 0.64879555
		 0.85227501 0.65748501 0.85996854 0.63944757 0.17339285 0.35347241 0.28860715 0.3648499
		 0.28860715 0.3492178 0.17339285 0.33564964 0.17339285 0.36895046 0.28860715 0.38377625
		 0.16460729 0.28511268 0.16460729 0.26661652 0.0493927 0.28115475 0.0493927 0.29653442;
	setAttr ".uvst[0].uvsp[1500:1749]" 0.0493927 0.26341927 0.16460729 0.25054938
		 0.0493927 0.36487272 0.0493927 0.38379905 0.16460729 0.36897328 0.16460729 0.35349482
		 0.16460729 0.38811728 0.0493927 0.40053162 0.0493927 0.51665103 0.16460729 0.50933236
		 0.27542332 0.01951112 0.27581441 0.0053534466 0.25425372 0.0053534466 0.25387922
		 0.01951112 0.5472405 0.0053534466 0.52262211 0.0053534466 0.522928 0.01951112 0.54780632
		 0.01951112 0.80118155 0.0053534466 0.78386772 0.0053534466 0.7844311 0.01951112 0.80171245
		 0.01951112 0.98789549 0.01951112 0.99189687 0.0053534466 0.97382152 0.0053534466
		 0.97021431 0.01951112 0.41783896 0.23183082 0.39949462 0.24126127 0.69119209 0.10069048
		 0.69001555 0.10831248 0.70602775 0.10831248 0.70731705 0.10069048 0.80591607 0.10831248
		 0.81611991 0.10831248 0.81433797 0.10069048 0.80487943 0.10069048 0.5325498 0.09538056
		 0.55419004 0.0953805 0.55224556 0.080619469 0.52894467 0.080619469 0.67408067 0.69921201
		 0.69193333 0.71883249 0.63220894 0.62465811 0.6027776 0.6286729 0.60636222 0.66022956
		 0.63715434 0.65324253 0.43677449 0.85726947 0.4559913 0.84013069 0.44465581 0.82290494
		 0.67446142 0.39598626 0.64651781 0.38126078 0.50843596 0.48586327 0.50822753 0.51267064
		 0.53962505 0.51572621 0.53882611 0.53290147 0.60670656 0.5408892 0.63608241 0.54476947
		 0.63677466 0.53139406 0.60780823 0.52667278 0.58133101 0.26914352 0.55026042 0.26673594
		 0.50346404 0.57536501 0.53787541 0.54966611 0.53724599 0.63705772 0.50304997 0.64164269
		 0.50621712 0.67711288 0.54010576 0.67196333 0.48735023 0.28529212 0.46969506 0.298953
		 0.67924798 0.61502254 0.70516557 0.60112882 0.56933665 0.81055963 0.5639568 0.78675425
		 0.53075558 0.79414088 0.53590059 0.81722808 0.37586129 0.6544131 0.34711406 0.6756736
		 0.3485752 0.6779319 0.45031506 0.528166 0.45303002 0.52841997 0.45365599 0.50508589
		 0.45251542 0.49410802 0.44142973 0.57527244 0.61144274 0.69491291 0.57876813 0.70256871
		 0.61784399 0.71917927 0.77215791 0.31866285 0.79039103 0.29882425 0.77663058 0.28773093
		 0.75434095 0.20969561 0.77536935 0.22203936 0.86021036 0.28979141 0.9365713 0.40737963
		 0.92655784 0.38488543 0.52716619 0.15501241 0.75148541 0.67279816 0.76999021 0.67596245
		 0.77413023 0.64625126 0.66912371 0.48127791 0.6470775 0.47145507 0.75989974 0.80070579
		 0.77698457 0.78839266 0.75963658 0.76761943 0.74339449 0.77895868 0.87143487 0.59982091
		 0.89733213 0.60563302 0.73609364 0.87613046 0.75461286 0.86641318 0.86056936 0.7863161
		 0.87708038 0.76796257 0.9456026 0.64405477 0.93682826 0.66860068 0.57402319 0.9068355
		 0.58009064 0.93158114 0.60081142 0.92575747 0.59428811 0.90103024 0.51824009 0.870417
		 0.50171798 0.87006664 0.47960246 0.99132067 0.49971652 0.98235273 0.46946684 0.96943361
		 0.90402693 0.73166341 0.74784166 0.89619762 0.58465481 0.12168231 0.5646885 0.11565641
		 0.55764997 0.13777238 0.5800553 0.14417781 0.82807416 0.22955547 0.81207699 0.2472281
		 0.28860715 0.58161181 0.28860715 0.56276155 0.22865075 0.58078134 0.80945921 0.050911147
		 0.80945921 0.039744455 0.53410381 0.039744455 0.53410381 0.050911147 0.97042108 0.039744455
		 0.94807386 0.039744455 0.94807386 0.050911147 0.97042108 0.050911147 0.75705218 0.02349104
		 0.75705218 0.034657728 0.97170591 0.034657728 0.97170591 0.02349104 0.94866061 0.02349104
		 0.94866061 0.034657728 0.72840595 0.28773597 0.71345222 0.30978349 0.84678644 0.46191168
		 0.86637849 0.45617196 0.69640499 0.80601251 0.68339413 0.78141332 0.84695315 0.61421847
		 0.86655575 0.61992151 0.28860715 0.31519029 0.17339285 0.30094424 0.17339285 0.31974727
		 0.28860715 0.33114663 0.28860715 0.29651067 0.17339285 0.28508994 0.0493927 0.31521386
		 0.0493927 0.33116919 0.16460729 0.31976974 0.16460729 0.30096716 0.16460729 0.33567238
		 0.0493927 0.34923828 0.23624597 0.0053534466 0.23564476 0.01951112 0.5 0.0053534466
		 0.5 0.01951112 0.76375401 0.0053534466 0.76435512 0.01951112 0.9524073 0.0053534466
		 0.95090419 0.01951112 0.4581733 0.13049476 0.48992682 0.11478169 0.46964696 0.10581121
		 0.51193869 0.84687203 0.49774703 0.85191929 0.44061363 0.22592972 0.43314964 0.21640584
		 0.72231811 0.10069048 0.72105747 0.10831248 0.74955887 0.10831248 0.74957442 0.10069048
		 0.60332078 0.080619529 0.58795452 0.080619529 0.59361327 0.09538056 0.60907352 0.09538056
		 0.57040191 0.63284463 0.60070932 0.59956288 0.69169378 0.53706586 0.71400458 0.35008317
		 0.72784138 0.33202016 0.69218433 0.3088156 0.68070996 0.32992721 0.43539053 0.33723965
		 0.66242474 0.54822671 0.69245851 0.55205399 0.66282165 0.5349319 0.60910171 0.29975656
		 0.61661798 0.27708137 0.60224038 0.57521981 0.60007566 0.77779478 0.50081563 0.8001011
		 0.49598882 0.77922201 0.46975338 0.7867378 0.4760851 0.80703849 0.40367275 0.6273635
		 0.39017779 0.64182967 0.45093736 0.50526178 0.44965011 0.44224489 0.43298021 0.44322672
		 0.57501227 0.52116466 0.60844839 0.50593728 0.42866188 0.76564324 0.42090818 0.72549993
		 0.39610565 0.73028076 0.40197867 0.75806022 0.75955254 0.27540612 0.90132701 0.4932647
		 0.89719349 0.47040594 0.73584175 0.19996339 0.72239691 0.22307856 0.85405815 0.32458264
		 0.87671828 0.30812779 0.91827607 0.44052464 0.94538897 0.43190289 0.57390738 0.16889954
		 0.63044554 0.57657081 0.63420922 0.55795479 0.60512209 0.5548954 0.7444948 0.8108291
		 0.87607682 0.66811138 0.70225012 0.86282402 0.80898178 0.79655057 0.79421663 0.80836332
		 0.81241244 0.82890439 0.82821256 0.8163687 0.89024377 0.70051885 0.87976927 0.71757203
		 0.55051315 0.91350454 0.55764621 0.93790764 0.96206218 0.53795725 0.93420982 0.53798306
		 0.93254966 0.56186014 0.96111631 0.56431454 0.49269193 0.2219575 0.47510982 0.19152151
		 0.45702335 0.20706743;
	setAttr ".uvst[0].uvsp[1750:1999]" 0.98836887 0.53793228 0.98839229 0.56681669
		 0.96152836 0.67849439 0.76741534 0.88603687 0.78952014 0.87303644 0.77566874 0.85408705
		 0.54290444 0.10867537 0.53524745 0.13100524 0.8795054 0.27439922 0.26322153 0.61846226
		 0.28860715 0.6225425 0.28860715 0.60076225 0.24750748 0.59812397 0.10934222 0.58080351
		 0.0493927 0.56278586 0.59055996 0.050911147 0.59055996 0.039744455 0.92452538 0.039744455
		 0.92452538 0.050911147 0.69975805 0.02349104 0.6816802 0.02349104 0.6816802 0.034657728
		 0.69975805 0.034657728 0.92789638 0.02349104 0.90742052 0.02349104 0.90742052 0.034657728
		 0.92789638 0.034657728 0.83522701 0.039744455 0.83522701 0.050911147 0.69697213 0.30129737
		 0.71105564 0.27789807 0.69605076 0.27002114 0.68300378 0.29459506 0.85974836 0.43665603
		 0.84025967 0.44389349 0.65317887 0.79432011 0.66287309 0.82118666 0.6792019 0.81406099
		 0.66807771 0.78814352 0.82384259 0.66524667 0.84287268 0.67549771 0.28860715 0.28113008
		 0.17339285 0.2665939 0.28860715 0.26339585 0.17339285 0.25052652 0.17339285 0.50930721
		 0.28860715 0.51662892 0.28860715 0.49741504 0.17339285 0.49107718 0.21556878 0.01951112
		 0.21613227 0.0053534466 0.19881843 0.0053534466 0.19828761 0.01951112 0.47707185
		 0.01951112 0.47737786 0.0053534466 0.45275947 0.0053534466 0.45219371 0.01951112
		 0.74574631 0.0053534466 0.72418559 0.0053534466 0.72457659 0.01951112 0.74612081
		 0.01951112 0.026178507 0.0053534466 0.0081031639 0.0053534466 0.011983255 0.01951112
		 0.029696288 0.01951112 0.37656868 0.81675339 0.36718169 0.80867791 0.3603065 0.82033843
		 0.36811593 0.82692826 0.7807405 0.10831248 0.78083861 0.10069048 0.76900953 0.10069048
		 0.76921952 0.10831248 0.66266888 0.10069048 0.66256869 0.10831248 0.67587817 0.10831248
		 0.67642009 0.10069048 0.86497629 0.080619469 0.85190487 0.080619469 0.85578001 0.0953805
		 0.86681116 0.0953805 0.62378699 0.080619469 0.62743628 0.0953805 0.57262367 0.55199111
		 0.57397264 0.53665149 0.62856597 0.59853446 0.43138015 0.80483985 0.61549747 0.3663376
		 0.68569416 0.43973371 0.44824198 0.285431 0.44770429 0.31595618 0.78247857 0.39653829
		 0.76243091 0.40537414 0.77646923 0.44552088 0.79600447 0.44472095 0.62545419 0.34916466
		 0.50111324 0.60641247 0.73122066 0.70814484 0.52621263 0.7722953 0.50617063 0.82172745
		 0.48250115 0.82720983 0.64868927 0.70971787 0.64220363 0.68639946 0.78643286 0.33089232
		 0.87769097 0.51835674 0.9037078 0.51643884 0.70947468 0.2457536 0.89142132 0.44874835
		 0.66457802 0.64603513 0.69078445 0.83926755 0.86618817 0.68785328 0.856426 0.70372844
		 0.54395741 0.88824242 0.52721953 0.92051375 0.90460104 0.53801274 0.52048379 0.97441012
		 0.9710077 0.65246665 0.60648251 0.12793209 0.89704335 0.29381973 0.60789251 0.050911147
		 0.60789251 0.039744455 0.90131152 0.039744455 0.90131152 0.050911147 0.85202283 0.41862631
		 0.83279198 0.42734489 0.8339361 0.69015235 0.81535941 0.67860073 0.28860715 0.11502925
		 0.17339285 0.1150296 0.17339285 0.13350293 0.28860715 0.13433294 0.047592707 0.0053534466
		 0.049081929 0.01951112 0.44948062 0.1987163 0.64340967 0.0953805 0.65386438 0.0953805
		 0.65545428 0.080619499 0.64306593 0.080619469 0.66334945 0.73386526 0.75682318 0.47064865
		 0.72678965 0.57982403 0.6688692 0.34924769 0.70027286 0.36582536 0.74204844 0.37449101
		 0.72565305 0.38732922 0.64520133 0.3133038 0.63506049 0.33390033 0.41515839 0.78634375
		 0.39640462 0.80412561 0.60664701 0.80142301 0.41683331 0.61101174 0.70199096 0.21321876
		 0.69048101 0.23675628 0.80863315 0.27958098 0.79387408 0.2677685 0.87944168 0.35850325
		 0.85611063 0.37237212 0.86589491 0.38823649 0.88994122 0.37554032 0.93250042 0.51411122
		 0.45721236 0.7562077 0.44920471 0.72077018 0.67301065 0.84703696 0.68305451 0.8709603
		 0.8253426 0.7820648 0.90116304 0.67938346 0.92973542 0.58735287 0.87843329 0.53803766
		 0.53878665 0.86386693 0.53528237 0.83924168 0.97862035 0.62579632 0.95258111 0.618949
		 0.8080458 0.86121535 0.7930944 0.84281671 0.52068961 0.10108097 0.51224452 0.12330065
		 0.91103536 0.31092882 0.8897354 0.32436189 0.90368831 0.34438509 0.92571008 0.33192191
		 0.27651563 0.64053476 0.28860715 0.64436185 0.056049824 0.66276956 0.061476111 0.64051473
		 0.0493927 0.64433652 0.0493927 0.66500813 0.64462614 0.050911147 0.64462614 0.039744455
		 0.62764347 0.039744455 0.62764347 0.050911147 0.66009951 0.02349104 0.66009951 0.034657728
		 0.88679421 0.02349104 0.86731029 0.02349104 0.86731029 0.034657728 0.88679421 0.034657728
		 0.55548549 0.02349104 0.52971786 0.02349104 0.52971786 0.034657728 0.55548549 0.034657728
		 0.67885339 0.26194149 0.66768593 0.28783005 0.82357186 0.41089633 0.8425985 0.40062332
		 0.83363593 0.38597444 0.81507027 0.3975462 0.81198436 0.71918267 0.8224538 0.70609421
		 0.80420363 0.69294089 0.79407889 0.70471847 0.32447267 0.68757969 0.32786083 0.68984866
		 0.28860715 0.47599444 0.17339285 0.47097069 0.16460729 0.15382992 0.16460729 0.13352667
		 0.0493927 0.13435601 0.0493927 0.15559398 0.16460729 0.11505328 0.0493927 0.11505364
		 0.1778769 0.0053534466 0.17736971 0.01951112 0.4283902 0.0053534466 0.42798656 0.01951112
		 0.70568126 0.0053534466 0.70607442 0.01951112 0.93325806 0.0053534466 0.93220711
		 0.01951112 0.37839055 0.84566027 0.79325759 0.10831248 0.79313421 0.10069048 0.64668161
		 0.10069048 0.64582616 0.10831248 0.73403561 0.09538056 0.73829782 0.080619469 0.71489334
		 0.080619469 0.70807683 0.09538056 0.87893409 0.080619469 0.87859029 0.0953805 0.89456373
		 0.0953805 0.89821297 0.080619469 0.62964493 0.74574631 0.36882406 0.33009279 0.36247706
		 0.34045991 0.65447193 0.29040936 0.3954435 0.7724393 0.38074467 0.79221958 0.54554355
		 0.7095505 0.51255673 0.71379554 0.42523524 0.59882736;
	setAttr ".uvst[0].uvsp[2000:2249]" 0.44984925 0.4945567 0.35709965 0.69570994
		 0.71407914 0.18959197 0.91469532 0.36245391 0.55042857 0.16214208 0.84577799 0.80083126
		 0.95778477 0.59243721 0.51161736 0.22862223 0.53494173 0.23631795 0.53852665 0.21173756
		 0.51799786 0.20509818 0.98418844 0.5978291 0.82840562 0.84657955 0.63121998 0.13523568
		 0.67913467 0.15043908 0.67079157 0.17227055 0.69351375 0.18076113 0.70308101 0.15969718
		 0.05583477 0.68477708 0.0493927 0.68487942 0.41628411 0.039744455 0.39323834 0.039744455
		 0.39323834 0.050911147 0.41628411 0.050911147 0.64155459 0.02349104 0.64155459 0.034657728
		 0.50525266 0.02349104 0.50525266 0.034657728 0.66253269 0.25478402 0.65279019 0.28164032
		 0.58224314 0.22575872 0.58217078 0.25366902 0.59783179 0.26091099 0.17339285 0.23124334
		 0.28860715 0.24834304 0.28860715 0.23000537 0.17339285 0.21269558 0.28860715 0.45687076
		 0.17339285 0.45505068 0.16460729 0.17357938 0.0493927 0.17457788 0.0493927 0.49743858
		 0.16460729 0.49110171 0.15970944 0.0053534466 0.15906104 0.01951112 0.40448937 0.0053534466
		 0.40400195 0.01951112 0.68381846 0.0053534466 0.68442625 0.01951112 0.91214257 0.0053534466
		 0.91139668 0.01951112 0.38886419 0.86720175 0.86574388 0.10069048 0.86590183 0.10831248
		 0.88624346 0.10831248 0.88755083 0.10069048 0.76100004 0.0953805 0.76100004 0.080619469
		 0.95307851 0.080619469 0.948502 0.09538056 0.96781003 0.0953805 0.96975458 0.080619469
		 0.75873101 0.36039093 0.50315285 0.27096161 0.52707827 0.26153708 0.51603806 0.25450739
		 0.62467515 0.44367561 0.65211183 0.45470017 0.65732199 0.44040582 0.63019216 0.42825636
		 0.65740061 0.36446649 0.71063948 0.55436808 0.46018901 0.81360286 0.4693853 0.83210957
		 0.44974855 0.79450715 0.51866525 0.74215215 0.48720929 0.74917507 0.43321437 0.58494979
		 0.44985586 0.48183 0.44727027 0.48263538 0.68281627 0.20505267 0.67272085 0.22895247
		 0.92963636 0.48862571 0.38743582 0.70382339 0.41117677 0.69557905 0.65247762 0.85495025
		 0.66161317 0.87934554 0.77609384 0.82146811 0.84415281 0.72116995 0.86658293 0.73630726
		 0.92493737 0.61211544 0.53520066 0.9445765 0.84525591 0.83347321 0.86388326 0.81709766
		 0.65059596 0.16524795 0.65769118 0.14340401 0.93729389 0.35073453 0.95027113 0.37384111
		 0.72498572 0.16902909 0.0493927 0.58163023 0.66518617 0.050911147 0.66518617 0.039744455
		 0.43704763 0.039744455 0.43704763 0.050911147 0.62007833 0.02349104 0.62007833 0.034657728
		 0.84723115 0.02349104 0.83083987 0.02349104 0.83083987 0.034657728 0.84723115 0.034657728
		 0.39457849 0.034657728 0.39457849 0.02349104 0.37236479 0.02349104 0.37236479 0.034657728
		 0.64290196 0.24725978 0.63395715 0.27475545 0.80389774 0.38320866 0.82213467 0.37003809
		 0.79375196 0.37142751 0.59820753 0.81489784 0.60431731 0.84297293 0.62541229 0.83509874
		 0.61731386 0.80769902 0.79862106 0.733639 0.78137898 0.71788019 0.77013338 0.72843128
		 0.17339285 0.43884432 0.28860715 0.43732911 0.17339285 0.42348751 0.16460729 0.19320558
		 0.0493927 0.19336401 0.0493927 0.47601584 0.16460729 0.47099456 0.13950203 0.0053534466
		 0.13898015 0.01951112 0.38084084 0.0053534466 0.38025796 0.01951112 0.66457719 0.0053534466
		 0.66523576 0.01951112 0.89506221 0.0053534466 0.89465302 0.01951112 0.33937332 0.81053901
		 0.32808062 0.80766451 0.82951552 0.080619469 0.80710667 0.080619469 0.81392318 0.0953805
		 0.83606184 0.0953805 0.84911799 0.10069048 0.85144949 0.10831248 0.78796446 0.09538056
		 0.78370219 0.080619469 0.93404549 0.080619469 0.92838681 0.0953805 0.6374343 0.76665097
		 0.74812067 0.7197625 0.71187848 0.39746308 0.68672633 0.38001549 0.68127912 0.45187718
		 0.67548442 0.46532199 0.66020125 0.56118512 0.43065935 0.44458866 0.41976157 0.42730093
		 0.6522041 0.22099058 0.8438192 0.35494176 0.66140002 0.19661698 0.79277593 0.23331667
		 0.77576178 0.25465602 0.86623901 0.33978561 0.92478848 0.46387461 0.95242351 0.45699039
		 0.64212155 0.18977416 0.67094833 0.90371335 0.64231563 0.88615543 0.75974125 0.8321538
		 0.8900888 0.75170982 0.56420046 0.82930088 0.54275769 0.96693808 0.56458831 0.96003652
		 0.87986994 0.80169827 0.96125638 0.39744499 0.76716137 0.19009097 0.78923577 0.20309986
		 0.074765205 0.61846608 0.0493927 0.62253833 0.72339058 0.050911147 0.72339058 0.039744455
		 0.70484734 0.039744455 0.70484734 0.050911147 0.4781473 0.039744455 0.45752266 0.039744455
		 0.45752266 0.050911147 0.4781473 0.050911147 0.57617068 0.02349104 0.57617068 0.034657728
		 0.81146884 0.02349104 0.81146884 0.034657728 0.41692284 0.034657728 0.41692284 0.02349104
		 0.33531836 0.70915961 0.78102988 0.35825911 0.61693257 0.26815858 0.75613582 0.73888332
		 0.85760361 0.55630594 0.85542369 0.57606864 0.28860715 0.17455484 0.17339285 0.17355578
		 0.17339285 0.19318187 0.28860715 0.19334012 0.17339285 0.38809478 0.28860715 0.40051052
		 0.17339285 0.40485504 0.28860715 0.42028868 0.0493927 0.24836624 0.16460729 0.2312666
		 0.0493927 0.4203091 0.0493927 0.43735132 0.16460729 0.42351022 0.16460729 0.40487793
		 0.16460729 0.43886766 0.0493927 0.45689157 0.10493781 0.0053534466 0.087857366 0.0053534466
		 0.088606022 0.01951112 0.10534757 0.01951112 0.33476421 0.01951112 0.33542281 0.0053534466
		 0.31618148 0.0053534466 0.31557372 0.01951112 0.61915922 0.0053534466 0.59551066
		 0.0053534466 0.59599817 0.01951112 0.61974216 0.01951112 0.86049801 0.0053534466
		 0.84029055 0.0053534466 0.84093881 0.01951112 0.86101979 0.01951112 0.50148398 0.20537002
		 0.96093774 0.10831248 0.96153307 0.10069048 0.94734955 0.10069048 0.94750023 0.10831248
		 0.8359741 0.10069048 0.83941996 0.10831248 0.91292644 0.0953805 0.9186793 0.080619469
		 0.64556378 0.78899628 0.57348126 0.66653514 0.68852466 0.56661528 0.40811741 0.41182578
		 0.47924933 0.71736377;
	setAttr ".uvst[0].uvsp[2250:2431]" 0.61782235 0.89401597 0.91140121 0.76512265
		 0.67925256 0.92557269 0.97844583 0.45009682 0.9707787 0.42344627 0.80773544 0.21492414
		 0.74486828 0.050911147 0.74486828 0.039744455 0.51771289 0.039744455 0.51771289 0.050911147
		 0.99263144 0.050911147 0.99263144 0.039744455 0.77438366 0.02349104 0.77438366 0.034657728
		 0.44044903 0.02349104 0.44044903 0.034657728 0.35261261 0.35860234 0.75577003 0.33724219
		 0.85835522 0.53805959 0.85756552 0.51981568 0.74351585 0.74746764 0.7278372 0.75767565
		 0.85175526 0.59547281 0.28860715 0.15557149 0.17339285 0.15380624 0.0493927 0.23002987
		 0.16460729 0.21271895 0.066741921 0.0053534466 0.06779696 0.01951112 0.29431874 0.0053534466
		 0.29392561 0.01951112 0.57160985 0.0053534466 0.5720135 0.01951112 0.82212317 0.0053534466
		 0.82263011 0.01951112 0.46713576 0.18442522 0.97668529 0.10831248 0.9771471 0.10069048
		 0.82515132 0.10069048 0.82818651 0.10831248 0.56892163 0.080619529 0.57349825 0.09538056
		 0.43725568 0.4573468 0.59311485 0.43151209 0.5998767 0.41585103 0.70585662 0.57177377
		 0.44317237 0.47161335 0.63391805 0.86151761 0.64323288 0.82866597 0.60645902 0.94789183
		 0.58458656 0.9540714 0.89741367 0.78225541 0.4999485 0.09305986 0.74761438 0.17991717
		 0.0493927 0.60077035 0.090482593 0.59814107 0.68326592 0.039744455 0.68326592 0.050911147
		 0.49763206 0.050911147 0.49763206 0.039744455 0.59931993 0.02349104 0.59931993 0.034657728
		 0.79477191 0.02349104 0.79477191 0.034657728 0.76977187 0.34770179 0.34908479 0.36046082
		 0.28860715 0.21219662 0.0493927 0.21222214 0.16460729 0.4550747 0.12251192 0.01951112
		 0.12280849 0.0053534466 0.35781962 0.01951112 0.35849252 0.0053534466 0.64150751
		 0.0053534466 0.64218038 0.01951112 0.87719148 0.0053534466 0.87748814 0.01951112
		 0.45811749 0.94466186 0.68593812 0.09538056 0.6924845 0.080619469 0.68112826 0.080619499
		 0.67593682 0.09538053 0.92116165 0.10069048 0.92072892 0.10831248 0.65745717 0.62024832
		 0.50513804 0.24431457 0.43898609 0.57410747 0.61082035 0.86917269 0.47987393 0.084005438
		 0.99260473 0.034657728 0.99260473 0.02349104 0.38715276 0.24194497 0.38680005 0.25611797
		 0.98945034 0.0953805 0.99305528 0.080619469 0.58779204 0.19994584 0.41134983 0.88141906
		 0.37233832 0.039744455 0.37233832 0.050911147 0.40168223 0.88593906 0.9913516 0.10831248
		 0.99102235 0.10069048 0.36951038 0.39593887 0.36284804 0.39005789 0.36269638 0.39119083
		 0.36840501 0.39622998 0.36284003 0.39259928 0.3669897 0.39626226 0.36569566 0.39597589
		 0.3632848 0.3938477 0.36428759 0.39514139 0.37058273 0.38552019 0.37305316 0.38770086
		 0.37206307 0.38633278 0.36886817 0.38521841 0.36721599 0.38543892 0.37355158 0.3910315
		 0.37356532 0.38936469 0.37253022 0.39343268 0.3730748 0.39262718 0.36569184 0.38611001
		 0.36487228 0.38682726 0.36644292 0.38577932 0.370848 0.39521199 0.36340332 0.38864046
		 0.37194872 0.3942928 0.36417878 0.38743415 0.36333928 0.38487664 0.35989323 0.38854349
		 0.3613264 0.38827434 0.36320177 0.3861188 0.36243474 0.387492 0.35866615 0.38827989
		 0.36289823 0.38362429 0.36191824 0.38247061 0.35647216 0.38700739 0.35861856 0.37994328
		 0.3570407 0.37891838 0.3525697 0.38361415 0.35601804 0.37856367 0.35222065 0.38235295
		 0.36083072 0.38153777 0.35380882 0.38505581 0.35488075 0.37853947 0.35220638 0.38126537
		 0.35246 0.38027981 0.35381362 0.37884361 0.3530499 0.37936696 0.55968589 0.21854429
		 0.56383914 0.24638745 0.63434172 0.80114859 0.3883059 0.27669606 0.58254057 0.82207322
		 0.5750227 0.82503593 0.56743485 0.82802618 0.34643802 0.31755888 0.35003543 0.31038493
		 0.34287375 0.32466671 0.33485422 0.34505385 0.32950708 0.34669444 0.37397397 0.24267501
		 0.37065998 0.25721943 0.36391118 0.28020579 0.35156888 0.30732694 0.54378384 0.1873548
		 0.56724203 0.19396235 0.66622007 0.0953805 0.67009515 0.080619529 0.35271934 0.81393611
		 0.35806185 0.80083221 0.36516273 0.78249526 0.3728767 0.75665718 0.37006012 0.73581821
		 0.30521706 0.69770539 0.31024411 0.69998336 0.31572562 0.72105354 0.36413354 0.71380478
		 0.56626409 0.24735066 0.57279134 0.24994338 0.49744388 0.22350879 0.56711888 0.40536422
		 0.58006907 0.40851492;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 1783 ".pt";
	setAttr ".pt[0:165]" -type "float3"  0 0.64306998 4.7358828 0 0.54042506 
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
		3.9278562 0 1.6789159 3.9746399 0 1.4920801 3.9448252 0 1.7094151 3.8665903 0 1.4733847 
		3.8292227 0 1.8880248 3.9001822 0 1.9996202 3.9228923 0 2.0374985 3.9342961 0 1.1930376 
		3.8079712 0 -0.80669761 5.6655788 0 -0.81727672 5.8176894 0 -0.78222656 5.4147172 
		0 -0.81455874 5.8593588 0 -0.71275258 5.1168489 0 -0.58693337 4.7897987 0 1.8880343 
		3.9001689 0 1.9996213 3.9228907 0 1.7094611 3.8667517 0 1.473404 3.8294184 0 1.1925026 
		3.8060496 0 0.8812567 3.8274176 0 0.5426532 3.8835828 0 -0.38983202 4.4890518 0 -0.12982655 
		4.2167301 0 -0.58686638 4.7898641 0 -0.71283197 5.116888 0 0.2078563 3.9992454 0 
		-0.8066287 5.665627 0 -0.78231263 5.4147692 0 -0.81727552 5.8176899 0 0.88126767 
		3.827462 0 0.54266787 3.8836222 0 -0.38987684 4.4890079 0 -0.12984324 4.2167087 0 
		0.20785737 3.9992459 0 1.8042057 3.6190736 0 1.5996068 3.5431836 0 1.3424159 3.4679196 
		0 1.0379198 3.380811 0 0.69987917 3.3295336 0 0.25094628 3.3230119 0 -0.15232384 
		3.3741486 0 -0.53450167 3.4835961 0 -0.87455618 3.6388257 0 -1.1757454 3.8311019 
		0 -1.4096504 4.0222716 0 -1.5796226 4.2062445 0 -1.7096355 4.3569798 0 -1.7754902 
		4.4529543 0 -1.7881485 4.4675398 0 1.92822 3.651005 0 1.9709017 3.6643889 0 1.8042052 
		3.6190732 0 1.5996066 3.5431843 0 1.3424158 3.4679198 0 1.0379192 3.380811 0 0.69987917 
		3.3295336 0 0.25094628 3.3230119 0 -0.15232384 3.3741486 0 -0.53450203 3.4835963 
		0 -0.87455618 3.6388261 0 -1.1757448 3.8311017 0 -1.4096504 4.0222721 0 -1.579622 
		4.2062445 0 -1.7096351 4.3569798 0 -1.7754898 4.4529543 0 1.9282203 3.6510053 0 -1.2511491 
		5.1676426 0 -1.287111 5.2926302 0 -1.1825479 4.9579868 0 -1.0766066 4.705143 0 -0.89600205 
		4.4235501 0 -0.66023993 4.1634741 0 -0.36825418 3.9399385 0 -1.2932067 5.3215761 
		0 -1.2871115 5.2926307 0 -1.2511492 5.1676426 0 -1.1825484 4.9579868 0 -1.0766064 
		4.705143 0 -0.89600241 4.4235506 0 -0.66023982 4.1634746 0 -0.36825442 3.9399388 
		0 0.89103556 3.8879395 0 0.55875027 3.9446309 0 0.23931408 4.0566287 0 -0.080821753 
		4.2618742 0 -0.34287715 4.5322742 0 -0.53504109 4.8279009;
	setAttr ".pt[166:331]" 0 -0.66283822 5.1476679 0 -0.73236942 5.4487071 0 -0.75008202 
		5.6776981 0 -0.75704622 5.8170047 0 -0.75496674 5.8601885 0 -0.75704694 5.8170047 
		0 -0.75016022 5.677639 0 -0.73117566 5.448545 0 -0.66167045 5.1473198 0 -0.53528953 
		4.8275528 0 -0.34213758 4.5324879 0 -0.080862045 4.2617922 0 0.23933363 4.0566506 
		0 0.55884552 3.9442911 0 0.89117861 3.8875818 0 1.2060072 3.8704712 0 1.4919637 3.8895717 
		0 1.7026668 3.9208374 0 1.8726743 3.952219 0 1.9858571 3.9725201 0 2.0187581 3.9818094 
		0 1.9856132 3.9728022 0 1.8726821 3.9522753 0 1.7019531 3.9220703 0 1.492191 3.8887436 
		0 1.2038403 3.8688493 0 -0.83436906 0.080842137 0 -0.80542803 0.078057498 0 2.7441335 
		2.5045242 0 2.3975112 2.2595961 0 2.7740595 2.5264015 0 2.6144087 2.4002855 0 1.8844172 
		1.9074836 0 -2.2099414 -0.97611582 0 -2.2134068 -0.9664554 0 -1.4491082 -0.36198819 
		0 -1.4304645 -0.36888647 0 -2.2099545 -0.97612667 0 -3.7144005 -2.263459 0 -3.7941082 
		-2.3556483 0 -3.8431182 -2.4131522 0 -3.8558702 -2.4280291 0 -3.8422079 -2.411994 
		0 -3.796468 -2.3583467 0 -3.7130041 -2.2616081 0 -3.5823765 -2.1166115 0 -3.4170961 
		-1.9406424 0 -3.1656961 -1.6845628 0 -2.8319566 -1.3697169 0 -2.2992649 -0.9155761 
		0 -1.489544 -0.29692376 0 -0.7552582 0.21987924 0 0.012484133 0.7502622 0 0.33963645 
		0.97494137 0 0.65878075 1.1931276 0 0.92387891 1.3733962 0 1.1895452 1.5533876 0 
		1.4530182 1.7314358 0 1.7111075 1.9057441 0 2.0770411 2.153511 0 2.4181852 2.3861179 
		0 2.6692073 2.5595677 0 2.8905618 2.7155485 0 3.0749202 2.848959 0 3.2225614 2.9593053 
		0 3.3338029 3.0468438 0 3.4265242 3.123395 0 3.468118 3.1596925 0 3.4513776 3.1446927 
		0 3.3672209 3.0742741 0 3.2225144 2.9600103 0 3.0749514 2.8491323 0 2.8904984 2.7157433 
		0 2.668541 2.5594201 0 2.3071916 2.310477 0 1.9097718 2.040338 0 1.6014383 1.8319535 
		0 1.2504781 1.5946971 0 0.88893187 1.3497711 0 0.56054109 1.1261504 0 0.16847527 
		0.85783386 0 -0.66774869 0.28107139 0 -2.2884436 -0.9080466 0 -2.7830749 -1.3260131 
		0 -3.1317816 -1.6538476 0 -3.4191055 -1.9418842 0 -3.5824955 -2.1169016 0 2.7431333 
		2.4477484 0 2.9650664 2.6041079 0 3.149483 2.7375515 0 3.2968669 2.8486934 0 3.4415205 
		2.9630358 0 3.5256081 3.0335569 0 3.5422759 3.0486646 0 3.5007553 3.0122585 0 3.4080653 
		2.9356599 0 3.2971306 2.8476686 0 2.7438898 2.4477625 0 3.1495321 2.7372601 0 2.9652109 
		2.6037936 0 1.984393 1.9286212 0 2.3818047 2.1987729 0 2.4928606 2.2743223 0 1.7858099 
		1.7939056 0 2.1517429 2.0416741 0 1.3251151 1.4829565 0 0.96359187 1.2379975 0 1.5277101 
		1.6196128 0 1.2642243 1.4415843 0 0.99857104 1.2615746 0 0.73350316 1.0812622 0 0.24323297 
		0.74591863 0 0.41442505 0.86297953 0 0.087324381 0.63822567 0 -2.2240505 -1.0280691 
		0 -3.3430264 -2.0552061 0 -3.5059643 -2.2310553 0 -3.0561726 -1.7667711 0 -3.765161 
		-2.529839 0 -3.7163248 -2.4717741 0 -3.6369534 -2.3784542 0 -3.7642508 -2.5286808 
		0 -3.7778571 -2.5448291 0 -3.7186065 -2.4744525 0 -3.0900011 -1.7975236 0 -2.7565165 
		-1.4823791 0 -3.3408761 -2.0539947 0 -3.5058019 -2.2307494 0 -3.6361704 -2.3769712 
		0 -2.7076893 -1.4386806 0 -2.2131968 -1.0205814 0 -0.59290105 0.16902643 0 0.635252 
		1.0143025 0 1.6760486 1.7202522 0 -0.68037701 0.10778713 0 -1.4145603 -0.40914273 
		0 1.1667304 0.82445824 0 1.9066263 1.3252171 0 1.7304698 1.205995 0 0.84714288 0.60816258 
		0 0.32061765 0.25181222 0 0.17718676 0.15473863 0 0.21440113 0.1799252 0 0.39055765 
		0.29914737 0 1.2738845 0.89697981 0 0.95429689 0.68068397 0 1.8004096 1.25333 0 1.9438405 
		1.3504035 0 0.1402981 0.12977257 0 0.64752072 0.473059 0 1.5677363 1.0958575 0 1.9807293 
		1.3753698 0 1.4735067 1.0320833 0 0.55329108 0.40928471 0 1.1210938 0.86221945 0 
		1.765057 1.2980515 0 1.6117405 1.1942874 0 0.84294295 0.67396808 0 0.3846854 0.36382103 
		0 0.25985122 0.27933371 0 0.2922405 0.30125463 0 0.44555715 0.40501878 0 1.2143546 
		0.92533815 0 0.93620372 0.73708653 0 1.672612 1.2354851 0 1.7974463 1.3199725;
	setAttr ".pt[332:497]" 0 0.22774564 0.25760472 0 0.66920322 0.55638158 0 1.4701065 
		1.09843 0 1.8295519 1.3417015 0 1.3880943 1.0429245 0 0.5871911 0.50087607 0 0.97827768 
		1.3461668 0 0.6500597 1.1240301 0 0.33499914 0.91079825 0 0.071096539 0.73219001 
		0 -0.10981694 0.60974836 0 -0.18592104 0.55824149 0 -0.14803636 0.58388162 0 -0.00073212385 
		0.68357664 0 0.23822463 0.84530163 0 0.54001188 1.0495502 0 0.86822981 1.2716869 
		0 1.1832905 1.4849188 0 1.447193 1.6635271 0 1.6281066 1.7859688 0 1.7042106 1.8374757 
		0 1.6663256 1.8118353 0 1.5190214 1.7121402 0 1.2800648 1.5504153 0 -0.23887855 0.48427659 
		0 -0.43031594 0.34926626 0 -0.46882647 0.31149381 0 -0.35433614 0.37517035 0 -0.10575575 
		0.53185755 0 0.24388051 0.76353979 0 0.65596592 1.0427595 0 1.0844523 1.3358966 0 
		1.4791011 1.608544 0 1.7929361 1.8301151 0 1.9881202 1.9735521 0 2.0393801 2.0187778 
		0 1.9383398 1.9571747 0 1.3433211 1.5573218 0 1.6964316 1.7961771 0 0.92219388 1.2712375 
		0 0.48320392 0.97419804 0 0.079544008 0.70106143 0 -1.3828363 -0.38726732 0 -1.4578681 
		-0.27497673 0 -2.7514293 -1.4398787 0 -3.3522296 -2.0448871 0 0.72645867 1.1279515 
		0 -0.93405813 0.00012987852 0 -2.5487044 -1.1410151 0 -3.1070328 -1.6985635 0 -3.262074 
		-1.8536659 0 -3.3883946 -1.9801271 0 -3.4707613 -2.0626955 0 -3.2611377 -1.8539593 
		0 -3.4703929 -2.0628121 0 -2.7868061 -1.3784676 0 -2.5775506 -1.1696143 0 -2.660243 
		-1.2520815 0 -2.9409111 -1.5338633 0 -2.5771821 -1.1697311 0 -2.6595488 -1.2522992 
		0 -2.7858701 -1.3787608 0 -2.9419742 -1.5335288 0 -3.1059692 -1.6988976 0 -3.499239 
		-2.0914116 0 -3.3877006 -1.9803452 0 -2.8347602 -1.6400304 0 -2.471031 -1.275898 
		0 -2.5533972 -1.3584659 0 -2.6797187 -1.4849274 0 -2.4425535 -1.247182 0 -2.4713998 
		-1.2757814 0 -2.5540919 -1.3582484 0 -2.8358233 -1.6396959 0 -2.6806552 -1.4846346 
		0 -3.1549864 -1.9601259 0 -3.3642414 -2.1689789 0 -3.3930876 -2.1975782 0 -3.2815497 
		-2.0865123 0 -2.9998183 -1.8050647 0 -3.1559229 -1.959833 0 -3.2822437 -2.0862942 
		0 -3.3646107 -2.1688623 0 -3.0008821 -1.8047305 0 -0.62060177 -0.38413897 0 -0.54287368 
		0.32459095 0 -1.4414505 -0.34985721 0 -1.1279982 -0.11046708 0 -1.3076011 -0.24670351 
		0 -0.92430776 0.042417675 0 -0.72109538 0.19351223 0 -0.34315604 0.46262735 0 -0.4111369 
		0.4198449 0 -0.34177631 0.46778411 0 -0.41511068 0.40499601 0 -0.72856337 0.16560557 
		0 -1.1354661 -0.13837364 0 -1.3136888 -0.26945305 0 -1.5147855 -0.41264582 0 -1.4454242 
		-0.36470616 0 -0.54896158 0.30184117 0 -0.93225497 0.012720019 0 -1.513406 -0.4074893 
		0 -1.0145175 -0.61219341 0 -0.84739935 -0.49135625 0 -0.58960813 -0.29968056 0 -0.36176768 
		-0.12685379 0 -0.2704871 -0.053743578 0 -0.35847756 -0.11455896 0 -0.58456761 -0.28084391 
		0 -0.8429665 -0.47479135 0 -1.0127672 -0.60565174 0 0.99917507 0.77032208 0 1.0561906 
		1.4714891 0 0.16938481 0.79048741 0 0.47261247 1.0283296 0 0.29748738 0.892115 0 
		0.67363447 1.1826999 0 0.87630981 1.3366079 0 1.2709099 1.622022 0 1.1915823 1.5710756 
		0 1.266153 1.6233548 0 1.2052785 1.5672376 0 0.90205085 1.3293954 0 0.49835339 1.021117 
		0 0.31847176 0.88623524 0 0.10850984 0.73436993 0 0.18308127 0.7866497 0 1.0771749 
		1.4656093 0 0.70102757 1.1750243 0 0.10375285 0.73570263 0 0.61154127 0.54054952 
		0 0.78329617 0.66688287 0 1.0404059 0.86212766 0 1.2625661 1.0349271 0 1.3458251 
		1.1044258 0 1.2512254 1.0381049 0 1.0230305 0.86699611 0 0.76801682 0.67116427 0 
		0.60550666 0.54224014 0 -1.1735464 -0.62887603 0 -1.2719262 -0.57668155 0 -1.3438816 
		-0.6343137 0 -1.2275147 -0.67210144 0 -0.89600366 -0.41661471 0 -0.95847404 -0.33729079 
		0 -1.1380768 -0.47352824 0 -1.0307108 -0.51879662 0 -0.75478417 -0.18440703 0 -0.67863899 
		-0.25346613 0 -0.52622092 -0.14013797 0 -0.55157119 -0.033311218 0 -0.37334991 0.097766712 
		0 -0.33603477 -0.0002592802 0 -0.23722528 0.071186922 0 -0.24161325 0.19302146 0 
		-0.17225254 0.2409603 0 -0.1632081 0.12234452 0 -0.16424294 0.11847688 0 -0.17363249 
		0.23580359 0 -0.24102797 0.056976572 0 -0.24558693 0.17817247 0 -0.34142327 -0.020395532 
		0 -0.37943783 0.07501699 0 -0.53308213 -0.1657771 0 -0.55903941 -0.061217815;
	setAttr ".pt[498:663]" 0 -0.68585968 -0.28044879 0 -0.76273113 -0.21410456 
		0 -0.96594197 -0.36519727 0 -0.90271306 -0.44168603 0 -1.0363853 -0.54000032 0 -1.1441646 
		-0.49627778 0 -1.2289871 -0.67760432 0 -1.3452613 -0.63947046 0 -1.2759 -0.59153032 
		0 -1.1769648 -0.64164841 0 0.44132206 0.51500911 0 0.34120125 0.56540811 0 0.27556932 
		0.51062292 0 0.39209676 0.47391909 0 0.70937383 0.72562528 0 0.64442885 0.80325067 
		0 0.46930355 0.66703504 0 0.5780248 0.62345964 0 0.84545034 0.95762008 0 0.92389101 
		0.8903591 0 1.0759057 1.005797 0 1.048126 1.1115291 0 1.2280064 1.2464097 0 1.2678626 
		1.1497335 0 1.3694128 1.2244285 0 1.3633982 1.3459967 0 1.4379689 1.3982755 0 1.4489896 
		1.2802174 0 1.4525577 1.2792178 0 1.4427258 1.396943 0 1.3825203 1.2207555 0 1.3770946 
		1.3421589 0 1.2864362 1.1445287 0 1.2489907 1.2405297 0 1.0995555 0.99917024 0 1.073867 
		1.1043166 0 0.94878024 0.88338524 0 0.8728435 0.9499445 0 0.67016983 0.79603791 0 
		0.73249984 0.7191453 0 0.59758335 0.61797959 0 0.49028793 0.66115534 0 0.3971729 
		0.47249678 0 0.28032604 0.5092901 0 0.35489771 0.56157029 0 0.45310336 0.51170814 
		0 -0.099004477 0.42616048 0 0.19798078 0.62811726 0 0.57418865 0.88268918 0 0.98332798 
		1.1595427 0 1.3758675 1.4260122 0 1.7049413 1.6486316 0 1.9304113 1.7991853 0 2.0247173 
		1.8579259 0 1.9770503 1.817765 0 1.7948046 1.6859188 0 1.5012598 1.4803724 0 1.1318104 
		1.2261674 0 0.73054868 0.95224065 0 0.34479052 0.69091958 0 0.018322602 0.47368002 
		0 -0.21215184 0.32635906 0 -0.31654534 0.26606348 0 -0.27844027 0.30063435 0 1.2700055 
		0.67480856 0 1.5201396 0.84352618 0 1.6058033 0.90130711 0 1.4869136 0.8211149 0 
		1.2191001 0.64047253 0 0.92767596 0.4439044 0 0.7490015 0.32338703 0 0.76668072 0.33531186 
		0 0.9724412 0.47409892 0 1.0254782 1.319959 0 1.59893 1.7067572 0 1.7953207 1.8392246 
		0 1.5227568 1.6553779 0 0.9087739 1.241241 0 0.24066177 0.79059368 0 -0.16896325 
		0.51429826 0 -0.12843215 0.54163682 0 0.34328961 0.85981703 0 1.2110538 0.90232611 
		0 1.6214807 1.179163 0 1.7620399 1.2739716 0 1.5669626 1.1423899 0 1.127527 0.84598649 
		0 0.64934999 0.52345222 0 0.35617599 0.32570434 0 0.38518459 0.34527081 0 0.72280204 
		0.57299626 0 1.1060895 0.27595726 0 0.90032899 0.13717017 0 0.88264972 0.12524536 
		0 1.0613241 0.24576268 0 1.3527484 0.44233075 0 1.6205618 0.6229732 0 1.7394515 0.70316541 
		0 1.6537879 0.64538455 0 1.4036537 0.47666684 0 1.4971558 -0.061126828 0 1.3794783 
		0.097967505 0 1.6527134 0.28227508 0 1.7488323 0.10903203 0 1.255116 -0.22398424 
		0 1.1171892 -0.078940392 0 1.0530422 -0.36068583 0 0.89749664 -0.2271331 0 0.91372049 
		-0.45425904 0 0.74688429 -0.32871395 0 0.85588866 -0.49366802 0 0.68353254 -0.3714537 
		0 0.88438714 -0.47404444 0 0.71506739 -0.3501749 0 0.99794352 -0.39785039 0 0.83770013 
		-0.26746655 0 1.1808416 -0.27408296 0 1.0366254 -0.13328147 0 1.4127399 -0.11806619 
		0 1.2878648 0.036172748 0 1.6643705 0.052061856 0 1.5610995 0.2204805 0 1.90619 0.21476996 
		0 1.8233892 0.3973881 0 2.1087248 0.35178196 0 2.043081 0.54558098 0 2.2474015 0.44491947 
		0 2.1936936 0.6471622 0 2.3059855 0.48483562 0 2.257045 0.68990195 0 2.2767189 0.46469426 
		0 2.2255104 0.66862321 0 2.1638532 0.38896632 0 2.1028774 0.58591461 0 1.9804243 
		0.26484144 0 1.9039525 0.45172989 0 1.270203 0.27978691 0 1.5158068 0.44544828 0 
		1.7416316 0.59776962 0 1.9204408 0.71837795 0 2.0306671 0.79272676 0 2.0590158 0.81184816 
		0 2.002068 0.77343619 0 1.8666924 0.68212378 0 1.6692164 0.54892445 0 1.4334583 0.38990408 
		0 1.1878554 0.2242423 0 0.96202976 0.071921498 0 0.78322047 -0.048686832 0 0.67299414 
		-0.12303546 0 0.64464551 -0.14215681 0 0.70159328 -0.10374513 0 0.83696938 -0.012432843 
		0 1.0344456 0.12076607 0 1.0910332 -0.44940075 0 1.1123739 -0.4347055 0 1.1343393 
		-0.41989014 0 1.9331131 0.11858988 0 1.7596914 0.0019161105 0 2.0704691 0.21153766 
		0 2.1549854 0.26824427 0 2.1769013 0.28332704 0 2.1330318 0.25343651 0 2.0291877 
		0.18369317 0 1.8775247 0.081095278 0 1.6964444 -0.040744781;
	setAttr ".pt[664:829]" 0 1.5080171 -0.16814065 0 1.3343662 -0.28496987 0 1.1974076 
		-0.37764996 0 1.2386669 -0.34982008 0 1.3899845 -0.2474547 0 1.5712297 -0.125503 
		0 1.0812632 -0.32626751 0 1.1004347 -0.31306595 0 1.1201674 -0.29975647 0 1.8377503 
		0.18399006 0 1.6819561 0.079175591 0 1.9611449 0.26749033 0 2.0370708 0.31843305 
		0 2.0567591 0.33198267 0 2.0173485 0.30513036 0 1.9240595 0.24247605 0 1.7878124 
		0.1503067 0 1.6251377 0.040850937 0 1.455863 -0.073595881 0 1.2998629 -0.17855018 
		0 1.176825 -0.26180965 0 1.2138907 -0.2368086 0 1.3498278 -0.14484811 0 1.5126504 
		-0.035292089 0 1.1434606 -0.28417963 0 1.274727 -0.19563919 0 1.5436374 -0.014256597 
		0 1.8243659 0.17509705 0 1.9855555 0.28382051 0 1.9517846 0.26104182 0 1.738855 0.1174193 
		0 1.446398 -0.079845309 0 1.2112589 -0.23844925 0 -4.0086899 1.177964 0 -3.933207 
		1.5127093 0 -4.588541 -0.46769595 0 -6.4721246 0.31618357 0 -6.5294018 -0.05922246 
		0 -5.8476043 1.9792045 0 -4.2207603 0.51294219 0 -4.1092443 0.85588431 0 -4.4473805 
		-0.13712263 0 -4.3267303 0.20264006 0 -6.2670913 0.92065191 0 -5.9943986 1.6802578 
		0 -6.147119 1.2714181 0 -5.0548534 0.80997896 0 -5.154285 0.45601892 0 -3.9058084 
		1.2911344 0 -4.0213852 1.3001329 0 -3.8636966 1.6059276 0 -3.979845 1.6199712 0 -3.9925895 
		0.96751797 0 -4.0970993 1.013628 0 -5.6546702 1.727931 0 -5.7900877 1.793237 0 -5.5276189 
		2.0242364 0 -5.6610293 2.0829036 0 -4.2141571 0.63769376 0 -4.1081724 0.59284961 
		0 -4.3397932 -0.098733902 0 -4.4330773 -0.015527248 0 -4.3291879 0.27866411 0 -4.2242088 
		0.2400533 0 -5.8777881 1.0992546 0 -6.0313683 1.1093912 0 -5.7623811 1.4489875 0 
		-5.9134302 1.460161 0 -4.5868778 -0.35378742 0 -4.4936585 -0.43401909 0 -6.0781956 
		0.429919 0 -6.2410841 0.40745354 0 -6.2799311 0.031023741 0 -6.1139021 0.097374201 
		0 -5.2956982 -0.1256249 0 -5.2347469 0.14011312 0 -5.4163437 -0.68444967 0 -5.5880241 
		-0.6406424 0 -5.1862779 -0.97946596 0 -5.3768368 -1.0166945 0 -5.211484 -0.87196708 
		0 -5.0252838 -0.83816409 0 -5.4857335 -0.86238575 0 -5.6666107 -0.81537461 0 -5.8644819 
		-0.71336079 0 -6.008451 -0.59461546 0 -5.7353973 -0.56965399 0 -5.8753862 -0.46194315 
		0 -6.0583048 -0.8809278 0 -6.2073941 -0.76737976 0 -5.0430603 -0.66930723 0 -5.2192001 
		-0.69556451 0 -5.6882725 -1.0129111 0 -5.8727374 -0.97023153 0 -4.6827693 2.2636418 
		0 -4.7070785 2.1578116 0 -4.6641111 2.3825176 0 -4.1813173 2.1636007 0 -4.3436618 
		2.2637067 0 -4.2656999 2.0816462 0 -4.4170866 2.1706691 0 -3.9773529 1.8072827 0 
		-4.0670748 1.96676 0 -4.0173874 2.0185425 0 -3.9245472 1.8716106 0 -4.9556079 2.2922285 
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
		0.38330913 0 -4.6364384 0.7229588 0 -4.5380068 1.0597394;
	setAttr ".pt[830:995]" 0 -4.4613838 1.3572624 0 -4.4143686 1.6277235 0 -4.4127569 
		1.8372486 0 -4.43855 1.9899008 0 -4.4887795 2.113925 0 -6.161366 -0.20473862 0 -6.195982 
		0.047642231 0 -6.1578579 0.40485573 0 -5.9451036 1.1156516 0 -5.8230019 1.4846966 
		0 -5.7070923 1.7868785 0 -5.5727854 2.0984404 0 -5.4573069 2.2392166 0 -5.3213987 
		2.3245251 0 -5.1347485 2.3736045 0 -4.9549646 2.3908784 0 -4.8050475 2.3860741 0 
		-4.6593728 2.3597527 0 -4.5130715 2.3196087 0 -4.3710127 2.2579477 0 -4.209722 2.1624184 
		0 -4.0594459 2.0379362 0 -3.9672141 1.8987514 0 -3.9035378 1.6613404 0 -3.9474373 
		1.3247219 0 -4.0289259 1.0170667 0 -4.1521802 0.62072337 0 -4.2736602 0.24294138 
		0 -4.3849602 -0.07392168 0 -4.5471964 -0.43027568 0 -4.6805372 -0.58549595 0 -4.8531332 
		-0.70584798 0 -5.0394588 -0.77610779 0 -5.226727 -0.80491257 0 -5.4460044 -0.79341412 
		0 -5.6284418 -0.74673629 0 -5.7913113 -0.66729856 0 -5.9395542 -0.55206466 0 -6.0718193 
		-0.39431739 0 -3.6711955 2.2115855 0 -10.874293 1.0175905 0 -10.507488 -1.8701739 
		0 -7.4885511 1.7268646 0 -11.733809 1.7853346 0 -7.6364932 2.946095 0 -7.3288469 
		-2.0273888 0 -11.219616 -0.40732718 0 -3.3169179 0.4017942 0 -7.4030428 -0.050695419 
		0 -5.5523524 3.018229 0 -3.8380001 2.6444628 0 -5.4992476 1.9728005 0 -7.606451 2.4008875 
		0 -5.5534458 2.6134746 0 -9.4564552 1.4549198 0 -11.364722 1.4077368 0 -9.8255501 
		2.6213317 0 -9.6907301 2.0954123 0 -5.2171302 -1.8271757 0 -5.3353834 0.15049815 
		0 -9.3159599 -2.0545716 0 -9.4324131 -0.25945425 0 -1.2905536 2.3389902 0 -11.551347 
		-2.6202836 0 -2.7511823 3.0986516 0 -3.8632538 2.7476985 0 -4.632813 2.6293747 0 
		-5.5553722 2.9065301 0 -4.6039991 2.8946524 0 -4.6418858 2.8147137 0 -4.5568304 2.0900431 
		0 -6.4811339 1.8508821 0 -6.5534625 2.5251288 0 -7.6382289 2.775249 0 -6.5527816 
		3.0144677 0 -6.5628495 2.8665354 0 -8.6760559 2.2688775 0 -9.7916603 2.4434533 0 
		-8.7432899 2.8196263 0 -8.7347145 2.6397543 0 -8.5066404 1.5976994 0 -10.257318 1.2840533 
		0 -10.581514 1.8409996 0 -11.613176 1.6459942 0 -10.823119 2.3047724 0 -10.752005 
		2.1414995 0 -12.522306 0.8751936 0 -9.5118084 -3.0553777 0 -7.3666863 -2.9892325 
		0 -8.4635401 -3.0544946 0 -11.433451 -2.53195 0 -10.478287 -2.9225507 0 -10.098594 
		-1.9950285 0 -8.3682585 -2.0593698 0 -5.3035889 -2.7769728 0 -6.260262 -2.8863273 
		0 -6.2682281 -1.958775 0 -4.6556964 -2.6951032 0 -3.1011899 -0.49335861 0 -4.201592 
		-1.5938228 0 -5.2756224 -0.89695644 0 -4.2993059 0.2657187 0 -4.2083673 -0.73171031 
		0 -3.245445 2.7724497 0 -2.9203982 3.2249813 0 -3.3592718 2.8894088 0 -2.4331496 
		2.8797801 0 -2.8350549 2.3843341 0 -2.5114732 3.9784513 0 -12.266597 -1.7172437 0 
		-10.932513 -1.2443147 0 -2.4526653 0.62471914 0 -12.056082 0.68107414 0 -12.347101 
		0.85003328 0 -9.3813896 -1.2085171 0 -10.32419 -0.34491539 0 -10.225773 -1.2300253 
		0 -7.365304 -1.0976584 0 -8.4411707 -0.15704727 0 -8.4089794 -1.1689258 0 -6.3689351 
		0.048619747 0 -6.3242941 -1.0066166 0 -1.082427 3.0136909 0 -2.2810369 3.7080164 
		0 -1.9792168 3.4679554 0 -2.4577665 3.9017134 0 -3.853157 2.7867808 0 -7.3742518 
		-3.0681796 0 -5.3077946 -2.8439484 0 -9.5448761 -3.1542001 0 -12.833171 -0.45993233 
		0 -2.9690502 3.2705719 0 -12.398541 -1.8171797 0 -8.4814062 -3.1439383 0 -10.535468 
		-3.0228567 0 -6.2613316 -2.9567766 0 -3.396358 2.9373398 0 -3.4707134 1.7546195 0 
		-10.737323 0.90122795 0 -7.4542494 1.4592772 0 -11.030022 -0.39997625 0 -3.075026 
		0.31305158 0 -7.5454774 -0.13263559 0 -3.7837152 2.4760375 0 -7.6070557 2.4109411 
		0 -5.6319418 2.5204487 0 -9.394846 1.2133031 0 -11.422324 1.4140978 0 -9.6959476 
		2.1737037 0 -9.3972683 -0.28483629 0 -11.240009 -2.3346405 0 -12.448656 -0.4000206 
		0 -1.5340185 2.3111861 0 -2.7032766 3.0614786 0 -3.8737919 2.689822 0 -5.5550985 
		2.8798866 0 -4.6819186 2.7621791 0 -3.6468482 2.2064714 0 -6.6653094 1.5446303 0 
		-7.527936 1.9914103 0 -6.5205531 2.4879107 0 -6.5926685 2.0531948 0 -7.6396494 2.7946024 
		0 -6.5332365 2.8679311 0 -8.6825676 2.3107648 0 -9.8010139 2.4854898;
	setAttr ".pt[996:1161]" 0 -8.739872 2.6732402 0 -8.4586391 1.3415971 0 -9.532547 
		1.7530918 0 -8.5616302 1.8826938 0 -10.183764 1.0695772 0 -11.065384 1.1754208 0 
		-10.61327 1.8870749 0 -10.41456 1.5445251 0 -11.642307 1.6744618 0 -10.772719 2.184206 
		0 -1.343207 1.5761374 0 -9.5122795 -3.0656645 0 -7.3746881 -2.9941747 0 -8.4707165 
		-3.065136 0 -11.461475 -2.5504131 0 -10.481861 -2.9362483 0 -5.3041396 -2.7722592 
		0 -6.2604785 -2.8843398 0 -3.3861544 -0.66777062 0 -3.1531692 2.6629753 0 -2.9056735 
		3.2139301 0 -3.3363595 2.8541775 0 -2.2701783 2.7428689 0 -2.4588194 1.9395537 0 
		-2.8775671 2.3945448 0 -12.749407 -0.46444798 0 -12.312993 -1.7620726 0 -10.920917 
		-1.3939285 0 -11.833271 -0.41039944 0 -11.638755 -1.443913 0 -2.0342116 0.47314012 
		0 -3.3475609 1.1890477 0 -2.2750566 1.316211 0 -12.043817 0.75237846 0 -12.423423 
		0.85296154 0 -10.892803 0.5106864 0 -11.506002 0.61750364 0 -9.4029341 -1.3655834 
		0 -10.214085 -0.3492198 0 -10.179928 -1.4113345 0 -7.4008975 -1.223805 0 -8.4993 
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
		0 2.3219571 -8.0555115 0 2.2545857 -7.1014991 0 2.1775603 -6.0229325 0 2.0926385 
		-4.8517752 0 2.0057631 -3.6624382 0 1.9154723 -2.4137123 0 4.0582333 -8.8025846 0 
		3.0217254 3.5629435 0 1.8271269 -1.1849618 0 1.7440238 -0.013385534 0 1.6660687 1.0708497 
		0 4.0193133 -8.3353605 0 3.9601989 -7.6300406 0 3.8895159 -6.7846642 0 3.8082361 
		-5.8075829 0 3.7154851 -4.7047143 0 3.618057 -3.5607097 0 3.515506 -2.341805 0 3.4106729 
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
		-2.6951032 0 -4.6809564 -2.766139 0 -1.092921 1.0825412 0 -2.9168723 -1.1238449 0 
		-0.89917988 0.57040113 0 -4.0116577 -2.3105986;
	setAttr ".pt[1162:1327]" 0 -3.7334659 -1.9682572 0 -4.1557631 -2.5214124 0 -3.3778527 
		-1.575279 0 0.96553791 0.28852853 0 3.2572527 0.75149381 0 1.7002478 0.57524967 0 
		1.0359874 -0.77420354 0 3.3564155 -0.44149435 0 1.7808338 -0.56329399 0 1.1044204 
		-1.8523581 0 3.4591813 -1.6676677 0 1.8656983 -1.7458131 0 1.1852013 -3.0389345 0 
		3.5637534 -2.9133015 0 1.9560978 -2.9958498 0 1.268721 -4.218051 0 2.0452418 -4.2198052 
		0 3.6639042 -4.0976491 0 2.1312604 -5.3959575 0 3.7595038 -5.2205348 0 1.3502049 
		-5.3560939 0 1.4279935 -6.467483 0 2.2133775 -6.5343328 0 3.8475323 -6.2734318 0 
		1.4981837 -7.4757133 0 2.2862349 -7.5621214 0 3.9237542 -7.1903024 0 2.3508592 -8.4744959 
		0 3.9919686 -8.0017471 0 1.5596943 -8.3744726 0 1.6026931 -9.0351009 0 4.0418491 
		-8.6000853 0 2.3984728 -9.1464663 0 1.6273503 -9.3855495 0 4.0707355 -8.9277468 0 
		2.425034 -9.5069408 0 3.0942876 2.7004111 0 1.556222 2.5800781 0 0.81297457 2.4348536 
		0 3.0410609 3.3404593 0 3.0116482 3.6934328 0 0.9070425 1.3255873 0 3.1660423 1.8409756 
		0 1.6309782 1.6427597 0 2.46979 0.72436595 0 2.4330418 1.2275146 0 2.5145159 0.11922312 
		0 2.5578268 -0.45761168 0 2.6074941 -1.1088147 0 2.6523705 -1.6869259 0 2.7056804 
		-2.3689766 0 2.751931 -2.9539521 0 2.8051231 -3.6204734 0 2.9023936 -4.8075333 0 
		2.8504114 -4.1772504 0 2.9981871 -5.9646645 0 2.947135 -5.3466053 0 3.0860128 -7.0150337 
		0 3.0399117 -6.4638047 0 3.1645842 -7.9367628 0 3.1235685 -7.4594498 0 3.2337055 
		-8.7020531 0 3.2006645 -8.3411465 0 3.2614293 -8.9892321 0 3.2841187 -9.2077103 0 
		3.3011861 -9.3392143 0 2.3304043 2.6921482 0 2.3031588 3.0803013 0 2.3570118 2.3085213 
		0 2.2829242 3.4254117 0 2.3914955 1.8094708 0 2.2696137 3.709384 0 1.6376133 -9.4279356 
		0 4.0727229 -8.9696064 0 2.4297352 -9.5488005 0 3.3094754 -9.3794451 0 3.0093796 
		3.7301404 0 0.76772738 3.3078198 0 1.6187148 -9.2557621 0 1.5867643 -8.7420416 0 
		1.5346022 -7.9625425 0 1.46946 -7.0234857 0 1.3957875 -5.9674473 0 1.3149673 -4.8272777 
		0 1.2327121 -3.6828341 0 1.1490946 -2.4795384 0 1.0734762 -1.33368 0 1.0066693 -0.27126718 
		0 0.93202525 0.77060264 0 2.4149008 -9.3728437 0 2.378016 -8.8474321 0 2.3219571 
		-8.0555115 0 2.2545857 -7.1014991 0 2.1775603 -6.0229325 0 2.0926385 -4.8517752 0 
		2.0057631 -3.6624382 0 1.9154723 -2.4137123 0 4.0582333 -8.8025846 0 3.0217254 3.5629435 
		0 1.8271269 -1.1849618 0 1.7440238 -0.013385534 0 1.6660687 1.0708497 0 4.0193133 
		-8.3353605 0 3.9601989 -7.6300406 0 3.8895159 -6.7846642 0 3.8082361 -5.8075829 0 
		3.7154851 -4.7047143 0 3.618057 -3.5607097 0 3.515506 -2.341805 0 3.4106729 -1.0929186 
		0 3.3077266 0.14387274 0 3.2149541 1.2566715 0 3.1263783 2.3319862 0 1.5903989 2.1217763 
		0 0.85824269 1.8115616 0 0.79233134 2.8534923 0 3.0653477 3.0482388 0 1.5237494 3.0098305 
		0 1.4957929 3.4182925 0 0.96553791 0.28852853 0 3.2572527 0.75149381 0 1.7002478 
		0.57524967 0 1.0359874 -0.77420354 0 3.3564155 -0.44149435 0 1.7808338 -0.56329399 
		0 1.1044204 -1.8523581 0 3.4591813 -1.6676677 0 1.8656983 -1.7458131 0 1.1852013 
		-3.0389345 0 3.5637534 -2.9133015 0 1.9560978 -2.9958498 0 1.268721 -4.218051 0 2.0452418 
		-4.2198052 0 3.6639042 -4.0976491 0 2.1312604 -5.3959575 0 3.7595038 -5.2205348 0 
		1.3502049 -5.3560939 0 1.4279935 -6.467483 0 2.2133775 -6.5343328 0 3.8475323 -6.2734318 
		0 1.4981837 -7.4757133 0 2.2862349 -7.5621214 0 3.9237542 -7.1903024 0 2.3508592 
		-8.4744959 0 3.9919686 -8.0017471 0 1.5596943 -8.3744726 0 1.6026931 -9.0351009 0 
		4.0418491 -8.6000853 0 2.3984728 -9.1464663 0 1.6273503 -9.3855495 0 4.0707355 -8.9277468 
		0 2.425034 -9.5069408 0 3.0942876 2.7004111 0 1.556222 2.5800781 0 0.8148849 2.3961127 
		0 3.0410609 3.3404593 0 3.0116482 3.6934328 0 0.9070425 1.3255873 0 3.1660423 1.8409756 
		0 1.6309782 1.6427597 0 2.46979 0.72436595 0 2.4330418 1.2275146 0 2.5145159 0.11922312 
		0 2.5578268 -0.45761168 0 2.6074941 -1.1088147 0 2.6523705 -1.6869259;
	setAttr ".pt[1328:1493]" 0 2.7056804 -2.3689766 0 2.751931 -2.9539521 0 2.8051231 
		-3.6204734 0 2.9023936 -4.8075333 0 2.8504114 -4.1772504 0 2.9981871 -5.9646645 0 
		2.947135 -5.3466053 0 3.0860128 -7.0150337 0 3.0399117 -6.4638047 0 3.1645842 -7.9367628 
		0 3.1235685 -7.4594498 0 3.2337055 -8.7020531 0 3.2006645 -8.3411465 0 3.2614293 
		-8.9892321 0 3.2841187 -9.2077103 0 3.3011861 -9.3392143 0 2.3304043 2.6921482 0 
		2.3031588 3.0803013 0 2.3570118 2.3085213 0 2.2829242 3.4254117 0 2.3914955 1.8094708 
		0 2.2696137 3.709384 0 0.76772738 3.3078198 0 0.099804521 2.3846736 0 3.2609732 2.8781726 
		0 2.897212 2.65271 0 2.4732435 2.353441 0 1.9415859 2.0262842 0 1.4363924 1.6984371 
		0 3.414181 3.0178876 0 3.420526 3.0459247 0 0.92596024 1.3539505 0 3.2609732 2.8781726 
		0 2.897212 2.65271 0 2.4732435 2.353441 0 1.9415859 2.0262842 0 1.4363924 1.6984371 
		0 3.414181 3.0178876 0 0.92596024 1.3539505 0 -11.190547 0.44658566 0 -12.137928 
		0.20361328 0 -1.2407914 1.7502874 0 0.098662853 2.3870401 0 -2.7321999 1.4633621 
		0 -3.5617895 1.345066 0 -4.4454794 1.2807734 0 -5.434864 1.2332203 0 -6.426856 1.1741331 
		0 -7.4432316 1.0471983 0 -8.4535027 0.91893005 0 -9.4187622 0.78799963 0 -10.223222 
		0.66472721 0 -12.683786 -0.41606474 0 -12.616435 -1.2042384 0 -11.433725 -1.7658615 
		0 -12.046742 -1.6606369 0 -11.014132 -1.9693894 0 -10.171666 -2.0871272 0 -9.3864555 
		-2.1384473 0 -8.42805 -2.127651 0 -7.3108959 -2.0739472 0 -6.3233376 -1.9452231 0 
		-3.3609686 -1.5641116 0 -5.2073846 -1.7779289 0 -4.2663612 -1.6172197 0 0.51288104 
		1.0543878 0 0.5128451 1.0556741 0 -10.257833 -2.5542741 0 -9.393774 -2.6709685 0 
		-8.4040213 -2.6852884 0 -7.3407564 -2.6431787 0 -6.2575235 -2.5603745 0 -11.934555 
		-0.92861986 0 -11.738611 -1.4262958 0 -11.363016 -1.8989978 0 -11.041055 -2.2082558 
		0 -4.4503384 -2.3070202 0 -5.262702 -2.446619 0 -12.063909 -0.41387224 0 -2.089092 
		4.9460063 0 -1.8266149 4.4397755 0 -1.4461637 3.9517035 0 -2.0297873 4.8217602 0 
		-1.8266149 4.4397755 0 -1.5176002 4.0433478 0 -2.029788 4.8217602 0 -0.8708843 3.5471992 
		0 0.036123991 3.2590554 0 -0.87297964 3.5441804 0 0.036123991 3.2590554 0 -5.2685242 
		-2.3969443 0 -4.464325 -2.2714446 0 -9.395155 -2.6729414 0 -10.260165 -2.5671682 
		0 -8.4085627 -2.6784108 0 -6.2616758 -2.5215473 0 -7.3445363 -2.6234536 0 3.7960021 
		2.2473795 0 3.6922579 1.9884442 0 3.833122 1.7641222 0 3.7299688 1.5230666 0 3.6989393 
		3.5040493 0 3.5962009 3.1348495 0 3.7033942 3.350806 0 3.7400932 2.8934593 0 3.6096046 
		3.0193331 0 3.6411591 2.5907087 0 3.7635448 2.6065788 0 3.66418 2.3121507 0 3.7197564 
		3.1433895 0 3.6934793 3.4605639 0 3.6004996 3.1077857 0 3.6223168 2.8274264 0 3.7033942 
		3.350806 0 3.7400932 2.8934593 0 3.6096046 3.0193331 0 3.6411591 2.5907087 0 3.7635448 
		2.6065788 0 3.66418 2.3121507 0 3.7197564 3.1433895 0 3.6934793 3.4605639 0 3.6004996 
		3.1077857 0 3.6223168 2.8274264 0 3.7960021 2.2473795 0 3.6922579 1.9884442 0 3.833122 
		1.7641222 0 3.7299688 1.5230666 0 3.8804398 1.1843308 0 3.9705892 0.077407241 0 3.8643155 
		-0.10257828 0 3.776186 0.96621704 0 3.9218102 0.67708957 0 3.8167734 0.47558498 0 
		4.017417 -0.50347328 0 3.9086866 -0.65309286 0 3.8804398 1.1843308 0 3.9705892 0.077407241 
		0 3.8643155 -0.10257828 0 3.776186 0.96621704 0 3.9218102 0.67708957 0 3.8167734 
		0.47558498 0 4.017417 -0.50347328 0 3.9086866 -0.65309286 0 4.0685577 -1.1297362 
		0 4.1676259 -2.3353121 0 4.2633696 -3.4985166 0 3.9564557 -1.2348366 0 4.0506878 
		-2.3710585 0 4.1427178 -3.4779563 0 4.1143327 -1.6862898 0 3.9998653 -1.7576643 0 
		4.2125936 -2.8826134 0 4.0939078 -2.8921328 0 4.0685577 -1.1297362 0 4.1676259 -2.3353121 
		0 4.2633696 -3.4985166 0 3.9564557 -1.2348366 0 4.0506878 -2.3710585 0 4.1427178 
		-3.4779563 0 4.1143327 -1.6862898 0 3.9998653 -1.7576643 0 4.2125936 -2.8826134 0 
		4.0939078 -2.8921328 0 4.3528337 -4.5715618 0 4.2279129 -4.4878187 0 4.3052063 -4.0019779;
	setAttr ".pt[1494:1659]" 0 4.1825633 -3.9513192 0 4.3528337 -4.5715618 0 4.2279129 
		-4.4878187 0 4.3052063 -4.0019779 0 4.1825633 -3.9513192 0 4.4377875 -5.5952992 0 
		4.3091865 -5.4570022 0 4.3928447 -5.0512757 0 4.2662201 -4.9426737 0 4.4720793 -6.013732 
		0 4.3418593 -5.8489909 0 4.4377875 -5.5952992 0 4.3091865 -5.4570022 0 4.3928447 
		-5.0512757 0 4.2662201 -4.9426737 0 4.4720793 -6.013732 0 4.3418593 -5.8489909 0 
		4.5090098 -6.4714723 0 4.566021 -7.2003546 0 4.4306335 -6.9512386 0 4.3769016 -6.2755871 
		0 4.5359678 -6.8169775 0 4.4022326 -6.5940108 0 4.5244489 -8.094945 0 4.6642194 -8.4111023 
		0 4.6154437 -7.8214631 0 4.6486835 -8.2416067 0 4.5094748 -7.933835 0 4.477634 -7.5347066 
		0 4.5915022 -7.5217361 0 4.4548082 -7.2523222 0 4.633903 -8.0556974 0 4.4954395 -7.7579241 
		0 4.6594844 -8.3575382 0 4.5199528 -8.0445776 0 4.6154437 -7.8214631 0 4.6486835 
		-8.2416067 0 4.5094748 -7.933835 0 4.477634 -7.5347066 0 4.5915022 -7.5217361 0 4.4548082 
		-7.2523222 0 4.633903 -8.0556974 0 4.4954395 -7.7579241 0 4.6594844 -8.3575382 0 
		4.5199528 -8.0445776 0 4.5090098 -6.4714723 0 4.566021 -7.2003546 0 4.4306335 -6.9512386 
		0 4.3769016 -6.2755871 0 4.5359678 -6.8169775 0 4.4022326 -6.5940108 0 0.18942118 
		1.3692458 0 0.24169327 0.40426314 0 0.34358475 -0.60069245 0 0.47373542 0.21010712 
		0 0.28448033 -0.071090698 0 0.51179343 -0.23577353 0 0.18769139 0.93042439 0 0.43170357 
		0.6193887 0 0.42615208 0.94061816 0 0.42615208 0.94061816 0 0.24169327 0.40426314 
		0 0.34358475 -0.60069245 0 0.47373542 0.21010712 0 0.18942118 1.3692458 0 0.28448033 
		-0.071090698 0 0.51179343 -0.23577353 0 0.18769139 0.93042439 0 0.43170357 0.6193887 
		0 0.41955972 -1.5263698 0 0.50590098 -2.5544741 0 0.56659651 -0.74593139 0 0.6396836 
		-1.6039206 0 0.72061253 -2.571635 0 0.38131893 -1.0467371 0 0.60290658 -1.1647586 
		0 0.45890951 -1.9865122 0 0.67585528 -2.0348792 0 0.54315567 -3.0771153 0 0.76179338 
		-3.0689325 0 0.41955972 -1.5263698 0 0.50590098 -2.5544741 0 0.56659651 -0.74593139 
		0 0.6396836 -1.6039206 0 0.72061253 -2.571635 0 0.38131893 -1.0467371 0 0.60290658 
		-1.1647586 0 0.45890951 -1.9865122 0 0.67585528 -2.0348792 0 0.54315567 -3.0771153 
		0 0.76179338 -3.0689325 0 0.58963573 -3.6821404 0 0.70249963 -4.7561369 0 0.80960691 
		-3.6459589 0 0.89432251 -4.6591091 0 0.97971082 -5.6913919 0 0.64257467 -4.1807704 
		0 0.84887254 -4.1164465 0 0.74173141 -5.2568598 0 0.93388724 -5.1358676 0 0.58963573 
		-3.6821404 0 0.70249963 -4.7561369 0 0.80960691 -3.6459589 0 0.89432251 -4.6591091 
		0 0.97971082 -5.6913919 0 0.64257467 -4.1807704 0 0.84887254 -4.1164465 0 0.74173141 
		-5.2568598 0 0.93388724 -5.1358676 0 0.78620052 -5.8410149 0 0.87827277 -6.8550506 
		0 1.0583932 -6.6443028 0 0.82956171 -6.3169322 0 1.0169046 -6.1394162 0 1.090776 
		-7.0492063 0 0.78620052 -5.8410149 0 0.87827277 -6.8550506 0 1.0583932 -6.6443028 
		0 0.82956171 -6.3169322 0 1.0169046 -6.1394162 0 1.090776 -7.0492063 0 0.9511447 
		-7.7622981 0 1.1269341 -7.5014153 0 0.91247988 -7.2854524 0 0.99075603 -8.1575613 
		0 1.1845412 -8.2182178 0 1.1568789 -7.874495 0 1.1845412 -8.2182178 0 1.1568789 -7.874495 
		0 0.9511447 -7.7622981 0 1.1269341 -7.5014153 0 0.91247988 -7.2854524 0 0.99075603 
		-8.1575613 0 1.0781317 -9.1906052 0 1.2373424 -8.8602657 0 1.0258403 -8.5212746 0 
		1.060101 -9.0108614 0 1.2218237 -8.6887102 0 1.0453248 -8.795351 0 1.2054157 -8.4823418 
		0 1.0723262 -9.1330929 0 1.2326622 -8.8068409 0 1.0258403 -8.5212746 0 1.060101 -9.0108614 
		0 1.2218237 -8.6887102 0 1.0453248 -8.795351 0 1.2054157 -8.4823418 0 1.0723262 -9.1330929 
		0 1.2326622 -8.8068409 0 -4.091814 1.9577736 0 -3.9702625 1.6580445 0 -4.0251932 
		1.1296772 0 -4.3247175 0.21706414 0 -4.6226263 -0.45720983 0 -4.8650246 -0.72276044 
		0 -5.2484388 -0.89782929 0 -5.6449518 -0.90449214 0 -6.0631037 -0.71533465 0 -6.3100915 
		-0.4497695 0 -6.4213209 -0.078902483 0 -6.3863029 0.36236644 0 -6.2300887 0.92546129 
		0 -6.0244956 1.5011802 0 -5.813416 1.9643084 0 -5.6237197 2.1710131 0 -5.3523769 
		2.2886808;
	setAttr ".pt[1660:1782]" 0 -5.0459571 2.3266623 0 -4.7789207 2.2956076 0 -4.4881229 
		2.2161276 0 -4.2650294 2.1179967 0 -0.69414485 3.4004881 0 -0.033641815 3.184567 
		0 0.94911695 3.2902687 0 1.2658788 3.386234 0 1.5874146 3.4798031 0 1.8038207 3.5361052 
		0 1.9092962 3.5523639 0 1.8038207 3.5361052 0 1.5874146 3.4798031 0 1.2658788 3.386234 
		0 0.94911695 3.2902687 0 -0.033641815 3.184567 0 -0.69414485 3.4004881 0 -1.1272687 
		3.7005129 0 -1.4085557 4.037127 0 -1.5694771 4.3097696 0 -1.6409256 4.4172878 0 -1.5694771 
		4.3097696 0 -1.4085557 4.037127 0 -1.1272687 3.7005129 0 0.46031833 3.1927941 0 0.46031833 
		3.1927941 0 -1.6898689 4.8172274 0 -1.5088551 4.5105429 0 -1.1924466 4.1318989 0 
		-1.7702383 4.93817 0 -1.6898689 4.8172274 0 -1.5088551 4.5105429 0 -1.1924466 4.1318989 
		0 -0.70524311 3.7944136 0 0.037729859 3.5515325 0 2.2232616 3.9652522 0 2.1046169 
		3.9469635 0 1.4995078 3.7783799 0 1.8611901 3.8836315 0 1.143195 3.6704321 0 0.59336555 
		3.5607867 0 -0.70524311 3.7944136 0 0.037729859 3.5515325 0 2.1046169 3.9469635 0 
		1.4995078 3.7783799 0 1.8611901 3.8836315 0 1.143195 3.6704321 0 0.59336555 3.5607867 
		0 -4.7002106 2.5413237 0 -5.3688359 2.514689 0 -3.9130013 2.1052873 0 -4.3614264 
		2.443526 0 -4.1091762 2.3151021 0 -5.0067878 2.574115 0 -3.7874107 1.7508074 0 -3.8711333 
		1.1676761 0 -5.6529665 2.3319192 0 -5.8424778 2.0843279 0 -6.079999 1.5855749 0 -6.3009596 
		0.945225 0 -6.4738436 0.34940839 0 -4.7888584 -0.85501933 0 -5.2179976 -1.0509799 
		0 -4.521553 -0.55837262 0 -6.5120916 -0.1334846 0 -6.393322 -0.54271007 0 -5.6613512 
		-1.0427749 0 -4.1962442 0.17897487 0 -6.1203661 -0.83425164 0 -10.98808 -0.81521606 
		0 -10.982639 0.05662632 0 -11.227854 0.073660374 0 -11.131712 -0.78356171 0 -10.762082 
		-1.605628 0 -1.151435 1.0119504 0 0.16596508 1.6344604 0 -0.60337865 1.8337644 0 
		-0.48669404 1.3413019 0 -0.39416474 0.9409948 0 -0.11273146 0.56958866 0 -0.064298332 
		0.64228219 0 0.12505895 2.0969794 0 -0.38136601 3.2753594 0 -0.3525815 3.6562467 
		0 -0.44879246 3.3622921 0 -0.62400103 2.8517749 0 -0.66095823 2.3504555 0 -0.34391487 
		3.257031 0 -0.31034184 3.6363533 0 -0.38809073 3.3632376 0 -0.53732455 2.8410928 
		0 -0.59627277 2.3516023 0 -0.46751642 1.345521 0 -0.017638743 0.67499417 0 -0.069183171 
		0.59957236 0 -0.34700394 0.97560263 0 0.16735101 1.6287265 0 0.12739778 2.066817 
		0 -0.55432409 1.8846388 0 -3.8762341 -1.1066796 0 -2.365262 -0.63896668 0 -2.8182404 
		-0.15282321 0 -1.9226304 2.6465137 0 -1.5347872 3.2235603 0 -1.1768707 3.7229924 
		0 -0.96676433 3.9387121 0 -0.92901659 3.5263271 0 -1.4524533 0.12598056 0 -1.7486246 
		0.84687161 0 -2.007432 1.5979441 0 -2.1378043 2.3074062 0 -7.5255313 0.33144093 0 
		-8.479413 0.24962902 0 -9.3901196 0.1575532 0 -10.205034 0.067587852 0 -7.5085502 
		-0.65262461 0 -8.4875679 -0.72710156 0 -9.3901234 -0.78133059 0 -10.193184 -0.82954693 
		0 -6.8698921 -0.59374022 0 -6.9554415 -0.12634873 0 -6.9292994 0.35459828 0 -6.8046141 
		0.94955635;
	setAttr -s 1783 ".vt";
	setAttr ".vt[0:165]"  0.94856524 -2.68947625 -2.046406269 0.30660462 -2.56566882 -2.025243759
		 1.59488571 -2.56534529 -2.02563715 1.8955456 -2.50189066 -1.77208281 1.57473099 -2.63779044 -1.79114461
		 0.94788665 -2.74836493 -1.80005538 0.32547668 -2.63760376 -1.7915014 0.00462936 -2.50255823 -1.77208018
		 1.85441804 -2.3514967 -2.49780989 1.55691326 -2.49538088 -2.54797864 0.94926751 -2.61422253 -2.5923779
		 0.34469283 -2.49581742 -2.54770184 0.046506543 -2.35112333 -2.49756837 0.64295876 -2.58097339 -2.5798738
		 0.62423337 -2.65431619 -2.040236235 0.6358344 -2.71803045 -1.79804921 1.25736654 -2.58089805 -2.57987022
		 1.27610826 -2.65466571 -2.040318727 1.26568162 -2.71805406 -1.79847443 1.91807306 -2.41525364 -1.99171352
		 -0.017904524 -2.41505122 -1.99209511 -0.0044548605 -2.36369586 -2.23584461 0.31242374 -2.517694 -2.27598524
		 0.62909776 -2.60875249 -2.29804945 0.94777358 -2.6448071 -2.30663991 1.2732619 -2.60841918 -2.29840803
		 1.58557069 -2.51882267 -2.27570558 1.90568447 -2.36357999 -2.23602676 0.13005176 -2.36987257 -2.77298069
		 0.39361483 -2.49428368 -2.84731841 0.6646384 -2.56973219 -2.89363408 0.94900453 -2.59727573 -2.90987349
		 1.23655283 -2.56946373 -2.89369607 1.50655699 -2.49429584 -2.84740639 1.77130771 -2.3699801 -2.77350998
		 1.53610528 -2.72648549 -1.5627892 1.24320889 -2.79730296 -1.55826235 0.948816 -2.82162952 -1.55647314
		 0.65698987 -2.79692507 -1.55826807 0.36474213 -2.72679734 -1.56229126 0.064772837 -2.61181307 -1.55854774
		 1.83519518 -2.6111176 -1.55849862 1.74468386 -2.72236562 -1.35336363 1.48474896 -2.82700229 -1.3319515
		 1.21208632 -2.89216685 -1.31143749 0.94894153 -2.91259074 -1.30442023 0.68832815 -2.8920567 -1.31108797
		 0.41560555 -2.82697105 -1.33180737 0.15609033 -2.72306299 -1.35233819 0.68208849 -2.55298638 -3.24851966
		 0.45547402 -2.4910934 -3.18265986 2.10975957 -2.4184804 -1.52646804 2.1897223 -2.28513527 -1.71615446
		 2.1366334 -2.13521981 -2.43225336 2.024733782 -2.18614268 -2.66905713 1.44457531 -2.49116945 -3.18265104
		 1.21790671 -2.55298638 -3.2485199 1.64942038 -2.3927784 -3.071840763 0.95009756 -2.57565308 -3.2696228
		 -0.32254881 -2.18730855 -1.92172205 -0.29018098 -2.28489995 -1.71576381 -0.30638513 -2.13253093 -2.16947865
		 2.2225368 -2.18727255 -1.92171955 2.20648074 -2.13262343 -2.16951323 -0.23565839 -2.13608885 -2.4317925
		 0.25173897 -2.39366937 -3.070705891 -0.12437698 -2.18567061 -2.66896987 0.038947914 -2.27807498 -2.88650584
		 1.86223865 -2.27737188 -2.88778853 -0.082209662 -2.56723499 -1.36199188 0.093455285 -2.71906137 -1.2273649
		 0.25933915 -2.82640266 -1.14620054 0.95001912 -3.0052585602 -1.022349119 1.17225063 -2.98719335 -1.033363938
		 0.72754568 -2.98715949 -1.032901764 1.43042886 -2.92167664 -1.080307364 0.46958402 -2.92161942 -1.080256224
		 -0.21021821 -2.4182713 -1.52601624 1.98492646 -2.56485558 -1.36300075 1.64017272 -2.82677794 -1.14786208
		 1.80799723 -2.71845269 -1.2263726 0.22390983 -2.78800273 -1.078587651 0.030077506 -2.65130377 -1.17791903
		 0.44664294 -2.89410353 -1.0060787201 0.69227678 -2.96125627 -0.96163607 0.94999957 -2.9858973 -0.94839883
		 -0.12724121 -2.50050449 -1.30746686 0.43670014 -2.42944074 -3.23613834 0.6993559 -2.50020647 -3.31748319
		 0.21069151 -2.31624532 -3.09847188 0.94999957 -2.52240014 -3.33695889 0.0086386623 -2.2020483 -2.91480088
		 -0.15237941 -2.10143256 -2.68836594 1.4533757 -2.89410162 -1.006067276 1.20772457 -2.96125603 -0.96163476
		 1.6761061 -2.78810644 -1.078645349 1.86994874 -2.65141129 -1.17800725 2.027474642 -2.49927616 -1.30677354
		 2.14511204 -2.35433722 -1.47308052 2.22241664 -2.21311808 -1.67046487 2.16388679 -2.0496099 -2.43944192
		 2.23190641 -2.043451786 -2.17327833 2.052406311 -2.10149884 -2.68836522 1.89141715 -2.20202804 -2.91486001
		 2.2529192 -2.10355091 -1.89569461 1.46333504 -2.42949915 -3.23612785 1.68936574 -2.31622839 -3.098541021
		 1.20064259 -2.50020719 -3.31748271 -0.2451285 -2.35436487 -1.47309721 -0.32242855 -2.21314502 -1.67047715
		 -0.26387563 -2.049565554 -2.4394424 -0.33190277 -2.043432713 -2.17327595 -0.35292029 -2.10355163 -1.89569426
		 1.47712648 -2.71163964 -0.90743393 1.7066319 -2.57139516 -0.97178841 1.89754558 -2.40516782 -1.062751889
		 2.047161102 -2.20936537 -1.17144561 2.15408993 -2.014706373 -1.3148272 2.23294711 -1.78697908 -1.5360328
		 2.25639749 -1.61091244 -1.76323628 2.23108578 -1.47454727 -2.0090489388 2.15415072 -1.3821348 -2.25669098
		 2.019331932 -1.32767832 -2.50342369 1.84239161 -1.30631053 -2.71596098 1.62846267 -1.31331098 -2.89293361
		 1.38217378 -1.32367229 -3.033307791 1.123734 -1.33873212 -3.11422229 0.94999957 -1.33969557 -3.1278441
		 1.2192229 -2.78961253 -0.8613925 0.94999957 -2.81764531 -0.84674358 0.42287213 -2.71163917 -0.90743393
		 0.19336666 -2.5713954 -0.97178876 0.0024538373 -2.40516782 -1.062752008 -0.14716187 -2.20936513 -1.17144597
		 -0.25409067 -2.014706373 -1.3148272 -0.33294806 -1.78697908 -1.5360328 -0.35639861 -1.61091244 -1.76323628
		 -0.33108678 -1.47454715 -2.0090491772 -0.25415164 -1.38213503 -2.25669122 -0.11933296 -1.32767844 -2.50342321
		 0.057607949 -1.30631077 -2.71596122 0.27153599 -1.31331134 -2.89293337 0.51782471 -1.32367241 -3.033307552
		 0.77626443 -1.33873224 -3.11422205 0.68077642 -2.78961277 -0.8613925 1.42957377 -1.95824683 -3.20939589
		 1.16830564 -2.0027596951 -3.28987074 1.65902436 -1.88771951 -3.070267439 1.86105359 -1.81426823 -2.89087486
		 2.034217834 -1.76377416 -2.65977621 2.15420485 -1.75161719 -2.41185713 2.22575998 -1.78584218 -2.15409636
		 0.94999963 -2.014184713 -3.30739141 0.73169345 -2.0027596951 -3.28987122 0.47042468 -1.95824671 -3.20939589
		 0.24097478 -1.88771927 -3.070267677 0.038945019 -1.81426823 -2.89087462 -0.13421854 -1.76377404 -2.65977645
		 -0.25420552 -1.75161731 -2.41185713 -0.32576081 -1.78584218 -2.1540966 2.1340003 -2.3894875 -1.49845195
		 2.21340752 -2.25169063 -1.69294035 2.24546051 -2.14797139 -1.90865731 2.22711682 -2.090526104 -2.17134786
		 2.15753865 -2.094698668 -2.43757582 2.04497385 -2.14642978 -2.68147087;
	setAttr ".vt[166:331]" 1.88190496 -2.24241471 -2.90525293 1.67217875 -2.35816884 -3.090538263
		 1.45652258 -2.46380806 -3.21389008 1.21239305 -2.52997923 -3.28702545 0.95005548 -2.55261087 -3.30757761
		 0.68760353 -2.52997899 -3.28702593 0.44352099 -2.4637394 -3.21389961 0.22850788 -2.35868478 -3.089860439
		 0.018796399 -2.24282479 -2.90449524 -0.14475849 -2.14613152 -2.68142104 -0.25697735 -2.095175266 -2.43731284
		 -0.32706049 -2.090465069 -2.17132711 -0.34546787 -2.14799213 -1.9086585 -0.31367451 -2.25156832 -1.6927228
		 -0.23426922 -2.38938022 -1.49820161 -0.10971332 -2.53823924 -1.332232 0.059265878 -2.69076777 -1.19880402
		 0.23862083 -2.81175208 -1.10908532 0.45591688 -2.91244674 -1.039772391 0.71044672 -2.97918868 -0.99333149
		 0.95001078 -3.00028371811 -0.9815256 1.18943763 -2.97920775 -0.99359453 1.44409871 -2.91247869 -1.039796591
		 1.66110778 -2.81201172 -1.11005867 1.84157431 -2.69046736 -1.1982764 2.011365414 -2.53634477 -1.33250451
		 0.95005506 0.37676346 -0.4576056 1.95531893 0.36368525 -0.44174275 0.58002973 -2.62432885 0.11980456
		 0.099992335 -2.32855368 0.068957493 1.19210541 -2.65023065 0.12382901 1.93735445 -2.50734711 0.10706151
		 -0.17010444 -1.89595044 -0.011533201 1.70109105 1.59302866 -0.61691284 0.950055 1.58993113 -0.62347573
		 0.950055 0.90554821 -0.54356003 1.86421931 0.89967549 -0.53078902 0.19902074 1.59304059 -0.61691391
		 0.42534536 2.98892975 -0.72547078 0.58800709 3.074878216 -0.71922994 0.79844022 3.1281352 -0.71498287
		 0.95017523 3.14194965 -0.71392071 1.10237586 3.12710094 -0.71510684 1.31416082 3.07740736 -0.71906066
		 1.47990656 2.98730612 -0.72569811 1.64772928 2.84949398 -0.73288238 1.78687274 2.67886925 -0.73822689
		 1.95960712 2.42512941 -0.74056661 2.12754273 2.10083675 -0.73111987 2.33786845 1.60742056 -0.69184446
		 2.60617805 0.8932339 -0.59631014 2.82609057 0.26768947 -0.48756871 3.048547268 -0.38137317 -0.36888903
		 3.12802052 -0.65728891 -0.31765246 3.17572737 -0.92595416 -0.26717341 3.18448329 -1.14863753 -0.22475864
		 3.16891074 -1.3714664 -0.18192124 3.12947917 -1.59222698 -0.13920881 3.066605091 -1.80842578 -0.097318314
		 2.93025661 -2.1152761 -0.038235001 2.75376225 -2.40215158 0.016033575 2.57524061 -2.61438751 0.054819927
		 2.37113547 -2.80305529 0.087506652 2.15063477 -2.96193957 0.11298066 1.91843033 -3.090933323 0.13162798
		 1.67789984 -3.19032335 0.14347959 1.34119344 -3.27495956 0.15156466 0.95084125 -3.31390524 0.15421268
		 0.68737566 -3.29803514 0.15334246 0.32587856 -3.22074747 0.14647338 -0.017674267 -3.091262341 0.13125214
		 -0.25050706 -2.96204185 0.11290962 -0.47100443 -2.80312085 0.087377489 -0.67559153 -2.61398053 0.054560333
		 -0.91556448 -2.30883431 -0.001642704 -1.10037279 -1.97505498 -0.06528312 -1.19384909 -1.7166959 -0.1152576
		 -1.25801325 -1.42258763 -0.17210951 -1.28445148 -1.11935151 -0.23041965 -1.26372337 -0.8433457 -0.28280461
		 -1.19244218 -0.51315457 -0.3446793 -0.95188659 0.19333863 -0.47441003 -0.44099921 1.59824502 -0.69019842
		 -0.24856144 2.054543972 -0.72853088 -0.072268426 2.39281464 -0.73896706 0.11207587 2.68049479 -0.73861063
		 0.25165761 2.84969854 -0.73279691 -0.6755895 -2.59544086 0.14769238 -0.47100145 -2.78458714 0.18047941
		 -0.25050336 -2.94351721 0.20596573 -0.017672658 -3.072780132 0.22408688 0.3258794 -3.20227814 0.23924235
		 0.68737555 -3.2795825 0.24602565 0.95084137 -3.29547024 0.24680558 1.34119368 -3.25650692 0.24424833
		 1.67789972 -3.1718626 0.23620278 1.91842532 -3.072399616 0.22473094 2.57523775 -2.59582615 0.14806375
		 2.15063024 -2.94339609 0.20613593 2.37113166 -2.78450227 0.18070865 -1.10037208 -1.95650709 0.027885914
		 -0.9155634 -2.29028893 0.091515899 2.75376058 -2.38359141 0.10926911 3.066604614 -1.78985775 -0.0040478706
		 2.93025565 -2.096708536 0.05503431 -1.25801301 -1.40403581 -0.078920677 -1.28445148 -1.10079467 -0.1372028
		 3.12947893 -1.57366145 -0.045951329 3.1689105 -1.35290432 -0.088679984 3.18448329 -1.13007283 -0.13150181
		 3.17572784 -0.90738273 -0.17387955 -1.19244337 -0.4945758 -0.25134283 3.12802148 -0.63870227 -0.22427723
		 3.048548698 -0.36277503 -0.27545065 2.33788633 1.62605989 -0.59799075 0.11191303 2.69911623 -0.64391023
		 0.25149202 2.86850977 -0.63745451 -0.072330177 2.41147184 -0.64470071 0.79837763 3.14750004 -0.61766088
		 0.5876838 3.094049454 -0.62227523 0.42479187 3.0077037811 -0.62924963 1.10243905 3.14646578 -0.6177851
		 0.95018148 3.1613431 -0.61651403 1.31462228 3.096529484 -0.62207687 1.95969152 2.4437623 -0.64623868
		 2.12759447 2.11944771 -0.63706863 1.78709054 2.69743538 -0.6434406 1.64792299 2.86827564 -0.63752627
		 1.47972035 3.006570816 -0.62959951 -0.24859709 2.073184967 -0.63450426 -0.44101816 1.61688912 -0.59630775
		 -0.9518885 0.21193731 -0.38096374 -1.26372361 -0.82477725 -0.18952522 -1.19384861 -1.6981504 -0.022101715
		 2.82609296 0.28629494 -0.39408207 2.60618424 0.91185153 -0.50270879 1.020712256 -0.99559432 0.17113611
		 1.49017167 -1.61592174 0.29070458 1.2619226 -1.46823239 0.2622374 1.036844492 -0.72765273 0.11949015
		 1.33309019 -0.28621495 0.034402713 1.57747197 -0.1659627 0.011224061 2.11492801 -0.19716316 0.017237961
		 2.34317732 -0.34485251 0.045705155 2.56825519 -1.085432172 0.18845239 2.58438778 -0.81749046 0.13680646
		 2.27200961 -1.52686977 0.27353978 2.027627945 -1.64712203 0.29671845 1.84900117 -0.13503534 0.0052627623
		 2.50621891 -0.56028986 0.087230861 2.45976758 -1.33179688 0.23593938 1.75609851 -1.67804956 0.30267978
		 1.098881006 -1.25279498 0.22071168 1.14533234 -0.4812879 0.072003186 1.12208295 -0.9916566 0.12943712
		 1.53067374 -1.53155422 0.23350275 1.33201861 -1.40301394 0.20872653 1.13612354 -0.75845551 0.084487453
		 1.39395881 -0.37425321 0.010432184 1.60665488 -0.26959246 -0.0097412318 2.074426174 -0.29674757 -0.0045070499
		 2.2730813 -0.42528796 0.020269185 2.46897626 -1.069846392 0.14450827 2.48301697 -0.83664513 0.099558592
		 2.21114087 -1.45404851 0.2185635 1.99844503 -1.55870938 0.2387369;
	setAttr ".vt[332:497]" 1.84297848 -0.24267519 -0.014929548 2.41498351 -0.61279243 0.056410819
		 2.37455463 -1.28426826 0.18583825 1.7621212 -1.58562672 0.24392527 1.19011652 -1.21550941 0.17258486
		 1.23054504 -0.54403359 0.043157503 2.58893299 -1.16222227 -0.1839446 2.60550117 -0.88704491 -0.23698521
		 2.52522159 -0.6228987 -0.28789955 2.35777688 -0.40164328 -0.33054674 2.12336373 -0.24996573 -0.35978267
		 1.85025573 -0.18616021 -0.37208125 1.57139373 -0.21792263 -0.36595899 1.3204124 -0.34142226 -0.34215438
		 1.12758422 -0.54176313 -0.3035385 1.016166806 -0.79478103 -0.25476915 0.9995988 -1.069958329 -0.20172854
		 1.079878569 -1.33410466 -0.15081418 1.24732304 -1.55536008 -0.10816704 1.48173594 -1.70703769 -0.078931101
		 1.75484395 -1.77084315 -0.066632524 2.033706188 -1.73908043 -0.0727548 2.28468728 -1.6155808 -0.096559428
		 2.47751546 -1.41524005 -0.1351752 1.15808189 -0.12269902 -0.36157757 1.49431348 0.04052484 -0.3897911
		 1.86583149 0.078666329 -0.39016014 2.22547793 -0.010417104 -0.36475325 2.53069496 -0.2130509 -0.31880665
		 2.74816322 -0.50371015 -0.25982964 2.85336208 -0.84936273 -0.19339681 2.83314586 -1.21017444 -0.1257222
		 2.68935275 -1.54382253 -0.06472151 2.43863106 -1.81152558 -0.018589482 2.10906959 -1.98083615 0.0072840303
		 1.73899221 -2.02907896 0.010301024 1.37384236 -1.94775724 -0.0094174445 0.83561051 -1.45032144 -0.10700033
		 1.059694767 -1.74630439 -0.049872734 0.72870457 -1.096715689 -0.17452179 0.75083065 -0.728701 -0.24549706
		 0.89981818 -0.39030272 -0.31075871 -0.71546704 0.88505185 -0.49778453 -0.71546072 0.86642241 -0.59144568
		 0.93949622 2.095654011 -0.65577531 0.94948941 2.69855833 -0.65367138 -0.25108677 -0.92720509 -0.20074639
		 -0.0071136951 0.46696413 -0.467094 0.95014679 1.84485972 -0.70384467 1.41794193 2.40279818 -0.70423472
		 1.36143208 2.55786991 -0.70420396 1.25529337 2.68426085 -0.70413375 1.11232662 2.7667284 -0.70403302
		 0.53830558 2.55754852 -0.7035892 0.78724825 2.76660252 -0.70379043 1.36161745 2.082636833 -0.70416927
		 1.11267483 1.87358248 -0.70396817 1.25557685 1.95616233 -0.70408082 0.48198116 2.23738718 -0.70352387
		 0.78759646 1.8734566 -0.70372546 0.64462972 1.95592391 -0.70362473 0.53849101 2.082315445 -0.70355463
		 1.41800666 2.23775148 -0.70422268 0.48191637 2.4024334 -0.7035358 0.94977629 2.79532528 -0.70391381
		 0.64434624 2.6840229 -0.70367765 0.48206031 2.23739529 -0.5973649 0.78767562 1.87346447 -0.59756649
		 0.64470887 1.95593154 -0.59746569 0.53857017 2.082323074 -0.59739566 0.95022601 1.84486783 -0.59768581
		 1.11275399 1.87359059 -0.5978092 1.255656 1.9561702 -0.59792185 1.41808581 2.23775959 -0.59806371
		 1.3616966 2.082644939 -0.59801036 0.53838474 2.55755615 -0.59743023 0.78732741 2.76661015 -0.59763128
		 0.94985545 2.79533291 -0.59775472 0.64442545 2.68403101 -0.59751868 0.48199555 2.4024415 -0.59737682
		 1.36151123 2.55787802 -0.59804499 1.25537264 2.68426895 -0.5979749 1.1124059 2.76673651 -0.59787405
		 1.41802108 2.40280628 -0.59807575 0.14904267 0.50237036 -0.11823139 -0.24298078 0.10914135 -0.4337323
		 -0.11618739 0.89565384 -0.54579663 -0.34255081 0.61923265 -0.50876558 -0.25395352 0.7771523 -0.53044879
		 -0.37129265 0.44094503 -0.4833627 -0.3367117 0.26379156 -0.45730379 0.25327289 -0.059735656 -0.4028917
		 -0.1014027 -0.0043540001 -0.4154909 0.070943594 -0.063003898 -0.40478021 0.42359138 0.0050573349 -0.41005334
		 0.64995492 0.28147888 -0.44708446 0.64411628 0.63691986 -0.49854621 0.55038446 0.7915709 -0.52211785
		 0.23646021 0.96371567 -0.55106986 0.40880752 0.90506518 -0.54035902 0.56135821 0.12356019 -0.42540136
		 0.67869675 0.45976746 -0.47248748 0.054132044 0.96044767 -0.55295837 0.26002598 0.81335545 -0.20116206
		 0.4396289 0.6693778 -0.17802154 0.48349711 0.44464433 -0.14496377 0.37110424 0.24431074 -0.11745694
		 0.1550402 0.16211534 -0.10837176 -0.063596308 0.23651826 -0.1219593 -0.18250269 0.43270576 -0.15186185
		 -0.14604157 0.65887892 -0.18408756 0.028726757 0.80920947 -0.2035577 -0.25503331 -0.88474858 0.11442652
		 -0.65554458 -1.26383984 -0.20764926 -0.50673825 -0.47993612 -0.31055132 -0.7407524 -0.75047106 -0.27785859
		 -0.6477651 -0.59480119 -0.29731381 -0.77448398 -0.92816716 -0.25453269 -0.74489111 -1.1064589 -0.23014909
		 -0.16426438 -1.44646597 -0.17555608 -0.51721829 -1.38132894 -0.18974665 -0.3465994 -1.44475389 -0.17860088
		 0.0077919364 -1.38625813 -0.18097955 0.24180591 -1.11572313 -0.2136723 0.2459451 -0.75973517 -0.26138178
		 0.15659773 -0.60235351 -0.28388175 -0.15234715 -0.42143989 -0.31293005 0.018272759 -0.48486549 -0.30178422
		 0.14881939 -1.27139211 -0.19421721 0.27553767 -0.93802595 -0.23699838 -0.33468086 -0.41972774 -0.31597489
		 -0.13512129 -0.57604539 0.035495892 0.0403561 -0.72508955 0.058206648 0.077896774 -0.95126677 0.089139089
		 -0.04006511 -1.14874661 0.11381954 -0.25833386 -1.22512543 0.12069967 -0.47477907 -1.14466512 0.10656026
		 -0.5881235 -0.94501334 0.07801722 -0.54533237 -0.71959054 0.0484263 -0.3664276 -0.5738734 0.031633258
		 -0.082396232 0.9012112 -0.2723352 -0.11875388 0.92430383 -0.34762228 0.051566124 0.98909765 -0.35478398
		 0.045348335 0.94980806 -0.27770665 -0.29586357 0.65630919 -0.23969448 -0.34511721 0.6478824 -0.31059161
		 -0.25651953 0.80580252 -0.33227429 -0.22941165 0.77475369 -0.25595707 -0.37385896 0.46959558 -0.28518856
		 -0.32653528 0.46605256 -0.21258645 -0.30059925 0.33317944 -0.19304147 -0.3392778 0.29244119 -0.25912997
		 -0.24554716 0.13779159 -0.2355583 -0.20057616 0.16814703 -0.16788775 -0.094386168 0.083019175 -0.1542061
		 -0.1039687 0.024295894 -0.21731736 0.068377115 -0.034353882 -0.20660642 0.089529902 0.020431785 -0.14277631
		 0.22628666 0.022883032 -0.14135991 0.25070703 -0.031085556 -0.20471804 0.40803859 0.092025697 -0.14900227
		 0.42102489 0.033707235 -0.2118797 0.51137036 0.1809094 -0.16051386 0.55879223 0.15221041 -0.2272274
		 0.60591447 0.34942961 -0.18365251 0.64738864 0.3101286 -0.24891078;
	setAttr ".vt[498:663]" 0.62747091 0.48315424 -0.20270546 0.67613053 0.48841783 -0.27431327
		 0.64155018 0.6655696 -0.30037233 0.59056854 0.67219955 -0.2305135 0.52026534 0.78819281 -0.24819249
		 0.54781801 0.82022119 -0.32394341 0.23991746 0.95329571 -0.27569139 0.23389368 0.9923659 -0.35289544
		 0.40624157 0.93371516 -0.34218484 0.36918327 0.90930659 -0.2676582 -0.47456986 -0.4781656 -0.036843523
		 -0.5098024 -0.45330468 -0.11210342 -0.33774436 -0.39309612 -0.11752681 -0.3455216 -0.43300793 -0.040911168
		 -0.69480926 -0.71749955 -0.0081257196 -0.74381638 -0.72383976 -0.079410888 -0.65082878 -0.5681693 -0.098865755
		 -0.62506485 -0.60074222 -0.022717396 -0.77754796 -0.90153521 -0.05608486 -0.73080575 -0.90712506 0.016765958
		 -0.70861053 -1.040851355 0.03505436 -0.74795467 -1.079827547 -0.031701535 -0.65860873 -1.23720801 -0.0092016617
		 -0.61326635 -1.20879805 0.059064515 -0.5095154 -1.29692066 0.07249216 -0.52028185 -1.35469747 0.0087007787
		 -0.34966347 -1.41812217 0.019846622 -0.32744247 -1.36460352 0.08438617 -0.1906825 -1.36588776 0.086669922
		 -0.16732797 -1.41983438 0.022891426 -0.0070756888 -1.30163789 0.0808824 0.0047278344 -1.35962677 0.017467869
		 0.098700926 -1.21548247 0.070953764 0.14575575 -1.24476016 0.0042305556 0.19792968 -1.049362898 0.050192636
		 0.2387419 -1.089091778 -0.0152248 0.22322892 -0.91608274 0.032697499 0.27247384 -0.911394 -0.038550477
		 0.24288127 -0.73310387 -0.062934056 0.19164927 -0.72582257 0.0066772611 0.12463519 -0.60778147 -0.010198087
		 0.15353371 -0.57572162 -0.085433699 -0.15094659 -0.43483484 -0.037661936 -0.1554113 -0.39480808 -0.11448204
		 0.015209166 -0.45823401 -0.1033363 -0.022976598 -0.48240575 -0.029302385 1.20183396 -0.163578 -0.26258248
		 0.96119672 -0.41304901 -0.21506824 0.82233411 -0.72843891 -0.15425026 0.80170649 -1.071435332 -0.088107318
		 0.9014281 -1.40093982 -0.025072327 1.11025167 -1.67678642 0.028154802 1.40292478 -1.86479831 0.065613061
		 1.74326873 -1.94132161 0.083395712 2.088709354 -1.89740765 0.079642631 2.39697576 -1.74036169 0.05444283
		 2.63195658 -1.49081612 0.010443714 2.76692319 -1.17898893 -0.047178552 2.78611851 -0.84139466 -0.11084599
		 2.68767715 -0.51785505 -0.17306451 2.48381567 -0.2460013 -0.2276787 2.19784045 -0.057103619 -0.26925546
		 1.861624 0.025240913 -0.29130441 1.5151031 -0.011097044 -0.28953731 2.16625428 -0.97240698 0.29759845
		 2.025664806 -1.18183291 0.33830673 1.78082848 -1.25355518 0.3522481 1.54630709 -1.15401423 0.33289933
		 1.43183577 -0.92978632 0.28931382 1.49097681 -0.68579018 0.24188578 1.69605756 -0.53619426 0.21280724
		 1.95111847 -0.5509963 0.21568444 2.13681364 -0.72327006 0.24917114 2.63595295 -1.17271864 -0.14724042
		 2.31364036 -1.65284359 -0.053913638 1.75233436 -1.81727266 -0.021951914 1.21467602 -1.58906734 -0.06631048
		 0.95224148 -1.075007439 -0.16623354 1.087826848 -0.51562774 -0.27496597 1.55799055 -0.1726675 -0.34163076
		 2.14273715 -0.20660233 -0.33503449 2.56845784 -0.60155332 -0.25826371 2.39911819 -1.056689978 0.15436387
		 2.1684351 -1.40032184 0.22115886 1.76670182 -1.51800573 0.24403417 1.38189352 -1.35467625 0.21228632
		 1.19406581 -0.98675674 0.14077023 1.29110599 -0.5864011 0.062948868 1.62760782 -0.34094018 0.015235826
		 2.046117783 -0.3652277 0.019956887 2.35081124 -0.64789915 0.074902907 2.13681364 -0.69102335 0.41506609
		 1.95111847 -0.51874959 0.38157943 1.69605756 -0.50394756 0.37870219 1.49097681 -0.65354341 0.40778074
		 1.43183577 -0.89753956 0.45520881 1.54630709 -1.12176752 0.49879429 1.78082848 -1.22130847 0.51814306
		 2.025664806 -1.1495862 0.50420165 2.16625428 -0.94016027 0.46349344 2.41817117 -0.71801448 0.77914131
		 2.47062421 -0.73872292 0.64075541 2.45684552 -0.96749425 0.68521917 2.40580058 -0.92893219 0.81990016
		 2.35695291 -0.51556587 0.73955011 2.40386152 -0.51912439 0.59806478 2.22834325 -0.34617817 0.706864
		 2.26461101 -0.33518177 0.56231487 2.048848629 -0.22973073 0.68398976 2.069668055 -0.20908517 0.53779912
		 1.83943725 -0.18111032 0.67477834 1.84254611 -0.15603942 0.52749312 1.62565398 -0.20517135 0.67921579
		 1.6106391 -0.18244624 0.53262115 1.43342626 -0.30004656 0.69789696 1.40191793 -0.28511679 0.55258334
		 1.28538525 -0.45337933 0.72746229 1.24155784 -0.45167196 0.58495343 1.20028675 -0.64733684 0.76540303
		 1.14890015 -0.66201878 0.62584603 1.1872586 -0.85821623 0.80615437 1.13512206 -0.89079005 0.67030954
		 1.24910831 -1.060479999 0.84571004 1.20188439 -1.11038864 0.71300054 1.37718916 -1.23025346 0.87847149
		 1.34113526 -1.29433107 0.74875009 1.55704618 -1.34616053 0.90124106 1.53607786 -1.42042792 0.77326572
		 1.76630497 -1.39541054 0.91057491 1.76319981 -1.47347355 0.7835716 1.98001266 -1.37070656 0.9060123
		 1.99510717 -1.44706678 0.77844357 2.17253494 -1.27640975 0.88744342 2.20382786 -1.344396 0.75848138
		 2.32009721 -1.12263286 0.85779142 2.36418819 -1.17784119 0.72611129 2.40308762 -0.77499497 0.49520805
		 2.39070272 -0.98062754 0.53517926 2.30741668 -1.16970062 0.571931 2.16327524 -1.31940937 0.60103142
		 1.97566462 -1.41169691 0.61897016 1.76721239 -1.43543196 0.62358379 1.56306159 -1.38775218 0.61431599
		 1.38783538 -1.2744081 0.59228432 1.26266861 -1.10907042 0.56014597 1.20265841 -0.91168123 0.52177715
		 1.21504319 -0.70604885 0.48180655 1.29832923 -0.51697564 0.44505414 1.44247055 -0.36726683 0.41595367
		 1.63008165 -0.27497935 0.39801481 1.83853364 -0.25124437 0.39340118 2.042684317 -0.29892409 0.40266922
		 2.21791077 -0.41226828 0.42470112 2.34307766 -0.57760584 0.45683977 1.83021355 -0.32081625 0.770217
		 1.67012727 -0.33883423 0.77353972 1.98702586 -0.35722461 0.77711475 2.19014359 -1.025851488 0.90726161
		 2.25432038 -0.88080376 0.87888765 2.079645157 -1.14100337 0.92946571 1.93547988 -1.21161485 0.94337058
		 1.77545023 -1.23011422 0.94678718 1.61875212 -1.19323421 0.9397977 1.4840709 -1.10644042 0.92274725
		 1.38816094 -0.97931004 0.89821476 1.34184623 -0.82784981 0.86859459;
	setAttr ".vt[664:829]" 1.35160196 -0.66993821 0.83807886 1.41532552 -0.5246982 0.80966806
		 1.52618253 -0.40987885 0.78752881 2.12143588 -0.44442344 0.79424351 2.21774197 -0.57126492 0.81871963
		 2.26358366 -0.72286338 0.84836638 1.82741845 -0.37749782 0.70376533 1.683604 -0.39368439 0.70675033
		 1.96829176 -0.41020548 0.70996195 2.15076375 -1.010870218 0.82688016 2.20841742 -0.88056582 0.80139023
		 2.051496744 -1.11431766 0.84682733 1.92198515 -1.1777519 0.85931885 1.77822149 -1.19437087 0.86238819
		 1.63745093 -1.1612395 0.85610914 1.51645923 -1.083267808 0.84079176 1.43029797 -0.96905953 0.81875283
		 1.38869083 -0.83299434 0.7921434 1.39745498 -0.69113356 0.76472944 1.45470142 -0.56065637 0.73920655
		 1.55429041 -0.45750773 0.71931738 2.089039803 -0.48854107 0.72534966 2.1755569 -0.60248983 0.74733794
		 2.21673894 -0.73867917 0.77397126 1.76070499 -0.42964053 0.71382016 1.53730869 -0.53954393 0.73518312
		 1.43814552 -0.7646904 0.778947 1.50961518 -0.99973148 0.82463443 1.71827555 -1.13468802 0.85086751
		 1.96649265 -1.10641325 0.84537143 2.13812327 -0.92813718 0.81071788 2.15285873 -0.68327636 0.76312166
		 2.0038046837 -0.48640481 0.72485405 -0.20273602 1.41536307 -2.59332705 -0.13309586 1.21024883 -2.72295809
		 -0.224105 2.52811837 -2.060422421 -0.21415341 3.077970505 -3.39415407 -0.21335137 3.294312 -3.23508954
		 0.07795608 1.93419993 -3.91340446 -0.26410115 1.85390913 -2.36685133 -0.23932755 1.62668014 -2.48256445
		 -0.25878632 2.29225159 -2.15512896 -0.26774323 2.062045097 -2.26468515 -0.18089783 2.67321968 -3.59387159
		 -0.02708447 2.1570704 -3.8373282 -0.12222588 2.43785048 -3.70926857 -0.7920267 2.12243724 -2.9324162
		 -0.84518558 2.34913301 -2.80515194 -0.57688844 1.30733705 -2.5984714 -0.65812421 1.3606261 -2.66075897
		 -0.43152988 1.12888443 -2.73481202 -0.51273775 1.17993701 -2.79990816 -0.6777643 1.51253569 -2.48005366
		 -0.74679554 1.54173565 -2.55536366 -0.67218059 1.96336961 -3.69130063 -0.59298694 1.99842525 -3.79166222
		 -0.5247975 1.75169122 -3.77592778 -0.44620121 1.78906286 -3.8719666 -0.81114876 1.78823173 -2.42592549
		 -0.7392782 1.75766146 -2.35051107 -0.79426706 2.21926355 -2.12052965 -0.86465758 2.22430229 -2.20877504
		 -0.84408969 2.025261879 -2.30392599 -0.77070892 1.99207771 -2.232131 -0.84538561 2.38926673 -3.48852134
		 -0.78223264 2.46098852 -3.57037973 -0.76010108 2.1566968 -3.60568428 -0.69606149 2.2266345 -3.68679547
		 -0.85852945 2.47033262 -2.1165452 -0.78465831 2.46383882 -2.029819727 -0.94852787 2.82413816 -3.25405717
		 -0.89230764 2.91681528 -3.32426882 -0.91103971 3.12445378 -3.15547752 -0.96383095 3.0082638264 -3.10563803
		 -0.88586181 2.71066165 -2.58503675 -0.87498426 2.54731679 -2.6874299 -0.86740738 3.050396681 -2.36594701
		 -0.88264316 3.11433315 -2.47369075 -0.13931954 3.082871914 -2.10340595 -0.13200295 3.19676566 -2.18007112
		 -0.78162897 3.041725397 -2.16975832 -0.77638042 2.93172383 -2.093559742 -0.79684246 3.17405963 -2.31167388
		 -0.8131336 3.24099278 -2.42561817 -0.83873451 3.28892136 -2.57556057 -0.85936153 3.30153322 -2.70691776
		 -0.90127671 3.15252566 -2.58287168 -0.92079157 3.16866469 -2.70672154 -0.15142548 3.46961641 -2.58868861
		 -0.1646415 3.48738694 -2.72000718 -0.85123962 2.85618377 -2.18687654 -0.85643256 2.95738244 -2.26181793
		 -0.13107979 3.35059166 -2.33768058 -0.13733494 3.42148447 -2.45125294 -0.20371367 1.20956373 -3.47320557
		 -0.26819104 1.27463341 -3.43244505 -0.049003586 1.14079666 -3.52331424 -0.11006439 1.0088583231 -3.17245913
		 -0.066621669 1.039977431 -3.30368423 -0.24493383 1.09202683 -3.17367315 -0.21208075 1.12320864 -3.29387784
		 -0.025295377 1.085035086 -2.89231777 0.055930972 1.050157428 -3.016917467 -0.18584907 0.99942237 -3.01796484
		 -0.26966465 1.026468277 -2.89807892 -0.23311819 1.33168972 -3.62391829 -0.27767301 1.42411411 -3.70007253
		 -0.090209849 1.2866118 -3.70393491 -0.14523685 1.38611901 -3.78641057 -0.37844971 1.1008296 -2.93930674
		 -0.30395263 1.079347849 -3.047355652 0.20234001 1.58057439 -3.8936913 0.15514457 1.70638442 -3.927737
		 -0.32343471 1.63822293 -3.89022923 -0.23741615 1.5227505 -3.86456871 -0.34863737 1.53182769 -3.76318932
		 -0.42649648 1.63497329 -3.78690338 0.28702533 1.32595968 -3.69994354 0.26697338 1.42636311 -3.78965116
		 0.26346281 1.19248521 -3.52866769 0.16147983 1.061524868 -3.17595434 0.22381675 1.093343258 -3.31203914
		 -0.15650952 2.92212439 -2.036615133 -0.17962277 2.76650596 -2.019623041 -0.77928865 2.63148069 -2.01027894
		 -0.77669609 2.77971268 -2.030998707 -0.19707119 3.42401719 -3.053839207 -0.18386471 3.4743495 -2.91447139
		 -0.89973247 3.22718167 -3.014775991 -0.88386047 3.28120041 -2.87725163 -0.93994707 3.15792179 -2.83887601
		 -0.95560956 3.11157227 -2.97034645 -0.85099173 2.73947382 -2.13307929 -0.85355771 2.60212374 -2.10765862
		 -0.52995712 1.55415249 -3.24967957 -0.43186373 1.4326998 -3.32515597 -0.34572443 1.3432312 -3.38297725
		 -0.88537967 2.8383038 -2.50115919 -0.87852359 2.94511962 -2.43091989 -0.63162965 1.71549881 -3.1563201
		 -0.72007418 1.90591764 -3.051121712 -0.20455138 1.15308869 -3.36925602 -0.053132012 1.083993316 -3.41779041
		 0.24832039 1.1365205 -3.42464447 -0.21705414 1.27748454 -3.56631589 -0.064926103 1.20731056 -3.61791563
		 0.27992469 1.25282872 -3.61859679 -0.89230824 3.053257227 -2.57115459 -0.90394795 2.9846077 -2.67357492
		 -0.90920937 2.88908887 -2.78304195 -0.90249753 2.74849319 -2.90385747 -0.8730377 2.54998207 -3.039142847
		 -0.80690992 2.27705431 -3.19420385 -0.72828227 2.047524691 -3.3164506 -0.63718867 1.85034978 -3.41501617
		 -0.52770978 1.67550325 -3.49585581 -0.43021449 1.54649353 -3.54264045 -0.34601656 1.44305909 -3.56256318
		 -0.27234435 1.35117209 -3.56125689 -0.85739881 2.83854914 -2.28532815 -0.86165226 2.71178937 -2.31564331
		 -0.86220473 2.56831741 -2.36830974 -0.85475779 2.37931824 -2.45650053 -0.82910109 2.17789102 -2.56120014
		 -0.78427345 1.9567399 -2.67969871 -0.71675879 1.7391336 -2.79887295;
	setAttr ".vt[830:995]" -0.62793273 1.5520606 -2.90932298 -0.5171681 1.39332271 -3.021046162
		 -0.41022345 1.2877543 -3.12500286 -0.325562 1.2243247 -3.21422553 -0.26208144 1.18742728 -3.30135226
		 -0.96651226 3.1830523 -2.97831368 -0.97563767 3.074169874 -3.12181211 -0.95899218 2.87650108 -3.28135681
		 -0.84918046 2.41472602 -3.53037763 -0.75909346 2.1691525 -3.65384912 -0.66412896 1.96010697 -3.74698544
		 -0.5087595 1.7371726 -3.83561301 -0.40147707 1.60904503 -3.84826159 -0.31815323 1.49843693 -3.82296205
		 -0.24018288 1.38057184 -3.75417638 -0.18683262 1.28204298 -3.67292142 -0.16506812 1.2094866 -3.59556079
		 -0.15267906 1.14980996 -3.50956273 -0.15378568 1.096731305 -3.41634011 -0.16426775 1.056532502 -3.3144803
		 -0.20529248 1.023651719 -3.1860702 -0.27000892 1.010754824 -3.048691034 -0.3499569 1.034231305 -2.93298268
		 -0.49565521 1.12109864 -2.78243899 -0.64900231 1.31135762 -2.63607955 -0.74432534 1.50592971 -2.52299643
		 -0.81178659 1.76572835 -2.38645172 -0.84631014 2.015359402 -2.25830078 -0.86844438 2.22944093 -2.15551925
		 -0.86146891 2.48873591 -2.058460236 -0.8561663 2.63301659 -2.047520638 -0.8534559 2.77949071 -2.073642731
		 -0.85363442 2.90778327 -2.13167548 -0.85912013 3.015819788 -2.21090722 -0.87131917 3.11970925 -2.32629514
		 -0.88754475 3.18758893 -2.44085264 -0.90822327 3.22930503 -2.56200647 -0.92897058 3.24580956 -2.6937449
		 -0.94996107 3.23306823 -2.83875084 2.40792561 0.72980487 -2.94139051 1.96967149 4.9283514 -5.94594193
		 2.015696764 6.18883133 -4.3186574 2.21939564 2.8808434 -4.60770798 0.94942081 4.97423697 -6.75957155
		 0.95004684 2.34519911 -5.2912941 2.16769242 4.67811775 -2.65072894 2.077095032 5.81347179 -5.40614462
		 2.91458941 1.45756185 -1.85935605 2.58219123 3.72686911 -3.67617369 0.94976926 1.26706159 -4.28529072
		 1.83488727 0.5967685 -3.24123144 2.33128071 1.76322365 -3.73602414 1.85059857 2.60278177 -5.0036692619
		 1.87249851 1.4699856 -4.083460331 2.07233572 4.00076770782 -5.45568752 1.67317474 4.97849274 -6.38622952
		 0.95057172 3.60210896 -6.22344065 1.74457574 3.79765892 -5.89307117 2.27269197 3.5221529 -1.69497716
		 2.75261569 2.59244251 -2.74294066 2.074873924 5.68526602 -3.63069439 2.37808418 4.84593344 -4.58647919
		 2.82705331 -0.52421832 -1.81477189 0.9496125 7.08581543 -4.46553183 1.8232851 -0.17373478 -2.92491698
		 1.40284514 0.55777764 -3.30547619 1.86027789 1.0017191172 -3.63109398 1.45115948 1.32442105 -4.23095131
		 0.95045865 0.85467327 -3.74932575 1.43125355 0.91358602 -3.72829986 2.37305498 1.23339367 -3.32343674
		 2.28029037 2.31512594 -4.166008 1.86893821 2.014166832 -4.53929567 1.46303701 2.43148994 -5.20673895
		 0.94967461 1.76915681 -4.78362465 1.46325064 1.84815705 -4.71469259 1.80124283 3.20358896 -5.47246647
		 1.41749513 3.67410326 -6.11755657 0.95001143 2.96183205 -5.78145838 1.44539285 3.047480106 -5.6872344
		 2.14648962 3.4544704 -5.0521698 2.0069563389 4.48663282 -5.77068615 1.69532108 4.37025738 -6.21125698
		 1.37313449 4.98359108 -6.62958527 0.95008355 4.25917339 -6.56394577 1.38779664 4.30525255 -6.44675207
		 0.95035487 5.82355642 -6.69875002 1.30469358 6.28359318 -3.22821546 1.29727948 5.17795944 -2.1887269
		 1.2977041 5.75901747 -2.70452285 1.33898139 6.98270035 -4.45075035 1.31339097 6.70041847 -3.77786779
		 2.024822712 6.046811104 -4.051782608 2.12181377 5.21381426 -3.15444446 1.30821109 4.040280819 -1.26330805
		 1.30098701 4.57329464 -1.68696749 2.2132535 4.11350155 -2.15472651 1.31884456 3.67539978 -0.98029661
		 2.76615071 1.79727423 -1.30391562 2.35110903 2.89770746 -1.30388463 2.62285733 3.086289406 -2.18933296
		 2.83181167 2.016793728 -2.28251243 2.68802309 2.47003889 -1.73832858 1.81937134 0.23649764 -3.0089473724
		 1.38362467 -0.1522916 -3.072689772 1.38837624 0.23493147 -3.1243403 2.23019171 -0.22331527 -2.65646482
		 2.39885521 0.22536036 -2.60969448 0.95002335 -0.73348916 -3.24496222 1.36326826 6.99192047 -5.2746768
		 2.061424494 6.088414192 -4.84409952 2.98931527 0.91397309 -1.53869224 1.64522362 5.68750381 -6.36857796
		 1.33468854 5.74853373 -6.59856701 2.30338669 5.29495335 -4.086436272 2.26261687 5.33455276 -4.98963737
		 2.20526528 5.72789907 -4.49787378 2.47641039 4.23148108 -3.13382268 2.48259711 4.29910898 -4.14206171
		 2.39037871 4.78895235 -3.62002659 2.67218709 3.16015768 -3.20877743 2.55469441 3.66545534 -2.65883875
		 2.6475718 -0.96563196 -2.048058987 1.8555932 -0.71348989 -2.99452662 2.2050848 -0.74436933 -2.72358608
		 1.40198624 -0.72197342 -3.17973995 0.94961166 0.53318799 -3.31996894 0.94999945 5.22121572 -2.15303612
		 0.9500019 4.075871468 -1.23192322 0.9500109 6.34953833 -3.19533825 0.9526037 6.64655161 -6.18661928
		 0.95001239 -0.15076089 -3.11981106 0.94977653 7.10786057 -5.29068089 0.94999814 5.81267214 -2.66873384
		 0.95018625 6.77916241 -3.75630569 0.94999933 4.60905409 -1.65227759 0.94983518 0.22950912 -3.1668489
		 -0.37617844 0.85804689 -2.61266637 -0.1829266 4.91804743 -5.81927538 -0.333206 2.99748611 -4.45676327
		 -0.18726417 5.7149992 -5.31502295 -0.66923344 1.38098717 -1.69403875 -0.43030849 3.83905649 -3.7064209
		 0.12878823 0.65383887 -3.12987638 0.048611999 2.59805727 -5.008998394 0.074338377 1.55574644 -4.07619524
		 -0.29845744 4.090771198 -5.30407429 0.17349607 5.0041131973 -6.41821098 0.12745672 3.76112223 -5.9348259
		 -0.36357775 4.84105253 -4.55621624 0.20046288 6.78732491 -4.4526844 0.21817362 6.42433834 -6.024317741
		 -0.74042672 -0.38858384 -1.9226023 0.10024244 -0.17910105 -2.88237762 0.50814933 0.59198499 -3.28180695
		 0.45716056 1.33760583 -4.21749258 0.48229128 0.95986974 -3.722049 -0.13169366 0.72018826 -2.92665982
		 -0.31772205 2.56033969 -4.10496998 -0.17246073 2.76826286 -4.75967312 0.058971286 2.016321182 -4.50423193
		 -0.16441275 2.26973701 -4.32293177 0.43021107 2.4225235 -5.21712589 0.43991947 1.83265269 -4.70058393
		 0.07224673 3.18590117 -5.49666595 0.47014561 3.65776205 -6.1432519;
	setAttr ".vt[996:1161]" 0.44412374 3.033315659 -5.70655584 -0.33052558 3.55852127 -4.90011835
		 -0.12398785 3.88972759 -5.6428194 -0.16440266 3.339468 -5.22216177 -0.24019676 4.55709362 -5.62667084
		 -0.040516078 4.94498158 -6.12040234 0.15716612 4.36309767 -6.25017262 -0.063990653 4.43501759 -5.97954273
		 0.48617351 4.98392296 -6.6583848 0.49720186 4.29425669 -6.4784627 -0.97061408 -0.11646522 -1.45967221
		 0.59268868 6.2889719 -3.22330737 0.6014992 5.18443155 -2.19025683 0.60015661 5.76792622 -2.70279026
		 0.55881411 7.005944252 -4.45553112 0.58223522 6.70905495 -3.77280664 0.59272289 4.038199425 -1.26594019
		 0.59946096 4.57240915 -1.68806946 -0.5729807 2.026962519 -1.35919189 0.12441838 0.2450968 -2.90807223
		 0.51943302 -0.15412837 -3.059801817 0.52446079 0.24109089 -3.095268488 -0.3357293 -0.23634529 -2.50652361
		 -0.53650218 0.25963283 -2.19918656 -0.21255559 0.24151111 -2.63605595 0.53257269 6.60692739 -6.14247942
		 0.54125738 7.037532806 -5.27546024 -0.13619089 6.15742254 -4.76349401 -0.033590853 6.12183523 -5.71143579
		 0.025586534 6.54133415 -5.097421169 -0.89572012 0.7805357 -1.25367582 -0.53210765 1.079256654 -2.26830435
		 -0.73370415 0.47942278 -1.79563379 0.19799693 5.64571905 -6.39809752 0.53194964 5.78523064 -6.63819218
		 -0.20777787 5.19105816 -5.70174456 -0.036222205 5.44424915 -6.061752796 -0.28580171 5.38425875 -4.018675327
		 -0.29519764 5.28165197 -4.93243217 -0.22243571 5.79563093 -4.38429642 -0.34319675 4.31235123 -3.088546276
		 -0.4075202 4.35218954 -4.14711046 -0.31597397 4.90230274 -3.57208967 -0.40539777 3.25298715 -4.20818996
		 -0.35978514 4.34832048 -5.077883244 -0.29261729 4.80949354 -5.42689276 -0.36158139 3.8608439 -2.75724053
		 -0.39781547 3.81374359 -4.6590867 -0.67240661 -0.91034204 -2.14085269 0.039452612 -0.71122622 -3.0027952194
		 -0.37130529 -0.76778543 -2.6099081 0.49404746 -0.71509856 -3.19851995 0.95090818 7.14270782 -4.87035084
		 1.35613513 7.02734375 -4.85455084 0.54754102 7.064757347 -4.86030436 0.24321079 6.893291 -4.83199596
		 0.93924612 6.94720554 -5.75949335 1.37172365 6.82185078 -5.71728516 0.21617559 6.7328763 -5.61756516
		 -0.005429633 6.35788059 -5.44756889 1.34116983 6.17783546 -6.41315031 0.96016157 6.2709775 -6.49544668
		 0.55178648 6.26012182 -6.44307137 0.22316433 6.15805101 -6.24629307 -0.045081317 5.85007286 -5.90782356
		 1.95661163 3.81852388 5.43723869 2.9261353 3.57763863 5.16440296 3.74169564 3.21397018 4.74857235
		 4.36431551 2.77701283 4.24647284 4.81660748 2.28583002 3.6816175 5.10700989 1.75615513 3.071122408
		 5.23113108 1.22506106 2.45777321 5.20204115 0.66522193 1.81431651 5.016229153 0.13010192 1.20357811
		 4.69403219 -0.36770105 0.63896823 4.22274303 -0.85131395 0.080711305 1.99102759 3.47897148 5.89387226
		 2.9859581 3.23470831 5.6127243 3.8256371 2.86677742 5.18873453 4.47257757 2.42345667 4.67804241
		 4.95156956 1.92268598 4.10024643 5.27062368 1.37956822 3.47220683 5.42364359 0.82833755 2.83410072
		 5.42125845 0.24912 2.16459227 1.94619751 2.37217569 6.43040895 1.9236263 -3.29233456 -0.27060902
		 5.25245333 -0.32108253 1.50604439 4.91578436 -0.86531913 0.87870467 4.41665459 -1.36845922 0.29760951
		 2.86587906 2.15802383 6.17733717 3.66012573 1.83492076 5.79511976 4.28314543 1.44757402 5.33709002
		 4.7695117 0.99967325 4.80790949 5.12355995 0.4946146 4.2100997 5.32251596 -0.028673649 3.58938336
		 5.37057734 -0.58685052 2.92865562 5.24758196 -1.15887713 2.25179577 4.9305706 -1.72579968 1.58192694
		 4.43301296 -2.2358129 0.97914135 3.6659627 -2.72918224 0.39719614 3.70771861 -1.87095046 -0.28294688
		 3.60173225 -1.37858868 -0.52889341 2.93167019 -1.82291174 -1.030580401 2.86870718 -3.056793213 0.0085545182
		 2.93429732 -2.26678991 -0.74304056 2.4713912 -2.45704269 -0.96124983 0.94999999 3.19898939 -0.65828466
		 2.89519691 0.22652793 -0.42508709 2.73904181 0.66652489 -0.50114274 2.58032322 1.13862991 -0.58977664
		 1.67952776 2.89184856 -0.68124199 2.32277107 1.78553092 -0.65894055 1.33193839 3.12483692 -0.66490531
		 2.00031638145 2.45712519 -0.68951595 2.14059854 2.19057798 -0.68363416 1.82652235 2.71402025 -0.68523729
		 1.50303125 3.036653996 -0.67291808 -1.26987839 0.23250341 -0.74524724 0.11966568 3.16112804 -0.85052943
		 -0.58610386 2.020358562 -0.8965137 -0.1452449 2.85086155 -0.88260436 0.3641727 3.33858776 -0.81717527
		 -0.995197 0.22652793 -0.42508709 -0.72854155 0.9778806 -0.55496204 -0.58258623 1.38411915 -0.6160233
		 0.22047222 2.89184856 -0.68124199 -0.42277104 1.78553092 -0.65894055 0.56806159 3.12483692 -0.66490531
		 -0.10031646 2.45712519 -0.68951595 -0.24059862 2.19057798 -0.68363416 0.073477626 2.71402025 -0.68523729
		 0.39696866 3.036653996 -0.67291808 1.63875937 2.85110044 -0.68564999 1.78048992 2.67962885 -0.68939936
		 1.95100212 2.42757607 -0.69352651 2.089111328 2.16527748 -0.68846214 2.27004361 1.76283538 -0.66313481
		 2.52674985 1.11789525 -0.59327465 2.6853652 0.64648867 -0.50651801 2.84228349 0.2062757 -0.43516609
		 -0.94228357 0.2062757 -0.43516609 -0.67486495 0.95784438 -0.56033731 -0.5290125 1.36338437 -0.61952132
		 -0.37004369 1.76283538 -0.66313481 -0.18911141 2.16527748 -0.68846214 -0.051002085 2.42757607 -0.69352651
		 0.11951011 2.67962885 -0.68939936 0.26124054 2.85110044 -0.68564999 0.4288035 2.98854494 -0.67742741
		 0.58895022 3.071122646 -0.67030048 0.94999999 3.14147758 -0.66419113 1.3110497 3.071122646 -0.67030048
		 1.47119641 2.98854494 -0.67742741 -0.96023339 -1.43432832 -1.37113309 2.88544559 -1.41052067 -1.34430325
		 -0.99200177 0.98369718 -0.82327855 2.83119607 1.14807546 -0.84035361 0.94999999 3.49320889 -0.77910531
		 0.57603085 3.43419886 -0.79619956 1.32396913 3.43419886 -0.79619956 0.58115542 3.67539978 -0.98029661
		 0.95001268 3.7235477 -0.95740855 3.1723454 0.0051899403 -1.087731123 2.48610377 2.020358562 -0.8965137
		 3.19439602 0.16438939 -0.7347905 1.78033423 3.16112804 -0.85052943;
	setAttr ".vt[1162:1327]" 2.045244932 2.85086155 -0.88260436 1.53582728 3.33858776 -0.81717527
		 2.27184606 2.47656584 -0.90128684 4.45687103 -0.62703323 0.3385047 4.68796062 -2.004373312 1.2528795
		 4.66848993 -1.13774872 0.56249905 4.86474371 -0.13089192 0.90509546 5.10824013 -1.45746064 1.89895499
		 5.097642899 -0.60876995 1.17206395 5.11929798 0.37396884 1.47838926 5.3258357 -0.89575684 2.56342459
		 5.35072184 -0.059942603 1.80575573 5.23511696 0.92686665 2.11206794 5.3677578 -0.32522595 3.23852754
		 5.44286776 0.519876 2.47597384 5.19116497 1.47466505 2.74338603 5.37159538 1.087281823 3.13252354
		 5.24782276 0.21687245 3.88077664 5.14492798 1.63234842 3.76360893 4.97875595 0.73051548 4.49001932
		 4.9938612 2.0029444695 3.35314941 4.62713289 2.51974487 3.94773841 4.75018311 2.16047764 4.37385511
		 4.56053305 1.21294987 5.060482025 4.097410202 2.98876476 4.48694849 4.19444132 2.63794327 4.92417812
		 4.013876915 1.63327396 5.55702829 3.43309236 3.0618186 5.41267776 3.28675628 2.0048894882 5.99685812
		 3.36061239 3.40738916 4.96708345 2.45933938 3.71620417 5.31889725 2.42291951 2.27911806 6.3209672
		 2.50919151 3.37399673 5.77246952 1.43720376 3.87909985 5.50645018 1.43228149 2.4285059 6.49924135
		 1.45558429 3.54095364 5.96598768 3.29618192 -2.89734936 0.19693831 3.35857558 -2.068150043 -0.51192808
		 3.24955511 -1.62391412 -0.81093955 2.41622639 -3.19076014 -0.14969927 1.42226791 -3.35254049 -0.34089237
		 3.93101621 -1.11631489 -0.20927238 4.061774731 -2.50350904 0.6625334 4.073417187 -1.63686895 -0.0058907121
		 4.739779 -1.59707797 0.87271202 4.48147583 -1.83027828 0.60276365 4.98750782 -1.3168695 1.19764638
		 5.17066813 -1.050107598 1.50771928 5.32005787 -0.7493397 1.85815442 5.40982866 -0.48272228 2.16964817
		 5.46778631 -0.16835189 2.53732848 5.47767591 0.10101056 2.85294151 5.44545031 0.40767515 3.21279836
		 5.2690649 0.95256984 3.85496354 5.38237429 0.66341949 3.5138309 4.93010473 1.48323858 4.48142576
		 5.1333971 1.19973528 4.14687014 4.4408679 1.96451032 5.050523281 4.72270966 1.71194637 4.75185823
		 3.79551911 2.38608932 5.55067348 4.1627326 2.16794062 5.29150915 2.96398544 2.73417377 5.9678793
		 3.4059248 2.57024097 5.77090549 2.49549508 2.86390162 6.12533092 1.98679447 2.96179581 6.24591446
		 1.45355594 3.019014359 6.32020044 3.35959101 -2.51127625 -0.18087187 2.91360974 -2.69173002 -0.38857114
		 3.72136092 -2.33276653 0.024245277 2.45403051 -2.85416794 -0.57124376 4.1129427 -2.10048318 0.29101238
		 1.95389414 -2.98949885 -0.71988499 0.94999999 3.89516115 5.53277445 0.94999999 2.44844198 6.52116489
		 0.94999999 3.55953264 5.98926783 0.94999999 3.034985065 6.34446049 0.94999999 -3.36976004 -0.36038041
		 2.6021843 -2.037773609 -1.27004623 -0.056611598 3.81852388 5.43723869 -1.026135445 3.57763863 5.16440296
		 -1.84169555 3.21397018 4.74857235 -2.46431541 2.77701283 4.24647284 -2.91660762 2.28583002 3.6816175
		 -3.20701003 1.75615513 3.071122408 -3.33113122 1.22506106 2.45777321 -3.30204129 0.66522193 1.81431651
		 -3.1162293 0.13010192 1.20357811 -2.7940321 -0.36770105 0.63896823 -2.32274318 -0.85131395 0.080711305
		 -0.091027677 3.47897148 5.89387226 -1.085958004 3.23470831 5.6127243 -1.92563701 2.86677742 5.18873453
		 -2.57257771 2.42345667 4.67804241 -3.0515697 1.92268598 4.10024643 -3.37062383 1.37956822 3.47220683
		 -3.52364373 0.82833755 2.83410072 -3.52125859 0.24912 2.16459227 -0.046197593 2.37217569 6.43040895
		 -0.023626328 -3.29233456 -0.27060902 -3.35245347 -0.32108253 1.50604439 -3.015784264 -0.86531913 0.87870467
		 -2.51665449 -1.36845922 0.29760951 -0.96587914 2.15802383 6.17733717 -1.76012564 1.83492076 5.79511976
		 -2.38314533 1.44757402 5.33709002 -2.86951184 0.99967325 4.80790949 -3.22356009 0.4946146 4.2100997
		 -3.42251611 -0.028673649 3.58938336 -3.47057748 -0.58685052 2.92865562 -3.3475821 -1.15887713 2.25179577
		 -3.030570507 -1.72579968 1.58192694 -2.53301311 -2.2358129 0.97914135 -1.7659626 -2.72918224 0.39719614
		 -1.83403325 -1.85608768 -0.26568872 -1.75920367 -1.33490217 -0.47665948 -1.031670332 -1.82291174 -1.030580401
		 -0.96870726 -3.056793213 0.0085545182 -1.034297228 -2.26678991 -0.74304056 -0.57139128 -2.45704269 -0.96124983
		 -2.55687094 -0.62703323 0.3385047 -2.78796077 -2.004373312 1.2528795 -2.76848984 -1.13774872 0.56249905
		 -2.96474361 -0.13089192 0.90509546 -3.20824027 -1.45746064 1.89895499 -3.19764304 -0.60876995 1.17206395
		 -3.21929812 0.37396884 1.47838926 -3.42583585 -0.89575684 2.56342459 -3.45072198 -0.059942603 1.80575573
		 -3.3351171 0.92686665 2.11206794 -3.46775794 -0.32522595 3.23852754 -3.5428679 0.519876 2.47597384
		 -3.29116511 1.47466505 2.74338603 -3.47159553 1.087281823 3.13252354 -3.3478229 0.21687245 3.88077664
		 -3.24492812 1.63234842 3.76360893 -3.078756094 0.73051548 4.49001932 -3.093861341 2.0029444695 3.35314941
		 -2.72713304 2.51974487 3.94773841 -2.85018301 2.16047764 4.37385511 -2.66053295 1.21294987 5.060482025
		 -2.19741011 2.98876476 4.48694849 -2.29444122 2.63794327 4.92417812 -2.11387682 1.63327396 5.55702829
		 -1.53309226 3.0618186 5.41267776 -1.38675618 2.0048894882 5.99685812 -1.4606123 3.40738916 4.96708345
		 -0.55933934 3.71620417 5.31889725 -0.5229196 2.27911806 6.3209672 -0.6091916 3.37399673 5.77246952
		 0.46279618 3.87909985 5.50645018 0.46771854 2.4285059 6.49924135 0.44441563 3.54095364 5.96598768
		 -1.39618182 -2.89734936 0.19693831 -1.45857549 -2.068150043 -0.51192808 -1.37897229 -1.60549879 -0.79061389
		 -0.51622635 -3.19076014 -0.14969927 0.47773209 -3.35254049 -0.34089237 -2.031016111 -1.11631489 -0.20927238
		 -2.16177487 -2.50350904 0.6625334 -2.17341733 -1.63686895 -0.0058907121 -2.83977914 -1.59707797 0.87271202
		 -2.58147573 -1.83027828 0.60276365 -3.087507963 -1.3168695 1.19764638 -3.27066827 -1.050107598 1.50771928
		 -3.42005801 -0.7493397 1.85815442 -3.50982881 -0.48272228 2.16964817;
	setAttr ".vt[1328:1493]" -3.56778646 -0.16835189 2.53732848 -3.57767606 0.10101056 2.85294151
		 -3.54545045 0.40767515 3.21279836 -3.36906505 0.95256984 3.85496354 -3.48237443 0.66341949 3.5138309
		 -3.030104876 1.48323858 4.48142576 -3.23339725 1.19973528 4.14687014 -2.54086781 1.96451032 5.050523281
		 -2.82270956 1.71194637 4.75185823 -1.89551902 2.38608932 5.55067348 -2.26273251 2.16794062 5.29150915
		 -1.063985348 2.73417377 5.9678793 -1.5059247 2.57024097 5.77090549 -0.59549516 2.86390162 6.12533092
		 -0.086794436 2.96179581 6.24591446 0.44644403 3.019014359 6.32020044 -1.45959091 -2.51127625 -0.18087187
		 -1.013609886 -2.69173002 -0.38857114 -1.82136083 -2.33276653 0.024245277 -0.5540306 -2.85416794 -0.57124376
		 -2.21294284 -2.10048318 0.29101238 -0.053894103 -2.98949885 -0.71988499 -0.70218438 -2.037773609 -1.27004623
		 -1.16374636 -1.24223912 -1.1424346 1.90030265 -3.069572926 0.19140029 2.34951282 -2.77496099 0.12225112
		 2.71055198 -2.41334224 0.059901133 2.97336888 -1.983935 -0.04234913 3.11945796 -1.56741476 -0.13102232
		 1.42548358 -3.21603441 0.1981467 0.94999999 -3.23322535 0.18730062 3.16740417 -1.1399554 -0.21399516
		 -0.00030267239 -3.069572926 0.19140029 -0.44951278 -2.77496099 0.12225112 -0.81055194 -2.41334224 0.059901133
		 -1.073368788 -1.983935 -0.04234913 -1.21945786 -1.56741476 -0.13102232 0.47451636 -3.21603441 0.1981467
		 -1.26740408 -1.1399554 -0.21399516 2.032157898 5.37198067 -5.81856632 1.70628583 5.96715736 -6.17077065
		 3.04723835 -0.25474805 -1.49553943 3.063090086 -1.2428515 -1.14418864 2.87727857 0.63441885 -2.097780943
		 2.79672456 1.10836184 -2.45342779 2.7100172 1.58235288 -2.86312628 2.62550759 2.10082197 -3.33404231
		 2.54172421 2.62636137 -3.80049443 2.46237946 3.19801664 -4.24521494 2.37497973 3.7672863 -4.68621635
		 2.28538108 4.31538105 -5.10338068 2.19791293 4.77924728 -5.44397449 1.35164046 6.5499258 -6.13386106
		 0.52832818 6.91033697 -5.70609856 0.012710288 6.59979343 -4.83393192 0.22593701 6.85368967 -5.19305277
		 0.011694074 6.49176121 -4.52237177 -0.074732862 6.12939692 -4.042269707 -0.108331 5.76245117 -3.62400389
		 -0.11017095 5.27785063 -3.15019965 -0.11008929 4.69242144 -2.61847425 -0.13780238 4.1342802 -2.18905711
		 -0.37965173 2.46254015 -0.89842856 -0.19187921 3.49265671 -1.71472776 -0.28056616 2.94179058 -1.32457089
		 3.14367557 -0.78363442 -0.27075335 -1.24248314 -0.78425956 -0.27141446 1.71546555 6.40605402 -3.85177994
		 1.72298622 6.032371521 -3.36140299 1.73195577 5.54465485 -2.85936642 1.74625874 4.99196768 -2.34878898
		 1.76521432 4.4089489 -1.8485744 1.79392111 6.4315877 -5.50296783 1.78550482 6.58245373 -5.15615797
		 1.79075193 6.63100719 -4.73200941 1.74088609 6.62465525 -4.41639948 1.84047961 3.37867928 -1.071659207
		 1.79605448 3.85466051 -1.40804148 1.77280664 6.23889065 -5.82501841 0.94999999 -1.42845714 -3.51754904
		 -0.036948144 -1.30658031 -3.13319516 -0.39258379 -1.25276995 -2.6989336 0.43711787 -1.39598656 -3.42577386
		 1.93694806 -1.30658031 -3.13319516 2.22580671 -1.26287377 -2.78047395 1.46288204 -1.3959862 -3.4257741
		 -0.6294778 -1.33815753 -2.20904183 -0.73439056 -1.64758968 -1.61146569 2.53117537 -1.33560038 -2.20858002
		 2.63439059 -1.64758968 -1.61146569 0.13881701 3.83273411 -1.43578982 0.086383998 3.36788464 -1.096440196
		 0.13112795 6.03404808 -3.36110663 0.14031598 6.41366673 -3.84649849 0.17713028 5.5434866 -2.86507583
		 0.16511494 4.39161158 -1.87006426 0.17521679 4.98399496 -2.36054134 -1.66248536 -3.021690845 0.7743113
		 -1.53538179 -2.8403511 0.8519069 -2.048956394 -2.79862213 1.034499884 -1.89917469 -2.62651777 1.10345113
		 0.94999999 -3.60149431 0.097445011 0.94999999 -3.36552525 0.23067561 0.017516077 -3.52710009 0.17629403
		 -0.89807314 -3.31677628 0.42331687 0.072719991 -3.31446886 0.29513565 -0.82891148 -3.1159339 0.52522516
		 -1.27761507 -3.18506193 0.57848299 -1.19600368 -2.98816538 0.67601466 -0.45459253 -3.43157291 0.28818336
		 0.48227197 -3.5770216 0.11645776 0.51866841 -3.35414267 0.2463569 -0.384386 -3.22487164 0.39744523
		 1.88248396 -3.52710009 0.17629403 2.79807305 -3.31677628 0.42331687 1.82728004 -3.31446886 0.29513565
		 2.7289114 -3.1159339 0.52522516 3.17761517 -3.18506193 0.57848299 3.096003771 -2.98816538 0.67601466
		 2.35459256 -3.43157291 0.28818336 1.41772795 -3.5770216 0.11645776 1.38133156 -3.35414267 0.2463569
		 2.28438592 -3.22487164 0.39744523 3.56248546 -3.021690845 0.7743113 3.43538189 -2.8403511 0.8519069
		 3.94895649 -2.79862213 1.034499884 3.79917479 -2.62651777 1.10345113 -2.4065268 -2.53238535 1.34805453
		 -2.88121033 -2.02399826 1.94659102 -2.68229508 -1.88086867 1.98344696 -2.22503686 -2.37120152 1.40498447
		 -2.64747024 -2.29944992 1.62236035 -2.4575901 -2.1461792 1.67059422 -3.044622421 -1.75697184 2.26044512
		 -2.83400869 -1.62779689 2.28088975 4.30652666 -2.53238535 1.34805453 4.78121042 -2.02399826 1.94659102
		 4.58229494 -1.88086867 1.98344696 4.12503672 -2.37120152 1.40498447 4.54747009 -2.29944992 1.62236035
		 4.3575902 -2.1461792 1.67059422 4.94462252 -1.75697184 2.26044512 4.73400879 -1.62779689 2.28088975
		 -3.17489839 -1.4694109 2.59914708 -3.27292275 -0.91615683 3.2514689 -3.19966674 -0.38242638 3.88094306
		 -2.95108867 -1.36080956 2.59564614 -3.04006052 -0.8398146 3.21087313 -2.96798682 -0.33238077 3.81033707
		 -3.23719049 -1.21402144 2.90031123 -3.007794857 -1.12110054 2.87876487 -3.25457311 -0.66499001 3.54760337
		 -3.021656275 -0.60088742 3.4930203 5.074898243 -1.4694109 2.59914708 5.17292261 -0.91615683 3.2514689
		 5.099666595 -0.38242638 3.88094306 4.85108852 -1.36080956 2.59564614 4.94006062 -0.8398146 3.21087313
		 4.86798668 -0.33238077 3.81033707 5.13719034 -1.21402144 2.90031123 4.90779495 -1.12110054 2.87876487
		 5.15457296 -0.66499001 3.54760337 4.92165613 -0.60088742 3.4930203 -2.9799633 0.10936403 4.46219778
		 -2.75696492 0.12995303 4.35786581 -3.11095548 -0.15161437 4.15359211;
	setAttr ".vt[1494:1659]" -2.88228321 -0.11562204 4.066941261 4.8799634 0.10936403 4.46219778
		 4.65696478 0.12995303 4.35786581 5.010955334 -0.15161437 4.15359211 4.78228331 -0.11562204 4.066941261
		 -2.61840296 0.57875574 5.016543388 -2.41534233 0.57390785 4.88309431 -2.82612038 0.32921541 4.7220602
		 -2.61155772 0.33822691 4.60444689 -2.40979075 0.77082622 5.24290562 -2.21818209 0.75356591 5.095425129
		 4.51840305 0.57875574 5.016543388 4.31534243 0.57390785 4.88309431 4.72612047 0.32921541 4.7220602
		 4.51155758 0.33822691 4.60444689 4.30979061 0.77082622 5.24290562 4.11818218 0.75356591 5.095425129
		 -2.14418364 0.98123109 5.49024105 -1.54923272 1.31716669 5.88318777 -1.40666509 1.26030242 5.69093609
		 -1.96777034 0.94934285 5.32624435 -1.88395309 1.14050496 5.67647266 -1.72309828 1.095889211 5.49812174
		 0.94999999 1.78524816 6.30969715 0.94999999 1.87344134 6.5376606 -0.81269079 1.60300958 6.21845341
		 0.020724952 1.7964617 6.44514513 0.067741811 1.71218002 6.22165489 -0.71258146 1.52853644 6.0061702728
		 -1.19926548 1.46511686 6.056619167 -1.076775789 1.39875686 5.85356522 -0.40713233 1.71089733 6.34480047
		 -0.33060485 1.63124239 6.1266818 0.50284326 1.8490268 6.50851107 0.52758658 1.76231253 6.28226519
		 2.71269083 1.60300958 6.21845341 1.87927508 1.7964617 6.44514513 1.83225822 1.71218002 6.22165489
		 2.61258149 1.52853644 6.0061702728 3.099265575 1.46511686 6.056619167 2.97677588 1.39875686 5.85356522
		 2.30713224 1.71089733 6.34480047 2.23060489 1.63124239 6.1266818 1.39715672 1.8490268 6.50851107
		 1.3724134 1.76231253 6.28226519 4.044183731 0.98123109 5.49024105 3.44923282 1.31716669 5.88318777
		 3.30666518 1.26030242 5.69093609 3.86777043 0.94934285 5.32624435 3.78395319 1.14050496 5.67647266
		 3.62309837 1.095889211 5.49812174 -1.63408947 -0.77933347 -0.5899123 -2.066787004 -0.3229782 -0.081284925
		 -2.48068619 0.12855387 0.47213861 -1.8743279 -0.34192127 0.13181415 -2.2674613 -0.10669482 0.17778552
		 -2.080651283 -0.13800997 0.3737835 -1.83676171 -0.55905789 -0.3713665 -1.60829067 -0.52554613 -0.093842559
		 -1.30685925 -0.68338513 -0.25723305 3.20685935 -0.68338513 -0.25723305 3.9667871 -0.3229782 -0.081284925
		 4.38068628 0.12855387 0.47213861 3.77432799 -0.34192127 0.13181415 3.53408957 -0.77933347 -0.5899123
		 4.1674614 -0.10669482 0.17778552 3.98065138 -0.13800997 0.3737835 3.73676181 -0.55905789 -0.3713665
		 3.50829077 -0.52554613 -0.093842559 -2.7666266 0.55340505 0.97296476 -2.96553421 1.024286628 1.53018761
		 -2.28652573 0.089667439 0.65626395 -2.56082201 0.48211849 1.12180209 -2.75260806 0.92551124 1.64612377
		 -2.63056874 0.33270907 0.714028 -2.43106031 0.28092599 0.88383257 -2.86919999 0.76380134 1.22271085
		 -2.65906167 0.67951202 1.3553673 -3.0041713715 1.26697981 1.81013548 -2.79611158 1.15356958 1.91536295
		 4.66662645 0.55340505 0.97296476 4.86553431 1.024286628 1.53018761 4.18652582 0.089667439 0.65626395
		 4.46082211 0.48211849 1.12180209 4.65260792 0.92551124 1.64612377 4.5305686 0.33270907 0.714028
		 4.33106041 0.28092599 0.88383257 4.76919985 0.76380134 1.22271085 4.55906153 0.67951202 1.3553673
		 4.90417147 1.26697981 1.81013548 4.69611168 1.15356958 1.91536295 -3.020540714 1.54625237 2.1358881
		 -2.95024848 2.026818752 2.72931838 -2.81596375 1.41817605 2.22778296 -2.73610902 1.88239324 2.77671576
		 -2.4993279 2.35584068 3.3355515 -3.0028619766 1.76909792 2.41167259 -2.79285455 1.63378704 2.48265958
		 -2.8492384 2.25756407 2.99929547 -2.6427176 2.1009903 3.034877539 4.92054081 1.54625237 2.1358881
		 4.85024834 2.026818752 2.72931838 4.71596384 1.41817605 2.22778296 4.63610888 1.88239324 2.77671576
		 4.39932775 2.35584068 3.3355515 4.90286207 1.76909792 2.41167259 4.6928544 1.63378704 2.48265958
		 4.74923849 2.25756407 2.99929547 4.54271746 2.1009903 3.034877539 -2.69486094 2.52740717 3.31360769
		 -2.28784537 2.98838902 3.86666179 -2.1145587 2.79295492 3.85134816 -2.52232599 2.74368525 3.57324696
		 -2.33596969 2.56125593 3.57816052 -1.88239932 2.97921515 4.069991112 4.59486103 2.52740717 3.31360769
		 4.18784523 2.98838902 3.86666179 4.014558792 2.79295492 3.85134816 4.42232609 2.74368525 3.57324696
		 4.23596954 2.56125593 3.57816052 3.78239942 2.97921515 4.069991112 -1.70732689 3.40557671 4.3567214
		 -1.57110238 3.1872406 4.31417465 -2.037955999 3.18648624 4.098966122 -1.34527969 3.58340263 4.57415867
		 -0.83851379 3.51683807 4.7013793 -1.2277565 3.35880804 4.51568699 2.73851371 3.51683807 4.7013793
		 3.1277566 3.35880804 4.51568699 3.60732698 3.40557671 4.3567214 3.47110248 3.1872406 4.31417465
		 3.93795609 3.18648624 4.098966122 3.24527979 3.58340263 4.57415867 0.94999999 4.056236744 5.13436842
		 0.94999999 3.81146193 5.048804283 -0.93495816 3.74771738 4.77355766 -0.0092955232 3.97538042 5.035481453
		 0.03319329 3.73344326 4.95526695 -0.48504943 3.87501287 4.92033768 -0.41323978 3.63846302 4.84387875
		 0.48795569 4.030383587 5.10270977 0.51019686 3.78708935 5.019751549 2.83495808 3.74771738 4.77355766
		 1.90929556 3.97538042 5.035481453 1.86680675 3.73344326 4.95526695 2.38504934 3.87501287 4.92033768
		 2.31323981 3.63846302 4.84387875 1.41204429 4.030383587 5.10270977 1.38980317 3.78708935 5.019751549
		 -0.071222603 1.067020297 -3.024793863 -0.21317929 1.15610898 -2.81415343 -0.32269603 1.44775808 -2.57743526
		 -0.36967498 2.053826809 -2.27089095 -0.31652659 2.53991795 -2.08270812 -0.26479429 2.79389238 -2.071131945
		 -0.22020251 3.073133945 -2.17530465 -0.21813589 3.2747221 -2.37022996 -0.23993045 3.38921928 -2.67388463
		 -0.27319187 3.3799305 -2.930161 -0.29741734 3.25011158 -3.1712091 -0.3006348 3.011968136 -3.37433457
		 -0.25458097 2.65231371 -3.577775 -0.16461736 2.26165771 -3.76283789 -0.021412313 1.92455375 -3.88886213
		 0.079708397 1.72635329 -3.89736652 0.18467569 1.53184807 -3.82052898;
	setAttr ".vt[1660:1782]" 0.25128824 1.35964739 -3.68630981 0.26301086 1.24165642 -3.53726411
		 0.19607049 1.13599765 -3.35212541 0.077535033 1.07351625 -3.19151306 2.1640923 -1.35317171 -2.047316551
		 2.22767591 -1.57546258 -1.60910439 2.04564333 -2.1196928 -1.17057586 1.88890564 -2.32605648 -1.060177684
		 1.63267827 -2.53360891 -0.94619429 1.34689581 -2.66996288 -0.86614215 0.95066237 -2.73082995 -0.8215338
		 0.55442888 -2.66996288 -0.86614215 0.26864636 -2.53360891 -0.94619429 0.012419038 -2.32605648 -1.060177684
		 -0.14431858 -2.1196928 -1.17057586 -0.32635128 -1.57546258 -1.60910439 -0.26276755 -1.35317171 -2.047316551
		 -0.090622433 -1.28662217 -2.41389084 0.17866606 -1.31428576 -2.7228415 0.5446496 -1.37014627 -2.93962336
		 0.95066237 -1.38818121 -3.029106855 1.35667515 -1.37014627 -2.93962336 1.72265863 -1.31428576 -2.7228415
		 1.99194717 -1.28662217 -2.41389084 2.174227 -1.82655621 -1.36623788 -0.27290237 -1.82655621 -1.36623788
		 0.49395511 -1.56367922 -3.25354815 0.082275026 -1.500844 -3.0096991062 -0.22063661 -1.4697262 -2.66217279
		 0.95066237 -1.5839659 -3.35420418 1.40736961 -1.56367922 -3.25354815 1.8190496 -1.500844 -3.0096991062
		 2.12196136 -1.4697262 -2.66217279 -0.41427565 -1.54458523 -2.24982834 -0.48579848 -1.79463124 -1.75690138
		 0.95066237 -3.094256878 -0.87099528 0.47777006 -3.025790215 -0.92117333 -0.10472942 -2.63894391 -1.13943613
		 0.18349028 -2.87241077 -1.011220694 -0.28103721 -2.40681362 -1.26361859 -0.42567587 -2.077076197 -1.48371065
		 2.3156004 -1.54458523 -2.24982834 2.38712311 -1.79463124 -1.75690138 1.42355466 -3.025790215 -0.92117333
		 2.006054163 -2.63894391 -1.13943613 1.71783447 -2.87241077 -1.011220694 2.18236184 -2.40681362 -1.26361859
		 2.32700062 -2.077076197 -1.48371065 0.16678584 1.079443336 -3.62076712 0.078500628 1.42707336 -3.94176245
		 -0.19100338 0.90385687 -3.0091443062 0.09999454 0.95895016 -3.40247631 -0.032990575 0.89703691 -3.21213913
		 0.15610158 1.21633637 -3.79045153 -0.34870058 1.018301606 -2.76910901 -0.47451144 1.35172856 -2.51940465
		 -0.042454123 1.66052353 -3.99244285 -0.15260535 1.87907493 -3.96340299 -0.30849713 2.24721193 -3.8327868
		 -0.40632558 2.67786717 -3.62309217 -0.45591396 3.062217712 -3.4116261 -0.4149223 2.82193899 -1.96691966
		 -0.36799091 3.13448858 -2.08350873 -0.46881264 2.53996277 -1.98159015 -0.45381218 3.32278824 -3.18930364
		 -0.42779964 3.46801615 -2.92530608 -0.35710651 3.35206318 -2.30928826 -0.52557617 2.0086345673 -2.18760943
		 -0.39157492 3.47730875 -2.64305711 -0.18498702 5.90164804 -5.08643198 -0.19634499 5.4630065 -5.51963282
		 2.052485704 5.57709694 -5.65075731 2.070343256 5.95763683 -5.17407513 2.026452065 6.18385506 -4.57822704
		 -1.13019085 0.069742315 -1.081692696 -1.5120523 -0.90021276 -0.73424768 -1.12820137 -0.61519289 -1.21857154
		 -1.30740678 -0.42730397 -0.91399801 -1.45198393 -0.27341503 -0.66757977 -1.15102816 -0.2284286 -0.34116006
		 -1.092383385 -0.28899193 -0.35329026 -1.29922676 -1.11101913 -0.98596019 -0.32652587 -1.44699669 -1.8283627
		 -0.48187333 -1.65183258 -2.0044140816 -0.69682848 -1.4567498 -1.90554225 -0.83379698 -1.11388695 -1.73788798
		 -0.96663457 -0.84474868 -1.50570691 2.22111559 -1.45655811 -1.80047297 2.37692404 -1.66300571 -1.97334754
		 2.60966587 -1.4875735 -1.87566423 2.78705215 -1.1518842 -1.68920875 2.97008252 -0.87766474 -1.47393751
		 3.31929851 -0.43900228 -0.9065187 3.0051574707 -0.32867771 -0.34631646 3.063621283 -0.26519459 -0.33437777
		 3.36670017 -0.31429935 -0.66130328 3.41861439 -0.89803874 -0.73068774 3.21484971 -1.09710741 -0.96970963
		 3.14148784 -0.66515738 -1.21948147 -0.42811257 2.49145675 -1.38477719 -0.79113138 1.5021143 -0.86314762
		 -0.72467124 1.48553181 -1.3327086 2.52638888 -0.3619417 -2.28457212 2.45492816 -0.84438664 -2.37917376
		 2.43333483 -1.27306092 -2.44993162 2.23991179 -1.48597395 -2.45273829 2.098995447 -1.29865527 -2.22767186
		 3.010389328 0.66323632 -0.78921688 3.069556236 0.45087647 -1.29774809 2.95344806 0.20474395 -1.80268812
		 2.66897321 -0.084801055 -2.22260523 -0.42846647 3.59704518 -3.92848611 -0.41127253 4.11489201 -4.36452103
		 -0.36941749 4.61628342 -4.77383661 -0.30133387 5.068723202 -5.13631105 -0.39436001 4.080587387 -3.42796278
		 -0.37115842 4.60733461 -3.88023305 -0.33120221 5.085727215 -4.30439663 -0.26693055 5.51136541 -4.68181849
		 -0.41056827 3.73181629 -3.13807607 -0.43958038 3.54089522 -3.41454649 -0.4396961 3.28735065 -3.64194894
		 -0.40592283 2.92752886 -3.87708521;
	setAttr -s 5112 ".ed";
	setAttr ".ed[0:165]"  10 31 0 31 32 0 32 10 0 31 56 0 56 32 0 32 16 0 16 10 0
		 30 13 0 13 29 0 29 30 0 13 11 0 11 29 0 49 30 0 30 50 0 50 49 0 29 50 0 3 51 0 51 41 0
		 41 3 0 51 78 0 78 41 0 3 52 0 52 51 0 8 34 0 34 54 0 54 8 0 34 68 0 68 54 0 54 53 0
		 53 8 0 56 55 0 55 32 0 55 33 0 33 32 0 55 57 0 57 33 0 57 34 0 34 33 0 31 58 0 58 56 0
		 31 49 0 49 58 0 19 3 0 3 2 0 2 19 0 3 4 0 4 2 0 20 1 0 1 7 0 7 20 0 1 6 0 6 7 0 7 60 0
		 60 20 0 60 59 0 59 20 0 2 27 0 27 19 0 2 26 0 26 27 0 17 0 0 0 25 0 25 17 0 0 24 0
		 24 25 0 23 14 0 14 22 0 22 23 0 14 1 0 1 22 0 59 61 0 61 20 0 61 21 0 21 20 0 31 30 0
		 10 30 0 10 13 0 23 0 0 0 14 0 23 24 0 33 16 0 33 9 0 9 16 0 25 26 0 26 17 0 2 17 0
		 27 63 0 63 19 0 63 62 0 62 19 0 19 52 0 62 52 0 1 21 0 21 22 0 61 64 0 64 21 0 64 12 0
		 12 21 0 11 22 0 22 12 0 12 11 0 13 23 0 23 11 0 10 24 0 24 13 0 24 16 0 16 25 0 9 25 0
		 9 26 0 26 8 0 8 27 0 9 8 0 53 27 0 53 63 0 34 9 0 29 65 0 65 50 0 29 28 0 28 65 0
		 11 28 0 12 28 0 12 66 0 66 28 0 66 67 0 67 28 0 64 66 0 67 65 0 57 68 0 70 69 0 69 48 0
		 48 70 0 69 40 0 40 48 0 48 71 0 71 70 0 4 17 0 4 18 0 18 17 0 14 6 0 14 15 0 15 6 0
		 0 15 0 0 5 0 5 15 0 0 18 0 18 5 0 44 73 0 73 45 0 45 44 0 73 72 0 72 45 0 46 45 0
		 45 74 0 74 46 0 72 74 0 44 75 0 75 73 0 44 43 0 43 75 0 74 76 0 76 46 0 76 47 0 47 46 0
		 76 71 0 71 47 0 48 47 0;
	setAttr ".ed[166:331]" 36 18 0 18 35 0 35 36 0 4 35 0 37 5 0 5 36 0 36 37 0
		 5 38 0 38 15 0 37 38 0 38 39 0 39 15 0 39 6 0 39 40 0 40 6 0 40 7 0 7 77 0 77 60 0
		 40 77 0 69 77 0 78 42 0 42 41 0 78 80 0 80 42 0 4 41 0 41 35 0 42 79 0 79 43 0 43 42 0
		 79 75 0 42 35 0 43 35 0 44 36 0 36 43 0 45 37 0 37 44 0 37 46 0 46 38 0 47 38 0 47 39 0
		 48 39 0 80 79 0 182 70 0 70 183 0 183 182 0 71 183 0 71 184 0 184 183 0 76 184 0
		 185 74 0 74 186 0 186 185 0 72 186 0 171 49 0 49 172 0 172 171 0 50 172 0 173 172 0
		 172 65 0 65 173 0 170 58 0 58 171 0 171 170 0 174 173 0 173 67 0 67 174 0 175 174 0
		 174 66 0 66 175 0 187 186 0 186 73 0 73 187 0 189 188 0 188 79 0 79 189 0 188 75 0
		 190 189 0 189 80 0 80 190 0 160 191 0 191 51 0 51 160 0 191 78 0 161 160 0 160 52 0
		 52 161 0 163 63 0 63 164 0 164 163 0 53 164 0 53 165 0 165 164 0 54 165 0 54 166 0
		 166 165 0 68 166 0 163 162 0 162 63 0 162 62 0 167 57 0 57 168 0 168 167 0 55 168 0
		 169 168 0 168 56 0 56 169 0 170 169 0 169 58 0 68 167 0 167 166 0 162 161 0 161 62 0
		 180 77 0 77 181 0 181 180 0 69 181 0 179 60 0 60 180 0 180 179 0 176 175 0 175 64 0
		 64 176 0 177 176 0 176 61 0 61 177 0 61 178 0 178 177 0 59 178 0 59 179 0 179 178 0
		 122 149 0 149 123 0 123 122 0 149 148 0 148 123 0 157 158 0 158 139 0 139 157 0 158 138 0
		 138 139 0 152 153 0 153 127 0 127 152 0 153 143 0 143 127 0 148 124 0 124 123 0 148 147 0
		 147 124 0 156 157 0 157 140 0 140 156 0 139 140 0 147 125 0 125 124 0 147 145 0 145 125 0
		 140 141 0 141 156 0 141 155 0 155 156 0 146 126 0 126 145 0 145 146 0 126 125 0 141 142 0;
	setAttr ".ed[332:497]" 142 155 0 142 154 0 154 155 0 120 151 0 151 121 0 121 120 0
		 151 150 0 150 121 0 142 143 0 143 154 0 153 154 0 137 159 0 159 136 0 136 137 0 159 112 0
		 112 136 0 150 122 0 122 121 0 150 149 0 127 146 0 146 152 0 127 126 0 158 159 0 159 138 0
		 137 138 0 120 119 0 119 151 0 119 104 0 104 151 0 104 101 0 101 151 0 159 111 0 111 112 0
		 112 135 0 135 136 0 112 109 0 109 135 0 149 102 0 102 148 0 102 103 0 103 148 0 109 134 0
		 134 135 0 109 108 0 108 134 0 157 110 0 110 158 0 157 92 0 92 110 0 152 88 0 88 153 0
		 152 90 0 90 88 0 103 147 0 103 106 0 106 147 0 132 82 0 82 131 0 131 132 0 82 81 0
		 81 131 0 156 92 0 156 91 0 91 92 0 118 117 0 117 99 0 99 118 0 117 98 0 98 99 0 81 130 0
		 130 131 0 81 83 0 83 130 0 119 118 0 118 104 0 99 104 0 106 145 0 106 105 0 105 145 0
		 108 133 0 133 134 0 108 86 0 86 133 0 155 91 0 155 89 0 89 91 0 115 114 0 114 96 0
		 96 115 0 114 95 0 95 96 0 86 132 0 132 133 0 86 82 0 114 113 0 113 95 0 113 93 0
		 93 95 0 83 144 0 144 130 0 83 84 0 84 144 0 116 115 0 115 97 0 97 116 0 96 97 0 105 146 0
		 105 107 0 107 146 0 84 129 0 129 144 0 84 85 0 85 129 0 154 89 0 154 87 0 87 89 0
		 117 116 0 116 98 0 97 98 0 113 128 0 128 93 0 128 94 0 94 93 0 101 150 0 101 100 0
		 100 150 0 153 87 0 88 87 0 128 129 0 129 94 0 85 94 0 149 100 0 100 102 0 107 152 0
		 107 90 0 158 111 0 110 111 0 191 190 0 190 78 0 69 182 0 182 181 0 76 185 0 185 184 0
		 188 187 0 187 75 0 98 161 0 161 99 0 98 160 0 99 162 0 162 104 0 104 163 0 163 101 0
		 163 100 0 164 100 0 164 102 0 165 102 0 165 103 0 166 103 0 166 106 0 167 106 0 167 105 0
		 168 105 0 105 169 0 169 107 0 107 170 0 170 90 0;
	setAttr ".ed[498:663]" 170 88 0 171 88 0 171 87 0 172 87 0 87 173 0 173 89 0
		 89 174 0 174 91 0 91 175 0 175 92 0 92 176 0 176 110 0 110 177 0 177 111 0 177 112 0
		 178 112 0 178 109 0 179 109 0 179 108 0 180 108 0 180 86 0 181 86 0 182 82 0 82 181 0
		 182 81 0 183 81 0 183 83 0 184 83 0 184 84 0 185 84 0 185 85 0 186 85 0 85 187 0
		 187 94 0 94 188 0 188 93 0 93 189 0 189 95 0 95 190 0 190 96 0 96 191 0 191 97 0
		 97 160 0 203 295 0 295 296 0 296 203 0 299 266 0 266 198 0 198 299 0 379 373 0 373 192 0
		 192 379 0 373 356 0 356 192 0 371 372 0 372 378 0 378 371 0 254 255 0 255 195 0 195 254 0
		 255 194 0 194 195 0 196 259 0 259 260 0 260 196 0 258 194 0 194 257 0 257 258 0 194 256 0
		 256 257 0 260 261 0 261 196 0 261 197 0 197 196 0 378 369 0 369 371 0 378 198 0 198 369 0
		 266 267 0 267 198 0 267 253 0 253 198 0 262 264 0 264 197 0 197 262 0 264 265 0 265 197 0
		 265 263 0 263 197 0 263 366 0 366 197 0 198 271 0 271 299 0 378 271 0 277 378 0 378 297 0
		 297 277 0 378 379 0 379 297 0 300 301 0 301 193 0 193 300 0 301 202 0 202 193 0 291 199 0
		 199 280 0 280 291 0 192 201 0 201 379 0 379 374 0 374 297 0 277 298 0 298 378 0 378 272 0
		 272 271 0 298 272 0 192 357 0 357 193 0 193 192 0 357 358 0 358 193 0 356 357 0 360 300 0
		 300 359 0 359 360 0 193 359 0 361 279 0 279 360 0 360 361 0 279 300 0 361 278 0 278 279 0
		 363 274 0 274 275 0 275 363 0 269 273 0 273 364 0 364 269 0 197 368 0 368 196 0 197 367 0
		 367 368 0 366 367 0 194 369 0 369 195 0 198 195 0 194 370 0 370 369 0 194 196 0 196 370 0
		 368 370 0 295 376 0 376 283 0 283 295 0 290 376 0 376 291 0 291 290 0 281 377 0 377 282 0
		 282 281 0 377 286 0 286 282 0 292 293 0 293 377 0 377 292 0 293 294 0;
	setAttr ".ed[664:829]" 294 377 0 377 285 0 285 286 0 377 288 0 288 285 0 294 289 0
		 289 377 0 289 288 0 258 234 0 234 259 0 259 258 0 234 233 0 233 259 0 274 221 0 221 275 0
		 274 222 0 222 221 0 292 211 0 211 293 0 292 212 0 212 211 0 320 302 0 302 336 0 336 320 0
		 302 318 0 318 336 0 332 343 0 343 326 0 326 332 0 343 342 0 342 326 0 334 355 0 355 330 0
		 330 334 0 355 354 0 354 330 0 316 312 0 312 554 0 554 316 0 312 553 0 553 554 0 376 281 0
		 281 283 0 376 377 0 256 236 0 236 257 0 236 235 0 235 257 0 224 223 0 223 269 0 269 224 0
		 223 273 0 291 213 0 213 290 0 291 214 0 214 213 0 241 266 0 266 242 0 242 241 0 299 242 0
		 323 337 0 337 305 0 305 323 0 337 319 0 319 305 0 327 341 0 341 333 0 333 327 0 341 340 0
		 340 333 0 331 353 0 353 335 0 335 331 0 353 352 0 352 335 0 309 558 0 558 308 0 308 309 0
		 558 559 0 559 308 0 310 316 0 316 555 0 555 310 0 554 555 0 194 259 0 235 258 0 235 234 0
		 223 222 0 222 273 0 274 273 0 292 290 0 290 212 0 213 212 0 279 217 0 217 300 0 279 218 0
		 218 217 0 379 203 0 203 374 0 296 374 0 320 323 0 323 302 0 305 302 0 342 327 0 327 326 0
		 342 341 0 354 331 0 331 330 0 354 353 0 365 270 0 270 364 0 364 365 0 270 269 0 546 305 0
		 305 545 0 545 546 0 319 545 0 255 237 0 237 256 0 256 255 0 237 236 0 270 224 0 270 225 0
		 225 224 0 280 214 0 280 215 0 215 214 0 271 243 0 243 299 0 243 242 0 201 203 0 201 200 0
		 200 203 0 337 324 0 324 319 0 324 306 0 306 319 0 340 329 0 329 333 0 340 339 0 339 329 0
		 352 321 0 321 335 0 352 351 0 351 321 0 273 363 0 363 364 0 306 544 0 544 319 0 544 545 0
		 267 240 0 240 253 0 240 239 0 239 253 0 265 227 0 227 263 0 265 228 0 228 227 0 288 207 0
		 207 284 0 284 288 0 207 206 0 206 284 0 297 247 0 247 277 0 247 246 0;
	setAttr ".ed[830:995]" 246 277 0 326 308 0 308 332 0 308 314 0 314 332 0 330 312 0
		 312 334 0 316 334 0 336 349 0 349 320 0 349 348 0 348 320 0 314 560 0 560 307 0 307 314 0
		 560 561 0 561 307 0 275 362 0 362 363 0 275 276 0 276 362 0 313 317 0 317 552 0 552 313 0
		 317 551 0 551 552 0 547 302 0 302 546 0 546 547 0 261 262 0 253 195 0 253 254 0 254 238 0
		 238 255 0 238 237 0 270 268 0 268 225 0 268 226 0 226 225 0 285 205 0 205 286 0 205 204 0
		 204 286 0 298 245 0 245 272 0 245 244 0 244 272 0 296 248 0 248 374 0 248 375 0 375 374 0
		 324 325 0 325 306 0 325 307 0 307 306 0 339 328 0 328 329 0 339 338 0 338 328 0 351 322 0
		 322 321 0 351 350 0 350 322 0 559 314 0 559 560 0 317 303 0 303 551 0 303 550 0 550 551 0
		 244 271 0 244 243 0 262 229 0 229 264 0 262 230 0 230 229 0 287 289 0 289 208 0 208 287 0
		 289 209 0 209 208 0 295 249 0 249 296 0 249 248 0 300 216 0 216 301 0 217 216 0 333 309 0
		 309 327 0 333 315 0 315 309 0 335 317 0 317 331 0 313 331 0 323 347 0 347 337 0 347 346 0
		 346 337 0 306 561 0 561 544 0 557 315 0 315 556 0 556 557 0 315 311 0 311 556 0 547 318 0
		 547 548 0 548 318 0 284 285 0 239 254 0 239 238 0 227 226 0 226 263 0 268 263 0 206 285 0
		 206 205 0 246 298 0 246 245 0 375 297 0 375 247 0 325 332 0 332 307 0 316 328 0 328 334 0
		 310 328 0 350 336 0 336 322 0 350 349 0 358 359 0 311 310 0 310 556 0 555 556 0 378 373 0
		 372 373 0 202 199 0 199 201 0 201 202 0 199 200 0 282 252 0 252 281 0 252 251 0 251 281 0
		 260 231 0 231 261 0 260 232 0 232 231 0 278 276 0 276 219 0 219 278 0 276 220 0 220 219 0
		 293 210 0 210 294 0 211 210 0 280 301 0 301 215 0 216 215 0 328 311 0 311 329 0 322 303 0
		 303 321 0 322 304 0 304 303 0 324 345 0 345 325 0 345 344 0 344 325 0;
	setAttr ".ed[996:1161]" 557 309 0 557 558 0 365 268 0 365 366 0 366 268 0 199 376 0
		 376 200 0 241 267 0 241 240 0 264 228 0 229 228 0 288 287 0 287 207 0 208 207 0 309 326 0
		 331 312 0 313 312 0 348 323 0 348 347 0 204 282 0 204 252 0 259 232 0 233 232 0 275 220 0
		 221 220 0 294 209 0 210 209 0 336 304 0 318 304 0 344 332 0 344 343 0 338 334 0 338 355 0
		 304 550 0 304 549 0 549 550 0 376 292 0 202 192 0 251 283 0 251 250 0 250 283 0 261 230 0
		 231 230 0 278 218 0 219 218 0 250 295 0 250 249 0 202 280 0 311 333 0 303 335 0 346 324 0
		 346 345 0 278 362 0 361 362 0 313 553 0 552 553 0 304 548 0 548 549 0 376 203 0 408 414 0
		 414 409 0 409 408 0 403 399 0 399 402 0 402 403 0 388 389 0 389 403 0 403 388 0 389 404 0
		 404 403 0 406 405 0 405 401 0 401 406 0 405 398 0 398 401 0 403 380 0 380 388 0 402 380 0
		 399 391 0 391 402 0 391 380 0 408 413 0 413 414 0 408 410 0 410 413 0 400 392 0 392 399 0
		 399 400 0 392 391 0 410 412 0 412 413 0 410 407 0 407 412 0 398 390 0 390 401 0 390 393 0
		 393 401 0 411 398 0 398 415 0 415 411 0 405 415 0 393 400 0 400 401 0 393 392 0 407 411 0
		 411 412 0 415 412 0 415 382 0 382 412 0 415 381 0 381 382 0 410 397 0 397 407 0 397 385 0
		 385 407 0 406 394 0 394 405 0 406 387 0 387 394 0 396 386 0 386 409 0 409 396 0 386 408 0
		 405 381 0 394 381 0 410 386 0 386 397 0 406 404 0 404 387 0 389 387 0 414 396 0 414 384 0
		 384 396 0 411 395 0 395 398 0 395 390 0 412 383 0 383 413 0 382 383 0 400 404 0 404 401 0
		 385 411 0 385 395 0 413 384 0 383 384 0 403 400 0 436 435 0 435 416 0 416 436 0 435 443 0
		 443 416 0 443 442 0 442 416 0 442 441 0 441 416 0 441 440 0 440 416 0 440 439 0 439 416 0
		 439 438 0 438 416 0 438 437 0 437 416 0 437 436 0 463 444 0 444 464 0;
	setAttr ".ed[1162:1327]" 464 463 0 444 465 0 465 464 0 463 471 0 471 444 0 471 470 0
		 470 444 0 470 469 0 469 444 0 469 468 0 468 444 0 468 467 0 467 444 0 467 466 0 466 444 0
		 466 465 0 479 472 0 472 478 0 478 479 0 472 473 0 473 478 0 474 473 0 473 475 0 475 474 0
		 472 475 0 505 474 0 474 504 0 504 505 0 475 504 0 481 476 0 476 480 0 480 481 0 476 477 0
		 477 480 0 478 477 0 477 479 0 476 479 0 482 481 0 481 483 0 483 482 0 480 483 0 485 482 0
		 482 484 0 484 485 0 483 484 0 486 485 0 485 487 0 487 486 0 484 487 0 489 486 0 486 488 0
		 488 489 0 487 488 0 490 489 0 489 491 0 491 490 0 488 491 0 492 490 0 490 493 0 493 492 0
		 491 493 0 494 492 0 492 495 0 495 494 0 493 495 0 496 494 0 494 497 0 497 496 0 495 497 0
		 498 496 0 496 499 0 499 498 0 497 499 0 501 498 0 498 500 0 500 501 0 499 500 0 502 501 0
		 501 503 0 503 502 0 500 503 0 507 502 0 502 506 0 506 507 0 503 506 0 506 505 0 505 507 0
		 504 507 0 472 443 0 443 475 0 476 442 0 442 479 0 482 441 0 441 481 0 486 440 0 440 485 0
		 490 439 0 439 489 0 494 438 0 438 492 0 498 437 0 437 496 0 502 436 0 436 501 0 504 435 0
		 435 507 0 496 438 0 423 491 0 491 425 0 425 423 0 488 425 0 438 490 0 424 487 0 487 417 0
		 417 424 0 484 417 0 424 488 0 424 425 0 483 422 0 422 484 0 422 417 0 505 430 0 430 474 0
		 430 434 0 434 474 0 439 486 0 421 422 0 422 480 0 480 421 0 431 430 0 430 506 0 506 431 0
		 477 419 0 419 480 0 419 421 0 503 431 0 503 429 0 429 431 0 440 482 0 443 504 0 477 420 0
		 420 419 0 478 420 0 428 429 0 429 500 0 500 428 0 495 432 0 432 497 0 432 427 0 427 497 0
		 473 420 0 473 418 0 418 420 0 499 428 0 499 433 0 433 428 0 481 442 0 507 436 0 434 418 0
		 418 474 0 427 433 0 433 497 0 491 426 0 426 493 0 423 426 0 479 443 0;
	setAttr ".ed[1328:1493]" 436 498 0 426 432 0 432 493 0 515 508 0 508 514 0 514 515 0
		 508 509 0 509 514 0 510 509 0 509 511 0 511 510 0 508 511 0 541 510 0 510 540 0 540 541 0
		 511 540 0 517 512 0 512 516 0 516 517 0 512 513 0 513 516 0 514 513 0 513 515 0 512 515 0
		 518 517 0 517 519 0 519 518 0 516 519 0 521 518 0 518 520 0 520 521 0 519 520 0 522 521 0
		 521 523 0 523 522 0 520 523 0 525 522 0 522 524 0 524 525 0 523 524 0 526 525 0 525 527 0
		 527 526 0 524 527 0 528 526 0 526 529 0 529 528 0 527 529 0 530 528 0 528 531 0 531 530 0
		 529 531 0 532 530 0 530 533 0 533 532 0 531 533 0 534 532 0 532 535 0 535 534 0 533 535 0
		 537 534 0 534 536 0 536 537 0 535 536 0 538 537 0 537 539 0 539 538 0 536 539 0 543 538 0
		 538 542 0 542 543 0 539 542 0 542 541 0 541 543 0 540 543 0 508 471 0 471 511 0 512 470 0
		 470 515 0 518 469 0 469 517 0 522 468 0 468 521 0 526 467 0 467 525 0 530 466 0 466 528 0
		 534 465 0 465 532 0 538 464 0 464 537 0 540 463 0 463 543 0 532 466 0 451 527 0 527 453 0
		 453 451 0 524 453 0 523 452 0 452 524 0 452 453 0 466 526 0 523 445 0 445 452 0 520 445 0
		 519 450 0 450 520 0 450 445 0 541 458 0 458 510 0 458 462 0 462 510 0 513 447 0 447 516 0
		 447 449 0 449 516 0 539 457 0 457 542 0 457 459 0 459 542 0 467 522 0 449 450 0 450 516 0
		 459 458 0 458 542 0 468 518 0 511 463 0 513 448 0 448 447 0 514 448 0 539 456 0 456 457 0
		 536 456 0 509 446 0 446 514 0 446 448 0 535 456 0 535 461 0 461 456 0 517 470 0 463 538 0
		 462 446 0 446 510 0 535 455 0 455 461 0 533 455 0 531 460 0 460 533 0 460 455 0 451 529 0
		 451 454 0 454 529 0 515 471 0 537 465 0 454 460 0 460 529 0 373 545 0 545 356 0 544 356 0
		 373 546 0 372 546 0 372 547 0 371 547 0 369 548 0 548 371 0 369 549 0;
	setAttr ".ed[1494:1659]" 370 549 0 368 549 0 368 550 0 367 550 0 367 551 0 366 551 0
		 366 552 0 365 552 0 365 553 0 364 553 0 364 554 0 363 554 0 363 555 0 362 555 0 362 556 0
		 362 557 0 361 557 0 360 558 0 558 361 0 359 559 0 559 360 0 358 560 0 560 359 0 357 561 0
		 561 358 0 544 357 0 648 649 0 649 590 0 590 648 0 650 651 0 651 589 0 589 650 0 634 635 0
		 635 597 0 597 634 0 635 636 0 636 597 0 637 638 0 638 596 0 596 637 0 640 641 0 641 594 0
		 594 640 0 641 642 0 642 594 0 643 593 0 593 642 0 642 643 0 593 594 0 643 644 0 644 593 0
		 645 646 0 646 592 0 592 645 0 646 591 0 591 592 0 639 640 0 640 595 0 595 639 0 594 595 0
		 596 636 0 636 637 0 596 597 0 595 638 0 638 639 0 595 596 0 651 634 0 634 589 0 597 589 0
		 649 650 0 650 590 0 589 590 0 647 648 0 648 591 0 591 647 0 590 591 0 646 647 0 592 644 0
		 644 645 0 592 593 0 586 577 0 577 585 0 585 586 0 577 576 0 576 585 0 564 595 0 595 565 0
		 565 564 0 594 565 0 614 615 0 615 616 0 616 614 0 615 617 0 617 616 0 641 621 0 621 642 0
		 641 623 0 623 621 0 587 578 0 578 586 0 586 587 0 578 577 0 593 565 0 593 566 0 566 565 0
		 612 613 0 613 614 0 614 612 0 613 615 0 640 623 0 640 625 0 625 623 0 588 579 0 579 587 0
		 587 588 0 579 578 0 592 566 0 592 567 0 567 566 0 610 611 0 611 612 0 612 610 0 611 613 0
		 639 625 0 639 627 0 627 625 0 651 599 0 599 634 0 651 603 0 603 599 0 570 562 0 562 588 0
		 588 570 0 562 580 0 580 588 0 591 567 0 591 568 0 568 567 0 608 609 0 609 610 0 610 608 0
		 609 611 0 601 632 0 632 600 0 600 601 0 632 633 0 633 600 0 638 627 0 638 629 0 629 627 0
		 650 603 0 650 605 0 605 603 0 564 582 0 582 563 0 563 564 0 582 581 0 581 563 0 569 590 0
		 590 570 0 570 569 0 589 570 0 604 605 0 605 606 0 606 604 0 605 607 0;
	setAttr ".ed[1660:1825]" 607 606 0 630 628 0 628 631 0 631 630 0 628 629 0 629 631 0
		 636 631 0 631 637 0 636 633 0 633 631 0 648 607 0 607 649 0 648 609 0 609 607 0 581 562 0
		 562 563 0 581 580 0 590 568 0 569 568 0 607 608 0 608 606 0 633 630 0 632 630 0 637 629 0
		 649 605 0 565 583 0 583 564 0 583 582 0 580 579 0 580 571 0 571 579 0 605 602 0 602 603 0
		 604 602 0 629 626 0 626 627 0 628 626 0 635 633 0 635 600 0 647 609 0 647 611 0 566 584 0
		 584 565 0 584 583 0 581 572 0 572 580 0 572 571 0 602 598 0 598 603 0 598 599 0 626 624 0
		 624 627 0 624 625 0 634 600 0 599 600 0 646 611 0 646 613 0 567 585 0 585 566 0 585 584 0
		 582 573 0 573 581 0 573 572 0 599 601 0 598 601 0 625 622 0 622 623 0 624 622 0 645 613 0
		 645 615 0 568 586 0 586 567 0 583 574 0 574 582 0 574 573 0 597 570 0 597 562 0 620 621 0
		 621 622 0 622 620 0 644 615 0 644 617 0 569 587 0 587 568 0 584 575 0 575 583 0 575 574 0
		 596 562 0 596 563 0 618 619 0 619 620 0 620 618 0 619 621 0 643 617 0 643 619 0 619 617 0
		 588 569 0 576 584 0 576 575 0 595 563 0 617 618 0 618 616 0 642 619 0 610 653 0 653 608 0
		 653 652 0 652 608 0 608 654 0 654 606 0 652 654 0 601 656 0 656 632 0 656 655 0 655 632 0
		 632 657 0 657 630 0 655 657 0 657 628 0 657 658 0 658 628 0 628 659 0 659 626 0 658 659 0
		 659 624 0 659 660 0 660 624 0 624 661 0 661 622 0 660 661 0 661 620 0 661 662 0 662 620 0
		 620 663 0 663 618 0 662 663 0 663 616 0 663 664 0 664 616 0 616 665 0 665 614 0 664 665 0
		 665 612 0 665 666 0 666 612 0 612 653 0 666 653 0 654 604 0 654 667 0 667 604 0 604 668 0
		 668 602 0 667 668 0 668 598 0 668 669 0 669 598 0 598 656 0 669 656 0 653 671 0 671 652 0
		 671 670 0 670 652 0 652 672 0 672 654 0 670 672 0 656 673 0 673 655 0;
	setAttr ".ed[1826:1991]" 656 674 0 674 673 0 655 675 0 675 657 0 673 675 0 657 676 0
		 676 658 0 675 676 0 658 677 0 677 659 0 676 677 0 677 660 0 677 678 0 678 660 0 678 661 0
		 678 679 0 679 661 0 679 662 0 679 680 0 680 662 0 680 663 0 680 681 0 681 663 0 681 664 0
		 681 682 0 682 664 0 682 665 0 682 683 0 683 665 0 683 666 0 683 684 0 684 666 0 684 653 0
		 684 671 0 654 685 0 685 667 0 672 685 0 667 686 0 686 668 0 685 686 0 668 687 0 687 669 0
		 686 687 0 669 674 0 687 674 0 696 688 0 688 690 0 690 696 0 688 689 0 689 690 0 692 696 0
		 696 691 0 691 692 0 690 691 0 692 694 0 694 696 0 692 693 0 693 694 0 694 695 0 695 696 0
		 684 688 0 688 671 0 684 689 0 683 689 0 682 689 0 682 690 0 681 690 0 680 690 0 680 691 0
		 679 691 0 678 691 0 678 692 0 677 692 0 676 692 0 676 693 0 675 693 0 673 693 0 673 694 0
		 674 694 0 687 694 0 687 695 0 686 695 0 685 695 0 685 696 0 672 696 0 670 696 0 670 688 0
		 343 341 0 345 341 0 341 344 0 347 341 0 341 346 0 349 341 0 341 348 0 350 341 0 351 341 0
		 352 341 0 353 341 0 354 341 0 355 341 0 338 341 0 339 341 0 720 780 0 780 819 0 819 720 0
		 780 820 0 820 819 0 738 739 0 739 825 0 825 738 0 739 826 0 826 825 0 712 714 0 714 697 0
		 697 712 0 714 698 0 698 697 0 716 712 0 712 704 0 704 716 0 697 704 0 710 804 0 804 828 0
		 828 710 0 804 829 0 829 828 0 703 723 0 723 704 0 704 703 0 723 716 0 730 817 0 817 728 0
		 728 730 0 817 816 0 816 728 0 703 727 0 727 723 0 703 706 0 706 727 0 705 724 0 724 706 0
		 706 705 0 724 727 0 701 700 0 700 736 0 736 701 0 700 735 0 735 736 0 699 733 0 733 705 0
		 705 699 0 733 724 0 711 710 0 710 827 0 827 711 0 828 827 0 729 735 0 735 707 0 707 729 0
		 700 707 0 734 728 0 728 815 0 815 734 0 816 815 0 707 709 0 709 729 0;
	setAttr ".ed[1992:2157]" 709 731 0 731 729 0 803 798 0 798 830 0 830 803 0 798 831 0
		 831 830 0 708 719 0 719 709 0 709 708 0 719 731 0 819 718 0 718 720 0 819 818 0 818 718 0
		 702 721 0 721 708 0 708 702 0 721 719 0 743 744 0 744 742 0 742 743 0 744 745 0 745 742 0
		 746 756 0 756 747 0 747 746 0 756 757 0 757 747 0 749 748 0 748 753 0 753 749 0 748 752 0
		 752 753 0 746 743 0 743 756 0 746 744 0 748 747 0 747 752 0 757 752 0 795 737 0 737 813 0
		 813 795 0 737 814 0 814 813 0 737 734 0 734 814 0 801 823 0 823 802 0 802 801 0 823 755 0
		 755 802 0 801 824 0 824 823 0 739 711 0 711 826 0 827 826 0 815 814 0 799 832 0 832 798 0
		 798 799 0 832 831 0 761 762 0 762 784 0 784 761 0 762 785 0 785 784 0 766 765 0 765 767 0
		 767 766 0 765 768 0 768 767 0 781 771 0 771 782 0 782 781 0 771 772 0 772 782 0 777 776 0
		 776 778 0 778 777 0 776 775 0 775 778 0 765 698 0 698 768 0 714 768 0 777 702 0 702 776 0
		 777 721 0 775 772 0 772 778 0 775 782 0 781 809 0 809 771 0 781 810 0 810 809 0 784 766 0
		 766 761 0 767 761 0 806 760 0 760 807 0 807 806 0 760 783 0 783 807 0 788 787 0 787 789 0
		 789 788 0 787 786 0 786 789 0 791 790 0 790 793 0 793 791 0 790 792 0 792 793 0 788 699 0
		 699 787 0 788 733 0 790 701 0 701 792 0 736 792 0 786 745 0 745 789 0 786 742 0 753 791 0
		 791 749 0 793 749 0 794 812 0 812 751 0 751 794 0 812 811 0 811 751 0 780 779 0 779 820 0
		 779 821 0 821 820 0 800 833 0 833 799 0 799 800 0 833 832 0 769 808 0 808 822 0 822 769 0
		 808 759 0 759 822 0 822 770 0 770 769 0 822 821 0 821 770 0 800 759 0 759 834 0 834 800 0
		 759 805 0 805 834 0 834 833 0 834 763 0 763 833 0 759 758 0 758 805 0 808 758 0 779 770 0
		 813 794 0 794 795 0 813 812 0 801 738 0 738 824 0 825 824 0 741 811 0;
	setAttr ".ed[2158:2323]" 811 802 0 802 741 0 811 801 0 802 740 0 740 741 0 755 740 0
		 823 754 0 754 755 0 823 796 0 796 754 0 824 796 0 818 730 0 730 718 0 818 817 0 804 803 0
		 803 829 0 830 829 0 807 785 0 785 806 0 762 806 0 810 783 0 783 809 0 760 809 0 812 801 0
		 813 801 0 813 738 0 814 738 0 814 739 0 815 739 0 815 711 0 816 711 0 816 710 0 817 710 0
		 817 804 0 818 804 0 818 803 0 819 798 0 798 818 0 820 798 0 820 799 0 821 799 0 821 800 0
		 800 822 0 824 797 0 797 796 0 825 797 0 825 732 0 732 797 0 826 732 0 826 725 0 725 732 0
		 827 725 0 827 726 0 726 725 0 828 726 0 828 722 0 722 726 0 829 722 0 829 717 0 717 722 0
		 830 717 0 830 713 0 713 717 0 831 713 0 831 715 0 715 713 0 832 773 0 773 831 0 773 715 0
		 833 774 0 774 832 0 774 773 0 763 774 0 805 764 0 764 834 0 764 763 0 741 750 0 750 811 0
		 750 751 0 744 862 0 862 745 0 744 863 0 863 862 0 746 864 0 864 744 0 864 863 0 747 865 0
		 865 746 0 865 864 0 748 866 0 866 747 0 866 865 0 749 867 0 867 748 0 867 866 0 793 868 0
		 868 749 0 868 867 0 792 835 0 835 793 0 835 868 0 736 835 0 736 836 0 836 835 0 735 836 0
		 735 837 0 837 836 0 729 837 0 729 838 0 838 837 0 731 838 0 731 839 0 839 838 0 719 839 0
		 719 840 0 840 839 0 721 841 0 841 719 0 841 840 0 777 842 0 842 721 0 842 841 0 778 843 0
		 843 777 0 843 842 0 772 844 0 844 778 0 844 843 0 771 845 0 845 772 0 845 844 0 809 846 0
		 846 771 0 846 845 0 760 847 0 847 809 0 847 846 0 806 847 0 806 848 0 848 847 0 762 848 0
		 762 849 0 849 848 0 761 849 0 761 850 0 850 849 0 767 850 0 767 851 0 851 850 0 768 851 0
		 768 852 0 852 851 0 714 852 0 714 853 0 853 852 0 712 853 0 712 854 0 854 853 0 716 854 0
		 716 855 0 855 854 0 723 856 0 856 716 0 856 855 0 727 856 0 727 857 0;
	setAttr ".ed[2324:2489]" 857 856 0 724 857 0 724 858 0 858 857 0 733 858 0 733 859 0
		 859 858 0 788 859 0 788 860 0 860 859 0 789 860 0 789 861 0 861 860 0 745 861 0 862 861 0
		 795 836 0 836 737 0 795 835 0 737 837 0 837 734 0 734 838 0 838 728 0 838 730 0 839 730 0
		 839 718 0 840 718 0 840 720 0 841 720 0 841 780 0 842 780 0 842 779 0 843 779 0 843 770 0
		 844 770 0 844 769 0 845 769 0 845 808 0 846 808 0 846 758 0 847 758 0 758 848 0 848 805 0
		 805 849 0 849 764 0 764 850 0 850 763 0 763 851 0 851 774 0 774 852 0 852 773 0 773 853 0
		 853 715 0 715 854 0 854 713 0 713 855 0 855 717 0 717 856 0 856 722 0 856 726 0 857 726 0
		 857 725 0 858 725 0 858 732 0 859 732 0 859 797 0 860 797 0 860 796 0 861 796 0 861 754 0
		 862 754 0 862 755 0 863 755 0 863 740 0 864 740 0 864 741 0 865 741 0 865 750 0 866 750 0
		 750 867 0 867 751 0 868 751 0 868 794 0 794 835 0 1731 1367 0 1367 1368 0 1368 1731 0
		 1367 942 0 942 1368 0 929 1404 0 1404 1162 0 1162 929 0 1404 1161 0 1161 1162 0 1404 927 0
		 927 1163 0 1163 1404 0 927 1155 0 1155 1163 0 1723 1759 0 1759 1721 0 1721 1723 0
		 1759 1392 0 1392 1721 0 981 1054 0 1054 1021 0 1021 981 0 1054 1381 0 1381 1021 0
		 1406 1368 0 1368 1380 0 1380 1406 0 1368 1056 0 1056 1380 0 1750 1751 0 1751 1150 0
		 1150 1750 0 1751 1370 0 1370 1150 0 1752 1756 0 1756 1758 0 1758 1752 0 1756 1757 0
		 1757 1758 0 1023 1025 0 1025 1729 0 1729 1023 0 1025 1055 0 1055 1729 0 1732 876 0
		 876 1400 0 1400 1732 0 876 1406 0 1406 1400 0 1383 1022 0 1022 1054 0 1054 1383 0
		 1022 1381 0 1024 1060 0 1060 970 0 970 1024 0 1060 1730 0 1730 970 0 1383 1050 0
		 1050 1022 0 1383 1051 0 1051 1050 0 1402 1403 0 1403 1733 0 1733 1402 0 1403 871 0
		 871 1733 0 1022 962 0 962 1381 0 962 1052 0 1052 1381 0 1367 885 0 885 942 0 1367 870 0
		 870 885 0 1052 1053 0 1053 960 0 960 1052 0 1053 1380 0 1380 960 0 928 932 0 932 1159 0;
	setAttr ".ed[2490:2655]" 1159 928 0 932 929 0 929 1159 0 1114 1116 0 1116 1126 0
		 1126 1114 0 1116 1124 0 1124 1126 0 1749 1750 0 1750 1417 0 1417 1749 0 1150 1417 0
		 1151 1026 0 1026 1113 0 1113 1151 0 1026 1734 0 1734 1113 0 1736 1006 0 1006 1746 0
		 1746 1736 0 1006 982 0 982 1746 0 927 1153 0 1153 1155 0 927 1157 0 1157 1153 0 1419 1114 0
		 1114 1117 0 1117 1419 0 1157 1156 0 1156 1153 0 1156 1154 0 1154 1153 0 1760 1115 0
		 1115 1761 0 1761 1760 0 1115 1014 0 1014 1761 0 1119 1120 0 1120 1151 0 1151 1119 0
		 1120 1760 0 1760 1151 0 1760 1122 0 1122 1115 0 1120 1122 0 1051 1382 0 1382 980 0
		 980 1051 0 1382 1384 0 1384 980 0 1384 1421 0 1421 980 0 1384 1385 0 1385 1421 0
		 1164 1159 0 929 1164 0 1159 1152 0 1152 928 0 1109 1162 0 1162 1111 0 1111 1109 0
		 1161 1111 0 1105 1104 0 1104 1152 0 1152 1105 0 1104 1767 0 1767 1152 0 1152 1107 0
		 1107 1105 0 1159 1107 0 1731 1379 0 1379 1367 0 1046 1409 0 1409 1044 0 1044 1046 0
		 1409 1414 0 1414 1044 0 1393 1359 0 1359 1554 0 1554 1393 0 1359 1562 0 1562 1554 0
		 1552 1366 0 1366 1553 0 1553 1552 0 1366 1394 0 1394 1553 0 1359 1454 0 1454 1562 0
		 1359 1356 0 1356 1454 0 1552 1428 0 1428 1366 0 1428 1364 0 1364 1366 0 975 1716 0
		 1716 990 0 990 975 0 1718 1719 0 1719 988 0 988 1718 0 1719 1782 0 1782 988 0 1711 984 0
		 984 973 0 973 1711 0 1711 986 0 986 984 0 1711 1708 0 1708 986 0 1722 1391 0 1391 1726 0
		 1726 1722 0 1391 1389 0 1389 1726 0 1728 1042 0 1042 1725 0 1725 1728 0 1042 1779 0
		 1779 1725 0 1728 1726 0 1726 1042 0 973 1712 0 1712 1711 0 973 987 0 987 1712 0 1708 1713 0
		 1713 986 0 1713 985 0 985 986 0 1713 1709 0 1709 985 0 1709 975 0 975 985 0 1716 1717 0
		 1717 990 0 1717 991 0 991 990 0 1719 1720 0 1720 1782 0 1720 1781 0 1781 1782 0 1039 1771 0
		 1771 1043 0 1043 1039 0 1771 1772 0 1772 1043 0 1101 1704 0 1704 1706 0 1706 1101 0
		 1233 1703 0 1703 1705 0 1705 1233 0 1389 1388 0 1388 1042 0 1042 1389 0 1388 1036 0
		 1036 1042 0 1722 1721 0 1721 1391 0 1392 1391 0 1727 1715 0 1715 971 0 971 1727 0
		 1715 1027 0;
	setAttr ".ed[2656:2821]" 1027 971 0 1715 967 0 967 1027 0 1715 1714 0 1714 967 0
		 1710 987 0 987 1714 0 1714 1710 0 987 967 0 1280 1699 0 1699 1697 0 1697 1280 0 1696 1318 0
		 1318 1349 0 1349 1696 0 1318 1260 0 1260 1349 0 1697 1698 0 1698 1349 0 1349 1697 0
		 907 886 0 886 915 0 915 907 0 886 914 0 914 915 0 958 1157 0 1157 924 0 924 958 0
		 927 924 0 1021 960 0 960 1058 0 1058 1021 0 960 1057 0 1057 1058 0 1772 1040 0 1040 1043 0
		 1772 1773 0 1773 1040 0 1385 1420 0 1420 1421 0 1385 1386 0 1386 1420 0 1424 1388 0
		 1388 1423 0 1423 1424 0 1389 1423 0 1029 977 0 977 1032 0 1032 1029 0 977 1001 0
		 1001 1032 0 1000 1041 0 1041 968 0 968 1000 0 1041 1031 0 1031 968 0 1016 1047 0
		 1047 983 0 983 1016 0 1047 1045 0 1045 983 0 1398 1399 0 1399 875 0 875 1398 0 1399 926 0
		 926 875 0 1403 1395 0 1395 871 0 1395 922 0 922 871 0 901 902 0 902 872 0 872 901 0
		 902 882 0 882 872 0 928 931 0 931 932 0 928 877 0 877 931 0 1137 1119 0 1119 1136 0
		 1136 1137 0 1119 1118 0 1118 1136 0 1108 1147 0 1147 1112 0 1112 1108 0 1147 1148 0
		 1148 1112 0 1159 1110 0 1110 1107 0 1164 1110 0 1076 1180 0 1180 1065 0 1065 1076 0
		 1180 1182 0 1182 1065 0 1071 1084 0 1084 1203 0 1203 1071 0 1084 1205 0 1205 1203 0
		 1212 1211 0 1211 1079 0 1079 1212 0 1211 1173 0 1173 1079 0 1218 1215 0 1215 1180 0
		 1180 1218 0 1215 1077 0 1077 1180 0 1189 1224 0 1224 1074 0 1074 1189 0 1224 1221 0
		 1221 1074 0 1232 1204 0 1204 1230 0 1230 1232 0 1204 1095 0 1095 1230 0 1388 1387 0
		 1387 1036 0 1387 1038 0 1038 1036 0 1256 1245 0 1245 1294 0 1294 1256 0 1245 1293 0
		 1293 1294 0 1251 1313 0 1313 1240 0 1240 1251 0 1313 1311 0 1311 1240 0 1327 1289 0
		 1289 1326 0 1326 1327 0 1289 1261 0 1261 1326 0 1333 1255 0 1255 1334 0 1334 1333 0
		 1255 1296 0 1296 1334 0 1252 1305 0 1305 1339 0 1339 1252 0 1305 1340 0 1340 1339 0
		 1276 1316 0 1316 1275 0 1275 1276 0 1316 1315 0 1315 1275 0 1413 955 0 955 1411 0
		 1411 1413 0 955 953 0 953 1411 0 1273 1320 0 1320 1455 0 1455 1273 0 1320 1427 0
		 1427 1455 0;
	setAttr ".ed[2822:2987]" 1512 1265 0 1265 1515 0 1515 1512 0 1265 1304 0 1304 1515 0
		 1304 1511 0 1511 1515 0 1461 1285 0 1285 1456 0 1456 1461 0 1285 1272 0 1272 1456 0
		 1196 1537 0 1537 1080 0 1080 1196 0 1537 1530 0 1530 1080 0 1179 1089 0 1089 1497 0
		 1497 1179 0 1089 1495 0 1495 1497 0 1357 1358 0 1358 1449 0 1449 1357 0 1358 1430 0
		 1430 1449 0 1467 1464 0 1464 1468 0 1468 1467 0 1464 1465 0 1465 1468 0 1505 1509 0
		 1509 1506 0 1506 1505 0 1509 1510 0 1510 1506 0 1445 1451 0 1451 1446 0 1446 1445 0
		 1451 1452 0 1452 1446 0 1494 1493 0 1493 1476 0 1476 1494 0 1493 1473 0 1473 1476 0
		 1432 1434 0 1434 1435 0 1435 1432 0 1434 1436 0 1436 1435 0 1067 1174 0 1174 1594 0
		 1594 1067 0 1174 1583 0 1583 1594 0 1061 1192 0 1192 1637 0 1637 1061 0 1192 1639 0
		 1639 1637 0 1247 1564 0 1564 1287 0 1287 1247 0 1564 1570 0 1570 1287 0 1615 1242 0
		 1242 1618 0 1618 1615 0 1242 1307 0 1307 1618 0 1486 1498 0 1498 1600 0 1600 1486 0
		 1498 1597 0 1597 1600 0 1600 1596 0 1596 1486 0 1596 1490 0 1490 1486 0 1605 1504 0
		 1504 1607 0 1607 1605 0 1504 1500 0 1500 1607 0 1605 1514 0 1514 1504 0 1605 1608 0
		 1608 1514 0 1480 1587 0 1587 1476 0 1476 1480 0 1587 1591 0 1591 1476 0 1480 1573 0
		 1573 1587 0 1480 1475 0 1475 1573 0 1552 1458 0 1458 1428 0 1552 1548 0 1548 1458 0
		 1609 1601 0 1601 1598 0 1598 1609 0 1601 1602 0 1602 1598 0 1634 1635 0 1635 1630 0
		 1630 1634 0 1635 1631 0 1631 1630 0 1590 1591 0 1591 1585 0 1585 1590 0 1587 1585 0
		 1545 1551 0 1551 1553 0 1553 1545 0 1551 1552 0 1688 1693 0 1693 1409 0 1409 1688 0
		 1693 1414 0 1724 1720 0 1720 1653 0 1653 1724 0 1720 1654 0 1654 1653 0 1708 1661 0
		 1661 1713 0 1661 1660 0 1660 1713 0 1669 1703 0 1703 1670 0 1670 1669 0 1703 1695 0
		 1695 1670 0 911 912 0 912 870 0 870 911 0 912 885 0 944 949 0 949 891 0 891 944 0
		 949 948 0 948 891 0 938 961 0 961 955 0 955 938 0 961 934 0 934 955 0 997 1043 0
		 1043 976 0 976 997 0 1040 976 0 1418 1391 0 1391 1419 0 1419 1418 0 1392 1419 0 958 1012 0
		 1012 1157 0 1012 1156 0 958 1013 0 1013 1012 0;
	setAttr ".ed[2988:3153]" 958 965 0 965 1013 0 959 1007 0 1007 963 0 963 959 0
		 1007 1009 0 1009 963 0 985 879 0 879 986 0 879 898 0 898 986 0 1405 1399 0 1399 924 0
		 924 1405 0 1399 925 0 925 924 0 951 930 0 930 950 0 950 951 0 930 889 0 889 950 0
		 1020 987 0 987 1015 0 1015 1020 0 973 1015 0 1733 940 0 940 1402 0 940 1401 0 1401 1402 0
		 905 897 0 897 904 0 904 905 0 897 879 0 879 904 0 1134 1135 0 1135 1104 0 1104 1134 0
		 1135 1103 0 1103 1104 0 1108 1146 0 1146 1147 0 1108 1102 0 1102 1146 0 1154 1117 0
		 1117 1123 0 1123 1154 0 1117 1127 0 1127 1123 0 1106 1161 0 1161 1112 0 1112 1106 0
		 1161 1163 0 1163 1112 0 1377 1376 0 1376 910 0 910 1377 0 1376 872 0 872 910 0 1178 1078 0
		 1078 1177 0 1177 1178 0 1078 1067 0 1067 1177 0 1212 1172 0 1172 1211 0 1212 1091 0
		 1091 1172 0 1218 1089 0 1089 1215 0 1218 1181 0 1181 1089 0 1224 1190 0 1190 1221 0
		 1190 1086 0 1086 1221 0 1101 1231 0 1231 1704 0 1231 1233 0 1233 1704 0 943 916 0
		 916 1056 0 1056 943 0 916 1057 0 1057 1056 0 1054 1025 0 1025 1383 0 1054 1055 0
		 1385 1035 0 1035 1386 0 1035 1033 0 1033 1386 0 1257 1246 0 1246 1292 0 1292 1257 0
		 1246 1290 0 1290 1292 0 1310 1251 0 1251 1308 0 1308 1310 0 1240 1308 0 1326 1271 0
		 1271 1327 0 1271 1288 0 1288 1327 0 1334 1297 0 1297 1333 0 1297 1267 0 1267 1333 0
		 1340 1264 0 1264 1339 0 1340 1306 0 1306 1264 0 1314 1274 0 1274 1344 0 1344 1314 0
		 1274 1346 0 1346 1344 0 1280 1350 0 1350 1699 0 1350 1700 0 1700 1699 0 1438 1318 0
		 1318 1429 0 1429 1438 0 1318 1238 0 1238 1429 0 1266 1511 0 1304 1266 0 1471 1271 0
		 1271 1461 0 1461 1471 0 1271 1285 0 1442 1099 0 1099 1445 0 1445 1442 0 1099 1198 0
		 1198 1445 0 1090 1179 0 1179 1483 0 1483 1090 0 1497 1483 0 1452 1355 0 1355 1446 0
		 1356 1355 0 1355 1454 0 1452 1454 0 1463 1467 0 1467 1466 0 1466 1463 0 1468 1466 0
		 1509 1539 0 1539 1510 0 1539 1542 0 1542 1510 0 1441 1443 0 1443 1448 0 1448 1441 0
		 1443 1449 0 1449 1448 0 1494 1491 0 1491 1493 0 1494 1492 0 1492 1491 0 1527 1520 0
		 1520 1528 0 1528 1527 0;
	setAttr ".ed[3154:3319]" 1520 1521 0 1521 1528 0 1174 1068 0 1068 1583 0 1068 1575 0
		 1575 1583 0 1192 1636 0 1636 1639 0 1192 1062 0 1062 1636 0 1570 1248 0 1248 1287 0
		 1570 1563 0 1563 1248 0 1307 1629 0 1629 1618 0 1307 1241 0 1241 1629 0 1602 1508 0
		 1508 1598 0 1602 1496 0 1496 1508 0 1508 1506 0 1506 1598 0 1506 1613 0 1613 1598 0
		 1492 1593 0 1593 1502 0 1502 1492 0 1593 1589 0 1589 1502 0 1492 1588 0 1588 1593 0
		 1494 1588 0 1494 1591 0 1591 1588 0 1601 1595 0 1595 1602 0 1595 1597 0 1597 1602 0
		 1627 1628 0 1628 1634 0 1634 1627 0 1628 1635 0 1586 1588 0 1588 1590 0 1590 1586 0
		 1551 1546 0 1546 1552 0 1546 1548 0 1703 1202 0 1202 1695 0 1202 1238 0 1238 1695 0
		 1350 1415 0 1415 1700 0 1415 1694 0 1694 1700 0 1409 1408 0 1408 1688 0 1408 1687 0
		 1687 1688 0 1718 1655 0 1655 1719 0 1718 1656 0 1656 1655 0 1719 1654 0 1655 1654 0
		 1704 1667 0 1667 1706 0 1667 1666 0 1666 1706 0 925 958 0 925 965 0 947 949 0 949 875 0
		 875 947 0 949 923 0 923 875 0 980 1010 0 1010 1051 0 1010 1050 0 886 908 0 908 995 0
		 995 886 0 908 996 0 996 995 0 1027 1028 0 1028 971 0 1028 1026 0 1026 971 0 893 1010 0
		 1010 964 0 964 893 0 1010 1011 0 1011 964 0 993 904 0 904 985 0 985 993 0 1397 1398 0
		 1398 923 0 923 1397 0 905 903 0 903 902 0 902 905 0 903 882 0 896 880 0 880 899 0
		 899 896 0 880 895 0 895 899 0 1107 1133 0 1133 1105 0 1107 1132 0 1132 1133 0 1145 1146 0
		 1146 1123 0 1123 1145 0 1102 1123 0 1153 1102 0 1102 1155 0 1108 1155 0 1116 1390 0
		 1390 1124 0 1390 1125 0 1125 1124 0 1009 1422 0 1422 1008 0 1008 1009 0 1422 1424 0
		 1424 1008 0 1106 1111 0 937 1371 0 1371 1770 0 1770 937 0 1371 1769 0 1769 1770 0
		 1078 1176 0 1176 1067 0 1176 1174 0 1061 1072 0 1072 1192 0 1072 1194 0 1194 1192 0
		 1210 1211 0 1211 1092 0 1092 1210 0 1172 1092 0 1218 1217 0 1217 1181 0 1217 1088 0
		 1088 1181 0 1223 1085 0 1085 1224 0 1224 1223 0 1085 1190 0 1095 1228 0 1228 1230 0
		 1095 1198 0 1198 1228 0 1384 1023 0 1023 1385 0 1023 1035 0 917 919 0 919 1396 0
		 1396 917 0;
	setAttr ".ed[3320:3485]" 919 1397 0 1397 1396 0 1258 1247 0 1247 1289 0 1289 1258 0
		 1287 1289 0 1305 1307 0 1307 1253 0 1253 1305 0 1242 1253 0 1326 1285 0 1326 1325 0
		 1325 1285 0 1330 1269 0 1269 1332 0 1332 1330 0 1269 1295 0 1295 1332 0 1335 1266 0
		 1266 1338 0 1338 1335 0 1304 1338 0 1344 1345 0 1345 1314 0 1345 1278 0 1278 1314 0
		 1237 1343 0 1343 1235 0 1235 1237 0 1343 1312 0 1312 1235 0 1407 1410 0 1410 938 0
		 938 1407 0 1410 1047 0 1047 938 0 1312 1518 0 1518 1235 0 1312 1527 0 1527 1518 0
		 1523 1306 0 1306 1512 0 1512 1523 0 1306 1265 0 1472 1270 0 1270 1477 0 1477 1472 0
		 1270 1288 0 1288 1477 0 1201 1099 0 1099 1447 0 1447 1201 0 1442 1447 0 1181 1495 0
		 1181 1507 0 1507 1495 0 1450 1444 0 1444 1353 0 1353 1450 0 1444 1354 0 1354 1353 0
		 1428 1363 0 1363 1364 0 1428 1426 0 1426 1363 0 1507 1505 0 1505 1508 0 1508 1507 0
		 1441 1447 0 1447 1443 0 1447 1450 0 1450 1443 0 1472 1475 0 1475 1479 0 1479 1472 0
		 1480 1479 0 1519 1522 0 1522 1525 0 1525 1519 0 1522 1526 0 1526 1525 0 1451 1453 0
		 1453 1452 0 1453 1454 0 1171 1069 0 1069 1581 0 1581 1171 0 1069 1574 0 1574 1581 0
		 1062 1191 0 1191 1636 0 1191 1626 0 1626 1636 0 1249 1284 0 1284 1547 0 1547 1249 0
		 1284 1568 0 1568 1547 0 1617 1302 0 1302 1615 0 1615 1617 0 1302 1242 0 1611 1613 0
		 1613 1510 0 1510 1611 0 1542 1611 0 1542 1614 0 1614 1611 0 1468 1557 0 1557 1466 0
		 1468 1560 0 1560 1557 0 1589 1500 0 1500 1502 0 1589 1607 0 1599 1594 0 1594 1600 0
		 1600 1599 0 1594 1596 0 1641 1637 0 1637 1642 0 1642 1641 0 1637 1638 0 1638 1642 0
		 1603 1589 0 1589 1592 0 1592 1603 0 1593 1592 0 1558 1554 0 1554 1561 0 1561 1558 0
		 1562 1561 0 1764 1765 0 1765 1412 0 1412 1764 0 1765 1692 0 1692 1412 0 1658 1657 0
		 1657 1716 0 1716 1658 0 1657 1717 0 1725 1651 0 1651 1728 0 1725 1652 0 1652 1651 0
		 1693 1676 0 1676 1743 0 1743 1693 0 1676 1742 0 1742 1743 0 1666 1707 0 1707 1706 0
		 1666 1684 0 1684 1707 0 925 918 0 918 965 0 918 957 0 957 965 0 949 890 0 890 923 0
		 944 890 0 955 894 0 894 953 0 934 894 0 969 1039 0 1039 997 0;
	setAttr ".ed[3486:3651]" 997 969 0 1041 1774 0 1774 1031 0 1774 1730 0 1730 1031 0
		 1020 1018 0 1018 1019 0 1019 1020 0 1018 982 0 982 1019 0 1004 1030 0 1030 873 0
		 873 1004 0 1030 916 0 916 873 0 1011 959 0 959 964 0 1011 1007 0 969 989 0 989 988 0
		 988 969 0 989 991 0 991 988 0 926 888 0 888 951 0 951 926 0 888 930 0 943 942 0 942 913 0
		 913 943 0 885 913 0 897 883 0 883 899 0 899 897 0 883 896 0 895 898 0 898 899 0 895 956 0
		 956 898 0 1133 1104 0 1133 1134 0 1102 1154 0 1007 1420 0 1420 1009 0 1420 1422 0
		 1378 1377 0 1377 884 0 884 1378 0 910 884 0 1077 1178 0 1178 1066 0 1066 1077 0 1177 1066 0
		 1195 1197 0 1197 1061 0 1061 1195 0 1197 1072 0 1210 1173 0 1210 1082 0 1082 1173 0
		 1076 1218 0 1076 1217 0 1073 1223 0 1223 1189 0 1189 1073 0 945 891 0 891 1379 0
		 1379 945 0 891 1378 0 1378 1379 0 948 1378 0 948 1377 0 1290 1258 0 1258 1292 0 1290 1247 0
		 1252 1310 0 1310 1241 0 1241 1252 0 1308 1241 0 1261 1325 0 1261 1286 0 1286 1325 0
		 1332 1294 0 1294 1330 0 1294 1257 0 1257 1330 0 1254 1335 0 1335 1303 0 1303 1254 0
		 1338 1303 0 1279 1280 0 1280 1345 0 1345 1279 0 1280 1347 0 1347 1345 0 1237 1313 0
		 1313 1343 0 1237 1236 0 1236 1313 0 1409 1045 0 1045 1408 0 1046 1045 0 1438 1260 0
		 1438 1431 0 1431 1260 0 1306 1519 0 1519 1264 0 1523 1519 0 1288 1471 0 1471 1477 0
		 1198 1451 0 1095 1451 0 1088 1507 0 1088 1505 0 1444 1446 0 1446 1354 0 1355 1354 0
		 1507 1496 0 1496 1495 0 1442 1450 0 1442 1444 0 1480 1473 0 1473 1479 0 1520 1525 0
		 1525 1521 0 1526 1521 0 1453 1463 0 1463 1454 0 1466 1454 0 1068 1171 0 1171 1575 0
		 1581 1575 0 1191 1063 0 1063 1626 0 1063 1623 0 1623 1626 0 1284 1563 0 1563 1568 0
		 1284 1248 0 1617 1243 0 1243 1302 0 1617 1604 0 1604 1243 0 1597 1496 0 1498 1496 0
		 1628 1642 0 1642 1517 0 1517 1628 0 1642 1538 0 1538 1517 0 1466 1562 0 1557 1562 0
		 1595 1599 0 1599 1597 0 1627 1641 0 1641 1628 0 1593 1586 0 1586 1592 0 1562 1555 0
		 1555 1561 0 1557 1555 0 1408 1410 0 1410 1687 0 1410 1686 0 1686 1687 0 1718 1717 0;
	setAttr ".ed[3652:3817]" 1717 1656 0 1657 1656 0 1725 1724 0 1724 1652 0 1653 1652 0
		 1665 1747 0 1747 1702 0 1702 1665 0 1747 1748 0 1748 1702 0 1702 1684 0 1684 1665 0
		 1702 1707 0 884 887 0 887 911 0 911 884 0 887 912 0 1059 1029 0 1029 1060 0 1060 1059 0
		 1032 1060 0 962 939 0 939 1052 0 939 1053 0 994 978 0 978 996 0 996 994 0 978 995 0
		 1004 1005 0 1005 977 0 977 1004 0 1005 1002 0 1002 977 0 1006 1028 0 1028 982 0 1028 1019 0
		 1027 1019 0 967 1019 0 993 990 0 990 992 0 992 993 0 990 974 0 974 992 0 894 936 0
		 936 953 0 936 954 0 954 953 0 929 888 0 888 1404 0 888 1405 0 1405 1404 0 932 930 0
		 930 929 0 904 874 0 874 905 0 874 903 0 1110 1131 0 1131 1107 0 1131 1132 0 1383 1382 0
		 1025 1382 0 1424 1013 0 1013 1008 0 1423 1013 0 1176 1079 0 1079 1174 0 1079 1068 0
		 1073 1062 0 1062 1194 0 1194 1073 0 1210 1209 0 1209 1082 0 1209 1170 0 1170 1082 0
		 1216 1214 0 1214 1178 0 1178 1216 0 1214 1078 0 1075 1187 0 1187 1219 0 1219 1075 0
		 1187 1222 0 1222 1219 0 1227 1197 0 1197 1237 0 1237 1227 0 1197 1236 0 1372 1371 0
		 1371 869 0 869 1372 0 937 869 0 1287 1261 0 1248 1261 0 1305 1241 0 1324 1325 0 1325 1262 0
		 1262 1324 0 1286 1262 0 1331 1256 0 1256 1332 0 1332 1331 0 1337 1253 0 1253 1338 0
		 1338 1337 0 1253 1303 0 1251 1343 0 1251 1342 0 1342 1343 0 1313 1234 0 1234 1311 0
		 1236 1234 0 1408 1047 0 1277 1149 0 1149 1350 0 1350 1277 0 1149 1415 0 1309 1264 0
		 1264 1525 0 1525 1309 0 1479 1291 0 1291 1472 0 1291 1270 0 1081 1201 0 1201 1441 0
		 1441 1081 0 1185 1087 0 1087 1509 0 1509 1185 0 1087 1539 0 1353 1352 0 1352 1450 0
		 1352 1443 0 1360 1433 0 1433 1365 0 1365 1360 0 1433 1439 0 1439 1365 0 1497 1486 0
		 1486 1483 0 1497 1498 0 1445 1444 0 1477 1478 0 1478 1472 0 1478 1475 0 1512 1513 0
		 1513 1523 0 1513 1524 0 1524 1523 0 1427 1428 0 1428 1455 0 1458 1455 0 1069 1168 0
		 1168 1574 0 1168 1579 0 1579 1574 0 1186 1064 0 1064 1625 0 1625 1186 0 1064 1610 0
		 1610 1625 0 1299 1606 0 1606 1244 0 1244 1299 0 1606 1603 0 1603 1244 0 1753 1754 0;
	setAttr ".ed[3818:3983]" 1754 1135 0 1135 1753 0 1754 1103 0 1465 1560 0 1465 1576 0
		 1576 1560 0 1635 1528 0 1528 1631 0 1521 1631 0 1517 1635 0 1517 1528 0 1583 1596 0
		 1583 1584 0 1584 1596 0 1639 1638 0 1639 1640 0 1640 1638 0 1606 1607 0 1607 1603 0
		 1546 1549 0 1549 1548 0 1549 1550 0 1550 1548 0 1411 1412 0 1412 1691 0 1691 1411 0
		 1692 1691 0 1716 1709 0 1709 1658 0 1709 1659 0 1659 1658 0 1728 1650 0 1650 1726 0
		 1651 1650 0 1690 1691 0 1691 1681 0 1681 1690 0 1691 1682 0 1682 1681 0 1675 1685 0
		 1685 1694 0 1694 1675 0 1685 1700 0 884 906 0 906 887 0 910 906 0 1732 945 0 945 876 0
		 974 994 0 994 992 0 996 992 0 1005 995 0 995 1002 0 978 1002 0 1420 1387 0 1387 1422 0
		 1386 1387 0 1734 1738 0 1738 1113 0 1734 1737 0 1737 1738 0 992 874 0 874 993 0 936 1762 0
		 1762 954 0 1762 1763 0 1763 954 0 932 889 0 931 889 0 910 882 0 882 906 0 879 899 0
		 1375 950 0 950 1374 0 1374 1375 0 889 1374 0 1109 1130 0 1130 1110 0 1110 1109 0
		 1130 1131 0 1127 1145 0 1127 1144 0 1144 1145 0 1012 1418 0 1418 1156 0 1419 1156 0
		 1103 1767 0 1103 1160 0 1160 1767 0 1173 1068 0 1173 1171 0 1074 1191 0 1191 1189 0
		 1074 1063 0 1092 1169 0 1169 1210 0 1169 1209 0 1216 1090 0 1090 1214 0 1216 1179 0
		 1222 1087 0 1087 1219 0 1222 1188 0 1188 1087 0 1198 1229 0 1229 1228 0 1099 1229 0
		 1196 1227 0 1227 1235 0 1235 1196 0 1376 901 0 1376 1375 0 1375 901 0 1261 1284 0
		 1284 1286 0 1303 1302 0 1302 1254 0 1243 1254 0 1325 1272 0 1324 1272 0 1295 1331 0
		 1295 1268 0 1268 1331 0 1265 1337 0 1337 1304 0 1342 1312 0 1342 1259 0 1259 1312 0
		 1763 1412 0 1412 954 0 1763 1764 0 1150 1098 0 1098 1417 0 1098 1239 0 1239 1417 0
		 1259 1309 0 1309 1520 0 1520 1259 0 1473 1269 0 1269 1479 0 1269 1291 0 1095 1453 0
		 1204 1453 0 1088 1185 0 1185 1505 0 1166 1093 0 1093 1467 0 1467 1166 0 1093 1464 0
		 1439 1358 0 1358 1365 0 1439 1430 0 1495 1498 0 1537 1538 0 1538 1530 0 1538 1531 0
		 1531 1530 0 1471 1474 0 1474 1477 0 1474 1478 0 1523 1522 0 1524 1522 0 1425 1426 0
		 1426 1427 0 1427 1425 0 1070 1556 0;
	setAttr ".ed[3984:4149]" 1556 1168 0 1168 1070 0 1556 1579 0 1063 1186 0 1186 1623 0
		 1625 1623 0 1299 1604 0 1604 1606 0 1299 1243 0 1097 1558 0 1558 1203 0 1203 1097 0
		 1561 1203 0 1544 1541 0 1541 1624 0 1624 1544 0 1541 1622 0 1622 1624 0 1624 1614 0
		 1614 1544 0 1542 1544 0 1465 1470 0 1470 1576 0 1470 1580 0 1580 1576 0 1521 1633 0
		 1633 1631 0 1526 1633 0 1548 1460 0 1460 1458 0 1550 1460 0 1575 1584 0 1575 1578 0
		 1578 1584 0 1636 1640 0 1636 1621 0 1621 1640 0 1604 1605 0 1605 1606 0 1549 1547 0
		 1547 1550 0 1547 1565 0 1565 1550 0 1231 1081 0 1081 1233 0 1231 1201 0 1691 1413 0
		 1690 1413 0 1660 1709 0 1660 1659 0 1715 1644 0 1644 1714 0 1715 1645 0 1645 1644 0
		 1689 1690 0 1690 1680 0 1680 1689 0 1681 1680 0 1672 1671 0 1671 1698 0 1698 1672 0
		 1671 1696 0 1696 1698 0 992 908 0 908 874 0 886 1005 0 1005 914 0 965 1008 0 957 1008 0
		 984 956 0 956 1017 0 1017 984 0 956 966 0 966 1017 0 1777 979 0 979 1776 0 1776 1777 0
		 979 1037 0 1037 1776 0 974 999 0 999 994 0 974 989 0 989 999 0 1048 1050 0 1050 893 0
		 893 1048 0 895 935 0 935 956 0 935 966 0 880 869 0 869 933 0 933 880 0 937 933 0
		 900 896 0 896 881 0 881 900 0 883 881 0 1111 1130 0 1111 1129 0 1129 1130 0 1127 1121 0
		 1121 1144 0 1121 1143 0 1143 1144 0 1012 1423 0 1423 1418 0 919 918 0 918 1397 0
		 918 1398 0 1082 1171 0 1082 1069 0 1189 1062 0 1208 1083 0 1083 1209 0 1209 1208 0
		 1083 1170 0 1215 1216 0 1216 1077 0 1187 1074 0 1074 1222 0 1221 1222 0 1227 1072 0
		 1227 1226 0 1226 1072 0 1197 1234 0 1195 1234 0 1022 1048 0 1048 962 0 1767 941 0
		 941 1152 0 1767 1768 0 1768 941 0 1286 1249 0 1249 1262 0 1242 1303 0 1322 1324 0
		 1324 1283 0 1283 1322 0 1262 1283 0 1257 1329 0 1329 1330 0 1292 1329 0 1333 1300 0
		 1300 1255 0 1333 1336 0 1336 1300 0 1310 1342 0 1310 1341 0 1341 1342 0 1347 1278 0
		 1347 1317 0 1317 1278 0 1768 1769 0 1769 941 0 1371 941 0 1259 1527 0 1491 1268 0
		 1268 1493 0 1295 1493 0 1094 1463 0 1463 1204 0 1204 1094 0 1086 1543 0 1543 1188 0
		 1188 1086 0 1543 1539 0;
	setAttr ".ed[4150:4315]" 1539 1188 0 1086 1540 0 1540 1543 0 1093 1169 0 1169 1464 0
		 1169 1469 0 1469 1464 0 1436 1363 0 1426 1436 0 1489 1483 0 1483 1490 0 1490 1489 0
		 1531 1535 0 1535 1530 0 1531 1536 0 1536 1535 0 1461 1462 0 1462 1471 0 1462 1474 0
		 1511 1514 0 1514 1515 0 1514 1516 0 1516 1515 0 1429 1439 0 1439 1438 0 1429 1430 0
		 1165 1559 0 1559 1070 0 1070 1165 0 1559 1556 0 1183 1065 0 1065 1612 0 1612 1183 0
		 1065 1609 0 1609 1612 0 1319 1250 0 1250 1551 0 1551 1319 0 1250 1546 0 1298 1592 0
		 1592 1245 0 1245 1298 0 1586 1245 0 1470 1484 0 1484 1577 0 1577 1470 0 1484 1582 0
		 1582 1577 0 1577 1580 0 1526 1619 0 1619 1633 0 1522 1619 0 1550 1457 0 1457 1460 0
		 1565 1457 0 1581 1578 0 1581 1582 0 1582 1578 0 1626 1621 0 1626 1622 0 1622 1621 0
		 1617 1608 0 1608 1604 0 1568 1565 0 1568 1569 0 1569 1565 0 991 1718 0 1748 1749 0
		 1749 1702 0 1417 1702 0 1687 1678 0 1678 1688 0 1678 1677 0 1677 1688 0 1643 1710 0
		 1710 1644 0 1644 1643 0 1679 1686 0 1686 1680 0 1680 1679 0 1686 1689 0 1697 1672 0
		 1697 1673 0 1673 1672 0 903 906 0 903 909 0 909 906 0 873 913 0 913 914 0 914 873 0
		 913 915 0 933 935 0 935 880 0 1058 1030 0 1030 1059 0 1059 1058 0 1030 1029 0 991 974 0
		 1003 998 0 998 1000 0 1000 1003 0 998 976 0 976 1000 0 1390 1115 0 1115 1125 0 1122 1125 0
		 973 1017 0 1017 1015 0 1778 1729 0 1729 1034 0 1034 1778 0 1729 970 0 970 1034 0
		 873 1005 0 926 947 0 951 947 0 959 921 0 921 964 0 959 917 0 917 921 0 1122 1140 0
		 1140 1125 0 1122 1139 0 1139 1140 0 1405 927 0 1395 1396 0 1396 922 0 1396 890 0
		 890 922 0 941 928 0 941 877 0 1167 1165 0 1165 1083 0 1083 1167 0 1070 1083 0 1184 1076 0
		 1076 1183 0 1183 1184 0 1208 1093 0 1093 1206 0 1206 1208 0 1166 1206 0 1213 1214 0
		 1214 1175 0 1175 1213 0 1090 1175 0 1217 1220 0 1220 1088 0 1220 1185 0 1226 1080 0
		 1080 1225 0 1225 1226 0 1080 1193 0 1193 1225 0 1084 1207 0 1207 1205 0 1207 1232 0
		 1232 1205 0 1296 1298 0 1298 1256 0 1256 1296 0 1322 1323 0 1323 1282 0 1282 1322 0
		 1323 1273 0 1273 1282 0;
	setAttr ".ed[4316:4481]" 1328 1270 0 1270 1329 0 1329 1328 0 1291 1329 0 1336 1301 0
		 1301 1335 0 1335 1336 0 1301 1266 0 1341 1339 0 1339 1309 0 1309 1341 0 1316 1351 0
		 1351 1277 0 1277 1316 0 1351 1149 0 1317 1437 0 1437 1278 0 1437 1432 0 1432 1278 0
		 1491 1297 0 1297 1268 0 1491 1501 0 1501 1297 0 1196 1518 0 1518 1537 0 1190 1540 0
		 1190 1533 0 1533 1540 0 1091 1487 0 1487 1172 0 1091 1482 0 1482 1487 0 1361 1440 0
		 1440 1360 0 1360 1361 0 1440 1433 0 1481 1487 0 1487 1484 0 1484 1481 0 1487 1488 0
		 1488 1484 0 1529 1532 0 1532 1533 0 1533 1529 0 1532 1534 0 1534 1533 0 1458 1459 0
		 1459 1455 0 1460 1459 0 1503 1504 0 1504 1511 0 1511 1503 0 1438 1433 0 1433 1431 0
		 1755 1160 0 1160 1754 0 1754 1755 0 1182 1609 0 1182 1601 0 1071 1555 0 1555 1165 0
		 1165 1071 0 1555 1559 0 1590 1293 0 1293 1586 0 1630 1240 0 1240 1634 0 1311 1634 0
		 1621 1536 0 1536 1640 0 1621 1532 0 1532 1536 0 1485 1490 0 1490 1584 0 1584 1485 0
		 1578 1485 0 1578 1488 0 1488 1485 0 1608 1516 0 1608 1616 0 1616 1516 0 1474 1571 0
		 1571 1478 0 1571 1567 0 1567 1478 0 1474 1566 0 1566 1571 0 1462 1566 0 1556 1576 0
		 1576 1579 0 1580 1579 0 1610 1614 0 1614 1625 0 1610 1611 0 1629 1619 0 1619 1618 0
		 1619 1620 0 1620 1618 0 1564 1567 0 1567 1570 0 1571 1570 0 1707 1239 0 1239 1706 0
		 1239 1101 0 1648 1647 0 1647 1721 0 1721 1648 0 1647 1723 0 1663 1712 0 1712 1643 0
		 1643 1663 0 1712 1710 0 1685 1674 0 1674 1700 0 1674 1699 0 908 903 0 908 909 0 885 915 0
		 912 915 0 934 933 0 933 894 0 934 935 0 1021 1059 0 1059 981 0 1044 1018 0 1018 1046 0
		 1044 982 0 978 1003 0 1003 1002 0 978 998 0 983 1015 0 1015 1016 0 1017 1016 0 1034 1777 0
		 1777 1778 0 1034 979 0 1009 957 0 957 963 0 898 984 0 951 878 0 878 947 0 950 878 0
		 1059 1024 0 1024 981 0 937 936 0 936 933 0 964 920 0 920 893 0 921 920 0 883 901 0
		 901 881 0 883 902 0 939 1401 0 1401 1053 0 1401 1400 0 1400 1053 0 1121 1114 0 1126 1121 0
		 1120 1139 0 1120 1138 0 1138 1139 0 931 1373 0 1373 889 0 1373 1374 0 980 1011 0
		 1421 1011 0;
	setAttr ".ed[4482:4647]" 1071 1167 0 1167 1084 0 1075 1184 0 1184 1064 0 1064 1075 0
		 1183 1064 0 1084 1206 0 1206 1207 0 1167 1206 0 1213 1212 0 1212 1176 0 1176 1213 0
		 1075 1220 0 1220 1184 0 1219 1220 0 1194 1225 0 1225 1073 0 1225 1223 0 1207 1094 0
		 1094 1232 0 870 1379 0 1379 911 0 1255 1244 0 1244 1296 0 1244 1298 0 1328 1258 0
		 1258 1327 0 1327 1328 0 1296 1331 0 1331 1334 0 1253 1340 0 1337 1340 0 1348 1346 0
		 1346 1320 0 1320 1348 0 1274 1320 0 953 1412 0 1431 1317 0 1317 1260 0 1431 1437 0
		 1301 1503 0 1503 1266 0 1273 1459 0 1459 1282 0 1193 1535 0 1535 1085 0 1085 1193 0
		 1535 1529 0 1529 1085 0 1091 1175 0 1175 1482 0 1175 1489 0 1489 1482 0 1467 1094 0
		 1094 1166 0 1469 1481 0 1481 1470 0 1470 1469 0 1543 1542 0 1543 1544 0 1429 1449 0
		 1429 1448 0 1492 1501 0 1502 1501 0 1437 1440 0 1440 1432 0 1440 1434 0 1738 1739 0
		 1739 1113 0 1739 1118 0 1118 1113 0 1067 1599 0 1599 1177 0 1195 1627 0 1627 1234 0
		 1195 1641 0 1246 1585 0 1585 1290 0 1585 1572 0 1572 1290 0 1632 1308 0 1308 1630 0
		 1630 1632 0 1640 1531 0 1531 1638 0 1616 1513 0 1513 1516 0 1616 1620 0 1620 1513 0
		 1567 1475 0 1567 1573 0 1559 1560 0 1560 1556 0 1610 1612 0 1612 1611 0 1612 1613 0
		 1632 1633 0 1633 1629 0 1629 1632 0 1572 1573 0 1573 1564 0 1564 1572 0 1407 1686 0
		 1407 1689 0 1722 1648 0 1722 1649 0 1649 1648 0 1662 1711 0 1711 1663 0 1663 1662 0
		 1669 1705 0 1669 1668 0 1668 1705 0 909 887 0 909 907 0 907 887 0 873 943 0 975 993 0
		 1001 1003 0 1003 968 0 968 1001 0 1125 1141 0 1141 1124 0 1140 1141 0 1020 967 0
		 1037 1775 0 1775 1776 0 1037 972 0 972 1775 0 998 999 0 999 976 0 999 997 0 893 1049 0
		 1049 1048 0 920 1049 0 926 1405 0 963 917 0 963 919 0 1114 1127 0 1142 1126 0 1126 1141 0
		 1141 1142 0 1421 1007 0 917 1395 0 1395 921 0 1070 1170 0 1168 1170 0 1187 1063 0
		 1187 1186 0 1167 1208 0 1213 1078 0 1184 1217 0 1226 1194 0 1099 1231 0 1231 1229 0
		 1263 1283 0 1283 1250 0 1250 1263 0 1283 1281 0 1281 1250 0 1243 1300 0 1300 1254 0
		 1299 1300 0 1322 1263 0 1263 1323 0 1292 1328 0;
	setAttr ".ed[4648:4813]" 1336 1254 0 1252 1341 0 1273 1348 0 1323 1348 0 931 1372 0
		 1372 1373 0 877 1372 0 1314 1425 0 1425 1274 0 1314 1435 0 1435 1425 0 1499 1267 0
		 1267 1501 0 1501 1499 0 1202 1081 0 1081 1448 0 1448 1202 0 1529 1190 0 1172 1481 0
		 1481 1092 0 1361 1434 0 1361 1362 0 1362 1434 0 1482 1488 0 1482 1485 0 1533 1541 0
		 1541 1540 0 1534 1541 0 1460 1456 0 1456 1459 0 1457 1456 0 1499 1500 0 1500 1503 0
		 1503 1499 0 1436 1425 0 1182 1066 0 1066 1601 0 1066 1595 0 1740 1136 0 1136 1739 0
		 1739 1740 0 1590 1246 0 1246 1293 0 1311 1627 0 1534 1622 0 1582 1488 0 1522 1620 0
		 1524 1620 0 1569 1566 0 1462 1569 0 1579 1577 0 1577 1574 0 1625 1624 0 1624 1623 0
		 1620 1615 0 1616 1615 0 1571 1563 0 1566 1563 0 1696 1695 0 1695 1318 0 1765 1683 0
		 1683 1692 0 1765 1766 0 1766 1683 0 1727 1723 0 1723 1646 0 1646 1727 0 1647 1646 0
		 1677 1693 0 1677 1676 0 1699 1673 0 1674 1673 0 908 907 0 891 946 0 946 944 0 945 946 0
		 981 1055 0 1024 1055 0 1018 1045 0 1018 983 0 1002 1001 0 1004 1029 0 1017 961 0
		 961 1016 0 966 961 0 1387 1424 0 989 997 0 1048 939 0 1049 939 0 935 961 0 957 919 0
		 1106 1128 0 1128 1111 0 1128 1129 0 1126 1143 0 1142 1143 0 925 1398 0 1163 1108 0
		 1168 1082 0 1075 1186 0 1093 1209 0 1215 1179 0 1221 1188 0 1196 1226 0 1374 881 0
		 881 1375 0 1262 1281 0 1249 1281 0 1299 1255 0 1322 1272 0 1282 1272 0 1330 1291 0
		 1267 1336 0 1267 1301 0 1341 1259 0 1323 1321 0 1321 1348 0 1263 1321 0 877 1371 0
		 1278 1435 0 1473 1295 0 1202 1429 0 1092 1469 0 1362 1436 0 1362 1363 0 1489 1485 0
		 1535 1532 0 1457 1461 0 1457 1462 0 1516 1512 0 1527 1517 0 1517 1518 0 1183 1610 0
		 1298 1603 0 1622 1532 0 1565 1462 0 1574 1582 0 1623 1622 0 1616 1617 0 1568 1566 0
		 1744 1414 0 1414 1743 0 1743 1744 0 1683 1682 0 1682 1692 0 1727 1645 0 1646 1645 0
		 1687 1679 0 1679 1678 0 1696 1670 0 1671 1670 0 912 907 0 1053 1406 0 1058 916 0
		 921 1403 0 1403 920 0 994 998 0 1773 1041 0 1041 1040 0 1773 1774 0 1020 983 0 1001 1031 0
		 1031 1032 0 1040 1000 0 1047 961 0 947 948 0;
	setAttr ".ed[4814:4979]" 878 948 0 936 1770 0 1770 1762 0 920 1402 0 1402 1049 0
		 1049 1401 0 1119 1138 0 1137 1138 0 1148 1106 0 1148 1128 0 950 1376 0 1376 878 0
		 1397 890 0 1164 1109 0 1164 1162 0 1023 1382 0 1077 1182 0 1166 1207 0 1213 1091 0
		 1219 1185 0 1193 1223 0 1232 1096 0 1096 1205 0 1230 1096 0 911 1378 0 1386 1038 0
		 1033 1038 0 1293 1257 0 1328 1288 0 1268 1334 0 1337 1306 0 938 1413 0 1413 1407 0
		 1274 1427 0 1499 1301 0 1272 1459 0 1530 1193 0 1090 1489 0 1352 1357 0 1357 1443 0
		 1469 1465 0 1540 1544 0 1517 1537 0 1502 1499 0 1433 1437 0 1177 1595 0 1061 1641 0
		 1572 1247 0 1308 1629 0 1638 1538 0 1557 1559 0 1609 1613 0 1631 1632 0 1587 1572 0
		 1690 1407 0 1726 1649 0 1650 1649 0 1708 1662 0 1662 1661 0 1704 1668 0 1668 1667 0
		 1704 1705 0 1674 1666 0 1666 1673 0 1667 1673 0 1667 1672 0 1668 1672 0 1672 1669 0
		 1669 1671 0 1681 1679 0 1683 1678 0 1678 1682 0 1683 1677 0 1682 1679 0 1676 1747 0
		 1747 1742 0 1676 1664 0 1664 1747 0 1677 1664 0 1677 1766 0 1766 1664 0 1685 1666 0
		 1685 1684 0 1675 1684 0 1675 1665 0 1649 1652 0 1652 1648 0 1649 1651 0 1654 1647 0
		 1647 1653 0 1654 1646 0 1653 1648 0 1657 1644 0 1644 1656 0 1658 1643 0 1643 1657 0
		 1655 1646 0 1655 1645 0 1656 1645 0 1659 1643 0 1659 1663 0 1663 1660 0 1660 1662 0
		 1200 1098 0 1098 1370 0 1370 1200 0 1347 1260 0 1347 1349 0 1281 1546 0 1281 1549 0
		 1021 1052 0 1057 1380 0 1729 1024 0 1730 1032 0 942 1056 0 878 1377 0 944 922 0 946 922 0
		 1733 946 0 946 940 0 1406 1731 0 876 1731 0 1731 945 0 940 1732 0 1732 1401 0 946 1732 0
		 946 871 0 1389 1418 0 1117 1156 0 1419 1116 0 1392 1116 0 1414 1745 0 1745 1044 0
		 1744 1745 0 1044 1746 0 1745 1746 0 1263 1319 0 1319 1321 0 1348 1275 0 1275 1346 0
		 1321 1275 0 1321 1276 0 1319 1276 0 1249 1549 0 1319 1545 0 1545 1276 0 1346 1315 0
		 1315 1344 0 1735 1276 0 1545 1735 0 1347 1697 0 1344 1279 0 1315 1279 0 1315 1277 0
		 1277 1279 0 1350 1279 0 1151 1118 0 1006 1734 0 1734 1028 0 1734 1736 0 1736 1737 0
		 1741 1316 0 1316 1735 0 1735 1741 0 1736 1735 0 1735 1737 0;
	setAttr ".ed[4980:5111]" 1736 1741 0 1737 1545 0 1545 1738 0 1738 1553 0 1553 1739 0
		 1394 1740 0 1740 1553 0 1741 1351 0 1742 1694 0 1694 1743 0 1742 1675 0 1415 1744 0
		 1744 1694 0 1149 1745 0 1745 1415 0 1351 1746 0 1746 1149 0 1351 1736 0 1100 1229 0
		 1229 1101 0 1101 1100 0 1098 1100 0 1100 1239 0 1199 1228 0 1228 1100 0 1100 1199 0
		 1200 1199 0 1199 1098 0 1233 1202 0 1664 1748 0 1664 1701 0 1701 1748 0 1701 1416 0
		 1416 1748 0 1416 1749 0 1416 952 0 952 1749 0 952 1750 0 952 892 0 892 1750 0 892 1751 0
		 892 1369 0 1369 1751 0 1369 1758 0 1758 1751 0 1554 1753 0 1753 1393 0 1554 1754 0
		 1558 1755 0 1755 1554 0 1752 1558 0 1558 1756 0 1752 1755 0 1369 1752 0 1369 1158 0
		 1158 1752 0 1230 1199 0 1199 1096 0 1200 1097 0 1097 1199 0 1097 1096 0 1205 1097 0
		 1071 1561 0 1200 1757 0 1757 1097 0 1756 1097 0 1755 1158 0 1158 1160 0 1373 900 0
		 900 1374 0 883 905 0 880 900 0 900 869 0 869 1373 0 1370 1757 0 1370 1758 0 1707 1417 0
		 1747 1675 0 1727 1014 0 1014 1723 0 1014 1759 0 1014 1390 0 1390 1759 0 1390 1392 0
		 1761 1151 0 1761 1026 0 971 1014 0 971 1761 0 1762 952 0 952 1763 0 1762 892 0 1763 1416 0
		 1416 1764 0 1764 1701 0 1701 1765 0 1701 1766 0 1160 1768 0 1158 1768 0 1768 1369 0
		 1369 1769 0 1769 892 0 892 1770 0 1771 972 0 972 1772 0 1037 1772 0 1037 1773 0 979 1773 0
		 979 1774 0 1034 1774 0 1724 1781 0 1724 1780 0 1780 1781 0 1034 1730 0 1038 1775 0
		 1775 1036 0 1038 1776 0 1033 1777 0 1777 1038 0 1035 1778 0 1778 1033 0 1779 1724 0
		 1779 1780 0 1778 1023 0 1779 1775 0 1775 1780 0 972 1780 0 1780 1771 0 1771 1781 0
		 1781 1039 0 1039 1782 0 1782 969 0 1036 1779 0;
	setAttr -s 10005 ".n";
	setAttr ".n[0:165]" -type "float3"  0.00040330156 -0.075794429 0.99712336
		 0.00023211414 -0.054265432 0.99852651 0.18478419 -0.053366654 0.98132908 0.18478419
		 -0.053366654 0.98132908 0.00023211414 -0.054265432 0.99852651 0.17772721 -0.11537471
		 0.97729307 0.18478419 -0.053366654 0.98132908 0.19467404 -0.076370284 0.97789037
		 0.00040330156 -0.075794429 0.99712336 -0.18531653 -0.053456336 0.98122382 -0.19567831
		 -0.076123685 0.97770917 -0.36092415 -0.073994525 0.92965508 -0.36092415 -0.073994525
		 0.92965508 -0.19567831 -0.076123685 0.97770917 -0.36621112 -0.090698019 0.92610115
		 -0.17828709 -0.11575364 0.97714627 -0.18531653 -0.053456336 0.98122382 -0.35286266
		 -0.12141606 0.927764 -0.35286266 -0.12141606 0.927764 -0.18531653 -0.053456336 0.98122382
		 -0.36092415 -0.073994525 0.92965508 0.50693303 -0.27122265 0.81820363 0.62292439
		 -0.22755633 0.74845392 0.46210372 -0.27920726 0.84172648 0.46210372 -0.27920726 0.84172648
		 0.62292439 -0.22755633 0.74845392 0.59078908 -0.1902137 0.78408355 0.50693303 -0.27122265
		 0.81820363 0.64487433 -0.23600303 0.72693861 0.62292439 -0.22755633 0.74845392 0.53749061
		 -0.12579341 0.83383441 0.51667207 -0.11415888 0.84853858 0.65565914 -0.16405196 0.73701972
		 0.65565914 -0.16405196 0.73701972 0.51667207 -0.11415888 0.84853858 0.63118917 -0.20433705
		 0.74822903 0.65565914 -0.16405196 0.73701972 0.65951747 -0.16586082 0.73316228 0.53749061
		 -0.12579341 0.83383441 0.17772721 -0.11537471 0.97729307 0.35340846 -0.12157732 0.92753512
		 0.18478419 -0.053366654 0.98132908 0.18478419 -0.053366654 0.98132908 0.35340846
		 -0.12157732 0.92753512 0.36055928 -0.074506186 0.92975581 0.35340846 -0.12157732
		 0.92753512 0.50692266 -0.16564368 0.84592646 0.36055928 -0.074506186 0.92975581 0.36055928
		 -0.074506186 0.92975581 0.50692266 -0.16564368 0.84592646 0.51667207 -0.11415888
		 0.84853858 0.17772721 -0.11537471 0.97729307 0.00023211414 -0.054265432 0.99852651
		 0.00016754185 -0.1137851 0.99350536 0.00016754185 -0.1137851 0.99350536 0.00023211414
		 -0.054265432 0.99852651 -0.17828709 -0.11575364 0.97714627 0.53445601 -0.23397562
		 0.81216514 0.50693303 -0.27122265 0.81820363 0.35476145 -0.22466043 0.90756375 0.35476145
		 -0.22466043 0.90756375 0.50693303 -0.27122265 0.81820363 0.31916231 -0.27806231 0.90598941
		 -0.53403181 -0.2357017 0.81194502 -0.35368836 -0.22545844 0.9077847 -0.50696933 -0.27253005
		 0.81774658 -0.50696933 -0.27253005 0.81774658 -0.35368836 -0.22545844 0.9077847 -0.31761101
		 -0.27876598 0.90631825 -0.50696933 -0.27253005 0.81774658 -0.64510262 -0.2362455
		 0.72665721 -0.53403181 -0.2357017 0.81194502 -0.53403181 -0.2357017 0.81194502 -0.64510262
		 -0.2362455 0.72665721 -0.65582258 -0.21891685 0.72247636 0.53445601 -0.23397562 0.81216514
		 0.35476145 -0.22466043 0.90756375 0.54351324 -0.1707776 0.82184452 0.54351324 -0.1707776
		 0.82184452 0.35476145 -0.22466043 0.90756375 0.36974671 -0.14976084 0.91698366 0.18962462
		 -0.21230958 0.95862776 4.5508123e-06 -0.20536311 0.97868586 0.19849923 -0.13927259
		 0.97015524 0.19849923 -0.13927259 0.97015524 4.5508123e-06 -0.20536311 0.97868586
		 2.4350717e-05 -0.1361739 0.99068493 -0.20005234 -0.13873513 0.96991318 -0.19124611
		 -0.21198674 0.95837706 -0.37054855 -0.14943121 0.91671377 -0.37054855 -0.14943121
		 0.91671377 -0.19124611 -0.21198674 0.95837706 -0.35368836 -0.22545844 0.9077847 -0.65582258
		 -0.21891685 0.72247636 -0.66130137 -0.18672174 0.72650915 -0.53403181 -0.2357017
		 0.81194502 -0.53403181 -0.2357017 0.81194502 -0.66130137 -0.18672174 0.72650915 -0.54291481
		 -0.17168422 0.82205111 -0.17828709 -0.11575364 0.97714627 0.00023211414 -0.054265432
		 0.99852651 -0.18531653 -0.053456336 0.98122382 -0.18531653 -0.053456336 0.98122382
		 0.00023211414 -0.054265432 0.99852651 0.00040330156 -0.075794429 0.99712336 -0.19567831
		 -0.076123685 0.97770917 -0.18531653 -0.053456336 0.98122382 0.00040330156 -0.075794429
		 0.99712336 -0.19124611 -0.21198674 0.95837706 -0.20005234 -0.13873513 0.96991318
		 4.5508123e-06 -0.20536311 0.97868586 4.5508123e-06 -0.20536311 0.97868586 -0.20005234
		 -0.13873513 0.96991318 2.4350717e-05 -0.1361739 0.99068493 0.18478419 -0.053366654
		 0.98132908 0.36055928 -0.074506186 0.92975581 0.19467404 -0.076370284 0.97789037
		 0.19467404 -0.076370284 0.97789037 0.36055928 -0.074506186 0.92975581 0.36601996
		 -0.090822808 0.92616445 0.19849923 -0.13927259 0.97015524 0.36974671 -0.14976084
		 0.91698366 0.18962462 -0.21230958 0.95862776 0.18962462 -0.21230958 0.95862776 0.36974671
		 -0.14976084 0.91698366 0.35476145 -0.22466043 0.90756375 0.54351324 -0.1707776 0.82184452
		 0.66206646 -0.18624373 0.72593474 0.53445601 -0.23397562 0.81216514 0.53445601 -0.23397562
		 0.81216514 0.66206646 -0.18624373 0.72593474 0.65620953 -0.2184049 0.72227997 0.50693303
		 -0.27122265 0.81820363 0.53445601 -0.23397562 0.81216514 0.64487433 -0.23600303 0.72693861
		 0.64487433 -0.23600303 0.72693861 0.53445601 -0.23397562 0.81216514 0.65620953 -0.2184049
		 0.72227997 -0.37054855 -0.14943121 0.91671377 -0.35368836 -0.22545844 0.9077847 -0.54291481
		 -0.17168422 0.82205111 -0.54291481 -0.17168422 0.82205111 -0.35368836 -0.22545844
		 0.9077847 -0.53403181 -0.2357017 0.81194502 -0.66130137 -0.18672174 0.72650915 -0.65793282
		 -0.1659444 0.73456579 -0.54291481 -0.17168422 0.82205111 -0.54291481 -0.17168422
		 0.82205111 -0.65793282 -0.1659444 0.73456579 -0.53740293 -0.1264707 0.83378851 -0.36621112
		 -0.090698019 0.92610115 -0.37054855 -0.14943121 0.91671377 -0.53740293 -0.1264707
		 0.83378851 -0.53740293 -0.1264707 0.83378851 -0.37054855 -0.14943121 0.91671377 -0.54291481
		 -0.17168422 0.82205111 -0.19567831 -0.076123685 0.97770917 -0.20005234 -0.13873513
		 0.96991318 -0.36621112 -0.090698019 0.92610115 -0.36621112 -0.090698019 0.92610115
		 -0.20005234 -0.13873513 0.96991318 -0.37054855 -0.14943121 0.91671377 0.00040330156
		 -0.075794429 0.99712336 2.4350717e-05 -0.1361739 0.99068493 -0.19567831 -0.076123685
		 0.97770917 -0.19567831 -0.076123685 0.97770917;
	setAttr ".n[166:331]" -type "float3"  2.4350717e-05 -0.1361739 0.99068493 -0.20005234
		 -0.13873513 0.96991318 0.19849923 -0.13927259 0.97015524 2.4350717e-05 -0.1361739
		 0.99068493 0.19467404 -0.076370284 0.97789037 0.19467404 -0.076370284 0.97789037
		 2.4350717e-05 -0.1361739 0.99068493 0.00040330156 -0.075794429 0.99712336 0.19467404
		 -0.076370284 0.97789037 0.36601996 -0.090822808 0.92616445 0.19849923 -0.13927259
		 0.97015524 0.19849923 -0.13927259 0.97015524 0.36601996 -0.090822808 0.92616445 0.36974671
		 -0.14976084 0.91698366 0.54351324 -0.1707776 0.82184452 0.36974671 -0.14976084 0.91698366
		 0.53749061 -0.12579341 0.83383441 0.53749061 -0.12579341 0.83383441 0.36974671 -0.14976084
		 0.91698366 0.36601996 -0.090822808 0.92616445 0.53749061 -0.12579341 0.83383441 0.65951747
		 -0.16586082 0.73316228 0.54351324 -0.1707776 0.82184452 0.54351324 -0.1707776 0.82184452
		 0.65951747 -0.16586082 0.73316228 0.66206646 -0.18624373 0.72593474 0.36055928 -0.074506186
		 0.92975581 0.51667207 -0.11415888 0.84853858 0.36601996 -0.090822808 0.92616445 0.36601996
		 -0.090822808 0.92616445 0.51667207 -0.11415888 0.84853858 0.53749061 -0.12579341
		 0.83383441 -0.35286266 -0.12141606 0.927764 -0.36092415 -0.073994525 0.92965508 -0.50717884
		 -0.16427086 0.84604061 -0.50717884 -0.16427086 0.84604061 -0.36092415 -0.073994525
		 0.92965508 -0.51694053 -0.11286508 0.84854811 -0.36092415 -0.073994525 0.92965508
		 -0.36621112 -0.090698019 0.92610115 -0.51694053 -0.11286508 0.84854811 -0.51694053
		 -0.11286508 0.84854811 -0.36621112 -0.090698019 0.92610115 -0.53740293 -0.1264707
		 0.83378851 -0.53740293 -0.1264707 0.83378851 -0.65409446 -0.16415243 0.73838639 -0.51694053
		 -0.11286508 0.84854811 -0.51694053 -0.11286508 0.84854811 -0.65409446 -0.16415243
		 0.73838639 -0.62986982 -0.20124352 0.75017667 -0.53740293 -0.1264707 0.83378851 -0.65793282
		 -0.1659444 0.73456579 -0.65409446 -0.16415243 0.73838639 -0.62986982 -0.20124352
		 0.75017667 -0.50717884 -0.16427086 0.84604061 -0.51694053 -0.11286508 0.84854811
		 0.50692266 -0.16564368 0.84592646 0.63118917 -0.20433705 0.74822903 0.51667207 -0.11415888
		 0.84853858 -0.53004152 -0.15188022 0.83425921 -0.59000868 -0.18982419 0.7847653 -0.40839505
		 -0.27482268 0.87045157 -0.40839505 -0.27482268 0.87045157 -0.59000868 -0.18982419
		 0.7847653 -0.46157607 -0.27889946 0.84211791 -0.40839505 -0.27482268 0.87045157 -0.37517855
		 -0.21042825 0.90275192 -0.53004152 -0.15188022 0.83425921 0.35476145 -0.22466043
		 0.90756375 0.31916231 -0.27806231 0.90598941 0.18962462 -0.21230958 0.95862776 0.18962462
		 -0.21230958 0.95862776 0.31916231 -0.27806231 0.90598941 0.16892728 -0.27055213 0.94776851
		 -0.35368836 -0.22545844 0.9077847 -0.19124611 -0.21198674 0.95837706 -0.31761101
		 -0.27876598 0.90631825 -0.31761101 -0.27876598 0.90631825 -0.19124611 -0.21198674
		 0.95837706 -0.16988596 -0.27053684 0.9476015 -0.19124611 -0.21198674 0.95837706 4.5508123e-06
		 -0.20536311 0.97868586 -0.16988596 -0.27053684 0.9476015 -0.16988596 -0.27053684
		 0.9476015 4.5508123e-06 -0.20536311 0.97868586 -0.00049104157 -0.26420984 0.96446508
		 -0.00049104157 -0.26420984 0.96446508 4.5508123e-06 -0.20536311 0.97868586 0.16892728
		 -0.27055213 0.94776851 0.16892728 -0.27055213 0.94776851 4.5508123e-06 -0.20536311
		 0.97868586 0.18962462 -0.21230958 0.95862776 0.13012499 -0.3226732 0.93752307 0.12231717
		 -0.25012887 0.96045512 -0.00048660353 -0.32613263 0.94532388 -0.00048660353 -0.32613263
		 0.94532388 0.12231717 -0.25012887 0.96045512 -0.00023807134 -0.25885472 0.96591622
		 -0.13087931 -0.32285523 0.9373554 -0.00048660353 -0.32613263 0.94532388 -0.12293245
		 -0.25010026 0.96038401 -0.12293245 -0.25010026 0.96038401 -0.00048660353 -0.32613263
		 0.94532388 -0.00023807134 -0.25885472 0.96591622 0.12231717 -0.25012887 0.96045512
		 0.13012499 -0.3226732 0.93752307 0.24594238 -0.23739938 0.93976265 0.24594238 -0.23739938
		 0.93976265 0.13012499 -0.3226732 0.93752307 0.26140428 -0.31279173 0.91314244 -0.12293245
		 -0.25010026 0.96038401 -0.24637537 -0.23798156 0.93950194 -0.13087931 -0.32285523
		 0.9373554 -0.13087931 -0.32285523 0.9373554 -0.24637537 -0.23798156 0.93950194 -0.26118374
		 -0.31249952 0.91330558 -0.24637537 -0.23798156 0.93950194 -0.37517855 -0.21042825
		 0.90275192 -0.26118374 -0.31249952 0.91330558 -0.26118374 -0.31249952 0.91330558
		 -0.37517855 -0.21042825 0.90275192 -0.40839505 -0.27482268 0.87045157 0.14592114
		 -0.31929785 0.93635243 0.16892728 -0.27055213 0.94776851 0.28485134 -0.31415519 0.90563029
		 0.28485134 -0.31415519 0.90563029 0.16892728 -0.27055213 0.94776851 0.31916231 -0.27806231
		 0.90598941 -0.00051546009 -0.3172265 0.94834965 -0.00049104157 -0.26420984 0.96446508
		 0.14592114 -0.31929785 0.93635243 0.14592114 -0.31929785 0.93635243 -0.00049104157
		 -0.26420984 0.96446508 0.16892728 -0.27055213 0.94776851 -0.16988596 -0.27053684
		 0.9476015 -0.00049104157 -0.26420984 0.96446508 -0.14680213 -0.31929651 0.93621516
		 -0.14680213 -0.31929651 0.93621516 -0.00049104157 -0.26420984 0.96446508 -0.00051546009
		 -0.3172265 0.94834965 -0.14680213 -0.31929651 0.93621516 -0.28340173 -0.31427947
		 0.90604186 -0.16988596 -0.27053684 0.9476015 -0.16988596 -0.27053684 0.9476015 -0.28340173
		 -0.31427947 0.90604186 -0.31761101 -0.27876598 0.90631825 -0.28340173 -0.31427947
		 0.90604186 -0.46157607 -0.27889946 0.84211791 -0.31761101 -0.27876598 0.90631825
		 -0.31761101 -0.27876598 0.90631825 -0.46157607 -0.27889946 0.84211791 -0.50696933
		 -0.27253005 0.81774658 -0.64510262 -0.2362455 0.72665721 -0.50696933 -0.27253005
		 0.81774658 -0.62394047 -0.22677049 0.74784589 -0.50696933 -0.27253005 0.81774658
		 -0.46157607 -0.27889946 0.84211791 -0.62394047 -0.22677049 0.74784589 -0.62394047
		 -0.22677049 0.74784589 -0.46157607 -0.27889946 0.84211791 -0.59000868 -0.18982419
		 0.7847653 0.46210372 -0.27920726 0.84172648 0.59078908 -0.1902137 0.78408355 0.41043136
		 -0.27567673 0.86922288 0.41043136 -0.27567673 0.86922288 0.59078908 -0.1902137 0.78408355;
	setAttr ".n[332:497]" -type "float3"  0.53096557 -0.1527122 0.8335194 0.28485134
		 -0.31415519 0.90563029 0.31916231 -0.27806231 0.90598941 0.46210372 -0.27920726 0.84172648
		 0.46210372 -0.27920726 0.84172648 0.31916231 -0.27806231 0.90598941 0.50693303 -0.27122265
		 0.81820363 0.41043136 -0.27567673 0.86922288 0.37502286 -0.21139605 0.90259045 0.26140428
		 -0.31279173 0.91314244 0.26140428 -0.31279173 0.91314244 0.37502286 -0.21139605 0.90259045
		 0.24594238 -0.23739938 0.93976265 0.46210372 -0.27920726 0.84172648 0.41043136 -0.27567673
		 0.86922288 0.28485134 -0.31415519 0.90563029 0.28485134 -0.31415519 0.90563029 0.41043136
		 -0.27567673 0.86922288 0.26140428 -0.31279173 0.91314244 0.13012499 -0.3226732 0.93752307
		 0.14592114 -0.31929785 0.93635243 0.26140428 -0.31279173 0.91314244 0.26140428 -0.31279173
		 0.91314244 0.14592114 -0.31929785 0.93635243 0.28485134 -0.31415519 0.90563029 -0.00048660353
		 -0.32613263 0.94532388 -0.00051546009 -0.3172265 0.94834965 0.13012499 -0.3226732
		 0.93752307 0.13012499 -0.3226732 0.93752307 -0.00051546009 -0.3172265 0.94834965
		 0.14592114 -0.31929785 0.93635243 -0.14680213 -0.31929651 0.93621516 -0.00051546009
		 -0.3172265 0.94834965 -0.13087931 -0.32285523 0.9373554 -0.13087931 -0.32285523 0.9373554
		 -0.00051546009 -0.3172265 0.94834965 -0.00048660353 -0.32613263 0.94532388 -0.13087931
		 -0.32285523 0.9373554 -0.26118374 -0.31249952 0.91330558 -0.14680213 -0.31929651
		 0.93621516 -0.14680213 -0.31929651 0.93621516 -0.26118374 -0.31249952 0.91330558
		 -0.28340173 -0.31427947 0.90604186 -0.26118374 -0.31249952 0.91330558 -0.40839505
		 -0.27482268 0.87045157 -0.28340173 -0.31427947 0.90604186 -0.28340173 -0.31427947
		 0.90604186 -0.40839505 -0.27482268 0.87045157 -0.46157607 -0.27889946 0.84211791
		 0.53096557 -0.1527122 0.8335194 0.37502286 -0.21139605 0.90259045 0.41043136 -0.27567673
		 0.86922288 -0.66500509 0.1579586 0.72994334 -0.53004152 -0.15188022 0.83425921 -0.53306425
		 0.20010681 0.82207042 -0.53306425 0.20010681 0.82207042 -0.53004152 -0.15188022 0.83425921
		 -0.37517855 -0.21042825 0.90275192 -0.53306425 0.20010681 0.82207042 -0.37517855
		 -0.21042825 0.90275192 -0.37346181 0.22229095 0.90061814 -0.37346181 0.22229095 0.90061814
		 -0.37517855 -0.21042825 0.90275192 -0.24637537 -0.23798156 0.93950194 -0.19302244
		 0.25481901 0.94752818 -0.12293245 -0.25010026 0.96038401 0.00013877671 0.26235649
		 0.96497101 0.00013877671 0.26235649 0.96497101 -0.12293245 -0.25010026 0.96038401
		 -0.00023807134 -0.25885472 0.96591622 -0.25237826 -0.6311779 0.73343003 -0.17828709
		 -0.11575364 0.97714627 -0.48624909 -0.58798444 0.64640242 -0.48624909 -0.58798444
		 0.64640242 -0.17828709 -0.11575364 0.97714627 -0.35286266 -0.12141606 0.927764 -0.65957469
		 -0.5281027 0.53485405 -0.48624909 -0.58798444 0.64640242 -0.50717884 -0.16427086
		 0.84604061 -0.50717884 -0.16427086 0.84604061 -0.48624909 -0.58798444 0.64640242
		 -0.35286266 -0.12141606 0.927764 1.1086388e-05 -0.61910254 0.78531015 0.00016754185
		 -0.1137851 0.99350536 -0.25237826 -0.6311779 0.73343003 -0.25237826 -0.6311779 0.73343003
		 0.00016754185 -0.1137851 0.99350536 -0.17828709 -0.11575364 0.97714627 -0.75955397
		 -0.45584276 0.46398824 -0.65957469 -0.5281027 0.53485405 -0.62986982 -0.20124352
		 0.75017667 -0.62986982 -0.20124352 0.75017667 -0.65957469 -0.5281027 0.53485405 -0.50717884
		 -0.16427086 0.84604061 -0.84927583 -0.38672286 0.35941058 -0.75955397 -0.45584276
		 0.46398824 -0.65409446 -0.16415243 0.73838639 -0.65409446 -0.16415243 0.73838639
		 -0.75955397 -0.45584276 0.46398824 -0.62986982 -0.20124352 0.75017667 0.19275542
		 0.25337097 0.94797075 0.00013877671 0.26235649 0.96497101 0.12231717 -0.25012887
		 0.96045512 0.12231717 -0.25012887 0.96045512 0.00013877671 0.26235649 0.96497101
		 -0.00023807134 -0.25885472 0.96591622 0.53146297 0.19640905 0.82399672 0.37371641
		 0.22269583 0.90041244 0.37502286 -0.21139605 0.90259045 0.37502286 -0.21139605 0.90259045
		 0.37371641 0.22269583 0.90041244 0.24594238 -0.23739938 0.93976265 0.66706109 0.16273485
		 0.72701228 0.53146297 0.19640905 0.82399672 0.53096557 -0.1527122 0.8335194 0.53096557
		 -0.1527122 0.8335194 0.53146297 0.19640905 0.82399672 0.37502286 -0.21139605 0.90259045
		 0.85317612 0.070077516 0.51689422 0.77709448 0.13477677 0.614784 0.62292439 -0.22755633
		 0.74845392 0.62292439 -0.22755633 0.74845392 0.77709448 0.13477677 0.614784 0.59078908
		 -0.1902137 0.78408355 0.91463143 0.0098127536 0.40416965 0.85317612 0.070077516 0.51689422
		 0.64487433 -0.23600303 0.72693861 0.64487433 -0.23600303 0.72693861 0.85317612 0.070077516
		 0.51689422 0.62292439 -0.22755633 0.74845392 0.94814479 -0.18008037 0.26190171 0.66206646
		 -0.18624373 0.72593474 0.90823239 -0.29116482 0.30056113 0.90823239 -0.29116482 0.30056113
		 0.66206646 -0.18624373 0.72593474 0.65951747 -0.16586082 0.73316228 0.90823239 -0.29116482
		 0.30056113 0.65951747 -0.16586082 0.73316228 0.85031396 -0.3886866 0.35480818 0.85031396
		 -0.3886866 0.35480818 0.65951747 -0.16586082 0.73316228 0.65565914 -0.16405196 0.73701972
		 0.85031396 -0.3886866 0.35480818 0.65565914 -0.16405196 0.73701972 0.7619741 -0.46288836
		 0.4529126 0.7619741 -0.46288836 0.4529126 0.65565914 -0.16405196 0.73701972 0.63118917
		 -0.20433705 0.74822903 0.94814479 -0.18008037 0.26190171 0.95052606 -0.074735932
		 0.30152076 0.66206646 -0.18624373 0.72593474 0.66206646 -0.18624373 0.72593474 0.95052606
		 -0.074735932 0.30152076 0.65620953 -0.2184049 0.72227997 0.65998846 -0.53541815 0.52701288
		 0.50692266 -0.16564368 0.84592646 0.48542246 -0.58857763 0.6464839 0.48542246 -0.58857763
		 0.6464839 0.50692266 -0.16564368 0.84592646 0.35340846 -0.12157732 0.92753512 0.25235981
		 -0.63119704 0.73341995 0.48542246 -0.58857763 0.6464839 0.17772721 -0.11537471 0.97729307
		 0.17772721 -0.11537471 0.97729307 0.48542246 -0.58857763 0.6464839 0.35340846 -0.12157732
		 0.92753512;
	setAttr ".n[498:663]" -type "float3"  1.1086388e-05 -0.61910254 0.78531015
		 0.25235981 -0.63119704 0.73341995 0.00016754185 -0.1137851 0.99350536 0.00016754185
		 -0.1137851 0.99350536 0.25235981 -0.63119704 0.73341995 0.17772721 -0.11537471 0.97729307
		 0.7619741 -0.46288836 0.4529126 0.63118917 -0.20433705 0.74822903 0.65998846 -0.53541815
		 0.52701288 0.65998846 -0.53541815 0.52701288 0.63118917 -0.20433705 0.74822903 0.50692266
		 -0.16564368 0.84592646 0.95052606 -0.074735932 0.30152076 0.91463143 0.0098127536
		 0.40416965 0.65620953 -0.2184049 0.72227997 0.65620953 -0.2184049 0.72227997 0.91463143
		 0.0098127536 0.40416965 0.64487433 -0.23600303 0.72693861 -0.85403085 0.072135538
		 0.51519686 -0.62394047 -0.22677049 0.74784589 -0.77298194 0.12765279 0.62145287 -0.77298194
		 0.12765279 0.62145287 -0.62394047 -0.22677049 0.74784589 -0.59000868 -0.18982419
		 0.7847653 -0.91584939 0.011287274 0.40136334 -0.64510262 -0.2362455 0.72665721 -0.85403085
		 0.072135538 0.51519686 -0.85403085 0.072135538 0.51519686 -0.64510262 -0.2362455
		 0.72665721 -0.62394047 -0.22677049 0.74784589 -0.90591663 -0.29030403 0.30828333
		 -0.84927583 -0.38672286 0.35941058 -0.65793282 -0.1659444 0.73456579 -0.65793282
		 -0.1659444 0.73456579 -0.84927583 -0.38672286 0.35941058 -0.65409446 -0.16415243
		 0.73838639 -0.94773889 -0.18050131 0.26307842 -0.90591663 -0.29030403 0.30828333
		 -0.66130137 -0.18672174 0.72650915 -0.66130137 -0.18672174 0.72650915 -0.90591663
		 -0.29030403 0.30828333 -0.65793282 -0.1659444 0.73456579 -0.94773889 -0.18050131
		 0.26307842 -0.66130137 -0.18672174 0.72650915 -0.95059848 -0.075025432 0.30122045
		 -0.95059848 -0.075025432 0.30122045 -0.66130137 -0.18672174 0.72650915 -0.65582258
		 -0.21891685 0.72247636 -0.95059848 -0.075025432 0.30122045 -0.65582258 -0.21891685
		 0.72247636 -0.91584939 0.011287274 0.40136334 -0.91584939 0.011287274 0.40136334
		 -0.65582258 -0.21891685 0.72247636 -0.64510262 -0.2362455 0.72665721 0.82585573 -0.52158862
		 -0.21426065 0.82331228 -0.54177648 -0.1692192 0.68961823 -0.67576832 -0.26031494
		 0.68961823 -0.67576832 -0.26031494 0.82331228 -0.54177648 -0.1692192 0.68388849 -0.70274252
		 -0.19608523 -0.82331324 -0.54177815 -0.16920918 -0.92425948 -0.3626067 -0.11941832
		 -0.82585555 -0.52158868 -0.21426105 -0.82585555 -0.52158868 -0.21426105 -0.92425948
		 -0.3626067 -0.11941832 -0.9251222 -0.35047001 -0.14601274 5.2437347e-08 -0.98556441
		 -0.16930072 -0.17550386 -0.96855801 -0.17633414 -1.2742598e-07 -0.96570498 -0.25964195
		 -1.2742598e-07 -0.96570498 -0.25964195 -0.17550386 -0.96855801 -0.17633414 -0.19055733
		 -0.94413227 -0.26889071 0.68961823 -0.67576832 -0.26031494 0.68388849 -0.70274252
		 -0.19608523 0.53688157 -0.79572386 -0.28032428 0.53688157 -0.79572386 -0.28032428
		 0.68388849 -0.70274252 -0.19608523 0.53172362 -0.82287782 -0.20035481 -0.68388951
		 -0.70275873 -0.19602382 -0.82331324 -0.54177815 -0.16920918 -0.68961811 -0.6757682
		 -0.26031554 -0.68961811 -0.6757682 -0.26031554 -0.82331324 -0.54177815 -0.16920918
		 -0.82585555 -0.52158868 -0.21426105 0.53688157 -0.79572386 -0.28032428 0.53172362
		 -0.82287782 -0.20035481 0.36999634 -0.88594502 -0.27965 0.36999634 -0.88594502 -0.27965
		 0.53172362 -0.82287782 -0.20035481 0.35803539 -0.91413486 -0.1901792 -0.68961811
		 -0.6757682 -0.26031554 -0.53688157 -0.79572374 -0.2803247 -0.68388951 -0.70275873
		 -0.19602382 -0.68388951 -0.70275873 -0.19602382 -0.53688157 -0.79572374 -0.2803247
		 -0.53175449 -0.82287854 -0.20026992 0.17550844 -0.96855813 -0.17632909 0.19055852
		 -0.94413221 -0.26889005 0.35803539 -0.91413486 -0.1901792 0.35803539 -0.91413486
		 -0.1901792 0.19055852 -0.94413221 -0.26889005 0.36999634 -0.88594502 -0.27965 -0.53688157
		 -0.79572374 -0.2803247 -0.36999574 -0.88594514 -0.27965039 -0.53175449 -0.82287854
		 -0.20026992 -0.53175449 -0.82287854 -0.20026992 -0.36999574 -0.88594514 -0.27965039
		 -0.3580738 -0.91412443 -0.19015691 0.98274386 -0.17353086 -0.06404306 0.9850297 -0.16531849
		 -0.048849165 0.92512244 -0.35046941 -0.14601243 0.92512244 -0.35046941 -0.14601243
		 0.9850297 -0.16531849 -0.048849165 0.92425913 -0.36260551 -0.11942495 -0.36999574
		 -0.88594514 -0.27965039 -0.19055733 -0.94413227 -0.26889071 -0.3580738 -0.91412443
		 -0.19015691 -0.3580738 -0.91412443 -0.19015691 -0.19055733 -0.94413227 -0.26889071
		 -0.17550386 -0.96855801 -0.17633414 -0.98274374 -0.17353161 -0.064042769 -0.98502958
		 -0.16532035 -0.048845503 -0.99979985 -0.02000514 -8.6765649e-06 -0.99979985 -0.02000514
		 -8.6765649e-06 -0.98502958 -0.16532035 -0.048845503 -0.99967992 0.0045940285 0.024879795
		 0.92512244 -0.35046941 -0.14601243 0.92425913 -0.36260551 -0.11942495 0.82585573
		 -0.52158862 -0.21426065 0.82585573 -0.52158862 -0.21426065 0.92425913 -0.36260551
		 -0.11942495 0.82331228 -0.54177648 -0.1692192 5.2437347e-08 -0.98556441 -0.16930072
		 -1.2742598e-07 -0.96570498 -0.25964195 0.17550844 -0.96855813 -0.17632909 0.17550844
		 -0.96855813 -0.17632909 -1.2742598e-07 -0.96570498 -0.25964195 0.19055852 -0.94413221
		 -0.26889005 -0.92425948 -0.3626067 -0.11941832 -0.98502958 -0.16532035 -0.048845503
		 -0.9251222 -0.35047001 -0.14601274 -0.9251222 -0.35047001 -0.14601274 -0.98502958
		 -0.16532035 -0.048845503 -0.98274374 -0.17353161 -0.064042769 0.98274386 -0.17353086
		 -0.06404306 0.99979991 -0.020004848 -8.7221542e-06 0.9850297 -0.16531849 -0.048849165
		 0.9850297 -0.16531849 -0.048849165 0.99979991 -0.020004848 -8.7221542e-06 0.99967945
		 0.0046092379 0.024894096 0.99967945 0.0046092379 0.024894096 0.98607475 -0.16506039
		 -0.020289628 0.9850297 -0.16531849 -0.048849165 -0.98502958 -0.16532035 -0.048845503
		 -0.98607355 -0.16508795 -0.020121524 -0.99967992 0.0045940285 0.024879795 -0.99979985
		 -0.02000514 -8.6765649e-06 -0.99967992 0.0045940285 0.024879795 -0.98792142 0.14317754
		 0.059257708 -0.98792142 0.14317754 0.059257708 -0.99967992 0.0045940285 0.024879795
		 -0.97708696 0.18197858 0.11038501 0.82331228 -0.54177648 -0.1692192 0.84453672 -0.53188986
		 -0.062055968 0.68388849 -0.70274252 -0.19608523 0.68388849 -0.70274252 -0.19608523;
	setAttr ".n[664:829]" -type "float3"  0.84453672 -0.53188986 -0.062055968 0.7146498
		 -0.69683534 -0.060795769 -0.98792142 0.14317754 0.059257708 -0.97708696 0.18197858
		 0.11038501 -0.94586945 0.29202011 0.1416166 -0.94586945 0.29202011 0.1416166 -0.97708696
		 0.18197858 0.11038501 -0.9219147 0.32185048 0.21560514 -0.92425948 -0.3626067 -0.11941832
		 -0.82331324 -0.54177815 -0.16920918 -0.93639964 -0.34837869 -0.042285524 -0.93639964
		 -0.34837869 -0.042285524 -0.82331324 -0.54177815 -0.16920918 -0.84460127 -0.53184831
		 -0.061530467 -0.17550386 -0.96855801 -0.17633414 5.2437347e-08 -0.98556441 -0.16930072
		 -0.18345521 -0.98301864 -0.004301853 -0.18345521 -0.98301864 -0.004301853 5.2437347e-08
		 -0.98556441 -0.16930072 -7.1947125e-06 -0.99999422 0.0033926775 0.68388849 -0.70274252
		 -0.19608523 0.7146498 -0.69683534 -0.060795769 0.53172362 -0.82287782 -0.20035481
		 0.53172362 -0.82287782 -0.20035481 0.7146498 -0.69683534 -0.060795769 0.5661369 -0.82284057
		 -0.04921801 -0.74168551 0.57852089 0.33943507 -0.70601869 0.56867772 0.42207015 -0.58731502
		 0.69577217 0.41347572 -0.58731502 0.69577217 0.41347572 -0.70601869 0.56867772 0.42207015
		 -0.55151832 0.67345411 0.49222669 -0.82331324 -0.54177815 -0.16920918 -0.68388951
		 -0.70275873 -0.19602382 -0.84460127 -0.53184831 -0.061530467 -0.84460127 -0.53184831
		 -0.061530467 -0.68388951 -0.70275873 -0.19602382 -0.71516794 -0.6964885 -0.058639407
		 0.98792154 0.14317213 0.059268244 0.94587272 0.29199788 0.14164044 0.97707266 0.18177955
		 0.11083876 0.97707266 0.18177955 0.11083876 0.94587272 0.29199788 0.14164044 0.92208219
		 0.32114384 0.21594238 -0.58731502 0.69577217 0.41347572 -0.55151832 0.67345411 0.49222669
		 -0.4057177 0.7851398 0.4679195 -0.4057177 0.7851398 0.4679195 -0.55151832 0.67345411
		 0.49222669 -0.37670889 0.74324137 0.55288583 0.99979991 -0.020004848 -8.7221542e-06
		 0.98792154 0.14317213 0.059268244 0.99967945 0.0046092379 0.024894096 0.99967945
		 0.0046092379 0.024894096 0.98792154 0.14317213 0.059268244 0.97707266 0.18177955
		 0.11083876 0.53172362 -0.82287782 -0.20035481 0.5661369 -0.82284057 -0.04921801 0.35803539
		 -0.91413486 -0.1901792 0.35803539 -0.91413486 -0.1901792 0.5661369 -0.82284057 -0.04921801
		 0.37977138 -0.92462069 -0.029160375 -0.94586945 0.29202011 0.1416166 -0.9219147 0.32185048
		 0.21560514 -0.86335725 0.43999535 0.24701889 -0.86335725 0.43999535 0.24701889 -0.9219147
		 0.32185048 0.21560514 -0.83056396 0.45305797 0.32388565 -0.68388951 -0.70275873 -0.19602382
		 -0.53175449 -0.82287854 -0.20026992 -0.71516794 -0.6964885 -0.058639407 -0.71516794
		 -0.6964885 -0.058639407 -0.53175449 -0.82287854 -0.20026992 -0.56699514 -0.82236117
		 -0.047313981 0.74136698 0.57894188 0.33941326 0.58731699 0.69579029 0.41344246 0.70569599
		 0.57016492 0.42060101 0.70569599 0.57016492 0.42060101 0.58731699 0.69579029 0.41344246
		 0.55164605 0.6720975 0.49393478 -0.86335725 0.43999535 0.24701889 -0.83056396 0.45305797
		 0.32388565 -0.74168551 0.57852089 0.33943507 -0.74168551 0.57852089 0.33943507 -0.83056396
		 0.45305797 0.32388565 -0.70601869 0.56867772 0.42207015 0.58731699 0.69579029 0.41344246
		 0.40572315 0.78517306 0.46785891 0.55164605 0.6720975 0.49393478 0.55164605 0.6720975
		 0.49393478 0.40572315 0.78517306 0.46785891 0.3768338 0.74312872 0.55295205 -0.4057177
		 0.7851398 0.4679195 -0.37670889 0.74324137 0.55288583 -0.20350733 0.84128845 0.50081789
		 -0.20350733 0.84128845 0.50081789 -0.37670889 0.74324137 0.55288583 -0.19355695 0.78818738
		 0.58420575 0.86347264 0.43997297 0.24665515 0.74136698 0.57894188 0.33941326 0.83045769
		 0.45438111 0.32230079 0.83045769 0.45438111 0.32230079 0.74136698 0.57894188 0.33941326
		 0.70569599 0.57016492 0.42060101 0.35803539 -0.91413486 -0.1901792 0.37977138 -0.92462069
		 -0.029160375 0.17550844 -0.96855813 -0.17632909 0.17550844 -0.96855813 -0.17632909
		 0.37977138 -0.92462069 -0.029160375 0.1834712 -0.9830156 -0.0043255696 -0.20350733
		 0.84128845 0.50081789 -0.19355695 0.78818738 0.58420575 -1.1221814e-06 0.85791212
		 0.51379651 -1.1221814e-06 0.85791212 0.51379651 -0.19355695 0.78818738 0.58420575
		 2.7110267e-05 0.80665708 0.59101975 -0.53175449 -0.82287854 -0.20026992 -0.3580738
		 -0.91412443 -0.19015691 -0.56699514 -0.82236117 -0.047313981 -0.56699514 -0.82236117
		 -0.047313981 -0.3580738 -0.91412443 -0.19015691 -0.37997249 -0.92453855 -0.029144781
		 0.94587272 0.29199788 0.14164044 0.86347264 0.43997297 0.24665515 0.92208219 0.32114384
		 0.21594238 0.92208219 0.32114384 0.21594238 0.86347264 0.43997297 0.24665515 0.83045769
		 0.45438111 0.32230079 0.40572315 0.78517306 0.46785891 0.2034898 0.84130275 0.50080097
		 0.3768338 0.74312872 0.55295205 0.3768338 0.74312872 0.55295205 0.2034898 0.84130275
		 0.50080097 0.19357386 0.78765196 0.5849219 0.9850297 -0.16531849 -0.048849165 0.98607475
		 -0.16506039 -0.020289628 0.92425913 -0.36260551 -0.11942495 0.92425913 -0.36260551
		 -0.11942495 0.98607475 -0.16506039 -0.020289628 0.9363203 -0.34840104 -0.043829739
		 -0.3580738 -0.91412443 -0.19015691 -0.17550386 -0.96855801 -0.17633414 -0.37997249
		 -0.92453855 -0.029144781 -0.37997249 -0.92453855 -0.029144781 -0.17550386 -0.96855801
		 -0.17633414 -0.18345521 -0.98301864 -0.004301853 0.2034898 0.84130275 0.50080097
		 -1.1221814e-06 0.85791212 0.51379651 0.19357386 0.78765196 0.5849219 0.19357386 0.78765196
		 0.5849219 -1.1221814e-06 0.85791212 0.51379651 2.7110267e-05 0.80665708 0.59101975
		 0.84453672 -0.53188986 -0.062055968 0.82331228 -0.54177648 -0.1692192 0.9363203 -0.34840104
		 -0.043829739 0.9363203 -0.34840104 -0.043829739 0.82331228 -0.54177648 -0.1692192
		 0.92425913 -0.36260551 -0.11942495 0.17550844 -0.96855813 -0.17632909 0.1834712 -0.9830156
		 -0.0043255696 5.2437347e-08 -0.98556441 -0.16930072 5.2437347e-08 -0.98556441 -0.16930072
		 0.1834712 -0.9830156 -0.0043255696 -7.1947125e-06 -0.99999422 0.0033926775 -0.98502958
		 -0.16532035 -0.048845503 -0.92425948 -0.3626067 -0.11941832;
	setAttr ".n[830:995]" -type "float3"  -0.98607355 -0.16508795 -0.020121524
		 -0.98607355 -0.16508795 -0.020121524 -0.92425948 -0.3626067 -0.11941832 -0.93639964
		 -0.34837869 -0.042285524 0.77709448 0.13477677 0.614784 0.66706109 0.16273485 0.72701228
		 0.59078908 -0.1902137 0.78408355 0.59078908 -0.1902137 0.78408355 0.66706109 0.16273485
		 0.72701228 0.53096557 -0.1527122 0.8335194 -0.77298194 0.12765279 0.62145287 -0.59000868
		 -0.18982419 0.7847653 -0.66500509 0.1579586 0.72994334 -0.66500509 0.1579586 0.72994334
		 -0.59000868 -0.18982419 0.7847653 -0.53004152 -0.15188022 0.83425921 -0.37346181
		 0.22229095 0.90061814 -0.24637537 -0.23798156 0.93950194 -0.19302244 0.25481901 0.94752818
		 -0.19302244 0.25481901 0.94752818 -0.24637537 -0.23798156 0.93950194 -0.12293245
		 -0.25010026 0.96038401 0.37371641 0.22269583 0.90041244 0.19275542 0.25337097 0.94797075
		 0.24594238 -0.23739938 0.93976265 0.24594238 -0.23739938 0.93976265 0.19275542 0.25337097
		 0.94797075 0.12231717 -0.25012887 0.96045512 0.97707266 0.18177955 0.11083876 0.92208219
		 0.32114384 0.21594238 0.91463143 0.0098127536 0.40416965 0.91463143 0.0098127536
		 0.40416965 0.92208219 0.32114384 0.21594238 0.85317612 0.070077516 0.51689422 0.99967945
		 0.0046092379 0.024894096 0.97707266 0.18177955 0.11083876 0.95052606 -0.074735932
		 0.30152076 0.95052606 -0.074735932 0.30152076 0.97707266 0.18177955 0.11083876 0.91463143
		 0.0098127536 0.40416965 0.98607475 -0.16506039 -0.020289628 0.99967945 0.0046092379
		 0.024894096 0.94814479 -0.18008037 0.26190171 0.94814479 -0.18008037 0.26190171 0.99967945
		 0.0046092379 0.024894096 0.95052606 -0.074735932 0.30152076 0.98607475 -0.16506039
		 -0.020289628 0.94814479 -0.18008037 0.26190171 0.9363203 -0.34840104 -0.043829739
		 0.9363203 -0.34840104 -0.043829739 0.94814479 -0.18008037 0.26190171 0.90823239 -0.29116482
		 0.30056113 0.9363203 -0.34840104 -0.043829739 0.90823239 -0.29116482 0.30056113 0.84453672
		 -0.53188986 -0.062055968 0.84453672 -0.53188986 -0.062055968 0.90823239 -0.29116482
		 0.30056113 0.85031396 -0.3886866 0.35480818 0.84453672 -0.53188986 -0.062055968 0.85031396
		 -0.3886866 0.35480818 0.7146498 -0.69683534 -0.060795769 0.7146498 -0.69683534 -0.060795769
		 0.85031396 -0.3886866 0.35480818 0.7619741 -0.46288836 0.4529126 0.7146498 -0.69683534
		 -0.060795769 0.7619741 -0.46288836 0.4529126 0.5661369 -0.82284057 -0.04921801 0.5661369
		 -0.82284057 -0.04921801 0.7619741 -0.46288836 0.4529126 0.65998846 -0.53541815 0.52701288
		 0.5661369 -0.82284057 -0.04921801 0.65998846 -0.53541815 0.52701288 0.37977138 -0.92462069
		 -0.029160375 0.37977138 -0.92462069 -0.029160375 0.65998846 -0.53541815 0.52701288
		 0.48542246 -0.58857763 0.6464839 0.1834712 -0.9830156 -0.0043255696 0.37977138 -0.92462069
		 -0.029160375 0.25235981 -0.63119704 0.73341995 0.25235981 -0.63119704 0.73341995
		 0.37977138 -0.92462069 -0.029160375 0.48542246 -0.58857763 0.6464839 -7.1947125e-06
		 -0.99999422 0.0033926775 0.1834712 -0.9830156 -0.0043255696 1.1086388e-05 -0.61910254
		 0.78531015 1.1086388e-05 -0.61910254 0.78531015 0.1834712 -0.9830156 -0.0043255696
		 0.25235981 -0.63119704 0.73341995 -7.1947125e-06 -0.99999422 0.0033926775 1.1086388e-05
		 -0.61910254 0.78531015 -0.18345521 -0.98301864 -0.004301853 -0.18345521 -0.98301864
		 -0.004301853 1.1086388e-05 -0.61910254 0.78531015 -0.25237826 -0.6311779 0.73343003
		 -0.18345521 -0.98301864 -0.004301853 -0.25237826 -0.6311779 0.73343003 -0.37997249
		 -0.92453855 -0.029144781 -0.37997249 -0.92453855 -0.029144781 -0.25237826 -0.6311779
		 0.73343003 -0.48624909 -0.58798444 0.64640242 -0.56699514 -0.82236117 -0.047313981
		 -0.37997249 -0.92453855 -0.029144781 -0.65957469 -0.5281027 0.53485405 -0.65957469
		 -0.5281027 0.53485405 -0.37997249 -0.92453855 -0.029144781 -0.48624909 -0.58798444
		 0.64640242 -0.71516794 -0.6964885 -0.058639407 -0.56699514 -0.82236117 -0.047313981
		 -0.75955397 -0.45584276 0.46398824 -0.75955397 -0.45584276 0.46398824 -0.56699514
		 -0.82236117 -0.047313981 -0.65957469 -0.5281027 0.53485405 -0.84460127 -0.53184831
		 -0.061530467 -0.71516794 -0.6964885 -0.058639407 -0.84927583 -0.38672286 0.35941058
		 -0.84927583 -0.38672286 0.35941058 -0.71516794 -0.6964885 -0.058639407 -0.75955397
		 -0.45584276 0.46398824 -0.93639964 -0.34837869 -0.042285524 -0.84460127 -0.53184831
		 -0.061530467 -0.90591663 -0.29030403 0.30828333 -0.90591663 -0.29030403 0.30828333
		 -0.84460127 -0.53184831 -0.061530467 -0.84927583 -0.38672286 0.35941058 -0.98607355
		 -0.16508795 -0.020121524 -0.93639964 -0.34837869 -0.042285524 -0.94773889 -0.18050131
		 0.26307842 -0.94773889 -0.18050131 0.26307842 -0.93639964 -0.34837869 -0.042285524
		 -0.90591663 -0.29030403 0.30828333 -0.98607355 -0.16508795 -0.020121524 -0.94773889
		 -0.18050131 0.26307842 -0.99967992 0.0045940285 0.024879795 -0.99967992 0.0045940285
		 0.024879795 -0.94773889 -0.18050131 0.26307842 -0.95059848 -0.075025432 0.30122045
		 -0.99967992 0.0045940285 0.024879795 -0.95059848 -0.075025432 0.30122045 -0.97708696
		 0.18197858 0.11038501 -0.97708696 0.18197858 0.11038501 -0.95059848 -0.075025432
		 0.30122045 -0.91584939 0.011287274 0.40136334 -0.97708696 0.18197858 0.11038501 -0.91584939
		 0.011287274 0.40136334 -0.9219147 0.32185048 0.21560514 -0.9219147 0.32185048 0.21560514
		 -0.91584939 0.011287274 0.40136334 -0.85403085 0.072135538 0.51519686 -0.9219147
		 0.32185048 0.21560514 -0.85403085 0.072135538 0.51519686 -0.83056396 0.45305797 0.32388565
		 -0.83056396 0.45305797 0.32388565 -0.85403085 0.072135538 0.51519686 -0.77298194
		 0.12765279 0.62145287 -0.66500509 0.1579586 0.72994334 -0.70601869 0.56867772 0.42207015
		 -0.77298194 0.12765279 0.62145287 -0.77298194 0.12765279 0.62145287 -0.70601869 0.56867772
		 0.42207015 -0.83056396 0.45305797 0.32388565 -0.70601869 0.56867772 0.42207015 -0.66500509
		 0.1579586 0.72994334 -0.55151832 0.67345411 0.49222669 -0.55151832 0.67345411 0.49222669
		 -0.66500509 0.1579586 0.72994334 -0.53306425 0.20010681 0.82207042;
	setAttr ".n[996:1161]" -type "float3"  -0.55151832 0.67345411 0.49222669 -0.53306425
		 0.20010681 0.82207042 -0.37670889 0.74324137 0.55288583 -0.37670889 0.74324137 0.55288583
		 -0.53306425 0.20010681 0.82207042 -0.37346181 0.22229095 0.90061814 -0.37670889 0.74324137
		 0.55288583 -0.37346181 0.22229095 0.90061814 -0.19355695 0.78818738 0.58420575 -0.19355695
		 0.78818738 0.58420575 -0.37346181 0.22229095 0.90061814 -0.19302244 0.25481901 0.94752818
		 -0.19355695 0.78818738 0.58420575 -0.19302244 0.25481901 0.94752818 2.7110267e-05
		 0.80665708 0.59101975 2.7110267e-05 0.80665708 0.59101975 -0.19302244 0.25481901
		 0.94752818 0.00013877671 0.26235649 0.96497101 0.19357386 0.78765196 0.5849219 2.7110267e-05
		 0.80665708 0.59101975 0.19275542 0.25337097 0.94797075 0.19275542 0.25337097 0.94797075
		 2.7110267e-05 0.80665708 0.59101975 0.00013877671 0.26235649 0.96497101 0.3768338
		 0.74312872 0.55295205 0.19357386 0.78765196 0.5849219 0.37371641 0.22269583 0.90041244
		 0.37371641 0.22269583 0.90041244 0.19357386 0.78765196 0.5849219 0.19275542 0.25337097
		 0.94797075 0.55164605 0.6720975 0.49393478 0.3768338 0.74312872 0.55295205 0.53146297
		 0.19640905 0.82399672 0.53146297 0.19640905 0.82399672 0.3768338 0.74312872 0.55295205
		 0.37371641 0.22269583 0.90041244 0.70569599 0.57016492 0.42060101 0.55164605 0.6720975
		 0.49393478 0.66706109 0.16273485 0.72701228 0.66706109 0.16273485 0.72701228 0.55164605
		 0.6720975 0.49393478 0.53146297 0.19640905 0.82399672 0.83045769 0.45438111 0.32230079
		 0.70569599 0.57016492 0.42060101 0.77709448 0.13477677 0.614784 0.77709448 0.13477677
		 0.614784 0.70569599 0.57016492 0.42060101 0.66706109 0.16273485 0.72701228 0.92208219
		 0.32114384 0.21594238 0.83045769 0.45438111 0.32230079 0.85317612 0.070077516 0.51689422
		 0.85317612 0.070077516 0.51689422 0.83045769 0.45438111 0.32230079 0.77709448 0.13477677
		 0.614784 0.025488971 0.99342752 -0.1115888 0.021933373 0.99869138 -0.046200376 0.036283147
		 0.99257123 -0.11612879 0.027330991 0.98015064 -0.19636133 0.028424954 0.9792276 -0.20076185
		 0.016977005 0.9808929 -0.19380626 0.014320244 0.98486871 -0.17270942 -0.01033839
		 0.98030055 -0.19724093 -0.00051810418 0.9829675 -0.18377863 -0.00051810418 0.9829675
		 -0.18377863 -0.01033839 0.98030055 -0.19724093 -0.015371389 0.97930419 -0.20180927
		 -0.01240135 0.98226076 -0.18710962 -0.011704195 0.98138601 -0.19168858 0.014332035
		 0.98207635 -0.18793781 0.030463839 0.97905922 -0.20128329 0.028516142 0.97912157
		 -0.20126534 0.017362731 0.98083842 -0.19404776 0.017362731 0.98083842 -0.19404776
		 0.028516142 0.97912157 -0.20126534 0.0074008834 0.98175561 -0.1900029 -0.0078467363
		 0.98167419 -0.19040523 -0.0014466489 0.9818002 -0.18991129 -0.018636679 0.98153532
		 -0.19037083 0.0091792503 0.98162609 -0.19059381 0.0074008834 0.98175561 -0.1900029
		 0.025847454 0.98117161 -0.19140063 0.025847454 0.98117161 -0.19140063 0.0074008834
		 0.98175561 -0.1900029 0.028755952 0.98138535 -0.18988378 -0.018636679 0.98153532
		 -0.19037083 -0.022061137 0.98067737 -0.19438431 -0.0078467363 0.98167419 -0.19040523
		 -0.0078467363 0.98167419 -0.19040523 -0.022061137 0.98067737 -0.19438431 -0.020842869
		 0.98037148 -0.19605453 -0.01240135 0.98226076 -0.18710962 0.014332035 0.98207635
		 -0.18793781 -0.010531281 0.98336107 -0.1813563 -0.010531281 0.98336107 -0.1813563
		 0.014332035 0.98207635 -0.18793781 0.016977005 0.9808929 -0.19380626 0.028424954
		 0.9792276 -0.20076185 0.028278874 0.97890484 -0.20235033 0.016977005 0.9808929 -0.19380626
		 0.016977005 0.9808929 -0.19380626 0.028278874 0.97890484 -0.20235033 0.02924596 0.97895294
		 -0.20197983 -0.037216883 0.97806984 -0.20492516 -0.035273142 0.97812873 -0.2049877
		 -0.020842869 0.98037148 -0.19605453 -0.020842869 0.98037148 -0.19605453 -0.035273142
		 0.97812873 -0.2049877 -0.034556162 0.97798556 -0.20579152 -0.034556162 0.97798556
		 -0.20579152 -0.034129892 0.97773737 -0.207038 -0.020842869 0.98037148 -0.19605453
		 -0.020842869 0.98037148 -0.19605453 -0.034129892 0.97773737 -0.207038 -0.013530301
		 0.98609298 -0.16564272 0.027330991 0.98015064 -0.19636133 0.016977005 0.9808929 -0.19380626
		 0.027025172 0.98072845 -0.19349761 0.027025172 0.98072845 -0.19349761 0.016977005
		 0.9808929 -0.19380626 0.014332035 0.98207635 -0.18793781 0.027305584 0.98427391 -0.1745259
		 0.014332035 0.98207635 -0.18793781 0.031533089 0.98450094 -0.17252125 0.031533089
		 0.98450094 -0.17252125 0.014332035 0.98207635 -0.18793781 0.014320244 0.98486871
		 -0.17270942 -0.036062535 0.98483026 -0.16973157 -0.039793048 0.98918307 -0.14118555
		 -0.022106459 0.98361266 -0.17893423 -0.022106459 0.98361266 -0.17893423 -0.039793048
		 0.98918307 -0.14118555 -0.02541915 0.9900586 -0.13833955 -0.020854704 0.9987781 -0.044803556
		 -0.020257374 0.99494255 -0.098381795 -0.036688007 0.99354804 -0.10731383 0.014320244
		 0.98486871 -0.17270942 -0.00051810418 0.9829675 -0.18377863 0.0032346742 0.99087799
		 -0.1347231 0.031533089 0.98450094 -0.17252125 0.014320244 0.98486871 -0.17270942
		 0.035521664 0.99099785 -0.12907931 0.027305584 0.98427391 -0.1745259 0.029207129
		 0.98303866 -0.18105774 0.014332035 0.98207635 -0.18793781 0.027025172 0.98072845
		 -0.19349761 0.014332035 0.98207635 -0.18793781 0.028800638 0.98175973 -0.1879317
		 0.028800638 0.98175973 -0.1879317 0.014332035 0.98207635 -0.18793781 0.029207129
		 0.98303866 -0.18105774 -0.00051810418 0.9829675 -0.18377863 -0.017451877 0.98004645
		 -0.19800086 -0.022106459 0.98361266 -0.17893423 -0.022106459 0.98361266 -0.17893423
		 -0.017451877 0.98004645 -0.19800086 -0.019052492 0.97917914 -0.20210186 -0.00051810418
		 0.9829675 -0.18377863 -0.015371389 0.97930419 -0.20180927 -0.017451877 0.98004645
		 -0.19800086 -0.004823863 0.97902209 -0.20369713 -0.036062535 0.98483026 -0.16973157
		 -0.017222285 0.97762656 -0.20964186 -0.017222285 0.97762656 -0.20964186 -0.036062535
		 0.98483026 -0.16973157 -0.022106459 0.98361266 -0.17893423 0.010266506 0.98088086
		 -0.19433816;
	setAttr ".n[1162:1327]" -type "float3"  -0.029421085 0.98468405 -0.17184795 -0.004823863
		 0.97902209 -0.20369713 -0.004823863 0.97902209 -0.20369713 -0.029421085 0.98468405
		 -0.17184795 -0.036062535 0.98483026 -0.16973157 -0.029421085 0.98468405 -0.17184795
		 0.010266506 0.98088086 -0.19433816 -0.028411111 0.98360199 -0.17810094 0.017509706
		 0.98362195 -0.17939121 -0.026256694 0.98088694 -0.1927989 -0.02660059 0.98185259
		 -0.18777093 -0.027431859 0.97951543 -0.19949198 -0.027704254 0.98033869 -0.19536768
		 0.0096154697 0.9851436 -0.1714633 -0.0078467363 0.98167419 -0.19040523 -0.020842869
		 0.98037148 -0.19605453 -0.015568924 0.9850508 -0.17155924 -0.015568924 0.9850508
		 -0.17155924 -0.020842869 0.98037148 -0.19605453 -0.015347347 0.98482221 -0.17288633
		 -0.013530301 0.98609298 -0.16564272 -0.015347347 0.98482221 -0.17288633 -0.020842869
		 0.98037148 -0.19605453 0.0074008834 0.98175561 -0.1900029 -0.010531281 0.98336107
		 -0.1813563 0.017362731 0.98083842 -0.19404776 0.017362731 0.98083842 -0.19404776
		 -0.010531281 0.98336107 -0.1813563 0.016977005 0.9808929 -0.19380626 -0.010531281
		 0.98336107 -0.1813563 0.0074008834 0.98175561 -0.1900029 -0.015383655 0.98446393
		 -0.17491163 -0.015383655 0.98446393 -0.17491163 0.0074008834 0.98175561 -0.1900029
		 -0.0078467363 0.98167419 -0.19040523 -0.0078467363 0.98167419 -0.19040523 -0.015568924
		 0.9850508 -0.17155924 -0.015383655 0.98446393 -0.17491163 0.021933373 0.99869138
		 -0.046200376 0.001253791 0.99972582 -0.023382369 0.013397996 0.9999038 -0.0035853693
		 -0.013252334 0.9998818 -0.0077962349 0.001253791 0.99972582 -0.023382369 -0.020854704
		 0.9987781 -0.044803556 0.011643963 0.99985266 0.012612369 0.001797453 0.99950927
		 0.031272728 0.010221565 0.99852622 0.053300064 0.010221565 0.99852622 0.053300064
		 0.001797453 0.99950927 0.031272728 0.0017418769 0.99712044 0.075814016 -0.012242986
		 0.99961746 0.024800431 -0.010770557 0.99865693 0.050678387 0.001797453 0.99950927
		 0.031272728 0.001797453 0.99950927 0.031272728 -0.010770557 0.99865693 0.050678387
		 -0.0010697377 0.99710083 0.076084144 0.0017418769 0.99712044 0.075814016 0.001797453
		 0.99950927 0.031272728 -0.0006434684 0.99680036 0.079928823 -0.0006434684 0.99680036
		 0.079928823 0.001797453 0.99950927 0.031272728 1.5042299e-05 0.99675936 0.080441169
		 -0.0010697377 0.99710083 0.076084144 0.001308878 0.99675643 0.080466434 0.001797453
		 0.99950927 0.031272728 0.001797453 0.99950927 0.031272728 0.001308878 0.99675643
		 0.080466434 1.5042299e-05 0.99675936 0.080441169 -0.14775704 0.19311918 0.96998602
		 -0.14630744 0.19316152 0.97019726 0.035223279 0.19514202 0.9801423 0.035223279 0.19514202
		 0.9801423 -0.14630744 0.19316152 0.97019726 0.035019007 0.19514352 0.98014933 0.99989104
		 0.0028818685 0.014478927 0.99269307 0.023561195 0.1183443 0.99988335 0.0029822113
		 0.014979157 0.99988335 0.0029822113 0.014979157 0.99269307 0.023561195 0.1183443
		 0.99264503 0.02363874 0.11873091 0.69107223 -0.14105758 -0.70888782 0.79627305 -0.11810046
		 -0.59329718 0.70623749 -0.13813116 -0.69436908 0.70623749 -0.13813116 -0.69436908
		 0.79627305 -0.11810046 -0.59329718 0.8019141 -0.11659212 -0.58595222 0.36407039 0.90560395
		 -0.2175643 -0.67212284 0.7377764 -0.062744901 0.32767034 0.88251859 -0.33733222 0.32767034
		 0.88251859 -0.33733222 -0.67212284 0.7377764 -0.062744901 -0.6049841 0.78032064 0.15841061
		 -0.055481568 -0.15715542 0.98601419 -0.055481628 -0.15715538 0.98601419 -0.37310359
		 -0.17145838 0.91180903 -0.37310359 -0.17145838 0.91180903 -0.055481628 -0.15715538
		 0.98601419 -0.37310362 -0.17145835 0.91180903 -0.78497946 -0.43267494 -0.44339556
		 -0.78497946 -0.432675 -0.44339556 -0.56072181 -0.47758484 -0.67639023 -0.56072181
		 -0.47758484 -0.67639023 -0.78497946 -0.432675 -0.44339556 -0.56072176 -0.47758481
		 -0.67639035 0.55805326 0.79969186 0.22151637 0.39904389 0.83030343 0.38905033 0.64821494
		 0.70237237 0.29409248 0.64821494 0.70237237 0.29409248 0.39904389 0.83030343 0.38905033
		 0.46455082 0.73956835 0.48706383 0.013397996 0.9999038 -0.0035853693 0.001253791
		 0.99972582 -0.023382369 0.011643963 0.99985266 0.012612369 0.011643963 0.99985266
		 0.012612369 0.001253791 0.99972582 -0.023382369 0.001797453 0.99950927 0.031272728
		 -0.41279534 0.17784809 0.89329171 -0.41044617 0.17805576 0.89433217 -0.2830517 0.18727574
		 0.94064313 -0.2830517 0.18727574 0.94064313 -0.41044617 0.17805576 0.89433217 -0.28069004
		 0.1874115 0.94132352 0.93656313 0.06843929 0.34375221 0.97454476 0.043776885 0.21987751
		 0.9367156 0.068359256 0.34335241 0.9367156 0.068359256 0.34335241 0.97454476 0.043776885
		 0.21987751 0.97462058 0.043711986 0.21955417 0.85442793 -0.10144287 -0.50957072 0.90503609
		 -0.083054416 -0.41714704 0.86080712 -0.099353909 -0.49913913 0.86080712 -0.099353909
		 -0.49913913 0.90503609 -0.083054416 -0.41714704 0.90764272 -0.081957333 -0.41166446
		 -0.90782762 0.081881218 0.41127181 -0.90807724 0.081775256 0.41074145 -0.96286726
		 0.052716319 0.26477841 -0.96286726 0.052716319 0.26477841 -0.90807724 0.081775256
		 0.41074145 -0.96298575 0.052633408 0.2643638 0.35655802 0.92965341 -0.092794798 0.30603975
		 0.95176619 0.021927396 -0.65822017 0.69340277 -0.29315326 -0.65822017 0.69340277
		 -0.29315326 0.30603975 0.95176619 0.021927396 -0.56496143 0.65264553 -0.5048489 -0.64572418
		 -0.20545958 0.73540914 -0.64572418 -0.20545961 0.73540914 -0.8404609 -0.25505778
		 0.47809103 -0.8404609 -0.25505778 0.47809103 -0.64572418 -0.20545961 0.73540914 -0.8404609
		 -0.25505781 0.47809097 -0.2688328 -0.50526941 -0.82001936 -0.2688328 -0.50526941
		 -0.82001936 0.05548149 -0.51238954 -0.85695899 0.05548149 -0.51238954 -0.85695899
		 -0.2688328 -0.50526941 -0.82001936 0.055481497 -0.5123896 -0.85695899 0.45822603
		 0.63844103 -0.61840278 0.5343169 0.51674831 -0.66893691 0.2646037 0.61196798 -0.74530536
		 0.2646037 0.61196798 -0.74530536 0.5343169 0.51674831 -0.66893691 0.31032223 0.48849604
		 -0.81551933 0.64943403 0.76033252 0.011396603 0.55805326 0.79969186 0.22151637;
	setAttr ".n[1328:1493]" -type "float3"  0.7534709 0.65550429 0.05094827 0.7534709
		 0.65550429 0.05094827 0.55805326 0.79969186 0.22151637 0.64821494 0.70237237 0.29409248
		 -0.0078467363 0.98167419 -0.19040523 0.0074008834 0.98175561 -0.1900029 -0.0014466489
		 0.9818002 -0.18991129 -0.0014466489 0.9818002 -0.18991129 0.0074008834 0.98175561
		 -0.1900029 0.0091792503 0.98162609 -0.19059381 -0.2830517 0.18727574 0.94064313 -0.28069004
		 0.1874115 0.94132352 -0.14775704 0.19311918 0.96998602 -0.14775704 0.19311918 0.96998602
		 -0.28069004 0.1874115 0.94132352 -0.14630744 0.19316152 0.97019726 0.97454476 0.043776885
		 0.21987751 0.99264503 0.02363874 0.11873091 0.97462058 0.043711986 0.21955417 0.97462058
		 0.043711986 0.21955417 0.99264503 0.02363874 0.11873091 0.99269307 0.023561195 0.1183443
		 0.79627305 -0.11810046 -0.59329718 0.85442793 -0.10144287 -0.50957072 0.8019141 -0.11659212
		 -0.58595222 0.8019141 -0.11659212 -0.58595222 0.85442793 -0.10144287 -0.50957072
		 0.86080712 -0.099353909 -0.49913913 0.94623095 -0.063165508 -0.31726497 0.95026916
		 -0.060809679 -0.3054353 0.94626337 -0.063146822 -0.31717208 0.94626337 -0.063146822
		 -0.31717208 0.95026916 -0.060809679 -0.3054353 0.95034635 -0.060763501 -0.30520427
		 0.014320244 0.98486871 -0.17270942 0.025488971 0.99342752 -0.1115888 0.035521664
		 0.99099785 -0.12907931 0.035521664 0.99099785 -0.12907931 0.025488971 0.99342752
		 -0.1115888 0.036283147 0.99257123 -0.11612879 0.36407039 0.90560395 -0.2175643 0.35655802
		 0.92965341 -0.092794798 -0.67212284 0.7377764 -0.062744901 -0.67212284 0.7377764
		 -0.062744901 0.35655802 0.92965341 -0.092794798 -0.65822017 0.69340277 -0.29315326
		 -0.37310359 -0.17145838 0.91180903 -0.37310362 -0.17145835 0.91180903 -0.64572418
		 -0.20545958 0.73540914 -0.64572418 -0.20545958 0.73540914 -0.37310362 -0.17145835
		 0.91180903 -0.64572418 -0.20545961 0.73540914 -0.56072181 -0.47758484 -0.67639023
		 -0.56072176 -0.47758481 -0.67639035 -0.2688328 -0.50526941 -0.82001936 -0.2688328
		 -0.50526941 -0.82001936 -0.56072176 -0.47758481 -0.67639035 -0.2688328 -0.50526941
		 -0.82001936 -0.00094530825 0.98637795 -0.16449189 -0.028900549 0.97911006 -0.2012665
		 0.0096154697 0.9851436 -0.1714633 0.0096154697 0.9851436 -0.1714633 -0.028900549
		 0.97911006 -0.2012665 -0.027431859 0.97951543 -0.19949198 -0.75365961 0.58975482
		 -0.29014897 -0.65822017 0.69340277 -0.29315326 -0.64576685 0.54204029 -0.53775233
		 -0.64576685 0.54204029 -0.53775233 -0.65822017 0.69340277 -0.29315326 -0.56496143
		 0.65264553 -0.5048489 -0.5412513 0.1641873 0.82467544 -0.53965914 0.16438779 0.82567835
		 -0.41279534 0.17784809 0.89329171 -0.41279534 0.17784809 0.89329171 -0.53965914 0.16438779
		 0.82567835 -0.41044617 0.17805576 0.89433217 0.9367156 0.068359256 0.34335241 0.88823253
		 0.08970207 0.45055139 0.93656313 0.06843929 0.34375221 0.93656313 0.06843929 0.34375221
		 0.88823253 0.08970207 0.45055139 0.88796169 0.089804769 0.45106441 0.90503609 -0.083054416
		 -0.41714704 0.92950875 -0.072013341 -0.36170095 0.90764272 -0.081957333 -0.41166446
		 0.90764272 -0.081957333 -0.41166446 0.92950875 -0.072013341 -0.36170095 0.9303993
		 -0.071571797 -0.35949215 -0.98912752 0.028714754 0.1442299 -0.98905647 0.028808342
		 0.14469759 -0.96298575 0.052633408 0.2643638 -0.96298575 0.052633408 0.2643638 -0.98905647
		 0.028808342 0.14469759 -0.96286726 0.052716319 0.26477841 0.014320244 0.98486871
		 -0.17270942 0.0032346742 0.99087799 -0.1347231 0.025488971 0.99342752 -0.1115888
		 0.025488971 0.99342752 -0.1115888 0.0032346742 0.99087799 -0.1347231 -0.0024400481
		 0.99501276 -0.099718072 0.30603975 0.95176619 0.021927396 0.2186086 0.96927512 0.11276535
		 -0.56496143 0.65264553 -0.5048489 -0.56496143 0.65264553 -0.5048489 0.2186086 0.96927512
		 0.11276535 -0.40364069 0.62074822 -0.67212045 -0.8404609 -0.25505778 0.47809103 -0.8404609
		 -0.25505781 0.47809097 -0.93382555 -0.31427085 0.17089078 -0.93382555 -0.31427085
		 0.17089078 -0.8404609 -0.25505781 0.47809097 -0.93382555 -0.31427085 0.17089069 0.05548149
		 -0.51238954 -0.85695899 0.055481497 -0.5123896 -0.85695899 0.37310374 -0.49808648
		 -0.78275377 0.37310374 -0.49808648 -0.78275377 0.055481497 -0.5123896 -0.85695899
		 0.37310377 -0.49808645 -0.78275377 0.0096154697 0.9851436 -0.1714633 -0.027704254
		 0.98033869 -0.19536768 0.017509706 0.98362195 -0.17939121 0.017509706 0.98362195
		 -0.17939121 -0.027704254 0.98033869 -0.19536768 -0.026256694 0.98088694 -0.1927989
		 -0.40364069 0.62074822 -0.67212045 -0.45690516 0.50446761 -0.73263228 -0.56496143
		 0.65264553 -0.5048489 -0.56496143 0.65264553 -0.5048489 -0.45690516 0.50446761 -0.73263228
		 -0.64576685 0.54204029 -0.53775233 -0.83737302 0.10673551 0.53610998 -0.83685559
		 0.1068907 0.53688645 -0.74921149 0.12932794 0.64958179 -0.74921149 0.12932794 0.64958179
		 -0.83685559 0.1068907 0.53688645 -0.74828601 0.12953293 0.65060687 0.72911221 0.13363573
		 0.67122042 0.6390574 0.15018772 0.75435358 0.72830802 0.13380392 0.67205948 0.72830802
		 0.13380392 0.67205948 0.6390574 0.15018772 0.75435358 0.63787037 0.15038113 0.75531912
		 0.0032010295 -0.19526137 -0.98074603 0.0033110012 -0.19524233 -0.98074943 -0.17386475
		 -0.19229512 -0.96581244 -0.17386475 -0.19229512 -0.96581244 0.0033110012 -0.19524233
		 -0.98074943 -0.17807084 -0.19205868 -0.96509284 -0.9465977 -0.062954955 -0.31621116
		 -0.9466362 -0.062932692 -0.3161003 -0.95473266 -0.05808261 -0.29173961 -0.95473266
		 -0.05808261 -0.29173961 -0.9466362 -0.062932692 -0.3161003 -0.95489907 -0.057977963
		 -0.29121521 -0.14546184 0.97726816 0.15423298 0.2646037 0.61196798 -0.74530536 -0.021630611
		 0.98284453 0.18316314 -0.021630611 0.98284453 0.18316314 0.2646037 0.61196798 -0.74530536
		 0.038127344 0.59910846 -0.79975957 -0.21860838 0.85791886 -0.46495759 0.39904389
		 0.83030343 0.38905033 -0.30603927 0.8754279 -0.37412018 -0.30603927 0.8754279 -0.37412018
		 0.39904389 0.83030343 0.38905033 0.55805326 0.79969186 0.22151637;
	setAttr ".n[1494:1659]" -type "float3"  0.84046096 -0.41448703 -0.34903559 0.84046096
		 -0.41448706 -0.34903556 0.93382549 -0.35527408 -0.04183599 0.93382549 -0.35527408
		 -0.04183599 0.84046096 -0.41448706 -0.34903556 0.93382549 -0.35527405 -0.041835975
		 0.038127344 0.59910846 -0.79975957 0.049446136 0.47649381 -0.87778628 -0.19405504
		 0.6020593 -0.77451092 -0.19405504 0.6020593 -0.77451092 0.049446136 0.47649381 -0.87778628
		 -0.21674398 0.48205832 -0.84890628 0.017509706 0.98362195 -0.17939121 -0.02660059
		 0.98185259 -0.18777093 0.018320339 0.98204398 -0.18776053 0.018320339 0.98204398
		 -0.18776053 -0.02660059 0.98185259 -0.18777093 -0.02649295 0.98268747 -0.18336712
		 0.19111679 0.84847528 0.49352214 -0.040891044 0.852144 0.5217073 0.22505637 0.76258552
		 0.60647583 0.22505637 0.76258552 0.60647583 -0.040891044 0.852144 0.5217073 -0.04111648
		 0.7687127 0.63827127 -0.76815343 0.63944495 -0.032411493 -0.67212284 0.7377764 -0.062744901
		 -0.75365961 0.58975482 -0.29014897 -0.75365961 0.58975482 -0.29014897 -0.67212284
		 0.7377764 -0.062744901 -0.65822017 0.69340277 -0.29315326 -0.037216883 0.97806984
		 -0.20492516 -0.020842869 0.98037148 -0.19605453 -0.022061137 0.98067737 -0.19438431
		 0.016977005 0.9808929 -0.19380626 0.02924596 0.97895294 -0.20197983 0.017362731 0.98083842
		 -0.19404776 0.017362731 0.98083842 -0.19404776 0.02924596 0.97895294 -0.20197983
		 0.030463839 0.97905922 -0.20128329 -0.6391989 0.15016448 0.75423825 -0.63802338 0.15035596
		 0.75519484 -0.5412513 0.1641873 0.82467544 -0.5412513 0.1641873 0.82467544 -0.63802338
		 0.15035596 0.75519484 -0.53965914 0.16438779 0.82567835 0.88823253 0.08970207 0.45055139
		 0.81977582 0.11182383 0.56166095 0.88796169 0.089804769 0.45106441 0.88796169 0.089804769
		 0.45106441 0.81977582 0.11182383 0.56166095 0.81923366 0.11197598 0.56242114 -0.33235753
		 -0.18409969 -0.92501122 -0.34533903 -0.18298285 -0.9204663 -0.53701907 -0.1646937
		 -0.82733697 -0.53701907 -0.1646937 -0.82733697 -0.34533903 -0.18298285 -0.9204663
		 -0.55052382 -0.16280708 -0.8187902 -0.98899043 -0.0288947 -0.14513123 -0.98911721
		 -0.028727947 -0.1442977 -0.99995708 0.0018087345 0.0090874732 -0.99995708 0.0018087345
		 0.0090874732 -0.98911721 -0.028727947 -0.1442977 -0.99994946 0.0019632112 0.0098605603
		 -0.93072647 -0.071413241 -0.35867587 -0.9315027 -0.071024917 -0.3567327 -0.94221795
		 -0.065413743 -0.32855186 -0.94221795 -0.065413743 -0.32855186 -0.9315027 -0.071024917
		 -0.3567327 -0.94240075 -0.065312847 -0.32804731 0.2186086 0.96927512 0.11276535 0.10480963
		 0.98006856 0.16876194 -0.40364069 0.62074822 -0.67212045 -0.40364069 0.62074822 -0.67212045
		 0.10480963 0.98006856 0.16876194 -0.19405504 0.6020593 -0.77451092 -0.93382555 -0.31427085
		 0.17089078 -0.93382555 -0.31427085 0.17089069 -0.91455698 -0.37595654 -0.14913811
		 -0.91455698 -0.37595654 -0.14913811 -0.93382555 -0.31427085 0.17089069 -0.91455704
		 -0.37595648 -0.14913806 0.37310374 -0.49808648 -0.78275377 0.37310377 -0.49808645
		 -0.78275377 0.64572436 -0.46408528 -0.60635376 0.64572436 -0.46408528 -0.60635376
		 0.37310377 -0.49808645 -0.78275377 0.6457243 -0.46408534 -0.60635376 0.2646037 0.61196798
		 -0.74530536 0.31032223 0.48849604 -0.81551933 0.038127344 0.59910846 -0.79975957
		 0.038127344 0.59910846 -0.79975957 0.31032223 0.48849604 -0.81551933 0.049446136
		 0.47649381 -0.87778628 -0.040891044 0.852144 0.5217073 -0.26885116 0.84092826 0.46963683
		 -0.04111648 0.7687127 0.63827127 -0.04111648 0.7687127 0.63827127 -0.26885116 0.84092826
		 0.46963683 -0.30215797 0.75728321 0.5789842 0.028755952 0.98138535 -0.18988378 0.0074008834
		 0.98175561 -0.1900029 0.028516142 0.97912157 -0.20126534 -0.99995708 0.0018087345
		 0.0090874732 -0.99994946 0.0019632112 0.0098605603 -0.98912752 0.028714754 0.1442299
		 -0.98912752 0.028714754 0.1442299 -0.99994946 0.0019632112 0.0098605603 -0.98905647
		 0.028808342 0.14469759 0.54144621 0.16416234 0.82455242 0.43843839 0.175493 0.88146126
		 0.53990906 0.16435647 0.82552111 0.53990906 0.16435647 0.82552111 0.43843839 0.175493
		 0.88146126 0.43653384 0.17567499 0.88236982 0.16707236 -0.19252551 -0.96696472 0.32887316
		 -0.18431059 -0.9262138 0.17051679 -0.19227625 -0.9664129 0.17051679 -0.19227625 -0.9664129
		 0.32887316 -0.18431059 -0.9262138 0.34320143 -0.18322989 -0.92121637 -0.90447247
		 -0.083283871 -0.41832206 -0.90730625 -0.08209718 -0.41237772 -0.93072647 -0.071413241
		 -0.35867587 -0.93072647 -0.071413241 -0.35867587 -0.90730625 -0.08209718 -0.41237772
		 -0.9315027 -0.071024917 -0.3567327 0.94198489 -0.065541744 -0.32919401 0.94623095
		 -0.063165508 -0.31726497 0.9421764 -0.065436341 -0.32866651 0.9421764 -0.065436341
		 -0.32866651 0.94623095 -0.063165508 -0.31726497 0.94626337 -0.063146822 -0.31717208
		 -0.25174847 0.96401209 0.085460134 -0.32767019 0.94467527 -0.014860622 0.45822603
		 0.63844103 -0.61840278 0.45822603 0.63844103 -0.61840278 -0.32767019 0.94467527 -0.014860622
		 0.59627163 0.67488307 -0.4347333 0.021630593 0.8443495 -0.53535604 -0.040891044 0.852144
		 0.5217073 -0.10480976 0.84712541 -0.52095437 -0.10480976 0.84712541 -0.52095437 -0.040891044
		 0.852144 0.5217073 0.19111679 0.84847528 0.49352214 0.91455704 -0.29358831 0.27819294
		 0.91455704 -0.29358831 0.27819294 0.78497946 -0.23687001 0.5724507 0.78497946 -0.23687001
		 0.5724507 0.91455704 -0.29358831 0.27819294 0.78497946 -0.23687001 0.5724507 -0.45690516
		 0.50446761 -0.73263228 -0.40364069 0.62074822 -0.67212045 -0.21674398 0.48205832
		 -0.84890628 -0.21674398 0.48205832 -0.84890628 -0.40364069 0.62074822 -0.67212045
		 -0.19405504 0.6020593 -0.77451092 0.69115847 0.55691218 -0.46059605 0.59627163 0.67488307
		 -0.4347333 0.7675252 0.60466331 -0.21280813 0.7675252 0.60466331 -0.21280813 0.59627163
		 0.67488307 -0.4347333 0.66262239 0.71705204 -0.21625885 -0.67212284 0.7377764 -0.062744901
		 -0.76815343 0.63944495 -0.032411493 -0.6049841 0.78032064 0.15841061 -0.6049841 0.78032064
		 0.15841061;
	setAttr ".n[1660:1825]" -type "float3"  -0.76815343 0.63944495 -0.032411493 -0.69133562
		 0.68814594 0.22025052 0.00049255748 0.99612606 0.087935455 -0.0006434684 0.99680036
		 0.079928823 1.5042299e-05 0.99675936 0.080441169 -0.74921149 0.12932794 0.64958179
		 -0.74828601 0.12953293 0.65060687 -0.6391989 0.15016448 0.75423825 -0.6391989 0.15016448
		 0.75423825 -0.74828601 0.12953293 0.65060687 -0.63802338 0.15035596 0.75519484 0.72830802
		 0.13380392 0.67205948 0.81923366 0.11197598 0.56242114 0.72911221 0.13363573 0.67122042
		 0.72911221 0.13363573 0.67122042 0.81923366 0.11197598 0.56242114 0.81977582 0.11182383
		 0.56166095 -0.17386475 -0.19229512 -0.96581244 -0.17807084 -0.19205868 -0.96509284
		 -0.33235753 -0.18409969 -0.92501122 -0.33235753 -0.18409969 -0.92501122 -0.17807084
		 -0.19205868 -0.96509284 -0.34533903 -0.18298285 -0.9204663 -0.95473266 -0.05808261
		 -0.29173961 -0.95489907 -0.057977963 -0.29121521 -0.98899043 -0.0288947 -0.14513123
		 -0.98899043 -0.0288947 -0.14513123 -0.95489907 -0.057977963 -0.29121521 -0.98911721
		 -0.028727947 -0.1442977 -0.94221795 -0.065413743 -0.32855186 -0.94240075 -0.065312847
		 -0.32804731 -0.9465977 -0.062954955 -0.31621116 -0.9465977 -0.062954955 -0.31621116
		 -0.94240075 -0.065312847 -0.32804731 -0.9466362 -0.062932692 -0.3161003 0.10480963
		 0.98006856 0.16876194 -0.021630611 0.98284453 0.18316314 -0.19405504 0.6020593 -0.77451092
		 -0.19405504 0.6020593 -0.77451092 -0.021630611 0.98284453 0.18316314 0.038127344
		 0.59910846 -0.79975957 -0.30603927 0.8754279 -0.37412018 0.55805326 0.79969186 0.22151637
		 -0.35655773 0.89754069 -0.25939807 -0.35655773 0.89754069 -0.25939807 0.55805326
		 0.79969186 0.22151637 0.64943403 0.76033252 0.011396603 0.64572436 -0.46408528 -0.60635376
		 0.6457243 -0.46408534 -0.60635376 0.84046096 -0.41448703 -0.34903559 0.84046096 -0.41448703
		 -0.34903559 0.6457243 -0.46408534 -0.60635376 0.84046096 -0.41448706 -0.34903556
		 -0.019052492 0.97917914 -0.20210186 -0.017222285 0.97762656 -0.20964186 -0.022106459
		 0.98361266 -0.17893423 0.66262239 0.71705204 -0.21625885 0.64943403 0.76033252 0.011396603
		 0.7675252 0.60466331 -0.21280813 0.7675252 0.60466331 -0.21280813 0.64943403 0.76033252
		 0.011396603 0.7534709 0.65550429 0.05094827 0.014320244 0.98486871 -0.17270942 0.014332035
		 0.98207635 -0.18793781 -0.01033839 0.98030055 -0.19724093 -0.01033839 0.98030055
		 -0.19724093 0.014332035 0.98207635 -0.18793781 -0.011704195 0.98138601 -0.19168858
		 -0.02541915 0.9900586 -0.13833955 -0.020257374 0.99494255 -0.098381795 0.0032346742
		 0.99087799 -0.1347231 0.0032346742 0.99087799 -0.1347231 -0.020257374 0.99494255
		 -0.098381795 -0.0024400481 0.99501276 -0.099718072 -0.68331718 -0.14257742 -0.71606511
		 -0.69910532 -0.13951716 -0.70127511 -0.8057217 -0.11565867 -0.58089215 -0.8057217
		 -0.11565867 -0.58089215 -0.69910532 -0.13951716 -0.70127511 -0.81322587 -0.11360687
		 -0.57075137 0.30557746 0.18592133 0.9338392 0.16809507 0.19248401 0.96679574 0.30315033
		 0.18607317 0.93459976 0.30315033 0.18607317 0.93459976 0.16809507 0.19248401 0.96679574
		 0.16635585 0.19254172 0.967085 0.97455293 -0.043770257 -0.21984249 0.99363679 -0.021993706
		 -0.11046363 0.97472382 -0.043624263 -0.21911265 0.97472382 -0.043624263 -0.21911265
		 0.99363679 -0.021993706 -0.11046363 0.99372756 -0.021835908 -0.10967544 0.5442332
		 -0.16392316 -0.82276326 0.69107223 -0.14105758 -0.70888782 0.55896401 -0.16191295
		 -0.81323022 0.55896401 -0.16191295 -0.81323022 0.69107223 -0.14105758 -0.70888782
		 0.70623749 -0.13813116 -0.69436908 0.92950875 -0.072013341 -0.36170095 0.94198489
		 -0.065541744 -0.32919401 0.9303993 -0.071571797 -0.35949215 0.9303993 -0.071571797
		 -0.35949215 0.94198489 -0.065541744 -0.32919401 0.9421764 -0.065436341 -0.32866651
		 -0.36407024 0.92158991 -0.13462865 -0.35655773 0.89754069 -0.25939807 0.66262239
		 0.71705204 -0.21625885 0.66262239 0.71705204 -0.21625885 -0.35655773 0.89754069 -0.25939807
		 0.64943403 0.76033252 0.011396603 0.1454618 0.84992588 -0.50642556 0.2517482 0.86318189
		 -0.43765271 -0.26885116 0.84092826 0.46963683 -0.26885116 0.84092826 0.46963683 0.2517482
		 0.86318189 -0.43765271 -0.46489322 0.81605947 0.34339657 0.5607217 -0.19196016 0.80544549
		 0.5607217 -0.19196016 0.80544549 0.26883233 -0.16427553 0.94907469 0.26883233 -0.16427553
		 0.94907469 0.5607217 -0.19196016 0.80544549 0.26883239 -0.16427554 0.94907463 0.59627163
		 0.67488307 -0.4347333 0.69115847 0.55691218 -0.46059605 0.45822603 0.63844103 -0.61840278
		 0.45822603 0.63844103 -0.61840278 0.69115847 0.55691218 -0.46059605 0.5343169 0.51674831
		 -0.66893691 -0.028900549 0.97911006 -0.2012665 -0.00094530825 0.98637795 -0.16449189
		 -0.030813206 0.97880077 -0.20248365 -0.00094530825 0.98637795 -0.16449189 -0.013530301
		 0.98609298 -0.16564272 -0.030813206 0.97880077 -0.20248365 -0.030813206 0.97880077
		 -0.20248365 -0.013530301 0.98609298 -0.16564272 -0.034129892 0.97773737 -0.207038
		 -0.0024400481 0.99501276 -0.099718072 -0.020257374 0.99494255 -0.098381795 0.001253791
		 0.99972582 -0.023382369 0.001253791 0.99972582 -0.023382369 -0.020257374 0.99494255
		 -0.098381795 -0.020854704 0.9987781 -0.044803556 -0.90807724 0.081775256 0.41074145
		 -0.90782762 0.081881218 0.41127181 -0.83737302 0.10673551 0.53610998 -0.83737302
		 0.10673551 0.53610998 -0.90782762 0.081881218 0.41127181 -0.83685559 0.1068907 0.53688645
		 0.6390574 0.15018772 0.75435358 0.54144621 0.16416234 0.82455242 0.63787037 0.15038113
		 0.75531912 0.63787037 0.15038113 0.75531912 0.54144621 0.16416234 0.82455242 0.53990906
		 0.16435647 0.82552111 0.0032010295 -0.19526137 -0.98074603 0.16707236 -0.19252551
		 -0.96696472 0.0033110012 -0.19524233 -0.98074943 0.0033110012 -0.19524233 -0.98074943
		 0.16707236 -0.19252551 -0.96696472 0.17051679 -0.19227625 -0.9664129 -0.25174847
		 0.96401209 0.085460134 0.45822603 0.63844103 -0.61840278 -0.14546184 0.97726816 0.15423298
		 -0.14546184 0.97726816 0.15423298 0.45822603 0.63844103 -0.61840278;
	setAttr ".n[1826:1991]" -type "float3"  0.2646037 0.61196798 -0.74530536 -0.21860838
		 0.85791886 -0.46495759 -0.10480976 0.84712541 -0.52095437 0.39904389 0.83030343 0.38905033
		 0.39904389 0.83030343 0.38905033 -0.10480976 0.84712541 -0.52095437 0.19111679 0.84847528
		 0.49352214 0.93382549 -0.35527408 -0.04183599 0.93382549 -0.35527405 -0.041835975
		 0.91455704 -0.29358831 0.27819294 0.91455704 -0.29358831 0.27819294 0.93382549 -0.35527405
		 -0.041835975 0.91455704 -0.29358831 0.27819294 -8.3409657e-05 0.99629682 0.085980266
		 1.5042299e-05 0.99675936 0.080441169 0.001308878 0.99675643 0.080466434 -0.53701907
		 -0.1646937 -0.82733697 -0.55052382 -0.16280708 -0.8187902 -0.68331718 -0.14257742
		 -0.71606511 -0.68331718 -0.14257742 -0.71606511 -0.55052382 -0.16280708 -0.8187902
		 -0.69910532 -0.13951716 -0.70127511 0.16809507 0.19248401 0.96679574 0.035223279
		 0.19514202 0.9801423 0.16635585 0.19254172 0.967085 0.16635585 0.19254172 0.967085
		 0.035223279 0.19514202 0.9801423 0.035019007 0.19514352 0.98014933 0.99363679 -0.021993706
		 -0.11046363 0.99989104 0.0028818685 0.014478927 0.99372756 -0.021835908 -0.10967544
		 0.99372756 -0.021835908 -0.10967544 0.99989104 0.0028818685 0.014478927 0.99988335
		 0.0029822113 0.014979157 0.32887316 -0.18431059 -0.9262138 0.5442332 -0.16392316
		 -0.82276326 0.34320143 -0.18322989 -0.92121637 0.34320143 -0.18322989 -0.92121637
		 0.5442332 -0.16392316 -0.82276326 0.55896401 -0.16191295 -0.81323022 0.2517482 0.86318189
		 -0.43765271 0.32767034 0.88251859 -0.33733222 -0.46489322 0.81605947 0.34339657 -0.46489322
		 0.81605947 0.34339657 0.32767034 0.88251859 -0.33733222 -0.6049841 0.78032064 0.15841061
		 0.26883233 -0.16427553 0.94907469 0.26883239 -0.16427554 0.94907463 -0.055481568
		 -0.15715542 0.98601419 -0.055481568 -0.15715542 0.98601419 0.26883239 -0.16427554
		 0.94907463 -0.055481628 -0.15715538 0.98601419 -0.91455698 -0.37595654 -0.14913811
		 -0.91455704 -0.37595648 -0.14913806 -0.78497946 -0.43267494 -0.44339556 -0.78497946
		 -0.43267494 -0.44339556 -0.91455704 -0.37595648 -0.14913806 -0.78497946 -0.432675
		 -0.44339556 -0.26885116 0.84092826 0.46963683 -0.46489322 0.81605947 0.34339657 -0.30215797
		 0.75728321 0.5789842 -0.30215797 0.75728321 0.5789842 -0.46489322 0.81605947 0.34339657
		 -0.5270263 0.72966343 0.43570006 0.001797453 0.99950927 0.031272728 0.001253791 0.99972582
		 -0.023382369 -0.012242986 0.99961746 0.024800431 -0.012242986 0.99961746 0.024800431
		 0.001253791 0.99972582 -0.023382369 -0.013252334 0.9998818 -0.0077962349 -0.022106459
		 0.98361266 -0.17893423 -0.02541915 0.9900586 -0.13833955 -0.00051810418 0.9829675
		 -0.18377863 -0.00051810418 0.9829675 -0.18377863 -0.02541915 0.9900586 -0.13833955
		 0.0032346742 0.99087799 -0.1347231 -0.8057217 -0.11565867 -0.58089215 -0.81322587
		 -0.11360687 -0.57075137 -0.86056828 -0.099448942 -0.49953189 -0.86056828 -0.099448942
		 -0.49953189 -0.81322587 -0.11360687 -0.57075137 -0.86521125 -0.097888686 -0.49175939
		 0.43843839 0.175493 0.88146126 0.30557746 0.18592133 0.9338392 0.43653384 0.17567499
		 0.88236982 0.43653384 0.17567499 0.88236982 0.30557746 0.18592133 0.9338392 0.30315033
		 0.18607317 0.93459976 0.95026916 -0.060809679 -0.3054353 0.97455293 -0.043770257
		 -0.21984249 0.95034635 -0.060763501 -0.30520427 0.95034635 -0.060763501 -0.30520427
		 0.97455293 -0.043770257 -0.21984249 0.97472382 -0.043624263 -0.21911265 -0.86056828
		 -0.099448942 -0.49953189 -0.86521125 -0.097888686 -0.49175939 -0.90447247 -0.083283871
		 -0.41832206 -0.90447247 -0.083283871 -0.41832206 -0.86521125 -0.097888686 -0.49175939
		 -0.90730625 -0.08209718 -0.41237772 -0.020257374 0.99494255 -0.098381795 -0.02541915
		 0.9900586 -0.13833955 -0.036688007 0.99354804 -0.10731383 -0.036688007 0.99354804
		 -0.10731383 -0.02541915 0.9900586 -0.13833955 -0.039793048 0.98918307 -0.14118555
		 -0.36407024 0.92158991 -0.13462865 0.66262239 0.71705204 -0.21625885 -0.32767019
		 0.94467527 -0.014860622 -0.32767019 0.94467527 -0.014860622 0.66262239 0.71705204
		 -0.21625885 0.59627163 0.67488307 -0.4347333 0.1454618 0.84992588 -0.50642556 -0.26885116
		 0.84092826 0.46963683 0.021630593 0.8443495 -0.53535604 0.021630593 0.8443495 -0.53535604
		 -0.26885116 0.84092826 0.46963683 -0.040891044 0.852144 0.5217073 0.78497946 -0.23687001
		 0.5724507 0.78497946 -0.23687001 0.5724507 0.5607217 -0.19196016 0.80544549 0.5607217
		 -0.19196016 0.80544549 0.78497946 -0.23687001 0.5724507 0.5607217 -0.19196016 0.80544549
		 -0.02649295 0.98268747 -0.18336712 -0.028411111 0.98360199 -0.17810094 0.018320339
		 0.98204398 -0.18776053 0.018320339 0.98204398 -0.18776053 -0.028411111 0.98360199
		 -0.17810094 0.010266506 0.98088086 -0.19433816 0.39904389 0.83030343 0.38905033 0.19111679
		 0.84847528 0.49352214 0.46455082 0.73956835 0.48706383 0.46455082 0.73956835 0.48706383
		 0.19111679 0.84847528 0.49352214 0.22505637 0.76258552 0.60647583 -0.5270263 0.72966343
		 0.43570006 -0.46489322 0.81605947 0.34339657 -0.69133562 0.68814594 0.22025052 -0.69133562
		 0.68814594 0.22025052 -0.46489322 0.81605947 0.34339657 -0.6049841 0.78032064 0.15841061
		 -0.0024400481 0.99501276 -0.099718072 0.001253791 0.99972582 -0.023382369 0.025488971
		 0.99342752 -0.1115888 0.025488971 0.99342752 -0.1115888 0.001253791 0.99972582 -0.023382369
		 0.021933373 0.99869138 -0.046200376 0.00074659684 0.9999997 -7.0979811e-05 0.0007469423
		 0.9999997 -7.2928473e-05 0.00074694317 0.9999997 -7.0947302e-05 0.00074664009 0.9999997
		 -7.1976086e-05 0.00074686838 0.9999997 -7.328279e-05 0.00074686873 0.9999997 -7.2192241e-05
		 0.34238681 -0.00018318059 0.93955904 0.64308751 -0.0004218602 0.76579255 0.34238684
		 -0.0001834585 0.93955904 0.34238684 -0.0001834585 0.93955904 0.64308751 -0.0004218602
		 0.76579255 0.64308769 -0.0004218976 0.76579243 0.00074673357 0.9999997 -7.3060117e-05
		 0.00074663997 0.9999997 -7.2876479e-05 0.00074660819 0.9999997 -7.339655e-05 0.00074660819
		 0.9999997 -7.339655e-05 0.00074663997 0.9999997 -7.2876479e-05 0.00074662175 0.9999997
		 -7.2990239e-05;
	setAttr ".n[1992:2157]" -type "float3"  0.34238681 -0.00018318059 0.93955904
		 0.34238684 -0.0001834585 0.93955904 0.00038789271 7.6612894e-05 0.99999994 0.00038789271
		 7.6612894e-05 0.99999994 0.34238684 -0.0001834585 0.93955904 0.00038809419 7.5961165e-05
		 0.99999994 -0.3416529 0.00032357397 0.93982613 -0.34165323 0.00032449223 0.93982601
		 0.00038809419 7.5961165e-05 0.99999994 0.00038809419 7.5961165e-05 0.99999994 -0.34165323
		 0.00032449223 0.93982601 0.00038789271 7.6612894e-05 0.99999994 0.0007469423 0.9999997
		 -7.2928473e-05 0.00074659684 0.9999997 -7.0979811e-05 0.00074659655 0.9999997 -7.2049224e-05
		 0.00074659655 0.9999997 -7.2049224e-05 0.00074659684 0.9999997 -7.0979811e-05 0.00074676191
		 0.9999997 -7.2975614e-05 -0.6424886 0.00053438696 0.76629502 -0.64248872 0.00053448934
		 0.76629496 -0.3416529 0.00032357397 0.93982613 -0.3416529 0.00032357397 0.93982613
		 -0.64248872 0.00053448934 0.76629496 -0.34165323 0.00032449223 0.93982601 0.00074659655
		 0.9999997 -7.2049224e-05 0.00074676191 0.9999997 -7.2975614e-05 0.00074665301 0.9999997
		 -7.3238909e-05 0.00074665301 0.9999997 -7.3238909e-05 0.00074676191 0.9999997 -7.2975614e-05
		 0.00074683363 0.9999997 -7.3016236e-05 -0.98473942 0.00074709923 0.17403348 -0.98473942
		 0.00074710092 0.17403361 -0.86583114 0.00068239972 0.50033587 -0.86583114 0.00068239972
		 0.50033587 -0.98473942 0.00074710092 0.17403361 -0.86583096 0.00068222743 0.50033611
		 0.00074672507 0.9999997 -7.2613184e-05 0.00074662175 0.9999997 -7.2990239e-05 0.00074662169
		 0.9999997 -7.3221025e-05 0.00074662169 0.9999997 -7.3221025e-05 0.00074662175 0.9999997
		 -7.2990239e-05 0.00074663997 0.9999997 -7.2876479e-05 -0.86583114 0.00068239972 0.50033587
		 -0.86583096 0.00068222743 0.50033611 -0.6424886 0.00053438696 0.76629502 -0.6424886
		 0.00053438696 0.76629502 -0.86583096 0.00068222743 0.50033611 -0.64248872 0.00053448934
		 0.76629496 0.00074683363 0.9999997 -7.3016236e-05 0.00074672507 0.9999997 -7.2613184e-05
		 0.00074665301 0.9999997 -7.3238909e-05 0.00074665301 0.9999997 -7.3238909e-05 0.00074672507
		 0.9999997 -7.2613184e-05 0.00074662169 0.9999997 -7.3221025e-05 0.86583054 -0.00068417686
		 -0.50033689 0.98473948 -0.00074769853 -0.17403343 0.86583096 -0.00068410457 -0.50033617
		 0.86583096 -0.00068410457 -0.50033617 0.98473948 -0.00074769853 -0.17403343 0.9847396
		 -0.00074769865 -0.17403263 -0.64308751 0.00042190086 -0.76579255 -0.64308828 0.00042123123
		 -0.76579195 -0.86621922 0.0006088732 -0.4996638 -0.86621922 0.0006088732 -0.4996638
		 -0.64308828 0.00042123123 -0.76579195 -0.86621904 0.00060923398 -0.49966407 0.98487508
		 -0.00072110089 0.17326427 0.86621946 -0.00060752087 0.49966338 0.98487496 -0.00072109676
		 0.17326511 0.98487496 -0.00072109676 0.17326511 0.86621946 -0.00060752087 0.49966338
		 0.8662191 -0.00060775661 0.49966401 -0.00038873102 -7.1007409e-05 -0.99999994 -0.34238544
		 0.00018844641 -0.93955958 -0.00038970599 -6.9747846e-05 -0.99999994 -0.00038970599
		 -6.9747846e-05 -0.99999994 -0.34238544 0.00018844641 -0.93955958 -0.34238505 0.00018948819
		 -0.9395597 0.98473948 -0.00074769853 -0.17403343 0.98487508 -0.00072110089 0.17326427
		 0.9847396 -0.00074769865 -0.17403263 0.9847396 -0.00074769865 -0.17403263 0.98487508
		 -0.00072110089 0.17326427 0.98487496 -0.00072109676 0.17326511 -0.64308828 0.00042123123
		 -0.76579195 -0.64308751 0.00042190086 -0.76579255 -0.34238544 0.00018844641 -0.93955958
		 -0.34238544 0.00018844641 -0.93955958 -0.64308751 0.00042190086 -0.76579255 -0.34238505
		 0.00018948819 -0.9395597 0.86621946 -0.00060752087 0.49966338 0.64308769 -0.0004218976
		 0.76579243 0.8662191 -0.00060775661 0.49966401 0.8662191 -0.00060775661 0.49966401
		 0.64308769 -0.0004218976 0.76579243 0.64308751 -0.0004218602 0.76579255 -0.00038970599
		 -6.9747846e-05 -0.99999994 0.3416529 -0.00032592082 -0.93982613 -0.00038873102 -7.1007409e-05
		 -0.99999994 -0.00038873102 -7.1007409e-05 -0.99999994 0.3416529 -0.00032592082 -0.93982613
		 0.34165406 -0.00032717062 -0.93982571 -0.98487502 0.00072169403 -0.17326465 -0.98487508
		 0.00072169129 -0.17326455 -0.98473942 0.00074709923 0.17403348 -0.98473942 0.00074709923
		 0.17403348 -0.98487508 0.00072169129 -0.17326455 -0.98473942 0.00074710092 0.17403361
		 0.6424877 -0.00053828431 -0.76629585 0.86583054 -0.00068417686 -0.50033689 0.64248818
		 -0.00053821929 -0.76629543 0.64248818 -0.00053821929 -0.76629543 0.86583054 -0.00068417686
		 -0.50033689 0.86583096 -0.00068410457 -0.50033617 0.00074663962 0.9999997 -7.2887844e-05
		 0.00074670179 0.9999997 -7.3250274e-05 0.00074660819 0.9999997 -7.339655e-05 0.00074660819
		 0.9999997 -7.339655e-05 0.00074670179 0.9999997 -7.3250274e-05 0.00074673357 0.9999997
		 -7.3060117e-05 -0.86621922 0.0006088732 -0.4996638 -0.86621904 0.00060923398 -0.49966407
		 -0.98487502 0.00072169403 -0.17326465 -0.98487502 0.00072169403 -0.17326465 -0.86621904
		 0.00060923398 -0.49966407 -0.98487508 0.00072169129 -0.17326455 0.3416529 -0.00032592082
		 -0.93982613 0.6424877 -0.00053828431 -0.76629585 0.34165406 -0.00032717062 -0.93982571
		 0.34165406 -0.00032717062 -0.93982571 0.6424877 -0.00053828431 -0.76629585 0.64248818
		 -0.00053821929 -0.76629543 0.00074686838 0.9999997 -7.328279e-05 0.00074664009 0.9999997
		 -7.1976086e-05 0.00074663962 0.9999997 -7.2887844e-05 0.00074663962 0.9999997 -7.2887844e-05
		 0.00074664009 0.9999997 -7.1976086e-05 0.00074670179 0.9999997 -7.3250274e-05 0.19685917
		 0.94442493 -0.26326412 0.067283362 0.92772835 -0.36714166 -0.012814744 0.98962951
		 -0.14307064 -0.012814744 0.98962951 -0.14307064 0.067283362 0.92772835 -0.36714166
		 -0.099592991 0.92599976 -0.36415061 -0.099592991 0.92599976 -0.36415061 -0.22568204
		 0.9400481 -0.25568968 -0.012814744 0.98962951 -0.14307064 -0.012814744 0.98962951
		 -0.14307064 -0.22568204 0.9400481 -0.25568968 -0.25198349 0.96329921 -0.092514358
		 -0.25198349 0.96329921 -0.092514358 -0.16619545 0.98487353 0.049022753 -0.012814744
		 0.98962951 -0.14307064 -0.012814744 0.98962951 -0.14307064 -0.16619545 0.98487353
		 0.049022753 -0.0084615694 0.99467653 0.10269832 -0.0084615694 0.99467653 0.10269832
		 0.14741598 0.98812193 0.043400094 -0.012814744 0.98962951 -0.14307064 -0.012814744
		 0.98962951 -0.14307064 0.14741598 0.98812193 0.043400094 0.22850421 0.96827632 -0.10112784
		 0.19685917 0.94442493 -0.26326412 -0.012814744 0.98962951 -0.14307064 0.22850421
		 0.96827632 -0.10112784 0.071245298 0.9319815 -0.35543582;
	setAttr ".n[2158:2323]" -type "float3"  -0.015299965 0.9909991 -0.13299133 0.19784537
		 0.94836754 -0.24790376 0.19784537 0.94836754 -0.24790376 -0.015299965 0.9909991 -0.13299133
		 0.22492632 0.97068518 -0.08472573 0.071245298 0.9319815 -0.35543582 -0.095635399
		 0.92919481 -0.35700268 -0.015299965 0.9909991 -0.13299133 -0.015299965 0.9909991
		 -0.13299133 -0.095635399 0.92919481 -0.35700268 -0.22470784 0.9413116 -0.25187072
		 -0.22470784 0.9413116 -0.25187072 -0.25557676 0.96266156 -0.089237124 -0.015299965
		 0.9909991 -0.13299133 -0.015299965 0.9909991 -0.13299133 -0.25557676 0.96266156 -0.089237124
		 -0.17380238 0.98325467 0.054799333 -0.17380238 0.98325467 0.054799333 -0.017649043
		 0.99345571 0.11284618 -0.015299965 0.9909991 -0.13299133 -0.015299965 0.9909991 -0.13299133
		 -0.017649043 0.99345571 0.11284618 0.13982005 0.98849177 0.057744283 0.22492632 0.97068518
		 -0.08472573 -0.015299965 0.9909991 -0.13299133 0.13982005 0.98849177 0.057744283
		 -0.42605114 0.77031672 -0.4744392 -0.3080461 0.75160569 -0.58326364 -0.76329899 0.058262914
		 -0.64341283 -0.76329899 0.058262914 -0.64341283 -0.3080461 0.75160569 -0.58326364
		 -0.51379973 0.042322151 -0.85686564 -0.18126957 0.01666292 -0.98329228 -0.51379973
		 0.042322151 -0.85686564 -0.093961939 0.75629228 -0.64745122 -0.093961939 0.75629228
		 -0.64745122 -0.51379973 0.042322151 -0.85686564 -0.3080461 0.75160569 -0.58326364
		 0.14707404 0.031833678 -0.98861307 -0.18126957 0.01666292 -0.98329228 0.067467757
		 0.73630017 -0.6732831 0.067467757 0.73630017 -0.6732831 -0.18126957 0.01666292 -0.98329228
		 -0.093961939 0.75629228 -0.64745122 -0.5598253 0.81886089 -0.12673795 -0.54036278
		 0.79174602 -0.28486195 -0.9891296 0.14645743 -0.013148392 -0.9891296 0.14645743 -0.013148392
		 -0.54036278 0.79174602 -0.28486195 -0.93528473 0.11221951 -0.33563265 -0.76329899
		 0.058262914 -0.64341283 -0.93528473 0.11221951 -0.33563265 -0.42605114 0.77031672
		 -0.4744392 -0.42605114 0.77031672 -0.4744392 -0.93528473 0.11221951 -0.33563265 -0.54036278
		 0.79174602 -0.28486195 -0.53534961 0.83940935 0.093769677 -0.5598253 0.81886089 -0.12673795
		 -0.920165 0.20882118 0.33119491 -0.920165 0.20882118 0.33119491 -0.5598253 0.81886089
		 -0.12673795 -0.9891296 0.14645743 -0.013148392 -0.43036917 0.87665492 0.21507783
		 -0.53534961 0.83940935 0.093769677 -0.75309098 0.23997967 0.61258775 -0.75309098
		 0.23997967 0.61258775 -0.53534961 0.83940935 0.093769677 -0.920165 0.20882118 0.33119491
		 -0.27572173 0.88385212 0.3778663 -0.43036917 0.87665492 0.21507783 -0.47551551 0.28692478
		 0.83160037 -0.47551551 0.28692478 0.83160037 -0.43036917 0.87665492 0.21507783 -0.75309098
		 0.23997967 0.61258775 -0.11476793 0.90793109 0.40309978 -0.27572173 0.88385212 0.3778663
		 -0.16562913 0.2950685 0.94101095 -0.16562913 0.2950685 0.94101095 -0.27572173 0.88385212
		 0.3778663 -0.47551551 0.28692478 0.83160037 0.10796443 0.89635772 0.42998439 -0.11476793
		 0.90793109 0.40309978 0.19060519 0.30998543 0.93143904 0.19060519 0.30998543 0.93143904
		 -0.11476793 0.90793109 0.40309978 -0.16562913 0.2950685 0.94101095 0.24947488 0.90441132
		 0.34612495 0.10796443 0.89635772 0.42998439 0.49837545 0.28594786 0.81844717 0.49837545
		 0.28594786 0.81844717 0.10796443 0.89635772 0.42998439 0.19060519 0.30998543 0.93143904
		 0.42941764 0.87679112 0.21642043 0.24947488 0.90441132 0.34612495 0.76651508 0.26721314
		 0.58399636 0.76651508 0.26721314 0.58399636 0.24947488 0.90441132 0.34612495 0.49837545
		 0.28594786 0.81844717 0.50244874 0.86151373 0.07307104 0.42941764 0.87679112 0.21642043
		 0.92822868 0.21688525 0.30224544 0.92822868 0.21688525 0.30224544 0.42941764 0.87679112
		 0.21642043 0.76651508 0.26721314 0.58399636 0.55539882 0.81983316 -0.13930456 0.50244874
		 0.86151373 0.07307104 0.98273879 0.17862083 -0.048156302 0.98273879 0.17862083 -0.048156302
		 0.50244874 0.86151373 0.07307104 0.92822868 0.21688525 0.30224544 0.49918699 0.81507975
		 -0.29403624 0.55539882 0.81983316 -0.13930456 0.92279744 0.12019587 -0.36605716 0.92279744
		 0.12019587 -0.36605716 0.55539882 0.81983316 -0.13930456 0.98273879 0.17862083 -0.048156302
		 0.40024838 0.77422345 -0.49028486 0.49918699 0.81507975 -0.29403624 0.73810226 0.085662358
		 -0.66922867 0.73810226 0.085662358 -0.66922867 0.49918699 0.81507975 -0.29403624
		 0.92279744 0.12019587 -0.36605716 0.27101612 0.76311535 -0.58669007 0.40024838 0.77422345
		 -0.49028486 0.48462224 0.041121654 -0.87375641 0.48462224 0.041121654 -0.87375641
		 0.40024838 0.77422345 -0.49028486 0.73810226 0.085662358 -0.66922867 0.48462224 0.041121654
		 -0.87375641 0.14707404 0.031833678 -0.98861307 0.27101612 0.76311535 -0.58669007
		 0.27101612 0.76311535 -0.58669007 0.14707404 0.031833678 -0.98861307 0.067467757
		 0.73630017 -0.6732831 -0.093961939 0.75629228 -0.64745122 -0.3080461 0.75160569 -0.58326364
		 -0.099592991 0.92599976 -0.36415061 -0.54036278 0.79174602 -0.28486195 -0.22568204
		 0.9400481 -0.25568968 -0.42605114 0.77031672 -0.4744392 -0.5598253 0.81886089 -0.12673795
		 -0.53534961 0.83940935 0.093769677 -0.25198349 0.96329921 -0.092514358 -0.43036917
		 0.87665492 0.21507783 -0.27572173 0.88385212 0.3778663 -0.16619545 0.98487353 0.049022753
		 0.10796443 0.89635772 0.42998439 -0.0084615694 0.99467653 0.10269832 -0.11476793
		 0.90793109 0.40309978 0.42941764 0.87679112 0.21642043 0.14741598 0.98812193 0.043400094
		 0.24947488 0.90441132 0.34612495 0.50244874 0.86151373 0.07307104 0.55539882 0.81983316
		 -0.13930456 0.22850421 0.96827632 -0.10112784 0.40024838 0.77422345 -0.49028486 0.19685917
		 0.94442493 -0.26326412 0.49918699 0.81507975 -0.29403624 0.27101612 0.76311535 -0.58669007
		 0.067467757 0.73630017 -0.6732831 0.067283362 0.92772835 -0.36714166 0.42941764 0.87679112
		 0.21642043 0.50244874 0.86151373 0.07307104 0.14741598 0.98812193 0.043400094 0.14741598
		 0.98812193 0.043400094 0.50244874 0.86151373 0.07307104;
	setAttr ".n[2324:2489]" -type "float3"  0.22850421 0.96827632 -0.10112784 0.18961801
		 0.14289165 0.97140467 0.19060519 0.30998543 0.93143904 -0.15760218 0.13929504 0.97762901
		 -0.15760218 0.13929504 0.97762901 0.19060519 0.30998543 0.93143904 -0.16562913 0.2950685
		 0.94101095 0.24947488 0.90441132 0.34612495 0.14741598 0.98812193 0.043400094 0.10796443
		 0.89635772 0.42998439 0.10796443 0.89635772 0.42998439 0.14741598 0.98812193 0.043400094
		 -0.0084615694 0.99467653 0.10269832 -0.48581561 0.11889777 0.86593682 -0.47551551
		 0.28692478 0.83160037 -0.75543153 0.084159285 0.6498003 -0.75543153 0.084159285 0.6498003
		 -0.47551551 0.28692478 0.83160037 -0.75309098 0.23997967 0.61258775 -0.47551551 0.28692478
		 0.83160037 -0.48581561 0.11889777 0.86593682 -0.16562913 0.2950685 0.94101095 -0.16562913
		 0.2950685 0.94101095 -0.48581561 0.11889777 0.86593682 -0.15760218 0.13929504 0.97762901
		 -0.920165 0.20882118 0.33119491 -0.93393201 0.039270021 0.35528699 -0.75309098 0.23997967
		 0.61258775 -0.75309098 0.23997967 0.61258775 -0.93393201 0.039270021 0.35528699 -0.75543153
		 0.084159285 0.6498003 0.14707404 0.031833678 -0.98861307 0.15760507 -0.1392954 -0.97762847
		 -0.18126957 0.01666292 -0.98329228 -0.18126957 0.01666292 -0.98329228 0.15760507
		 -0.1392954 -0.97762847 -0.18962038 -0.14289127 -0.97140425 -0.11476793 0.90793109
		 0.40309978 -0.0084615694 0.99467653 0.10269832 -0.27572173 0.88385212 0.3778663 -0.27572173
		 0.88385212 0.3778663 -0.0084615694 0.99467653 0.10269832 -0.16619545 0.98487353 0.049022753
		 -0.99978572 -0.010355532 0.017924169 -0.93393201 0.039270021 0.35528699 -0.9891296
		 0.14645743 -0.013148392 -0.9891296 0.14645743 -0.013148392 -0.93393201 0.039270021
		 0.35528699 -0.920165 0.20882118 0.33119491 0.48581439 -0.11889811 -0.86593741 0.15760507
		 -0.1392954 -0.97762847 0.48462224 0.041121654 -0.87375641 0.48462224 0.041121654
		 -0.87375641 0.15760507 -0.1392954 -0.97762847 0.14707404 0.031833678 -0.98861307
		 -0.93528473 0.11221951 -0.33563265 -0.94505048 -0.058732446 -0.32160541 -0.9891296
		 0.14645743 -0.013148392 -0.9891296 0.14645743 -0.013148392 -0.94505048 -0.058732446
		 -0.32160541 -0.99978572 -0.010355532 0.017924169 0.48462224 0.041121654 -0.87375641
		 0.73810226 0.085662358 -0.66922867 0.48581439 -0.11889811 -0.86593741 0.48581439
		 -0.11889811 -0.86593741 0.73810226 0.085662358 -0.66922867 0.75543243 -0.0841593
		 -0.64979929 -0.43036917 0.87665492 0.21507783 -0.16619545 0.98487353 0.049022753
		 -0.53534961 0.83940935 0.093769677 -0.53534961 0.83940935 0.093769677 -0.16619545
		 0.98487353 0.049022753 -0.25198349 0.96329921 -0.092514358 -0.093961939 0.75629228
		 -0.64745122 -0.099592991 0.92599976 -0.36415061 0.067467757 0.73630017 -0.6732831
		 0.067467757 0.73630017 -0.6732831 -0.099592991 0.92599976 -0.36415061 0.067283362
		 0.92772835 -0.36714166 -0.94505048 -0.058732446 -0.32160541 -0.93528473 0.11221951
		 -0.33563265 -0.77632874 -0.10002431 -0.62234139 -0.77632874 -0.10002431 -0.62234139
		 -0.93528473 0.11221951 -0.33563265 -0.76329899 0.058262914 -0.64341283 0.93393135
		 -0.039270554 -0.35528877 0.75543243 -0.0841593 -0.64979929 0.92279744 0.12019587
		 -0.36605716 0.92279744 0.12019587 -0.36605716 0.75543243 -0.0841593 -0.64979929 0.73810226
		 0.085662358 -0.66922867 0.76651508 0.26721314 0.58399636 0.77632874 0.10002444 0.62234133
		 0.92822868 0.21688525 0.30224544 0.92822868 0.21688525 0.30224544 0.77632874 0.10002444
		 0.62234133 0.94505137 0.058731806 0.32160303 -0.76329899 0.058262914 -0.64341283
		 -0.51379973 0.042322151 -0.85686564 -0.77632874 -0.10002431 -0.62234139 -0.77632874
		 -0.10002431 -0.62234139 -0.51379973 0.042322151 -0.85686564 -0.51396972 -0.12925319
		 -0.84801459 0.92279744 0.12019587 -0.36605716 0.98273879 0.17862083 -0.048156302
		 0.93393135 -0.039270554 -0.35528877 0.93393135 -0.039270554 -0.35528877 0.98273879
		 0.17862083 -0.048156302 0.99978578 0.010355292 -0.017921872 -0.54036278 0.79174602
		 -0.28486195 -0.5598253 0.81886089 -0.12673795 -0.22568204 0.9400481 -0.25568968 -0.22568204
		 0.9400481 -0.25568968 -0.5598253 0.81886089 -0.12673795 -0.25198349 0.96329921 -0.092514358
		 0.40024838 0.77422345 -0.49028486 0.27101612 0.76311535 -0.58669007 0.19685917 0.94442493
		 -0.26326412 0.19685917 0.94442493 -0.26326412 0.27101612 0.76311535 -0.58669007 0.067283362
		 0.92772835 -0.36714166 -0.18962038 -0.14289127 -0.97140425 -0.51396972 -0.12925319
		 -0.84801459 -0.18126957 0.01666292 -0.98329228 -0.18126957 0.01666292 -0.98329228
		 -0.51396972 -0.12925319 -0.84801459 -0.51379973 0.042322151 -0.85686564 0.94505137
		 0.058731806 0.32160303 0.99978578 0.010355292 -0.017921872 0.92822868 0.21688525
		 0.30224544 0.92822868 0.21688525 0.30224544 0.99978578 0.010355292 -0.017921872 0.98273879
		 0.17862083 -0.048156302 0.49837545 0.28594786 0.81844717 0.19060519 0.30998543 0.93143904
		 0.51397097 0.12925309 0.84801382 0.51397097 0.12925309 0.84801382 0.19060519 0.30998543
		 0.93143904 0.18961801 0.14289165 0.97140467 -0.3080461 0.75160569 -0.58326364 -0.42605114
		 0.77031672 -0.4744392 -0.099592991 0.92599976 -0.36415061 -0.099592991 0.92599976
		 -0.36415061 -0.42605114 0.77031672 -0.4744392 -0.22568204 0.9400481 -0.25568968 0.49918699
		 0.81507975 -0.29403624 0.19685917 0.94442493 -0.26326412 0.55539882 0.81983316 -0.13930456
		 0.55539882 0.81983316 -0.13930456 0.19685917 0.94442493 -0.26326412 0.22850421 0.96827632
		 -0.10112784 0.51397097 0.12925309 0.84801382 0.77632874 0.10002444 0.62234133 0.49837545
		 0.28594786 0.81844717 0.49837545 0.28594786 0.81844717 0.77632874 0.10002444 0.62234133
		 0.76651508 0.26721314 0.58399636 -0.41796935 0.77269202 -0.47775379 -0.29693779 0.75586689
		 -0.58351797 -0.74591935 0.060415454 -0.66329056 -0.74591935 0.060415454 -0.66329056
		 -0.29693779 0.75586689 -0.58351797 -0.4906221 0.048283231 -0.87003374 -0.15462698
		 0.026017303 -0.98763031 -0.4906221 0.048283231 -0.87003374 -0.084900007 0.75462902
		 -0.65063584;
	setAttr ".n[2490:2655]" -type "float3"  -0.084900007 0.75462902 -0.65063584 -0.4906221
		 0.048283231 -0.87003374 -0.29693779 0.75586689 -0.58351797 0.17363517 0.043263253
		 -0.9838593 -0.15462698 0.026017303 -0.98763031 0.076644652 0.75209498 -0.65458292
		 0.076644652 0.75209498 -0.65458292 -0.15462698 0.026017303 -0.98763031 -0.084900007
		 0.75462902 -0.65063584 -0.56143904 0.81670594 -0.13333258 -0.53751856 0.79139692
		 -0.29114377 -0.98933095 0.14050294 -0.038512405 -0.98933095 0.14050294 -0.038512405
		 -0.53751856 0.79139692 -0.29114377 -0.92653644 0.11003344 -0.35975382 -0.74591935
		 0.060415454 -0.66329056 -0.92653644 0.11003344 -0.35975382 -0.41796935 0.77269202
		 -0.47775379 -0.41796935 0.77269202 -0.47775379 -0.92653644 0.11003344 -0.35975382
		 -0.53751856 0.79139692 -0.29114377 -0.54309094 0.83505386 0.087961853 -0.56143904
		 0.81670594 -0.13333258 -0.93013799 0.19962078 0.30821237 -0.93013799 0.19962078 0.30821237
		 -0.56143904 0.81670594 -0.13333258 -0.98933095 0.14050294 -0.038512405 -0.44168335
		 0.87165034 0.21246529 -0.54309094 0.83505386 0.087961853 -0.77096474 0.22880755 0.59435719
		 -0.77096474 0.22880755 0.59435719 -0.54309094 0.83505386 0.087961853 -0.93013799
		 0.19962078 0.30821237 -0.29156017 0.87806344 0.37946966 -0.44168335 0.87165034 0.21246529
		 -0.49974117 0.27512583 0.82131881 -0.49974117 0.27512583 0.82131881 -0.44168335 0.87165034
		 0.21246529 -0.77096474 0.22880755 0.59435719 -0.13150796 0.90286195 0.40932372 -0.29156017
		 0.87806344 0.37946966 -0.19299713 0.28400993 0.93919671 -0.19299713 0.28400993 0.93919671
		 -0.29156017 0.87806344 0.37946966 -0.49974117 0.27512583 0.82131881 0.090485394 0.89237213
		 0.44213614 -0.13150796 0.90286195 0.40932372 0.16326217 0.30121866 0.93947476 0.16326217
		 0.30121866 0.93947476 -0.13150796 0.90286195 0.40932372 -0.19299713 0.28400993 0.93919671
		 0.23416653 0.90218878 0.36224505 0.090485394 0.89237213 0.44213614 0.47413394 0.28027898
		 0.83465004 0.47413394 0.28027898 0.83465004 0.090485394 0.89237213 0.44213614 0.16326217
		 0.30121866 0.93947476 0.41773909 0.87705809 0.23719853 0.23416653 0.90218878 0.36224505
		 0.74865115 0.26569167 0.60739559 0.74865115 0.26569167 0.60739559 0.23416653 0.90218878
		 0.36224505 0.47413394 0.28027898 0.83465004 0.49472982 0.86375767 0.095734738 0.41773909
		 0.87705809 0.23719853 0.91827023 0.21936212 0.32963619 0.91827023 0.21936212 0.32963619
		 0.41773909 0.87705809 0.23719853 0.74865115 0.26569167 0.60739559 0.54311675 0.83119851
		 -0.11888331 0.49472982 0.86375767 0.095734738 0.98251301 0.18516636 -0.019534877
		 0.98251301 0.18516636 -0.019534877 0.49472982 0.86375767 0.095734738 0.91827023 0.21936212
		 0.32963619 0.51082826 0.81407017 -0.27630472 0.54311675 0.83119851 -0.11888331 0.93159676
		 0.12976232 -0.33954275 0.93159676 0.12976232 -0.33954275 0.54311675 0.83119851 -0.11888331
		 0.98251301 0.18516636 -0.019534877 0.41810077 0.77433121 -0.47497678 0.51082826 0.81407017
		 -0.27630472 0.75542164 0.097322814 -0.64797097 0.75542164 0.097322814 -0.64797097
		 0.51082826 0.81407017 -0.27630472 0.93159676 0.12976232 -0.33954275 0.27840361 0.77880388
		 -0.56209958 0.41810077 0.77433121 -0.47497678 0.50787675 0.053404327 -0.85977274
		 0.50787675 0.053404327 -0.85977274 0.41810077 0.77433121 -0.47497678 0.75542164 0.097322814
		 -0.64797097 0.50787675 0.053404327 -0.85977274 0.17363517 0.043263253 -0.9838593
		 0.27840361 0.77880388 -0.56209958 0.27840361 0.77880388 -0.56209958 0.17363517 0.043263253
		 -0.9838593 0.076644652 0.75209498 -0.65458292 -0.29693779 0.75586689 -0.58351797
		 -0.095635399 0.92919481 -0.35700268 -0.084900007 0.75462902 -0.65063584 -0.41796935
		 0.77269202 -0.47775379 -0.53751856 0.79139692 -0.29114377 -0.22470784 0.9413116 -0.25187072
		 -0.56143904 0.81670594 -0.13333258 -0.54309094 0.83505386 0.087961853 -0.25557676
		 0.96266156 -0.089237124 -0.44168335 0.87165034 0.21246529 -0.29156017 0.87806344
		 0.37946966 -0.17380238 0.98325467 0.054799333 0.090485394 0.89237213 0.44213614 -0.017649043
		 0.99345571 0.11284618 -0.13150796 0.90286195 0.40932372 0.41773909 0.87705809 0.23719853
		 0.13982005 0.98849177 0.057744283 0.23416653 0.90218878 0.36224505 0.49472982 0.86375767
		 0.095734738 0.54311675 0.83119851 -0.11888331 0.22492632 0.97068518 -0.08472573 0.41810077
		 0.77433121 -0.47497678 0.19784537 0.94836754 -0.24790376 0.51082826 0.81407017 -0.27630472
		 0.076644652 0.75209498 -0.65458292 0.071245298 0.9319815 -0.35543582 0.27840361 0.77880388
		 -0.56209958 0.41773909 0.87705809 0.23719853 0.49472982 0.86375767 0.095734738 0.13982005
		 0.98849177 0.057744283 0.13982005 0.98849177 0.057744283 0.49472982 0.86375767 0.095734738
		 0.22492632 0.97068518 -0.08472573 0.16226658 0.13370502 0.97764641 0.16326217 0.30121866
		 0.93947476 -0.1849643 0.12790702 0.97438598 -0.1849643 0.12790702 0.97438598 0.16326217
		 0.30121866 0.93947476 -0.19299713 0.28400993 0.93919671 -0.49974117 0.27512583 0.82131881
		 -0.50988746 0.10668086 0.85360056 -0.19299713 0.28400993 0.93919671 -0.19299713 0.28400993
		 0.93919671 -0.50988746 0.10668086 0.85360056 -0.1849643 0.12790702 0.97438598 0.23416653
		 0.90218878 0.36224505 0.13982005 0.98849177 0.057744283 0.090485394 0.89237213 0.44213614
		 0.090485394 0.89237213 0.44213614 0.13982005 0.98849177 0.057744283 -0.017649043
		 0.99345571 0.11284618 -0.50988746 0.10668086 0.85360056 -0.49974117 0.27512583 0.82131881
		 -0.77331078 0.072587527 0.62985831 -0.77331078 0.072587527 0.62985831 -0.49974117
		 0.27512583 0.82131881 -0.77096474 0.22880755 0.59435719 -0.93013799 0.19962078 0.30821237
		 -0.94346189 0.029739851 0.3301442 -0.77096474 0.22880755 0.59435719 -0.77096474 0.22880755
		 0.59435719 -0.94346189 0.029739851 0.3301442 -0.77331078 0.072587527 0.62985831 0.17363517
		 0.043263253 -0.9838593 0.18496613 -0.12790696 -0.97438562 -0.15462698 0.026017303
		 -0.98763031 -0.15462698 0.026017303 -0.98763031;
	setAttr ".n[2656:2821]" -type "float3"  0.18496613 -0.12790696 -0.97438562 -0.16226943
		 -0.13370489 -0.97764599 -0.92653644 0.11003344 -0.35975382 -0.9355787 -0.061117284
		 -0.34778899 -0.98933095 0.14050294 -0.038512405 -0.98933095 0.14050294 -0.038512405
		 -0.9355787 -0.061117284 -0.34778899 -0.99981654 -0.016695999 -0.0093856072 0.75542164
		 0.097322814 -0.64797097 0.77331132 -0.07258743 -0.62985766 0.50787675 0.053404327
		 -0.85977274 0.50787675 0.053404327 -0.85977274 0.77331132 -0.07258743 -0.62985766
		 0.50988668 -0.1066809 -0.85360104 -0.13150796 0.90286195 0.40932372 -0.017649043
		 0.99345571 0.11284618 -0.29156017 0.87806344 0.37946966 -0.29156017 0.87806344 0.37946966
		 -0.017649043 0.99345571 0.11284618 -0.17380238 0.98325467 0.054799333 -0.99981654
		 -0.016695999 -0.0093856072 -0.94346189 0.029739851 0.3301442 -0.98933095 0.14050294
		 -0.038512405 -0.98933095 0.14050294 -0.038512405 -0.94346189 0.029739851 0.3301442
		 -0.93013799 0.19962078 0.30821237 0.50988668 -0.1066809 -0.85360104 0.18496613 -0.12790696
		 -0.97438562 0.50787675 0.053404327 -0.85977274 0.50787675 0.053404327 -0.85977274
		 0.18496613 -0.12790696 -0.97438562 0.17363517 0.043263253 -0.9838593 -0.44168335
		 0.87165034 0.21246529 -0.17380238 0.98325467 0.054799333 -0.54309094 0.83505386 0.087961853
		 -0.54309094 0.83505386 0.087961853 -0.17380238 0.98325467 0.054799333 -0.25557676
		 0.96266156 -0.089237124 0.076644652 0.75209498 -0.65458292 -0.084900007 0.75462902
		 -0.65063584 0.071245298 0.9319815 -0.35543582 0.071245298 0.9319815 -0.35543582 -0.084900007
		 0.75462902 -0.65063584 -0.095635399 0.92919481 -0.35700268 -0.9355787 -0.061117284
		 -0.34778899 -0.92653644 0.11003344 -0.35975382 -0.75849694 -0.098167673 -0.64424026
		 -0.75849694 -0.098167673 -0.64424026 -0.92653644 0.11003344 -0.35975382 -0.74591935
		 0.060415454 -0.66329056 0.77331132 -0.07258743 -0.62985766 0.75542164 0.097322814
		 -0.64797097 0.94346124 -0.029738838 -0.33014616 0.94346124 -0.029738838 -0.33014616
		 0.75542164 0.097322814 -0.64797097 0.93159676 0.12976232 -0.33954275 -0.4906221 0.048283231
		 -0.87003374 -0.48992744 -0.12337679 -0.86298859 -0.74591935 0.060415454 -0.66329056
		 -0.74591935 0.060415454 -0.66329056 -0.48992744 -0.12337679 -0.86298859 -0.75849694
		 -0.098167673 -0.64424026 0.93159676 0.12976232 -0.33954275 0.98251301 0.18516636
		 -0.019534877 0.94346124 -0.029738838 -0.33014616 0.94346124 -0.029738838 -0.33014616
		 0.98251301 0.18516636 -0.019534877 0.99981654 0.016696246 0.0093879281 -0.53751856
		 0.79139692 -0.29114377 -0.56143904 0.81670594 -0.13333258 -0.22470784 0.9413116 -0.25187072
		 -0.22470784 0.9413116 -0.25187072 -0.56143904 0.81670594 -0.13333258 -0.25557676
		 0.96266156 -0.089237124 0.27840361 0.77880388 -0.56209958 0.071245298 0.9319815 -0.35543582
		 0.41810077 0.77433121 -0.47497678 0.41810077 0.77433121 -0.47497678 0.071245298 0.9319815
		 -0.35543582 0.19784537 0.94836754 -0.24790376 -0.16226943 -0.13370489 -0.97764599
		 -0.48992744 -0.12337679 -0.86298859 -0.15462698 0.026017303 -0.98763031 -0.15462698
		 0.026017303 -0.98763031 -0.48992744 -0.12337679 -0.86298859 -0.4906221 0.048283231
		 -0.87003374 0.99981654 0.016696246 0.0093879281 0.98251301 0.18516636 -0.019534877
		 0.93557966 0.061117526 0.34778631 0.93557966 0.061117526 0.34778631 0.98251301 0.18516636
		 -0.019534877 0.91827023 0.21936212 0.32963619 0.74865115 0.26569167 0.60739559 0.75849688
		 0.098167501 0.64424032 0.91827023 0.21936212 0.32963619 0.91827023 0.21936212 0.32963619
		 0.75849688 0.098167501 0.64424032 0.93557966 0.061117526 0.34778631 0.16326217 0.30121866
		 0.93947476 0.16226658 0.13370502 0.97764641 0.47413394 0.28027898 0.83465004 0.47413394
		 0.28027898 0.83465004 0.16226658 0.13370502 0.97764641 0.48992977 0.12337656 0.86298728
		 -0.29693779 0.75586689 -0.58351797 -0.41796935 0.77269202 -0.47775379 -0.095635399
		 0.92919481 -0.35700268 -0.095635399 0.92919481 -0.35700268 -0.41796935 0.77269202
		 -0.47775379 -0.22470784 0.9413116 -0.25187072 0.54311675 0.83119851 -0.11888331 0.51082826
		 0.81407017 -0.27630472 0.22492632 0.97068518 -0.08472573 0.22492632 0.97068518 -0.08472573
		 0.51082826 0.81407017 -0.27630472 0.19784537 0.94836754 -0.24790376 0.48992977 0.12337656
		 0.86298728 0.75849688 0.098167501 0.64424032 0.47413394 0.28027898 0.83465004 0.47413394
		 0.28027898 0.83465004 0.75849688 0.098167501 0.64424032 0.74865115 0.26569167 0.60739559
		 -0.01033839 0.98030055 -0.19724093 -0.64576685 0.54204029 -0.53775233 -0.015371389
		 0.97930419 -0.20180927 -0.015371389 0.97930419 -0.20180927 -0.64576685 0.54204029
		 -0.53775233 -0.45690516 0.50446761 -0.73263228 -0.64576685 0.54204029 -0.53775233
		 -0.01033839 0.98030055 -0.19724093 -0.75365961 0.58975482 -0.29014897 -0.75365961
		 0.58975482 -0.29014897 -0.01033839 0.98030055 -0.19724093 -0.011704195 0.98138601
		 -0.19168858 -0.75365961 0.58975482 -0.29014897 -0.011704195 0.98138601 -0.19168858
		 -0.76815343 0.63944495 -0.032411493 -0.76815343 0.63944495 -0.032411493 -0.011704195
		 0.98138601 -0.19168858 -0.01240135 0.98226076 -0.18710962 -0.010531281 0.98336107
		 -0.1813563 -0.69133562 0.68814594 0.22025052 -0.01240135 0.98226076 -0.18710962 -0.01240135
		 0.98226076 -0.18710962 -0.69133562 0.68814594 0.22025052 -0.76815343 0.63944495 -0.032411493
		 -0.69133562 0.68814594 0.22025052 -0.010531281 0.98336107 -0.1813563 -0.5270263 0.72966343
		 0.43570006 -0.5270263 0.72966343 0.43570006 -0.010531281 0.98336107 -0.1813563 -0.015383655
		 0.98446393 -0.17491163 -0.015383655 0.98446393 -0.17491163 -0.015568924 0.9850508
		 -0.17155924 -0.5270263 0.72966343 0.43570006 -0.5270263 0.72966343 0.43570006 -0.015568924
		 0.9850508 -0.17155924 -0.30215797 0.75728321 0.5789842 -0.015568924 0.9850508 -0.17155924
		 -0.015347347 0.98482221 -0.17288633 -0.30215797 0.75728321 0.5789842 -0.30215797
		 0.75728321 0.5789842 -0.015347347 0.98482221 -0.17288633 -0.04111648 0.7687127 0.63827127
		 -0.015347347 0.98482221 -0.17288633 -0.013530301 0.98609298 -0.16564272;
	setAttr ".n[2822:2987]" -type "float3"  -0.04111648 0.7687127 0.63827127 -0.04111648
		 0.7687127 0.63827127 -0.013530301 0.98609298 -0.16564272 0.22505637 0.76258552 0.60647583
		 -0.013530301 0.98609298 -0.16564272 -0.00094530825 0.98637795 -0.16449189 0.22505637
		 0.76258552 0.60647583 0.22505637 0.76258552 0.60647583 -0.00094530825 0.98637795
		 -0.16449189 0.46455082 0.73956835 0.48706383 -0.00094530825 0.98637795 -0.16449189
		 0.0096154697 0.9851436 -0.1714633 0.46455082 0.73956835 0.48706383 0.46455082 0.73956835
		 0.48706383 0.0096154697 0.9851436 -0.1714633 0.64821494 0.70237237 0.29409248 0.0096154697
		 0.9851436 -0.1714633 0.017509706 0.98362195 -0.17939121 0.64821494 0.70237237 0.29409248
		 0.64821494 0.70237237 0.29409248 0.017509706 0.98362195 -0.17939121 0.7534709 0.65550429
		 0.05094827 0.017509706 0.98362195 -0.17939121 0.018320339 0.98204398 -0.18776053
		 0.7534709 0.65550429 0.05094827 0.7534709 0.65550429 0.05094827 0.018320339 0.98204398
		 -0.18776053 0.7675252 0.60466331 -0.21280813 0.7675252 0.60466331 -0.21280813 0.018320339
		 0.98204398 -0.18776053 0.69115847 0.55691218 -0.46059605 0.69115847 0.55691218 -0.46059605
		 0.018320339 0.98204398 -0.18776053 0.010266506 0.98088086 -0.19433816 -0.004823863
		 0.97902209 -0.20369713 0.5343169 0.51674831 -0.66893691 0.010266506 0.98088086 -0.19433816
		 0.010266506 0.98088086 -0.19433816 0.5343169 0.51674831 -0.66893691 0.69115847 0.55691218
		 -0.46059605 -0.017222285 0.97762656 -0.20964186 0.31032223 0.48849604 -0.81551933
		 -0.004823863 0.97902209 -0.20369713 -0.004823863 0.97902209 -0.20369713 0.31032223
		 0.48849604 -0.81551933 0.5343169 0.51674831 -0.66893691 -0.019052492 0.97917914 -0.20210186
		 0.049446136 0.47649381 -0.87778628 -0.017222285 0.97762656 -0.20964186 -0.017222285
		 0.97762656 -0.20964186 0.049446136 0.47649381 -0.87778628 0.31032223 0.48849604 -0.81551933
		 -0.017451877 0.98004645 -0.19800086 -0.21674398 0.48205832 -0.84890628 -0.019052492
		 0.97917914 -0.20210186 -0.019052492 0.97917914 -0.20210186 -0.21674398 0.48205832
		 -0.84890628 0.049446136 0.47649381 -0.87778628 -0.015371389 0.97930419 -0.20180927
		 -0.45690516 0.50446761 -0.73263228 -0.017451877 0.98004645 -0.19800086 -0.017451877
		 0.98004645 -0.19800086 -0.45690516 0.50446761 -0.73263228 -0.21674398 0.48205832
		 -0.84890628 0.042327259 -0.82064033 -0.56987536 0.29196784 -0.79374748 -0.53359133
		 0.32334986 -0.71186829 -0.62344879 0.49264908 -0.78348863 -0.37873796 0.65769517
		 -0.72779667 -0.1942911 0.72838914 -0.6388315 -0.24767636 0.7124598 -0.69979596 0.05183319
		 0.71567881 -0.63241601 0.29640144 0.792606 -0.53319967 0.29575974 0.792606 -0.53319967
		 0.29575974 0.71567881 -0.63241601 0.29640144 0.59889704 -0.6087209 0.52036637 0.43878353
		 -0.55223668 0.70887494 0.2051046 -0.55288154 0.80762249 0.48594961 -0.44439906 0.75257057
		 -0.28465429 -0.55840623 0.77920109 -0.50530493 -0.56288719 0.65408325 -0.55961812
		 -0.45619497 0.69189137 -0.55961812 -0.45619497 0.69189137 -0.50530493 -0.56288719
		 0.65408325 -0.64122593 -0.62270963 0.44839939 -0.73075831 -0.64873397 0.2124536 -0.80930561
		 -0.5512709 0.20279244 -0.64122593 -0.62270963 0.44839939 -0.64122593 -0.62270963
		 0.44839939 -0.80930561 -0.5512709 0.20279244 -0.55961812 -0.45619497 0.69189137 -0.73075831
		 -0.64873397 0.2124536 -0.69775999 -0.71570289 -0.030006269 -0.80930561 -0.5512709
		 0.20279244 -0.61427641 -0.7421456 -0.26811269 -0.42779902 -0.79387093 -0.43215385
		 -0.68030512 -0.65472209 -0.32942969 -0.68030512 -0.65472209 -0.32942969 -0.42779902
		 -0.79387093 -0.43215385 -0.23298332 -0.71814346 -0.65573525 -0.043418024 -0.52477723
		 0.85013157 -0.28465429 -0.55840623 0.77920109 -0.048082873 -0.41398668 0.90901214
		 -0.048082873 -0.41398668 0.90901214 -0.28465429 -0.55840623 0.77920109 -0.55961812
		 -0.45619497 0.69189137 0.43878353 -0.55223668 0.70887494 0.48594961 -0.44439906 0.75257057
		 0.59889704 -0.6087209 0.52036637 0.59889704 -0.6087209 0.52036637 0.48594961 -0.44439906
		 0.75257057 0.792606 -0.53319967 0.29575974 -0.043418024 -0.52477723 0.85013157 -0.048082873
		 -0.41398668 0.90901214 0.2051046 -0.55288154 0.80762249 0.2051046 -0.55288154 0.80762249
		 -0.048082873 -0.41398668 0.90901214 0.48594961 -0.44439906 0.75257057 0.65769517
		 -0.72779667 -0.1942911 0.7124598 -0.69979596 0.05183319 0.72838914 -0.6388315 -0.24767636
		 0.72838914 -0.6388315 -0.24767636 0.7124598 -0.69979596 0.05183319 0.792606 -0.53319967
		 0.29575974 0.29196784 -0.79374748 -0.53359133 0.49264908 -0.78348863 -0.37873796
		 0.32334986 -0.71186829 -0.62344879 0.32334986 -0.71186829 -0.62344879 0.49264908
		 -0.78348863 -0.37873796 0.72838914 -0.6388315 -0.24767636 -0.21036851 -0.79941374
		 -0.56274569 0.042327259 -0.82064033 -0.56987536 -0.23298332 -0.71814346 -0.65573525
		 -0.23298332 -0.71814346 -0.65573525 0.042327259 -0.82064033 -0.56987536 0.32334986
		 -0.71186829 -0.62344879 -0.21036851 -0.79941374 -0.56274569 -0.23298332 -0.71814346
		 -0.65573525 -0.42779902 -0.79387093 -0.43215385 -0.61427641 -0.7421456 -0.26811269
		 -0.68030512 -0.65472209 -0.32942969 -0.69775999 -0.71570289 -0.030006269 -0.69775999
		 -0.71570289 -0.030006269 -0.68030512 -0.65472209 -0.32942969 -0.80930561 -0.5512709
		 0.20279244 -0.21133277 0.52617317 -0.82369912 -0.22711881 0.4512428 -0.86301619 -0.61708659
		 0.58371001 -0.52771842 -0.61708659 0.58371001 -0.52771842 -0.22711881 0.4512428 -0.86301619
		 -0.66317832 0.51307803 -0.54492706 -0.059016276 0.19047642 0.97991621 -0.048082873
		 -0.41398668 0.90901214 -0.68687063 0.13867611 0.71342671 -0.68687063 0.13867611 0.71342671
		 -0.048082873 -0.41398668 0.90901214 -0.55961812 -0.45619497 0.69189137 -0.68873268
		 0.46838924 -0.55340654 -0.83399731 -0.15306093 -0.53011405 -0.75939751 0.57907236
		 -0.29663214 -0.75939751 0.57907236 -0.29663214 -0.83399731 -0.15306093 -0.53011405
		 -0.97169209 -0.091850847 -0.21766457 -0.64122593 -0.62270963 0.44839939 -0.50530493
		 -0.56288719 0.65408325 -0.89296323 0.037665606 0.44855103;
	setAttr ".n[2988:3153]" -type "float3"  -0.89296323 0.037665606 0.44855103 -0.50530493
		 -0.56288719 0.65408325 -0.68604422 0.090344153 0.72192883 0.29330167 0.53186631 -0.79441321
		 0.31521058 0.45736107 -0.83154261 -0.21133277 0.52617317 -0.82369912 -0.21133277
		 0.52617317 -0.82369912 0.31521058 0.45736107 -0.83154261 -0.22711881 0.4512428 -0.86301619
		 -0.55961812 -0.45619497 0.69189137 -0.80930561 -0.5512709 0.20279244 -0.68687063
		 0.13867611 0.71342671 -0.68687063 0.13867611 0.71342671 -0.80930561 -0.5512709 0.20279244
		 -0.99333918 0.021986321 0.11310982 -0.46558899 0.49398541 -0.73430604 -0.59574831
		 -0.20073006 -0.77768332 -0.68873268 0.46838924 -0.55340654 -0.68873268 0.46838924
		 -0.55340654 -0.59574831 -0.20073006 -0.77768332 -0.83399731 -0.15306093 -0.53011405
		 -0.50530493 -0.56288719 0.65408325 -0.28465429 -0.55840623 0.77920109 -0.68604422
		 0.090344153 0.72192883 -0.68604422 0.090344153 0.72192883 -0.28465429 -0.55840623
		 0.77920109 -0.39640734 0.12721299 0.90921837 0.66070235 0.5981254 -0.45356187 0.71005118
		 0.52857012 -0.46523216 0.29330167 0.53186631 -0.79441321 0.29330167 0.53186631 -0.79441321
		 0.71005118 0.52857012 -0.46523216 0.31521058 0.45736107 -0.83154261 -0.80930561 -0.5512709
		 0.20279244 -0.68030512 -0.65472209 -0.32942969 -0.99333918 0.021986321 0.11310982
		 -0.99333918 0.021986321 0.11310982 -0.68030512 -0.65472209 -0.32942969 -0.83500266
		 -0.10499188 -0.54013634 -0.23586616 0.40415969 -0.88375455 -0.2856178 -0.2308376
		 -0.93012714 -0.46558899 0.49398541 -0.73430604 -0.46558899 0.49398541 -0.73430604
		 -0.2856178 -0.2308376 -0.93012714 -0.59574831 -0.20073006 -0.77768332 -0.28465429
		 -0.55840623 0.77920109 -0.043418024 -0.52477723 0.85013157 -0.39640734 0.12721299
		 0.90921837 -0.39640734 0.12721299 0.90921837 -0.043418024 -0.52477723 0.85013157
		 -0.058949258 0.14207548 0.98809898 0.7124598 -0.69979596 0.05183319 0.65769517 -0.72779667
		 -0.1942911 0.99216169 -0.069746792 -0.10368506 0.99216169 -0.069746792 -0.10368506
		 0.65769517 -0.72779667 -0.1942911 0.89294231 -0.13362223 -0.42988271 0.4896417 0.77449208
		 -0.40051597 0.53281021 0.84550226 -0.035202879 0.66070235 0.5981254 -0.45356187 0.66070235
		 0.5981254 -0.45356187 0.53281021 0.84550226 -0.035202879 0.71895194 0.69394362 0.039374985
		 -0.68030512 -0.65472209 -0.32942969 -0.23298332 -0.71814346 -0.65573525 -0.83500266
		 -0.10499188 -0.54013634 -0.83500266 -0.10499188 -0.54013634 -0.23298332 -0.71814346
		 -0.65573525 -0.285961 -0.18284103 -0.94063568 0.046072863 0.46483988 -0.88419521
		 0.058942396 -0.23802955 -0.96946776 -0.23586616 0.40415969 -0.88375455 -0.23586616
		 0.40415969 -0.88375455 0.058942396 -0.23802955 -0.96946776 -0.2856178 -0.2308376
		 -0.93012714 0.80244219 0.59140545 0.079536781 0.65181261 0.69549412 0.30237108 0.97166616
		 -0.0041098776 0.2363219 0.97166616 -0.0041098776 0.2363219 0.65181261 0.69549412
		 0.30237108 0.83401179 0.057104539 0.54878354 -0.043418024 -0.52477723 0.85013157
		 0.2051046 -0.55288154 0.80762249 -0.058949258 0.14207548 0.98809898 -0.058949258
		 0.14207548 0.98809898 0.2051046 -0.55288154 0.80762249 0.28562036 0.13489041 0.94880217
		 0.65769517 -0.72779667 -0.1942911 0.49264908 -0.78348863 -0.37873796 0.89294231 -0.13362223
		 -0.42988271 0.89294231 -0.13362223 -0.42988271 0.49264908 -0.78348863 -0.37873796
		 0.68605512 -0.18630324 -0.70329183 -0.03232244 0.92563105 0.37704432 -0.043614555
		 0.8020646 0.59564263 0.32666764 0.90519053 0.27187937 0.32666764 0.90519053 0.27187937
		 -0.043614555 0.8020646 0.59564263 0.44079179 0.77448338 0.45373791 0.39687604 -0.17513826
		 -0.90100831 0.32334986 -0.71186829 -0.62344879 0.89402133 -0.085487083 -0.43979293
		 0.89402133 -0.085487083 -0.43979293 0.32334986 -0.71186829 -0.62344879 0.72838914
		 -0.6388315 -0.24767636 0.5361836 0.50527197 -0.67617112 0.68605512 -0.18630324 -0.70329183
		 0.32736462 0.41050333 -0.85106957 0.32736462 0.41050333 -0.85106957 0.68605512 -0.18630324
		 -0.70329183 0.39639619 -0.22316155 -0.89054418 0.49197683 0.68131405 0.54200554 0.22322586
		 0.75627315 0.61499685 0.59572667 0.10477304 0.79632431 0.59572667 0.10477304 0.79632431
		 0.22322586 0.75627315 0.61499685 0.28562036 0.13489041 0.94880217 0.43878353 -0.55223668
		 0.70887494 0.59889704 -0.6087209 0.52036637 0.59572667 0.10477304 0.79632431 0.59572667
		 0.10477304 0.79632431 0.59889704 -0.6087209 0.52036637 0.83401179 0.057104539 0.54878354
		 0.29196784 -0.79374748 -0.53359133 0.042327259 -0.82064033 -0.56987536 0.39639619
		 -0.22316155 -0.89054418 0.39639619 -0.22316155 -0.89054418 0.042327259 -0.82064033
		 -0.56987536 0.058942396 -0.23802955 -0.96946776 0.32666764 0.90519053 0.27187937
		 0.44079179 0.77448338 0.45373791 0.53281021 0.84550226 -0.035202879 0.53281021 0.84550226
		 -0.035202879 0.44079179 0.77448338 0.45373791 0.71895194 0.69394362 0.039374985 -0.23298332
		 -0.71814346 -0.65573525 0.32334986 -0.71186829 -0.62344879 -0.285961 -0.18284103
		 -0.94063568 -0.285961 -0.18284103 -0.94063568 0.32334986 -0.71186829 -0.62344879
		 0.39687604 -0.17513826 -0.90100831 0.32736462 0.41050333 -0.85106957 0.39639619 -0.22316155
		 -0.89054418 0.046072863 0.46483988 -0.88419521 0.046072863 0.46483988 -0.88419521
		 0.39639619 -0.22316155 -0.89054418 0.058942396 -0.23802955 -0.96946776 0.59572667
		 0.10477304 0.79632431 0.83401179 0.057104539 0.54878354 0.49197683 0.68131405 0.54200554
		 0.49197683 0.68131405 0.54200554 0.83401179 0.057104539 0.54878354 0.65181261 0.69549412
		 0.30237108 0.2051046 -0.55288154 0.80762249 0.43878353 -0.55223668 0.70887494 0.28562036
		 0.13489041 0.94880217 0.28562036 0.13489041 0.94880217 0.43878353 -0.55223668 0.70887494
		 0.59572667 0.10477304 0.79632431 0.49264908 -0.78348863 -0.37873796 0.29196784 -0.79374748
		 -0.53359133 0.68605512 -0.18630324 -0.70329183 0.68605512 -0.18630324 -0.70329183
		 0.29196784 -0.79374748 -0.53359133 0.39639619 -0.22316155 -0.89054418 -0.37618953
		 0.89726216 0.23108891;
	setAttr ".n[3154:3319]" -type "float3"  -0.50761437 0.76378542 0.3986972 -0.03232244
		 0.92563105 0.37704432 -0.03232244 0.92563105 0.37704432 -0.50761437 0.76378542 0.3986972
		 -0.043614555 0.8020646 0.59564263 0.66070235 0.5981254 -0.45356187 0.71895194 0.69394362
		 0.039374985 0.71005118 0.52857012 -0.46523216 0.71005118 0.52857012 -0.46523216 0.71895194
		 0.69394362 0.039374985 0.77265054 0.63154453 0.064518243 0.89294231 -0.13362223 -0.42988271
		 0.68605512 -0.18630324 -0.70329183 0.73743069 0.48445275 -0.47063953 0.73743069 0.48445275
		 -0.47063953 0.68605512 -0.18630324 -0.70329183 0.5361836 0.50527197 -0.67617112 -0.058949258
		 0.14207548 0.98809898 0.28562036 0.13489041 0.94880217 -0.04867341 0.71211118 0.7003774
		 -0.04867341 0.71211118 0.7003774 0.28562036 0.13489041 0.94880217 0.22322586 0.75627315
		 0.61499685 0.59889704 -0.6087209 0.52036637 0.71567881 -0.63241601 0.29640144 0.83401179
		 0.057104539 0.54878354 0.83401179 0.057104539 0.54878354 0.71567881 -0.63241601 0.29640144
		 0.97166616 -0.0041098776 0.2363219 0.042327259 -0.82064033 -0.56987536 -0.21036851
		 -0.79941374 -0.56274569 0.058942396 -0.23802955 -0.96946776 0.058942396 -0.23802955
		 -0.96946776 -0.21036851 -0.79941374 -0.56274569 -0.2856178 -0.2308376 -0.93012714
		 -0.54403603 0.83335453 -0.097698398 -0.73409975 0.67755198 -0.044953484 -0.37618953
		 0.89726216 0.23108891 -0.37618953 0.89726216 0.23108891 -0.73409975 0.67755198 -0.044953484
		 -0.50761437 0.76378542 0.3986972 0.44079179 0.77448338 0.45373791 0.47371694 0.71809894
		 0.50982958 0.71895194 0.69394362 0.039374985 0.71895194 0.69394362 0.039374985 0.47371694
		 0.71809894 0.50982958 0.77265054 0.63154453 0.064518243 0.73743069 0.48445275 -0.47063953
		 0.77541512 0.59636539 -0.20755646 0.89294231 -0.13362223 -0.42988271 0.89294231 -0.13362223
		 -0.42988271 0.77541512 0.59636539 -0.20755646 0.99216169 -0.069746792 -0.10368506
		 -0.04867341 0.71211118 0.7003774 -0.30979678 0.75026727 0.584059 -0.058949258 0.14207548
		 0.98809898 -0.058949258 0.14207548 0.98809898 -0.30979678 0.75026727 0.584059 -0.39640734
		 0.12721299 0.90921837 0.71567881 -0.63241601 0.29640144 0.7124598 -0.69979596 0.05183319
		 0.97166616 -0.0041098776 0.2363219 0.97166616 -0.0041098776 0.2363219 0.7124598 -0.69979596
		 0.05183319 0.99216169 -0.069746792 -0.10368506 -0.21036851 -0.79941374 -0.56274569
		 -0.42779902 -0.79387093 -0.43215385 -0.2856178 -0.2308376 -0.93012714 -0.2856178
		 -0.2308376 -0.93012714 -0.42779902 -0.79387093 -0.43215385 -0.59574831 -0.20073006
		 -0.77768332 -0.45731854 0.76380903 -0.45547289 -0.61708659 0.58371001 -0.52771842
		 -0.54403603 0.83335453 -0.097698398 -0.54403603 0.83335453 -0.097698398 -0.61708659
		 0.58371001 -0.52771842 -0.73409975 0.67755198 -0.044953484 -0.043614555 0.8020646
		 0.59564263 -0.046872463 0.74773997 0.66233522 0.44079179 0.77448338 0.45373791 0.44079179
		 0.77448338 0.45373791 -0.046872463 0.74773997 0.66233522 0.47371694 0.71809894 0.50982958
		 0.97166616 -0.0041098776 0.2363219 0.99216169 -0.069746792 -0.10368506 0.80244219
		 0.59140545 0.079536781 0.80244219 0.59140545 0.079536781 0.99216169 -0.069746792
		 -0.10368506 0.77541512 0.59636539 -0.20755646 -0.68604422 0.090344153 0.72192883
		 -0.39640734 0.12721299 0.90921837 -0.56654382 0.66939116 0.48056594 -0.56654382 0.66939116
		 0.48056594 -0.39640734 0.12721299 0.90921837 -0.30979678 0.75026727 0.584059 -0.42779902
		 -0.79387093 -0.43215385 -0.61427641 -0.7421456 -0.26811269 -0.59574831 -0.20073006
		 -0.77768332 -0.59574831 -0.20073006 -0.77768332 -0.61427641 -0.7421456 -0.26811269
		 -0.83399731 -0.15306093 -0.53011405 -0.15661731 0.72116911 -0.67482305 -0.21133277
		 0.52617317 -0.82369912 -0.45731854 0.76380903 -0.45547289 -0.45731854 0.76380903
		 -0.45547289 -0.21133277 0.52617317 -0.82369912 -0.61708659 0.58371001 -0.52771842
		 -0.50761437 0.76378542 0.3986972 -0.54553038 0.70660186 0.45067772 -0.043614555 0.8020646
		 0.59564263 -0.043614555 0.8020646 0.59564263 -0.54553038 0.70660186 0.45067772 -0.046872463
		 0.74773997 0.66233522 0.72838914 -0.6388315 -0.24767636 0.792606 -0.53319967 0.29575974
		 0.89402133 -0.085487083 -0.43979293 0.89402133 -0.085487083 -0.43979293 0.792606
		 -0.53319967 0.29575974 0.97284192 0.044166636 0.22721764 -0.69786716 0.68028677 0.22403429
		 -0.89296323 0.037665606 0.44855103 -0.56654382 0.66939116 0.48056594 -0.56654382
		 0.66939116 0.48056594 -0.89296323 0.037665606 0.44855103 -0.68604422 0.090344153
		 0.72192883 -0.61427641 -0.7421456 -0.26811269 -0.69775999 -0.71570289 -0.030006269
		 -0.83399731 -0.15306093 -0.53011405 -0.83399731 -0.15306093 -0.53011405 -0.69775999
		 -0.71570289 -0.030006269 -0.97169209 -0.091850847 -0.21766457 0.21736392 0.72538823
		 -0.65311933 0.29330167 0.53186631 -0.79441321 -0.15661731 0.72116911 -0.67482305
		 -0.15661731 0.72116911 -0.67482305 0.29330167 0.53186631 -0.79441321 -0.21133277
		 0.52617317 -0.82369912 -0.73409975 0.67755198 -0.044953484 -0.78892976 0.61392856
		 -0.026107874 -0.50761437 0.76378542 0.3986972 -0.50761437 0.76378542 0.3986972 -0.78892976
		 0.61392856 -0.026107874 -0.54553038 0.70660186 0.45067772 0.792606 -0.53319967 0.29575974
		 0.48594961 -0.44439906 0.75257057 0.97284192 0.044166636 0.22721764 0.97284192 0.044166636
		 0.22721764 0.48594961 -0.44439906 0.75257057 0.59645015 0.15315287 0.78790319 -0.8193289
		 0.57313806 -0.014590286 -0.99214202 -0.026216066 0.12233952 -0.69786716 0.68028677
		 0.22403429 -0.69786716 0.68028677 0.22403429 -0.99214202 -0.026216066 0.12233952
		 -0.89296323 0.037665606 0.44855103 -0.69775999 -0.71570289 -0.030006269 -0.73075831
		 -0.64873397 0.2124536 -0.97169209 -0.091850847 -0.21766457 -0.97169209 -0.091850847
		 -0.21766457 -0.73075831 -0.64873397 0.2124536 -0.99214202 -0.026216066 0.12233952
		 0.4896417 0.77449208 -0.40051597 0.66070235 0.5981254 -0.45356187 0.21736392 0.72538823
		 -0.65311933 0.21736392 0.72538823 -0.65311933 0.66070235 0.5981254 -0.45356187;
	setAttr ".n[3320:3485]" -type "float3"  0.29330167 0.53186631 -0.79441321 -0.61708659
		 0.58371001 -0.52771842 -0.66317832 0.51307803 -0.54492706 -0.73409975 0.67755198
		 -0.044953484 -0.73409975 0.67755198 -0.044953484 -0.66317832 0.51307803 -0.54492706
		 -0.78892976 0.61392856 -0.026107874 0.48594961 -0.44439906 0.75257057 -0.048082873
		 -0.41398668 0.90901214 0.59645015 0.15315287 0.78790319 0.59645015 0.15315287 0.78790319
		 -0.048082873 -0.41398668 0.90901214 -0.059016276 0.19047642 0.97991621 -0.75939751
		 0.57907236 -0.29663214 -0.97169209 -0.091850847 -0.21766457 -0.8193289 0.57313806
		 -0.014590286 -0.8193289 0.57313806 -0.014590286 -0.97169209 -0.091850847 -0.21766457
		 -0.99214202 -0.026216066 0.12233952 -0.73075831 -0.64873397 0.2124536 -0.64122593
		 -0.62270963 0.44839939 -0.99214202 -0.026216066 0.12233952 -0.99214202 -0.026216066
		 0.12233952 -0.64122593 -0.62270963 0.44839939 -0.89296323 0.037665606 0.44855103
		 -0.23586616 0.40415969 -0.88375455 -0.023290416 0.96467489 -0.26241168 0.046072863
		 0.46483988 -0.88419521 0.046072863 0.46483988 -0.88419521 -0.023290416 0.96467489
		 -0.26241168 0.0017560326 0.97508734 -0.22181438 0.32736462 0.41050333 -0.85106957
		 0.046072863 0.46483988 -0.88419521 0.031616513 0.96527511 -0.25931522 0.031616513
		 0.96527511 -0.25931522 0.046072863 0.46483988 -0.88419521 0.0017560326 0.97508734
		 -0.22181438 0.80244219 0.59140545 0.079536781 0.075077981 0.9821468 -0.17248467 0.65181261
		 0.69549412 0.30237108 0.65181261 0.69549412 0.30237108 0.075077981 0.9821468 -0.17248467
		 0.017949393 0.98376 -0.17858918 0.49197683 0.68131405 0.54200554 0.65181261 0.69549412
		 0.30237108 0.045321494 0.99059665 -0.1290898 0.045321494 0.99059665 -0.1290898 0.65181261
		 0.69549412 0.30237108 0.017949393 0.98376 -0.17858918 0.49197683 0.68131405 0.54200554
		 0.045321494 0.99059665 -0.1290898 0.22322586 0.75627315 0.61499685 0.22322586 0.75627315
		 0.61499685 0.045321494 0.99059665 -0.1290898 0.0049307216 0.98546976 -0.16977954
		 -0.04867341 0.71211118 0.7003774 0.22322586 0.75627315 0.61499685 -0.0040746303 0.99222213
		 -0.12441313 -0.0040746303 0.99222213 -0.12441313 0.22322586 0.75627315 0.61499685
		 0.0049307216 0.98546976 -0.16977954 -0.04867341 0.71211118 0.7003774 -0.0040746303
		 0.99222213 -0.12441313 -0.30979678 0.75026727 0.584059 -0.30979678 0.75026727 0.584059
		 -0.0040746303 0.99222213 -0.12441313 -0.0076112389 0.98531747 -0.17056236 -0.56654382
		 0.66939116 0.48056594 -0.30979678 0.75026727 0.584059 -0.052504864 0.98947954 -0.13480923
		 -0.052504864 0.98947954 -0.13480923 -0.30979678 0.75026727 0.584059 -0.0076112389
		 0.98531747 -0.17056236 -0.56654382 0.66939116 0.48056594 -0.052504864 0.98947954
		 -0.13480923 -0.69786716 0.68028677 0.22403429 -0.69786716 0.68028677 0.22403429 -0.052504864
		 0.98947954 -0.13480923 -0.019293213 0.98331791 -0.18086918 -0.8193289 0.57313806
		 -0.014590286 -0.69786716 0.68028677 0.22403429 -0.076754488 0.98042434 -0.18131968
		 -0.076754488 0.98042434 -0.18131968 -0.69786716 0.68028677 0.22403429 -0.019293213
		 0.98331791 -0.18086918 -0.8193289 0.57313806 -0.014590286 -0.076754488 0.98042434
		 -0.18131968 -0.75939751 0.57907236 -0.29663214 -0.75939751 0.57907236 -0.29663214
		 -0.076754488 0.98042434 -0.18131968 -0.020762069 0.98050928 -0.19537276 -0.68873268
		 0.46838924 -0.55340654 -0.75939751 0.57907236 -0.29663214 -0.064777546 0.9706434
		 -0.23163611 -0.064777546 0.9706434 -0.23163611 -0.75939751 0.57907236 -0.29663214
		 -0.020762069 0.98050928 -0.19537276 -0.68873268 0.46838924 -0.55340654 -0.064777546
		 0.9706434 -0.23163611 -0.46558899 0.49398541 -0.73430604 -0.46558899 0.49398541 -0.73430604
		 -0.064777546 0.9706434 -0.23163611 -0.013057224 0.97835469 -0.20652254 -0.23586616
		 0.40415969 -0.88375455 -0.46558899 0.49398541 -0.73430604 -0.023290416 0.96467489
		 -0.26241168 -0.023290416 0.96467489 -0.26241168 -0.46558899 0.49398541 -0.73430604
		 -0.013057224 0.97835469 -0.20652254 0.32736462 0.41050333 -0.85106957 0.031616513
		 0.96527511 -0.25931522 0.5361836 0.50527197 -0.67617112 0.5361836 0.50527197 -0.67617112
		 0.031616513 0.96527511 -0.25931522 0.014794471 0.97863001 -0.20509607 0.73743069
		 0.48445275 -0.47063953 0.5361836 0.50527197 -0.67617112 0.069225252 0.97214228 -0.2239358
		 0.069225252 0.97214228 -0.2239358 0.5361836 0.50527197 -0.67617112 0.014794471 0.97863001
		 -0.20509607 0.73743069 0.48445275 -0.47063953 0.069225252 0.97214228 -0.2239358 0.77541512
		 0.59636539 -0.20755646 0.77541512 0.59636539 -0.20755646 0.069225252 0.97214228 -0.2239358
		 0.021262001 0.98097074 -0.19298778 0.80244219 0.59140545 0.079536781 0.77541512 0.59636539
		 -0.20755646 0.075077981 0.9821468 -0.17248467 0.075077981 0.9821468 -0.17248467 0.77541512
		 0.59636539 -0.20755646 0.021262001 0.98097074 -0.19298778 -0.023290416 0.96467489
		 -0.26241168 0.17384282 0.88125414 0.43951082 0.0017560326 0.97508734 -0.22181438
		 0.0017560326 0.97508734 -0.22181438 0.17384282 0.88125414 0.43951082 -0.030569706
		 0.93784481 0.34570596 0.031616513 0.96527511 -0.25931522 0.0017560326 0.97508734
		 -0.22181438 -0.24233194 0.87699658 0.41491225 -0.24233194 0.87699658 0.41491225 0.0017560326
		 0.97508734 -0.22181438 -0.030569706 0.93784481 0.34570596 0.017949393 0.98376 -0.17858918
		 0.075077981 0.9821468 -0.17248467 -0.42948002 0.79100442 -0.43572807 -0.42948002
		 0.79100442 -0.43572807 0.075077981 0.9821468 -0.17248467 -0.59126323 0.75529844 -0.28272256
		 0.045321494 0.99059665 -0.1290898 0.017949393 0.98376 -0.17858918 -0.36099026 0.69636953
		 -0.62028664 -0.36099026 0.69636953 -0.62028664 0.017949393 0.98376 -0.17858918 -0.42948002
		 0.79100442 -0.43572807 0.0049307216 0.98546976 -0.16977954 0.045321494 0.99059665
		 -0.1290898 -0.14840098 0.7542721 -0.63957077 -0.14840098 0.7542721 -0.63957077 0.045321494
		 0.99059665 -0.1290898 -0.36099026 0.69636953 -0.62028664 -0.0040746303 0.99222213
		 -0.12441313 0.0049307216 0.98546976 -0.16977954 0.035480998 0.66984349 -0.74165404;
	setAttr ".n[3486:3651]" -type "float3"  0.035480998 0.66984349 -0.74165404 0.0049307216
		 0.98546976 -0.16977954 -0.14840098 0.7542721 -0.63957077 -0.0040746303 0.99222213
		 -0.12441313 0.035480998 0.66984349 -0.74165404 -0.0076112389 0.98531747 -0.17056236
		 -0.0076112389 0.98531747 -0.17056236 0.035480998 0.66984349 -0.74165404 0.20499891
		 0.75788021 -0.61934888 -0.0076112389 0.98531747 -0.17056236 0.20499891 0.75788021
		 -0.61934888 -0.052504864 0.98947954 -0.13480923 -0.052504864 0.98947954 -0.13480923
		 0.20499891 0.75788021 -0.61934888 0.41538364 0.70398974 -0.5760684 -0.052504864 0.98947954
		 -0.13480923 0.41538364 0.70398974 -0.5760684 -0.019293213 0.98331791 -0.18086918
		 -0.019293213 0.98331791 -0.18086918 0.41538364 0.70398974 -0.5760684 0.46040803 0.80021703
		 -0.38428789 -0.019293213 0.98331791 -0.18086918 0.46040803 0.80021703 -0.38428789
		 -0.076754488 0.98042434 -0.18131968 -0.076754488 0.98042434 -0.18131968 0.46040803
		 0.80021703 -0.38428789 0.60477138 0.7672109 -0.21363303 -0.076754488 0.98042434 -0.18131968
		 0.60477138 0.7672109 -0.21363303 -0.020762069 0.98050928 -0.19537276 -0.020762069
		 0.98050928 -0.19537276 0.60477138 0.7672109 -0.21363303 0.50460982 0.86245775 -0.039185707
		 -0.020762069 0.98050928 -0.19537276 0.50460982 0.86245775 -0.039185707 -0.064777546
		 0.9706434 -0.23163611 -0.064777546 0.9706434 -0.23163611 0.50460982 0.86245775 -0.039185707
		 0.51260757 0.8375082 0.18924449 -0.064777546 0.9706434 -0.23163611 0.51260757 0.8375082
		 0.18924449 -0.013057224 0.97835469 -0.20652254 -0.013057224 0.97835469 -0.20652254
		 0.51260757 0.8375082 0.18924449 0.31006098 0.91569358 0.25567064 -0.013057224 0.97835469
		 -0.20652254 0.31006098 0.91569358 0.25567064 -0.023290416 0.96467489 -0.26241168
		 -0.023290416 0.96467489 -0.26241168 0.31006098 0.91569358 0.25567064 0.17384282 0.88125414
		 0.43951082 0.014794471 0.97863001 -0.20509607 0.031616513 0.96527511 -0.25931522
		 -0.35736984 0.9086045 0.21615896 -0.35736984 0.9086045 0.21615896 0.031616513 0.96527511
		 -0.25931522 -0.24233194 0.87699658 0.41491225 0.069225252 0.97214228 -0.2239358 0.014794471
		 0.97863001 -0.20509607 -0.54797751 0.82678658 0.12706161 -0.54797751 0.82678658 0.12706161
		 0.014794471 0.97863001 -0.20509607 -0.35736984 0.9086045 0.21615896 0.021262001 0.98097074
		 -0.19298778 0.069225252 0.97214228 -0.2239358 -0.51451594 0.85176003 -0.098884821
		 -0.51451594 0.85176003 -0.098884821 0.069225252 0.97214228 -0.2239358 -0.54797751
		 0.82678658 0.12706161 0.075077981 0.9821468 -0.17248467 0.021262001 0.98097074 -0.19298778
		 -0.59126323 0.75529844 -0.28272256 -0.59126323 0.75529844 -0.28272256 0.021262001
		 0.98097074 -0.19298778 -0.51451594 0.85176003 -0.098884821 -1.2059027e-08 0.98162717
		 -0.19080898 -2.5524704e-07 0.98162705 -0.19080968 -4.6102713e-07 0.98162711 -0.19080934
		 -4.6102713e-07 0.98162711 -0.19080934 -2.5524704e-07 0.98162705 -0.19080968 -2.1351995e-07
		 0.98162729 -0.1908085 -4.1838271e-07 0.98162723 -0.19080883 -1.2059027e-08 0.98162717
		 -0.19080898 -6.656017e-07 0.98162717 -0.19080909 -1.2059027e-08 0.98162717 -0.19080898
		 -4.6102713e-07 0.98162711 -0.19080934 -6.656017e-07 0.98162717 -0.19080909 -1.2059027e-08
		 0.98162717 -0.19080898 -4.1838271e-07 0.98162723 -0.19080883 1.261059e-06 0.98162723
		 -0.19080888 1.261059e-06 0.98162723 -0.19080888 -4.1838271e-07 0.98162723 -0.19080883
		 3.1873788e-07 0.98162723 -0.19080892 1.261059e-06 0.98162723 -0.19080888 2.598862e-06
		 0.98162729 -0.19080845 -1.2059027e-08 0.98162717 -0.19080898 0.17384282 0.88125414
		 0.43951082 0.31006098 0.91569358 0.25567064 0.00029311891 0.98150343 -0.19144434
		 0.00029311891 0.98150343 -0.19144434 0.31006098 0.91569358 0.25567064 0.00052718783
		 0.98182762 -0.1897743 0.31006098 0.91569358 0.25567064 0.51260757 0.8375082 0.18924449
		 -0.00074934203 0.9817782 -0.19002888 0.51260757 0.8375082 0.18924449 0.50460982 0.86245775
		 -0.039185707 -0.00019051068 0.98149681 -0.19147846 -0.00019051068 0.98149681 -0.19147846
		 0.50460982 0.86245775 -0.039185707 0.0010796711 0.98171586 -0.19034927 0.50460982
		 0.86245775 -0.039185707 0.60477138 0.7672109 -0.21363303 -6.6118038e-05 0.98183447
		 -0.18973938 0.60477138 0.7672109 -0.21363303 0.46040803 0.80021703 -0.38428789 -0.00058727904
		 0.98155016 -0.1912038 -0.00058727904 0.98155016 -0.1912038 0.46040803 0.80021703
		 -0.38428789 0.0011282791 0.9815619 -0.19114108 0.46040803 0.80021703 -0.38428789
		 0.41538364 0.70398974 -0.5760684 0.00064944109 0.98179424 -0.18994637 0.41538364
		 0.70398974 -0.5760684 0.20499891 0.75788021 -0.61934888 -0.00070808729 0.9816401
		 -0.19074136 -0.00070808729 0.9816401 -0.19074136 0.20499891 0.75788021 -0.61934888
		 0.00064840209 0.98143852 -0.19177587 0.20499891 0.75788021 -0.61934888 0.035480998
		 0.66984349 -0.74165404 0.0010626761 0.98167485 -0.19056059 0.035480998 0.66984349
		 -0.74165404 -0.14840098 0.7542721 -0.63957077 -0.00049746485 0.98172373 -0.19031103
		 -0.00049746485 0.98172373 -0.19031103 -0.14840098 0.7542721 -0.63957077 -0.00013574719
		 0.98140329 -0.19195709 -0.14840098 0.7542721 -0.63957077 -0.36099026 0.69636953 -0.62028664
		 0.00097626215 0.98153275 -0.19129154 -0.36099026 0.69636953 -0.62028664 -0.42948002
		 0.79100442 -0.43572807 -5.4328557e-05 0.98176199 -0.19011402 -5.4328557e-05 0.98176199
		 -0.19011402 -0.42948002 0.79100442 -0.43572807 -0.00085600896 0.98147166 -0.19160555
		 -0.42948002 0.79100442 -0.43572807 -0.59126323 0.75529844 -0.28272256 0.00043529205
		 0.98143542 -0.19179229 -0.59126323 0.75529844 -0.28272256 -0.51451594 0.85176003
		 -0.098884821 0.00041583183 0.98173714 -0.19024204 0.00041583183 0.98173714 -0.19024204
		 -0.51451594 0.85176003 -0.098884821 -0.0011731576 0.98161298 -0.19087853 -0.51451594
		 0.85176003 -0.098884821 -0.54797751 0.82678658 0.12706161 -0.00031173948 0.98142701
		 -0.19183555 -0.54797751 0.82678658 0.12706161 -0.35736984 0.9086045 0.21615896 0.00068854418
		 0.9816609 -0.19063415 0.00068854418 0.9816609 -0.19063415 -0.35736984 0.9086045 0.21615896
		 -0.00094354956 0.98176068 -0.19011845 -0.35736984 0.9086045 0.21615896;
	setAttr ".n[3652:3817]" -type "float3"  -0.24233194 0.87699658 0.41491225 -0.00091000565
		 0.98151159 -0.19140053 -0.24233194 0.87699658 0.41491225 -0.030569706 0.93784481
		 0.34570596 0.00064077455 0.98156881 -0.19110788 0.00064077455 0.98156881 -0.19110788
		 -0.030569706 0.93784481 0.34570596 -0.00027327778 0.9818458 -0.18968058 -0.030569706
		 0.93784481 0.34570596 0.17384282 0.88125414 0.43951082 -0.0010869984 0.98165065 -0.19068503
		 -2.0730855e-07 0.98192596 -0.18926552 8.9133053e-08 0.98192561 -0.18926726 -3.3802348e-08
		 0.98192573 -0.18926682 -3.3432557e-09 0.98192567 -0.18926692 -3.3802348e-08 0.98192573
		 -0.18926682 -1.6953694e-08 0.98192567 -0.18926686 -3.3802348e-08 0.98192573 -0.18926682
		 8.9133053e-08 0.98192561 -0.18926726 -1.6953694e-08 0.98192567 -0.18926686 3.6127442e-08
		 0.98192573 -0.18926676 -3.3802348e-08 0.98192573 -0.18926682 1.9837334e-08 0.98192573
		 -0.18926676 -3.3802348e-08 0.98192573 -0.18926682 -3.3432557e-09 0.98192567 -0.18926692
		 1.9837334e-08 0.98192573 -0.18926676 1.4981174e-08 0.98192573 -0.18926674 -3.3802348e-08
		 0.98192573 -0.18926682 3.7159612e-08 0.98192573 -0.18926674 -3.3802348e-08 0.98192573
		 -0.18926682 3.6127442e-08 0.98192573 -0.18926676 3.7159612e-08 0.98192573 -0.18926674
		 1.4981174e-08 0.98192573 -0.18926674 3.3339237e-08 0.98192573 -0.18926674 -3.3802348e-08
		 0.98192573 -0.18926682 -3.3802348e-08 0.98192573 -0.18926682 3.3339237e-08 0.98192573
		 -0.18926674 -2.1401691e-08 0.98192567 -0.18926686 -2.1401691e-08 0.98192567 -0.18926686
		 -1.4863842e-07 0.98192567 -0.18926686 -3.3802348e-08 0.98192573 -0.18926682 -3.3802348e-08
		 0.98192573 -0.18926682 -1.4863842e-07 0.98192567 -0.18926686 -1.1774862e-07 0.98192567
		 -0.18926683 -1.1774862e-07 0.98192567 -0.18926683 -5.289964e-08 0.98192567 -0.18926699
		 -3.3802348e-08 0.98192573 -0.18926682 -3.3802348e-08 0.98192573 -0.18926682 -5.289964e-08
		 0.98192567 -0.18926699 -2.3179953e-07 0.98192567 -0.18926693 -2.3179953e-07 0.98192567
		 -0.18926693 -1.3562988e-08 0.98192561 -0.18926737 -3.3802348e-08 0.98192573 -0.18926682
		 -3.3802348e-08 0.98192573 -0.18926682 -1.3562988e-08 0.98192561 -0.18926737 -1.9390323e-07
		 0.98192567 -0.18926707 -1.9390323e-07 0.98192567 -0.18926707 -2.7640829e-07 0.98192602
		 -0.18926504 -3.3802348e-08 0.98192573 -0.18926682 -0.8140074 -0.14577229 0.5622654
		 -0.77288169 -0.16966356 0.61144763 -0.84117657 -0.19220325 0.50545019 -0.84117657
		 -0.19220325 0.50545019 -0.77288169 -0.16966356 0.61144763 -0.79759949 -0.25106284
		 0.54845464 -0.99554688 0.059147567 0.073403172 -0.99294412 0.012467928 0.11792575
		 -0.99855983 0.036190044 0.039604746 -0.99855983 0.036190044 0.039604746 -0.99294412
		 0.012467928 0.11792575 -0.9975034 -0.020986862 0.067427851 0.037679069 0.84683782
		 0.5305149 0.061853793 0.74993187 0.6586169 0.11906561 0.86970651 0.47899261 0.11906561
		 0.86970651 0.47899261 0.061853793 0.74993187 0.6586169 0.13803969 0.76429105 0.62992394
		 0.033035841 0.88092166 0.47210765 0.037679069 0.84683782 0.5305149 0.11936499 0.88846111
		 0.44315785 0.11936499 0.88846111 0.44315785 0.037679069 0.84683782 0.5305149 0.11906561
		 0.86970651 0.47899261 -0.97091186 -0.092157409 0.2209913 -0.94622165 -0.14812893
		 0.28761497 -0.97552764 -0.14276524 0.16722412 -0.97552764 -0.14276524 0.16722412
		 -0.94622165 -0.14812893 0.28761497 -0.94765759 -0.21811013 0.23318034 0.11909412
		 0.89119065 0.43771663 0.033937901 0.89047128 0.45377213 0.11936499 0.88846111 0.44315785
		 0.11936499 0.88846111 0.44315785 0.033937901 0.89047128 0.45377213 0.033035841 0.88092166
		 0.47210765 -0.93239319 -0.044445064 0.35870257 -0.93946993 -0.077349916 0.33378619
		 -0.9610219 0.00078293477 0.27647111 -0.9610219 0.00078293477 0.27647111 -0.93946993
		 -0.077349916 0.33378619 -0.96516716 -0.029111931 0.26000923 0.033937901 0.89047128
		 0.45377213 0.11909412 0.89119065 0.43771663 0.039628293 0.89588809 0.44250885 0.039628293
		 0.89588809 0.44250885 0.11909412 0.89119065 0.43771663 0.11747303 0.89397073 0.43245396
		 0.1059346 0.9108156 0.39898971 0.036258038 0.91869956 0.39328933 0.11747303 0.89397073
		 0.43245396 0.11747303 0.89397073 0.43245396 0.036258038 0.91869956 0.39328933 0.039628293
		 0.89588809 0.44250885 -0.24483134 -0.67837834 -0.69271958 -0.20758817 -0.84664404
		 -0.49000105 -0.28872591 -0.68702173 -0.66681218 -0.28872591 -0.68702173 -0.66681218
		 -0.20758817 -0.84664404 -0.49000105 -0.25880864 -0.83924967 -0.47820294 0.073632739
		 0.96124595 0.26567736 0.024208462 0.96178073 0.27274853 0.1059346 0.9108156 0.39898971
		 0.1059346 0.9108156 0.39898971 0.024208462 0.96178073 0.27274853 0.036258038 0.91869956
		 0.39328933 -0.98444933 -0.041013215 0.17081396 -0.97091186 -0.092157409 0.2209913
		 -0.98876512 -0.080704249 0.12581857 -0.98876512 -0.080704249 0.12581857 -0.97091186
		 -0.092157409 0.2209913 -0.97552764 -0.14276524 0.16722412 -0.24405073 -0.8848083
		 -0.39693016 -0.25880864 -0.83924967 -0.47820294 -0.18525594 -0.88973153 -0.41720271
		 -0.18525594 -0.88973153 -0.41720271 -0.25880864 -0.83924967 -0.47820294 -0.20758817
		 -0.84664404 -0.49000105 -0.97619253 0.043649927 0.21246833 -0.9610219 0.00078293477
		 0.27647111 -0.97731459 0.012753363 0.21140845 -0.97731459 0.012753363 0.21140845
		 -0.9610219 0.00078293477 0.27647111 -0.96516716 -0.029111931 0.26000923 -0.18525594
		 -0.88973153 -0.41720271 -0.17408645 -0.91032523 -0.37550211 -0.24405073 -0.8848083
		 -0.39693016 -0.24405073 -0.8848083 -0.39693016 -0.17408645 -0.91032523 -0.37550211
		 -0.22675493 -0.91107523 -0.34427333 -0.90547031 -0.20357235 0.37240008 -0.85287702
		 -0.25211635 0.45720693 -0.89830768 -0.28800708 0.33180606 -0.89830768 -0.28800708
		 0.33180606 -0.85287702 -0.25211635 0.45720693 -0.8346625 -0.33550256 0.43677974 -0.1622785
		 -0.93599635 -0.31237233 -0.21970652 -0.93398058 -0.28179666 -0.17408645 -0.91032523
		 -0.37550211 -0.17408645 -0.91032523 -0.37550211 -0.21970652 -0.93398058 -0.28179666
		 -0.22675493 -0.91107523 -0.34427333 -0.8140074 -0.14577229 0.5622654 -0.84117657
		 -0.19220325 0.50545019 -0.88641697 -0.090639479 0.45392665 -0.88641697 -0.090639479
		 0.45392665 -0.84117657 -0.19220325 0.50545019;
	setAttr ".n[3818:3983]" -type "float3"  -0.89922941 -0.12593505 0.41895926 -0.11733489
		 -0.98153555 -0.1510646 -0.17758164 -0.9707042 -0.16185831 -0.1622785 -0.93599635
		 -0.31237233 -0.1622785 -0.93599635 -0.31237233 -0.17758164 -0.9707042 -0.16185831
		 -0.21970652 -0.93398058 -0.28179666 -0.14846997 0.73277956 -0.66407132 -0.18551259
		 0.7425763 -0.64355689 -0.10172817 0.86887634 -0.48446387 -0.10172817 0.86887634 -0.48446387
		 -0.18551259 0.7425763 -0.64355689 -0.14064582 0.87965554 -0.4543401 -0.2195749 0.62007827
		 -0.7531864 -0.17902952 0.62062848 -0.76339293 -0.25899214 0.42127028 -0.86916882
		 -0.25899214 0.42127028 -0.86916882 -0.17902952 0.62062848 -0.76339293 -0.21801323
		 0.42802271 -0.87707853 -0.29915154 0.016235286 -0.95406747 -0.28435737 0.24180649
		 -0.92772329 -0.25589567 0.042135637 -0.96578568 -0.25589567 0.042135637 -0.96578568
		 -0.28435737 0.24180649 -0.92772329 -0.2402411 0.25433102 -0.93680304 -0.17902952
		 0.62062848 -0.76339293 -0.2195749 0.62007827 -0.7531864 -0.14846997 0.73277956 -0.66407132
		 -0.14846997 0.73277956 -0.66407132 -0.2195749 0.62007827 -0.7531864 -0.18551259 0.7425763
		 -0.64355689 -0.28435737 0.24180649 -0.92772329 -0.25899214 0.42127028 -0.86916882
		 -0.2402411 0.25433102 -0.93680304 -0.2402411 0.25433102 -0.93680304 -0.25899214 0.42127028
		 -0.86916882 -0.21801323 0.42802271 -0.87707853 -0.98471177 0.14297113 0.099508718
		 -0.98409432 0.10872283 0.14049084 -0.99132013 0.092927627 0.092999481 -0.99132013
		 0.092927627 0.092999481 -0.98409432 0.10872283 0.14049084 -0.9870761 0.061295401
		 0.14806622 -0.9870761 0.061295401 0.14806622 -0.98409432 0.10872283 0.14049084 -0.97619253
		 0.043649927 0.21246833 -0.99490738 0.095672622 0.03171856 -0.99494433 0.10042413
		 -0.00090154697 -0.99293703 0.11859982 0.0031805919 -0.99293703 0.11859982 0.0031805919
		 -0.99494433 0.10042413 -0.00090154697 -0.99667227 0.076648079 0.027739672 -0.99490738
		 0.095672622 0.03171856 -0.99719942 0.074175104 0.0095585445 -0.99494433 0.10042413
		 -0.00090154697 -0.99294412 0.012467928 0.11792575 -0.98444933 -0.041013215 0.17081396
		 -0.9975034 -0.020986862 0.067427851 -0.9975034 -0.020986862 0.067427851 -0.98444933
		 -0.041013215 0.17081396 -0.98876512 -0.080704249 0.12581857 -0.97619253 0.043649927
		 0.21246833 -0.97731459 0.012753363 0.21140845 -0.9870761 0.061295401 0.14806622 -0.80460703
		 -0.28388143 0.52155423 -0.79191607 -0.33291337 0.51189613 -0.85287702 -0.25211635
		 0.45720693 -0.85287702 -0.25211635 0.45720693 -0.79191607 -0.33291337 0.51189613
		 -0.8346625 -0.33550256 0.43677974 0.11451831 -0.075023234 0.99058419 0.10495764 -0.25589162
		 0.96099085 0.18290433 -0.080395967 0.97983801 0.18290433 -0.080395967 0.97983801
		 0.10495764 -0.25589162 0.96099085 0.16428286 -0.25754178 0.95219922 0.1955979 0.146263
		 0.96971571 0.1807325 0.52187634 0.83365512 0.11805823 0.17027183 0.97829944 0.11805823
		 0.17027183 0.97829944 0.1807325 0.52187634 0.83365512 0.10153934 0.52595311 0.84443063
		 0.08369977 -0.71693832 0.69209373 0.022281412 -0.73627335 0.67631727 0.057953332
		 -0.80332965 0.59270811 0.057953332 -0.80332965 0.59270811 0.022281412 -0.73627335
		 0.67631727 -0.012590019 -0.82649148 0.56280839 -0.11621865 -0.9908691 0.068349034
		 -0.06248435 -0.99417531 0.08781305 -0.060808271 -0.92140919 0.38380656 -0.060808271
		 -0.92140919 0.38380656 -0.06248435 -0.99417531 0.08781305 0.01307767 -0.89816022
		 0.43947381 0.1807325 0.52187634 0.83365512 0.13803969 0.76429105 0.62992394 0.10153934
		 0.52595311 0.84443063 0.10153934 0.52595311 0.84443063 0.13803969 0.76429105 0.62992394
		 0.061853793 0.74993187 0.6586169 -0.06248435 -0.99417531 0.08781305 -0.11621865 -0.9908691
		 0.068349034 -0.11733489 -0.98153555 -0.1510646 -0.11733489 -0.98153555 -0.1510646
		 -0.11621865 -0.9908691 0.068349034 -0.17758164 -0.9707042 -0.16185831 -0.060808271
		 -0.92140919 0.38380656 0.01307767 -0.89816022 0.43947381 -0.012590019 -0.82649148
		 0.56280839 -0.012590019 -0.82649148 0.56280839 0.01307767 -0.89816022 0.43947381
		 0.057953332 -0.80332965 0.59270811 0.022281412 -0.73627335 0.67631727 0.08369977
		 -0.71693832 0.69209373 0.045342609 -0.63396347 0.77203262 0.045342609 -0.63396347
		 0.77203262 0.08369977 -0.71693832 0.69209373 0.10251462 -0.60993797 0.78579032 0.18290433
		 -0.080395967 0.97983801 0.1955979 0.146263 0.96971571 0.11451831 -0.075023234 0.99058419
		 0.11451831 -0.075023234 0.99058419 0.1955979 0.146263 0.96971571 0.11805823 0.17027183
		 0.97829944 0.085303441 -0.4054763 0.91011661 0.069144323 -0.52465934 0.84849966 0.14591764
		 -0.40237573 0.90377086 0.14591764 -0.40237573 0.90377086 0.069144323 -0.52465934
		 0.84849966 0.12297726 -0.50916767 0.85183614 -0.017758621 0.99955523 0.023957167
		 0.017956568 0.99952525 0.025037764 -0.095932744 0.96316248 -0.25122693 -0.095932744
		 0.96316248 -0.25122693 0.017956568 0.99952525 0.025037764 -0.056837015 0.95463806
		 -0.292294 -0.26584592 -0.15144253 -0.95204574 -0.26287201 -0.44335517 -0.85693318
		 -0.31070268 -0.19372919 -0.93055511 -0.31070268 -0.19372919 -0.93055511 -0.26287201
		 -0.44335517 -0.85693318 -0.30445313 -0.45696256 -0.83575922 0.017956568 0.99952525
		 0.025037764 -0.017758621 0.99955523 0.023957167 0.073632739 0.96124595 0.26567736
		 0.073632739 0.96124595 0.26567736 -0.017758621 0.99955523 0.023957167 0.024208462
		 0.96178073 0.27274853 -0.26287201 -0.44335517 -0.85693318 -0.24483134 -0.67837834
		 -0.69271958 -0.30445313 -0.45696256 -0.83575922 -0.30445313 -0.45696256 -0.83575922
		 -0.24483134 -0.67837834 -0.69271958 -0.28872591 -0.68702173 -0.66681218 -0.095932744
		 0.96316248 -0.25122693 -0.056837015 0.95463806 -0.292294 -0.14064582 0.87965554 -0.4543401
		 -0.14064582 0.87965554 -0.4543401 -0.056837015 0.95463806 -0.292294 -0.10172817 0.86887634
		 -0.48446387 -0.25589567 0.042135637 -0.96578568 -0.26584592 -0.15144253 -0.95204574
		 -0.29915154 0.016235286 -0.95406747 -0.29915154 0.016235286 -0.95406747 -0.26584592
		 -0.15144253 -0.95204574 -0.31070268 -0.19372919 -0.93055511;
	setAttr ".n[3984:4149]" -type "float3"  -0.9848277 0.14661804 0.09283071 -0.99235058
		 0.11340744 0.04877555 -0.98507309 0.14838947 0.087244138 -0.98507309 0.14838947 0.087244138
		 -0.99235058 0.11340744 0.04877555 -0.99212068 0.12261898 0.025713036 -0.77288169
		 -0.16966356 0.61144763 -0.76600975 -0.19597217 0.61222869 -0.79759949 -0.25106284
		 0.54845464 -0.79759949 -0.25106284 0.54845464 -0.76600975 -0.19597217 0.61222869
		 -0.75794405 -0.28827482 0.58516532 -0.7630803 -0.31325918 0.56531161 -0.76268858
		 -0.33473009 0.55340934 -0.80460703 -0.28388143 0.52155423 -0.80460703 -0.28388143
		 0.52155423 -0.76268858 -0.33473009 0.55340934 -0.79191607 -0.33291337 0.51189613
		 -0.79032952 -0.23934385 0.56399798 -0.79384452 -0.28212863 0.53871542 -0.74718255
		 -0.31063306 0.58755881 -0.74718255 -0.31063306 0.58755881 -0.79384452 -0.28212863
		 0.53871542 -0.74652028 -0.33035818 0.57755601 -0.79032952 -0.23934385 0.56399798
		 -0.74718255 -0.31063306 0.58755881 -0.76916832 -0.21294111 0.60252482 -0.76916832
		 -0.21294111 0.60252482 -0.74718255 -0.31063306 0.58755881 -0.75794405 -0.28827482
		 0.58516532 -0.7630803 -0.31325918 0.56531161 -0.74652028 -0.33035818 0.57755601 -0.74946415
		 -0.32772422 0.57523936 -0.74946415 -0.32772422 0.57523936 -0.74652028 -0.33035818
		 0.57755601 -0.78314209 -0.30704305 0.54075223 -0.7630803 -0.31325918 0.56531161 -0.74946415
		 -0.32772422 0.57523936 -0.76268858 -0.33473009 0.55340934 -0.76268858 -0.33473009
		 0.55340934 -0.74946415 -0.32772422 0.57523936 -0.77386415 -0.38070667 0.50615877
		 -0.78314209 -0.30704305 0.54075223 -0.74652028 -0.33035818 0.57755601 -0.78844774
		 -0.29147688 0.54165614 -0.78844774 -0.29147688 0.54165614 -0.74652028 -0.33035818
		 0.57755601 -0.79384452 -0.28212863 0.53871542 -0.75794405 -0.28827482 0.58516532
		 -0.76600975 -0.19597217 0.61222869 -0.76916832 -0.21294111 0.60252482 -0.98471177
		 0.14297113 0.099508718 -0.99132013 0.092927627 0.092999481 -0.9848277 0.14661804
		 0.09283071 -0.9848277 0.14661804 0.09283071 -0.99132013 0.092927627 0.092999481 -0.99235058
		 0.11340744 0.04877555 -0.99490738 0.095672622 0.03171856 -0.99554688 0.059147567
		 0.073403172 -0.99719942 0.074175104 0.0095585445 -0.99719942 0.074175104 0.0095585445
		 -0.99554688 0.059147567 0.073403172 -0.99855983 0.036190044 0.039604746 -0.99220908
		 0.11271081 0.053078923 -0.99212068 0.12261898 0.025713036 -0.99293703 0.11859982
		 0.0031805919 -0.99293703 0.11859982 0.0031805919 -0.99212068 0.12261898 0.025713036
		 -0.99490738 0.095672622 0.03171856 -0.99220908 0.11271081 0.053078923 -0.99293703
		 0.11859982 0.0031805919 -0.99441069 0.10214359 0.0267222 -0.99441069 0.10214359 0.0267222
		 -0.99293703 0.11859982 0.0031805919 -0.99667227 0.076648079 0.027739672 -0.99667227
		 0.076648079 0.027739672 -0.99494433 0.10042413 -0.00090154697 -0.99969727 0.023667186
		 0.006722251 -0.99969727 0.023667186 0.006722251 -0.99494433 0.10042413 -0.00090154697
		 -0.99958205 0.02316035 -0.017300479 -0.99958205 0.02316035 -0.017300479 -0.99494433
		 0.10042413 -0.00090154697 -0.99719942 0.074175104 0.0095585445 -0.88641697 -0.090639479
		 0.45392665 -0.89922941 -0.12593505 0.41895926 -0.93239319 -0.044445064 0.35870257
		 -0.93239319 -0.044445064 0.35870257 -0.89922941 -0.12593505 0.41895926 -0.93946993
		 -0.077349916 0.33378619 -0.94622165 -0.14812893 0.28761497 -0.90547031 -0.20357235
		 0.37240008 -0.94765759 -0.21811013 0.23318034 -0.94765759 -0.21811013 0.23318034
		 -0.90547031 -0.20357235 0.37240008 -0.89830768 -0.28800708 0.33180606 0.14591764
		 -0.40237573 0.90377086 0.16428286 -0.25754178 0.95219922 0.085303441 -0.4054763 0.91011661
		 0.085303441 -0.4054763 0.91011661 0.16428286 -0.25754178 0.95219922 0.10495764 -0.25589162
		 0.96099085 0.10251462 -0.60993797 0.78579032 0.12297726 -0.50916767 0.85183614 0.045342609
		 -0.63396347 0.77203262 0.045342609 -0.63396347 0.77203262 0.12297726 -0.50916767
		 0.85183614 0.069144323 -0.52465934 0.84849966 -0.99235058 0.11340744 0.04877555 -0.99490738
		 0.095672622 0.03171856 -0.99212068 0.12261898 0.025713036 -0.99235058 0.11340744
		 0.04877555 -0.99132013 0.092927627 0.092999481 -0.99490738 0.095672622 0.03171856
		 -0.99490738 0.095672622 0.03171856 -0.99132013 0.092927627 0.092999481 -0.99554688
		 0.059147567 0.073403172 -0.99132013 0.092927627 0.092999481 -0.9870761 0.061295401
		 0.14806622 -0.99554688 0.059147567 0.073403172 -0.99554688 0.059147567 0.073403172
		 -0.9870761 0.061295401 0.14806622 -0.99294412 0.012467928 0.11792575 -0.9870761 0.061295401
		 0.14806622 -0.97731459 0.012753363 0.21140845 -0.99294412 0.012467928 0.11792575
		 -0.99294412 0.012467928 0.11792575 -0.97731459 0.012753363 0.21140845 -0.98444933
		 -0.041013215 0.17081396 -0.97731459 0.012753363 0.21140845 -0.96516716 -0.029111931
		 0.26000923 -0.98444933 -0.041013215 0.17081396 -0.98444933 -0.041013215 0.17081396
		 -0.96516716 -0.029111931 0.26000923 -0.97091186 -0.092157409 0.2209913 -0.96516716
		 -0.029111931 0.26000923 -0.93946993 -0.077349916 0.33378619 -0.97091186 -0.092157409
		 0.2209913 -0.97091186 -0.092157409 0.2209913 -0.93946993 -0.077349916 0.33378619
		 -0.94622165 -0.14812893 0.28761497 -0.93946993 -0.077349916 0.33378619 -0.89922941
		 -0.12593505 0.41895926 -0.94622165 -0.14812893 0.28761497 -0.94622165 -0.14812893
		 0.28761497 -0.89922941 -0.12593505 0.41895926 -0.90547031 -0.20357235 0.37240008
		 -0.84117657 -0.19220325 0.50545019 -0.85287702 -0.25211635 0.45720693 -0.89922941
		 -0.12593505 0.41895926 -0.89922941 -0.12593505 0.41895926 -0.85287702 -0.25211635
		 0.45720693 -0.90547031 -0.20357235 0.37240008 -0.84117657 -0.19220325 0.50545019
		 -0.79759949 -0.25106284 0.54845464 -0.85287702 -0.25211635 0.45720693 -0.85287702
		 -0.25211635 0.45720693 -0.79759949 -0.25106284 0.54845464 -0.80460703 -0.28388143
		 0.52155423 -0.79759949 -0.25106284 0.54845464 -0.75794405 -0.28827482 0.58516532
		 -0.80460703 -0.28388143 0.52155423 -0.80460703 -0.28388143 0.52155423 -0.75794405
		 -0.28827482 0.58516532 -0.7630803 -0.31325918 0.56531161 -0.74652028 -0.33035818
		 0.57755601;
	setAttr ".n[4150:4315]" -type "float3"  -0.7630803 -0.31325918 0.56531161 -0.74718255
		 -0.31063306 0.58755881 -0.74718255 -0.31063306 0.58755881 -0.7630803 -0.31325918
		 0.56531161 -0.75794405 -0.28827482 0.58516532 -0.99958205 0.02316035 -0.017300479
		 -0.99719942 0.074175104 0.0095585445 -0.99959904 0.013854661 -0.024693364 -0.99959904
		 0.013854661 -0.024693364 -0.99719942 0.074175104 0.0095585445 -0.99855983 0.036190044
		 0.039604746 -0.99855983 0.036190044 0.039604746 -0.99962246 -0.014724191 -0.023197161
		 -0.99959904 0.013854661 -0.024693364 -0.99855983 0.036190044 0.039604746 -0.9975034
		 -0.020986862 0.067427851 -0.99962246 -0.014724191 -0.023197161 -0.99962246 -0.014724191
		 -0.023197161 -0.9975034 -0.020986862 0.067427851 -0.99806845 -0.058751468 0.020190889
		 -0.9975034 -0.020986862 0.067427851 -0.98876512 -0.080704249 0.12581857 -0.99806845
		 -0.058751468 0.020190889 -0.99806845 -0.058751468 0.020190889 -0.98876512 -0.080704249
		 0.12581857 -0.99053347 -0.11264174 0.078455277 -0.98876512 -0.080704249 0.12581857
		 -0.97552764 -0.14276524 0.16722412 -0.99053347 -0.11264174 0.078455277 -0.99053347
		 -0.11264174 0.078455277 -0.97552764 -0.14276524 0.16722412 -0.97763354 -0.17623094
		 0.11478367 -0.97552764 -0.14276524 0.16722412 -0.94765759 -0.21811013 0.23318034
		 -0.97763354 -0.17623094 0.11478367 -0.97763354 -0.17623094 0.11478367 -0.94765759
		 -0.21811013 0.23318034 -0.94548726 -0.25758672 0.19925591 -0.94765759 -0.21811013
		 0.23318034 -0.89830768 -0.28800708 0.33180606 -0.94548726 -0.25758672 0.19925591
		 -0.94548726 -0.25758672 0.19925591 -0.89830768 -0.28800708 0.33180606 -0.8832705
		 -0.33885941 0.32404867 -0.89830768 -0.28800708 0.33180606 -0.8346625 -0.33550256
		 0.43677974 -0.8832705 -0.33885941 0.32404867 -0.8832705 -0.33885941 0.32404867 -0.8346625
		 -0.33550256 0.43677974 -0.80905205 -0.40983495 0.42127195 -0.79191607 -0.33291337
		 0.51189613 -0.7659052 -0.43893546 0.46981362 -0.8346625 -0.33550256 0.43677974 -0.8346625
		 -0.33550256 0.43677974 -0.7659052 -0.43893546 0.46981362 -0.80905205 -0.40983495
		 0.42127195 -0.76268858 -0.33473009 0.55340934 -0.76538408 -0.41145527 0.49486539
		 -0.79191607 -0.33291337 0.51189613 -0.79191607 -0.33291337 0.51189613 -0.76538408
		 -0.41145527 0.49486539 -0.7659052 -0.43893546 0.46981362 -0.77386415 -0.38070667
		 0.50615877 -0.76538408 -0.41145527 0.49486539 -0.76268858 -0.33473009 0.55340934
		 -0.78314209 -0.30704305 0.54075223 -0.77661335 -0.33819479 0.5315035 -0.74946415
		 -0.32772422 0.57523936 -0.74946415 -0.32772422 0.57523936 -0.77661335 -0.33819479
		 0.5315035 -0.77386415 -0.38070667 0.50615877 -0.99220908 0.11271081 0.053078923 -0.98541766
		 0.13872862 0.098520845 -0.99212068 0.12261898 0.025713036 -0.99212068 0.12261898
		 0.025713036 -0.98541766 0.13872862 0.098520845 -0.98507309 0.14838947 0.087244138
		 -0.14064582 0.87965554 -0.4543401 -0.18551259 0.7425763 -0.64355689 -0.82415354 0.50098372
		 -0.26417094 -0.82415354 0.50098372 -0.26417094 -0.18551259 0.7425763 -0.64355689
		 -0.83440018 0.4365195 -0.33649239 -0.2195749 0.62007827 -0.7531864 -0.83342201 0.4024643
		 -0.37872189 -0.18551259 0.7425763 -0.64355689 -0.18551259 0.7425763 -0.64355689 -0.83342201
		 0.4024643 -0.37872189 -0.83440018 0.4365195 -0.33649239 -0.25899214 0.42127028 -0.86916882
		 -0.8609283 0.31787959 -0.39718381 -0.2195749 0.62007827 -0.7531864 -0.2195749 0.62007827
		 -0.7531864 -0.8609283 0.31787959 -0.39718381 -0.83342201 0.4024643 -0.37872189 -0.28435737
		 0.24180649 -0.92772329 -0.86501682 0.24722362 -0.43660781 -0.25899214 0.42127028
		 -0.86916882 -0.25899214 0.42127028 -0.86916882 -0.86501682 0.24722362 -0.43660781
		 -0.8609283 0.31787959 -0.39718381 -0.29915154 0.016235286 -0.95406747 -0.88492519
		 0.13600618 -0.44543204 -0.28435737 0.24180649 -0.92772329 -0.28435737 0.24180649
		 -0.92772329 -0.88492519 0.13600618 -0.44543204 -0.86501682 0.24722362 -0.43660781
		 -0.31070268 -0.19372919 -0.93055511 -0.8793453 0.017327335 -0.4758693 -0.29915154
		 0.016235286 -0.95406747 -0.29915154 0.016235286 -0.95406747 -0.8793453 0.017327335
		 -0.4758693 -0.88492519 0.13600618 -0.44543204 -0.30445313 -0.45696256 -0.83575922
		 -0.89406908 -0.14989588 -0.42210385 -0.31070268 -0.19372919 -0.93055511 -0.31070268
		 -0.19372919 -0.93055511 -0.89406908 -0.14989588 -0.42210385 -0.8793453 0.017327335
		 -0.4758693 -0.30445313 -0.45696256 -0.83575922 -0.28872591 -0.68702173 -0.66681218
		 -0.89406908 -0.14989588 -0.42210385 -0.89406908 -0.14989588 -0.42210385 -0.28872591
		 -0.68702173 -0.66681218 -0.88464952 -0.34522924 -0.3133879 -0.28872591 -0.68702173
		 -0.66681218 -0.25880864 -0.83924967 -0.47820294 -0.88464952 -0.34522924 -0.3133879
		 -0.88464952 -0.34522924 -0.3133879 -0.25880864 -0.83924967 -0.47820294 -0.83379525
		 -0.52450448 -0.17228046 -0.25880864 -0.83924967 -0.47820294 -0.24405073 -0.8848083
		 -0.39693016 -0.83379525 -0.52450448 -0.17228046 -0.83379525 -0.52450448 -0.17228046
		 -0.24405073 -0.8848083 -0.39693016 -0.81761932 -0.57152122 -0.069729418 -0.24405073
		 -0.8848083 -0.39693016 -0.22675493 -0.91107523 -0.34427333 -0.81761932 -0.57152122
		 -0.069729418 -0.81761932 -0.57152122 -0.069729418 -0.22675493 -0.91107523 -0.34427333
		 -0.7710939 -0.63653201 0.015529849 -0.22675493 -0.91107523 -0.34427333 -0.21970652
		 -0.93398058 -0.28179666 -0.7710939 -0.63653201 0.015529849 -0.7710939 -0.63653201
		 0.015529849 -0.21970652 -0.93398058 -0.28179666 -0.74551827 -0.64773172 0.15699087
		 -0.17758164 -0.9707042 -0.16185831 -0.64847142 -0.70075351 0.29737067 -0.21970652
		 -0.93398058 -0.28179666 -0.21970652 -0.93398058 -0.28179666 -0.64847142 -0.70075351
		 0.29737067 -0.74551827 -0.64773172 0.15699087 -0.11621865 -0.9908691 0.068349034
		 -0.57509238 -0.67549461 0.46149305 -0.17758164 -0.9707042 -0.16185831 -0.17758164
		 -0.9707042 -0.16185831 -0.57509238 -0.67549461 0.46149305 -0.64847142 -0.70075351
		 0.29737067 -0.060808271 -0.92140919 0.38380656 -0.531358 -0.59190714 0.60605657 -0.11621865
		 -0.9908691 0.068349034 -0.11621865 -0.9908691 0.068349034 -0.531358 -0.59190714 0.60605657;
	setAttr ".n[4316:4481]" -type "float3"  -0.57509238 -0.67549461 0.46149305 -0.012590019
		 -0.82649148 0.56280839 -0.4938969 -0.5580402 0.66682601 -0.060808271 -0.92140919
		 0.38380656 -0.060808271 -0.92140919 0.38380656 -0.4938969 -0.5580402 0.66682601 -0.531358
		 -0.59190714 0.60605657 0.022281412 -0.73627335 0.67631727 -0.46807405 -0.53735894
		 0.70153546 -0.012590019 -0.82649148 0.56280839 -0.012590019 -0.82649148 0.56280839
		 -0.46807405 -0.53735894 0.70153546 -0.4938969 -0.5580402 0.66682601 0.045342609 -0.63396347
		 0.77203262 -0.48025048 -0.48995301 0.72753388 0.022281412 -0.73627335 0.67631727
		 0.022281412 -0.73627335 0.67631727 -0.48025048 -0.48995301 0.72753388 -0.46807405
		 -0.53735894 0.70153546 0.069144323 -0.52465934 0.84849966 -0.45165491 -0.45175087
		 0.76936924 0.045342609 -0.63396347 0.77203262 0.045342609 -0.63396347 0.77203262
		 -0.45165491 -0.45175087 0.76936924 -0.48025048 -0.48995301 0.72753388 0.069144323
		 -0.52465934 0.84849966 0.085303441 -0.4054763 0.91011661 -0.45165491 -0.45175087
		 0.76936924 -0.45165491 -0.45175087 0.76936924 0.085303441 -0.4054763 0.91011661 -0.46473357
		 -0.40033606 0.7897808 0.085303441 -0.4054763 0.91011661 0.10495764 -0.25589162 0.96099085
		 -0.46473357 -0.40033606 0.7897808 -0.46473357 -0.40033606 0.7897808 0.10495764 -0.25589162
		 0.96099085 -0.43881786 -0.35493264 0.82550693 0.10495764 -0.25589162 0.96099085 0.11451831
		 -0.075023234 0.99058419 -0.43881786 -0.35493264 0.82550693 -0.43881786 -0.35493264
		 0.82550693 0.11451831 -0.075023234 0.99058419 -0.45300508 -0.30192471 0.83882529
		 0.11451831 -0.075023234 0.99058419 0.11805823 0.17027183 0.97829944 -0.45300508 -0.30192471
		 0.83882529 -0.45300508 -0.30192471 0.83882529 0.11805823 0.17027183 0.97829944 -0.46549892
		 -0.21178065 0.85933679 0.11805823 0.17027183 0.97829944 0.10153934 0.52595311 0.84443063
		 -0.46549892 -0.21178065 0.85933679 -0.46549892 -0.21178065 0.85933679 0.10153934
		 0.52595311 0.84443063 -0.48636028 -0.0055402126 0.87374079 0.10153934 0.52595311
		 0.84443063 0.061853793 0.74993187 0.6586169 -0.48636028 -0.0055402126 0.87374079
		 -0.48636028 -0.0055402126 0.87374079 0.061853793 0.74993187 0.6586169 -0.57531834
		 0.15764317 0.80259418 0.061853793 0.74993187 0.6586169 0.037679069 0.84683782 0.5305149
		 -0.57531834 0.15764317 0.80259418 -0.57531834 0.15764317 0.80259418 0.037679069 0.84683782
		 0.5305149 -0.67851949 0.32685792 0.65785658 0.037679069 0.84683782 0.5305149 0.033035841
		 0.88092166 0.47210765 -0.67851949 0.32685792 0.65785658 -0.67851949 0.32685792 0.65785658
		 0.033035841 0.88092166 0.47210765 -0.71683574 0.4630754 0.52125585 0.033937901 0.89047128
		 0.45377213 -0.74112451 0.52488744 0.41860208 0.033035841 0.88092166 0.47210765 0.033035841
		 0.88092166 0.47210765 -0.74112451 0.52488744 0.41860208 -0.71683574 0.4630754 0.52125585
		 0.033937901 0.89047128 0.45377213 0.039628293 0.89588809 0.44250885 -0.74112451 0.52488744
		 0.41860208 -0.74112451 0.52488744 0.41860208 0.039628293 0.89588809 0.44250885 -0.7173602
		 0.58484977 0.37860942 0.039628293 0.89588809 0.44250885 0.036258038 0.91869956 0.39328933
		 -0.7173602 0.58484977 0.37860942 -0.7173602 0.58484977 0.37860942 0.036258038 0.91869956
		 0.39328933 -0.76246125 0.59004486 0.26551834 0.036258038 0.91869956 0.39328933 0.024208462
		 0.96178073 0.27274853 -0.76246125 0.59004486 0.26551834 -0.76246125 0.59004486 0.26551834
		 0.024208462 0.96178073 0.27274853 -0.70685977 0.68986636 0.15631275 0.024208462 0.96178073
		 0.27274853 -0.017758621 0.99955523 0.023957167 -0.70685977 0.68986636 0.15631275
		 -0.70685977 0.68986636 0.15631275 -0.017758621 0.99955523 0.023957167 -0.77907032
		 0.6253621 -0.044403613 -0.017758621 0.99955523 0.023957167 -0.095932744 0.96316248
		 -0.25122693 -0.77907032 0.6253621 -0.044403613 -0.77907032 0.6253621 -0.044403613
		 -0.095932744 0.96316248 -0.25122693 -0.79160273 0.58195025 -0.1862767 -0.095932744
		 0.96316248 -0.25122693 -0.14064582 0.87965554 -0.4543401 -0.79160273 0.58195025 -0.1862767
		 -0.79160273 0.58195025 -0.1862767 -0.14064582 0.87965554 -0.4543401 -0.82415354 0.50098372
		 -0.26417094 -0.98409432 0.10872283 0.14049084 -0.98471177 0.14297113 0.099508718
		 -0.88464952 -0.34522924 -0.3133879 -0.88464952 -0.34522924 -0.3133879 -0.98471177
		 0.14297113 0.099508718 -0.89406908 -0.14989588 -0.42210385 -0.97619253 0.043649927
		 0.21246833 -0.98409432 0.10872283 0.14049084 -0.83379525 -0.52450448 -0.17228046
		 -0.83379525 -0.52450448 -0.17228046 -0.98409432 0.10872283 0.14049084 -0.88464952
		 -0.34522924 -0.3133879 -0.9610219 0.00078293477 0.27647111 -0.97619253 0.043649927
		 0.21246833 -0.81761932 -0.57152122 -0.069729418 -0.81761932 -0.57152122 -0.069729418
		 -0.97619253 0.043649927 0.21246833 -0.83379525 -0.52450448 -0.17228046 -0.9610219
		 0.00078293477 0.27647111 -0.81761932 -0.57152122 -0.069729418 -0.93239319 -0.044445064
		 0.35870257 -0.93239319 -0.044445064 0.35870257 -0.81761932 -0.57152122 -0.069729418
		 -0.7710939 -0.63653201 0.015529849 -0.93239319 -0.044445064 0.35870257 -0.7710939
		 -0.63653201 0.015529849 -0.88641697 -0.090639479 0.45392665 -0.88641697 -0.090639479
		 0.45392665 -0.7710939 -0.63653201 0.015529849 -0.74551827 -0.64773172 0.15699087
		 -0.88641697 -0.090639479 0.45392665 -0.74551827 -0.64773172 0.15699087 -0.8140074
		 -0.14577229 0.5622654 -0.8140074 -0.14577229 0.5622654 -0.74551827 -0.64773172 0.15699087
		 -0.64847142 -0.70075351 0.29737067 -0.8140074 -0.14577229 0.5622654 -0.64847142 -0.70075351
		 0.29737067 -0.77288169 -0.16966356 0.61144763 -0.77288169 -0.16966356 0.61144763
		 -0.64847142 -0.70075351 0.29737067 -0.57509238 -0.67549461 0.46149305 -0.77288169
		 -0.16966356 0.61144763 -0.57509238 -0.67549461 0.46149305 -0.76600975 -0.19597217
		 0.61222869 -0.76600975 -0.19597217 0.61222869 -0.57509238 -0.67549461 0.46149305
		 -0.531358 -0.59190714 0.60605657 -0.76600975 -0.19597217 0.61222869 -0.531358 -0.59190714
		 0.60605657 -0.76916832 -0.21294111 0.60252482;
	setAttr ".n[4482:4647]" -type "float3"  -0.76916832 -0.21294111 0.60252482 -0.531358
		 -0.59190714 0.60605657 -0.4938969 -0.5580402 0.66682601 -0.76916832 -0.21294111 0.60252482
		 -0.4938969 -0.5580402 0.66682601 -0.79032952 -0.23934385 0.56399798 -0.79032952 -0.23934385
		 0.56399798 -0.4938969 -0.5580402 0.66682601 -0.46807405 -0.53735894 0.70153546 -0.79032952
		 -0.23934385 0.56399798 -0.46807405 -0.53735894 0.70153546 -0.79384452 -0.28212863
		 0.53871542 -0.79384452 -0.28212863 0.53871542 -0.46807405 -0.53735894 0.70153546
		 -0.48025048 -0.48995301 0.72753388 -0.79384452 -0.28212863 0.53871542 -0.48025048
		 -0.48995301 0.72753388 -0.78844774 -0.29147688 0.54165614 -0.78844774 -0.29147688
		 0.54165614 -0.48025048 -0.48995301 0.72753388 -0.45165491 -0.45175087 0.76936924
		 -0.78314209 -0.30704305 0.54075223 -0.78844774 -0.29147688 0.54165614 -0.46473357
		 -0.40033606 0.7897808 -0.46473357 -0.40033606 0.7897808 -0.78844774 -0.29147688 0.54165614
		 -0.45165491 -0.45175087 0.76936924 -0.77661335 -0.33819479 0.5315035 -0.78314209
		 -0.30704305 0.54075223 -0.43881786 -0.35493264 0.82550693 -0.43881786 -0.35493264
		 0.82550693 -0.78314209 -0.30704305 0.54075223 -0.46473357 -0.40033606 0.7897808 -0.77386415
		 -0.38070667 0.50615877 -0.77661335 -0.33819479 0.5315035 -0.45300508 -0.30192471
		 0.83882529 -0.45300508 -0.30192471 0.83882529 -0.77661335 -0.33819479 0.5315035 -0.43881786
		 -0.35493264 0.82550693 -0.76538408 -0.41145527 0.49486539 -0.77386415 -0.38070667
		 0.50615877 -0.46549892 -0.21178065 0.85933679 -0.46549892 -0.21178065 0.85933679
		 -0.77386415 -0.38070667 0.50615877 -0.45300508 -0.30192471 0.83882529 -0.7659052
		 -0.43893546 0.46981362 -0.76538408 -0.41145527 0.49486539 -0.48636028 -0.0055402126
		 0.87374079 -0.48636028 -0.0055402126 0.87374079 -0.76538408 -0.41145527 0.49486539
		 -0.46549892 -0.21178065 0.85933679 -0.80905205 -0.40983495 0.42127195 -0.7659052
		 -0.43893546 0.46981362 -0.57531834 0.15764317 0.80259418 -0.57531834 0.15764317 0.80259418
		 -0.7659052 -0.43893546 0.46981362 -0.48636028 -0.0055402126 0.87374079 -0.8832705
		 -0.33885941 0.32404867 -0.80905205 -0.40983495 0.42127195 -0.67851949 0.32685792
		 0.65785658 -0.67851949 0.32685792 0.65785658 -0.80905205 -0.40983495 0.42127195 -0.57531834
		 0.15764317 0.80259418 -0.94548726 -0.25758672 0.19925591 -0.8832705 -0.33885941 0.32404867
		 -0.71683574 0.4630754 0.52125585 -0.71683574 0.4630754 0.52125585 -0.8832705 -0.33885941
		 0.32404867 -0.67851949 0.32685792 0.65785658 -0.97763354 -0.17623094 0.11478367 -0.94548726
		 -0.25758672 0.19925591 -0.74112451 0.52488744 0.41860208 -0.74112451 0.52488744 0.41860208
		 -0.94548726 -0.25758672 0.19925591 -0.71683574 0.4630754 0.52125585 -0.97763354 -0.17623094
		 0.11478367 -0.74112451 0.52488744 0.41860208 -0.99053347 -0.11264174 0.078455277
		 -0.99053347 -0.11264174 0.078455277 -0.74112451 0.52488744 0.41860208 -0.7173602
		 0.58484977 0.37860942 -0.99053347 -0.11264174 0.078455277 -0.7173602 0.58484977 0.37860942
		 -0.99806845 -0.058751468 0.020190889 -0.99806845 -0.058751468 0.020190889 -0.7173602
		 0.58484977 0.37860942 -0.76246125 0.59004486 0.26551834 -0.99806845 -0.058751468
		 0.020190889 -0.76246125 0.59004486 0.26551834 -0.99962246 -0.014724191 -0.023197161
		 -0.99962246 -0.014724191 -0.023197161 -0.76246125 0.59004486 0.26551834 -0.70685977
		 0.68986636 0.15631275 -0.99962246 -0.014724191 -0.023197161 -0.70685977 0.68986636
		 0.15631275 -0.99959904 0.013854661 -0.024693364 -0.99959904 0.013854661 -0.024693364
		 -0.70685977 0.68986636 0.15631275 -0.77907032 0.6253621 -0.044403613 -0.99959904
		 0.013854661 -0.024693364 -0.77907032 0.6253621 -0.044403613 -0.99958205 0.02316035
		 -0.017300479 -0.99958205 0.02316035 -0.017300479 -0.77907032 0.6253621 -0.044403613
		 -0.79160273 0.58195025 -0.1862767 -0.99958205 0.02316035 -0.017300479 -0.79160273
		 0.58195025 -0.1862767 -0.99969727 0.023667186 0.006722251 -0.99969727 0.023667186
		 0.006722251 -0.79160273 0.58195025 -0.1862767 -0.82415354 0.50098372 -0.26417094
		 -0.99969727 0.023667186 0.006722251 -0.82415354 0.50098372 -0.26417094 -0.99667227
		 0.076648079 0.027739672 -0.99667227 0.076648079 0.027739672 -0.82415354 0.50098372
		 -0.26417094 -0.83440018 0.4365195 -0.33649239 -0.99667227 0.076648079 0.027739672
		 -0.83440018 0.4365195 -0.33649239 -0.99441069 0.10214359 0.0267222 -0.99441069 0.10214359
		 0.0267222 -0.83440018 0.4365195 -0.33649239 -0.83342201 0.4024643 -0.37872189 -0.99441069
		 0.10214359 0.0267222 -0.83342201 0.4024643 -0.37872189 -0.99220908 0.11271081 0.053078923
		 -0.99220908 0.11271081 0.053078923 -0.83342201 0.4024643 -0.37872189 -0.8609283 0.31787959
		 -0.39718381 -0.99220908 0.11271081 0.053078923 -0.8609283 0.31787959 -0.39718381
		 -0.98541766 0.13872862 0.098520845 -0.98541766 0.13872862 0.098520845 -0.8609283
		 0.31787959 -0.39718381 -0.86501682 0.24722362 -0.43660781 -0.98507309 0.14838947
		 0.087244138 -0.98541766 0.13872862 0.098520845 -0.88492519 0.13600618 -0.44543204
		 -0.88492519 0.13600618 -0.44543204 -0.98541766 0.13872862 0.098520845 -0.86501682
		 0.24722362 -0.43660781 -0.88492519 0.13600618 -0.44543204 -0.8793453 0.017327335
		 -0.4758693 -0.98507309 0.14838947 0.087244138 -0.98507309 0.14838947 0.087244138
		 -0.8793453 0.017327335 -0.4758693 -0.9848277 0.14661804 0.09283071 -0.98471177 0.14297113
		 0.099508718 -0.9848277 0.14661804 0.09283071 -0.89406908 -0.14989588 -0.42210385
		 -0.89406908 -0.14989588 -0.42210385 -0.9848277 0.14661804 0.09283071 -0.8793453 0.017327335
		 -0.4758693 0.93012851 -0.31639799 -0.18642212 0.88996571 -0.44654852 -0.092495658
		 0.79264104 -0.51804304 -0.32148349 0.79264104 -0.51804304 -0.32148349 0.88996571
		 -0.44654852 -0.092495658 0.74421799 -0.65492338 -0.13120565 0.81668323 0.44178563
		 -0.37128687 0.60513681 0.6211403 -0.4979901 0.69553143 0.56431758 -0.44472659 0.69553143
		 0.56431758 -0.44472659 0.60513681 0.6211403 -0.4979901 0.57686752 0.64719594 -0.49835861
		 0.60513681 0.6211403 -0.4979901;
	setAttr ".n[4648:4813]" -type "float3"  0.31906772 0.74305308 -0.58827537 0.45186505
		 0.66529441 -0.59430742 0.45186505 0.66529441 -0.59430742 0.31906772 0.74305308 -0.58827537
		 0.21979007 0.77321953 -0.59483093 -0.98435187 0.0063033937 -0.17610115 -0.94987291
		 0.1108272 -0.29233336 -0.95777249 0.14541641 -0.24804428 -0.95777249 0.14541641 -0.24804428
		 -0.94987291 0.1108272 -0.29233336 -0.89207023 0.25964049 -0.36986148 -0.74127632
		 -0.46019942 -0.48859584 -0.7299282 -0.31120253 -0.60857034 -0.3364042 -0.62996179
		 -0.69998598 -0.3364042 -0.62996179 -0.69998598 -0.7299282 -0.31120253 -0.60857034
		 -0.33076423 -0.41769329 -0.84624308 0.81417054 -0.39761481 -0.42311803 0.79264104
		 -0.51804304 -0.32148349 0.5273779 -0.57616562 -0.62442428 0.5273779 -0.57616562 -0.62442428
		 0.79264104 -0.51804304 -0.32148349 0.48219365 -0.7564888 -0.44183025 0.86808842 -0.44404003
		 0.22192562 0.86053807 -0.48004016 0.17039862 0.82382631 -0.4893733 0.28604895 0.82382631
		 -0.4893733 0.28604895 0.86053807 -0.48004016 0.17039862 0.80061978 -0.55641729 0.22227867
		 0.90957713 -0.40539381 -0.091242857 0.79711467 -0.60289466 0.033559222 0.87118334
		 -0.4780964 0.11163983 0.87118334 -0.4780964 0.11163983 0.79711467 -0.60289466 0.033559222
		 0.77877641 -0.61276221 0.13427515 -0.95724863 0.0030751403 -0.28925002 -0.91186607
		 -0.11888491 -0.39289516 -0.97058749 -0.082424134 -0.2261994 -0.97058749 -0.082424134
		 -0.2261994 -0.91186607 -0.11888491 -0.39289516 -0.91797256 -0.17251985 -0.35716003
		 0.93268538 -0.13941853 -0.33265674 0.92902386 -0.25379157 -0.26926669 0.81836426
		 -0.27305993 -0.50568587 0.81836426 -0.27305993 -0.50568587 0.92902386 -0.25379157
		 -0.26926669 0.81417054 -0.39761481 -0.42311803 -0.68826032 -0.12656619 -0.714338
		 -0.34239918 -0.1664394 -0.92469496 -0.7299282 -0.31120253 -0.60857034 -0.7299282
		 -0.31120253 -0.60857034 -0.34239918 -0.1664394 -0.92469496 -0.33076423 -0.41769329
		 -0.84624308 -0.92047763 -0.2551837 -0.29597667 -0.91407585 -0.35735875 -0.19172904
		 -0.9741255 -0.14827041 -0.17057365 -0.9741255 -0.14827041 -0.17057365 -0.91407585
		 -0.35735875 -0.19172904 -0.97028315 -0.18760987 -0.15281723 -0.34239918 -0.1664394
		 -0.92469496 -0.68826032 -0.12656619 -0.714338 -0.33061299 0.038162164 -0.94299453
		 -0.33061299 0.038162164 -0.94299453 -0.68826032 -0.12656619 -0.714338 -0.63626152
		 0.047949523 -0.76998192 0.78218156 0.0097510191 -0.62297428 0.70814073 0.2359145
		 -0.66549313 0.89806581 0.012964822 -0.43967003 0.89806581 0.012964822 -0.43967003
		 0.70814073 0.2359145 -0.66549313 0.86301792 0.1582863 -0.4797349 -0.34239918 -0.1664394
		 -0.92469496 0.063669272 -0.20758377 -0.976143 -0.33076423 -0.41769329 -0.84624308
		 -0.33076423 -0.41769329 -0.84624308 0.063669272 -0.20758377 -0.976143 0.076087862
		 -0.46115249 -0.88405263 0.74421799 -0.65492338 -0.13120565 0.88996571 -0.44654852
		 -0.092495658 0.74379373 -0.66658401 0.04936171 0.74379373 -0.66658401 0.04936171
		 0.88996571 -0.44654852 -0.092495658 0.85921848 -0.50882035 0.053342801 0.076087862
		 -0.46115249 -0.88405263 0.53863394 -0.39507368 -0.74417084 0.066994667 -0.66711468
		 -0.74193645 0.066994667 -0.66711468 -0.74193645 0.53863394 -0.39507368 -0.74417084
		 0.5273779 -0.57616562 -0.62442428 0.92835766 0.24807025 -0.27679095 0.93701845 0.23326164
		 -0.25997195 0.85178143 0.39670947 -0.3421841 0.85178143 0.39670947 -0.3421841 0.93701845
		 0.23326164 -0.25997195 0.81668323 0.44178563 -0.37128687 -0.42743999 0.82819861 -0.36246678
		 -0.522425 0.78543979 -0.33189824 -0.4969826 0.79852229 -0.33966228 -0.4969826 0.79852229
		 -0.33966228 -0.522425 0.78543979 -0.33189824 -0.55302399 0.77081436 -0.31624314 0.90797877
		 -0.33900374 0.24627426 0.86808842 -0.44404003 0.22192562 0.80772716 -0.46222955 0.36595172
		 0.80772716 -0.46222955 0.36595172 0.86808842 -0.44404003 0.22192562 0.82382631 -0.4893733
		 0.28604895 -0.91770685 -0.2941469 -0.26700526 -0.91907173 -0.34422615 -0.19187368
		 -0.87393111 -0.42873058 -0.22898576 -0.87393111 -0.42873058 -0.22898576 -0.91907173
		 -0.34422615 -0.19187368 -0.88074434 -0.44626716 -0.15854022 -0.84886909 -0.52644503
		 -0.047717161 -0.88781506 -0.4541381 -0.074451387 -0.88521045 -0.46502122 0.012557453
		 -0.88521045 -0.46502122 0.012557453 -0.88781506 -0.4541381 -0.074451387 -0.86711419
		 -0.49382347 -0.065202512 0.21979007 0.77321953 -0.59483093 0.31906772 0.74305308
		 -0.58827537 -3.2959051e-06 0.79200685 -0.6105122 -3.2959051e-06 0.79200685 -0.6105122
		 0.31906772 0.74305308 -0.58827537 -0.0012789979 0.78851217 -0.61501783 -0.68886167
		 0.5182839 -0.50680506 -0.62297237 0.55108547 -0.5551669 -0.50226986 0.60720193 -0.61565471
		 -0.0012789979 0.78851217 -0.61501783 -0.35883802 0.72143924 -0.59225053 -3.2959051e-06
		 0.79200685 -0.6105122 -3.2959051e-06 0.79200685 -0.6105122 -0.35883802 0.72143924
		 -0.59225053 -0.21979031 0.77321947 -0.59483093 -0.92502838 -0.14334965 -0.35181442
		 -0.93137014 -0.051763251 -0.36037517 -0.94648951 -0.18457772 -0.26474261 -0.94648951
		 -0.18457772 -0.26474261 -0.93137014 -0.051763251 -0.36037517 -0.96979862 -0.023734571
		 -0.24274935 -0.66571611 0.66116691 -0.34594846 -0.64954567 0.6889717 -0.32157168
		 -0.67432106 0.65689319 -0.33731648 -0.67432106 0.65689319 -0.33731648 -0.64954567
		 0.6889717 -0.32157168 -0.64183253 0.70173794 -0.30921662 -0.61282641 0.73132116 -0.29935464
		 -0.64183253 0.70173794 -0.30921662 -0.62252432 0.71912515 -0.30874345 -0.62252432
		 0.71912515 -0.30874345 -0.64183253 0.70173794 -0.30921662 -0.64954567 0.6889717 -0.32157168
		 -0.63626152 0.047949523 -0.76998192 -0.88600153 0.0087278998 -0.46360022 -0.65161461
		 0.27763927 -0.70591414 -0.65161461 0.27763927 -0.70591414 -0.88600153 0.0087278998
		 -0.46360022 -0.89197224 0.15639158 -0.42417824 -0.65161461 0.27763927 -0.70591414
		 -0.89197224 0.15639158 -0.42417824 -0.68152291 0.39510205 -0.61597145 -0.68152291
		 0.39510205 -0.61597145 -0.89197224 0.15639158 -0.42417824 -0.90524489 0.19736239
		 -0.37627095 0.75056648 0.54247338 -0.37732294 0.85178143 0.39670947 -0.3421841;
	setAttr ".n[4814:4979]" -type "float3"  0.81668323 0.44178563 -0.37128687 0.92835766
		 0.24807025 -0.27679095 0.85178143 0.39670947 -0.3421841 0.94312739 0.17473699 -0.28280324
		 0.55690426 0.76804179 -0.31617942 0.5239284 0.78465462 -0.33138528 0.4969824 0.79852241
		 -0.33966219 0.4969824 0.79852241 -0.33966219 0.5239284 0.78465462 -0.33138528 0.42743978
		 0.82819867 -0.36246687 0.65837318 0.67193615 -0.33918512 0.68077242 0.64806932 -0.34140167
		 0.65965414 0.67610246 -0.32824066 0.65965414 0.67610246 -0.32824066 0.68077242 0.64806932
		 -0.34140167 0.69439465 0.63764364 -0.33350655 0.65837318 0.67193615 -0.33918512 0.65965414
		 0.67610246 -0.32824066 0.62679553 0.71712458 -0.3047289 0.62679553 0.71712458 -0.3047289
		 0.65965414 0.67610246 -0.32824066 0.61589116 0.72865236 -0.29957265 0.88996571 -0.44654852
		 -0.092495658 0.93012851 -0.31639799 -0.18642212 0.95242596 -0.30469197 -0.0068982346
		 -0.77927482 -0.60622829 -0.15880199 -0.79248166 -0.59161836 -0.14819098 -0.8810299
		 -0.46884376 -0.063022435 -0.8810299 -0.46884376 -0.063022435 -0.79248166 -0.59161836
		 -0.14819098 -0.91380185 -0.40232408 0.055691745 -0.35638639 0.92904472 -0.099321157
		 -0.7171827 0.64725733 -0.25827673 -0.47107208 0.87495649 -0.1119919 -0.47107208 0.87495649
		 -0.1119919 -0.7171827 0.64725733 -0.25827673 -0.71733934 0.6447286 -0.26410103 0.71733922
		 0.64472872 -0.26410088 0.71716875 0.64727598 -0.25826871 0.46809345 0.87671947 -0.11068612
		 0.46809345 0.87671947 -0.11068612 0.71716875 0.64727598 -0.25826871 0.35780936 0.92865992
		 -0.097791538 -0.71733934 0.6447286 -0.26410103 -0.7171827 0.64725733 -0.25827673
		 -0.72858721 0.62933987 -0.27035534 -0.72858721 0.62933987 -0.27035534 -0.7171827
		 0.64725733 -0.25827673 -0.73542416 0.62647527 -0.25822467 0.71733922 0.64472872 -0.26410088
		 0.72858703 0.62934005 -0.27035528 0.71716875 0.64727598 -0.25826871 0.71716875 0.64727598
		 -0.25826871 0.72858703 0.62934005 -0.27035528 0.7354241 0.62647527 -0.2582249 -0.61167496
		 -0.55709314 0.5616948 -0.79398781 -0.44336423 0.41594645 -0.67842782 -0.54016006
		 0.49795863 -0.943694 -0.23213789 0.2356983 -0.98496509 -0.12044101 0.12384583 -0.95236969
		 -0.21862268 0.21259385 -0.95236969 -0.21862268 0.21259385 -0.98496509 -0.12044101
		 0.12384583 -0.98849189 -0.10907687 0.10481438 -0.45031467 -0.58704752 0.67274946
		 -0.29238617 -0.7137385 0.63646495 -0.48213807 -0.71444237 0.50706506 -0.29238617
		 -0.7137385 0.63646495 -0.45031467 -0.58704752 0.67274946 -0.30444002 -0.58477902
		 0.75189739 -0.30444002 -0.58477902 0.75189739 -0.45031467 -0.58704752 0.67274946
		 -0.44422942 -0.53850567 0.71601111 -0.94581515 0.21763749 -0.24097225 -0.8826375
		 0.32687086 -0.33779654 -0.94769126 0.22303414 -0.22833541 -0.94769126 0.22303414
		 -0.22833541 -0.8826375 0.32687086 -0.33779654 -0.8875711 0.34191197 -0.30872923 -0.9833976
		 0.13789546 -0.1179578 -0.9556306 0.21656448 -0.19967481 -0.99005365 0.081190743 -0.11489934
		 -0.99005365 0.081190743 -0.11489934 -0.9556306 0.21656448 -0.19967481 -0.99221611
		 0.067236632 -0.10481612 -0.9833976 0.13789546 -0.1179578 -0.94769126 0.22303414 -0.22833541
		 -0.9556306 0.21656448 -0.19967481 -0.45031467 -0.58704752 0.67274946 -0.48213807
		 -0.71444237 0.50706506 -0.59563684 -0.57091284 0.56504452 -0.59563684 -0.57091284
		 0.56504452 -0.48213807 -0.71444237 0.50706506 -0.72316688 -0.60477269 0.3335861 -0.44422942
		 -0.53850567 0.71601111 -0.48150185 -0.53988522 0.69042009 -0.30444002 -0.58477902
		 0.75189739 -0.30444002 -0.58477902 0.75189739 -0.48150185 -0.53988522 0.69042009
		 -0.33709374 -0.62744665 0.70191061 -0.48150185 -0.53988522 0.69042009 -0.57124817
		 -0.55763233 0.60226387 -0.33709374 -0.62744665 0.70191061 -0.33709374 -0.62744665
		 0.70191061 -0.57124817 -0.55763233 0.60226387 -0.61167496 -0.55709314 0.5616948 -0.79398781
		 -0.44336423 0.41594645 -0.8623786 -0.36824733 0.34741479 -0.67842782 -0.54016006
		 0.49795863 -0.67842782 -0.54016006 0.49795863 -0.8623786 -0.36824733 0.34741479 -0.86391014
		 -0.36709058 0.34482422 -0.98496509 -0.12044101 0.12384583 -0.99742973 -0.069281936
		 0.018275481 -0.98849189 -0.10907687 0.10481438 -0.98849189 -0.10907687 0.10481438
		 -0.99742973 -0.069281936 0.018275481 -0.99854934 -0.052945275 0.0098013068 -0.99181116
		 -0.10112387 0.078003936 -0.99920672 -0.039429139 0.0055972142 -0.99321145 -0.1083044
		 0.042439837 -0.99321145 -0.1083044 0.042439837 -0.99920672 -0.039429139 0.0055972142
		 -0.99884129 -0.042590592 -0.022409128 0.50449312 -0.61063224 0.61042196 0.42194641
		 -0.58782262 0.69023609 0.50870937 -0.58424139 0.63235807 0.30805421 -0.52883554 0.79084486
		 0.16887671 -0.48919937 0.85566622 0.30161199 -0.55574477 0.77471155 -0.8875711 0.34191197
		 -0.30872923 -0.88261151 0.35036644 -0.31343305 -0.9556306 0.21656448 -0.19967481
		 -0.9556306 0.21656448 -0.19967481 -0.88261151 0.35036644 -0.31343305 -0.9613905 0.19663273
		 -0.19251972 -0.94581515 0.21763749 -0.24097225 -0.95777249 0.14541641 -0.24804428
		 -0.8826375 0.32687086 -0.33779654 -0.8826375 0.32687086 -0.33779654 -0.95777249 0.14541641
		 -0.24804428 -0.89207023 0.25964049 -0.36986148 -0.98587775 -0.12583847 -0.11049762
		 -0.96756029 -0.25263074 0.0021767577 -0.96844184 -0.21371609 -0.12824138 -0.96844184
		 -0.21371609 -0.12824138 -0.96756029 -0.25263074 0.0021767577 -0.9482643 -0.31728086
		 -0.011299993 -0.9482643 -0.31728086 -0.011299993 -0.96756029 -0.25263074 0.0021767577
		 -0.87653941 -0.46207604 0.1347755 -0.87653941 -0.46207604 0.1347755 -0.96756029 -0.25263074
		 0.0021767577 -0.89240193 -0.38005844 0.24325781 -0.78256196 -0.43312281 0.4472152
		 -0.72316688 -0.60477269 0.3335861 -0.89240193 -0.38005844 0.24325781 -0.89240193
		 -0.38005844 0.24325781 -0.72316688 -0.60477269 0.3335861 -0.87653941 -0.46207604
		 0.1347755 -0.50392032 -0.61096156 0.61056554 -0.50739568 -0.58528161 0.63245159 -0.42129797
		 -0.58849984 0.69005507 -0.16858619 -0.4895359 0.85553098 -0.12957968 -0.47134644
		 0.87237698 -0.30792359 -0.52924275 0.79062325;
	setAttr ".n[4980:5145]" -type "float3"  -0.30792359 -0.52924275 0.79062325 -0.12957968
		 -0.47134644 0.87237698 -0.24072877 -0.49322212 0.8359316 -0.42129797 -0.58849984
		 0.69005507 -0.30101588 -0.55650347 0.77439868 -0.30792359 -0.52924275 0.79062325
		 0.4253405 -0.78144211 0.45654538 0.032404736 -0.85560393 0.51661581 0.42978662 -0.84429204
		 0.32008505 0.42978662 -0.84429204 0.32008505 0.032404736 -0.85560393 0.51661581 0.035561107
		 -0.93088824 0.36356911 -0.004186573 0.78563541 -0.61867559 -0.0012789979 0.78851217
		 -0.61501783 0.31374761 0.74101484 -0.59368294 0.31374761 0.74101484 -0.59368294 -0.0012789979
		 0.78851217 -0.61501783 0.31906772 0.74305308 -0.58827537 -0.3364042 -0.62996179 -0.69998598
		 0.066994667 -0.66711468 -0.74193645 -0.33820435 -0.80303121 -0.49067163 -0.33820435
		 -0.80303121 -0.49067163 0.066994667 -0.66711468 -0.74193645 0.079354182 -0.84946537
		 -0.5216431 -0.99321145 -0.1083044 0.042439837 -0.99884129 -0.042590592 -0.022409128
		 -0.99082285 -0.13514519 -0.0024256725 -0.99082285 -0.13514519 -0.0024256725 -0.99884129
		 -0.042590592 -0.022409128 -0.99592543 -0.065987624 -0.061466716 -0.68152291 0.39510205
		 -0.61597145 -0.90524489 0.19736239 -0.37627095 -0.67833167 0.49581343 -0.5422501
		 -0.67833167 0.49581343 -0.5422501 -0.90524489 0.19736239 -0.37627095 -0.9076317 0.26611984
		 -0.3246305 -0.66993523 0.55959487 -0.48789385 -0.88261151 0.35036644 -0.31343305
		 -0.66472489 0.57283485 -0.47958425 -0.66472489 0.57283485 -0.47958425 -0.88261151
		 0.35036644 -0.31343305 -0.8875711 0.34191197 -0.30872923 -0.72701013 -0.67494905
		 -0.12609559 -0.70267147 -0.70893914 0.060481738 -0.88985777 -0.44543105 -0.098713525
		 -0.88985777 -0.44543105 -0.098713525 -0.70267147 -0.70893914 0.060481738 -0.85077262
		 -0.52461046 0.031141339 -0.93836027 -0.33586019 0.081718937 -0.98445475 -0.16798913
		 -0.051268566 -0.92805707 -0.37237456 0.0068738195 -0.92805707 -0.37237456 0.0068738195
		 -0.98445475 -0.16798913 -0.051268566 -0.95649779 -0.26564014 -0.12061216 -0.27770972
		 -0.95375407 -0.11502393 -0.25580376 -0.92671645 -0.27524731 -0.54202789 -0.83049709
		 -0.12837587 -0.54202789 -0.83049709 -0.12837587 -0.25580376 -0.92671645 -0.27524731
		 -0.55469638 -0.79980075 -0.22941385 0.61394888 0.57949507 -0.53595918 0.58405626
		 0.61048996 -0.53495818 0.82895839 0.37836966 -0.41190335 0.82895839 0.37836966 -0.41190335
		 0.58405626 0.61048996 -0.53495818 0.81080323 0.41160041 -0.41615283 0.70814073 0.2359145
		 -0.66549313 0.68197066 0.37910682 -0.62545508 0.86301792 0.1582863 -0.4797349 0.86301792
		 0.1582863 -0.4797349 0.68197066 0.37910682 -0.62545508 0.87014186 0.24288155 -0.42879102
		 0.81184357 -0.49291548 0.31296062 0.66899717 -0.58427984 0.45941254 0.83737296 -0.47044823
		 0.27836117 0.83737296 -0.47044823 0.27836117 0.66899717 -0.58427984 0.45941254 0.70671803
		 -0.57864982 0.40707994 0.93701845 0.23326164 -0.25997195 0.92835766 0.24807025 -0.27679095
		 0.99385732 -0.044407714 -0.10136847 0.99385732 -0.044407714 -0.10136847 0.92835766
		 0.24807025 -0.27679095 0.99225181 -0.032287393 -0.11997435 0.13865659 0.98450696
		 -0.1073332 0.14018399 0.98431885 -0.1070743 0.22170463 0.97056782 -0.094048455 0.22170463
		 0.97056782 -0.094048455 0.14018399 0.98431885 -0.1070743 0.22109844 0.97065252 -0.094599843
		 -0.0030450723 0.99508286 0.098999023 -0.0029300759 0.99514323 0.098393977 -0.012053722
		 0.99620962 0.086145997 -0.012053722 0.99620962 0.086145997 -0.0029300759 0.99514323
		 0.098393977 -0.012159568 0.99622971 0.085898608 0.62679553 0.71712458 -0.3047289
		 0.61589116 0.72865236 -0.29957265 0.59551769 0.74356097 -0.3040984 0.59551769 0.74356097
		 -0.3040984 0.61589116 0.72865236 -0.29957265 0.58303452 0.7539584 -0.3026838 0.89113158
		 0.25189582 -0.37740296 0.92472774 0.17890209 -0.33596522 0.83608109 0.043210968 -0.54690146
		 0.83608109 0.043210968 -0.54690146 0.92472774 0.17890209 -0.33596522 0.86290973 -0.028915389
		 -0.50453019 0.71078163 -0.70237446 -0.038205586 0.75190932 -0.64099795 0.15412341
		 0.70617557 -0.70771348 0.021393267 0.70617557 -0.70771348 0.021393267 0.75190932
		 -0.64099795 0.15412341 0.71521515 -0.66329634 0.22023894 0.99611503 -0.026723288
		 0.08390899 0.98604631 -0.10706043 0.12747854 0.96778452 -0.22675686 -0.10942759 0.96778452
		 -0.22675686 -0.10942759 0.98604631 -0.10706043 0.12747854 0.94941574 -0.30610654
		 -0.070061281 0.91529256 0.37830669 -0.13828798 0.95036972 0.29702017 -0.092608824
		 0.92472774 0.17890209 -0.33596522 0.92472774 0.17890209 -0.33596522 0.95036972 0.29702017
		 -0.092608824 0.95328742 0.096820876 -0.28612733 0.55454308 0.58676463 -0.59007567
		 0.53344876 0.76866406 -0.35297021 0.64400381 0.52878302 -0.55285406 0.64400381 0.52878302
		 -0.55285406 0.53344876 0.76866406 -0.35297021 0.61965823 0.71474433 -0.32429045 0.71351361
		 -0.54620427 0.43881565 0.69413286 -0.40319315 0.59633458 0.64304936 -0.58069563 0.49927956
		 0.64304936 -0.58069563 0.49927956 0.69413286 -0.40319315 0.59633458 0.61370939 -0.45667991
		 0.64405292 -0.88261151 0.35036644 -0.31343305 -0.88974154 0.33450446 -0.31059104
		 -0.9613905 0.19663273 -0.19251972 -0.9613905 0.19663273 -0.19251972 -0.88974154 0.33450446
		 -0.31059104 -0.96690524 0.16734321 -0.19258898 -0.95328736 0.096820898 -0.28612736
		 -0.88492769 -0.10373009 -0.45402977 -0.96933353 0.020001357 -0.24493349 -0.96933353
		 0.020001357 -0.24493349 -0.88492769 -0.10373009 -0.45402977 -0.89223808 -0.18061014
		 -0.41387334 -0.23498091 0.7034077 -0.67082161 -0.11890284 0.72156405 -0.6820612 -0.22208382
		 0.47460511 -0.85172105 -0.22208382 0.47460511 -0.85172105 -0.11890284 0.72156405
		 -0.6820612 -0.11524539 0.48986095 -0.86414969 -0.98604625 -0.10706042 0.12747897
		 -0.94941574 -0.30610654 -0.070060946 -0.96423936 -0.19491331 0.17958628 -0.96423936
		 -0.19491331 0.17958628 -0.94941574 -0.30610654 -0.070060946 -0.91979563 -0.39163825
		 -0.02440328 -0.87622833 0.44893658 -0.17515676 -0.89113146 0.25189599 -0.3774032
		 -0.91529262 0.37830672 -0.13828768 -0.91529262 0.37830672 -0.13828768;
	setAttr ".n[5146:5311]" -type "float3"  -0.89113146 0.25189599 -0.3774032 -0.92472762
		 0.1789021 -0.33596557 -0.4567548 0.63459885 -0.62342554 -0.55454308 0.58676451 -0.59007573
		 -0.4395465 0.8138395 -0.38008437 -0.4395465 0.8138395 -0.38008437 -0.55454308 0.58676451
		 -0.59007573 -0.53344887 0.768664 -0.35297024 -0.69417828 -0.71369714 0.093557164
		 -0.68389821 -0.69566905 0.21983585 -0.67357516 -0.67343462 0.30460188 -0.67357516
		 -0.67343462 0.30460188 -0.68389821 -0.69566905 0.21983585 -0.61875415 -0.67276931
		 0.40561649 0.28490084 -0.89029545 -0.35525417 0.25864512 -0.92851871 -0.26637512
		 0.54972237 -0.78133655 -0.295497 0.54972237 -0.78133655 -0.295497 0.25864512 -0.92851871
		 -0.26637512 0.49723831 -0.84923148 -0.17765106 -0.76262319 -0.33768669 0.55170059
		 -0.69413269 -0.40319318 0.5963347 -0.74743193 -0.2455506 0.61729276 -0.74743193 -0.2455506
		 0.61729276 -0.69413269 -0.40319318 0.5963347 -0.67820299 -0.32044953 0.66132653 -0.47210178
		 0.88009399 0.050541528 -0.54572451 0.83303243 -0.090783715 -0.53548026 0.84271103
		 0.055668723 -0.54572451 0.83303243 -0.090783715 -0.6182031 0.78266275 -0.072553232
		 -0.53548026 0.84271103 0.055668723 -0.53548026 0.84271103 0.055668723 -0.6182031
		 0.78266275 -0.072553232 -0.61290234 0.78715676 0.06881085 -0.87990391 0.007325714
		 0.47509518 -0.91375625 -0.098637752 0.39410675 -0.84353757 -0.080505975 0.53100199
		 -0.84353757 -0.080505975 0.53100199 -0.91375625 -0.098637752 0.39410675 -0.87230206
		 -0.18841381 0.4512088 0.10468805 0.98155522 -0.15996785 0.1014488 0.99478662 -0.010376175
		 0.19862846 0.96809608 -0.15276378 0.19862846 0.96809608 -0.15276378 0.1014488 0.99478662
		 -0.010376175 0.17865086 0.98390675 -0.0033727451 0.91577828 0.38634938 0.10992865
		 0.88634229 0.45655909 0.077143863 0.85203022 0.48356515 0.20052257 0.85203022 0.48356515
		 0.20052257 0.88634229 0.45655909 0.077143863 0.81899047 0.54733723 0.17226891 -0.095163785
		 0.92400521 -0.37034875 4.7087823e-09 0.94813716 -0.3178615 -0.07313925 0.93511117
		 -0.34672436 -0.07313925 0.93511117 -0.34672436 4.7087823e-09 0.94813716 -0.3178615
		 -2.4899773e-09 0.9502337 -0.31153798 -0.29548532 0.74379659 0.59954572 -0.31197733
		 0.72111118 0.61860228 -0.29588681 0.74259543 0.60083526 -0.29588681 0.74259543 0.60083526
		 -0.31197733 0.72111118 0.61860228 -0.3127068 0.71885157 0.6208598 -0.29118228 0.47289562
		 0.83161443 -0.27110666 0.45066246 0.85053194 -0.28941974 0.47179961 0.83285135 -0.28941974
		 0.47179961 0.83285135 -0.27110666 0.45066246 0.85053194 -0.26879594 0.45038101 0.85141397
		 -0.19400916 0.8448723 0.49854916 -0.23147768 0.8254928 0.51476181 -0.19711177 0.84324688
		 0.50008172 -0.19711177 0.84324688 0.50008172 -0.23147768 0.8254928 0.51476181 -0.23185742
		 0.82350528 0.51776558 0.32448152 0.53416067 0.78063059 0.32638103 0.53523654 0.7791003
		 0.33355924 0.55968386 0.75861204 0.33355924 0.55968386 0.75861204 0.32638103 0.53523654
		 0.7791003 0.33525011 0.56155723 0.75647926 0.1509596 0.8582601 0.49051076 0.15370195
		 0.85866535 0.48894733 0.19400939 0.84487212 0.49854937 0.19400939 0.84487212 0.49854937
		 0.15370195 0.85866535 0.48894733 0.19711208 0.84324664 0.50008196 0.8923229 -0.25754091
		 -0.37071893 0.88227218 -0.33192629 -0.33379751 0.81875205 -0.36172491 -0.44587016
		 0.81875205 -0.36172491 -0.44587016 0.88227218 -0.33192629 -0.33379751 0.80618304
		 -0.42576826 -0.4108409 0.22208379 0.47460502 -0.85172111 0.33128238 0.4475016 -0.83065897
		 0.20785077 0.33230296 -0.91998523 0.20785077 0.33230296 -0.91998523 0.33128238 0.4475016
		 -0.83065897 0.30740866 0.30223039 -0.90230632 -0.86735314 -0.40589643 -0.28800458
		 -0.79089379 -0.4894425 -0.36733231 -0.8423624 -0.4770897 -0.25062132 -0.8423624 -0.4770897
		 -0.25062132 -0.79089379 -0.4894425 -0.36733231 -0.7663247 -0.55176407 -0.3290939
		 -0.57753158 0.18429324 -0.79529446 -0.6131354 0.31114647 -0.72612178 -0.49843189
		 0.22990093 -0.83588946 -0.49843189 0.22990093 -0.83588946 -0.6131354 0.31114647 -0.72612178
		 -0.52849185 0.36313975 -0.7673499 -0.98269844 -0.096447617 0.15811902 -0.96124232
		 -0.188466 0.20123065 -0.99167472 -0.055488948 0.11619886 -0.99167472 -0.055488948
		 0.11619886 -0.96124232 -0.188466 0.20123065 -0.97691041 -0.14264692 0.15905328 -0.99167472
		 -0.055488948 0.11619886 -0.99667215 0.041085243 0.070403539 -0.98269844 -0.096447617
		 0.15811902 -0.98269844 -0.096447617 0.15811902 -0.99667215 0.041085243 0.070403539
		 -0.9932242 -0.0087956851 0.11588071 0.81284922 -0.4784762 0.33216959 0.79579848 -0.49526188
		 0.34845439 0.86590815 -0.40442336 0.29435492 0.86590815 -0.40442336 0.29435492 0.79579848
		 -0.49526188 0.34845439 0.85526127 -0.41593531 0.30907276 0.79579848 -0.49526188 0.34845439
		 0.81284922 -0.4784762 0.33216959 0.73183274 -0.5647639 0.38139564 0.73183274 -0.5647639
		 0.38139564 0.81284922 -0.4784762 0.33216959 0.73959738 -0.56028932 0.37292314 0.99322432
		 -0.0087954206 0.11587936 0.99667209 0.041085526 0.070404261 0.9826985 -0.096447773
		 0.15811874 0.9826985 -0.096447773 0.15811874 0.99667209 0.041085526 0.070404261 0.99167472
		 -0.055488743 0.11619899 0.99667209 0.041085526 0.070404261 0.99322432 -0.0087954206
		 0.11587936 0.99171531 0.12469342 0.030859886 0.99171531 0.12469342 0.030859886 0.99322432
		 -0.0087954206 0.11587936 0.99369061 0.088797055 0.068512991 0.72858703 0.62934005
		 -0.27035528 0.71733922 0.64472872 -0.26410088 0.78121978 0.58209282 -0.22552949 0.78121978
		 0.58209282 -0.22552949 0.71733922 0.64472872 -0.26410088 0.77449965 0.58775276 -0.2338738
		 -0.50772685 -0.70784688 -0.49108678 -0.51890272 -0.6734969 -0.52644271 -0.5075776
		 -0.70706111 -0.49237138 -0.5075776 -0.70706111 -0.49237138 -0.51890272 -0.6734969
		 -0.52644271 -0.51623851 -0.67142302 -0.53168505 0.068799622 -0.94210726 -0.32817766
		 0.069227219 -0.94233048 -0.32744598 0.12171646 -0.93548667 -0.33173761 0.12171646
		 -0.93548667 -0.33173761 0.069227219 -0.94233048 -0.32744598;
	setAttr ".n[5312:5477]" -type "float3"  0.12377691 -0.93460798 -0.33344746 0.56683737
		 -0.56456071 -0.59997213 0.57867056 -0.56688106 -0.58633292 0.60295159 -0.51767623
		 -0.60700965 0.60295159 -0.51767623 -0.60700965 0.57867056 -0.56688106 -0.58633292
		 0.60614604 -0.518094 -0.60346133 0.29994154 -0.52478766 -0.79663855 0.32423702 -0.43482167
		 -0.8401193 0.29459292 -0.44859552 -0.84378731 0.29459292 -0.44859552 -0.84378731
		 0.32423702 -0.43482167 -0.8401193 0.32631224 -0.35117254 -0.87760937 -0.6552788 -0.44682911
		 0.60905951 -0.66622055 -0.43346632 0.60684198 -0.66361415 -0.44271731 0.6030072 -0.66361415
		 -0.44271731 0.6030072 -0.66622055 -0.43346632 0.60684198 -0.67687756 -0.42175564
		 0.60329008 -0.3968856 0.59215504 0.70130897 -0.35777205 0.75904965 0.54391432 -0.39038706
		 0.61397225 0.6860292 -0.39038706 0.61397225 0.6860292 -0.35777205 0.75904965 0.54391432
		 -0.35332295 0.76934952 0.53222573 -0.88670772 0.14194137 -0.44000229 -0.88447142
		 0.1740979 -0.43289754 -0.8518967 0.47329825 -0.22418913 -0.8518967 0.47329825 -0.22418913
		 -0.88447142 0.1740979 -0.43289754 -0.84769994 0.48380938 -0.21756218 -0.21894304
		 -0.96970546 -0.1083296 -0.21057875 -0.97165477 -0.10744102 1.008353e-08 -0.99134809
		 -0.13125917 1.008353e-08 -0.99134809 -0.13125917 -0.21057875 -0.97165477 -0.10744102
		 3.720225e-09 -0.99086541 -0.1348543 0.85919809 -0.48444107 0.16460696 0.73281074
		 -0.64050424 0.22965774 0.85921848 -0.50882035 0.053342801 0.85921848 -0.50882035
		 0.053342801 0.73281074 -0.64050424 0.22965774 0.74379373 -0.66658401 0.04936171 0.96419519
		 0.074526288 -0.25450623 0.96034122 0.11816627 -0.25254992 0.9874559 -0.11463584 -0.10857955
		 0.9874559 -0.11463584 -0.10857955 0.96034122 0.11816627 -0.25254992 0.99050325 -0.098636396
		 -0.095782034 0.016132163 -0.9561851 -0.29231793 -0.0092711216 -0.99634093 -0.084963664
		 0.25864512 -0.92851871 -0.26637512 0.25864512 -0.92851871 -0.26637512 -0.0092711216
		 -0.99634093 -0.084963664 0.21331783 -0.97568089 -0.050421182 -0.95247233 -0.25448704
		 0.16742986 -0.99321145 -0.1083044 0.042439837 -0.94800043 -0.29165193 0.12741399
		 -0.94800043 -0.29165193 0.12741399 -0.99321145 -0.1083044 0.042439837 -0.99082285
		 -0.13514519 -0.0024256725 -0.66782451 0.56758571 -0.48151523 -0.8826375 0.32687086
		 -0.33779654 -0.68886167 0.5182839 -0.50680506 -0.68886167 0.5182839 -0.50680506 -0.8826375
		 0.32687086 -0.33779654 -0.89207023 0.25964049 -0.36986148 -0.004186573 0.78563541
		 -0.61867559 -0.36015362 0.72838491 -0.58287632 -0.0012789979 0.78851217 -0.61501783
		 -0.0012789979 0.78851217 -0.61501783 -0.36015362 0.72838491 -0.58287632 -0.35883802
		 0.72143924 -0.59225053 -0.36015362 0.72838491 -0.58287632 -0.004186573 0.78563541
		 -0.61867559 -0.36309412 0.72296119 -0.58778375 -0.36309412 0.72296119 -0.58778375
		 -0.004186573 0.78563541 -0.61867559 -0.0013146511 0.7780149 -0.62824446 0.010605128
		 0.66258413 -0.74891239 -0.38260716 0.61384785 -0.69050896 0.01057572 0.73238289 -0.68081093
		 0.01057572 0.73238289 -0.68081093 -0.38260716 0.61384785 -0.69050896 -0.38275144
		 0.67897731 -0.62649113 -0.33709374 -0.62744665 0.70191061 -0.022424145 -0.66519088
		 0.74633658 -0.30444002 -0.58477902 0.75189739 -0.30444002 -0.58477902 0.75189739
		 -0.022424145 -0.66519088 0.74633658 -0.043621261 -0.61468589 0.78756487 0.57174337
		 0.63146019 -0.52380115 0.58405626 0.61048996 -0.53495818 0.31374761 0.74101484 -0.59368294
		 0.31374761 0.74101484 -0.59368294 0.58405626 0.61048996 -0.53495818 0.32588497 0.72924906
		 -0.60166001 0.94822347 0.17536439 -0.26480111 0.94439751 0.20088205 -0.26030707 0.99366605
		 -0.076975398 -0.081869029 0.99366605 -0.076975398 -0.081869029 0.94439751 0.20088205
		 -0.26030707 0.99455112 -0.061164558 -0.084421247 -0.73730987 -0.66395348 0.12465921
		 -0.72316688 -0.60477269 0.3335861 -0.52199394 -0.82231838 0.22652781 -0.52199394
		 -0.82231838 0.22652781 -0.72316688 -0.60477269 0.3335861 -0.48213807 -0.71444237
		 0.50706506 0.89806581 0.012964822 -0.43967003 0.91943806 -0.082366675 -0.38451183
		 0.78218156 0.0097510191 -0.62297428 0.78218156 0.0097510191 -0.62297428 0.91943806
		 -0.082366675 -0.38451183 0.80168015 -0.1433944 -0.58029908 0.34780723 -0.70427561
		 0.61889088 0.29926378 -0.64756119 0.70078933 -0.0028407953 -0.73492831 0.67813885
		 -0.0028407953 -0.73492831 0.67813885 0.29926378 -0.64756119 0.70078933 -0.022424145
		 -0.66519088 0.74633658 -0.14340958 0.98228014 -0.12066268 -0.2226181 0.97021776 -0.095491774
		 -0.14542714 0.98199761 -0.12054735 -0.14542714 0.98199761 -0.12054735 -0.2226181
		 0.97021776 -0.095491774 -0.22173667 0.97032684 -0.09642987 -0.0029300759 0.99514323
		 0.098393977 -0.0030450723 0.99508286 0.098999023 9.380266e-11 0.99479401 0.1019064
		 9.380266e-11 0.99479401 0.1019064 -0.0030450723 0.99508286 0.098999023 0 0.99476773
		 0.10216255 -0.14413276 0.91121817 -0.38588497 -0.31457058 0.87103868 -0.37727579
		 -0.16060381 0.90573794 -0.39223114 -0.16060381 0.90573794 -0.39223114 -0.31457058
		 0.87103868 -0.37727579 -0.33319247 0.86045909 -0.38547754 0.41306806 0.83266705 -0.36883643
		 0.42743978 0.82819867 -0.36246687 0.33319232 0.86045927 -0.38547722 0.33319232 0.86045927
		 -0.38547722 0.42743978 0.82819867 -0.36246687 0.31457061 0.87103879 -0.37727538 0.95545799
		 -0.28689316 0.06922663 0.95275867 -0.28984371 0.090783171 0.85299242 -0.46219856
		 0.24243841 0.85299242 -0.46219856 0.24243841 0.95275867 -0.28984371 0.090783171 0.83737296
		 -0.47044823 0.27836117 0.96933359 0.020001331 -0.24493331 0.9782964 -0.062963068
		 -0.19741279 0.89223802 -0.18060999 -0.41387355 0.89223802 -0.18060999 -0.41387355
		 0.9782964 -0.062963068 -0.19741279 0.8923229 -0.25754091 -0.37071893 0.98604631 -0.10706043
		 0.12747854 0.99611503 -0.026723288 0.08390899 0.95585531 0.067680299 0.2859371 0.95585531
		 0.067680299 0.2859371 0.99611503 -0.026723288 0.08390899 0.95988935 0.14305149 0.24114031
		 0.95036972 0.29702017 -0.092608824 0.91529256 0.37830669 -0.13828798 0.88634229 0.45655909
		 0.077143863;
	setAttr ".n[5478:5643]" -type "float3"  0.88634229 0.45655909 0.077143863 0.91529256
		 0.37830669 -0.13828798 0.84507138 0.53322715 0.039027624 0.53344876 0.76866406 -0.35297021
		 0.46586853 0.87810957 -0.10904182 0.61965823 0.71474433 -0.32429045 0.61965823 0.71474433
		 -0.32429045 0.46586853 0.87810957 -0.10904182 0.54572439 0.83303255 -0.090783723
		 0.50449312 -0.61063224 0.61042196 0.4174799 -0.58068693 0.69893724 0.42194641 -0.58782262
		 0.69023609 0.42194641 -0.58782262 0.69023609 0.4174799 -0.58068693 0.69893724 0.30805421
		 -0.52883554 0.79084486 0.43165109 -0.88671279 -0.16558304 0.053536456 -0.97797751
		 -0.20172703 0.48219365 -0.7564888 -0.44183025 0.48219365 -0.7564888 -0.44183025 0.053536456
		 -0.97797751 -0.20172703 0.079354182 -0.84946537 -0.5216431 -0.68826032 -0.12656619
		 -0.714338 -0.7299282 -0.31120253 -0.60857034 -0.91186607 -0.11888491 -0.39289516
		 -0.91186607 -0.11888491 -0.39289516 -0.7299282 -0.31120253 -0.60857034 -0.91797256
		 -0.17251985 -0.35716003 -0.90524489 0.19736239 -0.37627095 -0.9676066 0.064224936
		 -0.24415694 -0.9076317 0.26611984 -0.3246305 -0.9076317 0.26611984 -0.3246305 -0.9676066
		 0.064224936 -0.24415694 -0.97221839 0.11331404 -0.2048201 -0.9782964 -0.062963076
		 -0.19741277 -0.89232278 -0.25754094 -0.37071919 -0.97736865 -0.14100714 -0.15769419
		 -0.97736865 -0.14100714 -0.15769419 -0.89232278 -0.25754094 -0.37071919 -0.88227212
		 -0.33192644 -0.33379745 -0.34963697 0.67372322 -0.65103847 -0.23498091 0.7034077
		 -0.67082161 -0.33128217 0.44750169 -0.83065897 -0.33128217 0.44750169 -0.83065897
		 -0.23498091 0.7034077 -0.67082161 -0.22208382 0.47460511 -0.85172105 -0.96423936
		 -0.19491331 0.17958628 -0.9396283 -0.020910252 0.34155738 -0.98604625 -0.10706042
		 0.12747897 -0.98604625 -0.10706042 0.12747897 -0.9396283 -0.020910252 0.34155738
		 -0.95585525 0.067680299 0.28593716 -0.91529262 0.37830672 -0.13828768 -0.84507138
		 0.53322715 0.03902752 -0.87622833 0.44893658 -0.17515676 -0.87622833 0.44893658 -0.17515676
		 -0.84507138 0.53322715 0.03902752 -0.80272067 0.59628236 0.0093241446 -0.4395465
		 0.8138395 -0.38008437 -0.53344887 0.768664 -0.35297024 -0.38407055 0.91507345 -0.12300549
		 -0.38407055 0.91507345 -0.12300549 -0.53344887 0.768664 -0.35297024 -0.46586859 0.87810951
		 -0.10904163 -0.52595329 -0.4911319 0.69437927 -0.61370909 -0.45667976 0.64405334
		 -0.56593031 -0.60112667 0.56424254 -0.56593031 -0.60112667 0.56424254 -0.61370909
		 -0.45667976 0.64405334 -0.64296454 -0.5810802 0.49894121 -0.50392032 -0.61096156
		 0.61056554 -0.53688282 -0.597399 0.59571069 -0.50739568 -0.58528161 0.63245159 -0.50739568
		 -0.58528161 0.63245159 -0.53688282 -0.597399 0.59571069 -0.55670995 -0.57437807 0.60013658
		 -0.11445726 -0.4403846 0.89048356 -0.12957968 -0.47134644 0.87237698 3.6723953e-09
		 -0.44563508 0.89521468 3.6723953e-09 -0.44563508 0.89521468 -0.12957968 -0.47134644
		 0.87237698 -1.9906951e-05 -0.46412241 0.8857711 -0.69126981 0.72096562 -0.048524126
		 -0.61290234 0.78715676 0.06881085 -0.6182031 0.78266275 -0.072553232 -0.90266579
		 0.080930799 0.42266381 -0.9396283 -0.020910252 0.34155738 -0.87990391 0.007325714
		 0.47509518 -0.87990391 0.007325714 0.47509518 -0.9396283 -0.020910252 0.34155738
		 -0.91375625 -0.098637752 0.39410675 0.3961418 -0.43828011 0.8068347 0.44400099 -0.49979246
		 0.74368715 0.49116686 -0.41526991 0.76570618 0.49116686 -0.41526991 0.76570618 0.44400099
		 -0.49979246 0.74368715 0.52595341 -0.4911319 0.69437915 0.94045079 0.30391505 0.15227585
		 0.91577828 0.38634938 0.10992865 0.88359076 0.40293342 0.23856232 0.88359076 0.40293342
		 0.23856232 0.91577828 0.38634938 0.10992865 0.85203022 0.48356515 0.20052257 -0.52341431
		 0.72123271 -0.45371884 -0.62696201 0.68292665 -0.37487298 -0.61359018 0.68689013
		 -0.38947281 -0.73542416 0.62647527 -0.25822467 -0.61359018 0.68689013 -0.38947281
		 -0.72858721 0.62933987 -0.27035534 -0.72858721 0.62933987 -0.27035534 -0.61359018
		 0.68689013 -0.38947281 -0.62696201 0.68292665 -0.37487298 -0.27760646 0.76709026
		 0.57836598 -0.29548532 0.74379659 0.59954572 -0.2764979 0.76477247 0.58195525 -0.2764979
		 0.76477247 0.58195525 -0.29548532 0.74379659 0.59954572 -0.29588681 0.74259543 0.60083526
		 -0.27110666 0.45066246 0.85053194 -0.24902312 0.43473467 0.86544394 -0.26879594 0.45038101
		 0.85141397 -0.26879594 0.45038101 0.85141397 -0.24902312 0.43473467 0.86544394 -0.24575466
		 0.43451297 0.86648899 -0.079947963 0.86113411 0.50205213 -0.077561609 0.86159992
		 0.50162709 -0.030203188 0.86249089 0.50517046 -0.030203188 0.86249089 0.50517046
		 -0.077561609 0.86159992 0.50162709 -0.029479792 0.86287451 0.50455773 0.32638103
		 0.53523654 0.7791003 0.32448152 0.53416067 0.78063059 0.31555271 0.51544052 0.79671043
		 0.31555271 0.51544052 0.79671043 0.32448152 0.53416067 0.78063059 0.31416574 0.51417923
		 0.7980724 0.041193504 0.36156121 0.93143791 0.074956074 0.36567569 0.92771918 0.041504882
		 0.36149424 0.93145007 0.041504882 0.36149424 0.93145007 0.074956074 0.36567569 0.92771918
		 0.07577572 0.36613336 0.92747205 0.88227218 -0.33192629 -0.33379751 0.86735314 -0.40589628
		 -0.28800467 0.80618304 -0.42576826 -0.4108409 0.80618304 -0.42576826 -0.4108409 0.86735314
		 -0.40589628 -0.28800467 0.79089415 -0.48944259 -0.36733145 0.30740866 0.30223039
		 -0.90230632 0.33128238 0.4475016 -0.83065897 0.40731302 0.27633089 -0.87048113 0.40731302
		 0.27633089 -0.87048113 0.33128238 0.4475016 -0.83065897 0.43430242 0.41366851 -0.80016232
		 -0.8423624 -0.4770897 -0.25062132 -0.7663247 -0.55176407 -0.3290939 -0.81282449 -0.54455125
		 -0.20683396 -0.81282449 -0.54455125 -0.20683396 -0.7663247 -0.55176407 -0.3290939
		 -0.74616408 -0.59838611 -0.29184449 -0.49843189 0.22990093 -0.83588946 -0.52849185
		 0.36313975 -0.7673499 -0.40731317 0.27633068 -0.87048107 -0.40731317 0.27633068 -0.87048107
		 -0.52849185 0.36313975 -0.7673499 -0.43430254 0.41366848 -0.80016226 -0.91527843
		 -0.31700131 0.24854678;
	setAttr ".n[5644:5809]" -type "float3"  -0.94963765 -0.23590943 0.20624042 -0.89910555
		 -0.34260762 0.27245054 -0.89910555 -0.34260762 0.27245054 -0.94963765 -0.23590943
		 0.20624042 -0.93530929 -0.26380089 0.23580833 -0.89910555 -0.34260762 0.27245054
		 -0.85526156 -0.41593534 0.30907187 -0.91527843 -0.31700131 0.24854678 -0.91527843
		 -0.31700131 0.24854678 -0.85526156 -0.41593534 0.30907187 -0.86590803 -0.40442324
		 0.29435557 0.93530941 -0.26380077 0.23580822 0.94963771 -0.23590939 0.20624019 0.89910519
		 -0.34260765 0.27245152 0.89910519 -0.34260765 0.27245152 0.94963771 -0.23590939 0.20624019
		 0.91527879 -0.31700131 0.24854559 0.94963771 -0.23590939 0.20624019 0.93530941 -0.26380077
		 0.23580822 0.97691035 -0.14264688 0.15905356 0.97691035 -0.14264688 0.15905356 0.93530941
		 -0.26380077 0.23580822 0.96124238 -0.18846612 0.20123024 0.97691035 -0.14264688 0.15905356
		 0.96124238 -0.18846612 0.20123024 0.99167472 -0.055488743 0.11619899 0.99167472 -0.055488743
		 0.11619899 0.96124238 -0.18846612 0.20123024 0.9826985 -0.096447773 0.15811874 -0.51890272
		 -0.6734969 -0.52644271 -0.53044623 -0.61862451 -0.57959509 -0.51623851 -0.67142302
		 -0.53168505 -0.51623851 -0.67142302 -0.53168505 -0.53044623 -0.61862451 -0.57959509
		 -0.53510725 -0.6176129 -0.57638049 2.4428772e-07 -0.94398689 -0.32998288 1.0508118e-07
		 -0.94437635 -0.32886669 0.068799622 -0.94210726 -0.32817766 0.068799622 -0.94210726
		 -0.32817766 1.0508118e-07 -0.94437635 -0.32886669 0.069227219 -0.94233048 -0.32744598
		 0.53044653 -0.61862522 -0.57959402 0.53510714 -0.61761302 -0.57638055 0.56683737
		 -0.56456071 -0.59997213 0.56683737 -0.56456071 -0.59997213 0.53510714 -0.61761302
		 -0.57638055 0.57867056 -0.56688106 -0.58633292 0.32423702 -0.43482167 -0.8401193
		 0.40751436 -0.33869645 -0.84806645 0.32631224 -0.35117254 -0.87760937 0.32631224
		 -0.35117254 -0.87760937 0.40751436 -0.33869645 -0.84806645 0.42018101 -0.29680479
		 -0.85752833 0.16887671 -0.48919937 0.85566622 0.12955745 -0.47123605 0.87243992 4.3214975e-05
		 -0.4849695 0.87453103 4.3214975e-05 -0.4849695 0.87453103 0.12955745 -0.47123605
		 0.87243992 -1.9906951e-05 -0.46412241 0.8857711 -0.53688282 -0.597399 0.59571069
		 -0.61110395 -0.51976138 0.59699255 -0.55670995 -0.57437807 0.60013658 -0.55670995
		 -0.57437807 0.60013658 -0.61110395 -0.51976138 0.59699255 -0.65177745 -0.45854723
		 0.60408658 -0.66361415 -0.44271731 0.6030072 -0.55457008 -0.51859391 0.65077835 -0.6552788
		 -0.44682911 0.60905951 -0.6552788 -0.44682911 0.60905951 -0.55457008 -0.51859391
		 0.65077835 -0.52656579 -0.52479887 0.66881585 -0.32746288 0.81152576 0.48393592 -0.34905195
		 0.81888616 0.45561847 -0.32677278 0.81287789 0.48212975 -0.32677278 0.81287789 0.48212975
		 -0.34905195 0.81888616 0.45561847 -0.34853649 0.81942892 0.45503694 -0.35777205 0.75904965
		 0.54391432 -0.32746288 0.81152576 0.48393592 -0.35332295 0.76934952 0.53222573 -0.35332295
		 0.76934952 0.53222573 -0.32746288 0.81152576 0.48393592 -0.32677278 0.81287789 0.48212975
		 -0.49031574 -0.87075937 -0.03699496 -0.51479596 -0.85696727 -0.024335563 -0.64821285
		 -0.75886965 0.062745087 -0.64821285 -0.75886965 0.062745087 -0.51479596 -0.85696727
		 -0.024335563 -0.68308419 -0.72472131 0.090415925 0.31374761 0.74101484 -0.59368294
		 0.32588497 0.72924906 -0.60166001 -0.004186573 0.78563541 -0.61867559 -0.004186573
		 0.78563541 -0.61867559 0.32588497 0.72924906 -0.60166001 -0.0013146511 0.7780149
		 -0.62824446 0.95327145 0.1485182 -0.26308912 0.96034122 0.11816627 -0.25254992 0.82895839
		 0.37836966 -0.41190335 0.82895839 0.37836966 -0.41190335 0.96034122 0.11816627 -0.25254992
		 0.84694433 0.34486905 -0.40466115 -0.65161461 0.27763927 -0.70591414 -0.33500862
		 0.3051841 -0.89142126 -0.63626152 0.047949523 -0.76998192 -0.63626152 0.047949523
		 -0.76998192 -0.33500862 0.3051841 -0.89142126 -0.33061299 0.038162164 -0.94299453
		 0.032404736 -0.85560393 0.51661581 0.022763075 -0.80480301 0.59310538 -0.36588356
		 -0.80065459 0.47442752 -0.36588356 -0.80065459 0.47442752 0.022763075 -0.80480301
		 0.59310538 -0.37653664 -0.74603742 0.54922521 -0.9482643 -0.31728086 -0.011299993
		 -0.9141947 -0.39514223 -0.090059273 -0.96844184 -0.21371609 -0.12824138 -0.96844184
		 -0.21371609 -0.12824138 -0.9141947 -0.39514223 -0.090059273 -0.91907173 -0.34422615
		 -0.19187368 0.02864201 0.30136704 -0.95307791 -0.33500862 0.3051841 -0.89142126 0.014954747
		 0.49889234 -0.86653495 0.014954747 0.49889234 -0.86653495 -0.33500862 0.3051841 -0.89142126
		 -0.38540682 0.48070183 -0.78764671 -0.38070709 -0.67710155 0.62975836 -0.0028407953
		 -0.73492831 0.67813885 -0.33709374 -0.62744665 0.70191061 -0.33709374 -0.62744665
		 0.70191061 -0.0028407953 -0.73492831 0.67813885 -0.022424145 -0.66519088 0.74633658
		 0.64610577 0.53980261 -0.53959292 0.61394888 0.57949507 -0.53595918 0.84694433 0.34486905
		 -0.40466115 0.84694433 0.34486905 -0.40466115 0.61394888 0.57949507 -0.53595918 0.82895839
		 0.37836966 -0.41190335 0.34780723 -0.70427561 0.61889088 0.391835 -0.72205901 0.57017201
		 0.66899717 -0.58427984 0.45941254 0.66899717 -0.58427984 0.45941254 0.391835 -0.72205901
		 0.57017201 0.70671803 -0.57864982 0.40707994 0.50098377 -0.62869781 0.59477252 0.41219616
		 -0.70674402 0.57498449 0.21360292 -0.63727045 0.74044591 0.21360292 -0.63727045 0.74044591
		 0.41219616 -0.70674402 0.57498449 0.123022 -0.72941476 0.67291874 -0.10360128 0.98950291
		 -0.10075074 -0.09984716 0.99382174 -0.048464917 -0.10502146 0.98936504 -0.10063436
		 -0.10502146 0.98936504 -0.10063436 -0.09984716 0.99382174 -0.048464917 -0.099953003
		 0.99380678 -0.048554007 0.0029302216 0.99514323 0.098394036 9.380266e-11 0.99479401
		 0.1019064 0.0030453084 0.99508286 0.098999053 0.0030453084 0.99508286 0.098999053
		 9.380266e-11 0.99479401 0.1019064 0 0.99476773 0.10216255 0 0.92504132 -0.37986654
		 6.5220274e-09 0.92252094 -0.38594708 0.14413276 0.91121817 -0.38588491 0.14413276
		 0.91121817 -0.38588491 6.5220274e-09 0.92252094 -0.38594708;
	setAttr ".n[5810:5975]" -type "float3"  0.16060381 0.90573794 -0.39223114 -0.522425
		 0.78543979 -0.33189824 -0.57939976 0.75763476 -0.30047542 -0.55302399 0.77081436
		 -0.31624314 -0.55302399 0.77081436 -0.31624314 -0.57939976 0.75763476 -0.30047542
		 -0.59358704 0.74638152 -0.30094695 -0.38275144 0.67897731 -0.62649113 -0.67467684
		 0.55009466 -0.49214536 -0.37362751 0.7054376 -0.60229582 -0.37362751 0.7054376 -0.60229582
		 -0.67467684 0.55009466 -0.49214536 -0.66993523 0.55959487 -0.48789385 0.41306806
		 0.83266705 -0.36883643 0.4969824 0.79852241 -0.33966219 0.42743978 0.82819867 -0.36246687
		 0.69916707 -0.65848303 0.27850592 0.92035902 -0.37694597 0.10416847 0.80086201 -0.57534444
		 0.16612875 0.80086201 -0.57534444 0.16612875 0.92035902 -0.37694597 0.10416847 0.93191361
		 -0.35778713 0.059375178 0.9782964 -0.062963068 -0.19741279 0.97736859 -0.14100708
		 -0.15769473 0.8923229 -0.25754091 -0.37071893 0.8923229 -0.25754091 -0.37071893 0.97736859
		 -0.14100708 -0.15769473 0.88227218 -0.33192629 -0.33379751 0.22208379 0.47460502
		 -0.85172111 0.23498093 0.70340776 -0.67082155 0.33128238 0.4475016 -0.83065897 0.33128238
		 0.4475016 -0.83065897 0.23498093 0.70340776 -0.67082155 0.34963721 0.67372322 -0.65103829
		 0.96423942 -0.19491337 0.17958604 0.98604631 -0.10706043 0.12747854 0.93962836 -0.020910287
		 0.34155723 0.93962836 -0.020910287 0.34155723 0.98604631 -0.10706043 0.12747854 0.95585531
		 0.067680299 0.2859371 0.91529256 0.37830669 -0.13828798 0.87622839 0.44893649 -0.17515661
		 0.84507138 0.53322715 0.039027624 0.84507138 0.53322715 0.039027624 0.87622839 0.44893649
		 -0.17515661 0.80272084 0.59628206 0.0093244677 0.43954647 0.81383955 -0.38008425
		 0.38407043 0.91507351 -0.12300577 0.53344876 0.76866406 -0.35297021 0.53344876 0.76866406
		 -0.35297021 0.38407043 0.91507351 -0.12300577 0.46586853 0.87810957 -0.10904182 0.64304936
		 -0.58069563 0.49927956 0.61370939 -0.45667991 0.64405292 0.56593013 -0.60112673 0.56424266
		 0.56593013 -0.60112673 0.56424266 0.61370939 -0.45667991 0.64405292 0.52595341 -0.4911319
		 0.69437915 -0.89197224 0.15639158 -0.42417824 -0.95724863 0.0030751403 -0.28925002
		 -0.90524489 0.19736239 -0.37627095 -0.90524489 0.19736239 -0.37627095 -0.95724863
		 0.0030751403 -0.28925002 -0.9676066 0.064224936 -0.24415694 0.40434167 0.60560542
		 -0.68538302 0.38063785 0.67287791 -0.63431078 0.6723485 0.4826518 -0.56124395 0.6723485
		 0.4826518 -0.56124395 0.38063785 0.67287791 -0.63431078 0.64610577 0.53980261 -0.53959292
		 -0.96778458 -0.22675689 -0.10942706 -0.86735314 -0.40589643 -0.28800458 -0.94941574
		 -0.30610654 -0.070060946 -0.94941574 -0.30610654 -0.070060946 -0.86735314 -0.40589643
		 -0.28800458 -0.8423624 -0.4770897 -0.25062132 -0.55454308 0.58676451 -0.59007573
		 -0.52849185 0.36313975 -0.7673499 -0.64400381 0.52878296 -0.55285406 -0.64400381
		 0.52878296 -0.55285406 -0.52849185 0.36313975 -0.7673499 -0.6131354 0.31114647 -0.72612178
		 -0.9396283 -0.020910252 0.34155738 -0.96423936 -0.19491331 0.17958628 -0.91375625
		 -0.098637752 0.39410675 -0.91375625 -0.098637752 0.39410675 -0.96423936 -0.19491331
		 0.17958628 -0.9330942 -0.27843967 0.2276105 -0.99039871 0.13805851 -0.0070875781
		 -0.94045085 0.30391511 0.1522755 -0.97362667 0.2217422 -0.053679608 -0.97362667 0.2217422
		 -0.053679608 -0.94045085 0.30391511 0.1522755 -0.91577828 0.38634938 0.1099285 -0.76876324
		 0.58771342 -0.25218257 -0.69126981 0.72096562 -0.048524126 -0.69677716 0.65538877
		 -0.29149112 -0.69677716 0.65538877 -0.29149112 -0.69126981 0.72096562 -0.048524126
		 -0.6182031 0.78266275 -0.072553232 -0.56593031 -0.60112667 0.56424254 -0.50122505
		 -0.6025297 0.62107283 -0.52595329 -0.4911319 0.69437927 -0.52595329 -0.4911319 0.69437927
		 -0.50122505 -0.6025297 0.62107283 -0.44400093 -0.49979264 0.74368709 -1.6920271e-07
		 0.90156043 -0.43265316 -0.11578543 0.89565569 -0.42941198 1.0348368e-09 0.98572814
		 -0.16834511 1.0348368e-09 0.98572814 -0.16834511 -0.11578543 0.89565569 -0.42941198
		 -0.1046882 0.98155522 -0.15996787 -3.1035574e-06 -0.93095028 -0.36514589 -0.28278285
		 -0.89740258 -0.33867756 0.016132163 -0.9561851 -0.29231793 0.016132163 -0.9561851
		 -0.29231793 -0.28278285 -0.89740258 -0.33867756 -0.25580376 -0.92671645 -0.27524731
		 1.0348368e-09 0.98572814 -0.16834511 -0.1046882 0.98155522 -0.15996787 0 0.9998076
		 -0.019616352 0 0.9998076 -0.019616352 -0.1046882 0.98155522 -0.15996787 -0.10144903
		 0.99478662 -0.01037617 -0.40155101 0.91504091 0.038170338 -0.46586859 0.87810951
		 -0.10904163 -0.47210178 0.88009399 0.050541528 -0.47210178 0.88009399 0.050541528
		 -0.46586859 0.87810951 -0.10904163 -0.54572451 0.83303243 -0.090783715 -0.91455388
		 0.24283937 0.32345054 -0.95988941 0.14305152 0.24114016 -0.91421568 0.17089504 0.3674297
		 -0.91421568 0.17089504 0.3674297 -0.95988941 0.14305152 0.24114016 -0.95585525 0.067680299
		 0.28593716 0.3444958 -0.49623245 0.79691654 0.44400099 -0.49979246 0.74368715 0.32263941
		 -0.43072465 0.84284049 0.32263941 -0.43072465 0.84284049 0.44400099 -0.49979246 0.74368715
		 0.3961418 -0.43828011 0.8068347 0.88634229 0.45655909 0.077143863 0.84507138 0.53322715
		 0.039027624 0.81899047 0.54733723 0.17226891 0.81899047 0.54733723 0.17226891 0.84507138
		 0.53322715 0.039027624 0.77474165 0.61663938 0.1397543 -0.29571632 0.80126733 -0.52011776
		 -0.4217701 0.75874799 -0.49639851 -0.33662209 0.78737885 -0.51644957 -0.33662209
		 0.78737885 -0.51644957 -0.4217701 0.75874799 -0.49639851 -0.45606259 0.74945891 -0.47991487
		 0.7354241 0.62647527 -0.2582249 0.72858703 0.62934005 -0.27035528 0.61358994 0.68688977
		 -0.3894738 0.61358994 0.68688977 -0.3894738 0.72858703 0.62934005 -0.27035528 0.6269623
		 0.68292677 -0.37487233 -0.3042852 0.49247506 0.81540102 -0.29118228 0.47289562 0.83161443
		 -0.30355406 0.49165434 0.81616843 -0.30355406 0.49165434 0.81616843 -0.29118228 0.47289562
		 0.83161443 -0.28941974 0.47179961 0.83285135;
	setAttr ".n[5976:6141]" -type "float3"  -0.079947963 0.86113411 0.50205213 -0.11502039
		 0.8602491 0.49673113 -0.077561609 0.86159992 0.50162709 -0.077561609 0.86159992 0.50162709
		 -0.11502039 0.8602491 0.49673113 -0.11467732 0.86272967 0.4924902 0.34114078 0.613186
		 0.71247876 0.340325 0.61168188 0.71415973 0.34018785 0.58482361 0.73637867 0.34018785
		 0.58482361 0.73637867 0.340325 0.61168188 0.71415973 0.33917063 0.58358926 0.73782575
		 0.1420496 0.38666236 0.91121572 0.14233997 0.3863664 0.91129595 0.11235481 0.37527913
		 0.92007715 0.11235481 0.37527913 0.92007715 0.14233997 0.3863664 0.91129595 0.11288161
		 0.37554526 0.91990405 -0.23147768 0.8254928 0.51476181 -0.26056817 0.79786515 0.54361337
		 -0.23185742 0.82350528 0.51776558 -0.23185742 0.82350528 0.51776558 -0.26056817 0.79786515
		 0.54361337 -0.25992668 0.79439211 0.5489803 0.8423624 -0.4770897 -0.25062126 0.81282449
		 -0.54455101 -0.20683452 0.7663247 -0.55176443 -0.32909331 0.7663247 -0.55176443 -0.32909331
		 0.81282449 -0.54455101 -0.20683452 0.74616396 -0.59838611 -0.29184493 0.43430242
		 0.41366851 -0.80016232 0.5284915 0.36313981 -0.76735014 0.40731302 0.27633089 -0.87048113
		 0.40731302 0.27633089 -0.87048113 0.5284915 0.36313981 -0.76735014 0.49843156 0.22990026
		 -0.83588988 -0.75190514 -0.64638537 -0.12970968 -0.78628993 -0.59350204 -0.17176591
		 -0.70816219 -0.66876483 -0.22640654 -0.70816219 -0.66876483 -0.22640654 -0.78628993
		 -0.59350204 -0.17176591 -0.72612756 -0.63597137 -0.26130283 -0.64496869 0.11921461
		 -0.75485313 -0.68394971 0.24827434 -0.685983 -0.57753158 0.18429324 -0.79529446 -0.57753158
		 0.18429324 -0.79529446 -0.68394971 0.24827434 -0.685983 -0.6131354 0.31114647 -0.72612178
		 -0.81284916 -0.47847632 0.33216956 -0.86590803 -0.40442324 0.29435557 -0.79579872
		 -0.49526185 0.34845382 -0.79579872 -0.49526185 0.34845382 -0.86590803 -0.40442324
		 0.29435557 -0.85526156 -0.41593534 0.30907187 -0.79579872 -0.49526185 0.34845382
		 -0.7318328 -0.56476372 0.38139573 -0.81284916 -0.47847632 0.33216956 -0.81284916
		 -0.47847632 0.33216956 -0.7318328 -0.56476372 0.38139573 -0.73959714 -0.56028956
		 0.37292308 -0.78121978 0.58209294 -0.22552928 -0.83923376 0.51459718 -0.1757171 -0.77449965
		 0.58775276 -0.2338739 -0.77449965 0.58775276 -0.2338739 -0.83923376 0.51459718 -0.1757171
		 -0.83977365 0.51384705 -0.17533247 0.89910519 -0.34260765 0.27245152 0.91527879 -0.31700131
		 0.24854559 0.85526127 -0.41593531 0.30907276 0.85526127 -0.41593531 0.30907276 0.91527879
		 -0.31700131 0.24854559 0.86590815 -0.40442336 0.29435492 -0.56683779 -0.56456149
		 -0.59997106 -0.60295141 -0.51767588 -0.60701007 -0.57867056 -0.5668816 -0.58633238
		 -0.57867056 -0.5668816 -0.58633238 -0.60295141 -0.51767588 -0.60701007 -0.60614532
		 -0.51809299 -0.60346293 -0.068799913 -0.9421072 -0.32817775 -0.12171621 -0.93548667
		 -0.33173758 -0.069227457 -0.94233036 -0.32744619 -0.069227457 -0.94233036 -0.32744619
		 -0.12171621 -0.93548667 -0.33173758 -0.12377658 -0.93460804 -0.33344734 0.50772673
		 -0.70784646 -0.49108756 0.5075776 -0.70706081 -0.49237174 0.51890349 -0.67349744
		 -0.52644128 0.51890349 -0.67349744 -0.52644128 0.5075776 -0.70706081 -0.49237174
		 0.51623899 -0.67142355 -0.53168392 -0.29994154 -0.52478766 -0.79663855 -0.29459289
		 -0.44859549 -0.84378737 -0.32423678 -0.43482146 -0.84011954 -0.32423678 -0.43482146
		 -0.84011954 -0.29459289 -0.44859549 -0.84378737 -0.32631207 -0.3511723 -0.87760949
		 0.66948789 -0.43299505 0.60357368 0.67226803 -0.43231627 0.60096449 0.64559716 -0.46000129
		 0.60959256 0.64559716 -0.46000129 0.60959256 0.67226803 -0.43231627 0.60096449 0.65016234
		 -0.47131267 0.59594744 -0.56886053 0.80065662 0.18800721 -0.3614679 0.84571934 0.39255539
		 -0.51661456 0.83232933 0.20084153 -0.51661456 0.83232933 0.20084153 -0.3614679 0.84571934
		 0.39255539 -0.35235655 0.84859878 0.39462003 -0.51958138 -0.098033421 0.84877831
		 -0.46627539 0.28802931 0.83643669 -0.51601946 -0.10358655 0.85029042 -0.51601946
		 -0.10358655 0.85029042 -0.46627539 0.28802931 0.83643669 -0.46281099 0.30277535 0.83314651
		 0.71794385 0.11222038 0.6869958 0.73908877 0.084054291 0.66834319 0.83874369 -0.13274075
		 0.5280993 0.83874369 -0.13274075 0.5280993 0.73908877 0.084054291 0.66834319 0.84358191
		 -0.15269114 0.51483488 -0.64821285 -0.75886965 0.062745087 -0.68308419 -0.72472131
		 0.090415925 -0.77952623 -0.59475404 0.19648542 -0.77952623 -0.59475404 0.19648542
		 -0.68308419 -0.72472131 0.090415925 -0.79619288 -0.56303084 0.22152469 0.32588497
		 0.72924906 -0.60166001 0.35205185 0.70722651 -0.6130988 -0.0013146511 0.7780149 -0.62824446
		 -0.0013146511 0.7780149 -0.62824446 0.35205185 0.70722651 -0.6130988 0.0051630624
		 0.76245844 -0.64701664 0.84694433 0.34486905 -0.40466115 0.96034122 0.11816627 -0.25254992
		 0.86179024 0.29454303 -0.41299146 0.86179024 0.29454303 -0.41299146 0.96034122 0.11816627
		 -0.25254992 0.96419519 0.074526288 -0.25450623 0.49723831 -0.84923148 -0.17765106
		 0.25864512 -0.92851871 -0.26637512 0.44819206 -0.89387316 -0.010710707 0.44819206
		 -0.89387316 -0.010710707 0.25864512 -0.92851871 -0.26637512 0.21331783 -0.97568089
		 -0.050421182 -0.9527114 -0.23152786 0.19681422 -0.99181116 -0.10112387 0.078003936
		 -0.95247233 -0.25448704 0.16742986 -0.95247233 -0.25448704 0.16742986 -0.99181116
		 -0.10112387 0.078003936 -0.99321145 -0.1083044 0.042439837 -0.98445475 -0.16798913
		 -0.051268566 -0.98891973 -0.10389588 -0.1060351 -0.95649779 -0.26564014 -0.12061216
		 -0.95649779 -0.26564014 -0.12061216 -0.98891973 -0.10389588 -0.1060351 -0.97028315
		 -0.18760987 -0.15281723 -0.73730987 -0.66395348 0.12465921 -0.77202576 -0.6290518
		 -0.090939701 -0.86099923 -0.50851738 0.0095073199 -0.86099923 -0.50851738 0.0095073199
		 -0.77202576 -0.6290518 -0.090939701 -0.86711419 -0.49382347 -0.065202512 -0.39331985
		 -0.91465795 0.093275592 -0.37514684 -0.91056329 -0.17360695 0.035208944 -0.99446833
		 0.098959707 0.035208944 -0.99446833 0.098959707;
	setAttr ".n[6142:6307]" -type "float3"  -0.37514684 -0.91056329 -0.17360695 0.053536456
		 -0.97797751 -0.20172703 0.014954747 0.49889234 -0.86653495 -0.38540682 0.48070183
		 -0.78764671 0.010605128 0.66258413 -0.74891239 0.010605128 0.66258413 -0.74891239
		 -0.38540682 0.48070183 -0.78764671 -0.38260716 0.61384785 -0.69050896 -0.9527114
		 -0.23152786 0.19681422 -0.86953312 -0.37816122 0.31765753 -0.95236969 -0.21862268
		 0.21259385 -0.95236969 -0.21862268 0.21259385 -0.86953312 -0.37816122 0.31765753
		 -0.86391014 -0.36709058 0.34482422 0.81080323 0.41160041 -0.41615283 0.80045074 0.44189459
		 -0.40497869 0.94822347 0.17536439 -0.26480111 0.94822347 0.17536439 -0.26480111 0.80045074
		 0.44189459 -0.40497869 0.94439751 0.20088205 -0.26030707 0.43165109 -0.88671279 -0.16558304
		 0.74421799 -0.65492338 -0.13120565 0.44340107 -0.89237684 0.084017992 0.44340107
		 -0.89237684 0.084017992 0.74421799 -0.65492338 -0.13120565 0.74379373 -0.66658401
		 0.04936171 0.29926378 -0.64756119 0.70078933 0.605304 -0.58354694 0.5413686 0.21360292
		 -0.63727045 0.74044591 0.21360292 -0.63727045 0.74044591 0.605304 -0.58354694 0.5413686
		 0.50098377 -0.62869781 0.59477252 0.21360292 -0.63727045 0.74044591 0.123022 -0.72941476
		 0.67291874 -0.043621261 -0.61468589 0.78756487 -0.043621261 -0.61468589 0.78756487
		 0.123022 -0.72941476 0.67291874 -0.044924513 -0.73209339 0.67972136 -0.10360128 0.98950291
		 -0.10075074 -0.10502146 0.98936504 -0.10063436 -0.14542714 0.98199761 -0.12054735
		 -0.14542714 0.98199761 -0.12054735 -0.10502146 0.98936504 -0.10063436 -0.14340958
		 0.98228014 -0.12066268 -0.16060381 0.90573794 -0.39223114 6.5220274e-09 0.92252094
		 -0.38594708 -0.14413276 0.91121817 -0.38588497 -0.14413276 0.91121817 -0.38588497
		 6.5220274e-09 0.92252094 -0.38594708 0 0.92504132 -0.37986654 -0.38260716 0.61384785
		 -0.69050896 -0.67833167 0.49581343 -0.5422501 -0.38275144 0.67897731 -0.62649113
		 -0.38275144 0.67897731 -0.62649113 -0.67833167 0.49581343 -0.5422501 -0.67467684
		 0.55009466 -0.49214536 0.95636612 -0.28819978 0.048007 0.95545799 -0.28689316 0.06922663
		 0.86130869 -0.4629555 0.20933108 0.86130869 -0.4629555 0.20933108 0.95545799 -0.28689316
		 0.06922663 0.85299242 -0.46219856 0.24243841 0.95328742 0.096820876 -0.28612733 0.96933359
		 0.020001331 -0.24493331 0.88492739 -0.10372999 -0.45403042 0.88492739 -0.10372999
		 -0.45403042 0.96933359 0.020001331 -0.24493331 0.89223802 -0.18060999 -0.41387355
		 0.11524539 0.48986074 -0.86414987 0.11890273 0.72156405 -0.68206114 0.22208379 0.47460502
		 -0.85172111 0.22208379 0.47460502 -0.85172111 0.11890273 0.72156405 -0.68206114 0.23498093
		 0.70340776 -0.67082155 0.98604631 -0.10706043 0.12747854 0.96423942 -0.19491337 0.17958604
		 0.94941574 -0.30610654 -0.070061281 0.94941574 -0.30610654 -0.070061281 0.96423942
		 -0.19491337 0.17958604 0.91979563 -0.39163819 -0.024403272 0.92472774 0.17890209
		 -0.33596522 0.89113158 0.25189582 -0.37740296 0.91529256 0.37830669 -0.13828798 0.91529256
		 0.37830669 -0.13828798 0.89113158 0.25189582 -0.37740296 0.87622839 0.44893649 -0.17515661
		 0.45675501 0.63459867 -0.62342548 0.43954647 0.81383955 -0.38008425 0.55454308 0.58676463
		 -0.59007567 0.55454308 0.58676463 -0.59007567 0.43954647 0.81383955 -0.38008425 0.53344876
		 0.76866406 -0.35297021 0.9748649 -0.16152059 -0.15345861 0.9874559 -0.11463584 -0.10857955
		 0.95242596 -0.30469197 -0.0068982346 0.95242596 -0.30469197 -0.0068982346 0.9874559
		 -0.11463584 -0.10857955 0.95636612 -0.28819978 0.048007 0.9874559 -0.11463584 -0.10857955
		 0.99050325 -0.098636396 -0.095782034 0.95636612 -0.28819978 0.048007 0.95636612 -0.28819978
		 0.048007 0.99050325 -0.098636396 -0.095782034 0.95545799 -0.28689316 0.06922663 -0.97736865
		 -0.14100714 -0.15769419 -0.88227212 -0.33192644 -0.33379745 -0.96778458 -0.22675689
		 -0.10942706 -0.96778458 -0.22675689 -0.10942706 -0.88227212 -0.33192644 -0.33379745
		 -0.86735314 -0.40589643 -0.28800458 -0.4567548 0.63459885 -0.62342554 -0.34963697
		 0.67372322 -0.65103847 -0.43430254 0.41366848 -0.80016226 -0.43430254 0.41366848
		 -0.80016226 -0.34963697 0.67372322 -0.65103847 -0.33128217 0.44750169 -0.83065897
		 -0.96423936 -0.19491331 0.17958628 -0.91979563 -0.39163825 -0.02440328 -0.9330942
		 -0.27843967 0.2276105 -0.9330942 -0.27843967 0.2276105 -0.91979563 -0.39163825 -0.02440328
		 -0.88484603 -0.46572709 0.012075986 -0.97362667 0.2217422 -0.053679608 -0.96933353
		 0.020001357 -0.24493349 -0.99039871 0.13805851 -0.0070875781 -0.99039871 0.13805851
		 -0.0070875781 -0.96933353 0.020001357 -0.24493349 -0.9782964 -0.062963076 -0.19741277
		 -0.7907533 0.39577127 -0.46698427 -0.76876324 0.58771342 -0.25218257 -0.71985048
		 0.46630284 -0.51417595 -0.71985048 0.46630284 -0.51417595 -0.76876324 0.58771342
		 -0.25218257 -0.69677716 0.65538877 -0.29149112 -0.56726664 -0.64461851 0.51251882
		 -0.50392032 -0.61096156 0.61056554 -0.50122505 -0.6025297 0.62107283 -0.50122505
		 -0.6025297 0.62107283 -0.50392032 -0.61096156 0.61056554 -0.41738749 -0.58084655
		 0.69885975 -0.11578543 0.89565569 -0.42941198 -1.6920271e-07 0.90156043 -0.43265316
		 -0.11890284 0.72156405 -0.6820612 -0.11890284 0.72156405 -0.6820612 -1.6920271e-07
		 0.90156043 -0.43265316 -1.5065052e-07 0.72771388 -0.68588078 -0.57442969 -0.77200139
		 -0.27211109 -0.79248166 -0.59161836 -0.14819098 -0.55469638 -0.79980075 -0.22941385
		 -0.55469638 -0.79980075 -0.22941385 -0.79248166 -0.59161836 -0.14819098 -0.77927482
		 -0.60622829 -0.15880199 -0.12957968 -0.47134644 0.87237698 -0.11445726 -0.4403846
		 0.89048356 -0.24072877 -0.49322212 0.8359316 -0.24072877 -0.49322212 0.8359316 -0.11445726
		 -0.4403846 0.89048356 -0.218674 -0.43946049 0.87123829 -0.38407055 0.91507345 -0.12300549
		 -0.46586859 0.87810951 -0.10904163 -0.33875236 0.9406206 0.021902878 -0.33875236
		 0.9406206 0.021902878 -0.46586859 0.87810951 -0.10904163 -0.40155101 0.91504091 0.038170338
		 -0.91421568 0.17089504 0.3674297 -0.95585525 0.067680299 0.28593716;
	setAttr ".n[6308:6473]" -type "float3"  -0.90266579 0.080930799 0.42266381 -0.90266579
		 0.080930799 0.42266381 -0.95585525 0.067680299 0.28593716 -0.9396283 -0.020910252
		 0.34155738 0.49116686 -0.41526991 0.76570618 0.52595341 -0.4911319 0.69437915 0.5889678
		 -0.38176879 0.71229875 0.5889678 -0.38176879 0.71229875 0.52595341 -0.4911319 0.69437915
		 0.61370939 -0.45667991 0.64405292 0.84507138 0.53322715 0.039027624 0.80272084 0.59628206
		 0.0093244677 0.77474165 0.61663938 0.1397543 0.77474165 0.61663938 0.1397543 0.80272084
		 0.59628206 0.0093244677 0.73119551 0.67256457 0.1140615 -0.4217701 0.75874799 -0.49639851
		 -0.52341431 0.72123271 -0.45371884 -0.45606259 0.74945891 -0.47991487 -0.45606259
		 0.74945891 -0.47991487 -0.52341431 0.72123271 -0.45371884 -0.61359018 0.68689013
		 -0.38947281 -0.31555307 0.515441 0.79671001 -0.3042852 0.49247506 0.81540102 -0.31416598
		 0.51417959 0.7980721 -0.31416598 0.51417959 0.7980721 -0.3042852 0.49247506 0.81540102
		 -0.30355406 0.49165434 0.81616843 -0.11502039 0.8602491 0.49673113 -0.15095969 0.8582598
		 0.49051121 -0.11467732 0.86272967 0.4924902 -0.11467732 0.86272967 0.4924902 -0.15095969
		 0.8582598 0.49051121 -0.1537019 0.85866529 0.48894745 0.34018785 0.58482361 0.73637867
		 0.33917063 0.58358926 0.73782575 0.33525011 0.56155723 0.75647926 0.33525011 0.56155723
		 0.75647926 0.33917063 0.58358926 0.73782575 0.33355924 0.55968386 0.75861204 0.074956074
		 0.36567569 0.92771918 0.11235481 0.37527913 0.92007715 0.07577572 0.36613336 0.92747205
		 0.07577572 0.36613336 0.92747205 0.11235481 0.37527913 0.92007715 0.11288161 0.37554526
		 0.91990405 -0.26056817 0.79786515 0.54361337 -0.27760646 0.76709026 0.57836598 -0.25992668
		 0.79439211 0.5489803 -0.25992668 0.79439211 0.5489803 -0.27760646 0.76709026 0.57836598
		 -0.2764979 0.76477247 0.58195525 0.86735314 -0.40589628 -0.28800467 0.8423624 -0.4770897
		 -0.25062126 0.79089415 -0.48944259 -0.36733145 0.79089415 -0.48944259 -0.36733145
		 0.8423624 -0.4770897 -0.25062126 0.7663247 -0.55176443 -0.32909331 0.5284915 0.36313981
		 -0.76735014 0.61313552 0.31114647 -0.72612166 0.49843156 0.22990026 -0.83588988 0.49843156
		 0.22990026 -0.83588988 0.61313552 0.31114647 -0.72612166 0.57753152 0.18429323 -0.79529452
		 -0.72612756 -0.63597137 -0.26130283 -0.78628993 -0.59350204 -0.17176591 -0.74616408
		 -0.59838611 -0.29184449 -0.74616408 -0.59838611 -0.29184449 -0.78628993 -0.59350204
		 -0.17176591 -0.81282449 -0.54455125 -0.20683396 -0.68394971 0.24827434 -0.685983
		 -0.64496869 0.11921461 -0.75485313 -0.74836832 0.18324523 -0.63746846 -0.74836832
		 0.18324523 -0.63746846 -0.64496869 0.11921461 -0.75485313 -0.70336312 0.058660511
		 -0.70840609 -0.94963765 -0.23590943 0.20624042 -0.97691041 -0.14264692 0.15905328
		 -0.93530929 -0.26380089 0.23580833 -0.93530929 -0.26380089 0.23580833 -0.97691041
		 -0.14264692 0.15905328 -0.96124232 -0.188466 0.20123065 4.3264666e-07 -0.84903073
		 0.5283435 -0.13018231 -0.84189945 0.52369636 2.4171189e-07 -0.84889865 0.52855563
		 2.4171189e-07 -0.84889865 0.52855563 -0.13018231 -0.84189945 0.52369636 -0.12811297
		 -0.84183431 0.52431101 -0.72858721 0.62933987 -0.27035534 -0.78121978 0.58209294
		 -0.22552928 -0.71733934 0.6447286 -0.26410103 -0.71733934 0.6447286 -0.26410103 -0.78121978
		 0.58209294 -0.22552928 -0.77449965 0.58775276 -0.2338739 -0.53044623 -0.61862451
		 -0.57959509 -0.56683779 -0.56456149 -0.59997106 -0.53510725 -0.6176129 -0.57638049
		 -0.53510725 -0.6176129 -0.57638049 -0.56683779 -0.56456149 -0.59997106 -0.57867056
		 -0.5668816 -0.58633238 2.4428772e-07 -0.94398689 -0.32998288 -0.068799913 -0.9421072
		 -0.32817775 1.0508118e-07 -0.94437635 -0.32886669 1.0508118e-07 -0.94437635 -0.32886669
		 -0.068799913 -0.9421072 -0.32817775 -0.069227457 -0.94233036 -0.32744619 0.51890349
		 -0.67349744 -0.52644128 0.51623899 -0.67142355 -0.53168392 0.53044653 -0.61862522
		 -0.57959402 0.53044653 -0.61862522 -0.57959402 0.51623899 -0.67142355 -0.53168392
		 0.53510714 -0.61761302 -0.57638055 -0.32423678 -0.43482146 -0.84011954 -0.32631207
		 -0.3511723 -0.87760949 -0.40751436 -0.33869639 -0.84806651 -0.40751436 -0.33869639
		 -0.84806651 -0.32631207 -0.3511723 -0.87760949 -0.42018104 -0.29680482 -0.85752833
		 -0.55457008 -0.51859391 0.65077835 -0.31457791 -0.61584848 0.72233742 -0.52656579
		 -0.52479887 0.66881585 -0.52656579 -0.52479887 0.66881585 -0.31457791 -0.61584848
		 0.72233742 -0.30158725 -0.61487603 0.72867864 -0.34905195 0.81888616 0.45561847 -0.35235655
		 0.84859878 0.39462003 -0.34853649 0.81942892 0.45503694 -0.34853649 0.81942892 0.45503694
		 -0.35235655 0.84859878 0.39462003 -0.3614679 0.84571934 0.39255539 -0.46627539 0.28802931
		 0.83643669 -0.3968856 0.59215504 0.70130897 -0.46281099 0.30277535 0.83314651 -0.46281099
		 0.30277535 0.83314651 -0.3968856 0.59215504 0.70130897 -0.39038706 0.61397225 0.6860292
		 -0.84963298 -0.38971886 0.35530695 -0.84345555 -0.15000275 0.51583129 -0.85071683
		 -0.39023918 0.35212827 -0.85071683 -0.39023918 0.35212827 -0.84345555 -0.15000275
		 0.51583129 -0.83982152 -0.13512158 0.52577752 -0.84963298 -0.38971886 0.35530695
		 -0.85071683 -0.39023918 0.35212827 -0.79619288 -0.56303084 0.22152469 -0.79619288
		 -0.56303084 0.22152469 -0.85071683 -0.39023918 0.35212827 -0.77952623 -0.59475404
		 0.19648542 0.86130869 -0.4629555 0.20933108 0.73861933 -0.59579629 0.31538579 0.85919809
		 -0.48444107 0.16460696 0.85919809 -0.48444107 0.16460696 0.73861933 -0.59579629 0.31538579
		 0.73281074 -0.64050424 0.22965774 -0.72829878 -0.59829605 -0.3340998 -0.72701013
		 -0.67494905 -0.12609559 -0.91407585 -0.35735875 -0.19172904 -0.91407585 -0.35735875
		 -0.19172904 -0.72701013 -0.67494905 -0.12609559 -0.88985777 -0.44543105 -0.098713525
		 0.063669272 -0.20758377 -0.976143 0.53478605 -0.18802212 -0.82380313 0.076087862
		 -0.46115249 -0.88405263 0.076087862 -0.46115249 -0.88405263 0.53478605 -0.18802212
		 -0.82380313 0.53863394 -0.39507368 -0.74417084;
	setAttr ".n[6474:6639]" -type "float3"  -0.68236667 -0.59323454 0.42713988 -0.66991252
		 -0.64588416 0.36612967 -0.37653664 -0.74603742 0.54922521 -0.37653664 -0.74603742
		 0.54922521 -0.66991252 -0.64588416 0.36612967 -0.36588356 -0.80065459 0.47442752
		 -0.39331985 -0.91465795 0.093275592 -0.37298584 -0.86664462 0.3313739 -0.70267147
		 -0.70893914 0.060481738 -0.70267147 -0.70893914 0.060481738 -0.37298584 -0.86664462
		 0.3313739 -0.66674429 -0.70133001 0.25216717 -0.88781506 -0.4541381 -0.074451387
		 -0.9141947 -0.39514223 -0.090059273 -0.86711419 -0.49382347 -0.065202512 -0.86711419
		 -0.49382347 -0.065202512 -0.9141947 -0.39514223 -0.090059273 -0.86099923 -0.50851738
		 0.0095073199 -0.9141947 -0.39514223 -0.090059273 -0.9482643 -0.31728086 -0.011299993
		 -0.86099923 -0.50851738 0.0095073199 -0.86099923 -0.50851738 0.0095073199 -0.9482643
		 -0.31728086 -0.011299993 -0.87653941 -0.46207604 0.1347755 -0.38070709 -0.67710155
		 0.62975836 -0.67842782 -0.54016006 0.49795863 -0.38512903 -0.70779485 0.59220099
		 -0.38512903 -0.70779485 0.59220099 -0.67842782 -0.54016006 0.49795863 -0.68573606
		 -0.55833334 0.46693674 0.44819206 -0.89387316 -0.010710707 0.66046876 -0.74906677
		 0.051768582 0.49723831 -0.84923148 -0.17765106 0.49723831 -0.84923148 -0.17765106
		 0.66046876 -0.74906677 0.051768582 0.71623492 -0.69401139 -0.073182829 0.81668323
		 0.44178563 -0.37128687 0.80045074 0.44189459 -0.40497869 0.60513681 0.6211403 -0.4979901
		 0.60513681 0.6211403 -0.4979901 0.80045074 0.44189459 -0.40497869 0.57174337 0.63146019
		 -0.52380115 0.93701845 0.23326164 -0.25997195 0.94439751 0.20088205 -0.26030707 0.81668323
		 0.44178563 -0.37128687 0.81668323 0.44178563 -0.37128687 0.94439751 0.20088205 -0.26030707
		 0.80045074 0.44189459 -0.40497869 -0.0028407953 -0.73492831 0.67813885 0.0096910028
		 -0.76888633 0.63931209 0.34780723 -0.70427561 0.61889088 0.34780723 -0.70427561 0.61889088
		 0.0096910028 -0.76888633 0.63931209 0.391835 -0.72205901 0.57017201 -0.092684746
		 0.99569553 -5.476435e-05 -0.092627145 0.99570084 -1.745846e-05 -0.09984716 0.99382174
		 -0.048464917 -0.09984716 0.99382174 -0.048464917 -0.092627145 0.99570084 -1.745846e-05
		 -0.099953003 0.99380678 -0.048554007 -0.63626152 0.047949523 -0.76998192 -0.68826032
		 -0.12656619 -0.714338 -0.88600153 0.0087278998 -0.46360022 -0.88600153 0.0087278998
		 -0.46360022 -0.68826032 -0.12656619 -0.714338 -0.91186607 -0.11888491 -0.39289516
		 -0.37362751 0.7054376 -0.60229582 -0.66993523 0.55959487 -0.48789385 -0.36309412
		 0.72296119 -0.58778375 -0.36309412 0.72296119 -0.58778375 -0.66993523 0.55959487
		 -0.48789385 -0.66472489 0.57283485 -0.47958425 0.97736859 -0.14100708 -0.15769473
		 0.96778452 -0.22675686 -0.10942759 0.88227218 -0.33192629 -0.33379751 0.88227218
		 -0.33192629 -0.33379751 0.96778452 -0.22675686 -0.10942759 0.86735314 -0.40589628
		 -0.28800467 0.45675501 0.63459867 -0.62342548 0.43430242 0.41366851 -0.80016232 0.34963721
		 0.67372322 -0.65103829 0.34963721 0.67372322 -0.65103829 0.43430242 0.41366851 -0.80016232
		 0.33128238 0.4475016 -0.83065897 0.96423942 -0.19491337 0.17958604 0.93309426 -0.27843961
		 0.22761048 0.91979563 -0.39163819 -0.024403272 0.91979563 -0.39163819 -0.024403272
		 0.93309426 -0.27843961 0.22761048 0.88484609 -0.46572685 0.012076274 0.97362667 0.2217422
		 -0.05367988 0.99039871 0.13805851 -0.0070874756 0.96933359 0.020001331 -0.24493331
		 0.96933359 0.020001331 -0.24493331 0.99039871 0.13805851 -0.0070874756 0.9782964
		 -0.062963068 -0.19741279 0.79075313 0.39577124 -0.46698463 0.71985048 0.46630287
		 -0.51417601 0.76876318 0.58771336 -0.25218275 0.76876318 0.58771336 -0.25218275 0.71985048
		 0.46630287 -0.51417601 0.69677722 0.65538889 -0.29149094 0.11578536 0.89565569 -0.42941198
		 0.11890273 0.72156405 -0.68206114 -1.6920271e-07 0.90156043 -0.43265316 -1.6920271e-07
		 0.90156043 -0.43265316 0.11890273 0.72156405 -0.68206114 -1.5065052e-07 0.72771388
		 -0.68588078 0.93083125 -0.34618571 0.11708372 0.92035902 -0.37694597 0.10416847 0.70258355
		 -0.59789497 0.38587296 0.70258355 -0.59789497 0.38587296 0.92035902 -0.37694597 0.10416847
		 0.69916707 -0.65848303 0.27850592 -0.94941574 -0.30610654 -0.070060946 -0.8423624
		 -0.4770897 -0.25062132 -0.91979563 -0.39163825 -0.02440328 -0.91979563 -0.39163825
		 -0.02440328 -0.8423624 -0.4770897 -0.25062132 -0.81282449 -0.54455125 -0.20683396
		 -0.52849185 0.36313975 -0.7673499 -0.55454308 0.58676451 -0.59007573 -0.43430254
		 0.41366848 -0.80016226 -0.43430254 0.41366848 -0.80016226 -0.55454308 0.58676451
		 -0.59007573 -0.4567548 0.63459885 -0.62342554 -0.88838315 -0.36353132 0.28039333
		 -0.9330942 -0.27843967 0.2276105 -0.84142148 -0.53691828 0.061062895 -0.84142148
		 -0.53691828 0.061062895 -0.9330942 -0.27843967 0.2276105 -0.88484603 -0.46572709
		 0.012075986 -0.95036978 0.29702014 -0.092608355 -0.95328736 0.096820898 -0.28612736
		 -0.97362667 0.2217422 -0.053679608 -0.97362667 0.2217422 -0.053679608 -0.95328736
		 0.096820898 -0.28612736 -0.96933353 0.020001357 -0.24493349 -0.61965829 0.71474427
		 -0.32429034 -0.64400381 0.52878296 -0.55285406 -0.69677716 0.65538877 -0.29149112
		 -0.69677716 0.65538877 -0.29149112 -0.64400381 0.52878296 -0.55285406 -0.71985048
		 0.46630284 -0.51417595 -0.11890284 0.72156405 -0.6820612 -0.23498091 0.7034077 -0.67082161
		 -0.11578543 0.89565569 -0.42941198 -0.11578543 0.89565569 -0.42941198 -0.23498091
		 0.7034077 -0.67082161 -0.22692274 0.87896758 -0.41943064 -0.11524539 0.48986095 -0.86414969
		 -0.11890284 0.72156405 -0.6820612 -3.6526138e-09 0.50518793 -0.86300939 -3.6526138e-09
		 0.50518793 -0.86300939 -0.11890284 0.72156405 -0.6820612 -1.5065052e-07 0.72771388
		 -0.68588078 -0.28278285 -0.89740258 -0.33867756 -0.57442969 -0.77200139 -0.27211109
		 -0.25580376 -0.92671645 -0.27524731 -0.25580376 -0.92671645 -0.27524731 -0.57442969
		 -0.77200139 -0.27211109 -0.55469638 -0.79980075 -0.22941385 -0.68029237 -0.63774472
		 0.36122558 -0.81264901 -0.51394463 0.27470443 -0.66948342 -0.57591569 0.46916208
		 -0.66948342 -0.57591569 0.46916208;
	setAttr ".n[6640:6805]" -type "float3"  -0.81264901 -0.51394463 0.27470443 -0.84187806
		 -0.41726008 0.34225038 -0.29520726 0.94529283 -0.13883141 -0.38407055 0.91507345
		 -0.12300549 -0.26381338 0.96451396 0.010739069 -0.26381338 0.96451396 0.010739069
		 -0.38407055 0.91507345 -0.12300549 -0.33875236 0.9406206 0.021902878 -0.90259761
		 0.33155316 0.27457246 -0.95433265 0.23017305 0.19044563 -0.91455388 0.24283937 0.32345054
		 -0.91455388 0.24283937 0.32345054 -0.95433265 0.23017305 0.19044563 -0.95988941 0.14305152
		 0.24114016 0.24072877 -0.49322236 0.83593142 0.3444958 -0.49623245 0.79691654 0.21867406
		 -0.43946084 0.87123811 0.21867406 -0.43946084 0.87123811 0.3444958 -0.49623245 0.79691654
		 0.32263941 -0.43072465 0.84284049 0.74619633 0.66526973 -0.024643268 0.6912697 0.7209658
		 -0.048524193 0.67144459 0.73605621 0.085926354 0.67144459 0.73605621 0.085926354
		 0.6912697 0.7209658 -0.048524193 0.6129024 0.7871567 0.068810761 -0.33662209 0.78737885
		 -0.51644957 -0.21643715 0.84992361 -0.48040071 -0.29571632 0.80126733 -0.52011776
		 -0.29571632 0.80126733 -0.52011776 -0.21643715 0.84992361 -0.48040071 -0.1869642
		 0.8849932 -0.42641699 0.21643713 0.84992361 -0.48040074 0.1869643 0.88499308 -0.42641714
		 0.095164016 0.92400497 -0.37034938 0.095164016 0.92400497 -0.37034938 0.1869643 0.88499308
		 -0.42641714 0.073139474 0.93511087 -0.34672505 -0.33524978 0.56155717 0.75647944
		 -0.32638034 0.5352357 0.77910113 -0.33355889 0.55968374 0.75861228 -0.33355889 0.55968374
		 0.75861228 -0.32638034 0.5352357 0.77910113 -0.32448089 0.53415972 0.78063154 -0.15095969
		 0.8582598 0.49051121 -0.19400916 0.8448723 0.49854916 -0.1537019 0.85866529 0.48894745
		 -0.1537019 0.85866529 0.48894745 -0.19400916 0.8448723 0.49854916 -0.19711177 0.84324688
		 0.50008172 0.3406193 0.63712019 0.6914162 0.3397907 0.63587171 0.69297141 0.34114078
		 0.613186 0.71247876 0.34114078 0.613186 0.71247876 0.3397907 0.63587171 0.69297141
		 0.340325 0.61168188 0.71415973 0.19540413 0.40759248 0.89201212 0.19352606 0.40794095
		 0.89226222 0.16913281 0.39655676 0.90229529 0.16913281 0.39655676 0.90229529 0.19352606
		 0.40794095 0.89226222 0.16850346 0.39656377 0.90240997 0.26056805 0.79786563 0.5436126
		 0.25992653 0.79439247 0.54897982 0.2776064 0.76709038 0.57836586 0.2776064 0.76709038
		 0.57836586 0.25992653 0.79439247 0.54897982 0.27649781 0.76477224 0.58195561 0.81282449
		 -0.54455101 -0.20683452 0.78628999 -0.59350193 -0.171766 0.74616396 -0.59838611 -0.29184493
		 0.74616396 -0.59838611 -0.29184493 0.78628999 -0.59350193 -0.171766 0.72612768 -0.63597143
		 -0.26130229 0.68394983 0.24827453 -0.68598282 0.74836844 0.18324494 -0.63746846 0.64496899
		 0.11921457 -0.75485289 0.64496899 0.11921457 -0.75485289 0.74836844 0.18324494 -0.63746846
		 0.70336324 0.058660399 -0.70840603 -0.79434162 0.11472136 -0.59654039 -0.74469376
		 -0.0094315102 -0.66733974 -0.83608097 0.043210939 -0.54690164 -0.83608097 0.043210939
		 -0.54690164 -0.74469376 -0.0094315102 -0.66733974 -0.7812379 -0.073283188 -0.61991686
		 -0.28197029 0.95635796 -0.076630376 -0.27705577 0.95775622 -0.077091351 -0.2226181
		 0.97021776 -0.095491774 -0.2226181 0.97021776 -0.095491774 -0.27705577 0.95775622
		 -0.077091351 -0.22173667 0.97032684 -0.09642987 -0.83923376 0.51459718 -0.1757171
		 -0.88672918 0.44609693 -0.12127996 -0.83977365 0.51384705 -0.17533247 -0.83977365
		 0.51384705 -0.17533247 -0.88672918 0.44609693 -0.12127996 -0.87074721 0.46904618
		 -0.14763103 0.13018239 -0.84189945 0.5236963 0.12811278 -0.84183425 0.52431113 0.23851486
		 -0.82499886 0.51233542 0.23851486 -0.82499886 0.51233542 0.12811278 -0.84183425 0.52431113
		 0.23052561 -0.82578701 0.51471716 4.3264666e-07 -0.84903073 0.5283435 2.4171189e-07
		 -0.84889865 0.52855563 0.13018239 -0.84189945 0.5236963 0.13018239 -0.84189945 0.5236963
		 2.4171189e-07 -0.84889865 0.52855563 0.12811278 -0.84183425 0.52431113 -0.60295141
		 -0.51767588 -0.60701007 -0.5978182 -0.48864752 -0.63548166 -0.60614532 -0.51809299
		 -0.60346293 -0.60614532 -0.51809299 -0.60346293 -0.5978182 -0.48864752 -0.63548166
		 -0.59050089 -0.48748806 -0.6431672 -0.12171621 -0.93548667 -0.33173758 -0.17668948
		 -0.92028069 -0.34909073 -0.12377658 -0.93460804 -0.33344734 -0.12377658 -0.93460804
		 -0.33344734 -0.17668948 -0.92028069 -0.34909073 -0.17829134 -0.91847205 -0.35301736
		 0.47528508 -0.74442452 -0.46897364 0.47748458 -0.74552077 -0.4649809 0.50772673 -0.70784646
		 -0.49108756 0.50772673 -0.70784646 -0.49108756 0.47748458 -0.74552077 -0.4649809
		 0.5075776 -0.70706081 -0.49237174 0.40751436 -0.33869645 -0.84806645 0.46464869 -0.31858951
		 -0.8261975 0.42018101 -0.29680479 -0.85752833 0.42018101 -0.29680479 -0.85752833
		 0.46464869 -0.31858951 -0.8261975 0.46643996 -0.31340149 -0.82717186 0.55541396 -0.50682408
		 0.65927589 0.64559716 -0.46000129 0.60959256 0.54099041 -0.52289921 0.65871525 0.54099041
		 -0.52289921 0.65871525 0.64559716 -0.46000129 0.60959256 0.65016234 -0.47131267 0.59594744
		 -0.51661456 0.83232933 0.20084153 -0.74227232 0.6699174 -0.015570381 -0.56886053
		 0.80065662 0.18800721 -0.56886053 0.80065662 0.18800721 -0.74227232 0.6699174 -0.015570381
		 -0.7618475 0.64734834 -0.022991056 -0.57768112 -0.41161108 0.70488358 -0.51958138
		 -0.098033421 0.84877831 -0.56921959 -0.40738598 0.71416086 -0.56921959 -0.40738598
		 0.71416086 -0.51958138 -0.098033421 0.84877831 -0.51601946 -0.10358655 0.85029042
		 -0.11350171 0.50804573 0.85381901 -0.24525651 0.46928447 0.84830499 -0.12696666 0.50559807
		 0.85337567 -0.12696666 0.50559807 0.85337567 -0.24525651 0.46928447 0.84830499 -0.29722872
		 0.44836178 0.84298682 0.849778 -0.38864005 0.35614073 0.79619294 -0.56303072 0.22152479
		 0.85152197 -0.38648582 0.35431486 0.85152197 -0.38648582 0.35431486 0.79619294 -0.56303072
		 0.22152479 0.77952623 -0.59475404 0.19648537 0.73861933 -0.59579629 0.31538579 0.86130869
		 -0.4629555 0.20933108;
	setAttr ".n[6806:6971]" -type "float3"  0.72815764 -0.57819343 0.36807442 0.72815764
		 -0.57819343 0.36807442 0.86130869 -0.4629555 0.20933108 0.85299242 -0.46219856 0.24243841
		 0.93268538 -0.13941853 -0.33265674 0.9748649 -0.16152059 -0.15345861 0.92902386 -0.25379157
		 -0.26926669 -0.68573606 -0.55833334 0.46693674 -0.68236667 -0.59323454 0.42713988
		 -0.38512903 -0.70779485 0.59220099 -0.38512903 -0.70779485 0.59220099 -0.68236667
		 -0.59323454 0.42713988 -0.37653664 -0.74603742 0.54922521 -0.37298584 -0.86664462
		 0.3313739 -0.36588356 -0.80065459 0.47442752 -0.66674429 -0.70133001 0.25216717 -0.66674429
		 -0.70133001 0.25216717 -0.36588356 -0.80065459 0.47442752 -0.66991252 -0.64588416
		 0.36612967 -0.67467684 0.55009466 -0.49214536 -0.67833167 0.49581343 -0.5422501 -0.88974154
		 0.33450446 -0.31059104 -0.88974154 0.33450446 -0.31059104 -0.67833167 0.49581343
		 -0.5422501 -0.9076317 0.26611984 -0.3246305 -0.87393111 -0.42873058 -0.22898576 -0.88074434
		 -0.44626716 -0.15854022 -0.81938154 -0.54549026 -0.1762221 -0.81938154 -0.54549026
		 -0.1762221 -0.88074434 -0.44626716 -0.15854022 -0.81391865 -0.56645876 -0.12907723
		 -0.38512903 -0.70779485 0.59220099 0.0096910028 -0.76888633 0.63931209 -0.38070709
		 -0.67710155 0.62975836 -0.38070709 -0.67710155 0.62975836 0.0096910028 -0.76888633
		 0.63931209 -0.0028407953 -0.73492831 0.67813885 0.66046876 -0.74906677 0.051768582
		 0.79605806 -0.5959397 0.10558139 0.71623492 -0.69401139 -0.073182829 0.71623492 -0.69401139
		 -0.073182829 0.79605806 -0.5959397 0.10558139 0.8421036 -0.53925997 -0.0077600824
		 0.94439751 0.20088205 -0.26030707 0.93701845 0.23326164 -0.25997195 0.99455112 -0.061164558
		 -0.084421247 0.99455112 -0.061164558 -0.084421247 0.93701845 0.23326164 -0.25997195
		 0.99385732 -0.044407714 -0.10136847 0.72815764 -0.57819343 0.36807442 0.85299242
		 -0.46219856 0.24243841 0.70671803 -0.57864982 0.40707994 0.70671803 -0.57864982 0.40707994
		 0.85299242 -0.46219856 0.24243841 0.83737296 -0.47044823 0.27836117 -0.043621261
		 -0.61468589 0.78756487 -0.022424145 -0.66519088 0.74633658 0.21360292 -0.63727045
		 0.74044591 0.21360292 -0.63727045 0.74044591 -0.022424145 -0.66519088 0.74633658
		 0.29926378 -0.64756119 0.70078933 0.94770986 -0.29965261 0.10979202 0.99366605 -0.076975398
		 -0.081869029 0.94532084 -0.30246815 0.12198975 0.94532084 -0.30246815 0.12198975
		 0.99366605 -0.076975398 -0.081869029 0.99455112 -0.061164558 -0.084421247 -0.061020538
		 0.99757218 0.033558533 -0.061661288 0.99751633 0.034045201 -0.092684746 0.99569553
		 -5.476435e-05 -0.092684746 0.99569553 -5.476435e-05 -0.061661288 0.99751633 0.034045201
		 -0.092627145 0.99570084 -1.745846e-05 0.0030453084 0.99508286 0.098999053 0.012053555
		 0.99620956 0.08614628 0.0029302216 0.99514323 0.098394036 0.0029302216 0.99514323
		 0.098394036 0.012053555 0.99620956 0.08614628 0.01215928 0.99622965 0.085898787 -0.36015362
		 0.72838491 -0.58287632 -0.66782451 0.56758571 -0.48151523 -0.35883802 0.72143924
		 -0.59225053 -0.35883802 0.72143924 -0.59225053 -0.66782451 0.56758571 -0.48151523
		 -0.68886167 0.5182839 -0.50680506 0.68077242 0.64806932 -0.34140167 0.70365733 0.62070233
		 -0.34582508 0.69439465 0.63764364 -0.33350655 0.69439465 0.63764364 -0.33350655 0.70365733
		 0.62070233 -0.34582508 0.71019608 0.61450416 -0.34352025 0.96778452 -0.22675686 -0.10942759
		 0.94941574 -0.30610654 -0.070061281 0.86735314 -0.40589628 -0.28800467 0.86735314
		 -0.40589628 -0.28800467 0.94941574 -0.30610654 -0.070061281 0.8423624 -0.4770897
		 -0.25062126 0.55454308 0.58676463 -0.59007567 0.64400381 0.52878302 -0.55285406 0.5284915
		 0.36313981 -0.76735014 0.5284915 0.36313981 -0.76735014 0.64400381 0.52878302 -0.55285406
		 0.61313552 0.31114647 -0.72612166 0.93962836 -0.020910287 0.34155723 0.91375619 -0.098637827
		 0.39410689 0.96423942 -0.19491337 0.17958604 0.96423942 -0.19491337 0.17958604 0.91375619
		 -0.098637827 0.39410689 0.93309426 -0.27843961 0.22761048 0.99039871 0.13805851 -0.0070874756
		 0.97362667 0.2217422 -0.05367988 0.94045079 0.30391505 0.15227585 0.94045079 0.30391505
		 0.15227585 0.97362667 0.2217422 -0.05367988 0.91577828 0.38634938 0.10992865 0.76876318
		 0.58771336 -0.25218275 0.69677722 0.65538889 -0.29149094 0.6912697 0.7209658 -0.048524193
		 0.6912697 0.7209658 -0.048524193 0.69677722 0.65538889 -0.29149094 0.61820269 0.78266305
		 -0.072553277 0.56593013 -0.60112673 0.56424266 0.52595341 -0.4911319 0.69437915 0.50122488
		 -0.60252964 0.62107295 0.50122488 -0.60252964 0.62107295 0.52595341 -0.4911319 0.69437915
		 0.44400099 -0.49979246 0.74368715 0.10468805 0.98155522 -0.15996785 0.11578536 0.89565569
		 -0.42941198 1.0348368e-09 0.98572814 -0.16834511 1.0348368e-09 0.98572814 -0.16834511
		 0.11578536 0.89565569 -0.42941198 -1.6920271e-07 0.90156043 -0.43265316 0.83737296
		 -0.47044823 0.27836117 0.95275867 -0.28984371 0.090783171 0.81184357 -0.49291548
		 0.31296062 0.81184357 -0.49291548 0.31296062 0.95275867 -0.28984371 0.090783171 0.94770986
		 -0.29965261 0.10979202 -0.88484603 -0.46572709 0.012075986 -0.91979563 -0.39163825
		 -0.02440328 -0.78628993 -0.59350204 -0.17176591 -0.78628993 -0.59350204 -0.17176591
		 -0.91979563 -0.39163825 -0.02440328 -0.81282449 -0.54455125 -0.20683396 -0.71985048
		 0.46630284 -0.51417595 -0.68394971 0.24827434 -0.685983 -0.7907533 0.39577127 -0.46698427
		 -0.7907533 0.39577127 -0.46698427 -0.68394971 0.24827434 -0.685983 -0.74836832 0.18324523
		 -0.63746846 -0.91375625 -0.098637752 0.39410675 -0.9330942 -0.27843967 0.2276105
		 -0.87230206 -0.18841381 0.4512088 -0.87230206 -0.18841381 0.4512088 -0.9330942 -0.27843967
		 0.2276105 -0.88838315 -0.36353132 0.28039333 -0.97362667 0.2217422 -0.053679608 -0.91577828
		 0.38634938 0.1099285 -0.95036978 0.29702014 -0.092608355 -0.95036978 0.29702014 -0.092608355
		 -0.91577828 0.38634938 0.1099285 -0.88634223 0.45655921 0.077144049 -0.54572451 0.83303243
		 -0.090783715 -0.61965829 0.71474427 -0.32429034 -0.6182031 0.78266275 -0.072553232;
	setAttr ".n[6972:7137]" -type "float3"  -0.6182031 0.78266275 -0.072553232 -0.61965829
		 0.71474427 -0.32429034 -0.69677716 0.65538877 -0.29149112 -0.11578543 0.89565569
		 -0.42941198 -0.22692274 0.87896758 -0.41943064 -0.1046882 0.98155522 -0.15996787
		 -0.1046882 0.98155522 -0.15996787 -0.22692274 0.87896758 -0.41943064 -0.19862905
		 0.96809596 -0.15276375 0.71623492 -0.69401139 -0.073182829 0.8421036 -0.53925997
		 -0.0077600824 0.75529945 -0.63782752 -0.15066114 0.75529945 -0.63782752 -0.15066114
		 0.8421036 -0.53925997 -0.0077600824 0.88248169 -0.46918821 -0.032992579 0.82382631
		 -0.4893733 0.28604895 0.69390869 -0.61758167 0.37024802 0.80772716 -0.46222955 0.36595172
		 0.80772716 -0.46222955 0.36595172 0.69390869 -0.61758167 0.37024802 0.64956242 -0.56560254
		 0.50809693 -0.19862905 0.96809596 -0.15276375 -0.29520726 0.94529283 -0.13883141
		 -0.17865126 0.98390669 -0.0033727167 -0.17865126 0.98390669 -0.0033727167 -0.29520726
		 0.94529283 -0.13883141 -0.26381338 0.96451396 0.010739069 -0.88359052 0.4029333 0.2385636
		 -0.94045085 0.30391511 0.1522755 -0.90259761 0.33155316 0.27457246 -0.90259761 0.33155316
		 0.27457246 -0.94045085 0.30391511 0.1522755 -0.95433265 0.23017305 0.19044563 0.5889678
		 -0.38176879 0.71229875 0.61370939 -0.45667991 0.64405292 0.67820311 -0.32044935 0.66132653
		 0.67820311 -0.32044935 0.66132653 0.61370939 -0.45667991 0.64405292 0.69413286 -0.40319315
		 0.59633458 0.80272084 0.59628206 0.0093244677 0.74619633 0.66526973 -0.024643268
		 0.73119551 0.67256457 0.1140615 0.73119551 0.67256457 0.1140615 0.74619633 0.66526973
		 -0.024643268 0.67144459 0.73605621 0.085926354 0.82580101 -0.25954992 0.50068605
		 0.87230206 -0.18841383 0.4512088 0.80175674 -0.15959506 0.57594752 0.80175674 -0.15959506
		 0.57594752 0.87230206 -0.18841383 0.4512088 0.84353751 -0.080506176 0.5310021 0.095164016
		 0.92400497 -0.37034938 0.073139474 0.93511087 -0.34672505 4.7087823e-09 0.94813716
		 -0.3178615 4.7087823e-09 0.94813716 -0.3178615 0.073139474 0.93511087 -0.34672505
		 -2.4899773e-09 0.9502337 -0.31153798 -0.32638034 0.5352357 0.77910113 -0.31555307
		 0.515441 0.79671001 -0.32448089 0.53415972 0.78063154 -0.32448089 0.53415972 0.78063154
		 -0.31555307 0.515441 0.79671001 -0.31416598 0.51417959 0.7980721 -0.041193329 0.36156088
		 0.93143803 -0.041504707 0.361494 0.93145019 -0.074956283 0.36567539 0.9277193 -0.074956283
		 0.36567539 0.9277193 -0.041504707 0.361494 0.93145019 -0.075775929 0.36613315 0.92747211
		 0.33520916 0.66561925 0.66677272 0.3344219 0.66352332 0.66925246 0.3406193 0.63712019
		 0.6914162 0.3406193 0.63712019 0.6914162 0.3344219 0.66352332 0.66925246 0.3397907
		 0.63587171 0.69297141 0.1420496 0.38666236 0.91121572 0.16913281 0.39655676 0.90229529
		 0.14233997 0.3863664 0.91129595 0.14233997 0.3863664 0.91129595 0.16913281 0.39655676
		 0.90229529 0.16850346 0.39656377 0.90240997 0.23147784 0.82549328 0.51476103 0.23185752
		 0.8235057 0.51776487 0.26056805 0.79786563 0.5436126 0.26056805 0.79786563 0.5436126
		 0.23185752 0.8235057 0.51776487 0.25992653 0.79439247 0.54897982 0.75190514 -0.64638531
		 -0.1297098 0.70816225 -0.66876489 -0.22640628 0.78628999 -0.59350193 -0.171766 0.78628999
		 -0.59350193 -0.171766 0.70816225 -0.66876489 -0.22640628 0.72612768 -0.63597143 -0.26130229
		 0.61313552 0.31114647 -0.72612166 0.68394983 0.24827453 -0.68598282 0.57753152 0.18429323
		 -0.79529452 0.57753152 0.18429323 -0.79529452 0.68394983 0.24827453 -0.68598282 0.64496899
		 0.11921457 -0.75485289 -0.74469376 -0.0094315102 -0.66733974 -0.79434162 0.11472136
		 -0.59654039 -0.70336312 0.058660511 -0.70840609 -0.70336312 0.058660511 -0.70840609
		 -0.79434162 0.11472136 -0.59654039 -0.74836832 0.18324523 -0.63746846 0.70016509
		 -0.70296383 0.124943 0.75339526 -0.65675414 -0.032705158 0.70617557 -0.70771348 0.021393267
		 0.70617557 -0.70771348 0.021393267 0.75339526 -0.65675414 -0.032705158 0.70841551
		 -0.70209795 -0.072152309 -0.65264231 -0.63557816 0.4124299 -0.58537602 -0.68597525
		 0.43217221 -0.65819585 -0.63280147 0.4078486 -0.65819585 -0.63280147 0.4078486 -0.58537602
		 -0.68597525 0.43217221 -0.56022608 -0.7029261 0.43822554 -0.65819585 -0.63280147
		 0.4078486 -0.73959714 -0.56028956 0.37292308 -0.65264231 -0.63557816 0.4124299 -0.65264231
		 -0.63557816 0.4124299 -0.73959714 -0.56028956 0.37292308 -0.7318328 -0.56476372 0.38139573
		 -0.88672918 0.44609693 -0.12127996 -0.93051976 0.3595235 -0.069826864 -0.87074721
		 0.46904618 -0.14763103 -0.87074721 0.46904618 -0.14763103 -0.93051976 0.3595235 -0.069826864
		 -0.89666319 0.42552492 -0.12216229 0.23851486 -0.82499886 0.51233542 0.23052561 -0.82578701
		 0.51471716 0.3531245 -0.7954151 0.49256262 0.3531245 -0.7954151 0.49256262 0.23052561
		 -0.82578701 0.51471716 0.33985937 -0.79776627 0.49806082 0.78121978 0.58209282 -0.22552949
		 0.77449965 0.58775276 -0.2338738 0.8392337 0.51459718 -0.17571713 0.8392337 0.51459718
		 -0.17571713 0.77449965 0.58775276 -0.2338738 0.8397736 0.51384705 -0.17533244 -0.5978182
		 -0.48864752 -0.63548166 -0.57056201 -0.45061255 -0.68659109 -0.59050089 -0.48748806
		 -0.6431672 -0.59050089 -0.48748806 -0.6431672 -0.57056201 -0.45061255 -0.68659109
		 -0.56423944 -0.44840118 -0.69323176 -0.17668948 -0.92028069 -0.34909073 -0.23512594
		 -0.89620274 -0.37621328 -0.17829134 -0.91847205 -0.35301736 -0.17829134 -0.91847205
		 -0.35301736 -0.23512594 -0.89620274 -0.37621328 -0.23716046 -0.89561921 -0.37632591
		 0.43774304 -0.77958697 -0.44791204 0.43977731 -0.77848542 -0.44783524 0.47528508
		 -0.74442452 -0.46897364 0.47528508 -0.74442452 -0.46897364 0.43977731 -0.77848542
		 -0.44783524 0.47748458 -0.74552077 -0.4649809 0.46464869 -0.31858951 -0.8261975 0.48216516
		 -0.33646566 -0.80889285 0.46643996 -0.31340149 -0.82717186 0.46643996 -0.31340149
		 -0.82717186 0.48216516 -0.33646566 -0.80889285 0.48336339 -0.33645496 -0.80818182
		 0.30805421 -0.52883554 0.79084486;
	setAttr ".n[7138:7303]" -type "float3"  0.4174799 -0.58068693 0.69893724 0.24072877
		 -0.49322236 0.83593142 0.24072877 -0.49322236 0.83593142 0.4174799 -0.58068693 0.69893724
		 0.3444958 -0.49623245 0.79691654 0.55541396 -0.50682408 0.65927589 0.54099041 -0.52289921
		 0.65871525 0.31441548 -0.61719799 0.72125554 0.31441548 -0.61719799 0.72125554 0.54099041
		 -0.52289921 0.65871525 0.3023043 -0.61586541 0.72754514 -0.8518967 0.47329825 -0.22418913
		 -0.84769994 0.48380938 -0.21756218 -0.74227232 0.6699174 -0.015570381 -0.74227232
		 0.6699174 -0.015570381 -0.84769994 0.48380938 -0.21756218 -0.7618475 0.64734834 -0.022991056
		 -0.61135775 -0.6978792 -0.37310365 -0.53369033 -0.76362509 -0.36338878 -0.60885972
		 -0.69424534 -0.38381401 -0.60885972 -0.69424534 -0.38381401 -0.53369033 -0.76362509
		 -0.36338878 -0.52585727 -0.76661444 -0.36847854 0 0.51590192 0.85664767 -0.11350171
		 0.50804573 0.85381901 -1.5856789e-09 0.51590192 0.85664767 -1.5856789e-09 0.51590192
		 0.85664767 -0.11350171 0.50804573 0.85381901 -0.12696666 0.50559807 0.85337567 0.39270163
		 -0.91642118 -0.077185772 0.21894319 -0.9697054 -0.1083298 0.37645355 -0.92337018
		 -0.075300708 0.37645355 -0.92337018 -0.075300708 0.21894319 -0.9697054 -0.1083298
		 0.21057878 -0.97165477 -0.10744124 0.0096910028 -0.76888633 0.63931209 -0.38512903
		 -0.70779485 0.59220099 0.022763075 -0.80480301 0.59310538 0.022763075 -0.80480301
		 0.59310538 -0.38512903 -0.70779485 0.59220099 -0.37653664 -0.74603742 0.54922521
		 0.035561107 -0.93088824 0.36356911 0.032404736 -0.85560393 0.51661581 -0.37298584
		 -0.86664462 0.3313739 -0.37298584 -0.86664462 0.3313739 0.032404736 -0.85560393 0.51661581
		 -0.36588356 -0.80065459 0.47442752 -0.36309412 0.72296119 -0.58778375 -0.0013146511
		 0.7780149 -0.62824446 -0.37362751 0.7054376 -0.60229582 -0.37362751 0.7054376 -0.60229582
		 -0.0013146511 0.7780149 -0.62824446 0.0051630624 0.76245844 -0.64701664 -0.29238617
		 -0.7137385 0.63646495 -0.044924513 -0.73209339 0.67972136 -0.29188693 -0.91357374
		 0.28316966 -0.29188693 -0.91357374 0.28316966 -0.044924513 -0.73209339 0.67972136
		 -0.034750782 -0.95857573 0.28271008 -0.99174976 0.018404676 -0.12686089 -0.99455869
		 -0.019491998 -0.10233814 -0.99259633 0.05307449 -0.10925005 -0.99259633 0.05307449
		 -0.10925005 -0.99455869 -0.019491998 -0.10233814 -0.99726993 0.0090507055 -0.073285475
		 -0.68236667 -0.59323454 0.42713988 -0.68573606 -0.55833334 0.46693674 -0.86690909
		 -0.40894362 0.28501546 -0.86690909 -0.40894362 0.28501546 -0.68573606 -0.55833334
		 0.46693674 -0.86953312 -0.37816122 0.31765753 0.048498362 0.026742736 -0.99846518
		 -0.33061299 0.038162164 -0.94299453 0.02864201 0.30136704 -0.95307791 0.02864201
		 0.30136704 -0.95307791 -0.33061299 0.038162164 -0.94299453 -0.33500862 0.3051841
		 -0.89142126 0.123022 -0.72941476 0.67291874 0.1624411 -0.93307263 0.32091793 -0.044924513
		 -0.73209339 0.67972136 -0.044924513 -0.73209339 0.67972136 0.1624411 -0.93307263
		 0.32091793 -0.034750782 -0.95857573 0.28271008 0.41219616 -0.70674402 0.57498449
		 0.70258355 -0.59789497 0.38587296 0.42855948 -0.82762933 0.36244506 0.42855948 -0.82762933
		 0.36244506 0.70258355 -0.59789497 0.38587296 0.69916707 -0.65848303 0.27850592 0.73957157
		 -0.55123562 0.38622946 0.50098377 -0.62869781 0.59477252 0.7812252 -0.51439792 0.35366929
		 0.7812252 -0.51439792 0.35366929 0.50098377 -0.62869781 0.59477252 0.605304 -0.58354694
		 0.5413686 -0.061020538 0.99757218 0.033558533 -0.049199522 0.99727863 0.054906111
		 -0.061661288 0.99751633 0.034045201 -0.061661288 0.99751633 0.034045201 -0.049199522
		 0.99727863 0.054906111 -0.049208779 0.99728262 0.054826129 0.012053555 0.99620956
		 0.08614628 0.034354277 0.99675715 0.072766773 0.01215928 0.99622965 0.085898787 0.01215928
		 0.99622965 0.085898787 0.034354277 0.99675715 0.072766773 0.03451227 0.99672753 0.073096506
		 -0.66782451 0.56758571 -0.48151523 -0.36015362 0.72838491 -0.58287632 -0.66472489
		 0.57283485 -0.47958425 -0.66472489 0.57283485 -0.47958425 -0.36015362 0.72838491
		 -0.58287632 -0.36309412 0.72296119 -0.58778375 0.38063785 0.67287791 -0.63431078
		 0.35205185 0.70722651 -0.6130988 0.64610577 0.53980261 -0.53959292 0.64610577 0.53980261
		 -0.53959292 0.35205185 0.70722651 -0.6130988 0.61394888 0.57949507 -0.53595918 0.94941574
		 -0.30610654 -0.070061281 0.91979563 -0.39163819 -0.024403272 0.8423624 -0.4770897
		 -0.25062126 0.8423624 -0.4770897 -0.25062126 0.91979563 -0.39163819 -0.024403272
		 0.81282449 -0.54455101 -0.20683452 0.45675501 0.63459867 -0.62342548 0.55454308 0.58676463
		 -0.59007567 0.43430242 0.41366851 -0.80016232 0.43430242 0.41366851 -0.80016232 0.55454308
		 0.58676463 -0.59007567 0.5284915 0.36313981 -0.76735014 0.88838303 -0.36353129 0.28039363
		 0.84142154 -0.53691816 0.06106282 0.93309426 -0.27843961 0.22761048 0.93309426 -0.27843961
		 0.22761048 0.84142154 -0.53691816 0.06106282 0.88484609 -0.46572685 0.012076274 0.95036972
		 0.29702017 -0.092608824 0.97362667 0.2217422 -0.05367988 0.95328742 0.096820876 -0.28612733
		 0.95328742 0.096820876 -0.28612733 0.97362667 0.2217422 -0.05367988 0.96933359 0.020001331
		 -0.24493331 0.71985048 0.46630287 -0.51417601 0.64400381 0.52878302 -0.55285406 0.69677722
		 0.65538889 -0.29149094 0.69677722 0.65538889 -0.29149094 0.64400381 0.52878302 -0.55285406
		 0.61965823 0.71474433 -0.32429045 0.11890273 0.72156405 -0.68206114 0.11578536 0.89565569
		 -0.42941198 0.23498093 0.70340776 -0.67082155 0.23498093 0.70340776 -0.67082155 0.11578536
		 0.89565569 -0.42941198 0.22692254 0.87896758 -0.41943067 -1.5065052e-07 0.72771388
		 -0.68588078 0.11890273 0.72156405 -0.68206114 -3.6526138e-09 0.50518793 -0.86300939
		 -3.6526138e-09 0.50518793 -0.86300939 0.11890273 0.72156405 -0.68206114 0.11524539
		 0.48986074 -0.86414987 0.063669272 -0.20758377 -0.976143 -0.34239918 -0.1664394 -0.92469496
		 0.048498362 0.026742736 -0.99846518 0.048498362 0.026742736 -0.99846518 -0.34239918
		 -0.1664394 -0.92469496;
	setAttr ".n[7304:7469]" -type "float3"  -0.33061299 0.038162164 -0.94299453 0.94312739
		 0.17473699 -0.28280324 0.94806212 0.035624702 -0.31608409 0.98937279 -0.03184282
		 -0.14187141 0.98937279 -0.03184282 -0.14187141 0.94806212 0.035624702 -0.31608409
		 0.98052412 -0.14094472 -0.13677351 -0.84142148 -0.53691828 0.061062895 -0.88484603
		 -0.46572709 0.012075986 -0.75190514 -0.64638537 -0.12970968 -0.75190514 -0.64638537
		 -0.12970968 -0.88484603 -0.46572709 0.012075986 -0.78628993 -0.59350204 -0.17176591
		 -0.64400381 0.52878296 -0.55285406 -0.6131354 0.31114647 -0.72612178 -0.71985048
		 0.46630284 -0.51417595 -0.71985048 0.46630284 -0.51417595 -0.6131354 0.31114647 -0.72612178
		 -0.68394971 0.24827434 -0.685983 -0.84117317 -0.43054742 0.32719505 -0.88838315 -0.36353132
		 0.28039333 -0.7985394 -0.5934661 0.10066183 -0.7985394 -0.5934661 0.10066183 -0.88838315
		 -0.36353132 0.28039333 -0.84142148 -0.53691828 0.061062895 -0.99039871 0.13805851
		 -0.0070875781 -0.9782964 -0.062963076 -0.19741277 -0.99760145 0.060670424 0.033323545
		 -0.99760145 0.060670424 0.033323545 -0.9782964 -0.062963076 -0.19741277 -0.97736865
		 -0.14100714 -0.15769419 -0.89113146 0.25189599 -0.3774032 -0.87622833 0.44893658
		 -0.17515676 -0.84246266 0.32896164 -0.42666247 -0.84246266 0.32896164 -0.42666247
		 -0.87622833 0.44893658 -0.17515676 -0.82323712 0.52408975 -0.21819857 -0.23498091
		 0.7034077 -0.67082161 -0.34963697 0.67372322 -0.65103847 -0.22692274 0.87896758 -0.41943064
		 -0.22692274 0.87896758 -0.41943064 -0.34963697 0.67372322 -0.65103847 -0.33656952
		 0.85112232 -0.40287942 -0.50122505 -0.6025297 0.62107283 -0.41738749 -0.58084655
		 0.69885975 -0.44400093 -0.49979264 0.74368709 -0.44400093 -0.49979264 0.74368709
		 -0.41738749 -0.58084655 0.69885975 -0.3444958 -0.49623245 0.79691654 0.98052412 -0.14094472
		 -0.13677351 0.93191361 -0.35778713 0.059375178 0.98937279 -0.03184282 -0.14187141
		 0.98937279 -0.03184282 -0.14187141 0.93191361 -0.35778713 0.059375178 0.92035902
		 -0.37694597 0.10416847 -0.1046882 0.98155522 -0.15996787 -0.19862905 0.96809596 -0.15276375
		 -0.10144903 0.99478662 -0.01037617 -0.10144903 0.99478662 -0.01037617 -0.19862905
		 0.96809596 -0.15276375 -0.17865126 0.98390669 -0.0033727167 -0.81899005 0.54733753
		 0.17226993 -0.88634223 0.45655921 0.077144049 -0.85202986 0.48356512 0.20052405 -0.85202986
		 0.48356512 0.20052405 -0.88634223 0.45655921 0.077144049 -0.91577828 0.38634938 0.1099285
		 0.76262301 -0.33768654 0.55170095 0.74743199 -0.24555066 0.61729276 0.69413286 -0.40319315
		 0.59633458 0.69413286 -0.40319315 0.59633458 0.74743199 -0.24555066 0.61729276 0.67820311
		 -0.32044935 0.66132653 0.54572439 0.83303255 -0.090783723 0.5354799 0.84271127 0.055669025
		 0.61820269 0.78266305 -0.072553277 0.61820269 0.78266305 -0.072553277 0.5354799 0.84271127
		 0.055669025 0.6129024 0.7871567 0.068810761 0.5354799 0.84271127 0.055669025 0.54572439
		 0.83303255 -0.090783723 0.47210178 0.88009399 0.050541978 0.87230206 -0.18841383
		 0.4512088 0.91375619 -0.098637827 0.39410689 0.84353751 -0.080506176 0.5310021 0.84353751
		 -0.080506176 0.5310021 0.91375619 -0.098637827 0.39410689 0.87990433 0.0073255389
		 0.47509438 0.52341425 0.72123277 -0.45371887 0.61358994 0.68688977 -0.3894738 0.6269623
		 0.68292677 -0.37487233 -0.34018767 0.58482325 0.73637909 -0.33524978 0.56155717 0.75647944
		 -0.33917072 0.58358961 0.73782539 -0.33917072 0.58358961 0.73782539 -0.33524978 0.56155717
		 0.75647944 -0.33355889 0.55968374 0.75861228 -0.074956283 0.36567539 0.9277193 -0.075775929
		 0.36613315 0.92747211 -0.11235453 0.37527892 0.92007726 -0.11235453 0.37527892 0.92007726
		 -0.075775929 0.36613315 0.92747211 -0.112881 0.37554491 0.91990429 0.32743424 0.69310963
		 0.64217275 0.32710731 0.69093674 0.64467603 0.33520916 0.66561925 0.66677272 0.33520916
		 0.66561925 0.66677272 0.32710731 0.69093674 0.64467603 0.3344219 0.66352332 0.66925246
		 0.24902248 0.43473443 0.86544424 0.24575427 0.43451282 0.86648917 0.2204455 0.4177703
		 0.88140333 0.2204455 0.4177703 0.88140333 0.24575427 0.43451282 0.86648917 0.21762443
		 0.41820142 0.88189977 0.030203206 0.86249101 0.50517035 -6.5211564e-10 0.8681522
		 0.49629802 0.029479798 0.86287451 0.50455773 0.029479798 0.86287451 0.50455773 -6.5211564e-10
		 0.8681522 0.49629802 6.1800687e-10 0.87078965 0.4916558 0.72668976 -0.68118644 -0.088921554
		 0.70020288 -0.68892664 -0.18733934 0.75190514 -0.64638531 -0.1297098 0.75190514 -0.64638531
		 -0.1297098 0.70020288 -0.68892664 -0.18733934 0.70816225 -0.66876489 -0.22640628
		 0.79434162 0.11472113 -0.59654039 0.83608109 0.043210968 -0.54690146 0.7446934 -0.0094307875
		 -0.66734004 0.7446934 -0.0094307875 -0.66734004 0.83608109 0.043210968 -0.54690146
		 0.7812382 -0.073283084 -0.6199165 -0.70695823 -0.70701146 0.018570693 -0.71078157
		 -0.70237446 -0.038205367 -0.70841533 -0.70209807 -0.072152399 -0.70841533 -0.70209807
		 -0.072152399 -0.71078157 -0.70237446 -0.038205367 -0.70679855 -0.69232178 -0.14534892
		 -0.86290985 -0.02891545 -0.50453001 -0.80402195 -0.14282677 -0.57719076 -0.88492769
		 -0.10373009 -0.45402977 -0.88492769 -0.10373009 -0.45402977 -0.80402195 -0.14282677
		 -0.57719076 -0.82191318 -0.21510127 -0.52743733 -0.93051976 0.3595235 -0.069826864
		 -0.96307296 0.26830584 -0.022416137 -0.92648262 0.36668301 -0.084697075 -0.92648262
		 0.36668301 -0.084697075 -0.96307296 0.26830584 -0.022416137 -0.95390373 0.29560938
		 -0.051795207 -0.89666319 0.42552492 -0.12216229 -0.93051976 0.3595235 -0.069826864
		 -0.92648262 0.36668301 -0.084697075 0.3531245 -0.7954151 0.49256262 0.33985937 -0.79776627
		 0.49806082 0.46244329 -0.75534153 0.46433327 0.46244329 -0.75534153 0.46433327 0.33985937
		 -0.79776627 0.49806082 0.43342936 -0.76325685 0.47914296 0.8392337 0.51459718 -0.17571713
		 0.8397736 0.51384705 -0.17533244 0.88672912 0.44609696 -0.1212803 0.88672912 0.44609696
		 -0.1212803 0.8397736 0.51384705 -0.17533244 0.87074733 0.46904624 -0.14763044;
	setAttr ".n[7470:7635]" -type "float3"  -0.57056201 -0.45061255 -0.68659109 -0.55265272
		 -0.41289163 -0.72394443 -0.56423944 -0.44840118 -0.69323176 -0.56423944 -0.44840118
		 -0.69323176 -0.55265272 -0.41289163 -0.72394443 -0.55059057 -0.41213393 -0.7259447
		 -0.23512594 -0.89620274 -0.37621328 -0.29681978 -0.87354064 -0.38577819 -0.23716046
		 -0.89561921 -0.37632591 -0.23716046 -0.89561921 -0.37632591 -0.29681978 -0.87354064
		 -0.38577819 -0.29842237 -0.87544674 -0.38018033 0.39671078 -0.82033885 -0.41190383
		 0.39743471 -0.81896949 -0.41392595 0.43774304 -0.77958697 -0.44791204 0.43774304
		 -0.77958697 -0.44791204 0.39743471 -0.81896949 -0.41392595 0.43977731 -0.77848542
		 -0.44783524 0.48216516 -0.33646566 -0.80889285 0.51137477 -0.3614687 -0.77963853
		 0.48336339 -0.33645496 -0.80818182 0.48336339 -0.33645496 -0.80818182 0.51137477
		 -0.3614687 -0.77963853 0.50905997 -0.35963398 -0.78199834 -0.95236969 -0.21862268
		 0.21259385 -0.86391014 -0.36709058 0.34482422 -0.943694 -0.23213789 0.2356983 -0.943694
		 -0.23213789 0.2356983 -0.86391014 -0.36709058 0.34482422 -0.8623786 -0.36824733 0.34741479
		 0.65694159 -0.42287427 0.62418348 0.64686763 -0.43477044 0.62652767 0.64138877 -0.4597483
		 0.6142084 0.64138877 -0.4597483 0.6142084 0.64686763 -0.43477044 0.62652767 0.6111387
		 -0.50926143 0.60593915 0.24525645 0.46928442 0.84830505 0.2972286 0.44836187 0.84298682
		 0.50122029 0.3280544 0.80072373 0.50122029 0.3280544 0.80072373 0.2972286 0.44836187
		 0.84298682 0.57241267 0.27098668 0.77389276 -0.67143077 -0.59053069 -0.44772115 -0.66947699
		 -0.5999741 -0.43798584 -0.60885972 -0.69424534 -0.38381401 -0.60885972 -0.69424534
		 -0.38381401 -0.66947699 -0.5999741 -0.43798584 -0.61135775 -0.6978792 -0.37310365
		 0.12696664 0.50559783 0.85337579 0.11350168 0.50804555 0.85381913 -1.5856789e-09
		 0.51590192 0.85664767 -1.5856789e-09 0.51590192 0.85664767 0.11350168 0.50804555
		 0.85381913 0 0.51590192 0.85664767 0.37645355 -0.92337018 -0.075300708 0.49031594
		 -0.87075925 -0.036995079 0.39270163 -0.91642118 -0.077185772 0.39270163 -0.91642118
		 -0.077185772 0.49031594 -0.87075925 -0.036995079 0.51479602 -0.85696727 -0.024335688
		 0.70671803 -0.57864982 0.40707994 0.391835 -0.72205901 0.57017201 0.72815764 -0.57819343
		 0.36807442 0.72815764 -0.57819343 0.36807442 0.391835 -0.72205901 0.57017201 0.41665173
		 -0.74148256 0.52593243 0.035208944 -0.99446833 0.098959707 0.44340107 -0.89237684
		 0.084017992 0.035561107 -0.93088824 0.36356911 0.035561107 -0.93088824 0.36356911
		 0.44340107 -0.89237684 0.084017992 0.42978662 -0.84429204 0.32008505 0.42855948 -0.82762933
		 0.36244506 0.1624411 -0.93307263 0.32091793 0.41219616 -0.70674402 0.57498449 0.41219616
		 -0.70674402 0.57498449 0.1624411 -0.93307263 0.32091793 0.123022 -0.72941476 0.67291874
		 -0.33820435 -0.80303121 -0.49067163 -0.37514684 -0.91056329 -0.17360695 -0.72829878
		 -0.59829605 -0.3340998 -0.72829878 -0.59829605 -0.3340998 -0.37514684 -0.91056329
		 -0.17360695 -0.72701013 -0.67494905 -0.12609559 -0.67842782 -0.54016006 0.49795863
		 -0.86391014 -0.36709058 0.34482422 -0.68573606 -0.55833334 0.46693674 -0.68573606
		 -0.55833334 0.46693674 -0.86391014 -0.36709058 0.34482422 -0.86953312 -0.37816122
		 0.31765753 -0.84318101 -0.50984794 0.17058967 -0.85478699 -0.45962551 0.24100544
		 -0.93836027 -0.33586019 0.081718937 -0.93836027 -0.33586019 0.081718937 -0.85478699
		 -0.45962551 0.24100544 -0.94800043 -0.29165193 0.12741399 -0.57939976 0.75763476
		 -0.30047542 -0.61282641 0.73132116 -0.29935464 -0.59358704 0.74638152 -0.30094695
		 -0.59358704 0.74638152 -0.30094695 -0.61282641 0.73132116 -0.29935464 -0.62252432
		 0.71912515 -0.30874345 -0.52199394 -0.82231838 0.22652781 -0.48213807 -0.71444237
		 0.50706506 -0.29188693 -0.91357374 0.28316966 -0.29188693 -0.91357374 0.28316966
		 -0.48213807 -0.71444237 0.50706506 -0.29238617 -0.7137385 0.63646495 -0.98640817
		 -0.018608412 -0.16325642 -0.97058749 -0.082424134 -0.2261994 -0.98868454 -0.064504348
		 -0.13543282 -0.98868454 -0.064504348 -0.13543282 -0.97058749 -0.082424134 -0.2261994
		 -0.9741255 -0.14827041 -0.17057365 -0.39331985 -0.91465795 0.093275592 0.035208944
		 -0.99446833 0.098959707 -0.37298584 -0.86664462 0.3313739 -0.37298584 -0.86664462
		 0.3313739 0.035208944 -0.99446833 0.098959707 0.035561107 -0.93088824 0.36356911
		 0.82895839 0.37836966 -0.41190335 0.81080323 0.41160041 -0.41615283 0.95327145 0.1485182
		 -0.26308912 0.95327145 0.1485182 -0.26308912 0.81080323 0.41160041 -0.41615283 0.94822347
		 0.17536439 -0.26480111 0.014954747 0.49889234 -0.86653495 0.010605128 0.66258413
		 -0.74891239 0.42708302 0.45469457 -0.78157085 0.42708302 0.45469457 -0.78157085 0.010605128
		 0.66258413 -0.74891239 0.40434167 0.60560542 -0.68538302 0.092685223 0.99569547 -5.4998807e-05
		 0.09811414 0.99425793 -0.042717364 0.092627555 0.99570084 -1.7648745e-05 0.092627555
		 0.99570084 -1.7648745e-05 0.09811414 0.99425793 -0.042717364 0.097048432 0.99433506
		 -0.043352004 0.60513681 0.6211403 -0.4979901 0.57174337 0.63146019 -0.52380115 0.31906772
		 0.74305308 -0.58827537 0.31906772 0.74305308 -0.58827537 0.57174337 0.63146019 -0.52380115
		 0.31374761 0.74101484 -0.59368294 0.68197066 0.37910682 -0.62545508 0.6723485 0.4826518
		 -0.56124395 0.87014186 0.24288155 -0.42879102 0.87014186 0.24288155 -0.42879102 0.6723485
		 0.4826518 -0.56124395 0.86179024 0.29454303 -0.41299146 0.94312739 0.17473699 -0.28280324
		 0.98937279 -0.03184282 -0.14187141 0.92835766 0.24807025 -0.27679095 0.92835766 0.24807025
		 -0.27679095 0.98937279 -0.03184282 -0.14187141 0.99225181 -0.032287393 -0.11997435
		 0.79853934 -0.5934661 0.10066207 0.72668976 -0.68118644 -0.088921554 0.84142154 -0.53691816
		 0.06106282 0.84142154 -0.53691816 0.06106282 0.72668976 -0.68118644 -0.088921554
		 0.75190514 -0.64638531 -0.1297098 0.84246284 0.3289614 -0.4266623 0.89113158 0.25189582
		 -0.37740296 0.79434162 0.11472113 -0.59654039 0.79434162 0.11472113 -0.59654039;
	setAttr ".n[7636:7801]" -type "float3"  0.89113158 0.25189582 -0.37740296 0.83608109
		 0.043210968 -0.54690146 0.88838303 -0.36353129 0.28039363 0.87230206 -0.18841383
		 0.4512088 0.84117335 -0.4305473 0.32719478 0.84117335 -0.4305473 0.32719478 0.87230206
		 -0.18841383 0.4512088 0.82580101 -0.25954992 0.50068605 0.99760145 0.060670413 0.033323776
		 0.99039871 0.13805851 -0.0070874756 0.95433259 0.23017307 0.190446 0.95433259 0.23017307
		 0.190446 0.99039871 0.13805851 -0.0070874756 0.94045079 0.30391505 0.15227585 0.87622839
		 0.44893649 -0.17515661 0.82323724 0.52408963 -0.21819825 0.80272084 0.59628206 0.0093244677
		 0.80272084 0.59628206 0.0093244677 0.82323724 0.52408963 -0.21819825 0.74619633 0.66526973
		 -0.024643268 0.22692254 0.87896758 -0.41943067 0.19862846 0.96809608 -0.15276378
		 0.33656943 0.85112244 -0.40287921 0.33656943 0.85112244 -0.40287921 0.19862846 0.96809608
		 -0.15276378 0.29520696 0.94529289 -0.13883157 0.75190932 -0.64099795 0.15412341 0.77749598
		 -0.49843588 0.38348624 0.71521515 -0.66329634 0.22023894 0.71521515 -0.66329634 0.22023894
		 0.77749598 -0.49843588 0.38348624 0.71351361 -0.54620427 0.43881565 -0.92472762 0.1789021
		 -0.33596557 -0.86290985 -0.02891545 -0.50453001 -0.95328736 0.096820898 -0.28612736
		 -0.95328736 0.096820898 -0.28612736 -0.86290985 -0.02891545 -0.50453001 -0.88492769
		 -0.10373009 -0.45402977 -0.84117317 -0.43054742 0.32719505 -0.77749598 -0.498436
		 0.38348609 -0.8258009 -0.25954971 0.50068641 -0.8258009 -0.25954971 0.50068641 -0.77749598
		 -0.498436 0.38348609 -0.76262319 -0.33768669 0.55170059 -0.99611503 -0.026723308
		 0.083909132 -0.95988941 0.14305152 0.24114016 -0.99760145 0.060670424 0.033323545
		 -0.99760145 0.060670424 0.033323545 -0.95988941 0.14305152 0.24114016 -0.95433265
		 0.23017305 0.19044563 -0.82323712 0.52408975 -0.21819857 -0.74619621 0.66526979 -0.024643697
		 -0.76876324 0.58771342 -0.25218257 -0.76876324 0.58771342 -0.25218257 -0.74619621
		 0.66526979 -0.024643697 -0.69126981 0.72096562 -0.048524126 -0.33656952 0.85112232
		 -0.40287942 -0.4395465 0.8138395 -0.38008437 -0.29520726 0.94529283 -0.13883141 -0.29520726
		 0.94529283 -0.13883141 -0.4395465 0.8138395 -0.38008437 -0.38407055 0.91507345 -0.12300549
		 -0.68389821 -0.69566905 0.21983585 -0.79013193 -0.59283513 0.1556858 -0.68029237
		 -0.63774472 0.36122558 -0.68029237 -0.63774472 0.36122558 -0.79013193 -0.59283513
		 0.1556858 -0.81264901 -0.51394463 0.27470443 -0.3444958 -0.49623245 0.79691654 -0.32263929
		 -0.43072468 0.84284049 -0.44400093 -0.49979264 0.74368709 -0.44400093 -0.49979264
		 0.74368709 -0.32263929 -0.43072468 0.84284049 -0.39614168 -0.43828055 0.80683452
		 -0.88634223 0.45655921 0.077144049 -0.81899005 0.54733753 0.17226993 -0.84507138
		 0.53322715 0.03902752 -0.84507138 0.53322715 0.03902752 -0.81899005 0.54733753 0.17226993
		 -0.77474153 0.61663949 0.13975419 0.1014488 0.99478662 -0.010376175 0.10468805 0.98155522
		 -0.15996785 0 0.9998076 -0.019616352 0 0.9998076 -0.019616352 0.10468805 0.98155522
		 -0.15996785 1.0348368e-09 0.98572814 -0.16834511 0.54572439 0.83303255 -0.090783723
		 0.46586853 0.87810957 -0.10904182 0.47210178 0.88009399 0.050541978 0.47210178 0.88009399
		 0.050541978 0.46586853 0.87810957 -0.10904182 0.40155089 0.91504091 0.038170327 0.95585531
		 0.067680299 0.2859371 0.95988935 0.14305149 0.24114031 0.9142158 0.17089504 0.36742944
		 0.9142158 0.17089504 0.36742944 0.95988935 0.14305149 0.24114031 0.91455412 0.24283938
		 0.32344982 0.336622 0.78737897 -0.51644945 0.2957164 0.80126756 -0.5201174 0.21643713
		 0.84992361 -0.48040074 0.21643713 0.84992361 -0.48040074 0.2957164 0.80126756 -0.5201174
		 0.1869643 0.88499308 -0.42641714 -0.33520973 0.66561973 0.66677195 -0.34061921 0.63711923
		 0.69141716 -0.33442259 0.66352415 0.6692512 -0.33442259 0.66352415 0.6692512 -0.34061921
		 0.63711923 0.69141716 -0.33979046 0.63587093 0.69297224 -0.14204992 0.38666168 0.91121596
		 -0.14234002 0.38636595 0.91129613 -0.16913258 0.39655685 0.90229529 -0.16913258 0.39655685
		 0.90229529 -0.14234002 0.38636595 0.91129613 -0.16850318 0.39656407 0.90240991 0.2776064
		 0.76709038 0.57836586 0.27649781 0.76477224 0.58195561 0.29548475 0.74379599 0.59954679
		 0.29548475 0.74379599 0.59954679 0.27649781 0.76477224 0.58195561 0.29588619 0.74259478
		 0.60083634 0.27110609 0.4506627 0.850532 0.26879522 0.45038098 0.8514142 0.24902248
		 0.43473443 0.86544424 0.24902248 0.43473443 0.86544424 0.26879522 0.45038098 0.8514142
		 0.24575427 0.43451282 0.86648917 0.079947859 0.86113447 0.50205153 0.030203206 0.86249101
		 0.50517035 0.077561542 0.86160022 0.50162667 0.077561542 0.86160022 0.50162667 0.030203206
		 0.86249101 0.50517035 0.029479798 0.86287451 0.50455773 0.71342742 0.60620093 -0.35148507
		 0.71019608 0.61450416 -0.34352025 0.71066809 0.60826373 -0.35350537 0.71066809 0.60826373
		 -0.35350537 0.71019608 0.61450416 -0.34352025 0.70365733 0.62070233 -0.34582508 0.83608109
		 0.043210968 -0.54690146 0.86290973 -0.028915389 -0.50453019 0.7812382 -0.073283084
		 -0.6199165 0.7812382 -0.073283084 -0.6199165 0.86290973 -0.028915389 -0.50453019
		 0.80402255 -0.14282681 -0.57718992 0.71078163 -0.70237446 -0.038205586 0.70679861
		 -0.69232184 -0.1453487 0.72668976 -0.68118644 -0.088921554 0.72668976 -0.68118644
		 -0.088921554 0.70679861 -0.69232184 -0.1453487 0.70020288 -0.68892664 -0.18733934
		 -0.82353824 -0.29291677 -0.48578241 -0.89223808 -0.18061014 -0.41387334 -0.82191318
		 -0.21510127 -0.52743733 -0.82191318 -0.21510127 -0.52743733 -0.89223808 -0.18061014
		 -0.41387334 -0.88492769 -0.10373009 -0.45402977 -0.20785081 0.33230326 -0.91998512
		 -0.22208382 0.47460511 -0.85172105 -0.11613957 0.34341073 -0.93197674 -0.11613957
		 0.34341073 -0.93197674 -0.22208382 0.47460511 -0.85172105 -0.11524539 0.48986095
		 -0.86414969 -0.35312429 -0.79541498 0.49256295 -0.46244287 -0.75534159 0.46433359;
	setAttr ".n[7802:7967]" -type "float3"  -0.33985928 -0.79776627 0.49806088 -0.33985928
		 -0.79776627 0.49806088 -0.46244287 -0.75534159 0.46433359 -0.43342894 -0.76325703
		 0.47914305 -0.99369055 0.088796861 0.068514034 -0.9932242 -0.0087956851 0.11588071
		 -0.99171531 0.1246936 0.030858919 -0.99171531 0.1246936 0.030858919 -0.9932242 -0.0087956851
		 0.11588071 -0.99667215 0.041085243 0.070403539 -0.99171531 0.1246936 0.030858919
		 -0.97633153 0.21588755 -0.01301176 -0.99369055 0.088796861 0.068514034 -0.99369055
		 0.088796861 0.068514034 -0.97633153 0.21588755 -0.01301176 -0.98431438 0.17459179
		 0.025355186 0.73183274 -0.5647639 0.38139564 0.73959738 -0.56028932 0.37292314 0.65264249
		 -0.63557798 0.41242996 0.65264249 -0.63557798 0.41242996 0.73959738 -0.56028932 0.37292314
		 0.65819585 -0.63280165 0.40784827 0.9630729 0.2683059 -0.022416309 0.95390373 0.29560953
		 -0.051794756 0.98431444 0.17459159 0.025354717 0.98431444 0.17459159 0.025354717
		 0.95390373 0.29560953 -0.051794756 0.97633159 0.21588723 -0.01301077 0.95390373 0.29560953
		 -0.051794756 0.9630729 0.2683059 -0.022416309 0.92648244 0.36668327 -0.08469779 0.92648244
		 0.36668327 -0.08469779 0.9630729 0.2683059 -0.022416309 0.93051976 0.35952348 -0.069826998
		 -0.48216528 -0.33646578 -0.80889273 -0.48336327 -0.33645484 -0.80818194 -0.51137507
		 -0.36146855 -0.77963841 -0.51137507 -0.36146855 -0.77963841 -0.48336327 -0.33645484
		 -0.80818194 -0.50906092 -0.3596341 -0.78199762 -0.39671072 -0.82033861 -0.41190436
		 -0.43774295 -0.77958691 -0.44791225 -0.39743474 -0.81896943 -0.41392598 -0.39743474
		 -0.81896943 -0.41392598 -0.43774295 -0.77958691 -0.44791225 -0.43977752 -0.77848542
		 -0.447835 0.23512602 -0.89620292 -0.37621278 0.23716074 -0.89561933 -0.37632531 0.29681993
		 -0.87354052 -0.38577825 0.29681993 -0.87354052 -0.38577825 0.23716074 -0.89561933
		 -0.37632531 0.29842263 -0.87544656 -0.3801806 0.57056242 -0.45061237 -0.68659091
		 0.56423956 -0.44840088 -0.69323182 0.55265284 -0.41289157 -0.72394437 0.55265284
		 -0.41289157 -0.72394437 0.56423956 -0.44840088 -0.69323182 0.55059034 -0.41213372
		 -0.72594494 0.55841357 -0.57325959 0.59962296 0.53850287 -0.59634423 0.5953052 0.50870937
		 -0.58424139 0.63235807 0.50870937 -0.58424139 0.63235807 0.53850287 -0.59634423 0.5953052
		 0.50449312 -0.61063224 0.61042196 -0.5751313 -0.81610006 0.056609854 -0.52983224
		 -0.79857737 -0.28557315 -0.57511753 -0.81711262 0.039582022 -0.57511753 -0.81711262
		 0.039582022 -0.52983224 -0.79857737 -0.28557315 -0.53029341 -0.79814941 -0.28591332
		 -0.73321784 -0.44885704 -0.51080227 -0.7168414 -0.49226522 -0.49377456 -0.67143077
		 -0.59053069 -0.44772115 -0.67143077 -0.59053069 -0.44772115 -0.7168414 -0.49226522
		 -0.49377456 -0.66947699 -0.5999741 -0.43798584 0.79619294 -0.56303072 0.22152479
		 0.68308413 -0.72472131 0.090415999 0.77952623 -0.59475404 0.19648537 0.77952623 -0.59475404
		 0.19648537 0.68308413 -0.72472131 0.090415999 0.64821291 -0.75886959 0.062745206
		 0.0096910028 -0.76888633 0.63931209 0.022763075 -0.80480301 0.59310538 0.391835 -0.72205901
		 0.57017201 0.391835 -0.72205901 0.57017201 0.022763075 -0.80480301 0.59310538 0.41665173
		 -0.74148256 0.52593243 0.44340107 -0.89237684 0.084017992 0.74379373 -0.66658401
		 0.04936171 0.42978662 -0.84429204 0.32008505 0.42978662 -0.84429204 0.32008505 0.74379373
		 -0.66658401 0.04936171 0.73281074 -0.64050424 0.22965774 0.44819206 -0.89387316 -0.010710707
		 0.21331783 -0.97568089 -0.050421182 0.42855948 -0.82762933 0.36244506 0.42855948
		 -0.82762933 0.36244506 0.21331783 -0.97568089 -0.050421182 0.1624411 -0.93307263
		 0.32091793 -0.74127632 -0.46019942 -0.48859584 -0.3364042 -0.62996179 -0.69998598
		 -0.72829878 -0.59829605 -0.3340998 -0.72829878 -0.59829605 -0.3340998 -0.3364042
		 -0.62996179 -0.69998598 -0.33820435 -0.80303121 -0.49067163 -0.77927482 -0.60622829
		 -0.15880199 -0.8810299 -0.46884376 -0.063022435 -0.77202576 -0.6290518 -0.090939701
		 -0.77202576 -0.6290518 -0.090939701 -0.8810299 -0.46884376 -0.063022435 -0.86711419
		 -0.49382347 -0.065202512 -0.66674429 -0.70133001 0.25216717 -0.66991252 -0.64588416
		 0.36612967 -0.84318101 -0.50984794 0.17058967 -0.84318101 -0.50984794 0.17058967
		 -0.66991252 -0.64588416 0.36612967 -0.85478699 -0.45962551 0.24100544 -0.54202789
		 -0.83049709 -0.12837587 -0.52199394 -0.82231838 0.22652781 -0.27770972 -0.95375407
		 -0.11502393 -0.27770972 -0.95375407 -0.11502393 -0.52199394 -0.82231838 0.22652781
		 -0.29188693 -0.91357374 0.28316966 -0.98640817 -0.018608412 -0.16325642 -0.98868454
		 -0.064504348 -0.13543282 -0.99174976 0.018404676 -0.12686089 -0.99174976 0.018404676
		 -0.12686089 -0.98868454 -0.064504348 -0.13543282 -0.99455869 -0.019491998 -0.10233814
		 0.01057572 0.73238289 -0.68081093 -0.38275144 0.67897731 -0.62649113 0.0051630624
		 0.76245844 -0.64701664 0.0051630624 0.76245844 -0.64701664 -0.38275144 0.67897731
		 -0.62649113 -0.37362751 0.7054376 -0.60229582 -0.30444002 -0.58477902 0.75189739
		 -0.043621261 -0.61468589 0.78756487 -0.29238617 -0.7137385 0.63646495 -0.29238617
		 -0.7137385 0.63646495 -0.043621261 -0.61468589 0.78756487 -0.044924513 -0.73209339
		 0.67972136 0.95327145 0.1485182 -0.26308912 0.94822347 0.17536439 -0.26480111 0.99213576
		 -0.088875271 -0.088135086 0.99213576 -0.088875271 -0.088135086 0.94822347 0.17536439
		 -0.26480111 0.99366605 -0.076975398 -0.081869029 -0.74127632 -0.46019942 -0.48859584
		 -0.72829878 -0.59829605 -0.3340998 -0.92047763 -0.2551837 -0.29597667 -0.92047763
		 -0.2551837 -0.29597667 -0.72829878 -0.59829605 -0.3340998 -0.91407585 -0.35735875
		 -0.19172904 0.69916707 -0.65848303 0.27850592 0.66046876 -0.74906677 0.051768582
		 0.42855948 -0.82762933 0.36244506 0.42855948 -0.82762933 0.36244506 0.66046876 -0.74906677
		 0.051768582 0.44819206 -0.89387316 -0.010710707 0.02864201 0.30136704 -0.95307791
		 0.014954747 0.49889234 -0.86653495 0.45709223 0.27158695 -0.84693992 0.45709223 0.27158695
		 -0.84693992 0.014954747 0.49889234 -0.86653495 0.42708302 0.45469457 -0.78157085;
	setAttr ".n[7968:8133]" -type "float3"  0.7812252 -0.51439792 0.35366929 0.605304
		 -0.58354694 0.5413686 0.81184357 -0.49291548 0.31296062 0.81184357 -0.49291548 0.31296062
		 0.605304 -0.58354694 0.5413686 0.66899717 -0.58427984 0.45941254 0.53478605 -0.18802212
		 -0.82380313 0.80168015 -0.1433944 -0.58029908 0.53863394 -0.39507368 -0.74417084
		 0.53863394 -0.39507368 -0.74417084 0.80168015 -0.1433944 -0.58029908 0.81836426 -0.27305993
		 -0.50568587 -0.41306844 0.83266687 -0.36883649 -0.42743999 0.82819861 -0.36246678
		 -0.4969826 0.79852229 -0.33966228 0.09811414 0.99425793 -0.042717364 0.10047233 0.99080729
		 -0.090588324 0.097048432 0.99433506 -0.043352004 0.097048432 0.99433506 -0.043352004
		 0.10047233 0.99080729 -0.090588324 0.10102354 0.99077535 -0.090324454 0.99385732
		 -0.044407714 -0.10136847 0.93838298 -0.32069081 0.12882055 0.99455112 -0.061164558
		 -0.084421247 0.99455112 -0.061164558 -0.084421247 0.93838298 -0.32069081 0.12882055
		 0.94532084 -0.30246815 0.12198975 -0.33500862 0.3051841 -0.89142126 -0.65161461 0.27763927
		 -0.70591414 -0.38540682 0.48070183 -0.78764671 -0.38540682 0.48070183 -0.78764671
		 -0.65161461 0.27763927 -0.70591414 -0.68152291 0.39510205 -0.61597145 0.75190932
		 -0.64099795 0.15412341 0.71078163 -0.70237446 -0.038205586 0.79853934 -0.5934661
		 0.10066207 0.79853934 -0.5934661 0.10066207 0.71078163 -0.70237446 -0.038205586 0.72668976
		 -0.68118644 -0.088921554 0.79075313 0.39577124 -0.46698463 0.84246284 0.3289614 -0.4266623
		 0.74836844 0.18324494 -0.63746846 0.74836844 0.18324494 -0.63746846 0.84246284 0.3289614
		 -0.4266623 0.79434162 0.11472113 -0.59654039 0.77749598 -0.49843588 0.38348624 0.75190932
		 -0.64099795 0.15412341 0.84117335 -0.4305473 0.32719478 0.84117335 -0.4305473 0.32719478
		 0.75190932 -0.64099795 0.15412341 0.79853934 -0.5934661 0.10066207 0.99760145 0.060670413
		 0.033323776 0.99611503 -0.026723288 0.08390899 0.97736859 -0.14100708 -0.15769473
		 0.97736859 -0.14100708 -0.15769473 0.99611503 -0.026723288 0.08390899 0.96778452
		 -0.22675686 -0.10942759 0.84246284 0.3289614 -0.4266623 0.79075313 0.39577124 -0.46698463
		 0.82323724 0.52408963 -0.21819825 0.82323724 0.52408963 -0.21819825 0.79075313 0.39577124
		 -0.46698463 0.76876318 0.58771336 -0.25218275 0.34963721 0.67372322 -0.65103829 0.33656943
		 0.85112244 -0.40287921 0.45675501 0.63459867 -0.62342548 0.45675501 0.63459867 -0.62342548
		 0.33656943 0.85112244 -0.40287921 0.43954647 0.81383955 -0.38008425 0.77749598 -0.49843588
		 0.38348624 0.76262301 -0.33768654 0.55170095 0.71351361 -0.54620427 0.43881565 0.71351361
		 -0.54620427 0.43881565 0.76262301 -0.33768654 0.55170095 0.69413286 -0.40319315 0.59633458
		 0.85919809 -0.48444107 0.16460696 0.85921848 -0.50882035 0.053342801 0.95242596 -0.30469197
		 -0.0068982346 0.95242596 -0.30469197 -0.0068982346 0.85921848 -0.50882035 0.053342801
		 0.88996571 -0.44654852 -0.092495658 -0.89113146 0.25189599 -0.3774032 -0.83608097
		 0.043210939 -0.54690164 -0.92472762 0.1789021 -0.33596557 -0.92472762 0.1789021 -0.33596557
		 -0.83608097 0.043210939 -0.54690164 -0.86290985 -0.02891545 -0.50453001 -0.99611503
		 -0.026723308 0.083909132 -0.96778458 -0.22675689 -0.10942706 -0.98604625 -0.10706042
		 0.12747897 -0.98604625 -0.10706042 0.12747897 -0.96778458 -0.22675689 -0.10942706
		 -0.94941574 -0.30610654 -0.070060946 -0.91529262 0.37830672 -0.13828768 -0.92472762
		 0.1789021 -0.33596557 -0.95036978 0.29702014 -0.092608355 -0.95036978 0.29702014
		 -0.092608355 -0.92472762 0.1789021 -0.33596557 -0.95328736 0.096820898 -0.28612736
		 -0.55454308 0.58676451 -0.59007573 -0.64400381 0.52878296 -0.55285406 -0.53344887
		 0.768664 -0.35297024 -0.53344887 0.768664 -0.35297024 -0.64400381 0.52878296 -0.55285406
		 -0.61965829 0.71474427 -0.32429034 -0.71377647 -0.54512227 0.43973276 -0.64296454
		 -0.5810802 0.49894121 -0.69413269 -0.40319318 0.5963347 -0.69413269 -0.40319318 0.5963347
		 -0.64296454 -0.5810802 0.49894121 -0.61370909 -0.45667976 0.64405334 0.54972237 -0.78133655
		 -0.295497 0.49723831 -0.84923148 -0.17765106 0.75529945 -0.63782752 -0.15066114 0.75529945
		 -0.63782752 -0.15066114 0.49723831 -0.84923148 -0.17765106 0.71623492 -0.69401139
		 -0.073182829 -0.24072877 -0.49322212 0.8359316 -0.218674 -0.43946049 0.87123829 -0.3444958
		 -0.49623245 0.79691654 -0.3444958 -0.49623245 0.79691654 -0.218674 -0.43946049 0.87123829
		 -0.32263929 -0.43072468 0.84284049 -0.74619621 0.66526979 -0.024643697 -0.67144448
		 0.73605633 0.085926555 -0.69126981 0.72096562 -0.048524126 -0.69126981 0.72096562
		 -0.048524126 -0.67144448 0.73605633 0.085926555 -0.61290234 0.78715676 0.06881085
		 -0.8258009 -0.25954971 0.50068641 -0.76262319 -0.33768669 0.55170059 -0.80175674
		 -0.15959474 0.57594758 -0.80175674 -0.15959474 0.57594758 -0.76262319 -0.33768669
		 0.55170059 -0.74743193 -0.2455506 0.61729276 0.29520696 0.94529289 -0.13883157 0.26381335
		 0.96451396 0.010739088 0.38407043 0.91507351 -0.12300577 0.38407043 0.91507351 -0.12300577
		 0.26381335 0.96451396 0.010739088 0.33875218 0.94062066 0.021902727 0.95988935 0.14305149
		 0.24114031 0.95433259 0.23017307 0.190446 0.91455412 0.24283938 0.32344982 0.91455412
		 0.24283938 0.32344982 0.95433259 0.23017307 0.190446 0.90259784 0.33155322 0.2745716
		 0.82580101 -0.25954992 0.50068605 0.80175674 -0.15959506 0.57594752 0.76262301 -0.33768654
		 0.55170095 0.76262301 -0.33768654 0.55170095 0.80175674 -0.15959506 0.57594752 0.74743199
		 -0.24555066 0.61729276 -0.32743379 0.69310868 0.64217401 -0.33520973 0.66561973 0.66677195
		 -0.32710695 0.69093621 0.6446768 -0.32710695 0.69093621 0.6446768 -0.33520973 0.66561973
		 0.66677195 -0.33442259 0.66352415 0.6692512 -0.24902312 0.43473467 0.86544394 -0.22044605
		 0.41777027 0.88140315 -0.24575466 0.43451297 0.86648899 -0.24575466 0.43451297 0.86648899
		 -0.22044605 0.41777027 0.88140315 -0.21762472 0.41820118 0.88189977 6.1800687e-10
		 0.87078965 0.4916558;
	setAttr ".n[8134:8299]" -type "float3"  -6.5211564e-10 0.8681522 0.49629802 -0.029479792
		 0.86287451 0.50455773 -0.029479792 0.86287451 0.50455773 -6.5211564e-10 0.8681522
		 0.49629802 -0.030203188 0.86249089 0.50517046 0.31555271 0.51544052 0.79671043 0.31416574
		 0.51417923 0.7980724 0.30428547 0.49247494 0.81540102 0.30428547 0.49247494 0.81540102
		 0.31416574 0.51417923 0.7980724 0.30355439 0.4916546 0.81616819 0.11502025 0.86024946
		 0.49673048 0.11467726 0.86273003 0.49248967 0.1509596 0.8582601 0.49051076 0.1509596
		 0.8582601 0.49051076 0.11467726 0.86273003 0.49248967 0.15370195 0.85866535 0.48894733
		 -0.71310717 0.60654432 -0.35154256 -0.71044743 0.60859865 -0.35337245 -0.71192688
		 0.61515325 -0.33874276 -0.71192688 0.61515325 -0.33874276 -0.71044743 0.60859865
		 -0.35337245 -0.7034108 0.62330443 -0.3416208 0.89223802 -0.18060999 -0.41387355 0.8923229
		 -0.25754091 -0.37071893 0.8235386 -0.29291645 -0.48578197 0.8235386 -0.29291645 -0.48578197
		 0.8923229 -0.25754091 -0.37071893 0.81875205 -0.36172491 -0.44587016 -3.6526138e-09
		 0.50518793 -0.86300939 0.11524539 0.48986074 -0.86414987 -1.4083836e-09 0.36224294
		 -0.93208373 -1.4083836e-09 0.36224294 -0.93208373 0.11524539 0.48986074 -0.86414987
		 0.11613956 0.34341037 -0.93197691 -0.89232278 -0.25754094 -0.37071919 -0.81875181
		 -0.36172512 -0.44587043 -0.88227212 -0.33192644 -0.33379745 -0.88227212 -0.33192644
		 -0.33379745 -0.81875181 -0.36172512 -0.44587043 -0.80618274 -0.42576846 -0.41084126
		 -0.30740851 0.30223018 -0.90230644 -0.33128217 0.44750169 -0.83065897 -0.20785081
		 0.33230326 -0.91998512 -0.20785081 0.33230326 -0.91998512 -0.33128217 0.44750169
		 -0.83065897 -0.22208382 0.47460511 -0.85172105 -0.23851517 -0.82499856 0.51233572
		 -0.35312429 -0.79541498 0.49256295 -0.2305261 -0.82578707 0.51471686 -0.2305261 -0.82578707
		 0.51471686 -0.35312429 -0.79541498 0.49256295 -0.33985928 -0.79776627 0.49806088
		 0.65264249 -0.63557798 0.41242996 0.65819585 -0.63280165 0.40784827 0.5853762 -0.68597502
		 0.43217239 0.5853762 -0.68597502 0.43217239 0.65819585 -0.63280165 0.40784827 0.5602262
		 -0.70292634 0.438225 0.98431444 0.17459159 0.025354717 0.97633159 0.21588723 -0.01301077
		 0.99369061 0.088797055 0.068512991 0.99369061 0.088797055 0.068512991 0.97633159
		 0.21588723 -0.01301077 0.99171531 0.12469342 0.030859886 -0.46464884 -0.31858966
		 -0.82619739 -0.46644002 -0.31340149 -0.8271718 -0.48216528 -0.33646578 -0.80889273
		 -0.48216528 -0.33646578 -0.80889273 -0.46644002 -0.31340149 -0.8271718 -0.48336327
		 -0.33645484 -0.80818194 -0.43774295 -0.77958691 -0.44791225 -0.4752849 -0.74442452
		 -0.46897376 -0.43977752 -0.77848542 -0.447835 -0.43977752 -0.77848542 -0.447835 -0.4752849
		 -0.74442452 -0.46897376 -0.47748464 -0.74552083 -0.46498072 0.17668915 -0.92028058
		 -0.34909105 0.17829098 -0.91847205 -0.35301757 0.23512602 -0.89620292 -0.37621278
		 0.23512602 -0.89620292 -0.37621278 0.17829098 -0.91847205 -0.35301757 0.23716074
		 -0.89561933 -0.37632531 0.59781921 -0.4886483 -0.63548017 0.59050184 -0.48748872
		 -0.64316589 0.57056242 -0.45061237 -0.68659091 0.57056242 -0.45061237 -0.68659091
		 0.59050184 -0.48748872 -0.64316589 0.56423956 -0.44840088 -0.69323182 -0.31457791
		 -0.61584848 0.72233742 -0.00034282292 -0.68230063 0.73107165 -0.30158725 -0.61487603
		 0.72867864 -0.30158725 -0.61487603 0.72867864 -0.00034282292 -0.68230063 0.73107165
		 0.00031369008 -0.68952036 0.72426623 -0.57511753 -0.81711262 0.039582022 -0.59836185
		 -0.7026462 0.38503423 -0.5751313 -0.81610006 0.056609854 -0.5751313 -0.81610006 0.056609854
		 -0.59836185 -0.7026462 0.38503423 -0.59490943 -0.69914359 0.39658672 -0.84827763
		 -0.13669483 -0.51160491 -0.83275515 -0.20973356 -0.5123775 -0.73321784 -0.44885704
		 -0.51080227 -0.73321784 -0.44885704 -0.51080227 -0.83275515 -0.20973356 -0.5123775
		 -0.7168414 -0.49226522 -0.49377456 -0.21057875 -0.97165477 -0.10744102 -0.21894304
		 -0.96970546 -0.1083296 -0.37645343 -0.92337024 -0.075300537 -0.37645343 -0.92337024
		 -0.075300537 -0.21894304 -0.96970546 -0.1083296 -0.3927016 -0.91642118 -0.077185832
		 0.72815764 -0.57819343 0.36807442 0.41665173 -0.74148256 0.52593243 0.73861933 -0.59579629
		 0.31538579 0.73861933 -0.59579629 0.31538579 0.41665173 -0.74148256 0.52593243 0.4253405
		 -0.78144211 0.45654538 0.44340107 -0.89237684 0.084017992 0.035208944 -0.99446833
		 0.098959707 0.43165109 -0.88671279 -0.16558304 0.43165109 -0.88671279 -0.16558304
		 0.035208944 -0.99446833 0.098959707 0.053536456 -0.97797751 -0.20172703 -0.33709374
		 -0.62744665 0.70191061 -0.61167496 -0.55709314 0.5616948 -0.38070709 -0.67710155
		 0.62975836 -0.38070709 -0.67710155 0.62975836 -0.61167496 -0.55709314 0.5616948 -0.67842782
		 -0.54016006 0.49795863 -0.85077262 -0.52461046 0.031141339 -0.84318101 -0.50984794
		 0.17058967 -0.92805707 -0.37237456 0.0068738195 -0.92805707 -0.37237456 0.0068738195
		 -0.84318101 -0.50984794 0.17058967 -0.93836027 -0.33586019 0.081718937 0.061020445
		 0.99757224 0.033558425 0.092685223 0.99569547 -5.4998807e-05 0.06166118 0.99751633
		 0.034045137 0.06166118 0.99751633 0.034045137 0.092685223 0.99569547 -5.4998807e-05
		 0.092627555 0.99570084 -1.7648745e-05 -0.72316688 -0.60477269 0.3335861 -0.73730987
		 -0.66395348 0.12465921 -0.87653941 -0.46207604 0.1347755 -0.87653941 -0.46207604
		 0.1347755 -0.73730987 -0.66395348 0.12465921 -0.86099923 -0.50851738 0.0095073199
		 -0.99259633 0.05307449 -0.10925005 -0.99726993 0.0090507055 -0.073285475 -0.99300951
		 0.064716294 -0.098710999 -0.99300951 0.064716294 -0.098710999 -0.99726993 0.0090507055
		 -0.073285475 -0.99845052 0.017415494 -0.05285177 -0.85478699 -0.45962551 0.24100544
		 -0.86690909 -0.40894362 0.28501546 -0.94800043 -0.29165193 0.12741399 -0.94800043
		 -0.29165193 0.12741399 -0.86690909 -0.40894362 0.28501546 -0.95247233 -0.25448704
		 0.16742986 0.048498362 0.026742736 -0.99846518 0.02864201 0.30136704 -0.95307791
		 0.52018863 0.015460366 -0.85391146 0.52018863 0.015460366 -0.85391146 0.02864201
		 0.30136704 -0.95307791;
	setAttr ".n[8300:8465]" -type "float3"  0.45709223 0.27158695 -0.84693992 0.80045074
		 0.44189459 -0.40497869 0.81080323 0.41160041 -0.41615283 0.57174337 0.63146019 -0.52380115
		 0.57174337 0.63146019 -0.52380115 0.81080323 0.41160041 -0.41615283 0.58405626 0.61048996
		 -0.53495818 0.010605128 0.66258413 -0.74891239 0.01057572 0.73238289 -0.68081093
		 0.40434167 0.60560542 -0.68538302 0.40434167 0.60560542 -0.68538302 0.01057572 0.73238289
		 -0.68081093 0.38063785 0.67287791 -0.63431078 -0.31457058 0.87103868 -0.37727579
		 -0.42743999 0.82819861 -0.36246678 -0.33319247 0.86045909 -0.38547754 -0.33319247
		 0.86045909 -0.38547754 -0.42743999 0.82819861 -0.36246678 -0.41306844 0.83266687
		 -0.36883649 0.049208559 0.99728262 0.05482614 0.04919932 0.99727869 0.054906093 0.06166118
		 0.99751633 0.034045137 0.06166118 0.99751633 0.034045137 0.04919932 0.99727869 0.054906093
		 0.061020445 0.99757224 0.033558425 -0.38540682 0.48070183 -0.78764671 -0.68152291
		 0.39510205 -0.61597145 -0.38260716 0.61384785 -0.69050896 -0.38260716 0.61384785
		 -0.69050896 -0.68152291 0.39510205 -0.61597145 -0.67833167 0.49581343 -0.5422501
		 0.42708302 0.45469457 -0.78157085 0.40434167 0.60560542 -0.68538302 0.68197066 0.37910682
		 -0.62545508 0.68197066 0.37910682 -0.62545508 0.40434167 0.60560542 -0.68538302 0.6723485
		 0.4826518 -0.56124395 0.84142154 -0.53691816 0.06106282 0.75190514 -0.64638531 -0.1297098
		 0.88484609 -0.46572685 0.012076274 0.88484609 -0.46572685 0.012076274 0.75190514
		 -0.64638531 -0.1297098 0.78628999 -0.59350193 -0.171766 0.64400381 0.52878302 -0.55285406
		 0.71985048 0.46630287 -0.51417601 0.61313552 0.31114647 -0.72612166 0.61313552 0.31114647
		 -0.72612166 0.71985048 0.46630287 -0.51417601 0.68394983 0.24827453 -0.68598282 0.84117335
		 -0.4305473 0.32719478 0.79853934 -0.5934661 0.10066207 0.88838303 -0.36353129 0.28039363
		 0.88838303 -0.36353129 0.28039363 0.79853934 -0.5934661 0.10066207 0.84142154 -0.53691816
		 0.06106282 0.99039871 0.13805851 -0.0070874756 0.99760145 0.060670413 0.033323776
		 0.9782964 -0.062963068 -0.19741279 0.9782964 -0.062963068 -0.19741279 0.99760145
		 0.060670413 0.033323776 0.97736859 -0.14100708 -0.15769473 0.89113158 0.25189582
		 -0.37740296 0.84246284 0.3289614 -0.4266623 0.87622839 0.44893649 -0.17515661 0.87622839
		 0.44893649 -0.17515661 0.84246284 0.3289614 -0.4266623 0.82323724 0.52408963 -0.21819825
		 0.23498093 0.70340776 -0.67082155 0.22692254 0.87896758 -0.41943067 0.34963721 0.67372322
		 -0.65103829 0.34963721 0.67372322 -0.65103829 0.22692254 0.87896758 -0.41943067 0.33656943
		 0.85112244 -0.40287921 0.50122488 -0.60252964 0.62107295 0.44400099 -0.49979246 0.74368715
		 0.4174799 -0.58068693 0.69893724 0.4174799 -0.58068693 0.69893724 0.44400099 -0.49979246
		 0.74368715 0.3444958 -0.49623245 0.79691654 -0.75190932 -0.64099783 0.1541238 -0.7985394
		 -0.5934661 0.10066183 -0.71078157 -0.70237446 -0.038205367 -0.71078157 -0.70237446
		 -0.038205367 -0.7985394 -0.5934661 0.10066183 -0.72668993 -0.68118626 -0.088921688
		 -0.7907533 0.39577127 -0.46698427 -0.74836832 0.18324523 -0.63746846 -0.84246266
		 0.32896164 -0.42666247 -0.84246266 0.32896164 -0.42666247 -0.74836832 0.18324523
		 -0.63746846 -0.79434162 0.11472136 -0.59654039 -0.77749598 -0.498436 0.38348609 -0.84117317
		 -0.43054742 0.32719505 -0.75190932 -0.64099783 0.1541238 -0.75190932 -0.64099783
		 0.1541238 -0.84117317 -0.43054742 0.32719505 -0.7985394 -0.5934661 0.10066183 -0.99760145
		 0.060670424 0.033323545 -0.97736865 -0.14100714 -0.15769419 -0.99611503 -0.026723308
		 0.083909132 -0.99611503 -0.026723308 0.083909132 -0.97736865 -0.14100714 -0.15769419
		 -0.96778458 -0.22675689 -0.10942706 -0.84246266 0.32896164 -0.42666247 -0.82323712
		 0.52408975 -0.21819857 -0.7907533 0.39577127 -0.46698427 -0.7907533 0.39577127 -0.46698427
		 -0.82323712 0.52408975 -0.21819857 -0.76876324 0.58771342 -0.25218257 -0.34963697
		 0.67372322 -0.65103847 -0.4567548 0.63459885 -0.62342554 -0.33656952 0.85112232 -0.40287942
		 -0.33656952 0.85112232 -0.40287942 -0.4567548 0.63459885 -0.62342554 -0.4395465 0.8138395
		 -0.38008437 -0.69413269 -0.40319318 0.5963347 -0.76262319 -0.33768669 0.55170059
		 -0.71377647 -0.54512227 0.43973276 -0.71377647 -0.54512227 0.43973276 -0.76262319
		 -0.33768669 0.55170059 -0.77749598 -0.498436 0.38348609 0.93838298 -0.32069081 0.12882055
		 0.99385732 -0.044407714 -0.10136847 0.93083125 -0.34618571 0.11708372 0.93083125
		 -0.34618571 0.11708372 0.99385732 -0.044407714 -0.10136847 0.99225181 -0.032287393
		 -0.11997435 -0.61370909 -0.45667976 0.64405334 -0.52595329 -0.4911319 0.69437927
		 -0.5889678 -0.38176891 0.71229869 -0.5889678 -0.38176891 0.71229869 -0.52595329 -0.4911319
		 0.69437927 -0.49116701 -0.41527027 0.76570594 -0.73119545 0.67256457 0.11406217 -0.80272067
		 0.59628236 0.0093241446 -0.77474153 0.61663949 0.13975419 -0.77474153 0.61663949
		 0.13975419 -0.80272067 0.59628236 0.0093241446 -0.84507138 0.53322715 0.03902752
		 0.12955745 -0.47123605 0.87243992 0.24072877 -0.49322236 0.83593142 0.11445728 -0.44038436
		 0.89048368 0.11445728 -0.44038436 0.89048368 0.24072877 -0.49322236 0.83593142 0.21867406
		 -0.43946084 0.87123811 0.38407043 0.91507351 -0.12300577 0.33875218 0.94062066 0.021902727
		 0.46586853 0.87810957 -0.10904182 0.46586853 0.87810957 -0.10904182 0.33875218 0.94062066
		 0.021902727 0.40155089 0.91504091 0.038170327 0.93962836 -0.020910287 0.34155723
		 0.95585531 0.067680299 0.2859371 0.90266615 0.080931105 0.42266291 0.90266615 0.080931105
		 0.42266291 0.95585531 0.067680299 0.2859371 0.9142158 0.17089504 0.36742944 0.2957164
		 0.80126756 -0.5201174 0.336622 0.78737897 -0.51644945 0.42177019 0.75874835 -0.49639788
		 0.42177019 0.75874835 -0.49639788 0.336622 0.78737897 -0.51644945 0.45606256 0.74945855
		 -0.47991541 -0.34061921 0.63711923 0.69141716 -0.3411406 0.61318523 0.71247947 -0.33979046
		 0.63587093 0.69297224;
	setAttr ".n[8466:8631]" -type "float3"  -0.33979046 0.63587093 0.69297224 -0.3411406
		 0.61318523 0.71247947 -0.34032527 0.61168218 0.71415937 -0.1954039 0.40759307 0.89201188
		 -0.16913258 0.39655685 0.90229529 -0.19352563 0.40794137 0.8922621 -0.19352563 0.40794137
		 0.8922621 -0.16913258 0.39655685 0.90229529 -0.16850318 0.39656407 0.90240991 0.29548475
		 0.74379599 0.59954679 0.29588619 0.74259478 0.60083634 0.31197703 0.72111118 0.61860251
		 0.31197703 0.72111118 0.61860251 0.29588619 0.74259478 0.60083634 0.31270665 0.71885163
		 0.6208598 0.29118222 0.47289532 0.83161467 0.28941929 0.47179914 0.83285177 0.27110609
		 0.4506627 0.850532 0.27110609 0.4506627 0.850532 0.28941929 0.47179914 0.83285177
		 0.26879522 0.45038098 0.8514142 0.19400939 0.84487212 0.49854937 0.19711208 0.84324664
		 0.50008196 0.23147784 0.82549328 0.51476103 0.23147784 0.82549328 0.51476103 0.19711208
		 0.84324664 0.50008196 0.23185752 0.8235057 0.51776487 0.86290973 -0.028915389 -0.50453019
		 0.88492739 -0.10372999 -0.45403042 0.80402255 -0.14282681 -0.57718992 0.80402255
		 -0.14282681 -0.57718992 0.88492739 -0.10372999 -0.45403042 0.82191366 -0.21510129
		 -0.52743661 0.28122997 0.95654869 -0.076969527 0.22170463 0.97056782 -0.094048455
		 0.27601728 0.95801836 -0.077558026 0.27601728 0.95801836 -0.077558026 0.22170463
		 0.97056782 -0.094048455 0.22109844 0.97065252 -0.094599843 -0.89223808 -0.18061014
		 -0.41387334 -0.82353824 -0.29291677 -0.48578241 -0.89232278 -0.25754094 -0.37071919
		 -0.89232278 -0.25754094 -0.37071919 -0.82353824 -0.29291677 -0.48578241 -0.81875181
		 -0.36172512 -0.44587043 -0.11613957 0.34341073 -0.93197674 -0.11524539 0.48986095
		 -0.86414969 -1.4083836e-09 0.36224294 -0.93208373 -1.4083836e-09 0.36224294 -0.93208373
		 -0.11524539 0.48986095 -0.86414969 -3.6526138e-09 0.50518793 -0.86300939 -0.50827122
		 -0.72902346 0.45845962 -0.56022608 -0.7029261 0.43822554 -0.58537602 -0.68597525
		 0.43217221 -0.97633153 0.21588755 -0.01301176 -0.95390373 0.29560938 -0.051795207
		 -0.98431438 0.17459179 0.025355186 -0.98431438 0.17459179 0.025355186 -0.95390373
		 0.29560938 -0.051795207 -0.96307296 0.26830584 -0.022416137 0.46244329 -0.75534153
		 0.46433327 0.43342936 -0.76325685 0.47914296 0.5602262 -0.70292634 0.438225 0.5602262
		 -0.70292634 0.438225 0.43342936 -0.76325685 0.47914296 0.50827134 -0.7290231 0.45845997
		 0.89666325 0.42552501 -0.12216194 0.92648244 0.36668327 -0.08469779 0.93051976 0.35952348
		 -0.069826998 -0.5379439 -0.38301003 -0.75094587 -0.51137507 -0.36146855 -0.77963841
		 -0.53397948 -0.38281325 -0.75387001 -0.53397948 -0.38281325 -0.75387001 -0.51137507
		 -0.36146855 -0.77963841 -0.50906092 -0.3596341 -0.78199762 -0.35376933 -0.84988517
		 -0.39056686 -0.39671072 -0.82033861 -0.41190436 -0.35585928 -0.850133 -0.38812113
		 -0.35585928 -0.850133 -0.38812113 -0.39671072 -0.82033861 -0.41190436 -0.39743474
		 -0.81896943 -0.41392598 0.29681993 -0.87354052 -0.38577825 0.29842263 -0.87544656
		 -0.3801806 0.3537696 -0.84988523 -0.39056647 0.3537696 -0.84988523 -0.39056647 0.29842263
		 -0.87544656 -0.3801806 0.35585943 -0.85013306 -0.38812092 0.55265284 -0.41289157
		 -0.72394437 0.55059034 -0.41213372 -0.72594494 0.53794384 -0.38301039 -0.75094575
		 0.53794384 -0.38301039 -0.75094575 0.55059034 -0.41213372 -0.72594494 0.5339784 -0.38281298
		 -0.7538709 -0.16858619 -0.4895359 0.85553098 4.3214975e-05 -0.4849695 0.87453103
		 -0.12957968 -0.47134644 0.87237698 -0.12957968 -0.47134644 0.87237698 4.3214975e-05
		 -0.4849695 0.87453103 -1.9906951e-05 -0.46412241 0.8857711 -0.4337998 0.37651876
		 0.81856662 -0.64683652 0.20140633 0.73555285 -0.4766866 0.34924915 0.80671859 -0.4766866
		 0.34924915 0.80671859 -0.64683652 0.20140633 0.73555285 -0.68440616 0.15793434 0.71178997
		 -0.51865786 -0.77787167 -0.35483754 -0.53029341 -0.79814941 -0.28591332 -0.51830542
		 -0.77796841 -0.35514036 -0.51830542 -0.77796841 -0.35514036 -0.53029341 -0.79814941
		 -0.28591332 -0.52983224 -0.79857737 -0.28557315 0.50122029 0.3280544 0.80072373 0.57241267
		 0.27098668 0.77389276 0.71794385 0.11222038 0.6869958 0.71794385 0.11222038 0.6869958
		 0.57241267 0.27098668 0.77389276 0.73908877 0.084054291 0.66834319 0.49031594 -0.87075925
		 -0.036995079 0.64821291 -0.75886959 0.062745206 0.51479602 -0.85696727 -0.024335688
		 0.51479602 -0.85696727 -0.024335688 0.64821291 -0.75886959 0.062745206 0.68308413
		 -0.72472131 0.090415999 0.41665173 -0.74148256 0.52593243 0.022763075 -0.80480301
		 0.59310538 0.4253405 -0.78144211 0.45654538 0.4253405 -0.78144211 0.45654538 0.022763075
		 -0.80480301 0.59310538 0.032404736 -0.85560393 0.51661581 0.96419519 0.074526288
		 -0.25450623 0.9874559 -0.11463584 -0.10857955 0.96157086 0.0059225257 -0.27449298
		 0.96157086 0.0059225257 -0.27449298 0.9874559 -0.11463584 -0.10857955 0.9748649 -0.16152059
		 -0.15345861 -0.7299282 -0.31120253 -0.60857034 -0.74127632 -0.46019942 -0.48859584
		 -0.91797256 -0.17251985 -0.35716003 -0.91797256 -0.17251985 -0.35716003 -0.74127632
		 -0.46019942 -0.48859584 -0.92047763 -0.2551837 -0.29597667 -0.77927482 -0.60622829
		 -0.15880199 -0.77202576 -0.6290518 -0.090939701 -0.55469638 -0.79980075 -0.22941385
		 -0.55469638 -0.79980075 -0.22941385 -0.77202576 -0.6290518 -0.090939701 -0.54202789
		 -0.83049709 -0.12837587 -0.70267147 -0.70893914 0.060481738 -0.66674429 -0.70133001
		 0.25216717 -0.85077262 -0.52461046 0.031141339 -0.85077262 -0.52461046 0.031141339
		 -0.66674429 -0.70133001 0.25216717 -0.84318101 -0.50984794 0.17058967 -0.37514684
		 -0.91056329 -0.17360695 -0.39331985 -0.91465795 0.093275592 -0.72701013 -0.67494905
		 -0.12609559 -0.72701013 -0.67494905 -0.12609559 -0.39331985 -0.91465795 0.093275592
		 -0.70267147 -0.70893914 0.060481738 -0.27770972 -0.95375407 -0.11502393 -0.29188693
		 -0.91357374 0.28316966 -0.0092711216 -0.99634093 -0.084963664 -0.0092711216 -0.99634093
		 -0.084963664 -0.29188693 -0.91357374 0.28316966 -0.034750782 -0.95857573 0.28271008
		 -0.67467684 0.55009466 -0.49214536;
	setAttr ".n[8632:8797]" -type "float3"  -0.88974154 0.33450446 -0.31059104 -0.66993523
		 0.55959487 -0.48789385 -0.66993523 0.55959487 -0.48789385 -0.88974154 0.33450446
		 -0.31059104 -0.88261151 0.35036644 -0.31343305 -0.86690909 -0.40894362 0.28501546
		 -0.86953312 -0.37816122 0.31765753 -0.95247233 -0.25448704 0.16742986 -0.95247233
		 -0.25448704 0.16742986 -0.86953312 -0.37816122 0.31765753 -0.9527114 -0.23152786
		 0.19681422 0.063669272 -0.20758377 -0.976143 0.048498362 0.026742736 -0.99846518
		 0.53478605 -0.18802212 -0.82380313 0.53478605 -0.18802212 -0.82380313 0.048498362
		 0.026742736 -0.99846518 0.52018863 0.015460366 -0.85391146 -0.034750782 -0.95857573
		 0.28271008 0.1624411 -0.93307263 0.32091793 -0.0092711216 -0.99634093 -0.084963664
		 -0.0092711216 -0.99634093 -0.084963664 0.1624411 -0.93307263 0.32091793 0.21331783
		 -0.97568089 -0.050421182 0.01057572 0.73238289 -0.68081093 0.0051630624 0.76245844
		 -0.64701664 0.38063785 0.67287791 -0.63431078 0.38063785 0.67287791 -0.63431078 0.0051630624
		 0.76245844 -0.64701664 0.35205185 0.70722651 -0.6130988 -0.034354188 0.99675709 0.072767153
		 -0.034512252 0.99672753 0.073097005 -0.049199522 0.99727863 0.054906111 -0.049199522
		 0.99727863 0.054906111 -0.034512252 0.99672753 0.073097005 -0.049208779 0.99728262
		 0.054826129 0.034354277 0.99675715 0.072766773 0.04919932 0.99727869 0.054906093
		 0.03451227 0.99672753 0.073096506 0.03451227 0.99672753 0.073096506 0.04919932 0.99727869
		 0.054906093 0.049208559 0.99728262 0.05482614 0.35205185 0.70722651 -0.6130988 0.32588497
		 0.72924906 -0.60166001 0.61394888 0.57949507 -0.53595918 0.61394888 0.57949507 -0.53595918
		 0.32588497 0.72924906 -0.60166001 0.58405626 0.61048996 -0.53495818 0.33319232 0.86045927
		 -0.38547722 0.31457061 0.87103879 -0.37727538 0.16060381 0.90573794 -0.39223114 0.16060381
		 0.90573794 -0.39223114 0.31457061 0.87103879 -0.37727538 0.14413276 0.91121817 -0.38588491
		 0.88484609 -0.46572685 0.012076274 0.78628999 -0.59350193 -0.171766 0.91979563 -0.39163819
		 -0.024403272 0.91979563 -0.39163819 -0.024403272 0.78628999 -0.59350193 -0.171766
		 0.81282449 -0.54455101 -0.20683452 0.71985048 0.46630287 -0.51417601 0.79075313 0.39577124
		 -0.46698463 0.68394983 0.24827453 -0.68598282 0.68394983 0.24827453 -0.68598282 0.79075313
		 0.39577124 -0.46698463 0.74836844 0.18324494 -0.63746846 0.91375619 -0.098637827
		 0.39410689 0.87230206 -0.18841383 0.4512088 0.93309426 -0.27843961 0.22761048 0.93309426
		 -0.27843961 0.22761048 0.87230206 -0.18841383 0.4512088 0.88838303 -0.36353129 0.28039363
		 0.97362667 0.2217422 -0.05367988 0.95036972 0.29702017 -0.092608824 0.91577828 0.38634938
		 0.10992865 0.91577828 0.38634938 0.10992865 0.95036972 0.29702017 -0.092608824 0.88634229
		 0.45655909 0.077143863 0.69677722 0.65538889 -0.29149094 0.61965823 0.71474433 -0.32429045
		 0.61820269 0.78266305 -0.072553277 0.61820269 0.78266305 -0.072553277 0.61965823
		 0.71474433 -0.32429045 0.54572439 0.83303255 -0.090783723 0.11578536 0.89565569 -0.42941198
		 0.10468805 0.98155522 -0.15996785 0.22692254 0.87896758 -0.41943067 0.22692254 0.87896758
		 -0.41943067 0.10468805 0.98155522 -0.15996785 0.19862846 0.96809608 -0.15276378 0.94532084
		 -0.30246815 0.12198975 0.7812252 -0.51439792 0.35366929 0.94770986 -0.29965261 0.10979202
		 0.94770986 -0.29965261 0.10979202 0.7812252 -0.51439792 0.35366929 0.81184357 -0.49291548
		 0.31296062 -0.7985394 -0.5934661 0.10066183 -0.84142148 -0.53691828 0.061062895 -0.72668993
		 -0.68118626 -0.088921688 -0.72668993 -0.68118626 -0.088921688 -0.84142148 -0.53691828
		 0.061062895 -0.75190514 -0.64638537 -0.12970968 -0.84246266 0.32896164 -0.42666247
		 -0.79434162 0.11472136 -0.59654039 -0.89113146 0.25189599 -0.3774032 -0.89113146
		 0.25189599 -0.3774032 -0.79434162 0.11472136 -0.59654039 -0.83608097 0.043210939
		 -0.54690164 -0.88838315 -0.36353132 0.28039333 -0.84117317 -0.43054742 0.32719505
		 -0.87230206 -0.18841381 0.4512088 -0.87230206 -0.18841381 0.4512088 -0.84117317 -0.43054742
		 0.32719505 -0.8258009 -0.25954971 0.50068641 -0.94045085 0.30391511 0.1522755 -0.99039871
		 0.13805851 -0.0070875781 -0.95433265 0.23017305 0.19044563 -0.95433265 0.23017305
		 0.19044563 -0.99039871 0.13805851 -0.0070875781 -0.99760145 0.060670424 0.033323545
		 -0.87622833 0.44893658 -0.17515676 -0.80272067 0.59628236 0.0093241446 -0.82323712
		 0.52408975 -0.21819857 -0.82323712 0.52408975 -0.21819857 -0.80272067 0.59628236
		 0.0093241446 -0.74619621 0.66526979 -0.024643697 -0.22692274 0.87896758 -0.41943064
		 -0.33656952 0.85112232 -0.40287942 -0.19862905 0.96809596 -0.15276375 -0.19862905
		 0.96809596 -0.15276375 -0.33656952 0.85112232 -0.40287942 -0.29520726 0.94529283
		 -0.13883141 -0.71377647 -0.54512227 0.43973276 -0.77749598 -0.498436 0.38348609 -0.71574968
		 -0.66269231 0.22032075 -0.71574968 -0.66269231 0.22032075 -0.77749598 -0.498436 0.38348609
		 -0.75190932 -0.64099783 0.1541238 0.93083125 -0.34618571 0.11708372 0.99225181 -0.032287393
		 -0.11997435 0.92035902 -0.37694597 0.10416847 0.92035902 -0.37694597 0.10416847 0.99225181
		 -0.032287393 -0.11997435 0.98937279 -0.03184282 -0.14187141 -0.52595329 -0.4911319
		 0.69437927 -0.44400093 -0.49979264 0.74368709 -0.49116701 -0.41527027 0.76570594
		 -0.49116701 -0.41527027 0.76570594 -0.44400093 -0.49979264 0.74368709 -0.39614168
		 -0.43828055 0.80683452 -0.94045085 0.30391511 0.1522755 -0.88359052 0.4029333 0.2385636
		 -0.91577828 0.38634938 0.1099285 -0.91577828 0.38634938 0.1099285 -0.88359052 0.4029333
		 0.2385636 -0.85202986 0.48356512 0.20052405 -1.9906951e-05 -0.46412241 0.8857711
		 0.12955745 -0.47123605 0.87243992 3.6723953e-09 -0.44563508 0.89521468 3.6723953e-09
		 -0.44563508 0.89521468 0.12955745 -0.47123605 0.87243992 0.11445728 -0.44038436 0.89048368
		 0.6912697 0.7209658 -0.048524193 0.61820269 0.78266305 -0.072553277 0.6129024 0.7871567
		 0.068810761 0.91375619 -0.098637827 0.39410689 0.93962836 -0.020910287 0.34155723;
	setAttr ".n[8798:8963]" -type "float3"  0.87990433 0.0073255389 0.47509438 0.87990433
		 0.0073255389 0.47509438 0.93962836 -0.020910287 0.34155723 0.90266615 0.080931105
		 0.42266291 0.42177019 0.75874835 -0.49639788 0.45606256 0.74945855 -0.47991541 0.52341425
		 0.72123277 -0.45371887 0.52341425 0.72123277 -0.45371887 0.45606256 0.74945855 -0.47991541
		 0.61358994 0.68688977 -0.3894738 -0.3411406 0.61318523 0.71247947 -0.34018767 0.58482325
		 0.73637909 -0.34032527 0.61168218 0.71415937 -0.34032527 0.61168218 0.71415937 -0.34018767
		 0.58482325 0.73637909 -0.33917072 0.58358961 0.73782539 -0.14204992 0.38666168 0.91121596
		 -0.11235453 0.37527892 0.92007726 -0.14234002 0.38636595 0.91129613 -0.14234002 0.38636595
		 0.91129613 -0.11235453 0.37527892 0.92007726 -0.112881 0.37554491 0.91990429 0.31197703
		 0.72111118 0.61860251 0.31270665 0.71885163 0.6208598 0.32743424 0.69310963 0.64217275
		 0.32743424 0.69310963 0.64217275 0.31270665 0.71885163 0.6208598 0.32710731 0.69093674
		 0.64467603 0.2204455 0.4177703 0.88140333 0.21762443 0.41820142 0.88189977 0.19540413
		 0.40759248 0.89201212 0.19540413 0.40759248 0.89201212 0.21762443 0.41820142 0.88189977
		 0.19352606 0.40794095 0.89226222 0 0.36081392 0.93263781 0.041193504 0.36156121 0.93143791
		 8.5700911e-08 0.36071479 0.9326762 8.5700911e-08 0.36071479 0.9326762 0.041193504
		 0.36156121 0.93143791 0.041504882 0.36149424 0.93145007 0.74836844 0.18324494 -0.63746846
		 0.79434162 0.11472113 -0.59654039 0.70336324 0.058660399 -0.70840603 0.70336324 0.058660399
		 -0.70840603 0.79434162 0.11472113 -0.59654039 0.7446934 -0.0094307875 -0.66734004
		 -0.80402195 -0.14282677 -0.57719076 -0.86290985 -0.02891545 -0.50453001 -0.7812379
		 -0.073283188 -0.61991686 -0.7812379 -0.073283188 -0.61991686 -0.86290985 -0.02891545
		 -0.50453001 -0.83608097 0.043210939 -0.54690164 -0.46244287 -0.75534159 0.46433359
		 -0.56022608 -0.7029261 0.43822554 -0.43342894 -0.76325703 0.47914305 -0.43342894
		 -0.76325703 0.47914305 -0.56022608 -0.7029261 0.43822554 -0.50827122 -0.72902346
		 0.45845962 0.5853762 -0.68597502 0.43217239 0.5602262 -0.70292634 0.438225 0.50827134
		 -0.7290231 0.45845997 0.88672912 0.44609696 -0.1212803 0.87074733 0.46904624 -0.14763044
		 0.93051976 0.35952348 -0.069826998 0.93051976 0.35952348 -0.069826998 0.87074733
		 0.46904624 -0.14763044 0.89666325 0.42552501 -0.12216194 -0.55265272 -0.41289163
		 -0.72394443 -0.5379439 -0.38301003 -0.75094587 -0.55059057 -0.41213393 -0.7259447
		 -0.55059057 -0.41213393 -0.7259447 -0.5379439 -0.38301003 -0.75094587 -0.53397948
		 -0.38281325 -0.75387001 -0.29681978 -0.87354064 -0.38577819 -0.35376933 -0.84988517
		 -0.39056686 -0.29842237 -0.87544674 -0.38018033 -0.29842237 -0.87544674 -0.38018033
		 -0.35376933 -0.84988517 -0.39056686 -0.35585928 -0.850133 -0.38812113 0.3537696 -0.84988523
		 -0.39056647 0.35585943 -0.85013306 -0.38812092 0.39671078 -0.82033885 -0.41190383
		 0.39671078 -0.82033885 -0.41190383 0.35585943 -0.85013306 -0.38812092 0.39743471
		 -0.81896949 -0.41392595 0.50905997 -0.35963398 -0.78199834 0.51137477 -0.3614687
		 -0.77963853 0.5339784 -0.38281298 -0.7538709 0.5339784 -0.38281298 -0.7538709 0.51137477
		 -0.3614687 -0.77963853 0.53794384 -0.38301039 -0.75094575 -0.78256196 -0.43312281
		 0.4472152 -0.59563684 -0.57091284 0.56504452 -0.72316688 -0.60477269 0.3335861 -0.68891954
		 -0.40973327 0.59792012 -0.67687756 -0.42175564 0.60329008 -0.70094502 -0.38806212
		 0.59840107 -0.70094502 -0.38806212 0.59840107 -0.67687756 -0.42175564 0.60329008
		 -0.66622055 -0.43346632 0.60684198 -0.4766866 0.34924915 0.80671859 -0.29722872 0.44836178
		 0.84298682 -0.4337998 0.37651876 0.81856662 -0.4337998 0.37651876 0.81856662 -0.29722872
		 0.44836178 0.84298682 -0.24525651 0.46928447 0.84830499 -0.53369033 -0.76362509 -0.36338878
		 -0.51865786 -0.77787167 -0.35483754 -0.52585727 -0.76661444 -0.36847854 -0.52585727
		 -0.76661444 -0.36847854 -0.51865786 -0.77787167 -0.35483754 -0.51830542 -0.77796841
		 -0.35514036 0.2972286 0.44836187 0.84298682 0.24525645 0.46928442 0.84830505 0.12696664
		 0.50559783 0.85337579 0.12696664 0.50559783 0.85337579 0.24525645 0.46928442 0.84830505
		 0.11350168 0.50804555 0.85381913 3.720225e-09 -0.99086541 -0.1348543 0.21057878 -0.97165477
		 -0.10744124 1.008353e-08 -0.99134809 -0.13125917 1.008353e-08 -0.99134809 -0.13125917
		 0.21057878 -0.97165477 -0.10744124 0.21894319 -0.9697054 -0.1083298 0.42978662 -0.84429204
		 0.32008505 0.73281074 -0.64050424 0.22965774 0.4253405 -0.78144211 0.45654538 0.4253405
		 -0.78144211 0.45654538 0.73281074 -0.64050424 0.22965774 0.73861933 -0.59579629 0.31538579
		 0.5273779 -0.57616562 -0.62442428 0.53863394 -0.39507368 -0.74417084 0.81417054 -0.39761481
		 -0.42311803 0.81417054 -0.39761481 -0.42311803 0.53863394 -0.39507368 -0.74417084
		 0.81836426 -0.27305993 -0.50568587 -0.37514684 -0.91056329 -0.17360695 -0.33820435
		 -0.80303121 -0.49067163 0.053536456 -0.97797751 -0.20172703 0.053536456 -0.97797751
		 -0.20172703 -0.33820435 -0.80303121 -0.49067163 0.079354182 -0.84946537 -0.5216431
		 0.45709223 0.27158695 -0.84693992 0.42708302 0.45469457 -0.78157085 0.70814073 0.2359145
		 -0.66549313 0.70814073 0.2359145 -0.66549313 0.42708302 0.45469457 -0.78157085 0.68197066
		 0.37910682 -0.62545508 -0.66991252 -0.64588416 0.36612967 -0.68236667 -0.59323454
		 0.42713988 -0.85478699 -0.45962551 0.24100544 -0.85478699 -0.45962551 0.24100544
		 -0.68236667 -0.59323454 0.42713988 -0.86690909 -0.40894362 0.28501546 -0.99082285
		 -0.13514519 -0.0024256725 -0.99592543 -0.065987624 -0.061466716 -0.98445475 -0.16798913
		 -0.051268566 -0.98445475 -0.16798913 -0.051268566 -0.99592543 -0.065987624 -0.061466716
		 -0.98891973 -0.10389588 -0.1060351 -0.77202576 -0.6290518 -0.090939701 -0.73730987
		 -0.66395348 0.12465921 -0.54202789 -0.83049709 -0.12837587 -0.54202789 -0.83049709
		 -0.12837587 -0.73730987 -0.66395348 0.12465921 -0.52199394 -0.82231838 0.22652781;
	setAttr ".n[8964:9129]" -type "float3"  -0.88985777 -0.44543105 -0.098713525
		 -0.85077262 -0.52461046 0.031141339 -0.95649779 -0.26564014 -0.12061216 -0.95649779
		 -0.26564014 -0.12061216 -0.85077262 -0.52461046 0.031141339 -0.92805707 -0.37237456
		 0.0068738195 -0.94800043 -0.29165193 0.12741399 -0.99082285 -0.13514519 -0.0024256725
		 -0.93836027 -0.33586019 0.081718937 -0.93836027 -0.33586019 0.081718937 -0.99082285
		 -0.13514519 -0.0024256725 -0.98445475 -0.16798913 -0.051268566 0.016132163 -0.9561851
		 -0.29231793 -0.25580376 -0.92671645 -0.27524731 -0.0092711216 -0.99634093 -0.084963664
		 -0.0092711216 -0.99634093 -0.084963664 -0.25580376 -0.92671645 -0.27524731 -0.27770972
		 -0.95375407 -0.11502393 0.96034122 0.11816627 -0.25254992 0.95327145 0.1485182 -0.26308912
		 0.99050325 -0.098636396 -0.095782034 0.99050325 -0.098636396 -0.095782034 0.95327145
		 0.1485182 -0.26308912 0.99213576 -0.088875271 -0.088135086 0.79605806 -0.5959397
		 0.10558139 0.66046876 -0.74906677 0.051768582 0.80086201 -0.57534444 0.16612875 0.80086201
		 -0.57534444 0.16612875 0.66046876 -0.74906677 0.051768582 0.69916707 -0.65848303
		 0.27850592 0.52018863 0.015460366 -0.85391146 0.45709223 0.27158695 -0.84693992 0.78218156
		 0.0097510191 -0.62297428 0.78218156 0.0097510191 -0.62297428 0.45709223 0.27158695
		 -0.84693992 0.70814073 0.2359145 -0.66549313 0.53478605 -0.18802212 -0.82380313 0.52018863
		 0.015460366 -0.85391146 0.80168015 -0.1433944 -0.58029908 0.80168015 -0.1433944 -0.58029908
		 0.52018863 0.015460366 -0.85391146 0.78218156 0.0097510191 -0.62297428 0.10047233
		 0.99080729 -0.090588324 0.14018399 0.98431885 -0.1070743 0.10102354 0.99077535 -0.090324454
		 0.10102354 0.99077535 -0.090324454 0.14018399 0.98431885 -0.1070743 0.13865659 0.98450696
		 -0.1073332 -0.012053722 0.99620962 0.086145997 -0.012159568 0.99622971 0.085898608
		 -0.034354188 0.99675709 0.072767153 -0.034354188 0.99675709 0.072767153 -0.012159568
		 0.99622971 0.085898608 -0.034512252 0.99672753 0.073097005 0.99213576 -0.088875271
		 -0.088135086 0.99366605 -0.076975398 -0.081869029 0.95275867 -0.28984371 0.090783171
		 0.95275867 -0.28984371 0.090783171 0.99366605 -0.076975398 -0.081869029 0.94770986
		 -0.29965261 0.10979202 0.6723485 0.4826518 -0.56124395 0.64610577 0.53980261 -0.53959292
		 0.86179024 0.29454303 -0.41299146 0.86179024 0.29454303 -0.41299146 0.64610577 0.53980261
		 -0.53959292 0.84694433 0.34486905 -0.40466115 0.59551769 0.74356097 -0.3040984 0.58303452
		 0.7539584 -0.3026838 0.55690426 0.76804179 -0.31617942 0.55690426 0.76804179 -0.31617942
		 0.58303452 0.7539584 -0.3026838 0.5239284 0.78465462 -0.33138528 -0.91186607 -0.11888491
		 -0.39289516 -0.95724863 0.0030751403 -0.28925002 -0.88600153 0.0087278998 -0.46360022
		 -0.88600153 0.0087278998 -0.46360022 -0.95724863 0.0030751403 -0.28925002 -0.89197224
		 0.15639158 -0.42417824 0.92472774 0.17890209 -0.33596522 0.95328742 0.096820876 -0.28612733
		 0.86290973 -0.028915389 -0.50453019 0.86290973 -0.028915389 -0.50453019 0.95328742
		 0.096820876 -0.28612733 0.88492739 -0.10372999 -0.45403042 0.84117335 -0.4305473
		 0.32719478 0.82580101 -0.25954992 0.50068605 0.77749598 -0.49843588 0.38348624 0.77749598
		 -0.49843588 0.38348624 0.82580101 -0.25954992 0.50068605 0.76262301 -0.33768654 0.55170095
		 0.99611503 -0.026723288 0.08390899 0.99760145 0.060670413 0.033323776 0.95988935
		 0.14305149 0.24114031 0.95988935 0.14305149 0.24114031 0.99760145 0.060670413 0.033323776
		 0.95433259 0.23017307 0.190446 0.82323724 0.52408963 -0.21819825 0.76876318 0.58771336
		 -0.25218275 0.74619633 0.66526973 -0.024643268 0.74619633 0.66526973 -0.024643268
		 0.76876318 0.58771336 -0.25218275 0.6912697 0.7209658 -0.048524193 0.33656943 0.85112244
		 -0.40287921 0.29520696 0.94529289 -0.13883157 0.43954647 0.81383955 -0.38008425 0.43954647
		 0.81383955 -0.38008425 0.29520696 0.94529289 -0.13883157 0.38407043 0.91507351 -0.12300577
		 0.71521515 -0.66329634 0.22023894 0.71351361 -0.54620427 0.43881565 0.66149753 -0.68423098
		 0.30700004 0.66149753 -0.68423098 0.30700004 0.71351361 -0.54620427 0.43881565 0.64304936
		 -0.58069563 0.49927956 0.86130869 -0.4629555 0.20933108 0.85919809 -0.48444107 0.16460696
		 0.95636612 -0.28819978 0.048007 0.95636612 -0.28819978 0.048007 0.85919809 -0.48444107
		 0.16460696 0.95242596 -0.30469197 -0.0068982346 -0.88974154 0.33450446 -0.31059104
		 -0.9076317 0.26611984 -0.3246305 -0.96690524 0.16734321 -0.19258898 -0.96690524 0.16734321
		 -0.19258898 -0.9076317 0.26611984 -0.3246305 -0.97221839 0.11331404 -0.2048201 -0.96933353
		 0.020001357 -0.24493349 -0.89223808 -0.18061014 -0.41387334 -0.9782964 -0.062963076
		 -0.19741277 -0.9782964 -0.062963076 -0.19741277 -0.89223808 -0.18061014 -0.41387334
		 -0.89232278 -0.25754094 -0.37071919 -0.95988941 0.14305152 0.24114016 -0.99611503
		 -0.026723308 0.083909132 -0.95585525 0.067680299 0.28593716 -0.95585525 0.067680299
		 0.28593716 -0.99611503 -0.026723308 0.083909132 -0.98604625 -0.10706042 0.12747897
		 -0.95036978 0.29702014 -0.092608355 -0.88634223 0.45655921 0.077144049 -0.91529262
		 0.37830672 -0.13828768 -0.91529262 0.37830672 -0.13828768 -0.88634223 0.45655921
		 0.077144049 -0.84507138 0.53322715 0.03902752 -0.53344887 0.768664 -0.35297024 -0.61965829
		 0.71474427 -0.32429034 -0.46586859 0.87810951 -0.10904163 -0.46586859 0.87810951
		 -0.10904163 -0.61965829 0.71474427 -0.32429034 -0.54572451 0.83303243 -0.090783715
		 -3.1035574e-06 -0.93095028 -0.36514589 0.016132163 -0.9561851 -0.29231793 0.28490084
		 -0.89029545 -0.35525417 0.28490084 -0.89029545 -0.35525417 0.016132163 -0.9561851
		 -0.29231793 0.25864512 -0.92851871 -0.26637512 -0.69413269 -0.40319318 0.5963347
		 -0.61370909 -0.45667976 0.64405334 -0.67820299 -0.32044953 0.66132653 -0.67820299
		 -0.32044953 0.66132653 -0.61370909 -0.45667976 0.64405334 -0.5889678 -0.38176891
		 0.71229869 -0.80272067 0.59628236 0.0093241446 -0.73119545 0.67256457 0.11406217
		 -0.74619621 0.66526979 -0.024643697 -0.74619621 0.66526979 -0.024643697;
	setAttr ".n[9130:9295]" -type "float3"  -0.73119545 0.67256457 0.11406217 -0.67144448
		 0.73605633 0.085926555 -0.84353757 -0.080505975 0.53100199 -0.87230206 -0.18841381
		 0.4512088 -0.80175674 -0.15959474 0.57594758 -0.80175674 -0.15959474 0.57594758 -0.87230206
		 -0.18841381 0.4512088 -0.8258009 -0.25954971 0.50068641 0.19862846 0.96809608 -0.15276378
		 0.17865086 0.98390675 -0.0033727451 0.29520696 0.94529289 -0.13883157 0.29520696
		 0.94529289 -0.13883157 0.17865086 0.98390675 -0.0033727451 0.26381335 0.96451396
		 0.010739088 0.95433259 0.23017307 0.190446 0.94045079 0.30391505 0.15227585 0.90259784
		 0.33155322 0.2745716 0.90259784 0.33155322 0.2745716 0.94045079 0.30391505 0.15227585
		 0.88359076 0.40293342 0.23856232 -0.21643715 0.84992361 -0.48040071 -0.095163785
		 0.92400521 -0.37034875 -0.1869642 0.8849932 -0.42641699 -0.1869642 0.8849932 -0.42641699
		 -0.095163785 0.92400521 -0.37034875 -0.07313925 0.93511117 -0.34672436 -0.31197733
		 0.72111118 0.61860228 -0.32743379 0.69310868 0.64217401 -0.3127068 0.71885157 0.6208598
		 -0.3127068 0.71885157 0.6208598 -0.32743379 0.69310868 0.64217401 -0.32710695 0.69093621
		 0.6446768 -0.22044605 0.41777027 0.88140315 -0.1954039 0.40759307 0.89201188 -0.21762472
		 0.41820118 0.88189977 -0.21762472 0.41820118 0.88189977 -0.1954039 0.40759307 0.89201188
		 -0.19352563 0.40794137 0.8922621 0 0.36081392 0.93263781 8.5700911e-08 0.36071479
		 0.9326762 -0.041193329 0.36156088 0.93143803 -0.041193329 0.36156088 0.93143803 8.5700911e-08
		 0.36071479 0.9326762 -0.041504707 0.361494 0.93145019 0.30428547 0.49247494 0.81540102
		 0.30355439 0.4916546 0.81616819 0.29118222 0.47289532 0.83161467 0.29118222 0.47289532
		 0.83161467 0.30355439 0.4916546 0.81616819 0.28941929 0.47179914 0.83285177 0.079947859
		 0.86113447 0.50205153 0.077561542 0.86160022 0.50162667 0.11502025 0.86024946 0.49673048
		 0.11502025 0.86024946 0.49673048 0.077561542 0.86160022 0.50162667 0.11467726 0.86273003
		 0.49248967 0.88492739 -0.10372999 -0.45403042 0.89223802 -0.18060999 -0.41387355
		 0.82191366 -0.21510129 -0.52743661 0.82191366 -0.21510129 -0.52743661 0.89223802
		 -0.18060999 -0.41387355 0.8235386 -0.29291645 -0.48578197 0.11524539 0.48986074 -0.86414987
		 0.22208379 0.47460502 -0.85172111 0.11613956 0.34341037 -0.93197691 0.11613956 0.34341037
		 -0.93197691 0.22208379 0.47460502 -0.85172111 0.20785077 0.33230296 -0.91998523 -0.88227212
		 -0.33192644 -0.33379745 -0.80618274 -0.42576846 -0.41084126 -0.86735314 -0.40589643
		 -0.28800458 -0.86735314 -0.40589643 -0.28800458 -0.80618274 -0.42576846 -0.41084126
		 -0.79089379 -0.4894425 -0.36733231 -0.43430254 0.41366848 -0.80016226 -0.33128217
		 0.44750169 -0.83065897 -0.40731317 0.27633068 -0.87048107 -0.40731317 0.27633068
		 -0.87048107 -0.33128217 0.44750169 -0.83065897 -0.30740851 0.30223018 -0.90230644
		 -0.13018231 -0.84189945 0.52369636 -0.23851517 -0.82499856 0.51233572 -0.12811297
		 -0.84183431 0.52431101 -0.12811297 -0.84183431 0.52431101 -0.23851517 -0.82499856
		 0.51233572 -0.2305261 -0.82578707 0.51471686 -0.40751436 -0.33869639 -0.84806651
		 -0.42018104 -0.29680482 -0.85752833 -0.46464884 -0.31858966 -0.82619739 -0.46464884
		 -0.31858966 -0.82619739 -0.42018104 -0.29680482 -0.85752833 -0.46644002 -0.31340149
		 -0.8271718 -0.4752849 -0.74442452 -0.46897376 -0.50772685 -0.70784688 -0.49108678
		 -0.47748464 -0.74552083 -0.46498072 -0.47748464 -0.74552083 -0.46498072 -0.50772685
		 -0.70784688 -0.49108678 -0.5075776 -0.70706111 -0.49237138 0.12171646 -0.93548667
		 -0.33173761 0.12377691 -0.93460798 -0.33344746 0.17668915 -0.92028058 -0.34909105
		 0.17668915 -0.92028058 -0.34909105 0.12377691 -0.93460798 -0.33344746 0.17829098
		 -0.91847205 -0.35301757 0.60295159 -0.51767623 -0.60700965 0.60614604 -0.518094 -0.60346133
		 0.59781921 -0.4886483 -0.63548017 0.59781921 -0.4886483 -0.63548017 0.60614604 -0.518094
		 -0.60346133 0.59050184 -0.48748872 -0.64316589 0.31441548 -0.61719799 0.72125554
		 0.3023043 -0.61586541 0.72754514 -0.00034282292 -0.68230063 0.73107165 -0.00034282292
		 -0.68230063 0.73107165 0.3023043 -0.61586541 0.72754514 0.00031369008 -0.68952036
		 0.72426623 -0.59836185 -0.7026462 0.38503423 -0.57768112 -0.41161108 0.70488358 -0.59490943
		 -0.69914359 0.39658672 -0.59490943 -0.69914359 0.39658672 -0.57768112 -0.41161108
		 0.70488358 -0.56921959 -0.40738598 0.71416086 -0.88447142 0.1740979 -0.43289754 -0.88670772
		 0.14194137 -0.44000229 -0.84827763 -0.13669483 -0.51160491 -0.84827763 -0.13669483
		 -0.51160491 -0.88670772 0.14194137 -0.44000229 -0.83275515 -0.20973356 -0.5123775
		 -0.51479596 -0.85696727 -0.024335563 -0.49031574 -0.87075937 -0.03699496 -0.3927016
		 -0.91642118 -0.077185832 -0.3927016 -0.91642118 -0.077185832 -0.49031574 -0.87075937
		 -0.03699496 -0.37645343 -0.92337024 -0.075300537 0 -0.84515989 0.53451353 0 -0.84295207
		 0.53798866 0 -0.88055027 0.47395274 0 -0.88055027 0.47395274 0 -0.84295207 0.53798866
		 0 -0.88064158 0.47378308 0 -0.88055027 0.47395274 0 -0.88064158 0.47378308 0 -0.87557888
		 0.48307517 0 -0.87557888 0.48307517 0 -0.88064158 0.47378308 0 -0.8748107 0.48446488
		 0 -0.86066961 0.5091638 0 -0.87557888 0.48307517 0 -0.8613438 0.50802255 0 -0.8613438
		 0.50802255 0 -0.87557888 0.48307517 0 -0.8748107 0.48446488 0 -0.86066961 0.5091638
		 0 -0.8613438 0.50802255 0 -0.80657881 0.59112656 0 0.24779539 0.96881241 0 0.24857074
		 0.96861374 0 0.19757247 0.98028827 0 0.10640408 0.99432296 0 -0.010688237 0.9999429
		 0 0.10790394 0.99416131 0 0.10790394 0.99416131 0 -0.010688237 0.9999429 0.0002814412
		 -0.11450076 0.9934231 0 0.24779539 0.96881241 0 0.10640408 0.99432296;
	setAttr ".n[9296:9461]" -type "float3"  0 0.24857074 0.96861374 0 0.24857074
		 0.96861374 0 0.10640408 0.99432296 0 0.10790394 0.99416131 0.001662273 -0.45680934
		 0.88956308 0.00042272027 -0.2922914 0.95632923 0.00010996064 -0.4603259 0.88774997
		 0.00010996064 -0.4603259 0.88774997 0.00042272027 -0.2922914 0.95632923 0.004957248
		 -0.34693021 0.93787783 0.00042272027 -0.2922914 0.95632923 0.0002814412 -0.11450076
		 0.9934231 0.004957248 -0.34693021 0.93787783 0.004957248 -0.34693021 0.93787783 0.0002814412
		 -0.11450076 0.9934231 0.013620067 -0.22313058 0.97469342 0.0002814412 -0.11450076
		 0.9934231 0 -0.010688237 0.9999429 0.013620067 -0.22313058 0.97469342 0 -0.84515989
		 0.53451353 0 -0.7662155 0.64258367 0 -0.84295207 0.53798866 0 -0.84295207 0.53798866
		 0 -0.7662155 0.64258367 0 -0.76780874 0.64067912 0 -0.7662155 0.64258367 0.00099813403
		 -0.62827343 0.77799195 0 -0.76780874 0.64067912 0 -0.76780874 0.64067912 0.00099813403
		 -0.62827343 0.77799195 0 -0.64480311 0.76434869 -0.97565186 0.11294302 -0.18800886
		 -0.96650428 0.15188582 -0.20688199 -0.99370307 0.070529297 -0.087062441 -0.99370307
		 0.070529297 -0.087062441 -0.96650428 0.15188582 -0.20688199 -0.98362082 0.12265611
		 -0.13208164 -0.98362082 0.12265611 -0.13208164 -0.96650428 0.15188582 -0.20688199
		 -0.98538363 0.11730297 -0.12352782 -0.99900895 0.016343864 -0.041400295 -0.99825782
		 -0.058177676 0.0098317629 -0.9927302 0.039518643 -0.11368838 -0.9927302 0.039518643
		 -0.11368838 -0.99825782 -0.058177676 0.0098317629 -0.99819398 -0.058265794 -0.014626472
		 -0.99370307 0.070529297 -0.087062441 -0.99900895 0.016343864 -0.041400295 -0.97565186
		 0.11294302 -0.18800886 -0.97565186 0.11294302 -0.18800886 -0.99900895 0.016343864
		 -0.041400295 -0.9927302 0.039518643 -0.11368838 -0.95137417 -0.25783339 0.16854995
		 -0.88569969 -0.36514568 0.28671357 -0.92755467 -0.29698923 0.22680318 -0.77108419
		 -0.46336704 0.43671519 -0.80593812 -0.43371964 0.40292811 -0.88569969 -0.36514568
		 0.28671357 -0.88569969 -0.36514568 0.28671357 -0.80593812 -0.43371964 0.40292811
		 -0.92755467 -0.29698923 0.22680318 -0.99825782 -0.058177676 0.0098317629 -0.9861899
		 -0.14722848 0.07585045 -0.99819398 -0.058265794 -0.014626472 -0.99819398 -0.058265794
		 -0.014626472 -0.9861899 -0.14722848 0.07585045 -0.98255378 -0.16394547 0.087806553
		 -0.9861899 -0.14722848 0.07585045 -0.95137417 -0.25783339 0.16854995 -0.98255378
		 -0.16394547 0.087806553 -0.98255378 -0.16394547 0.087806553 -0.95137417 -0.25783339
		 0.16854995 -0.92755467 -0.29698923 0.22680318 -0.77108419 -0.46336704 0.43671519
		 -0.62800616 -0.53386772 0.56620973 -0.80593812 -0.43371964 0.40292811 -0.80593812
		 -0.43371964 0.40292811 -0.62800616 -0.53386772 0.56620973 -0.5696159 -0.54398459
		 0.6161319 -0.36465278 -0.55874795 0.74486846 -0.5696159 -0.54398459 0.6161319 -0.52412891
		 -0.55671656 0.64448082 -0.52412891 -0.55671656 0.64448082 -0.5696159 -0.54398459
		 0.6161319 -0.62800616 -0.53386772 0.56620973 -0.36465278 -0.55874795 0.74486846 -0.52412891
		 -0.55671656 0.64448082 -0.37227005 -0.55790365 0.7417267 0.68791437 -0.68155271 0.24951908
		 0.69390869 -0.61758167 0.37024802 0.80061978 -0.55641729 0.22227867 0.80061978 -0.55641729
		 0.22227867 0.69390869 -0.61758167 0.37024802 0.82382631 -0.4893733 0.28604895 -0.3444958
		 -0.49623245 0.79691654 -0.41738749 -0.58084655 0.69885975 -0.24072877 -0.49322212
		 0.8359316 -0.24072877 -0.49322212 0.8359316 -0.41738749 -0.58084655 0.69885975 -0.30792359
		 -0.52924275 0.79062325 -0.71078157 -0.70237446 -0.038205367 -0.72668993 -0.68118626
		 -0.088921688 -0.70679855 -0.69232178 -0.14534892 -0.70679855 -0.69232178 -0.14534892
		 -0.72668993 -0.68118626 -0.088921688 -0.70020294 -0.68892664 -0.18733911 0.066994667
		 -0.66711468 -0.74193645 -0.3364042 -0.62996179 -0.69998598 0.076087862 -0.46115249
		 -0.88405263 0.076087862 -0.46115249 -0.88405263 -0.3364042 -0.62996179 -0.69998598
		 -0.33076423 -0.41769329 -0.84624308 0.48219365 -0.7564888 -0.44183025 0.079354182
		 -0.84946537 -0.5216431 0.5273779 -0.57616562 -0.62442428 0.5273779 -0.57616562 -0.62442428
		 0.079354182 -0.84946537 -0.5216431 0.066994667 -0.66711468 -0.74193645 -0.9741255
		 -0.14827041 -0.17057365 -0.97058749 -0.082424134 -0.2261994 -0.92047763 -0.2551837
		 -0.29597667 -0.92047763 -0.2551837 -0.29597667 -0.97058749 -0.082424134 -0.2261994
		 -0.91797256 -0.17251985 -0.35716003 -0.95649779 -0.26564014 -0.12061216 -0.97028315
		 -0.18760987 -0.15281723 -0.88985777 -0.44543105 -0.098713525 -0.88985777 -0.44543105
		 -0.098713525 -0.97028315 -0.18760987 -0.15281723 -0.91407585 -0.35735875 -0.19172904
		 0.79264104 -0.51804304 -0.32148349 0.74421799 -0.65492338 -0.13120565 0.48219365
		 -0.7564888 -0.44183025 0.48219365 -0.7564888 -0.44183025 0.74421799 -0.65492338 -0.13120565
		 0.43165109 -0.88671279 -0.16558304 0.99050325 -0.098636396 -0.095782034 0.99213576
		 -0.088875271 -0.088135086 0.95545799 -0.28689316 0.06922663 0.95545799 -0.28689316
		 0.06922663 0.99213576 -0.088875271 -0.088135086 0.95275867 -0.28984371 0.090783171
		 0.86179024 0.29454303 -0.41299146 0.96419519 0.074526288 -0.25450623 0.87014186 0.24288155
		 -0.42879102 0.87014186 0.24288155 -0.42879102 0.96419519 0.074526288 -0.25450623
		 0.96157086 0.0059225257 -0.27449298 0.89806581 0.012964822 -0.43967003 0.96157086
		 0.0059225257 -0.27449298 0.91943806 -0.082366675 -0.38451183 0.79264104 -0.51804304
		 -0.32148349 0.81417054 -0.39761481 -0.42311803 0.93012851 -0.31639799 -0.18642212
		 0.93012851 -0.31639799 -0.18642212 0.81417054 -0.39761481 -0.42311803 0.92902386
		 -0.25379157 -0.26926669 0.95242596 -0.30469197 -0.0068982346 0.93012851 -0.31639799
		 -0.18642212 0.9748649 -0.16152059 -0.15345861 0.9748649 -0.16152059 -0.15345861 0.93012851
		 -0.31639799 -0.18642212 0.92902386 -0.25379157 -0.26926669 0.91943806 -0.082366675
		 -0.38451183 0.93268538 -0.13941853 -0.33265674 0.80168015 -0.1433944 -0.58029908;
	setAttr ".n[9462:9627]" -type "float3"  0.80168015 -0.1433944 -0.58029908 0.93268538
		 -0.13941853 -0.33265674 0.81836426 -0.27305993 -0.50568587 0.91943806 -0.082366675
		 -0.38451183 0.96157086 0.0059225257 -0.27449298 0.93268538 -0.13941853 -0.33265674
		 0.93268538 -0.13941853 -0.33265674 0.96157086 0.0059225257 -0.27449298 0.9748649
		 -0.16152059 -0.15345861 0.87014186 0.24288155 -0.42879102 0.96157086 0.0059225257
		 -0.27449298 0.86301792 0.1582863 -0.4797349 0.86301792 0.1582863 -0.4797349 0.96157086
		 0.0059225257 -0.27449298 0.89806581 0.012964822 -0.43967003 -0.66472489 0.57283485
		 -0.47958425 -0.8875711 0.34191197 -0.30872923 -0.66782451 0.56758571 -0.48151523
		 -0.66782451 0.56758571 -0.48151523 -0.8875711 0.34191197 -0.30872923 -0.8826375 0.32687086
		 -0.33779654 -0.68886167 0.5182839 -0.50680506 -0.50226986 0.60720193 -0.61565471
		 -0.35883802 0.72143924 -0.59225053 -0.35883802 0.72143924 -0.59225053 -0.50226986
		 0.60720193 -0.61565471 -0.21979031 0.77321947 -0.59483093 0.45186505 0.66529441 -0.59430742
		 0.57686752 0.64719594 -0.49835861 0.60513681 0.6211403 -0.4979901 0.69553143 0.56431758
		 -0.44472659 0.75056648 0.54247338 -0.37732294 0.81668323 0.44178563 -0.37128687 -0.62297237
		 0.55108547 -0.5551669 -0.68886167 0.5182839 -0.50680506 -0.79221582 0.36309776 -0.49046317
		 -0.79221582 0.36309776 -0.49046317 -0.68886167 0.5182839 -0.50680506 -0.89207023
		 0.25964049 -0.36986148 -0.8810299 -0.46884376 -0.063022435 -0.91380185 -0.40232408
		 0.055691745 -0.90672559 -0.40019855 0.13300301 -0.90672559 -0.40019855 0.13300301
		 -0.91380185 -0.40232408 0.055691745 -0.9301455 -0.2840606 0.23267767 -0.86711419
		 -0.49382347 -0.065202512 -0.8810299 -0.46884376 -0.063022435 -0.88521045 -0.46502122
		 0.012557453 -0.88521045 -0.46502122 0.012557453 -0.8810299 -0.46884376 -0.063022435
		 -0.90672559 -0.40019855 0.13300301 -0.71574968 -0.66269231 0.22032075 -0.75190932
		 -0.64099783 0.1541238 -0.70695823 -0.70701146 0.018570693 -0.70695823 -0.70701146
		 0.018570693 -0.75190932 -0.64099783 0.1541238 -0.71078157 -0.70237446 -0.038205367
		 -0.64296454 -0.5810802 0.49894121 -0.71377647 -0.54512227 0.43973276 -0.67357516
		 -0.67343462 0.30460188 -0.67357516 -0.67343462 0.30460188 -0.71377647 -0.54512227
		 0.43973276 -0.71574968 -0.66269231 0.22032075 -0.67357516 -0.67343462 0.30460188
		 -0.71574968 -0.66269231 0.22032075 -0.69417828 -0.71369714 0.093557164 -0.69417828
		 -0.71369714 0.093557164 -0.71574968 -0.66269231 0.22032075 -0.70695823 -0.70701146
		 0.018570693 -0.72668993 -0.68118626 -0.088921688 -0.75190514 -0.64638537 -0.12970968
		 -0.70020294 -0.68892664 -0.18733911 -0.70020294 -0.68892664 -0.18733911 -0.75190514
		 -0.64638537 -0.12970968 -0.70816219 -0.66876483 -0.22640654 -0.69417828 -0.71369714
		 0.093557164 -0.70695823 -0.70701146 0.018570693 -0.73042887 -0.68069965 -0.055872288
		 -0.73042887 -0.68069965 -0.055872288 -0.70695823 -0.70701146 0.018570693 -0.70841533
		 -0.70209807 -0.072152399 -0.56593031 -0.60112667 0.56424254 -0.64296454 -0.5810802
		 0.49894121 -0.61875415 -0.67276931 0.40561649 -0.61875415 -0.67276931 0.40561649
		 -0.64296454 -0.5810802 0.49894121 -0.67357516 -0.67343462 0.30460188 -0.75157243
		 -0.65963441 0.0046215109 -0.69417828 -0.71369714 0.093557164 -0.73042887 -0.68069965
		 -0.055872288 -0.30792359 -0.52924275 0.79062325 -0.41738749 -0.58084655 0.69885975
		 -0.42129797 -0.58849984 0.69005507 -0.42129797 -0.58849984 0.69005507 -0.41738749
		 -0.58084655 0.69885975 -0.50392032 -0.61096156 0.61056554 -0.30792359 -0.52924275
		 0.79062325 -0.30101588 -0.55650347 0.77439868 -0.16858619 -0.4895359 0.85553098 -0.50122505
		 -0.6025297 0.62107283 -0.56593031 -0.60112667 0.56424254 -0.56726664 -0.64461851
		 0.51251882 -0.56726664 -0.64461851 0.51251882 -0.56593031 -0.60112667 0.56424254
		 -0.61875415 -0.67276931 0.40561649 -0.56726664 -0.64461851 0.51251882 -0.61875415
		 -0.67276931 0.40561649 -0.68029237 -0.63774472 0.36122558 -0.68029237 -0.63774472
		 0.36122558 -0.61875415 -0.67276931 0.40561649 -0.68389821 -0.69566905 0.21983585
		 -0.68029237 -0.63774472 0.36122558 -0.66948342 -0.57591569 0.46916208 -0.56726664
		 -0.64461851 0.51251882 -0.56726664 -0.64461851 0.51251882 -0.66948342 -0.57591569
		 0.46916208 -0.50392032 -0.61096156 0.61056554 -0.66571611 0.66116691 -0.34594846
		 -0.67432106 0.65689319 -0.33731648 -0.7034108 0.62330443 -0.3416208 -0.7034108 0.62330443
		 -0.3416208 -0.67432106 0.65689319 -0.33731648 -0.71192688 0.61515325 -0.33874276
		 -0.88781506 -0.4541381 -0.074451387 -0.88074434 -0.44626716 -0.15854022 -0.9141947
		 -0.39514223 -0.090059273 -0.9141947 -0.39514223 -0.090059273 -0.88074434 -0.44626716
		 -0.15854022 -0.91907173 -0.34422615 -0.19187368 -0.81391865 -0.56645876 -0.12907723
		 -0.88074434 -0.44626716 -0.15854022 -0.84886909 -0.52644503 -0.047717161 -0.84886909
		 -0.52644503 -0.047717161 -0.88074434 -0.44626716 -0.15854022 -0.88781506 -0.4541381
		 -0.074451387 -0.78623915 -0.61425519 0.06722039 -0.68389821 -0.69566905 0.21983585
		 -0.75157243 -0.65963441 0.0046215109 -0.75157243 -0.65963441 0.0046215109 -0.68389821
		 -0.69566905 0.21983585 -0.69417828 -0.71369714 0.093557164 -0.81391865 -0.56645876
		 -0.12907723 -0.84886909 -0.52644503 -0.047717161 -0.75157243 -0.65963441 0.0046215109
		 -0.75157243 -0.65963441 0.0046215109 -0.84886909 -0.52644503 -0.047717161 -0.78623915
		 -0.61425519 0.06722039 -0.81938154 -0.54549026 -0.1762221 -0.81391865 -0.56645876
		 -0.12907723 -0.73042887 -0.68069965 -0.055872288 -0.73042887 -0.68069965 -0.055872288
		 -0.81391865 -0.56645876 -0.12907723 -0.75157243 -0.65963441 0.0046215109 -0.71044743
		 0.60859865 -0.35337245 -0.71310717 0.60654432 -0.35154256 -0.71414864 0.60475481
		 -0.35251015 -0.71414864 0.60475481 -0.35251015 -0.71310717 0.60654432 -0.35154256
		 -0.71625853 0.60345072 -0.35045815 0.35780936 0.92865992 -0.097791538 0.28122997
		 0.95654869 -0.076969527 0.46809345 0.87671947 -0.11068612 0.46809345 0.87671947 -0.11068612
		 0.28122997 0.95654869 -0.076969527 0.27601728 0.95801836 -0.077558026 -0.79013193
		 -0.59283513 0.1556858;
	setAttr ".n[9628:9793]" -type "float3"  -0.68389821 -0.69566905 0.21983585 -0.78623915
		 -0.61425519 0.06722039 0.83874369 -0.13274075 0.5280993 0.84358191 -0.15269114 0.51483488
		 0.85152197 -0.38648582 0.35431486 0.85152197 -0.38648582 0.35431486 0.84358191 -0.15269114
		 0.51483488 0.849778 -0.38864005 0.35614073 -0.61110395 -0.51976138 0.59699255 -0.68891954
		 -0.40973327 0.59792012 -0.65177745 -0.45854723 0.60408658 -0.65177745 -0.45854723
		 0.60408658 -0.68891954 -0.40973327 0.59792012 -0.70094502 -0.38806212 0.59840107
		 -0.81264901 -0.51394463 0.27470443 -0.90672559 -0.40019855 0.13300301 -0.84187806
		 -0.41726008 0.34225038 -0.84187806 -0.41726008 0.34225038 -0.90672559 -0.40019855
		 0.13300301 -0.9301455 -0.2840606 0.23267767 -0.79013193 -0.59283513 0.1556858 -0.88521045
		 -0.46502122 0.012557453 -0.81264901 -0.51394463 0.27470443 -0.81264901 -0.51394463
		 0.27470443 -0.88521045 -0.46502122 0.012557453 -0.90672559 -0.40019855 0.13300301
		 -0.88521045 -0.46502122 0.012557453 -0.79013193 -0.59283513 0.1556858 -0.84886909
		 -0.52644503 -0.047717161 -0.84886909 -0.52644503 -0.047717161 -0.79013193 -0.59283513
		 0.1556858 -0.78623915 -0.61425519 0.06722039 0.56726664 -0.64461857 0.5125187 0.50122488
		 -0.60252964 0.62107295 0.50449312 -0.61063224 0.61042196 0.50449312 -0.61063224 0.61042196
		 0.50122488 -0.60252964 0.62107295 0.4174799 -0.58068693 0.69893724 0.69390869 -0.61758167
		 0.37024802 0.56726664 -0.64461857 0.5125187 0.64956242 -0.56560254 0.50809693 0.64956242
		 -0.56560254 0.50809693 0.56726664 -0.64461857 0.5125187 0.50449312 -0.61063224 0.61042196
		 0.62648195 -0.67408586 0.39131656 0.56593013 -0.60112673 0.56424266 0.56726664 -0.64461857
		 0.5125187 0.56726664 -0.64461857 0.5125187 0.56593013 -0.60112673 0.56424266 0.50122488
		 -0.60252964 0.62107295 0.68791437 -0.68155271 0.24951908 0.62648195 -0.67408586 0.39131656
		 0.69390869 -0.61758167 0.37024802 0.69390869 -0.61758167 0.37024802 0.62648195 -0.67408586
		 0.39131656 0.56726664 -0.64461857 0.5125187 0.30805421 -0.52883554 0.79084486 0.30161199
		 -0.55574477 0.77471155 0.42194641 -0.58782262 0.69023609 0.16887671 -0.48919937 0.85566622
		 0.30805421 -0.52883554 0.79084486 0.12955745 -0.47123605 0.87243992 0.12955745 -0.47123605
		 0.87243992 0.30805421 -0.52883554 0.79084486 0.24072877 -0.49322236 0.83593142 -0.84345555
		 -0.15000275 0.51583129 -0.79544348 -0.016758094 0.60579604 -0.83982152 -0.13512158
		 0.52577752 -0.83982152 -0.13512158 0.52577752 -0.79544348 -0.016758094 0.60579604
		 -0.78355843 0.0064176577 0.62128496 0.67248189 -0.4191359 0.60999441 0.66486955 -0.4268066
		 0.61301279 0.65694159 -0.42287427 0.62418348 0.65694159 -0.42287427 0.62418348 0.66486955
		 -0.4268066 0.61301279 0.64686763 -0.43477044 0.62652767 0.92056596 -0.37973565 0.091428481
		 0.87525612 -0.47335771 0.099293411 0.90797877 -0.33900374 0.24627426 0.90797877 -0.33900374
		 0.24627426 0.87525612 -0.47335771 0.099293411 0.86808842 -0.44404003 0.22192562 0.87525612
		 -0.47335771 0.099293411 0.85472596 -0.50365257 0.12560892 0.86808842 -0.44404003
		 0.22192562 0.86808842 -0.44404003 0.22192562 0.85472596 -0.50365257 0.12560892 0.86053807
		 -0.48004016 0.17039862 0.85472596 -0.50365257 0.12560892 0.91220772 -0.40779898 0.039712567
		 0.86053807 -0.48004016 0.17039862 0.86053807 -0.48004016 0.17039862 0.91220772 -0.40779898
		 0.039712567 0.87118334 -0.4780964 0.11163983 -0.35638639 0.92904472 -0.099321157
		 -0.47107208 0.87495649 -0.1119919 -0.28197029 0.95635796 -0.076630376 -0.28197029
		 0.95635796 -0.076630376 -0.47107208 0.87495649 -0.1119919 -0.27705577 0.95775622
		 -0.077091351 0.71625888 0.60345107 -0.35045686 0.71342742 0.60620093 -0.35148507
		 0.71414876 0.60465193 -0.35268623 0.71414876 0.60465193 -0.35268623 0.71342742 0.60620093
		 -0.35148507 0.71066809 0.60826373 -0.35350537 0.79711467 -0.60289466 0.033559222
		 0.90957713 -0.40539381 -0.091242857 0.75339526 -0.65675414 -0.032705158 0.75339526
		 -0.65675414 -0.032705158 0.90957713 -0.40539381 -0.091242857 0.92696548 -0.27002645
		 -0.2604242 0.87118334 -0.4780964 0.11163983 0.91220772 -0.40779898 0.039712567 0.90957713
		 -0.40539381 -0.091242857 0.90957713 -0.40539381 -0.091242857 0.91220772 -0.40779898
		 0.039712567 0.94860303 -0.2766856 -0.1536144 0.66149753 -0.68423098 0.30700004 0.64304936
		 -0.58069563 0.49927956 0.62648195 -0.67408586 0.39131656 0.62648195 -0.67408586 0.39131656
		 0.64304936 -0.58069563 0.49927956 0.56593013 -0.60112673 0.56424266 0.68791437 -0.68155271
		 0.24951908 0.70016509 -0.70296383 0.124943 0.62648195 -0.67408586 0.39131656 0.62648195
		 -0.67408586 0.39131656 0.70016509 -0.70296383 0.124943 0.66149753 -0.68423098 0.30700004
		 0.70617557 -0.70771348 0.021393267 0.71521515 -0.66329634 0.22023894 0.70016509 -0.70296383
		 0.124943 0.70016509 -0.70296383 0.124943 0.71521515 -0.66329634 0.22023894 0.66149753
		 -0.68423098 0.30700004 0.70679861 -0.69232184 -0.1453487 0.71078163 -0.70237446 -0.038205586
		 0.70841551 -0.70209795 -0.072152309 0.70841551 -0.70209795 -0.072152309 0.71078163
		 -0.70237446 -0.038205586 0.70617557 -0.70771348 0.021393267 0.68791437 -0.68155271
		 0.24951908 0.77877641 -0.61276221 0.13427515 0.70016509 -0.70296383 0.124943 0.70016509
		 -0.70296383 0.124943 0.77877641 -0.61276221 0.13427515 0.79711467 -0.60289466 0.033559222
		 0.70016509 -0.70296383 0.124943 0.79711467 -0.60289466 0.033559222 0.75339526 -0.65675414
		 -0.032705158 0.95091486 -0.11880712 -0.28573725 0.92696548 -0.27002645 -0.2604242
		 0.94860303 -0.2766856 -0.1536144 0.94860303 -0.2766856 -0.1536144 0.92696548 -0.27002645
		 -0.2604242 0.90957713 -0.40539381 -0.091242857 0.93838298 -0.32069081 0.12882055
		 0.73957157 -0.55123562 0.38622946 0.94532084 -0.30246815 0.12198975 0.94532084 -0.30246815
		 0.12198975 0.73957157 -0.55123562 0.38622946 0.7812252 -0.51439792 0.35366929 0.66899717
		 -0.58427984 0.45941254 0.605304 -0.58354694 0.5413686;
	setAttr ".n[9794:9959]" -type "float3"  0.34780723 -0.70427561 0.61889088 0.34780723
		 -0.70427561 0.61889088 0.605304 -0.58354694 0.5413686 0.29926378 -0.64756119 0.70078933
		 0.70258355 -0.59789497 0.38587296 0.41219616 -0.70674402 0.57498449 0.73957157 -0.55123562
		 0.38622946 0.73957157 -0.55123562 0.38622946 0.41219616 -0.70674402 0.57498449 0.50098377
		 -0.62869781 0.59477252 0.93083125 -0.34618571 0.11708372 0.70258355 -0.59789497 0.38587296
		 0.93838298 -0.32069081 0.12882055 0.93838298 -0.32069081 0.12882055 0.70258355 -0.59789497
		 0.38587296 0.73957157 -0.55123562 0.38622946 0.80061978 -0.55641729 0.22227867 0.77877641
		 -0.61276221 0.13427515 0.68791437 -0.68155271 0.24951908 0.77877641 -0.61276221 0.13427515
		 0.80061978 -0.55641729 0.22227867 0.87118334 -0.4780964 0.11163983 0.87118334 -0.4780964
		 0.11163983 0.80061978 -0.55641729 0.22227867 0.86053807 -0.48004016 0.17039862 0.53850287
		 -0.59634423 0.5953052 0.55841357 -0.57325959 0.59962296 0.6111387 -0.50926143 0.60593915
		 0.6111387 -0.50926143 0.60593915 0.55841357 -0.57325959 0.59962296 0.64138877 -0.4597483
		 0.6142084 0.001662273 -0.45680934 0.88956308 0.00010996064 -0.4603259 0.88774997
		 0.00099813403 -0.62827343 0.77799195 0.00099813403 -0.62827343 0.77799195 0.00010996064
		 -0.4603259 0.88774997 0 -0.64480311 0.76434869 -0.98587775 -0.12583847 -0.11049762
		 -0.96979862 -0.023734571 -0.24274935 -0.98435187 0.0063033937 -0.17610115 -0.98435187
		 0.0063033937 -0.17610115 -0.96979862 -0.023734571 -0.24274935 -0.94987291 0.1108272
		 -0.29233336 -0.94987291 0.1108272 -0.29233336 -0.96979862 -0.023734571 -0.24274935
		 -0.9169172 0.13778298 -0.37453797 -0.9169172 0.13778298 -0.37453797 -0.96979862 -0.023734571
		 -0.24274935 -0.93137014 -0.051763251 -0.36037517 -0.94987291 0.1108272 -0.29233336
		 -0.9169172 0.13778298 -0.37453797 -0.89207023 0.25964049 -0.36986148 -0.89207023
		 0.25964049 -0.36986148 -0.9169172 0.13778298 -0.37453797 -0.79221582 0.36309776 -0.49046317
		 -0.92502838 -0.14334965 -0.35181442 -0.94648951 -0.18457772 -0.26474261 -0.91770685
		 -0.2941469 -0.26700526 -0.91770685 -0.2941469 -0.26700526 -0.94648951 -0.18457772
		 -0.26474261 -0.91907173 -0.34422615 -0.19187368 -0.98587775 -0.12583847 -0.11049762
		 -0.96844184 -0.21371609 -0.12824138 -0.96979862 -0.023734571 -0.24274935 -0.96979862
		 -0.023734571 -0.24274935 -0.96844184 -0.21371609 -0.12824138 -0.94648951 -0.18457772
		 -0.26474261 -0.91907173 -0.34422615 -0.19187368 -0.94648951 -0.18457772 -0.26474261
		 -0.96844184 -0.21371609 -0.12824138 0.8421036 -0.53925997 -0.0077600824 0.79605806
		 -0.5959397 0.10558139 0.87525612 -0.47335771 0.099293411 0.87525612 -0.47335771 0.099293411
		 0.79605806 -0.5959397 0.10558139 0.85472596 -0.50365257 0.12560892 0.88248169 -0.46918821
		 -0.032992579 0.8421036 -0.53925997 -0.0077600824 0.92056596 -0.37973565 0.091428481
		 0.92056596 -0.37973565 0.091428481 0.8421036 -0.53925997 -0.0077600824 0.87525612
		 -0.47335771 0.099293411 0.67226803 -0.43231627 0.60096449 0.66948789 -0.43299505
		 0.60357368 0.67248189 -0.4191359 0.60999441 0.67248189 -0.4191359 0.60999441 0.66948789
		 -0.43299505 0.60357368 0.66486955 -0.4268066 0.61301279 -0.64683652 0.20140633 0.73555285
		 -0.78355843 0.0064176577 0.62128496 -0.68440616 0.15793434 0.71178997 -0.68440616
		 0.15793434 0.71178997 -0.78355843 0.0064176577 0.62128496 -0.79544348 -0.016758094
		 0.60579604 0.94806212 0.035624702 -0.31608409 0.95091486 -0.11880712 -0.28573725
		 0.98052412 -0.14094472 -0.13677351 0.98052412 -0.14094472 -0.13677351 0.95091486
		 -0.11880712 -0.28573725 0.94860303 -0.2766856 -0.1536144 0.93191361 -0.35778713 0.059375178
		 0.98052412 -0.14094472 -0.13677351 0.91220772 -0.40779898 0.039712567 0.91220772
		 -0.40779898 0.039712567 0.98052412 -0.14094472 -0.13677351 0.94860303 -0.2766856
		 -0.1536144 0.80086201 -0.57534444 0.16612875 0.93191361 -0.35778713 0.059375178 0.85472596
		 -0.50365257 0.12560892 0.85472596 -0.50365257 0.12560892 0.93191361 -0.35778713 0.059375178
		 0.91220772 -0.40779898 0.039712567 0.79605806 -0.5959397 0.10558139 0.80086201 -0.57534444
		 0.16612875 0.85472596 -0.50365257 0.12560892 -0.99920672 -0.039429139 0.0055972142
		 -0.99845052 0.017415494 -0.05285177 -0.99884129 -0.042590592 -0.022409128 -0.99884129
		 -0.042590592 -0.022409128 -0.99845052 0.017415494 -0.05285177 -0.99726993 0.0090507055
		 -0.073285475 -0.99884129 -0.042590592 -0.022409128 -0.99726993 0.0090507055 -0.073285475
		 -0.99592543 -0.065987624 -0.061466716 -0.99592543 -0.065987624 -0.061466716 -0.99726993
		 0.0090507055 -0.073285475 -0.99455869 -0.019491998 -0.10233814 -0.99592543 -0.065987624
		 -0.061466716 -0.99455869 -0.019491998 -0.10233814 -0.98891973 -0.10389588 -0.1060351
		 -0.98891973 -0.10389588 -0.1060351 -0.99455869 -0.019491998 -0.10233814 -0.98868454
		 -0.064504348 -0.13543282 -0.99742973 -0.069281936 0.018275481 -0.99765497 0.0039275577
		 -0.068331093 -0.99854934 -0.052945275 0.0098013068 -0.99854934 -0.052945275 0.0098013068
		 -0.99765497 0.0039275577 -0.068331093 -0.99833912 0.010227256 -0.056695357 -0.98891973
		 -0.10389588 -0.1060351 -0.98868454 -0.064504348 -0.13543282 -0.97028315 -0.18760987
		 -0.15281723 -0.97028315 -0.18760987 -0.15281723 -0.98868454 -0.064504348 -0.13543282
		 -0.9741255 -0.14827041 -0.17057365 -0.9613905 0.19663273 -0.19251972 -0.96690524
		 0.16734321 -0.19258898 -0.99300951 0.064716294 -0.098710999 -0.99300951 0.064716294
		 -0.098710999 -0.96690524 0.16734321 -0.19258898 -0.99259633 0.05307449 -0.10925005
		 -0.97221839 0.11331404 -0.2048201 -0.99174976 0.018404676 -0.12686089 -0.96690524
		 0.16734321 -0.19258898 -0.96690524 0.16734321 -0.19258898 -0.99174976 0.018404676
		 -0.12686089 -0.99259633 0.05307449 -0.10925005 -0.9676066 0.064224936 -0.24415694
		 -0.98640817 -0.018608412 -0.16325642 -0.97221839 0.11331404 -0.2048201 -0.97221839
		 0.11331404 -0.2048201 -0.98640817 -0.018608412 -0.16325642 -0.99174976 0.018404676
		 -0.12686089 -0.99005365 0.081190743 -0.11489934 -0.99221611 0.067236632 -0.10481612
		 -0.99765497 0.0039275577 -0.068331093;
	setAttr ".n[9960:10004]" -type "float3"  -0.99765497 0.0039275577 -0.068331093
		 -0.99221611 0.067236632 -0.10481612 -0.99833912 0.010227256 -0.056695357 -0.97058749
		 -0.082424134 -0.2261994 -0.98640817 -0.018608412 -0.16325642 -0.95724863 0.0030751403
		 -0.28925002 -0.95724863 0.0030751403 -0.28925002 -0.98640817 -0.018608412 -0.16325642
		 -0.9676066 0.064224936 -0.24415694 -0.9556306 0.21656448 -0.19967481 -0.94769126
		 0.22303414 -0.22833541 -0.8875711 0.34191197 -0.30872923 -0.61167496 -0.55709314
		 0.5616948 -0.57124817 -0.55763233 0.60226387 -0.79398781 -0.44336423 0.41594645 -0.99221611
		 0.067236632 -0.10481612 -0.99300951 0.064716294 -0.098710999 -0.99833912 0.010227256
		 -0.056695357 -0.99833912 0.010227256 -0.056695357 -0.99300951 0.064716294 -0.098710999
		 -0.99845052 0.017415494 -0.05285177 -0.99854934 -0.052945275 0.0098013068 -0.99833912
		 0.010227256 -0.056695357 -0.99920672 -0.039429139 0.0055972142 -0.99920672 -0.039429139
		 0.0055972142 -0.99833912 0.010227256 -0.056695357 -0.99845052 0.017415494 -0.05285177
		 -0.98849189 -0.10907687 0.10481438 -0.99854934 -0.052945275 0.0098013068 -0.99181116
		 -0.10112387 0.078003936 -0.99181116 -0.10112387 0.078003936 -0.99854934 -0.052945275
		 0.0098013068 -0.99920672 -0.039429139 0.0055972142 -0.95236969 -0.21862268 0.21259385
		 -0.98849189 -0.10907687 0.10481438 -0.9527114 -0.23152786 0.19681422 -0.9527114 -0.23152786
		 0.19681422 -0.98849189 -0.10907687 0.10481438 -0.99181116 -0.10112387 0.078003936
		 -0.9556306 0.21656448 -0.19967481 -0.9613905 0.19663273 -0.19251972 -0.99221611 0.067236632
		 -0.10481612 -0.99221611 0.067236632 -0.10481612 -0.9613905 0.19663273 -0.19251972
		 -0.99300951 0.064716294 -0.098710999;
	setAttr -s 3335 -ch 10005 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces" 
		f 3 0 1 2
		mu 0 3 2 0 1
		f 3 -2 3 4
		mu 0 3 1 0 18
		f 3 5 6 -3
		mu 0 3 1 3 2
		f 3 7 8 9
		mu 0 3 4 5 6
		f 3 -9 10 11
		mu 0 3 6 5 7
		f 3 12 13 14
		mu 0 3 8 4 9
		f 3 -14 -10 15
		mu 0 3 9 4 6
		f 3 16 17 18
		mu 0 3 11 12 10
		f 3 -18 19 20
		mu 0 3 10 12 77
		f 3 21 22 -17
		mu 0 3 11 13 12
		f 3 23 24 25
		mu 0 3 16 14 15
		f 3 -25 26 27
		mu 0 3 15 14 52
		f 3 28 29 -26
		mu 0 3 15 17 16
		f 3 30 31 -5
		mu 0 3 18 19 1
		f 3 -32 32 33
		mu 0 3 1 19 20
		f 3 34 35 -33
		mu 0 3 19 21 20
		f 3 -36 36 37
		mu 0 3 20 21 14
		f 3 -4 38 39
		mu 0 3 18 0 22
		f 3 -39 40 41
		mu 0 3 22 0 8
		f 3 42 43 44
		mu 0 3 23 11 24
		f 3 -44 45 46
		mu 0 3 24 11 25
		f 3 47 48 49
		mu 0 3 26 27 28
		f 3 -49 50 51
		mu 0 3 28 27 29
		f 3 52 53 -50
		mu 0 3 28 30 26
		f 3 -54 54 55
		mu 0 3 26 30 31
		f 3 -45 56 57
		mu 0 3 23 24 32
		f 3 -57 58 59
		mu 0 3 32 24 33
		f 3 60 61 62
		mu 0 3 34 35 36
		f 3 -62 63 64
		mu 0 3 36 35 37
		f 3 65 66 67
		mu 0 3 38 39 40
		f 3 -67 68 69
		mu 0 3 40 39 27
		f 3 70 71 -56
		mu 0 3 31 41 26
		f 3 -72 72 73
		mu 0 3 26 41 42
		f 3 -41 74 -13
		mu 0 3 8 0 4
		f 3 -75 -1 75
		mu 0 3 4 0 2
		f 3 -8 -76 76
		mu 0 3 5 4 2
		f 3 -66 77 78
		mu 0 3 39 38 35
		f 3 -78 79 -64
		mu 0 3 35 38 37
		f 3 -34 80 -6
		mu 0 3 1 20 3
		f 3 -81 81 82
		mu 0 3 3 20 43
		f 3 83 84 -63
		mu 0 3 36 33 34
		f 3 -85 -59 85
		mu 0 3 34 33 24
		f 3 86 87 -58
		mu 0 3 32 44 23
		f 3 -88 88 89
		mu 0 3 23 44 45
		f 3 -43 90 -22
		mu 0 3 11 23 13
		f 3 -91 -90 91
		mu 0 3 13 23 45
		f 3 -70 92 93
		mu 0 3 40 27 42
		f 3 -93 -48 -74
		mu 0 3 42 27 26
		f 3 94 95 -73
		mu 0 3 41 46 42
		f 3 -96 96 97
		mu 0 3 42 46 47
		f 3 98 99 100
		mu 0 3 7 40 47
		f 3 -100 -94 -98
		mu 0 3 47 40 42
		f 3 101 102 -11
		mu 0 3 5 38 7
		f 3 -103 -68 -99
		mu 0 3 7 38 40
		f 3 103 104 -77
		mu 0 3 2 37 5
		f 3 -105 -80 -102
		mu 0 3 5 37 38
		f 3 -65 105 106
		mu 0 3 36 37 3
		f 3 -106 -104 -7
		mu 0 3 3 37 2
		f 3 -83 107 -107
		mu 0 3 3 43 36
		f 3 -108 108 -84
		mu 0 3 36 43 33
		f 3 -60 109 110
		mu 0 3 32 33 16
		f 3 -110 -109 111
		mu 0 3 16 33 43
		f 3 -30 112 -111
		mu 0 3 16 17 32
		f 3 -113 113 -87
		mu 0 3 32 17 44
		f 3 -38 114 -82
		mu 0 3 20 14 43
		f 3 -115 -24 -112
		mu 0 3 43 14 16
		f 3 -16 115 116
		mu 0 3 9 6 48
		f 3 -116 117 118
		mu 0 3 48 6 49
		f 3 -12 119 -118
		mu 0 3 6 7 49
		f 3 -120 -101 120
		mu 0 3 49 7 47
		f 3 121 122 -121
		mu 0 3 47 50 49
		f 3 -123 123 124
		mu 0 3 49 50 51
		f 3 -97 125 -122
		mu 0 3 47 46 50
		f 3 126 -119 -125
		mu 0 3 51 48 49
		f 3 127 -27 -37
		mu 0 3 21 52 14
		f 3 128 129 130
		mu 0 3 55 53 54
		f 3 -130 131 132
		mu 0 3 54 53 75
		f 3 133 134 -131
		mu 0 3 54 56 55
		f 3 -47 135 -86
		mu 0 3 24 25 34
		f 3 -136 136 137
		mu 0 3 34 25 57
		f 3 -69 138 -51
		mu 0 3 27 39 29
		f 3 -139 139 140
		mu 0 3 29 39 58
		f 3 -79 141 -140
		mu 0 3 39 35 58
		f 3 -142 142 143
		mu 0 3 58 35 59
		f 3 -143 144 145
		mu 0 3 59 35 57
		f 3 -145 -61 -138
		mu 0 3 57 35 34
		f 3 146 147 148
		mu 0 3 60 61 62
		f 3 -148 149 150
		mu 0 3 62 61 63
		f 3 151 152 153
		mu 0 3 64 62 65
		f 3 -153 -151 154
		mu 0 3 65 62 63
		f 3 -147 155 156
		mu 0 3 61 60 66
		f 3 -156 157 158
		mu 0 3 66 60 67
		f 3 159 160 -154
		mu 0 3 65 68 64
		f 3 -161 161 162
		mu 0 3 64 68 69
		f 3 163 164 -162
		mu 0 3 68 56 69
		f 3 -165 -134 165
		mu 0 3 69 56 54
		f 3 166 167 168
		mu 0 3 70 57 71
		f 3 -168 -137 169
		mu 0 3 71 57 25
		f 3 170 171 172
		mu 0 3 72 59 70
		f 3 -172 -146 -167
		mu 0 3 70 59 57
		f 3 -144 173 174
		mu 0 3 58 59 73
		f 3 -174 -171 175
		mu 0 3 73 59 72
		f 3 176 177 -175
		mu 0 3 73 74 58
		f 3 -178 178 -141
		mu 0 3 58 74 29
		f 3 179 180 -179
		mu 0 3 74 75 29
		f 3 -181 181 -52
		mu 0 3 29 75 28
		f 3 -53 182 183
		mu 0 3 30 28 76
		f 3 -182 184 -183
		mu 0 3 28 75 76
		f 3 -185 -132 185
		mu 0 3 76 75 53
		f 3 -21 186 187
		mu 0 3 10 77 78
		f 3 -187 188 189
		mu 0 3 78 77 80
		f 3 -170 190 191
		mu 0 3 71 25 10
		f 3 -191 -46 -19
		mu 0 3 10 25 11
		f 3 192 193 194
		mu 0 3 78 79 67
		f 3 -194 195 -159
		mu 0 3 67 79 66
		f 3 -188 196 -192
		mu 0 3 10 78 71
		f 3 -197 -195 197
		mu 0 3 71 78 67
		f 3 198 199 -158
		mu 0 3 60 70 67
		f 3 -200 -169 -198
		mu 0 3 67 70 71
		f 3 200 201 -149
		mu 0 3 62 72 60
		f 3 -202 -173 -199
		mu 0 3 60 72 70
		f 3 -176 202 203
		mu 0 3 73 72 64
		f 3 -203 -201 -152
		mu 0 3 64 72 62
		f 3 -163 204 -204
		mu 0 3 64 69 73
		f 3 -205 205 -177
		mu 0 3 73 69 74
		f 3 -166 206 -206
		mu 0 3 69 54 74
		f 3 -207 -133 -180
		mu 0 3 74 54 75
		f 3 207 -193 -190
		mu 0 3 80 79 78
		f 3 208 209 210
		mu 0 3 81 82 83
		f 3 -210 -135 211
		mu 0 3 83 82 84
		f 3 -212 212 213
		mu 0 3 83 84 85
		f 3 -213 -164 214
		mu 0 3 85 84 86
		f 3 215 216 217
		mu 0 3 87 88 89
		f 3 -217 -155 218
		mu 0 3 89 88 90
		f 3 219 220 221
		mu 0 3 91 92 93
		f 3 -221 -15 222
		mu 0 3 93 92 94
		f 3 223 224 225
		mu 0 3 95 93 96
		f 3 -225 -223 -117
		mu 0 3 96 93 94
		f 3 226 227 228
		mu 0 3 97 98 91
		f 3 -228 -42 -220
		mu 0 3 91 98 92
		f 3 229 230 231
		mu 0 3 99 95 100
		f 3 -231 -226 -127
		mu 0 3 100 95 96
		f 3 232 233 234
		mu 0 3 101 99 102
		f 3 -234 -232 -124
		mu 0 3 102 99 100
		f 3 235 236 237
		mu 0 3 103 89 104
		f 3 -237 -219 -150
		mu 0 3 104 89 90
		f 3 238 239 240
		mu 0 3 105 106 107
		f 3 -240 241 -196
		mu 0 3 107 106 108
		f 3 242 243 244
		mu 0 3 109 105 110
		f 3 -244 -241 -208
		mu 0 3 110 105 107
		f 3 245 246 247
		mu 0 3 111 112 113
		f 3 -247 248 -20
		mu 0 3 113 112 114
		f 3 249 250 251
		mu 0 3 115 111 116
		f 3 -251 -248 -23
		mu 0 3 116 111 113
		f 3 252 253 254
		mu 0 3 117 118 119
		f 3 -254 -114 255
		mu 0 3 119 118 120
		f 3 -256 256 257
		mu 0 3 119 120 121
		f 3 -257 -29 258
		mu 0 3 121 120 122
		f 3 -259 259 260
		mu 0 3 121 122 123
		f 3 -260 -28 261
		mu 0 3 123 122 124
		f 3 262 263 -253
		mu 0 3 117 125 118
		f 3 -264 264 -89
		mu 0 3 118 125 126
		f 3 265 266 267
		mu 0 3 127 128 129
		f 3 -267 -35 268
		mu 0 3 129 128 130
		f 3 269 270 271
		mu 0 3 131 129 132
		f 3 -271 -269 -31
		mu 0 3 132 129 130
		f 3 272 273 -227
		mu 0 3 97 131 98
		f 3 -274 -272 -40
		mu 0 3 98 131 132
		f 3 -262 274 275
		mu 0 3 123 124 127
		f 3 -275 -128 -266
		mu 0 3 127 124 128
		f 3 276 277 -265
		mu 0 3 125 115 126
		f 3 -278 -252 -92
		mu 0 3 126 115 116
		f 3 278 279 280
		mu 0 3 133 134 135
		f 3 -280 -186 281
		mu 0 3 135 134 136
		f 3 282 283 284
		mu 0 3 137 138 133
		f 3 -284 -184 -279
		mu 0 3 133 138 134
		f 3 285 286 287
		mu 0 3 139 101 140
		f 3 -287 -235 -126
		mu 0 3 140 101 102
		f 3 288 289 290
		mu 0 3 141 139 142
		f 3 -290 -288 -95
		mu 0 3 142 139 140
		f 3 -291 291 292
		mu 0 3 141 142 143
		f 3 -292 -71 293
		mu 0 3 143 142 144
		f 3 -294 294 295
		mu 0 3 143 144 137
		f 3 -295 -55 -283
		mu 0 3 137 144 138
		f 3 296 297 298
		mu 0 3 145 146 147
		f 3 -298 299 300
		mu 0 3 147 146 148
		f 3 301 302 303
		mu 0 3 149 150 151
		f 3 -303 304 305
		mu 0 3 151 150 152
		f 3 306 307 308
		mu 0 3 153 154 155
		f 3 -308 309 310
		mu 0 3 155 154 156
		f 3 -301 311 312
		mu 0 3 147 148 157
		f 3 -312 313 314
		mu 0 3 157 148 158
		f 3 315 316 317
		mu 0 3 159 149 160
		f 3 -317 -304 318
		mu 0 3 160 149 151
		f 3 -315 319 320
		mu 0 3 157 158 161
		f 3 -320 321 322
		mu 0 3 161 158 162
		f 3 323 324 -318
		mu 0 3 160 163 159
		f 3 -325 325 326
		mu 0 3 159 163 164
		f 3 327 328 329
		mu 0 3 165 166 162
		f 3 -329 330 -323
		mu 0 3 162 166 161
		f 3 331 332 -326
		mu 0 3 163 167 164
		f 3 -333 333 334
		mu 0 3 164 167 168
		f 3 335 336 337
		mu 0 3 169 170 171
		f 3 -337 338 339
		mu 0 3 171 170 172
		f 3 340 341 -334
		mu 0 3 167 156 168
		f 3 -342 -310 342
		mu 0 3 168 156 154
		f 3 343 344 345
		mu 0 3 173 174 175
		f 3 -345 346 347
		mu 0 3 175 174 179
		f 3 -340 348 349
		mu 0 3 171 172 145
		f 3 -349 350 -297
		mu 0 3 145 172 146
		f 3 -309 351 352
		mu 0 3 153 155 165
		f 3 -352 353 -328
		mu 0 3 165 155 166
		f 3 354 355 -305
		mu 0 3 150 174 152
		f 3 -356 -344 356
		mu 0 3 152 174 173
		f 3 357 358 -336
		mu 0 3 169 176 170
		f 3 -359 359 360
		mu 0 3 170 176 177
		f 3 361 362 -361
		mu 0 3 177 178 170
		f 3 363 364 -347
		mu 0 3 174 180 179
		f 3 -348 365 366
		mu 0 3 175 179 181
		f 3 -366 367 368
		mu 0 3 181 179 182
		f 3 369 370 -300
		mu 0 3 146 183 148
		f 3 -371 371 372
		mu 0 3 148 183 184
		f 3 -369 373 374
		mu 0 3 181 182 185
		f 3 -374 375 376
		mu 0 3 185 182 186
		f 3 -302 377 378
		mu 0 3 150 149 187
		f 3 -378 379 380
		mu 0 3 187 149 188
		f 3 -307 381 382
		mu 0 3 154 153 189
		f 3 -382 383 384
		mu 0 3 189 153 190
		f 3 -373 385 -314
		mu 0 3 148 184 158
		f 3 -386 386 387
		mu 0 3 158 184 191
		f 3 388 389 390
		mu 0 3 192 193 194
		f 3 -390 391 392
		mu 0 3 194 193 195
		f 3 -316 393 -380
		mu 0 3 149 159 188
		f 3 -394 394 395
		mu 0 3 188 159 196
		f 3 396 397 398
		mu 0 3 197 198 199
		f 3 -398 399 400
		mu 0 3 199 198 200
		f 3 -393 401 402
		mu 0 3 194 195 201
		f 3 -402 403 404
		mu 0 3 201 195 202
		f 3 405 406 -360
		mu 0 3 176 197 177
		f 3 -407 -399 407
		mu 0 3 177 197 199
		f 3 -388 408 -322
		mu 0 3 158 191 162
		f 3 -409 409 410
		mu 0 3 162 191 203
		f 3 -377 411 412
		mu 0 3 185 186 204
		f 3 -412 413 414
		mu 0 3 204 186 205
		f 3 -327 415 -395
		mu 0 3 159 164 196
		f 3 -416 416 417
		mu 0 3 196 164 206
		f 3 418 419 420
		mu 0 3 207 208 209
		f 3 -420 421 422
		mu 0 3 209 208 210
		f 3 -415 423 424
		mu 0 3 204 205 192
		f 3 -424 425 -389
		mu 0 3 192 205 193
		f 3 426 427 -422
		mu 0 3 208 211 210
		f 3 -428 428 429
		mu 0 3 210 211 212
		f 3 -405 430 431
		mu 0 3 201 202 213
		f 3 -431 432 433
		mu 0 3 213 202 214
		f 3 434 435 436
		mu 0 3 215 207 216
		f 3 -436 -421 437
		mu 0 3 216 207 209
		f 3 -411 438 -330
		mu 0 3 162 203 165
		f 3 -439 439 440
		mu 0 3 165 203 217
		f 3 -434 441 442
		mu 0 3 213 214 218
		f 3 -442 443 444
		mu 0 3 218 214 219
		f 3 -335 445 -417
		mu 0 3 164 168 206
		f 3 -446 446 447
		mu 0 3 206 168 220
		f 3 448 449 -400
		mu 0 3 198 215 200
		f 3 -450 -437 450
		mu 0 3 200 215 216
		f 3 451 452 -429
		mu 0 3 211 221 212
		f 3 -453 453 454
		mu 0 3 212 221 222
		f 3 -363 455 -339
		mu 0 3 170 178 172
		f 3 -456 456 457
		mu 0 3 172 178 223
		f 3 -343 458 -447
		mu 0 3 168 154 220
		f 3 -459 -383 459
		mu 0 3 220 154 189
		f 3 460 461 -454
		mu 0 3 221 224 222
		f 3 -462 -445 462
		mu 0 3 222 224 225
		f 3 -370 463 464
		mu 0 3 183 146 223
		f 3 -464 -351 -458
		mu 0 3 223 146 172
		f 3 -441 465 -353
		mu 0 3 165 217 153
		f 3 -466 466 -384
		mu 0 3 153 217 190
		f 3 -355 467 -364
		mu 0 3 174 150 180
		f 3 -468 -379 468
		mu 0 3 180 150 187
		f 3 469 470 -249
		mu 0 3 112 109 114
		f 3 -471 -245 -189
		mu 0 3 114 109 110
		f 3 -282 471 472
		mu 0 3 135 136 81
		f 3 -472 -129 -209
		mu 0 3 81 136 82
		f 3 -215 473 474
		mu 0 3 85 86 87
		f 3 -474 -160 -216
		mu 0 3 87 86 88
		f 3 475 476 -242
		mu 0 3 106 103 108
		f 3 -477 -238 -157
		mu 0 3 108 103 104
		f 3 -401 477 478
		mu 0 3 226 227 115
		f 3 -478 479 -250
		mu 0 3 115 227 111
		f 3 -408 480 481
		mu 0 3 228 226 125
		f 3 -481 -479 -277
		mu 0 3 125 226 115
		f 3 -362 482 483
		mu 0 3 229 228 117
		f 3 -483 -482 -263
		mu 0 3 117 228 125
		f 3 -484 484 -457
		mu 0 3 229 117 230
		f 3 -485 -255 485
		mu 0 3 230 117 119
		f 3 -486 486 -465
		mu 0 3 230 119 231
		f 3 -487 -258 487
		mu 0 3 231 119 121
		f 3 -488 488 -372
		mu 0 3 231 121 232
		f 3 -489 -261 489
		mu 0 3 232 121 123
		f 3 -490 490 -387
		mu 0 3 232 123 233
		f 3 -491 -276 491
		mu 0 3 233 123 127
		f 3 -492 492 -410
		mu 0 3 233 127 234
		f 3 -493 -268 493
		mu 0 3 234 127 129
		f 3 -440 494 495
		mu 0 3 235 234 131
		f 3 -495 -494 -270
		mu 0 3 131 234 129
		f 3 -467 496 497
		mu 0 3 236 235 97
		f 3 -497 -496 -273
		mu 0 3 97 235 131
		f 3 -498 498 -385
		mu 0 3 236 97 237
		f 3 -499 -229 499
		mu 0 3 237 97 91
		f 3 -500 500 -460
		mu 0 3 237 91 238
		f 3 -501 -222 501
		mu 0 3 238 91 93
		f 3 -448 502 503
		mu 0 3 239 238 95
		f 3 -503 -502 -224
		mu 0 3 95 238 93
		f 3 -418 504 505
		mu 0 3 240 239 99
		f 3 -505 -504 -230
		mu 0 3 99 239 95
		f 3 -396 506 507
		mu 0 3 241 240 101
		f 3 -507 -506 -233
		mu 0 3 101 240 99
		f 3 -381 508 509
		mu 0 3 242 241 139
		f 3 -509 -508 -286
		mu 0 3 139 241 101
		f 3 -469 510 511
		mu 0 3 243 242 141
		f 3 -511 -510 -289
		mu 0 3 141 242 139
		f 3 -512 512 -365
		mu 0 3 243 141 244
		f 3 -513 -293 513
		mu 0 3 244 141 143
		f 3 -514 514 -368
		mu 0 3 244 143 245
		f 3 -515 -296 515
		mu 0 3 245 143 137
		f 3 -516 516 -376
		mu 0 3 245 137 246
		f 3 -517 -285 517
		mu 0 3 246 137 133
		f 3 -518 518 -414
		mu 0 3 246 133 247
		f 3 -519 -281 519
		mu 0 3 247 133 135
		f 3 520 521 -473
		mu 0 3 81 248 135
		f 3 -522 -426 -520
		mu 0 3 135 248 247
		f 3 -521 522 -392
		mu 0 3 248 81 249
		f 3 -523 -211 523
		mu 0 3 249 81 83
		f 3 -524 524 -404
		mu 0 3 249 83 250
		f 3 -525 -214 525
		mu 0 3 250 83 85
		f 3 -526 526 -433
		mu 0 3 250 85 251
		f 3 -527 -475 527
		mu 0 3 251 85 87
		f 3 -528 528 -444
		mu 0 3 251 87 252
		f 3 -529 -218 529
		mu 0 3 252 87 89
		f 3 -463 530 531
		mu 0 3 253 252 103
		f 3 -531 -530 -236
		mu 0 3 103 252 89
		f 3 -455 532 533
		mu 0 3 254 253 106
		f 3 -533 -532 -476
		mu 0 3 106 253 103
		f 3 -430 534 535
		mu 0 3 255 254 105
		f 3 -535 -534 -239
		mu 0 3 105 254 106
		f 3 -423 536 537
		mu 0 3 256 255 109
		f 3 -537 -536 -243
		mu 0 3 109 255 105
		f 3 -438 538 539
		mu 0 3 257 256 112
		f 3 -539 -538 -470
		mu 0 3 112 256 109
		f 3 -451 540 -480
		mu 0 3 227 257 111
		f 3 -541 -540 -246
		mu 0 3 111 257 112
		f 3 541 542 543
		mu 0 3 258 259 260
		f 3 544 545 546
		mu 0 3 261 262 263
		f 3 547 548 549
		mu 0 3 264 265 266
		f 3 -549 550 551
		mu 0 3 266 265 267
		f 3 552 553 554
		mu 0 3 268 269 270
		f 3 555 556 557
		mu 0 3 271 272 273
		f 3 -557 558 559
		mu 0 3 273 272 274
		f 3 560 561 562
		mu 0 3 275 276 277
		f 3 563 564 565
		mu 0 3 278 274 279
		f 3 -565 566 567
		mu 0 3 279 274 280
		f 3 568 569 -563
		mu 0 3 277 281 275
		f 3 -570 570 571
		mu 0 3 275 281 282
		f 3 -555 572 573
		mu 0 3 268 270 283
		f 3 -573 574 575
		mu 0 3 283 270 263
		f 3 576 577 -546
		mu 0 3 262 284 263
		f 3 -578 578 579
		mu 0 3 263 284 285
		f 3 580 581 582
		mu 0 3 286 287 282
		f 3 -582 583 584
		mu 0 3 282 287 288
		f 3 585 586 -585
		mu 0 3 288 289 282
		f 3 -587 587 588
		mu 0 3 282 289 319
		f 3 -547 589 590
		mu 0 3 261 263 290
		f 3 -590 -575 591
		mu 0 3 290 263 270
		f 3 592 593 594
		mu 0 3 291 270 292
		f 3 -594 595 596
		mu 0 3 292 270 264
		f 3 597 598 599
		mu 0 3 293 294 295
		f 3 -599 600 601
		mu 0 3 295 294 296
		f 3 602 603 604
		mu 0 3 297 298 299
		f 3 -550 605 606
		mu 0 3 264 266 300
		f 3 -597 607 608
		mu 0 3 292 264 301
		f 3 609 610 -593
		mu 0 3 291 302 270
		f 3 -592 611 612
		mu 0 3 290 270 303
		f 3 -612 -611 613
		mu 0 3 303 270 302
		f 3 614 615 616
		mu 0 3 266 304 295
		f 3 -616 617 618
		mu 0 3 295 304 305
		f 3 -552 619 -615
		mu 0 3 266 267 304
		f 3 620 621 622
		mu 0 3 306 293 307
		f 3 -622 -600 623
		mu 0 3 307 293 295
		f 3 624 625 626
		mu 0 3 308 309 306
		f 3 -626 627 -621
		mu 0 3 306 309 293
		f 3 -625 628 629
		mu 0 3 309 308 310
		f 3 630 631 632
		mu 0 3 311 312 313
		f 3 633 634 635
		mu 0 3 314 315 316
		f 3 -572 636 637
		mu 0 3 275 282 317
		f 3 -637 638 639
		mu 0 3 317 282 318
		f 3 640 -639 -589
		mu 0 3 319 318 282
		f 3 641 642 -560
		mu 0 3 274 283 273
		f 3 -643 -576 643
		mu 0 3 273 283 263
		f 3 -642 644 645
		mu 0 3 283 274 320
		f 3 -645 646 647
		mu 0 3 320 274 275
		f 3 -638 648 -648
		mu 0 3 275 317 320
		f 3 649 650 651
		mu 0 3 259 321 322
		f 3 652 653 654
		mu 0 3 323 321 297
		f 3 655 656 657
		mu 0 3 324 325 326
		f 3 -657 658 659
		mu 0 3 326 325 327
		f 3 660 661 662
		mu 0 3 328 329 325
		f 3 -662 663 664
		mu 0 3 325 329 330
		f 3 -659 665 666
		mu 0 3 327 325 331
		f 3 -666 667 668
		mu 0 3 331 325 332
		f 3 669 670 -665
		mu 0 3 330 333 325
		f 3 -671 671 -668
		mu 0 3 325 333 332
		f 3 672 673 674
		mu 0 3 334 335 336
		f 3 -674 675 676
		mu 0 3 336 335 337
		f 3 -632 677 678
		mu 0 3 338 339 340
		f 3 -678 679 680
		mu 0 3 340 339 341
		f 3 -661 681 682
		mu 0 3 342 343 344
		f 3 -682 683 684
		mu 0 3 344 343 345
		f 3 685 686 687
		mu 0 3 348 346 349
		f 3 -687 688 689
		mu 0 3 349 346 347
		f 3 690 691 692
		mu 0 3 352 350 353
		f 3 -692 693 694
		mu 0 3 353 350 351
		f 3 695 696 697
		mu 0 3 356 354 357
		f 3 -697 698 699
		mu 0 3 357 354 355
		f 3 700 701 702
		mu 0 3 358 359 360
		f 3 -702 703 704
		mu 0 3 360 359 361
		f 3 -651 705 706
		mu 0 3 322 321 324
		f 3 -706 707 -656
		mu 0 3 324 321 325
		f 3 708 709 -568
		mu 0 3 362 363 364
		f 3 -710 710 711
		mu 0 3 364 363 365
		f 3 712 713 714
		mu 0 3 366 367 368
		f 3 -714 715 -634
		mu 0 3 368 367 369
		f 3 -655 716 717
		mu 0 3 370 371 372
		f 3 -717 718 719
		mu 0 3 372 371 373
		f 3 720 721 722
		mu 0 3 374 375 376
		f 3 -722 -545 723
		mu 0 3 376 375 377
		f 3 724 725 726
		mu 0 3 380 378 381
		f 3 -726 727 728
		mu 0 3 381 378 379
		f 3 729 730 731
		mu 0 3 384 382 385
		f 3 -731 732 733
		mu 0 3 385 382 383
		f 3 734 735 736
		mu 0 3 388 386 389
		f 3 -736 737 738
		mu 0 3 389 386 387
		f 3 739 740 741
		mu 0 3 390 391 392
		f 3 -741 742 743
		mu 0 3 392 391 393
		f 3 744 745 746
		mu 0 3 394 358 395
		f 3 -746 -703 747
		mu 0 3 395 358 360
		f 3 -647 748 -561
		mu 0 3 275 274 276
		f 3 -749 -564 -675
		mu 0 3 276 274 278
		f 3 -712 749 -566
		mu 0 3 364 365 334
		f 3 -750 750 -673
		mu 0 3 334 365 335
		f 3 751 752 -716
		mu 0 3 367 341 369
		f 3 -753 -680 753
		mu 0 3 369 341 339
		f 3 754 755 -684
		mu 0 3 343 370 345
		f 3 -756 -718 756
		mu 0 3 345 370 372
		f 3 -628 757 758
		mu 0 3 396 397 398
		f 3 -758 759 760
		mu 0 3 398 397 399
		f 3 761 762 -608
		mu 0 3 264 258 301
		f 3 -763 -544 763
		mu 0 3 301 258 260
		f 3 764 765 -686
		mu 0 3 348 380 346
		f 3 -766 -727 766
		mu 0 3 346 380 381
		f 3 -695 767 768
		mu 0 3 353 351 384
		f 3 -768 769 -730
		mu 0 3 384 351 382
		f 3 -700 770 771
		mu 0 3 357 355 388
		f 3 -771 772 -735
		mu 0 3 388 355 386
		f 3 773 774 775
		mu 0 3 400 401 316
		f 3 -775 776 -636
		mu 0 3 316 401 314
		f 3 777 778 779
		mu 0 3 402 381 403
		f 3 -779 -729 780
		mu 0 3 403 381 379
		f 3 781 782 783
		mu 0 3 404 405 362
		f 3 -783 784 -709
		mu 0 3 362 405 363
		f 3 -777 785 -715
		mu 0 3 368 406 366
		f 3 -786 786 787
		mu 0 3 366 406 407
		f 3 -605 788 -719
		mu 0 3 371 408 373
		f 3 -789 789 790
		mu 0 3 373 408 409
		f 3 791 792 -591
		mu 0 3 410 411 377
		f 3 -793 793 -724
		mu 0 3 377 411 376
		f 3 -607 794 -762
		mu 0 3 264 300 258
		f 3 -795 795 796
		mu 0 3 258 300 412
		f 3 797 798 -728
		mu 0 3 378 413 379
		f 3 -799 799 800
		mu 0 3 379 413 414
		f 3 -734 801 802
		mu 0 3 385 383 416
		f 3 -802 803 804
		mu 0 3 416 383 415
		f 3 -739 805 806
		mu 0 3 389 387 418
		f 3 -806 807 808
		mu 0 3 418 387 417
		f 3 -635 809 810
		mu 0 3 316 315 311
		f 3 -810 -754 -631
		mu 0 3 311 315 312
		f 3 811 812 -801
		mu 0 3 414 419 379
		f 3 -813 813 -781
		mu 0 3 379 419 403
		f 3 814 815 -579
		mu 0 3 420 421 422
		f 3 -816 816 817
		mu 0 3 422 421 423
		f 3 -586 818 819
		mu 0 3 424 425 426
		f 3 -819 820 821
		mu 0 3 426 425 427
		f 3 822 823 824
		mu 0 3 428 429 430
		f 3 -824 825 826
		mu 0 3 430 429 431
		f 3 827 828 -595
		mu 0 3 432 433 434
		f 3 -829 829 830
		mu 0 3 434 433 435
		f 3 831 832 -693
		mu 0 3 437 392 438
		f 3 -833 833 834
		mu 0 3 438 392 436
		f 3 835 836 -698
		mu 0 3 439 359 440
		f 3 -837 -701 837
		mu 0 3 440 359 358
		f 3 838 839 -688
		mu 0 3 443 441 444
		f 3 -840 840 841
		mu 0 3 444 441 442;
	setAttr ".fc[500:999]"
		f 3 842 843 844
		mu 0 3 436 445 446
		f 3 -844 845 846
		mu 0 3 446 445 447
		f 3 -633 847 848
		mu 0 3 311 313 448
		f 3 -848 849 850
		mu 0 3 448 313 449
		f 3 851 852 853
		mu 0 3 450 451 452
		f 3 -853 854 855
		mu 0 3 452 451 453
		f 3 856 857 858
		mu 0 3 454 346 402
		f 3 -858 -767 -778
		mu 0 3 402 346 381
		f 3 -583 -571 859
		mu 0 3 286 282 281
		f 3 -580 860 -644
		mu 0 3 263 285 273
		f 3 -861 861 -558
		mu 0 3 273 285 271
		f 3 862 863 -556
		mu 0 3 455 456 404
		f 3 -864 864 -782
		mu 0 3 404 456 405
		f 3 865 866 -787
		mu 0 3 406 457 407
		f 3 -867 867 868
		mu 0 3 407 457 458
		f 3 869 870 -667
		mu 0 3 459 460 461
		f 3 -871 871 872
		mu 0 3 461 460 462
		f 3 873 874 -614
		mu 0 3 463 464 465
		f 3 -875 875 876
		mu 0 3 465 464 466
		f 3 877 878 -764
		mu 0 3 467 468 469
		f 3 -879 879 880
		mu 0 3 469 468 470
		f 3 881 882 -800
		mu 0 3 413 471 414
		f 3 -883 883 884
		mu 0 3 414 471 446
		f 3 -805 885 886
		mu 0 3 416 415 473
		f 3 -886 887 888
		mu 0 3 473 415 472
		f 3 -809 889 890
		mu 0 3 418 417 475
		f 3 -890 891 892
		mu 0 3 475 417 474
		f 3 -744 893 -834
		mu 0 3 392 393 436
		f 3 -894 894 -843
		mu 0 3 436 393 445
		f 3 895 896 -855
		mu 0 3 451 476 453
		f 3 -897 897 898
		mu 0 3 453 476 477
		f 3 -567 -559 -784
		mu 0 3 280 274 272
		f 3 -877 899 -613
		mu 0 3 465 466 410
		f 3 -900 900 -792
		mu 0 3 410 466 411
		f 3 -581 901 902
		mu 0 3 478 479 480
		f 3 -902 903 904
		mu 0 3 480 479 481
		f 3 905 906 907
		mu 0 3 482 483 484
		f 3 -907 908 909
		mu 0 3 484 483 485
		f 3 910 911 -543
		mu 0 3 486 487 467
		f 3 -912 912 -878
		mu 0 3 467 487 468
		f 3 -598 913 914
		mu 0 3 488 396 489
		f 3 -914 -759 915
		mu 0 3 489 396 398
		f 3 -732 916 917
		mu 0 3 492 490 390
		f 3 -917 918 919
		mu 0 3 390 490 491
		f 3 920 921 -737
		mu 0 3 493 451 494
		f 3 -922 -852 922
		mu 0 3 494 451 450
		f 3 923 924 -725
		mu 0 3 497 495 498
		f 3 -925 925 926
		mu 0 3 498 495 496
		f 3 -812 927 928
		mu 0 3 419 414 447
		f 3 -928 -885 -847
		mu 0 3 447 414 446
		f 3 929 930 931
		mu 0 3 500 491 501
		f 3 -931 932 933
		mu 0 3 501 491 499
		f 3 -857 934 -689
		mu 0 3 346 454 347
		f 3 -935 935 936
		mu 0 3 347 454 502
		f 3 937 -669 -825
		mu 0 3 503 331 332
		f 3 -818 938 -862
		mu 0 3 422 423 455
		f 3 -939 939 -863
		mu 0 3 455 423 456
		f 3 940 941 -820
		mu 0 3 426 458 424
		f 3 -942 -868 942
		mu 0 3 424 458 457
		f 3 -827 943 -938
		mu 0 3 430 431 459
		f 3 -944 944 -870
		mu 0 3 459 431 460
		f 3 -831 945 -610
		mu 0 3 434 435 463
		f 3 -946 946 -874
		mu 0 3 463 435 464
		f 3 -881 947 -609
		mu 0 3 469 470 432
		f 3 -948 948 -828
		mu 0 3 432 470 433
		f 3 949 950 -884
		mu 0 3 471 438 446
		f 3 -951 -835 -845
		mu 0 3 446 438 436
		f 3 -838 951 952
		mu 0 3 440 358 504
		f 3 -952 -745 953
		mu 0 3 504 358 394
		f 3 -893 954 955
		mu 0 3 475 474 443
		f 3 -955 956 -839
		mu 0 3 443 474 441
		f 3 957 -624 -619
		mu 0 3 305 307 295
		f 3 958 959 -934
		mu 0 3 499 394 501
		f 3 -960 -747 960
		mu 0 3 501 394 395
		f 3 -596 961 -548
		mu 0 3 264 270 265
		f 3 -962 -554 962
		mu 0 3 265 270 269
		f 3 963 964 965
		mu 0 3 296 298 300
		f 3 -965 966 -796
		mu 0 3 300 298 412
		f 3 967 968 -658
		mu 0 3 505 506 507
		f 3 -969 969 970
		mu 0 3 507 506 508
		f 3 -569 971 972
		mu 0 3 509 510 511
		f 3 -972 973 974
		mu 0 3 511 510 512
		f 3 975 976 977
		mu 0 3 513 514 515
		f 3 -977 978 979
		mu 0 3 515 514 516
		f 3 -664 980 981
		mu 0 3 517 342 518
		f 3 -981 -683 982
		mu 0 3 518 342 344
		f 3 983 984 -790
		mu 0 3 408 488 409
		f 3 -985 -915 985
		mu 0 3 409 488 489
		f 3 -887 986 987
		mu 0 3 519 504 499
		f 3 -987 -954 -959
		mu 0 3 499 504 394
		f 3 -891 988 989
		mu 0 3 522 520 476
		f 3 -989 990 991
		mu 0 3 476 520 521
		f 3 992 993 -882
		mu 0 3 525 523 526
		f 3 -994 994 995
		mu 0 3 526 523 524
		f 3 -930 996 -920
		mu 0 3 491 500 390
		f 3 -997 997 -740
		mu 0 3 390 500 391
		f 3 -774 998 -866
		mu 0 3 401 400 527
		f 3 999 1000 -999
		mu 0 3 400 319 527
		f 3 -1001 -588 -943
		mu 0 3 527 319 289
		f 3 -967 1001 1002
		mu 0 3 412 298 321
		f 3 -1002 -603 -654
		mu 0 3 321 298 297
		f 3 -721 1003 -577
		mu 0 3 375 374 420
		f 3 -1004 1004 -815
		mu 0 3 420 374 421
		f 3 -584 1005 -821
		mu 0 3 425 478 427
		f 3 -1006 -903 1006
		mu 0 3 427 478 480
		f 3 1007 1008 -823
		mu 0 3 528 482 529
		f 3 -1009 -908 1009
		mu 0 3 529 482 484
		f 3 -918 1010 -769
		mu 0 3 492 390 437
		f 3 -1011 -742 -832
		mu 0 3 437 390 392
		f 3 -772 1011 -836
		mu 0 3 439 494 359
		f 3 -1012 -923 1012
		mu 0 3 359 494 450
		f 3 -842 1013 -765
		mu 0 3 444 442 497
		f 3 -1014 1014 -924
		mu 0 3 497 442 495
		f 3 -1008 -672 -906
		mu 0 3 530 332 333
		f 3 -873 1015 -660
		mu 0 3 461 462 505
		f 3 -1016 1016 -968
		mu 0 3 505 462 506
		f 3 -562 1017 -974
		mu 0 3 510 531 512
		f 3 -1018 -677 1018
		mu 0 3 512 531 532
		f 3 -850 1019 -979
		mu 0 3 514 338 516
		f 3 -1020 -679 1020
		mu 0 3 516 338 340
		f 3 -670 1021 -909
		mu 0 3 483 517 485
		f 3 -1022 -982 1022
		mu 0 3 485 517 518
		f 3 -956 1023 -991
		mu 0 3 520 349 521
		f 3 -1024 -690 1024
		mu 0 3 521 349 347
		f 3 -996 1025 -950
		mu 0 3 534 533 352
		f 3 -1026 1026 -691
		mu 0 3 352 533 350
		f 3 -889 1027 -953
		mu 0 3 473 472 356
		f 3 -1028 1028 -696
		mu 0 3 356 472 354
		f 3 -992 1029 -898
		mu 0 3 476 521 477
		f 3 -1030 1030 1031
		mu 0 3 477 521 535
		f 3 -708 1032 -663
		mu 0 3 325 321 328
		f 3 -1033 -653 -755
		mu 0 3 328 321 323
		f 3 -602 1033 -617
		mu 0 3 295 296 266
		f 3 -1034 -966 -606
		mu 0 3 266 296 300
		f 3 -971 1034 -707
		mu 0 3 507 508 536
		f 3 -1035 1035 1036
		mu 0 3 536 508 537
		f 3 -860 1037 -904
		mu 0 3 479 509 481
		f 3 -1038 -973 1038
		mu 0 3 481 509 511
		f 3 -630 1039 -760
		mu 0 3 397 513 399
		f 3 -1040 -978 1040
		mu 0 3 399 513 515
		f 3 -1037 1041 -652
		mu 0 3 536 537 486
		f 3 -1042 1042 -911
		mu 0 3 486 537 487
		f 3 -964 1043 -604
		mu 0 3 298 296 299
		f 3 -1044 -601 -984
		mu 0 3 299 296 294
		f 3 -988 1044 -803
		mu 0 3 519 499 490
		f 3 -1045 -933 -919
		mu 0 3 490 499 491
		f 3 -990 1045 -807
		mu 0 3 522 476 493
		f 3 -1046 -896 -921
		mu 0 3 493 476 451
		f 3 -927 1046 -798
		mu 0 3 498 496 525
		f 3 -1047 1047 -993
		mu 0 3 525 496 523
		f 3 -976 1048 -851
		mu 0 3 449 310 448
		f 3 -1049 -629 1049
		mu 0 3 448 310 308
		f 3 -1013 1050 -704
		mu 0 3 359 450 361
		f 3 -1051 -854 1051
		mu 0 3 361 450 452
		f 3 -1031 1052 1053
		mu 0 3 535 521 502
		f 3 -1053 -1025 -937
		mu 0 3 502 521 347
		f 3 -1003 1054 -797
		mu 0 3 412 321 258
		f 3 -1055 -650 -542
		mu 0 3 258 321 259
		f 3 1055 1056 1057
		mu 0 3 538 539 540
		f 3 1058 1059 1060
		mu 0 3 541 542 543
		f 3 1061 1062 1063
		mu 0 3 546 544 547
		f 3 -1063 1064 1065
		mu 0 3 547 544 545
		f 3 1066 1067 1068
		mu 0 3 550 548 551
		f 3 -1068 1069 1070
		mu 0 3 551 548 549
		f 3 -1064 1071 1072
		mu 0 3 546 547 553
		f 3 -1072 -1061 1073
		mu 0 3 553 547 552
		f 3 1074 1075 -1060
		mu 0 3 556 554 557
		f 3 -1076 1076 -1074
		mu 0 3 557 554 555
		f 3 -1056 1077 1078
		mu 0 3 539 538 559
		f 3 -1078 1079 1080
		mu 0 3 559 538 558
		f 3 1081 1082 1083
		mu 0 3 561 560 556
		f 3 -1083 1084 -1075
		mu 0 3 556 560 554
		f 3 -1081 1085 1086
		mu 0 3 559 558 563
		f 3 -1086 1087 1088
		mu 0 3 563 558 562
		f 3 1089 1090 -1071
		mu 0 3 566 564 567
		f 3 -1091 1091 1092
		mu 0 3 567 564 565
		f 3 1093 1094 1095
		mu 0 3 568 549 569
		f 3 -1095 -1070 1096
		mu 0 3 569 549 548
		f 3 -1093 1097 1098
		mu 0 3 567 565 561
		f 3 -1098 1099 -1082
		mu 0 3 561 565 560
		f 3 1100 1101 -1089
		mu 0 3 562 568 563
		f 3 -1102 -1096 1102
		mu 0 3 563 568 569
		f 3 -1103 1103 1104
		mu 0 3 572 570 573
		f 3 -1104 1105 1106
		mu 0 3 573 570 571
		f 3 1107 1108 -1088
		mu 0 3 576 574 577
		f 3 -1109 1109 1110
		mu 0 3 577 574 575
		f 3 -1067 1111 1112
		mu 0 3 580 578 581
		f 3 -1112 1113 1114
		mu 0 3 581 578 579
		f 3 1115 1116 1117
		mu 0 3 584 582 585
		f 3 -1117 1118 -1058
		mu 0 3 585 582 583
		f 3 -1097 1119 -1106
		mu 0 3 570 580 571
		f 3 -1120 -1113 1120
		mu 0 3 571 580 581
		f 3 -1108 1121 1122
		mu 0 3 574 576 582
		f 3 -1122 -1080 -1119
		mu 0 3 582 576 583
		f 3 1123 1124 -1114
		mu 0 3 578 545 579
		f 3 -1125 -1065 1125
		mu 0 3 579 545 544
		f 3 -1057 1126 -1118
		mu 0 3 585 586 584
		f 3 -1127 1127 1128
		mu 0 3 584 586 587
		f 3 1129 1130 -1094
		mu 0 3 589 588 566
		f 3 -1131 1131 -1090
		mu 0 3 566 588 564
		f 3 -1087 1132 1133
		mu 0 3 590 572 591
		f 3 -1133 -1105 1134
		mu 0 3 591 572 573
		f 3 1135 1136 -1099
		mu 0 3 593 592 551
		f 3 -1137 -1124 -1069
		mu 0 3 551 592 550
		f 3 -1111 1137 -1101
		mu 0 3 577 575 589
		f 3 -1138 1138 -1130
		mu 0 3 589 575 588
		f 3 -1079 1139 -1128
		mu 0 3 586 590 587
		f 3 -1140 -1134 1140
		mu 0 3 587 590 591
		f 3 -1059 1141 -1084
		mu 0 3 542 541 593
		f 3 -1142 -1066 -1136
		mu 0 3 593 541 592
		f 3 1142 1143 1144
		mu 0 3 594 595 596
		f 3 -1144 1145 1146
		mu 0 3 596 595 597
		f 3 1147 1148 -1147
		mu 0 3 597 598 596
		f 3 -1149 1149 1150
		mu 0 3 596 598 599
		f 3 1151 1152 -1151
		mu 0 3 599 600 596
		f 3 -1153 1153 1154
		mu 0 3 596 600 601
		f 3 1155 1156 -1155
		mu 0 3 601 602 596
		f 3 -1157 1157 1158
		mu 0 3 596 602 603
		f 3 -1145 -1159 1159
		mu 0 3 594 596 603
		f 3 1160 1161 1162
		mu 0 3 604 605 606
		f 3 -1162 1163 1164
		mu 0 3 606 605 607
		f 3 1165 1166 -1161
		mu 0 3 604 608 605
		f 3 -1167 1167 1168
		mu 0 3 605 608 609
		f 3 1169 1170 -1169
		mu 0 3 609 610 605
		f 3 -1171 1171 1172
		mu 0 3 605 610 611
		f 3 1173 1174 -1173
		mu 0 3 611 612 605
		f 3 -1175 1175 1176
		mu 0 3 605 612 613
		f 3 -1164 -1177 1177
		mu 0 3 607 605 613
		f 3 1178 1179 1180
		mu 0 3 616 614 617
		f 3 -1180 1181 1182
		mu 0 3 617 614 615
		f 3 1183 1184 1185
		mu 0 3 618 615 619
		f 3 -1185 -1182 1186
		mu 0 3 619 615 614
		f 3 1187 1188 1189
		mu 0 3 620 618 621
		f 3 -1189 -1186 1190
		mu 0 3 621 618 619
		f 3 1191 1192 1193
		mu 0 3 624 622 625
		f 3 -1193 1194 1195
		mu 0 3 625 622 623
		f 3 1196 1197 -1181
		mu 0 3 617 623 616
		f 3 -1198 -1195 1198
		mu 0 3 616 623 622
		f 3 1199 1200 1201
		mu 0 3 626 624 627
		f 3 -1201 -1194 1202
		mu 0 3 627 624 625
		f 3 1203 1204 1205
		mu 0 3 628 626 629
		f 3 -1205 -1202 1206
		mu 0 3 629 626 627
		f 3 1207 1208 1209
		mu 0 3 630 628 631
		f 3 -1209 -1206 1210
		mu 0 3 631 628 629
		f 3 1211 1212 1213
		mu 0 3 632 630 633
		f 3 -1213 -1210 1214
		mu 0 3 633 630 631
		f 3 1215 1216 1217
		mu 0 3 634 632 635
		f 3 -1217 -1214 1218
		mu 0 3 635 632 633
		f 3 1219 1220 1221
		mu 0 3 638 636 639
		f 3 -1221 -1218 1222
		mu 0 3 639 636 637
		f 3 1223 1224 1225
		mu 0 3 640 638 641
		f 3 -1225 -1222 1226
		mu 0 3 641 638 639
		f 3 1227 1228 1229
		mu 0 3 642 640 643
		f 3 -1229 -1226 1230
		mu 0 3 643 640 641
		f 3 1231 1232 1233
		mu 0 3 644 642 645
		f 3 -1233 -1230 1234
		mu 0 3 645 642 643
		f 3 1235 1236 1237
		mu 0 3 646 644 647
		f 3 -1237 -1234 1238
		mu 0 3 647 644 645
		f 3 1239 1240 1241
		mu 0 3 648 646 649
		f 3 -1241 -1238 1242
		mu 0 3 649 646 647
		f 3 1243 1244 1245
		mu 0 3 650 648 651
		f 3 -1245 -1242 1246
		mu 0 3 651 648 649
		f 3 1247 1248 -1246
		mu 0 3 651 620 650
		f 3 -1249 -1190 1249
		mu 0 3 650 620 621
		f 3 -1187 1250 1251
		mu 0 3 652 653 597
		f 3 1252 1253 -1199
		mu 0 3 654 598 655
		f 3 -1200 1254 1255
		mu 0 3 656 657 599
		f 3 -1208 1256 1257
		mu 0 3 658 659 600
		f 3 1258 1259 -1216
		mu 0 3 660 601 661
		f 3 1260 1261 -1224
		mu 0 3 662 602 663
		f 3 -1232 1262 1263
		mu 0 3 664 665 603
		f 3 1264 1265 -1240
		mu 0 3 666 594 667
		f 3 -1250 1266 1267
		mu 0 3 668 669 595
		f 3 -1228 1268 -1261
		mu 0 3 662 664 602
		f 3 -1269 -1264 -1158
		mu 0 3 602 664 603
		f 3 1269 1270 1271
		mu 0 3 670 635 671
		f 3 -1271 -1219 1272
		mu 0 3 671 635 633
		f 3 -1262 1273 -1220
		mu 0 3 663 602 660
		f 3 -1274 -1156 -1259
		mu 0 3 660 602 601
		f 3 1274 1275 1276
		mu 0 3 672 631 673
		f 3 -1276 -1211 1277
		mu 0 3 673 631 629
		f 3 -1275 1278 -1215
		mu 0 3 631 672 633
		f 3 -1279 1279 -1273
		mu 0 3 633 672 671
		f 3 1280 1281 -1207
		mu 0 3 627 674 629
		f 3 -1282 1282 -1278
		mu 0 3 629 674 673
		f 3 1283 1284 -1188
		mu 0 3 620 675 618
		f 3 -1285 1285 1286
		mu 0 3 618 675 676
		f 3 -1260 1287 -1212
		mu 0 3 661 601 659
		f 3 -1288 -1154 -1257
		mu 0 3 659 601 600
		f 3 1288 1289 1290
		mu 0 3 677 674 625
		f 3 -1290 -1281 -1203
		mu 0 3 625 674 627
		f 3 1291 1292 1293
		mu 0 3 678 675 651
		f 3 -1293 -1284 -1248
		mu 0 3 651 675 620
		f 3 1294 1295 -1196
		mu 0 3 623 679 625
		f 3 -1296 1296 -1291
		mu 0 3 625 679 677
		f 3 -1247 1297 -1294
		mu 0 3 651 649 678
		f 3 -1298 1298 1299
		mu 0 3 678 649 680
		f 3 -1258 1300 -1204
		mu 0 3 658 600 657
		f 3 -1301 -1152 -1255
		mu 0 3 657 600 599
		f 3 -1252 1301 -1191
		mu 0 3 652 597 669
		f 3 -1302 -1146 -1267
		mu 0 3 669 597 595
		f 3 -1295 1302 1303
		mu 0 3 679 623 681
		f 3 -1303 -1197 1304
		mu 0 3 681 623 617
		f 3 1305 1306 1307
		mu 0 3 682 680 647
		f 3 -1307 -1299 -1243
		mu 0 3 647 680 649
		f 3 1308 1309 -1231
		mu 0 3 641 683 643
		f 3 -1310 1310 1311
		mu 0 3 643 683 684
		f 3 -1183 1312 -1305
		mu 0 3 617 615 681
		f 3 -1313 1313 1314
		mu 0 3 681 615 685
		f 3 -1239 1315 -1308
		mu 0 3 647 645 682
		f 3 -1316 1316 1317
		mu 0 3 682 645 686
		f 3 -1192 1318 -1253
		mu 0 3 654 656 598
		f 3 -1319 -1256 -1150
		mu 0 3 598 656 599
		f 3 -1244 1319 -1265
		mu 0 3 666 668 594
		f 3 -1320 -1268 -1143
		mu 0 3 594 668 595
		f 3 1320 1321 -1287
		mu 0 3 676 685 618
		f 3 -1322 -1314 -1184
		mu 0 3 618 685 615
		f 3 1322 1323 -1312
		mu 0 3 684 686 643
		f 3 -1324 -1317 -1235
		mu 0 3 643 686 645
		f 3 -1223 1324 1325
		mu 0 3 639 637 688
		f 3 -1325 -1270 1326
		mu 0 3 688 637 687
		f 3 -1179 1327 -1251
		mu 0 3 653 655 597
		f 3 -1328 -1254 -1148
		mu 0 3 597 655 598
		f 3 -1266 1328 -1236
		mu 0 3 667 594 665
		f 3 -1329 -1160 -1263
		mu 0 3 665 594 603
		f 3 1329 1330 -1326
		mu 0 3 688 683 639
		f 3 -1331 -1309 -1227
		mu 0 3 639 683 641
		f 3 1331 1332 1333
		mu 0 3 691 689 692
		f 3 -1333 1334 1335
		mu 0 3 692 689 690
		f 3 1336 1337 1338
		mu 0 3 693 690 694
		f 3 -1338 -1335 1339
		mu 0 3 694 690 689
		f 3 1340 1341 1342
		mu 0 3 695 693 696
		f 3 -1342 -1339 1343
		mu 0 3 696 693 694
		f 3 1344 1345 1346
		mu 0 3 699 697 700
		f 3 -1346 1347 1348
		mu 0 3 700 697 698
		f 3 1349 1350 -1334
		mu 0 3 692 698 691
		f 3 -1351 -1348 1351
		mu 0 3 691 698 697
		f 3 1352 1353 1354
		mu 0 3 701 699 702
		f 3 -1354 -1347 1355
		mu 0 3 702 699 700
		f 3 1356 1357 1358
		mu 0 3 703 701 704
		f 3 -1358 -1355 1359
		mu 0 3 704 701 702
		f 3 1360 1361 1362
		mu 0 3 705 703 706
		f 3 -1362 -1359 1363
		mu 0 3 706 703 704
		f 3 1364 1365 1366
		mu 0 3 707 705 708
		f 3 -1366 -1363 1367
		mu 0 3 708 705 706
		f 3 1368 1369 1370
		mu 0 3 709 707 710
		f 3 -1370 -1367 1371
		mu 0 3 710 707 708
		f 3 1372 1373 1374
		mu 0 3 711 709 712
		f 3 -1374 -1371 1375
		mu 0 3 712 709 710
		f 3 1376 1377 1378
		mu 0 3 715 713 716
		f 3 -1378 -1375 1379
		mu 0 3 716 713 714
		f 3 1380 1381 1382
		mu 0 3 717 715 718
		f 3 -1382 -1379 1383
		mu 0 3 718 715 716
		f 3 1384 1385 1386
		mu 0 3 719 717 720
		f 3 -1386 -1383 1387
		mu 0 3 720 717 718
		f 3 1388 1389 1390
		mu 0 3 721 719 722
		f 3 -1390 -1387 1391
		mu 0 3 722 719 720
		f 3 1392 1393 1394
		mu 0 3 723 721 724
		f 3 -1394 -1391 1395
		mu 0 3 724 721 722
		f 3 1396 1397 1398
		mu 0 3 725 723 726
		f 3 -1398 -1395 1399
		mu 0 3 726 723 724
		f 3 1400 1401 -1399
		mu 0 3 726 695 725
		f 3 -1402 -1343 1402
		mu 0 3 725 695 696
		f 3 1403 1404 -1340
		mu 0 3 727 608 728
		f 3 -1352 1405 1406
		mu 0 3 729 730 609
		f 3 -1353 1407 1408
		mu 0 3 731 732 610
		f 3 -1361 1409 1410
		mu 0 3 733 734 611
		f 3 1411 1412 -1369
		mu 0 3 735 612 736
		f 3 1413 1414 -1377
		mu 0 3 737 613 738
		f 3 -1385 1415 1416
		mu 0 3 739 740 607
		f 3 1417 1418 -1393
		mu 0 3 741 606 742
		f 3 1419 1420 -1403
		mu 0 3 743 604 744
		f 3 -1381 1421 -1414
		mu 0 3 737 739 613
		f 3 -1422 -1417 -1178
		mu 0 3 613 739 607
		f 3 1422 1423 1424
		mu 0 3 745 710 746
		f 3 -1424 -1372 1425
		mu 0 3 746 710 708
		f 3 1426 1427 -1368
		mu 0 3 706 747 708
		f 3 -1428 1428 -1426
		mu 0 3 708 747 746
		f 3 -1415 1429 -1373
		mu 0 3 738 613 735
		f 3 -1430 -1176 -1412
		mu 0 3 735 613 612
		f 3 -1427 1430 1431
		mu 0 3 747 706 748
		f 3 -1431 -1364 1432
		mu 0 3 748 706 704
		f 3 1433 1434 -1360
		mu 0 3 702 749 704
		f 3 -1435 1435 -1433
		mu 0 3 704 749 748
		f 3 1436 1437 -1341
		mu 0 3 695 750 693
		f 3 -1438 1438 1439
		mu 0 3 693 750 751
		f 3 1440 1441 -1349
		mu 0 3 698 752 700
		f 3 -1442 1442 1443
		mu 0 3 700 752 753
		f 3 1444 1445 -1400
		mu 0 3 724 754 726
		f 3 -1446 1446 1447
		mu 0 3 726 754 755
		f 3 -1413 1448 -1365
		mu 0 3 736 612 734
		f 3 -1449 -1174 -1410
		mu 0 3 734 612 611
		f 3 1449 1450 -1444
		mu 0 3 753 749 700
		f 3 -1451 -1434 -1356
		mu 0 3 700 749 702
		f 3 1451 1452 -1448
		mu 0 3 755 750 726
		f 3 -1453 -1437 -1401
		mu 0 3 726 750 695
		f 3 -1411 1453 -1357
		mu 0 3 733 611 732
		f 3 -1454 -1172 -1408
		mu 0 3 732 611 610
		f 3 -1344 1454 -1420
		mu 0 3 743 728 604
		f 3 -1455 -1405 -1166
		mu 0 3 604 728 608
		f 3 -1441 1455 1456
		mu 0 3 752 698 756
		f 3 -1456 -1350 1457
		mu 0 3 756 698 692
		f 3 -1445 1458 1459
		mu 0 3 754 724 757
		f 3 -1459 -1396 1460
		mu 0 3 757 724 722
		f 3 1461 1462 -1336
		mu 0 3 690 758 692
		f 3 -1463 1463 -1458
		mu 0 3 692 758 756
		f 3 -1392 1464 -1461
		mu 0 3 722 720 757
		f 3 -1465 1465 1466
		mu 0 3 757 720 759
		f 3 -1345 1467 -1406
		mu 0 3 730 731 609
		f 3 -1468 -1409 -1170
		mu 0 3 609 731 610
		f 3 -1421 1468 -1397
		mu 0 3 744 604 741
		f 3 -1469 -1163 -1418
		mu 0 3 741 604 606
		f 3 1469 1470 -1440
		mu 0 3 751 758 693
		f 3 -1471 -1462 -1337
		mu 0 3 693 758 690
		f 3 -1466 1471 1472
		mu 0 3 759 720 760
		f 3 -1472 -1388 1473
		mu 0 3 760 720 718
		f 3 1474 1475 -1384
		mu 0 3 716 761 718
		f 3 -1476 1476 -1474
		mu 0 3 718 761 760
		f 3 -1423 1477 -1376
		mu 0 3 710 745 712
		f 3 -1478 1478 1479
		mu 0 3 712 745 762
		f 3 -1332 1480 -1404
		mu 0 3 727 729 608
		f 3 -1481 -1407 -1168
		mu 0 3 608 729 609
		f 3 -1389 1481 -1416
		mu 0 3 740 742 607
		f 3 -1482 -1419 -1165
		mu 0 3 607 742 606
		f 3 1482 1483 -1480
		mu 0 3 763 761 714
		f 3 -1484 -1475 -1380
		mu 0 3 714 761 716
		f 3 1484 1485 -551
		mu 0 3 265 403 267
		f 3 -1486 -814 1486
		mu 0 3 267 403 419
		f 3 -1485 1487 -780
		mu 0 3 403 265 402
		f 3 -1488 -963 1488
		mu 0 3 402 265 269
		f 3 -1489 1489 -859
		mu 0 3 402 269 454
		f 3 -1490 -553 1490
		mu 0 3 454 269 268
		f 3 1491 1492 -574
		mu 0 3 283 502 268
		f 3 -1493 -936 -1491
		mu 0 3 268 502 454
		f 3 -1492 1493 -1054
		mu 0 3 502 283 535
		f 3 -1494 -646 1494
		mu 0 3 535 283 320
		f 3 -649 1495 -1495
		mu 0 3 320 317 535
		f 3 -1496 1496 -1032
		mu 0 3 535 317 477
		f 3 -640 1497 -1497
		mu 0 3 317 318 477
		f 3 -1498 1498 -899
		mu 0 3 477 318 453
		f 3 -641 1499 -1499
		mu 0 3 318 319 453
		f 3 -1500 1500 -856
		mu 0 3 453 319 452
		f 3 -1000 1501 -1501
		mu 0 3 319 400 452
		f 3 -1502 1502 -1052
		mu 0 3 452 400 361
		f 3 -776 1503 -1503
		mu 0 3 400 316 361
		f 3 -1504 1504 -705
		mu 0 3 361 316 360
		f 3 -811 1505 -1505
		mu 0 3 316 311 360
		f 3 -1506 1506 -748
		mu 0 3 360 311 395
		f 3 -849 1507 -1507
		mu 0 3 311 448 395
		f 3 -1508 1508 -961
		mu 0 3 395 448 501
		f 3 -1509 1509 -932
		mu 0 3 501 448 500
		f 3 -1510 -1050 1510
		mu 0 3 500 448 308
		f 3 1511 1512 -627
		mu 0 3 306 391 308
		f 3 -1513 -998 -1511
		mu 0 3 308 391 500
		f 3 1513 1514 -623
		mu 0 3 307 393 306
		f 3 -1515 -743 -1512
		mu 0 3 306 393 391
		f 3 1515 1516 -958
		mu 0 3 305 445 307
		f 3 -1517 -895 -1514
		mu 0 3 307 445 393
		f 3 1517 1518 -618
		mu 0 3 304 447 305
		f 3 -1519 -846 -1516
		mu 0 3 305 447 445
		f 3 -1487 1519 -620
		mu 0 3 267 419 304
		f 3 -1520 -929 -1518
		mu 0 3 304 419 447
		f 3 1520 1521 1522
		mu 0 3 764 765 766
		f 3 1523 1524 1525
		mu 0 3 767 768 769
		f 3 1526 1527 1528
		mu 0 3 770 771 772
		f 3 -1528 1529 1530
		mu 0 3 772 771 773
		f 3 1531 1532 1533
		mu 0 3 774 775 776
		f 3 1534 1535 1536
		mu 0 3 777 778 779
		f 3 -1536 1537 1538
		mu 0 3 779 778 780
		f 3 1539 1540 1541
		mu 0 3 781 782 780
		f 3 -1541 1542 -1539
		mu 0 3 780 782 779
		f 3 1543 1544 -1540
		mu 0 3 781 783 782
		f 3 1545 1546 1547
		mu 0 3 784 785 786
		f 3 -1547 1548 1549
		mu 0 3 786 785 792
		f 3 1550 1551 1552
		mu 0 3 787 777 788
		f 3 -1552 -1537 1553
		mu 0 3 788 777 779
		f 3 -1534 1554 1555
		mu 0 3 774 776 773
		f 3 -1555 1556 -1531
		mu 0 3 773 776 772
		f 3 -1553 1557 1558
		mu 0 3 789 790 775
		f 3 -1558 1559 -1533
		mu 0 3 775 790 776
		f 3 1560 1561 -1525
		mu 0 3 768 770 769
		f 3 -1562 -1529 1562
		mu 0 3 769 770 772
		f 3 1563 1564 -1522
		mu 0 3 765 767 766
		f 3 -1565 -1526 1565
		mu 0 3 766 767 769
		f 3 1566 1567 1568
		mu 0 3 791 764 792
		f 3 -1568 -1523 1569
		mu 0 3 792 764 766
		f 3 -1569 -1549 1570
		mu 0 3 791 792 785
		f 3 -1548 1571 1572
		mu 0 3 784 786 783
		f 3 -1572 1573 -1545
		mu 0 3 783 786 782
		f 3 1574 1575 1576
		mu 0 3 795 793 796
		f 3 -1576 1577 1578
		mu 0 3 796 793 794
		f 3 1579 1580 1581
		mu 0 3 797 788 798
		f 3 -1581 -1554 1582
		mu 0 3 798 788 779
		f 3 1583 1584 1585
		mu 0 3 801 799 802
		f 3 -1585 1586 1587
		mu 0 3 802 799 800
		f 3 -1538 1588 1589
		mu 0 3 780 778 804
		f 3 -1589 1590 1591
		mu 0 3 804 778 803
		f 3 1592 1593 1594
		mu 0 3 806 805 795
		f 3 -1594 1595 -1575
		mu 0 3 795 805 793
		f 3 -1543 1596 -1583
		mu 0 3 779 782 798;
	setAttr ".fc[1000:1499]"
		f 3 -1597 1597 1598
		mu 0 3 798 782 807
		f 3 1599 1600 1601
		mu 0 3 808 809 801
		f 3 -1601 1602 -1584
		mu 0 3 801 809 799
		f 3 -1535 1603 -1591
		mu 0 3 778 777 803
		f 3 -1604 1604 1605
		mu 0 3 803 777 810
		f 3 1606 1607 1608
		mu 0 3 812 811 806
		f 3 -1608 1609 -1593
		mu 0 3 806 811 805
		f 3 -1574 1610 -1598
		mu 0 3 782 786 807
		f 3 -1611 1611 1612
		mu 0 3 807 786 813
		f 3 1613 1614 1615
		mu 0 3 815 814 808
		f 3 -1615 1616 -1600
		mu 0 3 808 814 809
		f 3 -1551 1617 -1605
		mu 0 3 777 787 810
		f 3 -1618 1618 1619
		mu 0 3 810 787 816
		f 3 -1561 1620 1621
		mu 0 3 770 768 818
		f 3 -1621 1622 1623
		mu 0 3 818 768 817
		f 3 1624 1625 1626
		mu 0 3 821 819 812
		f 3 -1626 1627 1628
		mu 0 3 812 819 820
		f 3 -1550 1629 -1612
		mu 0 3 786 792 813
		f 3 -1630 1630 1631
		mu 0 3 813 792 822
		f 3 1632 1633 1634
		mu 0 3 823 824 815
		f 3 -1634 1635 -1614
		mu 0 3 815 824 814
		f 3 1636 1637 1638
		mu 0 3 827 825 828
		f 3 -1638 1639 1640
		mu 0 3 828 825 826
		f 3 -1559 1641 -1619
		mu 0 3 789 775 830
		f 3 -1642 1642 1643
		mu 0 3 830 775 829
		f 3 -1524 1644 -1623
		mu 0 3 768 767 817
		f 3 -1645 1645 1646
		mu 0 3 817 767 831
		f 3 1647 1648 1649
		mu 0 3 834 832 835
		f 3 -1649 1650 1651
		mu 0 3 835 832 833
		f 3 1652 1653 1654
		mu 0 3 836 766 837
		f 3 -1654 -1566 1655
		mu 0 3 837 766 769
		f 3 1656 1657 1658
		mu 0 3 838 831 839
		f 3 -1658 1659 1660
		mu 0 3 839 831 840
		f 3 1661 1662 1663
		mu 0 3 842 841 843
		f 3 -1663 1664 1665
		mu 0 3 843 841 829
		f 3 -1556 1666 1667
		mu 0 3 774 773 843
		f 3 -1667 1668 1669
		mu 0 3 843 773 826
		f 3 -1521 1670 1671
		mu 0 3 765 764 840
		f 3 -1671 1672 1673
		mu 0 3 840 764 824
		f 3 -1652 1674 1675
		mu 0 3 835 833 819
		f 3 -1675 1676 -1628
		mu 0 3 819 833 820
		f 3 -1570 1677 -1631
		mu 0 3 792 766 822
		f 3 -1678 -1653 1678
		mu 0 3 822 766 836
		f 3 -1661 1679 1680
		mu 0 3 839 840 823
		f 3 -1680 -1674 -1633
		mu 0 3 823 840 824
		f 3 -1670 1681 -1664
		mu 0 3 843 826 842
		f 3 -1682 -1640 1682
		mu 0 3 842 826 825
		f 3 -1532 1683 -1643
		mu 0 3 775 774 829
		f 3 -1684 -1668 -1666
		mu 0 3 829 774 843
		f 3 -1564 1684 -1646
		mu 0 3 767 765 831
		f 3 -1685 -1672 -1660
		mu 0 3 831 765 840
		f 3 1685 1686 -1582
		mu 0 3 845 844 834
		f 3 -1687 1687 -1648
		mu 0 3 834 844 832
		f 3 -1629 1688 -1607
		mu 0 3 812 820 811
		f 3 -1689 1689 1690
		mu 0 3 811 820 846
		f 3 -1647 1691 1692
		mu 0 3 817 831 847
		f 3 -1692 -1657 1693
		mu 0 3 847 831 838
		f 3 -1644 1694 1695
		mu 0 3 830 829 848
		f 3 -1695 -1665 1696
		mu 0 3 848 829 841
		f 3 -1530 1697 -1669
		mu 0 3 773 771 826
		f 3 -1698 1698 -1641
		mu 0 3 826 771 828
		f 3 -1567 1699 -1673
		mu 0 3 764 791 824
		f 3 -1700 1700 -1636
		mu 0 3 824 791 814
		f 3 1701 1702 -1599
		mu 0 3 850 849 845
		f 3 -1703 1703 -1686
		mu 0 3 845 849 844
		f 3 1704 1705 -1677
		mu 0 3 833 851 820
		f 3 -1706 1706 -1690
		mu 0 3 820 851 846
		f 3 1707 1708 -1693
		mu 0 3 847 852 817
		f 3 -1709 1709 -1624
		mu 0 3 817 852 818
		f 3 1710 1711 -1696
		mu 0 3 854 853 816
		f 3 -1712 1712 -1620
		mu 0 3 816 853 810
		f 3 -1527 1713 -1699
		mu 0 3 771 770 828
		f 3 -1714 -1622 1714
		mu 0 3 828 770 818
		f 3 -1571 1715 -1701
		mu 0 3 791 785 814
		f 3 -1716 1716 -1617
		mu 0 3 814 785 809
		f 3 1717 1718 -1613
		mu 0 3 855 796 850
		f 3 -1719 1719 -1702
		mu 0 3 850 796 849
		f 3 1720 1721 -1651
		mu 0 3 832 856 833
		f 3 -1722 1722 -1705
		mu 0 3 833 856 851
		f 3 -1715 1723 -1639
		mu 0 3 828 818 827
		f 3 -1724 -1710 1724
		mu 0 3 827 818 852
		f 3 -1606 1725 1726
		mu 0 3 803 810 857
		f 3 -1726 -1713 1727
		mu 0 3 857 810 853
		f 3 -1546 1728 -1717
		mu 0 3 785 784 809
		f 3 -1729 1729 -1603
		mu 0 3 809 784 799
		f 3 1730 1731 -1632
		mu 0 3 858 795 855
		f 3 -1732 -1577 -1718
		mu 0 3 855 795 796
		f 3 1732 1733 -1688
		mu 0 3 844 859 832
		f 3 -1734 1734 -1721
		mu 0 3 832 859 856
		f 3 -1563 1735 -1656
		mu 0 3 769 772 837
		f 3 -1736 1736 -1625
		mu 0 3 837 772 860
		f 3 1737 1738 1739
		mu 0 3 861 804 857
		f 3 -1739 -1592 -1727
		mu 0 3 857 804 803
		f 3 -1573 1740 -1730
		mu 0 3 784 783 799
		f 3 -1741 1741 -1587
		mu 0 3 799 783 800
		f 3 1742 1743 -1679
		mu 0 3 862 806 858
		f 3 -1744 -1595 -1731
		mu 0 3 858 806 795
		f 3 1744 1745 -1704
		mu 0 3 849 863 844
		f 3 -1746 1746 -1733
		mu 0 3 844 863 859
		f 3 -1557 1747 -1737
		mu 0 3 772 776 860
		f 3 -1748 1748 -1676
		mu 0 3 860 776 864
		f 3 1749 1750 1751
		mu 0 3 866 865 861
		f 3 -1751 1752 -1738
		mu 0 3 861 865 804
		f 3 -1544 1753 -1742
		mu 0 3 783 781 800
		f 3 -1754 1754 1755
		mu 0 3 800 781 865
		f 3 -1627 1756 -1655
		mu 0 3 821 812 862
		f 3 -1757 -1609 -1743
		mu 0 3 862 812 806
		f 3 -1579 1757 -1720
		mu 0 3 796 794 849
		f 3 -1758 1758 -1745
		mu 0 3 849 794 863
		f 3 -1560 1759 -1749
		mu 0 3 776 790 864
		f 3 -1760 -1580 -1650
		mu 0 3 864 790 867
		f 3 -1588 1760 1761
		mu 0 3 802 800 866
		f 3 -1761 -1756 -1750
		mu 0 3 866 800 865
		f 3 -1542 1762 -1755
		mu 0 3 781 780 865
		f 3 -1763 -1590 -1753
		mu 0 3 865 780 804
		f 3 1763 1764 -1635
		mu 0 3 815 868 823
		f 3 -1765 1765 1766
		mu 0 3 823 868 869
		f 3 -1681 1767 1768
		mu 0 3 839 823 870
		f 3 -1768 -1767 1769
		mu 0 3 870 823 869
		f 3 1770 1771 -1637
		mu 0 3 827 871 825
		f 3 -1772 1772 1773
		mu 0 3 825 871 872
		f 3 -1683 1774 1775
		mu 0 3 842 825 873
		f 3 -1775 -1774 1776
		mu 0 3 873 825 872
		f 3 -1776 1777 -1662
		mu 0 3 842 873 841
		f 3 -1778 1778 1779
		mu 0 3 841 873 874
		f 3 -1697 1780 1781
		mu 0 3 848 841 875
		f 3 -1781 -1780 1782
		mu 0 3 875 841 874
		f 3 -1782 1783 -1711
		mu 0 3 854 876 853
		f 3 -1784 1784 1785
		mu 0 3 853 876 877
		f 3 -1728 1786 1787
		mu 0 3 857 853 878
		f 3 -1787 -1786 1788
		mu 0 3 878 853 877
		f 3 -1788 1789 -1740
		mu 0 3 857 878 861
		f 3 -1790 1790 1791
		mu 0 3 861 878 879
		f 3 -1752 1792 1793
		mu 0 3 866 861 880
		f 3 -1793 -1792 1794
		mu 0 3 880 861 879
		f 3 -1794 1795 -1762
		mu 0 3 866 880 802
		f 3 -1796 1796 1797
		mu 0 3 802 880 881
		f 3 -1586 1798 1799
		mu 0 3 801 802 882
		f 3 -1799 -1798 1800
		mu 0 3 882 802 881
		f 3 -1800 1801 -1602
		mu 0 3 801 882 808
		f 3 -1802 1802 1803
		mu 0 3 808 882 883
		f 3 -1616 1804 -1764
		mu 0 3 815 808 868
		f 3 -1805 -1804 1805
		mu 0 3 868 808 883
		f 3 -1769 1806 -1659
		mu 0 3 839 870 838
		f 3 -1807 1807 1808
		mu 0 3 838 870 884
		f 3 -1694 1809 1810
		mu 0 3 847 838 885
		f 3 -1810 -1809 1811
		mu 0 3 885 838 884
		f 3 -1811 1812 -1708
		mu 0 3 847 885 852
		f 3 -1813 1813 1814
		mu 0 3 852 885 886
		f 3 -1725 1815 -1771
		mu 0 3 827 852 871
		f 3 -1816 -1815 1816
		mu 0 3 871 852 886
		f 3 1817 1818 -1766
		mu 0 3 887 888 889
		f 3 -1819 1819 1820
		mu 0 3 889 888 890
		f 3 -1770 1821 1822
		mu 0 3 891 889 892
		f 3 -1822 -1821 1823
		mu 0 3 892 889 890
		f 3 -1773 1824 1825
		mu 0 3 893 894 895
		f 3 -1825 1826 1827
		mu 0 3 895 894 896
		f 3 -1777 1828 1829
		mu 0 3 897 893 898
		f 3 -1829 -1826 1830
		mu 0 3 898 893 895
		f 3 -1779 1831 1832
		mu 0 3 899 897 900
		f 3 -1832 -1830 1833
		mu 0 3 900 897 898
		f 3 -1783 1834 1835
		mu 0 3 901 899 902
		f 3 -1835 -1833 1836
		mu 0 3 902 899 900
		f 3 -1836 1837 -1785
		mu 0 3 901 902 903
		f 3 -1838 1838 1839
		mu 0 3 903 902 904
		f 3 -1840 1840 -1789
		mu 0 3 903 904 905
		f 3 -1841 1841 1842
		mu 0 3 905 904 906
		f 3 -1843 1843 -1791
		mu 0 3 905 906 907
		f 3 -1844 1844 1845
		mu 0 3 907 906 908
		f 3 -1846 1846 -1795
		mu 0 3 907 908 909
		f 3 -1847 1847 1848
		mu 0 3 909 908 910
		f 3 -1849 1849 -1797
		mu 0 3 909 910 911
		f 3 -1850 1850 1851
		mu 0 3 911 910 912
		f 3 -1852 1852 -1801
		mu 0 3 911 912 913
		f 3 -1853 1853 1854
		mu 0 3 913 912 914
		f 3 -1855 1855 -1803
		mu 0 3 913 914 915
		f 3 -1856 1856 1857
		mu 0 3 915 914 916
		f 3 -1858 1858 -1806
		mu 0 3 915 916 887
		f 3 -1859 1859 -1818
		mu 0 3 887 916 888
		f 3 -1808 1860 1861
		mu 0 3 917 891 918
		f 3 -1861 -1823 1862
		mu 0 3 918 891 892
		f 3 -1812 1863 1864
		mu 0 3 919 917 920
		f 3 -1864 -1862 1865
		mu 0 3 920 917 918
		f 3 -1814 1866 1867
		mu 0 3 921 919 922
		f 3 -1867 -1865 1868
		mu 0 3 922 919 920
		f 3 -1817 1869 -1827
		mu 0 3 894 921 896
		f 3 -1870 -1868 1870
		mu 0 3 896 921 922
		f 3 1871 1872 1873
		mu 0 3 925 923 926
		f 3 -1873 1874 1875
		mu 0 3 926 923 924
		f 3 1876 1877 1878
		mu 0 3 928 925 927
		f 3 -1874 1879 -1878
		mu 0 3 925 926 927
		f 3 -1877 1880 1881
		mu 0 3 925 928 930
		f 3 -1881 1882 1883
		mu 0 3 930 928 929
		f 3 1884 1885 -1882
		mu 0 3 930 931 925
		f 3 -1860 1886 1887
		mu 0 3 888 916 923
		f 3 -1887 1888 -1875
		mu 0 3 923 916 924
		f 3 -1857 1889 -1889
		mu 0 3 916 914 924
		f 3 -1854 1890 -1890
		mu 0 3 914 912 924
		f 3 -1891 1891 -1876
		mu 0 3 924 912 926
		f 3 -1851 1892 -1892
		mu 0 3 912 910 926
		f 3 -1848 1893 -1893
		mu 0 3 910 908 926
		f 3 -1894 1894 -1880
		mu 0 3 926 908 927
		f 3 -1845 1895 -1895
		mu 0 3 908 906 927
		f 3 -1842 1896 -1896
		mu 0 3 906 904 927
		f 3 -1897 1897 -1879
		mu 0 3 927 904 928
		f 3 -1839 1898 -1898
		mu 0 3 904 902 928
		f 3 -1837 1899 -1899
		mu 0 3 902 900 928
		f 3 -1900 1900 -1883
		mu 0 3 928 900 929
		f 3 -1834 1901 -1901
		mu 0 3 900 898 929
		f 3 -1831 1902 -1902
		mu 0 3 898 895 929
		f 3 -1903 1903 -1884
		mu 0 3 929 895 930
		f 3 -1828 1904 -1904
		mu 0 3 895 896 930
		f 3 -1871 1905 -1905
		mu 0 3 896 922 930
		f 3 -1906 1906 -1885
		mu 0 3 930 922 931
		f 3 -1869 1907 -1907
		mu 0 3 922 920 931
		f 3 -1866 1908 -1908
		mu 0 3 920 918 931
		f 3 -1909 1909 -1886
		mu 0 3 931 918 925
		f 3 -1863 1910 -1910
		mu 0 3 918 892 925
		f 3 -1824 1911 -1911
		mu 0 3 892 890 925
		f 3 -1912 1912 -1872
		mu 0 3 925 890 923
		f 3 -1820 -1888 -1913
		mu 0 3 890 888 923
		f 3 -694 1913 -770
		mu 0 3 932 933 934
		f 3 1914 1915 -995
		mu 0 3 936 934 935
		f 3 -1914 -1027 -1916
		mu 0 3 934 933 935
		f 3 1916 1917 -926
		mu 0 3 938 934 937
		f 3 -1915 -1048 -1918
		mu 0 3 934 936 937
		f 3 1918 1919 -841
		mu 0 3 940 934 939
		f 3 -1917 -1015 -1920
		mu 0 3 934 938 939
		f 3 -957 1920 -1919
		mu 0 3 940 941 934
		f 3 -1921 -892 1921
		mu 0 3 934 941 942
		f 3 -808 1922 -1922
		mu 0 3 942 943 934
		f 3 -1923 -738 1923
		mu 0 3 934 943 944
		f 3 -773 1924 -1924
		mu 0 3 944 945 934
		f 3 -1925 -699 1925
		mu 0 3 934 945 946
		f 3 -1029 1926 -1926
		mu 0 3 946 947 934
		f 3 -1927 -888 1927
		mu 0 3 934 947 948
		f 3 -804 -733 -1928
		mu 0 3 948 949 934
		f 3 1928 1929 1930
		mu 0 3 950 951 952
		f 3 -1930 1931 1932
		mu 0 3 952 951 953
		f 3 1933 1934 1935
		mu 0 3 954 955 956
		f 3 -1935 1936 1937
		mu 0 3 956 955 957
		f 3 1938 1939 1940
		mu 0 3 958 959 960
		f 3 -1940 1941 1942
		mu 0 3 960 959 961
		f 3 1943 1944 1945
		mu 0 3 962 958 963
		f 3 -1945 -1941 1946
		mu 0 3 963 958 960
		f 3 1947 1948 1949
		mu 0 3 964 965 966
		f 3 -1949 1950 1951
		mu 0 3 966 965 967
		f 3 1952 1953 1954
		mu 0 3 968 969 963
		f 3 -1954 1955 -1946
		mu 0 3 963 969 962
		f 3 1956 1957 1958
		mu 0 3 970 971 972
		f 3 -1958 1959 1960
		mu 0 3 972 971 973
		f 3 -1953 1961 1962
		mu 0 3 969 968 974
		f 3 -1962 1963 1964
		mu 0 3 974 968 975
		f 3 1965 1966 1967
		mu 0 3 976 977 975
		f 3 -1967 1968 -1965
		mu 0 3 975 977 974
		f 3 1969 1970 1971
		mu 0 3 978 979 980
		f 3 -1971 1972 1973
		mu 0 3 980 979 981
		f 3 1974 1975 1976
		mu 0 3 982 983 976
		f 3 -1976 1977 -1966
		mu 0 3 976 983 977
		f 3 1978 1979 1980
		mu 0 3 984 964 985
		f 3 -1980 -1950 1981
		mu 0 3 985 964 966
		f 3 1982 1983 1984
		mu 0 3 986 981 987
		f 3 -1984 -1973 1985
		mu 0 3 987 981 979
		f 3 1986 1987 1988
		mu 0 3 988 972 989
		f 3 -1988 -1961 1989
		mu 0 3 989 972 973
		f 3 1990 1991 -1985
		mu 0 3 987 990 986
		f 3 -1992 1992 1993
		mu 0 3 986 990 991
		f 3 1994 1995 1996
		mu 0 3 992 993 994
		f 3 -1996 1997 1998
		mu 0 3 994 993 995
		f 3 1999 2000 2001
		mu 0 3 996 997 990
		f 3 -2001 2002 -1993
		mu 0 3 990 997 991
		f 3 -1931 2003 2004
		mu 0 3 950 952 998
		f 3 -2004 2005 2006
		mu 0 3 998 952 999
		f 3 2007 2008 2009
		mu 0 3 1000 1001 996
		f 3 -2009 2010 -2000
		mu 0 3 996 1001 997
		f 3 2011 2012 2013
		mu 0 3 1002 1003 1004
		f 3 -2013 2014 2015
		mu 0 3 1004 1003 1005
		f 3 2016 2017 2018
		mu 0 3 1006 1007 1008
		f 3 -2018 2019 2020
		mu 0 3 1008 1007 1009
		f 3 2021 2022 2023
		mu 0 3 1010 1011 1012
		f 3 -2023 2024 2025
		mu 0 3 1012 1011 1013
		f 3 -2017 2026 2027
		mu 0 3 1007 1006 1002
		f 3 -2027 2028 -2012
		mu 0 3 1002 1006 1003
		f 3 2029 2030 -2025
		mu 0 3 1011 1008 1013
		f 3 -2031 -2021 2031
		mu 0 3 1013 1008 1009
		f 3 2032 2033 2034
		mu 0 3 1014 1015 1016
		f 3 -2034 2035 2036
		mu 0 3 1016 1015 1017
		f 3 -2036 2037 2038
		mu 0 3 1017 1015 988
		f 3 2039 2040 2041
		mu 0 3 1019 1020 1018
		f 3 -2041 2042 2043
		mu 0 3 1018 1020 1072
		f 3 2044 2045 -2040
		mu 0 3 1019 1021 1020
		f 3 2046 2047 -1937
		mu 0 3 955 984 957
		f 3 -2048 -1981 2048
		mu 0 3 957 984 985
		f 3 -1989 2049 -2039
		mu 0 3 988 989 1017
		f 3 2050 2051 2052
		mu 0 3 1022 1023 993
		f 3 -2052 2053 -1998
		mu 0 3 993 1023 995
		f 3 2054 2055 2056
		mu 0 3 1024 1025 1026
		f 3 -2056 2057 2058
		mu 0 3 1026 1025 1027
		f 3 2059 2060 2061
		mu 0 3 1028 1029 1030
		f 3 -2061 2062 2063
		mu 0 3 1030 1029 1031
		f 3 2064 2065 2066
		mu 0 3 1032 1033 1034
		f 3 -2066 2067 2068
		mu 0 3 1034 1033 1035
		f 3 2069 2070 2071
		mu 0 3 1036 1037 1038
		f 3 -2071 2072 2073
		mu 0 3 1038 1037 1039
		f 3 2074 2075 -2063
		mu 0 3 1029 961 1031
		f 3 -2076 -1942 2076
		mu 0 3 1031 961 959
		f 3 -2070 2077 2078
		mu 0 3 1037 1036 1000
		f 3 -2078 2079 -2008
		mu 0 3 1000 1036 1001
		f 3 -2074 2080 2081
		mu 0 3 1038 1039 1035
		f 3 -2081 2082 -2069
		mu 0 3 1035 1039 1034
		f 3 -2065 2083 2084
		mu 0 3 1033 1032 1040
		f 3 -2084 2085 2086
		mu 0 3 1040 1032 1041
		f 3 2087 2088 -2057
		mu 0 3 1026 1028 1024
		f 3 -2089 -2062 2089
		mu 0 3 1024 1028 1030
		f 3 2090 2091 2092
		mu 0 3 1042 1043 1044
		f 3 -2092 2093 2094
		mu 0 3 1044 1043 1045
		f 3 2095 2096 2097
		mu 0 3 1046 1047 1048
		f 3 -2097 2098 2099
		mu 0 3 1048 1047 1049
		f 3 2100 2101 2102
		mu 0 3 1050 1051 1052
		f 3 -2102 2103 2104
		mu 0 3 1052 1051 1053
		f 3 -2096 2105 2106
		mu 0 3 1047 1046 982
		f 3 -2106 2107 -1975
		mu 0 3 982 1046 983
		f 3 2108 2109 -2104
		mu 0 3 1051 978 1053
		f 3 -2110 -1972 2110
		mu 0 3 1053 978 980
		f 3 -2100 2111 2112
		mu 0 3 1048 1049 1005
		f 3 -2112 2113 -2016
		mu 0 3 1005 1049 1004
		f 3 2114 2115 -2024
		mu 0 3 1012 1050 1010
		f 3 -2116 -2103 2116
		mu 0 3 1010 1050 1052
		f 3 2117 2118 2119
		mu 0 3 1054 1055 1056
		f 3 -2119 2120 2121
		mu 0 3 1056 1055 1057
		f 3 2122 2123 -1932
		mu 0 3 951 1058 953
		f 3 -2124 2124 2125
		mu 0 3 953 1058 1059
		f 3 2126 2127 2128
		mu 0 3 1060 1061 1022
		f 3 -2128 2129 -2051
		mu 0 3 1022 1061 1023
		f 3 2130 2131 2132
		mu 0 3 1064 1062 1063
		f 3 -2132 2133 2134
		mu 0 3 1063 1062 1066
		f 3 -2133 2135 2136
		mu 0 3 1064 1063 1065
		f 3 -2136 2137 2138
		mu 0 3 1065 1063 1059
		f 3 2139 2140 2141
		mu 0 3 1060 1066 1067
		f 3 -2141 2142 2143
		mu 0 3 1067 1066 1069
		f 3 -2142 2144 -2127
		mu 0 3 1060 1067 1061
		f 3 -2145 2145 2146
		mu 0 3 1061 1067 1087
		f 3 -2143 2147 2148
		mu 0 3 1069 1066 1068
		f 3 -2148 -2134 2149
		mu 0 3 1068 1066 1062
		f 3 -2125 2150 -2139
		mu 0 3 1059 1058 1065
		f 3 -2035 2151 2152
		mu 0 3 1014 1016 1054
		f 3 -2152 2153 -2118
		mu 0 3 1054 1016 1055
		f 3 2154 2155 -2045
		mu 0 3 1019 954 1021
		f 3 -2156 -1936 2156
		mu 0 3 1021 954 956
		f 3 2157 2158 2159
		mu 0 3 1070 1057 1018
		f 3 -2159 2160 -2042
		mu 0 3 1018 1057 1019
		f 3 -2160 2161 2162
		mu 0 3 1070 1018 1071
		f 3 -2162 -2044 2163
		mu 0 3 1071 1018 1072
		f 3 -2043 2164 2165
		mu 0 3 1072 1020 1073
		f 3 -2165 2166 2167
		mu 0 3 1073 1020 1074
		f 3 -2167 -2046 2168
		mu 0 3 1074 1020 1021
		f 3 -2007 2169 2170
		mu 0 3 998 999 970
		f 3 -2170 2171 -1957
		mu 0 3 970 999 971
		f 3 2172 2173 -1951
		mu 0 3 965 992 967
		f 3 -2174 -1997 2174
		mu 0 3 967 992 994
		f 3 2175 2176 -2093
		mu 0 3 1044 1027 1042
		f 3 -2177 -2058 2177
		mu 0 3 1042 1027 1025
		f 3 2178 2179 -2087
		mu 0 3 1041 1075 1040
		f 3 -2180 -2094 2180
		mu 0 3 1040 1075 1076
		f 3 2181 -2161 -2121
		mu 0 3 1055 1019 1057
		f 3 -2154 2182 -2182
		mu 0 3 1055 1016 1019
		f 3 -2183 2183 -2155
		mu 0 3 1019 1016 954
		f 3 -2037 2184 -2184
		mu 0 3 1016 1017 954
		f 3 -2185 2185 -1934
		mu 0 3 954 1017 955
		f 3 -2050 2186 -2186
		mu 0 3 1017 989 955
		f 3 -2187 2187 -2047
		mu 0 3 955 989 984
		f 3 -1990 2188 -2188
		mu 0 3 989 973 984
		f 3 -2189 2189 -1979
		mu 0 3 984 973 964
		f 3 -1960 2190 -2190
		mu 0 3 973 971 964
		f 3 -2191 2191 -1948
		mu 0 3 964 971 965
		f 3 -2172 2192 -2192
		mu 0 3 971 999 965
		f 3 -2193 2193 -2173
		mu 0 3 965 999 992
		f 3 2194 2195 -2006
		mu 0 3 952 993 999
		f 3 -2196 -1995 -2194
		mu 0 3 999 993 992
		f 3 -1933 2196 -2195
		mu 0 3 952 953 993
		f 3 -2197 2197 -2053
		mu 0 3 993 953 1022
		f 3 -2126 2198 -2198
		mu 0 3 953 1059 1022
		f 3 -2199 2199 -2129
		mu 0 3 1022 1059 1060
		f 3 -2140 2200 -2135
		mu 0 3 1066 1060 1063
		f 3 -2201 -2200 -2138
		mu 0 3 1063 1060 1059
		f 3 -2169 2201 2202
		mu 0 3 1074 1021 1077
		f 3 -2202 -2157 2203
		mu 0 3 1077 1021 956
		f 3 2204 2205 -2204
		mu 0 3 956 1078 1077
		f 3 -1938 2206 -2205
		mu 0 3 956 957 1078
		f 3 -2207 2207 2208
		mu 0 3 1078 957 1079
		f 3 -2049 2209 -2208
		mu 0 3 957 985 1079
		f 3 -2210 2210 2211
		mu 0 3 1079 985 1080
		f 3 -1982 2212 -2211
		mu 0 3 985 966 1080
		f 3 -2213 2213 2214
		mu 0 3 1080 966 1081
		f 3 -1952 2215 -2214
		mu 0 3 966 967 1081
		f 3 -2216 2216 2217
		mu 0 3 1081 967 1082
		f 3 -2175 2218 -2217
		mu 0 3 967 994 1082
		f 3 -2219 2219 2220
		mu 0 3 1082 994 1083
		f 3 -1999 2221 -2220
		mu 0 3 994 995 1083
		f 3 -2222 2222 2223
		mu 0 3 1083 995 1084
		f 3 2224 2225 -2054
		mu 0 3 1023 1085 995
		f 3 -2226 2226 -2223
		mu 0 3 995 1085 1084
		f 3 2227 2228 -2130
		mu 0 3 1061 1086 1023
		f 3 -2229 2229 -2225
		mu 0 3 1023 1086 1085
		f 3 2230 -2228 -2147
		mu 0 3 1087 1086 1061
		f 3 2231 2232 -2144
		mu 0 3 1069 1088 1067
		f 3 -2233 2233 -2146
		mu 0 3 1067 1088 1087
		f 3 2234 2235 -2158
		mu 0 3 1070 1089 1057
		f 3 -2236 2236 -2122
		mu 0 3 1057 1089 1056
		f 3 -2015 2237 2238
		mu 0 3 1090 1091 1092
		f 3 -2238 2239 2240
		mu 0 3 1092 1091 1093
		f 3 2241 2242 -2029
		mu 0 3 1094 1095 1091
		f 3 -2243 2243 -2240
		mu 0 3 1091 1095 1093
		f 3 2244 2245 -2019
		mu 0 3 1096 1097 1094
		f 3 -2246 2246 -2242
		mu 0 3 1094 1097 1095
		f 3 2247 2248 -2030
		mu 0 3 1098 1099 1096
		f 3 -2249 2249 -2245
		mu 0 3 1096 1099 1097
		f 3 2250 2251 -2022
		mu 0 3 1100 1101 1098
		f 3 -2252 2252 -2248
		mu 0 3 1098 1101 1099
		f 3 2253 2254 -2117
		mu 0 3 1102 1103 1100
		f 3 -2255 2255 -2251
		mu 0 3 1100 1103 1101
		f 3 2256 2257 -2105
		mu 0 3 1104 1105 1102
		f 3 -2258 2258 -2254
		mu 0 3 1102 1105 1103
		f 3 -2111 2259 -2257
		mu 0 3 1104 1106 1105
		f 3 -2260 2260 2261
		mu 0 3 1105 1106 1107
		f 3 -1974 2262 -2261
		mu 0 3 1106 1108 1107
		f 3 -2263 2263 2264
		mu 0 3 1107 1108 1109
		f 3 -1983 2265 -2264
		mu 0 3 1108 1110 1109
		f 3 -2266 2266 2267
		mu 0 3 1109 1110 1111
		f 3 -1994 2268 -2267
		mu 0 3 1110 1112 1111
		f 3 -2269 2269 2270
		mu 0 3 1111 1112 1113
		f 3 -2003 2271 -2270
		mu 0 3 1112 1114 1113
		f 3 -2272 2272 2273
		mu 0 3 1113 1114 1115
		f 3 2274 2275 -2011
		mu 0 3 1116 1117 1114
		f 3 -2276 2276 -2273
		mu 0 3 1114 1117 1115
		f 3 2277 2278 -2080
		mu 0 3 1118 1119 1116
		f 3 -2279 2279 -2275
		mu 0 3 1116 1119 1117
		f 3 2280 2281 -2072
		mu 0 3 1120 1121 1118
		f 3 -2282 2282 -2278
		mu 0 3 1118 1121 1119
		f 3 2283 2284 -2082
		mu 0 3 1122 1123 1120
		f 3 -2285 2285 -2281
		mu 0 3 1120 1123 1121
		f 3 2286 2287 -2068
		mu 0 3 1124 1125 1122
		f 3 -2288 2288 -2284
		mu 0 3 1122 1125 1123
		f 3 2289 2290 -2085
		mu 0 3 1126 1127 1124
		f 3 -2291 2291 -2287
		mu 0 3 1124 1127 1125
		f 3 2292 2293 -2181
		mu 0 3 1128 1129 1126
		f 3 -2294 2294 -2290
		mu 0 3 1126 1129 1127
		f 3 -2091 2295 -2293
		mu 0 3 1128 1130 1129
		f 3 -2296 2296 2297
		mu 0 3 1129 1130 1131
		f 3 -2178 2298 -2297
		mu 0 3 1130 1132 1131
		f 3 -2299 2299 2300
		mu 0 3 1131 1132 1133
		f 3 -2055 2301 -2300
		mu 0 3 1132 1134 1133
		f 3 -2302 2302 2303
		mu 0 3 1133 1134 1135
		f 3 -2090 2304 -2303
		mu 0 3 1134 1136 1135
		f 3 -2305 2305 2306
		mu 0 3 1135 1136 1137
		f 3 -2064 2307 -2306
		mu 0 3 1136 1138 1137
		f 3 -2308 2308 2309
		mu 0 3 1137 1138 1139
		f 3 -2077 2310 -2309
		mu 0 3 1138 1140 1139
		f 3 -2311 2311 2312
		mu 0 3 1139 1140 1141
		f 3 -1939 2313 -2312
		mu 0 3 1140 1142 1141
		f 3 -2314 2314 2315
		mu 0 3 1141 1142 1143
		f 3 -1944 2316 -2315
		mu 0 3 1142 1144 1143
		f 3 -2317 2317 2318
		mu 0 3 1143 1144 1145
		f 3 2319 2320 -1956
		mu 0 3 1146 1147 1144
		f 3 -2321 2321 -2318
		mu 0 3 1144 1147 1145
		f 3 -1963 2322 -2320
		mu 0 3 1146 1148 1147
		f 3 -2323 2323 2324
		mu 0 3 1147 1148 1149
		f 3 -1969 2325 -2324
		mu 0 3 1148 1150 1149
		f 3 -2326 2326 2327
		mu 0 3 1149 1150 1151
		f 3 -1978 2328 -2327
		mu 0 3 1150 1152 1151
		f 3 -2329 2329 2330
		mu 0 3 1151 1152 1153
		f 3 -2108 2331 -2330
		mu 0 3 1152 1154 1153
		f 3 -2332 2332 2333
		mu 0 3 1153 1154 1155
		f 3 -2098 2334 -2333
		mu 0 3 1154 1156 1155
		f 3 -2335 2335 2336
		mu 0 3 1155 1156 1157
		f 3 -2113 2337 -2336
		mu 0 3 1156 1090 1157
		f 3 -2338 -2239 2338
		mu 0 3 1157 1090 1092
		f 3 -2033 2339 2340
		mu 0 3 1015 1014 1107
		f 3 -2340 2341 -2262
		mu 0 3 1107 1014 1105
		f 3 -2038 2342 2343
		mu 0 3 988 1015 1109
		f 3 -2343 -2341 -2265
		mu 0 3 1109 1015 1107
		f 3 -1987 2344 2345
		mu 0 3 972 988 1111
		f 3 -2345 -2344 -2268
		mu 0 3 1111 988 1109
		f 3 -2346 2346 -1959
		mu 0 3 972 1111 970
		f 3 -2347 -2271 2347
		mu 0 3 970 1111 1113
		f 3 -2348 2348 -2171
		mu 0 3 970 1113 998
		f 3 -2349 -2274 2349
		mu 0 3 998 1113 1115
		f 3 -2350 2350 -2005
		mu 0 3 998 1115 950
		f 3 -2351 -2277 2351
		mu 0 3 950 1115 1117
		f 3 -2352 2352 -1929
		mu 0 3 950 1117 951
		f 3 -2353 -2280 2353
		mu 0 3 951 1117 1119
		f 3 -2354 2354 -2123
		mu 0 3 951 1119 1058
		f 3 -2355 -2283 2355
		mu 0 3 1058 1119 1121
		f 3 -2356 2356 -2151
		mu 0 3 1058 1121 1065
		f 3 -2357 -2286 2357
		mu 0 3 1065 1121 1123
		f 3 -2358 2358 -2137
		mu 0 3 1065 1123 1064
		f 3 -2359 -2289 2359
		mu 0 3 1064 1123 1125
		f 3 -2360 2360 -2131
		mu 0 3 1064 1125 1062
		f 3 -2361 -2292 2361
		mu 0 3 1062 1125 1127
		f 3 -2362 2362 -2150
		mu 0 3 1062 1127 1068;
	setAttr ".fc[1500:1999]"
		f 3 -2363 -2295 2363
		mu 0 3 1068 1127 1129
		f 3 -2149 2364 2365
		mu 0 3 1069 1068 1131
		f 3 -2365 -2364 -2298
		mu 0 3 1131 1068 1129
		f 3 -2232 2366 2367
		mu 0 3 1088 1069 1133
		f 3 -2367 -2366 -2301
		mu 0 3 1133 1069 1131
		f 3 -2234 2368 2369
		mu 0 3 1087 1088 1135
		f 3 -2369 -2368 -2304
		mu 0 3 1135 1088 1133
		f 3 -2231 2370 2371
		mu 0 3 1086 1087 1137
		f 3 -2371 -2370 -2307
		mu 0 3 1137 1087 1135
		f 3 -2230 2372 2373
		mu 0 3 1085 1086 1139
		f 3 -2373 -2372 -2310
		mu 0 3 1139 1086 1137
		f 3 -2227 2374 2375
		mu 0 3 1084 1085 1141
		f 3 -2375 -2374 -2313
		mu 0 3 1141 1085 1139
		f 3 -2224 2376 2377
		mu 0 3 1083 1084 1143
		f 3 -2377 -2376 -2316
		mu 0 3 1143 1084 1141
		f 3 -2221 2378 2379
		mu 0 3 1082 1083 1145
		f 3 -2379 -2378 -2319
		mu 0 3 1145 1083 1143
		f 3 -2218 2380 2381
		mu 0 3 1081 1082 1147
		f 3 -2381 -2380 -2322
		mu 0 3 1147 1082 1145
		f 3 -2382 2382 -2215
		mu 0 3 1081 1147 1080
		f 3 -2383 -2325 2383
		mu 0 3 1080 1147 1149
		f 3 -2384 2384 -2212
		mu 0 3 1080 1149 1079
		f 3 -2385 -2328 2385
		mu 0 3 1079 1149 1151
		f 3 -2386 2386 -2209
		mu 0 3 1079 1151 1078
		f 3 -2387 -2331 2387
		mu 0 3 1078 1151 1153
		f 3 -2388 2388 -2206
		mu 0 3 1078 1153 1077
		f 3 -2389 -2334 2389
		mu 0 3 1077 1153 1155
		f 3 -2390 2390 -2203
		mu 0 3 1077 1155 1074
		f 3 -2391 -2337 2391
		mu 0 3 1074 1155 1157
		f 3 -2392 2392 -2168
		mu 0 3 1074 1157 1073
		f 3 -2393 -2339 2393
		mu 0 3 1073 1157 1092
		f 3 -2394 2394 -2166
		mu 0 3 1073 1092 1072
		f 3 -2395 -2241 2395
		mu 0 3 1072 1092 1093
		f 3 -2396 2396 -2164
		mu 0 3 1072 1093 1071
		f 3 -2397 -2244 2397
		mu 0 3 1071 1093 1095
		f 3 -2398 2398 -2163
		mu 0 3 1071 1095 1070
		f 3 -2399 -2247 2399
		mu 0 3 1070 1095 1097
		f 3 -2400 2400 -2235
		mu 0 3 1070 1097 1089
		f 3 -2401 -2250 2401
		mu 0 3 1089 1097 1099
		f 3 -2237 2402 2403
		mu 0 3 1056 1089 1101
		f 3 -2403 -2402 -2253
		mu 0 3 1101 1089 1099
		f 3 -2256 2404 -2404
		mu 0 3 1101 1103 1056
		f 3 -2405 2405 -2120
		mu 0 3 1056 1103 1054
		f 3 -2153 2406 -2342
		mu 0 3 1014 1054 1105
		f 3 -2407 -2406 -2259
		mu 0 3 1105 1054 1103
		f 3 2407 2408 2409
		mu 0 3 1159 1160 1158
		f 3 -2409 2410 2411
		mu 0 3 1158 1160 1161
		f 3 2412 2413 2414
		mu 0 3 1163 1164 1162
		f 3 -2414 2415 2416
		mu 0 3 1162 1164 1165
		f 3 2417 2418 2419
		mu 0 3 1164 1167 1166
		f 3 -2419 2420 2421
		mu 0 3 1166 1167 1168
		f 3 2422 2423 2424
		mu 0 3 1169 1170 1172
		f 3 -2424 2425 2426
		mu 0 3 1172 1170 1171
		f 3 2427 2428 2429
		mu 0 3 1174 1175 1173
		f 3 -2429 2430 2431
		mu 0 3 1173 1175 1176
		f 3 2432 2433 2434
		mu 0 3 1178 1158 1177
		f 3 -2434 2435 2436
		mu 0 3 1177 1158 1179
		f 3 2437 2438 2439
		mu 0 3 1180 1181 1183
		f 3 -2439 2440 2441
		mu 0 3 1183 1181 1182
		f 3 2442 2443 2444
		mu 0 3 1184 1185 1187
		f 3 -2444 2445 2446
		mu 0 3 1187 1185 1186
		f 3 2447 2448 2449
		mu 0 3 1188 1189 1191
		f 3 -2449 2450 2451
		mu 0 3 1191 1189 1190
		f 3 2452 2453 2454
		mu 0 3 1193 1194 1192
		f 3 -2454 2455 2456
		mu 0 3 1192 1194 1178
		f 3 2457 2458 2459
		mu 0 3 1195 1196 1175
		f 3 -2459 2460 -2431
		mu 0 3 1175 1196 1176
		f 3 2461 2462 2463
		mu 0 3 1198 1199 1197
		f 3 -2463 2464 2465
		mu 0 3 1197 1199 1200
		f 3 -2458 2466 2467
		mu 0 3 1196 1195 1201
		f 3 -2467 2468 2469
		mu 0 3 1201 1195 1202
		f 3 2470 2471 2472
		mu 0 3 1203 1204 1206
		f 3 -2472 2473 2474
		mu 0 3 1206 1204 1205
		f 3 2475 2476 -2461
		mu 0 3 1196 1207 1176
		f 3 -2477 2477 2478
		mu 0 3 1176 1207 1208
		f 3 -2411 2479 2480
		mu 0 3 1161 1160 1209
		f 3 -2480 2481 2482
		mu 0 3 1209 1160 1210
		f 3 2483 2484 2485
		mu 0 3 1208 1211 1212
		f 3 -2485 2486 2487
		mu 0 3 1212 1211 1177
		f 3 2488 2489 2490
		mu 0 3 1214 1215 1213
		f 3 -2490 2491 2492
		mu 0 3 1213 1215 1163
		f 3 2493 2494 2495
		mu 0 3 1217 1218 1216
		f 3 -2495 2496 2497
		mu 0 3 1216 1218 1219
		f 3 2498 2499 2500
		mu 0 3 1220 1180 1221
		f 3 -2500 -2440 2501
		mu 0 3 1221 1180 1183
		f 3 2502 2503 2504
		mu 0 3 1223 1224 1222
		f 3 -2504 2505 2506
		mu 0 3 1222 1224 1225
		f 3 2507 2508 2509
		mu 0 3 1226 1227 1229
		f 3 -2509 2510 2511
		mu 0 3 1229 1227 1228
		f 3 -2421 2512 2513
		mu 0 3 1168 1167 1230
		f 3 -2513 2514 2515
		mu 0 3 1230 1167 1231
		f 3 2516 2517 2518
		mu 0 3 1232 1217 1233
		f 3 2519 2520 -2516
		mu 0 3 1231 1234 1230
		f 3 -2521 2521 2522
		mu 0 3 1230 1234 1235
		f 3 2523 2524 2525
		mu 0 3 1236 1237 1239
		f 3 -2525 2526 2527
		mu 0 3 1239 1237 1238
		f 3 2528 2529 2530
		mu 0 3 1240 1241 1223
		f 3 -2530 2531 2532
		mu 0 3 1223 1241 1236
		f 3 -2524 2533 2534
		mu 0 3 1237 1236 1242
		f 3 -2534 -2532 2535
		mu 0 3 1242 1236 1241
		f 3 2536 2537 2538
		mu 0 3 1202 1244 1243
		f 3 -2538 2539 2540
		mu 0 3 1243 1244 1245
		f 3 -2541 2541 2542
		mu 0 3 1243 1245 1246
		f 3 -2542 2543 2544
		mu 0 3 1246 1245 1247
		f 3 2545 -2493 2546
		mu 0 3 1248 1213 1163
		f 3 -2491 2547 2548
		mu 0 3 1214 1213 1249
		f 3 2549 2550 2551
		mu 0 3 1251 1162 1250
		f 3 -2551 -2417 2552
		mu 0 3 1250 1162 1165
		f 3 2553 2554 2555
		mu 0 3 1252 1253 1249
		f 3 -2555 2556 2557
		mu 0 3 1249 1253 1254
		f 3 -2556 2558 2559
		mu 0 3 1252 1249 1255
		f 3 -2559 -2548 2560
		mu 0 3 1255 1249 1213
		f 3 -2408 2561 2562
		mu 0 3 1160 1159 1256
		f 3 2563 2564 2565
		mu 0 3 1257 1258 1260
		f 3 -2565 2566 2567
		mu 0 3 1260 1258 1259
		f 3 2568 2569 2570
		mu 0 3 1262 1263 1261
		f 3 -2570 2571 2572
		mu 0 3 1261 1263 1264
		f 3 2573 2574 2575
		mu 0 3 1266 1267 1265
		f 3 -2575 2576 2577
		mu 0 3 1265 1267 1268
		f 3 -2572 2578 2579
		mu 0 3 1264 1263 1269
		f 3 -2579 2580 2581
		mu 0 3 1269 1263 1270
		f 3 2582 2583 -2574
		mu 0 3 1266 1271 1267
		f 3 -2584 2584 2585
		mu 0 3 1267 1271 1272
		f 3 2586 2587 2588
		mu 0 3 1273 1274 1275
		f 3 2589 2590 2591
		mu 0 3 1277 1278 1276
		f 3 -2591 2592 2593
		mu 0 3 1276 1278 1279
		f 3 2594 2595 2596
		mu 0 3 1280 1281 1282
		f 3 -2595 2597 2598
		mu 0 3 1281 1280 1283
		f 3 -2598 2599 2600
		mu 0 3 1283 1280 1284
		f 3 2601 2602 2603
		mu 0 3 1286 1287 1285
		f 3 -2603 2604 2605
		mu 0 3 1285 1287 1288
		f 3 2606 2607 2608
		mu 0 3 1290 1291 1289
		f 3 -2608 2609 2610
		mu 0 3 1289 1291 1292
		f 3 2611 2612 -2607
		mu 0 3 1290 1285 1291
		f 3 -2597 2613 2614
		mu 0 3 1280 1282 1293
		f 3 -2614 2615 2616
		mu 0 3 1293 1282 1294
		f 3 2617 2618 -2601
		mu 0 3 1284 1295 1283
		f 3 -2619 2619 2620
		mu 0 3 1283 1295 1296
		f 3 2621 2622 -2620
		mu 0 3 1295 1297 1296
		f 3 -2623 2623 2624
		mu 0 3 1296 1297 1273
		f 3 2625 2626 -2588
		mu 0 3 1274 1298 1275
		f 3 -2627 2627 2628
		mu 0 3 1275 1298 1299
		f 3 2629 2630 -2593
		mu 0 3 1278 1300 1279
		f 3 -2631 2631 2632
		mu 0 3 1279 1300 1301
		f 3 2633 2634 2635
		mu 0 3 1303 1304 1302
		f 3 -2635 2636 2637
		mu 0 3 1302 1304 1305
		f 3 2638 2639 2640
		mu 0 3 1306 1307 1308
		f 3 2641 2642 2643
		mu 0 3 1309 1310 1311
		f 3 2644 2645 2646
		mu 0 3 1288 1312 1291
		f 3 -2646 2647 2648
		mu 0 3 1291 1312 1313
		f 3 2649 2650 -2602
		mu 0 3 1286 1172 1287
		f 3 -2651 -2427 2651
		mu 0 3 1287 1172 1171
		f 3 2652 2653 2654
		mu 0 3 1315 1316 1314
		f 3 -2654 2655 2656
		mu 0 3 1314 1316 1317
		f 3 -2656 2657 2658
		mu 0 3 1317 1316 1318
		f 3 -2658 2659 2660
		mu 0 3 1318 1316 1319
		f 3 2661 2662 2663
		mu 0 3 1320 1294 1319
		f 3 -2663 2664 -2661
		mu 0 3 1319 1294 1318
		f 3 2665 2666 2667
		mu 0 3 1321 1322 1323
		f 3 2668 2669 2670
		mu 0 3 1325 1326 1324
		f 3 -2670 2671 2672
		mu 0 3 1324 1326 1327
		f 3 2673 2674 2675
		mu 0 3 1323 1328 1324
		f 3 2676 2677 2678
		mu 0 3 1330 1331 1329
		f 3 -2678 2679 2680
		mu 0 3 1329 1331 1332
		f 3 2681 2682 2683
		mu 0 3 1333 1231 1334
		f 3 -2683 -2515 2684
		mu 0 3 1334 1231 1167
		f 3 2685 2686 2687
		mu 0 3 1173 1336 1335
		f 3 -2687 2688 2689
		mu 0 3 1335 1336 1337
		f 3 -2638 2690 2691
		mu 0 3 1302 1305 1338
		f 3 -2691 2692 2693
		mu 0 3 1338 1305 1339
		f 3 -2545 2694 2695
		mu 0 3 1246 1247 1340
		f 3 -2695 2696 2697
		mu 0 3 1340 1247 1341
		f 3 2698 2699 2700
		mu 0 3 1343 1312 1342
		f 3 -2700 -2645 2701
		mu 0 3 1342 1312 1288
		f 3 2702 2703 2704
		mu 0 3 1344 1345 1347
		f 3 -2704 2705 2706
		mu 0 3 1347 1345 1346
		f 3 2707 2708 2709
		mu 0 3 1349 1350 1348
		f 3 -2709 2710 2711
		mu 0 3 1348 1350 1351
		f 3 2712 2713 2714
		mu 0 3 1353 1354 1352
		f 3 -2714 2715 2716
		mu 0 3 1352 1354 1355
		f 3 2717 2718 2719
		mu 0 3 1357 1358 1356
		f 3 -2719 2720 2721
		mu 0 3 1356 1358 1359
		f 3 2722 2723 -2474
		mu 0 3 1204 1360 1205
		f 3 -2724 2724 2725
		mu 0 3 1205 1360 1361
		f 3 2726 2727 2728
		mu 0 3 1363 1364 1362
		f 3 -2728 2729 2730
		mu 0 3 1362 1364 1365
		f 3 -2489 2731 2732
		mu 0 3 1215 1214 1367
		f 3 -2732 2733 2734
		mu 0 3 1367 1214 1366
		f 3 2735 2736 2737
		mu 0 3 1368 1240 1370
		f 3 -2737 2738 2739
		mu 0 3 1370 1240 1369
		f 3 2740 2741 2742
		mu 0 3 1372 1373 1371
		f 3 -2742 2743 2744
		mu 0 3 1371 1373 1374
		f 3 -2561 2745 2746
		mu 0 3 1255 1213 1375
		f 3 -2746 -2546 2747
		mu 0 3 1375 1213 1248
		f 3 2748 2749 2750
		mu 0 3 1377 1378 1376
		f 3 -2750 2751 2752
		mu 0 3 1376 1378 1379
		f 3 2753 2754 2755
		mu 0 3 1381 1382 1380
		f 3 -2755 2756 2757
		mu 0 3 1380 1382 1383
		f 3 2758 2759 2760
		mu 0 3 1385 1386 1384
		f 3 -2760 2761 2762
		mu 0 3 1384 1386 1387
		f 3 2763 2764 2765
		mu 0 3 1388 1389 1378
		f 3 -2765 2766 2767
		mu 0 3 1378 1389 1390
		f 3 2768 2769 2770
		mu 0 3 1392 1393 1391
		f 3 -2770 2771 2772
		mu 0 3 1391 1393 1394
		f 3 2773 2774 2775
		mu 0 3 1396 1397 1395
		f 3 -2775 2776 2777
		mu 0 3 1395 1397 1398
		f 3 2778 2779 -2648
		mu 0 3 1312 1399 1313
		f 3 -2780 2780 2781
		mu 0 3 1313 1399 1400
		f 3 2782 2783 2784
		mu 0 3 1402 1403 1401
		f 3 -2784 2785 2786
		mu 0 3 1401 1403 1404
		f 3 2787 2788 2789
		mu 0 3 1406 1407 1405
		f 3 -2789 2790 2791
		mu 0 3 1405 1407 1408
		f 3 2792 2793 2794
		mu 0 3 1410 1411 1409
		f 3 -2794 2795 2796
		mu 0 3 1409 1411 1412
		f 3 2797 2798 2799
		mu 0 3 1414 1415 1413
		f 3 -2799 2800 2801
		mu 0 3 1413 1415 1416
		f 3 2802 2803 2804
		mu 0 3 1418 1419 1417
		f 3 -2804 2805 2806
		mu 0 3 1417 1419 1420
		f 3 2807 2808 2809
		mu 0 3 1422 1423 1421
		f 3 -2809 2810 2811
		mu 0 3 1421 1423 1424
		f 3 2812 2813 2814
		mu 0 3 1426 1427 1425
		f 3 -2814 2815 2816
		mu 0 3 1425 1427 1428
		f 3 2817 2818 2819
		mu 0 3 1430 1431 1429
		f 3 -2819 2820 2821
		mu 0 3 1429 1431 1432
		f 3 2822 2823 2824
		mu 0 3 1433 1434 1435
		f 3 2825 2826 -2824
		mu 0 3 1434 1436 1435
		f 3 -2827 2827 2828
		mu 0 3 1435 1436 1437
		f 3 2829 2830 2831
		mu 0 3 1439 1440 1438
		f 3 -2831 2832 2833
		mu 0 3 1438 1440 1441
		f 3 2834 2835 2836
		mu 0 3 1443 1444 1442
		f 3 -2836 2837 2838
		mu 0 3 1442 1444 1445
		f 3 2839 2840 2841
		mu 0 3 1447 1448 1446
		f 3 -2841 2842 2843
		mu 0 3 1446 1448 1449
		f 3 2844 2845 2846
		mu 0 3 1451 1452 1450
		f 3 -2846 2847 2848
		mu 0 3 1450 1452 1453
		f 3 2849 2850 2851
		mu 0 3 1455 1456 1454
		f 3 -2851 2852 2853
		mu 0 3 1454 1456 1457
		f 3 2854 2855 2856
		mu 0 3 1459 1460 1458
		f 3 -2856 2857 2858
		mu 0 3 1458 1460 1461
		f 3 2859 2860 2861
		mu 0 3 1463 1464 1462
		f 3 -2861 2862 2863
		mu 0 3 1462 1464 1465
		f 3 2864 2865 2866
		mu 0 3 1467 1468 1466
		f 3 -2866 2867 2868
		mu 0 3 1466 1468 1469
		f 3 2869 2870 2871
		mu 0 3 1471 1472 1470
		f 3 -2871 2872 2873
		mu 0 3 1470 1472 1473
		f 3 2874 2875 2876
		mu 0 3 1475 1476 1474
		f 3 -2876 2877 2878
		mu 0 3 1474 1476 1477
		f 3 2879 2880 2881
		mu 0 3 1479 1480 1478
		f 3 -2881 2882 2883
		mu 0 3 1478 1480 1481
		f 3 2884 2885 2886
		mu 0 3 1483 1484 1482
		f 3 -2886 2887 2888
		mu 0 3 1482 1484 1485
		f 3 2889 2890 2891
		mu 0 3 1487 1488 1486
		f 3 -2891 2892 2893
		mu 0 3 1486 1488 1489
		f 3 2894 2895 2896
		mu 0 3 1491 1492 1490
		f 3 -2896 2897 2898
		mu 0 3 1490 1492 1493
		f 3 2899 2900 -2897
		mu 0 3 1490 1494 1491
		f 3 -2901 2901 2902
		mu 0 3 1491 1494 1495
		f 3 2903 2904 2905
		mu 0 3 1497 1498 1496
		f 3 -2905 2906 2907
		mu 0 3 1496 1498 1499
		f 3 -2904 2908 2909
		mu 0 3 1498 1497 1500
		f 3 -2909 2910 2911
		mu 0 3 1500 1497 1501
		f 3 2912 2913 2914
		mu 0 3 1503 1504 1502
		f 3 -2914 2915 2916
		mu 0 3 1502 1504 1505
		f 3 -2913 2917 2918
		mu 0 3 1504 1503 1506
		f 3 -2918 2919 2920
		mu 0 3 1506 1503 1507
		f 3 -2583 2921 2922
		mu 0 3 1271 1266 1508
		f 3 -2922 2923 2924
		mu 0 3 1508 1266 1509
		f 3 2925 2926 2927
		mu 0 3 1511 1512 1510
		f 3 -2927 2928 2929
		mu 0 3 1510 1512 1513
		f 3 2930 2931 2932
		mu 0 3 1515 1516 1514
		f 3 -2932 2933 2934
		mu 0 3 1514 1516 1517
		f 3 2935 2936 2937
		mu 0 3 1519 1520 1518
		f 3 -2937 -2916 2938
		mu 0 3 1518 1520 1521
		f 3 2939 2940 2941
		mu 0 3 1523 1524 1522
		f 3 -2941 2942 -2576
		mu 0 3 1522 1524 1525
		f 3 2943 2944 2945
		mu 0 3 1526 1527 1258
		f 3 -2945 2946 -2567
		mu 0 3 1258 1527 1259
		f 3 2947 2948 2949
		mu 0 3 1529 1530 1528
		f 3 -2949 2950 2951
		mu 0 3 1528 1530 1531
		f 3 2952 2953 -2618
		mu 0 3 1533 1534 1532
		f 3 -2954 2954 2955
		mu 0 3 1532 1534 1535
		f 3 2956 2957 2958
		mu 0 3 1537 1538 1536
		f 3 -2958 2959 2960
		mu 0 3 1536 1538 1539
		f 3 2961 2962 2963
		mu 0 3 1540 1541 1210
		f 3 -2963 2964 -2483
		mu 0 3 1210 1541 1209
		f 3 2965 2966 2967
		mu 0 3 1542 1543 1545
		f 3 -2967 2968 2969
		mu 0 3 1545 1543 1544
		f 3 2970 2971 2972
		mu 0 3 1546 1547 1427
		f 3 -2972 2973 2974
		mu 0 3 1427 1547 1548
		f 3 2975 2976 2977
		mu 0 3 1550 1302 1549
		f 3 -2977 -2692 2978
		mu 0 3 1549 1302 1338
		f 3 2979 2980 2981
		mu 0 3 1551 1287 1232
		f 3 -2981 -2652 2982
		mu 0 3 1232 1287 1171
		f 3 2983 2984 -2682
		mu 0 3 1333 1552 1231
		f 3 -2985 2985 -2520
		mu 0 3 1231 1552 1234
		f 3 -2984 2986 2987
		mu 0 3 1552 1333 1553
		f 3 -2987 2988 2989
		mu 0 3 1553 1333 1554
		f 3 2990 2991 2992
		mu 0 3 1556 1557 1555
		f 3 -2992 2993 2994
		mu 0 3 1555 1557 1558
		f 3 2995 2996 -2621
		mu 0 3 1296 1559 1283
		f 3 -2997 2997 2998
		mu 0 3 1283 1559 1560
		f 3 2999 3000 3001
		mu 0 3 1561 1358 1334
		f 3 -3001 3002 3003
		mu 0 3 1334 1358 1562
		f 3 3004 3005 3006
		mu 0 3 1563 1564 1566
		f 3 -3006 3007 3008
		mu 0 3 1566 1564 1565
		f 3 3009 3010 3011
		mu 0 3 1568 1294 1567
		f 3 -3011 -2616 3012
		mu 0 3 1567 1294 1282
		f 3 3013 3014 -2473
		mu 0 3 1206 1569 1203
		f 3 -3015 3015 3016
		mu 0 3 1203 1569 1570
		f 3 3017 3018 3019
		mu 0 3 1572 1573 1571
		f 3 -3019 3020 3021
		mu 0 3 1571 1573 1574
		f 3 3022 3023 3024
		mu 0 3 1575 1576 1253
		f 3 -3024 3025 3026
		mu 0 3 1253 1576 1577
		f 3 -2741 3027 3028
		mu 0 3 1373 1372 1578
		f 3 -3028 3029 3030
		mu 0 3 1578 1372 1579
		f 3 3031 3032 3033
		mu 0 3 1235 1233 1580
		f 3 -3033 3034 3035
		mu 0 3 1580 1233 1581
		f 3 3036 3037 3038
		mu 0 3 1582 1165 1371
		f 3 -3038 3039 3040
		mu 0 3 1371 1165 1166
		f 3 3041 3042 3043
		mu 0 3 1583 1584 1585
		f 3 -3043 3044 3045
		mu 0 3 1585 1584 1362
		f 3 3046 3047 3048
		mu 0 3 1587 1588 1586
		f 3 -3048 3049 3050
		mu 0 3 1586 1588 1475
		f 3 -2759 3051 3052
		mu 0 3 1386 1385 1589
		f 3 -3052 3053 3054
		mu 0 3 1589 1385 1590
		f 3 -2764 3055 3056
		mu 0 3 1389 1388 1448
		f 3 -3056 3057 3058
		mu 0 3 1448 1388 1591
		f 3 3059 3060 -2772
		mu 0 3 1393 1592 1394
		f 3 -3061 3061 3062
		mu 0 3 1394 1592 1593
		f 3 3063 3064 -2639
		mu 0 3 1306 1594 1307
		f 3 -3065 3065 3066
		mu 0 3 1307 1594 1309
		f 3 3067 3068 3069
		mu 0 3 1595 1596 1179
		f 3 -3069 3070 3071
		mu 0 3 1179 1596 1597
		f 3 -2460 3072 3073
		mu 0 3 1195 1175 1189
		f 3 -3073 3074 -2451
		mu 0 3 1189 1175 1190
		f 3 3075 3076 -2697
		mu 0 3 1247 1598 1341
		f 3 -3077 3077 3078
		mu 0 3 1341 1598 1599
		f 3 3079 3080 3081
		mu 0 3 1601 1602 1600
		f 3 -3081 3082 3083
		mu 0 3 1600 1602 1603
		f 3 3084 3085 3086
		mu 0 3 1605 1406 1604
		f 3 -3086 -2790 3087
		mu 0 3 1604 1406 1405
		f 3 3088 3089 -2795
		mu 0 3 1409 1606 1410
		f 3 -3090 3090 3091
		mu 0 3 1410 1606 1607
		f 3 3092 3093 -2800
		mu 0 3 1413 1608 1414
		f 3 -3094 3094 3095
		mu 0 3 1414 1608 1609
		f 3 -2807 3096 3097
		mu 0 3 1417 1420 1610
		f 3 -3097 3098 3099
		mu 0 3 1610 1420 1611
		f 3 3100 3101 3102
		mu 0 3 1613 1614 1612
		f 3 -3102 3103 3104
		mu 0 3 1612 1614 1615
		f 3 3105 3106 -2666
		mu 0 3 1321 1616 1322
		f 3 -3107 3107 3108
		mu 0 3 1322 1616 1617
		f 3 3109 3110 3111
		mu 0 3 1619 1326 1618
		f 3 -3111 3112 3113
		mu 0 3 1618 1326 1620
		f 3 3114 -2828 3115
		mu 0 3 1621 1437 1436
		f 3 3116 3117 3118
		mu 0 3 1622 1606 1439
		f 3 -3118 3119 -2830
		mu 0 3 1439 1606 1440
		f 3 3120 3121 3122
		mu 0 3 1624 1625 1623
		f 3 -3122 3123 3124
		mu 0 3 1623 1625 1626
		f 3 3125 3126 3127
		mu 0 3 1628 1447 1627
		f 3 -3127 -2842 3128
		mu 0 3 1627 1447 1446
		f 3 -2864 3129 3130
		mu 0 3 1629 1630 1631
		f 3 3131 3132 -2582
		mu 0 3 1270 1631 1269
		f 3 -3133 -3130 3133
		mu 0 3 1269 1631 1630
		f 3 3134 3135 3136
		mu 0 3 1633 1455 1632
		f 3 -3136 -2852 3137
		mu 0 3 1632 1455 1454
		f 3 3138 3139 -2858
		mu 0 3 1460 1634 1461
		f 3 -3140 3140 3141
		mu 0 3 1461 1634 1635
		f 3 3142 3143 3144
		mu 0 3 1637 1638 1636
		f 3 -3144 3145 3146
		mu 0 3 1636 1638 1639
		f 3 -2865 3147 3148
		mu 0 3 1468 1467 1640
		f 3 -3148 3149 3150
		mu 0 3 1640 1467 1641
		f 3 3151 3152 3153
		mu 0 3 1643 1644 1642
		f 3 -3153 3154 3155
		mu 0 3 1642 1644 1645
		f 3 3156 3157 -2878
		mu 0 3 1476 1646 1477
		f 3 -3158 3158 3159
		mu 0 3 1477 1646 1647
		f 3 -2883 3160 3161
		mu 0 3 1481 1480 1648
		f 3 -3161 3162 3163
		mu 0 3 1648 1480 1649
		f 3 -2889 3164 3165
		mu 0 3 1482 1485 1650
		f 3 -3165 3166 3167
		mu 0 3 1650 1485 1651
		f 3 -2894 3168 3169
		mu 0 3 1486 1489 1652
		f 3 -3169 3170 3171
		mu 0 3 1652 1489 1653
		f 3 -2930 3172 3173
		mu 0 3 1655 1656 1654
		f 3 -3173 3174 3175
		mu 0 3 1654 1656 1657
		f 3 3176 3177 -3174
		mu 0 3 1654 1658 1655
		f 3 -3178 3178 3179
		mu 0 3 1655 1658 1659
		f 3 3180 3181 3182
		mu 0 3 1661 1662 1660
		f 3 -3182 3183 3184
		mu 0 3 1660 1662 1663
		f 3 -3181 3185 3186
		mu 0 3 1662 1661 1664
		f 3 -3186 -3150 3187
		mu 0 3 1664 1661 1665
		f 3 -3188 3188 3189
		mu 0 3 1664 1665 1505
		f 3 -3189 -2867 -2917
		mu 0 3 1505 1665 1502
		f 3 3190 3191 -2929
		mu 0 3 1512 1666 1513
		f 3 -3192 3192 3193
		mu 0 3 1513 1666 1667
		f 3 3194 3195 3196
		mu 0 3 1668 1669 1515
		f 3 -3196 3197 -2931
		mu 0 3 1515 1669 1516
		f 3 3198 3199 3200
		mu 0 3 1670 1671 1519
		f 3 -3200 -3190 -2936
		mu 0 3 1519 1671 1520
		f 3 3201 3202 -2943
		mu 0 3 1524 1672 1525
		f 3 -3203 3203 -2924
		mu 0 3 1525 1672 1673
		f 3 3204 3205 -2960
		mu 0 3 1310 1675 1674
		f 3 -3206 3206 3207
		mu 0 3 1674 1675 1676
		f 3 3208 3209 -3108
		mu 0 3 1616 1677 1617
		f 3 -3210 3210 3211
		mu 0 3 1617 1677 1678
		f 3 3212 3213 -2946
		mu 0 3 1258 1679 1526
		f 3 -3214 3214 3215
		mu 0 3 1526 1679 1680
		f 3 -2590 3216 3217
		mu 0 3 1682 1683 1681
		f 3 -3217 3218 3219
		mu 0 3 1681 1683 1684
		f 3 -2630 3220 -2951
		mu 0 3 1530 1682 1531
		f 3 -3221 -3218 3221
		mu 0 3 1531 1682 1681
		f 3 3222 3223 -2640
		mu 0 3 1686 1687 1685
		f 3 -3224 3224 3225
		mu 0 3 1685 1687 1688
		f 3 -3004 3226 -2684
		mu 0 3 1334 1562 1333
		f 3 -3227 3227 -2989
		mu 0 3 1333 1562 1554
		f 3 3228 3229 3230
		mu 0 3 1689 1543 1356
		f 3 -3230 3231 3232
		mu 0 3 1356 1543 1690
		f 3 3233 3234 -2539
		mu 0 3 1243 1691 1202
		f 3 -3235 3235 -2470
		mu 0 3 1202 1691 1201
		f 3 3236 3237 3238
		mu 0 3 1693 1694 1692
		f 3 -3238 3239 3240
		mu 0 3 1692 1694 1695
		f 3 3241 3242 -2657
		mu 0 3 1317 1696 1314
		f 3 -3243 3243 3244
		mu 0 3 1314 1696 1224
		f 3 3245 3246 3247
		mu 0 3 1698 1691 1697
		f 3 -3247 3248 3249
		mu 0 3 1697 1691 1699
		f 3 3250 3251 3252
		mu 0 3 1700 1701 1296
		f 3 -3252 -3022 -2996
		mu 0 3 1296 1701 1559
		f 3 3253 3254 3255
		mu 0 3 1702 1357 1690
		f 3 -3255 -2720 -3233
		mu 0 3 1690 1357 1356
		f 3 3256 3257 3258
		mu 0 3 1572 1703 1364
		f 3 -3258 3259 -2730
		mu 0 3 1364 1703 1365
		f 3 3260 3261 3262
		mu 0 3 1705 1706 1704
		f 3 -3262 3263 3264
		mu 0 3 1704 1706 1707
		f 3 -2560 3265 3266
		mu 0 3 1252 1255 1709
		f 3 -3266 3267 3268
		mu 0 3 1709 1255 1708
		f 3 3269 3270 3271
		mu 0 3 1710 1578 1580
		f 3 -3271 -3031 3272
		mu 0 3 1580 1578 1579
		f 3 3273 3274 -2514
		mu 0 3 1230 1579 1168
		f 3 -3275 -3030 3275
		mu 0 3 1168 1579 1372
		f 3 3276 3277 -2497
		mu 0 3 1218 1711 1219
		f 3 -3278 3278 3279
		mu 0 3 1219 1711 1712
		f 3 3280 3281 3282
		mu 0 3 1558 1714 1713
		f 3 -3282 3283 3284
		mu 0 3 1713 1714 1343
		f 3 3285 -2553 -3037
		mu 0 3 1582 1250 1165
		f 3 3286 3287 3288
		mu 0 3 1715 1716 1718
		f 3 -3288 3289 3290
		mu 0 3 1718 1716 1717
		f 3 3291 3292 -3050
		mu 0 3 1588 1719 1475
		f 3 -3293 3293 -2875
		mu 0 3 1475 1719 1476
		f 3 3294 3295 -2880
		mu 0 3 1479 1720 1480
		f 3 -3296 3296 3297
		mu 0 3 1480 1720 1721
		f 3 3298 3299 3300
		mu 0 3 1723 1386 1722
		f 3 -3300 -3053 3301
		mu 0 3 1722 1386 1589
		f 3 3302 3303 -3058
		mu 0 3 1388 1724 1591
		f 3 -3304 3304 3305
		mu 0 3 1591 1724 1725
		f 3 3306 3307 3308
		mu 0 3 1726 1727 1393
		f 3 -3308 3309 -3060
		mu 0 3 1393 1727 1592
		f 3 -2778 3310 3311
		mu 0 3 1395 1398 1728
		f 3 -3311 3312 3313
		mu 0 3 1728 1398 1626
		f 3 3314 3315 -2544
		mu 0 3 1245 1188 1247
		f 3 -3316 3316 -3076
		mu 0 3 1247 1188 1598
		f 3 3317 3318 3319
		mu 0 3 1730 1731 1729
		f 3 -3319 3320 3321
		mu 0 3 1729 1731 1702
		f 3 3322 3323 3324
		mu 0 3 1732 1483 1411
		f 3 -3324 -2887 3325
		mu 0 3 1411 1483 1482
		f 3 3326 3327 3328
		mu 0 3 1419 1489 1733
		f 3 -3328 -2893 3329
		mu 0 3 1733 1489 1488
		f 3 -3089 3330 -3120
		mu 0 3 1606 1409 1440
		f 3 -3331 3331 3332
		mu 0 3 1440 1409 1734
		f 3 3333 3334 3335
		mu 0 3 1736 1737 1735
		f 3 -3335 3336 3337
		mu 0 3 1735 1737 1738
		f 3 3338 3339 3340
		mu 0 3 1740 1621 1739
		f 3 -3340 -3116 3341
		mu 0 3 1739 1621 1436
		f 3 3342 3343 -3103
		mu 0 3 1612 1741 1613
		f 3 -3344 3344 3345
		mu 0 3 1613 1741 1742
		f 3 3346 3347 3348
		mu 0 3 1744 1745 1743
		f 3 -3348 3349 3350
		mu 0 3 1743 1745 1746
		f 3 3351 3352 3353
		mu 0 3 1748 1749 1747
		f 3 -3353 3354 3355
		mu 0 3 1747 1749 1354
		f 3 -3351 3356 3357
		mu 0 3 1743 1746 1750
		f 3 -3357 3358 3359
		mu 0 3 1750 1746 1751
		f 3 3360 3361 3362
		mu 0 3 1752 1611 1433
		f 3 -3362 3363 -2823
		mu 0 3 1433 1611 1434
		f 3 3364 3365 3366
		mu 0 3 1754 1755 1753
		f 3 -3366 3367 3368
		mu 0 3 1753 1755 1607
		f 3 3369 3370 3371
		mu 0 3 1757 1625 1756
		f 3 -3371 -3121 3372
		mu 0 3 1756 1625 1624
		f 3 -3059 3373 -2843
		mu 0 3 1448 1591 1449
		f 3 -3374 3374 3375
		mu 0 3 1449 1591 1758
		f 3 3376 3377 3378
		mu 0 3 1760 1761 1759
		f 3 -3378 3379 3380
		mu 0 3 1759 1761 1762
		f 3 -2585 3381 3382
		mu 0 3 1272 1271 1763
		f 3 -3382 3383 3384
		mu 0 3 1763 1271 1764
		f 3 3385 3386 3387
		mu 0 3 1766 1459 1765
		f 3 -3387 -2857 -3177
		mu 0 3 1765 1459 1458
		f 3 3388 3389 -3143
		mu 0 3 1637 1767 1638
		f 3 -3390 3390 3391
		mu 0 3 1638 1767 1768
		f 3 3392 3393 3394
		mu 0 3 1770 1771 1769
		f 3 -3394 -2920 3395
		mu 0 3 1769 1771 1772
		f 3 3396 3397 3398
		mu 0 3 1774 1775 1773
		f 3 -3398 3399 3400
		mu 0 3 1773 1775 1776
		f 3 3401 3402 -2863
		mu 0 3 1464 1777 1465
		f 3 -3403 3403 -3134
		mu 0 3 1465 1777 1778;
	setAttr ".fc[2000:2499]"
		f 3 3404 3405 3406
		mu 0 3 1780 1781 1779
		f 3 -3406 3407 3408
		mu 0 3 1779 1781 1782
		f 3 3409 3410 -3164
		mu 0 3 1649 1783 1648
		f 3 -3411 3411 3412
		mu 0 3 1648 1783 1784
		f 3 3413 3414 3415
		mu 0 3 1786 1787 1785
		f 3 -3415 3416 3417
		mu 0 3 1785 1787 1788
		f 3 3418 3419 3420
		mu 0 3 1789 1790 1487
		f 3 -3420 3421 -2890
		mu 0 3 1487 1790 1488
		f 3 3422 3423 3424
		mu 0 3 1792 1659 1791
		f 3 -3424 -3179 -2859
		mu 0 3 1791 1659 1658
		f 3 -3142 3425 -3425
		mu 0 3 1791 1793 1792
		f 3 -3426 3426 3427
		mu 0 3 1792 1793 1794
		f 3 -3138 3428 3429
		mu 0 3 1796 1797 1795
		f 3 -3429 3430 3431
		mu 0 3 1795 1797 1798
		f 3 -3185 3432 3433
		mu 0 3 1660 1663 1499
		f 3 -3433 3434 -2908
		mu 0 3 1499 1663 1496
		f 3 3435 3436 3437
		mu 0 3 1800 1801 1799
		f 3 -3437 3438 -2900
		mu 0 3 1799 1801 1802
		f 3 3439 3440 3441
		mu 0 3 1804 1805 1803
		f 3 -3441 3442 3443
		mu 0 3 1803 1805 1806
		f 3 3444 3445 3446
		mu 0 3 1808 1809 1807
		f 3 -3446 -3184 3447
		mu 0 3 1807 1809 1810
		f 3 3448 3449 3450
		mu 0 3 1812 1813 1811
		f 3 -3450 -2573 3451
		mu 0 3 1811 1813 1814
		f 3 3452 3453 3454
		mu 0 3 1816 1817 1815
		f 3 -3454 3455 3456
		mu 0 3 1815 1817 1818
		f 3 3457 3458 3459
		mu 0 3 1820 1821 1819
		f 3 -3459 3460 -2626
		mu 0 3 1819 1821 1822
		f 3 -2609 3461 3462
		mu 0 3 1824 1825 1823
		f 3 -3462 3463 3464
		mu 0 3 1823 1825 1826
		f 3 3465 3466 3467
		mu 0 3 1828 1829 1827
		f 3 -3467 3468 3469
		mu 0 3 1827 1829 1830
		f 3 -3226 3470 3471
		mu 0 3 1685 1688 1831
		f 3 -3471 3472 3473
		mu 0 3 1831 1688 1832
		f 3 3474 3475 -3228
		mu 0 3 1562 1833 1554
		f 3 -3476 3476 3477
		mu 0 3 1554 1833 1834
		f 3 -3232 3478 3479
		mu 0 3 1690 1543 1835
		f 3 -3479 -2966 3480
		mu 0 3 1835 1543 1542
		f 3 -2816 3481 3482
		mu 0 3 1428 1427 1836
		f 3 -3482 -2975 3483
		mu 0 3 1836 1427 1548
		f 3 3484 3485 3486
		mu 0 3 1837 1303 1550
		f 3 -3486 -2636 -2976
		mu 0 3 1550 1303 1302
		f 3 3487 3488 -2711
		mu 0 3 1350 1838 1351
		f 3 -3489 3489 3490
		mu 0 3 1351 1838 1200
		f 3 3491 3492 3493
		mu 0 3 1568 1839 1840
		f 3 -3493 3494 3495
		mu 0 3 1840 1839 1228
		f 3 3496 3497 3498
		mu 0 3 1842 1843 1841
		f 3 -3498 3499 3500
		mu 0 3 1841 1843 1844
		f 3 -3250 3501 3502
		mu 0 3 1697 1699 1556
		f 3 -3502 3503 -2991
		mu 0 3 1556 1699 1557
		f 3 3504 3505 3506
		mu 0 3 1837 1845 1276
		f 3 -3506 3507 3508
		mu 0 3 1276 1845 1299
		f 3 3509 3510 3511
		mu 0 3 1359 1846 1563
		f 3 -3511 3512 -3005
		mu 0 3 1563 1846 1564
		f 3 3513 3514 3515
		mu 0 3 1595 1161 1847
		f 3 -3515 -2481 3516
		mu 0 3 1847 1161 1209
		f 3 3517 3518 3519
		mu 0 3 1573 1848 1704
		f 3 -3519 3520 -3263
		mu 0 3 1704 1848 1705
		f 3 -3265 3521 3522
		mu 0 3 1704 1707 1849
		f 3 -3522 3523 3524
		mu 0 3 1849 1707 1850
		f 3 -3267 3525 -2554
		mu 0 3 1252 1709 1253
		f 3 -3526 3526 -3025
		mu 0 3 1253 1709 1575
		f 3 -3273 3527 -3034
		mu 0 3 1580 1579 1235
		f 3 -3528 -3274 -2523
		mu 0 3 1235 1579 1230
		f 3 3528 3529 -2994
		mu 0 3 1557 1340 1558
		f 3 -3530 3530 -3281
		mu 0 3 1558 1340 1714
		f 3 3531 3532 3533
		mu 0 3 1852 1583 1851
		f 3 -3533 -3044 3534
		mu 0 3 1851 1583 1585
		f 3 3535 3536 3537
		mu 0 3 1390 1587 1853
		f 3 -3537 -3049 3538
		mu 0 3 1853 1587 1586
		f 3 3539 3540 3541
		mu 0 3 1854 1855 1479
		f 3 -3541 3542 -3295
		mu 0 3 1479 1855 1720
		f 3 -3299 3543 -2762
		mu 0 3 1386 1723 1387
		f 3 -3544 3544 3545
		mu 0 3 1387 1723 1856
		f 3 -2749 3546 -2766
		mu 0 3 1378 1377 1388
		f 3 -3547 3547 -3303
		mu 0 3 1388 1377 1724
		f 3 3548 3549 3550
		mu 0 3 1857 1726 1392
		f 3 -3550 -3309 -2769
		mu 0 3 1392 1726 1393
		f 3 3551 3552 3553
		mu 0 3 1858 1545 1256
		f 3 -3553 3554 3555
		mu 0 3 1256 1545 1852
		f 3 -2970 3556 -3555
		mu 0 3 1545 1544 1852
		f 3 -3557 3557 -3532
		mu 0 3 1852 1544 1583
		f 3 -3084 3558 3559
		mu 0 3 1600 1603 1732
		f 3 -3559 3560 -3323
		mu 0 3 1732 1603 1483
		f 3 3561 3562 3563
		mu 0 3 1418 1605 1653
		f 3 -3563 -3087 3564
		mu 0 3 1653 1605 1604
		f 3 -2797 3565 -3332
		mu 0 3 1409 1412 1734
		f 3 -3566 3566 3567
		mu 0 3 1734 1412 1859
		f 3 3568 3569 -3336
		mu 0 3 1735 1401 1736
		f 3 -3570 3570 3571
		mu 0 3 1736 1401 1601
		f 3 3572 3573 3574
		mu 0 3 1861 1740 1860
		f 3 -3574 -3341 3575
		mu 0 3 1860 1740 1739
		f 3 3576 3577 3578
		mu 0 3 1862 1321 1741
		f 3 -3578 3579 3580
		mu 0 3 1741 1321 1863
		f 3 -3347 3581 3582
		mu 0 3 1745 1744 1407
		f 3 -3582 3583 3584
		mu 0 3 1407 1744 1864
		f 3 -3213 3585 3586
		mu 0 3 1679 1258 1355
		f 3 -3586 -2564 3587
		mu 0 3 1355 1258 1257
		f 3 -3110 3588 -2672
		mu 0 3 1326 1619 1327
		f 3 -3589 3589 3590
		mu 0 3 1327 1619 1865
		f 3 -3100 3591 3592
		mu 0 3 1610 1611 1866
		f 3 -3592 -3361 3593
		mu 0 3 1866 1611 1752
		f 3 -3369 3594 3595
		mu 0 3 1753 1607 1622
		f 3 -3595 -3091 -3117
		mu 0 3 1622 1607 1606
		f 3 -3125 3596 -2860
		mu 0 3 1623 1626 1867
		f 3 -3597 -3313 3597
		mu 0 3 1867 1626 1398
		f 3 -3306 3598 -3375
		mu 0 3 1591 1725 1758
		f 3 -3599 3599 -3386
		mu 0 3 1758 1725 1868
		f 3 3600 3601 -3380
		mu 0 3 1761 1629 1762
		f 3 -3602 -3131 3602
		mu 0 3 1762 1629 1631
		f 3 -3376 3603 3604
		mu 0 3 1870 1766 1869
		f 3 -3604 -3388 -3176
		mu 0 3 1869 1766 1765
		f 3 -3373 3605 -3391
		mu 0 3 1767 1871 1768
		f 3 -3606 3606 -3377
		mu 0 3 1768 1871 1872
		f 3 -3396 3607 3608
		mu 0 3 1769 1772 1469
		f 3 -3608 -2915 -2869
		mu 0 3 1469 1772 1466
		f 3 3609 3610 -3155
		mu 0 3 1644 1773 1645
		f 3 -3611 -3401 3611
		mu 0 3 1645 1773 1776
		f 3 3612 3613 -3404
		mu 0 3 1777 1633 1778
		f 3 -3614 -3137 3614
		mu 0 3 1778 1633 1632
		f 3 3615 3616 -3159
		mu 0 3 1646 1780 1647
		f 3 -3617 -3407 3617
		mu 0 3 1647 1780 1779
		f 3 3618 3619 -3412
		mu 0 3 1783 1873 1784
		f 3 -3620 3620 3621
		mu 0 3 1784 1873 1874
		f 3 -3417 3622 3623
		mu 0 3 1788 1787 1651
		f 3 -3623 3624 -3168
		mu 0 3 1651 1787 1650
		f 3 -3419 3625 3626
		mu 0 3 1790 1789 1875
		f 3 -3626 3627 3628
		mu 0 3 1875 1789 1876
		f 3 -3194 3629 -3175
		mu 0 3 1656 1493 1657
		f 3 -3630 -2898 3630
		mu 0 3 1657 1493 1492
		f 3 3631 3632 3633
		mu 0 3 1878 1879 1877
		f 3 -3633 3634 3635
		mu 0 3 1877 1879 1880
		f 3 -3615 3636 -2580
		mu 0 3 1269 1796 1264
		f 3 -3637 -3430 3637
		mu 0 3 1264 1796 1795
		f 3 3638 3639 -3193
		mu 0 3 1666 1800 1667
		f 3 -3640 -3438 -2899
		mu 0 3 1667 1800 1799
		f 3 3640 3641 -3195
		mu 0 3 1668 1804 1669
		f 3 -3642 -3442 -3632
		mu 0 3 1669 1804 1803
		f 3 -3448 3642 3643
		mu 0 3 1807 1810 1670
		f 3 -3643 -3187 -3199
		mu 0 3 1670 1810 1671
		f 3 -3452 3644 3645
		mu 0 3 1811 1814 1881
		f 3 -3645 -3638 3646
		mu 0 3 1881 1814 1882
		f 3 3647 3648 -3215
		mu 0 3 1679 1749 1680
		f 3 -3649 3649 3650
		mu 0 3 1680 1749 1883
		f 3 3651 3652 -3219
		mu 0 3 1683 1822 1684
		f 3 -3653 -3461 3653
		mu 0 3 1684 1822 1821
		f 3 3654 3655 -3464
		mu 0 3 1825 1529 1826
		f 3 -3656 -2950 3656
		mu 0 3 1826 1529 1528
		f 3 3657 3658 3659
		mu 0 3 1884 1885 1887
		f 3 -3659 3660 3661
		mu 0 3 1887 1885 1886
		f 3 -3660 3662 3663
		mu 0 3 1884 1887 1832
		f 3 -3663 3664 -3474
		mu 0 3 1832 1887 1831
		f 3 3665 3666 3667
		mu 0 3 1851 1888 1540
		f 3 -3667 3668 -2962
		mu 0 3 1540 1888 1541
		f 3 3669 3670 3671
		mu 0 3 1889 1344 1199
		f 3 -3671 -2705 3672
		mu 0 3 1199 1344 1347
		f 3 3673 3674 -2478
		mu 0 3 1207 1890 1208
		f 3 -3675 3675 -2484
		mu 0 3 1208 1890 1211
		f 3 3676 3677 3678
		mu 0 3 1891 1892 1695
		f 3 -3678 3679 -3241
		mu 0 3 1695 1892 1692
		f 3 3680 3681 3682
		mu 0 3 1842 1893 1345
		f 3 -3682 3683 3684
		mu 0 3 1345 1893 1894
		f 3 3685 3686 -2511
		mu 0 3 1227 1696 1228
		f 3 -3687 3687 -3496
		mu 0 3 1228 1696 1840
		f 3 -3242 3688 -3688
		mu 0 3 1696 1317 1840
		f 3 -3689 -2659 3689
		mu 0 3 1840 1317 1318
		f 3 3690 3691 3692
		mu 0 3 1700 1275 1895
		f 3 -3692 3693 3694
		mu 0 3 1895 1275 1896
		f 3 3695 3696 -3483
		mu 0 3 1836 1897 1428
		f 3 -3697 3697 3698
		mu 0 3 1428 1897 1898
		f 3 3699 3700 -2413
		mu 0 3 1163 1846 1164
		f 3 -3701 3701 3702
		mu 0 3 1164 1846 1561
		f 3 3703 3704 -2492
		mu 0 3 1215 1564 1163
		f 3 -3705 -3513 -3700
		mu 0 3 1163 1564 1846
		f 3 3705 3706 -3020
		mu 0 3 1571 1899 1572
		f 3 -3707 3707 -3257
		mu 0 3 1572 1899 1703
		f 3 3708 3709 -2747
		mu 0 3 1375 1900 1255
		f 3 -3710 3710 -3268
		mu 0 3 1255 1900 1708
		f 3 -2469 3711 -2537
		mu 0 3 1202 1195 1244
		f 3 -3712 -3074 3712
		mu 0 3 1244 1195 1189
		f 3 -3285 3713 3714
		mu 0 3 1713 1343 1553
		f 3 -3714 -2701 3715
		mu 0 3 1553 1343 1342
		f 3 3716 3717 -3294
		mu 0 3 1719 1384 1476
		f 3 -3718 3718 -3157
		mu 0 3 1476 1384 1646
		f 3 3719 3720 3721
		mu 0 3 1857 1649 1721
		f 3 -3721 -3163 -3298
		mu 0 3 1721 1649 1480
		f 3 3722 3723 -3545
		mu 0 3 1723 1901 1856
		f 3 -3724 3724 3725
		mu 0 3 1856 1901 1902
		f 3 3726 3727 3728
		mu 0 3 1903 1904 1587
		f 3 -3728 3729 -3047
		mu 0 3 1587 1904 1588
		f 3 3730 3731 3732
		mu 0 3 1906 1907 1905
		f 3 -3732 3733 3734
		mu 0 3 1905 1907 1908
		f 3 3735 3736 3737
		mu 0 3 1909 1855 1744
		f 3 -3737 3738 -3584
		mu 0 3 1744 1855 1864
		f 3 3739 3740 3741
		mu 0 3 1911 1716 1910
		f 3 -3741 -3287 3742
		mu 0 3 1910 1716 1715
		f 3 -3326 3743 -2796
		mu 0 3 1411 1482 1412
		f 3 -3744 -3166 3744
		mu 0 3 1412 1482 1650
		f 3 -3327 3745 -3171
		mu 0 3 1489 1419 1653
		f 3 -3746 -2803 -3564
		mu 0 3 1653 1419 1418
		f 3 3746 3747 3748
		mu 0 3 1913 1734 1912
		f 3 -3748 -3568 3749
		mu 0 3 1912 1734 1859
		f 3 3750 3751 3752
		mu 0 3 1914 1402 1735
		f 3 -3752 -2785 -3569
		mu 0 3 1735 1402 1401
		f 3 3753 3754 3755
		mu 0 3 1915 1733 1739
		f 3 -3755 3756 -3576
		mu 0 3 1739 1733 1860
		f 3 -2788 3757 -3583
		mu 0 3 1407 1406 1745
		f 3 -3758 3758 3759
		mu 0 3 1745 1406 1916
		f 3 -2791 3760 3761
		mu 0 3 1408 1407 1917
		f 3 -3761 -3585 3762
		mu 0 3 1917 1407 1864
		f 3 -3648 3763 -3355
		mu 0 3 1749 1679 1354
		f 3 -3764 -3587 -2716
		mu 0 3 1354 1679 1355
		f 3 3764 3765 3766
		mu 0 3 1918 1919 1616
		f 3 -3766 3767 -3209
		mu 0 3 1616 1919 1677
		f 3 3768 3769 3770
		mu 0 3 1921 1610 1920
		f 3 -3770 -3593 -3399
		mu 0 3 1920 1610 1866
		f 3 3771 3772 -3395
		mu 0 3 1922 1923 1754
		f 3 -3773 3773 -3365
		mu 0 3 1754 1923 1755
		f 3 3774 3775 3776
		mu 0 3 1925 1757 1924
		f 3 -3776 -3372 -3389
		mu 0 3 1924 1757 1756
		f 3 3777 3778 3779
		mu 0 3 1927 1928 1926
		f 3 -3779 3780 -3139
		mu 0 3 1926 1928 1929
		f 3 3781 3782 -3379
		mu 0 3 1759 1930 1760
		f 3 -3783 3783 -3392
		mu 0 3 1760 1930 1931
		f 3 3784 3785 3786
		mu 0 3 1933 1934 1932
		f 3 -3786 3787 3788
		mu 0 3 1932 1934 1935
		f 3 -3129 3789 3790
		mu 0 3 1937 1938 1936
		f 3 -3790 3791 -2895
		mu 0 3 1936 1938 1939
		f 3 -3123 3792 -3607
		mu 0 3 1871 1463 1872
		f 3 -3793 -2862 -3601
		mu 0 3 1872 1463 1462
		f 3 3793 3794 -3367
		mu 0 3 1940 1941 1770
		f 3 -3795 3795 -3393
		mu 0 3 1770 1941 1771
		f 3 3796 3797 -3363
		mu 0 3 1943 1944 1942
		f 3 -3798 3798 3799
		mu 0 3 1942 1944 1945
		f 3 3800 3801 -2822
		mu 0 3 1947 1948 1946
		f 3 -3802 -2923 3802
		mu 0 3 1946 1948 1949
		f 3 3803 3804 -3408
		mu 0 3 1781 1950 1782
		f 3 -3805 3805 3806
		mu 0 3 1782 1950 1951
		f 3 3807 3808 3809
		mu 0 3 1953 1954 1952
		f 3 -3809 3810 3811
		mu 0 3 1952 1954 1955
		f 3 3812 3813 3814
		mu 0 3 1957 1958 1956
		f 3 -3814 3815 3816
		mu 0 3 1956 1958 1959
		f 3 3817 3818 3819
		mu 0 3 1960 1961 1576
		f 3 -3819 3820 -3026
		mu 0 3 1576 1961 1577
		f 3 -2854 3821 -3431
		mu 0 3 1797 1962 1798
		f 3 -3822 3822 3823
		mu 0 3 1798 1962 1963
		f 3 3824 3825 -2934
		mu 0 3 1965 1966 1964
		f 3 -3826 -3156 3826
		mu 0 3 1964 1966 1967
		f 3 -3634 3827 -3198
		mu 0 3 1968 1969 1965
		f 3 -3828 3828 -3825
		mu 0 3 1965 1969 1966
		f 3 -2879 3829 -3439
		mu 0 3 1801 1970 1802
		f 3 -3830 3830 3831
		mu 0 3 1802 1970 1971
		f 3 -2884 3832 -3443
		mu 0 3 1805 1972 1806
		f 3 -3833 3833 3834
		mu 0 3 1806 1972 1973
		f 3 3835 3836 -3816
		mu 0 3 1974 1975 1808
		f 3 -3837 -3435 -3445
		mu 0 3 1808 1975 1809
		f 3 3837 3838 -3204
		mu 0 3 1672 1976 1673
		f 3 -3839 3839 3840
		mu 0 3 1673 1976 1977
		f 3 3841 3842 3843
		mu 0 3 1425 1815 1978
		f 3 -3843 -3457 3844
		mu 0 3 1978 1815 1818
		f 3 3845 3846 -3460
		mu 0 3 1819 1979 1820
		f 3 -3847 3847 3848
		mu 0 3 1820 1979 1980
		f 3 -2612 3849 3850
		mu 0 3 1982 1824 1981
		f 3 -3850 -3463 3851
		mu 0 3 1981 1824 1823
		f 3 3852 3853 3854
		mu 0 3 1984 1985 1983
		f 3 -3854 3855 3856
		mu 0 3 1983 1985 1986
		f 3 3857 3858 3859
		mu 0 3 1988 1989 1987
		f 3 -3859 3860 -3212
		mu 0 3 1987 1989 1990
		f 3 -3666 3861 3862
		mu 0 3 1888 1851 1991
		f 3 -3862 -3535 3863
		mu 0 3 1991 1851 1585
		f 3 3864 3865 -2453
		mu 0 3 1193 1858 1194
		f 3 3866 3867 -3695
		mu 0 3 1896 1891 1895
		f 3 -3868 -3679 3868
		mu 0 3 1895 1891 1695
		f 3 3869 3870 -3684
		mu 0 3 1893 1692 1894
		f 3 -3871 -3680 3871
		mu 0 3 1894 1692 1892
		f 3 -3531 3872 3873
		mu 0 3 1714 1340 1399
		f 3 -3873 -2698 3874
		mu 0 3 1399 1340 1341
		f 3 -2507 3875 3876
		mu 0 3 1222 1225 1993
		f 3 -3876 3877 3878
		mu 0 3 1993 1225 1992
		f 3 3879 3880 -3693
		mu 0 3 1895 1994 1700
		f 3 -3881 -3706 -3251
		mu 0 3 1700 1994 1701
		f 3 3881 3882 -3698
		mu 0 3 1897 1995 1898
		f 3 -3883 3883 3884
		mu 0 3 1898 1995 1996
		f 3 -3704 3885 -3008
		mu 0 3 1564 1215 1565
		f 3 -3886 -2733 3886
		mu 0 3 1565 1215 1367
		f 3 -3864 3887 3888
		mu 0 3 1991 1585 1365
		f 3 -3888 -3046 -2731
		mu 0 3 1365 1585 1362
		f 3 -2998 3889 -3523
		mu 0 3 1849 1574 1704
		f 3 -3890 -3021 -3520
		mu 0 3 1704 1574 1573
		f 3 3890 3891 3892
		mu 0 3 1997 1566 1998
		f 3 -3892 -3009 3893
		mu 0 3 1998 1566 1565
		f 3 3894 3895 3896
		mu 0 3 1251 1999 1375
		f 3 -3896 3897 -3709
		mu 0 3 1375 1999 1900
		f 3 -3036 3898 -3272
		mu 0 3 1580 1581 1710
		f 3 -3899 3899 3900
		mu 0 3 1710 1581 2000
		f 3 3901 3902 -2986
		mu 0 3 1552 1551 1234
		f 3 -3903 -2982 3903
		mu 0 3 1234 1551 1232
		f 3 -3027 3904 -2557
		mu 0 3 1253 1577 1254
		f 3 -3905 3905 3906
		mu 0 3 1254 1577 2001
		f 3 -2763 3907 -3719
		mu 0 3 1384 1387 1646
		f 3 -3908 3908 -3616
		mu 0 3 1646 1387 1780
		f 3 -2771 3909 3910
		mu 0 3 1392 1391 1783
		f 3 -3910 3911 -3619
		mu 0 3 1783 1391 1873
		f 3 3912 3913 -3301
		mu 0 3 1722 2002 1723
		f 3 -3914 3914 -3723
		mu 0 3 1723 2002 1901
		f 3 -3727 3915 3916
		mu 0 3 1904 1903 1628
		f 3 -3916 3917 -3126
		mu 0 3 1628 1903 1447
		f 3 -3735 3918 3919
		mu 0 3 1905 1908 1928
		f 3 -3919 3920 3921
		mu 0 3 1928 1908 2003
		f 3 -3314 3922 3923
		mu 0 3 1728 1626 2004
		f 3 -3923 -3124 3924
		mu 0 3 2004 1626 1625
		f 3 3925 3926 3927
		mu 0 3 1443 1909 1743
		f 3 -3927 -3738 -3349
		mu 0 3 1743 1909 1744
		f 3 -3045 3928 -2729
		mu 0 3 1362 1584 1363
		f 3 -3929 3929 3930
		mu 0 3 1363 1584 1997
		f 3 -3567 3931 3932
		mu 0 3 1859 1412 1787
		f 3 -3932 -3745 -3625
		mu 0 3 1787 1412 1650
		f 3 3933 3934 -3575
		mu 0 3 1860 1790 1861
		f 3 -3935 -3627 3935
		mu 0 3 1861 1790 1875
		f 3 -3333 3936 -2833
		mu 0 3 1440 1734 1441
		f 3 -3937 -3747 3937
		mu 0 3 1441 1734 1913
		f 3 -3338 3938 -3753
		mu 0 3 1735 1738 1914
		f 3 -3939 3939 3940
		mu 0 3 1914 1738 2005
		f 3 3941 3942 -2826
		mu 0 3 1434 1915 1436
		f 3 -3943 -3756 -3342
		mu 0 3 1436 1915 1739
		f 3 -3760 3943 -3350
		mu 0 3 1745 1916 1746
		f 3 -3944 3944 3945
		mu 0 3 1746 1916 2006
		f 3 -3885 3946 3947
		mu 0 3 1898 1996 1815
		f 3 -3947 3948 -3455
		mu 0 3 1815 1996 1816
		f 3 3949 3950 -2502
		mu 0 3 2008 2009 2007
		f 3 -3951 3951 3952
		mu 0 3 2007 2009 2010
		f 3 3953 3954 3955
		mu 0 3 2006 1921 2011
		f 3 -3955 -3771 -3610
		mu 0 3 2011 1921 1920
		f 3 3956 3957 -3609
		mu 0 3 2012 1737 1922
		f 3 -3958 3958 -3772
		mu 0 3 1922 1737 1923
		f 3 -3598 3959 -3402
		mu 0 3 1867 1398 2013
		f 3 -3960 -2777 3960
		mu 0 3 2013 1398 1397
		f 3 3961 3962 -3600
		mu 0 3 1725 1927 1868
		f 3 -3963 -3780 -2855
		mu 0 3 1868 1927 1926
		f 3 3963 3964 3965
		mu 0 3 2015 2016 2014
		f 3 -3965 3966 -2850
		mu 0 3 2014 2016 2017
		f 3 -3789 3967 3968
		mu 0 3 1932 1935 2018
		f 3 -3968 3969 -2848
		mu 0 3 2018 1935 2019
		f 3 -2844 3970 -3792
		mu 0 3 1938 1870 1939
		f 3 -3971 -3605 -3631
		mu 0 3 1939 1870 1869
		f 3 3971 3972 -2838
		mu 0 3 2021 2022 2020
		f 3 -3973 3973 3974
		mu 0 3 2020 2022 2023
		f 3 3975 3976 -3596
		mu 0 3 2024 2025 1940
		f 3 -3977 3977 -3794
		mu 0 3 1940 2025 1941
		f 3 -3594 3978 -3397
		mu 0 3 1774 1942 1775
		f 3 -3979 -3800 3979
		mu 0 3 1775 1942 1945
		f 3 3980 3981 3982
		mu 0 3 2026 2027 1947
		f 3 -3982 -3384 -3801
		mu 0 3 1947 2027 1948
		f 3 3983 3984 3985
		mu 0 3 2028 2029 1950
		f 3 -3985 3986 -3806
		mu 0 3 1950 2029 1951
		f 3 3987 3988 -3621
		mu 0 3 1873 1953 1874
		f 3 -3989 -3810 3989
		mu 0 3 1874 1953 1952
		f 3 -3813 3990 3991
		mu 0 3 1958 1957 1876
		f 3 -3991 3992 -3629
		mu 0 3 1876 1957 1875
		f 3 3993 3994 3995
		mu 0 3 2030 2031 1380
		f 3 -3995 -3451 3996
		mu 0 3 1380 2031 2032
		f 3 3997 3998 3999
		mu 0 3 2034 2035 2033
		f 3 -3999 4000 4001
		mu 0 3 2033 2035 2036
		f 3 4002 4003 -4000
		mu 0 3 2033 1794 2034
		f 3 -4004 -3427 4004
		mu 0 3 2034 1794 1793
		f 3 4005 4006 -3823
		mu 0 3 1962 2037 1963
		f 3 -4007 4007 4008
		mu 0 3 1963 2037 2038
		f 3 -3827 4009 4010
		mu 0 3 1964 1967 2039
		f 3 -4010 -3612 4011
		mu 0 3 2039 1967 2040
		f 3 -2925 4012 4013
		mu 0 3 1508 1509 2041
		f 3 -4013 -3841 4014
		mu 0 3 2041 1509 2042
		f 3 -3160 4015 -3831
		mu 0 3 1970 2043 1971
		f 3 -4016 4016 4017
		mu 0 3 1971 2043 2044
		f 3 -3162 4018 -3834
		mu 0 3 1972 2045 1973
		f 3 -4019 4019 4020
		mu 0 3 1973 2045 2046
		f 3 4021 4022 -3992
		mu 0 3 2047 2048 1974
		f 3 -4023 -2906 -3836
		mu 0 3 1974 2048 1975
		f 3 4023 4024 -3840
		mu 0 3 1976 2049 1977
		f 3 -4025 4025 4026
		mu 0 3 1977 2049 2050
		f 3 -3066 4027 4028
		mu 0 3 1309 1594 1925
		f 3 -4028 4029 -3775
		mu 0 3 1925 1594 1757
		f 3 -3844 4030 -2815
		mu 0 3 1425 1978 1426
		f 3 -4031 -3853 4031
		mu 0 3 1426 1978 2051
		f 3 -2956 4032 -2622
		mu 0 3 1532 1535 1979
		f 3 -4033 4033 -3848
		mu 0 3 1979 1535 1980
		f 3 -2660 4034 4035
		mu 0 3 2053 2054 2052
		f 3 -4035 4036 4037
		mu 0 3 2052 2054 2055
		f 3 4038 4039 4040
		mu 0 3 2057 1984 2056
		f 3 -4040 -3855 4041
		mu 0 3 2056 1984 1983
		f 3 4042 4043 4044
		mu 0 3 2059 2060 2058
		f 3 -4044 4045 4046
		mu 0 3 2058 2060 2061
		f 3 -3880 4047 4048
		mu 0 3 1994 1895 1694
		f 3 -4048 -3869 -3240
		mu 0 3 1694 1895 1695
		f 3 -2680 4049 4050
		mu 0 3 2062 1693 1893
		f 3 -4050 -3239 -3870
		mu 0 3 1893 1693 1692
		f 3 -2990 4051 -3715
		mu 0 3 1553 1554 1713
		f 3 -4052 -3478 4052
		mu 0 3 1713 1554 1834
		f 3 4053 4054 4055
		mu 0 3 1281 2064 2063
		f 3 -4055 4056 4057
		mu 0 3 2063 2064 2065
		f 3 4058 4059 4060
		mu 0 3 2067 2068 2066
		f 3 -4060 4061 4062
		mu 0 3 2066 2068 2069
		f 3 -3867 4063 4064
		mu 0 3 1891 1896 2070
		f 3 -4064 4065 4066
		mu 0 3 2070 1896 1845
		f 3 4067 4068 4069
		mu 0 3 2071 1201 1698
		f 3 -4069 -3236 -3246
		mu 0 3 1698 1201 1691
		f 3 4070 4071 -3524
		mu 0 3 1707 2072 1850
		f 3 -4072 4072 -4057
		mu 0 3 1850 2072 2073
		f 3 4073 4074 4075
		mu 0 3 1706 1910 2074
		f 3 -4075 -3743 4076
		mu 0 3 2074 1910 1715
		f 3 4077 4078 4079
		mu 0 3 2076 1705 2075
		f 3 -4079 -3521 4080
		mu 0 3 2075 1705 1848
		f 3 -2552 4081 -3895
		mu 0 3 1251 1250 1999
		f 3 -4082 4082 4083
		mu 0 3 1999 1250 2077
		f 3 4084 4085 -3900
		mu 0 3 1581 2078 2000
		f 3 -4086 4086 4087
		mu 0 3 2000 2078 2079
		f 3 -3902 4088 4089
		mu 0 3 1551 1552 1342
		f 3 -4089 -2988 -3716
		mu 0 3 1342 1552 1553
		f 3 4090 4091 -3321
		mu 0 3 1731 1833 1702
		f 3 -4092 4092 -3254
		mu 0 3 1702 1833 1357
		f 3 -3546 4093 -3909
		mu 0 3 1387 1856 1780
		f 3 -4094 4094 -3405
		mu 0 3 1780 1856 1781
		f 3 -3551 4095 -3720
		mu 0 3 1857 1392 1649
		f 3 -4096 -3911 -3410
		mu 0 3 1649 1392 1783
		f 3 4096 4097 4098
		mu 0 3 2080 2081 1901
		f 3 -4098 4099 -3725
		mu 0 3 1901 2081 1902
		f 3 4100 4101 -2767
		mu 0 3 1389 1903 1390
		f 3 -4102 -3729 -3536
		mu 0 3 1390 1903 1587
		f 3 4102 4103 -3734
		mu 0 3 1907 1391 1908
		f 3 -4104 -2773 4104
		mu 0 3 1908 1391 1394
		f 3 -3736 4105 -3543
		mu 0 3 1855 1909 1720
		f 3 -4106 4106 4107
		mu 0 3 1720 1909 2082
		f 3 -3739 4108 -3763
		mu 0 3 1864 1855 1917
		f 3 -4109 -3540 4109
		mu 0 3 1917 1855 1854
		f 3 -2476 4110 4111
		mu 0 3 1207 1196 2071
		f 3 -4111 -2468 -4068
		mu 0 3 2071 1196 1201
		f 3 -2558 4112 4113
		mu 0 3 1249 1254 2084
		f 3 -4113 4114 4115
		mu 0 3 2084 1254 2083
		f 3 -3750 4116 4117
		mu 0 3 1912 1859 1786
		f 3 -4117 -3933 -3414
		mu 0 3 1786 1859 1787
		f 3 -3330 4118 -3757
		mu 0 3 1733 1488 1860
		f 3 -4119 -3422 -3934
		mu 0 3 1860 1488 1790
		f 3 4119 4120 4121
		mu 0 3 2086 1913 2085
		f 3 -4121 -3749 4122
		mu 0 3 2085 1913 1912
		f 3 -3572 4123 4124
		mu 0 3 1736 1601 2087
		f 3 -4124 -3082 4125
		mu 0 3 2087 1601 1600
		f 3 -2798 4126 4127
		mu 0 3 1415 1414 2088
		f 3 -4127 4128 4129
		mu 0 3 2088 1414 2089
		f 3 -3085 4130 -3759
		mu 0 3 1406 1605 1916
		f 3 -4131 4131 4132
		mu 0 3 1916 1605 2090
		f 3 -3581 4133 -3345
		mu 0 3 1741 1863 1742
		f 3 -4134 4134 4135
		mu 0 3 1742 1863 2091
		f 3 4136 4137 -4116
		mu 0 3 2083 1717 2084
		f 3 -4138 -3290 4138
		mu 0 3 2084 1717 1716
		f 3 -3946 4139 -3359
		mu 0 3 1746 2006 1751
		f 3 -4140 -3956 -3152
		mu 0 3 1751 2006 2011
		f 3 4140 4141 -3149
		mu 0 3 2093 2005 2092
		f 3 -4142 -3940 4142
		mu 0 3 2092 2005 1738
		f 3 4143 4144 4145
		mu 0 3 2094 2095 1397
		f 3 -4145 -3613 -3961
		mu 0 3 1397 2095 2013
		f 3 4146 4147 4148
		mu 0 3 1593 2096 2003
		f 3 -4148 4149 4150
		mu 0 3 2003 2096 1929
		f 3 -4147 4151 4152
		mu 0 3 2096 1593 2097
		f 3 4153 4154 -3967
		mu 0 3 2016 2002 2017
		f 3 -4155 4155 4156
		mu 0 3 2017 2002 2098
		f 3 4157 -3385 4158
		mu 0 3 2099 1763 1764
		f 3 4159 4160 4161
		mu 0 3 2101 1937 2100
		f 3 -4161 -3791 -2903
		mu 0 3 2100 1937 1936
		f 3 -3975 4162 4163
		mu 0 3 2020 2023 2102
		f 3 -4163 4164 4165
		mu 0 3 2102 2023 2103
		f 3 4166 4167 -3119
		mu 0 3 2104 2105 2024
		f 3 -4168 4168 -3976
		mu 0 3 2024 2105 2025
		f 3 4169 4170 -2829
		mu 0 3 2107 2108 2106
		f 3 -4171 4171 4172
		mu 0 3 2106 2108 2109
		f 3 -3112 4173 4174
		mu 0 3 2111 2112 2110
		f 3 -4174 4175 -3970
		mu 0 3 2110 2112 2113
		f 3 4176 4177 4178
		mu 0 3 2114 2115 2028
		f 3 -4178 4179 -3984
		mu 0 3 2028 2115 2029
		f 3 4180 4181 4182
		mu 0 3 2117 1376 2116
		f 3 -4182 4183 4184
		mu 0 3 2116 1376 2118
		f 3 4185 4186 4187
		mu 0 3 2120 2121 2119
		f 3 -4187 4188 -3202
		mu 0 3 2119 2121 2122
		f 3 4189 4190 4191
		mu 0 3 2123 2124 1403
		f 3 -4191 -3644 4192
		mu 0 3 1403 2124 2125
		f 3 4193 4194 4195
		mu 0 3 2037 2127 2126
		f 3 -4195 4196 4197
		mu 0 3 2126 2127 2128
		f 3 -4008 -4196 4198
		mu 0 3 2038 2037 2126
		f 3 -4012 4199 4200
		mu 0 3 2039 2040 2129
		f 3 -4200 -3400 4201
		mu 0 3 2129 2040 2130
		f 3 -4015 4202 4203
		mu 0 3 2041 2042 2131
		f 3 -4203 -4027 4204
		mu 0 3 2131 2042 2132
		f 3 -3618 4205 -4017
		mu 0 3 2043 2133 2044
		f 3 -4206 4206 4207
		mu 0 3 2044 2133 2134
		f 3 -3413 4208 -4020
		mu 0 3 2045 2135 2046
		f 3 -4209 4209 4210
		mu 0 3 2046 2135 2136
		f 3 4211 4212 -3628
		mu 0 3 2137 2138 2047
		f 3 -4213 -2911 -4022
		mu 0 3 2047 2138 2048
		f 3 -3418 4213 -4026
		mu 0 3 2049 2139 2050
		f 3 -4214 4214 4215
		mu 0 3 2050 2139 2140
		f 3 -3509 4216 -2592
		mu 0 3 1276 1299 1277
		f 3 -4217 -2628 -3652
		mu 0 3 1277 1299 1298;
	setAttr ".fc[2500:2999]"
		f 3 4217 4218 -3662
		mu 0 3 2141 1220 2142
		f 3 -4219 -2501 4219
		mu 0 3 2142 1220 1221
		f 3 4220 4221 -3216
		mu 0 3 2144 2145 2143
		f 3 -4222 4222 4223
		mu 0 3 2143 2145 2146
		f 3 4224 4225 4226
		mu 0 3 2147 2148 2052
		f 3 -4226 -2664 -4036
		mu 0 3 2052 2148 2053
		f 3 4227 4228 4229
		mu 0 3 2149 2150 2056
		f 3 -4229 4230 -4041
		mu 0 3 2056 2150 2057
		f 3 -2674 4231 -4045
		mu 0 3 2058 2151 2059
		f 3 -4232 4232 4233
		mu 0 3 2059 2151 2152
		f 3 -3260 4234 -3889
		mu 0 3 1365 1703 1991
		f 3 -4235 4235 4236
		mu 0 3 1991 1703 2153
		f 3 4237 4238 4239
		mu 0 3 2154 1847 1332
		f 3 -4239 4240 -2681
		mu 0 3 1332 1847 1329
		f 3 4241 4242 -4076
		mu 0 3 2074 2072 1706
		f 3 -4243 -4071 -3264
		mu 0 3 1706 2072 1707
		f 3 4243 4244 4245
		mu 0 3 1335 1843 1889
		f 3 -4245 4246 -3670
		mu 0 3 1889 1843 1344
		f 3 -2629 4247 -3694
		mu 0 3 1275 1299 1896
		f 3 -4248 -3508 -4066
		mu 0 3 1896 1299 1845
		f 3 4248 4249 4250
		mu 0 3 2155 2156 1349
		f 3 -4250 4251 4252
		mu 0 3 1349 2156 1549
		f 3 4253 4254 -3279
		mu 0 3 1711 1237 1712
		f 3 -4255 -2535 4255
		mu 0 3 1712 1237 1242
		f 3 -3013 4256 4257
		mu 0 3 1567 1282 2063
		f 3 -4257 -2596 -4056
		mu 0 3 2063 1282 1281
		f 3 4258 4259 4260
		mu 0 3 2158 1191 2157
		f 3 -4260 4261 4262
		mu 0 3 2157 1191 1197
		f 3 -3499 4263 -3681
		mu 0 3 1842 1841 1893
		f 3 -4264 -4240 -4051
		mu 0 3 1893 1841 2062
		f 3 -2722 4264 -3231
		mu 0 3 1356 1359 1689
		f 3 -4265 -3512 4265
		mu 0 3 1689 1359 1563
		f 3 -3503 4266 4267
		mu 0 3 1697 1556 2159
		f 3 -4267 4268 4269
		mu 0 3 2159 1556 1730
		f 3 -4256 4270 4271
		mu 0 3 1712 1242 2160
		f 3 -4271 4272 4273
		mu 0 3 2160 1242 2161
		f 3 -3703 4274 -2418
		mu 0 3 1164 1561 1167
		f 3 -4275 -3002 -2685
		mu 0 3 1167 1561 1334
		f 3 4275 4276 -2725
		mu 0 3 1360 1729 1361
		f 3 -4277 4277 4278
		mu 0 3 1361 1729 1835
		f 3 -4114 4279 -2549
		mu 0 3 1249 2084 1214
		f 3 -4280 4280 -2734
		mu 0 3 1214 2084 1366
		f 3 4281 4282 4283
		mu 0 3 2162 2114 2081
		f 3 -4283 -4179 4284
		mu 0 3 2081 2114 2028
		f 3 4285 4286 4287
		mu 0 3 2163 1377 2117
		f 3 -4287 -2751 -4181
		mu 0 3 2117 1377 1376
		f 3 4288 4289 4290
		mu 0 3 2080 2016 2164
		f 3 -4290 -3964 4291
		mu 0 3 2164 2016 2015
		f 3 4292 4293 4294
		mu 0 3 2166 1904 2165
		f 3 -4294 -3917 4295
		mu 0 3 2165 1904 1628
		f 3 4296 4297 -3305
		mu 0 3 1724 2167 1725
		f 3 -4298 4298 -3962
		mu 0 3 1725 2167 1927
		f 3 4299 4300 4301
		mu 0 3 2082 1442 2168
		f 3 -4301 4302 4303
		mu 0 3 2168 1442 2169
		f 3 4304 4305 -2757
		mu 0 3 1382 2170 1383
		f 3 -4306 4306 4307
		mu 0 3 1383 2170 1396
		f 3 4308 4309 4310
		mu 0 3 1416 2123 1402
		f 3 -4310 -4192 -2783
		mu 0 3 1402 2123 1403
		f 3 4311 4312 4313
		mu 0 3 2086 2172 2171
		f 3 -4313 4314 4315
		mu 0 3 2171 2172 1430
		f 3 4316 4317 4318
		mu 0 3 2173 1755 2087
		f 3 -4318 -3774 4319
		mu 0 3 2087 1755 1923
		f 3 4320 4321 4322
		mu 0 3 2089 2174 1740
		f 3 -4322 4323 -3339
		mu 0 3 1740 2174 1621
		f 3 4324 4325 4326
		mu 0 3 2090 1417 1921
		f 3 -4326 -3098 -3769
		mu 0 3 1921 1417 1610
		f 3 4327 4328 4329
		mu 0 3 1423 2175 1918
		f 3 -4329 4330 -3765
		mu 0 3 1918 2175 1919
		f 3 4331 4332 -4136
		mu 0 3 2091 2176 1742
		f 3 -4333 4333 4334
		mu 0 3 1742 2176 2177
		f 3 -4141 4335 4336
		mu 0 3 2005 2093 1608
		f 3 -4336 4337 4338
		mu 0 3 1608 2093 2178
		f 3 -2835 4339 4340
		mu 0 3 1444 1443 1750
		f 3 -4340 -3928 -3358
		mu 0 3 1750 1443 1743
		f 3 -3062 4341 -4152
		mu 0 3 1593 1592 2097
		f 3 -4342 4342 4343
		mu 0 3 2097 1592 2179
		f 3 -3055 4344 4345
		mu 0 3 1589 1590 2180
		f 3 -4345 4346 4347
		mu 0 3 2180 1590 2181
		f 3 4348 4349 4350
		mu 0 3 2182 2183 1933
		f 3 -4350 4351 -3785
		mu 0 3 1933 2183 1934
		f 3 4352 4353 4354
		mu 0 3 2185 2186 2184
		f 3 -4354 4355 4356
		mu 0 3 2184 2186 2187
		f 3 4357 4358 4359
		mu 0 3 2189 2190 2188
		f 3 -4359 4360 4361
		mu 0 3 2188 2190 2191
		f 3 -3803 4362 4363
		mu 0 3 1946 1949 2192
		f 3 -4363 -4014 4364
		mu 0 3 2192 1949 2193
		f 3 4365 4366 4367
		mu 0 3 2194 2195 2107
		f 3 -4367 -2910 -4170
		mu 0 3 2107 2195 2108
		f 3 -3590 4368 4369
		mu 0 3 2197 2111 2196
		f 3 -4369 -4175 -3788
		mu 0 3 2196 2111 2110
		f 3 4370 4371 4372
		mu 0 3 2198 2001 1961
		f 3 -4372 -3906 -3821
		mu 0 3 1961 2001 1577
		f 3 -2753 4373 -4184
		mu 0 3 1376 1379 2118
		f 3 -4374 4374 -2926
		mu 0 3 2118 1379 2199
		f 3 4375 4376 4377
		mu 0 3 1381 2200 2114
		f 3 -4377 4378 -4177
		mu 0 3 2114 2200 2115
		f 3 4379 4380 -3201
		mu 0 3 2201 1404 2125
		f 3 -4381 -2786 -4193
		mu 0 3 2125 1404 1403
		f 3 4381 4382 -2933
		mu 0 3 2203 1405 2202
		f 3 -4383 -2792 4383
		mu 0 3 2202 1405 1408
		f 3 -4021 4384 4385
		mu 0 3 2205 2206 2204
		f 3 -4385 4386 4387
		mu 0 3 2204 2206 2207
		f 3 4388 4389 4390
		mu 0 3 2209 1495 2208
		f 3 -4390 -2902 -3832
		mu 0 3 2208 1495 1494
		f 3 -4018 4391 -4391
		mu 0 3 2208 2210 2209
		f 3 -4392 4392 4393
		mu 0 3 2209 2210 2211
		f 3 -2912 4394 -4172
		mu 0 3 1500 1501 2212
		f 3 -4395 4395 4396
		mu 0 3 2212 1501 2213
		f 3 4397 4398 -3978
		mu 0 3 2215 2216 2214
		f 3 -4399 4399 4400
		mu 0 3 2214 2216 2217
		f 3 -4398 4401 4402
		mu 0 3 2216 2215 2218
		f 3 -4402 -4169 4403
		mu 0 3 2218 2215 2219
		f 3 4404 4405 -3987
		mu 0 3 2221 2222 2220
		f 3 -4406 -4009 4406
		mu 0 3 2220 2222 2223
		f 3 -3812 4407 4408
		mu 0 3 2225 2226 2224
		f 3 -4408 4409 -3428
		mu 0 3 2224 2226 2227
		f 3 4410 4411 -3170
		mu 0 3 2229 2230 2228
		f 3 -4412 4412 4413
		mu 0 3 2228 2230 2231
		f 3 4414 4415 -2888
		mu 0 3 2233 2234 2232
		f 3 -4416 -4400 4416
		mu 0 3 2232 2234 2235
		f 3 4417 4418 -3472
		mu 0 3 2236 2010 1308
		f 3 -4419 4419 -2641
		mu 0 3 1308 2010 1306
		f 3 4420 4421 4422
		mu 0 3 2238 2239 2237
		f 3 -4422 4423 -2425
		mu 0 3 2237 2239 2240
		f 3 4424 4425 4426
		mu 0 3 2241 2242 2147
		f 3 -4426 4427 -4225
		mu 0 3 2147 2242 2148
		f 3 4428 4429 -3861
		mu 0 3 1989 2243 1990
		f 3 -4430 4430 -3109
		mu 0 3 1990 2243 2244
		f 3 -4049 4431 -3708
		mu 0 3 1899 2245 1703
		f 3 -4432 4432 -4236
		mu 0 3 1703 2245 2153
		f 3 -3517 4433 -4241
		mu 0 3 1847 1209 1329
		f 3 -4434 -2965 4434
		mu 0 3 1329 1209 1541
		f 3 -3484 4435 4436
		mu 0 3 1836 1548 2074
		f 3 -4436 4437 -4242
		mu 0 3 2074 1548 2072
		f 3 -2430 4438 4439
		mu 0 3 1174 1173 1889
		f 3 -4439 -2688 -4246
		mu 0 3 1889 1173 1335
		f 3 -2566 4440 4441
		mu 0 3 1257 1260 1839
		f 3 -4441 4442 -3495
		mu 0 3 1839 1260 1228
		f 3 -3872 4443 4444
		mu 0 3 1894 1892 2155
		f 3 -4444 4445 -4249
		mu 0 3 2155 1892 2156
		f 3 4446 4447 -2715
		mu 0 3 1352 1567 1353
		f 3 -4448 -4258 4448
		mu 0 3 1353 1567 2063
		f 3 -4261 4449 4450
		mu 0 3 2158 2157 2067
		f 3 -4450 4451 -4059
		mu 0 3 2067 2157 2068
		f 3 -2995 4452 4453
		mu 0 3 1555 1558 1834
		f 3 -4453 -3283 -4053
		mu 0 3 1834 1558 1713
		f 3 -2999 4454 -2599
		mu 0 3 1283 1560 1281
		f 3 -4455 -3525 -4054
		mu 0 3 1281 1560 2064
		f 3 -4266 4455 4456
		mu 0 3 1689 1563 2246
		f 3 -4456 -3007 4457
		mu 0 3 2246 1563 1566
		f 3 -4440 4458 4459
		mu 0 3 1174 1889 1198
		f 3 -4459 -3672 -2462
		mu 0 3 1198 1889 1199
		f 3 4460 4461 -4077
		mu 0 3 1715 1897 2074
		f 3 -4462 -3696 -4437
		mu 0 3 2074 1897 1836
		f 3 -3248 4462 4463
		mu 0 3 1698 1697 2247
		f 3 -4463 -4268 4464
		mu 0 3 2247 1697 2159
		f 3 -4081 4465 4466
		mu 0 3 2075 1848 1363
		f 3 -4466 4467 -2727
		mu 0 3 1363 1848 1364
		f 3 4468 4469 -3676
		mu 0 3 1890 1570 1211
		f 3 -4470 4470 4471
		mu 0 3 1211 1570 1192
		f 3 4472 -2496 4473
		mu 0 3 2078 1217 1216
		f 3 -2536 4474 -4273
		mu 0 3 1242 1241 2161
		f 3 -4475 4475 4476
		mu 0 3 2161 1241 2248
		f 3 4477 4478 -3887
		mu 0 3 1367 2249 1565
		f 3 -4479 4479 -3894
		mu 0 3 1565 2249 1998
		f 3 -3234 4480 -3249
		mu 0 3 1691 1243 1699
		f 3 -4481 -2543 4481
		mu 0 3 1699 1243 1246
		f 3 -2754 4482 4483
		mu 0 3 1382 1381 2162
		f 3 -4483 -4378 -4282
		mu 0 3 2162 1381 2114
		f 3 4484 4485 4486
		mu 0 3 1906 2163 1954
		f 3 -4486 -4288 4487
		mu 0 3 1954 2163 2117
		f 3 -4305 4488 4489
		mu 0 3 2170 1382 2164
		f 3 -4489 -4484 4490
		mu 0 3 2164 1382 2162
		f 3 4491 4492 4493
		mu 0 3 2166 1385 1719
		f 3 -4493 -2761 -3717
		mu 0 3 1719 1385 1384
		f 3 -4485 4494 4495
		mu 0 3 2163 1906 2167
		f 3 -4495 -3733 4496
		mu 0 3 2167 1906 1905
		f 3 4497 4498 -3722
		mu 0 3 1721 2168 1857
		f 3 -4499 4499 -3549
		mu 0 3 1857 2168 1726
		f 3 4500 4501 -4307
		mu 0 3 2170 2094 1396
		f 3 -4502 -4146 -2774
		mu 0 3 1396 2094 1397
		f 3 -2964 4502 4503
		mu 0 3 1540 1210 1256
		f 3 -4503 -2482 -2563
		mu 0 3 1256 1210 1160
		f 3 4504 4505 -2801
		mu 0 3 1415 1956 1416
		f 3 -4506 4506 -4309
		mu 0 3 1416 1956 2123
		f 3 4507 4508 4509
		mu 0 3 2173 1732 1410
		f 3 -4509 -3325 -2793
		mu 0 3 1410 1732 1411
		f 3 -2802 4510 4511
		mu 0 3 1413 1416 1914
		f 3 -4511 -4311 -3751
		mu 0 3 1914 1416 1402
		f 3 -3329 4512 -2806
		mu 0 3 1419 1733 1420
		f 3 -4513 -3754 4513
		mu 0 3 1420 1733 1915
		f 3 4514 4515 4516
		mu 0 3 2250 1615 1431
		f 3 -4516 -3104 4517
		mu 0 3 1431 1615 1614
		f 3 -2817 4518 -3842
		mu 0 3 1425 1428 1815
		f 3 -4519 -3699 -3948
		mu 0 3 1815 1428 1898
		f 3 -3591 4519 4520
		mu 0 3 1327 1865 2091
		f 3 -4520 4521 -4332
		mu 0 3 2091 1865 2176
		f 3 4522 4523 -4324
		mu 0 3 2174 2251 1621
		f 3 -4524 -4368 -3115
		mu 0 3 1621 2251 1437
		f 3 -4316 4524 4525
		mu 0 3 2171 1430 2252
		f 3 -4525 -2820 -4364
		mu 0 3 2252 1430 1429
		f 3 4526 4527 4528
		mu 0 3 2169 2253 1727
		f 3 -4528 4529 4530
		mu 0 3 1727 2253 2254
		f 3 4531 4532 -4347
		mu 0 3 1590 2165 2181
		f 3 -4533 4533 4534
		mu 0 3 2181 2165 2255
		f 3 -3966 4535 4536
		mu 0 3 2015 2014 2094
		f 3 -4536 -3135 -4144
		mu 0 3 2094 2014 2095
		f 3 4537 4538 4539
		mu 0 3 2257 2185 2256
		f 3 -4539 -4355 -4194
		mu 0 3 2256 2185 2184
		f 3 -4150 4540 -3141
		mu 0 3 1634 2258 1635
		f 3 -4541 4541 -4005
		mu 0 3 1635 2258 2259
		f 3 -4176 4542 -2849
		mu 0 3 2260 2261 1639
		f 3 -4543 4543 -3147
		mu 0 3 1639 2261 1636
		f 3 -3151 4544 -4338
		mu 0 3 1640 1641 2262
		f 3 -4545 -3183 4545
		mu 0 3 2262 1641 2263
		f 3 4546 4547 -4334
		mu 0 3 2264 2265 1471
		f 3 -4548 4548 -2870
		mu 0 3 1471 2265 1472
		f 3 4549 4550 -3877
		mu 0 3 1993 2266 1222
		f 3 -4551 4551 4552
		mu 0 3 1222 2266 1369
		f 3 -3051 4553 4554
		mu 0 3 1586 1475 2267
		f 3 -4554 -2877 -3436
		mu 0 3 2267 1475 1474
		f 3 -4110 4555 4556
		mu 0 3 1917 1854 2268
		f 3 -4556 4557 -3641
		mu 0 3 2268 1854 2269
		f 3 4558 4559 -3083
		mu 0 3 1602 2270 1603
		f 3 -4560 4560 4561
		mu 0 3 1603 2270 2271
		f 3 4562 4563 4564
		mu 0 3 2272 1604 2203
		f 3 -4564 -3088 -4382
		mu 0 3 2203 1604 1405
		f 3 -3835 4565 4566
		mu 0 3 2274 2205 2273
		f 3 -4566 -4386 -4165
		mu 0 3 2273 2205 2204
		f 3 -4397 4567 4568
		mu 0 3 2212 2213 2275
		f 3 -4568 4569 4570
		mu 0 3 2275 2213 2276
		f 3 -4401 4571 -3796
		mu 0 3 2214 2217 1507
		f 3 -4572 4572 -2921
		mu 0 3 1507 2217 1506
		f 3 4573 4574 -4180
		mu 0 3 2277 2278 2221
		f 3 -4575 -3824 -4405
		mu 0 3 2221 2278 2222
		f 3 4575 4576 -4410
		mu 0 3 2226 2279 2227
		f 3 -4577 4577 -3423
		mu 0 3 2227 2279 2280
		f 3 4578 4579 4580
		mu 0 3 2281 2282 2229
		f 3 -4580 -4201 -4411
		mu 0 3 2229 2282 2230
		f 3 4581 4582 4583
		mu 0 3 2283 2284 2233
		f 3 -4583 -4573 -4415
		mu 0 3 2233 2284 2234
		f 3 -3352 4584 -3650
		mu 0 3 1749 1748 1883
		f 3 -4585 4585 -4231
		mu 0 3 1883 1748 2285
		f 3 -2650 4586 -4423
		mu 0 3 2237 2286 2238
		f 3 -4587 4587 4588
		mu 0 3 2238 2286 2287
		f 3 4589 4590 4591
		mu 0 3 2288 2289 2241
		f 3 -4591 -2615 -4425
		mu 0 3 2241 2289 2242
		f 3 -2957 4592 -2643
		mu 0 3 1538 1537 2290
		f 3 -4593 4593 4594
		mu 0 3 2290 1537 2291
		f 3 -4237 4595 -3863
		mu 0 3 1991 2153 1888
		f 3 -4596 4596 4597
		mu 0 3 1888 2153 1330
		f 3 -4238 4598 -3516
		mu 0 3 1847 2154 1595
		f 3 -4599 -3501 -3068
		mu 0 3 1595 2154 1596
		f 3 -2625 4599 -3253
		mu 0 3 1296 1273 1700
		f 3 -4600 -2589 -3691
		mu 0 3 1700 1273 1275
		f 3 4600 4601 4602
		mu 0 3 1346 2155 1348
		f 3 -4602 -4251 -2710
		mu 0 3 1348 2155 1349
		f 3 -3280 4603 4604
		mu 0 3 1219 1712 2292
		f 3 -4604 -4272 4605
		mu 0 3 2292 1712 2160
		f 3 -3010 4606 -2665
		mu 0 3 1294 1568 1318
		f 3 -4607 -3494 -3690
		mu 0 3 1318 1568 1840
		f 3 -4063 4607 4608
		mu 0 3 2066 2069 2293
		f 3 -4608 4609 4610
		mu 0 3 2293 2069 2294
		f 3 4611 4612 -4252
		mu 0 3 2156 2070 1549
		f 3 -4613 4613 -2978
		mu 0 3 1549 2070 1550
		f 3 -4070 4614 4615
		mu 0 3 2071 1698 2295
		f 3 -4615 -4464 4616
		mu 0 3 2295 1698 2247
		f 3 -3510 4617 -3702
		mu 0 3 1846 1359 1561
		f 3 -4618 -2721 -3000
		mu 0 3 1561 1359 1358
		f 3 -2993 4618 -4269
		mu 0 3 1556 1555 1730
		f 3 -4619 4619 -3318
		mu 0 3 1730 1555 1731
		f 3 -2518 4620 -3035
		mu 0 3 1233 1217 1581
		f 3 -4621 -4473 -4085
		mu 0 3 1581 1217 2078
		f 3 4621 4622 4623
		mu 0 3 2296 1216 2292
		f 3 -4623 -2498 -4605
		mu 0 3 2292 1216 1219
		f 3 -4482 4624 -3504
		mu 0 3 1699 1246 1557
		f 3 -4625 -2696 -3529
		mu 0 3 1557 1246 1340
		f 3 -4270 4625 4626
		mu 0 3 2159 1730 1360
		f 3 -4626 -3320 -4276
		mu 0 3 1360 1730 1729
		f 3 -4285 4627 -4100
		mu 0 3 2081 2028 1902
		f 3 -4628 -3986 4628
		mu 0 3 1902 2028 1950
		f 3 -4103 4629 -3912
		mu 0 3 1391 1907 1873
		f 3 -4630 4630 -3988
		mu 0 3 1873 1907 1953
		f 3 -4491 4631 -4291
		mu 0 3 2164 2162 2080
		f 3 -4632 -4284 -4097
		mu 0 3 2080 2162 2081
		f 3 -4293 4632 -3730
		mu 0 3 1904 2166 1588
		f 3 -4633 -4494 -3292
		mu 0 3 1588 2166 1719
		f 3 -4286 4633 -3548
		mu 0 3 1377 2163 1724
		f 3 -4634 -4496 -4297
		mu 0 3 1724 2163 2167
		f 3 -4108 4634 -3297
		mu 0 3 1720 2082 1721
		f 3 -4635 -4302 -4498
		mu 0 3 1721 2082 2168
		f 3 -3925 4635 4636
		mu 0 3 2004 1625 1594
		f 3 -4636 -3370 -4030
		mu 0 3 1594 1625 1757
		f 3 4637 4638 4639
		mu 0 3 2297 2085 2121
		f 3 -4639 4640 4641
		mu 0 3 2121 2085 2298
		f 3 -3936 4642 4643
		mu 0 3 1861 1875 2088
		f 3 -4643 -3993 4644
		mu 0 3 2088 1875 1957
		f 3 -4312 4645 4646
		mu 0 3 2172 2086 2297
		f 3 -4646 -4122 -4638
		mu 0 3 2297 2086 2085
		f 3 -4126 4647 -4319
		mu 0 3 2087 1600 2173
		f 3 -4648 -3560 -4508
		mu 0 3 2173 1600 1732
		f 3 -4130 4648 -4644
		mu 0 3 2088 2089 1861
		f 3 -4649 -4323 -3573
		mu 0 3 1861 2089 1740
		f 3 -3562 4649 -4132
		mu 0 3 1605 1418 2090
		f 3 -4650 -2805 -4325
		mu 0 3 2090 1418 1417
		f 3 -2818 4650 -4517
		mu 0 3 1431 1430 2250
		f 3 -4651 -4315 4651
		mu 0 3 2250 1430 2172
		f 3 -4478 4652 4653
		mu 0 3 2249 1367 1911
		f 3 -4653 -2735 4654
		mu 0 3 1911 1367 1366
		f 3 -3101 4655 4656
		mu 0 3 1614 1613 2299
		f 3 -4656 4657 4658
		mu 0 3 2299 1613 2300
		f 3 4659 4660 4661
		mu 0 3 2301 1609 2178
		f 3 -4661 -3095 -4339
		mu 0 3 2178 1609 1608
		f 3 4662 4663 4664
		mu 0 3 1675 1925 2302
		f 3 -4664 -3777 -3145
		mu 0 3 2302 1925 1924
		f 3 -4531 4665 -3310
		mu 0 3 1727 2254 1592
		f 3 -4666 -4360 -4343
		mu 0 3 1592 2254 2179
		f 3 -3302 4666 4667
		mu 0 3 1722 1589 2303
		f 3 -4667 -4346 -4353
		mu 0 3 2303 1589 2180
		f 3 -4349 4668 -4549
		mu 0 3 2183 2182 2304
		f 3 -4669 4669 4670
		mu 0 3 2304 2182 2305
		f 3 -4348 4671 -4356
		mu 0 3 2186 2306 2187
		f 3 -4672 4672 -4394
		mu 0 3 2187 2306 2307
		f 3 -4344 4673 4674
		mu 0 3 2309 2188 2308
		f 3 -4674 -4362 4675
		mu 0 3 2308 2188 2191
		f 3 -4365 4676 4677
		mu 0 3 2192 2193 2310
		f 3 -4677 -4204 4678
		mu 0 3 2310 2193 2311
		f 3 4679 4680 4681
		mu 0 3 2312 2313 2194
		f 3 -4681 -2907 -4366
		mu 0 3 2194 2313 2195
		f 3 -2874 4682 -4659
		mu 0 3 1470 1473 2026
		f 3 -4683 -4159 -3981
		mu 0 3 2026 1473 2027
		f 3 4683 4684 -4375
		mu 0 3 1379 1853 2199
		f 3 -4685 4685 -3191
		mu 0 3 2199 1853 2314
		f 3 4686 4687 4688
		mu 0 3 2315 1370 2266
		f 3 -4688 -2740 -4552
		mu 0 3 2266 1370 1369
		f 3 -4380 4689 4690
		mu 0 3 1404 2201 1602
		f 3 -4690 -2938 -4559
		mu 0 3 1602 2201 2270
		f 3 -4384 4691 -3197
		mu 0 3 2202 1408 2268
		f 3 -4692 -3762 -4557
		mu 0 3 2268 1408 1917
		f 3 4692 -4001 -4676
		mu 0 3 2316 2036 2035
		f 3 -4208 4693 -4393
		mu 0 3 2210 2128 2211
		f 3 -4694 -4197 -4357
		mu 0 3 2211 2128 2127
		f 3 -4202 4694 -4413
		mu 0 3 2129 2130 2276
		f 3 -4695 -3980 4695
		mu 0 3 2276 2130 2317
		f 3 4696 -4404 4697
		mu 0 3 2318 2218 2219
		f 3 -3807 4698 4699
		mu 0 3 2320 2220 2319
		f 3 -4699 -4407 -4199
		mu 0 3 2319 2220 2223
		f 3 -3990 4700 4701
		mu 0 3 2322 2225 2321
		f 3 -4701 -4409 -4003
		mu 0 3 2321 2225 2224
		f 3 -4414 4702 -2892
		mu 0 3 2228 2231 2323
		f 3 -4703 -4570 4703
		mu 0 3 2323 2231 2324
		f 3 -4417 4704 -3167
		mu 0 3 2232 2235 2325
		f 3 -4705 -4403 4705
		mu 0 3 2325 2235 2326
		f 3 4706 4707 -2669
		mu 0 3 1325 2327 1326
		f 3 -4708 -3208 -3113
		mu 0 3 1326 2327 1620
		f 3 -3456 4708 4709
		mu 0 3 2329 2330 2328
		f 3 -4709 4710 4711
		mu 0 3 2328 2330 2331
		f 3 4712 4713 4714
		mu 0 3 2333 2240 2332
		f 3 -4714 -4424 4715
		mu 0 3 2332 2240 2239
		f 3 -4224 4716 -2944
		mu 0 3 2143 2146 1828
		f 3 -4717 4717 -3466
		mu 0 3 1828 2146 1829
		f 3 -2667 4718 -4233
		mu 0 3 2151 2244 2152
		f 3 -4719 -4431 4719
		mu 0 3 2152 2244 2243
		f 3 -4433 4720 -4597
		mu 0 3 2153 2245 1330
		f 3 -4721 -3237 -2677
		mu 0 3 1330 2245 1331
		f 3 -2968 4721 4722
		mu 0 3 1542 1545 2334
		f 3 -4722 -3552 4723
		mu 0 3 2334 1545 1858
		f 3 -2428 4724 -3075
		mu 0 3 1175 1174 1190
		f 3 -4725 -4460 4725
		mu 0 3 1190 1174 1198
		f 3 -4442 4726 -3588
		mu 0 3 1257 1839 1355
		f 3 -4727 4727 -2717
		mu 0 3 1355 1839 1352
		f 3 -3685 4728 -2706
		mu 0 3 1345 1894 1346
		f 3 -4729 -4445 -4601
		mu 0 3 1346 1894 2155
		f 3 -3497 4729 -4247
		mu 0 3 1843 1842 1344
		f 3 -4730 -3683 -2703
		mu 0 3 1344 1842 1345
		f 3 -4449 4730 4731
		mu 0 3 1353 2063 2335
		f 3 -4731 -4058 4732
		mu 0 3 2335 2063 2065
		f 3 -3874 4733 -3284
		mu 0 3 1714 1399 1343
		f 3 -4734 -2779 -2699
		mu 0 3 1343 1399 1312
		f 3 -4067 4734 -4614
		mu 0 3 2070 1845 1550
		f 3 -4735 -3505 -3487
		mu 0 3 1550 1845 1837
		f 3 -4112 4735 -3674
		mu 0 3 1207 2071 1890
		f 3 -4736 -4616 4736
		mu 0 3 1890 2071 2295
		f 3 -4073 4737 -4733
		mu 0 3 2073 2072 1547
		f 3 -4738 -4438 -2974
		mu 0 3 1547 2072 1548
		f 3 -4454 4738 -4620
		mu 0 3 1555 1834 1731
		f 3 -4739 -3477 -4091
		mu 0 3 1731 1834 1833
		f 3 4739 4740 -3286
		mu 0 3 1582 2336 1250
		f 3 -4741 4741 -4083
		mu 0 3 1250 2336 2077
		f 3 -4474 4742 -4087
		mu 0 3 2078 1216 2079
		f 3 -4743 -4622 4743
		mu 0 3 2079 1216 2296
		f 3 -3475 4744 -4093
		mu 0 3 1833 1562 1357
		f 3 -4745 -3003 -2718
		mu 0 3 1357 1562 1358
		f 3 -3041 4745 -2743
		mu 0 3 1371 1166 1372
		f 3 -4746 -2422 -3276
		mu 0 3 1372 1166 1168
		f 3 -4629 4746 -3726
		mu 0 3 1902 1950 1856
		f 3 -4747 -3804 -4095
		mu 0 3 1856 1950 1781
		f 3 -3731 4747 -4631
		mu 0 3 1907 1906 1953
		f 3 -4748 -4487 -3808
		mu 0 3 1953 1906 1954
		f 3 -4154 4748 -3915
		mu 0 3 2002 2016 1901
		f 3 -4749 -4289 -4099
		mu 0 3 1901 2016 2080
		f 3 -4101 4749 -3918
		mu 0 3 1903 1389 1447
		f 3 -4750 -3057 -2840
		mu 0 3 1447 1389 1448
		f 3 -4105 4750 -3921
		mu 0 3 1908 1394 2003
		f 3 -4751 -3063 -4149
		mu 0 3 2003 1394 1593
		f 3 -3926 4751 -4107
		mu 0 3 1909 1443 2082
		f 3 -4752 -2837 -4300
		mu 0 3 2082 1443 1442
		f 3 4752 4753 -3893
		mu 0 3 1998 2075 1997
		f 3 -4754 -4467 -3931
		mu 0 3 1997 2075 1363
		f 3 -4123 4754 -4641
		mu 0 3 2085 1912 2298
		f 3 -4755 -4118 4755
		mu 0 3 2298 1912 1786
		f 3 -4645 4756 -4128
		mu 0 3 2088 1957 1415
		f 3 -4757 -3815 -4505
		mu 0 3 1415 1957 1956
		f 3 -4120 4757 -3938
		mu 0 3 1913 2086 1441
		f 3 -4758 -4314 4758
		mu 0 3 1441 2086 2171
		f 3 -3334 4759 -3959
		mu 0 3 1737 1736 1923
		f 3 -4760 -4125 -4320
		mu 0 3 1923 1736 2087
		f 3 -3096 4760 -4129
		mu 0 3 1414 1609 2089
		f 3 -4761 4761 -4321
		mu 0 3 2089 1609 2174
		f 3 -4133 4762 -3945
		mu 0 3 1916 2090 2006
		f 3 -4763 -4327 -3954
		mu 0 3 2006 2090 1921
		f 3 -4652 4763 4764
		mu 0 3 2250 2172 2337
		f 3 -4764 -4647 4765
		mu 0 3 2337 2172 2297
		f 3 -4655 4766 -3740
		mu 0 3 1911 1366 1716
		f 3 -4767 -4281 -4139
		mu 0 3 1716 1366 2084
		f 3 -3346 4767 -4658
		mu 0 3 1613 1742 2300
		f 3 -4768 -4335 -2872
		mu 0 3 2300 1742 2177
		f 3 -3957 4768 -3337
		mu 0 3 1737 2012 1738
		f 3 -4769 -2868 -4143
		mu 0 3 1738 2012 2092
		f 3 -3207 4769 -3114
		mu 0 3 1676 1675 2338
		f 3 -4770 -4665 -4544
		mu 0 3 2338 1675 2302
		f 3 -3922 -4151 -3781
		mu 0 3 1928 2003 1929
		f 3 -3913 4770 -4156
		mu 0 3 2002 1722 2098
		f 3 -4771 -4668 -4538
		mu 0 3 2098 1722 2303
		f 3 -4671 4771 -2873
		mu 0 3 2304 2305 2099
		f 3 -4772 4772 -4158
		mu 0 3 2099 2305 1763
		f 3 -4535 4773 -4673
		mu 0 3 2306 2101 2307
		f 3 -4774 -4162 -4389
		mu 0 3 2307 2101 2100
		f 3 -4530 4774 -4358
		mu 0 3 2189 2102 2190
		f 3 -4775 -4166 -4388
		mu 0 3 2190 2102 2103
		f 3 -4679 4775 -2832
		mu 0 3 2310 2311 2104
		f 3 -4776 4776 -4167
		mu 0 3 2104 2311 2105
		f 3 -4173 4777 -2825
		mu 0 3 2106 2109 1943
		f 3 -4778 -4569 -3797
		mu 0 3 1943 2109 1944
		f 3 -3360 4778 4779
		mu 0 3 2340 1643 2339
		f 3 -4779 -3154 -3829
		mu 0 3 2339 1643 1642
		f 3 -4488 4780 -3811
		mu 0 3 1954 2117 1955
		f 3 -4781 -4183 -4576
		mu 0 3 1955 2117 2116
		f 3 -4190 4781 -3447
		mu 0 3 2124 2123 1959
		f 3 -4782 -4507 -3817
		mu 0 3 1959 2123 1956
		f 3 -4211 4782 -4387
		mu 0 3 2206 2036 2207
		f 3 -4783 -4693 -4361
		mu 0 3 2207 2036 2316
		f 3 -4571 -4696 -3799
		mu 0 3 2275 2276 2317
		f 3 -4205 4783 -4777
		mu 0 3 2131 2132 2219
		f 3 -4784 -4216 -4698
		mu 0 3 2219 2132 2318
		f 3 -3409 4784 -4207
		mu 0 3 2133 2320 2134
		f 3 -4785 -4700 -4198
		mu 0 3 2134 2320 2319
		f 3 -3622 4785 -4210
		mu 0 3 2135 2322 2136
		f 3 -4786 -4702 -4002
		mu 0 3 2136 2322 2321
		f 3 -4704 4786 -3421
		mu 0 3 2323 2324 2137
		f 3 -4787 -4396 -4212
		mu 0 3 2137 2324 2138
		f 3 -4215 4787 -4697
		mu 0 3 2140 2139 2326
		f 3 -4788 -3624 -4706
		mu 0 3 2326 2139 2325
		f 3 -4428 -2617 -2662
		mu 0 3 1320 1293 1294
		f 3 4788 4789 4790
		mu 0 3 2342 1259 2341
		f 3 -4790 -2947 -3468
		mu 0 3 2341 1259 1527
		f 3 4791 4792 -4710
		mu 0 3 2328 1986 2329
		f 3 -4793 -3856 -3845
		mu 0 3 2329 1986 1985
		f 3 -2653 4793 -4037
		mu 0 3 2054 2333 2055
		f 3 -4794 -4715 4794
		mu 0 3 2055 2333 2332
		f 3 -4221 4795 4796
		mu 0 3 2145 2144 2149
		f 3 -4796 -3651 -4228
		mu 0 3 2149 2144 2150
		f 3 -4707 4797 -2961
		mu 0 3 2344 2061 2343
		f 3 -4798 -4046 4798
		mu 0 3 2343 2061 2060
		f 3 -4435 4799 -2679
		mu 0 3 1329 1541 1330
		f 3 -4800 -3669 -4598
		mu 0 3 1330 1541 1888
		f 3 -2487 4800 -2435
		mu 0 3 1177 1211 1178
		f 3 -4801 -4472 -2457
		mu 0 3 1178 1211 1192
		f 3 -4244 4801 -3500
		mu 0 3 1843 1335 1844
		f 3 -4802 -2690 -3071
		mu 0 3 1844 1335 1337
		f 3 -4465 4802 4803
		mu 0 3 2247 2159 1204
		f 3 -4803 -4627 -2723
		mu 0 3 1204 2159 1360
		f 3 -3677 4804 -4446
		mu 0 3 1892 1891 2156
		f 3 -4805 -4065 -4612
		mu 0 3 2156 1891 2070
		f 3 -2694 4805 4806
		mu 0 3 1338 1339 1350
		f 3 -4806 4807 -3488
		mu 0 3 1350 1339 1838
		f 3 -3492 4808 -4728
		mu 0 3 1839 1568 1352
		f 3 -4809 -3012 -4447
		mu 0 3 1352 1568 1567
		f 3 -2707 4809 4810
		mu 0 3 1347 1346 1351
		f 3 -4810 -4603 -2712
		mu 0 3 1351 1346 1348
		f 3 -2979 4811 -4253
		mu 0 3 1549 1338 1349
		f 3 -4812 -4807 -2708
		mu 0 3 1349 1338 1350
		f 3 -3356 4812 -2971
		mu 0 3 1747 1354 2335
		f 3 -4813 -2713 -4732
		mu 0 3 2335 1354 1353
		f 3 -3229 4813 -2969
		mu 0 3 1543 1689 1544
		f 3 -4814 -4457 4814
		mu 0 3 1544 1689 2246
		f 3 -3882 4815 4816
		mu 0 3 1995 1897 1718
		f 3 -4816 -4461 -3289
		mu 0 3 1718 1897 1715
		f 3 -4617 4817 4818
		mu 0 3 2295 2247 1203
		f 3 -4818 -4804 -2471
		mu 0 3 1203 2247 1204;
	setAttr ".fc[3000:3334]"
		f 3 -4737 4819 -4469
		mu 0 3 1890 2295 1570
		f 3 -4820 -4819 -3017
		mu 0 3 1570 2295 1203
		f 3 -2529 4820 -4476
		mu 0 3 1241 1240 2248
		f 3 -4821 -2736 4821
		mu 0 3 2248 1240 1368
		f 3 -2745 4822 -3039
		mu 0 3 1371 1374 1582
		f 3 -4823 4823 -4740
		mu 0 3 1582 1374 2336
		f 3 -4458 4824 4825
		mu 0 3 2246 1566 1584
		f 3 -4825 -3891 -3930
		mu 0 3 1584 1566 1997
		f 3 -3322 4826 -4278
		mu 0 3 1729 1702 1835
		f 3 -4827 -3256 -3480
		mu 0 3 1835 1702 1690
		f 3 -2748 4827 -3897
		mu 0 3 1375 1248 1251
		f 3 -4828 4828 -2550
		mu 0 3 1251 1248 1162
		f 3 -2448 4829 -3713
		mu 0 3 1189 1188 1244
		f 3 -4830 -3315 -2540
		mu 0 3 1244 1188 1245
		f 3 -2768 4830 -2752
		mu 0 3 1378 1390 1379
		f 3 -4831 -3538 -4684
		mu 0 3 1379 1390 1853
		f 3 -4292 4831 -4490
		mu 0 3 2164 2015 2170
		f 3 -4832 -4537 -4501
		mu 0 3 2170 2015 2094
		f 3 -4492 4832 -3054
		mu 0 3 1385 2166 1590
		f 3 -4833 -4295 -4532
		mu 0 3 1590 2166 2165
		f 3 -4497 4833 -4299
		mu 0 3 2167 1905 1927
		f 3 -4834 -3920 -3778
		mu 0 3 1927 1905 1928
		f 3 -4304 4834 -4500
		mu 0 3 2168 2169 1726
		f 3 -4835 -4529 -3307
		mu 0 3 1726 2169 1727
		f 3 -4308 4835 4836
		mu 0 3 1383 1396 2345
		f 3 -4836 -2776 4837
		mu 0 3 2345 1396 1395
		f 3 -3668 4838 -3534
		mu 0 3 1851 1540 1852
		f 3 -4839 -4504 -3556
		mu 0 3 1852 1540 1256
		f 3 -3875 4839 -2781
		mu 0 3 1399 1341 1400
		f 3 -4840 -3079 4840
		mu 0 3 1400 1341 1599
		f 3 -2787 4841 -3571
		mu 0 3 1401 1404 1601
		f 3 -4842 -4691 -3080
		mu 0 3 1601 1404 1602
		f 3 -4317 4842 -3368
		mu 0 3 1755 2173 1607
		f 3 -4843 -4510 -3092
		mu 0 3 1607 2173 1410
		f 3 -3941 4843 -4512
		mu 0 3 1914 2005 1413
		f 3 -4844 -4337 -3093
		mu 0 3 1413 2005 1608
		f 3 -4514 4844 -3099
		mu 0 3 1420 1915 1611
		f 3 -4845 -3942 -3364
		mu 0 3 1611 1915 1434
		f 3 -3354 4845 4846
		mu 0 3 2346 1546 1426
		f 3 -4846 -2973 -2813
		mu 0 3 1426 1546 1427
		f 3 -4518 4847 -2821
		mu 0 3 1431 1614 1432
		f 3 -4848 -4657 -3983
		mu 0 3 1432 1614 2299
		f 3 -4660 4848 -4762
		mu 0 3 1609 2301 2174
		f 3 -4849 -4682 -4523
		mu 0 3 2174 2301 2251
		f 3 -2834 4849 -4678
		mu 0 3 1438 1441 2252
		f 3 -4850 -4759 -4526
		mu 0 3 2252 1441 2171
		f 3 -2839 4850 -4303
		mu 0 3 1442 1445 2169
		f 3 -4851 -4164 -4527
		mu 0 3 2169 1445 2253
		f 3 -4296 4851 -4534
		mu 0 3 2165 1628 2255
		f 3 -4852 -3128 -4160
		mu 0 3 2255 1628 1627
		f 3 4852 4853 -3784
		mu 0 3 1930 1451 1931
		f 3 -4854 -2847 -3146
		mu 0 3 1931 1451 1450
		f 3 -4157 4854 -2853
		mu 0 3 1456 2257 1457
		f 3 -4855 -4540 -4006
		mu 0 3 1457 2257 2256
		f 3 -4153 4855 -4542
		mu 0 3 2258 2309 2259
		f 3 -4856 -4675 -3998
		mu 0 3 2259 2309 2308
		f 3 -4780 4856 -4341
		mu 0 3 2347 2348 2021
		f 3 -4857 -3636 -3972
		mu 0 3 2021 2348 2022
		f 3 -4546 4857 -4662
		mu 0 3 2262 2263 2312
		f 3 -4858 -3434 -4680
		mu 0 3 2312 2263 2313
		f 3 -4370 4858 -4522
		mu 0 3 2197 2196 2264
		f 3 -4859 -4352 -4547
		mu 0 3 2264 2196 2265
		f 3 -3539 4859 -4686
		mu 0 3 1853 1586 2314
		f 3 -4860 -4555 -3639
		mu 0 3 2314 1586 2267
		f 3 -3542 4860 -4558
		mu 0 3 1854 1479 2269
		f 3 -4861 -2882 -3440
		mu 0 3 2269 1479 1478
		f 3 -4562 4861 -3561
		mu 0 3 1603 2271 1483
		f 3 -4862 -4584 -2885
		mu 0 3 1483 2271 1484
		f 3 -3565 4862 -3172
		mu 0 3 1653 1604 1652
		f 3 -4863 -4563 -4581
		mu 0 3 1652 1604 2272
		f 3 -3444 4863 -3635
		mu 0 3 1879 2274 1880
		f 3 -4864 -4567 -3974
		mu 0 3 1880 2274 2273
		f 3 -3647 4864 -4379
		mu 0 3 1881 1882 2277
		f 3 -4865 -3432 -4574
		mu 0 3 2277 1882 2278
		f 3 -4185 4865 -4578
		mu 0 3 2279 1511 2280
		f 3 -4866 -2928 -3180
		mu 0 3 2280 1511 1510
		f 3 -2935 4866 -4565
		mu 0 3 1514 1517 2281
		f 3 -4867 -4011 -4579
		mu 0 3 2281 1517 2282
		f 3 -2939 4867 -4561
		mu 0 3 1518 1521 2283
		f 3 -4868 -2919 -4582
		mu 0 3 2283 1521 2284
		f 3 -4032 4868 -4847
		mu 0 3 1426 2051 2346
		f 3 -4869 -4039 -4586
		mu 0 3 2346 2051 2349
		f 3 -2604 4869 -4588
		mu 0 3 2286 2350 2287
		f 3 -4870 -3851 4870
		mu 0 3 2287 2350 2351
		f 3 -2953 4871 4872
		mu 0 3 1534 1533 2288
		f 3 -4872 -2600 -4590
		mu 0 3 2288 1533 2289
		f 3 -3223 4873 4874
		mu 0 3 1687 1686 2291
		f 3 -4874 4875 -4595
		mu 0 3 2291 1686 2290
		f 3 4876 4877 -4720
		mu 0 3 2352 2353 2355
		f 3 -4878 -3225 4878
		mu 0 3 2355 2353 2354
		f 3 -4879 4879 -4234
		mu 0 3 2355 2354 2357
		f 3 -4880 -4875 4880
		mu 0 3 2357 2354 2356
		f 3 -4043 4881 4882
		mu 0 3 2358 2357 2359
		f 3 -4882 -4881 -4594
		mu 0 3 2359 2357 2356
		f 3 -4883 -2959 -4799
		mu 0 3 2358 2359 2360
		f 3 4883 -4230 -4042
		mu 0 3 2361 2362 2363
		f 3 -4792 4884 4885
		mu 0 3 2364 2365 2367
		f 3 -4885 4886 -4223
		mu 0 3 2367 2365 2366
		f 3 -3857 4887 -4884
		mu 0 3 2361 2364 2362
		f 3 -4888 -4886 -4797
		mu 0 3 2362 2364 2367
		f 3 -3469 4888 4889
		mu 0 3 2368 2369 2371
		f 3 -4889 4890 4891
		mu 0 3 2371 2369 2370
		f 3 -4718 4892 -4891
		mu 0 3 2369 2366 2370
		f 3 -4893 4893 4894
		mu 0 3 2370 2366 2372
		f 3 -4887 -4712 -4894
		mu 0 3 2366 2365 2372
		f 3 -4429 4895 -4877
		mu 0 3 2352 2373 2353
		f 3 -4896 4896 -3473
		mu 0 3 2353 2373 2374
		f 3 -3858 4897 -4897
		mu 0 3 2373 2375 2374
		f 3 -4898 4898 -3664
		mu 0 3 2374 2375 2376
		f 3 -4589 4899 4900
		mu 0 3 2378 2379 2377
		f 3 -4900 4901 -3465
		mu 0 3 2377 2379 2380
		f 3 -4902 -4871 -3852
		mu 0 3 2380 2379 2381
		f 3 -2952 4902 4903
		mu 0 3 2383 2384 2382
		f 3 -4903 4904 -4716
		mu 0 3 2382 2384 2385
		f 3 -3657 4905 -4901
		mu 0 3 2377 2383 2378
		f 3 -4906 -4904 -4421
		mu 0 3 2378 2383 2382
		f 3 -3654 4906 4907
		mu 0 3 2386 2387 2388
		f 3 4908 4909 -3458
		mu 0 3 2389 2390 2387
		f 3 -4910 -4227 -4907
		mu 0 3 2387 2390 2388
		f 3 -3222 4910 -4905
		mu 0 3 2384 2391 2385
		f 3 -4911 4911 -4795
		mu 0 3 2385 2391 2392
		f 3 -3220 4912 -4912
		mu 0 3 2391 2386 2392
		f 3 -4913 -4908 -4038
		mu 0 3 2392 2386 2388
		f 3 -3849 4913 -4909
		mu 0 3 2389 2393 2390
		f 3 -4914 4914 -4427
		mu 0 3 2390 2393 2394
		f 3 -4592 4915 4916
		mu 0 3 2395 2394 2396
		f 3 -4916 -4915 -4034
		mu 0 3 2396 2394 2393
		f 3 -4917 -2955 -4873
		mu 0 3 2395 2396 2397
		f 3 4917 4918 4919
		mu 0 3 2398 2009 2399
		f 3 -4919 -3950 -2442
		mu 0 3 2399 2009 2008
		f 3 -4135 4920 -4521
		mu 0 3 2091 1863 1327
		f 3 -4921 4921 -2673
		mu 0 3 1327 1863 1324
		f 3 -4642 4922 -4189
		mu 0 3 2121 2298 2122
		f 3 -4923 4923 -3838
		mu 0 3 2122 2298 2400
		f 3 -2686 4924 -2486
		mu 0 3 1336 1173 1208
		f 3 -4925 -2432 -2479
		mu 0 3 1208 1173 1176
		f 3 -3072 4925 -2437
		mu 0 3 1179 1597 1177
		f 3 -4926 -2689 -2488
		mu 0 3 1177 1597 1212
		f 3 -4262 4926 -2464
		mu 0 3 1197 1191 1198
		f 3 -4927 -2452 -4726
		mu 0 3 1198 1191 1190
		f 3 -3491 4927 -4811
		mu 0 3 1351 1200 1347
		f 3 -4928 -2465 -3673
		mu 0 3 1347 1200 1199
		f 3 -2412 4928 -2436
		mu 0 3 1158 1161 1179
		f 3 -4929 -3514 -3070
		mu 0 3 1179 1161 1595
		f 3 -4815 4929 -3558
		mu 0 3 1544 2246 1583
		f 3 -4930 -4826 -3042
		mu 0 3 1583 2246 1584
		f 3 -3481 4930 -4279
		mu 0 3 1835 1542 1361
		f 3 -4931 -4723 4931
		mu 0 3 1361 1542 2334
		f 3 4932 4933 -3014
		mu 0 3 1206 2334 1569
		f 3 -2433 4934 -2410
		mu 0 3 1158 1178 1159
		f 3 -4935 -2456 4935
		mu 0 3 1159 1178 1194
		f 3 -2562 4936 -3554
		mu 0 3 1256 1159 1858
		f 3 -4937 -4936 -3866
		mu 0 3 1858 1159 1194
		f 3 4937 4938 -3016
		mu 0 3 1569 1193 1570
		f 3 -4939 -2455 -4471
		mu 0 3 1570 1193 1192
		f 3 -4934 4939 -4938
		mu 0 3 1569 2334 1193
		f 3 -4940 -4724 -3865
		mu 0 3 1193 2334 1858
		f 3 -4932 4940 -2726
		mu 0 3 1361 2334 1205
		f 3 -4941 -4933 -2475
		mu 0 3 1205 2334 1206
		f 3 -2702 4941 -4090
		mu 0 3 1342 1288 1551
		f 3 -4942 -2605 -2980
		mu 0 3 1551 1288 1287
		f 3 -2519 4942 -3904
		mu 0 3 1232 1233 1234
		f 3 -4943 -3032 -2522
		mu 0 3 1234 1233 1235
		f 3 -3040 -2416 -2420
		mu 0 3 1166 1165 1164
		f 3 -4829 -2547 -2415
		mu 0 3 1162 1248 1163
		f 3 -2517 4943 -2494
		mu 0 3 1217 1232 1218
		f 3 -4944 -2983 4944
		mu 0 3 1218 1232 1171
		f 3 -2568 4945 4946
		mu 0 3 1260 1259 2401
		f 3 -4946 -4789 4947
		mu 0 3 2401 1259 2342
		f 3 -4443 4948 -2512
		mu 0 3 1228 1260 1229
		f 3 -4949 -4947 4949
		mu 0 3 1229 1260 2401
		f 3 -4766 4950 4951
		mu 0 3 2337 2297 2120
		f 3 -4951 -4640 -4186
		mu 0 3 2120 2297 2121
		f 3 -4515 4952 4953
		mu 0 3 1615 2250 1421
		f 3 -4953 -4765 4954
		mu 0 3 1421 2250 2337
		f 3 -4955 4955 -2810
		mu 0 3 1421 2337 1422
		f 3 -4956 -4952 4956
		mu 0 3 1422 2337 2120
		f 3 -4756 4957 -4924
		mu 0 3 2298 1786 2400
		f 3 -4958 -3416 -4024
		mu 0 3 2400 1786 1785
		f 3 -4957 4958 4959
		mu 0 3 1422 2120 2402
		f 3 -4959 -4188 -2940
		mu 0 3 2402 2120 2119
		f 3 -3105 4960 4961
		mu 0 3 1612 1615 1424
		f 3 -4961 -4954 -2812
		mu 0 3 1424 1615 1421
		f 3 4962 -4960 4963
		mu 0 3 2403 1422 2402
		f 3 -4922 4964 -2676
		mu 0 3 1324 1863 1323
		f 3 -4965 -3580 -2668
		mu 0 3 1323 1863 1321
		f 3 -2675 -4047 -2671
		mu 0 3 1324 1328 1325
		f 3 -3343 4965 -3579
		mu 0 3 1741 1612 1862
		f 3 -4966 -4962 4966
		mu 0 3 1862 1612 1424
		f 3 -4967 4967 4968
		mu 0 3 1862 1424 1918
		f 3 -4968 -2811 -4330
		mu 0 3 1918 1424 1423
		f 3 -3767 4969 -4969
		mu 0 3 1918 1616 1862
		f 3 -4970 -3106 -3577
		mu 0 3 1862 1616 1321
		f 3 -2531 4970 -2739
		mu 0 3 1240 1223 1369
		f 3 -4971 -2505 -4553
		mu 0 3 1369 1223 1222
		f 3 4971 4972 -3686
		mu 0 3 1227 1225 1696
		f 3 -4973 -2506 -3244
		mu 0 3 1696 1225 1224
		f 3 -3878 4973 4974
		mu 0 3 1992 1225 1226
		f 3 -4974 -4972 -2508
		mu 0 3 1226 1225 1227
		f 3 4975 4976 4977
		mu 0 3 2404 1423 2403
		f 3 -4977 -2808 -4963
		mu 0 3 2403 1423 1422
		f 3 -4975 4978 4979
		mu 0 3 1992 1226 2405
		f 3 -4979 4980 -4978
		mu 0 3 2405 1226 2406
		f 3 -3879 4981 4982
		mu 0 3 1993 1992 2407
		f 3 -4982 -4980 -4964
		mu 0 3 2407 1992 2405
		f 3 -4550 4983 4984
		mu 0 3 2266 1993 2408
		f 3 -4984 -4983 -2942
		mu 0 3 2408 1993 2407
		f 3 4985 4986 -2578
		mu 0 3 2409 2315 2408
		f 3 -4987 -4689 -4985
		mu 0 3 2408 2315 2266
		f 3 -4328 -4976 4987
		mu 0 3 2175 1423 2404
		f 3 -3470 4988 4989
		mu 0 3 1827 1830 1987
		f 3 -4989 4990 -3860
		mu 0 3 1987 1830 1988
		f 3 4991 4992 -3211
		mu 0 3 2411 2342 2410
		f 3 -4993 -4791 -4990
		mu 0 3 2410 2342 2341
		f 3 4993 4994 -3768
		mu 0 3 2412 2401 2411
		f 3 -4995 -4948 -4992
		mu 0 3 2411 2401 2342
		f 3 4995 4996 -4331
		mu 0 3 2413 1229 2412
		f 3 -4997 -4950 -4994
		mu 0 3 2412 1229 2401
		f 3 -4996 4997 -2510
		mu 0 3 1229 2413 1226
		f 3 -4998 -4988 -4981
		mu 0 3 1226 2413 2406
		f 3 4998 4999 5000
		mu 0 3 2414 2004 1306
		f 3 -5000 -4637 -3064
		mu 0 3 1306 2004 1594
		f 3 5001 5002 -3952
		mu 0 3 2009 2414 2010
		f 3 -5003 -5001 -4420
		mu 0 3 2010 2414 1306
		f 3 5003 5004 5005
		mu 0 3 2415 1728 2414
		f 3 -5005 -3924 -4999
		mu 0 3 2414 1728 2004
		f 3 5006 5007 -4918
		mu 0 3 2398 2415 2009
		f 3 -5008 -5006 -5002
		mu 0 3 2009 2415 2414
		f 3 -2644 -4876 -3067
		mu 0 3 1309 1311 1307
		f 3 -2642 5008 -3205
		mu 0 3 1310 1309 1675
		f 3 -5009 -4029 -4663
		mu 0 3 1675 1309 1925
		f 3 -4892 5009 -3661
		mu 0 3 1885 2416 1886
		f 3 -5010 5010 5011
		mu 0 3 1886 2416 2417
		f 3 5012 5013 -5012
		mu 0 3 2418 2419 2141
		f 3 -5014 5014 -4218
		mu 0 3 2141 2419 1220
		f 3 5015 5016 -5015
		mu 0 3 2419 2420 1220
		f 3 -5017 5017 -2499
		mu 0 3 1220 2420 1180
		f 3 5018 5019 -5018
		mu 0 3 2420 2421 1180
		f 3 -5020 5020 -2438
		mu 0 3 1180 2421 1181
		f 3 5021 5022 -5021
		mu 0 3 2421 2422 1181
		f 3 -5023 5023 5024
		mu 0 3 1181 2422 1187
		f 3 -2571 5025 5026
		mu 0 3 2423 2424 1960
		f 3 -5026 5027 -3818
		mu 0 3 1960 2424 1961
		f 3 5028 5029 -3449
		mu 0 3 2425 2198 2424
		f 3 -5030 -4373 -5028
		mu 0 3 2424 2198 1961
		f 3 -2443 5030 5031
		mu 0 3 1185 1184 2425
		f 3 -5031 5032 -5029
		mu 0 3 2425 1184 2198
		f 3 -5024 5033 -2445
		mu 0 3 1187 2422 1184
		f 3 -5034 5034 5035
		mu 0 3 1184 2422 2426
		f 3 -4838 5036 5037
		mu 0 3 2345 1395 2415
		f 3 -5037 -3312 -5004
		mu 0 3 2415 1395 1728
		f 3 5038 5039 -5007
		mu 0 3 2398 2030 2415
		f 3 -5040 5040 -5038
		mu 0 3 2415 2030 2345
		f 3 -2758 5041 -3996
		mu 0 3 1380 1383 2030
		f 3 -5042 -4837 -5041
		mu 0 3 2030 1383 2345
		f 3 -4376 5042 -3646
		mu 0 3 2200 1381 2032
		f 3 -5043 -2756 -3997
		mu 0 3 2032 1381 1380
		f 3 5043 5044 -5039
		mu 0 3 2398 2427 2030
		f 3 -5045 -2446 5045
		mu 0 3 2030 2427 2428
		f 3 -5046 -5032 -3994
		mu 0 3 2030 2428 2031
		f 3 -4371 5046 5047
		mu 0 3 2001 2198 2426
		f 3 -5047 -5033 -5036
		mu 0 3 2426 2198 1184
		f 3 5048 5049 -4480
		mu 0 3 2249 2076 1998
		f 3 -5050 -4080 -4753
		mu 0 3 1998 2076 2075
		f 3 -4468 5050 -3259
		mu 0 3 1364 1848 1572
		f 3 -5051 -3518 -3018
		mu 0 3 1572 1848 1573
		f 3 -4074 5051 5052
		mu 0 3 1910 1706 2076
		f 3 -5052 -3261 -4078
		mu 0 3 2076 1706 1705
		f 3 -3742 5053 -4654
		mu 0 3 1911 1910 2249
		f 3 -5054 -5053 -5049
		mu 0 3 2249 1910 2076
		f 3 5054 -5044 -4920
		mu 0 3 2399 2427 2398
		f 3 -5055 5055 -2447
		mu 0 3 1186 1182 1187
		f 3 -5056 -2441 -5025
		mu 0 3 1187 1182 1181
		f 3 -4418 5056 -3953
		mu 0 3 2010 2236 2007
		f 3 -5057 -3665 -4220
		mu 0 3 2007 2236 2429
		f 3 -4890 5057 -4991
		mu 0 3 2368 2371 2375
		f 3 -5058 -3658 -4899
		mu 0 3 2375 2371 2376
		f 3 5058 5059 -4713
		mu 0 3 1315 1238 1169
		f 3 -5060 5060 -2423
		mu 0 3 1169 1238 1170
		f 3 -5061 5061 5062
		mu 0 3 1170 1238 1711
		f 3 -5062 -2527 -4254
		mu 0 3 1711 1238 1237
		f 3 -5063 5063 -2426
		mu 0 3 1170 1711 1171
		f 3 -5064 -3277 -4945
		mu 0 3 1171 1711 1218
		f 3 -2526 5064 -2533
		mu 0 3 1236 1239 1223
		f 3 -5065 5065 -2503
		mu 0 3 1223 1239 1224
		f 3 -2655 5066 -5059
		mu 0 3 1315 1314 1238
		f 3 -5067 5067 -2528
		mu 0 3 1238 1314 1239
		f 3 -5066 -5068 -3245
		mu 0 3 1224 1239 1314
		f 3 -3884 5068 5069
		mu 0 3 1996 1995 2420
		f 3 -5069 5070 -5019
		mu 0 3 2420 1995 2421
		f 3 -3949 5071 5072
		mu 0 3 1816 1996 2419
		f 3 -5072 -5070 -5016
		mu 0 3 2419 1996 2420
		f 3 -3453 5073 5074
		mu 0 3 1817 1816 2418
		f 3 -5074 -5073 -5013
		mu 0 3 2418 1816 2419
		f 3 -5075 5075 -4711
		mu 0 3 2330 2417 2331
		f 3 -5076 -5011 -4895
		mu 0 3 2331 2417 2416
		f 3 -3907 5076 -4115
		mu 0 3 1254 2001 2083
		f 3 -5077 -5048 5077
		mu 0 3 2083 2001 2426
		f 3 -4137 5078 5079
		mu 0 3 1717 2083 2422
		f 3 -5079 -5078 -5035
		mu 0 3 2422 2083 2426
		f 3 -3291 5080 5081
		mu 0 3 1718 1717 2421
		f 3 -5081 -5080 -5022
		mu 0 3 2421 1717 2422
		f 3 -4817 -5082 -5071
		mu 0 3 1995 1718 2421
		f 3 5082 5083 -2637
		mu 0 3 1304 2294 1305
		f 3 -5084 -4610 5084
		mu 0 3 1305 2294 2069
		f 3 -5085 5085 -2693
		mu 0 3 1305 2069 1339
		f 3 -5086 -4062 5086
		mu 0 3 1339 2069 2068
		f 3 -5087 5087 -4808
		mu 0 3 1339 2068 1838
		f 3 -5088 -4452 5088
		mu 0 3 1838 2068 2157
		f 3 -2948 5089 -2632
		mu 0 3 1300 2430 1301
		f 3 -5090 5090 5091
		mu 0 3 1301 2430 2431
		f 3 -5089 5092 -3490
		mu 0 3 1838 2157 1200
		f 3 -5093 -4263 -2466
		mu 0 3 1200 2157 1197
		f 3 -2782 5093 5094
		mu 0 3 1313 1400 2293
		f 3 -5094 5095 -4609
		mu 0 3 2293 1400 2066
		f 3 5096 5097 -4841
		mu 0 3 1599 2067 1400
		f 3 -5098 -4061 -5096
		mu 0 3 1400 2067 2066
		f 3 5098 5099 -3078
		mu 0 3 1598 2158 1599
		f 3 -5100 -4451 -5097
		mu 0 3 1599 2158 2067
		f 3 -2611 5100 -3655
		mu 0 3 1289 1292 2430
		f 3 -5101 5101 -5091
		mu 0 3 2430 1292 2431
		f 3 -4259 5102 -2450
		mu 0 3 1191 2158 1188
		f 3 -5103 -5099 -3317
		mu 0 3 1188 2158 1598
		f 3 -2613 -2606 -2647
		mu 0 3 1291 1285 1288
		f 3 -2624 -3846 -2587
		mu 0 3 1273 1297 1274
		f 3 5103 5104 -5102
		mu 0 3 1292 2293 2431
		f 3 -5105 -4611 5105
		mu 0 3 2431 2293 2294
		f 3 -5092 5106 5107
		mu 0 3 1301 2431 1304
		f 3 -5107 -5106 -5083
		mu 0 3 1304 2431 2294
		f 3 -2633 5108 5109
		mu 0 3 1279 1301 1303
		f 3 -5109 -5108 -2634
		mu 0 3 1303 1301 1304
		f 3 -2594 5110 -3507
		mu 0 3 1276 1279 1837
		f 3 -5111 -5110 -3485
		mu 0 3 1837 1279 1303
		f 3 -2649 5111 -2610
		mu 0 3 1291 1313 1292
		f 3 -5112 -5095 -5104
		mu 0 3 1292 1313 2293;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vcs" 2;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "6FB65AB5-4E9A-1FB8-68CA-AA905AB72E54";
	setAttr -s 4 ".lnk";
	setAttr -s 4 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "5EC53C80-4E48-1C31-2946-259B534471CC";
	setAttr ".bsdt[0].bscd" -type "Int32Array" 1 0 ;
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "BAE9D810-44E6-8306-492D-37B206383356";
createNode displayLayerManager -n "layerManager";
	rename -uid "FF729606-495C-E548-C199-C183E89C9449";
	setAttr ".cdl" 1;
	setAttr -s 3 ".dli[1:2]"  1 2;
	setAttr -s 3 ".dli";
createNode displayLayer -n "defaultLayer";
	rename -uid "245F2673-49C4-4652-2719-CB8C75D8ED1B";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "99232108-46B9-3FFB-3E6D-2DAE8CAD4AE7";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "2B13C4D0-4BEB-26E8-1888-5096686232D0";
	setAttr ".g" yes;
createNode objectSet -n "ALL_CONTROLS";
	rename -uid "9F892765-4133-A603-6C7E-2E94CCF0F39D";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
createNode displayLayer -n "geom_lyr";
	rename -uid "FA104C1E-44BA-166F-1151-8DB9718F176B";
	setAttr ".dt" 2;
	setAttr ".do" 1;
createNode displayLayer -n "skel_lyr";
	rename -uid "6E528CDE-4CD8-8A22-4256-33A8085BD881";
	setAttr ".dt" 2;
	setAttr ".v" no;
	setAttr ".do" 2;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "19CC954C-4A40-627B-94B6-708BD2B4056C";
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
	rename -uid "9AE77FC4-43A2-BA64-D3D7-EB8BE3FDEBC5";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "B0C87DF1-44D3-181B-939F-DAB3ACAE0AB4";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1233.9007446199835 -283.33332207467873 ;
	setAttr ".tgi[0].vh" -type "double2" 1139.8531293094809 547.61902585862276 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -743.062744140625;
	setAttr ".tgi[0].ni[0].y" 411.22457885742188;
	setAttr ".tgi[0].ni[0].nvs" 18306;
	setAttr ".tgi[0].ni[1].x" -188.57127380371094;
	setAttr ".tgi[0].ni[1].y" 197.30165100097656;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" -402.041015625;
	setAttr ".tgi[0].ni[2].y" -104.2408447265625;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 461.42855834960938;
	setAttr ".tgi[0].ni[3].y" 164.28572082519531;
	setAttr ".tgi[0].ni[3].nvs" 18304;
createNode shadingEngine -n "skel:controller_plySG";
	rename -uid "C41E092D-4F5F-047C-4096-0181FE7A708A";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "skel:materialInfo1";
	rename -uid "710A380E-412A-6C7D-D974-14B8D79B5E33";
createNode file -n "skel:bcfile";
	rename -uid "28A52DFA-4AB6-747F-A68A-2584264A0E4B";
	setAttr ".ftn" -type "string" "C:/dev/depot/depot/Content/controllers//controller_bc.tga";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "skel:place2dTexture1";
	rename -uid "ED21DFA6-4C8D-B654-8992-138406237D65";
createNode dagPose -n "skel:bindPose1";
	rename -uid "E59C0307-454E-7873-0939-B6AE0168D5A5";
	setAttr -s 7 ".wm";
	setAttr -s 7 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 2.2204460492503131e-16 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.70710678118654746 0 0 0.70710678118654757 1
		 1 1 no;
	setAttr ".xm[1]" -type "matrix" "xform" 0.99999999999999989 1 0.99999999999999989 2.0164668096141381e-16
		 0 -2.1184053997263526e-16 0 0.95001733303070068 2.3247811794281006 -0.61289870738983154 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.54562097544370147 -0.54562097544370136 -0.44977522292347727 0.44977522292347755 1
		 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 0.99999999999999989 1 0.99999999999999989 2.0164668096141381e-16
		 0 -2.1184053997263526e-16 0 -0.25457519292831421 -0.89058268070220947 0.086994372308254242 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.54562097544370147 -0.54562097544370136 -0.44977522292347727 0.44977522292347755 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 0.99999999999999978 0.99999999999999989 0.99999999999999989 -2.1796502013230778e-16
		 0 4.2368107994527072e-17 0 0.14917255938053131 0.51105207204818726 -0.12166070193052292 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.54562097544370147 -0.54562097544370125 -0.44977522292347727 0.44977522292347755 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 0.99999999999999967 0.99999999999999989 1.1102230246251565e-16
		 -2.4651903288156619e-32 0 0 0.94999998807907104 -2.3752195835113525 -0.86003178358078003 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 5.8688597017880821e-18 -0.095845752520223967 -0.99539619836717885 6.0950438410690468e-17 1
		 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 0.99999999999999967 0.99999999999999978 0.99999999999999956 -1.1678085595442401e-16
		 -2.7755575615628914e-17 4.4510819048560954e-16 0 0.31085509061813354 -0.097918853163719177
		 -1.7983016967773438 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.45214624285333616 0.45215710914083901 -0.54364881609363924 0.54365769422219723 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 0.99999999999999989 0.99999999999999978 1.0000000000000002 2.0717197518745185e-16
		 -1.6185766104483758e-16 0 0 1.8000000715255737 -1.0134227275848389 -0.41637453436851501 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.064701415046437449 -0.70414041702702201 0.064701415046437505 0.70414041702702224 1
		 1 1 yes;
	setAttr -s 7 ".m";
	setAttr -s 7 ".p";
	setAttr ".bp" yes;
createNode shapeEditorManager -n "skel:shapeEditorManager";
	rename -uid "82BB63EE-4BB9-8011-F66C-32A275480C0C";
createNode poseInterpolatorManager -n "skel:poseInterpolatorManager";
	rename -uid "0AE23E93-4007-2398-F3A6-C78C41282466";
createNode renderLayerManager -n "skel:renderLayerManager";
	rename -uid "AD147901-4B80-F95C-5E96-EB9278E8344E";
createNode renderLayer -n "skel:defaultRenderLayer";
	rename -uid "06F030FC-460B-60A3-C737-77897BB70FBC";
	setAttr ".g" yes;
createNode skinCluster -n "skel:skinCluster2";
	rename -uid "649BFD3B-4177-E19E-7671-A59DC881404A";
	setAttr -s 1783 ".wl";
	setAttr ".wl[0:499].w"
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
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
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
	setAttr ".wl[500:999].w"
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
		1 3 1
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
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
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
	setAttr ".wl[1000:1499].w"
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
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
	setAttr ".wl[1500:1782].w"
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
		1 0 1
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
	setAttr -s 7 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 2.2204460492503131e-16 1 0 0 -1 2.2204460492503131e-16 0
		 0 0 0 1;
	setAttr ".pm[1]" -type "matrix" 4.1474598626735225e-16 1 -1.9371872605520798e-16 0
		 0.98162718344766431 -3.6931563819298872e-16 -0.19080899537654467 0 -0.19080899537654467 -1.5441285814051737e-16 -0.98162718344766431 0
		 0.15804887055681913 -0.95001733303070135 -2.3990149879187816 1;
	setAttr ".pm[2]" -type "matrix" 4.1474598626735225e-16 1 -1.9371872605520798e-16 0
		 0.98162718344766431 -3.6931563819298872e-16 -0.19080899537654467 0 -0.19080899537654467 -1.5441285814051737e-16 -0.98162718344766431 0
		 0.084535145939789863 0.25457519292831443 0.8908194772685315 1;
	setAttr ".pm[3]" -type "matrix" 4.6923724130042933e-16 1.0000000000000002 -2.0431075305383972e-16 0
		 0.98162718344766453 -5.6609660432803328e-16 -0.19080899537654455 0 -0.19080899537654447 -3.06224007983657e-18 -0.98162718344766431 0
		 0.021912119719708831 -0.14917255938053142 -0.52487656239192315 1;
	setAttr ".pm[4]" -type "matrix" -1 1.202146588165214e-16 -2.3367362543640773e-17 0
		 -2.7733391199176218e-32 0.19080899537654464 0.98162718344766431 0 1.2246467991473532e-16 0.98162718344766475 -0.19080899537654461 0
		 0.94999998807907093 -2.1674783092150376 1.2974438399203685 1;
	setAttr ".pm[5]" -type "matrix" -1.7317323200467105e-07 0.99999999980310317 1.9843506559442064e-05 0
		 -0.98325492202017273 -3.7864637301135592e-06 0.18223544745402293 0 0.18223544749327797 -1.9479667193154533e-05 0.98325492182722829 0
		 -1.7860332268260894 -0.31085999233440631 0.231428951601614 1;
	setAttr ".pm[6]" -type "matrix" 9.9047119930015826e-17 -7.4813819503263845e-17 -0.99999999999999956 0
		 0.98325490756395451 -0.18223552549214755 1.2939543137592286e-16 0 -0.18223552549214755 -0.98325490756395484 8.8931016114713534e-17 0
		 0.59408392760960738 0.92057463826244712 1.8000000715255726 1;
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
createNode tweak -n "skel:tweak2";
	rename -uid "C63E0E27-4AE3-98E5-CDD8-889E089E1095";
	setAttr -s 1783 ".vl[0].vt";
	setAttr ".vl[0].vt[0:165]" -type "float3"  0.013279913 0.17135032 0.037652671 
		0.0042924648 0.1716466 0.035919368 0.022328399 0.17164108 0.035914835 0.026537638 
		0.17519085 0.035026468 0.022046234 0.17492399 0.036929067 0.013270414 0.17479923 
		0.038477108 0.0045566736 0.17491898 0.036926452 6.4811211e-05 0.17519088 0.035035811 
		0.025961852 0.16503067 0.032920953 0.021796785 0.16432831 0.034935337 0.013289745 
		0.16370672 0.036599111 0.0048256996 0.16433218 0.034941442 0.00065109174 0.16503406 
		0.03291573 0.0090014227 0.16388178 0.036133628 0.0087392675 0.1714367 0.037160426 
		0.0089016818 0.17482732 0.038052429 0.017603131 0.16388182 0.036132578 0.017865516 
		0.17143555 0.037165321 0.017719543 0.17482136 0.03805276 0.026853023 0.17211601 0.033813551 
		-0.00025066317 0.17211068 0.03381072 -6.2367879e-05 0.16869818 0.033091746 0.0043739323 
		0.16813621 0.035247717 0.0088073686 0.16782731 0.036522537 0.01326883 0.16770706 
		0.037027299 0.017825667 0.1678223 0.036517866 0.02219799 0.16814013 0.035263512 0.026679583 
		0.16869563 0.033090118 0.0018207249 0.16117828 0.033178218 0.0055106077 0.16013755 
		0.034919973 0.0093049379 0.15948913 0.035976253 0.013286063 0.15926178 0.036361862 
		0.017311739 0.15948826 0.035972487 0.021091798 0.16013631 0.034920145 0.024798308 
		0.16117087 0.033179719 0.021505473 0.17812096 0.038170796 0.017404925 0.17818433 
		0.039162237 0.013283424 0.17820938 0.039502814 0.0091978582 0.17818426 0.039156951 
		0.00510639 0.17812793 0.038175166 0.00090681994 0.17818034 0.036565378 0.025692733 
		0.17818102 0.036555648 0.024425574 0.18105292 0.038113121 0.020786485 0.18135269 
		0.039578028 0.016969208 0.18163988 0.040490333 0.013285181 0.18173812 0.040776271 
		0.009636594 0.18164477 0.040488791 0.0058184778 0.1813547 0.039577592 0.0021852648 
		0.18106727 0.038122881 0.0095492387 0.15452074 0.03574181 0.0063766362 0.15544277 
		0.034875307 0.029536635 0.17862946 0.033858724 0.030656112 0.17597385 0.031991895 
		0.029912867 0.16594845 0.029893082 0.028346272 0.16263321 0.030605998 0.020224053 
		0.15544289 0.034876373 0.017050695 0.15452072 0.035741806 0.023091886 0.15699424 
		0.033498898 0.013301366 0.15422529 0.036059145 -0.0045156833 0.1730959 0.030622322 
		-0.0040625338 0.17597932 0.031988598 -0.0042893919 0.16962731 0.029855434 0.031115515 
		0.17309593 0.030621815 0.030890731 0.16962682 0.029856725 -0.0032992172 0.16595492 
		0.029905247 0.0035243456 0.15701012 0.033511367 -0.0017412775 0.16263443 0.030599389 
		0.00054527097 0.15958893 0.031893048 0.026071342 0.15957096 0.031883202 -0.0011509351 
		0.18093212 0.035941292 0.0013083742 0.18281689 0.03806686 0.0036307483 0.1839532 
		0.039569639 0.013300268 0.18568712 0.042073622 0.016411509 0.18553291 0.041820709 
		0.010185639 0.18553938 0.041820236 0.020026004 0.1848757 0.040903471 0.0065741763 
		0.18487641 0.040902674 -0.0029430548 0.17863578 0.0338558 0.027788971 0.18091799 
		0.035907976 0.022962417 0.18392994 0.039574891 0.025311962 0.1828308 0.038058333 
		0.0031347377 0.18489978 0.039032035 0.00042108525 0.18350914 0.037118252 0.0062530013 
		0.1859149 0.040517449 0.0096918745 0.1865371 0.041457586 0.013299994 0.18672243 0.041802563 
		-0.0017813768 0.18169548 0.035007063 0.0061138021 0.15469407 0.034012169 0.0097909831 
		0.15355524 0.035002887 0.0029496814 0.1566214 0.032427434 0.013299994 0.15328258 
		0.035313599 0.00012094144 0.1591928 0.030828673 -0.0021333115 0.16236289 0.029420059 
		0.02034726 0.18591507 0.040517423 0.016908145 0.18653712 0.041457586 0.023465486 
		0.18489897 0.039033491 0.026179282 0.1835079 0.037119754 0.028384645 0.18170518 0.034989867 
		0.030031569 0.17937689 0.03296072 0.031113833 0.17661349 0.030983653 0.030294415 
		0.16584782 0.028694538 0.03124669 0.16957411 0.028608326 0.028733687 0.16236289 0.029420983 
		0.02647984 0.15919197 0.030828392 0.031540867 0.17346027 0.029449712 0.02048669 0.15469421 
		0.034012988 0.023651121 0.15662043 0.032427195 0.016808996 0.15355524 0.035002902 
		-0.0034317987 0.17937665 0.032961108 -0.0045139999 0.17661333 0.030984031 -0.0036942589 
		0.16584781 0.028693918 -0.0046466389 0.16957414 0.028608058 -0.0049408842 0.17346029 
		0.029449724 0.02067977 0.18729593 0.037962954 0.023892846 0.18639497 0.035999533 
		0.026565637 0.18512148 0.033672348 0.028660255 0.18359977 0.030931115 0.030157259 
		0.18159242 0.028205888 0.031261258 0.17849554 0.025017705 0.031589564 0.17531469 
		0.022552771 0.031235201 0.17187332 0.020643659 0.03015811 0.16840634 0.019349884 
		0.028270647 0.16495207 0.018587492 0.025793482 0.16197655 0.018288348 0.022798477 
		0.15949893 0.018386351 0.019350434 0.15753371 0.018531406 0.015732275 0.15640089 
		0.018742247 0.013299994 0.15621018 0.018755738 0.01706912 0.18794051 0.039054576 
		0.013299994 0.18814559 0.039447036 0.0059202099 0.18729593 0.037962947 0.0027071335 
		0.18639496 0.035999537 3.4353889e-05 0.18512148 0.033672348 -0.002060266 0.18359977 
		0.030931108 -0.0035572692 0.18159242 0.028205888 -0.0046612727 0.17849554 0.025017705 
		-0.0049895807 0.17531469 0.022552771 -0.0046352148 0.17187332 0.020643659 -0.003558123 
		0.16840634 0.019349888 -0.0016706613 0.16495208 0.018587496 0.00080651144 0.16197655 
		0.018288352 0.0038015039 0.15949894 0.018386353 0.0072495458 0.15753371 0.01853141 
		0.010867702 0.15640089 0.01874225 0.0095308702 0.18794051 0.03905458 0.020014033 
		0.15506846 0.027415453 0.016356278 0.15394181 0.028038632 0.023226341 0.15701626 
		0.02642807 0.026054751 0.15952776 0.025399752 0.028479049 0.16276315 0.024692833 
		0.030158868 0.166234 0.024522636 0.03116064 0.16984266 0.025001789 0.013299995 0.15369652 
		0.028198587 0.010243708 0.15394181 0.028038632 0.0065859454 0.15506846 0.027415453 
		0.0033736471 0.15701626 0.026428066 0.0005452304 0.15952776 0.025399756 -0.0018790594 
		0.16276313 0.024692837 -0.0035588774 0.166234 0.024522642 -0.0045606513 0.16984266 
		0.025001789 0.029876005 0.17902169 0.033452824 0.030987706 0.17629884 0.031523667 
		0.031436447 0.17327881 0.030071599 0.031179635 0.16960114 0.029267369 0.03020554 
		0.16587394 0.029325778 0.028629635 0.16245942 0.030050021;
	setAttr ".vl[0].vt[166:331]" 0.026346669 0.15932646 0.031393811 0.023410503 
		0.15673247 0.033014365 0.020391317 0.15500554 0.034493312 0.016973503 0.15398166 
		0.03541971 0.013300776 0.15369391 0.035736553 0.0096264491 0.15398164 0.035419703 
		0.0062092938 0.15500541 0.034492351 0.0031991105 0.15674196 0.033021584 0.00026314973 
		0.15933707 0.031399544 -0.0020266187 0.16246012 0.030045845 -0.0035976828 0.16587763 
		0.02933245 -0.004578847 0.16960143 0.02926651 -0.00483655 0.17327879 0.03007189 -0.004391443 
		0.17630188 0.031521957 -0.0032797689 0.17902519 0.033451322 -0.0015359863 0.18134876 
		0.03553535 0.00082972244 0.18321675 0.03767075 0.0033406918 0.18447281 0.039364528 
		0.0063828365 0.18544319 0.040774252 0.0099462541 0.18609336 0.041708641 0.013300151 
		0.18625864 0.042003971 0.016652126 0.18608968 0.041708905 0.020217381 0.18544285 
		0.040774703 0.023255508 0.18445918 0.039368164 0.025782041 0.18322414 0.037666544 
		0.028159115 0.18134494 0.035508826 0.013300771 0.19359353 -0.0052746884 0.027374465 
		0.1938156 -0.0050915936 0.0081204157 0.20167728 0.036740605 0.0013998927 0.2009654 
		0.032599751 0.016689476 0.20173362 0.037103225 0.027122961 0.20149887 0.035102859 
		-0.0023814621 0.19983855 0.026543304 0.023815274 0.19136323 -0.022302402 0.01330077 
		0.19127135 -0.022259036 0.01330077 0.19239017 -0.012677675 0.026099071 0.19256896 
		-0.012595457 0.0027862904 0.19136322 -0.022302568 0.0059548351 0.18984342 -0.041845016 
		0.008232099 0.18993078 -0.043048296 0.011178163 0.18999025 -0.043793894 0.013302453 
		0.19000512 -0.043987297 0.015433262 0.18998851 -0.043779414 0.018398251 0.18993315 
		-0.043083701 0.020718692 0.18984023 -0.041822284 0.02306821 0.18973964 -0.039892916 
		0.025016218 0.18966483 -0.03750417 0.0274345 0.18963207 -0.033951811 0.029785598 
		0.18976432 -0.029411715 0.032730158 0.19031419 -0.022503888 0.036486492 0.19165167 
		-0.012505274 0.039565269 0.19317405 -0.0037476525 0.04267966 0.19483556 0.0053392244 
		0.043792289 0.19555287 0.0092020445 0.044460185 0.19625957 0.012963359 0.044582766 
		0.19685338 0.016080925 0.04436475 0.19745311 0.01920053 0.043812707 0.19805108 0.022291178 
		0.042932473 0.19863755 0.025317961 0.041023593 0.19946472 0.029613866 0.038552672 
		0.20022447 0.033630121 0.036053367 0.20076749 0.036601424 0.033195898 0.2012251 0.039242774 
		0.030108886 0.20158173 0.041467153 0.026858024 0.2018428 0.043273065 0.023490598 
		0.20200872 0.044664528 0.018776707 0.20212191 0.045849435 0.013311777 0.20215899 
		0.046394672 0.0096232593 0.2021468 0.046172492 0.0045622997 0.20205063 0.045090463 
		-0.00024743975 0.20183754 0.043277673 -0.0035070989 0.20158073 0.041468587 -0.0065940619 
		0.20122328 0.039243691 -0.0094582811 0.20076385 0.036595728 -0.012817902 0.19997701 
		0.032323681 -0.015405219 0.19908604 0.02765077 -0.016713887 0.1983864 0.024033742 
		-0.017612185 0.19759047 0.019916227 -0.017982321 0.19677413 0.015670922 -0.017692126 
		0.19604075 0.011806841 -0.01669419 0.1951745 0.0071841641 -0.013326412 0.19335827 
		-0.0027067407 -0.0061739888 0.19033723 -0.022375431 -0.0034798603 0.18980058 -0.028763616 
		-0.001011758 0.18965447 -0.033499405 0.0015690622 0.18965946 -0.037526928 0.0035232066 
		0.18974085 -0.03989578 -0.0094582532 0.2020677 0.036336172 -0.0065940204 0.20252672 
		0.038984224 -0.003507047 0.20288353 0.04120924 -0.00024741722 0.20313722 0.043018922 
		0.0045623113 0.2033494 0.044831894 0.0096232574 0.20344436 0.045914154 0.013311779 
		0.20345528 0.046136584 0.018776711 0.20341948 0.045591097 0.023490597 0.20330684 
		0.044406075 0.026857955 0.20314623 0.043013595 0.03605333 0.2020729 0.036341567 0.030108823 
		0.20288591 0.041207545 0.033195842 0.20252992 0.038983032 -0.015405209 0.20039041 
		0.027391098 -0.012817888 0.20128122 0.032064047 0.038552649 0.20152977 0.033370279 
		0.042932466 0.19994333 0.025058009 0.041023578 0.20077048 0.02935392 -0.017612182 
		0.19889511 0.019656502 -0.017982321 0.19807917 0.015411127 0.043812703 0.19935669 
		0.022031261 0.044364747 0.19875848 0.018940661 0.044582766 0.19815898 0.015821019 
		0.044460189 0.19756569 0.012703357 -0.016694207 0.19648121 0.0069240611 0.0437923 
		0.19686012 0.008941832 0.042679682 0.1961437 0.0050788503 0.032730408 0.19162814 
		-0.022764839 0.0015667825 0.19098526 -0.037787627 0.0035208883 0.19107564 -0.040159136 
		-0.0010126225 0.19097419 -0.033760607 0.011177287 0.19135275 -0.044065002 0.0082275728 
		0.19128816 -0.043316692 0.005947086 0.19119051 -0.042107854 0.015434147 0.19135101 
		-0.044050522 0.01330254 0.19136882 -0.044258803 0.018404711 0.19129093 -0.043351412 
		0.027435681 0.19095266 -0.034212671 0.029786322 0.19108105 -0.029672269 0.025019268 
		0.19099183 -0.037764095 0.023070922 0.19107464 -0.040155858 0.020716084 0.19118561 
		-0.042091992 -0.0034803592 0.19111694 -0.02902459 -0.0061742542 0.1916517 -0.022636447 
		-0.013326439 0.19466652 -0.0029671222 -0.01769213 0.19734666 0.011546882 -0.01671388 
		0.19969058 0.023774106 0.039565302 0.19448286 -0.0040081292 0.036486581 0.19296208 
		-0.012765922 0.014289971 0.20239592 0.013938322 0.020862404 0.20406987 0.022622904 
		0.017666917 0.20367134 0.020555254 0.014515823 0.20167287 0.010187138 0.018663263 
		0.20048164 0.0040070093 0.022084607 0.20015714 0.0023234778 0.029608993 0.20024134 
		0.0027602843 0.032804482 0.20063987 0.0048279352 0.035955574 0.20263834 0.015196051 
		0.036181428 0.20191529 0.011444867 0.031808134 0.20382956 0.021376178 0.02838679 
		0.20415406 0.023059709 0.025886016 0.20007369 0.0018904947 0.035087064 0.20122124 
		0.0078440579 0.034436747 0.20330316 0.018645156 0.024585379 0.20423752 0.023492694 
		0.015384334 0.20308997 0.017539131 0.016034653 0.20100805 0.0067380304 0.015709162 
		0.20181213 0.013883191 0.021429433 0.20326905 0.02144176 0.018648261 0.20292218 0.019642195 
		0.01590573 0.20118283 0.010618377 0.019515423 0.20014605 0.0052395449 0.022493169 
		0.19986363 0.0037742944 0.029041966 0.19993691 0.0041544661 0.03182314 0.20028378 
		0.0059540314 0.034565669 0.20202312 0.014977849 0.034762237 0.20139383 0.011713032 
		0.030955972 0.2030599 0.020356681 0.02797823 0.20334232 0.021821931;
	setAttr ".vl[0].vt[332:497]" 0.0258017 0.199791 0.0033974524 0.03380977 0.20078975 
		0.008579093 0.033243764 0.20260175 0.017979756 0.024669698 0.20341496 0.022198776 
		0.016661631 0.2024162 0.017017132 0.017227631 0.20060422 0.0076164701 0.036245063 
		0.19742478 0.016271112 0.036477018 0.19668221 0.012418629 0.035353102 0.19596942 
		0.0087205814 0.033008877 0.19537236 0.0056230058 0.029727092 0.19496305 0.0034995198 
		0.025903581 0.19479087 0.0026062434 0.021999512 0.19487658 0.0030509168 0.018485773 
		0.19520985 0.0047799116 0.015786178 0.19575047 0.0075846836 0.014226335 0.19643325 
		0.011126935 0.013994384 0.1971758 0.014979417 0.0151183 0.19788861 0.018677466 0.017462522 
		0.19848567 0.021775041 0.020744303 0.19889498 0.023898527 0.024567815 0.19906715 
		0.024791803 0.028471887 0.19898143 0.024347126 0.031985622 0.19864817 0.022618132 
		0.034685217 0.19810756 0.019813361 0.016213147 0.19493791 0.0017177863 0.020920388 
		0.19454293 -0.00056734774 0.026121641 0.19453776 -0.0011013286 0.031156691 0.19489346 
		0.00014583945 0.035429731 0.19553672 0.0029827126 0.038474284 0.19636239 0.0070519419 
		0.03994707 0.19729245 0.011891078 0.039664041 0.19823989 0.016942441 0.037650939 
		0.19909391 0.021613516 0.034140836 0.19973975 0.025361357 0.029526975 0.20010199 
		0.027731705 0.024345892 0.20014422 0.028407106 0.019233793 0.19986816 0.027268602 
		0.011698547 0.198502 0.020304499 0.014835726 0.19930179 0.024448261 0.010201864 0.1975567 
		0.01535402 0.010511629 0.19656305 0.010201814 0.012597455 0.19564939 0.0054642381 
		-0.010016538 0.19303103 -0.012390726 -0.01001645 0.19171977 -0.012129914 0.013152947 
		0.19081916 -0.029339157 0.013292852 0.1908486 -0.037779815 -0.0035152149 0.19718955 
		0.012980871 -9.9591729e-05 0.19346069 -0.006537498 0.013302055 0.19014618 -0.025828036 
		0.019851187 0.19014072 -0.033639174 0.019060049 0.19014116 -0.03581018 0.017574107 
		0.19014214 -0.037579652 0.015572573 0.19014354 -0.038734198 0.0075362781 0.19014975 
		-0.03580568 0.011021475 0.19014694 -0.038732436 0.019062644 0.19014163 -0.029156916 
		0.015577448 0.19014445 -0.026230155 0.017578077 0.19014287 -0.027386272 0.0067477361 
		0.19015068 -0.031323422 0.011026351 0.19014785 -0.026228392 0.0090248156 0.19014926 
		-0.027382934 0.0075388742 0.19015025 -0.029152416 0.019852092 0.19014089 -0.031328522 
		0.006746829 0.1901505 -0.033634067 0.013296868 0.19014521 -0.039134555 0.0090208473 
		0.19014852 -0.037576322 0.0067488444 0.19163689 -0.031323534 0.011027459 0.19163407 
		-0.026228502 0.0090259239 0.19163549 -0.027383042 0.0075399824 0.19163647 -0.029152524 
		0.013303164 0.1916324 -0.025828149 0.015578556 0.19163068 -0.026230268 0.017579185 
		0.1916291 -0.027386382 0.019853201 0.19162712 -0.031328633 0.019063752 0.19162786 
		-0.029157029 0.0075373864 0.19163598 -0.035805788 0.011022584 0.19163316 -0.038732544 
		0.013297976 0.19163144 -0.039134659 0.0090219565 0.19163474 -0.037576433 0.0067479378 
		0.19163673 -0.033634182 0.019061157 0.19162738 -0.035810292 0.017575217 0.19162837 
		-0.037579764 0.015573682 0.19162977 -0.038734309 0.019852296 0.19162695 -0.033639289 
		0.0020865973 0.19834477 -0.0070331851 -0.0034017309 0.19392775 -0.0015279787 -0.0016266236 
		0.19235885 -0.012539154 -0.0047957115 0.19287729 -0.0086692572 -0.0035553493 0.19257373 
		-0.010880132 -0.0051980973 0.19323292 -0.0061732298 -0.0047139637 0.19359775 -0.0036930814 
		0.0035458205 0.19435953 0.00083629944 -0.0014196378 0.19418314 6.0956256e-05 0.00099321036 
		0.19433308 0.0008820548 0.0059302794 0.19425926 -7.0802431e-05 0.0090993689 0.19374083 
		-0.0039407038 0.0090176277 0.19302036 -0.0089168781 0.0077053825 0.19269036 -0.011081993 
		0.0033104429 0.19228503 -0.01349202 0.005723305 0.19243498 -0.012670913 0.0078590149 
		0.19404438 -0.0017298425 0.0095017543 0.19338518 -0.0064367442 0.00075784855 0.1922586 
		-0.013446268 0.0036403637 0.19718374 -0.011386977 0.0061548045 0.19750771 -0.0093712891 
		0.0067689596 0.19797051 -0.0062250202 0.0051954594 0.19835562 -0.0034203501 0.002170563 
		0.1984828 -0.0022696145 -0.00089034834 0.19829258 -0.0033112555 -0.0025550376 0.19787394 
		-0.0060578804 -0.002044582 0.19742277 -0.0092243049 0.00040217454 0.1971502 -0.011328933 
		-0.0035704663 0.20160198 0.01238648 -0.0091776242 0.19709292 0.017693758 -0.0070943353 
		0.19565229 0.0067191054 -0.010370534 0.19610998 0.010506594 -0.0090687117 0.19583762 
		0.0083272168 -0.010842776 0.19643655 0.012994342 -0.010428475 0.19677792 0.015490425 
		-0.0022997011 0.19754222 0.020250523 -0.0072410563 0.19734356 0.019338606 -0.0048523918 
		0.19749959 0.020226555 0.00010908728 0.19746628 0.019407613 0.0033852831 0.19700859 
		0.015620124 0.0034432316 0.19634067 0.010636293 0.0021923685 0.19602567 0.008432948 
		-0.0021328598 0.19561899 0.0059001585 0.0002558188 0.19577503 0.0067881169 0.0020834715 
		0.19728097 0.017799489 0.0038575274 0.19668204 0.013132363 -0.0046855318 0.19557635 
		0.0058761882 -0.0018916978 0.20049694 0.0080646351 0.00056498556 0.2008149 0.010151254 
		0.001090555 0.20124796 0.013317735 -0.00056091137 0.20159347 0.016082454 -0.0036166741 
		0.20168981 0.017151756 -0.006646907 0.20149185 0.016025312 -0.0082337288 0.20109224 
		0.013230187 -0.0076346532 0.20067798 0.010074267 -0.0051299864 0.20044288 0.0080342274 
		-0.0011535472 0.19618732 -0.012616958 -0.0016625543 0.1951333 -0.012940254 0.00072192569 
		0.19503303 -0.013847368 0.00063487666 0.19611211 -0.013297314 -0.0041420897 0.19664428 
		-0.0091883289 -0.004831641 0.19565172 -0.0090703536 -0.0035912734 0.19534817 -0.011281235 
		-0.003211763 0.1964166 -0.010846552 -0.0052340254 0.19600737 -0.0065743378 -0.0045714942 
		0.19702379 -0.0065247361 -0.0042083897 0.19729742 -0.0046645119 -0.0047498895 0.19637218 
		-0.0040941765 -0.0034376602 0.19670218 -0.0019290821 -0.0028080661 0.19764958 -0.0023540582 
		-0.0013214063 0.19784112 -0.0011622682 -0.0014555618 0.19695756 -0.00034014229 0.00095727958 
		0.19710752 0.00048095462 0.0012534186 0.19800115 -0.00028604476 0.0031680134 0.19802096 
		-0.00032036213 0.0035098984 0.19713396 0.00043519796 0.0057125404 0.19791397 -0.0012883595 
		0.0058943485 0.19703369 -0.00047190097 0.0071591851 0.19775282 -0.0025327313 0.007823091 
		0.19681883 -0.0021309457 0.0084828027 0.19742887 -0.004892014 0.0090634413 0.19651526 
		-0.0043417998;
	setAttr ".vl[0].vt[498:663]" 0.0087845931 0.19716214 -0.0067641591 0.0094658276 
		0.19615962 -0.006837849 0.0089817028 0.19579479 -0.0093179746 0.0082679596 0.19677281 
		-0.0094107939 0.0072837146 0.19652531 -0.011034699 0.0076694521 0.1954648 -0.011483097 
		0.0033588444 0.19614032 -0.01334614 0.0032745115 0.19505948 -0.013893123 0.0056873821 
		0.19520941 -0.013072012 0.005168566 0.19625279 -0.012730293 -0.0066439779 0.1994842 
		0.0066943178 -0.0071372334 0.19843055 0.0063462658 -0.0047284211 0.19835463 0.0055033457 
		-0.0048373025 0.19942725 0.0060621109 -0.0097273299 0.19988625 0.010044994 -0.01041343 
		0.19888826 0.010133756 -0.0091116028 0.19861588 0.0079543702 -0.0087509081 0.19968197 
		0.0084103914 -0.010885672 0.19921482 0.012621493 -0.010231281 0.20023473 0.012699751 
		-0.0099205477 0.20049077 0.014571919 -0.010471365 0.19955619 0.015117586 -0.0092205219 
		0.19987118 0.017320912 -0.0085857287 0.20082691 0.016923172 -0.0071332157 0.20101489 
		0.01815689 -0.007283946 0.20012182 0.018965764 -0.0048952885 0.20027786 0.019853711 
		-0.0045841946 0.20118141 0.019104449 -0.0026695549 0.20121339 0.019122429 -0.0023425913 
		0.20032048 0.019877682 -9.9059471e-05 0.20113236 0.01822293 6.6189852e-05 0.20024456 
		0.019034775 0.0013818132 0.20099336 0.017016755 0.0020405808 0.20005924 0.017426642 
		0.0027710157 0.2007027 0.014691081 0.0033423868 0.19978686 0.015247284 0.0031252049 
		0.20045777 0.012825158 0.0038146337 0.1994603 0.012759516 0.0034003379 0.19911893 
		0.010263454 0.00268309 0.20009349 0.010161516 0.0017448929 0.19985723 0.0085089402 
		0.0021494722 0.19880393 0.0080601024 -0.0021132519 0.19947274 0.0060876878 -0.0021757581 
		0.19839726 0.0055273129 0.0002129285 0.19855329 0.0064152759 -0.00032167221 0.19958977 
		0.0067536803 0.016825676 0.19632386 0.0022900919 0.013456754 0.19698906 0.0057826866 
		0.011512677 0.1978405 0.010198145 0.011223891 0.1987665 0.015000095 0.012619994 0.19964899 
		0.019613158 0.015543523 0.20039417 0.02347501 0.019640947 0.20091859 0.026107177 
		0.024405763 0.20116755 0.027178502 0.029241931 0.20111501 0.026563708 0.033557661 
		0.20076221 0.024365064 0.03684739 0.20014621 0.020871425 0.038736925 0.19933951 0.016505845 
		0.03900566 0.19844817 0.011779525 0.037627481 0.1975771 0.0072499705 0.034773421 
		0.19681251 0.0034440185 0.030769767 0.19623043 0.00079945044 0.026062736 0.19592175 
		-0.00035337301 0.021211443 0.19594648 0.00015535862 0.03032756 0.20416638 0.013613698 
		0.028359307 0.20473629 0.016545661 0.024931598 0.20493148 0.017549772 0.021648299 
		0.20466059 0.016156198 0.020045701 0.20405039 0.013017008 0.020873675 0.20338641 
		0.0096010622 0.023744807 0.20297931 0.0075067198 0.027315659 0.20301959 0.0077139484 
		0.029915391 0.20348841 0.01012578 0.03690334 0.19793864 0.01641806 0.032390963 0.19924521 
		0.02313981 0.024532681 0.19969268 0.025441818 0.017005464 0.19907166 0.022246942 
		0.01333138 0.19767274 0.015050104 0.015229576 0.19615048 0.0072187884 0.021811867 
		0.19521718 0.0024173448 0.029998319 0.19530952 0.0028924325 0.035958409 0.19638431 
		0.0084217461 0.033587653 0.2021611 0.01479366 0.030358091 0.20309623 0.019604506 
		0.024733825 0.20341648 0.021252081 0.019346509 0.20297201 0.018965468 0.016716922 
		0.20197079 0.013814594 0.018075483 0.20088129 0.008209615 0.022786509 0.20021331 
		0.0047731623 0.02864565 0.2002794 0.0051131877 0.032911357 0.20104864 0.0090705883 
		0.029915391 0.20581093 0.0096743265 0.027315659 0.20534211 0.0072624944 0.023744807 
		0.20530184 0.0070552658 0.020873675 0.20570894 0.0091496082 0.020045701 0.20637293 
		0.012565554 0.021648299 0.20698312 0.015704745 0.024931598 0.20725401 0.017098319 
		0.028359307 0.20705883 0.016094206 0.03032756 0.20648891 0.013162244 0.033854395 
		0.21090798 0.010052202 0.034588739 0.20897058 0.010342121 0.034395836 0.20959307 
		0.01354492 0.033681206 0.21147861 0.013005051 0.03299734 0.2103537 0.0072179222 0.03365406 
		0.20837292 0.0072677415 0.031196805 0.2098961 0.0048464946 0.031704552 0.20787242 
		0.0046925447 0.02868388 0.20957586 0.0032162298 0.028975353 0.20752919 0.002927192 
		0.025752122 0.20944691 0.0025355443 0.025795646 0.20738491 0.0021845517 0.022759156 
		0.20950903 0.0028723986 0.022548947 0.20745671 0.0025542472 0.020067967 0.20977056 
		0.0042006518 0.01962685 0.20773618 0.0039916351 0.017995393 0.21018448 0.0063473107 
		0.01738181 0.20818935 0.0063234074 0.016804015 0.21071565 0.0090627158 0.016084602 
		0.20876186 0.0092682624 0.016621621 0.21128616 0.012015027 0.015891708 0.20938434 
		0.01247106 0.017487517 0.21183994 0.01484672 0.016826382 0.20998201 0.015545441 0.019280648 
		0.2122986 0.017223548 0.018775893 0.21048251 0.018120635 0.021798646 0.21261738 0.018846247 
		0.021505089 0.21082573 0.019885991 0.02472827 0.21274805 0.019535748 0.024684798 
		0.21097001 0.020628629 0.027720178 0.21268418 0.019189892 0.0279315 0.21089822 0.020258935 
		0.030415488 0.21242422 0.017869737 0.03085359 0.21061875 0.018821543 0.032481361 
		0.21200909 0.01571686 0.033098634 0.21016556 0.016489776 0.033643227 0.20693292 0.010849929 
		0.033469837 0.20749252 0.013728785 0.032303832 0.20800704 0.016375808 0.030285854 
		0.20841445 0.018471731 0.027659304 0.20866559 0.019763757 0.024740973 0.20873018 
		0.020096047 0.021882862 0.20860043 0.019428531 0.019429695 0.20829199 0.017841714 
		0.017677361 0.20784205 0.015526986 0.016837217 0.20730488 0.012763537 0.017010605 
		0.2067453 0.0098846834 0.01817661 0.20623076 0.0072376588 0.020194588 0.20582336 
		0.0051417355 0.022821143 0.20557222 0.003849711 0.02573947 0.20550762 0.0035174212 
		0.02859758 0.20563738 0.0041849371 0.031050751 0.20594582 0.0057717557 0.032803088 
		0.20639576 0.0080864821 0.02562299 0.21078305 0.0044914274 0.023381783 0.21082956 
		0.004743679 0.027818361 0.21087961 0.0050011445 0.030662009 0.21270168 0.014361921 
		0.031560484 0.21230443 0.012331253 0.029115032 0.21301253 0.015974047 0.027096719 
		0.21320719 0.016962608 0.024856303 0.21325502 0.0172216 0.02266253 0.21315718 0.016705278 
		0.020776993 0.21291846 0.015490166 0.019434253 0.21257502 0.01371034 0.018785847 
		0.21216033 0.011589897;
	setAttr ".vl[0].vt[664:829]" 0.018922428 0.2117331 0.0093791345 0.019814556 
		0.21133536 0.0073457747 0.021366555 0.21102542 0.005738304 0.029700102 0.21111941 
		0.0062219282 0.031048387 0.21146208 0.0079977093 0.031690173 0.21187714 0.010120087 
		0.025583858 0.20985273 0.0052849697 0.023570456 0.20989451 0.0055115814 0.027556084 
		0.20993948 0.0057428768 0.030110693 0.21157633 0.014152183 0.030917844 0.21121946 
		0.012327922 0.028720954 0.21185559 0.015600448 0.026907792 0.21203047 0.016488526 
		0.0248951 0.21207345 0.016721193 0.022924313 0.21198553 0.016257353 0.021230429 0.21177109 
		0.015165749 0.020024171 0.21146254 0.013566833 0.019441672 0.21109001 0.011661921 
		0.01956437 0.21070622 0.0096758697 0.020365819 0.2103489 0.0078491895 0.021760065 
		0.21007045 0.0064051081 0.029246558 0.21015491 0.0068395748 0.030457797 0.21046273 
		0.0084348572 0.031034345 0.21083561 0.010341508 0.02464987 0.20999348 0.0060149673 
		0.021522321 0.21029258 0.0075536151 0.020134037 0.21090527 0.010705666 0.021134613 
		0.21154489 0.013996241 0.024055857 0.21191216 0.015885632 0.027530897 0.21183521 
		0.015489785 0.029933726 0.21135005 0.012993921 0.030140022 0.2106837 0.0095658693 
		0.028053265 0.21014796 0.0068096672 -0.002838304 0.16369343 -0.019815084 -0.0018633419 
		0.16187859 -0.016943483 -0.0031374698 0.17115408 -0.035393659 -0.0029981476 0.15248185 
		-0.043091588 -0.0029869189 0.15470874 -0.046120368 0.0010913854 0.14521235 -0.0270788 
		-0.003697416 0.1668641 -0.025954727 -0.0033505855 0.1652441 -0.022773521 -0.0036230085 
		0.16982821 -0.032091521 -0.0037484053 0.16829441 -0.028868631 -0.0025325695 0.1496858 
		-0.037425075 -0.00037918243 0.14627741 -0.030198986 -0.0017111622 0.14807025 -0.034129906 
		-0.011088374 0.15894619 -0.029714121 -0.011832598 0.16072789 -0.032887861 -0.0080764377 
		0.16362141 -0.018302718 -0.0092137391 0.16274938 -0.019048765 -0.0060414183 0.16171263 
		-0.015804382 -0.0071783285 0.16080129 -0.016519118 -0.0094887 0.16527925 -0.0211755 
		-0.010455137 0.16422492 -0.021584298 -0.0094105285 0.14832179 -0.027487174 -0.0083018169 
		0.14691673 -0.027977953 -0.0073471651 0.14713702 -0.024523679 -0.0062468168 0.14579248 
		-0.025046881 -0.011356083 0.16603705 -0.025035243 -0.010349895 0.16709286 -0.02460726 
		-0.011119739 0.17031258 -0.03106969 -0.012105206 0.16907716 -0.031140232 -0.011817256 
		0.16774504 -0.028353667 -0.010789925 0.16875017 -0.027889088 -0.011835398 0.15116072 
		-0.033449735 -0.010951257 0.1500147 -0.034453839 -0.010641415 0.14952043 -0.030193755 
		-0.0097448612 0.14838487 -0.031172883 -0.012019413 0.17036837 -0.034584656 -0.010985216 
		0.17158253 -0.034493744 -0.013279391 0.1544432 -0.039537933 -0.012492307 0.15346023 
		-0.040835414 -0.012754556 0.15582332 -0.043742351 -0.013493633 0.15652107 -0.042115692 
		-0.012402065 0.16380949 -0.037949264 -0.01224978 0.16237599 -0.035662435 -0.012143703 
		0.16687675 -0.042705555 -0.012357004 0.16536833 -0.043600664 -0.0019504733 0.17055233 
		-0.043160208 -0.0018480411 0.16947901 -0.044754717 -0.010942806 0.16962339 -0.042584155 
		-0.010869326 0.17069016 -0.041044135 -0.011155794 0.16763657 -0.044436835 -0.011383871 
		0.16604136 -0.045373898 -0.011742283 0.16394216 -0.046044897 -0.012031062 0.16210316 
		-0.046221465 -0.012617874 0.1638398 -0.044135358 -0.012891082 0.1621059 -0.044361304 
		-0.0021199565 0.16375837 -0.04857463 -0.0023049808 0.16191991 -0.048823416 -0.011917355 
		0.16938373 -0.039986573 -0.011990055 0.16833456 -0.041403353 -0.0018351169 0.16727248 
		-0.046908282 -0.001922689 0.16568246 -0.047900781 -0.0028519912 0.15137513 -0.016933892 
		-0.0037546745 0.15194577 -0.017844867 -0.00068605004 0.1506736 -0.015971154 -0.0015409013 
		0.15558559 -0.014124018 -0.00093270314 0.15374842 -0.014559685 -0.0034290734 0.15556858 
		-0.015288377 -0.0029691302 0.15388572 -0.015724923 -0.00035413512 0.15950756 -0.015190491 
		0.00078303379 0.15776317 -0.014702204 -0.0026018869 0.15774849 -0.013991913 -0.0037753051 
		0.1594269 -0.014370556 -0.0032636544 0.14926516 -0.018643659 -0.0038874222 0.14819899 
		-0.019937599 -0.0012629377 0.14814492 -0.018012565 -0.0020333156 0.14699025 -0.019405669 
		-0.005298296 0.15884972 -0.015411614 -0.0042553367 0.15733704 -0.01511087 0.0028327603 
		0.14548834 -0.022128044 0.0021720242 0.14501169 -0.023889381 -0.0045280862 0.14553681 
		-0.02293512 -0.0033238258 0.14589605 -0.021318508 -0.0048809233 0.14731535 -0.021445587 
		-0.0059709507 0.14698336 -0.022889625 0.0040183547 0.1482008 -0.018563436 0.0037376273 
		0.14694488 -0.019969085 0.0036884793 0.15059866 -0.016694795 0.0022607178 0.15553665 
		-0.014861348 0.0031334348 0.15363146 -0.015306805 -0.0021911331 0.17148739 -0.040909741 
		-0.0025147186 0.17172529 -0.038731083 -0.010910041 0.17185611 -0.036840729 -0.010873745 
		0.17156602 -0.038915977 -0.0027589966 0.15724626 -0.047936242 -0.0025741057 0.15919742 
		-0.048640892 -0.012596254 0.15779313 -0.045180544 -0.012374046 0.15971848 -0.045936804 
		-0.013159259 0.16025575 -0.044210903 -0.013378534 0.15841515 -0.04356201 -0.011913884 
		0.1701369 -0.038352635 -0.011949808 0.17049278 -0.036429733 -0.0074193995 0.15450449 
		-0.021758135 -0.0060460921 0.15344782 -0.020057797 -0.0048401421 0.15263832 -0.018805237 
		-0.012395316 0.16498378 -0.039736252 -0.01229933 0.16596714 -0.041231673 -0.0088428147 
		0.15581152 -0.024016984 -0.010081039 0.1572843 -0.026682846 -0.0028637191 0.15283042 
		-0.016143244 -0.00074384804 0.15215094 -0.015175908 0.0034764856 0.15205498 -0.015911289 
		-0.0030387577 0.15007158 -0.017884785 -0.00090896524 0.14934918 -0.01690235 0.0039189458 
		0.14933965 -0.017539604 -0.012492315 0.16400385 -0.042745601 -0.012655271 0.16256995 
		-0.041784506 -0.012728931 0.16103742 -0.040447243 -0.012634966 0.15934601 -0.038478903 
		-0.012222528 0.15745202 -0.035699748 -0.011296739 0.15528116 -0.031878762 -0.010195952 
		0.1535697 -0.028665345 -0.0089206416 0.15218978 -0.025904898 -0.007387937 0.15105802 
		-0.023457045 -0.0060230028 0.15040304 -0.021650909 -0.004844232 0.15012412 -0.020202829 
		-0.0038128209 0.1501424 -0.018916411 -0.012003583 0.16800541 -0.039739687 -0.012063132 
		0.16758101 -0.037965052 -0.012070866 0.16684367 -0.035956442 -0.011966609 0.165609 
		-0.033310454 -0.011607415 0.1641432 -0.030490475 -0.010979828 0.16248423 -0.027394358 
		-0.010034623 0.16081578 -0.02434787;
	setAttr ".vl[0].vt[830:995]" -0.0087910583 0.15926948 -0.021728849 -0.0072403536 
		0.15770537 -0.019506518 -0.0057431282 0.15624997 -0.018028561 -0.004557868 0.15500085 
		-0.017140545 -0.0036691402 0.15378107 -0.016623981 -0.013531172 0.15830362 -0.044562731 
		-0.013658928 0.15629464 -0.043038379 -0.01342589 0.15406102 -0.040271014 -0.011888526 
		0.15057471 -0.033806164 -0.010627309 0.14884612 -0.030368134 -0.0092978058 0.14754221 
		-0.027441498 -0.007122633 0.14630143 -0.024320416 -0.0056206789 0.14612433 -0.022526631 
		-0.0044541452 0.14647853 -0.020978117 -0.0033625602 0.14744154 -0.019328006 -0.0026156565 
		0.14857911 -0.017948601 -0.0023109536 0.14966215 -0.016932813 -0.0021375066 0.15086612 
		-0.016097341 -0.0021529992 0.15217124 -0.01535424 -0.0022997484 0.15359728 -0.014791457 
		-0.0028740945 0.15539502 -0.014331126 -0.0037801249 0.15731832 -0.014150567 -0.0048993966 
		0.15893824 -0.014479239 -0.0069391727 0.16104585 -0.01569538 -0.0090860324 0.16309489 
		-0.018359007 -0.010420554 0.16467807 -0.021083016 -0.011365012 0.16658968 -0.024720198 
		-0.011848342 0.16838379 -0.028215032 -0.012158222 0.16982274 -0.031212173 -0.012060565 
		0.17118156 -0.034842301 -0.011986328 0.17133471 -0.036862232 -0.011948382 0.17096901 
		-0.03891287 -0.011950882 0.17015655 -0.040708967 -0.012027682 0.16904731 -0.042221475 
		-0.012198469 0.16743188 -0.043675929 -0.012425627 0.16582806 -0.044626243 -0.012715125 
		0.16413192 -0.045210272 -0.013005588 0.16228758 -0.045441333 -0.013299455 0.16025749 
		-0.045262955 0.03371096 0.15882054 -0.01021727 0.027575402 0.11675681 -0.068996921 
		0.028219754 0.13953881 -0.086643636 0.031071538 0.1354921 -0.040331807 0.013291892 
		0.10536599 -0.069639318 0.013300655 0.12592189 -0.032832786 0.030347694 0.16288979 
		-0.065493651 0.029079331 0.124314 -0.081388608 0.040804252 0.17396903 -0.020405866 
		0.036150679 0.14853358 -0.052176166 0.01329677 0.14000593 -0.017738864 0.025688421 
		0.15462276 -0.0083547607 0.032637931 0.14769568 -0.024685131 0.025908381 0.12994863 
		-0.036438946 0.02621498 0.14283156 -0.0205798 0.029012701 0.12362038 -0.056010749 
		0.023424447 0.11059278 -0.0696989 0.013308004 0.11287183 -0.050429527 0.024424061 
		0.11749701 -0.053167224 0.031817686 0.17627032 -0.04931014 0.038536619 0.16159883 
		-0.036294196 0.029048234 0.14917029 -0.079593726 0.03329318 0.13578929 -0.067843065 
		0.039578747 0.1745932 0.0073390566 0.013294575 0.13748257 -0.099201418 0.025525991 
		0.15905116 0.0024322853 0.019639833 0.15372334 -0.0078088869 0.02604389 0.14916469 
		-0.01402407 0.020316232 0.14076668 -0.018541897 0.013306421 0.14750944 -0.011965428 
		0.02003755 0.14780381 -0.012790206 0.033222768 0.15347189 -0.017267512 0.031924065 
		0.14167589 -0.032411762 0.026165135 0.13644987 -0.028198335 0.020482518 0.12710567 
		-0.034040861 0.013295445 0.13302927 -0.024768198 0.020485509 0.13399431 -0.025874201 
		0.025217399 0.12338547 -0.044850245 0.019844932 0.11435419 -0.051437445 0.01330016 
		0.11905959 -0.041465648 0.020235499 0.12037872 -0.042664722 0.030050855 0.12926963 
		-0.048362587 0.028097389 0.11921042 -0.062812857 0.023734495 0.1130424 -0.061183602 
		0.019223884 0.10718581 -0.069770277 0.013301169 0.10810477 -0.059628427 0.019429153 
		0.10974547 -0.060273536 0.013304968 0.1062175 -0.081529789 0.018265709 0.15480499 
		-0.087970302 0.018161913 0.16935784 -0.07249143 0.018167857 0.16213669 -0.080626242 
		0.018745739 0.1376895 -0.097757801 0.018387474 0.14710985 -0.093805857 0.028347518 
		0.14327505 -0.084655352 0.029705392 0.15583779 -0.072993398 0.018314956 0.1823137 
		-0.056563932 0.018213818 0.17638247 -0.064026125 0.030985549 0.16983384 -0.057589021 
		0.018463824 0.18627585 -0.051455598 0.03872611 0.18174519 -0.02516184 0.032915525 
		0.18174562 -0.040567905 0.036720004 0.16934934 -0.043208051 0.039645363 0.16804484 
		-0.028235111 0.037632324 0.17566341 -0.034580544 0.025471199 0.15787475 -0.003310967 
		0.019370746 0.15698235 0.0021320814 0.019437267 0.15625924 -0.0032890406 0.031222684 
		0.16280949 0.0031264133 0.033583973 0.16346428 -0.0031550454 0.013300327 0.15457053 
		0.010268847 0.019085756 0.12615454 -0.09788689 0.028859943 0.13218261 -0.085237801 
		0.041850414 0.17845832 -0.012795623 0.023033131 0.1108399 -0.079625055 0.018685639 
		0.10762006 -0.080479473 0.032247413 0.1427899 -0.07412935 0.031676635 0.13014509 
		-0.074683741 0.030873714 0.13702977 -0.080190584 0.034669746 0.15612648 -0.059240736 
		0.034756359 0.14201114 -0.060187526 0.033465303 0.14931962 -0.067045331 0.037410621 
		0.15507713 -0.044242207 0.035765722 0.16277626 -0.051316373 0.037066005 0.17132717 
		0.013518848 0.025978304 0.15807663 0.0099888565 0.030871186 0.16186979 0.01042117 
		0.019627808 0.15548365 0.010107628 0.013294564 0.15352044 -0.0074646333 0.013299992 
		0.1698575 -0.07309702 0.013300027 0.18275309 -0.057062201 0.013300152 0.15526527 
		-0.08889354 0.013336452 0.11338733 -0.093051724 0.013300173 0.15632266 0.0021106524 
		0.013296871 0.12593047 -0.099510051 0.013299974 0.16263773 -0.081377409 0.013302607 
		0.14741173 -0.094908275 0.01329999 0.17686813 -0.064526759 0.013297693 0.15566412 
		-0.0032131276 -0.0052664983 0.16342267 -0.012012657 -0.0025609722 0.11853015 -0.068852663 
		-0.0046648839 0.13760532 -0.041964807 -0.0026216984 0.1255897 -0.080009989 -0.0093692681 
		0.17628346 -0.019333821 -0.0060243187 0.14811012 -0.05374679 0.0018030353 0.15618174 
		-0.0091537442 0.00068056799 0.12987404 -0.036372803 0.0010407373 0.14293328 -0.021780452 
		-0.0041784043 0.12574296 -0.057270795 0.0024289449 0.11014505 -0.070057586 0.0017843941 
		0.11691244 -0.052655712 -0.0050900886 0.13621299 -0.067774735 0.0028064803 0.13766243 
		-0.095022552 0.0030544307 0.11565955 -0.089940734 -0.010365974 0.17308357 0.0054401727 
		0.0014033942 0.15964672 0.002507414 0.0071140905 0.1540547 -0.0082877902 0.006400248 
		0.14095511 -0.018726483 0.006752078 0.14789133 -0.013438178 -0.0018437112 0.15902677 
		-0.010082637 -0.0044481088 0.14253043 -0.035844754 -0.0024144503 0.13336459 -0.038755681 
		0.00082559802 0.13694076 -0.028228497 -0.0023017784 0.13947897 -0.031776316 0.0060229548 
		0.12696025 -0.03391533 0.0061588725 0.13419183 -0.02565714 0.0010114543 0.12304668 
		-0.044602618 0.0065820385 0.11399448 -0.051208667;
	setAttr ".vl[0].vt[996:1161]" 0.0062177326 0.12010822 -0.042466421 -0.0046273582 
		0.13139835 -0.049819298 -0.00173583 0.12100053 -0.054456186 -0.0023016373 0.12688974 
		-0.046752553 -0.0033627546 0.12122661 -0.063799314 -0.0005672251 0.11431436 -0.069229744 
		0.0022003257 0.11249758 -0.061083369 -0.00089586916 0.1162864 -0.062090248 0.006806429 
		0.10678262 -0.069774918 0.006960826 0.10930152 -0.060119595 -0.013588597 0.1795646 
		0.001630513 0.0082976418 0.1548737 -0.088045605 0.0084209889 0.16933641 -0.072582044 
		0.008402192 0.16216095 -0.080750965 0.0078233974 0.13762257 -0.09808322 0.0081512928 
		0.14718072 -0.093926772 0.0082981205 0.18227684 -0.056534793 0.0083924532 0.17636703 
		-0.064013727 -0.00802173 0.18097132 -0.028377475 0.0017418573 0.15928699 -0.003431357 
		0.0072720624 0.15716279 0.0021577964 0.0073424513 0.15666625 -0.0033752741 -0.0047002104 
		0.16490868 0.003308834 -0.0075110304 0.16921139 -0.0036348596 -0.0029757782 0.16309522 
		-0.0033811554 0.0074560177 0.11400528 -0.092496984 0.0075776032 0.12614356 -0.098525457 
		-0.0019066725 0.13331109 -0.086203918 -0.00047027195 0.12003991 -0.08570569 0.00035821149 
		0.12863612 -0.091578677 -0.012540082 0.18244854 -0.0109275 -0.0074495072 0.16824375 
		-0.015109593 -0.010271858 0.17486113 -0.0067119193 0.0027719571 0.11042663 -0.079040065 
		0.0074472949 0.10706531 -0.080993228 -0.0029088901 0.12017557 -0.072674811 -0.00050711085 
		0.11513545 -0.076219492 -0.0040012239 0.14373855 -0.075379625 -0.0041327667 0.13094595 
		-0.073943131 -0.0031141001 0.13861986 -0.081138834 -0.0048047546 0.15676036 -0.060372919 
		-0.005705283 0.14194046 -0.060930654 -0.0044236355 0.14999077 -0.068632238 -0.0056755687 
		0.14108536 -0.045541819 -0.005036992 0.12890965 -0.060876485 -0.0040966421 0.12402351 
		-0.067332909 -0.0050621396 0.16139863 -0.054051813 -0.0055694166 0.13477279 -0.05339241 
		-0.0094136922 0.17002806 0.012744788 0.00055233657 0.15796088 0.0099571673 -0.0051982738 
		0.1634613 0.010748995 0.0069166645 0.15522073 0.010011381 0.013312714 0.13181509 
		-0.099997908 0.018985892 0.1320363 -0.098382816 0.0076655741 0.13195576 -0.098906606 
		0.0034049512 0.13235208 -0.096506074 0.013149446 0.11936711 -0.097260877 0.01920413 
		0.11995801 -0.095505908 0.0030264582 0.1213541 -0.094260268 -7.6014861e-05 0.12373406 
		-0.089010328 0.018776378 0.1102159 -0.0864897 0.013442262 0.10906374 -0.087793685 
		0.0077250106 0.109797 -0.087641709 0.0031243006 0.1125519 -0.086212717 -0.00063113845 
		0.11729048 -0.081901021 0.027392562 0.27612135 -0.053459328 0.040965892 0.27230164 
		-0.050086942 0.05238374 0.26648003 -0.044995584 0.061100416 0.25945061 -0.03887818 
		0.067432508 0.25154266 -0.032001618 0.071498141 0.24299571 -0.024586173 0.073235832 
		0.23440883 -0.017150853 0.072828576 0.22540045 -0.0093131075 0.070227206 0.2168501 
		-0.0018214269 0.065716453 0.20894556 0.0051478148 0.059118401 0.20112997 0.011918395 
		0.027874386 0.28251421 -0.0487056 0.041803412 0.27857813 -0.04528591 0.05355892 0.27264228 
		-0.040134877 0.062616087 0.26549259 -0.033928394 0.069321975 0.25740346 -0.026917605 
		0.073788732 0.2486109 -0.019313958 0.075931013 0.23967741 -0.011596724 0.075897619 
		0.2303043 -0.0034876799 0.027246766 0.29002571 -0.03321046 0.026930768 0.19621149 
		0.046092685 0.073534347 0.22108462 0.0044951565 0.068820983 0.21230188 0.012114468 
		0.061833166 0.20416653 0.019158429 0.040122308 0.28648272 -0.030212328 0.051241759 
		0.28113168 -0.025688892 0.059964035 0.27471924 -0.020266037 0.066773161 0.26731074 
		-0.013995427 0.071729839 0.25894141 -0.0069246045 0.074515224 0.25025138 0.00040143108 
		0.075188085 0.24100119 0.0082159089 0.073466145 0.23152515 0.01622428 0.06902799 
		0.22214699 0.024161195 0.062062182 0.21370798 0.031301379 0.051323477 0.20556074 
		0.038208552 0.051908061 0.19603875 0.026193306 0.050424252 0.1925955 0.019300241 
		0.041043382 0.18557188 0.025520766 0.0401619 0.20011976 0.042795107 0.041080162 0.18959744 
		0.031735059 0.034599476 0.18654251 0.034398597 0.0133 0.19078402 -0.04478585 0.040532757 
		0.19404879 -0.0031713911 0.038346585 0.19298401 -0.0093313484 0.036124524 0.19174314 
		-0.015940819 0.023513388 0.19046262 -0.040485881 0.032518797 0.19077484 -0.024997434 
		0.018647138 0.19069134 -0.043747716 0.02800443 0.19034678 -0.034399752 0.029968379 
		0.19042912 -0.030668091 0.025571313 0.19040668 -0.037996285 0.021042438 0.19057915 
		-0.042513154 -0.017778298 0.18956655 -0.0032550478 0.0016753195 0.18809259 -0.044255793 
		-0.0082054539 0.18744881 -0.028285019 -0.0020334285 0.18764354 -0.03991206 0.0050984179 
		0.18855955 -0.04674023 -0.013932758 0.19404879 -0.0031713911 -0.010199582 0.19223054 
		-0.013690328 -0.0081562074 0.19137567 -0.019377667 0.0030866109 0.19046262 -0.040485881 
		-0.0059187943 0.19077484 -0.024997434 0.0079528624 0.19069134 -0.043747716 -0.0014044304 
		0.19034678 -0.034399752 -0.0033683807 0.19042912 -0.030668091 0.0010286868 0.19040668 
		-0.037996285 0.0055575613 0.19057915 -0.042513154 0.022942631 0.19040091 -0.039915405 
		0.024926858 0.19034842 -0.037514802 0.02731403 0.19029063 -0.033986066 0.029247558 
		0.19036153 -0.030313885 0.031780612 0.19071612 -0.024679696 0.035374496 0.19169416 
		-0.015650533 0.037595112 0.19290875 -0.0090508414 0.039791968 0.19390768 -0.0028878597 
		-0.01319197 0.19390768 -0.0028878597 -0.0094481092 0.19215529 -0.013409821 -0.0074061751 
		0.19132671 -0.019087382 -0.0051806117 0.19071612 -0.024679696 -0.0026475599 0.19036153 
		-0.030313885 -0.00071402919 0.19029063 -0.033986066 0.0016731415 0.19034842 -0.037514802 
		0.0036573675 0.19040091 -0.039915405 0.006003249 0.19051602 -0.041839629 0.0082453033 
		0.1906158 -0.042995717 0.0133 0.19070134 -0.043980688 0.018354695 0.1906158 -0.042995717 
		0.02059675 0.19051602 -0.041839629 -0.013443268 0.18080415 0.020080596 0.04039624 
		0.18117976 0.019747289 -0.013888025 0.1884741 -0.01377176 0.039636746 0.18823506 
		-0.016073056 0.0133 0.18909253 -0.048904926 0.0080644321 0.18885322 -0.048078783 
		0.018535567 0.18885322 -0.048078783 0.0081361756 0.18627585 -0.051455598 0.013300178 
		0.18659629 -0.052129664 0.044412836 0.18477178 -7.2658542e-05 0.034805454 0.18744881 
		-0.028285019 0.044721544 0.18971294 -0.0023014513 0.024924679 0.18809259 -0.044255793;
	setAttr ".vl[0].vt[1162:1327]" 0.028633429 0.18764354 -0.03991206 0.021501582 
		0.18855955 -0.04674023 0.031805843 0.187382 -0.034671921 0.062396195 0.20473906 0.008778465 
		0.065631449 0.21754032 0.028061226 0.065358862 0.207875 0.015928483 0.068106413 0.21267134 
		0.0018324868 0.071515359 0.22658537 0.020404449 0.071367003 0.21640891 0.0085227797 
		0.071670175 0.22069746 -0.005235564 0.0745617 0.23588794 0.012540596 0.074910104 
		0.22528058 0.00083919644 0.073291637 0.22956896 -0.012976131 0.075148612 0.24533939 
		0.0045531648 0.07620015 0.23466364 -0.007278264 0.072676308 0.2384074 -0.020645309 
		0.075202338 0.24385533 -0.015221944 0.07346952 0.25433087 -0.0030362143 0.072028995 
		0.25269052 -0.022852879 0.069702581 0.26286027 -0.010227216 0.069914058 0.2469441 
		-0.028041223 0.064779863 0.25526834 -0.035276424 0.066502564 0.26123399 -0.030246686 
		0.06384746 0.27084675 -0.016981296 0.057363741 0.26281726 -0.041842707 0.058722179 
		0.26893848 -0.036931206 0.056194276 0.27779841 -0.022865837 0.048063293 0.27577749 
		-0.042865455 0.046014588 0.28395599 -0.028068446 0.047048572 0.26953918 -0.047703449 
		0.03443075 0.27446455 -0.052026853 0.033920873 0.28849354 -0.031907652 0.035128683 
		0.28081459 -0.047235955 0.020120854 0.27709031 -0.05430739 0.020051941 0.2909894 
		-0.033999074 0.02037818 0.28352383 -0.049573343 0.046146546 0.20275715 0.04056289 
		0.047020059 0.19283301 0.0289541 0.04549377 0.18864685 0.022734797 0.033827171 0.19790421 
		0.044670641 0.019911751 0.19522752 0.046935566 0.055034228 0.1970702 0.015628409 
		0.056864846 0.20927547 0.035049126 0.057027839 0.19991754 0.022916166 0.066356905 
		0.21221797 0.022359092 0.062740661 0.20843869 0.025623895 0.069825113 0.21676706 
		0.018436173 0.072389357 0.22110808 0.014701506 0.074480809 0.22601417 0.010490756 
		0.075737603 0.23037508 0.006758112 0.076549008 0.2355226 0.0023569264 0.076687463 
		0.23994118 -0.0014141479 0.076236308 0.24497917 -0.0057074502 0.07376691 0.25396949 
		-0.013335976 0.075353242 0.24919364 -0.0092878724 0.069021463 0.26273996 -0.020765342 
		0.071867563 0.25805619 -0.016796293 0.062172152 0.27070731 -0.027503146 0.066117935 
		0.26652601 -0.023967251 0.053137269 0.27770942 -0.033405252 0.058278255 0.27408111 
		-0.030351169 0.041495796 0.28355032 -0.038278434 0.047682948 0.28079268 -0.035983372 
		0.034936931 0.28575462 -0.040094618 0.027815122 0.2874428 -0.041465141 0.020349784 
		0.28848279 -0.042266194 0.047034275 0.1974678 0.035157867 0.040790536 0.19456001 
		0.037684221 0.052099053 0.20033944 0.03265873 0.034356426 0.19200259 0.03995835 0.057581197 
		0.20407417 0.029406764 0.027354518 0.18992162 0.041852988 0.0133 0.27745885 -0.054532256 
		0.0133 0.2912963 -0.03427818 0.0133 0.28384975 -0.049833458 0.0133 0.28882244 -0.042489786 
		0.0133 0.19495468 0.04717664 0.036430579 0.18221936 0.02852883 -0.00079256238 0.27612135 
		-0.053459328 -0.014365897 0.27230164 -0.050086942 -0.025783738 0.26648003 -0.044995584 
		-0.034500416 0.25945061 -0.03887818 -0.040832508 0.25154266 -0.032001618 -0.044898141 
		0.24299571 -0.024586173 -0.046635836 0.23440883 -0.017150853 -0.046228576 0.22540045 
		-0.0093131075 -0.04362721 0.2168501 -0.0018214269 -0.03911645 0.20894556 0.0051478148 
		-0.032518405 0.20112997 0.011918395 -0.0012743875 0.28251421 -0.0487056 -0.015203412 
		0.27857813 -0.04528591 -0.026958918 0.27264228 -0.040134877 -0.036016088 0.26549259 
		-0.033928394 -0.042721976 0.25740346 -0.026917605 -0.047188733 0.2486109 -0.019313958 
		-0.049331013 0.23967741 -0.011596724 -0.04929762 0.2303043 -0.0034876799 -0.00064676633 
		0.29002571 -0.03321046 -0.00033076858 0.19621149 0.046092685 -0.046934348 0.22108462 
		0.0044951565 -0.04222098 0.21230188 0.012114468 -0.035233162 0.20416653 0.019158429 
		-0.013522308 0.28648272 -0.030212328 -0.02464176 0.28113168 -0.025688892 -0.033364035 
		0.27471924 -0.020266037 -0.040173166 0.26731074 -0.013995427 -0.045129843 0.25894141 
		-0.0069246045 -0.047915224 0.25025138 0.00040143108 -0.048588086 0.24100119 0.0082159089 
		-0.046866149 0.23152515 0.01622428 -0.042427987 0.22214699 0.024161195 -0.035462182 
		0.21370798 0.031301379 -0.024723476 0.20556074 0.038208552 -0.025676465 0.19628036 
		0.025985228 -0.024628852 0.19332677 0.018688628 -0.014443384 0.18557188 0.025520766 
		-0.013561902 0.20011976 0.042795107 -0.014480161 0.18959744 0.031735059 -0.0079994779 
		0.18654251 0.034398597 -0.035796192 0.20473906 0.008778465 -0.03903145 0.21754032 
		0.028061226 -0.038758859 0.207875 0.015928483 -0.04150641 0.21267134 0.0018324868 
		-0.044915363 0.22658537 0.020404449 -0.044767004 0.21640891 0.0085227797 -0.045070175 
		0.22069746 -0.005235564 -0.047961701 0.23588794 0.012540596 -0.048310108 0.22528058 
		0.00083919644 -0.046691641 0.22956896 -0.012976131 -0.048548613 0.24533939 0.0045531648 
		-0.04960015 0.23466364 -0.007278264 -0.046076313 0.2384074 -0.020645309 -0.048602339 
		0.24385533 -0.015221944 -0.04686952 0.25433087 -0.0030362143 -0.045428995 0.25269052 
		-0.022852879 -0.043102585 0.26286027 -0.010227216 -0.043314058 0.2469441 -0.028041223 
		-0.038179863 0.25526834 -0.035276424 -0.03990256 0.26123399 -0.030246686 -0.03724746 
		0.27084675 -0.016981296 -0.030763742 0.26281726 -0.041842707 -0.032122176 0.26893848 
		-0.036931206 -0.029594276 0.27779841 -0.022865837 -0.021463292 0.27577749 -0.042865455 
		-0.019414587 0.28395599 -0.028068446 -0.020448573 0.26953918 -0.047703449 -0.0078307511 
		0.27446455 -0.052026853 -0.0073208744 0.28849354 -0.031907652 -0.0085286824 0.28081459 
		-0.047235955 0.0064791464 0.27709031 -0.05430739 0.0065480596 0.2909894 -0.033999074 
		0.0062218187 0.28352383 -0.049573343 -0.019546546 0.20275715 0.04056289 -0.020420058 
		0.19283301 0.0289541 -0.019305613 0.18893141 0.022476982 -0.0072271689 0.19790421 
		0.044670641 0.0066882493 0.19522752 0.046935566 -0.028434226 0.1970702 0.015628409 
		-0.030264849 0.20927547 0.035049126 -0.030427843 0.19991754 0.022916166 -0.039756909 
		0.21221797 0.022359092 -0.036140662 0.20843869 0.025623895 -0.043225113 0.21676706 
		0.018436173 -0.045789357 0.22110808 0.014701506 -0.047880813 0.22601417 0.010490756 
		-0.049137603 0.23037508 0.006758112;
	setAttr ".vl[0].vt[1328:1493]" -0.049949009 0.2355226 0.0023569264 -0.050087463 
		0.23994118 -0.0014141479 -0.049636308 0.24497917 -0.0057074502 -0.04716691 0.25396949 
		-0.013335976 -0.048753243 0.24919364 -0.0092878724 -0.042421468 0.26273996 -0.020765342 
		-0.04526756 0.25805619 -0.016796293 -0.035572149 0.27070731 -0.027503146 -0.039517935 
		0.26652601 -0.023967251 -0.026537266 0.27770942 -0.033405252 -0.031678256 0.27408111 
		-0.030351169 -0.014895795 0.28355032 -0.038278434 -0.021082945 0.28079268 -0.035983372 
		-0.0083369324 0.28575462 -0.040094618 -0.0012151221 0.2874428 -0.041465141 0.0062502166 
		0.28848279 -0.042266194 -0.020434273 0.1974678 0.035157867 -0.014190539 0.19456001 
		0.037684221 -0.025499051 0.20033944 0.03265873 -0.0077564283 0.19200259 0.03995835 
		-0.0309812 0.20407417 0.029406764 -0.00075451744 0.18992162 0.041852988 -0.009830581 
		0.18221936 0.02852883 -0.016292449 0.18400592 0.017391346 0.026604237 0.2026796 0.042974021 
		0.032893181 0.20171152 0.038849454 0.037947729 0.20083863 0.033786792 0.041627165 
		0.19940712 0.027775092 0.043672413 0.1981657 0.021943806 0.019956769 0.20277406 0.045024481 
		0.0133 0.20262222 0.045265153 0.044343658 0.19700408 0.015959375 -4.2374136e-06 0.2026796 
		0.042974021 -0.006293179 0.20171152 0.038849454 -0.011347727 0.20083863 0.033786792 
		-0.015027163 0.19940712 0.027775092 -0.017072409 0.1981657 0.021943806 0.0066432292 
		0.20277406 0.045024481 -0.017743656 0.19700408 0.015959375 0.02845021 0.11854008 
		-0.075207733 0.023888001 0.11360921 -0.083540201 0.042661335 0.17906246 0.0035664719 
		0.042883262 0.18398136 0.01739992 0.040281899 0.17063107 -0.0088818641 0.039154142 
		0.16565202 -0.015517065 0.037940241 0.15991624 -0.02215294 0.036757108 0.15332341 
		-0.029411508 0.035584141 0.14679308 -0.036769059 0.034473311 0.140567 -0.044772234 
		0.033249717 0.13439298 -0.052742008 0.031995334 0.12855268 -0.060415335 0.030770781 
		0.12378436 -0.066909462 0.018922966 0.11412595 -0.091698959 0.0073965946 0.12011464 
		-0.096744716 0.00017794404 0.13232496 -0.092397109 0.0031631181 0.12729727 -0.095951654 
		0.00016371704 0.13668682 -0.090884656 -0.0010462601 0.14340824 -0.085811555 -0.001516634 
		0.14926395 -0.080674313 -0.0015423934 0.15589722 -0.073889911 -0.00154125 0.16334137 
		-0.0656939 -0.0019292333 0.1693532 -0.057879921 -0.0053151241 0.18742201 -0.034475561 
		-0.0026863089 0.17599382 -0.048897196 -0.0039279261 0.18145601 -0.04118507 0.044011459 
		0.19620946 0.010970882 -0.017394764 0.19620021 0.010979635 0.024016518 0.1460751 
		-0.089684755 0.024121808 0.15294036 -0.084453203 0.02424738 0.15996888 -0.07762517 
		0.024447622 0.16711697 -0.069887549 0.024713 0.17411996 -0.061725285 0.025114896 
		0.12295847 -0.090042226 0.024997067 0.1278138 -0.092154354 0.025070528 0.13375188 
		-0.0928341 0.024372404 0.13817042 -0.09274517 0.025766715 0.18499678 -0.047301508 
		0.025144763 0.18028742 -0.053965248 0.024819292 0.11844976 -0.087344468 0.0133 0.15075432 
		0.019998401 -0.00051727402 0.15613528 0.018292123 -0.0054961732 0.16221493 0.017538778 
		0.0061196503 0.15203917 0.019543808 0.027117273 0.15613528 0.018292123 0.031161293 
		0.16107337 0.017680235 0.020480348 0.15203917 0.019543804 -0.0088126892 0.16907342 
		0.018734204 -0.010281468 0.17743948 0.023066256 0.035436455 0.16907988 0.018698405 
		0.036881469 0.17743948 0.023066256 0.0019434382 0.17989895 -0.053658277 0.001209376 
		0.18464984 -0.047150385 0.0018357914 0.15294451 -0.084476672 0.0019644238 0.14614902 
		-0.089791335 0.002479824 0.15988894 -0.077608809 0.0023116092 0.17381911 -0.061482564 
		0.0024530352 0.16695243 -0.069775932 -0.023274794 0.21084036 0.04230367 -0.021495346 
		0.2119267 0.039764915 -0.028685389 0.21448301 0.039180711 -0.026588446 0.21544832 
		0.036771249 0.0133 0.20136423 0.050420921 0.0133 0.20322947 0.047117352 0.00024522506 
		0.20246813 0.049379401 -0.012573024 0.20592645 0.046434868 0.0010180799 0.2041319 
		0.046402562 -0.011604761 0.20735316 0.043623075 -0.017886611 0.20809877 0.044590868 
		-0.016744051 0.20946421 0.041834317 -0.0063642953 0.20403457 0.048042022 0.0067518074 
		0.20163041 0.050078303 0.0072613577 0.20344901 0.046957996 -0.005381404 0.20556425 
		0.045148201 0.026354775 0.20246813 0.049379401 0.039173022 0.20592645 0.046434868 
		0.025581921 0.2041319 0.046402562 0.038204759 0.20735316 0.043623075 0.044486612 
		0.20809877 0.044590868 0.043344054 0.20946421 0.041834317 0.032964297 0.20403457 
		0.048042022 0.019848192 0.20163041 0.050078303 0.019338641 0.20344901 0.046957996 
		0.031981401 0.20556425 0.045148201 0.049874797 0.21084036 0.04230367 0.048095345 
		0.2119267 0.039764915 0.05528539 0.21448301 0.039180711 0.053188447 0.21544832 0.036771249 
		-0.033691376 0.21887277 0.035453394 -0.040336944 0.22725227 0.028335975 -0.037552129 
		0.22776827 0.026332162 -0.031150516 0.21966979 0.033196822 -0.037064582 0.22271305 
		0.032192297 -0.03440626 0.22338833 0.03004651 -0.042624716 0.23164624 0.024597606 
		-0.039676122 0.23193246 0.022789156 0.060291372 0.21887277 0.035453394 0.066936947 
		0.22725227 0.028335975 0.064152129 0.22776827 0.026332162 0.057750516 0.21966979 
		0.033196822 0.063664578 0.22271305 0.032192297 0.061006263 0.22338833 0.03004651 
		0.069224715 0.23164624 0.024597606 0.066276126 0.23193246 0.022789156 -0.044448577 
		0.23638806 0.020571753 -0.045820918 0.24552056 0.012826195 -0.044795334 0.2543332 
		0.0053539709 -0.041315243 0.23633905 0.019051334 -0.042560846 0.24495223 0.011757405 
		-0.041551817 0.25334471 0.0046533309 -0.045320667 0.24060437 0.0169963 -0.042109128 
		0.24030271 0.015695408 -0.045564022 0.24966645 0.009309859 -0.04230319 0.24890229 
		0.0084124254 0.071048573 0.23638806 0.020571753 0.072420917 0.24552056 0.012826195 
		0.07139533 0.2543332 0.0053539709 0.067915238 0.23633905 0.019051334 0.069160849 
		0.24495223 0.011757405 0.068151817 0.25334471 0.0046533309 0.071920663 0.24060437 
		0.0169963 0.068709128 0.24030271 0.015695408 0.072164021 0.24966645 0.009309859 0.068903185 
		0.24890229 0.0084124254 -0.041719485 0.26247078 -0.0015310964 -0.038597509 0.26101014 
		-0.0018193407 -0.043553378 0.25815028 0.0021225987;
	setAttr ".vl[0].vt[1494:1659]" -0.040351965 0.25693718 0.0016187086 0.068319485 
		0.26247078 -0.0015310964 0.065197505 0.26101014 -0.0018193407 0.070153378 0.25815028 
		0.0021225987 0.066951968 0.25693718 0.0016187086 -0.036657643 0.2702316 -0.0081025818 
		-0.033814792 0.26836333 -0.0080347098 -0.039565686 0.26610884 -0.0046090172 -0.036561809 
		0.26446226 -0.0047351751 -0.033737071 0.27340066 -0.010791569 -0.031054549 0.27133596 
		-0.010549921 0.063257642 0.2702316 -0.0081025818 0.060414795 0.26836333 -0.0080347098 
		0.066165686 0.26610884 -0.0046090172 0.063161805 0.26446226 -0.0047351751 0.06033707 
		0.27340066 -0.010791569 0.057654552 0.27133596 -0.010549921 -0.030018572 0.2768634 
		-0.013737237 -0.021689259 0.28236461 -0.018440336 -0.019693311 0.2796731 -0.017644236 
		-0.027548784 0.27456743 -0.013290798 -0.026375344 0.27947062 -0.015967067 -0.024123376 
		0.27697372 -0.015342447 0.0133 0.28833574 -0.02499347 0.0133 0.29152724 -0.026228184 
		-0.011377671 0.28705835 -0.022442136 0.00029014933 0.29023203 -0.025150463 0.00094838534 
		0.28710318 -0.023970522 -0.0099761402 0.28408638 -0.021399509 -0.016789718 0.28479266 
		-0.020511638 -0.015074861 0.28194991 -0.019582598 -0.0056998525 0.28882721 -0.023952557 
		-0.0046284678 0.28577355 -0.022837391 0.0070398059 0.29111916 -0.025886381 0.0073862122 
		0.28795171 -0.024672374 0.037977673 0.28705835 -0.022442136 0.026309852 0.29023203 
		-0.025150463 0.025651615 0.28710318 -0.023970522 0.036576141 0.28408638 -0.021399509 
		0.043389719 0.28479266 -0.020511638 0.041674864 0.28194991 -0.019582598 0.03229985 
		0.28882721 -0.023952557 0.031228468 0.28577355 -0.022837391 0.019560194 0.29111916 
		-0.025886381 0.019213788 0.28795171 -0.024672374 0.056618571 0.2768634 -0.013737237 
		0.048289258 0.28236461 -0.018440336 0.046293311 0.2796731 -0.017644236 0.054148786 
		0.27456743 -0.013290798 0.052975345 0.27947062 -0.015967067 0.050723378 0.27697372 
		-0.015342447 -0.022877252 0.19174123 0.010910668 -0.028935019 0.19886202 0.004521695 
		-0.034729607 0.20660995 -0.0017997538 -0.026240591 0.20184541 0.0047868979 -0.031744458 
		0.202489 0.0014937274 -0.029129118 0.20523298 0.0019321395 -0.025714664 0.19480088 
		0.0078268107 -0.02251607 0.19868621 0.0073576458 -0.018296029 0.19639875 0.0095673921 
		0.044896033 0.19639875 0.0095673921 0.055535018 0.19886202 0.004521695 0.061329607 
		0.20660995 -0.0017997538 0.05284059 0.20184541 0.0047868979 0.049477253 0.19174123 
		0.010910668 0.058344461 0.202489 0.0014937274 0.055729121 0.20523298 0.0019321395 
		0.052314665 0.19480088 0.0078268107 0.049116071 0.19868621 0.0073576458 -0.038732771 
		0.21362151 -0.0077476706 -0.041517477 0.22142264 -0.014340011 -0.03201136 0.2091877 
		-0.0012553441 -0.035851508 0.21570525 -0.0067496588 -0.038536511 0.22304574 -0.012957158 
		-0.036827963 0.2099964 -0.004657927 -0.034034844 0.21237366 -0.0039329641 -0.040168799 
		0.21711797 -0.010693219 -0.037226863 0.21897516 -0.0095131667 -0.042058401 0.2253419 
		-0.017737718 -0.039145563 0.22681509 -0.016149973 0.06533277 0.21362151 -0.0077476706 
		0.068117477 0.22142264 -0.014340011 0.058611363 0.2091877 -0.0012553441 0.062451508 
		0.21570525 -0.0067496588 0.065136507 0.22304574 -0.012957158 0.063427962 0.2099964 
		-0.004657927 0.060634844 0.21237366 -0.0039329641 0.066768795 0.21711797 -0.010693219 
		0.063826859 0.21897516 -0.0095131667 0.068658404 0.2253419 -0.017737718 0.065745562 
		0.22681509 -0.016149973 -0.042287569 0.22990245 -0.021647532 -0.041303478 0.23821047 
		-0.02837546 -0.039423492 0.23118897 -0.019854464 -0.038305525 0.23887402 -0.026353506 
		-0.03499059 0.24669772 -0.032981765 -0.042040069 0.23376343 -0.024767369 -0.039099965 
		0.23475724 -0.022873016 -0.039889339 0.24199015 -0.031605899 -0.036998045 0.24248829 
		-0.02941386 0.068887569 0.22990245 -0.021647532 0.067903474 0.23821047 -0.02837546 
		0.066023491 0.23118897 -0.019854464 0.064905524 0.23887402 -0.026353506 0.06159059 
		0.24669772 -0.032981765 0.068640068 0.23376343 -0.024767369 0.065699965 0.23475724 
		-0.022873016 0.066489339 0.24199015 -0.031605899 0.063598044 0.24248829 -0.02941386 
		-0.037728053 0.24639052 -0.035383701 -0.032029834 0.25413328 -0.041837443 -0.029603822 
		0.25391889 -0.039101366 -0.035312563 0.25002545 -0.038411595 -0.032703575 0.25009426 
		-0.035857581 -0.02635359 0.25697988 -0.041709013 0.064328052 0.24639052 -0.035383701 
		0.058629833 0.25413328 -0.041837443 0.056203824 0.25391889 -0.039101366 0.061912566 
		0.25002545 -0.038411595 0.059303574 0.25009426 -0.035857581 0.052953593 0.25697988 
		-0.041709013 -0.023902576 0.26099411 -0.047678076 -0.021995433 0.26039845 -0.044621367 
		-0.028531384 0.25738552 -0.044610806 -0.018833917 0.26403821 -0.050167635 -0.011739193 
		0.26581931 -0.049235739 -0.017188592 0.26321959 -0.047023311 0.03833919 0.26581931 
		-0.049235739 0.043788593 0.26321959 -0.047023311 0.050502576 0.26099411 -0.047678076 
		0.048595436 0.26039845 -0.044621367 0.055131387 0.25738552 -0.044610806 0.045433916 
		0.26403821 -0.050167635 0.0133 0.27188116 -0.056787316 0.0133 0.27068329 -0.053360458 
		-0.013089415 0.26682979 -0.052468035 -0.00013013733 0.27049673 -0.055655319 0.00046470607 
		0.26937371 -0.052268207 -0.006790692 0.26888472 -0.054250188 -0.0057853567 0.26781431 
		-0.050938483 0.0068313796 0.27143794 -0.056425363 0.0071427561 0.27027652 -0.053019252 
		0.039689414 0.26682979 -0.052468035 0.026730137 0.27049673 -0.055655319 0.026135294 
		0.26937371 -0.052268207 0.03339069 0.26888472 -0.054250188 0.032385357 0.26781431 
		-0.050938483 0.01976862 0.27143794 -0.056425363 0.019457245 0.27027652 -0.053019252 
		-0.00099711644 0.1576529 -0.014938284 -0.00298451 0.16060185 -0.016185526 -0.0045177443 
		0.16391592 -0.020268613 -0.0051754499 0.16820754 -0.028753575 -0.0044313725 0.17084208 
		-0.03555885 -0.00370712 0.17100416 -0.039114494 -0.0030828351 0.16954574 -0.043023877 
		-0.0030539024 0.16681679 -0.045846108 -0.0033590263 0.16256562 -0.047449071 -0.0038246862 
		0.15897775 -0.047319029 -0.0041638426 0.15560308 -0.045501564 -0.004208887 0.15275931 
		-0.042167556 -0.0035641335 0.14991117 -0.037132394 -0.0023046429 0.14732027 -0.031663209 
		-0.00029977239 0.14555594 -0.026943753 0.0011159176 0.14543688 -0.024168948 0.0025854597 
		0.1465126 -0.021445874;
	setAttr ".vl[0].vt[1660:1782]" 0.0035180354 0.14839166 -0.019035066 0.0036821521 
		0.1504783 -0.017383192 0.0027449869 0.15307026 -0.015903968 0.0010854905 0.15531883 
		-0.015029229 0.030297292 0.17133757 0.018944401 0.031187464 0.17747255 0.022056475 
		0.028639007 0.18361194 0.0296757 0.026444679 0.18515752 0.032564789 0.022857497 0.18675329 
		0.035470523 0.018856542 0.18787402 0.037379481 0.013309273 0.18849853 0.038231622 
		0.0077620042 0.18787402 0.037379481 0.0037610491 0.18675329 0.035470523 0.00017386655 
		0.18515752 0.032564789 -0.0020204601 0.18361194 0.0296757 -0.0045689181 0.17747255 
		0.022056475 -0.0036787458 0.17133757 0.018944401 -0.0012687141 0.16620554 0.018012708 
		0.0025013248 0.16188022 0.018399997 0.0076250946 0.15884528 0.019182049 0.013309273 
		0.15759251 0.019434534 0.018993452 0.15884528 0.019182049 0.02411722 0.16188022 0.018399997 
		0.027887261 0.16620554 0.018012708 0.030439178 0.18087268 0.025571788 -0.0038206333 
		0.18087268 0.025571788 0.0069153714 0.15445033 0.021891508 0.0011518503 0.15786421 
		0.021011813 -0.0030889125 0.16272959 0.020576166 0.013309273 0.15304115 0.022175521 
		0.019703174 0.15445033 0.021891508 0.025466694 0.15786421 0.021011813 0.02970746 
		0.16272959 0.020576166 -0.0057998588 0.16850241 0.021624193 -0.0068011787 0.17540339 
		0.025124835 0.013309273 0.18780607 0.043319598 0.0066887806 0.18710358 0.042361062 
		-0.0014662119 0.18404791 0.036945213 0.0025688638 0.18584292 0.040213753 -0.0039345208 
		0.18230934 0.033695392 -0.0059594624 0.17922805 0.029079063 0.032418404 0.16850241 
		0.021624193 0.033419725 0.17540339 0.025124835 0.019929765 0.18710358 0.042361062 
		0.028084759 0.18404791 0.036945213 0.024049683 0.18584292 0.040213753 0.030553065 
		0.18230934 0.033695392 0.03257801 0.17922805 0.029079063 0.0023350017 0.14930926 
		-0.015112208 0.0010990088 0.14481533 -0.019979028 -0.0026740474 0.15787199 -0.012653998 
		0.0013999236 0.15236534 -0.013425304 -0.00046186804 0.15503006 -0.012558518 0.0021854222 
		0.14693369 -0.017028712 -0.0048818081 0.16123247 -0.014256222 -0.0066431602 0.16472834 
		-0.018924199 -0.00059435773 0.14410581 -0.023247331 -0.0021364749 0.14451237 -0.02630705 
		-0.00431896 0.146341 -0.031460967 -0.0056885583 0.14927672 -0.037490141 -0.0063827955 
		0.15223724 -0.042871047 -0.0058089122 0.17246313 -0.039507147 -0.0051518725 0.17083088 
		-0.043882839 -0.0065633771 0.17225775 -0.035559479 -0.0063533704 0.15534976 -0.046519034 
		-0.0059891948 0.15904573 -0.048552226 -0.0049994909 0.16766998 -0.046928886 -0.0073580663 
		0.16937347 -0.028120885 -0.0054820487 0.1629972 -0.048682321 -0.0025898183 0.12878996 
		-0.082623072 -0.0027488298 0.12272514 -0.076482087 0.028734799 0.12088941 -0.078079358 
		0.028984806 0.12756296 -0.083406918 0.028370328 0.13590483 -0.086573973 -0.015822671 
		0.18485631 -0.00097639253 -0.021168733 0.18972054 0.012602978 -0.015794819 0.18294001 
		0.0086127007 -0.018303694 0.18720403 0.0059822546 -0.020327775 0.19065389 0.0038278105 
		-0.016114395 0.19522376 0.0031980004 -0.015293367 0.19505394 0.0040458869 -0.018189175 
		0.18619657 0.015554268 -0.0045713619 0.17440292 0.020257954 -0.0067462265 0.17193821 
		0.023125656 -0.0097555984 0.17332241 0.020394497 -0.011673158 0.17566958 0.015594417 
		-0.013532884 0.17892011 0.011826481 0.031095618 0.17479339 0.020391813 0.033276938 
		0.17237315 0.023282079 0.036535323 0.17374071 0.020826027 0.039018732 0.17635109 
		0.016126378 0.041581154 0.17936489 0.012287308 0.04647018 0.18730874 0.0061460319 
		0.042072203 0.19515158 0.0046014879 0.042890698 0.19531871 0.0037127244 0.047133803 
		0.19074176 0.0044001909 0.0478606 0.18977037 0.012572543 0.045007896 0.18642408 0.015359504 
		0.043980829 0.18292727 0.0093122022 -0.0059935758 0.18061313 -0.034880396 -0.011075839 
		0.18791594 -0.021029601 -0.010145398 0.18134208 -0.020797445 0.035369445 0.168016 
		0.0050671822 0.034368996 0.16669157 0.011821412 0.034066688 0.16570097 0.01782285 
		0.031358764 0.16566166 0.020803634 0.029385936 0.1688126 0.018181173 0.04214545 0.18895097 
		-0.0092853084 0.042973787 0.18183154 -0.0063122706 0.041348271 0.17476237 -0.0028664158 
		0.037365627 0.16888353 0.0011872135 -0.0059985304 0.1450012 -0.050358631 -0.0057578152 
		0.1388967 -0.057608489 -0.0051718447 0.1331663 -0.064627968 -0.0042186743 0.12809165 
		-0.070962124 -0.0055210399 0.15200853 -0.057128225 -0.0051962179 0.14567673 -0.064502686 
		-0.0046368311 0.13973846 -0.071200185 -0.0037370278 0.13445455 -0.077159114 -0.0057479558 
		0.15606695 -0.052245427 -0.0061541256 0.15219636 -0.049572535 -0.0061557456 0.14901273 
		-0.046022911 -0.0056829196 0.14572081 -0.040985405;
createNode objectSet -n "skel:skinCluster2Set";
	rename -uid "7365C751-4A4E-90D3-3203-6A9A99DD0756";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skel:skinCluster2GroupId";
	rename -uid "2A516A18-4343-1FE7-5889-A89A256DABDB";
	setAttr ".ihi" 0;
createNode groupParts -n "skel:skinCluster2GroupParts";
	rename -uid "5130CF78-4F41-FE0E-E8C2-1D92F5BB01D9";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "skel:tweakSet2";
	rename -uid "A308DC56-4F56-7A4F-4769-3B98A8A1A900";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skel:groupId4";
	rename -uid "A3EF9E62-4AF4-54B4-4194-B5890DFC9DC7";
	setAttr ".ihi" 0;
createNode groupParts -n "skel:groupParts4";
	rename -uid "2D128577-4ABB-E58F-5C5A-9A97CFECEBBA";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode reference -n "skel:controller_materialsRN";
	rename -uid "3AD2C5F2-4F3B-CB44-6D90-7DB34FE49684";
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
	rename -uid "2BFF1B32-4752-91B4-AD0E-9E90C16C6525";
	setAttr ".def" no;
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -675.93877540684218 -373.68216370802003 ;
	setAttr ".tgi[0].vh" -type "double2" 667.58320145408504 596.05655202481387 ;
	setAttr -s 3 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -255.23924255371094;
	setAttr ".tgi[0].ni[0].y" 287.14285278320313;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -561.4285888671875;
	setAttr ".tgi[0].ni[1].y" 264.28570556640625;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" 360;
	setAttr ".tgi[0].ni[2].y" 264.28570556640625;
	setAttr ".tgi[0].ni[2].nvs" 1923;
createNode gameFbxExporter -n "gameExporterPreset1";
	rename -uid "AF90B3CE-46D0-090B-3C9E-A78639FF8AA8";
	setAttr ".pn" -type "string" "Model Default";
	setAttr ".ils" yes;
	setAttr ".ilu" yes;
	setAttr ".esi" 3;
	setAttr ".ssn" -type "string" "GameExport";
	setAttr ".fv" -type "string" "FBX201800";
	setAttr ".exp" -type "string" "C:/dev/depot/depot/Content/controllers//Export";
	setAttr ".exf" -type "string" "controller_l";
createNode gameFbxExporter -n "gameExporterPreset2";
	rename -uid "74B9C600-41F1-A5F6-47EA-6A858FBCBB00";
	setAttr ".pn" -type "string" "Anim Default";
	setAttr ".ils" yes;
	setAttr ".eti" 2;
	setAttr ".ssn" -type "string" "";
	setAttr ".spt" 2;
	setAttr ".ic" no;
	setAttr ".ebm" yes;
	setAttr ".fv" -type "string" "FBX201800";
createNode gameFbxExporter -n "gameExporterPreset3";
	rename -uid "B1CDAC15-4F84-2CE0-0024-DAA20C0BFF5E";
	setAttr ".pn" -type "string" "TE Anim Default";
	setAttr ".ils" yes;
	setAttr ".eti" 3;
	setAttr ".ssn" -type "string" "";
	setAttr ".ebm" yes;
	setAttr ".fv" -type "string" "FBX201800";
createNode objectSet -n "GameExport";
	rename -uid "F764910C-46FC-64D2-DB18-96848CEEA700";
	setAttr ".ihi" 0;
	setAttr -s 8 ".dsm";
	setAttr ".an" -type "string" "gCharacterSet";
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "CC6D586C-4E18-9FD8-A684-14914BBF1AFC";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -1555.3570810528056 -546.26125782308281 ;
	setAttr ".tgi[0].vh" -type "double2" -211.30951541283821 587.92792283406493 ;
	setAttr -s 4 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -520;
	setAttr ".tgi[0].ni[0].y" 174.28572082519531;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" -1134.2857666015625;
	setAttr ".tgi[0].ni[1].y" 197.14285278320313;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" -1441.4285888671875;
	setAttr ".tgi[0].ni[2].y" 174.28572082519531;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" -827.14288330078125;
	setAttr ".tgi[0].ni[3].y" 197.14285278320313;
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
connectAttr "skel:controller_materialsRN.phl[1]" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "skel:controller_materialsRN.phl[2]" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "skel:controller_materialsRN.phl[3]" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
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
connectAttr "controller_world.s" "b_button_menu.is";
connectAttr "b_button_menu_parentConstraint1.ctx" "b_button_menu.tx";
connectAttr "b_button_menu_parentConstraint1.cty" "b_button_menu.ty";
connectAttr "b_button_menu_parentConstraint1.ctz" "b_button_menu.tz";
connectAttr "b_button_menu_parentConstraint1.crx" "b_button_menu.rx";
connectAttr "b_button_menu_parentConstraint1.cry" "b_button_menu.ry";
connectAttr "b_button_menu_parentConstraint1.crz" "b_button_menu.rz";
connectAttr "b_button_menu.ro" "b_button_menu_parentConstraint1.cro";
connectAttr "b_button_menu.pim" "b_button_menu_parentConstraint1.cpim";
connectAttr "b_button_menu.rp" "b_button_menu_parentConstraint1.crp";
connectAttr "b_button_menu.rpt" "b_button_menu_parentConstraint1.crt";
connectAttr "b_button_menu.jo" "b_button_menu_parentConstraint1.cjo";
connectAttr "f_button_menu.t" "b_button_menu_parentConstraint1.tg[0].tt";
connectAttr "f_button_menu.rp" "b_button_menu_parentConstraint1.tg[0].trp";
connectAttr "f_button_menu.rpt" "b_button_menu_parentConstraint1.tg[0].trt";
connectAttr "f_button_menu.r" "b_button_menu_parentConstraint1.tg[0].tr";
connectAttr "f_button_menu.ro" "b_button_menu_parentConstraint1.tg[0].tro";
connectAttr "f_button_menu.s" "b_button_menu_parentConstraint1.tg[0].ts";
connectAttr "f_button_menu.pm" "b_button_menu_parentConstraint1.tg[0].tpm";
connectAttr "f_button_menu.jo" "b_button_menu_parentConstraint1.tg[0].tjo";
connectAttr "f_button_menu.ssc" "b_button_menu_parentConstraint1.tg[0].tsc";
connectAttr "f_button_menu.is" "b_button_menu_parentConstraint1.tg[0].tis";
connectAttr "b_button_menu_parentConstraint1.w0" "b_button_menu_parentConstraint1.tg[0].tw"
		;
connectAttr "controller_world.s" "b_button_y.is";
connectAttr "b_button_y_parentConstraint1.ctx" "b_button_y.tx";
connectAttr "b_button_y_parentConstraint1.cty" "b_button_y.ty";
connectAttr "b_button_y_parentConstraint1.ctz" "b_button_y.tz";
connectAttr "b_button_y_parentConstraint1.crx" "b_button_y.rx";
connectAttr "b_button_y_parentConstraint1.cry" "b_button_y.ry";
connectAttr "b_button_y_parentConstraint1.crz" "b_button_y.rz";
connectAttr "b_button_y.ro" "b_button_y_parentConstraint1.cro";
connectAttr "b_button_y.pim" "b_button_y_parentConstraint1.cpim";
connectAttr "b_button_y.rp" "b_button_y_parentConstraint1.crp";
connectAttr "b_button_y.rpt" "b_button_y_parentConstraint1.crt";
connectAttr "b_button_y.jo" "b_button_y_parentConstraint1.cjo";
connectAttr "f_button_y.t" "b_button_y_parentConstraint1.tg[0].tt";
connectAttr "f_button_y.rp" "b_button_y_parentConstraint1.tg[0].trp";
connectAttr "f_button_y.rpt" "b_button_y_parentConstraint1.tg[0].trt";
connectAttr "f_button_y.r" "b_button_y_parentConstraint1.tg[0].tr";
connectAttr "f_button_y.ro" "b_button_y_parentConstraint1.tg[0].tro";
connectAttr "f_button_y.s" "b_button_y_parentConstraint1.tg[0].ts";
connectAttr "f_button_y.pm" "b_button_y_parentConstraint1.tg[0].tpm";
connectAttr "f_button_y.jo" "b_button_y_parentConstraint1.tg[0].tjo";
connectAttr "f_button_y.ssc" "b_button_y_parentConstraint1.tg[0].tsc";
connectAttr "f_button_y.is" "b_button_y_parentConstraint1.tg[0].tis";
connectAttr "b_button_y_parentConstraint1.w0" "b_button_y_parentConstraint1.tg[0].tw"
		;
connectAttr "controller_world.s" "b_button_x.is";
connectAttr "b_button_x_parentConstraint1.ctx" "b_button_x.tx";
connectAttr "b_button_x_parentConstraint1.cty" "b_button_x.ty";
connectAttr "b_button_x_parentConstraint1.ctz" "b_button_x.tz";
connectAttr "b_button_x_parentConstraint1.crx" "b_button_x.rx";
connectAttr "b_button_x_parentConstraint1.cry" "b_button_x.ry";
connectAttr "b_button_x_parentConstraint1.crz" "b_button_x.rz";
connectAttr "b_button_x.ro" "b_button_x_parentConstraint1.cro";
connectAttr "b_button_x.pim" "b_button_x_parentConstraint1.cpim";
connectAttr "b_button_x.rp" "b_button_x_parentConstraint1.crp";
connectAttr "b_button_x.rpt" "b_button_x_parentConstraint1.crt";
connectAttr "b_button_x.jo" "b_button_x_parentConstraint1.cjo";
connectAttr "f_button_x.t" "b_button_x_parentConstraint1.tg[0].tt";
connectAttr "f_button_x.rp" "b_button_x_parentConstraint1.tg[0].trp";
connectAttr "f_button_x.rpt" "b_button_x_parentConstraint1.tg[0].trt";
connectAttr "f_button_x.r" "b_button_x_parentConstraint1.tg[0].tr";
connectAttr "f_button_x.ro" "b_button_x_parentConstraint1.tg[0].tro";
connectAttr "f_button_x.s" "b_button_x_parentConstraint1.tg[0].ts";
connectAttr "f_button_x.pm" "b_button_x_parentConstraint1.tg[0].tpm";
connectAttr "f_button_x.jo" "b_button_x_parentConstraint1.tg[0].tjo";
connectAttr "f_button_x.ssc" "b_button_x_parentConstraint1.tg[0].tsc";
connectAttr "f_button_x.is" "b_button_x_parentConstraint1.tg[0].tis";
connectAttr "b_button_x_parentConstraint1.w0" "b_button_x_parentConstraint1.tg[0].tw"
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
connectAttr "skel:skinCluster2GroupId.id" "controller_plyShape.iog.og[2].gid";
connectAttr "skel:skinCluster2Set.mwc" "controller_plyShape.iog.og[2].gco";
connectAttr "skel:groupId4.id" "controller_plyShape.iog.og[3].gid";
connectAttr "skel:tweakSet2.mwc" "controller_plyShape.iog.og[3].gco";
connectAttr "skel:skinCluster2.og[0]" "controller_plyShape.i";
connectAttr "skel:tweak2.vl[0].vt[0]" "controller_plyShape.twl";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "skel:controller_plySG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "skel:controller_plySG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "f_world.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "f_trigger_grip.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "f_trigger_front.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "f_thumbstick.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "f_button_y.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "f_button_x.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "f_button_menu.iog" "ALL_CONTROLS.dsm" -na;
connectAttr "layerManager.dli[1]" "geom_lyr.id";
connectAttr "layerManager.dli[2]" "skel_lyr.id";
connectAttr "b_button_menu.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "b_button_menu_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "f_button_menu.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn";
connectAttr "controller_world_parentConstraint1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "skel:controller_plySG.msg" "skel:materialInfo1.sg";
connectAttr "skel:place2dTexture1.o" "skel:bcfile.uv";
connectAttr "skel:place2dTexture1.ofu" "skel:bcfile.ofu";
connectAttr "skel:place2dTexture1.ofv" "skel:bcfile.ofv";
connectAttr "skel:place2dTexture1.rf" "skel:bcfile.rf";
connectAttr "skel:place2dTexture1.reu" "skel:bcfile.reu";
connectAttr "skel:place2dTexture1.rev" "skel:bcfile.rev";
connectAttr "skel:place2dTexture1.vt1" "skel:bcfile.vt1";
connectAttr "skel:place2dTexture1.vt2" "skel:bcfile.vt2";
connectAttr "skel:place2dTexture1.vt3" "skel:bcfile.vt3";
connectAttr "skel:place2dTexture1.vc1" "skel:bcfile.vc1";
connectAttr "skel:place2dTexture1.ofs" "skel:bcfile.fs";
connectAttr ":defaultColorMgtGlobals.cme" "skel:bcfile.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "skel:bcfile.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "skel:bcfile.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "skel:bcfile.ws";
connectAttr "controller_world.msg" "skel:bindPose1.m[0]";
connectAttr "b_button_menu.msg" "skel:bindPose1.m[1]";
connectAttr "b_button_y.msg" "skel:bindPose1.m[2]";
connectAttr "b_button_x.msg" "skel:bindPose1.m[3]";
connectAttr "b_trigger_front.msg" "skel:bindPose1.m[4]";
connectAttr "b_trigger_grip.msg" "skel:bindPose1.m[5]";
connectAttr "b_thumbstick.msg" "skel:bindPose1.m[6]";
connectAttr "skel:bindPose1.w" "skel:bindPose1.p[0]";
connectAttr "skel:bindPose1.m[0]" "skel:bindPose1.p[1]";
connectAttr "skel:bindPose1.m[0]" "skel:bindPose1.p[2]";
connectAttr "skel:bindPose1.m[0]" "skel:bindPose1.p[3]";
connectAttr "skel:bindPose1.m[0]" "skel:bindPose1.p[4]";
connectAttr "skel:bindPose1.m[0]" "skel:bindPose1.p[5]";
connectAttr "skel:bindPose1.m[0]" "skel:bindPose1.p[6]";
connectAttr "controller_world.bps" "skel:bindPose1.wm[0]";
connectAttr "b_button_menu.bps" "skel:bindPose1.wm[1]";
connectAttr "b_button_y.bps" "skel:bindPose1.wm[2]";
connectAttr "b_button_x.bps" "skel:bindPose1.wm[3]";
connectAttr "b_trigger_front.bps" "skel:bindPose1.wm[4]";
connectAttr "b_trigger_grip.bps" "skel:bindPose1.wm[5]";
connectAttr "b_thumbstick.bps" "skel:bindPose1.wm[6]";
connectAttr "skel:renderLayerManager.rlmi[0]" "skel:defaultRenderLayer.rlid";
connectAttr "skel:skinCluster2GroupParts.og" "skel:skinCluster2.ip[0].ig";
connectAttr "skel:skinCluster2GroupId.id" "skel:skinCluster2.ip[0].gi";
connectAttr "controller_world.wm" "skel:skinCluster2.ma[0]";
connectAttr "b_button_menu.wm" "skel:skinCluster2.ma[1]";
connectAttr "b_button_y.wm" "skel:skinCluster2.ma[2]";
connectAttr "b_button_x.wm" "skel:skinCluster2.ma[3]";
connectAttr "b_trigger_front.wm" "skel:skinCluster2.ma[4]";
connectAttr "b_trigger_grip.wm" "skel:skinCluster2.ma[5]";
connectAttr "b_thumbstick.wm" "skel:skinCluster2.ma[6]";
connectAttr "controller_world.liw" "skel:skinCluster2.lw[0]";
connectAttr "b_button_menu.liw" "skel:skinCluster2.lw[1]";
connectAttr "b_button_y.liw" "skel:skinCluster2.lw[2]";
connectAttr "b_button_x.liw" "skel:skinCluster2.lw[3]";
connectAttr "b_trigger_front.liw" "skel:skinCluster2.lw[4]";
connectAttr "b_trigger_grip.liw" "skel:skinCluster2.lw[5]";
connectAttr "b_thumbstick.liw" "skel:skinCluster2.lw[6]";
connectAttr "controller_world.obcc" "skel:skinCluster2.ifcl[0]";
connectAttr "b_button_menu.obcc" "skel:skinCluster2.ifcl[1]";
connectAttr "b_button_y.obcc" "skel:skinCluster2.ifcl[2]";
connectAttr "b_button_x.obcc" "skel:skinCluster2.ifcl[3]";
connectAttr "b_trigger_front.obcc" "skel:skinCluster2.ifcl[4]";
connectAttr "b_trigger_grip.obcc" "skel:skinCluster2.ifcl[5]";
connectAttr "b_thumbstick.obcc" "skel:skinCluster2.ifcl[6]";
connectAttr "skel:bindPose1.msg" "skel:skinCluster2.bp";
connectAttr "skel:groupParts4.og" "skel:tweak2.ip[0].ig";
connectAttr "skel:groupId4.id" "skel:tweak2.ip[0].gi";
connectAttr "skel:skinCluster2GroupId.msg" "skel:skinCluster2Set.gn" -na;
connectAttr "controller_plyShape.iog.og[2]" "skel:skinCluster2Set.dsm" -na;
connectAttr "skel:skinCluster2.msg" "skel:skinCluster2Set.ub[0]";
connectAttr "skel:tweak2.og[0]" "skel:skinCluster2GroupParts.ig";
connectAttr "skel:skinCluster2GroupId.id" "skel:skinCluster2GroupParts.gi";
connectAttr "skel:groupId4.msg" "skel:tweakSet2.gn" -na;
connectAttr "controller_plyShape.iog.og[3]" "skel:tweakSet2.dsm" -na;
connectAttr "skel:tweak2.msg" "skel:tweakSet2.ub[0]";
connectAttr "controller_plyShapeOrig.w" "skel:groupParts4.ig";
connectAttr "skel:groupId4.id" "skel:groupParts4.gi";
connectAttr "skel:bcfile.msg" "skel:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "skel:place2dTexture1.msg" "skel:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "skel:controller_plySG.msg" "skel:hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "controller_ply.iog" "GameExport.dsm" -na;
connectAttr "controller_world.iog" "GameExport.dsm" -na;
connectAttr "b_button_menu.iog" "GameExport.dsm" -na;
connectAttr "b_button_y.iog" "GameExport.dsm" -na;
connectAttr "b_button_x.iog" "GameExport.dsm" -na;
connectAttr "b_trigger_front.iog" "GameExport.dsm" -na;
connectAttr "b_trigger_grip.iog" "GameExport.dsm" -na;
connectAttr "b_thumbstick.iog" "GameExport.dsm" -na;
connectAttr "skel:controller_plySG.pa" ":renderPartition.st" -na;
connectAttr "skel:place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "skel:defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "skel:bcfile.msg" ":defaultTextureList1.tx" -na;
// End of controller_l.ma
