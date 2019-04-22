outlets = 2;

	////// STATE ////


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
	//	post("adding", name, obj, "\n");
		
		scene_objects[name] = obj;
	}

	function findobject(name) {
		return scene_objects[name];
	}

	function state_to_scene(px, py, a, b, c, d, x, y, z){


	//when an object already exists, 
		if (findobject(c)) {
	// filter it out from the list of objects to be added to the [p scene] subpatcher
		return;		
			// error(c + " name already in use\n");
			

	// if the object already exists, then send the updated position data (and other data, like values, etc)
	// to the dict of the same name (currently not yet working, hence it being commented out)		
			//var vrdict = new Dict(c);
			//vrdict.set("position", x, y, z);

		//	send it a message with its updated data:
		
			//	var c_print = (c + "_receive")
			//	scene.getnamed(c_print).messnamed("bob");

		}
		// generate the arguments for patcher.newdefault
		// as an array containing x, y, text:
		else {
		var args = ([px, py, a, b, c, d, x, y, z]);
		nextobject_y += 25;
		//post(args, "\n");
		//outlet(1, args);
		// call patcher.newdefault to create a new max object
		// (using apply() so we can pass arguments as an array):
		var obj_patcher = scene.newdefault.apply(scene, args);
		// set the "scripting name" of the max object
		// (useful if we want to address it directly later)
		obj_patcher.varname = c;
		// store in lookup table:
		objects_add(c, obj_patcher);
		
		return obj_patcher;
		//post("test" + obj_patcher);
		}
	}



		

	/* is this where the state gets translated into vr space?
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

	*/

	function objects_remove_body(body) {
		
		post("remove", body.varname, "\n");
		
		// easy way out:
		scene.remove(body.patcher.box);
		
		delete scene_bodies[body.varname];
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

	function collisions(hand, dictname) {
		// get the collision dictionary
		var d = new Dict(dictname); 
		var keys = d.getkeys();
		// workaround for case where there is only one member
		// ([js] turns that into an string instead of an array of length 1)
		if (typeof keys == "string") { keys = [keys]; }
		
		if (hand.trigger == "press") {
			// for each collision found:
			for (var i=0; i<keys.length; i++) {
				
				var collision = d.get(keys[i]);
				// find the collided object:
				var body1 = collision.get("body1");
				var body2 = collision.get("body2");

				
				
				// TODO: get this from patcher_objects intead???
				
				// pick whichever of these wasn't the ghost:
				var target = findobject(body1) || findobject(body2);
				
				//dump the grabbed object's id from the first outlet of editor_scripting.js
				//TODO: Figure out how to get this object's name, not id
				outlet(0, target);
				
				post(body1, body2, target, "press\n");
				if (target) {
					post(body1, body2, target, hand.selected_body, hand.trigger, "\n");
					// what happens now depends on the hand state
					if (!hand.selected_body) {
						// we didn't have anything selected, so pick it up:
						hand.selected_body = target;
						var p = collision.get("position");
						
						hand.selected_position_offset[0] = p[0] - hand.position[0];
						hand.selected_position_offset[1] = p[1] - hand.position[1];
						hand.selected_position_offset[2] = p[2] - hand.position[2];
						
						post(hand.selected_position_offset[0], hand.selected_position_offset[1], hand.selected_position_offset[2], "\n");
						var p1 = target.message("getposition");
						post("Picked up:", target.varname, p1, "\n");
						
						break;
					}
				}
			}
		}
	}

	// function called to update tracking data for each hand
	function controller(hand, event, x, y, z, w) {
		switch(event) {
			case "position" : {
				hand.position = [x, y, z];
				
				//hand.ghost.position = hand.position;
			} break;
			case "quat" : {
				hand.quat = [x, y, z, w];
				//hand.ghost.quat = hand.quat;
			} break;
			case "trigger" : {
				//hand.trigger = (x != 0);
				if(x != 0){
					if(hand.trigger == "press"){
						hand.trigger = "down";
					}else if(hand.trigger != "down") {
						hand.trigger = "press";
					}
				}else{
					hand.trigger = "up";
				}
				hand.trigger_squeeze = y;
			} break;
			case "buttons" : {
				if(x != 0){
					if(hand.button1 == "press"){
						hand.button1 = "down";
					} else if (hand.button1 != "down") {
						hand.button1 = "press";
					}
				} else {
					hand.button1 = "up";
				}
				
				if(y != 0){
					if(hand.button2 == "press"){
						hand.button2 = "down";
					} else if (hand.button2 != "down"){
						hand.button2 = "press";
					}
				}else{
					hand.button2 = "up";
				}
			} break;
			/* other keys: velocity, angular velocity, hand_trigger, thumbstick, buttons, etc. see tracking patcher */
		}
	//	outlet(0, hand.quat);

		
	}

	function bang() {
		
		var names = Object.keys(scene_objects);
		var name = randomPick(names);
		
		//messnamed(name, "
		
		//post(name, "\n");
		
		for (var i=0; i<2; i++) {
			var hand = hands[i];
			
			// create object using A button
			if (hand.button1 == "press"){
				var body = objects_create_shape_body(hand.position[0], hand.position[1], hand.position[2]);
				body.message("position", hand.position[0], hand.position[1], hand.position[2]);
				body.message("quat", hand.quat[0], hand.quat[1], hand.quat[2], hand.quat[3]);
				hand.button1 == "down";
			}

			// are we holding anything?
			if (hand.selected_body) {
				// are we are still holding (dragging)?
				if (hand.trigger == "down" || hand.trigger == "press") {
					// destroy objects with B button
					if(hand.button2 == "press"){
						// destroy object:
						objects_remove_body(hand.selected_body);
						hand.selected_body = null;
						hand.button2 = "down";
					} else {
						// dragging around
						//post("dragging", hand.selected_body.varname, "\n");
						
						var x = hand.selected_position_offset[0] + hand.position[0];
						var y = hand.selected_position_offset[1] + hand.position[1];
						var z = hand.selected_position_offset[2] + hand.position[2];
						
						hand.selected_body.message("position", x, y, z);
						hand.selected_body.message("quat", hand.quat[0], hand.quat[1], hand.quat[2], hand.quat[3]);
					}
				} else {
					// let it go:
					hand.selected_body = null;
				}
			}
		}
	}

	function left_hand (event, x, y, z, w) { controller(hands[0], event, x, y, z, w); }
	function right_hand(event, x, y, z, w) { controller(hands[1], event, x, y, z, w); }

	function left_hand_collisions(dictname) { 
		collisions(hands[0], dictname);
	}
	function right_hand_collisions(dictname) { 
		collisions(hands[1], dictname);
	}



	function close() {
		if (patcher) {
			//patcher.dispose();
		}
	}