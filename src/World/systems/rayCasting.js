import { Vector2 } from 'three'
const pointer = new Vector2();
function mouse(event){
    // calculate pointer position in normalized device coordinates
    // (-1 to +1) for both components

    pointer.x = ( event.clientX / window.innerWidth ) * 2 - 1;
    pointer.y = - ( event.clientY / window.innerHeight ) * 2 + 1;
    console.log(pointer.x, pointer.y)
}

export {
    mouse
}