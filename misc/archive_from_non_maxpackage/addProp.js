const fs = require('fs')

let menu = JSON.parse(fs.readFileSync('menu.json'))
let modules = Object.keys(menu)

for(i=0;i<modules.length;i++){
    let inside = modules[i]
    let nodes = Object.keys(menu[inside])
    let counter = 0
    for(j=0; j<nodes.length; j++){
        if(menu[inside][nodes[j]]._props && menu[inside][nodes[j]]._props.kind === 'inlet'){
            menu[inside][nodes[j]]._props.index = counter++
        }
    }
    counter = 0
    for(j=0; j<nodes.length; j++){
        if(menu[inside][nodes[j]]._props && menu[inside][nodes[j]]._props.kind === 'outlet'){
            menu[inside][nodes[j]]._props.index = counter++
            menu[inside][nodes[j]]._props['history'] = false
        }
    }
}

fs.writeFileSync('menu.json', JSON.stringify(menu, null, '\t'))