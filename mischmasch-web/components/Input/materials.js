import { MeshStandardMaterial } from 'three';

function createMaterials(opCategory) {
  // switch(opCategory){
  //   // my grouping of these categories is hamfisted
  //   // math-related
  //   case "math":
  //   case "trigonometry":
  //   case "powers":
  //   case "integrator":

  //   break;
  //   // routing/logic stuff
  //   case "route":
  //   case "comparison":
  //   case "logic":
  //   case "route":
  //   case "range":
  //   case "convert":      

  //   break;
  //   //  lookups
  //   case "buffer":
  //   case "waveform":

  //   break;

  //   // numbers
  //   case "numeric":
  //   case "constant":
  //   case "declare":
  //   case "global":
  //   case "range":
  //   case "convert": 
    
  // }
  const panel = new MeshStandardMaterial({
    color: 'firebrick',
    flatShading: true,
  });

  const jackIn = new MeshStandardMaterial({
    color: 'skyblue',
    flatShading: true,
  });

  const jackOut = new MeshStandardMaterial({
    color: 'darkslategray',
    flatShading: true,
  });

  const cableConnector = new MeshStandardMaterial({
    transparent: true,
    opacity: 0
  });

  return { panel, jackIn, jackOut, cableConnector };
}

export { createMaterials };

//   filter: {},
//   'input-output': {},
//   ignore: {},
//   subpatcher: {},
//   FFT: {},
//   global: {},
//   dsp: {},
//   feedback: {},
//   undefined: {}