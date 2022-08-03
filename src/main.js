import { World} from './World/World.js'

// create the main function
function main() {
    // code to set up the World App will go here
    
    // Get a reference to the container element
    const container = document.querySelector('#scene-container');
    
    // 1. Create an instance of the World app
    const world = new World(container);

    // 2. Render the scene
    world.start();

    
    let button = document.querySelector('#addNode');

    button.addEventListener('click', ()=>{
        world.addNode()
    })


}

// call main to start the app
main();

