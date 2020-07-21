const fs = require('fs')
const got = require('../gotlib/got.js')
const equals = require('array-equal')
// let scene = JSON.parse(fs.readFileSync('./scenes/3_module_feedback_path.json'))
// let localGraph = {nodes: {}, arcs:[]};
// let deltas = got.deltasFromGraph(scene, [])

// // console.log(deltas)

// got.applyDeltasToGraph(localGraph, deltas)

let localGraph ={
    nodes: {
        "node_0":{},
        "node_1":{},
        "node_2":{},
        "node_3":{},
        "node_4":{},
    },
    arcs: [
        ["node_0", "node_1"],
        ["node_2", "node_1"],
        ["node_2", "node_3"],
        ["node_3", "node_4"],
        ["node_4", "node_2"],
        ["node_4", "node_0"],
        ["node_3", "node_2"],
        ["node_3", "node_3"]
        

        
    ]
}
 
let count = 0
let nodes = Object.keys(localGraph.nodes)
let nodeCount = nodes.length
let arcsLength = localGraph.arcs.length
let adjacents = {}
// prepare a list of adjacent nodes for each node in the graph:
function getAdjacents(node){
    let nodeName = nodes[node]
    adjacents[nodeName] = []

    // does the current node connect to anything else? 
    for(i=0;i<arcsLength;i++){
        if(localGraph.arcs[i][0] === nodeName){
            adjacents[nodeName].push(localGraph.arcs[i][1])
        }       
    }
    // move onto next node
    if(count < (nodeCount - 1)){
        count++
        getAdjacents(count)
    } else {
        // finished collecting adjacent nodes per each node, return the array
        return adjacents
    }
}

getAdjacents(count)

// temp array of a given signal path
let signalPath = []
// collection of feedbackPaths (this is what we'll pass to the genScripting.js in order to determine where to place a history object!)
let feedbackPaths = []
// keep track of each node visited in a given signal path
let visited = []

async function clearVisited(){
    visited.length = 0
    visited.length = nodeCount
    for(j=0;j<nodeCount;j++){
        visited[j] = false
    } 
}

function visit(node){
    clearVisited().then(() =>{
       
        visited[node] = true
        let nodeName = nodes[node]
        
        // console.log(nodeName, visited)
        if(adjacents[nodeName].length===0){
            // likely skip... this node has no adjacent nodes
        } else {

            // iterate the adjacency list of this node
            for(i=0;i<adjacents[nodeName].length;i++){
                signalPath = []
                // start listing the signalPath, with the sourceNode first:
                signalPath.push(nodeName)                

                // console.log('node:', nodeName, 'adjacent:', adjacents[nodeName][i])
                let adjacentName = adjacents[nodeName][i]
               
                if(nodeName === adjacentName){
                    // detect a feedback path on only one node
                    signalPath.push(adjacentName)
                    feedbackPaths.push(signalPath)
                    break
                } else {
                    // the feedback path goes through more than one node!
                    signalPath.push(adjacentName)
                }
                
                let adjacentIndex = nodes.indexOf(adjacents[nodeName][i])
                let flag = visitUtil(adjacentName, adjacentIndex)
                
                if(flag === true){
                    // make all feedback paths present their nodes in the same order (relates to the 'else {}' section below where we need to check against duplicates)
                    signalPath.sort()
                    if (feedbackPaths.length==0){
                        feedbackPaths.push(signalPath)
                    } else {

                        // if we already know about a feedback signalPath, don't add a duplicate:
                        // (duplicates do exist because the path node_2>node_3>node_4 === node_3>node_4>node_2 === node_4>node_2>node_3)
                        for (s=0; s<feedbackPaths.length; s++){
                            if (equals(feedbackPaths[s], signalPath)){
                                // don't add the duplicate
                                break
                            } else {
                                // signalPath is a unique feedback path, add it to array feedbackPaths
                                feedbackPaths.push(signalPath)
                            }
                        }
                        flag = false
                    }
                }
            }
        }  
        if(visitCount < (nodeCount - 1)){
            // move on to next node in graph
            visitCount++
            visit(visitCount)
        } else {
            // all nodes & their adjacent nodes have been visited.
            console.log('present this to genScripting.js\n', feedbackPaths)
        }
    }) 
    
}
visitCount = 0
visit(visitCount)

function visitUtil(name, index){
     if(visited[index] == true){
         visited[index] = false
         return true
        //  throw(name, 'has been visited')
     }
     visited[index] = true
     let flag = false
     for(i=0;i<adjacents[name].length;i++){
        let adjacentName = adjacents[name][i]
        if(adjacents[adjacentName].length===0){
            // skip this one because it has no adjacents
        } else{
            // don't add a duplicate node!
            if(signalPath.includes(adjacentName) === false){
                signalPath.push(adjacentName)
            }        
            let adjacentIndex = nodes.indexOf(adjacents[name][i])
            flag = visitUtil(adjacentName, adjacentIndex)
            if(flag == true){
                return true
            }
            console.log(name, 'adjacent:', adjacents[name][i])
        }
     }
     return false
}
