//This amalgamates working code from two separate sources: editor_scripting.js, and vr-projectmake.js. 
// Run index.js, and add an object using the VR controller. You should see that the state as reported by state.js 
//(by way of editor_scripting.js outlet 1) prints to the stdout in CLI, and also returns to this script here 
//(see 'function keyframe_state' below)

outlets = 3



////// STATE ////

// load a patcher from a JSON representation of its state:
function keyframe_state(json_state) {
	// create new patcher
	//patcher = new Patcher(20, 20, 500, 500);
	// show it:
	//patcher.front();

	// read the file from disk:
	//var f = new File("state.json", "read");
	//var json_state = f.readstring(json_state, f.eof);
	//f.close();
	// convert the JSON text to a javascript object:
	state = JSON.parse(json_state);
	// populate the patcher:
	retrieve_state();
}

// TODO factor out the new object/new line stuff
// so that they can also be used by newobject(), connectobjects(), etc.
function retrieve_state() {
	// for each object
	var keys = Object.keys(state.objects);
	for (var i=0; i<keys.length; i++) {
		var obj_state = state.objects[keys[i]];
		createobject(obj_state.id, obj_state);
		
	}
	
	// for each line
//	for (var i=0; i<state.lines.length; i++) {
//		var line = state.lines[i];
//		connectobjects(line.src, line.outlet, line.dst, line.inlet);
//	}
	
	// trigger loadbangs etc.
	
	
}

/*

////// SCENE SUBPATCHER ///////

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


//var patcher;
// lookup table from object names to objects:
var scene_objects = {};

// map editor jit.phys.body objects to their correspoinding vrbox
var scene_bodies = {};

function objects_add(name, obj) {
	post("adding", name, obj, "\n");
	
	scene_objects[name] = obj;
}

function findobject(name) {
	return scene_objects[name];
}

// next location for a patcher object:
var nextobject_y = 10;

// create the state for two hands:
var hands = [];
for (var i=0; i<2; i++) {
	hands[i] = {
		name: 0 ? "left" : "right",
		position: [0, 0, 0],
		quat: [0, 0, 0, 1],
		trigger: "up",
		trigger_squeeze: 0.,
		button1: "up",
		button2: "up",
		
		selected_body: null,
		selected_position_offset: [0, 0, 0],
	};
}

// create some objects to play with
for (var i=0; i<5; i++) {
	objects_create_shape_body(randomRange(-2, 2), randomRange(0, 2), randomRange(-3, 1));
}

function test() {
	
	var p = this.patcher.getnamed("vrbox-test")
	messnamed("vrbox_234", "foo", 23);
	
}

function objects_create_shape_body(x, y, z){
	
	var box_name = uid("vrbox")
	var box = patcher_makeobject(box_name, [
		"vr-box", 
		"@text", box_name,
		"@name", box_name,
		"@position", x, y, z,
	]);
	
	var body;
	
	// find the embedded body, rename it, and hook it up:
	var box_patcher = box.subpatcher();
	box_patcher.apply(function(e) {
		if (e.maxclass == "jit.phys.body") {
			e.varname = box_name + "_body";
			objects_add(e.varname, e);
			scene_bodies[e.varname] = box_name;
			body = e;
		}
	});
	
	
	//dump the created objects name from the first outlet of editor_scripting.js
	outlet(0, box_name, x, y, z);
	return body;

	
}


function objects_remove_body(body) {
	
	post("remove", body.varname, "\n");
	
	// easy way out:
	scene.remove(body.patcher.box);
	
	delete scene_bodies[body.varname];
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
// the state of the patcher being worked on
// this is the 'ground truth' from which all views are derived
var state = {
	objects: {},
	lines: []
};

// will refer to the patcher being created:
var patcher;

// lookup table from object names to objects:
var patcher_objects = {};
function findobject(name) {
	// this might get more complicated later
	return patcher_objects[name];
//	post(patcher_objects[name]);
}

// a way to generate new object names:
unique_id = 1;
function generate_unique_id() {
	// unique means it doesn't already exist in patcher_objects
	var id = "obj-" + (unique_id++);
	while (patcher_objects[id]) {
		id = "obj-" + (unique_id++);
	}
	return id;
}




/*

// save the current state back to a JSON file:
function save_state() {
	var json_state = JSON.stringify(state, null, 2);
	var f = new File("state.json", "write");
	f.writestring(json_state);
	f.close();
}

*/
// if we ever wanted to save the generated patcher
// patcher.write();

// called when this js file is closed
function close() {
//	post("closing\n");
	// save current patcher to JSON:
	save_state();
	// close the generated patcher:
	patcher.wclose(); // or .dispose()?
}

function moveobject(name, position, quat) {
	var obj_state = state.objects[name];
	// TODO
	// move would update world_position and world_quat
	obj_state.world_position = position;
	obj_state.world_quat = quat;
}

function deleteobject(name) {
	var obj = findobject(name);
	if (obj) {
		// TODO: delete 3D representation
		// (including all connected 3D patchlines!)
		
		// delete patcher representation
		// (will automatically remove lines)
		patcher.remove(obj);
		
		// remove from state:
		delete state.objects[name];
	}
}

function newobject() {
	var id = generate_unique_id();
//	post(id, "\n");
	
	var obj_state = {
		// TODO: fill in properties with given 
		// or default data
	};
	
	createobject(id, obj_state);
}

function createobject(name, obj_state) {
	if (findobject(name)) {
		error(name + " name already in use\n");
		return;
	}
	
	// TODO validate all properties:
	obj_state.id = name;
	
	
	// insert:
	state.objects[name] = obj_state;
	
	// generate the arguments for patcher.newdefault
	// as an array containing x, y, text:
	var args = obj_state.patcher_position.concat(obj_state.max_class, "@text", obj_state.text, "@varname", obj_state.var_name, "@position", obj_state.vr_position);
	
//outlet(0, "vr-box", "@text", obj_state.text, "@position", obj_state.vr_position);
outlet(0, args);

	// call patcher.newdefault to create a new max object
	// (using apply() so we can pass arguments as an array):
//	var obj_patcher = patcher.newdefault.apply(patcher, args);
	

//post(obj_patcher, "\n");


// set the "scripting name" of the max object
	// (useful if we want to address it directly later)
//	obj_patcher.varname = name;
	// store in lookup table:
//	patcher_objects[name] = obj_patcher;
	
	
//	post(name, "\n");

	// TODO: create 3D version
	// outlet(0, ...)
	
}

function connectobjects(src_name, outlet, dst_name, inlet) {
	var src = patcher_objects[src_name];
	var dst = patcher_objects[dst_name];
	if (src && dst) {
		patcher.connect(src, outlet, dst, inlet);
		
		// TODO: will need to hash or store something here, so that the line can be fully destroyed later.
		
		// TODO: create 3D version
		// outlet(0, ...)
	} else {
		error("attempt to connect unknown objects " + src_name + " and " + dst_name + "\n");
	}
}

function disconnectobjects(src_name, outlet, dst_name, inlet) {
	var src = patcher_objects[src_name];
	var dst = patcher_objects[dst_name];
	if (src && dst) {
		patcher.disconnect(src, outlet, dst, inlet);
		
		// TODO: destroy 3D version
		// outlet(0, ...)
	} else {
		error("attempt to disconnect unknown objects " + src_name + " and " + dst_name + "\n");
	}
}



//load_state();

//newobject();
	
	
	
// messnamed(scriptingname, msg)
	




