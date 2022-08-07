import { World} from './World/World.js'

import "./styles/main.css"
let paletteState = 0;
// create the main function
function main() {
    // code to set up the World App will go here
    
    // Get a reference to the container element
    const container = document.querySelector('#scene-container');
    
    // 1. Create an instance of the World app
    const world = new World(container);

    // 2. Render the scene
    world.start();


    // keyboard scaffolding
    window.addEventListener("keydown", (event) => {
        switch(event.keyCode){
            case 49: // 1 == select 'add' op from palette
                world.keyboardScaffolding('addNode', 'add')
            break
        }

        console.log(event.keyCode)
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

