inlets = 1
outlets = 3
// the reference to the gen~ world object we'll be scripting to. 
var gen_patcher; 


// max api, init
function loadbang(){
	
	// things that need to be initiated only after patcher has finished loading
	gen_patcher = this.patcher.getnamed("world").subpatcher();

	//! clear the parent patcher of any vr.source~ objects prior to receiving deltas
	this.patcher.apply(function(b) { 
		
		if(b.varname.split('_speaker')[0] === 'source'){
			this.patcher.message('script', 'delete', b.varname)
		}
	});
	//! clear the gen~ world patcher prior to receiving deltas
	gen_patcher.apply(function(b) { 
		if(b.varname !== "reserved_audioviz" && b.varname !== "reserved_audioviz_1" && b.varname !== "PLO" && b.varname !== "rightWand_pos_x" && b.varname !== "rightWand_pos_y" && b.varname !== "rightWand_pos_z" && b.varname !== "c1Px" && b.varname !== "c1Py" && b.varname !== "c1Pz" && b.varname !== "rightWand_orient_x" && b.varname !== "rightWand_orient_y" && b.varname !== "rightWand_orient_z" && b.varname !== "rightWand_orient_w" && b.varname !== "c1Ox" && b.varname !== "c1Oy" && b.varname !== "c1Oz" && b.varname !== "c1Ow" && b.varname !== "scripting_reserved_adc_2" && b.varname !== "scripting_reserved_adc_1"){

		gen_patcher.remove(b); 	
		}		
	});
	outlet(0, 'resetCounters')
	// enable viz of outlets
	outlet(0, 'toAudioviz', 1)
}

//! patcher scripting from deltas:
function addWand(pathName, posY){
    var newWand = gen_patcher.newdefault([25, posY * 150, 'wand'])
    newWand.varname = pathName;
   
    gen_patcher.message("script", "connect", "c1Px", 0, newWand.varname, 0);
    gen_patcher.message("script", "connect", "c1Py", 0, newWand.varname, 0);
    gen_patcher.message("script", "connect", "c1Pz", 0, newWand.varname, 0);
    gen_patcher.message("script", "connect", "c1Ox", 0, newWand.varname, 0);
    gen_patcher.message("script", "connect", "c1Oy", 0, newWand.varname, 0);
    gen_patcher.message("script", "connect", "c1Oz", 0, newWand.varname, 0);
    gen_patcher.message("script", "connect", "c1Ow", 0, newWand.varname, 0);
}

function addSpeaker(pathName, x,y,z, posY, genOutCounter, vrSourceVarname){

    // make gen 'out'										
    var newOut = gen_patcher.newdefault([10, posY * 150, 'out', genOutCounter])
    newOut.varname = pathName + '_out';
    
    // add in the 'speaker.gendsp'
    var newSpeaker = gen_patcher.newdefault([25, posY * 150, 'speaker'])
    newSpeaker.varname = pathName;

    gen_patcher.message("script", "connect", newSpeaker.varname, 0, newOut.varname, 0);

    // add a vr.Source~ abstraction to parent, script the new out to this abstraction, use delta.pos to provide the vr.source~ position
    var vrSource = this.patcher.newdefault([-50 + (genOutCounter * 100), 200, "vr.source~", genOutCounter - 1, "@position", x,y,z ])
    vrSource.varname = vrSourceVarname

    // gen~ and max outlets are base 0 (mth), our speaker numbers are base 1 (nth)
    //! do not use patcher scripting for this message:
    //! we need to use the deferlow script
    outlet(0, 'genConnect', genOutCounter, vrSource.varname)

    // All vr.Source~ objects script connect into inlets 0 & 1 of a live.gain~ object called vrSource2CHMain
    this.patcher.message("script", "connect", vrSource.varname, 0, 'vrSource2CHMain', 0);
    this.patcher.message("script", "connect", vrSource.varname, 1, 'vrSource2CHMain', 1);
}

function addModule(posY, pathName, kind){
    newGenModule = gen_patcher.newdefault([125, posY * 10, kind])
    newGenModule.varname = pathName
}

function addOperator(posY, pathName, kind){
    newGenModule = gen_patcher.newdefault([125, posY * 10, kind])
    newGenModule.varname = pathName
}

function addDefault(posY, pathName, kind){
    newGenModule = gen_patcher.newdefault([125, posY * 10, kind])
    newGenModule.varname = pathName
}

function addOutlet(currentParent, outletIndex, deltaPath, audiovizIndex){
    // poke the outlet's audio into a buffer index for visualization
    var newAudiovizPoke = gen_patcher.newdefault([50, 100, 'poke', 'audioviz'])
    newAudiovizPoke.varname = deltaPath + '_poke';
    var newAudiovizConstant = gen_patcher.newdefault([50, 50, 'constant', audiovizIndex])
    newAudiovizConstant.varname = deltaPath + '_poke';
    // connect the constant to the poke
    gen_patcher.message("script", "connect", newAudiovizConstant.varname, 0, newAudiovizPoke.varname, 1);
    // need to get the index of the node! (if its an abstraction, then the outlet of the gendsp is represented as an index in the scene's graph)
    gen_patcher.message("script", "connect", currentParent, outletIndex, newAudiovizPoke.varname, 0);
}

function addParam(path, posY, value, paramCounter){
    pathName = path.split('.')[0]
    paramName = path.replace('.','__')
    setparamName = path.split('.')[1]
    attenuvertorName = paramName + '_attenuvertor'

    paramX = paramCounter * 150
    // generate the setparam which the param will bind to
    var setparam = gen_patcher.newdefault([275, posY * 2, "setparam", setparamName])
    setparam.varname = 'setparam_' + paramName
    gen_patcher.message("script", "connect", setparam.varname, 0, pathName, 0);

    // generate the multiplier to insert between the param and setparam (for knobs-as-inlets)
    var attenuvertor = gen_patcher.newdefault([450, posY * 2, "*"])
    attenuvertor.varname = attenuvertorName
    gen_patcher.message("script", "connect", attenuvertor.varname, 0, setparam.varname, 0);

    // generate the param which the js script will bind to
    var param = gen_patcher.newdefault([600, posY * 1.5, "param", paramName, value])
    param.varname = paramName
    gen_patcher.message("script", "connect", param.varname, 0, attenuvertor.varname, 1);
    paramCounter++
}

function delNode(target){
    gen_patcher.apply(function(b) { 
        // prevent erasing our audio outputs from genpatcher
        if(b.varname !== "reserved_audioviz" && b.varname !== "reserved_audioviz_1" && b.varname !== "PLO" && b.varname !== "rightWand_pos_x" && b.varname !== "rightWand_pos_y" && b.varname !== "rightWand_pos_z" && b.varname !== "c1Px" && b.varname !== "c1Py" && b.varname !== "c1Pz" && b.varname !== "rightWand_orient_x" && b.varname !== "rightWand_orient_y" && b.varname !== "rightWand_orient_z" && b.varname !== "rightWand_orient_w" && b.varname !== "c1Ox" && b.varname !== "c1Oy" && b.varname !== "c1Oz" && b.varname !== "c1Ow"){
            if (b.varname.indexOf(target) != -1){
                gen_patcher.remove(b); 				
            }
        }
    });
}

function deleteSpeaker(target){
    this.patcher.message("script", 'delete', target)
}

function connect(src, srcIndex, dst, dstIndex){
    gen_patcher.message("script", "connect", src, srcIndex, dst, dstIndex)
}

function disconnect(src, srcIndex, dst, dstIndex){
    gen_patcher.message("script", "disconnect", src, srcIndex, dst, dstIndex)
}

function history(varname){
    var history = gen_patcher.newdefault([150,10, "history"])
    history.varname = varname
}

function updateValue(param, value){
    this.patcher.message("script", "send", "world", param, value)
}

function updateSpeakerPosition(target, x, y, z){
    this.patcher.message("script", "send", target, "position", x,y,z)
}



