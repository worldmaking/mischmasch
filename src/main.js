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

    
    // display the operators palette
    let displayPaletteButton = document.querySelector('#displayPalette');
    displayPaletteButton.addEventListener('click', ()=>{
        world.displayPalette()
        paletteState = 1;
    })
    
    // hide the operators palette
    let hidePaletteButton = document.querySelector('#hidePalette');
    hidePaletteButton.addEventListener('click', ()=>{
        world.hidePalette()
        paletteState = 0;
    })

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

