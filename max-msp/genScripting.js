
inlets = 3
outlets = 7

// the reference to the gen~ world object we'll be scripting to. 
var gen_patcher; 

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
var speakerTable = {}
var genOutCounter = 1

var audiovizBuffer = new Buffer("audioviz");

var getAudioVizErrorDirty = 0

// we use these vars for the visualization of gen audio in the local vr client
var audiovizLookup = new Object()
var audiovizIndex = 0
//
var nodes = {}

// this is where the parameter min/max & init-value get stored
var namespace = new Dict("namespace")

var speakerTableDict = new Dict("speakerTableDict");

var graphNodes = {}
function loadbang(){
	
	// things that need to be initiated only after patcher has finished loading
	gen_patcher = this.patcher.getnamed("world").subpatcher();

// 	initiate()
// }
// var initiate = function(){

	
	//! clear the parent patcher of any vr.source~ objects prior to receiving deltas
	this.patcher.apply(function(b) { 
		
		if(b.varname.split('_')[0] === 'source'){
			outlet(4, 'thispatcher', 'script', 'delete', b.varname)
		}
	});
	//! clear the gen~ world patcher prior to receiving deltas
	gen_patcher.apply(function(b) { 
		if(b.varname !== "reserved_audioviz" && b.varname !== "reserved_audioviz_1" && b.varname !== "PLO"){

		gen_patcher.remove(b); 	
		}	
	});


	
	resetCounters()
}

	// get a reference to "thegen"'s embedded gen patcher:


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
// buffer channels for visual feedback
// var bufferChannelCounter = 0;
// var bufferChannelPaths = [];
// use this to store the names of buffers created for visual feedback
// var vizBuffers = new Array();

// gen_patcher = this.patcher.getnamed("world").subpatcher();
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
					// ... and if it is an outlet, keep track of its history property
					if(delta.kind === 'outlet'){
						nodes[delta.path] = {
							history: delta.history
						}
					} else {
						nodes[delta.path] = {}
					}

					
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
									vrSource.varname = "source_" + pathName


									// key groundTruth, value = the same node path in its delta and scenegraph; genContext: number of speakers in scenegraph, correspond to number of out objects scripted into gen~ world with base 1. 
									// the vr.source~ objects instantiated in parent patcher should also have their first arg be the genContext value, but scripting name be the groundTruth value
									speakerTable[vrSource.varname] = {genOutNumber: genOutCounter }  
									// speakerTableDict.setparse(speakerTable)
									// gen~ and max outlets are base 0 (mth), our speaker numbers are base 1 (nth)
									// TODO decide on base 0 or 1 (I advocate for 0, because this also works with array indices) 
									
									outlet(3, 'genConnect', genOutCounter, vrSource.varname)

									// we use outlets below the gen~ world. All vr.Source~ objects script connect into outlets 1 and 2. 
									this.patcher.message("script", "connect", vrSource.varname, 0, 'vrSource2CHMain', 0);
	
									this.patcher.message("script", "connect", vrSource.varname, 1, 'vrSource2CHMain', 1);

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
									attenuvertorName = paramName + '_attenuvertor'
									
									
									paramX = paramCounter * 150
									// generate the setparam which the param will bind to
									var setparam = gen_patcher.newdefault([275, Ycounter * 2, "setparam", setparamName])
									setparam.varname = 'setparam_' + paramName
									gen_patcher.message("script", "connect", setparam.varname, 0, pathName, 0);

									// generate the multiplier to insert between the param and setparam (for knobs-as-inlets)
									var attenuvertor = gen_patcher.newdefault([450, Ycounter * 2, "*"])
									attenuvertor.varname = attenuvertorName
									gen_patcher.message("script", "connect", attenuvertor.varname, 0, setparam.varname, 0);

									// generate the param which the js script will bind to
									var param = gen_patcher.newdefault([600, Ycounter * 1.5, "param", paramName, delta.value])
									param.varname = paramName
									gen_patcher.message("script", "connect", param.varname, 0, attenuvertor.varname, 1);
								
									outlet(1, paramName, delta.range)
									paramCounter++
								
								break;
								
								case 'n_switch':
									pathName = delta.path.split('.')[0]
									paramName = delta.path.replace('.','__')
									setparamName = delta.path.split('.')[1]
									attenuvertorName = paramName + '_attenuvertor'

									
									paramX = paramCounter * 150
									// generate the setparam which the param will bind to
									var setparam = gen_patcher.newdefault([275, Ycounter * 2, "setparam", setparamName])
									setparam.varname = 'setparam_' + paramName
									gen_patcher.message("script", "connect", setparam.varname, 0, pathName, 0);

									// generate the multiplier to insert between the param and setparam (for knobs-as-inlets)
									var attenuvertor = gen_patcher.newdefault([450, Ycounter * 2, "*"])
									attenuvertor.varname = attenuvertorName
									gen_patcher.message("script", "connect", attenuvertor.varname, 0, setparam.varname, 0);
									
									// generate the param which the js script will bind to
									var param = gen_patcher.newdefault([600, Ycounter * 1.5, "param", paramName, delta.value])
									param.varname = paramName
									gen_patcher.message("script", "connect", param.varname, 0, attenuvertor.varname, 1);
								
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
									var newAudiovizPoke = gen_patcher.newdefault([50, 100, 'poke', 'audioviz'])
									newAudiovizPoke.varname = delta.path + '_poke';
									var newAudiovizConstant = gen_patcher.newdefault([50, 50, 'constant', audiovizIndex])
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

				} else {
					// error. received a delnode for a nonexistent node
					post('WARNING: received a delnode for a node that does not exist in the graph\n')

				}
				
			break;

			// create a patchcord!
			case "connect":
				var pathString
				
				
				if(nodes[pathString]){
					// don't add a duplicate
					// if this happens, it means something is wrong with the graph, maybe a delnode wasn't triggered or received, or duplicate deltas received
					post('WARNING: received a connection delta that already exists in the graph. was filtered out, but need to check the delta round-trip\n\n')
				} else {
					pathString = '"' + delta.paths + '"' 
					// add the node to the obj to prevent it being added as a duplicate
					nodes[pathString] = {}

					
					var setOutlet = delta.paths[0].replace('.','__')
					var setInlet = delta.paths[1].replace('.','__')
					var input;
					var output;
					var attenuvertor = null 
					if(delta.kind === 'small_knob' || delta.kind === 'large_knob' ){
						attenuvertor = delta.paths[1].replace('.','__') + '_attenuvertor'
					}

					for (var i = 0; i < inletsTable.length; i++) {
						var inletsIndexes = inletsTable[i]
								input = JSON.stringify(inletsIndexes[setInlet]);
						}
					for (var i = 0; i < outletsTable.length; i++) {
					var outletsIndexes = outletsTable[i]
							output = JSON.stringify(outletsIndexes[setOutlet]);
					}

					

	
					var selfPatch1 = delta.paths[0].split('.')[0]
					var outletPath = delta.paths[0]
					// detect a self-patch connection and insert a history object in between!
					if (delta.paths[0].split('.')[0] === delta.paths[1].split('.')[0]){					
						feedbackConnections++
						var history = gen_patcher.newdefault([150,10, "history"])
						history.varname = "feedback_" + feedbackConnections

						if(attenuvertor !== null){

							// connect the outlet (arc[0]) to the history
							gen_patcher.message("script", "connect", delta.paths[0].split('.')[0], parseInt(output), history.varname, 0);
							// connect the history to the attenuvertor
							gen_patcher.message("script", "connect", history.varname, 0, parseInt(output), attenuvertor, 0);
							// connect the attenuvertor to inlet (arc[1])
							gen_patcher.message("script", "connect", attenuvertor, 0, delta.paths[1].split('.')[0], parseInt(input));
						
						} else {
							gen_patcher.message("script", "connect", delta.paths[0].split('.')[0], parseInt(output), history.varname, 0);
							gen_patcher.message("script", "connect", history.varname, 0, delta.paths[1].split('.')[0], parseInt(input));
						}
					} else if (nodes[outletPath].history === 1 || nodes[outletPath].history === true) {

						feedbackConnections++
						var history = gen_patcher.newdefault([150,10, "history"])
						history.varname = "feedback_" + feedbackConnections

						if(attenuvertor !== null){

							// connect the outlet (arc[0]) to the history
							gen_patcher.message("script", "connect", delta.paths[0].split('.')[0], parseInt(output), history.varname, 0);
							// connect the history to the attenuvertor
							gen_patcher.message("script", "connect", history.varname, 0, parseInt(output), attenuvertor, 0);
							// connect the attenuvertor to inlet (arc[1])
							gen_patcher.message("script", "connect", attenuvertor, 0, delta.paths[1].split('.')[0], parseInt(input));
						
						} else {
							gen_patcher.message("script", "connect", delta.paths[0].split('.')[0], parseInt(output), history.varname, 0);
							gen_patcher.message("script", "connect", history.varname, 0, delta.paths[1].split('.')[0], parseInt(input));
						}
					}
					
					 else{
						// if no self-patch connection exists, just connect them. 
						if(attenuvertor !== null){
							// connect the outlet (arc[0]) to the attenuvertor
							gen_patcher.message("script", "connect", delta.paths[0].split('.')[0], parseInt(output), attenuvertor, 0);
							// connect the attenuvertor to inlet (arc[1])
							gen_patcher.message("script", "connect", attenuvertor, 0, delta.paths[1].split('.')[0], parseInt(input));
						
						} else {
							gen_patcher.message("script", "connect", delta.paths[0].split('.')[0], parseInt(output), delta.paths[1].split('.')[0], parseInt(input));
						}
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
				switch(delta.name) {

					case "value": 
						var param = delta.path
						param = param.replace(".", "__")
						var cleaveParam = param.split('.')[0]
						this.patcher.message("script", "send", "world", cleaveParam, delta.to)

					break;
					
					case "history":	
						nodes[delta.path] = {
							history: delta.history
						}
					break
					case "speakerPos": 
						pathName = delta.path.split('.')[0] 
						var vrSourceTarget = "source_" + pathName
						this.patcher.message("script", "send", vrSourceTarget, "position", delta.to[0], delta.to[1], delta.to[2])
						// whatever
					break;
				}
			break;
			// ETC
		} 
	}
}

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
			loadbang()
		break

        default: post("unknown msg received: ", msg)
		break;
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
			outlet(6, 'audiovizLookup', JSON.stringify(outletViz))
			
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