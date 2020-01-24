{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 35.0, 85.0, 890.0, 930.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-106",
					"maxclass" : "scope~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 1329.0, 1325.0, 338.0, 169.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-104",
					"logfreq" : 1,
					"maxclass" : "spectroscope~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1320.0, 1560.0, 300.0, 100.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 587.0, 885.0, 55.0, 22.0 ],
					"text" : "zl.slice 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 587.0, 934.0, 72.0, 22.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 476.25, 830.0, 299.0, 22.0 ],
					"text" : "vco_0_120__rate 200 3000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-100",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 666.0, 926.0, 174.0, 22.0 ],
					"text" : "set vco_0_120__rate 200 3000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-82",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 83.5, 990.0, 251.0, 22.0 ],
					"text" : "0 vca_0_122__bias"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-105",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 109.5, 363.0, 69.0, 22.0 ],
					"text" : "clearScene"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-115",
					"linecount" : 21,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ -8.0, 972.0, 50.0, 290.0 ],
					"text" : "client {\\\"cmd\\\":\\\"deltas\\\"\\,\\\"date\\\":1579897732672\\,\\\"data\\\":[{\\\"op\\\":\\\"propchange\\\"\\,\\\"path\\\":\\\"vca_0_122.bias\\\"\\,\\\"name\\\":\\\"value\\\"\\,\\\"from\\\":\\\"0.00\\\"\\,\\\"to\\\":0}]}"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-174",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 987.0, 1560.0, 35.0, 22.0 ],
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-172",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 834.0, 1465.0, 73.0, 22.0 ],
					"text" : "clear_scene"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-88",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 518.0, 1394.0, 149.0, 22.0 ],
					"text" : "vca_0_122__bias 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 498.0, 1329.0, 149.0, 22.0 ],
					"text" : "script delete source_3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-154",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 558.03570556640625, 1027.678466796875, 89.0, 22.0 ],
					"text" : "loadmess clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-153",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 594.642822265625, 1159.8214111328125, 35.0, 22.0 ],
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-125",
					"maxclass" : "dict.view",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 779.0, 358.71429443359375, 390.0, 740.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 824.0, -16.0, 303.0, 640.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-121",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "dictionary" ],
					"patching_rect" : [ 779.0, 326.0, 88.0, 22.0 ],
					"text" : "dict.deserialize"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 20.0,
					"id" : "obj-40",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1080.0, 1770.5, 212.0, 118.0 ],
					"text" : "TODO after lunch:  add propchange: pos to msvr_world.js given a propchange delta from deltaSpoof.js"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-101",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1124.0, 1588.0, 54.0, 22.0 ],
					"text" : "deferlow"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-92",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1124.0, 1564.0, 22.0, 22.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1124.0, 1534.0, 84.0, 22.0 ],
					"text" : "clear, compile"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1021.0, 347.0, 63.0, 22.0 ],
					"text" : "script stop"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-218",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 462.0, 1171.0, 85.0, 22.0 ],
					"text" : "prepend script"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 462.0, 1668.0, 150.0, 33.0 ],
					"text" : "we can ignore the id number assigned by Vive"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 294.5, 1868.0, 79.0, 22.0 ],
					"text" : "prepend quat"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-43",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 294.5, 1784.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-44",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 294.5, 1813.0, 49.0, 22.0 ],
					"text" : "0. $1 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "list", "" ],
					"patching_rect" : [ 294.5, 1841.0, 77.0, 22.0 ],
					"text" : "jit.euler2quat"
				}

			}
, 			{
				"box" : 				{
					"attr" : "reverb_range",
					"id" : "obj-49",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 402.5, 1879.0, 203.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "simple_room_modeling",
					"id" : "obj-57",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 402.5, 1845.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "randomize_reverberation",
					"id" : "obj-24",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 402.5, 1821.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "late_reverberation",
					"id" : "obj-23",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 402.5, 1797.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "int" ],
					"patching_rect" : [ 406.5, 1993.0, 23.0, 118.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "int" ],
					"patching_rect" : [ 381.5, 1993.0, 23.0, 118.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 317.5, 2041.0, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 319.5, 1958.0, 69.0, 22.0 ],
					"text" : "vr.context~"
				}

			}
, 			{
				"box" : 				{
					"attr" : "reverb_wet",
					"id" : "obj-60",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 402.5, 1775.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "hrtf_method",
					"id" : "obj-62",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 561.5, 1845.0, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "position",
					"id" : "obj-75",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 402.5, 1927.0, 270.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 391.5, 1669.0, 55.0, 22.0 ],
					"text" : "zl.slice 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 391.5, 1592.0, 49.0, 22.0 ],
					"text" : "route id"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 940.0, 1909.5, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"attr" : "position",
					"id" : "obj-31",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1088.5, 1433.0, 208.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 628.0, 1481.0, 115.0, 49.0 ],
					"text" : "id 0 quat 0.01 0.530572 0.842002 -0.097093"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-108",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 50.0, 630.5, 103.0, 22.0 ],
					"text" : "buffer~ bucket 20"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-107",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 104.0, 967.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-204",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 340.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-205",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 380.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_120__output_buffer 10 1",
									"varname" : "vca_0_120__output_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-206",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer~ absdiff_0_121__abs-diff_buffer 10 1",
									"varname" : "absdiff_0_121__abs-diff_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-207",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer~ eq_0_122__out1_buffer 10 1",
									"varname" : "eq_0_122__out1_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-208",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-209",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_120__output_buffer 10 1",
									"varname" : "vca_0_120__output_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-210",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ absdiff_0_121__abs-diff_buffer 10 1",
									"varname" : "absdiff_0_121__abs-diff_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-211",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ eq_0_122__out1_buffer 10 1",
									"varname" : "eq_0_122__out1_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-212",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-213",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_120__output_buffer 10 1",
									"varname" : "vca_0_120__output_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-214",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer~ absdiff_0_121__abs-diff_buffer 10 1",
									"varname" : "absdiff_0_121__abs-diff_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-215",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ eq_0_122__out1_buffer 10 1",
									"varname" : "eq_0_122__out1_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-216",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 340.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-217",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 380.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_120__output_buffer 10 1",
									"varname" : "vca_0_120__output_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-218",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer~ absdiff_0_121__abs-diff_buffer 10 1",
									"varname" : "absdiff_0_121__abs-diff_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-219",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer~ eq_0_122__out1_buffer 10 1",
									"varname" : "eq_0_122__out1_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-220",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-221",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_120__output_buffer 10 1",
									"varname" : "vca_0_120__output_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-222",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ absdiff_0_121__abs-diff_buffer 10 1",
									"varname" : "absdiff_0_121__abs-diff_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-223",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ eq_0_122__out1_buffer 10 1",
									"varname" : "eq_0_122__out1_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-224",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-225",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_120__output_buffer 10 1",
									"varname" : "vca_0_120__output_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-226",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ absdiff_0_121__abs-diff_buffer 10 1",
									"varname" : "absdiff_0_121__abs-diff_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-227",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 320.0, 100.0, 0.0 ],
									"text" : "buffer~ eq_0_122__out1_buffer 10 1",
									"varname" : "eq_0_122__out1_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-228",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 360.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-229",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_120__output_buffer 10 1",
									"varname" : "vca_0_120__output_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-230",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer~ absdiff_0_121__abs-diff_buffer 10 1",
									"varname" : "absdiff_0_121__abs-diff_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-231",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer~ eq_0_122__out1_buffer 10 1",
									"varname" : "eq_0_122__out1_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-232",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-233",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_120__output_buffer 10 1",
									"varname" : "vca_0_120__output_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-234",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ absdiff_0_121__abs-diff_buffer 10 1",
									"varname" : "absdiff_0_121__abs-diff_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-235",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ eq_0_122__out1_buffer 10 1",
									"varname" : "eq_0_122__out1_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-236",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-237",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-238",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 340.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-239",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[11]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-240",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[12]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[13]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[14]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[15]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[16]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 360.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[17]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[18]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[19]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[20]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[21]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[22]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 340.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[23]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[24]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[25]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[26]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[27]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[28]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[29]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 360.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[30]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[31]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[32]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[33]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__sine_buffer 10 1",
									"varname" : "vco_0_120__sine_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__phasor_buffer 10 1",
									"varname" : "vco_0_120__phasor_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__triangle_buffer 10 1",
									"varname" : "vco_0_120__triangle_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__saw_buffer 10 1",
									"varname" : "vco_0_120__saw_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[34]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-27",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__sine_buffer 10 1",
									"varname" : "vco_0_120__sine_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__phasor_buffer 10 1",
									"varname" : "vco_0_120__phasor_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-29",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__triangle_buffer 10 1",
									"varname" : "vco_0_120__triangle_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__saw_buffer 10 1",
									"varname" : "vco_0_120__saw_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 320.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[35]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-32",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 360.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__sine_buffer 10 1",
									"varname" : "vco_0_120__sine_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 360.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__phasor_buffer 10 1",
									"varname" : "vco_0_120__phasor_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 360.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__triangle_buffer 10 1",
									"varname" : "vco_0_120__triangle_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 360.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__saw_buffer 10 1",
									"varname" : "vco_0_120__saw_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[36]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__sine_buffer 10 1",
									"varname" : "vco_0_120__sine_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__phasor_buffer 10 1",
									"varname" : "vco_0_120__phasor_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-39",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__triangle_buffer 10 1",
									"varname" : "vco_0_120__triangle_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__saw_buffer 10 1",
									"varname" : "vco_0_120__saw_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[37]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__sine_buffer 10 1",
									"varname" : "vco_0_120__sine_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__phasor_buffer 10 1",
									"varname" : "vco_0_120__phasor_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__triangle_buffer 10 1",
									"varname" : "vco_0_120__triangle_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__saw_buffer 10 1",
									"varname" : "vco_0_120__saw_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[38]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[39]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-48",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__sine_buffer 10 1",
									"varname" : "vco_0_120__sine_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__phasor_buffer 10 1",
									"varname" : "vco_0_120__phasor_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__triangle_buffer 10 1",
									"varname" : "vco_0_120__triangle_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__saw_buffer 10 1",
									"varname" : "vco_0_120__saw_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-52",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__sine_buffer 10 1",
									"varname" : "vco_0_121__sine_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-53",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__phasor_buffer 10 1",
									"varname" : "vco_0_121__phasor_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__triangle_buffer 10 1",
									"varname" : "vco_0_121__triangle_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-55",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__saw_buffer 10 1",
									"varname" : "vco_0_121__saw_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__sine_buffer 10 1",
									"varname" : "vco_0_122__sine_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__phasor_buffer 10 1",
									"varname" : "vco_0_122__phasor_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-58",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__triangle_buffer 10 1",
									"varname" : "vco_0_122__triangle_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-59",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__saw_buffer 10 1",
									"varname" : "vco_0_122__saw_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-60",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__sine_buffer 10 1",
									"varname" : "vco_0_123__sine_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-61",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__phasor_buffer 10 1",
									"varname" : "vco_0_123__phasor_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__triangle_buffer 10 1",
									"varname" : "vco_0_123__triangle_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-63",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__saw_buffer 10 1",
									"varname" : "vco_0_123__saw_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-64",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_124__sine_buffer 10 1",
									"varname" : "vco_0_124__sine_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-65",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_124__phasor_buffer 10 1",
									"varname" : "vco_0_124__phasor_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-66",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_124__triangle_buffer 10 1",
									"varname" : "vco_0_124__triangle_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-67",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_124__saw_buffer 10 1",
									"varname" : "vco_0_124__saw_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-68",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_125__sine_buffer 10 1",
									"varname" : "vco_0_125__sine_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-69",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_125__phasor_buffer 10 1",
									"varname" : "vco_0_125__phasor_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-70",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_125__triangle_buffer 10 1",
									"varname" : "vco_0_125__triangle_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-71",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_125__saw_buffer 10 1",
									"varname" : "vco_0_125__saw_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-72",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_126__sine_buffer 10 1",
									"varname" : "vco_0_126__sine_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_126__phasor_buffer 10 1",
									"varname" : "vco_0_126__phasor_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-74",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_126__triangle_buffer 10 1",
									"varname" : "vco_0_126__triangle_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-75",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_126__saw_buffer 10 1",
									"varname" : "vco_0_126__saw_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-76",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[40]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-77",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__sine_buffer 10 1",
									"varname" : "vco_0_120__sine_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-78",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__phasor_buffer 10 1",
									"varname" : "vco_0_120__phasor_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-79",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__triangle_buffer 10 1",
									"varname" : "vco_0_120__triangle_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-80",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__saw_buffer 10 1",
									"varname" : "vco_0_120__saw_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-81",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__sine_buffer 10 1",
									"varname" : "vco_0_121__sine_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-82",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__phasor_buffer 10 1",
									"varname" : "vco_0_121__phasor_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-83",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__triangle_buffer 10 1",
									"varname" : "vco_0_121__triangle_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-84",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__saw_buffer 10 1",
									"varname" : "vco_0_121__saw_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-85",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__sine_buffer 10 1",
									"varname" : "vco_0_122__sine_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-86",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__phasor_buffer 10 1",
									"varname" : "vco_0_122__phasor_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-87",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__triangle_buffer 10 1",
									"varname" : "vco_0_122__triangle_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-88",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__saw_buffer 10 1",
									"varname" : "vco_0_122__saw_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-89",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__sine_buffer 10 1",
									"varname" : "vco_0_123__sine_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-90",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__phasor_buffer 10 1",
									"varname" : "vco_0_123__phasor_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-91",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__triangle_buffer 10 1",
									"varname" : "vco_0_123__triangle_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-92",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__saw_buffer 10 1",
									"varname" : "vco_0_123__saw_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-93",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[41]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-94",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__sine_buffer 10 1",
									"varname" : "vco_0_120__sine_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-95",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__phasor_buffer 10 1",
									"varname" : "vco_0_120__phasor_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-96",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__triangle_buffer 10 1",
									"varname" : "vco_0_120__triangle_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-97",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__saw_buffer 10 1",
									"varname" : "vco_0_120__saw_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-98",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__sine_buffer 10 1",
									"varname" : "vco_0_121__sine_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-99",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__phasor_buffer 10 1",
									"varname" : "vco_0_121__phasor_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-100",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__triangle_buffer 10 1",
									"varname" : "vco_0_121__triangle_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-101",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__saw_buffer 10 1",
									"varname" : "vco_0_121__saw_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-102",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__sine_buffer 10 1",
									"varname" : "vco_0_122__sine_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-103",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__phasor_buffer 10 1",
									"varname" : "vco_0_122__phasor_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-104",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__triangle_buffer 10 1",
									"varname" : "vco_0_122__triangle_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-105",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__saw_buffer 10 1",
									"varname" : "vco_0_122__saw_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-106",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 380.0, 100.0, 0.0 ],
									"text" : "buffer~ noise_0__out_buffer 10 1",
									"varname" : "noise_0__out_buffer_varname[42]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-107",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__sine_buffer 10 1",
									"varname" : "vco_0_120__sine_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-108",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__phasor_buffer 10 1",
									"varname" : "vco_0_120__phasor_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-109",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__triangle_buffer 10 1",
									"varname" : "vco_0_120__triangle_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-110",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_120__saw_buffer 10 1",
									"varname" : "vco_0_120__saw_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-111",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__sine_buffer 10 1",
									"varname" : "vco_0_121__sine_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-112",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__phasor_buffer 10 1",
									"varname" : "vco_0_121__phasor_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-113",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__triangle_buffer 10 1",
									"varname" : "vco_0_121__triangle_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-114",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_121__saw_buffer 10 1",
									"varname" : "vco_0_121__saw_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-115",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__sine_buffer 10 1",
									"varname" : "vco_0_122__sine_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-116",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__phasor_buffer 10 1",
									"varname" : "vco_0_122__phasor_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-117",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__triangle_buffer 10 1",
									"varname" : "vco_0_122__triangle_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-118",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_122__saw_buffer 10 1",
									"varname" : "vco_0_122__saw_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-119",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_120__output_buffer 10 1",
									"varname" : "vca_0_120__output_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-120",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ resofilter_0_121__lopass_buffer 10 1",
									"varname" : "resofilter_0_121__lopass_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-121",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ resofilter_0_121__hipass_buffer 10 1",
									"varname" : "resofilter_0_121__hipass_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-122",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ freevoib_0_122__out_buffer 10 1",
									"varname" : "freevoib_0_122__out_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-123",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__sine_buffer 10 1",
									"varname" : "vco_0_123__sine_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-124",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__phasor_buffer 10 1",
									"varname" : "vco_0_123__phasor_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-125",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__triangle_buffer 10 1",
									"varname" : "vco_0_123__triangle_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-126",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__saw_buffer 10 1",
									"varname" : "vco_0_123__saw_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-127",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__sine_buffer 10 1",
									"varname" : "lfo_0_124__sine_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-128",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__phasor_buffer 10 1",
									"varname" : "lfo_0_124__phasor_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-129",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__pulse_buffer 10 1",
									"varname" : "lfo_0_124__pulse_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-130",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__sine_index_buffer 10 1",
									"varname" : "lfo_0_124__sine_index_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-131",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__saw_buffer 10 1",
									"varname" : "lfo_0_124__saw_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-132",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_120__output_buffer 10 1",
									"varname" : "vca_0_120__output_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-133",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ resofilter_0_121__lopass_buffer 10 1",
									"varname" : "resofilter_0_121__lopass_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-134",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ resofilter_0_121__hipass_buffer 10 1",
									"varname" : "resofilter_0_121__hipass_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-135",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ freevoib_0_122__out_buffer 10 1",
									"varname" : "freevoib_0_122__out_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-136",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__sine_buffer 10 1",
									"varname" : "vco_0_123__sine_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-137",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__phasor_buffer 10 1",
									"varname" : "vco_0_123__phasor_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-138",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__triangle_buffer 10 1",
									"varname" : "vco_0_123__triangle_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-139",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__saw_buffer 10 1",
									"varname" : "vco_0_123__saw_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-140",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__sine_buffer 10 1",
									"varname" : "lfo_0_124__sine_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-141",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__phasor_buffer 10 1",
									"varname" : "lfo_0_124__phasor_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-142",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__pulse_buffer 10 1",
									"varname" : "lfo_0_124__pulse_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-143",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__sine_index_buffer 10 1",
									"varname" : "lfo_0_124__sine_index_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-144",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__saw_buffer 10 1",
									"varname" : "lfo_0_124__saw_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-145",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_120__output_buffer 10 1",
									"varname" : "vca_0_120__output_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-146",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ resofilter_0_121__lopass_buffer 10 1",
									"varname" : "resofilter_0_121__lopass_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-147",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ resofilter_0_121__hipass_buffer 10 1",
									"varname" : "resofilter_0_121__hipass_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-148",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ freevoib_0_122__out_buffer 10 1",
									"varname" : "freevoib_0_122__out_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-149",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__sine_buffer 10 1",
									"varname" : "vco_0_123__sine_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-150",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__phasor_buffer 10 1",
									"varname" : "vco_0_123__phasor_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-151",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__triangle_buffer 10 1",
									"varname" : "vco_0_123__triangle_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-152",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__saw_buffer 10 1",
									"varname" : "vco_0_123__saw_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-153",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__sine_buffer 10 1",
									"varname" : "lfo_0_124__sine_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-154",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__phasor_buffer 10 1",
									"varname" : "lfo_0_124__phasor_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-155",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__pulse_buffer 10 1",
									"varname" : "lfo_0_124__pulse_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-156",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__sine_index_buffer 10 1",
									"varname" : "lfo_0_124__sine_index_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-157",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__saw_buffer 10 1",
									"varname" : "lfo_0_124__saw_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-158",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_120__output_buffer 10 1",
									"varname" : "vca_0_120__output_buffer_varname[11]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-159",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer~ resofilter_0_121__lopass_buffer 10 1",
									"varname" : "resofilter_0_121__lopass_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-160",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer~ resofilter_0_121__hipass_buffer 10 1",
									"varname" : "resofilter_0_121__hipass_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-161",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ freevoib_0_122__out_buffer 10 1",
									"varname" : "freevoib_0_122__out_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-162",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__sine_buffer 10 1",
									"varname" : "vco_0_123__sine_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-163",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__phasor_buffer 10 1",
									"varname" : "vco_0_123__phasor_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-164",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__triangle_buffer 10 1",
									"varname" : "vco_0_123__triangle_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-165",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__saw_buffer 10 1",
									"varname" : "vco_0_123__saw_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-166",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__sine_buffer 10 1",
									"varname" : "lfo_0_124__sine_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-167",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__phasor_buffer 10 1",
									"varname" : "lfo_0_124__phasor_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-168",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__pulse_buffer 10 1",
									"varname" : "lfo_0_124__pulse_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-169",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__sine_index_buffer 10 1",
									"varname" : "lfo_0_124__sine_index_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-170",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__saw_buffer 10 1",
									"varname" : "lfo_0_124__saw_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-171",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ knob_2__out_buffer 10 1",
									"varname" : "knob_2__out_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-172",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer~ cycle_0__out_buffer 10 1",
									"varname" : "cycle_0__out_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-173",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ knob_2__out_buffer 10 1",
									"varname" : "knob_2__out_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-174",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer~ cycle_0__out_buffer 10 1",
									"varname" : "cycle_0__out_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-175",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ mul_0_120__product_buffer 10 1",
									"varname" : "mul_0_120__product_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-176",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__sine_buffer 10 1",
									"varname" : "lfo_0_121__sine_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-177",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__phasor_buffer 10 1",
									"varname" : "lfo_0_121__phasor_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-178",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__pulse_buffer 10 1",
									"varname" : "lfo_0_121__pulse_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-179",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__sine_index_buffer 10 1",
									"varname" : "lfo_0_121__sine_index_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-180",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__saw_buffer 10 1",
									"varname" : "lfo_0_121__saw_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-181",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_122__output_buffer 10 1",
									"varname" : "vca_0_122__output_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-182",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__sine_buffer 10 1",
									"varname" : "vco_0_123__sine_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-183",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__phasor_buffer 10 1",
									"varname" : "vco_0_123__phasor_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-184",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__triangle_buffer 10 1",
									"varname" : "vco_0_123__triangle_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-185",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__saw_buffer 10 1",
									"varname" : "vco_0_123__saw_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-186",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer~ knob_2__out_buffer 10 1",
									"varname" : "knob_2__out_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-187",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ cycle_0__out_buffer 10 1",
									"varname" : "cycle_0__out_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-188",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ mul_0_120__product_buffer 10 1",
									"varname" : "mul_0_120__product_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-189",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__sine_buffer 10 1",
									"varname" : "lfo_0_121__sine_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-190",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__phasor_buffer 10 1",
									"varname" : "lfo_0_121__phasor_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-191",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__pulse_buffer 10 1",
									"varname" : "lfo_0_121__pulse_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-192",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__sine_index_buffer 10 1",
									"varname" : "lfo_0_121__sine_index_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-193",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__saw_buffer 10 1",
									"varname" : "lfo_0_121__saw_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-194",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_122__output_buffer 10 1",
									"varname" : "vca_0_122__output_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-195",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__sine_buffer 10 1",
									"varname" : "vco_0_123__sine_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-196",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__phasor_buffer 10 1",
									"varname" : "vco_0_123__phasor_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-197",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__triangle_buffer 10 1",
									"varname" : "vco_0_123__triangle_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-198",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__saw_buffer 10 1",
									"varname" : "vco_0_123__saw_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-199",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer~ knob_2__out_buffer 10 1",
									"varname" : "knob_2__out_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-200",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer~ cycle_0__out_buffer 10 1",
									"varname" : "cycle_0__out_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-201",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer~ mul_0_120__product_buffer 10 1",
									"varname" : "mul_0_120__product_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-202",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__sine_buffer 10 1",
									"varname" : "lfo_0_121__sine_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-203",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__phasor_buffer 10 1",
									"varname" : "lfo_0_121__phasor_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-241",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__pulse_buffer 10 1",
									"varname" : "lfo_0_121__pulse_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-242",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__sine_index_buffer 10 1",
									"varname" : "lfo_0_121__sine_index_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-243",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__saw_buffer 10 1",
									"varname" : "lfo_0_121__saw_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-244",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_122__output_buffer 10 1",
									"varname" : "vca_0_122__output_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-245",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__sine_buffer 10 1",
									"varname" : "vco_0_123__sine_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-246",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__phasor_buffer 10 1",
									"varname" : "vco_0_123__phasor_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-247",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__triangle_buffer 10 1",
									"varname" : "vco_0_123__triangle_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-248",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__saw_buffer 10 1",
									"varname" : "vco_0_123__saw_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-249",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer~ knob_2__out_buffer 10 1",
									"varname" : "knob_2__out_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-250",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer~ cycle_0__out_buffer 10 1",
									"varname" : "cycle_0__out_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-251",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer~ mul_0_120__product_buffer 10 1",
									"varname" : "mul_0_120__product_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-252",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__sine_buffer 10 1",
									"varname" : "lfo_0_121__sine_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-253",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__phasor_buffer 10 1",
									"varname" : "lfo_0_121__phasor_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-254",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__pulse_buffer 10 1",
									"varname" : "lfo_0_121__pulse_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-255",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__sine_index_buffer 10 1",
									"varname" : "lfo_0_121__sine_index_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-256",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_121__saw_buffer 10 1",
									"varname" : "lfo_0_121__saw_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-257",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer~ vca_0_122__output_buffer 10 1",
									"varname" : "vca_0_122__output_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-258",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__sine_buffer 10 1",
									"varname" : "vco_0_123__sine_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-259",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__phasor_buffer 10 1",
									"varname" : "vco_0_123__phasor_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-260",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__triangle_buffer 10 1",
									"varname" : "vco_0_123__triangle_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-261",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer~ vco_0_123__saw_buffer 10 1",
									"varname" : "vco_0_123__saw_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-262",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__sine_buffer 10 1",
									"varname" : "lfo_0_124__sine_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-263",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__phasor_buffer 10 1",
									"varname" : "lfo_0_124__phasor_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-264",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__pulse_buffer 10 1",
									"varname" : "lfo_0_124__pulse_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-265",
									"linecount" : 4,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__sine_index_buffer 10 1",
									"varname" : "lfo_0_124__sine_index_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-266",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 50.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer~ lfo_0_124__saw_buffer 10 1",
									"varname" : "lfo_0_124__saw_buffer_varname[4]"
								}

							}
 ],
						"lines" : [  ]
					}
,
					"patching_rect" : [ 50.0, 607.0, 91.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p bufferStorage",
					"varname" : "bufferStorage"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-95",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 43.5, 741.0, 63.0, 22.0 ],
					"text" : "getBuffers"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-146",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 895.0, 695.5, 70.0, 22.0 ],
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-145",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 864.0, 813.0, 29.5, 22.0 ],
					"text" : "i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-136",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 864.0, 853.0, 29.5, 22.0 ],
					"text" : "* 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-133",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"patching_rect" : [ 895.25, 776.295745999999895, 29.5, 22.0 ],
					"text" : "t b f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-129",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 895.25, 747.0, 39.0, 22.0 ],
					"text" : "/ 100."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-128",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 662.0, 150.0, 33.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 540.0, 490.0, 198.0, 33.0 ],
					"text" : "VR Buffer OP Resolution (% of Sample Rate)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-123",
					"maxclass" : "number",
					"maximum" : 100,
					"minimum" : 1,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 895.0, 721.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 491.0, 490.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-120",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 486.5, 595.0, 119.0, 22.0 ],
					"text" : "metro 100 @active 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-118",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 564.5, 677.747589000000062, 22.0, 22.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-117",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 564.5, 651.0, 48.0, 22.0 ],
					"text" : "change"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 486.5, 619.0, 97.0, 23.0 ],
					"text" : "adstatus switch"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 351.0, 868.0, 117.0, 22.0 ],
					"text" : "pack visualize %i %i"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-97",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 564.5, 702.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"bubble" : 1,
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-89",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 643.5, 784.5, 166.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 572.0, 439.5, 166.0, 25.0 ],
					"text" : "choose a sampling rate"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-93",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 655.5, 756.5, 55.0, 23.0 ],
					"triangle" : 0,
					"triscale" : 0.9
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-94",
					"items" : [ 11025, ",", 12000, ",", 16000, ",", 22050, ",", 24000, ",", 32000, ",", 44100, ",", 48000, ",", 88200, ",", 96000, ",", 192000 ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 564.5, 786.5, 78.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 491.0, 439.5, 78.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 564.5, 731.295745999999895, 110.0, 23.0 ],
					"text" : "adstatus sr"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 351.0, 765.0, 24.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 491.0, 542.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 351.0, 794.0, 63.0, 22.0 ],
					"text" : "metro 500"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-25",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 351.0, 821.0, 55.0, 22.0 ],
					"text" : "visualize"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 6,
					"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "dsp.gen",
						"rect" : [ 109.0, 154.0, 1242.0, 450.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-33",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 558.0, 323.0, 35.0, 22.0 ],
									"text" : "out 6"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 470.0, 323.0, 35.0, 22.0 ],
									"text" : "out 5"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-31",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 384.0, 323.0, 35.0, 22.0 ],
									"text" : "out 4"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 300.0, 323.0, 35.0, 22.0 ],
									"text" : "out 3"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 188.0, 323.0, 35.0, 22.0 ],
									"text" : "out 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 106.0, 323.0, 35.0, 22.0 ],
									"text" : "out 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 188.0, 153.0, 73.0, 22.0 ],
									"text" : "param c1Pz"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 106.0, 153.0, 73.0, 22.0 ],
									"text" : "param c1Py"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 24.0, 126.0, 150.0, 20.0 ],
									"text" : "controller 1 position xyz"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 24.0, 153.0, 73.0, 22.0 ],
									"text" : "param c1Px"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 394.0, 121.0, 150.0, 20.0 ],
									"text" : "controller 1 orient xyzw"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 558.0, 153.0, 77.0, 22.0 ],
									"text" : "param c1Ow"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 470.0, 153.0, 74.0, 22.0 ],
									"text" : "param c1Oz"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 384.0, 153.0, 74.0, 22.0 ],
									"text" : "param c1Oy"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 300.0, 153.0, 74.0, 22.0 ],
									"text" : "param c1Ox"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 24.0, 323.0, 35.0, 22.0 ],
									"text" : "out 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 110.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 120.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_1__rate"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 90.0, 100.0, 0.0 ],
									"text" : "param lfo_1__rate 0.63",
									"varname" : "lfo_1__rate"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 120.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_1__index"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 90.0, 100.0, 0.0 ],
									"text" : "param lfo_1__index 1",
									"varname" : "lfo_1__index"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 120.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_1__pulse_width"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 90.0, 100.0, 0.0 ],
									"text" : "param lfo_1__pulse_width 0.25",
									"varname" : "lfo_1__pulse_width"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 120.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_1__onset"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 90.0, 100.0, 0.0 ],
									"text" : "param lfo_1__onset 0",
									"varname" : "lfo_1__onset"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 120.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__sine_buffer",
									"varname" : "poke_126"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__sine_buffer",
									"varname" : "lfo_1__sine_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 120.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__phasor_buffer",
									"varname" : "poke_127"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__phasor_buffer",
									"varname" : "lfo_1__phasor_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-24",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 120.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__pulse_buffer",
									"varname" : "poke_128"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-25",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__pulse_buffer",
									"varname" : "lfo_1__pulse_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-26",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 120.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 130.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_2__rate"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 97.0, 100.0, 0.0 ],
									"text" : "param lfo_2__rate 1",
									"varname" : "lfo_2__rate"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 130.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_2__index"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 97.0, 100.0, 0.0 ],
									"text" : "param lfo_2__index 10",
									"varname" : "lfo_2__index"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 130.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_2__pulse_width"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 97.0, 100.0, 0.0 ],
									"text" : "param lfo_2__pulse_width 0.25",
									"varname" : "lfo_2__pulse_width"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 130.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_2__onset"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-40",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 97.0, 100.0, 0.0 ],
									"text" : "param lfo_2__onset 0",
									"varname" : "lfo_2__onset"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 130.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__sine_buffer",
									"varname" : "poke_129"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-42",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__sine_buffer",
									"varname" : "lfo_2__sine_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-43",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 130.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__phasor_buffer",
									"varname" : "poke_130"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__phasor_buffer",
									"varname" : "lfo_2__phasor_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 130.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__pulse_buffer",
									"varname" : "poke_131"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-46",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__pulse_buffer",
									"varname" : "lfo_2__pulse_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 125.0, 130.0, 100.0, 0.0 ],
									"text" : "ffmvco",
									"varname" : "ffmvco_1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-48",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_rate",
									"varname" : "setparam_ffmvco_1__vco_1_rate"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-49",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_rate 120",
									"varname" : "ffmvco_1__vco_1_rate"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-50",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_waveform",
									"varname" : "setparam_ffmvco_1__vco_1_waveform"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-51",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_waveform 0",
									"varname" : "ffmvco_1__vco_1_waveform"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-52",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_rate",
									"varname" : "setparam_ffmvco_1__vco_2_rate"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-53",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_rate 3",
									"varname" : "ffmvco_1__vco_2_rate"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-54",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_waveform",
									"varname" : "setparam_ffmvco_1__vco_2_waveform"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-55",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_waveform 0",
									"varname" : "ffmvco_1__vco_2_waveform"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam feedback",
									"varname" : "setparam_ffmvco_1__feedback"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-57",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__feedback 0.25",
									"varname" : "ffmvco_1__feedback"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-58",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 140.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_1_buffer",
									"varname" : "poke_132"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-59",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_1_buffer",
									"varname" : "ffmvco_1__vco_1_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-60",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 140.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_2_buffer",
									"varname" : "poke_133"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-61",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_2_buffer",
									"varname" : "ffmvco_1__vco_2_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-62",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 140.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__master_buffer",
									"varname" : "poke_134"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-63",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__master_buffer",
									"varname" : "ffmvco_1__master_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-64",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 140.0, 100.0, 0.0 ],
									"text" : "vca",
									"varname" : "vca_1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-65",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam cv_amount",
									"varname" : "setparam_vca_1__cv_amount"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-66",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param vca_1__cv_amount 0.5",
									"varname" : "vca_1__cv_amount"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-67",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam bias",
									"varname" : "setparam_vca_1__bias"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-68",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param vca_1__bias 0.5",
									"varname" : "vca_1__bias"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-69",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 150.0, 100.0, 0.0 ],
									"text" : "poke vca_1__output_buffer",
									"varname" : "poke_135"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-70",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer vca_1__output_buffer",
									"varname" : "vca_1__output_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-71",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 150.0, 100.0, 0.0 ],
									"text" : "comparator",
									"varname" : "comparator_1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-72",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 160.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__max_buffer",
									"varname" : "poke_136"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-73",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 320.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__max_buffer",
									"varname" : "comparator_1__max_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-74",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 160.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__min_buffer",
									"varname" : "poke_137"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-75",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 320.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__min_buffer",
									"varname" : "comparator_1__min_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-76",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 160.0, 100.0, 0.0 ],
									"text" : "speaker",
									"varname" : "speaker_1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-77",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 170.0, 100.0, 0.0 ],
									"text" : "setparam volume",
									"varname" : "setparam_speaker_1__volume"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-78",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 127.0, 100.0, 0.0 ],
									"text" : "param speaker_1__volume 0.25",
									"varname" : "speaker_1__volume"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-79",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 170.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__left_buffer",
									"varname" : "poke_138"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-80",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 340.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__left_buffer",
									"varname" : "speaker_1__left_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-81",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 170.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__right_buffer",
									"varname" : "poke_139"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-82",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 340.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__right_buffer",
									"varname" : "speaker_1__right_buffer_varname"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-83",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 180.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_1[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-84",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 190.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_1__rate[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-85",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 142.0, 100.0, 0.0 ],
									"text" : "param lfo_1__rate 0.63",
									"varname" : "lfo_1__rate[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-86",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 190.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_1__index[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-87",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 142.0, 100.0, 0.0 ],
									"text" : "param lfo_1__index 1",
									"varname" : "lfo_1__index[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-88",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 190.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_1__pulse_width[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-89",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 142.0, 100.0, 0.0 ],
									"text" : "param lfo_1__pulse_width 0.25",
									"varname" : "lfo_1__pulse_width[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-90",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 190.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_1__onset[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-91",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 142.0, 100.0, 0.0 ],
									"text" : "param lfo_1__onset 0",
									"varname" : "lfo_1__onset[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-92",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 190.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__sine_buffer",
									"varname" : "poke_140"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-93",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 380.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__sine_buffer",
									"varname" : "lfo_1__sine_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-94",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 190.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__phasor_buffer",
									"varname" : "poke_141"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-95",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 380.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__phasor_buffer",
									"varname" : "lfo_1__phasor_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-96",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 190.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__pulse_buffer",
									"varname" : "poke_142"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-97",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 380.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__pulse_buffer",
									"varname" : "lfo_1__pulse_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-98",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 190.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_2[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-99",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 200.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_2__rate[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-100",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 150.0, 100.0, 0.0 ],
									"text" : "param lfo_2__rate 1",
									"varname" : "lfo_2__rate[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-101",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 200.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_2__index[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-102",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 150.0, 100.0, 0.0 ],
									"text" : "param lfo_2__index 10",
									"varname" : "lfo_2__index[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-103",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 200.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_2__pulse_width[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-104",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 150.0, 100.0, 0.0 ],
									"text" : "param lfo_2__pulse_width 0.25",
									"varname" : "lfo_2__pulse_width[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-105",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 200.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_2__onset[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-106",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 150.0, 100.0, 0.0 ],
									"text" : "param lfo_2__onset 0",
									"varname" : "lfo_2__onset[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-107",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 200.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__sine_buffer",
									"varname" : "poke_143"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-108",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__sine_buffer",
									"varname" : "lfo_2__sine_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-109",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 200.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__phasor_buffer",
									"varname" : "poke_144"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-110",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__phasor_buffer",
									"varname" : "lfo_2__phasor_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-111",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 200.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__pulse_buffer",
									"varname" : "poke_145"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-112",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__pulse_buffer",
									"varname" : "lfo_2__pulse_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-113",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 125.0, 200.0, 100.0, 0.0 ],
									"text" : "ffmvco",
									"varname" : "ffmvco_1[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-114",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_rate",
									"varname" : "setparam_ffmvco_1__vco_1_rate[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-115",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_rate 120",
									"varname" : "ffmvco_1__vco_1_rate[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-116",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_waveform",
									"varname" : "setparam_ffmvco_1__vco_1_waveform[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-117",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_waveform 0",
									"varname" : "ffmvco_1__vco_1_waveform[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-118",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_rate",
									"varname" : "setparam_ffmvco_1__vco_2_rate[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-119",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_rate 3",
									"varname" : "ffmvco_1__vco_2_rate[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-120",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_waveform",
									"varname" : "setparam_ffmvco_1__vco_2_waveform[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-121",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_waveform 0",
									"varname" : "ffmvco_1__vco_2_waveform[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-122",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam feedback",
									"varname" : "setparam_ffmvco_1__feedback[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-123",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__feedback 0.25",
									"varname" : "ffmvco_1__feedback[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-124",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 210.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_1_buffer",
									"varname" : "poke_146"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-125",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_1_buffer",
									"varname" : "ffmvco_1__vco_1_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-126",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 210.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_2_buffer",
									"varname" : "poke_147"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-127",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_2_buffer",
									"varname" : "ffmvco_1__vco_2_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-128",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 210.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__master_buffer",
									"varname" : "poke_148"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-129",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__master_buffer",
									"varname" : "ffmvco_1__master_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-130",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 210.0, 100.0, 0.0 ],
									"text" : "vca",
									"varname" : "vca_1[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-131",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam cv_amount",
									"varname" : "setparam_vca_1__cv_amount[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-132",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param vca_1__cv_amount 0.5",
									"varname" : "vca_1__cv_amount[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-133",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam bias",
									"varname" : "setparam_vca_1__bias[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-134",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param vca_1__bias 0.5",
									"varname" : "vca_1__bias[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-135",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 220.0, 100.0, 0.0 ],
									"text" : "poke vca_1__output_buffer",
									"varname" : "poke_149"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-136",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer vca_1__output_buffer",
									"varname" : "vca_1__output_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-137",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 220.0, 100.0, 0.0 ],
									"text" : "comparator",
									"varname" : "comparator_1[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-138",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 30.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__max_buffer",
									"varname" : "poke_150"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-139",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__max_buffer",
									"varname" : "comparator_1__max_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-140",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 30.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__min_buffer",
									"varname" : "poke_151"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-141",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__min_buffer",
									"varname" : "comparator_1__min_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-142",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 30.0, 100.0, 0.0 ],
									"text" : "speaker",
									"varname" : "speaker_1[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-143",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 40.0, 100.0, 0.0 ],
									"text" : "setparam volume",
									"varname" : "setparam_speaker_1__volume[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-144",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 30.0, 100.0, 0.0 ],
									"text" : "param speaker_1__volume 0.25",
									"varname" : "speaker_1__volume[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-145",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 40.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__left_buffer",
									"varname" : "poke_152"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-146",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__left_buffer",
									"varname" : "speaker_1__left_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-147",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 40.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__right_buffer",
									"varname" : "poke_153"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-148",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__right_buffer",
									"varname" : "speaker_1__right_buffer_varname[1]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-149",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 50.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_1[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-150",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 60.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_1__rate[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-151",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 45.0, 100.0, 0.0 ],
									"text" : "param lfo_1__rate 0.63",
									"varname" : "lfo_1__rate[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-152",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 60.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_1__index[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-153",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 45.0, 100.0, 0.0 ],
									"text" : "param lfo_1__index 1",
									"varname" : "lfo_1__index[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-154",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 60.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_1__pulse_width[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-155",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 45.0, 100.0, 0.0 ],
									"text" : "param lfo_1__pulse_width 0.25",
									"varname" : "lfo_1__pulse_width[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-156",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 60.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_1__onset[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-157",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 45.0, 100.0, 0.0 ],
									"text" : "param lfo_1__onset 0",
									"varname" : "lfo_1__onset[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-158",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 60.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__sine_buffer",
									"varname" : "poke_154"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-159",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__sine_buffer",
									"varname" : "lfo_1__sine_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-160",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 60.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__phasor_buffer",
									"varname" : "poke_155"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-161",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__phasor_buffer",
									"varname" : "lfo_1__phasor_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-162",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 60.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__pulse_buffer",
									"varname" : "poke_156"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-163",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__pulse_buffer",
									"varname" : "lfo_1__pulse_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-164",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 60.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_2[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-165",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 70.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_2__rate[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-166",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 52.0, 100.0, 0.0 ],
									"text" : "param lfo_2__rate 1",
									"varname" : "lfo_2__rate[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-167",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 70.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_2__index[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-168",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 52.0, 100.0, 0.0 ],
									"text" : "param lfo_2__index 10",
									"varname" : "lfo_2__index[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-169",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 70.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_2__pulse_width[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-170",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 52.0, 100.0, 0.0 ],
									"text" : "param lfo_2__pulse_width 0.25",
									"varname" : "lfo_2__pulse_width[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-171",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 70.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_2__onset[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-172",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 52.0, 100.0, 0.0 ],
									"text" : "param lfo_2__onset 0",
									"varname" : "lfo_2__onset[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-173",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 70.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__sine_buffer",
									"varname" : "poke_157"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-174",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__sine_buffer",
									"varname" : "lfo_2__sine_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-175",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 70.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__phasor_buffer",
									"varname" : "poke_158"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-176",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__phasor_buffer",
									"varname" : "lfo_2__phasor_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-177",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 70.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__pulse_buffer",
									"varname" : "poke_159"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-178",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__pulse_buffer",
									"varname" : "lfo_2__pulse_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-179",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 125.0, 70.0, 100.0, 0.0 ],
									"text" : "ffmvco",
									"varname" : "ffmvco_1[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-180",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_rate",
									"varname" : "setparam_ffmvco_1__vco_1_rate[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-181",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_rate 120",
									"varname" : "ffmvco_1__vco_1_rate[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-182",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_waveform",
									"varname" : "setparam_ffmvco_1__vco_1_waveform[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-183",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_waveform 0",
									"varname" : "ffmvco_1__vco_1_waveform[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-184",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_rate",
									"varname" : "setparam_ffmvco_1__vco_2_rate[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-185",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_rate 3",
									"varname" : "ffmvco_1__vco_2_rate[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-186",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_waveform",
									"varname" : "setparam_ffmvco_1__vco_2_waveform[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-187",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_waveform 0",
									"varname" : "ffmvco_1__vco_2_waveform[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-188",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam feedback",
									"varname" : "setparam_ffmvco_1__feedback[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-189",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__feedback 0.25",
									"varname" : "ffmvco_1__feedback[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-190",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 80.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_1_buffer",
									"varname" : "poke_160"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-191",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_1_buffer",
									"varname" : "ffmvco_1__vco_1_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-192",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 80.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_2_buffer",
									"varname" : "poke_161"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-193",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_2_buffer",
									"varname" : "ffmvco_1__vco_2_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-194",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 80.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__master_buffer",
									"varname" : "poke_162"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-195",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__master_buffer",
									"varname" : "ffmvco_1__master_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-196",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 80.0, 100.0, 0.0 ],
									"text" : "vca",
									"varname" : "vca_1[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-197",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 90.0, 100.0, 0.0 ],
									"text" : "setparam cv_amount",
									"varname" : "setparam_vca_1__cv_amount[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-198",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 67.0, 100.0, 0.0 ],
									"text" : "param vca_1__cv_amount 0.5",
									"varname" : "vca_1__cv_amount[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-199",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 90.0, 100.0, 0.0 ],
									"text" : "setparam bias",
									"varname" : "setparam_vca_1__bias[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-200",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 67.0, 100.0, 0.0 ],
									"text" : "param vca_1__bias 0.5",
									"varname" : "vca_1__bias[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-201",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 90.0, 100.0, 0.0 ],
									"text" : "poke vca_1__output_buffer",
									"varname" : "poke_163"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-202",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer vca_1__output_buffer",
									"varname" : "vca_1__output_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-203",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 90.0, 100.0, 0.0 ],
									"text" : "comparator",
									"varname" : "comparator_1[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-204",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 100.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__max_buffer",
									"varname" : "poke_164"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-205",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__max_buffer",
									"varname" : "comparator_1__max_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-206",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 100.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__min_buffer",
									"varname" : "poke_165"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-207",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__min_buffer",
									"varname" : "comparator_1__min_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-208",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 100.0, 100.0, 0.0 ],
									"text" : "speaker",
									"varname" : "speaker_1[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-209",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 110.0, 100.0, 0.0 ],
									"text" : "setparam volume",
									"varname" : "setparam_speaker_1__volume[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-210",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 82.0, 100.0, 0.0 ],
									"text" : "param speaker_1__volume 0.25",
									"varname" : "speaker_1__volume[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-211",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 110.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__left_buffer",
									"varname" : "poke_166"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-212",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__left_buffer",
									"varname" : "speaker_1__left_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-213",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 110.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__right_buffer",
									"varname" : "poke_167"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-214",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__right_buffer",
									"varname" : "speaker_1__right_buffer_varname[2]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-215",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 120.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_1[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-216",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 130.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_1__rate[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-217",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 97.0, 100.0, 0.0 ],
									"text" : "param lfo_1__rate 0.63",
									"varname" : "lfo_1__rate[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-218",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 130.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_1__index[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-219",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 97.0, 100.0, 0.0 ],
									"text" : "param lfo_1__index 1",
									"varname" : "lfo_1__index[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-220",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 130.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_1__pulse_width[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-221",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 97.0, 100.0, 0.0 ],
									"text" : "param lfo_1__pulse_width 0.25",
									"varname" : "lfo_1__pulse_width[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-222",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 130.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_1__onset[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-223",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 97.0, 100.0, 0.0 ],
									"text" : "param lfo_1__onset 0",
									"varname" : "lfo_1__onset[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-224",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 130.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__sine_buffer",
									"varname" : "poke_168"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-225",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__sine_buffer",
									"varname" : "lfo_1__sine_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-226",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 130.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__phasor_buffer",
									"varname" : "poke_169"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-227",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__phasor_buffer",
									"varname" : "lfo_1__phasor_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-228",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 130.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__pulse_buffer",
									"varname" : "poke_170"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-229",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__pulse_buffer",
									"varname" : "lfo_1__pulse_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-230",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 130.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_2[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-231",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_2__rate[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-232",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param lfo_2__rate 1",
									"varname" : "lfo_2__rate[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-233",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_2__index[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-234",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param lfo_2__index 10",
									"varname" : "lfo_2__index[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-235",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_2__pulse_width[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-236",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param lfo_2__pulse_width 0.25",
									"varname" : "lfo_2__pulse_width[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-237",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_2__onset[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-238",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param lfo_2__onset 0",
									"varname" : "lfo_2__onset[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-239",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 140.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__sine_buffer",
									"varname" : "poke_171"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-240",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__sine_buffer",
									"varname" : "lfo_2__sine_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-241",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 140.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__phasor_buffer",
									"varname" : "poke_172"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-242",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__phasor_buffer",
									"varname" : "lfo_2__phasor_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-243",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 140.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__pulse_buffer",
									"varname" : "poke_173"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-244",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__pulse_buffer",
									"varname" : "lfo_2__pulse_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-245",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 125.0, 140.0, 100.0, 0.0 ],
									"text" : "ffmvco",
									"varname" : "ffmvco_1[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-246",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_rate",
									"varname" : "setparam_ffmvco_1__vco_1_rate[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-247",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_rate 120",
									"varname" : "ffmvco_1__vco_1_rate[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-248",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_waveform",
									"varname" : "setparam_ffmvco_1__vco_1_waveform[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-249",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_waveform 0",
									"varname" : "ffmvco_1__vco_1_waveform[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-250",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_rate",
									"varname" : "setparam_ffmvco_1__vco_2_rate[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-251",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_rate 3",
									"varname" : "ffmvco_1__vco_2_rate[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-252",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_waveform",
									"varname" : "setparam_ffmvco_1__vco_2_waveform[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-253",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_waveform 0",
									"varname" : "ffmvco_1__vco_2_waveform[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-254",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam feedback",
									"varname" : "setparam_ffmvco_1__feedback[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-255",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__feedback 0.25",
									"varname" : "ffmvco_1__feedback[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-256",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 150.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_1_buffer",
									"varname" : "poke_174"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-257",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_1_buffer",
									"varname" : "ffmvco_1__vco_1_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-258",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 150.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_2_buffer",
									"varname" : "poke_175"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-259",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_2_buffer",
									"varname" : "ffmvco_1__vco_2_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-260",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 150.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__master_buffer",
									"varname" : "poke_176"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-261",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__master_buffer",
									"varname" : "ffmvco_1__master_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-262",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 150.0, 100.0, 0.0 ],
									"text" : "vca",
									"varname" : "vca_1[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-263",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 160.0, 100.0, 0.0 ],
									"text" : "setparam cv_amount",
									"varname" : "setparam_vca_1__cv_amount[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-264",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 120.0, 100.0, 0.0 ],
									"text" : "param vca_1__cv_amount 0.5",
									"varname" : "vca_1__cv_amount[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-265",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 160.0, 100.0, 0.0 ],
									"text" : "setparam bias",
									"varname" : "setparam_vca_1__bias[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-266",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 120.0, 100.0, 0.0 ],
									"text" : "param vca_1__bias 0.5",
									"varname" : "vca_1__bias[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-267",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 160.0, 100.0, 0.0 ],
									"text" : "poke vca_1__output_buffer",
									"varname" : "poke_177"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-268",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 320.0, 100.0, 0.0 ],
									"text" : "buffer vca_1__output_buffer",
									"varname" : "vca_1__output_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-269",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 160.0, 100.0, 0.0 ],
									"text" : "comparator",
									"varname" : "comparator_1[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-270",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 170.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__max_buffer",
									"varname" : "poke_178"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-271",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 340.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__max_buffer",
									"varname" : "comparator_1__max_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-272",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 170.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__min_buffer",
									"varname" : "poke_179"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-273",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 340.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__min_buffer",
									"varname" : "comparator_1__min_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-274",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 170.0, 100.0, 0.0 ],
									"text" : "speaker",
									"varname" : "speaker_1[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-275",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 180.0, 100.0, 0.0 ],
									"text" : "setparam volume",
									"varname" : "setparam_speaker_1__volume[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-276",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 135.0, 100.0, 0.0 ],
									"text" : "param speaker_1__volume 0.25",
									"varname" : "speaker_1__volume[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-277",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 180.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__left_buffer",
									"varname" : "poke_180"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-278",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 360.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__left_buffer",
									"varname" : "speaker_1__left_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-279",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 180.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__right_buffer",
									"varname" : "poke_181"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-280",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 360.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__right_buffer",
									"varname" : "speaker_1__right_buffer_varname[3]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-281",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 190.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_1[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-282",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 200.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_1__rate[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-283",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 150.0, 100.0, 0.0 ],
									"text" : "param lfo_1__rate 0.63",
									"varname" : "lfo_1__rate[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-284",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 200.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_1__index[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-285",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 150.0, 100.0, 0.0 ],
									"text" : "param lfo_1__index 1",
									"varname" : "lfo_1__index[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-286",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 200.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_1__pulse_width[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-287",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 150.0, 100.0, 0.0 ],
									"text" : "param lfo_1__pulse_width 0.25",
									"varname" : "lfo_1__pulse_width[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-288",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 200.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_1__onset[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-289",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 150.0, 100.0, 0.0 ],
									"text" : "param lfo_1__onset 0",
									"varname" : "lfo_1__onset[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-290",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 200.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__sine_buffer",
									"varname" : "poke_182"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-291",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__sine_buffer",
									"varname" : "lfo_1__sine_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-292",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 200.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__phasor_buffer",
									"varname" : "poke_183"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-293",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__phasor_buffer",
									"varname" : "lfo_1__phasor_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-294",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 200.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__pulse_buffer",
									"varname" : "poke_184"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-295",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__pulse_buffer",
									"varname" : "lfo_1__pulse_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-296",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 200.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_2[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-297",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_2__rate[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-298",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param lfo_2__rate 1",
									"varname" : "lfo_2__rate[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-299",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_2__index[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-300",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param lfo_2__index 10",
									"varname" : "lfo_2__index[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-301",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_2__pulse_width[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-302",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param lfo_2__pulse_width 0.25",
									"varname" : "lfo_2__pulse_width[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-303",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_2__onset[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-304",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param lfo_2__onset 0",
									"varname" : "lfo_2__onset[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-305",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 210.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__sine_buffer",
									"varname" : "poke_185"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-306",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__sine_buffer",
									"varname" : "lfo_2__sine_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-307",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 210.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__phasor_buffer",
									"varname" : "poke_186"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-308",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__phasor_buffer",
									"varname" : "lfo_2__phasor_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-309",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 210.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__pulse_buffer",
									"varname" : "poke_187"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-310",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__pulse_buffer",
									"varname" : "lfo_2__pulse_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-311",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 125.0, 210.0, 100.0, 0.0 ],
									"text" : "ffmvco",
									"varname" : "ffmvco_1[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-312",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_rate",
									"varname" : "setparam_ffmvco_1__vco_1_rate[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-313",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_rate 120",
									"varname" : "ffmvco_1__vco_1_rate[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-314",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_waveform",
									"varname" : "setparam_ffmvco_1__vco_1_waveform[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-315",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_waveform 0",
									"varname" : "ffmvco_1__vco_1_waveform[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-316",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_rate",
									"varname" : "setparam_ffmvco_1__vco_2_rate[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-317",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_rate 3",
									"varname" : "ffmvco_1__vco_2_rate[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-318",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_waveform",
									"varname" : "setparam_ffmvco_1__vco_2_waveform[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-319",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_waveform 0",
									"varname" : "ffmvco_1__vco_2_waveform[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-320",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam feedback",
									"varname" : "setparam_ffmvco_1__feedback[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-321",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__feedback 0.25",
									"varname" : "ffmvco_1__feedback[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-322",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 220.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_1_buffer",
									"varname" : "poke_188"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-323",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_1_buffer",
									"varname" : "ffmvco_1__vco_1_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-324",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 220.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_2_buffer",
									"varname" : "poke_189"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-325",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_2_buffer",
									"varname" : "ffmvco_1__vco_2_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-326",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 220.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__master_buffer",
									"varname" : "poke_190"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-327",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__master_buffer",
									"varname" : "ffmvco_1__master_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-328",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 220.0, 100.0, 0.0 ],
									"text" : "vca",
									"varname" : "vca_1[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-329",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 30.0, 100.0, 0.0 ],
									"text" : "setparam cv_amount",
									"varname" : "setparam_vca_1__cv_amount[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-330",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 22.0, 100.0, 0.0 ],
									"text" : "param vca_1__cv_amount 0.5",
									"varname" : "vca_1__cv_amount[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-331",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 30.0, 100.0, 0.0 ],
									"text" : "setparam bias",
									"varname" : "setparam_vca_1__bias[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-332",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 22.0, 100.0, 0.0 ],
									"text" : "param vca_1__bias 0.5",
									"varname" : "vca_1__bias[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-333",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 30.0, 100.0, 0.0 ],
									"text" : "poke vca_1__output_buffer",
									"varname" : "poke_191"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-334",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer vca_1__output_buffer",
									"varname" : "vca_1__output_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-335",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 30.0, 100.0, 0.0 ],
									"text" : "comparator",
									"varname" : "comparator_1[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-336",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 40.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__max_buffer",
									"varname" : "poke_192"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-337",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__max_buffer",
									"varname" : "comparator_1__max_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-338",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 40.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__min_buffer",
									"varname" : "poke_193"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-339",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__min_buffer",
									"varname" : "comparator_1__min_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-340",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 40.0, 100.0, 0.0 ],
									"text" : "speaker",
									"varname" : "speaker_1[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-341",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 50.0, 100.0, 0.0 ],
									"text" : "setparam volume",
									"varname" : "setparam_speaker_1__volume[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-342",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 37.0, 100.0, 0.0 ],
									"text" : "param speaker_1__volume 0.25",
									"varname" : "speaker_1__volume[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-343",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 50.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__left_buffer",
									"varname" : "poke_194"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-344",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__left_buffer",
									"varname" : "speaker_1__left_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-345",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 50.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__right_buffer",
									"varname" : "poke_195"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-346",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__right_buffer",
									"varname" : "speaker_1__right_buffer_varname[4]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-347",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 60.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_1[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-348",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 70.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_1__rate[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-349",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 52.0, 100.0, 0.0 ],
									"text" : "param lfo_1__rate 0.63",
									"varname" : "lfo_1__rate[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-350",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 70.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_1__index[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-351",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 52.0, 100.0, 0.0 ],
									"text" : "param lfo_1__index 1",
									"varname" : "lfo_1__index[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-352",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 70.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_1__pulse_width[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-353",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 52.0, 100.0, 0.0 ],
									"text" : "param lfo_1__pulse_width 0.25",
									"varname" : "lfo_1__pulse_width[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-354",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 70.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_1__onset[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-355",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 52.0, 100.0, 0.0 ],
									"text" : "param lfo_1__onset 0",
									"varname" : "lfo_1__onset[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-356",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 70.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__sine_buffer",
									"varname" : "poke_196"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-357",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__sine_buffer",
									"varname" : "lfo_1__sine_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-358",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 70.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__phasor_buffer",
									"varname" : "poke_197"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-359",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__phasor_buffer",
									"varname" : "lfo_1__phasor_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-360",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 70.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__pulse_buffer",
									"varname" : "poke_198"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-361",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__pulse_buffer",
									"varname" : "lfo_1__pulse_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-362",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 70.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_2[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-363",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_2__rate[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-364",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param lfo_2__rate 1",
									"varname" : "lfo_2__rate[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-365",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_2__index[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-366",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param lfo_2__index 10",
									"varname" : "lfo_2__index[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-367",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_2__pulse_width[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-368",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param lfo_2__pulse_width 0.25",
									"varname" : "lfo_2__pulse_width[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-369",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_2__onset[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-370",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param lfo_2__onset 0",
									"varname" : "lfo_2__onset[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-371",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 80.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__sine_buffer",
									"varname" : "poke_199"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-372",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__sine_buffer",
									"varname" : "lfo_2__sine_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-373",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 80.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__phasor_buffer",
									"varname" : "poke_200"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-374",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__phasor_buffer",
									"varname" : "lfo_2__phasor_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-375",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 80.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__pulse_buffer",
									"varname" : "poke_201"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-376",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__pulse_buffer",
									"varname" : "lfo_2__pulse_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-377",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 125.0, 80.0, 100.0, 0.0 ],
									"text" : "ffmvco",
									"varname" : "ffmvco_1[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-378",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 90.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_rate",
									"varname" : "setparam_ffmvco_1__vco_1_rate[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-379",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 67.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_rate 120",
									"varname" : "ffmvco_1__vco_1_rate[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-380",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 90.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_waveform",
									"varname" : "setparam_ffmvco_1__vco_1_waveform[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-381",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 67.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_waveform 0",
									"varname" : "ffmvco_1__vco_1_waveform[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-382",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 90.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_rate",
									"varname" : "setparam_ffmvco_1__vco_2_rate[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-383",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 67.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_rate 3",
									"varname" : "ffmvco_1__vco_2_rate[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-384",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 90.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_waveform",
									"varname" : "setparam_ffmvco_1__vco_2_waveform[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-385",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 67.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_waveform 0",
									"varname" : "ffmvco_1__vco_2_waveform[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-386",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 90.0, 100.0, 0.0 ],
									"text" : "setparam feedback",
									"varname" : "setparam_ffmvco_1__feedback[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-387",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 67.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__feedback 0.25",
									"varname" : "ffmvco_1__feedback[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-388",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 90.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_1_buffer",
									"varname" : "poke_202"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-389",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_1_buffer",
									"varname" : "ffmvco_1__vco_1_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-390",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 90.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_2_buffer",
									"varname" : "poke_203"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-391",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_2_buffer",
									"varname" : "ffmvco_1__vco_2_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-392",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 90.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__master_buffer",
									"varname" : "poke_204"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-393",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__master_buffer",
									"varname" : "ffmvco_1__master_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-394",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 90.0, 100.0, 0.0 ],
									"text" : "vca",
									"varname" : "vca_1[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-395",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 100.0, 100.0, 0.0 ],
									"text" : "setparam cv_amount",
									"varname" : "setparam_vca_1__cv_amount[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-396",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 75.0, 100.0, 0.0 ],
									"text" : "param vca_1__cv_amount 0.5",
									"varname" : "vca_1__cv_amount[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-397",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 100.0, 100.0, 0.0 ],
									"text" : "setparam bias",
									"varname" : "setparam_vca_1__bias[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-398",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 75.0, 100.0, 0.0 ],
									"text" : "param vca_1__bias 0.5",
									"varname" : "vca_1__bias[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-399",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 100.0, 100.0, 0.0 ],
									"text" : "poke vca_1__output_buffer",
									"varname" : "poke_205"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-400",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer vca_1__output_buffer",
									"varname" : "vca_1__output_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-401",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 100.0, 100.0, 0.0 ],
									"text" : "comparator",
									"varname" : "comparator_1[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-402",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 110.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__max_buffer",
									"varname" : "poke_206"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-403",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__max_buffer",
									"varname" : "comparator_1__max_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-404",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 110.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__min_buffer",
									"varname" : "poke_207"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-405",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__min_buffer",
									"varname" : "comparator_1__min_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-406",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 110.0, 100.0, 0.0 ],
									"text" : "speaker",
									"varname" : "speaker_1[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-407",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 120.0, 100.0, 0.0 ],
									"text" : "setparam volume",
									"varname" : "setparam_speaker_1__volume[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-408",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 90.0, 100.0, 0.0 ],
									"text" : "param speaker_1__volume 0.25",
									"varname" : "speaker_1__volume[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-409",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 120.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__left_buffer",
									"varname" : "poke_208"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-410",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__left_buffer",
									"varname" : "speaker_1__left_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-411",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 120.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__right_buffer",
									"varname" : "poke_209"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-412",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__right_buffer",
									"varname" : "speaker_1__right_buffer_varname[5]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-413",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 130.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_1[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-414",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_1__rate[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-415",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param lfo_1__rate 0.63",
									"varname" : "lfo_1__rate[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-416",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_1__index[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-417",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param lfo_1__index 1",
									"varname" : "lfo_1__index[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-418",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_1__pulse_width[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-419",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param lfo_1__pulse_width 0.25",
									"varname" : "lfo_1__pulse_width[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-420",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 140.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_1__onset[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-421",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 105.0, 100.0, 0.0 ],
									"text" : "param lfo_1__onset 0",
									"varname" : "lfo_1__onset[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-422",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 140.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__sine_buffer",
									"varname" : "poke_210"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-423",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__sine_buffer",
									"varname" : "lfo_1__sine_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-424",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 140.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__phasor_buffer",
									"varname" : "poke_211"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-425",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__phasor_buffer",
									"varname" : "lfo_1__phasor_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-426",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 140.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__pulse_buffer",
									"varname" : "poke_212"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-427",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 280.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__pulse_buffer",
									"varname" : "lfo_1__pulse_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-428",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 140.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_2[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-429",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_2__rate[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-430",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param lfo_2__rate 1",
									"varname" : "lfo_2__rate[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-431",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_2__index[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-432",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param lfo_2__index 10",
									"varname" : "lfo_2__index[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-433",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_2__pulse_width[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-434",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param lfo_2__pulse_width 0.25",
									"varname" : "lfo_2__pulse_width[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-435",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_2__onset[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-436",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param lfo_2__onset 0",
									"varname" : "lfo_2__onset[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-437",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 150.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__sine_buffer",
									"varname" : "poke_213"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-438",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__sine_buffer",
									"varname" : "lfo_2__sine_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-439",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 150.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__phasor_buffer",
									"varname" : "poke_214"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-440",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__phasor_buffer",
									"varname" : "lfo_2__phasor_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-441",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 150.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__pulse_buffer",
									"varname" : "poke_215"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-442",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__pulse_buffer",
									"varname" : "lfo_2__pulse_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-443",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 125.0, 150.0, 100.0, 0.0 ],
									"text" : "ffmvco",
									"varname" : "ffmvco_1[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-444",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 160.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_rate",
									"varname" : "setparam_ffmvco_1__vco_1_rate[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-445",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 120.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_rate 120",
									"varname" : "ffmvco_1__vco_1_rate[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-446",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 160.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_waveform",
									"varname" : "setparam_ffmvco_1__vco_1_waveform[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-447",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 120.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_waveform 0",
									"varname" : "ffmvco_1__vco_1_waveform[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-448",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 160.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_rate",
									"varname" : "setparam_ffmvco_1__vco_2_rate[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-449",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 120.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_rate 3",
									"varname" : "ffmvco_1__vco_2_rate[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-450",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 160.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_waveform",
									"varname" : "setparam_ffmvco_1__vco_2_waveform[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-451",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 120.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_waveform 0",
									"varname" : "ffmvco_1__vco_2_waveform[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-452",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 160.0, 100.0, 0.0 ],
									"text" : "setparam feedback",
									"varname" : "setparam_ffmvco_1__feedback[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-453",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 120.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__feedback 0.25",
									"varname" : "ffmvco_1__feedback[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-454",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 160.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_1_buffer",
									"varname" : "poke_216"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-455",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 320.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_1_buffer",
									"varname" : "ffmvco_1__vco_1_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-456",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 160.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_2_buffer",
									"varname" : "poke_217"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-457",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 320.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_2_buffer",
									"varname" : "ffmvco_1__vco_2_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-458",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 160.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__master_buffer",
									"varname" : "poke_218"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-459",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 320.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__master_buffer",
									"varname" : "ffmvco_1__master_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-460",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 160.0, 100.0, 0.0 ],
									"text" : "vca",
									"varname" : "vca_1[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-461",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 170.0, 100.0, 0.0 ],
									"text" : "setparam cv_amount",
									"varname" : "setparam_vca_1__cv_amount[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-462",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 127.0, 100.0, 0.0 ],
									"text" : "param vca_1__cv_amount 0.5",
									"varname" : "vca_1__cv_amount[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-463",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 170.0, 100.0, 0.0 ],
									"text" : "setparam bias",
									"varname" : "setparam_vca_1__bias[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-464",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 127.0, 100.0, 0.0 ],
									"text" : "param vca_1__bias 0.5",
									"varname" : "vca_1__bias[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-465",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 170.0, 100.0, 0.0 ],
									"text" : "poke vca_1__output_buffer",
									"varname" : "poke_219"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-466",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 340.0, 100.0, 0.0 ],
									"text" : "buffer vca_1__output_buffer",
									"varname" : "vca_1__output_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-467",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 170.0, 100.0, 0.0 ],
									"text" : "comparator",
									"varname" : "comparator_1[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-468",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 180.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__max_buffer",
									"varname" : "poke_220"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-469",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 360.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__max_buffer",
									"varname" : "comparator_1__max_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-470",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 180.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__min_buffer",
									"varname" : "poke_221"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-471",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 360.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__min_buffer",
									"varname" : "comparator_1__min_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-472",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 180.0, 100.0, 0.0 ],
									"text" : "speaker",
									"varname" : "speaker_1[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-473",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 190.0, 100.0, 0.0 ],
									"text" : "setparam volume",
									"varname" : "setparam_speaker_1__volume[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-474",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 142.0, 100.0, 0.0 ],
									"text" : "param speaker_1__volume 0.25",
									"varname" : "speaker_1__volume[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-475",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 190.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__left_buffer",
									"varname" : "poke_222"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-476",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 380.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__left_buffer",
									"varname" : "speaker_1__left_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-477",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 190.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__right_buffer",
									"varname" : "poke_223"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-478",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 380.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__right_buffer",
									"varname" : "speaker_1__right_buffer_varname[6]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-479",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 200.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_1[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-480",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_1__rate[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-481",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param lfo_1__rate 0.63",
									"varname" : "lfo_1__rate[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-482",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_1__index[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-483",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param lfo_1__index 1",
									"varname" : "lfo_1__index[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-484",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_1__pulse_width[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-485",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param lfo_1__pulse_width 0.25",
									"varname" : "lfo_1__pulse_width[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-486",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 210.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_1__onset[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-487",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 157.0, 100.0, 0.0 ],
									"text" : "param lfo_1__onset 0",
									"varname" : "lfo_1__onset[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-488",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 210.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__sine_buffer",
									"varname" : "poke_224"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-489",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__sine_buffer",
									"varname" : "lfo_1__sine_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-490",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 210.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__phasor_buffer",
									"varname" : "poke_225"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-491",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__phasor_buffer",
									"varname" : "lfo_1__phasor_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-492",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 210.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__pulse_buffer",
									"varname" : "poke_226"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-493",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 420.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__pulse_buffer",
									"varname" : "lfo_1__pulse_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-494",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 210.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_2[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-495",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_2__rate[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-496",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param lfo_2__rate 1",
									"varname" : "lfo_2__rate[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-497",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_2__index[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-498",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param lfo_2__index 10",
									"varname" : "lfo_2__index[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-499",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_2__pulse_width[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-500",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param lfo_2__pulse_width 0.25",
									"varname" : "lfo_2__pulse_width[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-501",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_2__onset[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-502",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param lfo_2__onset 0",
									"varname" : "lfo_2__onset[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-503",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 220.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__sine_buffer",
									"varname" : "poke_227"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-504",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__sine_buffer",
									"varname" : "lfo_2__sine_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-505",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 220.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__phasor_buffer",
									"varname" : "poke_228"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-506",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__phasor_buffer",
									"varname" : "lfo_2__phasor_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-507",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 220.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__pulse_buffer",
									"varname" : "poke_229"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-508",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__pulse_buffer",
									"varname" : "lfo_2__pulse_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-509",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 125.0, 220.0, 100.0, 0.0 ],
									"text" : "ffmvco",
									"varname" : "ffmvco_1[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-510",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 30.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_rate",
									"varname" : "setparam_ffmvco_1__vco_1_rate[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-511",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 22.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_rate 120",
									"varname" : "ffmvco_1__vco_1_rate[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-512",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 30.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_waveform",
									"varname" : "setparam_ffmvco_1__vco_1_waveform[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-513",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 22.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_waveform 0",
									"varname" : "ffmvco_1__vco_1_waveform[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-514",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 30.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_rate",
									"varname" : "setparam_ffmvco_1__vco_2_rate[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-515",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 22.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_rate 3",
									"varname" : "ffmvco_1__vco_2_rate[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-516",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 30.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_waveform",
									"varname" : "setparam_ffmvco_1__vco_2_waveform[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-517",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 22.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_waveform 0",
									"varname" : "ffmvco_1__vco_2_waveform[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-518",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 30.0, 100.0, 0.0 ],
									"text" : "setparam feedback",
									"varname" : "setparam_ffmvco_1__feedback[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-519",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 22.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__feedback 0.25",
									"varname" : "ffmvco_1__feedback[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-520",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 30.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_1_buffer",
									"varname" : "poke_230"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-521",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_1_buffer",
									"varname" : "ffmvco_1__vco_1_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-522",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 30.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_2_buffer",
									"varname" : "poke_231"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-523",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_2_buffer",
									"varname" : "ffmvco_1__vco_2_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-524",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 30.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__master_buffer",
									"varname" : "poke_232"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-525",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__master_buffer",
									"varname" : "ffmvco_1__master_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-526",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 30.0, 100.0, 0.0 ],
									"text" : "vca",
									"varname" : "vca_1[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-527",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 40.0, 100.0, 0.0 ],
									"text" : "setparam cv_amount",
									"varname" : "setparam_vca_1__cv_amount[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-528",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 30.0, 100.0, 0.0 ],
									"text" : "param vca_1__cv_amount 0.5",
									"varname" : "vca_1__cv_amount[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-529",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 40.0, 100.0, 0.0 ],
									"text" : "setparam bias",
									"varname" : "setparam_vca_1__bias[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-530",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 30.0, 100.0, 0.0 ],
									"text" : "param vca_1__bias 0.5",
									"varname" : "vca_1__bias[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-531",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 40.0, 100.0, 0.0 ],
									"text" : "poke vca_1__output_buffer",
									"varname" : "poke_233"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-532",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer vca_1__output_buffer",
									"varname" : "vca_1__output_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-533",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 40.0, 100.0, 0.0 ],
									"text" : "comparator",
									"varname" : "comparator_1[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-534",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 50.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__max_buffer",
									"varname" : "poke_234"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-535",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__max_buffer",
									"varname" : "comparator_1__max_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-536",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 50.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__min_buffer",
									"varname" : "poke_235"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-537",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__min_buffer",
									"varname" : "comparator_1__min_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-538",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 50.0, 100.0, 0.0 ],
									"text" : "speaker",
									"varname" : "speaker_1[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-539",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 60.0, 100.0, 0.0 ],
									"text" : "setparam volume",
									"varname" : "setparam_speaker_1__volume[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-540",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 45.0, 100.0, 0.0 ],
									"text" : "param speaker_1__volume 0.25",
									"varname" : "speaker_1__volume[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-541",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 60.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__left_buffer",
									"varname" : "poke_236"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-542",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__left_buffer",
									"varname" : "speaker_1__left_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-543",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 60.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__right_buffer",
									"varname" : "poke_237"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-544",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__right_buffer",
									"varname" : "speaker_1__right_buffer_varname[7]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-545",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 70.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_1[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-546",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_1__rate[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-547",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param lfo_1__rate 0.63",
									"varname" : "lfo_1__rate[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-548",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_1__index[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-549",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param lfo_1__index 1",
									"varname" : "lfo_1__index[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-550",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_1__pulse_width[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-551",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param lfo_1__pulse_width 0.25",
									"varname" : "lfo_1__pulse_width[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-552",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 80.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_1__onset[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-553",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 60.0, 100.0, 0.0 ],
									"text" : "param lfo_1__onset 0",
									"varname" : "lfo_1__onset[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-554",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 80.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__sine_buffer",
									"varname" : "poke_238"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-555",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__sine_buffer",
									"varname" : "lfo_1__sine_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-556",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 80.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__phasor_buffer",
									"varname" : "poke_239"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-557",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__phasor_buffer",
									"varname" : "lfo_1__phasor_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-558",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 80.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__pulse_buffer",
									"varname" : "poke_240"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-559",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 160.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__pulse_buffer",
									"varname" : "lfo_1__pulse_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-560",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 80.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_2[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-561",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 90.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_2__rate[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-562",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 67.0, 100.0, 0.0 ],
									"text" : "param lfo_2__rate 1",
									"varname" : "lfo_2__rate[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-563",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 90.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_2__index[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-564",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 67.0, 100.0, 0.0 ],
									"text" : "param lfo_2__index 10",
									"varname" : "lfo_2__index[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-565",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 90.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_2__pulse_width[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-566",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 67.0, 100.0, 0.0 ],
									"text" : "param lfo_2__pulse_width 0.25",
									"varname" : "lfo_2__pulse_width[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-567",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 90.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_2__onset[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-568",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 67.0, 100.0, 0.0 ],
									"text" : "param lfo_2__onset 0",
									"varname" : "lfo_2__onset[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-569",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 90.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__sine_buffer",
									"varname" : "poke_241"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-570",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__sine_buffer",
									"varname" : "lfo_2__sine_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-571",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 90.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__phasor_buffer",
									"varname" : "poke_242"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-572",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__phasor_buffer",
									"varname" : "lfo_2__phasor_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-573",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 90.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__pulse_buffer",
									"varname" : "poke_243"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-574",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 180.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__pulse_buffer",
									"varname" : "lfo_2__pulse_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-575",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 125.0, 90.0, 100.0, 0.0 ],
									"text" : "ffmvco",
									"varname" : "ffmvco_1[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-576",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 100.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_rate",
									"varname" : "setparam_ffmvco_1__vco_1_rate[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-577",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 75.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_rate 120",
									"varname" : "ffmvco_1__vco_1_rate[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-578",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 100.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_waveform",
									"varname" : "setparam_ffmvco_1__vco_1_waveform[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-579",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 75.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_waveform 0",
									"varname" : "ffmvco_1__vco_1_waveform[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-580",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 100.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_rate",
									"varname" : "setparam_ffmvco_1__vco_2_rate[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-581",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 75.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_rate 3",
									"varname" : "ffmvco_1__vco_2_rate[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-582",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 100.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_waveform",
									"varname" : "setparam_ffmvco_1__vco_2_waveform[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-583",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 75.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_waveform 0",
									"varname" : "ffmvco_1__vco_2_waveform[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-584",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 100.0, 100.0, 0.0 ],
									"text" : "setparam feedback",
									"varname" : "setparam_ffmvco_1__feedback[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-585",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 75.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__feedback 0.25",
									"varname" : "ffmvco_1__feedback[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-586",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 100.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_1_buffer",
									"varname" : "poke_244"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-587",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_1_buffer",
									"varname" : "ffmvco_1__vco_1_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-588",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 100.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_2_buffer",
									"varname" : "poke_245"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-589",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_2_buffer",
									"varname" : "ffmvco_1__vco_2_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-590",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 100.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__master_buffer",
									"varname" : "poke_246"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-591",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 200.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__master_buffer",
									"varname" : "ffmvco_1__master_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-592",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 100.0, 100.0, 0.0 ],
									"text" : "vca",
									"varname" : "vca_1[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-593",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 110.0, 100.0, 0.0 ],
									"text" : "setparam cv_amount",
									"varname" : "setparam_vca_1__cv_amount[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-594",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 82.0, 100.0, 0.0 ],
									"text" : "param vca_1__cv_amount 0.5",
									"varname" : "vca_1__cv_amount[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-595",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 110.0, 100.0, 0.0 ],
									"text" : "setparam bias",
									"varname" : "setparam_vca_1__bias[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-596",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 82.0, 100.0, 0.0 ],
									"text" : "param vca_1__bias 0.5",
									"varname" : "vca_1__bias[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-597",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 110.0, 100.0, 0.0 ],
									"text" : "poke vca_1__output_buffer",
									"varname" : "poke_247"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-598",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 220.0, 100.0, 0.0 ],
									"text" : "buffer vca_1__output_buffer",
									"varname" : "vca_1__output_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-599",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 110.0, 100.0, 0.0 ],
									"text" : "comparator",
									"varname" : "comparator_1[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-600",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 120.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__max_buffer",
									"varname" : "poke_248"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-601",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__max_buffer",
									"varname" : "comparator_1__max_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-602",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 120.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__min_buffer",
									"varname" : "poke_249"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-603",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 240.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__min_buffer",
									"varname" : "comparator_1__min_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-604",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 120.0, 100.0, 0.0 ],
									"text" : "speaker",
									"varname" : "speaker_1[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-605",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 130.0, 100.0, 0.0 ],
									"text" : "setparam volume",
									"varname" : "setparam_speaker_1__volume[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-606",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 97.0, 100.0, 0.0 ],
									"text" : "param speaker_1__volume 0.25",
									"varname" : "speaker_1__volume[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-607",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 130.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__left_buffer",
									"varname" : "poke_250"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-608",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__left_buffer",
									"varname" : "speaker_1__left_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-609",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 130.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__right_buffer",
									"varname" : "poke_251"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-610",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 260.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__right_buffer",
									"varname" : "speaker_1__right_buffer_varname[8]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-611",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 140.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_1[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-612",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_1__rate[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-613",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param lfo_1__rate 0.63",
									"varname" : "lfo_1__rate[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-614",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_1__index[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-615",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param lfo_1__index 1",
									"varname" : "lfo_1__index[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-616",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_1__pulse_width[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-617",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param lfo_1__pulse_width 0.25",
									"varname" : "lfo_1__pulse_width[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-618",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 150.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_1__onset[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-619",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 112.0, 100.0, 0.0 ],
									"text" : "param lfo_1__onset 0",
									"varname" : "lfo_1__onset[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-620",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 150.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__sine_buffer",
									"varname" : "poke_252"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-621",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__sine_buffer",
									"varname" : "lfo_1__sine_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-622",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 150.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__phasor_buffer",
									"varname" : "poke_253"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-623",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__phasor_buffer",
									"varname" : "lfo_1__phasor_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-624",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 150.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__pulse_buffer",
									"varname" : "poke_254"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-625",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 300.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__pulse_buffer",
									"varname" : "lfo_1__pulse_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-626",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 150.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_2[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-627",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 160.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_2__rate[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-628",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 120.0, 100.0, 0.0 ],
									"text" : "param lfo_2__rate 1",
									"varname" : "lfo_2__rate[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-629",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 160.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_2__index[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-630",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 120.0, 100.0, 0.0 ],
									"text" : "param lfo_2__index 10",
									"varname" : "lfo_2__index[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-631",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 160.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_2__pulse_width[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-632",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 120.0, 100.0, 0.0 ],
									"text" : "param lfo_2__pulse_width 0.25",
									"varname" : "lfo_2__pulse_width[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-633",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 160.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_2__onset[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-634",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 120.0, 100.0, 0.0 ],
									"text" : "param lfo_2__onset 0",
									"varname" : "lfo_2__onset[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-635",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 160.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__sine_buffer",
									"varname" : "poke_255"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-636",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 320.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__sine_buffer",
									"varname" : "lfo_2__sine_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-637",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 160.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__phasor_buffer",
									"varname" : "poke_256"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-638",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 320.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__phasor_buffer",
									"varname" : "lfo_2__phasor_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-639",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 160.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__pulse_buffer",
									"varname" : "poke_257"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-640",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 320.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__pulse_buffer",
									"varname" : "lfo_2__pulse_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-641",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 125.0, 160.0, 100.0, 0.0 ],
									"text" : "ffmvco",
									"varname" : "ffmvco_1[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-642",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 170.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_rate",
									"varname" : "setparam_ffmvco_1__vco_1_rate[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-643",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 127.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_rate 120",
									"varname" : "ffmvco_1__vco_1_rate[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-644",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 170.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_waveform",
									"varname" : "setparam_ffmvco_1__vco_1_waveform[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-645",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 127.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_waveform 0",
									"varname" : "ffmvco_1__vco_1_waveform[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-646",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 170.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_rate",
									"varname" : "setparam_ffmvco_1__vco_2_rate[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-647",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 127.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_rate 3",
									"varname" : "ffmvco_1__vco_2_rate[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-648",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 170.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_waveform",
									"varname" : "setparam_ffmvco_1__vco_2_waveform[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-649",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 127.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_waveform 0",
									"varname" : "ffmvco_1__vco_2_waveform[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-650",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 170.0, 100.0, 0.0 ],
									"text" : "setparam feedback",
									"varname" : "setparam_ffmvco_1__feedback[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-651",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 127.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__feedback 0.25",
									"varname" : "ffmvco_1__feedback[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-652",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 170.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_1_buffer",
									"varname" : "poke_258"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-653",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 340.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_1_buffer",
									"varname" : "ffmvco_1__vco_1_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-654",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 170.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_2_buffer",
									"varname" : "poke_259"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-655",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 340.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_2_buffer",
									"varname" : "ffmvco_1__vco_2_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-656",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 170.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__master_buffer",
									"varname" : "poke_260"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-657",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 340.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__master_buffer",
									"varname" : "ffmvco_1__master_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-658",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 170.0, 100.0, 0.0 ],
									"text" : "vca",
									"varname" : "vca_1[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-659",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 180.0, 100.0, 0.0 ],
									"text" : "setparam cv_amount",
									"varname" : "setparam_vca_1__cv_amount[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-660",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 135.0, 100.0, 0.0 ],
									"text" : "param vca_1__cv_amount 0.5",
									"varname" : "vca_1__cv_amount[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-661",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 180.0, 100.0, 0.0 ],
									"text" : "setparam bias",
									"varname" : "setparam_vca_1__bias[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-662",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 135.0, 100.0, 0.0 ],
									"text" : "param vca_1__bias 0.5",
									"varname" : "vca_1__bias[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-663",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 180.0, 100.0, 0.0 ],
									"text" : "poke vca_1__output_buffer",
									"varname" : "poke_261"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-664",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 360.0, 100.0, 0.0 ],
									"text" : "buffer vca_1__output_buffer",
									"varname" : "vca_1__output_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-665",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 180.0, 100.0, 0.0 ],
									"text" : "comparator",
									"varname" : "comparator_1[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-666",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 190.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__max_buffer",
									"varname" : "poke_262"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-667",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 380.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__max_buffer",
									"varname" : "comparator_1__max_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-668",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 190.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__min_buffer",
									"varname" : "poke_263"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-669",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 380.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__min_buffer",
									"varname" : "comparator_1__min_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-670",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 190.0, 100.0, 0.0 ],
									"text" : "speaker",
									"varname" : "speaker_1[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-671",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 200.0, 100.0, 0.0 ],
									"text" : "setparam volume",
									"varname" : "setparam_speaker_1__volume[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-672",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 150.0, 100.0, 0.0 ],
									"text" : "param speaker_1__volume 0.25",
									"varname" : "speaker_1__volume[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-673",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 200.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__left_buffer",
									"varname" : "poke_264"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-674",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__left_buffer",
									"varname" : "speaker_1__left_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-675",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 200.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__right_buffer",
									"varname" : "poke_265"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-676",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 400.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__right_buffer",
									"varname" : "speaker_1__right_buffer_varname[9]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-677",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 210.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_1[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-678",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_1__rate[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-679",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param lfo_1__rate 0.63",
									"varname" : "lfo_1__rate[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-680",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_1__index[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-681",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param lfo_1__index 1",
									"varname" : "lfo_1__index[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-682",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_1__pulse_width[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-683",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param lfo_1__pulse_width 0.25",
									"varname" : "lfo_1__pulse_width[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-684",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 220.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_1__onset[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-685",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 165.0, 100.0, 0.0 ],
									"text" : "param lfo_1__onset 0",
									"varname" : "lfo_1__onset[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-686",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 220.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__sine_buffer",
									"varname" : "poke_266"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-687",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__sine_buffer",
									"varname" : "lfo_1__sine_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-688",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 220.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__phasor_buffer",
									"varname" : "poke_267"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-689",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__phasor_buffer",
									"varname" : "lfo_1__phasor_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-690",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 220.0, 100.0, 0.0 ],
									"text" : "poke lfo_1__pulse_buffer",
									"varname" : "poke_268"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-691",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 440.0, 100.0, 0.0 ],
									"text" : "buffer lfo_1__pulse_buffer",
									"varname" : "lfo_1__pulse_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-692",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 5,
									"outlettype" : [ "", "", "", "", "" ],
									"patching_rect" : [ 125.0, 220.0, 100.0, 0.0 ],
									"text" : "lfo",
									"varname" : "lfo_2[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-693",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 30.0, 100.0, 0.0 ],
									"text" : "setparam rate",
									"varname" : "setparam_lfo_2__rate[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-694",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 22.0, 100.0, 0.0 ],
									"text" : "param lfo_2__rate 1",
									"varname" : "lfo_2__rate[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-695",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 30.0, 100.0, 0.0 ],
									"text" : "setparam index",
									"varname" : "setparam_lfo_2__index[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-696",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 22.0, 100.0, 0.0 ],
									"text" : "param lfo_2__index 10",
									"varname" : "lfo_2__index[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-697",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 30.0, 100.0, 0.0 ],
									"text" : "setparam pulse_width",
									"varname" : "setparam_lfo_2__pulse_width[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-698",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 22.0, 100.0, 0.0 ],
									"text" : "param lfo_2__pulse_width 0.25",
									"varname" : "lfo_2__pulse_width[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-699",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 30.0, 100.0, 0.0 ],
									"text" : "setparam onset",
									"varname" : "setparam_lfo_2__onset[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-700",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 22.0, 100.0, 0.0 ],
									"text" : "param lfo_2__onset 0",
									"varname" : "lfo_2__onset[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-701",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 30.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__sine_buffer",
									"varname" : "poke_269"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-702",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__sine_buffer",
									"varname" : "lfo_2__sine_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-703",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 30.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__phasor_buffer",
									"varname" : "poke_270"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-704",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__phasor_buffer",
									"varname" : "lfo_2__phasor_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-705",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 30.0, 100.0, 0.0 ],
									"text" : "poke lfo_2__pulse_buffer",
									"varname" : "poke_271"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-706",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 60.0, 100.0, 0.0 ],
									"text" : "buffer lfo_2__pulse_buffer",
									"varname" : "lfo_2__pulse_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-707",
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "" ],
									"patching_rect" : [ 125.0, 30.0, 100.0, 0.0 ],
									"text" : "ffmvco",
									"varname" : "ffmvco_1[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-708",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 40.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_rate",
									"varname" : "setparam_ffmvco_1__vco_1_rate[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-709",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 30.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_rate 120",
									"varname" : "ffmvco_1__vco_1_rate[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-710",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 40.0, 100.0, 0.0 ],
									"text" : "setparam vco_1_waveform",
									"varname" : "setparam_ffmvco_1__vco_1_waveform[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-711",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 30.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_1_waveform 0",
									"varname" : "ffmvco_1__vco_1_waveform[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-712",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 40.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_rate",
									"varname" : "setparam_ffmvco_1__vco_2_rate[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-713",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 30.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_rate 3",
									"varname" : "ffmvco_1__vco_2_rate[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-714",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 40.0, 100.0, 0.0 ],
									"text" : "setparam vco_2_waveform",
									"varname" : "setparam_ffmvco_1__vco_2_waveform[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-715",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 30.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__vco_2_waveform 0",
									"varname" : "ffmvco_1__vco_2_waveform[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-716",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 40.0, 100.0, 0.0 ],
									"text" : "setparam feedback",
									"varname" : "setparam_ffmvco_1__feedback[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-717",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 30.0, 100.0, 0.0 ],
									"text" : "param ffmvco_1__feedback 0.25",
									"varname" : "ffmvco_1__feedback[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-718",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 40.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_1_buffer",
									"varname" : "poke_272"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-719",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_1_buffer",
									"varname" : "ffmvco_1__vco_1_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-720",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 40.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__vco_2_buffer",
									"varname" : "poke_273"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-721",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__vco_2_buffer",
									"varname" : "ffmvco_1__vco_2_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-722",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 40.0, 100.0, 0.0 ],
									"text" : "poke ffmvco_1__master_buffer",
									"varname" : "poke_274"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-723",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 80.0, 100.0, 0.0 ],
									"text" : "buffer ffmvco_1__master_buffer",
									"varname" : "ffmvco_1__master_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-724",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 125.0, 40.0, 100.0, 0.0 ],
									"text" : "vca",
									"varname" : "vca_1[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-725",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 50.0, 100.0, 0.0 ],
									"text" : "setparam cv_amount",
									"varname" : "setparam_vca_1__cv_amount[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-726",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 37.0, 100.0, 0.0 ],
									"text" : "param vca_1__cv_amount 0.5",
									"varname" : "vca_1__cv_amount[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-727",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 50.0, 100.0, 0.0 ],
									"text" : "setparam bias",
									"varname" : "setparam_vca_1__bias[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-728",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 37.0, 100.0, 0.0 ],
									"text" : "param vca_1__bias 0.5",
									"varname" : "vca_1__bias[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-729",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 50.0, 100.0, 0.0 ],
									"text" : "poke vca_1__output_buffer",
									"varname" : "poke_275"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-730",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 100.0, 100.0, 0.0 ],
									"text" : "buffer vca_1__output_buffer",
									"varname" : "vca_1__output_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-731",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 50.0, 100.0, 0.0 ],
									"text" : "comparator",
									"varname" : "comparator_1[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-732",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 60.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__max_buffer",
									"varname" : "poke_276"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-733",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__max_buffer",
									"varname" : "comparator_1__max_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-734",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 60.0, 100.0, 0.0 ],
									"text" : "poke comparator_1__min_buffer",
									"varname" : "poke_277"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-735",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 120.0, 100.0, 0.0 ],
									"text" : "buffer comparator_1__min_buffer",
									"varname" : "comparator_1__min_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-736",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 125.0, 60.0, 100.0, 0.0 ],
									"text" : "speaker",
									"varname" : "speaker_1[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-737",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 70.0, 100.0, 0.0 ],
									"text" : "setparam volume",
									"varname" : "setparam_speaker_1__volume[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-738",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 52.0, 100.0, 0.0 ],
									"text" : "param speaker_1__volume 0.25",
									"varname" : "speaker_1__volume[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-739",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 70.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__left_buffer",
									"varname" : "poke_278"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-740",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__left_buffer",
									"varname" : "speaker_1__left_buffer_varname[10]"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-741",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 4,
									"numoutlets" : 0,
									"patching_rect" : [ 575.0, 70.0, 100.0, 0.0 ],
									"text" : "poke speaker_1__right_buffer",
									"varname" : "poke_279"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-742",
									"linecount" : 3,
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 875.0, 140.0, 100.0, 0.0 ],
									"text" : "buffer speaker_1__right_buffer",
									"varname" : "speaker_1__right_buffer_varname[10]"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-1", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"source" : [ "obj-1", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-99", 0 ],
									"source" : [ "obj-100", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-101", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-101", 0 ],
									"source" : [ "obj-102", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-103", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-103", 0 ],
									"source" : [ "obj-104", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-105", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-105", 0 ],
									"source" : [ "obj-106", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-124", 0 ],
									"source" : [ "obj-113", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-126", 0 ],
									"source" : [ "obj-113", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-128", 0 ],
									"source" : [ "obj-113", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-114", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-114", 0 ],
									"source" : [ "obj-115", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-116", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-116", 0 ],
									"source" : [ "obj-117", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-118", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-118", 0 ],
									"source" : [ "obj-119", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-120", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-120", 0 ],
									"source" : [ "obj-121", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-122", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-122", 0 ],
									"source" : [ "obj-123", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-135", 0 ],
									"source" : [ "obj-130", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-131", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-131", 0 ],
									"source" : [ "obj-132", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-133", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-133", 0 ],
									"source" : [ "obj-134", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-138", 0 ],
									"source" : [ "obj-137", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-140", 0 ],
									"source" : [ "obj-137", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-32", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-145", 0 ],
									"source" : [ "obj-142", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-147", 0 ],
									"source" : [ "obj-142", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-143", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-143", 0 ],
									"source" : [ "obj-144", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-158", 0 ],
									"source" : [ "obj-149", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-160", 0 ],
									"source" : [ "obj-149", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-162", 0 ],
									"source" : [ "obj-149", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-150", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-150", 0 ],
									"source" : [ "obj-151", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-152", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-152", 0 ],
									"source" : [ "obj-153", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-154", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-154", 0 ],
									"source" : [ "obj-155", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-156", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-156", 0 ],
									"source" : [ "obj-157", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-173", 0 ],
									"source" : [ "obj-164", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-175", 0 ],
									"source" : [ "obj-164", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-177", 0 ],
									"source" : [ "obj-164", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-165", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-165", 0 ],
									"source" : [ "obj-166", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-167", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-167", 0 ],
									"source" : [ "obj-168", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-169", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-169", 0 ],
									"source" : [ "obj-170", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-171", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-171", 0 ],
									"source" : [ "obj-172", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-190", 0 ],
									"source" : [ "obj-179", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-192", 0 ],
									"source" : [ "obj-179", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-194", 0 ],
									"source" : [ "obj-179", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-180", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-180", 0 ],
									"source" : [ "obj-181", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-182", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-182", 0 ],
									"source" : [ "obj-183", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-184", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-184", 0 ],
									"source" : [ "obj-185", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-186", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-186", 0 ],
									"source" : [ "obj-187", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-188", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-188", 0 ],
									"source" : [ "obj-189", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-201", 0 ],
									"source" : [ "obj-196", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-197", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-197", 0 ],
									"source" : [ "obj-198", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-199", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-199", 0 ],
									"source" : [ "obj-200", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-204", 0 ],
									"source" : [ "obj-203", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-206", 0 ],
									"source" : [ "obj-203", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-211", 0 ],
									"source" : [ "obj-208", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-213", 0 ],
									"source" : [ "obj-208", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-209", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-209", 0 ],
									"source" : [ "obj-210", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-224", 0 ],
									"source" : [ "obj-215", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-226", 0 ],
									"source" : [ "obj-215", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-228", 0 ],
									"source" : [ "obj-215", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-216", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-216", 0 ],
									"source" : [ "obj-217", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-218", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-218", 0 ],
									"source" : [ "obj-219", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-220", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-220", 0 ],
									"source" : [ "obj-221", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-222", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-222", 0 ],
									"source" : [ "obj-223", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-29", 0 ],
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-239", 0 ],
									"source" : [ "obj-230", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-241", 0 ],
									"source" : [ "obj-230", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-243", 0 ],
									"source" : [ "obj-230", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-231", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-231", 0 ],
									"source" : [ "obj-232", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-233", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-233", 0 ],
									"source" : [ "obj-234", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-235", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-235", 0 ],
									"source" : [ "obj-236", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-237", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-237", 0 ],
									"source" : [ "obj-238", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-256", 0 ],
									"source" : [ "obj-245", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-258", 0 ],
									"source" : [ "obj-245", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-260", 0 ],
									"source" : [ "obj-245", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-246", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-246", 0 ],
									"source" : [ "obj-247", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-248", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-248", 0 ],
									"source" : [ "obj-249", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-250", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-250", 0 ],
									"source" : [ "obj-251", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-252", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-252", 0 ],
									"source" : [ "obj-253", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-254", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-254", 0 ],
									"source" : [ "obj-255", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-26", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-43", 0 ],
									"source" : [ "obj-26", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-26", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-267", 0 ],
									"source" : [ "obj-262", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-263", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-263", 0 ],
									"source" : [ "obj-264", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-265", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-265", 0 ],
									"source" : [ "obj-266", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-270", 0 ],
									"source" : [ "obj-269", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-272", 0 ],
									"source" : [ "obj-269", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-277", 0 ],
									"source" : [ "obj-274", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-279", 0 ],
									"source" : [ "obj-274", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-275", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-275", 0 ],
									"source" : [ "obj-276", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-290", 0 ],
									"source" : [ "obj-281", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-292", 0 ],
									"source" : [ "obj-281", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-294", 0 ],
									"source" : [ "obj-281", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-282", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-282", 0 ],
									"source" : [ "obj-283", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-284", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-284", 0 ],
									"source" : [ "obj-285", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-286", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-286", 0 ],
									"source" : [ "obj-287", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-288", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-288", 0 ],
									"source" : [ "obj-289", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-305", 0 ],
									"source" : [ "obj-296", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-307", 0 ],
									"source" : [ "obj-296", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-309", 0 ],
									"source" : [ "obj-296", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-297", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-297", 0 ],
									"source" : [ "obj-298", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-299", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-299", 0 ],
									"source" : [ "obj-300", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-301", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-301", 0 ],
									"source" : [ "obj-302", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-303", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-303", 0 ],
									"source" : [ "obj-304", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-322", 0 ],
									"source" : [ "obj-311", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-324", 0 ],
									"source" : [ "obj-311", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-326", 0 ],
									"source" : [ "obj-311", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-312", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-312", 0 ],
									"source" : [ "obj-313", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-314", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-314", 0 ],
									"source" : [ "obj-315", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-316", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-316", 0 ],
									"source" : [ "obj-317", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-318", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-318", 0 ],
									"source" : [ "obj-319", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-320", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-320", 0 ],
									"source" : [ "obj-321", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-333", 0 ],
									"source" : [ "obj-328", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-329", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-329", 0 ],
									"source" : [ "obj-330", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-331", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-331", 0 ],
									"source" : [ "obj-332", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-336", 0 ],
									"source" : [ "obj-335", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-338", 0 ],
									"source" : [ "obj-335", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-343", 0 ],
									"source" : [ "obj-340", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-345", 0 ],
									"source" : [ "obj-340", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-341", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-341", 0 ],
									"source" : [ "obj-342", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-356", 0 ],
									"source" : [ "obj-347", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-358", 0 ],
									"source" : [ "obj-347", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-360", 0 ],
									"source" : [ "obj-347", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-348", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-348", 0 ],
									"source" : [ "obj-349", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-350", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-350", 0 ],
									"source" : [ "obj-351", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-352", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-352", 0 ],
									"source" : [ "obj-353", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-354", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-354", 0 ],
									"source" : [ "obj-355", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-371", 0 ],
									"source" : [ "obj-362", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-373", 0 ],
									"source" : [ "obj-362", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-375", 0 ],
									"source" : [ "obj-362", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-363", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-363", 0 ],
									"source" : [ "obj-364", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-365", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-365", 0 ],
									"source" : [ "obj-366", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-367", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-367", 0 ],
									"source" : [ "obj-368", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-369", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-369", 0 ],
									"source" : [ "obj-370", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-388", 0 ],
									"source" : [ "obj-377", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-390", 0 ],
									"source" : [ "obj-377", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-392", 0 ],
									"source" : [ "obj-377", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-378", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-378", 0 ],
									"source" : [ "obj-379", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-380", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-380", 0 ],
									"source" : [ "obj-381", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-382", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-382", 0 ],
									"source" : [ "obj-383", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-384", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-384", 0 ],
									"source" : [ "obj-385", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-386", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-386", 0 ],
									"source" : [ "obj-387", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-399", 0 ],
									"source" : [ "obj-394", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-395", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-395", 0 ],
									"source" : [ "obj-396", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-397", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-397", 0 ],
									"source" : [ "obj-398", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-402", 0 ],
									"source" : [ "obj-401", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-404", 0 ],
									"source" : [ "obj-401", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-409", 0 ],
									"source" : [ "obj-406", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-411", 0 ],
									"source" : [ "obj-406", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-407", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-407", 0 ],
									"source" : [ "obj-408", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-422", 0 ],
									"source" : [ "obj-413", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-424", 0 ],
									"source" : [ "obj-413", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-426", 0 ],
									"source" : [ "obj-413", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-414", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-414", 0 ],
									"source" : [ "obj-415", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-416", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-416", 0 ],
									"source" : [ "obj-417", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-418", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-418", 0 ],
									"source" : [ "obj-419", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-420", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-420", 0 ],
									"source" : [ "obj-421", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-437", 0 ],
									"source" : [ "obj-428", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-439", 0 ],
									"source" : [ "obj-428", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-441", 0 ],
									"source" : [ "obj-428", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-429", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-429", 0 ],
									"source" : [ "obj-430", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-431", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-431", 0 ],
									"source" : [ "obj-432", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-433", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-433", 0 ],
									"source" : [ "obj-434", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-435", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-435", 0 ],
									"source" : [ "obj-436", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-454", 0 ],
									"source" : [ "obj-443", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-456", 0 ],
									"source" : [ "obj-443", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-458", 0 ],
									"source" : [ "obj-443", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-444", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-444", 0 ],
									"source" : [ "obj-445", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-446", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-446", 0 ],
									"source" : [ "obj-447", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-448", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-448", 0 ],
									"source" : [ "obj-449", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-450", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-450", 0 ],
									"source" : [ "obj-451", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-452", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-452", 0 ],
									"source" : [ "obj-453", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-465", 0 ],
									"source" : [ "obj-460", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-461", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-461", 0 ],
									"source" : [ "obj-462", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-463", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-463", 0 ],
									"source" : [ "obj-464", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-468", 0 ],
									"source" : [ "obj-467", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-470", 0 ],
									"source" : [ "obj-467", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-60", 0 ],
									"source" : [ "obj-47", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-62", 0 ],
									"source" : [ "obj-47", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-475", 0 ],
									"source" : [ "obj-472", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-477", 0 ],
									"source" : [ "obj-472", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-473", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-473", 0 ],
									"source" : [ "obj-474", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-488", 0 ],
									"source" : [ "obj-479", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-490", 0 ],
									"source" : [ "obj-479", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-492", 0 ],
									"source" : [ "obj-479", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-48", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-480", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-480", 0 ],
									"source" : [ "obj-481", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-482", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-482", 0 ],
									"source" : [ "obj-483", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-484", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-484", 0 ],
									"source" : [ "obj-485", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-486", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-486", 0 ],
									"source" : [ "obj-487", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-48", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-503", 0 ],
									"source" : [ "obj-494", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-505", 0 ],
									"source" : [ "obj-494", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-507", 0 ],
									"source" : [ "obj-494", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-495", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-495", 0 ],
									"source" : [ "obj-496", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-497", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-497", 0 ],
									"source" : [ "obj-498", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-499", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-50", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-499", 0 ],
									"source" : [ "obj-500", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-501", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-501", 0 ],
									"source" : [ "obj-502", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-520", 0 ],
									"source" : [ "obj-509", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-522", 0 ],
									"source" : [ "obj-509", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-524", 0 ],
									"source" : [ "obj-509", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-50", 0 ],
									"source" : [ "obj-51", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-510", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-510", 0 ],
									"source" : [ "obj-511", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-512", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-512", 0 ],
									"source" : [ "obj-513", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-514", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-514", 0 ],
									"source" : [ "obj-515", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-516", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-516", 0 ],
									"source" : [ "obj-517", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-518", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-518", 0 ],
									"source" : [ "obj-519", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-531", 0 ],
									"source" : [ "obj-526", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-527", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-527", 0 ],
									"source" : [ "obj-528", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-529", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-52", 0 ],
									"source" : [ "obj-53", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-529", 0 ],
									"source" : [ "obj-530", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-534", 0 ],
									"source" : [ "obj-533", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-536", 0 ],
									"source" : [ "obj-533", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-541", 0 ],
									"source" : [ "obj-538", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-543", 0 ],
									"source" : [ "obj-538", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-539", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-54", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-539", 0 ],
									"source" : [ "obj-540", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-554", 0 ],
									"source" : [ "obj-545", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-556", 0 ],
									"source" : [ "obj-545", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-558", 0 ],
									"source" : [ "obj-545", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-546", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-546", 0 ],
									"source" : [ "obj-547", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-548", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-548", 0 ],
									"source" : [ "obj-549", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-55", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-550", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-550", 0 ],
									"source" : [ "obj-551", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-552", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-552", 0 ],
									"source" : [ "obj-553", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-56", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-569", 0 ],
									"source" : [ "obj-560", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-571", 0 ],
									"source" : [ "obj-560", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-573", 0 ],
									"source" : [ "obj-560", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-561", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-561", 0 ],
									"source" : [ "obj-562", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-563", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-563", 0 ],
									"source" : [ "obj-564", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-565", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-565", 0 ],
									"source" : [ "obj-566", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-567", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-567", 0 ],
									"source" : [ "obj-568", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-56", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-586", 0 ],
									"source" : [ "obj-575", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-588", 0 ],
									"source" : [ "obj-575", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-590", 0 ],
									"source" : [ "obj-575", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-576", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-576", 0 ],
									"source" : [ "obj-577", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-578", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-578", 0 ],
									"source" : [ "obj-579", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-580", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-580", 0 ],
									"source" : [ "obj-581", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-582", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-582", 0 ],
									"source" : [ "obj-583", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-584", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-584", 0 ],
									"source" : [ "obj-585", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-597", 0 ],
									"source" : [ "obj-592", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-593", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-593", 0 ],
									"source" : [ "obj-594", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-595", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-595", 0 ],
									"source" : [ "obj-596", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-600", 0 ],
									"source" : [ "obj-599", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-602", 0 ],
									"source" : [ "obj-599", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-607", 0 ],
									"source" : [ "obj-604", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-609", 0 ],
									"source" : [ "obj-604", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-605", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-605", 0 ],
									"source" : [ "obj-606", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-620", 0 ],
									"source" : [ "obj-611", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-622", 0 ],
									"source" : [ "obj-611", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-624", 0 ],
									"source" : [ "obj-611", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-612", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-612", 0 ],
									"source" : [ "obj-613", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-614", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-614", 0 ],
									"source" : [ "obj-615", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-616", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-616", 0 ],
									"source" : [ "obj-617", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-618", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-618", 0 ],
									"source" : [ "obj-619", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-635", 0 ],
									"source" : [ "obj-626", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-637", 0 ],
									"source" : [ "obj-626", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-639", 0 ],
									"source" : [ "obj-626", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-627", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-627", 0 ],
									"source" : [ "obj-628", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-629", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-629", 0 ],
									"source" : [ "obj-630", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-631", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-631", 0 ],
									"source" : [ "obj-632", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-633", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-633", 0 ],
									"source" : [ "obj-634", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-69", 0 ],
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-652", 0 ],
									"source" : [ "obj-641", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-654", 0 ],
									"source" : [ "obj-641", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-656", 0 ],
									"source" : [ "obj-641", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-642", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-642", 0 ],
									"source" : [ "obj-643", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-644", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-644", 0 ],
									"source" : [ "obj-645", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-646", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-646", 0 ],
									"source" : [ "obj-647", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-648", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-648", 0 ],
									"source" : [ "obj-649", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-65", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-650", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-650", 0 ],
									"source" : [ "obj-651", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-663", 0 ],
									"source" : [ "obj-658", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-659", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-65", 0 ],
									"source" : [ "obj-66", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-659", 0 ],
									"source" : [ "obj-660", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-661", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-661", 0 ],
									"source" : [ "obj-662", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-666", 0 ],
									"source" : [ "obj-665", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-668", 0 ],
									"source" : [ "obj-665", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-67", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-673", 0 ],
									"source" : [ "obj-670", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-675", 0 ],
									"source" : [ "obj-670", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-671", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-671", 0 ],
									"source" : [ "obj-672", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-686", 0 ],
									"source" : [ "obj-677", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-688", 0 ],
									"source" : [ "obj-677", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-690", 0 ],
									"source" : [ "obj-677", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-678", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-678", 0 ],
									"source" : [ "obj-679", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-67", 0 ],
									"source" : [ "obj-68", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-680", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-680", 0 ],
									"source" : [ "obj-681", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-682", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-682", 0 ],
									"source" : [ "obj-683", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-684", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-684", 0 ],
									"source" : [ "obj-685", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-701", 0 ],
									"source" : [ "obj-692", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-703", 0 ],
									"source" : [ "obj-692", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-705", 0 ],
									"source" : [ "obj-692", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-693", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-693", 0 ],
									"source" : [ "obj-694", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-695", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-695", 0 ],
									"source" : [ "obj-696", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-697", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-697", 0 ],
									"source" : [ "obj-698", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-699", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-699", 0 ],
									"source" : [ "obj-700", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-718", 0 ],
									"source" : [ "obj-707", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-720", 0 ],
									"source" : [ "obj-707", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-722", 0 ],
									"source" : [ "obj-707", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-708", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-708", 0 ],
									"source" : [ "obj-709", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"order" : 2,
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-72", 0 ],
									"order" : 0,
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"order" : 0,
									"source" : [ "obj-71", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 1 ],
									"order" : 1,
									"source" : [ "obj-71", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"order" : 1,
									"source" : [ "obj-71", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-710", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-710", 0 ],
									"source" : [ "obj-711", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-712", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-712", 0 ],
									"source" : [ "obj-713", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-714", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-714", 0 ],
									"source" : [ "obj-715", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-716", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-716", 0 ],
									"source" : [ "obj-717", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-729", 0 ],
									"source" : [ "obj-724", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-725", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-725", 0 ],
									"source" : [ "obj-726", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"source" : [ "obj-727", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-727", 0 ],
									"source" : [ "obj-728", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-732", 0 ],
									"source" : [ "obj-731", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-734", 0 ],
									"source" : [ "obj-731", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-739", 0 ],
									"source" : [ "obj-736", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-741", 0 ],
									"source" : [ "obj-736", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-737", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-737", 0 ],
									"source" : [ "obj-738", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-79", 0 ],
									"source" : [ "obj-76", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-81", 0 ],
									"source" : [ "obj-76", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"source" : [ "obj-78", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-92", 0 ],
									"source" : [ "obj-83", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-94", 0 ],
									"source" : [ "obj-83", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-96", 0 ],
									"source" : [ "obj-83", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-84", 0 ],
									"source" : [ "obj-85", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-86", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-86", 0 ],
									"source" : [ "obj-87", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-88", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 0 ],
									"source" : [ "obj-89", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-90", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-90", 0 ],
									"source" : [ "obj-91", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-107", 0 ],
									"source" : [ "obj-98", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-109", 0 ],
									"source" : [ "obj-98", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-111", 0 ],
									"source" : [ "obj-98", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-26", 0 ],
									"source" : [ "obj-99", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 692.0, 1589.0, 88.0, 22.0 ],
					"text" : "gen~ controller"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-45",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 391.5, 1408.0, 84.0, 22.0 ],
					"text" : "prepend client"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 6,
					"outlettype" : [ "", "", "", "", "", "" ],
					"patching_rect" : [ 391.5, 1441.0, 103.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "gesture_data.js",
						"parameter_enable" : 0
					}
,
					"text" : "js gesture_data.js"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 223.0, 1228.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 543.0, 580.0, 150.0, 20.0 ],
					"text" : "Data Poll Rate"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 208.0, 1213.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 517.0, 544.0, 150.0, 20.0 ],
					"text" : "Turn Visual Feedback on"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-15",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 441.0, 719.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 491.0, 580.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 969.0, 868.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 968.0, 900.0, 111.0, 22.0 ],
					"text" : "fill 1, apply hanning"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-56",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 968.0, 929.0, 148.0, 22.0 ],
					"text" : "buffer~ win @samps 4096"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-63",
					"index" : 0,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 782.5, 1585.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 128.5, 786.5, 126.0, 22.0 ],
					"text" : "metro 1000 @active 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 128.5, 903.5, 89.0, 22.0 ],
					"text" : "ensurespeaker"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 839.0, 1648.5, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-67",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 839.0, 1675.5, 29.5, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 531.5, 10.0, 29.5, 22.0 ],
					"text" : "-12"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-68",
					"lastchannelcount" : 0,
					"maxclass" : "live.gain~",
					"numinlets" : 2,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "", "float", "list" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 940.0, 1742.5, 123.0, 130.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 472.0, 10.0, 68.0, 137.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_shortname" : "live.gain~",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4,
							"parameter_mmin" : -70.0,
							"parameter_longname" : "live.gain~[1]",
							"parameter_mmax" : 6.0
						}

					}
,
					"varname" : "vrSource2CHMain"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 708.0, 990.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.996078, 0.031373, 0.031373, 1.0 ],
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 1040.0, 1564.0, 68.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 576.0, 10.0, 68.0, 22.0 ],
					"text" : "gen~ world",
					"varname" : "world"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-71",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 470.75, 903.5, 35.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 592.5, 99.5, 35.0, 22.0 ],
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-74",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 109.0, 157.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-150",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 177.0, 66.0, 22.0 ],
									"text" : "unpack s s"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-147",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "float" ],
									"patching_rect" : [ 50.5, 100.0, 63.0, 22.0 ],
									"text" : "unpack s f"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-146",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 212.0, 263.0, 22.0 ],
									"text" : "sprintf replace nodes::%s::%s::_props::value %f"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-143",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 140.0, 153.0, 22.0 ],
									"text" : "fromsymbol @separator __"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-53",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.5, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-54",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 294.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-150", 0 ],
									"source" : [ "obj-143", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-54", 0 ],
									"source" : [ "obj-146", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-143", 0 ],
									"source" : [ "obj-147", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-146", 2 ],
									"midpoints" : [ 104.0, 136.5, 303.5, 136.5 ],
									"source" : [ "obj-147", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-146", 1 ],
									"source" : [ "obj-150", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-146", 0 ],
									"source" : [ "obj-150", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-147", 0 ],
									"source" : [ "obj-53", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 274.5, 1264.0, 89.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p format_patch"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "dictionary", "", "", "" ],
					"patching_rect" : [ 692.0, 1024.0, 67.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "dict ranges"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-85",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 430.0, 990.0, 94.0, 22.0 ],
					"text" : "prepend symbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "" ],
					"patching_rect" : [ 320.25, 1083.0, 63.0, 22.0 ],
					"text" : "unpack f s"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "dictionary", "", "", "" ],
					"patching_rect" : [ 274.5, 1292.0, 60.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "dict patch"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-142",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 370.0, 1264.0, 146.0, 22.0 ],
					"text" : "prepend script send world"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-137",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "clear", "", "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 990.0, 252.0, 656.0, 720.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-5",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 246.0, 508.0, 155.0, 22.0 ],
									"text" : "bang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 202.0, -3.0, 150.0, 20.0 ],
									"text" : "value comes uin here"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 51.0, 48.0, 61.0, 22.0 ],
									"text" : "pipe 2000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 409.0, 284.0, 54.0, 22.0 ],
									"text" : "deferlow"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 98.0, 150.0, 71.0, 22.0 ],
									"text" : "route deltas"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-21",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 409.0, 344.0, 31.0, 22.0 ],
									"text" : "t b s"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-20",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 449.0, 373.0, 29.5, 22.0 ],
									"text" : "f"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "float", "float", "float" ],
									"patching_rect" : [ 409.0, 310.0, 77.0, 22.0 ],
									"text" : "unpack s f f f"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Helvetica Neue Light",
									"fontsize" : 12.0,
									"id" : "obj-23",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 431.0, -3.0, 132.0, 35.0 ],
									"text" : "pong 0. 1. @mode wrap"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 6,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 169.0, 87.0, 71.5, 35.0 ],
									"text" : "scale 0. 1. 0. 1."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-16",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "clear" ],
									"patching_rect" : [ 51.0, 379.0, 47.0, 22.0 ],
									"text" : "t l clear"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 52.5, 414.0, 25.0, 22.0 ],
									"text" : "iter"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "set" ],
									"patching_rect" : [ 409.0, 147.0, 31.0, 22.0 ],
									"text" : "t set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 409.0, 109.0, 53.0, 22.0 ],
									"text" : "sel clear"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-12",
									"index" : 5,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 427.0, 52.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 451.0, 96.0, 22.0 ],
									"text" : "prepend append"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 0,
											"revision" : 2,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-3",
													"linecount" : 19,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 100.0, 273.0, 116.0 ],
													"text" : "deltas outs_1__volume lfo_0_120__onset lfo_0_120__pulse_width lfo_0_120__index lfo_0_120__rate pulsars_0_121__period pulsars_0_121__formant vco_0_122__rate vco_0_120__rate vca_0_120__cv_amount vca_0_120__bias lfo_0_121__onset lfo_0_121__pulse_width lfo_0_121__index lfo_0_121__rate vco_0_121__rate vco_0_123__rate vco_0_124__rate vco_0_125__rate vco_0_126__rate resofilter_0_121__frequency resofilter_0_121__resonance freevoib_0_122__feedback_2 freevoib_0_122__damping freevoib_0_122__feedback_1 freevoib_0_122__spread lfo_0_124__onset lfo_0_124__pulse_width lfo_0_124__index lfo_0_124__rate knob_2__voltage vca_0_122__cv_amount vca_0_122__bias"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-7",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-8",
													"index" : 2,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 81.0, 40.0, 30.0, 30.0 ]
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-9",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 50.0, 785.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 1 ],
													"source" : [ "obj-8", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 50.0, 284.0, 50.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 50.0, 250.0, 29.5, 22.0 ],
									"text" : "t b l"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 318.0, 40.0, 22.0 ],
									"text" : "zl.thin"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-126",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 169.0, 294.0, 45.0, 22.0 ],
									"text" : "zl.rot 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-125",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 169.0, 250.0, 50.0, 22.0 ],
									"text" : "pack f s"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-124",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 294.0, 200.0, 72.0, 22.0 ],
									"text" : "prepend set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-123",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 90.5, 250.0, 73.0, 22.0 ],
									"text" : "prepend get"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-120",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 4,
									"outlettype" : [ "", "float", "float", "float" ],
									"patching_rect" : [ 294.0, 156.0, 77.0, 22.0 ],
									"text" : "unpack s f f f"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-118",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 200.0, 96.0, 22.0 ],
									"text" : "prepend append"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-117",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 100.0, 47.0, 22.0 ],
									"text" : "zl.nth 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-129",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 4.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-130",
									"index" : 3,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 199.75, 196.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-131",
									"index" : 4,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 294.0, 82.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-132",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 169.0, -3.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-133",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 491.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-134",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 126.0, 294.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-135",
									"index" : 4,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 294.0, 227.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-136",
									"index" : 3,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 169.0, 361.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 1 ],
									"order" : 0,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-16", 0 ],
									"order" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-133", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-118", 0 ],
									"source" : [ "obj-117", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-118", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-124", 0 ],
									"source" : [ "obj-120", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 4 ],
									"source" : [ "obj-120", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 3 ],
									"source" : [ "obj-120", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-134", 0 ],
									"source" : [ "obj-123", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-135", 0 ],
									"source" : [ "obj-124", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-126", 0 ],
									"source" : [ "obj-125", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-136", 0 ],
									"source" : [ "obj-126", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-129", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-123", 0 ],
									"midpoints" : [ 209.25, 237.5, 100.0, 237.5 ],
									"order" : 1,
									"source" : [ "obj-130", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-125", 1 ],
									"order" : 0,
									"source" : [ "obj-130", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-120", 0 ],
									"source" : [ "obj-131", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-132", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-133", 0 ],
									"source" : [ "obj-16", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-16", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"source" : [ "obj-17", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 1 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-125", 0 ],
									"source" : [ "obj-20", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-125", 1 ],
									"source" : [ "obj-21", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 0 ],
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"disabled" : 1,
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-20", 1 ],
									"source" : [ "obj-3", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-4", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-125", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-117", 0 ],
									"order" : 1,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-17", 0 ],
									"order" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 253.75, 1060.0, 50.5, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p set"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-122",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 320.25, 1122.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 357.0, 44.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-119",
					"items" : [ "deltas", ",", "outs_1__volume", ",", "lfo_0_120__onset", ",", "lfo_0_120__pulse_width", ",", "lfo_0_120__index", ",", "lfo_0_120__rate", ",", "pulsars_0_121__period", ",", "pulsars_0_121__formant", ",", "vco_0_122__rate", ",", "vco_0_120__rate", ",", "vca_0_120__cv_amount", ",", "vca_0_120__bias", ",", "lfo_0_121__onset", ",", "lfo_0_121__pulse_width", ",", "lfo_0_121__index", ",", "lfo_0_121__rate", ",", "vco_0_121__rate", ",", "vco_0_123__rate", ",", "vco_0_124__rate", ",", "vco_0_125__rate", ",", "vco_0_126__rate", ",", "resofilter_0_121__frequency", ",", "resofilter_0_121__resonance", ",", "freevoib_0_122__feedback_2", ",", "freevoib_0_122__damping", ",", "freevoib_0_122__feedback_1", ",", "freevoib_0_122__spread", ",", "lfo_0_124__onset", ",", "lfo_0_124__pulse_width", ",", "lfo_0_124__index", ",", "lfo_0_124__rate", ",", "knob_2__voltage", ",", "vca_0_122__cv_amount", ",", "vca_0_122__bias" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 498.0, 1072.0, 100.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 491.0, 147.0, 236.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.996078431372549, 0.0, 0.0, 1.0 ],
					"id" : "obj-78",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 370.0, 1292.0, 67.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-79",
					"maxclass" : "dict.view",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 692.0, 1122.0, 356.0, 329.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 491.0, 172.0, 328.0, 168.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-80",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 235.0, 707.5, 84.0, 22.0 ],
					"text" : "prepend client"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 10,
					"outlettype" : [ "", "", "", "", "", "", "", "", "", "" ],
					"patching_rect" : [ 235.0, 950.5, 241.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "msvr_world.js",
						"parameter_enable" : 0
					}
,
					"text" : "js msvr_world.js @watch 1 @autocompile 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-86",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 509.0, 903.5, 50.0, 22.0 ],
					"text" : "compile"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1178.5, 1334.0, 75.0, 49.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 59.0, 461.0, 156.0, 22.0 ],
					"text" : "script start 192.168.137.1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1422.0, 43.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1414.0, 144.0, 69.0, 22.0 ],
					"text" : "metro 5000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1414.0, 241.428573608398438, 99.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 365.0, 147.0, 105.0, 22.0 ],
					"text" : "scene_rich.json"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 222.0, 508.0, 54.0, 22.0 ],
					"text" : "onecopy"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 496.0, 348.0, 45.0, 45.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 429.0, 486.0, 28.0, 28.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "dictionary" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 50.0, 100.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 4,
									"outlettype" : [ "dictionary", "", "", "" ],
									"patching_rect" : [ 147.0, 111.0, 50.5, 22.0 ],
									"saved_object_attributes" : 									{
										"embed" : 0,
										"parameter_enable" : 0,
										"parameter_mappable" : 0
									}
,
									"text" : "dict"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-9",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 147.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-10",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 147.0, 193.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 235.0, 273.0, 41.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p disp"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-143",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 84.0, 129.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-9",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 390.0, 170.0, 48.0, 22.0 ],
									"text" : "del 500"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 390.0, 230.0, 55.0, 22.0 ],
									"text" : "del 1500"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 390.0, 200.0, 54.0, 22.0 ],
									"text" : "deferlow"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 390.0, 140.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-137",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 248.2545166015625, 54.0, 22.0 ],
									"text" : "deferlow"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-136",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 50.0, 198.2545166015625, 32.0, 22.0 ],
									"text" : "t b b"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 274.2545166015625, 169.0, 22.0 ],
									"text" : "loadmess script start localhost"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-19",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 178.0, 108.2545166015625, 63.0, 22.0 ],
									"text" : "script stop"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-141",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-142",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 181.0, 322.31884765625, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-137", 0 ],
									"source" : [ "obj-136", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-19", 0 ],
									"source" : [ "obj-136", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"source" : [ "obj-137", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-136", 0 ],
									"source" : [ "obj-141", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-142", 0 ],
									"source" : [ "obj-19", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-142", 0 ],
									"source" : [ "obj-37", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-9", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-7", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"disabled" : 1,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-9", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1227.0, 246.0, 47.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p client"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-140",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1227.0, 217.0, 112.0, 22.2545166015625 ],
					"presentation" : 1,
					"presentation_rect" : [ 59.0, 490.0, 108.0, 20.0 ],
					"text" : "Connect Localhost",
					"texton" : "Restarting..."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-135",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1189.0, 698.0, 151.0, 47.0 ],
					"presentation" : 1,
					"presentation_linecount" : 3,
					"presentation_rect" : [ 263.0, 263.0, 151.0, 47.0 ],
					"text" : "To do: fork a scene! \ni.e. branch off from loaded scene"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-134",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1189.0, 656.0, 150.0, 33.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 263.0, 228.0, 150.0, 33.0 ],
					"text" : "To do: Save a scene! \ni.e. save an OT history"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-132",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 160.5, 100.0, 159.0, 22.0 ],
									"text" : "clearchecks, checkitem $1 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-114",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 129.0, 113.0, 22.0 ],
									"text" : "prepend loadScene"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-128",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-129",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 160.5, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-130",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 211.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-131",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 160.5, 211.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-130", 0 ],
									"source" : [ "obj-114", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-114", 0 ],
									"source" : [ "obj-128", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"source" : [ "obj-129", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-131", 0 ],
									"source" : [ "obj-39", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1160.5, 148.0, 51.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p scene"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-127",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1041.0, 69.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 263.0, 125.0, 150.0, 20.0 ],
					"text" : "Clear current scene"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-126",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1171.0, 95.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 263.0, 172.0, 150.0, 20.0 ],
					"text" : "Load a scene"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-116",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1041.0, 118.0, 69.0, 22.0 ],
					"text" : "clearScene"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-113",
					"items" : "<empty>",
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1160.5, 121.0, 192.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 263.0, 194.0, 155.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-112",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1041.0, 91.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 263.0, 147.0, 100.0, 20.0 ],
					"text" : "Clear Scene",
					"texton" : "Clearing Scene..."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-111",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 633.0, 40.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 256.0, 10.0, 150.0, 20.0 ],
					"text" : "Record a Session"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-109",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 969.0, 368.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-4",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 502.0, 301.0, 63.0, 35.0 ],
									"text" : "loadmess set"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "" ],
									"patching_rect" : [ 172.0, 79.0, 44.0, 22.0 ],
									"text" : "sel 0 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 279.0, 56.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 169.0, 16.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-91",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 463.0, 268.0, 157.0, 22.0 ],
									"text" : "prepend set Session Name:"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-88",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 252.0, 100.0, 55.0, 22.0 ],
									"text" : "hidden 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-87",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 274.0, 285.0, 55.0, 22.0 ],
									"text" : "hidden 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-86",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 209.0, 240.0, 22.0, 22.0 ],
									"text" : "t b"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-85",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 176.0, 133.0, 58.0, 22.0 ],
									"text" : "loadbang"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-84",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 176.0, 162.0, 55.0, 22.0 ],
									"text" : "hidden 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-82",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 209.0, 285.0, 55.0, 22.0 ],
									"text" : "hidden 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-68",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 172.0, 70.0, 22.0 ],
									"text" : "stopRecord"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-64",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 369.0, 268.0, 90.0, 22.0 ],
									"text" : "prepend record"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-63",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 448.0, 138.0, 77.0, 22.0 ],
									"text" : "route symbol"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-58",
									"linecount" : 2,
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 448.0, 110.0, 142.0, 35.0 ],
									"text" : "dialog Enter Session Title"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-103",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 26.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-104",
									"index" : 3,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 448.0, 59.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-105",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 107.0, 357.650390625, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-106",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 203.5, 357.650390625, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-107",
									"index" : 3,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 274.0, 357.650390625, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-108",
									"index" : 4,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 463.0, 357.650390625, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-68", 0 ],
									"order" : 2,
									"source" : [ "obj-103", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-84", 0 ],
									"order" : 1,
									"source" : [ "obj-103", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 0 ],
									"order" : 0,
									"source" : [ "obj-103", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"source" : [ "obj-104", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-84", 0 ],
									"order" : 1,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 0 ],
									"order" : 0,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-108", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-63", 0 ],
									"source" : [ "obj-58", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-64", 0 ],
									"order" : 1,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-91", 0 ],
									"order" : 0,
									"source" : [ "obj-63", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-106", 0 ],
									"order" : 0,
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-86", 0 ],
									"order" : 1,
									"source" : [ "obj-64", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-106", 0 ],
									"source" : [ "obj-68", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-105", 0 ],
									"source" : [ "obj-82", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-105", 0 ],
									"source" : [ "obj-84", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-84", 0 ],
									"source" : [ "obj-85", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-82", 0 ],
									"order" : 1,
									"source" : [ "obj-86", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-87", 0 ],
									"order" : 0,
									"source" : [ "obj-86", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-107", 0 ],
									"source" : [ "obj-87", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-107", 0 ],
									"source" : [ "obj-88", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-108", 0 ],
									"source" : [ "obj-91", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 633.0, 63.0, 75.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p recordings"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-102",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 109.0, 154.0, 369.0, 62.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 0,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 0,
						"enablevscroll" : 0,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontsize" : 20.0,
									"id" : "obj-5",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 357.0, 228.0, 209.0, 74.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 8.0, 16.0, 478.0, 29.0 ],
									"text" : "invalid: session filename already taken"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-3",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 275.0, 110.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 275.0, 228.0, 67.0, 22.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "front", "" ],
									"patching_rect" : [ 275.0, 194.0, 45.0, 22.0 ],
									"text" : "t front l"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-1", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"source" : [ "obj-3", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 507.20001220703125, 258.0, 109.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p Filename_Taken"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-90",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 844.0, 91.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 256.0, 80.0, 150.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"hidden" : 1,
					"id" : "obj-73",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 633.0, 91.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 256.0, 54.0, 100.0, 20.0 ],
					"text" : "Stop Recording",
					"texton" : "Stopping..."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-72",
					"maxclass" : "textbutton",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 739.0, 91.0, 100.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 256.0, 32.0, 100.0, 20.0 ],
					"text" : "Record Session",
					"texton" : "Provide Name"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-55",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "n4m.monitor.maxpat",
					"numinlets" : 1,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 1258.0, 1077.0, 400.0, 220.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 57.0, 514.0, 400.0, 220.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 308.5, 17.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 10.0, 150.0, 20.0 ],
					"text" : "Play A Session"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-50",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 462.0, 17.0, 119.0, 33.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 42.0, 215.0, 20.0 ],
					"text" : "Select a session (plays automatically)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-39",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 124.0, 159.0, 22.0 ],
									"text" : "clearchecks, checkitem $1 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-22",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 0,
											"revision" : 2,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 34.0, 79.0, 640.0, 480.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 82.5, 89.0, 81.0, 22.0 ],
													"text" : "regexp (.+)/.+"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-20",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 34.5, 10.0, 87.0, 22.0 ],
													"text" : "loadmess path"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 98.0, 175.5, 210.0, 22.0 ],
													"text" : "sprintf symout %s/session_recordings"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 34.5, 36.0, 67.0, 22.0 ],
													"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
													"text" : "thispatcher"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-6",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 98.0, 226.0, 39.0, 22.0 ],
													"text" : "folder"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-21",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 98.0, 308.0, 30.0, 30.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"source" : [ "obj-1", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"source" : [ "obj-20", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-7", 1 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 211.0, 100.0, 177.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-46",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-47",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 124.5, 206.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-22", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-39", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"source" : [ "obj-46", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 308.5, 39.0, 126.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-3",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 11.0, 215.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-2",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 11.0, 133.0, 35.0, 22.0 ],
									"text" : "clear"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 171.0, 133.0, 110.0, 22.0 ],
									"text" : "set playback active"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 133.0, 119.0, 22.0 ],
									"text" : "set playback inactive"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-30",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 3,
									"outlettype" : [ "bang", "bang", "" ],
									"patching_rect" : [ 50.0, 100.0, 44.0, 22.0 ],
									"text" : "sel 0 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-40",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-41",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 104.5, 215.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"order" : 1,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"order" : 0,
									"source" : [ "obj-30", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"midpoints" : [ 72.0, 127.0, 180.5, 127.0 ],
									"source" : [ "obj-30", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 310.0, 273.0, 100.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p playbackStatus"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-36",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 391.0, 301.0, 150.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 114.0, 150.0, 20.0 ],
					"text" : "playback inactive"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "dict.view",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 235.0, 317.0, 80.0, 76.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 136.0, 215.0, 170.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 10,
					"numoutlets" : 10,
					"outlettype" : [ "", "", "", "", "", "", "", "", "", "" ],
					"patching_rect" : [ 235.0, 221.0, 631.0, 22.0 ],
					"text" : "route playback playbackStatus clearPlaybackList playbackList filenameExists sceneList recordStatus toGen userData"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 510.0, 63.0, 80.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 88.0, 80.0, 22.0 ],
					"text" : "stopPlayback"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 395.0, 129.0, 73.0, 22.0 ],
					"text" : "playback $1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"items" : "<empty>",
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 308.5, 63.0, 192.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 64.0, 215.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 235.0, 186.0, 197.0, 22.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 206.0, 426.5, 190.0, 35.0 ],
					"saved_object_attributes" : 					{
						"autostart" : 0,
						"defer" : 0,
						"node" : "",
						"npm" : "",
						"watch" : 1
					}
,
					"text" : "node.script max_client.js @watch 1"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.756862745098039, 0.756862745098039, 0.756862745098039, 1.0 ],
					"border" : 3,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-51",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 308.5, 91.0, 24.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 3.0, 6.0, 236.0, 313.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.756862745098039, 0.756862745098039, 0.756862745098039, 1.0 ],
					"border" : 3,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-110",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 323.5, 106.0, 24.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 245.0, 6.0, 189.0, 108.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"bgcolor" : [ 0.756862745098039, 0.756862745098039, 0.756862745098039, 1.0 ],
					"border" : 3,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-124",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 338.5, 121.0, 24.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 245.0, 120.0, 189.0, 198.0 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "signal", "signal", "" ],
					"patching_rect" : [ 1040.0, 1648.5, 178.0, 22.0 ],
					"text" : "vr.source~ 0 @position 0.75 1 0",
					"varname" : "source_1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "signal", "signal", "" ],
					"patching_rect" : [ 1040.0, 1650.0, 178.0, 22.0 ],
					"text" : "vr.source~ 0 @position 0.75 1 0",
					"varname" : "source_1[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "signal", "signal", "" ],
					"patching_rect" : [ 1140.0, 1650.0, 178.0, 22.0 ],
					"text" : "vr.source~ 1 @position 0.75 1 0",
					"varname" : "source_2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "signal", "signal", "" ],
					"patching_rect" : [ 1240.0, 1650.0, 178.0, 22.0 ],
					"text" : "vr.source~ 2 @position 0.75 1 0",
					"varname" : "source_3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "signal", "signal", "" ],
					"patching_rect" : [ 1340.0, 1650.0, 178.0, 22.0 ],
					"text" : "vr.source~ 3 @position 0.75 1 0",
					"varname" : "source_4"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 661.166666666666629, 177.0, 244.5, 177.0 ],
					"source" : [ "obj-109", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"midpoints" : [ 679.833333333333371, 87.5, 748.5, 87.5 ],
					"source" : [ "obj-109", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"source" : [ "obj-109", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"midpoints" : [ 698.5, 87.5, 853.5, 87.5 ],
					"source" : [ "obj-109", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-132", 0 ],
					"midpoints" : [ 1256.5, 145.0, 1170.0, 145.0 ],
					"order" : 1,
					"source" : [ "obj-113", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-132", 1 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 1 ],
					"order" : 0,
					"source" : [ "obj-113", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 1050.5, 177.5, 244.5, 177.5 ],
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-118", 0 ],
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 2 ],
					"midpoints" : [ 548.0, 1052.5, 279.0, 1052.5 ],
					"source" : [ "obj-119", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-125", 0 ],
					"source" : [ "obj-121", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 1 ],
					"midpoints" : [ 329.75, 1158.0, 239.4375, 1158.0, 239.4375, 1049.0, 271.125, 1049.0 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 0 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"midpoints" : [ 1202.0, 180.0, 1155.0, 180.0, 1155.0, 110.0, 1170.0, 110.0 ],
					"source" : [ "obj-132", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 1170.0, 177.5, 244.5, 177.5 ],
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-136", 1 ],
					"source" : [ "obj-133", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-145", 0 ],
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 2 ],
					"source" : [ "obj-136", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"midpoints" : [ 263.25, 1196.0, 457.875, 1196.0, 457.875, 1013.0, 507.5, 1013.0 ],
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"midpoints" : [ 294.75, 1112.5, 329.75, 1112.5 ],
					"source" : [ "obj-137", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-142", 0 ],
					"midpoints" : [ 284.25, 1257.5, 379.5, 1257.5 ],
					"order" : 1,
					"source" : [ "obj-137", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"order" : 2,
					"source" : [ "obj-137", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-137", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 1 ],
					"order" : 0,
					"source" : [ "obj-137", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-14", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-143", 0 ],
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 1236.5, 278.0, 732.5, 278.0, 732.5, 177.0, 244.5, 177.0 ],
					"source" : [ "obj-143", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-136", 0 ],
					"source" : [ "obj-145", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-123", 0 ],
					"source" : [ "obj-146", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 1 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"source" : [ "obj-153", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 404.5, 177.0, 244.5, 177.0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"source" : [ "obj-172", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"source" : [ "obj-174", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 519.5, 177.0, 244.5, 177.0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-26", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"midpoints" : [ 1184.5, 214.0 ],
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 1 ],
					"order" : 0,
					"source" : [ "obj-218", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-78", 0 ],
					"order" : 1,
					"source" : [ "obj-218", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"source" : [ "obj-26", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 1 ],
					"source" : [ "obj-26", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"midpoints" : [ 584.5, 253.0, 1155.464285714285779, 253.0, 1155.464285714285779, 110.0, 1170.0, 110.0 ],
					"source" : [ "obj-26", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"midpoints" : [ 380.5, 253.0, 1155.535714285714221, 253.0, 1155.535714285714221, 110.0, 1170.0, 110.0 ],
					"order" : 0,
					"source" : [ "obj-26", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"order" : 0,
					"source" : [ "obj-26", 8 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"midpoints" : [ 448.5, 253.0, 215.5, 253.0, 215.5, 52.0, 318.0, 52.0 ],
					"source" : [ "obj-26", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"midpoints" : [ 380.5, 253.0, 215.75, 253.0, 215.75, 52.0, 318.0, 52.0 ],
					"order" : 1,
					"source" : [ "obj-26", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"midpoints" : [ 312.5, 263.5, 319.5, 263.5 ],
					"source" : [ "obj-26", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"order" : 1,
					"source" : [ "obj-26", 8 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"source" : [ "obj-26", 7 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 1 ],
					"source" : [ "obj-34", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-37", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 1 ],
					"source" : [ "obj-39", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"source" : [ "obj-4", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"midpoints" : [ 319.5, 305.0, 290.0, 305.0, 290.0, 268.0, 244.5, 268.0 ],
					"source" : [ "obj-42", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-42", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-45", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 1 ],
					"source" : [ "obj-5", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-56", 0 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 1 ],
					"order" : 1,
					"source" : [ "obj-59", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"order" : 1,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"order" : 0,
					"source" : [ "obj-59", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"order" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 1 ],
					"source" : [ "obj-61", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-62", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 1,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"midpoints" : [ 848.5, 1715.25, 949.5, 1715.25 ],
					"source" : [ "obj-67", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 1 ],
					"source" : [ "obj-68", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"midpoints" : [ 480.25, 974.25, 507.5, 974.25 ],
					"order" : 1,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"midpoints" : [ 480.25, 974.25, 701.5, 974.25 ],
					"order" : 0,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"midpoints" : [ 480.25, 939.0, 244.5, 939.0 ],
					"order" : 2,
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 2 ],
					"midpoints" : [ 748.5, 121.0, 736.5, 121.0, 736.5, 52.0, 698.5, 52.0 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 0 ],
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"source" : [ "obj-74", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 3 ],
					"source" : [ "obj-76", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-132", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 1 ],
					"order" : 1,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"order" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 4 ],
					"source" : [ "obj-81", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 0 ],
					"source" : [ "obj-81", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-218", 0 ],
					"source" : [ "obj-81", 8 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-81", 9 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 1 ],
					"order" : 0,
					"source" : [ "obj-81", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"order" : 1,
					"source" : [ "obj-81", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-104", 0 ],
					"order" : 1,
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 0 ],
					"order" : 0,
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"order" : 2,
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"midpoints" : [ 373.75, 1115.0, 427.125, 1115.0, 427.125, 979.0, 439.5, 979.0 ],
					"source" : [ "obj-84", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"midpoints" : [ 518.5, 939.0, 244.5, 939.0 ],
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"order" : 1,
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"order" : 0,
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-136", 0 ],
					"order" : 1,
					"source" : [ "obj-94", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-145", 1 ],
					"order" : 0,
					"source" : [ "obj-94", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"midpoints" : [ 574.0, 820.607879999999909, 551.037888000000066, 820.607879999999909, 551.037888000000066, 729.199416999999926, 574.0, 729.199416999999926 ],
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"order" : 0,
					"source" : [ "obj-96", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 1 ],
					"order" : 1,
					"source" : [ "obj-96", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-117", 0 ],
					"source" : [ "obj-99", 1 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-68" : [ "live.gain~[1]", "live.gain~", 0 ],
			"parameterbanks" : 			{

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "max_client.js",
				"bootpath" : "E:/GitHub/msvr/max-msp",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "n4m.monitor.maxpat",
				"bootpath" : "C74:/packages/Node For Max/patchers/debug-monitor",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "resize_n4m_monitor_patcher.js",
				"bootpath" : "C74:/packages/Node For Max/patchers/debug-monitor",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "fit_jweb_to_bounds.js",
				"bootpath" : "C74:/packages/Node For Max/patchers/debug-monitor",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "msvr_world.js",
				"bootpath" : "E:/GitHub/msvr/max-msp",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "world.gendsp",
				"bootpath" : "E:/GitHub/msvr/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "knob.gendsp",
				"bootpath" : "E:/GitHub/msvr/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "lfo.gendsp",
				"bootpath" : "E:/GitHub/msvr/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "vca.gendsp",
				"bootpath" : "E:/GitHub/msvr/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "vco.gendsp",
				"bootpath" : "E:/GitHub/msvr/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "gesture_data.js",
				"bootpath" : "E:/GitHub/msvr/max-msp",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "ffmvco.gendsp",
				"bootpath" : "E:/GitHub/msvr/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "comparator.gendsp",
				"bootpath" : "E:/GitHub/msvr/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "vr~.mxe64",
				"type" : "mx64"
			}
, 			{
				"name" : "vr~.mxe64",
				"type" : "mx64"
			}
 ],
		"autosave" : 0
	}

}
