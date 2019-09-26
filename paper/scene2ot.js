let scene = {
	"nodes" : 	{
		"lfo_1" : 		{
			"_props" : 			{
				"kind" : "lfo",
				"pos" : [ 0.0, 1.5, 0.0 ],
				"orient" : [ 0, 0, 0, 1 ]
			}
,
			"fm_cv" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 0
				}

			}
,
			"phasor_sync" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 1
				}

			}
,
			"pulse_width_cv" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 2
				}

			}
,
			"rate" : 			{
				"_props" : 				{
					"kind" : "large_knob",
					"range" : [ 0, 80 ],
					"taper" : "log 3.8",
					"value" : 0.17,
					"unit" : "Hz"
				}

			}
,
			"index" : 			{
				"_props" : 				{
					"kind" : "small_knob",
					"range" : [ 0, 10 ],
					"taper" : "linear",
					"value" : 3.0,
					"unit" : "float"
				}

			}
,
			"pulse_width" : 			{
				"_props" : 				{
					"kind" : "small_knob",
					"range" : [ 0, 1 ],
					"taper" : "linear",
					"value" : 5.0,
					"unit" : "float"
				}

			}
,
			"onset" : 			{
				"_props" : 				{
					"kind" : "small_knob",
					"range" : [ 0, 1 ],
					"taper" : "linear",
					"value" : 2.8,
					"unit" : "float"
				}

			}
,
			"sine" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 0
				}

			}
,
			"phasor" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 1
				}

			}
,
			"pulse" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 2
				}

			}
,
			"sine_index" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 3
				}

			}

		}
,
		"lfo_2" : 		{
			"_props" : 			{
				"kind" : "lfo",
				"pos" : [ 0.0, 1.0, 0.0 ],
				"orient" : [ 0, 0, 0, 1 ]
			}
,
			"fm_cv" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 0
				}

			}
,
			"phasor_sync" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 1
				}

			}
,
			"pulse_width_cv" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 2
				}

			}
,
			"rate" : 			{
				"_props" : 				{
					"kind" : "large_knob",
					"range" : [ 0, 80 ],
					"taper" : "log 3.8",
					"value" : 375.0,
					"unit" : "Hz"
				}

			}
,
			"index" : 			{
				"_props" : 				{
					"kind" : "small_knob",
					"range" : [ 0, 10 ],
					"taper" : "linear",
					"value" : 21.899999999999999,
					"unit" : "float"
				}

			}
,
			"pulse_width" : 			{
				"_props" : 				{
					"kind" : "small_knob",
					"range" : [ 0, 1 ],
					"taper" : "linear",
					"value" : 0.6,
					"unit" : "float"
				}

			}
,
			"onset" : 			{
				"_props" : 				{
					"kind" : "small_knob",
					"range" : [ 0, 1 ],
					"taper" : "linear",
					"value" : 0.74,
					"unit" : "float"
				}

			}
,
			"sine" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 0
				}

			}
,
			"phasor" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 1
				}

			}
,
			"pulse" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 2
				}

			}
,
			"sine_index" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 3
				}

			}

		}
,
		"dualvco_1" : 		{
			"_props" : 			{
				"kind" : "dualvco",
				"pos" : [ 0.0, 0.5, 0.0 ],
				"orient" : [ 0, 0, 0, 1 ]
			}
,
			"vco_1_cv" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 0
				}

			}
,
			"index_cv" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 1
				}

			}
,
			"vco_2_cv" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 1
				}

			}
,
			"feedback_cv" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 2
				}

			}
,
			"vco_1_rate" : 			{
				"_props" : 				{
					"kind" : "large_knob",
					"range" : [ 0, 6000 ],
					"taper" : "log 3.8",
					"value" : 61.0,
					"unit" : "Hz"
				}

			}
,
			"vco_1_waveform" : 			{
				"_props" : 				{
					"kind" : "n_switch",
					"throws" : [ "Sine", "Phasor", "Triangle" ],
					"value" : 2
				}

			}
,
			"vco_2_rate" : 			{
				"_props" : 				{
					"kind" : "large_knob",
					"range" : [ 0, 6000 ],
					"taper" : "log 3.8",
					"value" : 17.600000000000001,
					"unit" : "Hz"
				}

			}
,
			"vco_2_waveform" : 			{
				"_props" : 				{
					"kind" : "n_switch",
					"throws" : [ "Sine", "Phasor", "Triangle" ],
					"value" : 1
				}

			}
,
			"feedback" : 			{
				"_props" : 				{
					"kind" : "small_knob",
					"range" : [ 0, 6 ],
					"taper" : "linear",
					"value" : 6.7,
					"unit" : "float"
				}

			}
,
			"vco_1" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 0
				}

			}
,
			"vco_2" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 1
				}

			}
,
			"master" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 2
				}

			}

		}
,
		"vca_1" : 		{
			"_props" : 			{
				"kind" : "vca",
				"pos" : [ 0.0, 1.8, 0.0 ],
				"orient" : [ 0, 0, 0, 1 ]
			}
,
			"signal" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 0
				}

			}
,
			"cv" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 1
				}

			}
,
			"cv_amount" : 			{
				"_props" : 				{
					"kind" : "large_knob",
					"range" : [ 0, 1 ],
					"taper" : "linear",
					"value" : 0.762,
					"unit" : "float"
				}

			}
,
			"bias" : 			{
				"_props" : 				{
					"kind" : "large_knob",
					"range" : [ 0, 1 ],
					"taper" : "linear",
					"value" : 0.0,
					"unit" : "float"
				}

			}
,
			"output" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 0
				}

			}

		}
,
		"comparator_1" : 		{
			"_props" : 			{
				"kind" : "comparator",
				"pos" : [ 0.0, 0.8, 0.0 ],
				"orient" : [ 0, 0, 0, 1 ]
			}
,
			"A" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 0
				}

			}
,
			"B" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 1
				}

			}
,
			"max" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 0
				}

			}
,
			"min" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 1
				}

			}

		}
,
		"outs_1" : 		{
			"_props" : 			{
				"kind" : "outs",
				"pos" : [ 0.0, 0.8, 0.0 ],
				"orient" : [ 0, 0, 0, 1 ]
			}
,
			"left_(mono)" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 0
				}

			}
,
			"right_(stereo)" : 			{
				"_props" : 				{
					"kind" : "inlet",
					"index" : 1
				}

			}
,
			"volume" : 			{
				"_props" : 				{
					"kind" : "small_knob",
					"range" : [ 0, 1 ],
					"taper" : "log 3.8",
					"value" : 1.0,
					"unit" : "float"
				}

			}
,
			"left" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 0
				}

			}
,
			"right" : 			{
				"_props" : 				{
					"kind" : "outlet",
					"index" : 0
				}

			}

		}

	}
,
	"arcs" : [ [ "lfo_1.sine", "vca_1.signal" ], [ "lfo_1.sine", "lfo_2.fm_cv" ], [ "lfo_2.sine", "vca_1.cv" ], [ "lfo_1.phasor", "dualvco_1.feedback_cv" ], [ "lfo_1.pulse", "dualvco_1.vco_1_cv" ], [ "vca_1.output", "comparator_1.A" ], [ "dualvco_1.master", "comparator_1.B" ], [ "comparator_1.max", "outs_1.left_(mono)" ], [ "comparator_1.min", "outs_1.right_(stereo)" ], [ "dualvco_1.master", "dualvco_1.vco_2_cv" ] ]
}



console.log(scene.nodes.lfo_1)