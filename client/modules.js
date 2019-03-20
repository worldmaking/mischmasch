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


let scene = {
  "nodes": {
      "a": {
          "_props": { "kind": "noise", "pos": [0.0, 1.5, 0.0] },
          "signal": { "_props": { "kind": "outlet" } }
      },
      "b": {
          "_props": { "kind": "dac", "pos": [0.0, 1.0, 0.0] },
          "source": { "_props": { "kind": "inlet" } }
      },
      "lfo1": {
        "_props": { "kind": "lfo", "pos": [0.0, 0.5, 0.0]},
        "signal": { "_props": { "kind": "outlet" } },
        "rate": {"_props": {"kind": "param", "value": 1 } }
      },
      "child": {
          "_props": { "kind": "group", "pos": [0.5, 1.5, 0.0] },
          "aa": {
              "_props":  { "kind": "beep", "pos": [0.0, 0.2, 0.0] },
              "signal": { "_props": { "kind": "outlet" } }
          }
      },
      "x": { "_props": { "kind": "noise", "pos": [-0.5, 1.5, 0.0] } }
  },
  "arcs": [
      ["a.signal", "b.source"]
  ]
}


for (var node in scene.nodes) {
  
  let moduleType = scene.nodes[node]._props.kind


  let moduleSpec = modules.modules[moduleType]
  console.log(moduleType,moduleSpec)


}

// console.log(string1);
// expected output: "123"
