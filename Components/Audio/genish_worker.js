const assert = require('assert');
const { Worker, MessageChannel, MessagePort, isMainThread, parentPort, workerData, SHARE_ENV } = require('worker_threads');

if (isMainThread) {
	console.error("this script is intended to run as a worker thread, do not invoke it directly")
	process.exit()
}

// // `workerData` can be passed here in the `new Worker` constructor
// console.log(workerData);

// Set up audio driver
const audio = require('../../../node-gles3/audio.js');

// const gen = require("./genish.js")
audio.start()

//console.log("got audio", audio)

// Now setup genish.js
const genish = require("./genish.js")
genish.samplerate = audio.samplerate

// this will hold our generated audio code
// left undefined for now:
let memsize = 1024*1024*1024
let kernel //= gen.gen.createCallback(0, memsize)
let oldkernel //= gen.gen.createCallback(0, memsize)
let mixerXfade = 0
// 5ms crossfade:
let mixerXfadeStep = 1/(audio.samplerate*0.005)
let mixerGain = 0.1

// build a lookup table for all the named memory slots in the graph:
// (this is needed to stash state for memory retention between edits)
function getMemoryMap(graph) {
	let map = {},
	memo = {};
	function visit(ugen) {
		if (Array.isArray(ugen)) {
			ugen.forEach(visit);
		} else if (typeof ugen == "object") {
			if (!memo[ugen.name]) {
				memo[ugen.name] = true;
				for (let k in ugen.memory) {
					map[`${ugen.name}_${k}`] = ugen.memory[k].idx;
				}
				if (ugen.inputs) ugen.inputs.forEach(visit);
			}
		}
		return map;
	}
	return visit(graph);
}

// cache all the current ugen memory slot values
// returns a JS object:
function getstash(kernel) {
	let stash = {};
	// stash the graph's current state:
	Object.entries(kernel.memorymap).map((e) => {
		let [key, idx] = e;
		stash[key] = kernel.memory[idx];
	});
	return stash;
}

// apply any matching names from `stash`
// to the corresponding memory slots of `kernel`
function applystash(kernel, stash) {
	Object.entries(kernel.memorymap).map((e) => {
		let [key, idx] = e;
		if (stash.hasOwnProperty(key)) kernel.memory[idx] = stash[key];
	});
}

function makeUID(name) { let id=0; genish.gen.getUID = () => name+(id++) }

// handle messages from main thread:
parentPort.on("message", (msg) => {
	try {
		if (typeof msg == "object") {
			switch(msg.cmd) {
				case "graph": {

					//console.log("operations = ", JSON.stringify(msg.operations, null, "  "))

					let values = {}
					let graph = null

					msg.operations.forEach(op => {
						let inputs = op.inputs.map(name => typeof name == "number" ? name : values[name] != undefined ? values[name] : name)
						//console.log("op", op, inputs)
						if (op.name == "speaker") {

							graph = inputs[0]

						} else if (genish[op.name]) {
							makeUID(op.uuid)

							let outputs = genish[op.name].apply(genish, inputs)
							// store outputs:
							if (Array.isArray(outputs)) {
								op.outputs.forEach((o, i) => {
									values[o] = outputs[i] || 0
								})
							} else {
								op.outputs.forEach((o, i) => {
									values[o] = i==0 ? outputs : 0
								})
							}


							console.log("values", values)
						}
					})

					let stash = kernel ? getstash(kernel) : {}
					oldkernel = kernel
					mixerXfade = 1
					// 2nd argument here is a memory allocation
					// TODO we need to figure out how to assign this more sensibly
					kernel = genish.gen.createCallback(graph, memsize)
					kernel.graph = graph
					// after compiling, build up the index map for stashing:
					kernel.memorymap = getMemoryMap(graph);
					applystash(kernel, stash);

					console.log(JSON.stringify(stash, null, "  "))

					console.log("map", kernel.memorymap);
					// this is our list of parameters:
					//console.log("params", graph.params);
					// this is how to update a param:
					//graph.params["knob_2_voltage"].value = 200;

					// if we had any external audio inputs:
					//console.log("number of inputs", kernel.inputs.size);
					//console.log("input objects", graph.kernel.inputs);
					// this is our outputs:
					//console.log("number of outputs", kernel.out.length);
					//console.log("output values", kernel.out);
					// for external buffers:
					//console.log("data objects", graph.kernel.data);
					// I'm not sure what this is for:
					//console.log("members", graph.kernel.members);

					break;
				}
				case "end": {
					audio.end()
					process.exit()
					break;
				}
				default:
					console.log("got message object from parent", msg);
			}
		}
	} catch(e) {
		console.error(e)
		kernel = null
	}
})

// send a message back to parent:
// parentPort.postMessage("yo from thread")
// // parentPort.once('message', (msg) => {
// // 	assert(msg.hereIsYourPort instanceof MessagePort);
// // 	// send a message back:
// // 	msg.hereIsYourPort.postMessage('the worker is sending this');
// // 	//msg.hereIsYourPort.close();
// // });


// Now start the main loop of this audio worker thread:
let frameIdx = 0;
let time = 0; // in seconds
let lasttime = 0
function runAudioProcess() {
	let dt = time - lasttime // seconds since last update()
	lasttime = time
	// this is the time in the ringbuffer that has most recently been played (and is now zeroed)
	// so we are safe to fill the buffer up to this point:
	let at = audio.t
	let ouch = audio.outchannels
	let inch = audio.inchannels
	let secondsPerFrame = 1/audio.samplerate
	//console.log(at, time)
	// continue filling ringbuffer until we catch up to that point:
	while (frameIdx != at) {
		let inframe = audio.inbuffer.subarray(frameIdx*inch)
		let outframe = audio.outbuffer.subarray(frameIdx*ouch)
		// compute next output:
		let L0 = oldkernel && mixerXfade > 0 ? oldkernel.call(oldkernel)*mixerXfade : 0
		let R0 = L0
		let L = kernel ? kernel.call(kernel)*(1-mixerXfade) : 0
		let R = L 
		mixerXfade = Math.max(0, mixerXfade - mixerXfadeStep)
		// write to output:
		outframe[0] += mixerGain*(L+L0);
		outframe[1] += mixerGain*(R+R0);
		// time passes:
		time += secondsPerFrame; 
		frameIdx = (frameIdx+1) % audio.frames;
	}

	// // play for 10 seconds:
	// if (time > 10) {
	// 	audio.end()
	// 	process.exit()
	// } else {
		//console.log(dt)
		setTimeout(runAudioProcess, audio.pollms/2);
	//}
}
runAudioProcess();