import { Raycaster, Color, ArrowHelper, Matrix4 } from 'three';
import { Hover } from './Hover.js'

class Collisions {
    constructor( editorState, scene, pointer, camera, palette, patching, xrCtlRight, xrCtlLeft){
        this.scene = scene;
        this.editorState = editorState;
        this.pointer = pointer;
        this.camera = camera;
        this.palette = palette;
        this.raycaster = new Raycaster() // this will get replaced in the detect() method, but seems we need it to instantiate the arrow helper
        this.arrow = new ArrowHelper( this.raycaster.ray.direction, this.raycaster.ray.origin, 100, Math.random() * 0xffffff, 0.05, 0.05 ) // for the hmd raycaster
        this.arrow.name = 'arrowHelper'
        this.arrow.cone.visible = false;
        this.scene.add( this.arrow );
        this.hover = new Hover();
        this.patching = patching;
        this.xrCtlRight = xrCtlRight;
        this.xrCtlLeft = xrCtlLeft;
        this.tempMatrix = new Matrix4();
        
    }

    // getIntersections(controller){
    //     console.log('collisions', controller)

    //     this.tempMatrix.identity().extractRotation( controller.matrixWorld );

    //     this.raycaster.ray.origin.setFromMatrixPosition( controller.matrixWorld );
    //     this.raycaster.ray.direction.set( 0, 0, - 1 ).applyMatrix4( this.tempMatrix );

    //     return  this.raycaster.intersectObjects( synth.children, false );
    // }
    
    detect(){
        // check for collisions with controller_0
        

        // use HMD for picking ray
        let raycaster = new Raycaster();
        // cast a ray through the frustrum
        raycaster.setFromCamera(this.pointer, this.camera)
        // update the position of arrow
        this.arrow.setDirection(raycaster.ray.direction);

        let intersects = raycaster.intersectObjects(this.scene.children, true)
        if(intersects.length){
        // loop through the intersections, stopping at the first object that isn't meant to be ignored
        for(let i = 0; i <intersects.length; i++){
            if(this.editorState.partialCable && intersects[i] == this.editorState.partialCable.userData.src ){
                // if a partial cable exists, ignore any new intersections with its source jack until the cable is either completed or deleted.
                // nothing to be done here, leave comments as is
            } else if(intersects[i].object.name && intersects[i].object.name !== 'arrowHelper' && intersects[i].object.name != 'controller' && !intersects[i].object.name.includes('cable') && !intersects[i].object.name.includes('thumbstick') && !intersects[i].object.name.includes('xrControllerRaycastBeam')){
                // do the things
                // set arrow ray length to distance of object
                this.arrow.setLength(intersects[i].distance)
                // if the palette is open, do palette stuff
                if (this.palette.userData.active){
                    // stage this op to be added to the scene 
                    // this.hover.state.paletteOp = intersects[i]
                    // // highlight the op 
                    // this.hover.setHoverColour(intersects[i])
                } else {
                    // palette isn't open
                    this.hover.state.paletteOp = false
                    // allow manipulation of scene objects
                    let worldObjectName = intersects[i].object.name;
                    let worldObjectKind = worldObjectName.split('_')[0]
                    
                    switch (worldObjectKind){
                        case "panel":
                            this.hover.state.ui.element = 'panel'
                            this.hover.state.ui.object = intersects[i]
                            this.hover.state.ui.name = intersects[i].object.name
                            this.hover.setHoverColour(intersects[i])
                        break;

                        case "inlet":
                            
                            // if a partial cable isn't in the hands of the controller, then create one. if one does exist, get the 2nd jack, highlight it, and stage it for completing the connection.
                            
                            if(this.editorState.partialCable && this.editorState.partialCable.userData.src && this.editorState.partialCable.userData.src.object.name.split('_')[0] == 'inlet'){
                                // if user is attempting to connect an inlet to an inlet, in which case, prevent the hover
                            } else {
                                // if complete cable already exists between partial cable source jack and user selected jack
                                // then prevent the hover (aka, prevent duplicate connections)
                                let duplicate = false;
                                for(let j = 0; j < this.patching.cables.length; j++){
                                    // prevent duplicate connection from outlet to inlet
                                    if(this.editorState.partialCable && this.patching.cables[j].userData.status == 'complete' && this.editorState.partialCable.userData.src.object.name == this.patching.cables[j].userData.src.object.name && this.patching.cables[j].userData.dest.object.name == intersects[i].object.name){
                                        duplicate = true
                                    }
                                }                          
                                if(duplicate == false ){
                                    // no cable conflicts, so:
                                    // if there's a partial cable, then it is coming from an outlet, so make the full connection possible
                                    // if no partial cable then, then make the partial cable possible
                                    this.hover.state.ui.element = 'inlet'
                                    this.hover.state.ui.object = intersects[i]    
                                    this.hover.state.ui.name = worldObjectName                      
                                    this.hover.setHoverColour(intersects[i])
                                }
                            }
                        break;

                        case "outlet":
                            // if a partial cable isn't in the hands of the controller, then create one. if one does exist, get the 2nd jack, highlight it, and stage it for completing the connection.
                            
                            // first check if user is attempting to connect an outlet to an outlet, in which case, prevent the hover
                            if(this.editorState.partialCable && this.editorState.partialCable.userData.src && this.editorState.partialCable.userData.src.object.name.split('_')[0] == 'outlet'){
                                // ignore this interaction
                            } else {
                                // if complete cable already exists between partial cable source jack and user selected jack
                                // then prevent the hover (aka, prevent duplicate connections)
                                let duplicate = false;
                                for(let j = 0; j < this.patching.cables.length; j++){
                                    // prevent duplicate connection from inlet to outlet
                                    if(this.editorState.partialCable && this.patching.cables[j].userData.status == 'complete' && this.editorState.partialCable.userData.src.object.name == this.patching.cables[j].userData.dest.object.name && this.patching.cables[j].userData.src.object.name == intersects[i].object.name){
                                        duplicate = true
                                    }
                                }                          
                                if(duplicate == false ){
                                    // no cable conflicts, so:
                                    // if there's a partial cable, then it is coming from an inlet, so make the full connection possible
                                    // if no partial cable then, then make the partial cable possible
                                    this.hover.state.ui.element = 'outlet'
                                    this.hover.state.ui.object = intersects[i] 
                                    this.hover.state.ui.name = intersects[i].object.name                             
                                    this.hover.setHoverColour(intersects[i])      
                                }
                            }                                 
                                                         
                        break;

                        case 'opLabel':
                        case 'outLabel':
                        case 'inputLabel':
                            // probably nothing to do with these... maybe make them editable eventually?
                        break
                        default: { 
                            console.log('no switch case for selected object in loop', worldObjectName)
                            // reset hover attributes
                            this.hover.resetState();
                            }
                        }
                    }
                break // stop the loop after finding the first match
                }                
            }
        } else {
            // reset all hover attributes
            this.hover.resetState();
            this.hover.unsetHoverColour()

            // reset the picking arrow length
            // TODO: this is commented out because the calibration of the arrow is off. possibly related to https://stackoverflow.com/questions/49009873/why-is-raycast-direction-calculated-incorrectly-in-webxr
            this.arrow.setLength(100)
        }
        return this.hover.state
    }
    getIntersections( controller ) {
        let newRaycaster = new Raycaster();
        this.tempMatrix.identity().extractRotation( controller.controller.matrixWorld );

        newRaycaster.ray.origin.setFromMatrixPosition( controller.controller.matrixWorld );
        newRaycaster.ray.direction.set( 0, 0, - 1 ).applyMatrix4( this.tempMatrix );

        return newRaycaster.intersectObjects( this.scene.children, false );

    }
}

export { Collisions }

