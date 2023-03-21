import { DirectionalLight, AmbientLight, HemisphereLight } from 'three';

function createLights() {

    const ambientLight = new HemisphereLight(
        'white', // bright sky color
        'darkslategrey', // dim ground color
        3, // intensity
    )
    // Create a directional light. color, intensity
    const mainLight = new DirectionalLight('white', 8);

    // move the light right, up, and towards us
    mainLight.position.set(10, 10, 10);
    return {mainLight, ambientLight};
}

export { createLights };