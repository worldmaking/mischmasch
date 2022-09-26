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

console.log("got audio", audio)

// Now setup genish.js
const genish = require("./genish.js")
genish.samplerate = audio.samplerate

// Now start the main loop of this audio worker thread:
let frameIdx = 0;
let time = 0; // in seconds
let lasttime = 0
function runAudioProcess() {
	// let dt = time - lasttime // seconds since last update()
	// lasttime = time
	// // this is the time in the ringbuffer that has most recently been played (and is now zeroed)
	// // so we are safe to fill the buffer up to this point:
	// let at = audio.t
	// let ouch = audio.outchannels
	// let inch = audio.inchannels
	// let secondsPerFrame = 1/audio.samplerate
	// //console.log(at, time)
	// // continue filling ringbuffer until we catch up to that point:
	// while (frameIdx != at) {
	// 	let inframe = audio.inbuffer.subarray(frameIdx*inch)
	// 	let outframe = audio.outbuffer.subarray(frameIdx*ouch)
	// 	// compute next output:
	// 	let L0 = oldkernel && mixerXfade > 0 ? oldkernel.call(oldkernel)*mixerXfade : 0
	// 	let R0 = L0
	// 	let L = kernel ? kernel.call(kernel)*(1-mixerXfade) : 0
	// 	let R = L 
	// 	mixerXfade = Math.max(0, mixerXfade - mixerXfadeStep)
	// 	// write to output:
	// 	outframe[0] += mixerGain*(L+L0);
	// 	outframe[1] += mixerGain*(R+R0);
	// 	// time passes:
	// 	time += secondsPerFrame; 
	// 	frameIdx = (frameIdx+1) % audio.frames;
	// }

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