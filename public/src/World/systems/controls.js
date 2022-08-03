import { OrbitControls } from 'OrbitControls';

function createControls(camera, canvas) {
    const controls = new OrbitControls(camera, canvas);
    
    // damping and auto rotation require
    // the controls to be updated each frame

    // this.controls.autoRotate = true;
    controls.enableDamping = true;

    controls.tick = () => controls.update();
    return controls;
}

export { createControls };