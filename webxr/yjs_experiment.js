const Y = require('yjs')
newDoc = new Y.Doc()
    // 
// Method 1: Define a top-level type
doc = newDoc.getMap('patches') 

doc.set('patch', {"one": {"michael": "me"}})

console.log(doc.toJSON())

doc.set('patch', 
  {"people": 
    {"michael": 
      { "lastname": "smith",
        "height": "tall"
      },
    "sal": 
      { "lastname": "orange",
        "height": "small"
      }
    }
  })

console.log(doc.toJSON())
