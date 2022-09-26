const assert = require('assert');
const { Worker, MessageChannel, MessagePort, isMainThread, parentPort, workerData, SHARE_ENV } = require('worker_threads');

if (isMainThread) {
	console.error("this script is intended to run as a worker thread, do not invoke it directly")
	process.exit()
}

// // `workerData` can be passed here in the `new Worker` constructor
// console.log(workerData);

// Set up audio driver
const audio = require('./audio.js');

const gen = require("./genish.js")
audio.start()