
inlets = 2
outlets = 4
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

var handleDelta = function(delta) {

	if (Array.isArray(delta)) {
		for (var i=0; i<delta.length; i++) {
			post(i, "\n");
			handleDelta(delta[i]);
		}
	} else {
		switch (delta.op){
			
			// create an object!
			case "newnode": {
				// individual delta to handle:
				counter++;
				paramCounter = 0;
				
				var kind = delta.kind
				var posX = 10
				var posY = 10
				if (delta.pos) {

				
					posX = (delta.pos[0] + 3)
					posY = (delta.pos[1] + 3) 
				} else {
						// TEMP HACK!!!!
					// so we can ignore UI objects that we don't need to patcher script at this point
					// NEED TO FIX

					// handle "inlet", "outlet", and "small_knob" etc here
					// you need to cache them somehwere, even though they don't exist as objects in a patcher
					// so we can know how to connect to them or change their values
					
					
					switch(kind){
						case '"small_knob"':
						case '"large_knob"':
						case '"tuning_knob"':
						case '"slider"':
						case '"momentary"':
						case '"n_switch"':
						case '"led"':
					
						var nodeName = delta.path.replace(".", "__")
						post("test", nodeName)
						paramX = paramCounter * 150
						// generate the subparam which the param will bind to
						var setparam = gen_patcher.newdefault([(counter) * 100, (pos[1] + counter) * 50 - 25, "setparam", key])
						setparam.varname = nodeName + "_setparam_" + key
						gen_patcher.message("script", "connect", setparam.varname, 0, kind + "_" + delta.path, 0);
					
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
				
				
				
									post(kind, delta.path,"\n")

									post(Object.keys(delta),"\n")
									
									for (var k in delta){
    									if (delta.hasOwnProperty(k)) {
         									post("Key is " + k + ", value is" + delta[k]);
    									}
									}
					/*var args = _props.args
					param = kind.split("_")[0]
					var objSettings = [(pos[0] + counter) * 100, (pos[1] + counter) * 50, param ]
					var paramSettings = args
					var newParam = objSettings.concat(paramSettings);
					var newModule = gen_patcher.newdefault(newParam)
					newModule.varname = nodeName
*/
					return;

				}
				var newModule = gen_patcher.newdefault([(posX) * 300, (posY) * 250, kind])
				newModule.varname = kind + "_" + delta.path 

				// if kind is 
				
				if (kind === "outs"){
		
					gen_patcher.message("script", "connect", newModule.varname, 0, "dac_left", 0);
					gen_patcher.message("script", "connect", newModule.varname, 1, "dac_right", 0);
				}
			} break;
			case "connect": {
				// connect delta.paths[0] to delta.paths[1]
			 break;
			case "propchange": {
				// special case name == pos, name == orient, name == value
				switch(delta.name) {
					case "value": {
						var param = delta.path
						param = param.replace(".", "__")
						outlet(3, delta.to, param)
						// handle knob twiddle
						// send to appropriate param
						// based on delta.path and delta.to (new value)
					} break;
					case "pos": {
						// whatever
					} break;
				}
			} break;
			// ETC
		} 
	}
}

function client(msg){
	post(msg)
	var ot = JSON.parse(msg)
	outlet(1, ot.cmd)
	cmd = ot.cmd

	switch(cmd){

		case "deltas": {
			//var delta = new Dict("delta");
			//delta.parse(msg);

			post("msg data", ot.data, "\n")
			
			handleDelta(ot.data);
		} break;
			

		case "patch":
	
			counter = 1;
			gen_patcher = this.patcher.getnamed("world").subpatcher();

			gen_patcher.apply(function(b) { 
			
			//post("ops: ", b.varname)
			// prevent erasing our audio outputs from genpatcher
			if(b.varname !== "dac_right" && b.varname !== "dac_left"){
				
				//post("removing: ", b.varname)

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
	
function clear(){
	
	counter = 1;
		gen_patcher = this.patcher.getnamed("world").subpatcher();

			gen_patcher.apply(function(b) { 
				
			//post("ops: ", b.varname)
				// prevent erasing our audio outputs from genpatcher
				if(b.varname !== "dac_right" && b.varname !== "dac_left"){
					
					//post("removing: ", b.varname)

					gen_patcher.remove(b); 
					
					}
			});
				
				}

/* some of this other code below is legacy from the gen scripting example. 
some of it may prove useful for the OT interpretation>>>scripting
				
function module(module){
	var gen_patcher = this.patcher.getnamed("world").subpatcher();


	var newModule = gen_patcher.newdefault([20, 120, "gen", "@gen", module]);
		newModule.varname = module

	
	}
	
	
function op(op){
	var gen_patcher = this.patcher.getnamed("world").subpatcher();

		gen_patcher.apply(function(b) { 				

			if(b.varname !== "dac_right" && b.varname !== "dac_left"){
					
					//post("removing: ", b.varname)

				gen_patcher.remove(b); 
					
				} 
			});


	var newModule = gen_patcher.newdefault([20, 120, op]);
	
	}
function bang() {
	
	
	// remove all the existing objects:
	gen_patcher.apply(function(b) { gen_patcher.remove(b); });

	// create a couple of objects:
	var out1_box = gen_patcher.newdefault([20, 120, "out", 1]);
	var osc_box = gen_patcher.newdefault([20, 20, "cycle", 1000*Math.random()*Math.random()]);
	
	// and connect them
	gen_patcher.connect(osc_box, 0, out1_box, 0);
}

function biggerer() {
	
	// get a reference to "thegen"'s embedded gen patcher:
	var gen_patcher = this.patcher.getnamed("world").subpatcher();
		
	// remove all the existing objects:
	gen_patcher.apply(function(b) { gen_patcher.remove(b); });
	
	var out1_box = gen_patcher.newdefault([20, 400, "out", 1]);
		
	var mul_box = gen_patcher.newdefault([20, 360, "*", 0.1]);
	gen_patcher.connect(mul_box, 0, out1_box, 0);
	
	for (var i=0; i<10; i++) {
		var osc_box = gen_patcher.newdefault([20 + i*50, 20 + i*20, "cycle", 1000*Math.random()*Math.random()]);
		gen_patcher.connect(osc_box, 0, mul_box, 0);
	}
}
*/
