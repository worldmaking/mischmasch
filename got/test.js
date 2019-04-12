let assert = require("assert");
let fs = require("fs")
let got = require("./got.js");


// {
// 	let res = got.findPathContainer(graph.nodes, "a");
// 	console.log(res)
// 	assert(res[0] == graph.nodes)
// 	assert(res[1] == "a");
// }

// {
// 	let res = got.findPathContainer(graph.nodes, "b.c");
// 	assert(res[0] == graph.nodes.b)
// 	assert(res[1] == "c");
// }

// {
// 	let res = got.findPathContainer(graph.nodes, "c");
// 	assert(res[0] == undefined);	
// }

// {
// 	let res = got.findPathContainer(graph.nodes, "x");
// 	assert(res[0] == undefined);		
// }

// {
// 	let res = got.findPathContainer({}, "a");
// 	assert(res[0] == undefined);			
// }

// testing:
/*
let d = [
	[
	  { op:"newnode", path:"a", kind:"noise", pos:[10,10] }, 
	  { op:"newnode", path:"a.signal", kind:"outlet" }, 
	],
	[
	  { op:"newnode", path:"b", kind:"dac", pos:[10,50] },
	  { op:"newnode", path:"b.source", kind:"inlet" }, 
	],
	{ op:"connect", paths: ["a.signal", "b.source"] },
	{ op:"newnode", path:"child", kind:"group", pos:[50,50] },
	[
	  { op:"newnode", path:"child.a", kind:"beep", pos:[10,10] },
	  { op:"newnode", path:"child.a.signal", kind:"outlet" }
	], 
	{ op:"connect", paths: ["child.a.signal", "b"] },

	{ op:"newnode", path:"x", kind:"noise", pos:[10,10] },
	{ op:"repath", paths: ["child.a", "child.aa"] },

	// change a property
	{ op:"propchange", path:"x", name:"pos", from:[10,10], to:[20,20] }
];
*/

let d = [
	[
	  { op:"newnode", path:"lfo_1", kind:"lfo", pos:[0.0, 1.5, 0.0], orient:[0,0,0,1] }, 
		{ op:"newnode", path:"lfo_1.fm_cv", kind:"inlet", index:0 }, 
		{ op:"newnode", path:"lfo_1.phasor_sync", kind:"inlet", index:1 }, 
	  { op:"newnode", path:"lfo_1.pulse_width_cv", kind:"inlet", index:2 }, 
	  { op:"newnode", path:"lfo_1.rate", kind:"large_knob", range: [0,80],taper: "log 3.8",value:0.17,unit: "Hz" },
		{ op:"newnode", path:"lfo_1.index", kind:"small_knob", range:[0,10],taper: "linear", value: 3.0,unit: "float" }, 
		{ op:"newnode", path:"lfo_1.pulse_width", kind:"small_knob", range:[0,1],taper: "linear", value: 5.0,unit: "float" }, 
		{ op:"newnode", path:"lfo_1.onset", kind:"small_knob", range:[0,1],taper: "linear", value: 2.8,unit: "float" },  
		{ op:"newnode", path:"lfo_1.sine", kind:"outlet", index:0 },
		{ op:"newnode", path:"lfo_1.phasor", kind:"outlet", index:1 }, 
		{ op:"newnode", path:"lfo_1.pulse", kind:"outlet", index:2 },
		{ op:"newnode", path:"lfo_1.sine_index", kind:"outlet", index:3 }, 
	],
	[
	  { op:"newnode", path:"b", kind:"dac", pos:[10,50] },
	  { op:"newnode", path:"b.source", kind:"inlet" }, 
	],
	{ op:"connect", paths: ["a.signal", "b.source"] },
	{ op:"newnode", path:"child", kind:"group", pos:[50,50] },
	[
	  { op:"newnode", path:"child.a", kind:"beep", pos:[10,10] },
	  { op:"newnode", path:"child.a.signal", kind:"outlet" }
	], 
	{ op:"connect", paths: ["child.a.signal", "b"] },

	{ op:"newnode", path:"x", kind:"noise", pos:[10,10] },
	{ op:"repath", paths: ["child.a", "child.aa"] },

	// change a property
	{ op:"propchange", path:"x", name:"pos", from:[10,10], to:[20,20] }
];




console.log("\nTEST DUALITY")
console.log("\n--- deltas ---")
console.log(got.deltasToString(d))

let g = got.graphFromDeltas(d);
console.log("\n--- graph ---")
console.log(got.graphToString(g))

let g1 = got.graphFromDeltas(d);
assert(got.deepEqual(g, g1));
assert(got.deepEqual(got.deltasFromGraph(g, []), got.deltasFromGraph(g1, [])));

//console.log("\nTEST MERGE")

if (0) {
	console.log("\nTEST CONFLICT")

	// whichever order we apply these, they are incompatible
	// can't merge adding a child and deleting the parent
	// what should the priority be?
	let op1 = { op:"newnode", path:"x.y", kind:"squeak", pos:[10,10] };
	let op2 = { op:"delnode", path:"x", kind:"noise", pos:[10,10] };

	let ab = got.deepCopy(g);
	let ba = got.deepCopy(g);

	got.applyDeltasToGraph(ba, [op1, op2]);
	console.log("\n--- graph ba ---")
	console.log(got.graphToString(ba))

	got.applyDeltasToGraph(ab, [op1, op2]);
	console.log("\n--- graph ab ---")
	console.log(got.graphToString(ab))
}

console.log("\nTEST UNDO EVERYTHING")

let id = got.inverseDelta(d);
console.log("\n--- deltas inverted ---")
//console.log(id)
console.log(got.deltasToString(id))

got.applyDeltasToGraph(g, id);
console.log("\n--- graph ---")
console.log(got.graphToString(g))
assert(got.graphToString(g) == "")

console.log("\nALL TESTS PASSED")



let graph = JSON.parse(fs.readFileSync("../scene_edited.json"), "utf-8")
let deltas = got.deltasFromGraph(graph, [])
fs.writeFileSync("../scene_edited_deltas.json", JSON.stringify(deltas, null, "  "), "utf-8")