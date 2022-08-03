import { BoxBufferGeometry, 
    Mesh, 
    MeshStandardMaterial,
    MathUtils,
    TextureLoader
} from 'three';
function createMaterial() {
    // create a texture loader.
    const textureLoader = new TextureLoader();

    
    // load a texture
    const texture = textureLoader.load(
    './assets/textures/uv-test-col.png',
    );

    // create a "standard" material using
    // the texture we just loaded as a color map
    const material = new MeshStandardMaterial({
        map: texture,
        color: 'purple'
    });
  
    return material;
  }

function createCube() {
    // create a geometry
    const geometry = new BoxBufferGeometry(2,2,2);

    const spec = { color: 'purple' }
    // a physically correct "standard" material
    const material = createMaterial();

    // create a Mesh containing the geometry and material
    const cube = new Mesh(geometry, material);

    cube.rotation.set(-0.5, -0.1, 0.8);

    const radiansPerSecond = MathUtils.degToRad(30);

    // this method will be called once per frame
    cube.tick = (delta) => {
        // increase the cube's rotation each frame
        cube.rotation.z += radiansPerSecond * delta;
        cube.rotation.x += radiansPerSecond * delta;
        cube.rotation.y += radiansPerSecond * delta;
    };
    return cube;
}

export { createCube };