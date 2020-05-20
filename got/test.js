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

// may testing: 
let d;

if (process.argv[2]){
	d = JSON.parse(fs.readFileSync('got/testing/' + process.argv[2] + '.json'))
} else {
	console.log('test init failed. must supply testing a filename as 1st CLI arg. \nexample:\n\nnpm test newnode')
	process.exit()
}

console.log(d)

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



// let graph = JSON.parse(fs.readFileSync("../scene_files/scene_edited.json"), "utf-8")
// let deltas = got.deltasFromGraph(graph, [])
// fs.writeFileSync("../scene_files/scene_edited_deltas.json", JSON.stringify(deltas, null, "  "), "utf-8")