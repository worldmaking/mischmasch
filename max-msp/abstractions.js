let menu = {
	"average": {
		"_props": {
			"kind": "average",
			"category": "abstraction",
			"pos": [
				0,
				2,
				1
			],
			"orient": [
				0,
				1,
				0,
				6.123233995736766e-17
			]
		},
		"seconds": {
			"_props": {
				"kind": "knob",
				"range": [
					0.001,
					2
				],
				"value": "0.5",
				"type": "float"
			}
		},
		"signal": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"average": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"rms": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"bi2uni": {
		"_props": {
			"kind": "bi2uni",
			"category": "abstraction",
			"pos": [
				-0.3826834323650898,
				1.9746835443037976,
				0.9238795325112867
			],
			"orient": [
				0,
				0.9807852804032304,
				0,
				0.19509032201612833
			]
		},
		"bipolar": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"unipolar": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"bpmclock": {
		"_props": {
			"kind": "bpmclock",
			"category": "abstraction",
			"pos": [
				-0.7071067811865475,
				1.9493670886075949,
				0.7071067811865476
			],
			"orient": [
				0,
				0.9238795325112867,
				0,
				0.38268343236508984
			]
		},
		"bpm": {
			"_props": {
				"kind": "knob",
				"range": [
					30,
					240
				],
				"value": "120",
				"type": "float"
			}
		},
		"enable": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "1",
				"type": "int"
			}
		},
		"pause": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"rewind": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"ramp": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"reset": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"control": {
		"_props": {
			"kind": "control",
			"category": "abstraction",
			"pos": [
				-0.9238795325112867,
				1.9240506329113924,
				0.38268343236508984
			],
			"orient": [
				0,
				0.8314696123025452,
				0,
				0.5555702330196023
			]
		},
		"control": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0",
				"type": "float"
			}
		},
		"value": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"drumkit": {
		"_props": {
			"kind": "drumkit",
			"category": "abstraction",
			"pos": [
				-1,
				1.8987341772151898,
				6.123233995736766e-17
			],
			"orient": [
				0,
				0.7071067811865475,
				0,
				0.7071067811865476
			]
		},
		"hatdur": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0.05",
				"type": "float"
			}
		},
		"kick": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"snare": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"hat": {
			"_props": {
				"kind": "inlet",
				"index": 2
			}
		},
		"kicks": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"snares": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		},
		"hats": {
			"_props": {
				"kind": "outlet",
				"index": 2,
				"history": false
			}
		},
		"mix": {
			"_props": {
				"kind": "outlet",
				"index": 3,
				"history": false
			}
		}
	},
	"dverb": {
		"_props": {
			"kind": "dverb",
			"category": "abstraction",
			"pos": [
				-0.9238795325112867,
				1.8734177215189873,
				-0.3826834323650897
			],
			"orient": [
				0,
				0.5555702330196022,
				0,
				0.8314696123025452
			]
		},
		"drywet": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0.3",
				"type": "float"
			}
		},
		"predelay": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0.15",
				"type": "float"
			}
		},
		"indamping": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0.75",
				"type": "float"
			}
		},
		"damping": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0.4",
				"type": "float"
			}
		},
		"decay": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0.75",
				"type": "float"
			}
		},
		"in0": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"L": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"R": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"euclid": {
		"_props": {
			"kind": "euclid",
			"category": "abstraction",
			"pos": [
				-0.7071067811865476,
				1.8481012658227849,
				-0.7071067811865475
			],
			"orient": [
				0,
				0.3826834323650898,
				0,
				0.9238795325112867
			]
		},
		"steps": {
			"_props": {
				"kind": "knob",
				"range": [
					-32,
					32
				],
				"value": "3",
				"type": "int"
			}
		},
		"length": {
			"_props": {
				"kind": "knob",
				"range": [
					1,
					32
				],
				"value": "8",
				"type": "int"
			}
		},
		"offset": {
			"_props": {
				"kind": "knob",
				"range": [
					-32,
					32
				],
				"value": "0",
				"type": "int"
			}
		},
		"ramp": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"reset": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"trig": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"retrig": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"flipflop": {
		"_props": {
			"kind": "flipflop",
			"category": "abstraction",
			"pos": [
				-0.3826834323650899,
				1.8227848101265822,
				-0.9238795325112867
			],
			"orient": [
				0,
				0.19509032201612825,
				0,
				0.9807852804032304
			]
		},
		"trig": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"reset": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"gate": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"opentrig": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		},
		"closetrig": {
			"_props": {
				"kind": "outlet",
				"index": 2,
				"history": false
			}
		}
	},
	"lfo": {
		"_props": {
			"kind": "lfo",
			"category": "abstraction",
			"pos": [
				-1.2246467991473532e-16,
				1.7974683544303798,
				-1
			],
			"orient": [
				0,
				0,
				0,
				1
			]
		},
		"seconds": {
			"_props": {
				"kind": "knob",
				"range": [
					0.01,
					10
				],
				"value": "1",
				"type": "float"
			}
		},
		"pulsewidth": {
			"_props": {
				"kind": "knob",
				"range": [
					-1,
					1
				],
				"value": "0",
				"type": "float"
			}
		},
		"ramp": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"sync": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"tri": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		},
		"pulse": {
			"_props": {
				"kind": "outlet",
				"index": 2,
				"history": false
			}
		},
		"sine": {
			"_props": {
				"kind": "outlet",
				"index": 3,
				"history": false
			}
		}
	},
	"lpg": {
		"_props": {
			"kind": "lpg",
			"category": "abstraction",
			"pos": [
				0.38268343236508967,
				1.7721518987341773,
				-0.9238795325112868
			],
			"orient": [
				0,
				-0.19509032201612803,
				0,
				0.9807852804032305
			]
		},
		"rise": {
			"_props": {
				"kind": "knob",
				"range": [
					0.01,
					1
				],
				"value": "0.1",
				"type": "float"
			}
		},
		"fall": {
			"_props": {
				"kind": "knob",
				"range": [
					0.01,
					1
				],
				"value": "0.25",
				"type": "float"
			}
		},
		"audio": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"gate": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"lpg": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"slewed": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"lr2ms": {
		"_props": {
			"kind": "lr2ms",
			"category": "abstraction",
			"pos": [
				0.7071067811865475,
				1.7468354430379747,
				-0.7071067811865477
			],
			"orient": [
				0,
				-0.3826834323650898,
				0,
				0.9238795325112867
			]
		},
		"L": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"R": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"mid": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"side": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"monotonic": {
		"_props": {
			"kind": "monotonic",
			"category": "abstraction",
			"pos": [
				0.9238795325112865,
				1.7215189873417722,
				-0.38268343236509034
			],
			"orient": [
				0,
				-0.5555702330196021,
				0,
				0.8314696123025453
			]
		},
		"ramp": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"ref_ramp": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"monotonic": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"mooglo": {
		"_props": {
			"kind": "mooglo",
			"category": "abstraction",
			"pos": [
				1,
				1.6962025316455696,
				-1.8369701987210297e-16
			],
			"orient": [
				0,
				-0.7071067811865475,
				0,
				0.7071067811865476
			]
		},
		"pitch": {
			"_props": {
				"kind": "knob",
				"range": [
					-4,
					8
				],
				"value": "2",
				"type": "float"
			}
		},
		"resonance": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "",
				"type": "float"
			}
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"pitch_v": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"filtered": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"ms2lr": {
		"_props": {
			"kind": "ms2lr",
			"category": "abstraction",
			"pos": [
				0.9238795325112866,
				1.6708860759493671,
				0.38268343236509
			],
			"orient": [
				0,
				-0.8314696123025456,
				0,
				0.5555702330196018
			]
		},
		"mid": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"side": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"L": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"R": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"pan2": {
		"_props": {
			"kind": "pan2",
			"category": "abstraction",
			"pos": [
				0.7071067811865477,
				1.6455696202531644,
				0.7071067811865474
			],
			"orient": [
				0,
				-0.9238795325112867,
				0,
				0.38268343236508984
			]
		},
		"signal": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"pan": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"L": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"R": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"pink": {
		"_props": {
			"kind": "pink",
			"category": "abstraction",
			"pos": [
				0.3826834323650904,
				1.620253164556962,
				0.9238795325112865
			],
			"orient": [
				0,
				-0.9807852804032303,
				0,
				0.19509032201612875
			]
		},
		"white": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0",
				"type": "float"
			}
		},
		"noise": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"pitchchroma": {
		"_props": {
			"kind": "pitchchroma",
			"category": "abstraction",
			"pos": [
				0,
				1.5949367088607596,
				1
			],
			"orient": [
				0,
				1,
				0,
				6.123233995736766e-17
			]
		},
		"tuning": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "2",
				"type": "float"
			}
		},
		"pitch": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"chroma": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"register": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"pulsars": {
		"_props": {
			"kind": "pulsars",
			"category": "abstraction",
			"pos": [
				-0.3826834323650898,
				1.5696202531645569,
				0.9238795325112867
			],
			"orient": [
				0,
				0.9807852804032304,
				0,
				0.19509032201612833
			]
		},
		"pitch": {
			"_props": {
				"kind": "knob",
				"range": [
					-3,
					7
				],
				"value": "0",
				"type": "float"
			}
		},
		"formant": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					10
				],
				"value": "1",
				"type": "float"
			}
		},
		"pitch_v": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"audio": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"pulsared": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"ramp": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"pulse": {
		"_props": {
			"kind": "pulse",
			"category": "abstraction",
			"pos": [
				-0.7071067811865475,
				1.5443037974683544,
				0.7071067811865476
			],
			"orient": [
				0,
				0.9238795325112867,
				0,
				0.38268343236508984
			]
		},
		"pitch": {
			"_props": {
				"kind": "knob",
				"range": [
					-3,
					7
				],
				"value": "0",
				"type": "float"
			}
		},
		"pulsewidth": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0.5",
				"type": "float"
			}
		},
		"pitch_v": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"hardsync": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"pulse": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"impulse": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		},
		"clock": {
			"_props": {
				"kind": "outlet",
				"index": 2,
				"history": false
			}
		}
	},
	"quant": {
		"_props": {
			"kind": "quant",
			"category": "abstraction",
			"pos": [
				-0.9238795325112867,
				1.518987341772152,
				0.38268343236508984
			],
			"orient": [
				0,
				0.8314696123025452,
				0,
				0.5555702330196023
			]
		},
		"numer": {
			"_props": {
				"kind": "knob",
				"range": [
					1,
					24
				],
				"value": "5",
				"type": "int"
			}
		},
		"denom": {
			"_props": {
				"kind": "knob",
				"range": [
					1,
					24
				],
				"value": "12",
				"type": "int"
			}
		},
		"trans": {
			"_props": {
				"kind": "knob",
				"range": [
					-2,
					2
				],
				"value": "0",
				"type": "float"
			}
		},
		"align": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0",
				"type": "float"
			}
		},
		"pitch": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"quantized": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"rampdiv": {
		"_props": {
			"kind": "rampdiv",
			"category": "abstraction",
			"pos": [
				-1,
				1.4936708860759493,
				6.123233995736766e-17
			],
			"orient": [
				0,
				0.7071067811865475,
				0,
				0.7071067811865476
			]
		},
		"numer": {
			"_props": {
				"kind": "knob",
				"range": [
					1,
					32
				],
				"value": "1",
				"type": "int"
			}
		},
		"denom": {
			"_props": {
				"kind": "knob",
				"range": [
					1,
					32
				],
				"value": "4",
				"type": "int"
			}
		},
		"ramp": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"divided": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"rampshift": {
		"_props": {
			"kind": "rampshift",
			"category": "abstraction",
			"pos": [
				-0.9238795325112867,
				1.4683544303797469,
				-0.3826834323650897
			],
			"orient": [
				0,
				0.5555702330196022,
				0,
				0.8314696123025452
			]
		},
		"numer": {
			"_props": {
				"kind": "knob",
				"range": [
					1,
					32
				],
				"value": "16",
				"type": "int"
			}
		},
		"denom": {
			"_props": {
				"kind": "knob",
				"range": [
					1,
					32
				],
				"value": "32",
				"type": "int"
			}
		},
		"ramp": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"shifted": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"rampsteps": {
		"_props": {
			"kind": "rampsteps",
			"category": "abstraction",
			"pos": [
				-0.7071067811865476,
				1.4430379746835444,
				-0.7071067811865475
			],
			"orient": [
				0,
				0.3826834323650898,
				0,
				0.9238795325112867
			]
		},
		"numer": {
			"_props": {
				"kind": "knob",
				"range": [
					1,
					32
				],
				"value": "1",
				"type": "int"
			}
		},
		"denom": {
			"_props": {
				"kind": "knob",
				"range": [
					1,
					32
				],
				"value": "4",
				"type": "int"
			}
		},
		"ramp": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"step": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"stepped": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"rectifier": {
		"_props": {
			"kind": "rectifier",
			"category": "abstraction",
			"pos": [
				-0.3826834323650899,
				1.4177215189873418,
				-0.9238795325112867
			],
			"orient": [
				0,
				0.19509032201612825,
				0,
				0.9807852804032304
			]
		},
		"acdc": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0",
				"type": "float"
			}
		},
		"in0": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"fullrect": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"halfrect": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		},
		"inverted": {
			"_props": {
				"kind": "outlet",
				"index": 2,
				"history": false
			}
		}
	},
	"s+h": {
		"_props": {
			"kind": "s+h",
			"category": "abstraction",
			"pos": [
				-1.2246467991473532e-16,
				1.3924050632911391,
				-1
			],
			"orient": [
				0,
				0,
				0,
				1
			]
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"clock": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"gate": {
			"_props": {
				"kind": "inlet",
				"index": 2
			}
		},
		"held": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"saturate": {
		"_props": {
			"kind": "saturate",
			"category": "abstraction",
			"pos": [
				0.38268343236508967,
				1.3670886075949367,
				-0.9238795325112868
			],
			"orient": [
				0,
				-0.19509032201612803,
				0,
				0.9807852804032305
			]
		},
		"preamp": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					3
				],
				"value": "1",
				"type": "float"
			}
		},
		"hard": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0.5",
				"type": "float"
			}
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"saturated": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"saw": {
		"_props": {
			"kind": "saw",
			"category": "abstraction",
			"pos": [
				0.7071067811865475,
				1.3417721518987342,
				-0.7071067811865477
			],
			"orient": [
				0,
				-0.3826834323650898,
				0,
				0.9238795325112867
			]
		},
		"pitch": {
			"_props": {
				"kind": "knob",
				"range": [
					-3,
					7
				],
				"value": "0",
				"type": "float"
			}
		},
		"pitch_v": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"saw": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"schmitt": {
		"_props": {
			"kind": "schmitt",
			"category": "abstraction",
			"pos": [
				0.9238795325112865,
				1.3164556962025316,
				-0.38268343236509034
			],
			"orient": [
				0,
				-0.5555702330196021,
				0,
				0.8314696123025453
			]
		},
		"high": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0.8",
				"type": "float"
			}
		},
		"low": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0.2",
				"type": "float"
			}
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"gate": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"semiperm": {
		"_props": {
			"kind": "semiperm",
			"category": "abstraction",
			"pos": [
				1,
				1.2911392405063291,
				-1.8369701987210297e-16
			],
			"orient": [
				0,
				-0.7071067811865475,
				0,
				0.7071067811865476
			]
		},
		"stability": {
			"_props": {
				"kind": "knob",
				"range": [
					-1,
					1
				],
				"value": "0.875",
				"type": "float"
			}
		},
		"steps": {
			"_props": {
				"kind": "knob",
				"range": [
					2,
					8
				],
				"value": "8",
				"type": "int"
			}
		},
		"clock": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"reset": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"value": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"gate": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		},
		"trig": {
			"_props": {
				"kind": "outlet",
				"index": 2,
				"history": false
			}
		}
	},
	"slew": {
		"_props": {
			"kind": "slew",
			"category": "abstraction",
			"pos": [
				0.9238795325112866,
				1.2658227848101267,
				0.38268343236509
			],
			"orient": [
				0,
				-0.8314696123025456,
				0,
				0.5555702330196018
			]
		},
		"slew": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					3
				],
				"value": "0.01",
				"type": "float"
			}
		},
		"decay": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					3
				],
				"value": "0.1",
				"type": "float"
			}
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"slewed": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"speaker": {
		"_props": {
			"kind": "speaker",
			"category": "abstraction",
			"pos": [
				0.7071067811865477,
				1.240506329113924,
				0.7071067811865474
			],
			"orient": [
				0,
				-0.9238795325112867,
				0,
				0.38268343236508984
			]
		},
		"gain": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					2
				],
				"value": "1",
				"type": "float"
			}
		},
		"audio": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		}
	},
	"squine": {
		"_props": {
			"kind": "squine",
			"category": "abstraction",
			"pos": [
				0.3826834323650904,
				1.2151898734177216,
				0.9238795325112865
			],
			"orient": [
				0,
				-0.9807852804032303,
				0,
				0.19509032201612875
			]
		},
		"pitch": {
			"_props": {
				"kind": "knob",
				"range": [
					-3,
					7
				],
				"value": "0",
				"type": "float"
			}
		},
		"skew": {
			"_props": {
				"kind": "knob",
				"range": [
					-1,
					1
				],
				"value": "0",
				"type": "float"
			}
		},
		"square": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0",
				"type": "float"
			}
		},
		"pitch_v": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"squine": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"ramp": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		},
		"tri": {
			"_props": {
				"kind": "outlet",
				"index": 2,
				"history": false
			}
		}
	},
	"svf": {
		"_props": {
			"kind": "svf",
			"category": "abstraction",
			"pos": [
				0,
				1.189873417721519,
				1
			],
			"orient": [
				0,
				1,
				0,
				6.123233995736766e-17
			]
		},
		"pitch": {
			"_props": {
				"kind": "knob",
				"range": [
					-4,
					8
				],
				"value": "4",
				"type": "float"
			}
		},
		"bandwidth": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					10
				],
				"value": "1",
				"type": "float"
			}
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"pitch_v": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"low": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"mid": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		},
		"high": {
			"_props": {
				"kind": "outlet",
				"index": 2,
				"history": false
			}
		}
	},
	"swing": {
		"_props": {
			"kind": "swing",
			"category": "abstraction",
			"pos": [
				-0.3826834323650898,
				1.1645569620253164,
				0.9238795325112867
			],
			"orient": [
				0,
				0.9807852804032304,
				0,
				0.19509032201612833
			]
		},
		"swing": {
			"_props": {
				"kind": "knob",
				"range": [
					-1,
					1
				],
				"value": "0.16",
				"type": "float"
			}
		},
		"ramp": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"bouncy": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"curvy": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		},
		"kinky": {
			"_props": {
				"kind": "outlet",
				"index": 2,
				"history": false
			}
		},
		"sticky": {
			"_props": {
				"kind": "outlet",
				"index": 3,
				"history": false
			}
		},
		"whippy": {
			"_props": {
				"kind": "outlet",
				"index": 4,
				"history": false
			}
		}
	},
	"trig": {
		"_props": {
			"kind": "trig",
			"category": "abstraction",
			"pos": [
				-0.7071067811865475,
				1.1392405063291138,
				0.7071067811865476
			],
			"orient": [
				0,
				0.9238795325112867,
				0,
				0.38268343236508984
			]
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"trigs": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"trig2gate": {
		"_props": {
			"kind": "trig2gate",
			"category": "abstraction",
			"pos": [
				-0.9238795325112867,
				1.1139240506329116,
				0.38268343236508984
			],
			"orient": [
				0,
				0.8314696123025452,
				0,
				0.5555702330196023
			]
		},
		"retrig": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "0",
				"type": "float"
			}
		},
		"seconds": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					2
				],
				"value": "0.03",
				"type": "float"
			}
		},
		"trig": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"gate": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"trigwhen": {
		"_props": {
			"kind": "trigwhen",
			"category": "abstraction",
			"pos": [
				-1,
				1.0886075949367089,
				6.123233995736766e-17
			],
			"orient": [
				0,
				0.7071067811865475,
				0,
				0.7071067811865476
			]
		},
		"trig": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"when": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"trigwhen": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"uni2bi": {
		"_props": {
			"kind": "uni2bi",
			"category": "abstraction",
			"pos": [
				-0.9238795325112867,
				1.0632911392405062,
				-0.3826834323650897
			],
			"orient": [
				0,
				0.5555702330196022,
				0,
				0.8314696123025452
			]
		},
		"unipolar": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"bipolar": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"vca": {
		"_props": {
			"kind": "vca",
			"category": "abstraction",
			"pos": [
				-0.7071067811865476,
				1.0379746835443038,
				-0.7071067811865475
			],
			"orient": [
				0,
				0.3826834323650898,
				0,
				0.9238795325112867
			]
		},
		"control": {
			"_props": {
				"kind": "knob",
				"range": [
					0,
					1
				],
				"value": "1",
				"type": "float"
			}
		},
		"bias": {
			"_props": {
				"kind": "knob",
				"range": [
					-1,
					1
				],
				"value": "0",
				"type": "float"
			}
		},
		"signal": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"vca": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"wand": {
		"_props": {
			"kind": "wand",
			"category": "abstraction",
			"pos": [
				-0.3826834323650899,
				1.0126582278481013,
				-0.9238795325112867
			],
			"orient": [
				0,
				0.19509032201612825,
				0,
				0.9807852804032304
			]
		},
		"pos_X": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"pos_Y": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		},
		"pos_Z": {
			"_props": {
				"kind": "outlet",
				"index": 2,
				"history": false
			}
		},
		"orient_X": {
			"_props": {
				"kind": "outlet",
				"index": 3,
				"history": false
			}
		},
		"orient_Y": {
			"_props": {
				"kind": "outlet",
				"index": 4,
				"history": false
			}
		},
		"orient_Z": {
			"_props": {
				"kind": "outlet",
				"index": 5,
				"history": false
			}
		},
		"orient_W": {
			"_props": {
				"kind": "outlet",
				"index": 6,
				"history": false
			}
		}
	},
	"abs": {
		"_props": {
			"kind": "abs",
			"category": "operator",
			"pos": [
				-1.2246467991473532e-16,
				0.9873417721518987,
				-1
			],
			"orient": [
				0,
				0,
				0,
				1
			]
		},
		"value": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"abs": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"absdiff": {
		"_props": {
			"kind": "absdiff",
			"category": "operator",
			"pos": [
				0.38268343236508967,
				0.9620253164556962,
				-0.9238795325112868
			],
			"orient": [
				0,
				-0.19509032201612803,
				0,
				0.9807852804032305
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"abs-diff": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"add": {
		"_props": {
			"kind": "add",
			"category": "operator",
			"pos": [
				0.7071067811865475,
				0.9367088607594938,
				-0.7071067811865477
			],
			"orient": [
				0,
				-0.3826834323650898,
				0,
				0.9238795325112867
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"sum": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"and": {
		"_props": {
			"kind": "and",
			"category": "operator",
			"pos": [
				0.9238795325112865,
				0.9113924050632911,
				-0.38268343236509034
			],
			"orient": [
				0,
				-0.5555702330196021,
				0,
				0.8314696123025453
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"atan2": {
		"_props": {
			"kind": "atan2",
			"category": "operator",
			"pos": [
				1,
				0.8860759493670887,
				-1.8369701987210297e-16
			],
			"orient": [
				0,
				-0.7071067811865475,
				0,
				0.7071067811865476
			]
		},
		"opposite": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"adjacent": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"bool": {
		"_props": {
			"kind": "bool",
			"category": "operator",
			"pos": [
				0.9238795325112866,
				0.860759493670886,
				0.38268343236509
			],
			"orient": [
				0,
				-0.8314696123025456,
				0,
				0.5555702330196018
			]
		},
		"value": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"bool": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"cartopol": {
		"_props": {
			"kind": "cartopol",
			"category": "operator",
			"pos": [
				0.7071067811865477,
				0.8354430379746836,
				0.7071067811865474
			],
			"orient": [
				0,
				-0.9238795325112867,
				0,
				0.38268343236508984
			]
		},
		"x": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"y": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"distance": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"angle": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"change": {
		"_props": {
			"kind": "change",
			"category": "operator",
			"pos": [
				0.3826834323650904,
				0.8101265822784811,
				0.9238795325112865
			],
			"orient": [
				0,
				-0.9807852804032303,
				0,
				0.19509032201612875
			]
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"clamp": {
		"_props": {
			"kind": "clamp",
			"category": "operator",
			"pos": [
				0,
				0.7848101265822784,
				1
			],
			"orient": [
				0,
				1,
				0,
				6.123233995736766e-17
			]
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"min": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"max": {
			"_props": {
				"kind": "inlet",
				"index": 2
			}
		},
		"clamped": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"cos": {
		"_props": {
			"kind": "cos",
			"category": "operator",
			"pos": [
				-0.3826834323650898,
				0.759493670886076,
				0.9238795325112867
			],
			"orient": [
				0,
				0.9807852804032304,
				0,
				0.19509032201612833
			]
		},
		"value": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"cycle": {
		"_props": {
			"kind": "cycle",
			"category": "operator",
			"pos": [
				-0.7071067811865475,
				0.7341772151898733,
				0.7071067811865476
			],
			"orient": [
				0,
				0.9238795325112867,
				0,
				0.38268343236508984
			]
		},
		"freq": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"out2": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"dcblock": {
		"_props": {
			"kind": "dcblock",
			"category": "operator",
			"pos": [
				-0.9238795325112867,
				0.7088607594936709,
				0.38268343236508984
			],
			"orient": [
				0,
				0.8314696123025452,
				0,
				0.5555702330196023
			]
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"delta": {
		"_props": {
			"kind": "delta",
			"category": "operator",
			"pos": [
				-1,
				0.6835443037974684,
				6.123233995736766e-17
			],
			"orient": [
				0,
				0.7071067811865475,
				0,
				0.7071067811865476
			]
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"div": {
		"_props": {
			"kind": "div",
			"category": "operator",
			"pos": [
				-0.9238795325112867,
				0.6582278481012658,
				-0.3826834323650897
			],
			"orient": [
				0,
				0.5555702330196022,
				0,
				0.8314696123025452
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"quotient": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"fold": {
		"_props": {
			"kind": "fold",
			"category": "operator",
			"pos": [
				-0.7071067811865476,
				0.6329113924050633,
				-0.7071067811865475
			],
			"orient": [
				0,
				0.3826834323650898,
				0,
				0.9238795325112867
			]
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"min": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"max": {
			"_props": {
				"kind": "inlet",
				"index": 2
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"fract": {
		"_props": {
			"kind": "fract",
			"category": "operator",
			"pos": [
				-0.3826834323650899,
				0.6075949367088607,
				-0.9238795325112867
			],
			"orient": [
				0,
				0.19509032201612825,
				0,
				0.9807852804032304
			]
		},
		"value": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"fract": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"gt": {
		"_props": {
			"kind": "gt",
			"category": "operator",
			"pos": [
				-1.2246467991473532e-16,
				0.5822784810126582,
				-1
			],
			"orient": [
				0,
				0,
				0,
				1
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"latch": {
		"_props": {
			"kind": "latch",
			"category": "operator",
			"pos": [
				0.38268343236508967,
				0.5569620253164558,
				-0.9238795325112868
			],
			"orient": [
				0,
				-0.19509032201612803,
				0,
				0.9807852804032305
			]
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"control": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"lt": {
		"_props": {
			"kind": "lt",
			"category": "operator",
			"pos": [
				0.7071067811865475,
				0.5316455696202531,
				-0.7071067811865477
			],
			"orient": [
				0,
				-0.3826834323650898,
				0,
				0.9238795325112867
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"max": {
		"_props": {
			"kind": "max",
			"category": "operator",
			"pos": [
				0.9238795325112865,
				0.5063291139240507,
				-0.38268343236509034
			],
			"orient": [
				0,
				-0.5555702330196021,
				0,
				0.8314696123025453
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"min": {
		"_props": {
			"kind": "min",
			"category": "operator",
			"pos": [
				1,
				0.481012658227848,
				-1.8369701987210297e-16
			],
			"orient": [
				0,
				-0.7071067811865475,
				0,
				0.7071067811865476
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"mix": {
		"_props": {
			"kind": "mix",
			"category": "operator",
			"pos": [
				0.9238795325112866,
				0.45569620253164556,
				0.38268343236509
			],
			"orient": [
				0,
				-0.8314696123025456,
				0,
				0.5555702330196018
			]
		},
		"loval": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"hival": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"interp": {
			"_props": {
				"kind": "inlet",
				"index": 2
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"mod": {
		"_props": {
			"kind": "mod",
			"category": "operator",
			"pos": [
				0.7071067811865477,
				0.4303797468354431,
				0.7071067811865474
			],
			"orient": [
				0,
				-0.9238795325112867,
				0,
				0.38268343236508984
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"modulo": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"mul": {
		"_props": {
			"kind": "mul",
			"category": "operator",
			"pos": [
				0.3826834323650904,
				0.40506329113924044,
				0.9238795325112865
			],
			"orient": [
				0,
				-0.9807852804032303,
				0,
				0.19509032201612875
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"product": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"neg": {
		"_props": {
			"kind": "neg",
			"category": "operator",
			"pos": [
				0,
				0.379746835443038,
				1
			],
			"orient": [
				0,
				1,
				0,
				6.123233995736766e-17
			]
		},
		"value": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"noise": {
		"_props": {
			"kind": "noise",
			"category": "operator",
			"pos": [
				-0.3826834323650898,
				0.35443037974683533,
				0.9238795325112867
			],
			"orient": [
				0,
				0.9807852804032304,
				0,
				0.19509032201612833
			]
		},
		"random-stream": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"not": {
		"_props": {
			"kind": "not",
			"category": "operator",
			"pos": [
				-0.7071067811865475,
				0.3291139240506329,
				0.7071067811865476
			],
			"orient": [
				0,
				0.9238795325112867,
				0,
				0.38268343236508984
			]
		},
		"value": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"or": {
		"_props": {
			"kind": "or",
			"category": "operator",
			"pos": [
				-0.9238795325112867,
				0.30379746835443044,
				0.38268343236508984
			],
			"orient": [
				0,
				0.8314696123025452,
				0,
				0.5555702330196023
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"phasor": {
		"_props": {
			"kind": "phasor",
			"category": "operator",
			"pos": [
				-1,
				0.2784810126582278,
				6.123233995736766e-17
			],
			"orient": [
				0,
				0.7071067811865475,
				0,
				0.7071067811865476
			]
		},
		"freq": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"reset": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"poltocar": {
		"_props": {
			"kind": "poltocar",
			"category": "operator",
			"pos": [
				-0.9238795325112867,
				0.25316455696202533,
				-0.3826834323650897
			],
			"orient": [
				0,
				0.5555702330196022,
				0,
				0.8314696123025452
			]
		},
		"r": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"theta": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"x": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		},
		"y": {
			"_props": {
				"kind": "outlet",
				"index": 1,
				"history": false
			}
		}
	},
	"round": {
		"_props": {
			"kind": "round",
			"category": "operator",
			"pos": [
				-0.7071067811865476,
				0.2278481012658229,
				-0.7071067811865475
			],
			"orient": [
				0,
				0.3826834323650898,
				0,
				0.9238795325112867
			]
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"base": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"scale": {
		"_props": {
			"kind": "scale",
			"category": "operator",
			"pos": [
				-0.3826834323650899,
				0.20253164556962022,
				-0.9238795325112867
			],
			"orient": [
				0,
				0.19509032201612825,
				0,
				0.9807852804032304
			]
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"ilo": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"ihi": {
			"_props": {
				"kind": "inlet",
				"index": 2
			}
		},
		"olo": {
			"_props": {
				"kind": "inlet",
				"index": 3
			}
		},
		"ohi": {
			"_props": {
				"kind": "inlet",
				"index": 4
			}
		},
		"exp": {
			"_props": {
				"kind": "inlet",
				"index": 5
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"sign": {
		"_props": {
			"kind": "sign",
			"category": "operator",
			"pos": [
				-1.2246467991473532e-16,
				0.17721518987341778,
				-1
			],
			"orient": [
				0,
				0,
				0,
				1
			]
		},
		"value": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"sin": {
		"_props": {
			"kind": "sin",
			"category": "operator",
			"pos": [
				0.38268343236508967,
				0.1518987341772151,
				-0.9238795325112868
			],
			"orient": [
				0,
				-0.19509032201612803,
				0,
				0.9807852804032305
			]
		},
		"value": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"smoothstep": {
		"_props": {
			"kind": "smoothstep",
			"category": "operator",
			"pos": [
				0.7071067811865475,
				0.12658227848101267,
				-0.7071067811865477
			],
			"orient": [
				0,
				-0.3826834323650898,
				0,
				0.9238795325112867
			]
		},
		"loval": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"hival": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"interp": {
			"_props": {
				"kind": "inlet",
				"index": 2
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"sub": {
		"_props": {
			"kind": "sub",
			"category": "operator",
			"pos": [
				0.9238795325112865,
				0.10126582278481022,
				-0.38268343236509034
			],
			"orient": [
				0,
				-0.5555702330196021,
				0,
				0.8314696123025453
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"difference": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"tanh": {
		"_props": {
			"kind": "tanh",
			"category": "operator",
			"pos": [
				1,
				0.07594936708860756,
				-1.8369701987210297e-16
			],
			"orient": [
				0,
				-0.7071067811865475,
				0,
				0.7071067811865476
			]
		},
		"value": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"wrap": {
		"_props": {
			"kind": "wrap",
			"category": "operator",
			"pos": [
				0.9238795325112866,
				0.05063291139240511,
				0.38268343236509
			],
			"orient": [
				0,
				-0.8314696123025456,
				0,
				0.5555702330196018
			]
		},
		"input": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"min": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"max": {
			"_props": {
				"kind": "inlet",
				"index": 2
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	},
	"xor": {
		"_props": {
			"kind": "xor",
			"category": "operator",
			"pos": [
				0.7071067811865477,
				0.025316455696202445,
				0.7071067811865474
			],
			"orient": [
				0,
				-0.9238795325112867,
				0,
				0.38268343236508984
			]
		},
		"value1": {
			"_props": {
				"kind": "inlet",
				"index": 0
			}
		},
		"value2": {
			"_props": {
				"kind": "inlet",
				"index": 1
			}
		},
		"out1": {
			"_props": {
				"kind": "outlet",
				"index": 0,
				"history": false
			}
		}
	}
}

