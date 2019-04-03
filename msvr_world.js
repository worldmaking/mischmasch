
inlets = 2
outlets = 2
	// get a reference to "thegen"'s embedded gen patcher:
var varnameCount = 0

// store inlet&outlet indexes per node
var inletsTable = new Array();
var outletsTable = new Array();

//store varnames per node
var varnamesTable = new Array();

var object = {};
	var nodeName;

counter = 1;

var feedbackConnections = 0
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
	//	gen = gen
		//post(kind)
		//outlet(0, checkOp)
		
		
		// generate the object
  	//	post(nodeName, kind, pos[0], pos[1], pos[2]);
/*
		if (checkOp.includes('"op') === true){
			
			post("op found", kind)

		} */
		genType = kind.split("_")[0]
		
		
		
		switch (genType){
			
			case "op":
			op = kind.split("_")[1]
			post(genType, "op\n")
			var newModule = gen_patcher.newdefault([(pos[0] + counter) * 100, (pos[1] + counter) * 50, op])
			newModule.varname = nodeName
			break;
			
			case "param":
			var args = _props.args
			post("args",args)
			param = kind.split("_")[0]

			//post(genType, "param\n")
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
			
			} else {
		
		
		//post(kind)
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
	
			//post("\n\n",UI)
			UI_obj[key] = [UI,index]
	
			//post(JSON.stringify(UI_obj))
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
			post(opName1,opName2)
			var history = gen_patcher.newdefault([20,20, "history"])
				history.varname = "feedback_" + feedbackConnections
				gen_patcher.message("script", "connect", opName1, index1, history.varname, 0);
				gen_patcher.message("script", "connect", history.varname, 0, opName2, index2);
			} else {
		gen_patcher.message("script", "connect", opName1, index1, opName2, index2);
			}
		}
		
		
		// pos[0] + counter) * 100, (pos[1] + counter) * 50 - 50
	
		//arcLookup = JSON.stringify(object)
		//post(arcLookup)
		//post(opName)
		//var destinationOp = scene.arcs[i][1].split(".")
		//varSourceOpName = sourceOp
		//cable = scene.arcs[i].toString()
		
    	//cable = cable.split(".").join(',')


		}
	


}
/*
function parameter(value){
		post(value)

	gen_patcher = this.patcher.getnamed("world").subpatcher();
	
	
	gen_patcher.apply(function(b) {
		
		b.outs_1.m
		}
	gen_patcher.message("script","send","outs_1","volume",value)
	return;
	}
*/	
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

