const fb = require('./detectCycles.js')

const fs = require('fs')
const got = require('./gotlib/got.js')
let scene = JSON.parse(fs.readFileSync('./scene_feedback.json'))
let localGraph = {nodes: {}, arcs:[]};
let deltas = got.deltasFromGraph(scene, [])

// // console.log(deltas)

got.applyDeltasToGraph(localGraph, deltas)
// console.log(localGraph)
// list all nodes (parent and child) in the graph
let nodes = fb.setup(localGraph)

// get list of adjacent nodes per each node in the graph
let adjacents = fb.getAdjacents(0, nodes, localGraph)

// reset the nodes array with only the list of parent nodes that actually have connections:
nodes.length = 0
nodes = Object.keys(adjacents)
nodeCount = nodes.length

let cycles = fb.visit(0, nodes, adjacents, localGraph, nodeCount)

console.log(nodes, adjacents, cycles)