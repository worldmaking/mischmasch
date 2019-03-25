let assert = require("assert");
let ot = require("./ot.js");


// {
// 	let res = ot.findPathContainer(graph.nodes, "a");
// 	console.log(res)
// 	assert(res[0] == graph.nodes)
// 	assert(res[1] == "a");
// }

// {
// 	let res = ot.findPathContainer(graph.nodes, "b.c");
// 	assert(res[0] == graph.nodes.b)
// 	assert(res[1] == "c");
// }

// {
// 	let res = ot.findPathContainer(graph.nodes, "c");
// 	assert(res[0] == undefined);	
// }

// {
// 	let res = ot.findPathContainer(graph.nodes, "x");
// 	assert(res[0] == undefined);		
// }

// {
// 	let res = ot.findPathContainer({}, "a");
// 	assert(res[0] == undefined);			
// }

// testing:
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
];

console.log("\nTEST DUALITY")
console.log("\n--- deltas ---")
console.log(ot.deltasToString(d))

let g = ot.graphFromDeltas(d);
console.log("\n--- graph ---")
console.log(ot.graphToString(g))

let g1 = ot.graphFromDeltas(d);
assert(ot.deepEqual(g, g1));
assert(ot.deepEqual(ot.deltasFromGraph(g, []), ot.deltasFromGraph(g1, [])));

//console.log("\nTEST MERGE")

if (0) {
	console.log("\nTEST CONFLICT")

	// whichever order we apply these, they are incompatible
	// can't merge adding a child and deleting the parent
	// what should the priority be?
	let op1 = { op:"newnode", path:"x.y", kind:"squeak", pos:[10,10] };
	let op2 = { op:"delnode", path:"x", kind:"noise", pos:[10,10] };

	let ab = ot.deepCopy(g);
	let ba = ot.deepCopy(g);

	ot.applyDeltasToGraph(ba, [op1, op2]);
	console.log("\n--- graph ba ---")
	console.log(ot.graphToString(ba))

	ot.applyDeltasToGraph(ab, [op1, op2]);
	console.log("\n--- graph ab ---")
	console.log(ot.graphToString(ab))
}

console.log("\nTEST UNDO EVERYTHING")

let id = ot.inverseDelta(d);
console.log("\n--- deltas inverted ---")
console.log(ot.deltasToString(id))

ot.applyDeltasToGraph(g, id);
console.log("\n--- graph ---")
console.log(ot.graphToString(g))
assert(ot.graphToString(g) == "")

console.log("\nALL TESTS PASSED")