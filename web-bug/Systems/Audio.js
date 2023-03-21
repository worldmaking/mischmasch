import * as genish from '../3rd-party/genish-extra/gen.lib.js' 

class Audio{
    constructor(){

        let counter = 0
        // need to wait for the genish.js library to be loaded...
        window.onload = function() {
            // genish.export(window)
            genish.utilities.createContext(2048)
            // load a noise scene
            // window.loadScene = function(scene) {
                console.log('updateGraph fired')
                let workletName = "worklet" + counter
                // graph = ishify(scene)
                // graph = `cycle(330)`
                let graph = `let noise_0 = noise()
                let speaker_1 = noise_0;
                let speakers = speaker_1
                return { 
                   sinks:speaker_1,
                   sources:noise_0.out}`
                // console.log(graph)
                let sceneFunction = new Function(graph)
                console.log(sceneFunction)
                let state = sceneFunction();
                // console.log(state)
                let speakers = state.sinks;
                console.log('graph', graph, 'sceneFunction', sceneFunction, 'state', state)
                genish.utilities.playWorklet(speakers, workletName, true)
                counter++
            // }
            window.clearScene = function() {
                workletName = "worklet" + counter
                utilities.playWorklet("1", workletName, false)
            counter++
            }
        }
    }
    updateGraph(genishCode){
        console.log('updateGraph fired')
        let workletName = "worklet" + counter
        // graph = ishify(scene)
        // graph = `cycle(330)`
        let graph = `let noise_0 = noise()
        let speaker_1 = noise_0;
        let speakers = speaker_1
        return { 
           sinks:speaker_1,
           sources:noise_0.out}`
        // console.log(graph)
        let sceneFunction = new Function(graph)
        console.log(sceneFunction)
        let state = sceneFunction();
        // console.log(state)
        let speakers = state.sinks;
        console.log('graph', graph, 'sceneFunction', sceneFunction, 'state', state)
        utilities.playWorklet(speakers, workletName, false)
        counter++
    }
}

export { Audio }