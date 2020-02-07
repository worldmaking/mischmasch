#!/usr/bin/env node

const http = require('http');
const url = require('url');
const fs = require("fs");
const path = require("path");
const os = require("os");
const assert = require("assert");
const performance = require('perf_hooks').performance;
const { exec, execSync, spawn, spawnSync, fork } = require('child_process');

const express = require('express');
const WebSocket = require('ws');
const { vec2, vec3, vec4, quat, mat3, mat4 } = require("gl-matrix");
const bottleneck = require('Bottleneck')

const got = require("./got/got")

// 1st cli arg can be the scenefile 
let scenefile = __dirname + "/scene_files/scene_edited.json"
let OTHistoryFile = '../histories/OT_' + Date.now() + '.json'


			//demo_scene = JSON.parse(fs.readFileSync(scenefile, "utf-8")); 
			// turn this into deltas:
			//let deltas = got.deltasFromGraph(demo_scene, []);
			//console.log(deltas)

// declare object for temp storage of OTs for recording sessions
let recordJSON = {}
// declare var for recording status
let recordStatus;

// a local copy of the current graph state, for synchronization purposes
let localGraph = {
	nodes: {},
	arcs: []
}


const MaxAPI = (() => {
    try {Mutation
        return require("max-api");
    } catch(e) {
        console.log("not running in Max")
    }
})();

if (MaxAPI) {
    // MaxAPI.addHandler(MaxAPI.MESSAGE_TYPES.BANG, () => {
    //     MaxAPI.outletBang();
    // });
    // MaxAPI.addHandler(MaxAPI.MESSAGE_TYPES.NUMBER, (n) => {
    //     MaxAPI.outlet("got a number", n);
    // });
    MaxAPI.addHandler("scene", (n) => {
		scene = fs.readFile(path.join(__dirname, scenefile), 'utf8')
		MaxAPI.outlet("scene", scene);
    });
    // MaxAPI.addHandler(MaxAPI.MESSAGE_TYPES.ALL, (handled, ...args) => {
    //     MaxAPI.outlet(`The following inlet event was ${!handled ? "not " : "" }handled`);
    //     MaxAPI.outlet(args);
	// });
	// MaxAPI.addHandler("scene", () =>{
	// 	scene = fs.readFile(__dirname + scenefile)
	// 	MaxAPI.outlet("scene", scene);
	// })
	
	/* why is this necessary?

    (async () => {
        let patch = await MaxAPI.getDict("patch");
        //MaxAPI.post(JSON.stringify(patch), MaxAPI.INFO);
        
        MaxAPI.setDict("patch", {
            a: 1, b: Math.random()
        });
        // updateDict(id, "ab.cd", value) 
        MaxAPI.outletBang();

		})()
		
		*/
}

//////////////////////// 
// let OTHistory = [];
////////////////////////
//let demo_scene = JSON.parse(fs.readFileSync(scenefile, "utf-8")); 
/*{
	"nodes": {
		"a": {
			"_props": { "kind": "noise", "pos": [0.0, 1.5, 0.0], "orient": [0, 0, 0, 1] },
			"signal": { "_props": { "kind": "outlet" } },
			"amp": { _props: { kind: "large_knob" }},
		},
		"b": {
			"_props": { "kind": "dac", "pos": [0.0, 1.0, 0.0], "orient": [0, 0, 0, 1] },
			"source": { "_props": { "kind": "inlet" } }
		},
		"lfo1": {
			"_props": { "kind": "lfo", "pos": [0.0, 1.5, -.3], "orient": [0, 0, 0, 1]},
			"signal": { "_props": { "kind": "outlet" } }
			//third parameter causes array error
			//,"rate": {"_props": {"kind": "param", "value": 1 } }
		},
		"aa": {
			"_props": { "kind": "BEEP", "pos": [0.5, 1.2, 0.0], "orient": [0, 0, 0, 1] },
			"signal": { "_props": { "kind": "outlet" } }
		},
		"x": { "_props": { "kind": "noise", "pos": [-0.5, 1.5, 0.0], "orient": [0, 0, 0, 1] },
		"signal": { "_props": { "kind": "outlet" } } }
	},
	"arcs": [
		["a.signal", "b.source"], 
		[ "aa.signal", "b.source" ]
	]
}*/

//////////////////////// 

const project_path = process.cwd();
const server_path = __dirname;
const client_path = path.join(server_path, "client");
console.log("project_path", project_path);
console.log("server_path", server_path);
console.log("client_path", client_path);

// let ctrl-c quit:
{
	let stdin = process.stdin;
	// without this, we would only get streams once enter is pressed
	if (process.stdin.setRawMode){
		process.stdin.setRawMode(true)
	}
	// resume stdin in the parent process (node app won't quit all by itself
	// unless an error or process.exit() happens)
	stdin.resume();
	// i don't want binary, do you?
	stdin.setEncoding( 'utf8' );
	// on any data into stdin
	stdin.on( 'data', function( key ){
		// ctrl-c ( end of text )
		if ( key === '\u0003' ) {
			process.exit();
		}
		// write the key to stdout all normal like
		process.stdout.write( key );
	});
}

////////////////////////
/*
////////// interactive shell ///////////
function showShell(){
  // show disperf shell cmd
vorpal
.delimiter('msvr$')
.show();
}
showShell();
	
vorpal
  .command('record', 'Outputs "recording session."')
  .action(function(args, callback) {
		recordJSON.length = 0
		this.log('recording will be stored at ', sessionRecording);
		sessionRecording = __dirname + "/session_recordings/session_" + Date.now() + ".json"

		fs.writeFile(sessionRecording, JSON.stringify(recordJSON, null, "  "), "utf-8")


		showShell()
	});

	
vorpal
  .command('stoprecord', 'Outputs "stopped recording & saved file."')
  .action(function(args, callback) {
		console.log('saved session with ' + recordJSON.length + ' deltas');
		callback()
		showShell()
	});
*/
	////////////

const app = express();
app.use(express.static(client_path))
app.get('/', function(req, res) {
	res.sendFile(path.join(client_path, 'index.html'));
});
//app.get('*', function(req, res) { console.log(req); });
const server = http.createServer(app);
// add a websocket service to the http server:
const wss = new WebSocket.Server({ 
	server: server,
	maxPayload: 1024 * 1024, 
});

// send a (string) message to all connected clients:
function send_all_clients(msg, ignore) {
	wss.clients.forEach(function each(client) {
		if (client == ignore) return;
		try {
			client.send(msg);
		} catch (e) {
			console.error(e);
		};
	});
}

// whenever a client connects to this websocket:
let sessionId = 0;
wss.on('connection', function(ws, req) {

	// do any
	console.log("server received a connection");
	console.log("server has "+wss.clients.size+" connected clients");
	//	ws.id = uuid.v4();
	const id = ++sessionId;
	const location = url.parse(req.url, true);
	// ip = req.connection.remoteAddress.split(':')[3] 
	ip = req.headers.host.split(':')[0]
	if(!ip){
		// console.log('vr', req.connection)
		ip = req.ip
	}
	//console.log(ip)
	// const location = urlw.parse(req.url, true);
	// console.log(location)

	// clients[id] = ip
	// if (!clients[ip]){
	// 	clients[ip] = {}
	// }
	// console.log('connected clients, sessionIDs & clientTypes: ', clients)
	// //console.log(req.connection.remoteAddress)
	// let handShakeInterval = setInterval(function(){ 
	// 	console.log('clients handshake: ', clients)
	// 	ws.send(JSON.stringify({
	// 		cmd:'contexts',
	// 		data: clients[ip],
	// 		ip: ip
	// 	})) 
	// }, 3000);
	
	// clients[ip] = {: ip, } 
	// ws.send(JSON.stringify({
	// 	cmd: 'assignID',
	// 	data: id,
	// 	date: Date.now()
	// }))
	
	// You might use location.query.access_token to authenticate or share sessions
	// or req.headers.cookie (see http://stackoverflow.com/a/16395220/151312)
	
	ws.on('error', function (e) {
		if (e.message === "read ECONNRESET") {
			// ignore this, client will still emit close event
		} else {
			console.error("websocket error: ", e.message);
		}
	});

	// what to do if client disconnects?
	ws.on('close', function(connection) {
		//clearInterval(handShakeInterval);
		console.log("connection closed");
        console.log("server has "+wss.clients.size+" connected clients");
	});
	
	// respond to any messages from the client:
	ws.on('message', function(e) {
		if (e instanceof Buffer) {
			// get an arraybuffer from the message:
			const ab = e.buffer.slice(e.byteOffset,e.byteOffset+e.byteLength);
			//console.log("received arraybuffer", ab);
			// as float32s:
			//console.log(new Float32Array(ab));

		} else {
			try {
				handlemessage(JSON.parse(e), ws, id);
			} catch (e) {
				console.log('bad JSON: ', e);
			}
		}
	});
    
	
	// // Example sending binary:
	// const array = new Float32Array(5);
	// for (var i = 0; i < array.length; ++i) {
	// 	array[i] = i / 2;
	// }
    // ws.send(array);
    
    //send_all_clients("hi")
});


function load_scene(filename) {
	scenefile = __dirname + '/scene_files/' + filename;
	//console.log(msg)
	send_all_clients(JSON.stringify({
		cmd: "clear_scene",
		date: Date.now(),
		data: "clear"
	}));
	
	localGraph = JSON.parse(fs.readFileSync(scenefile, "utf-8")); 
	// turn this into deltas:
	let deltas = got.deltasFromGraph(localGraph, []);
	//console.log(deltas)
//console.log(deltas)
	send_all_clients(JSON.stringify({
		cmd: "deltas",
		date: Date.now(),
		data: deltas
	}));

	return deltas;
}


function handlemessage(msg, sock, id) {


	switch (msg.cmd) {
		case "deltas": {

			// synchronize our local copy:
			try {
				got.applyDeltasToGraph(localGraph, msg.data);
			} catch (e) {
				console.warn(e);
			}

			//console.log(msg.data)
			// TODO: merge OTs
			
			let response = {
				cmd: "deltas",
				date: Date.now(),
				data: msg.data
			};
			console.log(msg.data)
			
			// check if the recording status is active, if so push received delta(s) to the recordJSON
			if (recordStatus === 1){
				
				for(i = 0; i < msg.data.length; i++){
					
					msg.data[i]["timestamp"] = Date.now()
					recordJSON.deltas.push(msg.data[i])
				}
				
			}

			//fs.appendFileSync(OTHistoryFile, ',' + JSON.stringify(response), "utf-8")

			//OTHistory.push(JSON.stringify(response))
			console.log(localGraph)
			send_all_clients(JSON.stringify(response));
		} break;

		case "playback":{
			//console.log(msg)/
			console.log(msg.data)
			/*
			let response = {
				cmd: "deltas",
				date: Date.now(),
				data: msg.data
			};
			// NOTE: this is copied from the deltas case, but i've commented out recording the playback since for now it'd just be redundant. 
			// we might, though, at some point want to record when a playback occurred, and note when playback was stopped/looped/overdubbed/etc
			//recordJSON.push(response)
			//fs.writeFileSync(sessionRecording, JSON.stringify(recordJSON, null, "  "), "utf-8")
			send_all_clients(JSON.stringify(response));
			*/
		} break;

		case "initController":{

			// the max patch "control.maxpat" will request the current available sessions & scene files from the server:

			// get recorded sessions
			function fromDir(startPath,filter,callback){		
				if (!fs.existsSync(startPath)){
						console.log("no dir ",startPath);
						return;
				}
				var files=fs.readdirSync(startPath);
				for (var i=0;i<files.length;i++){
					var filename=path.join(startPath,files[i]);
					var stat = fs.lstatSync(filename);
					if (stat.isDirectory()){
							fromDir(filename,filter,callback); //recurse
					} else if (filter.test(filename)) callback(filename);
				};
			};
		
			fromDir(__dirname + '/session_recordings',/\.json$/,function(filename){
				filename = filename.split('\\').pop().split('/').pop();
				filesFound = {
					cmd: "sessionRecordings",
					date: Date.now(),
					data: filename
				};
				send_all_clients(JSON.stringify(filesFound));
			});

			// get scene files
			function fromDir(startPath,filter,callback){		
				if (!fs.existsSync(startPath)){
						console.log("no dir ",startPath);
						return;
				}
				var files=fs.readdirSync(startPath);
				for (var i=0;i<files.length;i++){
					var filename=path.join(startPath,files[i]);
					var stat = fs.lstatSync(filename);
					if (stat.isDirectory()){
							fromDir(filename,filter,callback); //recurse
					} else if (filter.test(filename)) callback(filename);
				};
			};
		
			fromDir(__dirname + '/scene_files',/\.json$/,function(filename){
				filename = filename.split('\\').pop().split('/').pop();
				filesFound = {
					cmd: "scene_files",
					date: Date.now(),
					data: filename
				};
				send_all_clients(JSON.stringify(filesFound));
			});
		} break;

		case "record":{
			// reset session

			// take OTHistory, turn it into a graph. 
			// take that graph turn it back into an OT history (will this remove all redundant deltas? (we want this...))
			// set these deltas as the header for the recorded session file
			// then append the recordJSON in the stopRecord section.
			//let header = {}

			// header['header'] = localGraph
			// console.log(header)
			
			recordJSON = {
				header:{
					scene: localGraph,
					timestamp: Date.now()
				},
				deltas:[]
				
			}
			// recordJSON.push(header)
			let recording = msg.data.replace(/\s/g, "_")
			// save session name as filename provided in this message
			sessionRecording = __dirname + "/session_recordings/" + recording + ".json"
			// push all received deltas to the recordJSON:
			recordStatus = 1
			console.log('session will be stored at', sessionRecording)
			
		} break;

		case "stopRecord":{
			recordStatus = 0

			
			fs.writeFileSync(sessionRecording, JSON.stringify(recordJSON, null, 2), "utf-8")
			
			console.log('session saved at', sessionRecording)

		} break;

		case "clear_scene": {
			// JSON not streamable format so close out the history file 
			//fs.appendFileSync(OTHistoryFile, ']', "utf-8")

			let deltas = load_scene("scene_speaker.json")
			// create new history file & add scene as header
			//OTHistoryFile = '../histories/OT_' + Date.now() + '.json'
			// let header = {}
			// header['header'] = deltas
			//fs.writeFileSync(OTHistoryFile, '[' + JSON.stringify(header), "utf-8")
		} break;
		case "get_scene": {
			
			//demo_scene = JSON.parse(fs.readFileSync(scenefile, "utf-8")); 
			// turn this into deltas:
			let deltas = got.deltasFromGraph(localGraph, []);
			//console.log(deltas)

			// reply only to the requester:
			sock.send(JSON.stringify({
				cmd: "deltas",
				date: Date.now(),
				data: deltas //OTHistory
			}));

		} break;
		case "updated_scene": {
			// // Example sending some greetings:

			// ensure the blank scene isn't overwritten
			ensureBlank = __dirname + '/scene_files/blank_scene.json'
			if (scenefile === ensureBlank){
				console.log('writing to blank scene prevented')
			} else {
				let scenestr = JSON.stringify(msg.scene, null, "\t");
				fs.writeFileSync(scenefile, scenestr, "utf-8");
				//console.log(scenestr)
			}

		} break;

		case "loadScene": {
			load_scene(msg.data);
		} break;

		case "user_pose": {
			//console.log(JSON.stringify(msg.pose))
			// broadcast this data... 

			recordPose = {
				cmd: "user_pose",
				date: Date.now(),
				pose: msg.pose
			}
			let poseDelta = JSON.stringify(recordPose)
			send_all_clients(poseDelta);

			const limiter = new bottleneck({
				maxConcurrent: 1,
				minTime: 30
			});


			// Limit storing of pose data to rate of 30fps
			limiter.schedule(() => {
				//OTHistory.push(poseDelta)
				//fs.appendFileSync(OTHistoryFile, ',' + JSON.stringify(recordPose), "utf-8")

			});
		} break;
		default: console.log("received JSON", msg, typeof msg);
	}
}

server.listen(8080, function() {
	console.log(`server listening`);
	console.log(`vr view on http://localhost:${server.address().port}/index.html`);
});

//// TMP HACK
load_scene("scene_noise.json")


function intervalFunc() {
  console.log(localGraph)
}

//setInterval(intervalFunc, 5500);