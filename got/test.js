let assert = require("assert");
let fs = require("fs")
let got = require("./got.js");
const argv = require('yargs').argv


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

let d = JSON.parse(fs.readFileSync('testing/simple_scene.json'))
if (argv.A){
	let editsA = JSON.parse(fs.readFileSync('testing/' + argv.A + '.json'))

	for (i = 0; i < editsA.length; i++){
		d.push(editsA[i])
	}

	if (argv.B){
		let editsB = JSON.parse(fs.readFileSync('testing/' + argv.B + '.json'))
		for (i = 0; i < editsB.length; i++){
			d.push(editsB[i])
		}
	}
} 

// console.log(d)

console.log("\nTEST DUALITY")
console.log("\n--- deltas ---")
console.log(got.deltasToString(d))

let g = got.graphFromDeltas(d);
console.log("\n--- graph ---")
// console.log(got.graphToString(g))

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

