inlets = 1
outlets = 2

var thisPath;
var scene

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
	post("\n\narcs", arcs)
	var nodes = JSON.stringify(x)
	post("\n\nnodes", nodes)

	Object.keys(scene.nodes).forEach(function(key) {
	var nodeName = key;
	var _props = scene.nodes[key]._props 
	var kind = _props.kind
	var pos = _props.pos
  	post(nodeName, kind, pos[0], pos[1], pos[2]);
})
	/*
	Object.keys(scene.nodes).forEach(function(key) {
	var nodeName = key;
	var _props = scene.nodes[key]._props 
	var kind = _props.kind
	var pos = _props.pos
  	post(nodeName, kind, pos);

	this.patcher.parentpatcher.newdefault(30,30,"gen~",kind, "@varname", nodeName);
	// can't instantiate a gendsp file within a subpatcher (weird!)
	// outlet(1, "script newobject newobj @text \"gen~ " + kind + ".gendsp\" @varname " + nodeName)
});

*/
	//post("test", nodes)
}

function bang(){
	
	
	}

/*
function addNode(node){
	

	var i;
	var a = new Array();
	
	if (vbox)
		this.patcher.remove(vbox);
	
	a[0] = vx;
	a[1] = vy;
	
	for (i=0;i<arguments.length;i++)
		a[i+2] = arguments[i];
	
	vbox = this.patcher.newdefault(a);

	
	
	}*/
/*
function getDelta(a){
	
post(a)
this.patcher.getnamed("simpleLFO_1").message("rate", a)


} */

/*
var scene;
var scene_box = this.patcher.getnamed("scene");
if (scene_box && scene_box.subpatcher()) {
	scene = scene_box.subpatcher();
	
	// open it
	//scene.front();
	
	// TODO: inspect & build library of what already exists in the scene?
	scene.apply(function(b) {
		//post(" " + b.patcher.name + " " + b.maxclass + " " + b.varname + " " + b.rect + "\n");
		scene.remove(b);
	});

} else {
	error("need to create a scene subpatcher\n");
}


function patcher_makeobject(name, args) {
	if (findobject(name)) {
		error(name + " name already in use\n");
		return;
	}
	// generate the arguments for patcher.newdefault
	// as an array containing x, y, text:
	var args = ([20, nextobject_y]).concat(args) ;
	nextobject_y += 25;
	//post(args, "\n");
	outlet(1, args);
	// call patcher.newdefault to create a new max object
	// (using apply() so we can pass arguments as an array):
	var obj_patcher = scene.newdefault.apply(scene, args);
	// set the "scripting name" of the max object
	// (useful if we want to address it directly later)
	obj_patcher.varname = name;
	// store in lookup table:
	objects_add(name, obj_patcher );
	
	return obj_patcher;
	//post("test" + obj_patcher);

}

function patcher_removeobject(name) {
	var obj = findobject(name);
	if (!obj) {
		error(name + " object not found\n");
		return;
	}
	
	delete scene_objects[name];
	
	scene.remove(obj);
}

*/