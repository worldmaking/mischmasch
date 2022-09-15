inlets = 3
outlets = 11

// this is where the parameter min/max & init-value get stored
var namespace = new Dict("namespace")

// get a reference to "thegen"'s embedded gen patcher:
genPatcher = this.patcher.getnamed("world").subpatcher();
var varnameCount = 0

var nodeName;
var counter = 1;
var feedbackConnections = 0
var Ycounter;
var newModule;
var genOutCounter = 1
// dictionaries:
var speakerTableDict = new Dict("speakerTableDict");    
// store inlet&outlet indexes per node
var inletsTable = new Array();
var outletsTable = new Array();
//store varnames per node
var varnamesTable = new Array();
var object = {};

var speakerTable = new Array();
var checkspeaker = new Array();


function initiate(){
	post('initializing patcher')
	//! clear the parent patcher of any vr.source~ objects prior to receiving deltas
	this.patcher.apply(function(b) {
		if(b.varname.split('_')[0] === 'source'){
			this.patcher.remove(b)
			// outlet(10, 'thispatcher', 'script', 'delete', b.varname)
		}
	});
	genPatcher = this.patcher.getnamed("world").subpatcher();
	//! clear the gen~ world patcher prior to receiving deltas
	genPatcher.apply(function(b) { 
		genPatcher.remove(b); 		
	});
	resetCounters()
}

initiate()



function resetCounters(){
    counter = 1;
    feedbackConnections = 0
	genOutCounter = 1
	varnameCount = 0

	inletsTable = new Array();
	outletsTable = new Array();
//store varnames per node
	varnamesTable = new Array();
	object = {};

	speakerTable = new Array();
	checkspeaker = new Array();

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
			// create an object!
			case "newnode": 
				if (delta.kind === 'controller1'){
				// post('\n\n',delta.kind)
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
					post('\ncategory:',delta.category)
					post('\n kind:',delta.kind)
					switch(delta.category){	
						case "abstraction": 
							if(kind === "speaker"){
								var speakerName = delta.path.split('.')[0];
								var speakerNumber = speakerName.split('_')[1];	
								// TODO this is one place where we need to deal with the speaker/vr_source lookup table
								var newSpeaker = genPatcher.newdefault([50, posY * 150, 'out', genOutCounter])
								newSpeaker.varname = speakerName;
								// add a vr.Source~ abstraction to parent, script the new out to this abstraction, use delta.pos to provide the vr.source~ position
								var vrSource = this.patcher.newdefault([1420 + (genOutCounter * 100), 570, "vr.source~", genOutCounter - 1, "@position", delta.pos[0], delta.pos[1], delta.pos[2] ])
								vrSource.varname = "source_" + speakerNumber
								// key groundTruth, value = the same node path in its delta and scenegraph; genContext: number of speakers in scenegraph, correspond to number of out objects scripted into gen~ world with base 1. 
								// the vr.source~ objects instantiated in parent patcher should also have their first arg be the genContext value, but scripting name be the groundTruth value
								speakerTable.push({"groundTruth": vrSource.varname, "genContext": genOutCounter})
								// gen~ and max outlets are base 0 (mth), our speaker numbers are base 1 (nth)
								// TODO decide on base 0 or 1 (I advocate for 0, because this also works with array indices) 
								outlet(9, 'genConnect', genOutCounter, speakerNumber)
								// vrSource2CHMain is a 2channel gain slider located just below the gen~ world. All vr.Source~ objects script connect into lef and right. 
								this.patcher.message("script", "connect", "source_" + speakerNumber, 0, 'vrSource2CHMain', 0);
								this.patcher.message("script", "connect", "source_" + speakerNumber, 1, 'vrSource2CHMain', 1);
								genOutCounter++
							} else {
								newModule = genPatcher.newdefault([125, Ycounter * 2, kind])
								newModule.varname = delta.path.split('.')[0]
							}
						break;
						
						case "operator":
								newModule = genPatcher.newdefault([125, Ycounter * 2, kind])
								newModule.varname = delta.path.split('.')[0]
						break;
						
						default:
								newModule = genPatcher.newdefault([125, Ycounter * 2, kind])
								newModule.varname = delta.path.split('.')[0]
						break;	
					}
					if (kind === "speaker"){
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
							var setparam = genPatcher.newdefault([275, Ycounter * 2, "setparam", setparamName])
							setparam.varname = 'setparam_' + paramName
							genPatcher.message("script", "connect", setparam.varname, 0, nodeName, 0);
							// generate the param which the js script will bind to
							var param = genPatcher.newdefault([450, Ycounter * 1.5, "param", paramName, delta.value])
							param.varname = paramName
							genPatcher.message("script", "connect", param.varname, 0, setparam.varname, 0);			
							outlet(1, paramName, delta.range)
							paramCounter++
							break;
							
							case 'n_switch':
							nodeName = delta.path.split('.')[0]
							paramName = delta.path.replace('.','__')
							setparamName = delta.path.split('.')[1]
							paramX = paramCounter * 150
							// generate the subparam which the param will bind to
							var setparam = genPatcher.newdefault([275, Ycounter * 2, "setparam", setparamName])
							setparam.varname = 'setparam_' + paramName
							genPatcher.message("script", "connect", setparam.varname, 0, nodeName, 0);						
							// generate the param which the js script will bind to
							var param = genPatcher.newdefault([450, Ycounter * 1.5, "param", paramName, delta.value])
							param.varname = paramName
							genPatcher.message("script", "connect", param.varname, 0, setparam.varname, 0);
							outlet(1, paramName, delta.value, 'n_switch')
							paramCounter++
							break;
							
							case "inlet": 
							object[delta.path.replace('.','__')] = delta.index
                            inletsTable.push(object)
                            break;

							case "outlet":
							object[delta.path.replace('.','__')] = delta.index
							outletsTable.push(object)	
							break;
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
					break;
			
			// delete a node
			case "delnode":
				var deleteMe = delta.path.replace('.', '__');
				if(delta.path.split('_')[0] === 'speaker'){
					var thisVarname = 'source_' + delta.path.split('_')[1]
					outlet(10, 'thispatcher', 'script', 'delete', thisVarname)
				}
				genPatcher.apply(function(b) { 
                    // compare delnode against all nodes, only delete it
                    if (b.varname.indexOf(deleteMe) != -1){
                        genPatcher.remove(b); 				
                    }			
				});

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
					var history = genPatcher.newdefault([150,10, "history"])
					history.varname = "feedback_" + feedbackConnections
					//post('connect')
					genPatcher.message("script", "connect", delta.paths[0].split('.')[0], parseInt(output), history.varname, 0);
					genPatcher.message("script", "connect", history.varname, 0, delta.paths[1].split('.')[0], parseInt(input));

				} else {
					// if no self-patch connection exists, just connect them. 
					genPatcher.message("script", "connect", delta.paths[0].split('.')[0], parseInt(output), delta.paths[1].split('.')[0], parseInt(input));
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
				genPatcher.message("script", "disconnect", delta.paths[0].split('.')[0], parseInt(output), delta.paths[1].split('.')[0], parseInt(input));
			break;
			
			// modify a parameter
			case "propchange": 
				// special case name == pos, name == orient, name == value
				switch(delta.name) {
					case "value": 
						var param = delta.path
						param = param.replace(".", "__")
						
						
						var cleaveParam = param.split('.')[0]
						outlet(3, cleaveParam, delta.to)
						// handle knob twiddle
						// send to appropriate param
						// based on delta.path and delta.to (new value)
					break;
					
					case "pos": 
						// eventually pipe to vr.context~
					break;
				}
			break;
			// ETC
		} 
	}
}

function toScripting(msg){
	
	var ot = JSON.parse(msg)
	
	
	cmd = ot.cmd
	if (cmd != 'clear_scene'){	
		// outlet(1, ot.cmd)
		outlet(0, 'clear_scene')
		// vizBuffers.length = 0;
	}


	switch(cmd){

		case "clear_scene":
			outlet(0, 'clear_scene')
			for (i = 0; i < speakerTable.length; i++){
				outlet(8, 'script', 'delete', speakerTable[i])

			}
			// vizBuffers = new Array()
			// bufferChannelCounter = 0;
			// bufferChannelPaths = [];
			speakerNumber = 1
			speakerTable.length = 0
			genPatcher = this.patcher.getnamed("world").subpatcher();
			//bufferStorage = this.patcher.getnamed("bufferStorage").subpatcher();

			genPatcher.apply(function(b) { 
			
				// prevent erasing our audio outputs from genpatcher
				if(b.varname !== "PLO"){
					genPatcher.remove(b); 		
				}
			});


			// bufferStorage.apply(function(b) { 
			
			// 		genPatcher.remove(b); 		
				
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

			
			handleDelta(ot.data);
		} break;
			

		case "patch":
	
			counter = 1;
			genPatcher = this.patcher.getnamed("world").subpatcher();

			genPatcher.apply(function(b) { 
			
			// prevent erasing our audio outputs from genpatcher
				if(b.varname !== "visualFeedbackBuffer" && b.varname !== "bufferChannels" && b.varname !== "PLO"){
					genPatcher.remove(b); 		
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
			var newModule = genPatcher.newdefault([(pos[0] + counter) * 100, (pos[1] + counter) * 50, op])
			newModule.varname = nodeName
			break;
			
			case "param":
			var args = _props.args
			param = kind.split("_")[0]
			var objSettings = [(pos[0] + counter) * 100, (pos[1] + counter) * 50, param ]
			var paramSettings = args
			var newParam = objSettings.concat(paramSettings);
			var newModule = genPatcher.newdefault(newParam)
			newModule.varname = nodeName
			break;
	
			default:			
			var newModule = genPatcher.newdefault([(pos[0] + counter) * 100, (pos[1] + counter) * 50, "gen", "@gen", kind])
			newModule.varname = nodeName
			break;
		}

        if (kind === "param"){
			// ignore gen operator-based param modules in the next section
			} else if(kind === "controller1" || kind === "controller_1" || kind === "headset"){
					paramX = paramCounter * 150
					// generate the subparam which the param will bind to
					var setparam = genPatcher.newdefault([(pos[0] + counter) * 100 + paramX, (pos[1] + counter) * 50 - 25, "setparam", key])
					setparam.varname = nodeName + "_setparam_" + key
					genPatcher.message("script", "connect", setparam.varname, 0, nodeName, 0);
				
					// generate the param which the js script will bind to
					var param = genPatcher.newdefault([(pos[0] + counter) * 100 + paramX, (pos[1] + counter) * 50 - 50, "param", kind + "__" + key])
					param.varname = nodeName + "_param_" + key
					genPatcher.message("script", "connect", param.varname, 0, setparam.varname, 0);
				
					//genPatcher.message("script", "send", param.varname, paramValue);
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
					var setparam = genPatcher.newdefault([(pos[0] + counter) * 100 + paramX, (pos[1] + counter) * 50 - 25, "setparam", key])
					setparam.varname = nodeName + "_setparam_" + key
					genPatcher.message("script", "connect", setparam.varname, 0, nodeName, 0);
				
					// generate the param which the js script will bind to
					var param = genPatcher.newdefault([(pos[0] + counter) * 100 + paramX, (pos[1] + counter) * 50 - 50, "param", nodeName + "__" + key])
					param.varname = nodeName + "_param_" + key
					genPatcher.message("script", "connect", param.varname, 0, setparam.varname, 0);
				
					//genPatcher.message("script", "send", param.varname, paramValue);
					// outlet(1, nodeName + "__" + key, paramValue)
					paramCounter++
					break;	
					}
				index = JSON.stringify(unit[key]._props.index)
                // TODO: what are these for?
				UI_obj[key] = [UI,index]
				object[nodeName] = UI_obj;
				}
			})
		}
	})
	for (i = 0; i < scene.arcs.length; ++i) {
		
		var sourceOp1 = scene.arcs[i][0].split(".")
		opName1 = sourceOp1[0]
		opUI1 = sourceOp1[1]
		var sourceOp2 = scene.arcs[i][1].split(".")
		opName2 = sourceOp2[0]
		opUI2 = sourceOp2[1]

		var lookup1 = scene.nodes[opName1]
		var lookup2 = scene.nodes[opName2]
		if(lookup1 !== undefined && lookup2 !== undefined){
			var index1 = parseInt(JSON.stringify(lookup1[opUI1]._props.index, 10))
			var index2 = parseInt(JSON.stringify(lookup2[opUI2]._props.index, 10))	
			// if a feedback connection is made, add a history object!
			if(opName1 === opName2){
				feedbackConnections++
				var history = genPatcher.newdefault([20,20, "history"])
				history.varname = "feedback_" + feedbackConnections
				genPatcher.message("script", "connect", opName1, index1, history.varname, 0);
				genPatcher.message("script", "connect", history.varname, 0, opName2, index2);
			} else {
				genPatcher.message("script", "connect", opName1, index1, opName2, index2);
			}
		}
	}

        break;
		/*
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
					
			var controller_1 = data.pose.controller_1
							// c1 pos data
				outlet(1, "controller_1__pos_x", data.pose.controller_1.pos.x)
				outlet(1, "controller_1__pos_y", data.pose.controller_1.pos.y)
				outlet(1, "controller_1__pos_z", data.pose.controller_1.pos.z)
				// c1 orient data
				outlet(1, "controller_1__orient_x", data.pose.controller_1.orient.x)
				outlet(1, "controller_1__orient_y", data.pose.controller_1.orient.y)
				outlet(1, "controller_1__orient_z", data.pose.controller_1.orient.z)
				outlet(1, "controller_1__orient_w", data.pose.controller_1.orient.w)


		break;
		*/

        default:
        	post("unknown msg received: ", msg)
		break;
    }
}


