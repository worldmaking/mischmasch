const assert = require('assert'), 
fs = require("fs"), 
path = require("path");
const { exit } = require('process');
const { fileURLToPath } = require('url');
const { Worker, MessageChannel, MessagePort, isMainThread, parentPort, workerData, SHARE_ENV } = require('worker_threads');

const operators = JSON.parse(fs.readFileSync(path.join(__dirname, '../Op/mischmaschOps.json')))
const Op = require('../Op/Op.js')

const doc1 = JSON.parse(fs.readFileSync(path.join(__dirname,"../../minimum_patch.json")))
const doc2 = JSON.parse(fs.readFileSync(path.join(__dirname,"../../testPatch.json")))

// load a js file as a new Worker thread:
const worker = new Worker(path.join(__dirname, "genish_worker.js"), {
	// argv: becomes process.argv in worker
	// eval: true if 1st arg is a string of code rather than a filepath
	//workerData: "hello"  // pass initial data to worker
});
// here's a message channel to receive messages from it:
//const workerChannel = new MessageChannel();

// receicve a message:
worker.on('message', function (msg) {
	console.log("main received message from audio:", msg)
});

const FAIL = 0
//worker.on('error', ...);
//worker.on('online', ...)
worker.on('exit', (code) => {
	console.error(`Worker stopped with exit code ${code}`)
	//process.exit(code)
	FAIL = 1
})

function doc2operations(doc) {
	let id = 0;
	function makeUID(name) { return name + (id++) }

	// first, convert the graph to a format that is more useful for us here:
	let chain = []
	let cables = []

	// loop over the objects in the doc:
	Object.keys(doc).forEach(uuid => {
		let obj = doc[uuid]
		// // add a "connections" field to all the object's inputs:
		// if (obj.inputs) obj.inputs.forEach(input => {
		// 	input.connections = []
		// })
		// find all the cable connections:
		if (obj.outputs) obj.outputs.forEach(output => {
			if (output.connections) Object.entries(output.connections).forEach(([dst, conn]) => {
				Object.entries(conn).forEach(([input, type]) => {
					cables.push({ src: uuid, output: output.name, dst, input, type })
				})
			})
		})

		// for any end-of-chain items:
		if (obj.name == "speaker") {
			chain.push(obj)
		}
	})

	//console.log("chain", chain)

	let operations = []
	let memo = []
	for (let i = 0; i < chain.length; i++) {
		let obj = chain[i]
		// ensure we only process each object once:
		if (memo[obj.uuid]) continue;
		memo[obj.uuid] = 1

		// build a default statement for this op:
		let op = {
			name: obj.name,
			uuid: obj.uuid,
			inputs: obj.inputs ? obj.inputs.map(input => input.value || 0) : [],
			outputs: obj.outputs ? obj.outputs.map(out => `${out.name}_${obj.uuid}`) : []
		}
		operations.push(op)

		// now refine the operation to fill in the inputs according to the patch cables

		// first, get the cables that connect to this object
		let conns = cables.filter(conn => conn.dst == obj.uuid)
		// for each input 
		if (obj.inputs) obj.inputs.forEach((input, i) => {
			// get the cables that connect to this input
			let inputs = conns.filter(conn => conn.input == input.name).map(conn => {
				// for any op that we used, add it to the chain:
				if (memo[conn.src]) {
					// if we have already generated this object, this must be a history connection
					// TODO
				}
				else {
					chain.push(doc[conn.src])
				}
				return `${conn.output}_${conn.src}`
			})

			while (inputs.length > 1) {
				// combine into an add operation:
				let id = makeUID("add_")
				operations.push({
					name: "add",
					uuid: id,
					inputs: [inputs.pop(), inputs.pop()],
					outputs: [id]
				})
				inputs.push(id)
			}

			// if kind is knob, multiply by value
			// if kind is jack, ignore value

			if (inputs.length) op.inputs[i] = inputs[0]
		})
	}

	// this will have built them in reverse order (by pulling from the outputs)
	// we want to reverse this to generate code
	return operations.reverse();
}

module.exports = {

	updateGraph(doc) {
		try {
			if (FAIL) return;


			//console.log("doc", JSON.stringify(doc, null, "  "))
			
			let operations = doc2operations(doc)
			console.log("operations", JSON.stringify(operations, null, "  "))
			worker.postMessage({ cmd: "graph", operations })

			// setTimeout(()=>{
			// 	worker.postMessage({ cmd: "graph", operations:doc2operations(doc1) })
			// 	setTimeout(()=>{
			// 		worker.postMessage({ cmd: "graph", operations:doc2operations(doc2) })
			// 	}, 2000)
			// }, 2000)

			// send them to the worker:
		} catch (e) {
			console.error(e)
		}
	},

	updateParams(doc) {
		try {

		} catch (e) {
			console.error(e)
		}
	},

	shutdown() {
		if (FAIL) return;
		worker.postMessage({ cmd: "shutdown" })
	}

}