
inlets = 3
outlets = 9
	// get a reference to "thegen"'s embedded gen patcher:
var varnameCount = 0

// store inlet&outlet indexes per node
var inletsTable = new Array();
var outletsTable = new Array();

//store varnames per node
var varnamesTable = new Array();

var object = {};
var nodeName;
var counter = 1;
var feedbackConnections = 0
var checkspeaker = new Array();
var Ycounter;
var newModule;
var speakerTable = []
var genOutCounter = 1
// contain all the buffers
var pb = new PolyBuffer('world_polybuffer');       // PolyBuffer instantiates a polybuffer~ object named by second argument to js  

// buffer channels for visual feedback
var bufferChannelCounter = 0;
var bufferChannelPaths = [];
// use this to store the names of buffers created for visual feedback
var vizBuffers = new Array();

gen_patcher = this.patcher.getnamed("world").subpatcher();
bufferStorage = this.patcher.getnamed("bufferStorage").subpatcher();
function ensurespeaker(){
	var hasspeaker = 0;
	gen_patcher.apply(function(b) { 
		scriptname = b.varname.indexOf('speaker_')
		if(scriptname > -1){
		hasspeaker = 1
		
		}
	})
	// always keep an speaker module in the scene
	if (hasspeaker === 0){
		// spawn an speaker module
		//outlet(5, 'ensurespeaker')
		}	
	}
function getVarnames(target){
	gen_patcher.apply(function(b) { 
		// prevent erasing our audio outputs from genpatcher
		if(b.varname !== "visualFeedbackBuffer" && b.varname !== "bufferChannels" && b.varname !== "PLO"){
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
				if (delta.kind === 'controller1'){
				post('\n\n',delta.kind)
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
					
					switch(delta.category){
						
						case "abstraction": 
							if(kind === "speaker"){


								var speakerName = delta.path.split('.')[0];
								var speakerNumber = speakerName.split('_')[1];
								
								post("Speaker Name: ", speakerName)
								post("Speaker Number: ", speakerNumber)
								var newSpeaker = gen_patcher.newdefault([50, posY * 150, 'out', speakerNumber])
								newSpeaker.varname = speakerName;

		
		
								//need to get its position in vr and apply that to a vr.source~ position
		
								
								// if kind is speaker, connect its outlets to the out1 and out2 in gen~ world
								//newSpeaker = gen_patcher.newdefault([20, Ycounter * 10, 'out', speakerNumber])
								
								post('\n\n', newSpeaker.varname)
								
								// add a vr.Source~ abstraction to parent, script the new out to this abstraction, use delta.pos to provide the vr.source~ position
								var vrSource = this.patcher.newdefault([940 + (speakerNumber * 100), 1650, "vr.source~", genOutCounter - 1, "@position", delta.pos[0], delta.pos[1], delta.pos[2] ])
								vrSource.varname = "source_" + genOutCounter


								// key groundTruth, value = the same node path in its delta and scenegraph; genContext: number of speakers in scenegraph, correspond to number of out objects scripted into gen~ world with base 1. 
								// the vr.source~ objects instantiated in parent patcher should also have their first arg be the genContext value, but scripting name be the groundTruth value
								speakerTable.push({"groundTruth": vrSource.varname, "genContext": genOutCounter})

								// gen~ and max outlets are base 0 (mth), our speaker numbers are base 1 (nth)
								// TODO decide on base 0 or 1 (I advocate for 0, because this also works with array indices) 
								
								post("script", "connect", 'world', speakerNumber,  "source_" + speakerNumber, 0)								
								post('\n\nvarname', vrSource.varname, '\n')
								this.patcher.message("script", "connect", 'world', speakerNumber,  "source_" + speakerNumber, 0);

								// vrSource2CHMain is a 2channel gain slider located just below the gen~ world. All vr.Source~ objects script connect into lef and right. 
								this.patcher.message("script", "connect", "source_" + speakerNumber, 0, 'vrSource2CHMain', 0);
 
								this.patcher.message("script", "connect", "source_" + speakerNumber, 1, 'vrSource2CHMain', 1);
								
							} else {
								newModule = gen_patcher.newdefault([125, Ycounter * 2, kind])
								newModule.varname = delta.path.split('.')[0]
								post(newModule.varname)

							}

						break;
						
						case "operator":
								newModule = gen_patcher.newdefault([125, Ycounter * 2, kind])
								newModule.varname = delta.path.split('.')[0]
								post(newModule.varname)
						break;
						
						default:
								newModule = gen_patcher.newdefault([125, Ycounter * 2, kind])
								newModule.varname = delta.path.split('.')[0]
								post(newModule.varname)
						break;	
					}
					


					
					if (kind === "speaker"){
						// create the speaker aka gen [out #]
						// var newSpeaker = gen_patcher.newdefault([(pos[0] + counter), (pos[1] + counter) * 150, 'out', speakerNumber])
						// newSpeaker.varname = 'speaker_' + speakerNumber
						// add a vr.Source~ abstraction to parent, script the new out to this abstraction. 
						// var vrSource = this.patcher.newdefault([(pos[0] + counter), (pos[1] + counter) * 150, "vr.source~", speakerNumber - 1, "@varname", "source_" + speakerNumber])
						
						// this.patcher.message("script", "connect", 'world',  "speaker_" + speakerNumber - 1,  "source_" + speakerNumber, 0);


						// // need to get its position in vr and apply that to a vr.source~ position

						// speakerNumber++
						}
					} else {
					
						switch(kind){
							case 'small_knob':
							case 'large_knob':
							case 'tuning_knob':
							case 'slider':
							case 'momentary':
							case 'led':
						
							nodeName = delta.path.split('.')[0]
							paramName = delta.path.replace('.','__')
							setparamName = delta.path.split('.')[1]
							
							
							paramX = paramCounter * 150
							// generate the subparam which the param will bind to
							var setparam = gen_patcher.newdefault([275, Ycounter * 2, "setparam", setparamName])
							setparam.varname = 'setparam_' + paramName
							gen_patcher.message("script", "connect", setparam.varname, 0, nodeName, 0);
						
							// generate the param which the js script will bind to
							var param = gen_patcher.newdefault([450, Ycounter * 1.5, "param", paramName, delta.value])
							param.varname = paramName
							gen_patcher.message("script", "connect", param.varname, 0, setparam.varname, 0);
						
							//gen_patcher.message("script", "send", param.varname, paramValue);
							//post('\n\n', delta.value)
							outlet(1, paramName, delta.value, delta.range)
							paramCounter++
							
							break;
							
							case 'n_switch':
							nodeName = delta.path.split('.')[0]
							paramName = delta.path.replace('.','__')
							setparamName = delta.path.split('.')[1]

							//post(nodeName)
							
							paramX = paramCounter * 150
							// generate the subparam which the param will bind to
							var setparam = gen_patcher.newdefault([275, Ycounter * 2, "setparam", setparamName])
							setparam.varname = 'setparam_' + paramName
							gen_patcher.message("script", "connect", setparam.varname, 0, nodeName, 0);
						
							// generate the param which the js script will bind to
							var param = gen_patcher.newdefault([450, Ycounter * 1.5, "param", paramName, delta.value])
							param.varname = paramName
							gen_patcher.message("script", "connect", param.varname, 0, setparam.varname, 0);
						
							//gen_patcher.message("script", "send", param.varname, paramValue);
							//post('\n\n', delta.value)
							outlet(1, paramName, delta.value, 'n_switch')
							paramCounter++
							break;
							
							case "inlet": 
							object[delta.path.replace('.','__')] = delta.index
							inletsTable.push(object)
							
							
							//post(JSON.stringify(inletsTable))
							case "outlet":
								var buf = null;
							//post('found ', kind)
							object[delta.path.replace('.','__')] = delta.index
							outletsTable.push(object)	
							//outlet(0, outletsTable)

							// pipe all outlets to buffer for visual feedback:
							// first make sure that the  outlet has an index, and is not an inlet (sometimes this occurs...)
							if (index && kind !== 'inlet' && kind !== 'controller1' && kind !== 'controller2' && kind !== 'headset'){
								// TODO Al, I've commented out the bufferStorage code because we're not yet using visual feedback in the world

								/* buf = delta.path.replace('.','__') + '_buffer'
								// create a buffer for each outlet
								vizBuffers[buf] = new Buffer(buf)
								//post(buf)
								vizBuffers.push(buf)	
												

								
								//post(index)
								var addPoke = gen_patcher.newdefault([575, Ycounter * 2, "poke", buf])
								addPoke.varname = 'poke_' + bufferChannelCounter
								//post("\n", newModule.varname, index, addPoke.varname, kind)
								bufferChannelPaths.push(delta.path)	
								
								var addBuffer = gen_patcher.newdefault([875, Ycounter * 4, "buffer", buf])	
								var addBufferToParent = bufferStorage.newdefault([50, Ycounter * 4, "buffer~", buf, 10, 1])	
								addBufferToParent.varname = buf + '_varname'
								addBuffer.varname = buf + '_varname'
								// addConstant.varname = 'constant_' + bufferChannelCounter
								// gen_patcher.message("script", "connect", addConstant.varname, 0, addPoke.varname, 2);
								gen_patcher.message("script","connect", newModule.varname, parseInt(index), addPoke.varname, 0)
					
								//post(JSON.stringify(outletsTable))
								// based on the running channel counter, add +1 and then add the delta.index



								bufferChannelCounter++
								*/
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
								//	post(kind, delta.path,"\n")

								//	post(Object.keys(delta),"\n")

						for (var k in delta){
							if (delta.hasOwnProperty(k)) {
								//post("\n\n",k, delta[k])
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
					
					outlet(0, bufferChannelPaths)
			break;
			
			// delete an object
			case "delnode":
				var deleteMe = delta.path.replace('.', '__');
				
				gen_patcher.apply(function(b) { 
					// prevent erasing our audio outputs from genpatcher
					if(b.varname !== "visualFeedbackBuffer" && b.varname !== "bufferChannels" && b.varname !== "PLO"){
						//post('\n',deleteMe,2)
						if (b.varname.indexOf(deleteMe) != -1){
	
							gen_patcher.remove(b); 				
						}
					}
				});
				/*
				var deleteSetParam = 'setparam_' + deleted
				post('\n',deleteSetParam, '\n',deleted)
				gen_patcher.message("script", "delete", deleted)
				gen_patcher.message("script", "delete", deleteSetParam)*/
			break;

			// create a patchcord!
			case "connect": 
				
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
					//post('connect')
					gen_patcher.message("script", "connect", delta.paths[0].split('.')[0], parseInt(output), history.varname, 0);
					gen_patcher.message("script", "connect", history.varname, 0, delta.paths[1].split('.')[0], parseInt(input));

				} else {
					// if not self-patch connection exists, just connect them. 
					gen_patcher.message("script", "connect", delta.paths[0].split('.')[0], parseInt(output), delta.paths[1].split('.')[0], parseInt(input));
				}
			break;

			case "disconnect":
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
			break;
			
			// modify a parameter
			case "propchange": 
				// special case name == pos, name == orient, name == value
				switch(delta.name) {
					case "value": 
						var param = delta.path
						param = param.replace(".", "__")
						outlet(3, delta.to, param)
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


function client(msg){
	
	//post(msg)
	var ot = JSON.parse(msg)
	
	
	cmd = ot.cmd
	if (cmd != 'clear_scene'){	
		outlet(1, ot.cmd)
		outlet(0, 'clear_scene')
		vizBuffers.length = 0;
	}


	switch(cmd){

		case "clear_scene":
			outlet(0, 'clear_scene')
			for (i = 0; i < speakerTable.length; i++){
				outlet(8, 'script', 'delete', speakerTable[i])

			}
			vizBuffers = new Array()
			bufferChannelCounter = 0;
			bufferChannelPaths = [];
			speakerNumber = 1
			speakerTable.length = 0
			gen_patcher = this.patcher.getnamed("world").subpatcher();
			//bufferStorage = this.patcher.getnamed("bufferStorage").subpatcher();

			gen_patcher.apply(function(b) { 
			
				// prevent erasing our audio outputs from genpatcher
				if(b.varname !== "PLO"){
					gen_patcher.remove(b); 		
				}
			});


			// bufferStorage.apply(function(b) { 
			
			// 		gen_patcher.remove(b); 		
				
			// });
			
			inletsTable = [];
			outletsTable = [];

			//store varnames per node
			varnamesTable = [];
			

			object = {};
			nodeName;
			counter = 1;
			feedbackConnections = 0	
			outlet(2, 'clear')

		break;
		case "deltas": {
		counter++;

			//var delta = new Dict("delta");
			//delta.parse(msg);

		//	post("msg data", ot.data, "\n")
			
			handleDelta(ot.data);
		} break;
			

		case "patch":
	
			counter = 1;
			gen_patcher = this.patcher.getnamed("world").subpatcher();

			gen_patcher.apply(function(b) { 
			
			// prevent erasing our audio outputs from genpatcher
				if(b.varname !== "visualFeedbackBuffer" && b.varname !== "bufferChannels" && b.varname !== "PLO"){
					gen_patcher.remove(b); 		
				}
			});
		var patch = new Dict("patch");
		patch.parse(msg);
		
		var scene = ot.value
		outlet(2, 'clear')
	var arcs = JSON.stringify(scene.arcs)
	//post("\n\narcs", arcs)
	var nodes = JSON.stringify(scene.nodes)
	//post("\n\nnodes", nodes)
	var varnames = new Array()
	//post(arcs.length,"\n\n")
	//var a = ["a", "b", "c"];
	
	
	Object.keys(scene.nodes).forEach(function(key) {
		
	
		varnameCount++
		paramCounter = 0;
		nodeName = key;
		var _props = scene.nodes[key]._props 
		var kind = _props.kind
		var pos = _props.pos								
		var unit = scene.nodes[key]
		var gen = JSON.stringify(unit._props.kind)		
		var checkOp = gen.split(' ')[0];
		var genType = kind.split("_")[0]
			
		// switch between gen operators, params, and @gen abstractions (eveything else)
		switch (genType){
			
			case "op":
			op = kind.split("_")[1]
			var newModule = gen_patcher.newdefault([(pos[0] + counter) * 100, (pos[1] + counter) * 50, op])
			newModule.varname = nodeName
			break;
			
			case "param":
			var args = _props.args
			param = kind.split("_")[0]
			var objSettings = [(pos[0] + counter) * 100, (pos[1] + counter) * 50, param ]
			var paramSettings = args
			var newParam = objSettings.concat(paramSettings);
			var newModule = gen_patcher.newdefault(newParam)
			newModule.varname = nodeName
			break;
	
			default:			
			var newModule = gen_patcher.newdefault([(pos[0] + counter) * 100, (pos[1] + counter) * 50, "gen", "@gen", kind])
			newModule.varname = nodeName
			break;
		}

		// create a new outlet in gen~ world for each added speaker
		if (kind === "speaker"){
						// create the speaker aka gen [out #]
						var newSpeaker = gen_patcher.newdefault([(pos[0] + counter), (pos[1] + counter) * 150, 'out', speakerNumber])
						newSpeaker.varname = 'speaker_' + speakerNumber
						// add a vr.Source~ abstraction to parent, script the new out to this abstraction. 
						var vrSource = this.patcher.newdefault([(pos[0] + counter), (pos[1] + counter) * 150, "vr.source~", speakerNumber - 1, "@varname", "source_" + speakerNumber])
						
						this.patcher.message("script", "connect", 'world',  "speaker_" + speakerNumber - 1,  "source_" + speakerNumber, 0);


						// need to get its position in vr and apply that to a vr.source~ position

						speakerNumber++
		} else if (kind === "param"){
			// ignore gen operator-based param modules in the next section
			} else if(kind === "controller1" || kind === "controller2" || kind === "headset"){
				post('caught ' + kind)
					paramX = paramCounter * 150
					// generate the subparam which the param will bind to
					var setparam = gen_patcher.newdefault([(pos[0] + counter) * 100 + paramX, (pos[1] + counter) * 50 - 25, "setparam", key])
					setparam.varname = nodeName + "_setparam_" + key
					gen_patcher.message("script", "connect", setparam.varname, 0, nodeName, 0);
				
					// generate the param which the js script will bind to
					var param = gen_patcher.newdefault([(pos[0] + counter) * 100 + paramX, (pos[1] + counter) * 50 - 50, "param", kind + "__" + key])
					param.varname = nodeName + "_param_" + key
					gen_patcher.message("script", "connect", param.varname, 0, setparam.varname, 0);
				
					//gen_patcher.message("script", "send", param.varname, paramValue);
					//outlet(1, kind + "__" + key, paramValue)
					paramCounter++
			} else {
		
		// get all the inlets and outlets (and eventually the UI params)
		Object.keys(unit).forEach(function(key) {
			var UI_obj = {}	
			if(JSON.stringify(unit[key]._props) !== undefined){
				UI = JSON.stringify(unit[key]._props.kind)
				paramValue = parseFloat(JSON.stringify(unit[key]._props.value, 10))
				// generate the param and subparam for each object
				switch(UI){
					case '"small_knob"':
					case '"large_knob"':
					case '"tuning_knob"':
					case '"slider"':
					case '"momentary"':
					case '"n_switch"':
					case '"led"':
				
					paramX = paramCounter * 150
					// generate the subparam which the param will bind to
					var setparam = gen_patcher.newdefault([(pos[0] + counter) * 100 + paramX, (pos[1] + counter) * 50 - 25, "setparam", key])
					setparam.varname = nodeName + "_setparam_" + key
					gen_patcher.message("script", "connect", setparam.varname, 0, nodeName, 0);
				
					// generate the param which the js script will bind to
					var param = gen_patcher.newdefault([(pos[0] + counter) * 100 + paramX, (pos[1] + counter) * 50 - 50, "param", nodeName + "__" + key])
					param.varname = nodeName + "_param_" + key
					gen_patcher.message("script", "connect", param.varname, 0, setparam.varname, 0);
				
					//gen_patcher.message("script", "send", param.varname, paramValue);
					outlet(1, nodeName + "__" + key, paramValue)
					paramCounter++
					break;	
					}
				index = JSON.stringify(unit[key]._props.index)
	
				UI_obj[key] = [UI,index]
	
				object[nodeName] = UI_obj;

				}
			})
			
			//counter++
		}
	})
	//post(JSON.stringify(object))
	for (i = 0; i < scene.arcs.length; ++i) {
		
		var sourceOp1 = scene.arcs[i][0].split(".")
		opName1 = sourceOp1[0]
		opUI1 = sourceOp1[1]
		var sourceOp2 = scene.arcs[i][1].split(".")
		opName2 = sourceOp2[0]
		opUI2 = sourceOp2[1]
	
		//post("\n",sourceOp1, sourceOp2)

		var lookup1 = scene.nodes[opName1]
		var lookup2 = scene.nodes[opName2]
		//post(lookup2)
		

		//	post(opName, opUI, JSON.stringify(lookup[opUI]._props.index))
		if(lookup1 !== undefined && lookup2 !== undefined){
			//post("\n",JSON.stringify(lookup1), JSON.stringify(lookup2))
			var index1 = parseInt(JSON.stringify(lookup1[opUI1]._props.index, 10))
			var index2 = parseInt(JSON.stringify(lookup2[opUI2]._props.index, 10))
		
			//post(opName1, index1, opName2, index2)
		
			// if a feedback connection is made, add a history object!
			if(opName1 === opName2){
				feedbackConnections++
				var history = gen_patcher.newdefault([20,20, "history"])
				history.varname = "feedback_" + feedbackConnections
				gen_patcher.message("script", "connect", opName1, index1, history.varname, 0);
				gen_patcher.message("script", "connect", history.varname, 0, opName2, index2);
			} else {
				gen_patcher.message("script", "connect", opName1, index1, opName2, index2);
			}
		}
	}

        break;

        case "user_pose":

			//var pose = new Dict("pose");
			//pose.parse(msg);
			
			var data = JSON.parse(msg)
			var pose = data.pose
			
			// IMPORTANT: we eventually will need to filter controller data by who is using it (aka the data.pose.id). 
			var id = data.pose.id
			// TODO: filter remaining data based on ID, and add something to the VR space that allows for switching the gestural data source
			// TODO: when connecting a cable from a gestural module to a given inlet/knob, need to grab the range of the inlet/knob and insert a scale object between the cable. 
			var headPosition // do this later
			
			// Headset
			var headData; 
			
			// Controllers
			var controller1 = data.pose.controller1
				// c1 pos data
				outlet(1, "controller1__pos_x", data.pose.controller1.pos.x)
				outlet(1, "controller1__pos_y", data.pose.controller1.pos.y)
				outlet(1, "controller1__pos_z", data.pose.controller1.pos.z)
				// c1 orient data
				outlet(1, "controller1__orient_x", data.pose.controller1.orient.x)
				outlet(1, "controller1__orient_y", data.pose.controller1.orient.y)
				outlet(1, "controller1__orient_z", data.pose.controller1.orient.z)
				outlet(1, "controller1__orient_w", data.pose.controller1.orient.w)
					
			var controller2 = data.pose.controller2
							// c1 pos data
				outlet(1, "controller2__pos_x", data.pose.controller2.pos.x)
				outlet(1, "controller2__pos_y", data.pose.controller2.pos.y)
				outlet(1, "controller2__pos_z", data.pose.controller2.pos.z)
				// c1 orient data
				outlet(1, "controller2__orient_x", data.pose.controller2.orient.x)
				outlet(1, "controller2__orient_y", data.pose.controller2.orient.y)
				outlet(1, "controller2__orient_z", data.pose.controller2.orient.z)
				outlet(1, "controller2__orient_w", data.pose.controller2.orient.w)


        break;

        default:

        	post("unknown msg received: ", msg)
		break;
    }
	
	// var jsonString = JSON.stringify(jsonObjectFromSomewhere);


//	var cmd = JSON.stringify(msg.cmd)

//	switch (

}


function getBuffers(){
	post('\n',vizBuffers)
}

// this bootstraps an issue where the .peek function wouldn't reference a buffer name created in a different function scope (despite the name being stored globally)
var bucket = new Buffer("bucket")

function visualize(sampleRate, resolution){
	opPath = null
	opValue = null
	vizArray = new Array();
	vizObj = new Object();
	// loop through all buffers in the gen world~
	for (i = 0; i < vizBuffers.length; i++){
		// get the buffer name
		opPath = vizBuffers[i]
		// fill the bucket with the named buffer's contents
		bucket.send('duplicate', opPath)
		// get the amplitude value at index 0
		opValue = bucket.peek(i, 0)
		// and it to the array
		// vizArray.push(opPath, opValue)
		// package it in an object
		opPath = opPath.split('_buffer')[0]
		vizObj[opPath] = opValue
		}
		// let thisViz = JSON.stringify({
		// 	cmd: 'maxClientViz',
		// 	data: vizObj,
		// 	date: Date.now()
		// })

		
		outlet(0,'vizData',JSON.stringify(vizObj))
		// outlet(',JSON.stringify(vizObj))
}



// this one is a bit different: this is for sending buffer data points to 
// a buffer object instantiated within the VR space
function transmitBuffer(sampleRate, resolution){
	// fill the bucket with the named buffer

	// delta.path.replace('.','__')
	opPath = null
	opValue = null
	vizArray = new Array();
	//post('\n')
		//channels = buf.channelcount()
		//post(vizBuffers.length)

	for (i = 0; i < vizBuffers.length; i++){
		


	// 	//post(vizBuffers[i])
	// 	channel = i+1
		opPath = vizBuffers[i]
		bucket.send('duplicate', opPath)
	// 	post(opPath)
		opValue = bucket.peek(i, 0)
	// 	post('\n',i, opPath, opValue)
		vizArray.push(opPath, opValue)
		}
	// 	//post(JSON.stringify(vizArray))
		var newBuffer = JSON.stringify({
		length: buf.length(),
		samples: buf.framecount(),
		channels: buf.channelcount(),
		buffer: vizArray,
		sampleRate: sampleRate,
		resolution: resolution
		})
		post('\n',newBuffer)
	}

// function bang2()
// {
// 		//outlet(4, JSON.parse(buf))
// 	var newBuffer = JSON.stringify({
// 		length: buf.length(),
// 		samples: buf.framecount(),
// 		channels: buf.channelcount(),
// 		buffer: array,
// 		sampleRate: 44100,
// 		resolution: 100
// 		})
		

// 	outlet(4, newBuffer)

// 	outlet(3, buf.length());
// 	outlet(2, buf.framecount());
// 	outlet(1, buf.channelcount());
// }
// 	array = new Array;
	
	
// function toArray(index){
// 	array.push(buf.peek(1, index))
// }
// function msg_int(index)
// {
// 	outlet(0, buf.peek(1, index));
// }


// function list(index, count)
// {
// 	var samples = buf.peek(1, index, count);
// 	post(samples);
// 	post();
// }


// make an array of zeroes, set the buffer content to that
// only clears the first channel
// function clear()
// {
// 	var samples = new Array;
// 	outlet(4, samples)
// 	var frames = buf.framecount();

// 	for (var i=0; i<frames; i++)
// 		samples[i] = 0.0;

// 	buf.poke(1, 0, samples);
// }


// // can also just change a single sample
// function dont_poke_the_bear(channel, index, value)
// {
// 	buf.poke(channel, index, value);
// }


// // send a message directly to the associated buffer~ object
// function sinc()
// {
//     buf.send("fill", "sinc", 20, 1);
// }
