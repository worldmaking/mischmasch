let opsList = 
[
  {
    "op": "speaker",
    "classification": "speaker",
    "inputs": {
      "audio": "audio input"
    },
    "outputs": { }
  },{
    "classification": "mathemagical",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "abs": "absolute value of input"
    },
    "op": "abs"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "input": {
        "info": "value to round",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "rounded input"
    },
    "op": "round"
  },
  {
    "classification": "parameter",
    "inputs": {},
    "outputs": {
      "value": "parameter value"
    },
    "op": "param"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "sum": "in1 + in2"
    },
    "sign": "+",
    "op": "add"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "difference": "in1 - in2"
    },
    "sign": "subtract",
    "op": "sub"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 1,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "mul"
      }
    },
    "outputs": {
      "product": "in1 * in2"
    },
    "sign": "multiply",
    "op": "mul"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          100
        ],
        "kind": "knob",
        "trim": "mul"
      }
    },
    "outputs": {
      "quotient": "in1 / in2"
    },
    "sign": "divide",
    "op": "div"
  },
  {
    "classification": "integrator",
    "inputs": {
      "increment": {
        "info": "The amount to increase the accumulator’s internal value by on each sample",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "reset": {
        "info": "When reset has a value of 1, the accumulator will reset its internal value to 0.",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "accum() is used to increment a stored value between a provided range that defaults to {0,1}. If the accumulator values passes its maximum, it wraps. accum() is very similar to the counter ugen, but is slightly more efficient. Additionally, the min and max properties of accum are fixed values, while they can be specified with signals in counter."
    },
    "op": "accum"
  },
  {
    "classification": "integrator",
    "inputs": {
      "max": {
        "info": "count limit (zero means no limit)",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "reset": {
        "info": "non-zero value resets the count",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "incr": {
        "info": "amount to add per sample",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "mul"
      }
    },
    "outputs": {
      "out1": "running total",
      "out2": "carry flag (counter hit maximum)",
      "out3": "carry count"
    },
    "op": "counter"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "sin(input)"
    },
    "op": "sin"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "cos(input)"
    },
    "op": "cos"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "tan(input)"
    },
    "op": "tan"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "tanh(input)"
    },
    "op": "tanh"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "angle(radians)"
    },
    "op": "asin"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "angle(radians)"
    },
    "op": "acos"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "angle(radians)"
    },
    "op": "atan"
  },
  {
    "classification": "source",
    "inputs": {
      "freq": {
        "info": "frequency",
        "value": 0,
        "range": [
          -10,
          7
        ],
        "kind": "knob",
        "trim": "add"
      },
      "reset": {
        "info": "a non-zero value will reset the phase to the initial value",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "phase": "phase (0..1)"
    },
    "op": "phasor"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "phasorN"
  },
  {
    "classification": "source",
    "inputs": {
      "channels": {
        "info": "number of data buffer channels",
        "value": 1,
        "range": [
          1,
          2
        ],
        "kind": "knob"
      },
      "dim": {
        "info": "size of data buffer",
        "value": 0,
        "range": [
          0,
          44100
        ],
        "kind": "knob"
      },
      "name": {
        "info": "name of data buffer",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob"
      }
    },
    "outputs": {
      "out1": "length in samples",
      "out2": "number of channels"
    },
    "op": "data"
  },
  {
    "classification": "source",
    "inputs": {
      "wave_phase": {
        "info": "phase to read (between start and end indices)",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "phase": {
        "info": "phase to read (between 0 and 1)",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "wave_start": {
        "info": "wave start index (samples)",
        "value": 0,
        "range": [
          0,
          44100
        ],
        "kind": "knob"
      },
      "index": {
        "info": "sample index to read",
        "value": 0,
        "range": [
          0,
          44100
        ],
        "kind": "knob"
      },
      "signal": {
        "info": "value to lookup (between -1 and 1)",
        "value": 0,
        "range": [
          -1,
          1
        ],
        "kind": "inlet"
      },
      "channel_offset": {
        "info": "channel_offset (zero-based)",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "name": {
        "info": "name of buffer",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "wave_end": {
        "info": "wave end index (samples)",
        "value": 0,
        "range": [
          0,
          44100
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "sampled value",
      "out2": "index (in samples)"
    },
    "op": "peek"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "peekDyn"
  },
  {
    "classification": "source",
    "inputs": {
      "freq": {
        "info": "wave frequency",
        "value": 0,
        "range": [
          -10,
          7
        ],
        "kind": "knob",
        "trim": "add"
      },
      "reset": {
        "info": "hard sync",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "sinusoid": "interpolated waveform"
    },
    "op": "cycle"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "cycleN"
  },
  {
    "classification": "delay",
    "inputs": {
      "name": {
        "info": "History name",
        "value": 0,
        "range": [
          0,
          100
        ],
        "kind": "knob"
      },
      "value": {
        "info": "set the next value (for feedback circuits)",
        "value": 1,
        "range": [
          1,
          2
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "previous value"
    },
    "op": "history"
  },
  {
    "classification": "filtering",
    "inputs": {
      "input": {
        "info": "value to differentiate",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "differential of input (difference from previous input)"
    },
    "op": "delta"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "input rounded down"
    },
    "op": "floor"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "input rounded up"
    },
    "op": "ceil"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "min(in1,in2)"
    },
    "op": "min"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "max(in1,in2)"
    },
    "op": "max"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "sign of input"
    },
    "op": "sign"
  },
  {
    "classification": "filtering",
    "inputs": {
      "input": {
        "info": "input to filter",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "filtered output"
    },
    "op": "dcblock"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "memo"
  },
  {
    "classification": "source",
    "inputs": {
      "multiplier": {
        "info": "multiplier to scale phase by",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "mul"
      },
      "phase": {
        "info": "phase to be scaled (0 to 1)",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "ramp": "ramp cycle (0 to 1)"
    },
    "op": "rate"
  },
  {
    "classification": "scaling",
    "inputs": {
      "input": {
        "info": "input to wrap",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "min": {
        "info": "lower bound",
        "value": 0,
        "range": [
          -10,
          10
        ],
        "kind": "knob",
        "trim": "add"
      },
      "max": {
        "info": "upper bound",
        "value": 1,
        "range": [
          -10,
          10
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "wrapped input"
    },
    "op": "wrap"
  },
  {
    "classification": "switching",
    "inputs": {
      "loval": {
        "info": "output if interp is 0",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "hival": {
        "info": "output if interp is 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "crossfade": {
        "info": "crossfade between inputs",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "interpolated result"
    },
    "op": "mix"
  },
  {
    "classification": "scaling",
    "inputs": {
      "input": {
        "info": "input to clamp",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "min": {
        "info": "lower bound",
        "value": -1,
        "range": [
          -1,
          1
        ],
        "kind": "inlet",
        "trim": "add"
      },
      "max": {
        "info": "upper bound",
        "value": 1,
        "range": [
          -1,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "clamped": "clamped input"
    },
    "op": "clamp"
  },
  {
    "classification": "source",
    "inputs": {
      "phase": {
        "info": "index to write (0-1 phase over buffer)",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "overdub": {
        "info": "overdub mix: amount of original signal to preserve",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob"
      },
      "value": {
        "info": "value to write",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "channel": {
        "info": "channel to write (zero-based)",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob"
      },
      "name": {
        "info": "name of buffer",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "position": {
        "info": "position to write (units depend on @index attribute)",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {},
    "op": "poke"
  },
  {
    "classification": "delay",
    "inputs": {
      "in": {
        "info": "the signal to be delayed",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "time": {
        "info": "The amount of time to delay the incoming signal.",
        "value": 22050,
        "range": [
          1,
          44100
        ],
        "kind": "knob"
      }
    },
    "outputs": {
      "out1": "signal output"
    },
    "op": "delay"
  },
  {
    "classification": "scaling",
    "inputs": {
      "input": {
        "info": "input to fold",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "min": {
        "info": "lower bound",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      },
      "max": {
        "info": "upper bound",
        "value": 1,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "folded input"
    },
    "op": "fold"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "modulo": "mod(in1,in2)"
    },
    "op": "mod"
  },
  {
    "classification": "filtering",
    "inputs": {
      "input": {
        "info": "input to sample",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "control": {
        "info": "control signal",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "thresh": {
        "info": "threshold",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "current or previous"
    },
    "op": "sah"
  },
  {
    "classification": "source",
    "inputs": {},
    "outputs": {
      "random": "random numbers"
    },
    "op": "noise"
  },
  {
    "classification": "switching",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    },
    "op": "not"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    },
    "sign": ">",
    "op": "gt"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    },
    "sign": ">=",
    "op": "gte"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    },
    "sign": "<",
    "op": "lt"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    },
    "sign": "<=",
    "op": "lte"
  },
  {
    "classification": "switching",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "bool": "boolean (0 or 1)"
    },
    "sign": "boolean",
    "op": "bool"
  },
  {
    "classification": "switching",
    "inputs": {
      "input": {
        "info": "input to pass through the gate",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "boolean": {
        "info": "0 blocks, 1 passes",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "value": "permitted value"
    },
    "op": "gate"
  },
  {
    "classification": "source",
    "inputs": {
      "freq": {
        "info": "frequency in volt per octave",
        "value": 0,
        "range": [
          -10,
          7
        ],
        "kind": "knob",
        "trim": "add"
      },
      "width": {
        "info": "pulse width",
        "value": 0.5,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "mul"
      }
    },
    "outputs": {
      "out1": "pulse train"
    },
    "op": "train"
  },
  {
    "classification": "filtering",
    "inputs": {
      "input": {
        "info": "input to filter",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "up": {
        "info": "slide up value (samples)",
        "value": 0,
        "range": [
          0,
          44100
        ],
        "kind": "knob"
      },
      "down": {
        "info": "slide down value (samples)",
        "value": 0,
        "range": [
          0,
          44100
        ],
        "kind": "knob"
      }
    },
    "outputs": {
      "out1": "filtered output"
    },
    "op": "slide"
  },
  {
    "classification": "throughput",
    "inputs": {},
    "outputs": {
      "value": "input value"
    },
    "op": "in"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "time": {
        "info": "time (samples) to decay by 60 dB",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "sample-rate multiplier"
    },
    "op": "t60"
  },
  {
    "classification": "conversion",
    "inputs": {
      "note": {
        "info": "MIDI note number",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "tuning": {
        "info": "tuning base in Hz",
        "value": 0,
        "range": [
          0,
          1000
        ],
        "kind": "knob"
      }
    },
    "outputs": {
      "out1": "frequency in Hz"
    },
    "op": "mtof"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "in1 or 0"
    },
    "sign": "< pass",
    "op": "ltp"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "in1 or 0"
    },
    "sign": "> pass",
    "op": "gtp"
  },
  {
    "classification": "switching",
    "inputs": {
      "zero": {
        "info": "value if false",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "nonzero": {
        "info": "value if true",
        "value": 1,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "condition": {
        "info": "condition to test",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "result"
    },
    "op": "switch"
  },
  {
    "classification": "conversion",
    "inputs": {
      "period": {
        "info": "period in milliseconds",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "period in samples"
    },
    "op": "mstosamps"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "selector"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "sign of input"
    },
    "op": "pow"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "attack"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "decay"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "env"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "sign": "attack/decay",
    "op": "ad"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "adsr"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "ifelse"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "bang"
  },
  {
    "classification": "switching",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          100
        ],
        "kind": "knob",
        "trim": "add"
      }
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    },
    "op": "and"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "pan"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "mul"
      }
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    },
    "sign": "==",
    "op": "eq"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value1": {
        "info": "input value 1",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      },
      "value2": {
        "info": "input value 2",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "knob",
        "trim": "mul"
      }
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    },
    "sign": "!=",
    "op": "neq"
  },
  {
    "classification": "mathemagical",
    "inputs": {
      "value": {
        "info": "input value",
        "value": 0,
        "range": [
          0,
          1
        ],
        "kind": "inlet"
      }
    },
    "outputs": {
      "out1": "exp(in1)"
    },
    "op": "exp"
  },
  {
    "classification": "generic",
    "inputs": {},
    "outputs": {},
    "op": "seq"
  }
]
 let ops = 
//  {
//   "mstosamps": {
//     "classification": "conversion",
//     "inputs": {
//       "period": "period in milliseconds"
//     },
//     "outputs": {
//       "out1": "period in samples"
//     }
//   },
//   "mtof": {
//     "classification": "conversion",
//     "inputs": {
//       "note": "MIDI note number",
//       "tuning": "tuning base in Hz"
//     },
//     "outputs": {
//       "out1": "frequency in Hz"
//     }
//   },
//   "history": {
//     "classification": "delay",
//     "inputs": {
//       "name": "History name",
//       "value": "set the next value (for feedback circuits)"
//     },
//     "outputs": {
//       "out1": "previous value"
//     }
//   },
//   "dcblock": {
//     "classification": "filtering",
//     "inputs": {
//       "input": "input to filter"
//     },
//     "outputs": {
//       "out1": "filtered output"
//     }
//   },
//   "delta": {
//     "classification": "filtering",
//     "inputs": {
//       "input": "value to differentiate"
//     },
//     "outputs": {
//       "out1": "differential of input (difference from previous input)"
//     }
//   },
//   "sah": {
//     "classification": "filtering",
//     "inputs": {
//       "input": "input to sample",
//       "control": "control signal",
//       "thresh": "threshold"
//     },
//     "outputs": {
//       "out1": "current or previous"
//     }
//   },
//   "slide": {
//     "classification": "filtering",
//     "inputs": {
//       "input": "input to filter",
//       "up": "slide up value (samples)",
//       "down": "slide down value (samples)"
//     },
//     "outputs": {
//       "out1": "filtered output"
//     }
//   },
//   "counter": {
//     "classification": "integrator",
//     "inputs": {
//       "max": "count limit (zero means no limit)",
//       "reset": "non-zero value resets the count",
//       "incr": "amount to add per sample"
//     },
//     "outputs": {
//       "out1": "running total",
//       "out2": "carry flag (counter hit maximum)",
//       "out3": "carry count"
//     }
//   },
//   "abs": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "absolute value of input"
//     }
//   },
//   "acos": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "angle(radians)"
//     }
//   },
//   "add": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "in1 + in2"
//     }
//   },
//   "asin": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "angle(radians)"
//     }
//   },
//   "atan": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "angle(radians)"
//     }
//   },
//   "ceil": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "input rounded up"
//     }
//   },
//   "cos": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "cos(input)"
//     }
//   },
//   "div": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "quotient": "in1 / in2"
//     }
//   },
//   "eq": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "boolean (0 or 1)"
//     }
//   },
//   "exp": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "exp(in1)"
//     }
//   },
//   "floor": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "input rounded down"
//     }
//   },
//   "gt": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "boolean (0 or 1)"
//     }
//   },
//   "gte": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "boolean (0 or 1)"
//     }
//   },
//   "gtp": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "in1 or 0"
//     }
//   },
//   "lt": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "boolean (0 or 1)"
//     }
//   },
//   "lte": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "boolean (0 or 1)"
//     }
//   },
//   "ltp": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "in1 or 0"
//     }
//   },
//   "max": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "max(in1,in2)"
//     }
//   },
//   "min": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "min(in1,in2)"
//     }
//   },
//   "mod": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "mod(in1,in2)"
//     }
//   },
//   "mul": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "product": "in1 * in2"
//     }
//   },
//   "neq": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "boolean (0 or 1)"
//     }
//   },
//   "pow": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "sign of input"
//     }
//   },
//   "round": {
//     "classification": "mathemagical",
//     "inputs": {
//       "input": "value to round",
//       "base": "round to a multiple of"
//     },
//     "outputs": {
//       "out1": "rounded input"
//     }
//   },
//   "sign": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "sign of input"
//     }
//   },
//   "sin": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "sin(input)"
//     }
//   },
//   "sub": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "in1 - in2"
//     }
//   },
//   "t60": {
//     "classification": "mathemagical",
//     "inputs": {
//       "time": "time (samples) to decay by 60 dB"
//     },
//     "outputs": {
//       "out1": "sample-rate multiplier"
//     }
//   },
//   "tan": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "tan(input)"
//     }
//   },
//   "tanh": {
//     "classification": "mathemagical",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "tanh(input)"
//     }
//   },
//   "param": {
//     "classification": "parameter",
//     "inputs": {},
//     "outputs": {
//       "out1": "parameter value"
//     }
//   },
//   "clamp": {
//     "classification": "scaling",
//     "inputs": {
//       "input": "input to clamp",
//       "min": "lower bound",
//       "max": "upper bound"
//     },
//     "outputs": {
//       "out1": "clamped input"
//     }
//   },
//   "fold": {
//     "classification": "scaling",
//     "inputs": {
//       "input": "input to fold",
//       "min": "lower bound",
//       "max": "upper bound"
//     },
//     "outputs": {
//       "out1": "folded input"
//     }
//   },
//   "wrap": {
//     "classification": "scaling",
//     "inputs": {
//       "input": "input to wrap",
//       "min": "lower bound",
//       "max": "upper bound"
//     },
//     "outputs": {
//       "out1": "wrapped input"
//     }
//   },
//   "cycle": {
//     "classification": "source",
//     "inputs": {
//       "freq": "wave frequency",
//       "phase": "wave phase (0..1)"
//     },
//     "outputs": {
//       "out1": "interpolated waveform",
//       "out2": "index (in samples)"
//     }
//   },
//   "data": {
//     "classification": "source",
//     "inputs": {
//       "channels": "number of data buffer channels",
//       "dim": "size of data buffer",
//       "name": "name of data buffer"
//     },
//     "outputs": {
//       "out1": "length in samples",
//       "out2": "number of channels"
//     }
//   },
//   "noise": {
//     "classification": "source",
//     "inputs": {},
//     "outputs": {
//       "out1": "random numbers"
//     }
//   },
//   "peek": {
//     "classification": "source",
//     "inputs": {
//       "wave_phase": "phase to read (between start and end indices)",
//       "phase": "phase to read (between 0 and 1)",
//       "wave_start": "wave start index (samples)",
//       "index": "sample index to read",
//       "signal": "value to lookup (between -1 and 1)",
//       "channel_offset": "channel_offset (zero-based)",
//       "name": "name of buffer",
//       "wave_end": "wave end index (samples)"
//     },
//     "outputs": {
//       "out1": "sampled value",
//       "out2": "index (in samples)"
//     }
//   },
//   "phasor": {
//     "classification": "source",
//     "inputs": {
//       "freq": "frequency",
//       "reset": "a non-zero value will reset the phase to the initial value"
//     },
//     "outputs": {
//       "out1": "phase (0..1)"
//     }
//   },
//   "poke": {
//     "classification": "source",
//     "inputs": {
//       "phase": "index to write (0-1 phase over buffer)",
//       "overdub": "overdub mix: amount of original signal to preserve",
//       "value": "value to write",
//       "channel": "channel to write (zero-based)",
//       "name": "name of buffer",
//       "position": "position to write (units depend on @index attribute)"
//     },
//     "outputs": {}
//   },
//   "rate": {
//     "classification": "source",
//     "inputs": {
//       "multiplier": "multiplier to scale phase by",
//       "phase": "phase to be scaled (0 to 1)"
//     },
//     "outputs": {
//       "out1": "ramp cycle (0 to 1)"
//     }
//   },
//   "train": {
//     "classification": "source",
//     "inputs": {
//       "onset": "onset phase",
//       "width": "pulse width",
//       "period": "period (samples)"
//     },
//     "outputs": {
//       "out1": "pulse train"
//     }
//   },
//   "and": {
//     "classification": "switching",
//     "inputs": {
//       "value1": "input value 1",
//       "value2": "input value 2"
//     },
//     "outputs": {
//       "out1": "boolean (0 or 1)"
//     }
//   },
//   "bool": {
//     "classification": "switching",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "boolean (0 or 1)"
//     }
//   },
//   "gate": {
//     "classification": "switching",
//     "inputs": {
//       "input": "input to pass through the gate",
//       "choose": "choose which output to forward to"
//     },
//     "outputs": {}
//   },
//   "mix": {
//     "classification": "switching",
//     "inputs": {
//       "loval": "output if interp is 0",
//       "hival": "output if interp is 1",
//       "interp": "interpolation factor between inputs"
//     },
//     "outputs": {
//       "out1": "interpolated result"
//     }
//   },
//   "not": {
//     "classification": "switching",
//     "inputs": {
//       "value": "input value"
//     },
//     "outputs": {
//       "out1": "boolean (0 or 1)"
//     }
//   },
//   "switch": {
//     "classification": "switching",
//     "inputs": {
//       "iffalse": "value if false",
//       "iftrue": "value if true",
//       "condition": "condition to test"
//     },
//     "outputs": {
//       "out1": "result"
//     }
//   },
//   "in": {
//     "classification": "throughput",
//     "inputs": {},
//     "outputs": {
//       "out1": "input value"
//     }
//   }
// }
{
  "abs": {
      "classification": "mathemagical",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "abs": "absolute value of input"
      }
  },
  "round": {
      "classification": "mathemagical",
      "inputs": {
          "input": {
              "info": "value to round",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "rounded input"
      }
  },
  "param": {
      "classification": "parameter",
      "inputs": {},
      "outputs": {
          "value": "parameter value"
      }
  },
  "add": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
              
          }
      },
      "outputs": {
          "sum": "in1 + in2"
      },
      "sign": "+"
  },
  "sub": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "difference": "in1 - in2"
      },
      "sign": "subtract"
  },
  "mul": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 1,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "mul"
          }
      },
      "outputs": {
          "product": "in1 * in2"
      },
      "sign": "multiply"
  },
  "div": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  100
              ],
              "kind": "knob",
              "trim": "mul"
          }
      },
      "outputs": {
          "quotient": "in1 / in2"
      },
      "sign": "divide"
  },
  "accum": {
      "classification": "integrator",
      "inputs": {
          "increment": {
              "info": "The amount to increase the accumulator’s internal value by on each sample",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "reset": {
              "info": "When reset has a value of 1, the accumulator will reset its internal value to 0.",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "accum() is used to increment a stored value between a provided range that defaults to {0,1}. If the accumulator values passes its maximum, it wraps. accum() is very similar to the counter ugen, but is slightly more efficient. Additionally, the min and max properties of accum are fixed values, while they can be specified with signals in counter."
      }
  },
  "counter": {
      "classification": "integrator",
      "inputs": {
          "max": {
              "info": "count limit (zero means no limit)",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "reset": {
              "info": "non-zero value resets the count",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "incr": {
              "info": "amount to add per sample",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "mul"
          }
      },
      "outputs": {
          "out1": "running total",
          "out2": "carry flag (counter hit maximum)",
          "out3": "carry count"
      }
  },
  "sin": {
      "classification": "mathemagical",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "sin(input)"
      }
  },
  "cos": {
      "classification": "mathemagical",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "cos(input)"
      }
  },
  "tan": {
      "classification": "mathemagical",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "tan(input)"
      }
  },
  "tanh": {
      "classification": "mathemagical",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "tanh(input)"
      }
  },
  "asin": {
      "classification": "mathemagical",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "angle(radians)"
      }
  },
  "acos": {
      "classification": "mathemagical",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "angle(radians)"
      }
  },
  "atan": {
      "classification": "mathemagical",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "angle(radians)"
      }
  },
  "phasor": {
      "classification": "source",
      "inputs": {
          "freq": {
              "info": "frequency",
              "value": 0,
              "range": [
                  -10, 7
              ],
              "kind": "knob",
              "trim": "add"
          },
          "reset": {
              "info": "a non-zero value will reset the phase to the initial value",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "phase": "phase (0..1)"
      }
  },
  "phasorN": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  },
  "data": {
      "classification": "source",
      "inputs": {
          "channels": {
              "info": "number of data buffer channels",
              "value": 1,
              "range": [
                  1,
                  2
              ],
              "kind": "knob"
          },
          "dim": {
              "info": "size of data buffer",
              "value": 0,
              "range": [
                  0,
                  44100
              ],
              "kind": "knob"
          },
          "name": {
              "info": "name of data buffer",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob"
          }
      },
      "outputs": {
          "out1": "length in samples",
          "out2": "number of channels"
      }
  },
  "peek": {
      "classification": "source",
      "inputs": {
          "wave_phase": {
              "info": "phase to read (between start and end indices)",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "phase": {
              "info": "phase to read (between 0 and 1)",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "wave_start": {
              "info": "wave start index (samples)",
              "value": 0,
              "range": [
                  0,
                  44100
              ],
              "kind": "knob"
          },
          "index": {
              "info": "sample index to read",
              "value": 0,
              "range": [
                  0,
                  44100
              ],
              "kind": "knob"
          },
          "signal": {
              "info": "value to lookup (between -1 and 1)",
              "value": 0,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet"
          },
          "channel_offset": {
              "info": "channel_offset (zero-based)",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "name": {
              "info": "name of buffer",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "wave_end": {
              "info": "wave end index (samples)",
              "value": 0,
              "range": [
                  0,
                  44100
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "sampled value",
          "out2": "index (in samples)"
      }
  },
  "peekDyn": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  },
  "cycle": {
      "classification": "source",
      "inputs": {
          "freq": {
              "info": "wave frequency",
              "value": 0,
              "range": [
                  -10, 7
              ],
              "kind": "knob",
              "trim": "add"
          },
          "reset": {
              "info": "hard sync",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "sinusoid": "interpolated waveform"
      }
  },
  "cycleN": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  },
  "history": {
      "classification": "delay",
      "inputs": {
          "name": {
              "info": "History name",
              "value": 0,
              "range": [
                  0,
                  100
              ],
              "kind": "knob"
          },
          "value": {
              "info": "set the next value (for feedback circuits)",
              "value": 1,
              "range": [
                  1,
                  2
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "previous value"
      }
  },
  "delta": {
      "classification": "filtering",
      "inputs": {
          "input": {
              "info": "value to differentiate",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "differential of input (difference from previous input)"
      }
  },
  "floor": {
      "classification": "mathemagical",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "input rounded down"
      }
  },
  "ceil": {
      "classification": "mathemagical",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "input rounded up"
      }
  },
  "min": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "min(in1,in2)"
      }
  },
  "max": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "max(in1,in2)"
      }
  },
  "sign": {
      "classification": "mathemagical",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "sign of input"
      }
  },
  "dcblock": {
      "classification": "filtering",
      "inputs": {
          "input": {
              "info": "input to filter",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "filtered output"
      }
  },
  "memo": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  },
  "rate": {
      "classification": "source",
      "inputs": {
          "multiplier": {
              "info": "multiplier to scale phase by",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "mul"
          },
          "phase": {
              "info": "phase to be scaled (0 to 1)",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "ramp": "ramp cycle (0 to 1)"
      }
  },
  "wrap": {
      "classification": "scaling",
      "inputs": {
          "input": {
              "info": "input to wrap",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "min": {
              "info": "lower bound",
              "value": 0,
              "range": [
                  -10,
                  10
              ],
              "kind": "knob",
              "trim": "add"            
          },
          "max": {
              "info": "upper bound",
              "value": 1,
              "range": [
                  -10,
                  10
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "wrapped input"
      }
  },
  "mix": {
      "classification": "switching",
      "inputs": {
          "loval": {
              "info": "output if interp is 0",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "hival": {
              "info": "output if interp is 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "crossfade": {
              "info": "crossfade between inputs",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "interpolated result"
      }
  },
  "clamp": {
      "classification": "scaling",
      "inputs": {
          "input": {
              "info": "input to clamp",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "min": {
              "info": "lower bound",
              "value": -1,
              "range": [
                  -1,
                  1
              ],
              "kind": "inlet",
              "trim": "add"
          },
          "max": {
              "info": "upper bound",
              "value": 1,
              "range": [
                  -1,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "clamped": "clamped input"
      }
  },
  "poke": {
      "classification": "source",
      "inputs": {
          "phase": {
              "info": "index to write (0-1 phase over buffer)",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "overdub": {
              "info": "overdub mix: amount of original signal to preserve",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob"
          },
          "value": {
              "info": "value to write",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "channel": {
              "info": "channel to write (zero-based)",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob"
          },
          "name": {
              "info": "name of buffer",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "position": {
              "info": "position to write (units depend on @index attribute)",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {}
  },
  "delay": {
      "classification": "delay",
      "inputs": {
          "in": {
              "info": "the signal to be delayed",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "time": {
              "info": "The amount of time to delay the incoming signal.",
              "value": 22050,
              "range": [
                  1,
                  44100
              ],
              "kind": "knob"
          }
      },
      "outputs": {
          "out1": "signal output"
      }
  },
  "fold": {
      "classification": "scaling",
      "inputs": {
          "input": {
              "info": "input to fold",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "min": {
              "info": "lower bound",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"

          },
          "max": {
              "info": "upper bound",
              "value": 1,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "folded input"
      }
  },
  "mod": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "modulo": "mod(in1,in2)"
      }
  },
  "sah": {
      "classification": "filtering",
      "inputs": {
          "input": {
              "info": "input to sample",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "control": {
              "info": "control signal",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "thresh": {
              "info": "threshold",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "current or previous"
      }
  },
  "noise": {
      "classification": "source",
      "inputs": {},
      "outputs": {
          "random": "random numbers"
      }
  },
  "not": {
      "classification": "switching",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "boolean (0 or 1)"
      }
  },
  "gt": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "boolean (0 or 1)"
      },
      "sign": ">"
  },
  "gte": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "boolean (0 or 1)"
      },
      "sign": ">="
  },
  "lt": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "boolean (0 or 1)"
      },
      "sign": "<"
  },
  "lte": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "boolean (0 or 1)"
      },
      "sign": "<="
  },
  "bool": {
      "classification": "switching",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "bool": "boolean (0 or 1)"
      },
      "sign": "boolean"
  },
  "gate": {
      "classification": "switching",
      "inputs": {
          "input": {
              "info": "input to pass through the gate",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "boolean": {
              "info": "0 blocks, 1 passes",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "value": "permitted value"
      }
  },
  "train": {
      "classification": "source",
      "inputs": {
          "freq": {
              "info": "frequency in volt per octave",
              "value": 0,
              "range": [
                  -10, 7
              ],
              "kind": "knob",
              "trim": "add"
          },
          "width": {
              "info": "pulse width",
              "value": 0.5,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "mul"

          }
      },
      "outputs": {
          "out1": "pulse train"
      }
  },
  "slide": {
      "classification": "filtering",
      "inputs": {
          "input": {
              "info": "input to filter",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "up": {
              "info": "slide up value (samples)",
              "value": 0,
              "range": [
                  0,
                  44100
              ],
              "kind": "knob"
          },
          "down": {
              "info": "slide down value (samples)",
              "value": 0,
              "range": [
                  0,
                  44100
              ],
              "kind": "knob"
          }
      },
      "outputs": {
          "out1": "filtered output"
      }
  },
  "in": {
      "classification": "throughput",
      "inputs": {},
      "outputs": {
          "value": "input value"
      }
  },
  "t60": {
      "classification": "mathemagical",
      "inputs": {
          "time": {
              "info": "time (samples) to decay by 60 dB",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "sample-rate multiplier"
      }
  },
  "mtof": {
      "classification": "conversion",
      "inputs": {
          "note": {
              "info": "MIDI note number",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "tuning": {
              "info": "tuning base in Hz",
              "value": 0,
              "range": [
                  0,
                  1000
              ],
              "kind": "knob"
          }
      },
      "outputs": {
          "out1": "frequency in Hz"
      }
  },
  "ltp": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "in1 or 0"
      },
      "sign": "< pass"
  },
  "gtp": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "in1 or 0"
      },
      "sign": "> pass"
  },
  "switch": {
      "classification": "switching",
      "inputs": {
          "zero": {
              "info": "value if false",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "nonzero": {
              "info": "value if true",
              "value": 1,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "condition": {
              "info": "condition to test",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "result"
      }
  },
  "mstosamps": {
      "classification": "conversion",
      "inputs": {
          "period": {
              "info": "period in milliseconds",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "period in samples"
      }
  },
  "selector": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  },
  "pow": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "sign of input"
      }
  },
  "attack": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  },
  "decay": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  },
  "env": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  },
  "ad": {
      "classification": "generic",
      "inputs": {},
      "outputs": {},
      "sign": "attack/decay"
  },
  "adsr": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  },
  "ifelse": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  },
  "bang": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  },
  "and": {
      "classification": "switching",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  100
              ],
              "kind": "knob",
              "trim": "add"
          }
      },
      "outputs": {
          "out1": "boolean (0 or 1)"
      }
  },
  "pan": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  },
  "eq": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "mul"
          }
      },
      "outputs": {
          "out1": "boolean (0 or 1)"
      },
      "sign": "=="
  },
  "neq": {
      "classification": "mathemagical",
      "inputs": {
          "value1": {
              "info": "input value 1",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          },
          "value2": {
              "info": "input value 2",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "knob",
              "trim": "mul"
          }
      },
      "outputs": {
          "out1": "boolean (0 or 1)"
      },
      "sign": "!="
  },
  "exp": {
      "classification": "mathemagical",
      "inputs": {
          "value": {
              "info": "input value",
              "value": 0,
              "range": [
                  0,
                  1
              ],
              "kind": "inlet"
          }
      },
      "outputs": {
          "out1": "exp(in1)"
      }
  },
  "seq": {
      "classification": "generic",
      "inputs": {},
      "outputs": {}
  }
}
export { opsList, ops }