{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 3,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 293.0, 129.0, 1605.0, 929.0 ],
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
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 889.0, 91.0, 399.0, 20.0 ],
					"text" : "^^^^^ edit this so that its sending a knob value instead of pos and orient!"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 117.0, 533.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 610.5, 989.0, 442.0, 22.0 ],
					"text" : "script send world dualvco_1__vco_2_waveform 59."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-69",
					"linecount" : 45,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1756.0, 11.0, 827.0, 612.0 ],
					"text" : "\"{\\\"cmd\\\":\\\"deltas\\\",\\\"date\\\":1555097353555,\\\"data\\\":[[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_1\\\",\\\"kind\\\":\\\"lfo\\\",\\\"pos\\\":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],\\\"orient\\\":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]},[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_1.fm_cv\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":0}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_1.phasor_sync\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_1.pulse_width_cv\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":2}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_1.rate\\\",\\\"kind\\\":\\\"large_knob\\\",\\\"range\\\":[0,80],\\\"taper\\\":\\\"log 3.8\\\",\\\"value\\\":0.17,\\\"unit\\\":\\\"Hz\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_1.index\\\",\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,10],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":3,\\\"unit\\\":\\\"float\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_1.pulse_width\\\",\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":5,\\\"unit\\\":\\\"float\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_1.onset\\\",\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":2.8,\\\"unit\\\":\\\"float\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_1.sine\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_1.phasor\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":1}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_1.pulse\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":2}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_1.sine_index\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":3}]],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_2\\\",\\\"kind\\\":\\\"lfo\\\",\\\"pos\\\":[-2.424671389806588,0.9688708758277417,-0.18653185392820404],\\\"orient\\\":[-0.19209762519910564,0.5831224304667423,0.22962993689028358,0.7552064787613966]},[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_2.fm_cv\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":0}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_2.phasor_sync\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_2.pulse_width_cv\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":2}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_2.rate\\\",\\\"kind\\\":\\\"large_knob\\\",\\\"range\\\":[0,80],\\\"taper\\\":\\\"log 3.8\\\",\\\"value\\\":375,\\\"unit\\\":\\\"Hz\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_2.index\\\",\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,10],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":21.9,\\\"unit\\\":\\\"float\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_2.pulse_width\\\",\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":0.6,\\\"unit\\\":\\\"float\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_2.onset\\\",\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":0.74,\\\"unit\\\":\\\"float\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_2.sine\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_2.phasor\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":1}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_2.pulse\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":2}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"lfo_2.sine_index\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":3}]],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1\\\",\\\"kind\\\":\\\"dualvco\\\",\\\"pos\\\":[-2.3443101728993065,1.0586006732132194,-0.7830673231770153],\\\"orient\\\":[0.2342255713614243,0.35412725955930197,0.07915509581778843,0.9019239084110882]},[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1.vco_1_cv\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":0}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1.index_cv\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1.vco_2_cv\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1.feedback_cv\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":2}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1.vco_1_rate\\\",\\\"kind\\\":\\\"large_knob\\\",\\\"range\\\":[0,6000],\\\"taper\\\":\\\"log 3.8\\\",\\\"value\\\":61,\\\"unit\\\":\\\"Hz\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1.vco_1_waveform\\\",\\\"kind\\\":\\\"n_switch\\\",\\\"throws\\\":[\\\"Sine\\\",\\\"Phasor\\\",\\\"Triangle\\\"],\\\"value\\\":2}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1.vco_2_rate\\\",\\\"kind\\\":\\\"large_knob\\\",\\\"range\\\":[0,6000],\\\"taper\\\":\\\"log 3.8\\\",\\\"value\\\":17.6,\\\"unit\\\":\\\"Hz\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1.vco_2_waveform\\\",\\\"kind\\\":\\\"n_switch\\\",\\\"throws\\\":[\\\"Sine\\\",\\\"Phasor\\\",\\\"Triangle\\\"],\\\"value\\\":1}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1.feedback\\\",\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,6],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":6.7,\\\"unit\\\":\\\"float\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1.vco_1\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1.vco_2\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":1}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"dualvco_1.master\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":2}]],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"vca_1\\\",\\\"kind\\\":\\\"vca\\\",\\\"pos\\\":[-1.8874404486624103,1.6447142321669945,-1.27836666000946],\\\"orient\\\":[-0.00320043028644092,0.5635363501996354,0.20483018876733974,0.8002881562407327]},[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"vca_1.signal\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":0}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"vca_1.cv\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"vca_1.cv_amount\\\",\\\"kind\\\":\\\"large_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":0.762,\\\"unit\\\":\\\"float\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"vca_1.bias\\\",\\\"kind\\\":\\\"large_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":0,\\\"unit\\\":\\\"float\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"vca_1.output\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}]],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"comparator_1\\\",\\\"kind\\\":\\\"comparator\\\",\\\"pos\\\":[-2.0809666515777456,0.8417822341996655,-0.9555356411990519],\\\"orient\\\":[-0.04273939274318167,0.48753902180372916,0.0518319148711431,0.8705127794164756]},[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"comparator_1.A\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":0}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"comparator_1.B\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"comparator_1.max\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"comparator_1.min\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":1}]],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"outs_1\\\",\\\"kind\\\":\\\"outs\\\",\\\"pos\\\":[-2.0605223497200336,0.46826704387316614,-1.0405112532755187],\\\"orient\\\":[-0.3121451653567321,0.369889483526838,0.14650496286711281,0.8627186456637955]},[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"outs_1.left_(mono)\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":0}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"outs_1.right_(stereo)\\\",\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"outs_1.volume\\\",\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"log 3.8\\\",\\\"value\\\":1,\\\"unit\\\":\\\"float\\\"}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"outs_1.left\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}],[{\\\"op\\\":\\\"newnode\\\",\\\"path\\\":\\\"outs_1.right\\\",\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}]],{\\\"op\\\":\\\"connect\\\",\\\"paths\\\":[\\\"lfo_1.sine\\\",\\\"vca_1.signal\\\"]},{\\\"op\\\":\\\"connect\\\",\\\"paths\\\":[\\\"lfo_1.sine\\\",\\\"lfo_2.fm_cv\\\"]},{\\\"op\\\":\\\"connect\\\",\\\"paths\\\":[\\\"lfo_2.sine\\\",\\\"vca_1.cv\\\"]},{\\\"op\\\":\\\"connect\\\",\\\"paths\\\":[\\\"lfo_1.phasor\\\",\\\"dualvco_1.feedback_cv\\\"]},{\\\"op\\\":\\\"connect\\\",\\\"paths\\\":[\\\"lfo_1.pulse\\\",\\\"dualvco_1.vco_1_cv\\\"]},{\\\"op\\\":\\\"connect\\\",\\\"paths\\\":[\\\"dualvco_1.master\\\",\\\"comparator_1.B\\\"]},{\\\"op\\\":\\\"connect\\\",\\\"paths\\\":[\\\"comparator_1.max\\\",\\\"outs_1.left_(mono)\\\"]},{\\\"op\\\":\\\"connect\\\",\\\"paths\\\":[\\\"comparator_1.min\\\",\\\"outs_1.right_(stereo)\\\"]},{\\\"op\\\":\\\"connect\\\",\\\"paths\\\":[\\\"dualvco_1.master\\\",\\\"dualvco_1.vco_2_cv\\\"]},{\\\"op\\\":\\\"connect\\\",\\\"paths\\\":[\\\"vca_1.output\\\",\\\"comparator_1.A\\\"]}]}\""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-67",
					"maxclass" : "dict.view",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 712.0, 276.0, 246.0, 376.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-64",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 178.0, 620.0, 35.0, 22.0 ],
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-62",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 877.0, 40.0, 779.0, 49.0 ],
					"text" : "{\\\"cmd\\\":\\\"deltas\\\"\\,\\\"date\\\":1555096497869\\,\\\"data\\\":[{\\\"op\\\":\\\"propchange\\\"\\,\\\"path\\\":\\\"comparator_1\\\"\\,\\\"name\\\":\\\"pos\\\"\\,\\\"from\\\":[0\\,0\\,0]\\,\\\"to\\\":[-2.120978503282726\\,0.8035722877292376\\,-0.9437211712306279]}\\,{\\\"op\\\":\\\"propchange\\\"\\,\\\"path\\\":\\\"comparator_1\\\"\\,\\\"name\\\":\\\"orient\\\"\\,\\\"from\\\":[0\\,0\\,0\\,1]\\,\\\"to\\\":[0.06605726383335296\\,0.4772500539670278\\,0.0588476306788076\\,0.874303025831117]}]}"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "dictionary" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 3,
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
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 426.0, 248.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-56",
									"linecount" : 5,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 132.0, 311.5, 204.0, 74.0 ],
									"text" : "add to this sel with additional deltas to ignore. just remember to connect the [t 0 ] to each additional delta cmd, and shift the [t 1] to the right-most inlet. "
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-38",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 326.5, 52.0, 22.0 ],
									"text" : "gate 1 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-36",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 204.0, 255.0, 22.0, 22.0 ],
									"text" : "t 1"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 141.0, 255.0, 22.0, 22.0 ],
									"text" : "t 0"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-33",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 141.0, 226.0, 83.0, 22.0 ],
									"text" : "sel user_pose"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-28",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 83.0, 100.0, 29.5, 22.0 ],
									"text" : "t l l"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "dictionary" ],
									"patching_rect" : [ 141.0, 144.0, 88.0, 22.0 ],
									"text" : "dict.deserialize"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 141.0, 186.0, 99.0, 22.0 ],
									"text" : "dict.unpack cmd:"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-57",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 83.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-58",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 445.5, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-1", 0 ],
									"midpoints" : [ 150.5, 177.0, 435.5, 177.0 ],
									"order" : 0,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"order" : 1,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"source" : [ "obj-28", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 1 ],
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"source" : [ "obj-33", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-36", 0 ],
									"source" : [ "obj-33", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"midpoints" : [ 150.5, 301.25, 59.5, 301.25 ],
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"midpoints" : [ 213.5, 301.25, 59.5, 301.25 ],
									"source" : [ "obj-36", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-58", 0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-57", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 319.0, 386.0, 162.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p filter_out_unwanted_deltas"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-107",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 385.5, 80.0, 488.0, 22.0 ],
					"text" : "{ op:”propchange”, path:”myobject”, name:”propertyname”, from:”oldvalue”, to:”newvalue” }"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-65",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 250.0, 723.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "dictionary", "", "", "" ],
					"patching_rect" : [ 610.5, 921.0, 60.0, 22.0 ],
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
					"id" : "obj-150",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 610.5, 857.0, 66.0, 22.0 ],
					"text" : "unpack s s"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-147",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"patching_rect" : [ 611.0, 780.0, 63.0, 22.0 ],
					"text" : "unpack s f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-146",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 610.5, 892.0, 263.0, 22.0 ],
					"text" : "sprintf replace nodes::%s::%s::_props::value %f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-143",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 610.5, 820.0, 153.0, 22.0 ],
					"text" : "fromsymbol @separator __"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-142",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 527.0, 955.0, 146.0, 22.0 ],
					"text" : "prepend script send world"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-141",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 684.0, 733.0, 39.0, 74.0 ],
					"text" : ">\n>\n>\n>\n>>>>"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-139",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 721.0, 785.0, 171.0, 22.0 ],
					"text" : "needs to be an op propchange"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-137",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 3,
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
									"patching_rect" : [ 294.0, 180.0, 72.0, 22.0 ],
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
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 294.0, 156.0, 47.0, 22.0 ],
									"text" : "zl.nth 2"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-118",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 121.0, 96.0, 22.0 ],
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
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
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
									"patching_rect" : [ 294.0, 52.0, 30.0, 30.0 ]
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
									"patching_rect" : [ 169.0, 152.0, 30.0, 30.0 ]
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
									"patching_rect" : [ 50.0, 361.0, 30.0, 30.0 ]
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
									"patching_rect" : [ 90.5, 361.0, 30.0, 30.0 ]
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
									"patching_rect" : [ 294.0, 207.0, 30.0, 30.0 ]
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
									"destination" : [ "obj-118", 0 ],
									"source" : [ "obj-117", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-133", 0 ],
									"source" : [ "obj-118", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-124", 0 ],
									"source" : [ "obj-120", 0 ]
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
									"destination" : [ "obj-117", 0 ],
									"source" : [ "obj-129", 0 ]
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
									"destination" : [ "obj-125", 0 ],
									"source" : [ "obj-132", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 506.0, 712.0, 50.5, 22.0 ],
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
					"patching_rect" : [ 684.0, 712.0, 50.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 716.0, 455.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-119",
					"items" : [ "lfo_1__rate", ",", "lfo_1__index", ",", "lfo_1__pulse_width", ",", "lfo_1__onset", ",", "lfo_2__rate", ",", "lfo_2__index", ",", "lfo_2__pulse_width", ",", "lfo_2__onset", ",", "dualvco_1__vco_1_rate", ",", "dualvco_1__vco_1_waveform", ",", "dualvco_1__vco_2_rate", ",", "dualvco_1__vco_2_waveform", ",", "dualvco_1__feedback", ",", "vca_1__cv_amount", ",", "vca_1__bias", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas", ",", "deltas" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 570.0, 712.0, 100.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 436.0, 455.0, 236.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-40",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 527.0, 989.0, 67.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-54",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 89.0, 814.0, 35.0, 22.0 ],
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-116",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 221.0, 780.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-113",
					"maxclass" : "dict.view",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 147.0, 840.0, 356.0, 329.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 406.0, 481.0, 356.0, 329.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-112",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 147.0, 780.0, 72.0, 22.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-111",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "dictionary", "", "", "" ],
					"patching_rect" : [ 147.0, 809.0, 91.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "dict parameters"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-52",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 335.0, 669.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-43",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 335.0, 696.0, 35.0, 22.0 ],
					"text" : "open"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 3,
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
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 6,
									"outlettype" : [ "", "", "", "", "", "" ],
									"patching_rect" : [ 50.0, 145.0, 71.5, 22.0 ],
									"text" : "cycle 6"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-15",
									"linecount" : 7,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 199.0, 189.0, 126.0, 102.0 ],
									"text" : "{\\\"cmd\\\":\\\"deltas\\\"\\,\\\"date\\\":1555012569775\\,\\\"data\\\":[{\\\"op\\\":\\\"newnode\\\"\\,\\\"kind\\\":\\\"outs\\\"\\,\\\"path\\\":\\\"path\\\"\\,\\\"pos\\\":[0\\,0\\,0]\\,\\\"orient\\\":[0\\,0\\,0\\,1]}]}"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 50.0, 100.0, 69.0, 22.0 ],
									"text" : "metro 1000"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-68",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 329.0, 189.0, 35.0, 22.0 ],
									"text" : "clear"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-34",
									"linecount" : 7,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 189.0, 131.0, 102.0 ],
									"text" : "{\\\"cmd\\\":\\\"deltas\\\"\\,\\\"date\\\":1555012569775\\,\\\"data\\\":[{\\\"op\\\":\\\"newnode\\\"\\,\\\"kind\\\":\\\"noise\\\"\\,\\\"path\\\":\\\"path\\\"\\,\\\"pos\\\":[0\\,0\\,0]\\,\\\"orient\\\":[0\\,0\\,0\\,1]}]}"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-38",
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
									"id" : "obj-39",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 118.5, 351.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-40",
									"index" : 2,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 329.0, 351.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-18", 0 ],
									"source" : [ "obj-10", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-18", 3 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-18", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"source" : [ "obj-18", 2 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-34", 0 ],
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-68", 0 ],
									"source" : [ "obj-18", 5 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-39", 0 ],
									"source" : [ "obj-34", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"source" : [ "obj-68", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 15.0, 300.0, 93.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p example_OTs"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-37",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 10.0, 410.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 3,
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
									"id" : "obj-6",
									"linecount" : 18,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 204.0, 250.0 ],
									"text" : "{\\\"cmd\\\":\\\"user_pose\\\"\\,\\\"date\\\":1555008920517\\,\\\"pose\\\":{\\\"id\\\":1\\,\\\"head\\\":{\\\"pos\\\":{\\\"x\\\":-2.1361171550862514\\,\\\"y\\\":1.2307356670028435\\,\\\"z\\\":0.014732440111274864}\\,\\\"orient\\\":{\\\"_x\\\":0.24916969530321512\\,\\\"_y\\\":0.6922508071951085\\,\\\"_z\\\":-0.18237205804671255\\,\\\"_w\\\":0.6522604753904617}}\\,\\\"controller1\\\":{\\\"pos\\\":{\\\"x\\\":-2.5445053435886678\\,\\\"y\\\":0.7960331439971924\\,\\\"z\\\":-0.1557779464296516}\\,\\\"orient\\\":{\\\"_x\\\":0.004475598875573286\\,\\\"_y\\\":0.7040656047629723\\,\\\"_z\\\":-0.18887005468074175\\,\\\"_w\\\":0.6845434302088017}}\\,\\\"controller2\\\":{\\\"pos\\\":{\\\"x\\\":0\\,\\\"y\\\":0\\,\\\"z\\\":0}\\,\\\"orient\\\":{\\\"_x\\\":0\\,\\\"_y\\\":0\\,\\\"_z\\\":0\\,\\\"_w\\\":1}}}}"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-32",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-33",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 410.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-32", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-33", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 10.0, 372.0, 97.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p example_pose"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-31",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 10.0, 335.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 3,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"rect" : [ 996.0, 143.0, 981.0, 1093.0 ],
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
						"visible" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-35",
									"linecount" : 32,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 966.0, 437.0 ],
									"text" : "\"{\\\"cmd\\\":\\\"patch\\\",\\\"date\\\":1555012634210,\\\"id\\\":2,\\\"value\\\":{\\\"nodes\\\":{\\\"lfo_1\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"lfo\\\",\\\"pos\\\":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],\\\"orient\\\":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]},\\\"fm_cv\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":0}},\\\"phasor_sync\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}},\\\"pulse_width_cv\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":2}},\\\"rate\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"large_knob\\\",\\\"range\\\":[0,80],\\\"taper\\\":\\\"log 3.8\\\",\\\"value\\\":0.17,\\\"unit\\\":\\\"Hz\\\"}},\\\"index\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,10],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":3,\\\"unit\\\":\\\"float\\\"}},\\\"pulse_width\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":5,\\\"unit\\\":\\\"float\\\"}},\\\"onset\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":2.8,\\\"unit\\\":\\\"float\\\"}},\\\"sine\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}},\\\"phasor\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":1}},\\\"pulse\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":2}},\\\"sine_index\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":3}}},\\\"lfo_2\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"lfo\\\",\\\"pos\\\":[-2.424671389806588,0.9688708758277417,-0.18653185392820404],\\\"orient\\\":[-0.19209762519910564,0.5831224304667423,0.22962993689028358,0.7552064787613966]},\\\"fm_cv\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":0}},\\\"phasor_sync\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}},\\\"pulse_width_cv\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":2}},\\\"rate\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"large_knob\\\",\\\"range\\\":[0,80],\\\"taper\\\":\\\"log 3.8\\\",\\\"value\\\":375,\\\"unit\\\":\\\"Hz\\\"}},\\\"index\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,10],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":21.9,\\\"unit\\\":\\\"float\\\"}},\\\"pulse_width\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":0.6,\\\"unit\\\":\\\"float\\\"}},\\\"onset\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":0.74,\\\"unit\\\":\\\"float\\\"}},\\\"sine\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}},\\\"phasor\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":1}},\\\"pulse\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":2}},\\\"sine_index\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":3}}},\\\"dualvco_1\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"dualvco\\\",\\\"pos\\\":[-2.3443101728993065,1.0586006732132194,-0.7830673231770153],\\\"orient\\\":[0.2342255713614243,0.35412725955930197,0.07915509581778843,0.9019239084110882]},\\\"vco_1_cv\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":0}},\\\"index_cv\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}},\\\"vco_2_cv\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}},\\\"feedback_cv\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":2}},\\\"vco_1_rate\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"large_knob\\\",\\\"range\\\":[0,6000],\\\"taper\\\":\\\"log 3.8\\\",\\\"value\\\":61,\\\"unit\\\":\\\"Hz\\\"}},\\\"vco_1_waveform\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"n_switch\\\",\\\"throws\\\":[\\\"Sine\\\",\\\"Phasor\\\",\\\"Triangle\\\"],\\\"value\\\":2}},\\\"vco_2_rate\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"large_knob\\\",\\\"range\\\":[0,6000],\\\"taper\\\":\\\"log 3.8\\\",\\\"value\\\":17.6,\\\"unit\\\":\\\"Hz\\\"}},\\\"vco_2_waveform\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"n_switch\\\",\\\"throws\\\":[\\\"Sine\\\",\\\"Phasor\\\",\\\"Triangle\\\"],\\\"value\\\":1}},\\\"feedback\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,6],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":6.7,\\\"unit\\\":\\\"float\\\"}},\\\"vco_1\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}},\\\"vco_2\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":1}},\\\"master\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":2}}},\\\"vca_1\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"vca\\\",\\\"pos\\\":[-1.8874404486624103,1.6447142321669945,-1.27836666000946],\\\"orient\\\":[-0.00320043028644092,0.5635363501996354,0.20483018876733974,0.8002881562407327]},\\\"signal\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":0}},\\\"cv\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}},\\\"cv_amount\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"large_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":0.762,\\\"unit\\\":\\\"float\\\"}},\\\"bias\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"large_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"linear\\\",\\\"value\\\":0,\\\"unit\\\":\\\"float\\\"}},\\\"output\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}}},\\\"comparator_1\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"comparator\\\",\\\"pos\\\":[-2.0809666515777456,0.8417822341996655,-0.9555356411990519],\\\"orient\\\":[-0.04273939274318167,0.48753902180372916,0.0518319148711431,0.8705127794164756]},\\\"A\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":0}},\\\"B\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}},\\\"max\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}},\\\"min\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":1}}},\\\"outs_1\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outs\\\",\\\"pos\\\":[-2.0605223497200336,0.46826704387316614,-1.0405112532755187],\\\"orient\\\":[-0.3121451653567321,0.369889483526838,0.14650496286711281,0.8627186456637955]},\\\"left_(mono)\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":0}},\\\"right_(stereo)\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"inlet\\\",\\\"index\\\":1}},\\\"volume\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"small_knob\\\",\\\"range\\\":[0,1],\\\"taper\\\":\\\"log 3.8\\\",\\\"value\\\":1,\\\"unit\\\":\\\"float\\\"}},\\\"left\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}},\\\"right\\\":{\\\"_props\\\":{\\\"kind\\\":\\\"outlet\\\",\\\"index\\\":0}}}},\\\"arcs\\\":[[\\\"lfo_1.sine\\\",\\\"vca_1.signal\\\"],[\\\"lfo_1.sine\\\",\\\"lfo_2.fm_cv\\\"],[\\\"lfo_2.sine\\\",\\\"vca_1.cv\\\"],[\\\"lfo_1.phasor\\\",\\\"dualvco_1.feedback_cv\\\"],[\\\"lfo_1.pulse\\\",\\\"dualvco_1.vco_1_cv\\\"],[\\\"dualvco_1.master\\\",\\\"comparator_1.B\\\"],[\\\"comparator_1.max\\\",\\\"outs_1.left_(mono)\\\"],[\\\"comparator_1.min\\\",\\\"outs_1.right_(stereo)\\\"],[\\\"dualvco_1.master\\\",\\\"dualvco_1.vco_2_cv\\\"],[\\\"vca_1.output\\\",\\\"comparator_1.A\\\"]]}}\""
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
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 50.0, 40.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-28",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 597.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-35", 0 ],
									"source" : [ "obj-25", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"source" : [ "obj-35", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 10.0, 453.0, 103.0, 22.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"globalpatchername" : "",
						"tags" : ""
					}
,
					"text" : "p example_scene"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 15.0, 271.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-82",
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 335.0, 761.5, 45.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.996078431372549, 0.031372549019608, 0.031372549019608, 1.0 ],
					"id" : "obj-83",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 335.0, 723.5, 68.0, 22.0 ],
					"saved_object_attributes" : 					{
						"poll" : 1
					}
,
					"text" : "gen~ world",
					"varname" : "world"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1527.0, 174.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "dict.view",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1492.0, 243.0, 252.0, 697.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1492.0, 174.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "dictionary", "", "", "" ],
					"patching_rect" : [ 1492.0, 209.0, 60.0, 22.0 ],
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
					"id" : "obj-47",
					"maxclass" : "dict.view",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 996.0, 243.0, 246.0, 376.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-27",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 165.0, 36.0, 105.0, 22.0 ],
					"text" : "{\\\"cmd\\\":\\\"deltas\\\"}"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-13",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 352.0, 565.0, 287.0, 22.0 ],
					"text" : "deltas"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-21",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 996.0, 179.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-23",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "dictionary", "", "", "" ],
					"patching_rect" : [ 996.0, 209.0, 57.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "dict pose"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-20",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 279.0, 149.0, 70.0, 22.0 ],
					"text" : "open"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-19",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1244.0, 174.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-17",
					"maxclass" : "dict.view",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1235.0, 243.0, 255.0, 740.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "dictionary", "", "", "" ],
					"patching_rect" : [ 1244.0, 209.0, 57.0, 22.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"parameter_enable" : 0,
						"parameter_mappable" : 0
					}
,
					"text" : "dict delta"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-14",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 319.0, 436.0, 84.0, 22.0 ],
					"text" : "prepend client"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 319.0, 482.0, 94.0, 22.0 ],
					"saved_object_attributes" : 					{
						"filename" : "msvr_world.js",
						"parameter_enable" : 0
					}
,
					"text" : "js msvr_world.js"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-11",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 249.0, 80.0, 128.0, 22.0 ],
					"text" : "{\\\"cmd\\\":\\\"get_scene\\\"}"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 421.0, 261.0, 32.0, 22.0 ],
					"text" : "print"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 117.0, 134.0, 119.0, 22.0 ],
					"text" : "qmetro 10 @active 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 188.0, 227.0, 252.0, 22.0 ],
					"text" : "ws.client @host 192.168.137.113 @port 8080"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-7",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 310.0, 197.0, 37.0, 22.0 ],
					"text" : "close"
				}

			}
, 			{
				"box" : 				{
					"attr" : "dualvco_1__vco_2_waveform",
					"id" : "obj-15",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 416.5, 665.5, 407.0, 22.0 ],
					"text_width" : 294.0
				}

			}
, 			{
				"box" : 				{
					"attr" : "poll",
					"id" : "obj-18",
					"maxclass" : "attrui",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 279.0, 635.5, 150.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-22",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 133.0, 559.0, 50.0, 22.0 ],
					"text" : "compile"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"source" : [ "obj-111", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 3 ],
					"source" : [ "obj-111", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"midpoints" : [ 230.5, 805.0, 156.5, 805.0 ],
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 2 ],
					"midpoints" : [ 620.0, 744.0, 559.25, 744.0, 559.25, 701.0, 536.5, 701.0 ],
					"source" : [ "obj-119", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 0 ],
					"order" : 2,
					"source" : [ "obj-12", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"source" : [ "obj-12", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"order" : 0,
					"source" : [ "obj-12", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 0 ],
					"order" : 1,
					"source" : [ "obj-12", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 1 ],
					"midpoints" : [ 693.5, 744.0, 746.75, 744.0, 746.75, 701.0, 526.0, 701.0 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"source" : [ "obj-137", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"midpoints" : [ 515.5, 744.0, 563.5, 744.0, 563.5, 701.0, 579.5, 701.0 ],
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"midpoints" : [ 547.0, 744.0, 678.25, 744.0, 678.25, 701.0, 693.5, 701.0 ],
					"source" : [ "obj-137", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-142", 0 ],
					"order" : 1,
					"source" : [ "obj-137", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-147", 0 ],
					"order" : 0,
					"source" : [ "obj-137", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 1 ],
					"order" : 0,
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"order" : 1,
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-150", 0 ],
					"source" : [ "obj-143", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-146", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-143", 0 ],
					"source" : [ "obj-147", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-146", 2 ],
					"midpoints" : [ 664.5, 816.5, 864.0, 816.5 ],
					"source" : [ "obj-147", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-146", 1 ],
					"source" : [ "obj-150", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-146", 0 ],
					"source" : [ "obj-150", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-69", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-29", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-41", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-83", 0 ],
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-14", 0 ],
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-67", 0 ],
					"source" : [ "obj-59", 1 ]
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
					"destination" : [ "obj-12", 0 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 1 ],
					"source" : [ "obj-83", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"source" : [ "obj-83", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"midpoints" : [ 1536.5, 202.0, 1253.5, 202.0 ],
					"order" : 1,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"midpoints" : [ 1536.5, 202.0, 1005.5, 202.0 ],
					"order" : 2,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"midpoints" : [ 1536.5, 202.0, 1501.5, 202.0 ],
					"order" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "msvr_world.js",
				"bootpath" : "D:/github/msvr",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "world.gendsp",
				"bootpath" : "D:/github/msvr",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "lfo.gendsp",
				"bootpath" : "D:/github/msvr",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "dualvco.gendsp",
				"bootpath" : "D:/github/msvr",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "vca.gendsp",
				"bootpath" : "D:/github/msvr",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "comparator.gendsp",
				"bootpath" : "D:/github/msvr",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
, 			{
				"name" : "outs.gendsp",
				"bootpath" : "D:/github/msvr",
				"patcherrelativepath" : ".",
				"type" : "gDSP",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}