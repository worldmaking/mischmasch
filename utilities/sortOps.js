// sort ops according to classification
const fs = require('fs')
const path = require('path')

let opsList = JSON.parse(fs.readFileSync(path.join(__dirname, '../Components/Op/mischmaschOps.json')))

let opNames = Object.keys(opsList)

let classifications = {}

for(let i=0; i<opNames.length; i++){
  classifications[opsList[opNames[i]].classification] = {}
}


classifications = Object.keys(classifications)

console.log(classifications)

let sortedOps = {}
for(let i=0; i<classifications.length; i++){
  for(let j=0; j<opNames.length; j++){
    if(classifications[i]== opsList[opNames[j]].classification){
      sortedOps[opNames[j]] = opsList[opNames[j]]
    }
  }
}

console.log(sortedOps)