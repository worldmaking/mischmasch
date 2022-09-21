// this is from the NIME version (v0.3.x)
// it was used to generate modules from .gendsp patchers, which might still be useful for us...

const fs = require("fs"),
	path = require("path"),
	assert = require("assert")

const { vec2, vec3, vec4, quat, mat2, mat2d, mat3, mat4} = require("gl-matrix")

// folder to search for gendsps:
let dirname = __dirname

let modules = []
let operators = []

// fs.readdirSync(dirname).forEach((filename, i) => {
// 	if (path.extname(filename) != ".gendsp") return;
// 	const name = path.basename(filename).split(".")[0]
// 	if (name.charAt(0) == "_") return;
// 	if (["world"].indexOf(name) >= 0) return;
// 	const module = {
// 		_props:{kind:name,category:"abstraction",pos:[0,0,0],orient:[0,0,0,1] },
// 	}
// 	let inlets = [], outlets = [], knobs = []
	
// 	console.log("---- ", name)
// 	JSON.parse(fs.readFileSync(filename, "utf-8")).patcher.boxes.forEach((box)=>{
// 		let {id, maxclass, numinlets, numoutlets, patching_rect, text} = box.box
// 		if (maxclass != "newobj") return;
// 		let attributes = text.split("@")
// 		let args = attributes.shift().split(" ");
// 		let attrs = attributes.reduce((o, v)=>{
// 			let idx = v.indexOf(" ")
// 			o[v.substring(0, idx)] = v.substring(idx+1)
// 			return o
// 		}, {})
// 		// skip hidden features:
// 		if (attrs.comment && attrs.comment.includes("hidden")) return;
// 		switch(args.shift()) {
// 			case "param": {
// 				let isInt = (attrs.comment && attrs.comment.includes("integer"))
// 				// TODO could pack more param config into attrs.comment field if needed
// 				knobs.push({
// 					x: patching_rect[0], y: patching_rect[1],	
// 					name: args.length > 0 ? args[0] : attrs.name || id,
// 					module: { _props:{
// 						kind:"knob", 
// 						range:[
// 							attrs.min != undefined ? (+attrs.min) : 0, 
// 							attrs.max != undefined ? (+attrs.max) : 1
// 						],
// 						value: args.length > 1 ? args[1] : attrs.default || 0,
// 						type: isInt ? "int" : "float",
// 					}}
// 				})
// 			} break;
// 			case "in": {
// 				let idx = args.length > 0 ? (+args[0])-1 : (+attrs.index)-1 || 0
// 				inlets.push({
// 					x: patching_rect[0], y: patching_rect[1],	
// 					name: args.length > 1 ? args[1] : attrs.comment || "in"+idx,
// 					module: { _props:{kind:"inlet", index: idx, }}
// 				})
// 			} break;
// 			case "out": {

// 				let idx = args.length > 0 ? (+args[0])-1 : (+attrs.index)-1 || 0
// 				outlets.push({
// 					x: patching_rect[0], y: patching_rect[1],	
// 					name: args.length > 1 ? args[1] : attrs.comment || "out"+idx,
// 					module: { _props:{ kind:"outlet", index: idx, history:false }}
// 				})
// 			} break;
// 			default: {
// 				return;
// 			}
// 		}
// 		//console.log(op, args, attrs, patching_rect)
// 	});
// 	// sort and then insert parts:
// 	knobs.sort((a,b)=>(a.y-b.y)*3+(a.x-b.x)).forEach(v=>{ module[v.name] = v.module;});
// 	inlets.sort((a,b)=>(a.module._props.index-b.module._props.index)).forEach(v=>{ module[v.name] = v.module;});
// 	outlets.sort((a,b)=>(a.module._props.index-b.module._props.index)).forEach(v=>{ module[v.name] = v.module;});
// 	modules.push(module)
// 	delete module.parts
// })

// now add some of the gen operators:
// let categories = ["buffer", "waveform", "filter", "integrator", "route", "range", "logic", "comparison", "numeric", "math", "trigonometry"]
// let ops = JSON.parse(fs.readFileSync(path.join(__dirname, "../Op/genishOperators.json"), "utf-8")).sort((a,b)=>categories.indexOf(a.category)-categories.indexOf(b.category)).filter(op=>{
// 	let default_ctor = op.constructors[op.constructors.length-1]
// 	return !(
// 		(op.box_expr && ["constant", "illegal", "revop"].indexOf(op.box_expr) >= 0) 
// 		|| (op.expr_type && op.expr_type == "expr_type_special")
// 		|| (op.expr_outputs && op.expr_outputs == "special") 
// 		|| (op.category && ["convert", "FFT", "constant", "dsp", "input-output", "powers", "integrator"].indexOf(op.category) >= 0) 
// 		|| (op.category == "comparison" && op.op.slice(-1) == "p")
// 		|| (["constant", "fixdenorm", "isdenorm", "fixnan", "isnan", "send", "receive", "setparam", 
// 			"asin", "acos", "atan", "acosh", "asinh", "cosh", "sinh", "atanh", "tan", "hypot", "degrees", "radians", 
// 			"trunc", "ceil", "floor", "triangle", "train", "rate", "interp", "phasewrap", "slide",
// 			"eq", "neq", "gte", "lte",
// 			].indexOf(op.op) >= 0) 
// 		|| (/^[A-Z]/.test(op.op))
// 		|| (/^fast/.test(op.op))
// 		|| (Array.isArray(default_ctor.arguments) && default_ctor.arguments.length > 0)
// 	)
// })

let ops = JSON.parse(fs.readFileSync(path.join(__dirname, "../Op/genishOperators.json"), "utf-8"))

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
		operators.push(module)
	}
})

let count = modules.length + operators.length
console.log(modules.length, "modules", operators.length, "operators", count, "total")


// now sort these into something meaningful:
modules.sort((a,b) => a._props.kind < b._props.kind ? -1 : 1)
operators.sort((a,b) => a._props.kind < b._props.kind ? -1 : 1)

modules = modules.concat(operators)

let ncols = 16
let nrows = Math.min(6, Math.ceil(count / ncols));
let i = 0;
for (let row = 0; row < nrows; row++) {
	for(let col = 0; col < ncols && i < modules.length; col++, i++){

		let module = modules[i]

		let theta = col * (-2 * Math.PI) / ncols;
		let r = 1;
		let x = r * Math.sin(theta);
		let z = r * Math.cos(theta);
		let y = 2-((i / modules.length)*2)//1 - 0.4 * (row - (nrows/2));
		
		quat.fromEuler(module._props.orient, 0, 180 + theta*180/Math.PI, 0)
		vec3.set(module._props.pos, x, y, z);
	}
}

// objectify:
let menu = {}
modules.map(m => menu[m._props.kind] = m)

fs.writeFileSync("newMenu.json", JSON.stringify(menu, null, "\t"), "utf-8");

// // now parse maxpats to turn them into scenes:
// fs.readdirSync(dirname).forEach((filename, i) => {
// 	if (path.extname(filename) != ".maxpat") return;
// 	const name = path.basename(filename).split(".")[0]
// 	console.log("---- ", name)
// 	// search for gen~ object in patcher, to convert it into a scene
// 	JSON.parse(fs.readFileSync(filename, "utf-8")).patcher.boxes.forEach((box)=>{ 
// 		let {id, maxclass, numinlets, numoutlets, patching_rect, text} = box.box
// 		if (maxclass != "newobj") return;

// 		let attributes = text.split("@")
// 		let args = attributes.shift().split(" ");
// 		let attrs = attributes.reduce((o, v)=>{
// 			let idx = v.indexOf(" ")
// 			o[v.substring(0, idx)] = v.substring(idx+1)
// 			return o
// 		}, {})
// 		let op = args.shift();
// 		console.log(op)
// 	});
// });