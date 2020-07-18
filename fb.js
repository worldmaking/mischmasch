const fb = require('./feedbackPaths.js')

const fs = require('fs')
const got = require('./gotlib/got.js')
let scene = JSON.parse(fs.readFileSync('./scene_feedback.json'))
let localGraph = {nodes: {}, arcs:[]};
let deltas = got.deltasFromGraph(scene, [])

// // console.log(deltas)

got.applyDeltasToGraph(localGraph, deltas)
// console.log(localGraph)

let fbs = fb.getFeedbackPaths(localGraph)

console.log(fbs)