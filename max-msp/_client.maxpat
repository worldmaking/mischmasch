{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 5,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 1097.0, 98.0, 517.0, 883.0 ],
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
		"assistshowspatchername" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1657.5, 75.5, 48.0, 22.0 ],
					"text" : "del 500"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 1657.5, 45.0, 32.0, 22.0 ],
					"text" : "t b b"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 1657.5, 19.0, 145.0, 22.0 ],
					"text" : "sel genScriptingReloaded"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-18",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 774.0, 854.0, 50.0, 50.0 ],
					"text" : "genScriptingReloaded"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 199.0, 853.0, 83.0, 22.0 ],
					"text" : "loadmess 100"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-49",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 107.0, 885.5, 90.0, 20.0 ],
					"text" : "Poll Rate (ms)"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 107.0, 237.0, 386.0 ],
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
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-24",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.0, 283.0, 42.0, 22.0 ],
									"text" : "gate 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 14.0, 161.0, 95.0, 22.0 ],
									"text" : "route toAudioviz"
								}

							}
, 							{
								"box" : 								{
									"color" : [ 0.811764705882353, 0.372549019607843, 0.372549019607843, 1.0 ],
									"id" : "obj-17",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.0, 128.0, 143.0, 22.0 ],
									"text" : "receive from_node_script"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-106",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 37.0, 205.0, 119.0, 22.0 ],
									"text" : "metro 100 @active 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-104",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 37.0, 239.0, 71.0, 22.0 ],
									"text" : "getAudioviz"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-59",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "float", "bang" ],
									"patching_rect" : [ 14.0, 58.0, 120.0, 22.0 ],
									"text" : "buffer~ audioviz 50 1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-43",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 14.0, 20.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-44",
									"index" : 2,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 137.0, 161.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-45",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 14.0, 309.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 1 ],
									"source" : [ "obj-104", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-104", 0 ],
									"source" : [ "obj-106", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"source" : [ "obj-17", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-106", 1 ],
									"source" : [ "obj-44", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 66.0, 926.0, 152.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p output_jack_visualization"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 199.0, 884.5, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.054901960784314, 0.996078431372549, 0.0, 1.0 ],
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 514.0, 1022.0, 131.0, 22.0 ],
					"text" : "send fromGenScripting"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.811764705882353, 0.372549019607843, 0.372549019607843, 1.0 ],
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 287.0, 670.0, 143.0, 22.0 ],
					"text" : "receive from_node_script"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.811764705882353, 0.372549019607843, 0.372549019607843, 1.0 ],
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 512.0, 660.0, 143.0, 22.0 ],
					"text" : "receive from_node_script"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 287.0, 706.0, 176.0, 22.0 ],
					"text" : "routepass fromLocalWebsocket"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 512.0, 701.5, 126.0, 22.0 ],
					"text" : "route toMsvr_world_js"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-63",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 471.0, 1512.0, 208.0, 22.0 ],
					"text" : "lfo_2__rate 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 379.100000000000023, 1484.0, 45.0, 22.0 ],
					"text" : "zl.rot 1"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-60",
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"minimum" : 0.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 370.0, 1397.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-57",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 379.100000000000023, 1453.0, 50.0, 22.0 ],
					"text" : "pack f s"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 369.600000000000023, 1314.0, 96.0, 22.0 ],
					"text" : "prepend append"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "float", "float" ],
					"patching_rect" : [ 369.600000000000023, 1285.0, 70.0, 22.0 ],
					"text" : "unpack s f f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-47",
					"items" : [ "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "outs_1__volume", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "outs_1__volume", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__feedback", ",", "dualvco_1__index", ",", "outs_1__volume", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "outs_1__volume", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "ffmvco_1__vco_1_rate", ",", "ffmvco_1__vco_1_waveform", ",", "ffmvco_1__vco_2_rate", ",", "ffmvco_1__vco_2_waveform", ",", "ffmvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__rate", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant", ",", "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__index", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "pulsars_1__period", ",", "pulsars_1__formant" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 369.600000000000023, 1341.0, 100.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-154",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 592.20001220703125, 1187.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-153",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 159.0, 1187.0, 150.0, 20.0 ],
					"text" : "Param Scripting"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-149",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 115.5, 1507.0, 53.0, 22.0 ],
					"text" : "prepend"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-148",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 115.5, 1474.0, 72.0, 22.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-145",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 93.0, 1435.0, 139.0, 22.0 ],
					"text" : "scale 0. 1. 0. 1."
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-144",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "float", "float" ],
					"patching_rect" : [ 138.0, 1346.0, 70.0, 22.0 ],
					"text" : "unpack s f f"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-133",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 93.0, 1187.0, 45.0, 22.0 ],
					"text" : "zl.rot 1"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-131",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "dictionary", "", "", "" ],
					"patching_rect" : [ 137.0, 1300.0, 93.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "dict namespace"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-129",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 137.0, 1257.0, 73.0, 22.0 ],
					"text" : "prepend get"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-128",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "" ],
					"patching_rect" : [ 93.0, 1220.0, 63.0, 22.0 ],
					"text" : "unpack f s"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-123",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 512.0, 1187.0, 72.0, 22.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-108",
					"maxclass" : "dict.view",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 512.0, 1252.0, 408.0, 138.0 ]
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-107",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "dictionary", "", "", "" ],
					"patching_rect" : [ 512.0, 1225.0, 93.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "dict namespace"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 825.0, 1064.0, 98.0, 22.0 ],
					"text" : "route thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-136",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 457.0, 1022.0, 54.0, 22.0 ],
					"text" : "deferlow"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-130",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 457.0, 1051.0, 256.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "deferlowScript.js",
						"parameter_enable" : 0
					}
,
					"text" : "js deferlowScript.js @autocompile 1 @watch 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 461.0, 892.0, 50.0, 22.0 ],
					"text" : "compile"
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
					"patching_rect" : [ 353.600000000000023, 1187.0, 146.0, 22.0 ],
					"text" : "prepend script send world"
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
					"patching_rect" : [ 353.600000000000023, 1257.0, 67.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-81",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 7,
					"outlettype" : [ "", "", "", "", "", "", "" ],
					"patching_rect" : [ 287.0, 980.5, 246.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "genScripting.js",
						"parameter_enable" : 0
					}
,
					"text" : "js genScripting.js @watch 1 @autocompile 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-86",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 561.0, 933.5, 50.0, 22.0 ],
					"text" : "compile"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.996078, 0.031373, 0.031373, 1.0 ],
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 72.0, 150.0, 877.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 576.0, 10.0, 68.0, 22.0 ],
					"text" : "gen~ world",
					"varname" : "world"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1350.5, 47.0, 64.0, 22.0 ],
					"text" : "script start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1351.0, 13.0, 54.0, 22.0 ],
					"text" : "deferlow"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1351.0, -15.0, 67.0, 22.0 ],
					"text" : "delay 1000"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1351.0, -45.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.054901960784314, 0.996078431372549, 0.0, 1.0 ],
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1657.5, -12.0, 144.0, 22.0 ],
					"text" : "receive fromGenScripting"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.811764705882353, 0.372549019607843, 0.372549019607843, 1.0 ],
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1094.20001220703125, 94.0, 143.0, 22.0 ],
					"text" : "receive from_node_script"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 0.811764705882353, 0.372549019607843, 0.372549019607843, 1.0 ],
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1351.0, 122.5, 131.0, 22.0 ],
					"text" : "send from_node_script"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1094.20001220703125, 127.0, 88.0, 22.0 ],
					"text" : "route userData"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1486.0, 45.0, 98.0, 22.0 ],
					"text" : "script npm install"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-33",
					"linecount" : 3,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 5,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 59.0, 107.0, 640.0, 480.0 ],
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
						"assistshowspatchername" : 0,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-125",
									"maxclass" : "dict.view",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 265.0, 127.0, 88.0, 56.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 824.0, -16.0, 303.0, 640.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-121",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "dictionary" ],
									"patching_rect" : [ 265.0, 100.0, 88.0, 22.0 ],
									"text" : "dict.deserialize"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-9",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 120.5, 312.0, 150.0, 34.0 ],
									"text" : "we can ignore the id number assigned by Vive"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-41",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 61.0, 457.0, 79.0, 22.0 ],
									"text" : "prepend quat"
								}

							}
, 							{
								"box" : 								{
									"format" : 6,
									"id" : "obj-43",
									"maxclass" : "flonum",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 61.0, 373.0, 50.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-44",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 61.0, 402.0, 49.0, 22.0 ],
									"text" : "0. $1 0."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-47",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "list", "" ],
									"patching_rect" : [ 61.0, 430.0, 77.0, 22.0 ],
									"text" : "jit.euler2quat"
								}

							}
, 							{
								"box" : 								{
									"attr" : "reverb_range",
									"id" : "obj-49",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 169.0, 468.0, 203.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "simple_room_modeling",
									"id" : "obj-57",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 169.0, 434.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "randomize_reverberation",
									"id" : "obj-24",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 169.0, 410.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "late_reverberation",
									"id" : "obj-23",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 169.0, 386.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-59",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 3,
									"outlettype" : [ "signal", "signal", "" ],
									"patching_rect" : [ 86.0, 547.0, 69.0, 22.0 ],
									"text" : "vr.context~"
								}

							}
, 							{
								"box" : 								{
									"attr" : "reverb_wet",
									"id" : "obj-60",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 169.0, 364.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "hrtf_method",
									"id" : "obj-62",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 328.0, 434.0, 150.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"attr" : "position",
									"id" : "obj-75",
									"maxclass" : "attrui",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 169.0, 516.0, 270.0, 22.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 313.0, 55.0, 22.0 ],
									"text" : "zl.slice 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-35",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 50.0, 284.0, 49.0, 22.0 ],
									"text" : "route id"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"linecount" : 5,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 69.5, 171.0, 101.0, 77.0 ],
									"text" : "id 0 quat 0.004879 0.925465 -0.015026 0.378503"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-53",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 6,
									"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "signal" ],
									"patching_rect" : [ 164.5, 133.0, 88.0, 22.0 ],
									"text" : "gen~ controller"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-45",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 84.0, 22.0 ],
									"text" : "prepend client"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 6,
									"outlettype" : [ "", "", "", "", "", "" ],
									"patching_rect" : [ 50.0, 133.0, 103.0, 22.0 ],
									"saved_object_attributes" : 									{
										"filename" : "gesture_data.js",
										"parameter_enable" : 0
									}
,
									"text" : "js gesture_data.js"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-25",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 151.5, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-30",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 86.0, 629.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-31",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 136.0, 629.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-125", 0 ],
									"source" : [ "obj-121", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-23", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-121", 0 ],
									"order" : 0,
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-45", 0 ],
									"order" : 1,
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-37", 0 ],
									"source" : [ "obj-35", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-37", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-12", 1 ],
									"source" : [ "obj-4", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"source" : [ "obj-43", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-47", 0 ],
									"source" : [ "obj-44", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-45", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"source" : [ "obj-47", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-49", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-30", 0 ],
									"source" : [ "obj-59", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-31", 0 ],
									"source" : [ "obj-59", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-60", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-62", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-59", 0 ],
									"source" : [ "obj-75", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1094.20001220703125, 154.5, 108.0, 50.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p gesture_&_HMD_&_controller_data"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-38",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1418.0, 45.0, 63.0, 22.0 ],
					"text" : "script stop"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "int" ],
					"patching_rect" : [ 1183.20001220703125, 216.5, 23.0, 118.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-58",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "int" ],
					"patching_rect" : [ 1094.20001220703125, 216.5, 23.0, 118.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 1127.20001220703125, 216.5, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-28",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 76.0, 498.5, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 10.0, 243.0, 58.0, 22.0 ],
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
					"patching_rect" : [ 10.0, 270.0, 29.5, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 531.5, 10.0, 29.5, 22.0 ],
					"text" : "-22"
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
					"patching_rect" : [ 76.0, 308.5, 123.0, 130.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 472.0, 10.0, 68.0, 137.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.gain~[1]",
							"parameter_mmax" : 6.0,
							"parameter_mmin" : -70.0,
							"parameter_shortname" : "live.gain~",
							"parameter_type" : 0,
							"parameter_unitstyle" : 4
						}

					}
,
					"varname" : "vrSource2CHMain"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1351.0, 158.0, 54.0, 22.0 ],
					"text" : "onecopy"
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
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1530.0, 138.5, 400.0, 220.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 57.0, 514.0, 400.0, 220.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1351.0, 95.0, 197.0, 22.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 188.0, 490.0, 190.0, 36.0 ],
					"saved_object_attributes" : 					{
						"autostart" : 0,
						"defer" : 0,
						"watch" : 1
					}
,
					"text" : "node.script max_client.js @watch 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "signal", "signal", "signal", "signal", "" ],
					"patching_rect" : [ 50.0, 200.0, 182.0, 22.0 ],
					"text" : "vr.source~ 0 @position 0.75 1 -1",
					"varname" : "source_1"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 1 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-108", 0 ],
					"source" : [ "obj-107", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-107", 0 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-129", 0 ],
					"source" : [ "obj-128", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-145", 0 ],
					"source" : [ "obj-128", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-131", 0 ],
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 1 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-144", 0 ],
					"source" : [ "obj-131", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-128", 0 ],
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-130", 0 ],
					"source" : [ "obj-136", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-78", 0 ],
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-145", 4 ],
					"source" : [ "obj-144", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-145", 3 ],
					"source" : [ "obj-144", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-148", 0 ],
					"midpoints" : [ 147.5, 1467.5, 125.0, 1467.5 ],
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-149", 0 ],
					"midpoints" : [ 102.5, 1499.5, 125.0, 1499.5 ],
					"source" : [ "obj-145", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-149", 0 ],
					"source" : [ "obj-148", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-142", 0 ],
					"midpoints" : [ 125.0, 1539.0, 348.050000000000011, 1539.0, 348.050000000000011, 1176.0, 363.100000000000023, 1176.0 ],
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-107", 0 ],
					"midpoints" : [ 601.70001220703125, 1216.5, 521.5, 1216.5 ],
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-78", 0 ],
					"midpoints" : [ 834.5, 1173.0, 340.0, 1173.0, 340.0, 1242.0, 363.100000000000023, 1242.0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"midpoints" : [ 1538.5, 127.25, 1539.5, 127.25 ],
					"source" : [ "obj-2", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-22", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-23", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 1 ],
					"order" : 1,
					"source" : [ "obj-33", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"order" : 0,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"order" : 0,
					"source" : [ "obj-33", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"order" : 1,
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"midpoints" : [ 1427.5, 85.5, 1360.5, 85.5 ],
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"midpoints" : [ 75.5, 963.75, 296.5, 963.75 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 1 ],
					"source" : [ "obj-47", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 0 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 0 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"order" : 1,
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 1 ],
					"order" : 0,
					"source" : [ "obj-61", 0 ]
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
					"midpoints" : [ 19.5, 304.25, 85.5, 304.25 ],
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
					"destination" : [ "obj-9", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-123", 0 ],
					"order" : 0,
					"source" : [ "obj-81", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-133", 0 ],
					"order" : 1,
					"source" : [ "obj-81", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-136", 0 ],
					"source" : [ "obj-81", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-81", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"color" : [ 1.0, 0.0, 0.0, 1.0 ],
					"destination" : [ "obj-142", 0 ],
					"order" : 0,
					"source" : [ "obj-81", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 447.833333333333371, 1007.75, 834.5, 1007.75 ],
					"source" : [ "obj-81", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"midpoints" : [ 485.666666666666629, 1012.5, 58.583333333333314, 1012.5, 58.583333333333314, 915.0, 75.5, 915.0 ],
					"source" : [ "obj-81", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"order" : 1,
					"source" : [ "obj-81", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"midpoints" : [ 570.5, 969.0, 296.5, 969.0 ],
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"midpoints" : [ 470.5, 971.75, 296.5, 971.75 ],
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-68" : [ "live.gain~[1]", "live.gain~", 0 ],
			"parameterbanks" : 			{

			}
,
			"inherited_shortname" : 1
		}
,
		"dependency_cache" : [ 			{
				"name" : "max_client.js",
				"bootpath" : "D:/github/mischmasch/max-msp",
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
				"name" : "gesture_data.js",
				"bootpath" : "D:/github/mischmasch/max-msp",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "controller.gendsp",
				"bootpath" : "D:/github/mischmasch/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "world.gendsp",
				"bootpath" : "D:/github/mischmasch/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "lfo.gendsp",
				"bootpath" : "D:/github/mischmasch/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "dualvco.gendsp",
				"bootpath" : "D:/github/mischmasch/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "vca.gendsp",
				"bootpath" : "D:/github/mischmasch/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "pulsars.gendsp",
				"bootpath" : "D:/github/mischmasch/max-msp",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "genScripting.js",
				"bootpath" : "D:/github/mischmasch/max-msp",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "deferlowScript.js",
				"bootpath" : "D:/github/mischmasch/max-msp",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
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
		"autosave" : 0,
		"boxgroups" : [ 			{
				"boxes" : [ "obj-21", "obj-19", "obj-33", "obj-58", "obj-32", "obj-30" ]
			}
 ]
	}

}
