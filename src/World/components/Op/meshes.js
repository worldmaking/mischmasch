import { Mesh } from 'three';

import { createGeometries } from './geometries.js';
import { createMaterials } from './materials.js';
import {Text} from 'troika-three-text'
// todo: see https://www.npmjs.com/package/troika-three-text#preloading for optimizing text loading

function createMeshes(opProps) {
  const geometries = createGeometries();
  const materials = createMaterials();
  let panelGeometry;
  let inputJacks = []
  let inputLabels = []
  let outputJacks = []
  let outputLabels = []
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
      // jackIn.rotation.set(1.55, 1, 0);
      jackIn.rotation.set(0, 0, 0)

      jackIn.name = `inlet_${inputName}`
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
  let panelColour;
  switch(opProps.classification){
    case "mathemagical":
      panelColour = '#006664'
    break;
    case "scaling":
      panelColour = '#2e00e6'
    break;
    case "switching":
      panelColour = '#a8009a'
    break;
    case "filtering":
      panelColour = '#ff0000'
    break;
    case "conversion":
      panelColour = '#4563f7'
    break;
    case "throughput":
      panelColour = '#5af745'
    break;
    case "parameter":
      panelColour = '#f7f145'
    break;
    case "source":
      panelColour = '#f7a445'
    break;
    case "delay":
      panelColour = '#5a45f7'
    break;
  }
  panel.material.color.set(panelColour)
  panel.position.set(0, 1.6, 0);
  panel.rotation.set(0, 0, 0)
  panel.name = `panel_${opProps.op}_${panel.uuid}`
  panel.userData.name = opProps.op;
  panel.userData.uuid = panel.uuid
  panel.userData.kind = 'panel'



  // does it have outputs?
  if(opProps.outputs && Object.keys(opProps.outputs).length > 0){
    let outputs = opProps.outputs
    let outputNames = Object.keys(outputs)
    let outputLabelNames = Object.values(outputs)
    let numoutputs = outputNames.length
    // loop through outputs and create the inlets aand labels for this op
    // //
    let outletIndex = 0
    
    outputNames.forEach(outputName => {
      // jacks
      let jackOut = new Mesh(geometries.jack, materials.jackOut);
      let posX = outputNames.indexOf(outputName)
      jackOut.position.set(posX, 1.2, 0.2);
      // jackOut.rotation.set(1.55, 1, 0);
      jackOut.rotation.set(0, 0, 0)

      jackOut.name = `outlet_${outputName}`
      jackOut.userData.name = outputName;
      jackOut.userData.uuid = jackOut.uuid
      jackOut.userData.kind = 'outlet'
      jackOut.userData.index = outletIndex

      outputJacks.push(jackOut)

      // labels
      let label = outputLabelNames[outletIndex]
      let outputLabel = new Text();
      
      if(label.includes('(')){
        label = label.slice(0, label.indexOf('('))
      }
      if(/\s/.test(label)){
        // if label has more than one word, split label into two lines at first space
        outputLabel.text = label.replace(' ', '\n')
      } else {
        outputLabel.text = label
      }

      outputLabel.fontSize = 0.2
      outputLabel.color = 'white'
      outputLabel.anchorX = 'center'
      outputLabel.position.set(posX, 1, 0.2);
      outputLabel.rotation.set(0, 0, 0)
      outputLabel.name = 'outputLabel'
      outputLabel.userData.name = label;
      outputLabel.userData.uuid = outputLabel.uuid
      outputLabel.userData.kind = 'outputLabel'

      outputLabels.push(outputLabel)

      outletIndex++
    })
    panelGeometry = createGeometries(numoutputs);
  } else {
    // op has no inputs, set panel width to 1
    panelGeometry = createGeometries(1);
  }


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
    outputJacks,
    outputLabels,
    opLabel
  };
}

export { createMeshes };
