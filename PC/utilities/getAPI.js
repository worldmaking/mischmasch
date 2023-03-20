const genish = require("../Components/Audio/genish.js")
const fs = require('fs')
const path = require('path')
let mOps = JSON.parse(fs.readFileSync('../Op/mischmaschOps.json'))
let oldOps = JSON.parse(fs.readFileSync('../Op/oldMischmaschOps.json'))

let keys = Object.keys(genish)
let opsObj = {}
let undocumentedOps = []
for(let i =0;i<keys.length;i++){
  switch(keys[i]){
    case 'export':
    case 'gen':
    case 'utilities':
    case 'windows':
      continue
    
    default: 
    console.log(keys[i])
      let sign = false
      // if op has a mathematical sign, provide it in the opsList so that VR can display it instead of the genish name (for better UX)
      switch(keys[i]){
        case 'add':
          sign = '+'
        break
        case 'sub':
          sign = 'subtract'
        break
        case 'mul':
          sign = 'multiply'
        break
        case 'div':
          sign = 'divide'
        break
        case 'gt':
          sign = '>'
        break
        case 'gte':
          sign = '>='
        break
        case 'lt':
          sign = '<'
        break
        case 'lte':
          sign = '<='
        break
        case 'bool':
          sign = 'boolean'
        break
        case 'gtp':
          sign = '> pass'
        break
        case 'ltp':
          sign = '< pass'
        break
        case 'ad':
          sign = 'attack/decay'
        break
        case 'eq':
          sign = 'equals'
        break
        case 'neq':
          sign = '!='
        break
        case 'ad':
          sign = 'attack/decay'
        break
        case 'eq':
          sign = '=='
        break
        case 'neq':
          sign = '!='
        break
        case 'seq':
          //TODO what does this one do?
        break


      }
      if(mOps[keys[i]]){
        opsObj[keys[i]] = (mOps[keys[i]])
      }else if(oldOps[keys[i]]){
        let oldOp = oldOps[keys[i]]

        let inputs = Object.keys(oldOp.inputs)
        let outputs = Object.keys(oldOp.outputs)
        let ins = {}
        for(let j=0;j<inputs.length;j++){
          ins[inputs[j]] = {
            info: oldOp.inputs[inputs[j]],
            value: 0,
            range: [0, 1],
            kind: 'inlet',
          }
          
        }

        let outs = {}
        for(let j=0;j<outputs.length;j++){
          outs[outputs[j]] = oldOp.outputs[outputs[j]]
        }

        opsObj[keys[i]] = {
          classification: oldOp.classification,
          inputs: ins,
          outputs: outs
        }
      } else {
        undocumentedOps.push(keys[i])
        opsObj[keys[i]] = {
          classification: 'generic',
          inputs: {},
          outputs: {}
        }
      }
      if(sign){
        opsObj[keys[i]].sign = sign
      }
  }
}

function prettyPrint(object){
	console.log(JSON.stringify(object, null, 4))
}
fs.writeFileSync('../Op/newMischmaschOps.json', JSON.stringify(opsObj, null, 4))