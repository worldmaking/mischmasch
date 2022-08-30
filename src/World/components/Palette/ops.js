let opsList = 
[
  {
    "op": "mstosamps",
    "classification": "conversion",
    "inputs": {
      "period": "period in milliseconds"
    },
    "outputs": {
      "out1": "period in samples"
    }
  },
  {
    "op": "mtof",
    "classification": "conversion",
    "inputs": {
      "note": "MIDI note number",
      "tuning": "tuning base in Hz"
    },
    "outputs": {
      "out1": "frequency in Hz"
    }
  },
  {
    "op": "history",
    "classification": "delay",
    "inputs": {
      "name": "History name",
      "value": "set the next value (for feedback circuits)"
    },
    "outputs": {
      "out1": "previous value"
    }
  },
  {
    "op": "dcblock",
    "classification": "filtering",
    "inputs": {
      "input": "input to filter"
    },
    "outputs": {
      "out1": "filtered output"
    }
  },
  {
    "op": "delta",
    "classification": "filtering",
    "inputs": {
      "input": "value to differentiate"
    },
    "outputs": {
      "out1": "differential of input (difference from previous input)"
    }
  },
  {
    "op": "sah",
    "classification": "filtering",
    "inputs": {
      "input": "input to sample",
      "control": "control signal",
      "thresh": "threshold"
    },
    "outputs": {
      "out1": "current or previous"
    }
  },
  {
    "op": "slide",
    "classification": "filtering",
    "inputs": {
      "input": "input to filter",
      "up": "slide up value (samples)",
      "down": "slide down value (samples)"
    },
    "outputs": {
      "out1": "filtered output"
    }
  },
  {
    "op": "counter",
    "classification": "integrator",
    "inputs": {
      "max": "count limit (zero means no limit)",
      "reset": "non-zero value resets the count",
      "incr": "amount to add per sample"
    },
    "outputs": {
      "out1": "running total",
      "out2": "carry flag (counter hit maximum)",
      "out3": "carry count"
    }
  },
  {
    "op": "abs",
    "classification": "mathemagical",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "abs": "absolute value of input"
    }
  },
  {
    "op": "acos",
    "classification": "mathemagical",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "out1": "angle(radians)"
    }
  },
  {
    "op": "add",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "sum": "in1 + in2"
    }
  },
  {
    "op": "asin",
    "classification": "mathemagical",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "out1": "angle(radians)"
    }
  },
  {
    "op": "atan",
    "classification": "mathemagical",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "out1": "angle(radians)"
    }
  },
  {
    "op": "ceil",
    "classification": "mathemagical",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "out1": "input rounded up"
    }
  },
  {
    "op": "cos",
    "classification": "mathemagical",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "out1": "cos(input)"
    }
  },
  {
    "op": "div",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "quotient": "in1 / in2"
    }
  },
  {
    "op": "eq",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    }
  },
  {
    "op": "exp",
    "classification": "mathemagical",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "out1": "exp(in1)"
    }
  },
  {
    "op": "floor",
    "classification": "mathemagical",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "out1": "input rounded down"
    }
  },
  {
    "op": "gt",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    }
  },
  {
    "op": "gte",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    }
  },
  {
    "op": "gtp",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "out1": "in1 or 0"
    }
  },
  {
    "op": "lt",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    }
  },
  {
    "op": "lte",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    }
  },
  {
    "op": "ltp",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "out1": "in1 or 0"
    }
  },
  {
    "op": "max",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "out1": "max(in1,in2)"
    }
  },
  {
    "op": "min",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "out1": "min(in1,in2)"
    }
  },
  {
    "op": "mod",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "modulo": "mod(in1,in2)"
    }
  },
  {
    "op": "mul",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "product": "in1 * in2"
    }
  },
  {
    "op": "neq",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    }
  },
  {
    "op": "pow",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "out1": "sign of input"
    }
  },
  {
    "op": "round",
    "classification": "mathemagical",
    "inputs": {
      "input": "value to round",
      "base": "round to a multiple of"
    },
    "outputs": {
      "out1": "rounded input"
    }
  },
  {
    "op": "sign",
    "classification": "mathemagical",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "out1": "sign of input"
    }
  },
  {
    "op": "sin",
    "classification": "mathemagical",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "out1": "sin(input)"
    }
  },
  {
    "op": "sub",
    "classification": "mathemagical",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "difference": "in1 - in2"
    }
  },
  {
    "op": "t60",
    "classification": "mathemagical",
    "inputs": {
      "time": "time (samples) to decay by 60 dB"
    },
    "outputs": {
      "out1": "sample-rate multiplier"
    }
  },
  {
    "op": "tan",
    "classification": "mathemagical",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "out1": "tan(input)"
    }
  },
  {
    "op": "tanh",
    "classification": "mathemagical",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "out1": "tanh(input)"
    }
  },
  {
    "op": "param",
    "classification": "parameter",
    "inputs": {},
    "outputs": {
      "value": "parameter value"
    }
  },
  {
    "op": "clamp",
    "classification": "scaling",
    "inputs": {
      "input": "input to clamp",
      "min": "lower bound",
      "max": "upper bound"
    },
    "outputs": {
      "clamped": "clamped input"
    }
  },
  {
    "op": "fold",
    "classification": "scaling",
    "inputs": {
      "input": "input to fold",
      "min": "lower bound",
      "max": "upper bound"
    },
    "outputs": {
      "out1": "folded input"
    }
  },
  {
    "op": "wrap",
    "classification": "scaling",
    "inputs": {
      "input": "input to wrap",
      "min": "lower bound",
      "max": "upper bound"
    },
    "outputs": {
      "out1": "wrapped input"
    }
  },
  {
    "op": "cycle",
    "classification": "source",
    "inputs": {
      "freq": "wave frequency",
      "phase": "wave phase (0..1)"
    },
    "outputs": {
      "out1": "interpolated waveform",
      "out2": "index (in samples)"
    }
  },
  {
    "op": "data",
    "classification": "source",
    "inputs": {
      "channels": "number of data buffer channels",
      "dim": "size of data buffer",
      "name": "name of data buffer"
    },
    "outputs": {
      "out1": "length in samples",
      "out2": "number of channels"
    }
  },
  {
    "op": "noise",
    "classification": "source",
    "inputs": {},
    "outputs": {
      "random-stream": "random numbers"
    }
  },
  {
    "op": "peek",
    "classification": "source",
    "inputs": {
      "wave_phase": "phase to read (between start and end indices)",
      "phase": "phase to read (between 0 and 1)",
      "wave_start": "wave start index (samples)",
      "index": "sample index to read",
      "signal": "value to lookup (between -1 and 1)",
      "channel_offset": "channel_offset (zero-based)",
      "name": "name of buffer",
      "wave_end": "wave end index (samples)"
    },
    "outputs": {
      "out1": "sampled value",
      "out2": "index (in samples)"
    }
  },
  {
    "op": "phasor",
    "classification": "source",
    "inputs": {
      "freq": "frequency",
      "reset": "a non-zero value will reset the phase to the initial value"
    },
    "outputs": {
      "out1": "phase (0..1)"
    }
  },
  {
    "op": "poke",
    "classification": "source",
    "inputs": {
      "phase": "index to write (0-1 phase over buffer)",
      "overdub": "overdub mix: amount of original signal to preserve",
      "value": "value to write",
      "channel": "channel to write (zero-based)",
      "name": "name of buffer",
      "position": "position to write (units depend on @index attribute)"
    },
    "outputs": {}
  },
  {
    "op": "rate",
    "classification": "source",
    "inputs": {
      "multiplier": "multiplier to scale phase by",
      "phase": "phase to be scaled (0 to 1)"
    },
    "outputs": {
      "out1": "ramp cycle (0 to 1)"
    }
  },
  {
    "op": "train",
    "classification": "source",
    "inputs": {
      "onset": "onset phase",
      "width": "pulse width",
      "period": "period (samples)"
    },
    "outputs": {
      "out1": "pulse train"
    }
  },
  {
    "op": "and",
    "classification": "switching",
    "inputs": {
      "value1": "input value 1",
      "value2": "input value 2"
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    }
  },
  {
    "op": "bool",
    "classification": "switching",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "bool": "boolean (0 or 1)"
    }
  },
  {
    "op": "gate",
    "classification": "switching",
    "inputs": {
      "input": "input to pass through the gate",
      "choose": "choose which output to forward to"
    },
    "outputs": {}
  },
  {
    "op": "mix",
    "classification": "switching",
    "inputs": {
      "loval": "output if interp is 0",
      "hival": "output if interp is 1",
      "interp": "interpolation factor between inputs"
    },
    "outputs": {
      "out1": "interpolated result"
    }
  },
  {
    "op": "not",
    "classification": "switching",
    "inputs": {
      "value": "input value"
    },
    "outputs": {
      "out1": "boolean (0 or 1)"
    }
  },
  {
    "op": "switch",
    "classification": "switching",
    "inputs": {
      "iffalse": "value if false",
      "iftrue": "value if true",
      "condition": "condition to test"
    },
    "outputs": {
      "out1": "result"
    }
  },
  {
    "op": "in",
    "classification": "throughput",
    "inputs": {},
    "outputs": {
      "value": "input value"
    }
  }
]

let ops = {}
for(let i = 0; i< opsList.length; i++){
  let op = opsList[i]
  ops[op.op] = {
    classification: op.classification,
    inputs: op.inputs,
    outputs: op.outputs
  }
}
const fs = require('fs')
console.log(ops)
fs.writeFileSync('opsObj.json', JSON.stringify(ops, null, 2))