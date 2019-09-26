let modules = require('./client/modules.js')
let assert = require("assert");
let fs = require("fs")
let got = require("./got/got.js");
//console.log(modules.operator_constructors)

let operators = JSON.parse(fs.readFileSync("operators.json", "utf-8"))

for (let op of operators) {

  let name = op.op
  
  let ctors = op.constructors
  let inputs = op.inputs
  let outputs = op.outputs
  console.log(name, op.category)

}