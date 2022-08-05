import { Clock } from 'three';

const clock = new Clock();
class Loop {
    constructor(camera, scene, renderer, pointer, raycaster) {
        this.camera = camera;
        this.scene = scene;
        this.renderer = renderer;
        this.updatables = [] // list to hold animated objects //! this might need to reference the automerge document eventually?
        this.pointer = pointer;
        this.raycaster = raycaster;
        this.hoveredPaletteOp;
        
    }

    start() {
        this.renderer.setAnimationLoop(() => {
            // tell every animated object to tick forward one frame
            this.tick();
            // palette raycaster
            if(this.scene.children.some(element => element.name === 'Palette')){
                // update the picking ray with the camera and pointer position
                this.raycaster.setFromCamera( this.pointer, this.camera );
                // calculate objects intersecting the picking ray
                const intersects = this.raycaster.intersectObjects( this.scene.children );
                
                for ( let i = 0; i < intersects.length; i ++ ) {
                    // console.log(intersects[i])
                    this.hoveredPaletteOp = intersects[i]
                    console.log(intersects[i])
                    intersects[ i ].object.material.color.set( 0xff0000 );

                }
            }

            this.renderer.render(this.scene, this.camera);
        });   
    }

    stop() {
        // sending null to setAnimationLoop stops it
        this.renderer.setAnimationLoop(null);
    }

    paletteHover(){
        return this.hoveredPaletteOp;
    }
    tick() {
        // only call the getDelta function once per frame!
        const delta = clock.getDelta();
        // Code to update animations will go here
        for (const object of this.updatables){
            object.tick(delta);
        }
    }
}

export { Loop }