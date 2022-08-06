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
                threeProps: threeProps
            }
            return [nodeName, newNode, nodeID, automergeMsg]

        break
    }


}

export { state }


