const assert = require('assert'), 
fs = require("fs"), 
path = require("path")
const { fileURLToPath } = require('url');
const { Worker, MessageChannel, MessagePort, isMainThread, parentPort, workerData, SHARE_ENV } = require('worker_threads');

const operators = JSON.parse(fs.readFileSync(path.join(__dirname, '../Op/mischmaschOps.json')))
const Op = require('../Op/Op.js')

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
//worker.on('error', ...);
//worker.on('online', ...)
worker.on('exit', (code) => {
	console.error(`Worker stopped with exit code ${code}`)
	//process.exit(code)
})

function doc2operations(doc) {
	let id = 0;
	function makeUID(name) { return name + (id++) }

	// first, convert the graph to a format that is more useful for us here:
	let chain = []
	let cables = []
	let lastobj

	// loop over the objects in the doc:
	Object.keys(doc).forEach(uuid => {
		let obj = doc[uuid]
		lastobj = obj
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
		if (obj.op == "speaker") {
			chain.push(obj)
		}
	})
	if (chain.length < 1) chain.push(lastobj)

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
	operations.reverse();

	console.log("operations = ", JSON.stringify(operations, null, "  "))
	
	return operations
	// the final stage will be to iterate over a list of statements, looking a bit like this:
	/*

	{
		outputs: ["mdltr_sine"]
		op: "cycle",
		args: [200, 0]
	},
	{
		outputs: ["carrier_phasor"]
		op: "phasor",
		args: ["modltr_sine", 0]
	},
	{
		outputs: ["spkr_output"]
		op: "speaker",
		args: ["carrier_phasor"]
	},
	

		makeUID("modltr")
		nodes["modltr_sine"] = genish["cycle"](200, 0)

		makeUID("carrier")
		nodes["carrier_phasor"] = genish["phasor"](nodes["modltr_sine"], 0)

		makeUID("spkr")
		nodes["spkr_output"] = nodes["carrier_phasor"]

		let graph = nodes["spkr_output"]
	*/

}

module.exports = {

	updateGraph(doc) {
		try {
			console.log("audio got new doc", JSON.stringify(doc, null, "  "))

			let operations = doc2operations(doc)

			worker.postMessage({ cmd: "doc", operations })

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
	}

}