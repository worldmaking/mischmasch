// convert valid mischmasch scenes from nodeGLES3 version to yjs-valid maps

const Y = require('yjs')
const fs = require('fs')


let patchFile = JSON.parse(fs.readFileSync('funzo.json'))

// create a yjs map
this.y = new Y.Doc()
// 

let document = new Y.Map()

let opIDs = Object.keys(patchFile)
let opCount = 0
function createYMap(scene){
  // first create the op
  let op = scene[opIDs[opCount]]
  let opID = opIDs[opCount]
  console.log(opID)
  console.log(opIDs[opCount])
  // todo Figure out WTF is going on with this stupid code. wtf isn't it able to read this property when console.log confirms it is set??
  document.set(opID, new Y.Map())
  document.get(opID).set('category', 'test')
}
createYMap(patchFile)
// for(i = 0; i<opIDs.length; i++){

// }
console.log(document)


