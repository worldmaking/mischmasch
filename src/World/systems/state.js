import * as Automerge from 'automerge'
import {opsList} from '../components/Palette/genishOperators.js'

function state(operation, payload){
    switch(operation){

        case 'addNode':
            let nodeName = payload[0]
            
            let threeProps = payload[1]
            let genishProps = opsList.find(item => item.op === nodeName)
            let nodeID = `${nodeName}_${threeProps.uuid}`
            let automergeMsg = `add node ${nodeID} to scene`
            let newNode = {
                genish: genishProps,
                // reduce number of properties from three group, automerge has a weird error with too-large objects
                threeProps: {
                    uuid: threeProps.uuid,
                    id: threeProps.id,
                    op: nodeName,
                    position: threeProps.position,
                    rotation: threeProps.rotation,
                    scale: threeProps.scale,
                }
            }
            console.log(nodeName, newNode, nodeID, automergeMsg)
            return [nodeName, newNode, nodeID, automergeMsg]

        break
    }


}

export { state }


