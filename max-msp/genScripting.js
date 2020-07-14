// import { max } from "gl-matrix/src/gl-matrix/vec2";

// import { max } from "gl-matrix/src/gl-matrix/vec2";

// import { max } from "gl-matrix/src/gl-matrix/vec2";
inlets = 3
outlets = 7

// this is where the parameter min/max & init-value get stored
var namespace = new Dict("namespace")

function initiate(){

	
	//! clear the parent patcher of any vr.source~ objects prior to receiving deltas
	this.patcher.apply(function(b) { 
		
		if(b.varname.split('_')[0] === 'source'){
			outlet(4, 'thispatcher', 'script', 'delete', b.varname)
		}
	});
	gen_patcher = this.patcher.getnamed("world").subpatcher();
	//! clear the gen~ world patcher prior to receiving deltas
	gen_patcher.apply(function(b) { 
		if(b.varname !== "reserved_audioviz" && b.varname !== "reserved_audioviz_1" && b.varname !== "PLO"){

		gen_patcher.remove(b); 	
		}	
	});


	
	resetCounters()
}

initiate()
	// get a reference to "thegen"'s embedded gen patcher:
var varnameCount = 0

// store inlet&outlet indexes per node
var inletsTable = new Array();
var outletsTable = new Array();

//store varnames per node
var varnamesTable = new Array();

var object = {};
var pathName;
var counter = 1;
var feedbackConnections = 0
var checkspeaker = new Array();
var Ycounter;
var newModule;
var speakerTable = []
var genOutCounter = 1

// we use these vars for the visualization of gen audio in the local vr client
var audiovizLookup = {}
var audiovizIndex = 0
//
var nodes = {}

// contain all the buffers
// var pb = new PolyBuffer('world_polybuffer');       // PolyBuffer instantiates a polybuffer~ object named by second argument to js  

function resetCounters(){
	counter = 1;
	feedbackConnections = 0
	genOutCounter = 1
	nodes = {}
	audiovizLookup = {}
	audiovizIndex = 0
}
var speakerTableDict = new Dict("speakerTableDict");
// buffer channels for visual feedback
// var bufferChannelCounter = 0;
// var bufferChannelPaths = [];
// use this to store the names of buffers created for visual feedback
// var vizBuffers = new Array();

gen_patcher = this.patcher.getnamed("world").subpatcher();
// bufferStorage = this.patcher.getnamed("bufferStorage").subpatcher();

function getVarnames(target){
	gen_patcher.apply(function(b) { 
		// prevent erasing our audio outputs from genpatcher
		if(b.varname !== "reserved_audioviz" && b.varname !== "PLO"){
			if (b.varname.indexOf(target) != -1){
				gen_patcher.remove(b); 	

			}
	
		}
		

	});
	
}
var handleDelta = function(delta) {
	var index = JSON.stringify(delta.index)
				if (counter > 20){
				counter = 1
				}
			
	// iterate through the array of deltas, passing one by one through handleDelta
	if (Array.isArray(delta)) {
		for (var i=0; i<delta.length; i++) {
			handleDelta(delta[i]);
		}
	} else {

		Ycounter = counter * 5 + 10
		if (Ycounter > 500){
			Ycounter = 50
		}
		switch (delta.op){
			// prevent new objects from being srcipted too low on the patcher page (we encountered a bug when objects were written above 1000 on the y axis)

			// create an object!
			case "newnode": 
				if(nodes[delta.path]){
					// don't add a duplicate
					// if this happens, it means something is wrong with the graph, maybe a delnode wasn't triggered or received, or duplicate deltas received
					post('WARNING: duplicate newnode delta received. Was filtered out, but need to check the delta round-trip\n\n')
				} else {
					// add the node to the obj to prevent it being added as a duplicate
					nodes[delta.path] = {}

					
					// if (nodes[])
					if (delta.kind === 'controller1'){
					}
					// individual delta to handle:
					paramCounter = 0;
					
					var kind = delta.kind
					

					var posX = 10
					var posY = 10
					if (delta.pos) {

						counter++
						posX = (delta.pos[0] + 3)
						posY = (delta.pos[1] + 3) 
						pathName = delta.path.split('.')[0] 
						switch(delta.category){
							
							case "abstraction": 

								



								if(kind === "speaker"){
									var speakerNumber = pathName.split('_')[1];
									
									// TODO this is one place where we need to deal with the speaker/vr_source lookup table
									var newSpeaker = gen_patcher.newdefault([50, posY * 150, 'out', genOutCounter])
									newSpeaker.varname = pathName;

			
									//need to get its position in vr and apply that to a vr.source~ position
									// 1420. 544. 289. 22.
									
									// if kind is speaker, connect its outlets to the out1 and out2 in gen~ world
									//newSpeaker = gen_patcher.newdefault([20, Ycounter * 10, 'out', speakerNumber])
									
									
									// add a vr.Source~ abstraction to parent, script the new out to this abstraction, use delta.pos to provide the vr.source~ position
									var vrSource = this.patcher.newdefault([-50 + (genOutCounter * 100), 200, "vr.source~", genOutCounter - 1, "@position", delta.pos[0], delta.pos[1], delta.pos[2] ])
									vrSource.varname = "source_" + speakerNumber


									// key groundTruth, value = the same node path in its delta and scenegraph; genContext: number of speakers in scenegraph, correspond to number of out objects scripted into gen~ world with base 1. 
									// the vr.source~ objects instantiated in parent patcher should also have their first arg be the genContext value, but scripting name be the groundTruth value
									speakerTable.push({"groundTruth": vrSource.varname, "genContext": genOutCounter})
									// speakerTableDict.setparse(speakerTable)
									// gen~ and max outlets are base 0 (mth), our speaker numbers are base 1 (nth)
									// TODO decide on base 0 or 1 (I advocate for 0, because this also works with array indices) 
									
									outlet(3, 'genConnect', genOutCounter, speakerNumber)

									// we use outlets below the gen~ world. All vr.Source~ objects script connect into outlets 1 and 2. 
									this.patcher.message("script", "connect", "source_" + speakerNumber, 0, 'genScriptingOutlet_0', 0);
	
									this.patcher.message("script", "connect", "source_" + speakerNumber, 1, 'genScriptingOutlet_1', 0);

									genOutCounter++ 
								} else {
									newModule = gen_patcher.newdefault([125, Ycounter * 10, kind])
									newModule.varname = pathName

									
								}

							break;
							
							case "operator":
									newModule = gen_patcher.newdefault([125, Ycounter * 10, kind])
									newModule.varname = pathName
							break;
							
							default:
									newModule = gen_patcher.newdefault([125, Ycounter * 10, kind])
									newModule.varname = pathName
							break;	
							}
						
						} else {
							switch(kind){
								
								case 'small_knob':
								case 'large_knob':
								case 'tuning_knob':
								case 'slider':
								case 'momentary':
								case 'led':

									pathName = delta.path.split('.')[0]
									paramName = delta.path.replace('.','__')
									setparamName = delta.path.split('.')[1]
									
									
									paramX = paramCounter * 150
									// generate the subparam which the param will bind to
									var setparam = gen_patcher.newdefault([275, Ycounter * 2, "setparam", setparamName])
									setparam.varname = 'setparam_' + paramName
									gen_patcher.message("script", "connect", setparam.varname, 0, pathName, 0);
								
									// generate the param which the js script will bind to
									var param = gen_patcher.newdefault([450, Ycounter * 1.5, "param", paramName, delta.value])
									param.varname = paramName
									gen_patcher.message("script", "connect", param.varname, 0, setparam.varname, 0);
								
									//gen_patcher.message("script", "send", param.varname, paramValue);
									// var namespace = {}

									// namespace[paramName]['value'] = delta.value
									// namespace[paramName]['min'] = delta.range[0]	
									// namespace[paramName]['max'] = delta.range[1]	
									// namespace.setparse(paramName, '{ "value" : delta.value }')	
									// namespace.replace(paramName + "::min", delta.range[0])
									// namespace.replace(paramName + "::max", delta.range[1])			
									outlet(1, paramName, delta.range)
									paramCounter++
								
								break;
								
								case 'n_switch':
									pathName = delta.path.split('.')[0]
									paramName = delta.path.replace('.','__')
									setparamName = delta.path.split('.')[1]
									
									paramX = paramCounter * 150
									// generate the subparam which the param will bind to
									var setparam = gen_patcher.newdefault([275, Ycounter * 2, "setparam", setparamName])
									setparam.varname = 'setparam_' + paramName
									gen_patcher.message("script", "connect", setparam.varname, 0, pathName, 0);
								
									// generate the param which the js script will bind to
									var param = gen_patcher.newdefault([450, Ycounter * 1.5, "param", paramName, delta.value])
									param.varname = paramName
									gen_patcher.message("script", "connect", param.varname, 0, setparam.varname, 0);
								
									//gen_patcher.message("script", "send", param.varname, paramValue);
									outlet(1, paramName, delta.value, 'n_switch')
									paramCounter++
								break;
								
								case "inlet": 
								object[delta.path.replace('.','__')] = delta.index
								inletsTable.push(object)
								
								
								case "outlet":
								// poke all outlets to buffer for visual feedback:
								// first make sure that the outlet has an index, and is not an inlet (sometimes this occurs...)
								if (index && kind !== 'inlet' && kind !== 'controller1' && kind !== 'controller2' && kind !== 'headset'){
									
									post(pathName, delta.path)

									if(audiovizLookup[pathName]){
										audiovizLookup[pathName].paths[delta.path] = {audiovizIndex: audiovizIndex, deltaIndex: delta.index, value: null}
									} else {
										audiovizLookup[pathName] = {
											paths: {

											}
										}
										audiovizLookup[pathName].paths[delta.path] = {audiovizIndex: audiovizIndex, deltaIndex: delta.index, value: null}
									}
									// setup for visualizing each gen object's audio state
									// audiovizLookup[pathName][delta.path] = {audiovizIndex: audiovizIndex, deltaIndex: delta.index}
									post('\n', JSON.stringify(audiovizLookup))
									var newAudiovizPoke = gen_patcher.newdefault([50, posY * 150, 'poke', 'audioviz'])
									newAudiovizPoke.varname = delta.path + '_poke';
									var newAudiovizConstant = gen_patcher.newdefault([50, posY * 150, 'constant', audiovizIndex])
									newAudiovizConstant.varname = delta.path + '_poke';
									// connect the constant to the poke
									gen_patcher.message("script", "connect", newAudiovizConstant.varname, 0, newAudiovizPoke.varname, 1);
									// need to get the index of the node! (if its an abstraction, then the outlet of the gendsp is represented as an index in the scene's graph)
									gen_patcher.message("script", "connect", newModule.varname, delta.index, newAudiovizPoke.varname, 0);

									audiovizIndex++
									outlet(5, 'sizeinsamps', audiovizIndex + 1)
									object[delta.path.replace('.','__')] = delta.index
									outletsTable.push(object)	
									//outlet(0, outletsTable)
									
									// TODO: if a module is deleted, find which channels in the buffer are now freed, make those available to the next newnode.
								}

								break;
									// TEMP HACK!!!!
								// so we can ignore UI objects that we don't need to patcher script at this point
								// NEED TO FIX

								// handle "inlet", "outlet", and "small_knob" etc here
								// you need to cache them somehwere, even though they don't exist as objects in a patcher
								// so we can know how to connect to them or change their values

							}		


							for (var k in delta){
								if (delta.hasOwnProperty(k)) {
									switch (k){
										case 'path':
										
										break;
										
										case 'range':
										
										outlet(4, delta.path.replace('.','__'), delta.value, delta.range)
										break;
										
										case 'value':
										
										break;
										
										case 'taper':
										
										break;
										
										default:
										
										
										break;
										
										
									}
								}
							}
						}
				}	
					// outlet(0, bufferChannelPaths)
			break;
			
			// delete an object
			case "delnode":
				if(nodes[delta.path]){
					// remove node from the nodes object
					delete nodes[delta.path]

					// var newDict = new Dict
					var deleteMe = delta.path.replace('.', '__');
					// dict.set(delta)
					if(delta.path.split('_')[0] === 'speaker'){
						
						var thisVarname = 'source_' + delta.path.split('_')[1]
						genOutCounter--
						outlet(4, 'thispatcher', 'script', 'delete', thisVarname)
						// this.patcher.remove(thisVarname)

						// then remove from gen~ world
						if(genOutCounter <1){
							genOutCounter = 1
						}

					}
					gen_patcher.apply(function(b) { 
						// prevent erasing our audio outputs from genpatcher
						if(b.varname !== "reserved_audioviz" && b.varname !== "PLO"){
							if (b.varname.indexOf(deleteMe) != -1){
		
								gen_patcher.remove(b); 				
							}
						}
					});
					

				
					/*
					var deleteSetParam = 'setparam_' + deleted
					gen_patcher.message("script", "delete", deleted)
					gen_patcher.message("script", "delete", deleteSetParam)*/

				} else {
					// error. received a delnode for a nonexistent node
					post('WARNING: received a delnode for a node that does not exist in the graph\n')

				}
				
			break;

			// create a patchcord!
			case "connect":
				var pathString = '"' + delta.paths + '"' 
				if(nodes[pathString]){
					// don't add a duplicate
					// if this happens, it means something is wrong with the graph, maybe a delnode wasn't triggered or received, or duplicate deltas received
					post('WARNING: received a connection delta that already exists in the graph. was filtered out, but need to check the delta round-trip\n\n')
				} else {
					// add the node to the obj to prevent it being added as a duplicate
					nodes[pathString] = {}
					var setOutlet = delta.paths[0].replace('.','__')
					var setInlet = delta.paths[1].replace('.','__')
					var input;
					var output;
						for (var i = 0; i < inletsTable.length; i++) {
						var inletsIndexes = inletsTable[i]
								input = JSON.stringify(inletsIndexes[setInlet]);
						}
						for (var i = 0; i < outletsTable.length; i++) {
						var outletsIndexes = outletsTable[i]
								output = JSON.stringify(outletsIndexes[setOutlet]);
						}
					var selfPatch1 = delta.paths[0].split('.')[0]
					
					// detect a self-patch connection and insert a history object in between!
					if (delta.paths[0].split('.')[0] === delta.paths[1].split('.')[0]){					
						feedbackConnections++
						var history = gen_patcher.newdefault([150,10, "history"])
						history.varname = "feedback_" + feedbackConnections
						gen_patcher.message("script", "connect", delta.paths[0].split('.')[0], parseInt(output), history.varname, 0);
						gen_patcher.message("script", "connect", history.varname, 0, delta.paths[1].split('.')[0], parseInt(input));

					} else {
						// if not self-patch connection exists, just connect them. 
						gen_patcher.message("script", "connect", delta.paths[0].split('.')[0], parseInt(output), delta.paths[1].split('.')[0], parseInt(input));
					}
				}
			break;

			case "disconnect":
				var pathString = '"' + delta.paths + '"' 
				if(nodes[pathString]){
					// remove node from the nodes object
					delete nodes[pathString]

					var setOutlet = delta.paths[0].replace('.','__')
				
					var setInlet = delta.paths[1].replace('.','__')
					var input;
					var output;
					for (var i = 0; i < inletsTable.length; i++) {
						var inletsIndexes = inletsTable[i]
						input = JSON.stringify(inletsIndexes[setInlet]);
					}
					for (var i = 0; i < outletsTable.length; i++) {
						var outletsIndexes = outletsTable[i]
						output = JSON.stringify(outletsIndexes[setOutlet]);
					}
					gen_patcher.message("script", "disconnect", delta.paths[0].split('.')[0], parseInt(output), delta.paths[1].split('.')[0], parseInt(input));

				} else {
					// error. received a delnode for a nonexistent node
					post('WARNING: received a delnode for a node that does not exist in the graph\n')

				}
				
			break;
			
			// modify a parameter
			case "propchange": 
				// special case name == pos, name == orient, name == value
				switch(delta.name) {
					case "value": 
						var param = delta.path
						param = param.replace(".", "__")
						
						
						var cleaveParam = param.split('.')[0]
						outlet(2, cleaveParam, delta.to)
						// handle knob twiddle
						// send to appropriate param
						// based on delta.path and delta.to (new value)
					break;
					
					case "pos": 
						// whatever
					break;
				}
			break;
			// ETC
		} 
	}
}
/*
// this is only for working within max
function clear(){
	bufferChannelCounter = 0;
	bufferChannelPaths = []	
	counter = 1;
	speakerNumber = 1
	feedbackConnections = 0
	speakerTable.length = 0
	gen_patcher = this.patcher.getnamed("world").subpatcher();
	gen_patcher.apply(function(b) { 
		// prevent erasing our audio outputs from genpatcher
		if(b.varname !== "visualFeedbackBuffer" && b.varname !== "bufferChannels" && b.varname !== "PLO"){
		gen_patcher.remove(b); 				
		}
	});		
			inletsTable = [];
			outletsTable = [];

			//store varnames per node
			varnamesTable = [];	
}
*/

function fromLocalWebsocket(msg){
	
	var ot = JSON.parse(msg)
	cmd = ot.cmd


	switch(cmd){
		case "deltas": {
			counter++;
	
				//var delta = new Dict("delta");
				//delta.parse(msg);
	
				
				handleDelta(ot.data);
			} break;

		case "nuke":
			initiate()
		break

			//? this case isn't likely necessary, but the code in it might be useful elsewhere
		// case "clear_scene":
		// 	outlet(0, 'clear_scene')
		// 	for (i = 0; i < speakerTable.length; i++){
		// 		outlet(3, 'script', 'delete', speakerTable[i])

		// 	}
		// 	// vizBuffers = new Array()
		// 	// bufferChannelCounter = 0;
		// 	// bufferChannelPaths = [];
		// 	speakerNumber = 1
		// 	speakerTable.length = 0
		// 	gen_patcher = this.patcher.getnamed("world").subpatcher();
		// 	//bufferStorage = this.patcher.getnamed("bufferStorage").subpatcher();

		// 	gen_patcher.apply(function(b) { 
			
		// 		// prevent erasing our audio outputs from genpatcher
		// 		if(b.varname !== "PLO"){
		// 			gen_patcher.remove(b); 		
		// 		}
		// 	});


		// 	// bufferStorage.apply(function(b) { 
			
		// 	// 		gen_patcher.remove(b); 		
				
		// 	// });
			
		// 	inletsTable = [];
		// 	outletsTable = [];

		// 	//store varnames per node
		// 	varnamesTable = [];
			

		// 	object = {};
		// 	pathName;
		// 	counter = 1;
		// 	feedbackConnections = 0	

		// break;

			
		//? Don't think the message 'patch' is going to come through here...
		// case "patch":
	
		// 	counter = 1;
		// 	gen_patcher = this.patcher.getnamed("world").subpatcher();

		// 	gen_patcher.apply(function(b) { 
			
		// 	// prevent erasing our audio outputs from genpatcher
		// 		if(b.varname !== "visualFeedbackBuffer" && b.varname !== "bufferChannels" && b.varname !== "PLO"){
		// 			gen_patcher.remove(b); 		
		// 		}
		// 	});
		// var patch = new Dict("patch");
		// patch.parse(msg);
		
		// var scene = ot.value
		// var arcs = JSON.stringify(scene.arcs)
		// var nodes = JSON.stringify(scene.nodes)
		// var varnames = new Array()
		// //var a = ["a", "b", "c"];
	
	
	// Object.keys(scene.nodes).forEach(function(key) {
		
	
	// 	varnameCount++
	// 	paramCounter = 0;
	// 	pathName = key;
	// 	var _props = scene.nodes[key]._props 
	// 	var kind = _props.kind
	// 	var pos = _props.pos								
	// 	var unit = scene.nodes[key]
	// 	var gen = JSON.stringify(unit._props.kind)		
	// 	var checkOp = gen.split(' ')[0];
	// 	var genType = kind.split("_")[0]
			
	// 	// switch between gen operators, params, and @gen abstractions (eveything else)
	// 	switch (genType){
			
	// 		case "op":
	// 		op = kind.split("_")[1]
	// 		var newModule = gen_patcher.newdefault([(pos[0] + counter) * 100, (pos[1] + counter) * 50, op])
	// 		newModule.varname = pathName
	// 		break;
			
	// 		case "param":
	// 		var args = _props.args
	// 		param = kind.split("_")[0]
	// 		var objSettings = [(pos[0] + counter) * 100, (pos[1] + counter) * 50, param ]
	// 		var paramSettings = args
	// 		var newParam = objSettings.concat(paramSettings);
	// 		var newModule = gen_patcher.newdefault(newParam)
	// 		newModule.varname = pathName
	// 		break;
	
	// 		default:			
	// 		var newModule = gen_patcher.newdefault([(pos[0] + counter) * 100, (pos[1] + counter) * 50, "gen", "@gen", kind])
	// 		newModule.varname = pathName
	// 		break;
	// 	}

	// 	// create a new outlet in gen~ world for each added speaker
	// 	if (kind === "speaker"){
	// 					// // create the speaker aka gen [out #]
	// 					// var newSpeaker = gen_patcher.newdefault([(pos[0] + counter), (pos[1] + counter) * 150, 'out', speakerNumber])
	// 					// newSpeaker.varname = 'speaker_' + speakerNumber
	// 					// // add a vr.Source~ abstraction to parent, script the new out to this abstraction. 
	// 					// var vrSource = this.patcher.newdefault([(pos[0] + counter), (pos[1] + counter) * 150, "vr.source~", speakerNumber - 1, "@varname", "source_" + speakerNumber])
						
	// 					// this.patcher.message("script", "connect", 'world',  "speaker_" + speakerNumber - 1,  "source_" + speakerNumber, 0);


	// 					// // need to get its position in vr and apply that to a vr.source~ position

	// 					// speakerNumber++
	// 	} else if (kind === "param"){
	// 		// ignore gen operator-based param modules in the next section
	// 		} else if(kind === "controller1" || kind === "controller2" || kind === "headset"){
	// 				paramX = paramCounter * 150
	// 				// generate the subparam which the param will bind to
	// 				var setparam = gen_patcher.newdefault([(pos[0] + counter) * 100 + paramX, (pos[1] + counter) * 50 - 25, "setparam", key])
	// 				setparam.varname = pathName + "_setparam_" + key
	// 				gen_patcher.message("script", "connect", setparam.varname, 0, pathName, 0);
				
	// 				// generate the param which the js script will bind to
	// 				var param = gen_patcher.newdefault([(pos[0] + counter) * 100 + paramX, (pos[1] + counter) * 50 - 50, "param", kind + "__" + key])
	// 				param.varname = pathName + "_param_" + key
	// 				gen_patcher.message("script", "connect", param.varname, 0, setparam.varname, 0);
				
	// 				//gen_patcher.message("script", "send", param.varname, paramValue);
	// 				//outlet(1, kind + "__" + key, paramValue)
	// 				paramCounter++
	// 		} else {
		
	// 	// get all the inlets and outlets (and eventually the UI params)
	// 	Object.keys(unit).forEach(function(key) {
	// 		var UI_obj = {}	
	// 		if(JSON.stringify(unit[key]._props) !== undefined){
	// 			UI = JSON.stringify(unit[key]._props.kind)
	// 			paramValue = parseFloat(JSON.stringify(unit[key]._props.value, 10))
	// 			// generate the param and subparam for each object
	// 			switch(UI){
	// 				case '"small_knob"':
	// 				case '"large_knob"':
	// 				case '"tuning_knob"':
	// 				case '"slider"':
	// 				case '"momentary"':
	// 				case '"n_switch"':
	// 				case '"led"':
				
	// 				paramX = paramCounter * 150
	// 				// generate the subparam which the param will bind to
	// 				var setparam = gen_patcher.newdefault([(pos[0] + counter) * 100 + paramX, (pos[1] + counter) * 50 - 25, "setparam", key])
	// 				setparam.varname = pathName + "_setparam_" + key
	// 				gen_patcher.message("script", "connect", setparam.varname, 0, pathName, 0);
				
	// 				// generate the param which the js script will bind to
	// 				var param = gen_patcher.newdefault([(pos[0] + counter) * 100 + paramX, (pos[1] + counter) * 50 - 50, "param", pathName + "__" + key])
	// 				param.varname = pathName + "_param_" + key
	// 				gen_patcher.message("script", "connect", param.varname, 0, setparam.varname, 0);
				
	// 				//gen_patcher.message("script", "send", param.varname, paramValue);
	// 				// outlet(1, pathName + "__" + key, paramValue)
	// 				paramCounter++
	// 				break;	
	// 				}
	// 			index = JSON.stringify(unit[key]._props.index)
	
	// 			UI_obj[key] = [UI,index]
	
	// 			object[pathName] = UI_obj;

	// 			}
	// 		})
			
	// 		//counter++
	// 	}
	// })
	// for (i = 0; i < scene.arcs.length; ++i) {
		
	// 	var sourceOp1 = scene.arcs[i][0].split(".")
	// 	opName1 = sourceOp1[0]
	// 	opUI1 = sourceOp1[1]
	// 	var sourceOp2 = scene.arcs[i][1].split(".")
	// 	opName2 = sourceOp2[0]
	// 	opUI2 = sourceOp2[1]
	

	// 	var lookup1 = scene.nodes[opName1]
	// 	var lookup2 = scene.nodes[opName2]
		

	// 	if(lookup1 !== undefined && lookup2 !== undefined){
	// 		var index1 = parseInt(JSON.stringify(lookup1[opUI1]._props.index, 10))
	// 		var index2 = parseInt(JSON.stringify(lookup2[opUI2]._props.index, 10))
		
		
	// 		// if a feedback connection is made, add a history object!
	// 		if(opName1 === opName2){
	// 			feedbackConnections++
	// 			var history = gen_patcher.newdefault([20,20, "history"])
	// 			history.varname = "feedback_" + feedbackConnections
	// 			gen_patcher.message("script", "connect", opName1, index1, history.varname, 0);
	// 			gen_patcher.message("script", "connect", history.varname, 0, opName2, index2);
	// 		} else {
	// 			gen_patcher.message("script", "connect", opName1, index1, opName2, index2);
	// 		}
	// 	}
	// }

    //     break;
	// 	/*
    //     case "user_pose":

	// 		//var pose = new Dict("pose");
	// 		//pose.parse(msg);
			
	// 		var data = JSON.parse(msg)
	// 		var pose = data.pose
			
	// 		// IMPORTANT: we eventually will need to filter controller data by who is using it (aka the data.pose.id). 
	// 		var id = data.pose.id
	// 		// TODO: filter remaining data based on ID, and add something to the VR space that allows for switching the gestural data source
	// 		// TODO: when connecting a cable from a gestural module to a given inlet/knob, need to grab the range of the inlet/knob and insert a scale object between the cable. 
	// 		var headPosition // do this later
			
	// 		// Headset
	// 		var headData; 
			
	// 		// Controllers
	// 		var controller1 = data.pose.controller1
	// 			// c1 pos data
	// 			outlet(1, "controller1__pos_x", data.pose.controller1.pos.x)
	// 			outlet(1, "controller1__pos_y", data.pose.controller1.pos.y)
	// 			outlet(1, "controller1__pos_z", data.pose.controller1.pos.z)
	// 			// c1 orient data
	// 			outlet(1, "controller1__orient_x", data.pose.controller1.orient.x)
	// 			outlet(1, "controller1__orient_y", data.pose.controller1.orient.y)
	// 			outlet(1, "controller1__orient_z", data.pose.controller1.orient.z)
	// 			outlet(1, "controller1__orient_w", data.pose.controller1.orient.w)
					
	// 		var controller2 = data.pose.controller2
	// 						// c1 pos data
	// 			outlet(1, "controller2__pos_x", data.pose.controller2.pos.x)
	// 			outlet(1, "controller2__pos_y", data.pose.controller2.pos.y)
	// 			outlet(1, "controller2__pos_z", data.pose.controller2.pos.z)
	// 			// c1 orient data
	// 			outlet(1, "controller2__orient_x", data.pose.controller2.orient.x)
	// 			outlet(1, "controller2__orient_y", data.pose.controller2.orient.y)
	// 			outlet(1, "controller2__orient_z", data.pose.controller2.orient.z)
	// 			outlet(1, "controller2__orient_w", data.pose.controller2.orient.w)


	// 	break;
	// 	*/

    //     default:

        	post("unknown msg received: ", msg)
		break;
    }
	
	// var jsonString = JSON.stringify(jsonObjectFromSomewhere);


//	var cmd = JSON.stringify(msg.cmd)

//	switch (

}

var audiovizBuffer = new Buffer("audioviz")

function getAudioviz(){
	Object.keys(audiovizLookup).forEach(function (item) {
		var targetModule = audiovizLookup[item].paths
		Object.keys(targetModule).forEach(function (itemz) {
			audiovizLookup[item].paths[itemz].value = audiovizBuffer.peek(1, targetModule[itemz].audiovizIndex)
			
		})
	});
	//post(audiovizBuffer.peek(1, 1))
	// post(JSON.stringify(audiovizLookup))
	outlet(6, 'audiovizLookup', JSON.stringify(audiovizLookup))
}