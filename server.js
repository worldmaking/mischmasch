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

const vorpal = require('vorpal')();



const got = require("./got/got")
console.log(got)

// 1st cli arg can be the scenefile 
let scenefile;
if (process.argv[2]){
	scenefile = process.argv[2]
} else {
	scenefile = "scene_edited.json"
}
// declare array for temp storage of OTs for recording sessions
let sessionJSON = []
// declare var for recording status
let recordStatus;

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

let demo_scene = JSON.parse(fs.readFileSync(scenefile, "utf-8")); 
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
		sessionJSON.length = 0
		this.log('recording will be stored at ', sessionRecording);
		sessionRecording = __dirname + "/session_recordings/session_" + Date.now() + ".json"

		fs.writeFile(sessionRecording, JSON.stringify(sessionJSON, null, "  "), "utf-8")


		showShell()
	});

	
vorpal
  .command('stoprecord', 'Outputs "stopped recording & saved file."')
  .action(function(args, callback) {
		console.log('saved session with ' + sessionJSON.length + ' deltas');
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
	console.log("server received a connection");
	console.log("server has "+wss.clients.size+" connected clients");
	
	const id = ++sessionId;
	const location = url.parse(req.url, true);
	// You might use location.query.access_token to authenticate or share sessions
	// or req.headers.cookie (see http://stackoverflow.com/a/16395220/151312)
	console.log(id)
	
	ws.on('error', function (e) {
		if (e.message === "read ECONNRESET") {
			// ignore this, client will still emit close event
		} else {
			console.error("websocket error: ", e.message);
		}
	});

	// what to do if client disconnects?
	ws.on('close', function(connection) {
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



function handlemessage(msg, sock, id) {
	switch (msg.cmd) {
		case "deltas": {
			//console.log(msg.data)
			// TODO: merge OTs
			let response = {
				cmd: "deltas",
				date: Date.now(),
				data: msg.data
			};
			// check if the recording status is active, if so push received delta(s) to the sessionJSON
			if (recordStatus === 1){
				sessionJSON.push(response)
			}
			
			send_all_clients(JSON.stringify(response));
		} break;

		case "playback":{
			//console.log(msg)
			let response = {
				cmd: "deltas",
				date: Date.now(),
				data: msg.data
			};
			// NOTE: this is copied from the deltas case, but i've commented out recording the playback since for now it'd just be redundant. 
			// we might, though, at some point want to record when a playback occurred, and note when playback was stopped/looped/overdubbed/etc
			//sessionJSON.push(response)
			//fs.writeFileSync(sessionRecording, JSON.stringify(sessionJSON, null, "  "), "utf-8")
			send_all_clients(JSON.stringify(response));

		} break;

		case "getSessions":{

			// the max patch "control.maxpat" will request the current available sessions from the server:
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
		} break;

		case "record":{
			// reset session
			sessionJSON = []
			let recording = msg.data.replace(/\s/g, "_")
			// save session name as filename provided in this message
			sessionRecording = __dirname + "/session_recordings/" + recording + ".json"
			// push all received deltas to the sessionJSON:
			recordStatus = 1
			console.log('session will be stored at', sessionRecording)

		} break;

		case "stopRecord":{
			recordStatus = 0
			fs.writeFileSync(sessionRecording, JSON.stringify(sessionJSON, null, "  "), "utf-8")
			console.log('session saved at', sessionRecording)

		} break;
		
		case "clear_scene": {

			scenefile = 'scene_blank.json'
			console.log(msg)
			send_all_clients(JSON.stringify({
				cmd: "clear_scene",
				date: Date.now(),
				data: "clear"
			}));

			blankScene = JSON.parse(fs.readFileSync(scenefile, "utf-8")); 
			// turn this into deltas:
			let deltas = got.deltasFromGraph(blankScene, []);
			//console.log(deltas)

			send_all_clients(JSON.stringify({
				cmd: "deltas",
				date: Date.now(),
				data: deltas
			}));

		} break;
		case "get_scene": {
			demo_scene = JSON.parse(fs.readFileSync(scenefile, "utf-8")); 
			// turn this into deltas:
			let deltas = got.deltasFromGraph(demo_scene, []);
			//console.log(deltas)

			send_all_clients(JSON.stringify({
				cmd: "deltas",
				date: Date.now(),
				data: deltas
			}));

		} break;
		case "updated_scene": {
			// // Example sending some greetings:
			let scenestr = JSON.stringify(msg.scene, null, "\t");
			fs.writeFileSync(scenefile, scenestr, "utf-8");
		} break;
		case "user_pose": {
			//console.log(JSON.stringify(msg.pose))
			// broadcast this data... 
			send_all_clients(JSON.stringify({
				cmd: "user_pose",
				date: Date.now(),
				pose: msg.pose
			}));
		} break;
		default: console.log("received JSON", msg, typeof msg);
	}
}

server.listen(8080, function() {
	console.log(`server listening`);
	console.log(`vr view on http://localhost:${server.address().port}/index.html`);
});

