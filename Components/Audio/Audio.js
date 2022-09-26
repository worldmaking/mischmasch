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

module.exports = {

	updateGraph(doc) {
		try {

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