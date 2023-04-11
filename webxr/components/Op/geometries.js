import { BoxGeometry, CylinderGeometry, TorusGeometry} from 'three';
import { systemSettings } from '../../settings/systemSettings.js'
const scale = systemSettings.UI_DEFAULT_SCALE
function createGeometries(numInputs) {
  let width = numInputs
  const panel = new BoxGeometry(width * scale, 2.2 * scale, 0.3 * scale);

  const jack = new TorusGeometry( 0.1 * scale, 0.1 * scale, 4, 64);

  const cableConnector = new CylinderGeometry(0.1 * scale, 0.1 * scale, 0.1 * scale, 50);

  return {
    panel,
    jack,
    cableConnector
  };
}

export { createGeometries };
