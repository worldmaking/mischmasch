import * as genish from 'genish.js' 
 
class Audio{
    constructor(){
        // need to wait for the genish.js library to be loaded...
        window.onload = function() {
            // put genish functions in global namespace...
            // you certainly don't have to do this! If you don't, every genish.js
            // ugen needs to reference the genish object (so, genish.cycle, genish.mul etc.)
            genish.export( window )
            
            let saw = cycle(330)
            
        
            // make our audio context with a buffer size of 2048 samples.
            // because browsers require user interaction to trigger audio
            // this adds callback functions that will be called when the user first
            // clicks/touches/presses a key in the browser window. 
            utilities.createContext( 2048 )
        
            // const synth = mul( carrier, env )
            

            window.onclick = ()=> {
            
                utilities.playWorklet( saw, 'sawSynth', true ) 

            
            }
        }
    }
}

export { Audio }