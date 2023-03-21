import { World} from './World.js'

import "./styles/main.css"

let paletteState = 0;
// create the main function
function main() {

   // 
    // code to set up the world App will go here
    
    // Get a reference to the container element
    const container = document.querySelector('#scene-container');
    
    const world = new World(container);

    // 2. Render the scene
    world.start();


    // keyboard scaffolding
    window.addEventListener("keydown", (event) => {
        switch(event.keyCode){
            case 49: // 1 == select 'abs' op from palette
                world.keyboardScaffolding('addNode', 'abs')
            break
            case 50: // 2 == select 'div' op from palette
                world.keyboardScaffolding('addNode', 'div')
            break
            case 67:
                world.keyboardScaffolding('addConnection', ['abs_0', 'div_0'])
            break
        }
        // do something
    });
    
    window.oncontextmenu = (e) => {  
        e.preventDefault()  
        if(paletteState === 0){
            world.displayPalette()
            paletteState = 1;
        } else {
            world.hidePalette()
            paletteState = 0;
        }

    }
    


    // get palette clicks:
    window.addEventListener("mousedown", function(event){
        // chosen op name
        if(paletteState == 1){
            world.addOp()

        }

    });



}

// call main to start the app
main();

