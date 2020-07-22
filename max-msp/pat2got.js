const fs = require("fs"),
	path = require("path"),
	assert = require("assert")

// folder to search for gendsps:
let dirname = __dirname

let modules = {
	"speaker":{
		"_props":{"kind":"speaker","category":"abstraction", "pos": [0,0,0], "orient": [0, 0, 0, 1] },
		"input":{"_props":{"kind":"inlet","index":0}}
	},
	"control":{
		"_props":{ "kind":"param", "category":"abstraction", "pos": [0,0,0], "orient": [0, 0, 0, 1] },
		"value":{"_props":{"kind":"large_knob", "range":[0,1], "value":0}},
		"output":{"_props":{"kind":"outlet","index":0, "history": false}}
	},
}
fs.readdirSync(dirname).forEach((filename, i) => {
	if (path.extname(filename) != ".gendsp") return;
	const name = path.basename(filename).split(".")[0]
	if (name.charAt(0) == "_") return;
	if (["world"].indexOf(name) >= 0) return;
	const module = {
		_props:{kind:name,category:"abstraction",pos:[0,0,0],orient:[0,0,0,1] },
	}
	let inlets = [], outlets = [], knobs = []
	
	console.log("---- ", name)
	JSON.parse(fs.readFileSync(filename, "utf-8")).patcher.boxes.forEach((box)=>{
		let {id, maxclass, numinlets, numoutlets, patching_rect, text} = box.box
		if (maxclass != "newobj") return;
		let attributes = text.split("@")
		let args = attributes.shift().split(" ");
		let attrs = attributes.reduce((o, v)=>{
			let idx = v.indexOf(" ")
			o[v.substring(0, idx)] = v.substring(idx+1)
			return o
		}, {})
		// skip hidden features:
		if (attrs.comment && attrs.comment.includes("hidden")) return;
		switch(args.shift()) {
			case "param": {
				// TODO could pack more param config into attrs.comment field if needed
				knobs.push({
					x: patching_rect[0], y: patching_rect[1],	
					name: args.length > 0 ? args[0] : attrs.name || id,
					module: { _props:{
						kind:"knob", 
						range:[
							attrs.min != undefined ? (+attrs.min) : 0, 
							attrs.max != undefined ? (+attrs.max) : 1
						],
						value: args.length > 1 ? args[1] : attrs.default || 0,
					}}
				})
			} break;
			case "in": {
				let idx = args.length > 0 ? (+args[0])-1 : (+attrs.index)-1 || 0
				inlets.push({
					x: patching_rect[0], y: patching_rect[1],	
					name: args.length > 1 ? args[1] : attrs.comment || "in"+idx,
					module: { _props:{kind:"inlet", index: idx, }}
				})
			} break;
			case "out": {

				let idx = args.length > 0 ? (+args[0])-1 : (+attrs.index)-1 || 0
				outlets.push({
					x: patching_rect[0], y: patching_rect[1],	
					name: args.length > 1 ? args[1] : attrs.comment || "out"+idx,
					module: { _props:{ kind:"outlet", index: idx, history:false }}
				})
			} break;
			default: {
				return;
			}
		}
		//console.log(op, args, attrs, patching_rect)
	});
	// sort and then insert parts:
	knobs.sort((a,b)=>(a.y-b.y)*3+(a.x-b.x)).forEach(v=>{ module[v.name] = v.module;});
	inlets.sort((a,b)=>(a.module._props.index-b.module._props.index)).forEach(v=>{ module[v.name] = v.module;});
	outlets.sort((a,b)=>(a.module._props.index-b.module._props.index)).forEach(v=>{ module[v.name] = v.module;});
	modules[name] = module

	delete module.parts
})

// now add some of the gen operators:
let categories = ["buffer", "waveform", "filter", "integrator", "route", "range", "logic", "comparison", "numeric", "math", "trigonometry"]
let ops = JSON.parse(fs.readFileSync("operators.json", "utf-8")).sort((a,b)=>categories.indexOf(a.category)-categories.indexOf(b.category)).filter(op=>{
	let default_ctor = op.constructors[op.constructors.length-1]
	return !(
		(op.box_expr && ["constant", "illegal", "revop"].indexOf(op.box_expr) >= 0) 
		|| (op.expr_type && op.expr_type == "expr_type_special")
		|| (op.expr_outputs && op.expr_outputs == "special") 
		|| (op.category && ["convert", "FFT", "constant", "dsp", "input-output", "powers", "integrator"].indexOf(op.category) >= 0) 
		|| (op.category == "comparison" && op.op.slice(-1) == "p")
		|| (["constant", "fixdenorm", "isdenorm", "fixnan", "isnan", "send", "receive", "setparam", 
			"asin", "acos", "atan", "acosh", "asinh", "cosh", "sinh", "atanh", "tan", "hypot", "degrees", "radians", 
			"trunc", "ceil", "floor", "triangle", "train", "rate", "interp", "phasewrap", "slide",
			"eq", "neq", "gte", "lte",
			].indexOf(op.op) >= 0) 
		|| (/^[A-Z]/.test(op.op))
		|| (/^fast/.test(op.op))
		|| (Array.isArray(default_ctor.arguments) && default_ctor.arguments.length > 0)
	)
})

ops.forEach(op=>{
	console.log("---", op.op)
	let name = op.op

	// assert that this doesn't already exist in modules
	if (modules[name]) {
		console.log("warning, user abstraction conflicts with operator name:", name)
		return;
	}

  	let outputs = op.outputs
	let default_ctor = op.constructors[op.constructors.length-1]
	// only handle objects with fixed no. inlets / outlets
	if (default_ctor.inlets.length !== undefined && op.outputs.length !== undefined) {

		let in_names = default_ctor.inlets
		let out_names = outputs.map(o => o.name)

		// TODO: assert that no in_names conflict with out_names
		
		let module = { _props: { kind: name, category:"operator", pos:[0,0,0], orient:[0,0,0,1] }, }
		// inlets:
		in_names.forEach((k,i)=>{
			module[k] = { _props: { kind:"inlet", index:i }}
		});
		// outlets:
		out_names.forEach((k,i)=>{
			module[k] = { _props: { kind:"outlet", index:i, history:false }}
		});
		modules[name] = module
	}
	/*
	
  
  let name = op.op
  
  let ctors = op.constructors
  let inputs = op.inputs
  let outputs = op.outputs
  let specification = op.category
  console.log(op.category)
  //console.log(op)

  let default_ctor = ctors[ctors.length-1]
  let ninlets = default_ctor.inlets.length
  let noutlets = outputs.length
  //console.log(name,ninlets,noutlets)
  // skip objects that need args
  if (Array.isArray(default_ctor.arguments) && default_ctor.arguments.length > 0) continue;

  // skip constants for now
  if (op.category == "constant") continue;

  // only handle objects with fixed no. inlets / outlets
  if (ninlets !== undefined && noutlets !== undefined) {

    let in_names = default_ctor.inlets
    let out_names = outputs.map(o => o.name)
    //console.log(outputs.map(o => o.name))

    let codes = [`
      { "op":"newnode", "path":"\${path}", "kind":"${name}", "specification":"${specification}","category":"operator", "pos":[0,0,0], "orient":[0,0,0,1] }`];

    for (let i=0; i<in_names.length; i++) {
      let inlet_name = in_names[i]
      
      
      codes.push(`
      { "op":"newnode", "kind":"inlet", "path":"\${path}.${inlet_name}", "specification":"${specification}", "category":"operator", "index":${i} }`);
    }
    for (let i=0; i<out_names.length; i++) {
      let outlet_name = out_names[i]
      //console.log(outlet_name)
      codes.push(`
      { "op":"newnode", "kind":"outlet", "path":"\${path}.${outlet_name}", "specification":"${specification}", "category":"operator", "index":${i} }`);
    }


    operator_constructors.push(`
  "${name}": function(path) { 
    return JSON.parse(\`[${codes.join(",")}
    ]\`);
  }`)


  } else {
    //if (!Array.isArray(default_ctor.inlets)) console.log("weird inlets", name, default_ctor.inlets, outputs)
    //if (!Array.isArray(outputs)) console.log("weird outputs", name, default_ctor.inlets, outputs)
  }
}
*/
})

console.log(Object.keys(modules).length, "modules")

fs.writeFileSync("menu.json", JSON.stringify(modules, null, "\t"), "utf-8");

// now parse maxpats to turn them into scenes:
fs.readdirSync(dirname).forEach((filename, i) => {
	if (path.extname(filename) != ".maxpat") return;
	const name = path.basename(filename).split(".")[0]
	console.log("---- ", name)
	// search for gen~ object in patcher, to convert it into a scene
	JSON.parse(fs.readFileSync(filename, "utf-8")).patcher.boxes.forEach((box)=>{ 
		let {id, maxclass, numinlets, numoutlets, patching_rect, text} = box.box
		if (maxclass != "newobj") return;

		let attributes = text.split("@")
		let args = attributes.shift().split(" ");
		let attrs = attributes.reduce((o, v)=>{
			let idx = v.indexOf(" ")
			o[v.substring(0, idx)] = v.substring(idx+1)
			return o
		}, {})
		let op = args.shift();
		console.log(op)
	});
});