const { exec, execSync, spawn, spawnSync, fork } = require('child_process');
const fs = require("fs");

let opNodes = [];
let edges = [];
let scene = JSON.parse(fs.readFileSync('./scene_files/scene_rich2.json'))
// console.log(scene)
Object.keys(scene.nodes).forEach(function(key) {
  //console.log('\n\nkey ', key)
})


Object.keys(scene.nodes).forEach(function(key) {
  var val = scene.nodes[key];
  let op = key
  //console.log(op)
  Object.keys(val).forEach(function(key) {
    if (key != "_propNodes"){
      node = key
      opNodes.push(op + '.' + node)

    }
    
  });

});

for (index = 0; index < scene.arcs.length; index++) { 
  let edge = scene.arcs[index].slice(0,1) + ',' + scene.arcs[index].slice(1,2);
  edges.push(edge )
  // let edge = scene.arcs[index].slice(0,1) + '\",\"' + scene.arcs[index].slice(1,2);
  // edges.push('(\"'+ edge + '\")')
} 

console.log(opNodes, edges)
exec('python cycle.py ' + opNodes + ' ' + edges, (stdout, stderr, err) =>{

  console.log(stdout,stderr,err)
})