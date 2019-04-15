//////////////////////////////////////////////////////////////////////////////////////////
// MODULES DEFINITIONS
//////////////////////////////////////////////////////////////////////////////////////////

// couldn't figure out how to properly load the modules.json file in js in browser, sorry! Did this below for now...
let modules = {
  "UI": {
    "range":["small_knob", "large_knob", "tuning_knob", "slider"],
    "switches":["momentary","n_switch"],
    "input":["inlet","trigger"],
    "output":["outlet","line_level"],
    "led":"led"    
  },

  "modules": {
      "comparator": {
        "A": "inlet", "B": "inlet", "max": "outlet", "min":"outlet"
      },
      "noise": {
        "noise":"outlet"
      },
      "vca": {
        "in":"inlet","cv":"inlet","trim":"small_knob","bias":"small_knob"
      },
      "lfo": {
        "rate":"small_knob", "sine":"outlet","phasor":"outlet","pulse":"outlet"
      },
      "ffm":{
        "cv1":"inlet","index_cv":"inlet","cv2":"inlet","feedback_cv":"inlet","vco1":"large_knob","waveform1":{"n_switch":["Sine","Phasor","Triangle"]}, "vco2":"large_knob", "waveform2":{"n_switch":["Sine","Phasor","Triangle"]},"index":"small_knob","feedback":"small_knob","vco_1":"outlet","vco_2":"outlet","master":"outlet"
      },
      "outs":{
        "in_1(mono)":"inlet", "in_2(stereo)":"inlet","volume":"large_knob","left":"outlet","right":"outlet"
      },
      "sample_and_hold":{
        "in":"inlet","trigger":"inlet","small_knob":"threshold"
      },
      "freevoib":{
        "feedback1":"small_knob","feedback2":"small_knob","damping":"small_knob","spread":"small_knob","in":"inlet","out":"outlet"
      },"foldcomb":{"signal":"inlet","delay_cv":"inlet","a_cv":"inlet","b_cv":"inlet","c_cv":"inlet","out":"outlet"
      },
      "logic":{
        "A":"inlet","B":"inlet","not_A":"outlet","not_B":"outlet","and":"outlet","bool_A":"outlet","bool_B":"outlet","or":"outlet","xor":"outlet"
      },"shaper":{
        "signal":"inlet","min_cv":"inlet","max_cv":"inlet","fold":"outlet","wrap":"outlet","clip":"outlet"
      },"complex_compare":{
        "A":"inlet","B":"inlet","bias_cv":"inlet","bias":"small_knob","max":"outlet","min":"outlet","diff":"outlet"

      },"dac":{
        "left":"inlet","right":"inlet"
      }
  }
}

function spawnRandomModule(pos, orient) {
  let opname = "noise";

  let path = gensym(opname)

  return [
      { op:"newnode", kind:opname, path:path, pos:[pos.x, pos.y, pos.z], orient:[orient._x, orient._y, orient._z, orient._w] },
      { op:"newnode", kind:"outlet", path: path+".out" },
      { op:"newnode", kind:"outlet", path: path+".out1" },
      { op:"newnode", kind:"outlet", path: path+".out2" },
      { op:"newnode", kind:"outlet", path: path+".out3" },
      { op:"newnode", kind:"outlet", path: path+".out4" },
      { op:"newnode", kind:"outlet", path: path+".out5" },
      { op:"newnode", kind:"small_knob", path: path+".knob" },
      { op:"newnode", kind:"large_knob", path: path+".lknob1" },
      { op:"newnode", kind:"large_knob", path: path+".lknob2" },
      { op:"newnode", kind:"large_knob", path: path+".lknob3" },
      { op:"newnode", kind:"inlet", path: path+".in" },
      { op:"newnode", kind:"inlet", path: path+".in1" },
      { op:"newnode", kind:"inlet", path: path+".in2" },
      { op:"newnode", kind:"inlet", path: path+".in3" },
      { op:"newnode", kind:"inlet", path: path+".in4" },
      { op:"newnode", kind:"n_switch", path: path+".nswtich", throws: ["Sine", "Phasor","Triangle"], value: 1 }
  ];
}