const assert = require('assert'), 
fs = require("fs"), 
path = require("path")
const { fileURLToPath } = require('url');
const { Worker, MessageChannel, MessagePort, isMainThread, parentPort, workerData, SHARE_ENV } = require('worker_threads');

const operators = JSON.parse(fs.readFileSync(path.join(__dirname, '../Op/mischmaschOps.json')))
const Op = require('../Op/Op.js')




module.exports = {

	updateGraph(doc) {

	},

	updateParams(doc) {

	}

}