const fs = require('fs')
const got = require('./gotlib/got.js')
const equals = require('array-equal')

nodes = []
let adjacentCount = 0
let adjacents = {}
// let arcsLength
let localGraph
let nodeCount
let setup = function(localGraph){
    parents = Object.keys(localGraph.nodes)
    // let nodeCount = nodes.length
    // let arcsLength = localGraph.arcs.length
    for(i=0;i<parents.length;i++){
        let parent = Object.keys(localGraph.nodes)[i]
        let children = Object.keys(localGraph.nodes[parent])
        // need only the children that are outlets
        for(j=0;j<children.length;j++){
            if(localGraph.nodes[parent][children[j]]._props && localGraph.nodes[parent][children[j]]._props.kind === 'outlet'){
                let foo = parent + '.' + children[j]
                nodes.push(foo)
            }
            // console.log(localGraph.nodes[parent][children[j]]._props)
        }
        // console.log(parent, children, localGraph.nodes[parent]._props)
    }
    return nodes
}


    // // prepare a list of adjacent nodes for each node in the graph:
let getAdjacents = function (node, nodes, localGraph){
    let nodeName = nodes[node].split('.')[0]
    adjacents[nodeName] = []
    // if first iteration, do some setup
    arcsLength = localGraph.arcs.length
    nodeCount = nodes.length
    // does the current node connect to anything else? 
    for(i=0;i<arcsLength;i++){
        if(localGraph.arcs[i][0].split('.')[0] === nodes[node].split('.')[0]){
            adjacents[nodeName].push(localGraph.arcs[i])
        }    
        
   
    }
    // move onto next node
    if(adjacentCount < (nodeCount - 1)){
        adjacentCount++
        getAdjacents(adjacentCount, nodes, localGraph)
    } 
    // finished collecting adjacent nodes per each node, return the array    
    return adjacents
}

// getAdjacents(adjacentCount)


// // reset the nodes array with only the list of parent nodes that actually have connections:
// nodes.length = 0
// nodes = Object.keys(adjacents)
// nodeCount = nodes.length

// temp array of a given signal path
let signalPath = []
// collection of feedbackPaths (this is what we'll pass to the genScripting.js in order to determine where to place a history object!)
let feedbackPaths = []
// we'll use this as a lookup table to ensure we're not adding duplicate feedback paths i.e. node_2>node_3>node_4 === node_3>node_4>node_2 === node_4>node_2>node_3
let sortedFeedbackPaths = []
// keep track of each node visited in a given signal path
let visited = []

let newGraph
let graphReady = false

// async function clearVisited(nodeCount){
//     visited.length = 0
//     visited.length = nodeCount
//     for(j=0;j<nodeCount;j++){
//         visited[j] = false
//     } 
// }

let visit = function (node, nodes, adjacents, localGraph, nodeCount){
    // clearVisited(nodeCount).then(() =>{
        visited.length = 0
        visited.length = nodeCount
        for(j=0;j<nodeCount;j++){
            visited[j] = false
        } 
    
        visited[node] = true
        let nodeParent = nodes[node]
        
//         // console.log(nodeParent, visited)
        
        if(adjacents[nodeParent].length===0){
            // likely skip... this node has no adjacent nodes
        } else {

            // iterate the adjacency list of this node
            for(i=0;i<adjacents[nodeParent].length;i++){
                signalPath = []
                // start listing the signalPath, with the sourceNode first:
                signalPath.push(adjacents[nodeParent][i][0])                
                // console.log('node:', nodeParent, 'adjacent:', adjacents[nodeParent][i])
                let adjacentParent = adjacents[nodeParent][i][1].split('.')[0]
                let adjacentChild = adjacents[nodeParent][i][1]
                // if an adjacentParent does not appear in the list of nodes, 
                // it means its a terminal object, like a speaker 
                // (which has not outlets), and should be ignored
                if (nodes.includes(adjacentParent) === false) {
                    // ignore
                } else {
                    if(nodeParent === adjacentParent){
                        // detect a feedback path on only one node
                        signalPath.push(adjacentChild)
                        feedbackPaths.push(signalPath)
                        break
                    } else {
                        // the feedback path goes through more than one node!
                        
                        signalPath.push(adjacentChild)
                    }

                    let adjacentIndex = nodes.indexOf(adjacentParent)
                    let flag = visitUtil(adjacentParent, adjacentIndex, null, nodes, adjacents)
                    
                    if(flag === true){                   
                        if (feedbackPaths.length==0){
                            // console.log('firstFeedbackPath', signalPath)
                            feedbackPaths.push(signalPath)
                            checkDuplicatePaths(signalPath)
                        } else {
                            let uniquePath = checkDuplicatePaths(signalPath)
                            if(uniquePath === true){
                            
                                feedbackPaths.push(signalPath)
                            }
                            
                            flag = false
                        }
                    }
                }
            }
        }  
        if(visitCount < (nodeCount - 1)){
            // move on to next node in graph
            
            visitCount++
            visit(visitCount, nodes, adjacents, localGraph, nodeCount)
        } else {
            // all nodes & their adjacent nodes have been visited.
            // console.log(applyHistoryToGraph(feedbackPaths, localGraph))
            // return applyHistoryToGraph(feedbackPaths, localGraph)
            // newGraph = applyHistoryToGraph(feedbackPaths, localGraph)
            graphReady = true
        }
    // once the graph has been updated with location of feedback paths
    // return it
    if(graphReady===true){
        
        return feedbackPaths
    }
    
}
visitCount = 0
// visit(visitCount)

function visitUtil(name, index, arc, nodes, adjacents){
    if(visited[index] == true){

        visited[index] = false
        if(arc){
            signalPath.push(arc[0], arc[1])
        }
        return true
    }
    visited[index] = true
    let flag = false
    // console.log('current signalPath:', signalPath, 'checking adjacents[name]', adjacents[name])
    
    for(i=0;i<adjacents[name].length;i++){
        //  console.log('looking at new adjacent arc:', adjacents[name][i])
        //  console.log('adjacent node is:', adjacents[name][i][1])
        //  console.log('adjacent node parent is:', adjacents[name][i][1].split('.')[0])
        let adjacentArc = adjacents[name][i]
        let adjacentChild = adjacents[name][i][1]
        let adjacentParent = adjacents[name][i][1].split('.')[0]
        // ignore terminal modules (i.e. a speaker has no outlets) || ignore an adjacent node that itself has no adjacent nodes
        if (nodes.includes(adjacentParent) === false || adjacents[name].length===0 || adjacents[adjacentParent].length ===0) {
            // ignore
        } else {
            // check if signalpath already includes the adjacent parent as SOURCE node
            // get each of the SOURCE parentNodes in the signalPath
            // console.log('signalPath up to now is:',signalPath)
            sourceNodes = signalPath.filter((element, index) => {
                return index % 2 === 0;
            }) 
            // console.log("sourceNodes", sourceNodes)
            let sourceParents = []
            
            for( j=0;j < sourceNodes.length;j++){
                // console.log('sourceNodes[j].split(".")[0]', sourceNodes[j].split('.')[0])
                newParent = sourceNodes[j].split('.')[0]
                sourceParents.push(newParent)
            }
        
            // don't add a duplicate && make sure you're adding one that belongs
            if(sourceParents.includes(adjacentParent) === false){
                signalPath.push(adjacentArc[0], adjacentArc[1])
            }      
            

            let adjacentIndex = nodes.indexOf(adjacents[name][i][1].split('.')[0])
            // console.log("adjacents[name][i][1].split('.')[0]", adjacents[name][i][1].split('.')[0], 'adjacentIndex', adjacentIndex)
            flag = visitUtil(adjacentParent, adjacentIndex, adjacentArc, nodes, adjacents)
            if(flag == true){
                return true
            }
        // //     }
        }
    }
    return false
}

function checkDuplicatePaths(checkPath){
    let tempArr = []
    for(i=0;i<checkPath.length;i++){
        tempArr.push(checkPath[i])
    }

    tempArr.sort()

    for(i=0;i<sortedFeedbackPaths.length;i++){
        // if the exact feedback path already exists (just in a different order)
        if(equals(sortedFeedbackPaths[i], tempArr)){
            return false
        }
    }
    sortedFeedbackPaths.push(tempArr)
    return true
}

// function applyHistoryToGraph(cycles, localGraph){
//     // outlet._props.history = true
//     for(i=0;i<cycles.length;i++){
//         // history outlet:
//         targetOutletParent = cycles[i][0].split('.')[0]
//         targetOutletChild = cycles[i][0].split('.')[1]
        
//         localGraph.nodes[targetOutletParent][targetOutletChild]._props['history'] = true
//     }
    
//     return cycles
// }


module.exports = {
    setup: setup,
    getAdjacents: getAdjacents,
    visit: visit

}
