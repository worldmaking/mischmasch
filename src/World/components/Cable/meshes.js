import { Mesh } from 'three';

import { createGeometries } from './CableGeometry.js';
import { createMaterials } from './materials.js';
import {Text} from 'troika-three-text'
// todo: see https://www.npmjs.com/package/troika-three-text#preloading for optimizing text loading

function createMeshes(opProps) {
  const geometries = createGeometries();
  const materials = createMaterials();
  let panelGeometry;
  let inputJacks = []
  let inputLabels = []
  // does it have inputs?
  if(opProps.inputs && Object.keys(opProps.inputs).length > 0){
    let inputs = opProps.inputs
    let inputNames = Object.keys(inputs)
    let numInputs = inputNames.length
    // loop through inputs and create the inlets aand labels for this op
    // //
    let inletIndex = 0
    inputNames.forEach(inputName => {
      // jacks
      let jackIn = new Mesh(geometries.jack, materials.jackIn);
      let posX = inputNames.indexOf(inputName)
      jackIn.position.set(posX, 2, 0.2);
      jackIn.rotation.set(1.55, 1, 0)
      jackIn.name = `inlet_${inputName}_${jackIn.uuid}`
      jackIn.userData.name = inputName;
      jackIn.userData.uuid = jackIn.uuid
      jackIn.userData.kind = 'inlet'
      jackIn.userData.index = inletIndex
      inletIndex++
      inputJacks.push(jackIn)

      // labels
      let inputLabel = new Text();
      if(/\s/.test(inputName)){
        inputLabel.text = inputName.replace(' ', '\n')
      } else {
        inputLabel.text = inputName
      }
      inputLabel.fontSize = 0.2
      inputLabel.color = 'white'
      inputLabel.anchorX = 'center'
      inputLabel.position.set(posX, 1.8, 0.2);
      inputLabel.rotation.set(0, 0, 0)
      inputLabel.name = 'inputLabel'
      inputLabel.userData.name = inputLabel;
      inputLabel.userData.uuid = inputLabel.uuid
      inputLabel.userData.kind = 'inputLabel'

      inputLabels.push(inputLabel)
    })
    panelGeometry = createGeometries(numInputs);
  } else {
    // op has no inputs, set panel width to 1
    panelGeometry = createGeometries(1);
  }
  

  // panel width depends on number of UI elements. for now it's only inlets
  
  const panel = new Mesh(panelGeometry.panel, materials.panel);
  panel.position.set(0, 1.6, 0);
  panel.rotation.set(0, 0, 0)
  panel.name = `panel_${opProps.op}_${panel.uuid}`
  panel.userData.name = opProps.op;
  panel.userData.uuid = panel.uuid
  panel.userData.kind = 'panel'


  const jackOut = new Mesh(geometries.jack, materials.jackOut);
  jackOut.position.set(0, 1.2, 0.2);
  jackOut.rotation.set(1.55, 1, 0)
  jackOut.name = `outlet_${opProps.op}_${jackOut.uuid}`
  jackOut.userData.name = opProps.op;
  jackOut.userData.uuid = jackOut.uuid
  jackOut.userData.kind = 'outlet'
  
  let outputLabel = new Text();
  if(opProps.outputs[0]){

    let label = opProps.outputs[0].label
    // some labels have long text using () for explanation, so remove those
    if(opProps.outputs[0].label.includes('(')){
      label = label.slice(0, label.indexOf('('))
    }
    if(/\s/.test(label)){
      // if label has more than one word, split label into two lines at first space
      outputLabel.text = label.replace(' ', '\n')
    } else {
      outputLabel.text = label
    }
  } else {
    // todo: if this is the case, then there shouldn't be an output or a label on the op, right?
    outputLabel.text = opProps.op + '_out'

  }
  outputLabel.fontSize = 0.2
  outputLabel.color = 'white'
  outputLabel.anchorX = 'left'
  outputLabel.position.set(-0.3, 1, 0.2);
  outputLabel.rotation.set(0, 0, 0)
  outputLabel.name = 'outLabel'
  outputLabel.userData.name = opProps.op;
  outputLabel.userData.uuid = outputLabel.uuid
  outputLabel.userData.kind = 'outputlabel'

  const opLabel = new Text();

  opLabel.text = opProps.op
  opLabel.fontSize = 0.2
  opLabel.color = 'white'
  opLabel.anchorX = 'center'
  opLabel.position.set(0, 2.5, 0.2);
  opLabel.rotation.set(0, 0, 0)
  opLabel.name = 'opLabel'
  opLabel.userData.name = opProps.op;
  opLabel.userData.uuid = opLabel.uuid
  opLabel.userData.kind = 'oplabel'
  return {
    panel,
    inputJacks,
    inputLabels,
    jackOut,
    outputLabel,
    opLabel
  };
}

export { createMeshes };
