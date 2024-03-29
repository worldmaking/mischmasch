const assert = require('assert'), 
fs = require("fs"), 
path = require("path");
const { exit } = require('process');
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

const FAIL = 0
//worker.on('error', ...);
//worker.on('online', ...)
worker.on('exit', (code) => {
	console.error(`Worker stopped with exit code ${code}`)
	//process.exit(code)
	FAIL = 1
})

function docHasFeedback(doc) {
	let hasFeedback = false

	// first, convert the graph to a format that is more useful for us here:
	let chain = []
	let cables = []
	// loop over the objects in the doc:
	Object.keys(doc).forEach(uuid => {
		let obj = doc[uuid]
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

	let memo = []
	for (let i = 0; i < chain.length; i++) {
		let obj = chain[i]
		// ensure we only process each object once:
		if (memo[obj.uuid]) continue;
		memo[obj.uuid] = 1

		// first, get the cables that connect to this object
		let conns = cables.filter(conn => conn.dst == obj.uuid)
		// for each input 
		if (obj.inputs) obj.inputs.forEach((input, i) => {
			// get the cables that connect to this input
			let incables = conns.filter(conn => conn.input == input.name).map(conn => {
				// for any op that we used, add it to the chain:
				if (memo[conn.src]) {
					// if we have already generated this object, this must be a history connection
					console.log("feedback loop", conn)

					hasFeedback = true
					
				}
				else {
					chain.push(doc[conn.src])
				}
			})
		})
	}
	return hasFeedback
}

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

	let preops = []
	let postops = []
	let operations = []
	let memo = []
	for (let i = 0; i < chain.length; i++) {
		let obj = chain[i]

		//console.log("visit", obj.uuid, obj.name)

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

		//console.log(op)

		// now refine the operation to fill in the inputs according to the patch cables
		

		// first, get the cables that connect to this object
		let conns = cables.filter(conn => conn.dst == obj.uuid)
		// for each input 
		if (obj.inputs) obj.inputs.forEach((input, i) => {
			let inoperations = []

			// get the cables that connect to this input
			let incables = conns.filter(conn => conn.input == input.name).map(conn => {
				// for any op that we used, add it to the chain:
				if (memo[conn.src]) {
					// if we have already generated this object, this must be a history connection
					console.log("feedback loop", conn)

					// // at this point, we need to add a history object
					// // and replace this cable with two cables

					// // create a new op to allocate an history:
					// let history_id = makeUID(`${conn.src}_history_`)
					// preops.push({
					// 	name: "history", uuid: history_id, inputs:[74], outputs:[`${conn.output}_${history_id}`]
					// })

					// // replace cable source with this:
					// conn.src = `${history_id}.out`
				}
				else {
					chain.push(doc[conn.src])
				}
				return `${conn.output}_${conn.src}`
			})

			while (incables.length > 1) {
				// combine into an add operation:
				let id = makeUID("add_")
				inoperations.push({
					name: "add",
					uuid: id,
					inputs: [incables.pop(), incables.pop()],
					outputs: [id]
				})
				incables.push(id)
			}

			// now our cables is either length 0 or 1
			let result

			// if input.kind == "knob" we need to add a Param here
			// and (add or multiply?) the incoming value by this param
			// TODO must clamp result to knob range
			if (input.kind == "knob") {
				let param_id = `param${obj.uuid}_${input.name}`
				let param_name = `${obj.name}_${obj.uuid}_${input.name}`
				// input has: index, name, value || 0, (range??), trim
				//console.log(input)
				inoperations.push({
					name: "param",
					uuid: param_id,
					inputs: [param_name, input.value || 0, -20000, 20000], // also min & max
					outputs: [param_id]
				})

				if (incables.length) {
					// combine cable with knob
					let combine_id = `combine${obj.uuid}_${input.name}`
					inoperations.push({
						name: input.trim || "mul",
						uuid: combine_id,
						inputs: [incables[0], param_id], // also min & max
						outputs: [combine_id]
					})
					result = combine_id
				} else {
					result = param_id
				}

			} else {
				result = (incables.length) ? incables[0] : op.inputs[i]
			}

			// if input is type "frequency"
			if (input.name == "freq") {
				// convert v/oct to Hz
				// using oct=0 => C3 
				// which is oct=-1.25 => A1 => 55hz
				// var hz = 55*Math.pow(2, oct + 1.25);
				let sub_id = makeUID("octsub_")
				inoperations.push({
					name: "add",
					uuid: id,
					inputs: [result, 1.25],
					outputs: [sub_id]
				})
				let pow_id = makeUID("octpow")
				inoperations.push({
					name: "pow",
					uuid: id,
					inputs: [2, sub_id],
					outputs: [pow_id]
				})
				let mul_id = makeUID("hz")
				inoperations.push({
					name: "mul",
					uuid: id,
					inputs: [55, pow_id],
					outputs: [mul_id]
				})
				result = mul_id
			}

			op.inputs[i] = result

			// now combine inoperations to operations
			inoperations.reverse().forEach(op => {
				operations.push(op)
			})
		})
	}

	// this will have built them in reverse order (by pulling from the outputs)
	// we want to reverse this to generate code
	return preops.concat(operations.reverse(), postops)
}

function operations2string(ops) {
	return ops.map(op => {
		return `${op.outputs.join(", ")}${op.outputs.length ? " = " : ""}${op.name}(${op.inputs.join(", ")});`
	}).join("\n")
}

module.exports = {

	docHasFeedback,

	updateGraph(doc) {
		try {
			if (FAIL) return;
			//console.log("doc", JSON.stringify(doc, null, "  "))

			if (docHasFeedback(doc)) {
				console.error("doc has feedback")
				return
			}
			
			let operations = doc2operations(doc)

			//console.log("operations", JSON.stringify(operations, null, "  "))
		

			worker.postMessage({ cmd: "graph", operations })

		} catch (e) {
			console.error(e)
		}
	},

	updateParams(doc) {
		try {
			let params = {}
			Object.entries(doc).forEach(([uuid, obj]) => {
				obj.inputs.forEach(input => {
					if (input.value !== undefined) {
						let param_name = `${obj.name}_${obj.uuid}_${input.name}`
						params[param_name] = input.value
					}
				})
			})
			worker.postMessage({ cmd: "params", params })

		} catch (e) {
			console.error(e)
		}
	},

	shutdown() {
		if (FAIL) return;
		worker.postMessage({ cmd: "shutdown" })
	}

}