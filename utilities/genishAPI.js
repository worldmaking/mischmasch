const genish = require("../Components/Audio/genish.js")

// console.log(genish.gen)

let keys = Object.keys(genish)
let opsObj = {}
let undocumentedOps = []
for(let i =0;i<keys.length;i++){
  console.log(genish.lib[keys[i]].toString())
}
function prettyPrint(object){
	console.log(JSON.stringify(object, null, 4))
}