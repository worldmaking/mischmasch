inlets = 1

outlets = 3
// the reference to the gen~ world object we'll be scripting to. 
var gen_patcher; 


// max api
function loadbang(){
	
	// things that need to be initiated only after patcher has finished loading
	gen_patcher = this.patcher.getnamed("world").subpatcher();

	//! clear the parent patcher of any vr.source~ objects prior to receiving deltas
	this.patcher.apply(function(b) { 
		post(b.varname)
		if(b.varname.split('_speaker')[0] === 'source'){
			this.patcher.message('script', 'delete', b.varname)
		}
	});
	//! clear the gen~ world patcher prior to receiving deltas
	gen_patcher.apply(function(b) { 
		if(b.varname !== "reserved_audioviz" && b.varname !== "reserved_audioviz_1" && b.varname !== "PLO" && b.varname !== "rightWand_pos_x" && b.varname !== "rightWand_pos_y" && b.varname !== "rightWand_pos_z" && b.varname !== "c1Px" && b.varname !== "c1Py" && b.varname !== "c1Pz" && b.varname !== "rightWand_orient_x" && b.varname !== "rightWand_orient_y" && b.varname !== "rightWand_orient_z" && b.varname !== "rightWand_orient_w" && b.varname !== "c1Ox" && b.varname !== "c1Oy" && b.varname !== "c1Oz" && b.varname !== "c1Ow"){

		gen_patcher.remove(b); 	
		}		
	});


	
	
	outlet(1, 'resetCounters')
	// enable viz of outlets
	outlet(3, 'toAudioviz', 1)
}

function newWand(name){

}