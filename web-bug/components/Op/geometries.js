import { BoxGeometry, CylinderGeometry, TorusGeometry} from 'three';

function createGeometries(numInputs) {
  let width = numInputs
  const panel = new BoxGeometry(width, 2.2, 0.3);

  const jack = new TorusGeometry( 0.1, 0.1, 4, 64);

  const cableConnector = new CylinderGeometry(0.1, 0.1, 0.1, 50);

  return {
    panel,
    jack,
    cableConnector
  };
}

export { createGeometries };
