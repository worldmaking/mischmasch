let opsList = 
[
	{
		"domain": "common",
		"box_expr": "generic",
		"category": "numeric",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "abs",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "Negative values will be converted to positive counterparts.",
		"expr_type": "expr_type_coerce",
		"digest": "The absolute value of the input",
		"seealso": [
			"absdiff",
			"sign",
			"sub"
		],
		"outputs": [
			{
			"name": "abs",
			"label": "absolute value of input"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "trigonometry",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "acos",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "The arc cosine of the input (returns radians)",
		"expr_type": "expr_type_sample_coerce",
		"digest": "The arc cosine of the input (returns radians)",
		"seealso": [
			"asin",
			"atan",
			"atan2",
			"cos"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "angle(radians)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "math",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "add",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Add inputs",
		"expr_type": "expr_type_coerce",
		"digest": "Add inputs",
		"seealso": [
			"div",
			"mod",
			"mul",
			"neg",
			"sub"
		],
		"outputs": [
			{
			"name": "sum",
			"label": "in1 + in2"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"+"
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "logic",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "and",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Returns 1 if both in1 and in2 are nonzero.",
		"expr_type": "expr_type_int_coerce",
		"digest": "Logical and operator",
		"seealso": [
			"bool",
			"not",
			"or",
			"xor"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "boolean (0 or 1)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"&&"
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "trigonometry",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "asin",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "The arc sine of the input (returns radians)",
		"expr_type": "expr_type_sample_coerce",
		"digest": "The arc sine of the input (returns radians)",
		"seealso": [
			"acos",
			"atan",
			"atan2",
			"sin"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "angle(radians)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "trigonometry",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "atan",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "The arc tangent of the input (returns radians)",
		"expr_type": "expr_type_sample_coerce",
		"digest": "The arc tangent of the input (returns radians)",
		"seealso": [
			"acos",
			"asin",
			"atan2",
			"tan"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "angle(radians)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "logic",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "bool",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "Converts any nonzero value to 1 while zero passes through.",
		"expr_type": "expr_type_int_coerce",
		"digest": "constant boolean / convert to boolean",
		"seealso": [
			"constant",
			"float",
			"int"
		],
		"outputs": [
			{
			"name": "bool",
			"label": "boolean (0 or 1)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "numeric",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "ceil",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "Round the value up to the next higher integer",
		"expr_type": "expr_type_coerce",
		"digest": "Round the value up to the next higher integer",
		"seealso": [
			"floor",
			"fract",
			"trunc"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "input rounded up"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "range",
		"inputs": {
			"input": {
			"label": "input to clamp",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "input to clamp",
			"name": "input",
			"default": "0"
			},
			"min": {
			"label": "lower bound",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "lower bound",
			"name": "min",
			"default": "0"
			},
			"max": {
			"label": "upper bound",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "upper bound",
			"name": "max",
			"default": "1"
			}
		},
		"op": "clamp",
		"arguments": [
			"input",
			"min",
			"max"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"input",
				"min",
				"max"
			]
			},
			{
			"inlets": [
				"input"
			],
			"arguments": [
				"min",
				"max"
			]
			},
			{
			"inlets": [
				"input",
				"min"
			],
			"arguments": [
				"max"
			]
			},
			{
			"inlets": [
				"input",
				"min",
				"max"
			],
			"arguments": {}
			}
		],
		"description": "Clamps the input value between specified min and max. Ranges are inclusive (both min and max values may be output)",
		"expr_type": "expr_type_coerce",
		"digest": "Clamp values in a specified range",
		"seealso": [
			"clip",
			"fold",
			"max",
			"min",
			"scale",
			"wrap"
		],
		"outputs": [
			{
			"name": "clamped",
			"label": "clamped input"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"clip"
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "trigonometry",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "cos",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "The cosine of the input (in radians)",
		"expr_type": "expr_type_sample_coerce",
		"digest": "The cosine of the input (in radians)",
		"seealso": [
			"acos",
			"sin",
			"tan"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "cos(input)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"category": "integrator",
		"inputs": {
			"max": {
			"label": "count limit (zero means no limit)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "count limit (zero means no limit)",
			"name": "max",
			"default": "0"
			},
			"reset": {
			"label": "non-zero value resets the count",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "non-zero value resets the count",
			"name": "reset",
			"default": "0"
			},
			"incr": {
			"label": "amount to add per sample",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "amount to add per sample",
			"name": "incr",
			"default": "1"
			}
		},
		"op": "counter",
		"arguments": [
			"incr",
			"reset",
			"max"
		],
		"constructors": [
			{
			"inlets": [
				"reset"
			],
			"arguments": [
				"incr",
				"max"
			]
			},
			{
			"inlets": [
				"incr",
				"reset"
			],
			"arguments": [
				"max"
			]
			},
			{
			"inlets": [
				"incr",
				"reset",
				"max"
			],
			"arguments": {}
			}
		],
		"description": "Accumulates and outputs a stored count, similarly to Max's counter object, but triggered at sample-rate. The amount to accumulate per sample is set by the first input (incr). The count can be reset by a non-zero value in the second input (reset). The third inlet (max) sets a maximum value; the counter will wrap if it reaches this value. However if the maximum value is set to 0 (the default), the counter will assume no limit and count indefinitely. The first outlet outputs the current count, the second outlet outputs 1 when the count wraps at the maximum and zero otherwise, and the third outlet outputs the number of wraps (the carry count).",
		"expr_type": "expr_type_special",
		"digest": "A sample-rate counter",
		"seealso": [
			"counter",
			"plusequals",
			"accum",
			"mulequals",
			"history"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "running total"
			},
			{
			"name": "out2",
			"label": "carry flag (counter hit maximum)"
			},
			{
			"name": "out3",
			"label": "carry count"
			}
		],
		"stateful": true,
		"expr_outputs": "generic",
		"attributes": {
			"init": {
			"optional": true,
			"digest": "Specify the initial count",
			"description": "Specify the initial count",
			"type": "float",
			"default": 0
			}
		},
		"aliases": {},
		"has_constant_expr": false
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"expr_type": "expr_type_sample_signal",
		"stateful": true,
		"category": "buffer",
		"seealso": [
			"phasor",
			"train",
			"buffer",
			"data"
		],
		"has_constant_expr": false,
		"inputs": {
			"freq": {
			"label": "wave frequency",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "wave frequency",
			"name": "freq",
			"default": "440"
			},
			"phase": {
			"label": "wave phase (0..1)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "wave phase (0..1)",
			"name": "phase",
			"default": "0"
			}
		},
		"op": "cycle",
		"expr_outputs": "generic",
		"digest": "Sine / wavetable lookup oscillator",
		"outputs": [
			{
			"name": "out1",
			"label": "interpolated waveform"
			},
			{
			"name": "out2",
			"label": "index (in samples)"
			}
		],
		"attributes": {
			"name": {
			"optional": true,
			"digest": "Specify data or buffer to play",
			"description": "Specify the data or buffer object to use for playback. If not specified, cycle will use a built-in sine wavetable.\"",
			"type": "string"
			},
			"index": {
			"optional": true,
			"enums": {
				"phase": true,
				"freq": true
			},
			"digest": "Specify the index mode",
			"description": "Specify the index mode: \"phase\" maps the input signal range 0..1 to the span of the buffer, \"freq\" cycles through the buffer at a frequency given by the input signal.",
			"type": "enum",
			"default": "freq"
			}
		},
		"constructors": [
			{
			"constraints": {
				"index": [
				"phase"
				]
			},
			"inlets": {},
			"arguments": [
				"buffer",
				"phase"
			]
			},
			{
			"arguments": [
				"buffer"
			],
			"inlets": [
				"phase"
			],
			"constraints": {
				"index": [
				"phase"
				]
			}
			},
			{
			"constraints": {
				"index": [
				"phase"
				]
			},
			"inlets": [
				"phase"
			],
			"arguments": {}
			},
			{
			"inlets": {},
			"arguments": [
				"buffer",
				"freq"
			]
			},
			{
			"inlets": [
				"freq"
			],
			"arguments": [
				"buffer"
			]
			},
			{
			"inlets": [
				"freq"
			],
			"arguments": {}
			}
		],
		"aliases": {},
		"description": "An interpolating oscillator that reads repeatedly through one cycle of a sine wave. By default it is driven by a frequency input, but if the @index attribute is set to 'phase', it can be driven by a phase input instead."
		},
		{
		"domain": "dsp",
		"box_expr": "special",
		"category": "buffer",
		"inputs": {
			"channels": {
			"label": "number of data buffer channels",
			"optional": true,
			"type": {
				"name": "int"
			},
			"digest": "number of data buffer channels",
			"name": "channels",
			"default": "1"
			},
			"dim": {
			"label": "size of data buffer",
			"optional": true,
			"type": {
				"name": "int"
			},
			"digest": "size of data buffer",
			"name": "dim",
			"default": "512"
			},
			"name": {
			"label": "name of data buffer",
			"optional": true,
			"type": {
				"name": "string"
			},
			"digest": "name of data buffer",
			"name": "name",
			"default": "anon"
			}
		},
		"op": "data",
		"arguments": [
			"dim",
			"channels"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"name",
				"dim",
				"channels"
			]
			},
			{
			"inlets": {},
			"arguments": [
				"name",
				"dim"
			]
			},
			{
			"inlets": {},
			"arguments": [
				"name"
			]
			}
		],
		"description": "Stores an array of sample data (64-bit floats) usable for sampling, wavetable synthesis and other purposes. The first argument specifies a name by which to refer to this data in other objects in the gen patcher (such as peek and poke); the second optional argument specifies the length of the array (default 512 samples); and the third optional argument specifies the number of channels (default 1). The first outlet sends the length of the buffer in samples; the second outlet sends the number of channels.",
		"expr_type": "expr_type_special",
		"digest": "A locally stored array of 64-bit values",
		"seealso": [
			"data",
			"buffer",
			"dim",
			"channels",
			"peek",
			"wave",
			"sample",
			"nearest",
			"lookup",
			"cycle",
			"poke",
			"splat"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "length in samples"
			},
			{
			"name": "out2",
			"label": "number of channels"
			}
		],
		"stateful": true,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": false
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"category": "filter",
		"inputs": {
			"input": {
			"label": "input to filter",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "input to filter",
			"name": "input",
			"default": "0"
			}
		},
		"op": "dcblock",
		"arguments": [
			"input"
		],
		"constructors": [
			{
			"inlets": [
				"input"
			],
			"arguments": {}
			}
		],
		"description": "A one-pole high-pass filter to remove DC components. Equivalent to the GenExpr:\n\t\tHistory x1, y1;\n\ty = in1 - x1 + y1*0.9997;\n\tx1 = in1;\n\ty1 = y;\n\tout1 = y;\n",
		"expr_type": "expr_type_sample_signal",
		"digest": "DC blocking filter",
		"seealso": [
			"fixnan",
			"fixdenorm",
			"delay",
			"history",
			"slide"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "filtered output"
			}
		],
		"stateful": true,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"category": "filter",
		"inputs": {
			"input": {
			"label": "value to differentiate",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "value to differentiate",
			"name": "input",
			"default": "0"
			}
		},
		"op": "delta",
		"arguments": [
			"input"
		],
		"constructors": [
			{
			"inlets": [
				"input"
			],
			"arguments": {}
			}
		],
		"description": "Returns the difference between the current and previous input.",
		"expr_type": "expr_type_coerce_signal",
		"digest": "The discrete derivative of the input",
		"seealso": [
			"slide",
			"delta",
			"change",
			"sah"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "differential of input (difference from previous input)"
			}
		],
		"stateful": true,
		"expr_outputs": "generic",
		"attributes": {
			"init": {
			"optional": true,
			"digest": "Specify the first value to compare against",
			"description": "Specify the first value to compare against",
			"type": "float",
			"default": 0
			}
		},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "math",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "1"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "1"
			}
		},
		"op": "div",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Divide inputs",
		"expr_type": "expr_type_sample_coerce",
		"digest": "Divide inputs",
		"seealso": [
			"add",
			"mod",
			"mul",
			"neg",
			"rdiv",
			"sub"
		],
		"outputs": [
			{
			"name": "quotient",
			"label": "in1 / in2"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"/"
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "comparison",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "eq",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Returns 1 if in1 equals in2, else returns zero.",
		"expr_type": "expr_type_int_coerce",
		"digest": "Equal operator",
		"seealso": [
			"gt",
			"gte",
			"lt",
			"lte",
			"neq"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "boolean (0 or 1)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"=="
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "powers",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "exp",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "Raise the mathematical value e to a power",
		"expr_type": "expr_type_sample_coerce",
		"digest": "Raise the mathematical value e to a power",
		"seealso": [
			"exp2",
			"log",
			"log10",
			"log2",
			"pow",
			"sqrt"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "exp(in1)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "numeric",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "floor",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "Round the value down to the next lower integer (toward negative infinity)",
		"expr_type": "expr_type_coerce",
		"digest": "Round the value down to the next lower integer (toward negative infinity)",
		"seealso": [
			"ceil",
			"fract",
			"trunc"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "input rounded down"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "range",
		"inputs": {
			"input": {
			"label": "input to fold",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "input to fold",
			"name": "input",
			"default": "0"
			},
			"min": {
			"label": "lower bound",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "lower bound",
			"name": "min",
			"default": "0"
			},
			"max": {
			"label": "upper bound",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "upper bound",
			"name": "max",
			"default": "1"
			}
		},
		"op": "fold",
		"arguments": [
			"input",
			"min",
			"max"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"input",
				"min",
				"max"
			]
			},
			{
			"inlets": [
				"input"
			],
			"arguments": [
				"min",
				"max"
			]
			},
			{
			"inlets": [
				"input",
				"min"
			],
			"arguments": [
				"max"
			]
			},
			{
			"inlets": [
				"input",
				"min",
				"max"
			],
			"arguments": {}
			}
		],
		"description": "Low and high values can be specified by arguments or by inlets. The default range is 0..1.",
		"expr_type": "expr_type_coerce",
		"digest": "Fold input to a range within a low and high output value",
		"seealso": [
			"clamp",
			"scale",
			"wrap"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "folded input"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"expr_type": "expr_type_coerce",
		"stateful": false,
		"category": "route",
		"seealso": [
			"mix",
			"selector",
			"smoothstep",
			"switch"
		],
		"has_constant_expr": false,
		"inputs": {
			"input": {
			"label": "input to pass through the gate",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "input to pass through the gate",
			"name": "input",
			"default": "0"
			},
			"choose": {
			"label": "choose which output to forward to",
			"optional": true,
			"type": {
				"name": "int"
			},
			"digest": "choose which output to forward to",
			"name": "choose",
			"default": "1"
			}
		},
		"op": "gate",
		"expr_outputs": "special",
		"digest": "Select between a number of outputs",
		"outputs": {},
		"attributes": {
			"choices": {
			"optional": true,
			"digest": "Number of outputs",
			"description": "Number of outputs",
			"type": "int",
			"default": 1
			}
		},
		"constructors": [
			{
			"inlets": [
				"choose",
				"input"
			],
			"arguments": [
				"choices"
			]
			},
			{
			"inlets": [
				"choose",
				"input"
			],
			"arguments": {}
			}
		],
		"aliases": {},
		"description": "Similar to the MSP gate~ object. It takes an argument for number of outputs (one is the default) and lets you choose which the incoming signal (at the right inlet) is sent to according to the (integer) value in the left inlet. A value of zero or less to the left inlet will choose no output; a value greater than the number of outlets will select the last outlet. Like gate~, un-selected outlets will send zero."
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "comparison",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "gt",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Returns 1 if in1 is greater than in2, else returns zero.",
		"expr_type": "expr_type_int_coerce",
		"digest": "Greater than operator",
		"seealso": [
			"eq",
			"gte",
			"lt",
			"lte",
			"neq"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "boolean (0 or 1)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			">"
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "comparison",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "gte",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Returns 1 if in1 is equal to or greater than in2, else returns zero.",
		"expr_type": "expr_type_int_coerce",
		"digest": "Greater than or equals operator",
		"seealso": [
			"eq",
			"gt",
			"lt",
			"lte",
			"neq"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "boolean (0 or 1)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			">="
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "comparison",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "gtp",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Returns in1 if in1 is greater than in2, else returns zero.  Equivalent to in1*(in1 > in2).",
		"expr_type": "expr_type_coerce",
		"digest": "Pass greater than operator",
		"seealso": [
			"eqp",
			"gtep",
			"ltep",
			"ltp",
			"neqp"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "in1 or 0"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			">p"
		],
		"has_constant_expr": true
		},
		{
		"domain": "dsp",
		"box_expr": "special",
		"category": "feedback",
		"inputs": {
			"name": {
			"label": "History name",
			"optional": true,
			"type": {
				"name": "string"
			},
			"digest": "History name",
			"name": "name",
			"default": 0
			},
			"value": {
			"label": "set the next value (for feedback circuits)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "set the next value (for feedback circuits)",
			"name": "value",
			"default": "0"
			}
		},
		"op": "history",
		"arguments": [
			"name",
			"value"
		],
		"constructors": [
			{
			"inlets": [
				"value"
			],
			"arguments": [
				"name",
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": [
				"name"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "The history operator allows feedback in the gen patcher through the insertion of a single-sample delay. The first argument is an optional name for the history operator, which allows it to also be set externally (in the same way as the param operator). The second argument specifies an initial value of stored history (defaults to zero).",
		"expr_type": "expr_type_special",
		"digest": "Single-sample delay, allowing feedback connections",
		"seealso": [
			"param",
			"delay",
			"dcblock",
			"data",
			"buffer"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "previous value"
			}
		],
		"stateful": true,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": false
		},
		{
		"domain": "common",
		"box_expr": "special",
		"expr_type": "expr_type_sample_signal",
		"stateful": false,
		"category": "input-output",
		"seealso": [
			"out"
		],
		"has_constant_expr": false,
		"inputs": {},
		"op": "in",
		"expr_outputs": "generic",
		"digest": "Gen patcher input",
		"outputs": [
			{
			"name": "value",
			"label": "input value"
			}
		],
		"attributes": {
			"max": {
			"optional": true,
			"digest": "Specify maximum value for input",
			"description": "Specify maximum value for parameter. Incoming values out of range will be clamped",
			"type": "vector"
			},
			"comment": {
			"optional": true,
			"digest": "Specify a comment/label for the input",
			"description": "Specify a comment/label for the input",
			"type": "string"
			},
			"min": {
			"optional": true,
			"digest": "Specify minimum value for input",
			"description": "Specify minimum value for parameter. Incoming values out of range will be clamped",
			"type": "vector"
			},
			"index": {
			"optional": true,
			"digest": "Inlet index number",
			"description": "Inlet index number",
			"type": "int",
			"default": 1
			}
		},
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"index",
				"comment"
			]
			},
			{
			"inlets": {},
			"arguments": [
				"index"
			]
			},
			{
			"inlets": {},
			"arguments": {}
			}
		],
		"aliases": {},
		"description": "Defines an input for a gen patcher."
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "comparison",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "lt",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Returns 1 if in1 is less than than in2, else returns zero.",
		"expr_type": "expr_type_int_coerce",
		"digest": "Less than operator",
		"seealso": [
			"eq",
			"gt",
			"gte",
			"lte",
			"neq"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "boolean (0 or 1)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"<"
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "comparison",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "lte",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Returns 1 if in1 is equal to or less than in2, else returns zero.",
		"expr_type": "expr_type_int_coerce",
		"digest": "Less than or equals operator",
		"seealso": [
			"eq",
			"gt",
			"gte",
			"lt",
			"neq"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "boolean (0 or 1)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"<="
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "comparison",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "ltp",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Returns in1 if in1 is less than in2, else returns zero.  Equivalent to in1*(in1 < in2).",
		"expr_type": "expr_type_coerce",
		"digest": "Pass less than operator",
		"seealso": [
			"eqp",
			"gtep",
			"gtp",
			"ltep",
			"neqp"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "in1 or 0"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"<p"
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "comparison",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "max",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "The maximum of the inputs",
		"expr_type": "expr_type_coerce",
		"digest": "The maximum of the inputs",
		"seealso": [
			"clamp",
			"clip",
			"min"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "max(in1,in2)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"maximum"
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "comparison",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "min",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "The minimum of the inputs",
		"expr_type": "expr_type_coerce",
		"digest": "The minimum of the inputs",
		"seealso": [
			"clamp",
			"clip",
			"max"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "min(in1,in2)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"minimum"
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "route",
		"inputs": {
			"loval": {
			"label": "output if interp is 0",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "output if interp is 0",
			"name": "loval",
			"default": "0"
			},
			"hival": {
			"label": "output if interp is 1",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "output if interp is 1",
			"name": "hival",
			"default": "1"
			},
			"interp": {
			"label": "interpolation factor between inputs",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "interpolation factor between inputs",
			"name": "interp",
			"default": "0.5"
			}
		},
		"op": "mix",
		"arguments": [
			"loval",
			"hival",
			"interp"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"loval",
				"hival",
				"interp"
			]
			},
			{
			"inlets": [
				"interp"
			],
			"arguments": [
				"loval",
				"hival"
			]
			},
			{
			"inlets": [
				"loval",
				"hival"
			],
			"arguments": [
				"interp"
			]
			},
			{
			"inlets": [
				"loval",
				"hival",
				"interp"
			],
			"arguments": {}
			}
		],
		"description": "Mixes (interpolates) between inputs a and b according to the value of the third input t, using linear interpolation. The factor (t) should vary between 0 (for a) and 1 (for b). If one argument is given, it specifies the mix (interpolation) factor.",
		"expr_type": "expr_type_coerce",
		"digest": "Linear crossfade of inputs",
		"seealso": [
			"gate",
			"selector",
			"smoothstep",
			"switch"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "interpolated result"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "math",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "1"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "1"
			}
		},
		"op": "mod",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Modulo inputs (remainder of first input / second input)",
		"expr_type": "expr_type_sample_coerce",
		"digest": "Modulo inputs (remainder of first input / second input)",
		"seealso": [
			"add",
			"div",
			"mul",
			"neg",
			"rmod",
			"sub"
		],
		"outputs": [
			{
			"name": "modulo",
			"label": "mod(in1,in2)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"%"
		],
		"has_constant_expr": true
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"expr_type": "expr_type_sample_coerce",
		"stateful": false,
		"category": "convert",
		"seealso": [
			"t60",
			"t60time",
			"atodb",
			"dbtoa",
			"ftom",
			"mtof",
			"mstosamps",
			"sampstoms"
		],
		"has_constant_expr": true,
		"inputs": {
			"period": {
			"label": "period in milliseconds",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "period in milliseconds",
			"name": "period",
			"default": "1000"
			}
		},
		"op": "mstosamps",
		"arguments": [
			"period"
		],
		"expr_outputs": "generic",
		"digest": "Convert period in milliseconds to samples",
		"attributes": {},
		"constructors": [
			{
			"inlets": [
				"period"
			],
			"arguments": {}
			}
		],
		"aliases": {},
		"outputs": [
			{
			"name": "out1",
			"label": "period in samples"
			}
		]
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"category": "convert",
		"inputs": {
			"note": {
			"label": "MIDI note number",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "MIDI note number",
			"name": "note",
			"default": "69"
			},
			"tuning": {
			"label": "tuning base in Hz",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "tuning base in Hz",
			"name": "tuning",
			"default": "440"
			}
		},
		"op": "mtof",
		"arguments": [
			"note",
			"tuning"
		],
		"constructors": [
			{
			"inlets": [
				"tuning"
			],
			"arguments": [
				"note"
			]
			},
			{
			"inlets": [
				"note",
				"tuning"
			],
			"arguments": {}
			}
		],
		"description": "MIDI note number (0-127) is converted to frequency in Hertz. Fractional note numbers are supported. The second input sets the tuning base (default 440).",
		"expr_type": "expr_type_sample_coerce",
		"digest": "Convert MIDI note number to frequency",
		"seealso": [
			"t60",
			"t60time",
			"atodb",
			"dbtoa",
			"ftom",
			"mtof",
			"mstosamps",
			"sampstoms"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "frequency in Hz"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "math",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "1"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "1"
			}
		},
		"op": "mul",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Multiply inputs",
		"expr_type": "expr_type_coerce",
		"digest": "Multiply inputs",
		"seealso": [
			"add",
			"div",
			"mod",
			"neg",
			"sub"
		],
		"outputs": [
			{
			"name": "product",
			"label": "in1 * in2"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"*"
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "comparison",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "neq",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Returns 1 if in1 does not equal in2, else returns zero.",
		"expr_type": "expr_type_int_coerce",
		"digest": "Not equal operator",
		"seealso": [
			"eq",
			"gt",
			"gte",
			"lt",
			"lte"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "boolean (0 or 1)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"!="
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"expr_type": "expr_type_sample_signal",
		"stateful": false,
		"category": "waveform",
		"has_constant_expr": false,
		"expr_outputs": "generic",
		"outputs": [
			{
			"name": "random-stream",
			"label": "random numbers"
			}
		],
		"op": "noise",
		"arguments": {},
		"digest": "A random number generator",
		"inputs": {},
		"attributes": {},
		"constructors": [
			{
			"inlets": [],
			"arguments": {}
			}
		],
		"aliases": {},
		"description": "A random number generator"
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "logic",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "not",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "An input value of zero returns 1, any other value returns zero.",
		"expr_type": "expr_type_int_coerce",
		"digest": "logical negation operator",
		"seealso": [
			"and",
			"bool",
			"or",
			"xor"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "boolean (0 or 1)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"!"
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "special",
		"category": "declare",
		"inputs": {},
		"op": "param",
		"arguments": [
			"name",
			"default"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"name",
				"default"
			]
			},
			{
			"inlets": {},
			"arguments": [
				"name"
			]
			}
		],
		"description": "Named parameters can be modified from outside the gen patcher. The first argument specifies the name of the parameter, the second argument the initial value.",
		"expr_type": "expr_type_special",
		"digest": "An externally modifiable, named parameter",
		"seealso": [
			"setparam"
		],
		"outputs": [
			{
			"name": "value",
			"label": "parameter value"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {
			"max": {
			"optional": true,
			"digest": "Specify maximum value for parameter",
			"description": "Specify maximum value for parameter. Incoming values out of range will be clamped",
			"type": "vector"
			},
			"name": {
			"optional": false,
			"digest": "Parameter name",
			"description": "Parameter name",
			"type": "string"
			},
			"min": {
			"optional": true,
			"digest": "Specify minimum value for parameter",
			"description": "Specify minimum value for parameter. Incoming values out of range will be clamped",
			"type": "vector"
			},
			"default": {
			"optional": true,
			"digest": "Parameter default value",
			"description": "Parameter default value",
			"type": "vector",
			"default": 0
			}
		},
		"aliases": [
			"Param"
		],
		"has_constant_expr": false
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"expr_type": "expr_type_special",
		"stateful": false,
		"category": "buffer",
		"seealso": [
			"data",
			"buffer",
			"dim",
			"channels",
			"peek",
			"wave",
			"sample",
			"nearest",
			"lookup",
			"cycle",
			"poke",
			"splat"
		],
		"has_constant_expr": false,
		"inputs": {
			"wave_phase": {
			"label": "phase to read (between start and end indices)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "phase to read (between start and end indices)",
			"name": "wave_phase",
			"default": "0"
			},
			"phase": {
			"label": "phase to read (between 0 and 1)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "phase to read (between 0 and 1)",
			"name": "phase",
			"default": "0"
			},
			"wave_start": {
			"label": "wave start index (samples)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "wave start index (samples)",
			"name": "wave_start",
			"default": "0"
			},
			"index": {
			"label": "sample index to read",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "sample index to read",
			"name": "index",
			"default": "0"
			},
			"signal": {
			"label": "value to lookup (between -1 and 1)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "value to lookup (between -1 and 1)",
			"name": "signal",
			"default": "0"
			},
			"channel_offset": {
			"label": "channel_offset (zero-based)",
			"optional": true,
			"type": {
				"name": "int"
			},
			"digest": "channel_offset (zero-based)",
			"name": "channel_offset",
			"default": "0"
			},
			"name": {
			"label": "name of buffer",
			"optional": true,
			"type": {
				"name": "string"
			},
			"digest": "name of buffer",
			"name": "name",
			"default": 0
			},
			"wave_end": {
			"label": "wave end index (samples)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "wave end index (samples)",
			"name": "wave_end",
			"default": "512"
			}
		},
		"op": "peek",
		"expr_outputs": "special",
		"digest": "Read values from a data/buffer object",
		"outputs": [
			{
			"name": "out1",
			"label": "sampled value"
			},
			{
			"name": "out2",
			"label": "index (in samples)"
			}
		],
		"attributes": {
			"channelmode": {
			"optional": true,
			"enums": {
				"clamp": true,
				"ignore": true,
				"wrap": true,
				"clip": true,
				"fold": true,
				"mirror": true
			},
			"digest": "Handle invalid channel indices",
			"description": "Handle invalid channel indices: \"ignore\" returns zero, \"wrap\" wraps the indices back into channels of the buffer, \"fold\" and \"mirror\" wrap the indices back into range by alternating direction, \"clip\" and \"clamp\" constrain the indices to the channels available.",
			"type": "enum",
			"default": "ignore"
			},
			"interp": {
			"optional": true,
			"enums": {
				"none": true,
				"cosine": true,
				"cubic": true,
				"step": true,
				"linear": true,
				"spline": true
			},
			"digest": "Specify the interpolation mode",
			"description": "Specify the interpolation mode: \"none\" and \"step\" perform no interpolation, \"linear\" performs two-point linear interpolation, \"cosine\" performs two-point cosine interpolation, \"cubic\" performs four-point cubic interpolation, and \"spline\" performs four-point Catmull-Rom spline interpolation.",
			"type": "enum",
			"default": "none"
			},
			"channels": {
			"optional": true,
			"digest": "Specify the number of channels to read",
			"description": "Specify the number of channels to read",
			"type": "int",
			"default": 1
			},
			"boundmode": {
			"optional": true,
			"enums": {
				"clamp": true,
				"ignore": true,
				"wrap": true,
				"clip": true,
				"fold": true,
				"mirror": true
			},
			"digest": "Handle out-of-range indices",
			"description": "Handle out-of-range indices: \"ignore\" returns zero, \"wrap\" wraps the indices back into the range of the buffer, \"fold\" and \"mirror\" wrap the indices back into range by alternating direction, \"clip\" and \"clamp\" constrain the indices to the buffer limits.",
			"type": "enum",
			"default": "ignore"
			},
			"index": {
			"optional": true,
			"enums": {
				"phase": true,
				"wave": true,
				"samples": true,
				"lookup": true,
				"signal": true
			},
			"digest": "Specify how to index the buffer",
			"description": "Specify how to index the buffer: \"samples\" indexes by sample offset into the buffer, \"phase\" converts a signal in the range of 0..1 to span the whole buffer, \"lookup\" or \"signal\" converts a signal in the range -1..1 to span the whole buffer, \"wave\" uses two additional inlets to specify start and end indices of a section of the buffer (in samples), and converts a signal in the range of 0..1 to span this section.",
			"type": "enum",
			"default": "samples"
			}
		},
		"constructors": [
			{
			"arguments": [
				"name",
				"channels"
			],
			"inlets": [
				"index",
				"channel_offset"
			],
			"constraints": {
				"indexmode": [
				"samples",
				"peek"
				]
			}
			},
			{
			"arguments": [
				"name"
			],
			"inlets": [
				"index",
				"channel_offset"
			],
			"constraints": {
				"indexmode": [
				"samples",
				"peek"
				]
			}
			},
			{
			"arguments": [
				"name",
				"channels"
			],
			"inlets": [
				"phase",
				"channel_offset"
			],
			"constraints": {
				"indexmode": [
				"phase"
				]
			}
			},
			{
			"arguments": [
				"name"
			],
			"inlets": [
				"phase",
				"channel_offset"
			],
			"constraints": {
				"indexmode": [
				"phase"
				]
			}
			},
			{
			"arguments": [
				"name",
				"channels"
			],
			"inlets": [
				"signal",
				"channel_offset"
			],
			"constraints": {
				"indexmode": [
				"signal",
				"lookup"
				]
			}
			},
			{
			"arguments": [
				"name"
			],
			"inlets": [
				"signal",
				"channel_offset"
			],
			"constraints": {
				"indexmode": [
				"signal",
				"lookup"
				]
			}
			},
			{
			"arguments": [
				"name",
				"channels"
			],
			"inlets": [
				"wave_phase",
				"wave_start",
				"wave_end",
				"channel_offset"
			],
			"constraints": {
				"indexmode": [
				"wave"
				]
			}
			},
			{
			"arguments": [
				"name"
			],
			"inlets": [
				"wave_phase",
				"wave_start",
				"wave_end",
				"channel_offset"
			],
			"constraints": {
				"indexmode": [
				"wave"
				]
			}
			}
		],
		"aliases": {},
		"description": "Read values from a data/buffer object. The first argument should be a name of a data or buffer object in the gen patcher. The second argument specifies the number of output channels. The first inlet specifes a sample index to read (no interpolation); indices out of range return zero. The last inlet specifies a channel offset (default 0)."
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"category": "waveform",
		"inputs": {
			"freq": {
			"label": "frequency",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "frequency",
			"name": "freq",
			"default": "440"
			},
			"reset": {
			"label": "a non-zero value will reset the phase to the initial value",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "a non-zero value will reset the phase to the initial value",
			"name": "reset",
			"default": "0"
			}
		},
		"op": "phasor",
		"arguments": [
			"freq",
			"reset"
		],
		"constructors": [
			{
			"inlets": [
				"reset"
			],
			"arguments": [
				"freq"
			]
			},
			{
			"inlets": [
				"freq",
				"reset"
			],
			"arguments": {}
			}
		],
		"description": "A non-bandlimited sawtooth-waveform signal generator which can be used as LFO audio signal or a sample-accurate timing/control signal.",
		"expr_type": "expr_type_sample_signal",
		"digest": "Sawtooth wave generator",
		"seealso": [
			"triangle",
			"rate",
			"cycle",
			"train"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "phase (0..1)"
			}
		],
		"stateful": true,
		"expr_outputs": "generic",
		"attributes": {
			"phase": {
			"optional": true,
			"digest": "Specify the initial phase",
			"description": "Specify the initial phase",
			"type": "float",
			"default": 0
			}
		},
		"aliases": {},
		"has_constant_expr": false
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"category": "buffer",
		"inputs": {
			"phase": {
			"label": "index to write (0-1 phase over buffer)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "index to write (0-1 phase over buffer)",
			"name": "phase",
			"default": "0"
			},
			"overdub": {
			"label": "overdub mix: amount of original signal to preserve",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "overdub mix: amount of original signal to preserve",
			"name": "overdub",
			"default": "0"
			},
			"value": {
			"label": "value to write",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "value to write",
			"name": "value",
			"default": "0"
			},
			"channel": {
			"label": "channel to write (zero-based)",
			"optional": true,
			"type": {
				"name": "int"
			},
			"digest": "channel to write (zero-based)",
			"name": "channel",
			"default": "0"
			},
			"name": {
			"label": "name of buffer",
			"optional": true,
			"type": {
				"name": "string"
			},
			"digest": "name of buffer",
			"name": "name",
			"default": 0
			},
			"position": {
			"label": "position to write (units depend on @index attribute)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "position to write (units depend on @index attribute)",
			"name": "position",
			"default": "0"
			}
		},
		"op": "poke",
		"arguments": [
			"name",
			"value",
			"position",
			"channel",
			"overdub"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"name",
				"value",
				"position",
				"channel",
				"overdub"
			]
			},
			{
			"inlets": [
				"overdub"
			],
			"arguments": [
				"name",
				"value",
				"position",
				"channel"
			]
			},
			{
			"inlets": [
				"value",
				"overdub"
			],
			"arguments": [
				"name",
				"position",
				"channel"
			]
			},
			{
			"inlets": [
				"value",
				"position",
				"overdub"
			],
			"arguments": [
				"name",
				"channel"
			]
			},
			{
			"inlets": [
				"value",
				"position",
				"channel",
				"overdub"
			],
			"arguments": [
				"name"
			]
			}
		],
		"description": "Write values into a data/buffer object. The first argument should be a name of a data or buffer object in the gen patcher. The second argument (or third inlet if omitted) specifies which channel to use. The first inlet specifies a value to write, while the second inlet specifies the sample index within the data/buffer. If the index is out of range, no value is written.",
		"expr_type": "expr_type_special",
		"digest": "Write values into a data/buffer object",
		"seealso": [
			"data",
			"buffer",
			"dim",
			"channels",
			"peek",
			"wave",
			"sample",
			"nearest",
			"lookup",
			"cycle",
			"poke",
			"splat"
		],
		"outputs": {},
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {
			"overdubmode": {
			"optional": true,
			"enums": {
				"accum": true,
				"mix": true
			},
			"digest": "How overdubbing is applied",
			"description": "How overdubbing is applied: \"mix\" crossfades between current and new sample according to the overdub factor, \"accum\" scales the new sample by the overdub factor and adds it to the current sample.",
			"type": "enum",
			"default": "accum"
			},
			"channelmode": {
			"optional": true,
			"enums": {
				"clamp": true,
				"ignore": true,
				"wrap": true,
				"clip": true,
				"fold": true,
				"mirror": true
			},
			"digest": "Handle invalid channel indices",
			"description": "Handle invalid channel indices: \"ignore\" prevents writing, \"wrap\" wraps the indices back into channels of the buffer, \"fold\" and \"mirror\" wrap the indices back into range by alternating direction, \"clip\" and \"clamp\" constrain the indices to the channels available.",
			"type": "enum",
			"default": "ignore"
			},
			"boundmode": {
			"optional": true,
			"enums": {
				"clamp": true,
				"ignore": true,
				"wrap": true,
				"clip": true,
				"fold": true,
				"mirror": true
			},
			"digest": "Handle out-of-range indices",
			"description": "Handle out-of-range indices: \"ignore\" prevents writing, \"wrap\" wraps the indices back into the range of the buffer, \"fold\" and \"mirror\" wrap the indices back into range by alternating direction, \"clip\" and \"clamp\" constrain the indices to the buffer limits.",
			"type": "enum",
			"default": "ignore"
			},
			"index": {
			"optional": true,
			"enums": {
				"samples": true,
				"phase": true,
				"lookup": true,
				"signal": true
			},
			"digest": "How to index the buffer",
			"description": "Specify how to index the buffer: \"samples\" indexes by sample offset into the buffer, \"phase\" converts a signal in the range of 0..1 to span the whole buffer, \"lookup\" or \"signal\" converts a signal in the range -1..1 to span the whole buffer.",
			"type": "enum",
			"default": "samples"
			}
		},
		"aliases": {},
		"has_constant_expr": false
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "powers",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "pow",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Raise in1 to the power of in2",
		"expr_type": "expr_type_sample_coerce",
		"digest": "Raise in1 to the power of in2",
		"seealso": [
			"exp",
			"exp2",
			"log",
			"log10",
			"log2",
			"sqrt"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "sign of input"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"category": "waveform",
		"inputs": {
			"multiplier": {
			"label": "multiplier to scale phase by",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "multiplier to scale phase by",
			"name": "multiplier",
			"default": "1"
			},
			"phase": {
			"label": "phase to be scaled (0 to 1)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "phase to be scaled (0 to 1)",
			"name": "phase",
			"default": "0"
			}
		},
		"op": "rate",
		"arguments": [
			"phase",
			"multiplier"
		],
		"constructors": [
			{
			"inlets": [
				"phase"
			],
			"arguments": [
				"multiplier"
			]
			},
			{
			"inlets": [
				"phase",
				"multiplier"
			],
			"arguments": {}
			}
		],
		"description": "The rate operator time-scales an input phase (such as from a phasor) by a multiplier. Multipliers less than 1 create several ramps per phase cycle.",
		"expr_type": "expr_type_sample_signal",
		"digest": "Time-scale the output of a phasor",
		"seealso": [
			"phasor",
			"triangle"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "ramp cycle (0 to 1)"
			}
		],
		"stateful": true,
		"expr_outputs": "generic",
		"attributes": {
			"sync": {
			"optional": true,
			"enums": {
				"lock": true,
				"off": true,
				"cycle": true
			},
			"digest": "determine how the rate stays in sync with the input phasor",
			"description": "If sync is set to lock, the output phase will be recalculated whenever the input multiplier changes to maintain a smooth ramp. If the sync is set to cycle, this recalculation is deferred until the next cycle of the input phasor.",
			"type": "enum",
			"default": "off"
			}
		},
		"aliases": {},
		"has_constant_expr": false
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"category": "numeric",
		"inputs": {
			"input": {
			"label": "value to round",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "value to round",
			"name": "input",
			"default": "0"
			},
			"base": {
			"label": "round to a multiple of",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "round to a multiple of",
			"name": "base",
			"default": "1"
			}
		},
		"op": "round",
		"arguments": [
			"input",
			"base"
		],
		"constructors": [
			{
			"inlets": [
				"input"
			],
			"arguments": [
				"base"
			]
			},
			{
			"inlets": [
				"input",
				"base"
			],
			"arguments": {}
			}
		],
		"description": "Returns the integral value that is nearest to the input, with halfway cases rounded away from zero.",
		"expr_type": "expr_type_coerce",
		"digest": "round to nearest integer",
		"seealso": [
			"ceil",
			"floor"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "rounded input"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {
			"mode": {
			"optional": true,
			"enums": {
				"trunc": true,
				"ceil": true,
				"nearest": true,
				"floor": true
			},
			"digest": "rounding mode",
			"description": "Determines whether rounding is to nearest multiple in either direction, or the closest multiple toward negative infinity (floor), toward zero (trunc) or toward positive infinity (ceil).",
			"type": "enum",
			"default": "nearest"
			}
		},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"category": "filter",
		"inputs": {
			"input": {
			"label": "input to sample",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "input to sample",
			"name": "input",
			"default": "0"
			},
			"control": {
			"label": "control signal",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "control signal",
			"name": "control",
			"default": "0"
			},
			"thresh": {
			"label": "threshold",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "threshold",
			"name": "thresh",
			"default": "0"
			}
		},
		"op": "sah",
		"arguments": [
			"input",
			"control",
			"thresh"
		],
		"constructors": [
			{
			"inlets": [
				"control"
			],
			"arguments": [
				"input",
				"thresh"
			]
			},
			{
			"inlets": [
				"input",
				"control"
			],
			"arguments": [
				"thresh"
			]
			},
			{
			"inlets": [
				"input",
				"control",
				"thresh"
			],
			"arguments": {}
			}
		],
		"description": "The first inlet is the 'input' and the second inlet is the 'control'. When the control makes a transition from being at or below the trigger value to being above the trigger threshold, the input is sampled. The sampled value is output until another control transition occurs, at which point the input is sampled again. The default threshold value is 0, but can be specified as the last inlet/argument. The @init attribute sets the initial previous value to compare to (default 0).",
		"expr_type": "expr_type_special",
		"digest": "Sample and hold operator (Schmitt trigger)",
		"seealso": [
			"latch",
			"train",
			"slide",
			"delta",
			"change",
			"sah"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "current or previous"
			}
		],
		"stateful": true,
		"expr_outputs": "generic",
		"attributes": {
			"init": {
			"optional": true,
			"digest": "Specify the initially held value",
			"description": "Specify the initially held value",
			"type": "float",
			"default": 0
			}
		},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "numeric",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "sign",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "Positive input returns 1, negative input returns -1, zero returns itself.",
		"expr_type": "expr_type_int_coerce",
		"digest": "Return the sign of the input",
		"seealso": [
			"abs",
			"absdiff",
			"sub"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "sign of input"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "trigonometry",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "sin",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "The sine of the input (in radians)",
		"expr_type": "expr_type_sample_coerce",
		"digest": "The sine of the input (in radians)",
		"seealso": [
			"asin",
			"cos",
			"tan"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "sin(input)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"category": "filter",
		"inputs": {
			"input": {
			"label": "input to filter",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "input to filter",
			"name": "input",
			"default": "0"
			},
			"up": {
			"label": "slide up value (samples)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "slide up value (samples)",
			"name": "up",
			"default": "1"
			},
			"down": {
			"label": "slide down value (samples)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "slide down value (samples)",
			"name": "down",
			"default": "1"
			}
		},
		"op": "slide",
		"arguments": [
			"input",
			"up",
			"down"
		],
		"constructors": [
			{
			"inlets": [
				"input"
			],
			"arguments": [
				"up",
				"down"
			]
			},
			{
			"inlets": [
				"input",
				"up",
				"down"
			],
			"arguments": {}
			}
		],
		"description": "Use the slide operator for envelope following and lowpass filtering. Related to the MSP slide~ object.",
		"expr_type": "expr_type_sample_signal",
		"digest": "Filter a signal logarithmically",
		"seealso": [
			"dcblock",
			"slide",
			"delta",
			"change",
			"sah"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "filtered output"
			}
		],
		"stateful": true,
		"expr_outputs": "generic",
		"attributes": {
			"init": {
			"optional": true,
			"digest": "Specify the initially held value",
			"description": "Specify the initially held value",
			"type": "float",
			"default": 0
			}
		},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "math",
		"inputs": {
			"value1": {
			"label": "input value 1",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 1",
			"name": "value1",
			"default": "0"
			},
			"value2": {
			"label": "input value 2",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value 2",
			"name": "value2",
			"default": "0"
			}
		},
		"op": "sub",
		"arguments": [
			"value1",
			"value2"
		],
		"constructors": [
			{
			"inlets": [
				"value1"
			],
			"arguments": [
				"value2"
			]
			},
			{
			"inlets": [
				"value1",
				"value2"
			],
			"arguments": {}
			}
		],
		"description": "Subtract inputs",
		"expr_type": "expr_type_coerce",
		"digest": "Subtract inputs",
		"seealso": [
			"add",
			"div",
			"mod",
			"mul",
			"neg",
			"rsub"
		],
		"outputs": [
			{
			"name": "difference",
			"label": "in1 - in2"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"-"
		],
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "route",
		"inputs": {
			"iffalse": {
			"label": "value if false",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "value if false",
			"name": "iffalse",
			"default": "0"
			},
			"iftrue": {
			"label": "value if true",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "value if true",
			"name": "iftrue",
			"default": "0"
			},
			"condition": {
			"label": "condition to test",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "condition to test",
			"name": "condition",
			"default": "0"
			}
		},
		"op": "switch",
		"arguments": [
			"condition",
			"iftrue",
			"iffalse"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"condition",
				"iftrue",
				"iffalse"
			]
			},
			{
			"inlets": [
				"condition"
			],
			"arguments": [
				"iftrue",
				"iffalse"
			]
			},
			{
			"inlets": [
				"condition",
				"iffalse"
			],
			"arguments": [
				"iftrue"
			]
			},
			{
			"inlets": [
				"condition",
				"iftrue",
				"iffalse"
			],
			"arguments": {}
			}
		],
		"description": "Selects between the second and third inputs according to the boolean value of the first. If the first argument is true, the second argument will be output.  Otherwise, the third argument will be output.",
		"expr_type": "expr_type_special",
		"digest": "Conditional ternary operator",
		"seealso": [
			"gate",
			"mix",
			"selector",
			"smoothstep"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "result"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": [
			"?"
		],
		"has_constant_expr": true
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"category": "dsp",
		"inputs": {
			"time": {
			"label": "time (samples) to decay by 60 dB",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "time (samples) to decay by 60 dB",
			"name": "time",
			"default": "samplerate"
			}
		},
		"op": "t60",
		"arguments": [
			"time"
		],
		"constructors": [
			{
			"inlets": [
				"time"
			],
			"arguments": {}
			}
		],
		"description": "Returns a multiplication factor to be applied per sample which results in a given T60 time in samples.",
		"expr_type": "expr_type_sample_coerce",
		"digest": "Return sample-rate multiplier for a given t60 time",
		"seealso": [
			"t60",
			"t60time",
			"atodb",
			"dbtoa",
			"ftom",
			"mtof",
			"mstosamps",
			"sampstoms"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "sample-rate multiplier"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "trigonometry",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "tan",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "The tangent of the input (in radians)",
		"expr_type": "expr_type_sample_coerce",
		"digest": "The tangent of the input (in radians)",
		"seealso": [
			"atan",
			"atan2",
			"cos",
			"sin"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "tan(input)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "trigonometry",
		"inputs": {
			"value": {
			"label": "input value",
			"optional": true,
			"type": {
				"name": "vector",
				"params": [
				"float"
				]
			},
			"digest": "input value",
			"name": "value",
			"default": "0"
			}
		},
		"op": "tanh",
		"arguments": [
			"value"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"value"
			]
			},
			{
			"inlets": [
				"value"
			],
			"arguments": {}
			}
		],
		"description": "The hyperbolic tangent of the input",
		"expr_type": "expr_type_sample_coerce",
		"digest": "The hyperbolic tangent of the input",
		"seealso": [
			"atanh",
			"cosh",
			"sinh"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "tanh(input)"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
		},
		{
		"domain": "dsp",
		"box_expr": "generic",
		"category": "waveform",
		"inputs": {
			"onset": {
			"label": "onset phase",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "onset phase",
			"name": "onset",
			"default": "0."
			},
			"width": {
			"label": "pulse width",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "pulse width",
			"name": "width",
			"default": "0.5"
			},
			"period": {
			"label": "period (samples)",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "period (samples)",
			"name": "period",
			"default": "samplerate"
			}
		},
		"op": "train",
		"arguments": [
			"period",
			"width",
			"onset"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"period",
				"width",
				"onset"
			]
			},
			{
			"inlets": [
				"onset"
			],
			"arguments": [
				"period",
				"width"
			]
			},
			{
			"inlets": [
				"width",
				"onset"
			],
			"arguments": [
				"period"
			]
			},
			{
			"inlets": [
				"period",
				"width",
				"onset"
			],
			"arguments": {}
			}
		],
		"description": "train~ generates a pulse signal whose period is specifiable in terms of samples. The first input sets the pulse period (in samples). The second input sets the pulse width (default 0.5). The third inlet sets the phase of the 'on' portion (default 0.)",
		"expr_type": "expr_type_sample_signal",
		"digest": "Pulse train generator",
		"seealso": [
			"phasor",
			"triangle",
			"sah"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "pulse train"
			}
		],
		"stateful": true,
		"expr_outputs": "generic",
		"attributes": {
			"phase": {
			"optional": true,
			"digest": "Specify the initial phase (in samples)",
			"description": "Specify the initial phase (in samples)",
			"type": "float",
			"default": 0
			}
		},
		"aliases": {},
		"has_constant_expr": false
		},
		{
		"domain": "common",
		"box_expr": "generic",
		"category": "range",
		"inputs": {
			"input": {
			"label": "input to wrap",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "input to wrap",
			"name": "input",
			"default": "0"
			},
			"min": {
			"label": "lower bound",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "lower bound",
			"name": "min",
			"default": "0"
			},
			"max": {
			"label": "upper bound",
			"optional": true,
			"type": {
				"name": "float"
			},
			"digest": "upper bound",
			"name": "max",
			"default": "1"
			}
		},
		"op": "wrap",
		"arguments": [
			"input",
			"min",
			"max"
		],
		"constructors": [
			{
			"inlets": {},
			"arguments": [
				"input",
				"min",
				"max"
			]
			},
			{
			"inlets": [
				"input"
			],
			"arguments": [
				"min",
				"max"
			]
			},
			{
			"inlets": [
				"input",
				"min"
			],
			"arguments": [
				"max"
			]
			},
			{
			"inlets": [
				"input",
				"min",
				"max"
			],
			"arguments": {}
			}
		],
		"description": "Low and high values can be specified by arguments or by inlets. The default range is 0..1.",
		"expr_type": "expr_type_coerce",
		"digest": "Wrap input to a range within a low and high output value",
		"seealso": [
			"clamp",
			"fold",
			"scale"
		],
		"outputs": [
			{
			"name": "out1",
			"label": "wrapped input"
			}
		],
		"stateful": false,
		"expr_outputs": "generic",
		"attributes": {},
		"aliases": {},
		"has_constant_expr": true
	}
]

export { opsList }