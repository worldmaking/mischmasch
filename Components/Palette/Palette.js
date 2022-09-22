const fs = require('fs')
const path = require('path')
const operators = JSON.parse(fs.readFileSync(path.join(__dirname, '../Op/mischmaschOps.json')))
const Op = require('../Op/Op.js')

const { vec3, quat} = require("gl-matrix")

module.exports = class Palette{
  constructor(){
    this.opsList = Object.keys(operators)
    this.operators = operators
    this.graph = {}

    // loop through ops and get graph
    for(let i=0; i<this.opsList.length; i++){
      let opName =  this.opsList[i]
      let op = this.operators[opName]

      this.graph[opName] = {
        _props: {
          kind: opName,
          category: op.classification,
          pos: [0,0,0],
          orient: [0,0,0,0]
        }
      }
      // does the op have inputs?
      if(op.inputs){
        let inputs = Object.keys(op.inputs)

        // loop over inputs
        for(let j = 0; j<inputs.length; j++){
          let input = inputs[j];
  
          if(!this.graph[opName][input]){
            this.graph[opName][input] = {}
          }
          this.graph[opName][input]._props = {
            kind: 'inlet',
            index: j
          }
        }
      }

      // does the op have outputs?
      if(op.outputs){
        // loop over outputs
        let outputs = Object.keys(op.outputs)
        for(let j = 0; j < outputs.length; j++){
          let output = outputs[j];
          if(!this.graph[opName][output]){
            this.graph[opName][output] = {}
          }
          this.graph[opName][output]._props = {
            kind: "outlet",
            index: j,
            history: false
          }

          // // get connections for each output
          // let connections = Object.keys(output.connections)
          // if(connections.length > 0){
          //   // build the arc
          //   for(let k = 0; k < connections.length; k++ ){
          //     // getting the src is easy
          //     let src = `${opName}.${output.name}`
          //     // destination op id
          //     let destID = connections[k]
          //     let destOp = this.document[destID].name
              
          //     // loop through connections in case there are one-to-many 
          //     let inputJacks = Object.keys(connections[k])
          //     for(let l = 0; l < inputJacks.length; l++){
          //       let destJack = Object.keys(output.connections[destID])[l]
          //       let dest = `${destOp}_${destID}.${destJack}`

          //       graph.arcs.push([src, dest])
          //     }
          //   }
          // }
        }
      }
      
    }
    // loop over ops and create position and quaternion for the palette
    // setup palette rows and columns
    let ncols = 16
    let nrows = Math.min(6, Math.ceil(this.opsList.length / ncols));
    let i = 0;
    for (let row = 0; row < nrows; row++) {
      for(let col = 0; col < ncols && i < this.opsList.length; col++, i++){
        let theta = col * (-2 * Math.PI) / ncols;
        let r = 1;
        let x = r * Math.sin(theta);
        let z = r * Math.cos(theta);
        let y = 2-((i / this.opsList.length)*2)//1 - 0.4 * (row - (nrows/2));
        
        quat.fromEuler(this.graph[this.opsList[i]]._props.orient, 0, 180 + theta*180/Math.PI, 0)
        vec3.set(this.graph[this.opsList[i]]._props.pos, x, y, z);
      }
    }

    
    
  } 
  getInfo(opName){
    console.log(this.operators[opName])
  }
}