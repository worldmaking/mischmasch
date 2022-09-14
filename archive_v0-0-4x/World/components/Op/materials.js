import { MeshStandardMaterial } from 'three';

function createMaterials(opCategory) {
  let panelColour = '#9efffd'
  switch(opCategory){
    // my grouping of these categories is hamfisted
    // math-related
    case "mathemagical":
      panelColour = '#9efffd'
    break;

    case "scaling":
      panelColour = '#b19eff'
    break;

    case "switching":
      panelColour = '#ff9ef7'
    break;

    case "filtering":
      panelColour = '#f74545'
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
  const panel = new MeshStandardMaterial({
    color: panelColour,
    flatShading: true,
    transparent: true,
    opacity: 0.2
  });

  const jackIn = new MeshStandardMaterial({
    color: '#ffc800',
    flatShading: true,
    transparent: true,
    opacity: 0.4
  });

  const jackOut = new MeshStandardMaterial({
    color: 'darkslategray',
    flatShading: true,
    transparent: true,
    opacity: 0.4
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