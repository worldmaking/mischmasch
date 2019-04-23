
inlets = 2
outlets = 5
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



gen_patcher = this.patcher.getnamed("world").subpatcher();

function getVarnames(target){
	gen_patcher.apply(function(b) { 
		// prevent erasing our audio outputs from genpatcher
		if(b.varname !== "dac_right" && b.varname !== "dac_left" && b.varname !== "out_comment"){
			if (b.varname.indexOf(target) != -1){
							post(b.varname)	
							gen_patcher.remove(b); 	

			}
	
		}
		

	});
	
	}
var handleDelta = function(delta) {
				if (counter > 100){
				counter = 1
				}
			

	if (Array.isArray(delta)) {
		for (var i=0; i<delta.length; i++) {
			//post(i, "\n");
			handleDelta(delta[i]);
		}
	} else {
		switch (delta.op){
			// prevent new objects from being srcipted too low on the patcher page (we encountered a bug when objects were written above 1000 on the y axis)

			// create an object!
			case "newnode": 
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
						
						break;
						
						case "operator":
						
						break;
						
						default:
						
						break;	
					}
					
					var newModule = gen_patcher.newdefault([125, counter * 2, kind])
					newModule.varname = delta.path.split('.')[0]

					// if kind is outs, connect its outlets to the out1 and out2 in gen~ world
					
					if (kind === "outs"){
			
						gen_patcher.message("script", "connect", newModule.varname, 0, "dac_left", 0);
						gen_patcher.message("script", "connect", newModule.varname, 1, "dac_right", 0);
					}
					} else {
					
						switch(kind){
							case 'small_knob':
							case 'large_knob':
							case 'tuning_knob':
							case 'slider':
							case 'momentary':
							case 'led':
							//post(kind, delta.path)
						
							nodeName = delta.path.split('.')[0]
							paramName = delta.path.replace('.','__')
							setparamName = delta.path.split('.')[1]
							
							//post(nodeName)
							
							paramX = paramCounter * 150
							// generate the subparam which the param will bind to
							var setparam = gen_patcher.newdefault([275, counter * 2, "setparam", setparamName])
							setparam.varname = 'setparam_' + paramName
							gen_patcher.message("script", "connect", setparam.varname, 0, nodeName, 0);
						
							// generate the param which the js script will bind to
							var param = gen_patcher.newdefault([450, counter * 1.5, "param", paramName, delta.value])
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
														post(kind, nodeName)

							//post(nodeName)
							
							paramX = paramCounter * 150
							// generate the subparam which the param will bind to
							var setparam = gen_patcher.newdefault([275, counter * 2, "setparam", setparamName])
							setparam.varname = 'setparam_' + paramName
							gen_patcher.message("script", "connect", setparam.varname, 0, nodeName, 0);
						
							// generate the param which the js script will bind to
							var param = gen_patcher.newdefault([450, counter * 1.5, "param", paramName, delta.value])
							param.varname = paramName
							gen_patcher.message("script", "connect", param.varname, 0, setparam.varname, 0);
						
							//gen_patcher.message("script", "send", param.varname, paramValue);
							//post('\n\n', delta.value)
							outlet(1, paramName, delta.value, 'n_switch')
							paramCounter++
							break;
							
							case "inlet": 
							post(delta.index)
							object[delta.path.replace('.','__')] = delta.index
							inletsTable.push(object)
							
							
							//post(JSON.stringify(inletsTable))
							case "outlet":
							//post('found ', kind)
							object[delta.path.replace('.','__')] = delta.index
							outletsTable.push(object)
							
							//post(JSON.stringify(outletsTable))
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
			break;
			
			// delete an object
			case "delnode":
				var deleteMe = delta.path.replace('.', '__');
				post('\n',deleteMe,0)
				
				gen_patcher.apply(function(b) { 
					post('\n',b,1)
					// prevent erasing our audio outputs from genpatcher
					if(b.varname !== "dac_right" && b.varname !== "dac_left" && b.varname !== "out_comment"){
						//post('\n',deleteMe,2)
						if (b.varname.indexOf(deleteMe) != -1){
							post('\n',b,3)
							post('\nremoving ',b.varname)	
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
					post(JSON.stringify(inletsTable),JSON.stringify(outletsTable))
					post("script", "connect", delta.paths[0].split('.')[0], parseInt(output), delta.paths[1].split('.')[0], parseInt(input))
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
	counter = 1;
	gen_patcher = this.patcher.getnamed("world").subpatcher();
	gen_patcher.apply(function(b) { 
		// prevent erasing our audio outputs from genpatcher
		if(b.varname !== "dac_right" && b.varname !== "dac_left" && b.varname !== "out_comment"){
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
	outlet(1, ot.cmd)
	cmd = ot.cmd

	switch(cmd){
		case "clear_scene":
			gen_patcher = this.patcher.getnamed("world").subpatcher();

			gen_patcher.apply(function(b) { 
			
				// prevent erasing our audio outputs from genpatcher
				if(b.varname !== "dac_right" && b.varname !== "dac_left" && b.varname !== "out_comment"){
					gen_patcher.remove(b); 		
				}
			});
			
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
				if(b.varname !== "dac_right" && b.varname !== "dac_left"){
					gen_patcher.remove(b); 		
				}
			});
		var patch = new Dict("patch");
		patch.parse(msg);
		
		var scene = ot.value
		outlet(2, 'clear')
	post(scene)
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

		// attach all outs modules to the dac outputs. 
		if (kind === "outs"){
			
			gen_patcher.message("script", "connect", nodeName, 0, "dac_left", 0);
			gen_patcher.message("script", "connect", nodeName, 1, "dac_right", 0);
		
		} else if (kind === "param"){
			// ignore gen operator-based param modules in the next section
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
			
			counter++
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

			var pose = new Dict("pose");
			pose.parse(msg);
		
	

        break;

        default:

        	post("unknown msg received: ", msg)
		break;
    }
	
	// var jsonString = JSON.stringify(jsonObjectFromSomewhere);


//	var cmd = JSON.stringify(msg.cmd)

//	switch (

}



function read(file){
	
	//	gen_patcher = this.patcher.getnamed("world").subpatcher();

	// if no argument is provided to dict then a random/unique name will be assigned
	var x = new Dict('patch');

	// the import_json() and import_yaml() do enforce naming conventions and will only work if the
	// files to be imported end with the standard .json or .yml file suffixes.
	// to read any file, interpreting it as json regardless of suffix, use the readany() method
	x.import_json(file);
	
	// use the stringify() method to get the dictionary (including nested dictionaries) in JSON format
	var xjson = x.stringify();
	
	scene = JSON.parse(xjson)
	outlet(0, 'bang')
	var arcs = JSON.stringify(scene.arcs)
	//post("\n\narcs", arcs)
	var nodes = JSON.stringify(x)
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

		// attach all outs modules to the dac outputs. 
		if (kind === "outs"){
			
			gen_patcher.message("script", "connect", nodeName, 0, "dac_left", 0);
			gen_patcher.message("script", "connect", nodeName, 1, "dac_right", 0);
		
		} else if (kind === "param"){
			// ignore gen operator-based param modules in the next section
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
			
			counter++
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
}
	

