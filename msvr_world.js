
inlets = 2
	// get a reference to "thegen"'s embedded gen patcher:
var varnameCount = 0

// store inlet&outlet indexes per node
var inletsTable = new Array();
var outletsTable = new Array();

//store varnames per node
var varnamesTable = new Array();

var object = {};
counter = 1;
function read(file){
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
		
		var nodeName = key;
		var _props = scene.nodes[key]._props 
				var kind = _props.kind
						var pos = _props.pos

				
		// generate the object
  	//	post(nodeName, kind, pos[0], pos[1], pos[2]);
		var newModule = gen_patcher.newdefault([pos[0] * 100, pos[1] * 100, "gen", "@gen", kind])
		newModule.varname = nodeName
		
		var unit = scene.nodes[key]
		// get all the inlets and outlets (and eventually the UI params)
		Object.keys(unit).forEach(function(key) {
			
if(JSON.stringify(unit[key]._props) !== undefined){
	kind = JSON.stringify(unit[key]._props.kind)
	index = JSON.stringify(unit[key]._props.index)

	post("\n\n",kind)
			if(kind === "inlet"){
							//object[nodeName] = _props.index
			inletsTable.push({nodeName:{kind:index}})
				post("test", inletsTable)

				
				}

			post("\n\ninlet")

			
			
			
			
	
	}
			//newKind = unit[key]._props.kind
			//post(JSON.stringify(newKind))

			})
		//if(scene.nodes[key]._props.kind)
		//post("inlet",newInlet)
		//post(JSON.stringify(_props))

		post(nodeName[_props])
		
	//	post(kind)

		//post(newModule)
		//varnames.push()
		//	post(inletsTable)

	})
	for (index = 0; index < scene.arcs.length; ++index) {
    	post(scene.arcs[index], "\n");
		}
	


}
function clear(){
		gen_patcher = this.patcher.getnamed("world").subpatcher();

			gen_patcher.apply(function(b) { gen_patcher.remove(b); });
				
				}
function module(module){
	var gen_patcher = this.patcher.getnamed("world").subpatcher();


	var newModule = gen_patcher.newdefault([20, 120, "gen", "@gen", module]);
		newModule.varname = module

	
	}
	
	
function op(op){
	var gen_patcher = this.patcher.getnamed("world").subpatcher();

		gen_patcher.apply(function(b) { gen_patcher.remove(b); });


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

