import { OBJLoader } from 'three/examples/jsm/loaders/OBJLoader.js'

import { GLTFLoader } from 'three/examples/jsm/loaders/GLTFLoader.js'

class XRController{
    constructor (renderer, controllerNumber){
        this.controller = renderer.xr.getController(controllerNumber)
        let resourceURL = `${window.location.origin}/World/components/XRController/models/Oculus Touch for Rift/Oculus-Touch-Right-v1.png`
        console.log(window.location)
        // load controller obj
        const loader = new GLTFLoader();
        // load a resource
        // Load a glTF resource
        loader.load( resourceURL,
            // called when the resource is loaded
            function ( gltf ) {
                this.controller.add( gltf )
                // scene.add( gltf.scene );

                // gltf.animations; // Array<THREE.AnimationClip>
                // gltf.scene; // THREE.Group
                // gltf.scenes; // Array<THREE.Group>
                // gltf.cameras; // Array<THREE.Camera>
                // gltf.asset; // Object

            },
            // called while loading is progressing
            function ( xhr ) {

                console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );

            },
            // called when loading has errors
            function ( error ) {

                console.log( 'An error happened' );

            }
        );
        // loader.load('./model/vr_controller_vive_1_5.obj', function ( controllerObject ) {
        //         controllerObject.position.set(0, 0.2, 0);
        //         this.controller.add( controllerObject )
        //     },
        //     // called when loading is in progress
        //     function ( xhr ) {
        //         console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );
        //     },
        //     // called when loading has errors
        //     function ( error ) {
        //         console.log( 'An error happened', error );
        //     }
        // );
    }
}

export { XRController }