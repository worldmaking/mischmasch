inlets = 1
outlets = 1
audiovizLookup = {}
// access the buffer in the gen~ world. this can/should be independent of the scripting dict
var audiovizBuffer = new Buffer("audioviz");
var getAudioVizErrorDirty = 0

function setAudioViz(pathName, path, deltaIndex, audiovizIndex){
    if(audiovizLookup[pathName]){
        audiovizLookup[pathName].paths[path] = {audiovizIndex: audiovizIndex, deltaIndex: deltaIndex, value: null}
    } else {
        audiovizLookup[pathName] = {
            paths: {

            }
        }
        audiovizLookup[pathName].paths[path] = {audiovizIndex: audiovizIndex, deltaIndex: deltaIndex, value: null}
    }
}
// only visualizing the outlets for now:
var outletViz = {}
function getAudioviz(){
	// seems the audiovizLookup isn't properly instantiated at start
	if (typeof audiovizLookup === "object"){
		if (Object.keys(audiovizLookup).length > 0){
			Object.keys(audiovizLookup).forEach(function (item) {
				var targetModule = audiovizLookup[item].paths
				var pathList = Object.keys(targetModule)
				for(i=0;i<pathList.length;i++){
					foo = pathList[i]
					outletViz[foo] = {value: audiovizBuffer.peek(1, targetModule[foo].audiovizIndex)}
				}
			});
			outlet(0, 'audiovizLookup', JSON.stringify(outletViz))
			
			if(getAudioVizErrorDirty === 1){
				getAudioVizErrorDirty = 0
			}
		} else {
			if(getAudioVizErrorDirty === 0){
				post('function getAudioviz called when no graph present\n')
				getAudioVizErrorDirty = 1
			}
		}

	}
}