import { BoxBufferGeometry, CylinderBufferGeometry, TorusBufferGeometry } from 'three';

function createGeometries(numInputs) {
  let width = numInputs
  const panel = new BoxBufferGeometry(width, 2.2, 0.3);

  const jack = new TorusBufferGeometry( 0.1, 0.05, 4, 64);

  const cableConnector = new CylinderBufferGeometry(0.1, 0.1, 0.1, 50);

  return {
    panel,
    jack,
    cableConnector
  };
}

export { createGeometries };
