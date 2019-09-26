function bang() {
	
	// get a reference to "thegen"'s embedded gen patcher:
	var gen_patcher = this.patcher.getnamed("thegen").subpatcher();
		
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
	var gen_patcher = this.patcher.getnamed("thegen").subpatcher();
		
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

var ops = {
	"in": { ins:0, outs:1 },
	"noise": { ins:0, outs:1 },
	"out": { ins:1, outs:0 },
	"f": { ins:0, outs:1, create:function() { return "f "+Math.random(); } },
	"i": { ins:0, outs:1, create:function() { return "i "+Math.floor(Math.random()*74); } },
	"cycle": { ins:2, outs:1 },
	
	"neg": { ins:1, outs:1 },
	"abs": { ins:1, outs:1 },
	"ceil": { ins:1, outs:1 },
	"floor": { ins:1, outs:1 },
	"fract": { ins:1, outs:1 },
	"trunc": { ins:1, outs:1 },
	"sign": { ins:1, outs:1 },
	"exp": { ins:1, outs:1 },
	"exp2": { ins:1, outs:1 },
	"ln": { ins:1, outs:1 },
	"log": { ins:1, outs:1 },
	"log10": { ins:1, outs:1 },
	"sqrt": { ins:1, outs:1 },
	
	"+": { ins:2, outs:1 },
	"-": { ins:2, outs:1 },
	"*": { ins:2, outs:1 },
	"/": { ins:2, outs:1 },
	"%": { ins:2, outs:1 },
	"!-": { ins:2, outs:1 },
	"!/": { ins:2, outs:1 },
	"!%": { ins:2, outs:1 },
	"pow": { ins:1, outs:1 },
	"absdiff": { ins:2, outs:1 },
	"round": { ins:2, outs:1 },
	"min": { ins:2, outs:1 },
	"max": { ins:2, outs:1 },
	
	"poltocar": { ins:2, outs:2 },
	"cartopol": { ins:2, outs:2 },
	
	"clamp": { ins:3, outs:1 },
	"fold": { ins:3, outs:1 },
	"wrap": { ins:3, outs:1 },
	"?": { ins:3, outs:1 },
	"mix": { ins:3, outs:1 },
	"smoothstep": { ins:3, outs:1 },
	
	"scale": { ins:6, outs:1 },
	
	
	
}

var opnames = Object.keys(ops);

function randombox() {
	// generate a random box with arguments
	var opname = opnames[Math.floor(Math.random()*opnames.length)];
	var op = ops[opname];
	if (op.create) { 
		return op.create();
	} else {
		return opname;
	}
}

function weirder() {
	// get a reference to "thegen"'s embedded gen patcher:
	var gen_patcher = this.patcher.getnamed("thegen").subpatcher();
	// remove all the existing objects:
	gen_patcher.apply(function(b) { gen_patcher.remove(b); });
	
	var id = 0;
	var cmd = [];
	for (var i=0; i<20; i++) {
		cmd.push(randombox());
	}	
	var stack = [];
	var x = 10;
	var y = 10;
	
	while (cmd.length) {
		var terms = cmd.shift().split(" ");
		var op = terms.shift();
		var opdef = ops[op];
		var args = [x, y].concat(op, terms);
		y += 30;
		x += 5;
		var box = gen_patcher.newdefault(args);
		box.varname = "box"+(id++);
		var nins = opdef.ins;
		var nouts = opdef.outs;
		post("args", op, args.join(","), nins, nouts, stack.length, "\n");
		
		// consume inputs where possible:
		for (var i=0; i<nins && stack.length > 0; i++) {
			//post("connect", i, op, "\n");
			//post("stack.length", stack.length, "nins", nins, "\n");
			var src = stack.pop();
			gen_patcher.connect(gen_patcher.getnamed(src.src), src.idx, box, i);
			//post("stack.length", stack.length);
		}
		
		// add outputs:
		for (var i=0; i<nouts; i++) {
			stack.push({src:box.varname, idx:i});
		}
		
	}
	
	
}

weirder();