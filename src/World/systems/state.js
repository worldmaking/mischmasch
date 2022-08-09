// import * as Automerge from 'automerge'
// import {opsList} from '../components/Palette/genishOperators.js'

function stateChange(operation, payload){
    switch(operation){

        case 'addNode':
            let nodeName = payload[0]
            let threeProps = payload[1]
            let nodeID = `${nodeName}_${threeProps.uuid}`
            let automergeMsg = `add node ${nodeID} to scene`
       
            let newNode = {
                // genish: genishProps,
                // reduce number of properties from three group, automerge has a weird error with too-large objects
                threeProps: {
                    uuid: threeProps.uuid,
                    id: threeProps.id,
                    op: nodeName,
                    position: threeProps.position,
                    rotation: {
                        x: threeProps.rotation._x,
                        y: threeProps.rotation._y,
                        z: threeProps.rotation._z
                    },
                    scale: threeProps.scale,
                }
            }
            return [nodeName, newNode, nodeID, automergeMsg]

        break
        case 'addConnection':
            

        break

    }

}


export { stateChange }



