import { Raycaster, Color, ArrowHelper } from 'three';

const objectSelectedColor = new Color(0xf0520a);
let hoverColour = new Array(); // element 0 = the object, element 1 is its original colour

class Collisions {
    constructor( editorState, scene, pointer, camera, palette ){
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
        // this.hoveredPaletteOp;

        this.hover = {
            paletteOp: false,
            ui: {
                element: false,
                object: false,
                name: false
            }, // element can be inlet, outlet, panel, knob, etc. object is the threeJS object. if nothing is hovered over, set both to false 
        };
        
    }

    detect(){
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
            } else if(intersects[i].object.name && intersects[i].object.name !== 'arrowHelper' && intersects[i].object.name != 'controller' && !intersects[i].object.name.includes('partial_cable')){
                // do the things
                // set arrow ray length to distance of object
                this.arrow.setLength(intersects[i].distance)
                // if the palette is open, do palette stuff
                if (this.palette.userData.active){
                    // stage this op to be added to the scene 
                    this.hover.paletteOp = intersects[i]
                    // highlight the op 
                    this.setHoverColour(intersects[i])
                } else {
                    // palette isn't open
                    this.hover.paletteOp = false
                    // allow manipulation of scene objects
                    let worldObjectName = intersects[i].object.name;
                    let worldObjectKind = worldObjectName.split('_')[0]
                    
                    switch (worldObjectKind){
                        case "panel":
                            this.hover.ui.element = 'panel'
                            this.hover.ui.object = intersects[i]
                            this.hover.ui.name = intersects[i].object.name
                            this.setHoverColour(intersects[i])
                        break;

                        case "inlet":
                            // if a partial cable isn't in the hands of the controller, then create one. if one does exist, get the 2nd jack, highlight it, and stage it for completing the connection.
                            // create a partial cable
                            this.hover.ui.element = 'inlet'
                            this.hover.ui.object = intersects[i]    
                            this.hover.ui.name = worldObjectName                      
                            this.setHoverColour(intersects[i])
                        break;

                        case "outlet":
                            // if a partial cable isn't in the hands of the controller, then create one. if one does exist, get the 2nd jack and complete the connection.                                   
                            this.hover.ui.element = 'outlet'
                            this.hover.ui.object = intersects[i] 
                            this.hover.ui.name = intersects[i].object.name                             
                            this.setHoverColour(intersects[i])                                   
                        break;

                        case 'opLabel':
                        case 'outLabel':
                        case 'inputLabel':
                            // probably nothing to do with these... maybe make them editable eventually?
                        break
                        default: { 
                            console.log('no switch case for selected object in loop', worldObjectName)
                            // reset hover attributes
                            this.hover = {
                                paletteOp: false,
                                ui: {
                                    element: false,
                                    object: false,
                                    name: false
                                    }
                                }
                            }
                        }
                    }
                break // stop the loop after finding the first match
                }                
            }
        } else {
        // reset all hover attributes
        this.unsetHoverColour()
        // if (this.hover.paletteOp){
            this.hover = {
                paletteOp: false,
                ui: {
                    element: false,
                    object: false,
                    name: false
                }
            // }
        }
        // reset the picking arrow length
        // TODO: this is commented out because the calibration of the arrow is off. possibly related to https://stackoverflow.com/questions/49009873/why-is-raycast-direction-calculated-incorrectly-in-webxr
        this.arrow.setLength(100)

        
        }
        return this.hover
    }

    setHoverColour(nextObject){
        // first check if another element is previously hovered, if so get previous element, get its original colour, reset it to that
        if(hoverColour.length > 0){
            let previous = hoverColour[0]
            previous.object.material.color.set(hoverColour[1]);
        }
        // get the object's original colour
        let originalColour = nextObject.object.material.color.getHex();
        // store the object, and its original colour in the hoverColour object
        hoverColour[0] = nextObject
        hoverColour[1] = originalColour
        // set next object's colour to highlighted colour
        nextObject.object.material.color.set(objectSelectedColor)
    }

    unsetHoverColour(){
        // this is for when a cable connection is deleted, if the select button was released when the raycast isn't pointing at anything, it doesn't remove the hover 
        if(hoverColour.length>0){  
            // get previous object
            let previous = hoverColour[0]
            // reset its colour
            previous.object.material.color.set(hoverColour[1]);
            
        }
    }
}

export { Collisions }

