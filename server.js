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

const MaxAPI = (() => {
    try {
        return require("max-api");
    } catch(e) {
        console.log("not running in Max")
    }
})();

if (MaxAPI) {
    MaxAPI.addHandler(MaxAPI.MESSAGE_TYPES.BANG, () => {
        MaxAPI.outletBang();
    });
    MaxAPI.addHandler(MaxAPI.MESSAGE_TYPES.NUMBER, (n) => {
        MaxAPI.outlet("got a number", n);
    });
    MaxAPI.addHandler("scene", (n) => {
		scene = fs.readFile(__dirname + "/scene.json", 'utf8')
		MaxAPI.outlet("scene", scene);
    });
    MaxAPI.addHandler(MaxAPI.MESSAGE_TYPES.ALL, (handled, ...args) => {
        MaxAPI.outlet(`The following inlet event was ${!handled ? "not " : "" }handled`);
        MaxAPI.outlet(args);
	});
	// MaxAPI.addHandler("scene", () =>{
	// 	scene = fs.readFile(__dirname + "/scene.json")
	// 	MaxAPI.outlet("scene", scene);
	// })
    
    (async () => {
        let patch = await MaxAPI.getDict("patch");
        MaxAPI.post(JSON.stringify(patch), MaxAPI.INFO);
        
        MaxAPI.setDict("patch", {
            a: 1, b: Math.random()
        });
        // updateDict(id, "ab.cd", value) 
        MaxAPI.outletBang();

    })()
}


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
wss.on('connection', function(ws, req) {
	console.log("server received a connection");
	console.log("server has "+wss.clients.size+" connected clients");
	
	const location = url.parse(req.url, true);
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
				handlemessage(JSON.parse(e), ws);
			} catch (e) {
				console.log('bad JSON: ', e);
			}
		}
	});
    
	// // Example sending some greetings:
	// ws.send(JSON.stringify({
	// 	type: "greeting",
	// 	value: "hello",
	// 	date: Date.now()
	// }));
	// // Example sending binary:
	// const array = new Float32Array(5);
	// for (var i = 0; i < array.length; ++i) {
	// 	array[i] = i / 2;
	// }
    // ws.send(array);
    
    //send_all_clients("hi")
});

function handlemessage(msg, session) {
	switch (msg.cmd) {
		
		default: console.log("received JSON", msg, typeof msg);
	}
}

server.listen(8080, function() {
	console.log(`server listening`);
	console.log(`vr view on http://localhost:${server.address().port}/index.html`);
});

