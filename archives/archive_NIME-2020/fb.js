const fb = require('../../historify.js')

const fs = require('fs')
const got = require('../../gotlib/got.js');
const historify = require('../../historify.js');
let scene = JSON.parse(fs.readFileSync('./scene_feedback.json'))
let localGraph = {nodes: {}, arcs:[]};
let deltas = got.deltasFromGraph(scene, [])

// // console.log(deltas)


got.applyDeltasToGraph(localGraph, deltas)


// this is where the real context comes in:

let delta = [{ 
    op: 'connect',
    paths:     [
        "pulsars_1.output",
        "pulsars_1.formant_cv"
      ]
}]

// first apply this delta to localGraph:
got.applyDeltasToGraph(localGraph, delta)
// console.log(localGraph)
// list all nodes (parent and child) in the graph
let nodes = fb.setup(localGraph)

// get list of adjacent nodes per each node in the graph
let adjacents = fb.getAdjacents(0, nodes, localGraph)

// reset the nodes array with only the list of parent nodes that actually have connections:
nodes.length = 0
nodes = Object.keys(adjacents)
nodeCount = nodes.length

let historyPropchange = fb.visit(0, nodes, adjacents, localGraph, nodeCount)

let propchanges = []
for(i=0;i<historyPropchange.length;i++){
    console.log(historyPropchange[i], historyPropchange[i].includes(delta[0].paths[0]), historyPropchange[i].includes(delta[0].paths[1]))
    if(historyPropchange[i].includes(delta[0].paths[0]) === true && historyPropchange[i].includes(delta[0].paths[1]) === true){
        let srcPath = delta[0].paths[0]
        let parent = srcPath.split('.')[0]
        let child = srcPath.split('.')[1]
        console.log(srcPath)
        historyPropchange = [ { op: 'propchange',
        path: srcPath,
        name: 'history',
        from: localGraph.nodes[parent][child]._props.history,
        to: "yes" } ]
        propchanges.push(historyPropchange)
    }

}

console.log(propchanges)