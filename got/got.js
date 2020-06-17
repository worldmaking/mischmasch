/*
	Graph Operational Transforms
	(not game of thrones :-))
*/

let previousDelta;
let graphContainer;
const assert = require ("assert");

// see https://github.com/worldmaking/msvr/wiki/List-of-Operational-Transforms
/*
	Every op should be invertible (which means, destructive edits must include full detail of what is to be deleted)
	Changes are rebased by graph path (rather than character position as in text documents)

	Simultaneous edits must be merged: the second is rebased by the first. 

*/

function deepEqual(a, b) {
	// FIXME expensive lazy way:
	return JSON.stringify(a) == JSON.stringify(b);
}

function deepCopy(a) {
	// FIXME expensive lazy way:
	return JSON.parse(JSON.stringify(a));
}

// copy all properties from src to dst
// excepting any reserved keys (op, path)
let copyProps = function(src, dst) {
	for (let k in src) {
		if (k == "op" || k == "path") continue;
		// recursive objects (deep copy)
		// FIXME expensive lazy way:
		dst[k] = deepCopy(src[k]);
	}
	return dst;
}

// find a path within a tree:
let findPath = function(tree, path) {
	let steps = path.split(".");
	let n = tree;
	for (let k in steps) {
		assert(n[k], "failed to find path");
		n = n[k];
	}
	return n;
}

// given a tree, find the node that contains last item on path
// returns [undefined, path] if the path could not be fully resolved
let findPathContainer = function(tree, path) {
	let steps = path.split(".");
	let last;
	let container;
	let node = tree;
	for (let i=0; i<steps.length; i++) {
		let k = steps[i]
		//assert(node[k], "failed to find path: "+k);
		if (!node[k]){
			//return [undefined, k];
			let errorMsg = 'delta failed on path: ' + path
			throw(errorMsg)
		} 
		last = k;
		container = node;
		node = node[k];
	}
	return [container, last];
}

// given path "a.b.c.d", creates object root.a.b.c.d
// throws error if root.a.b.c doesn't exist
// throws error if root.a.b.c.d already exists
let makePath = function(root, path) {
	let steps = path.split(".");
	let last = steps.pop();
	let n = root;
	for (let k of steps) {
		if(!n[k]){
			throw 'newnode failed: failed to find paths'
		}
		n = n[k];
	}
	if(n[last]){
		//*TODO #6 Two newnode edits with the same path

		// A1: newnode @x
		// B1: newnode @x

		// This can be resolved by inserting a repath to rename x:

		// B1: newnode @x
		// +B2: repath @x->@y
		// A1: newnode @x

		// Using a repath delta ensures that the name change can propagate for longer sequences of edits too. 

		throw "newnode failed: path already exists"

	}
	let o = { _props: {} };
	n[last] = o;
	return o;
}

// given a delta it returns the inverse operation 
// such that applying inverse(delta) undoes all changes contained in delta
let inverseDelta = function(delta) {
	if (Array.isArray(delta)) {
		let res = [];
		// invert in reverse order:
		for (let i=delta.length-1; i>=0; i--) {
			res.push(inverseDelta(delta[i]));
		}
		return res;
	} else {
		switch (delta.op) {
			case "newnode": {
				let d = {
					op: "delnode",
					path: delta.path,
				};
				copyProps(delta, d);
				return d;
			} break;
			case "delnode": {
				let d = {
					op: "newnode",
					path: delta.path,
				};
				copyProps(delta, d);
				return d;
			} break;
			
			case "connect": {
				return {
					op: "disconnect",
					paths: [ delta.paths[0], delta.paths[1] ]
				}
			} break;
			case "disconnect": {
				return {
					op: "connect",
					paths: [ delta.paths[0], delta.paths[1] ]
				}
			} break;
			case "repath": {
				return {
					op: "repath",
					paths: [delta.paths[1], delta.paths[0]],
				};
			} break;
			case "propchange": {
				return {
					op:"propchange", 
					path: delta.path,
					name: delta.name,
					from: delta.to,
					to: delta.from
				}
			} break;
		}
	}
}

// rebase B in terms of the changes in A
// returns new list of deltas containing both effects of A then B:
let rebase = function(B, A, result) {
	if (Array.isArray(A)) {
		for (let a of A) {
			try {
				// rebase B in terms of a:
				let b = rebase(B, a, result);
				// push a into result first
				result.push(deepCopy(a));
				// finally, add resolved B to result
				if (b) result.push(b);
			} catch(e) {
				throw(e);
			}
		}
	} else if (Array.isArray(B)) {
		// A is a single edit:
		for (let b of B) {
			// then rebase b in terms of the single edit in A:
			rebase(b, A, result);
		}
	} else {
		// both A and B are now single edits
		// check the two operations to see if they could have any influence on each other
		// use 'b' as the resolved edit:
		let b = deepCopy(B);

		// check for conflicts:
		switch (A.op) {
			case "connect": {
				// if B is the same connect, skip it
				if (b.op == "connect" && b.paths[0]==A.paths[0] && b.paths[1]==A.paths[1]) {
					return; // skip duplicate operation
				}
			} break;
			case "disconnect": {
				// if B is the same disconnect, skip it
				if (b.op == "disconnect" && b.paths[0]==A.paths[0] && b.paths[1]==A.paths[1]) {
					return; // skip duplicate operation
				}
			} break;
			case "newnode": {
				// check duplicate ops:
				if (deepEqual(A, b)) {
					return; // skip duplicate operation
				}
				// otherwise error on same name:
				if (A.path == b.path) {
					throw("cannot create node; path already exists");
				}
			} break;
			case "delnode": {
				// if B is the same op, skip it
				if (b.op == "delnode" && b.path==A.path) {
					return; // skip duplicate operation
				}
				// check path use
				let path = A.path;
				if ((b.path && b.path == A.path) ||
					(b.paths && (b.paths[0] == A.path || b.paths[1] == A.path))) {
					throw("cannot delete node; path is used in subsequent edits")
				}
			} break;
			case "repath": {
				// if any other op uses the same path, have to change it:
				let [src, dst] = A.path;
				if (b.path == src) { b.path = dst; } 
				if (b.paths && b.paths[0] == src) { b.paths[0] = dst; }
				if (b.paths && b.paths[1] == src) { b.paths[1] = dst; }
			} break;
			case "propchange": {
				// TODO -- are there any potential conflicts?
				if (b.op == "propchange" && b.path==A.path && b.name==A.name && floatApproximatelyEqual(b.from, a.from) === false) {
					// if both A and b change the same property, then they should be merged or sequenced
					b.from = A.to;
					// // console.log(b.from, A.to)
				}
			} break;
		}
		return b;
	}
	return;
}

let mergeDeltasToGraph = function(graph, deltasA, deltasB) {
	/*
		first, try to rebase deltasB in terms of deltasA
		then apply deltasA, then apply rebased-deltasB

		lots of ways this can fail
	*/
	
}
let gotHistory = []
let  prevRepath, prevNewnode, prevDelnode, prevPropchange

let applyDeltasToGraph = function (graph, delta) {
	if (Array.isArray(delta)) {
		for (let d of delta) {

			applyDeltasToGraph(graph, d);
			previousDelta = delta
		}
	} else {
		switch (delta.op) {
			case "repath": {
				if(delta.paths.length < 2 || !delta.paths[0] || !delta.paths[1]){
					throw ('propchange repath is missing one or more path(s)')
				} else  {

					
					// if (prevRepath){
					// 	// console.log(delta, previousDelta)
					// 	throw delta, prevRepath
					// }
					let [ctr0, src] = findPathContainer(graph.nodes, delta.paths[0]);
					let [ctr1, dst] = findPathContainer(graph.nodes, delta.paths[1]);

					// throw('test')
					// // find destination container:
					let steps = delta.paths[1].split(".");
					steps.pop(); // ignoring the last element
					let container = graph.nodes;
					for (let i=0; i<steps.length; i++) {
						let k = steps[i]
						container = container[k];
					}

					// move its
					container[dst] = ctr0[src];
					delete ctr0[src];				
					// repath arcs:
					for (let arc of graph.arcs) {
						if (arc[0] == delta.paths[0]) arc[0] = delta.paths[1];
						if (arc[1] == delta.paths[0]) arc[1] = delta.paths[1];
					}
					prevRepath = delta
				}
			} break;
			
			case "newnode": {
				if(!delta.path){
					throw ('newnode delta contains no path')
				} else {
					let o = makePath(graph.nodes, delta.path);
					copyProps(delta, o._props);					
				}
			} break;
			case "delnode": {
				if(!delta.path){
					throw ('delnode delta contains no path')
				} else {
					let [ctr, name] = findPathContainer(graph.nodes, delta.path);
					if(!ctr){
						throw ('delnode failed: path not found')
					} else {
						let o = ctr[name];

						if(deepEqual(delta, previousDelta) === true){
							throw 'two delnode deltas are the same'
						}
						// let [ctr, name] = findPathContainer(graph.nodes, delta.path);
						// let o = ctr[name];
						// console.log()
						for (let k in o._props) {
							// assert(deepEqual(o._props[k], delta[k]), "delnode failed; properties do not match");
							// console.log(deepEqual(o._props[k], delta[k]))
							if(deepEqual(o._props[k], delta[k]) === false){
								throw ('delnode failed; properties do not match')
							}						
						}
						// assert o has no child nodes
						// keys should either be ['_props'] or just []:
						let keys = Object.keys(o);
						if(keys.length == 1 && keys[0]=="_props"){
							delete ctr[name];
						} else {
							// o has child nodes, so throw error
							throw ('delnode failed; node has children')
						}					
					}
				}
			} break;
			case "connect": {
				if(delta.paths.length < 2 || !delta.paths[0] || !delta.paths[1]){
					throw ('propchange connect is missing one or more path(s)')
				} else if(delta.paths[0] === delta.paths[1]){
					throw('propchange connect contains identical paths')
				}
				else {
					// ensure connection does not yet exist
					if(!graph.arcs.find(e => e[0]==delta.paths[0] && e[1]==delta.paths[1])){
						// arc doesn't yet exist, so make it
						graph.arcs.push([ delta.paths[0], delta.paths[1] ]);
					} else {
						// arc already exists, throw error
						throw ('connect failed: arc already exists')
					}
				}

				
			} break;
			case "disconnect": {
				if(delta.paths.length < 2 || !delta.paths[0] || !delta.paths[1]){
					throw ('propchange disconnect is missing one or more path(s)')
				} else if(delta.paths[0] === delta.paths[1]){
					throw('propchange disconnect contains identical paths')
				}
				// find matching arc; there should only be 1.
				let index = -1;
				for (let i in graph.arcs) {
					let a = graph.arcs[i];
					if (a[0] == delta.paths[0] && a[1] == delta.paths[1]) {
						// i don't yet know how the delta would look if there was more than one matching arc
						// assert(index == -1, "disconnect failed: more than one matching arc");
						if(index != -1){
							throw ('disconnect failed: more than one matching arc found')
						} else {
							index = i;
						}
					}
				}
				if(index != -1){
					graph.arcs.splice(index, 1);
				} else {
					throw ('disconnect failed: no matching arc found')

				}
			} break;

			case "propchange": {
				if(!delta.path){
					throw ('propchange delta contains no path')
				} else if(!delta.from){
					throw ('propchange delta contains no "from" value')
				} else if(!delta.to){
					throw ('propchange delta contains no "to" value')
				} else {
					// console.log('\n\nincoming delta\n\n', delta)

					/*
					let [ctr, name] = findPathContainer(graph.nodes, delta.path);
					let o = ctr[name];
					// assert object & property exist:
					assert(o, "propchange failed: path not found");
					assert(o._props, "propchange failed: object has no _props");
					let prop = o._props[delta.name];
					assert(prop, "propchange failed: property not found");
					// assert 'from' value matches object's current value
					assert(deepEqual(prop, delta.from), "propchange failed; property value does not match");

					// change it:s
					o._props[delta.name] = delta.to;
					*/
					// /*
					let [ctr, name] = findPathContainer(graph.nodes, delta.path);
					if (!ctr){

						// assert object & property exist:
						throw ('propchange failed: path not found')
						// assert(o, "propchange failed: path not found");

					} else {

						let o = ctr[name];
						let prop = o._props[delta.name];


						if(!o._props){

							//* i don't know what delta will trigger this:
							//* assert(o._props, "propchange failed: object has no _props");
						} else if (!prop){
							throw ('propchange failed: property not found')
						}
						
						//* propchange with incorrect from value

						else if(delta.from != prop){
							// console.log(prevPropchange.to, delta.to)
							//*TODO #1 Two propchanges with same path, same “from”, but different “to”
							if(deepEqual(prevPropchange && prevPropchange.path, delta.path) === true && prevPropchange.from === delta.from && prevPropchange.to != delta.to){
								throw "2 deltas w/ same path and from, different to"
							}  else {
								//* reject propchange with incorrect value
								throw 'propchange failed: delta.from does not match current property value'

							}
						}
						
						
						// else if (previousDelta && delta.path === previousDelta.path && delta.from === previousDelta.from && previousDelta.to != delta.to){
						

						// }

						//*TODO #2 Two propchanges with same path, same “from”, same “to”

						else if(previousDelta && delta.path === previousDelta.path && delta.from === previousDelta.from && previousDelta.to === delta.to){
							console.log('snared')
						}

						//*TODO #3 A longer sequence of the basic form of #1


						//*TODO #4 A longer sequence of the basic form of #1


				
						// assert 'from' value matches object's current value
						else if (deepEqual(prop, delta.from) === false){

							console.log(delta.from)
							// throw (delta.to + ' ' +  prop + ' ' +  delta.from)
						} 
						
						// // ! ensure that this does not result a false positive from a correct delta. 
						// else if (previousDelta !== undefined && deepEqual(delta.from, previousDelta.from) === true && deepEqual(delta.to, prop) === false){
							
							
						// 	console.log('current delta', delta, 'previousDelta', previousDelta)
						// 	console.log('delta.from', delta.from, 'prop', prop, 'delta.to', delta.to)
						// 	console.log('\n\nsame from, different to\n\n',  delta)

						// 	// throw ('test')

						// 	// Rebase fix by first applying B1, then inverting, 
						// 	// then A1, then applying a modified version of B1 (B1’) that has the corrected “from” value:
						// 	// B1: propchange @x, a->c
						// 	// o._props[delta.name] = delta.to;
						// 	// ^B1: propchange @x, c->a
						// 	//inverseDelta(delta)
						// 	// A1: propchange @x, a->b
						// 	//o._props[delta.name] = prop;
						// 	// B1*: propchange @x, b*->c
						// 	// applyDeltasToGraph = function (graph, delta)
						// 	// throw ('different to')


						//  } 
						
						else {
							// change it:
							o._props[delta.name] = delta.to;
							// console.log('correct delta', delta)

						}
						
						// // assert o._props match delta props:
						// for (let k in o._props) {
						// 	assert(deepEqual(o._props[k], delta[k]), "delnode failed; properties do not match");
						// }
						// // assert o has no child nodes
						// // keys should either be ['_props'] or just []:
						// let keys = Object.keys(o);
						// assert((keys.length == 1 && keys[0]=="_props") || keys.length == 0, "delnode failed; node has children");
						// delete ctr[name];
					}
					prevPropchange =  delta


				}

				
				//console.log('prev', previousDelta)
				// */
			} break;
		}
	}
	return graph;
}

let makeGraph = function(deltas) {
	let graph = {
		nodes: {},
		arcs: []	
	};
	return graph;
}

let graphFromDeltas = function(deltas) {
	return applyDeltasToGraph(makeGraph(), deltas);
}

let deltasFromGraph = function(graph, deltas, pathprefix="") {
	nodesToDeltas(graph.nodes, deltas, pathprefix);

	for (let a of graph.arcs) {
		// TODO: assert that the paths exist?
		deltas.push({
			op: "connect",
			paths: [ a[0], a[1] ]
		})
	}
	return deltas;
}

function nodesToDeltas(nodes, deltas, pathprefix) {
	for (let name in nodes) {
		if (name == "_props") continue;
		let group = [];
		let n = nodes[name];
		let p = n._props;
		let d = copyProps(n._props, {
			op: "newnode", 
			path: pathprefix + name, 
		});
		group.push(d);
		// also push children:
		nodesToDeltas(n, group, pathprefix+name+".");

		deltas.push(group);
	}
	return deltas;
}

let propToString = function(prop) {
	if (typeof prop == "number") {
		return prop;
	} else if (typeof prop == "string") {
		return `"${prop}"`;
	} else if (Array.isArray(prop)) {
		return `[${prop.map(propToString).join(",")}]`
	}
}

let propsToString = function(props) {
	let res = [];
	for (let k of Object.keys(props)) {
		let v = props[k];
		
		res.push(`${k}=${propToString(v)}`)
	}
	return res.join(", ");
}

let nodeToString = function(node, indent) {
	let keys = Object.keys(node);
	let children = [];
	let props = "";
	if (node._props) {
		props = `[${propsToString(node._props, indent)}]`;
	}
	for (let key of keys) {
		if (key != "_props") {
			let s = `${"  ".repeat(indent)}${key} ${nodeToString(node[key], indent+1)}`;
			children.push(s);
		}
	}

	if (children.length > 0) {
		if (props) props += `\n`
		props += `${children.join("\n")}`;
	} 

	return props;
}

let graphToString = function(graph) {
	assert(graph.nodes);
	assert(graph.arcs);
	let arcstrings = [];
	for (let a of graph.arcs) {
		arcstrings.push(`\n${a[0]} -> ${a[1]}`);
	}
	return `${nodeToString(graph.nodes, 0)}${arcstrings.join("")}`;
}

let deltaToString = function(delta) {
	// { op:"newnode", path:"a", kind:"noise", pos:[10,10] }, 
	let args = [];
	for (let k of Object.keys(delta)) {
		if (k != "op" && k != "path" && k != "paths") {
			args.push(`${k}=${propToString(delta[k])}`);
		}
	}
	let path = delta.path;
	if (!path && delta.paths) {
		path = delta.paths.join(", ");
	}
	return `${delta.op} (${path}) ${args.join(", ")}`
}

let deltasToString = function(deltas, indent) {
	if (indent == undefined) indent = 0
	if (Array.isArray(deltas)) {
		return deltas.map(function(v) {
			return deltasToString(v, indent+1)
		}).join(`\n${"  ".repeat(indent)}`);
	} else {
		return deltaToString(deltas);
	}
}

let floatApproximatelyEqual = function(x, y){
	return (Math.abs(x-y)/Math.abs(x)) < 0.0001;
}

module.exports = {
	makeGraph: makeGraph,

	graphFromDeltas: graphFromDeltas,
	deltasFromGraph: deltasFromGraph,
	inverseDelta: inverseDelta,
	applyDeltasToGraph: applyDeltasToGraph,
	nodesToDeltas: nodesToDeltas,

	// utils:
	findPathContainer: findPathContainer,
	graphToString: graphToString,
	deltasToString: deltasToString,

	deepEqual: deepEqual,
	deepCopy: deepCopy,
}

// let conflict1 = async (deltaA, deltaB, o) => {
// 	/*
// 	A1: propchange @x, a->b
// 	B1: propchange @x, a->c  // cannot be applied because from does not match graph state @x=b

// 	Rebase fix by first applying B1, then inverting, then A1, then applying a modified version of B1 (B1’) that has the corrected “from” value:

// 	B1: propchange @x, a->c
// 	^B1: propchange @x, c->a
// 	A1: propchange @x, a->b
// 	B1*: propchange @x, b*->c
// 	*/

// 	// B1: propchange @x, a->c
// 	applyDeltasToGraph(graphContainer, deltaB)
// 	console.log(graphContainer.nodes.lfo_1.rate)
// 	// o._props[delta.name] = delta.to;
// 	// ^B1: propchange @x, c->a
// 	inverseDelta(deltaB)
// 	// A1: propchange @x, a->b
// 	o[deltaA.name] = foo
// 	//applyDeltasToGraph(graphContainer, deltaA)

// 	// o._props[delta.name] = previousDelta.to;
// 	// B1*: propchange @x, b*->c

// }