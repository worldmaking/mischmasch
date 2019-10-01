const fs = require("fs");
const process = require('process');



let opNodes = [];
let lookup = [];
let object1 = {}
let object2 = {}
let object3 = {}

counter = 0
edgeCount = 0
var cycles = [];
let historyObjects = []

var graph = []
let scene;
if(process.argv[2]){
  scene = JSON.parse(fs.readFileSync(process.argv[2]))
} else {
  // use a generic scene
  scene = JSON.parse(fs.readFileSync('./scene_files/scene_rich2.json'))
}


scene2graph(scene)

function scene2graph(scene) {
  Object.keys(scene.nodes).forEach(function (key) {
    var val = scene.nodes[key];
    let op = key;
    object3[op] = counter;
    Object.keys(val).forEach(function (key) {
      if (key != "_props") {
        node = key;
        opNode = op + '.' + node;
        // opNodes.push(opNode)
        opNodes.push(counter);
        counter++;
        object1[counter] = opNode;
        object2[opNode] = counter;
        
      }
    });
  });
  for (index = 0; index < scene.arcs.length; index++) {
    edge1 = scene.arcs[index].slice(0, 1)[0];
    edge2 = scene.arcs[index].slice(1, 2)[0];

    arc1 = object2[edge1];
    arc2 = object2[edge2];
    ref1 = object1[arc1]
    ref2 = object1[arc2]
    ref1 = ref1.split(".")[0];
    ref2 = ref2.split(".")[0];
    
    graph.push([object3[ref1], object3[ref2]]);
    lookup.push([edge1, edge2])
   
  }
  // now that we have our scenegraph and lookup table, retrieve any cycles in the scenegraph
  findCycles()

}

function findCycles() {
  for (const edge of graph) {
    for (const node of edge) {
      findNewCycles([node])
    }
  }
  for (cy of cycles) {
    console.log(cy.join(','))
    console.log(historyObjects)
    
  }

  let thinned = thinArray(historyObjects)

  if (thinned.length === historyObjects.length){
    console.log('cycles:', historyObjects )
  } else {
    console.log('\ncycles (including duplicates):', historyObjects)
    console.log('\ncycles (compressed):', thinned)
  }
}

function findNewCycles(path) {
  const start_node = path[0]
  let next_node = null
  let sub = []

  // visit each edge and each node of each edge
  for (const edge of graph) {
    const [node1, node2] = edge
    if (edge.includes(start_node)) {
      next_node = node1 === start_node ? node2 : node1
    }
    if (notVisited(next_node, path)) {
      // eighbor node not on path yet
      sub = [next_node].concat(path)
      // explore extended path
      findNewCycles(sub)
    } else if (path.length > 2 && next_node === path[path.length - 1]) {
      // cycle found
      const p = rotateToSmallest(path)
      const inv = invert(p)
      if (isNew(p) && isNew(inv)) {
        //historyObjects = []
        cycles.push(p)

        plength = p.length - 1
        for (i = 0; i < plength; i++) {
          
          historyObject = []
          outlet = p[i + 1]
          inlet = p[i]

          for (g = 0; g < graph.length; g++) {
            let g0 = graph[g][0]
            let g1 = graph[g][1]
            //console.log(graph[g][0])
            if(g0 === outlet && g1 === inlet){
              historyObjects.push(lookup[g])
            }
          }

          if (i === plength - 1){            
            for (g = 0; g < graph.length; g++) {
            
              let g0 = graph[g][0]
              let g1 = graph[g][1]
              if(g0 === p[0] && g1 === p[i+ 1]){

                historyObjects.push(lookup[g])
              }
            }
          }
        }
      }
    }
  }

  
}

function invert(path) {
  return rotateToSmallest([...path].reverse())
}

// rotate cycle path such that it begins with the smallest node
function rotateToSmallest(path) {
  const n = path.indexOf(Math.min(...path))
  return path.slice(n).concat(path.slice(0, n))
}

function isNew(path) {
  const p = JSON.stringify(path)
  for (const cycle of cycles) {
    if (p === JSON.stringify(cycle)) {
      return false
    }
  }
  return true
}

function notVisited(node, path) {
  const n = JSON.stringify(node)
  for (const p of path) {
    if (n === JSON.stringify(p)) {
      return false
    }
  }
  return true
}



function thinArray(thick) {
  var prims = {"boolean":{}, "number":{}, "string":{}}, objs = [];

  return thick.filter(function(item) {
      var type = typeof item;
      if(type in prims)
          return prims[type].hasOwnProperty(item) ? false : (prims[type][item] = true);
      else
          return objs.indexOf(item) >= 0 ? false : objs.push(item);
  });
}