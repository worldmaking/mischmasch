let module_constructors = {
	"sample_and_hold": function(path, pos, orient) { 
        let json = `[{"op":"newnode","path":"${path}","kind":"sample_and_hold","pos":[0,1.5,0],"orient":[0,0,0,1]},{"op":"newnode","path":"${path}.signal","kind":"inlet"},{"op":"newnode","path":"${path}.trigger","kind":"inlet"},{"op":"newnode","path":"${path}.threshold","kind":"small_knob","range":[0,1],"taper":"linear","value":0,"unit":"float"},{"op":"newnode","path":"${path}.out","kind":"inlet"}]`;
        let deltas = JSON.parse(json);
        let op0 = deltas[0]
        op0.pos = pos;
        op0.orient = orient;
        return deltas;
    },

	"freevoib": function(path, pos, orient) { 
        let json = `[{"op":"newnode","path":"${path}","kind":"freevoib","pos":[0,1.5,0],"orient":[0,0,0,1]},{"op":"newnode","path":"${path}.signal","kind":"inlet"},{"op":"newnode","path":"${path}.feedback_1","kind":"small_knob","range":[0,1],"taper":"linear","value":0.9,"unit":"float"},{"op":"newnode","path":"${path}.feedback_2","kind":"small_knob","range":[0,1],"taper":"linear","value":0.5,"unit":"float"},{"op":"newnode","path":"${path}.damping","kind":"small_knob","range":[0,1],"taper":"linear","value":0.5,"unit":"float"},{"op":"newnode","path":"${path}.spread","kind":"small_knob","range":[0,400],"taper":"linear","value":100,"unit":"float"},{"op":"newnode","path":"${path}.out","kind":"outlet"}]`;
        let deltas = JSON.parse(json);
        let op0 = deltas[0]
        op0.pos = pos;
        op0.orient = orient;
        return deltas;
    },

	"shifter": function(path, pos, orient) { 
        let json = `[{"op":"newnode","path":"${path}","kind":"shifter","pos":[0,1.5,0],"orient":[0,0,0,1]},{"op":"newnode","path":"${path}.signal","kind":"inlet"},{"op":"newnode","path":"${path}.cv","kind":"inlet"},{"op":"newnode","path":"${path}.range","kind":"small_knob"},{"op":"newnode","path":"${path}.out","kind":"outlet"},{"op":"newnode","path":"${path}.>","kind":"outlet"}]`;
        let deltas = JSON.parse(json);
        let op0 = deltas[0]
        op0.pos = pos;
        op0.orient = orient;
        return deltas;
    },

	"constant": function(path, pos, orient) { 
        let json = `[{"op":"newnode","path":"${path}","kind":"constant","pos":[0,1.5,0],"orient":[0,0,0,1]},{"op":"newnode","path":"${path}.voltage","kind":"large_knob"},{"op":"newnode","path":"${path}.out","kind":"outlet"}]`;
        let deltas = JSON.parse(json);
        let op0 = deltas[0]
        op0.pos = pos;
        op0.orient = orient;
        return deltas;
    },

	"lfo": function(path, pos, orient) { 
        let json = `[{"op":"newnode","path":"${path}","kind":"lfo","pos":[0,1.5,0],"orient":[0,0,0,1]},{"op":"newnode","path":"${path}.fm_cv","kind":"inlet"},{"op":"newnode","path":"${path}.phasor_sync","kind":"inlet"},{"op":"newnode","path":"${path}.pulse_width_cv","kind":"inlet"},{"op":"newnode","path":"${path}.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.63,"unit":"Hz"},{"op":"newnode","path":"${path}.index","kind":"small_knob","range":[0,10],"taper":"linear","value":1,"unit":"float"},{"op":"newnode","path":"${path}.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":0.25,"unit":"float"},{"op":"newnode","path":"${path}.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":0,"unit":"float"},{"op":"newnode","path":"${path}.sine","kind":"outlet"},{"op":"newnode","path":"${path}.phasor","kind":"outlet"},{"op":"newnode","path":"${path}.pulse","kind":"outlet"},{"op":"newnode","path":"${path}.sine_index","kind":"outlet"}]`;
        let deltas = JSON.parse(json);
        let op0 = deltas[0]
        op0.pos = pos;
        op0.orient = orient;
        return deltas;
    },

	"dualvco": function(path, pos, orient) { 
        let json = `[{"op":"newnode","path":"${path}","kind":"dualvco","pos":[0,0.5,0],"orient":[0,0,0,1]},{"op":"newnode","path":"${path}.vco_1_cv","kind":"inlet"},{"op":"newnode","path":"${path}.index_cv","kind":"inlet"},{"op":"newnode","path":"${path}.vco_2_cv","kind":"inlet"},{"op":"newnode","path":"${path}.feedback_cv","kind":"inlet"},{"op":"newnode","path":"${path}.vco_1_rate","kind":"large_knob","range":[0,6000],"taper":"log 3.8","value":120,"unit":"Hz"},{"op":"newnode","path":"${path}.vco_1_waveform","kind":"n_switch","throws":["Sine","Phasor","Triangle"],"value":"Sine"},{"op":"newnode","path":"${path}.vco_2_rate","kind":"large_knob","range":[0,6000],"taper":"log 3.8","value":3,"unit":"Hz"},{"op":"newnode","path":"${path}.vco_2_waveform","kind":"n_switch","throws":["Sine","Phasor","Triangle"],"value":"Sine"},{"op":"newnode","path":"${path}.feedback","kind":"small_knob","range":[0,6],"taper":"linear","value":0.25,"unit":"float"},{"op":"newnode","path":"${path}.vco_1","kind":"outlet"},{"op":"newnode","path":"${path}.vco_2","kind":"outlet"},{"op":"newnode","path":"${path}.master","kind":"outlet"}]`;
        let deltas = JSON.parse(json);
        let op0 = deltas[0]
        op0.pos = pos;
        op0.orient = orient;
        return deltas;
    },

	"vca": function(path, pos, orient) { 
        let json = `[{"op":"newnode","path":"${path}","kind":"vca","pos":[0,1.8,0],"orient":[0,0,0,1]},{"op":"newnode","path":"${path}.signal","kind":"inlet"},{"op":"newnode","path":"${path}.cv","kind":"inlet"},{"op":"newnode","path":"${path}.cv_amount","kind":"large_knob","range":[0,1],"taper":"linear","value":0.5,"unit":"float"},{"op":"newnode","path":"${path}.bias","kind":"large_knob","range":[0,1],"taper":"linear","value":0.5,"unit":"float"},{"op":"newnode","path":"${path}.output","kind":"outlet"}]`;
        let deltas = JSON.parse(json);
        let op0 = deltas[0]
        op0.pos = pos;
        op0.orient = orient;
        return deltas;
    },

	"comparator": function(path, pos, orient) { 
        let json = `[{"op":"newnode","path":"${path}","kind":"comparator","pos":[0,0.8,0],"orient":[0,0,0,1]},{"op":"newnode","path":"${path}.A","kind":"inlet"},{"op":"newnode","path":"${path}.B","kind":"inlet"},{"op":"newnode","path":"${path}.max","kind":"outlet"},{"op":"newnode","path":"${path}.min","kind":"outlet"}]`;
        let deltas = JSON.parse(json);
        let op0 = deltas[0]
        op0.pos = pos;
        op0.orient = orient;
        return deltas;
    },

	"outs": function(path, pos, orient) { 
        let json = `[{"op":"newnode","path":"${path}","kind":"outs","pos":[0,0.8,0],"orient":[0,0,0,1]},{"op":"newnode","path":"${path}.left_(mono)","kind":"inlet"},{"op":"newnode","path":"${path}.right_(stereo)","kind":"inlet"},{"op":"newnode","path":"${path}.volume","kind":"small_knob","range":[0,1],"taper":"log 3.8","value":0.25,"unit":"float"},{"op":"newnode","path":"${path}.left","kind":"outlet"},{"op":"newnode","path":"${path}.right","kind":"outlet"}]`;
        let deltas = JSON.parse(json);
        let op0 = deltas[0]
        op0.pos = pos;
        op0.orient = orient;
        return deltas;
    },

	"noise": function(path, pos, orient) { 
        let json = `[{"op":"newnode","path":"${path}","kind":"noise","pos":[0,0.8,0],"orient":[0,0,0,1]},{"op":"newnode","path":"${path}.out","kind":"outlet"}]`;
        let deltas = JSON.parse(json);
        let op0 = deltas[0]
        op0.pos = pos;
        op0.orient = orient;
        return deltas;
    },
}

let module_names = Object.keys(module_constructors)

function spawnRandomModule(pos, orient) {
  let opname = module_names[Math.floor(Math.random() * module_names.length)]
  let path = gensym(opname)
  let deltas = module_constructors[opname](path, pos, orient);
  return deltas; 

  // return [
  //   { op:"newnode", kind:opname, path:path, pos:pos, orient:orient },
  //   { op:"newnode", kind:"outlet", path: path+".out" },
  //   { op:"newnode", kind:"outlet", path: path+".out1" },
  //   { op:"newnode", kind:"outlet", path: path+".out2" },
  //   { op:"newnode", kind:"outlet", path: path+".out3" },
  //   { op:"newnode", kind:"outlet", path: path+".out4" },
  //   { op:"newnode", kind:"outlet", path: path+".out5" },
  //   { op:"newnode", kind:"small_knob", path: path+".knob" },
  //   { op:"newnode", kind:"large_knob", path: path+".lknob1" },
  //   { op:"newnode", kind:"large_knob", path: path+".lknob2" },
  //   { op:"newnode", kind:"large_knob", path: path+".lknob3" },
  //   { op:"newnode", kind:"inlet", path: path+".in" },
  //   { op:"newnode", kind:"inlet", path: path+".in1" },
  //   { op:"newnode", kind:"inlet", path: path+".in2" },
  //   { op:"newnode", kind:"inlet", path: path+".in3" },
  //   { op:"newnode", kind:"inlet", path: path+".in4" },
  //   { op:"newnode", kind:"n_switch", path: path+".nswtich", throws: ["Sine", "Phasor","Triangle"], value: 1 }
  // ];
}
