const fs = require('fs');
const path = require("path")
const url = require('url');
const assert = require("assert");
const http = require("http");
const https = require("https");

const express = require("express");
const ws = require("ws");
const { v4: uuidv4 } = require("uuid")
const { Message, PoseData } = require('./public/networkMessages.js');
const jsonpatch = require("json8-patch");
const { exit } = require("process");
const dotenv = require("dotenv").config();

const merge = require('./public/merge.js');


// this will be true if this server is running on Heroku
const IS_HEROKU = (process.env._ && process.env._.indexOf("heroku") !== -1);
// this will be true if we are running on Heroku (HTTP ONLY), or there's no .env file
const IS_HTTP = IS_HEROKU || (!process.env.PORT_HTTP);

const PORT_HTTP = IS_HTTP ? (process.env.PORT || 3000) : (process.env.PORT_HTTP || 80);
const PORT_HTTPS = process.env.PORT_HTTPS || 443;
const PORT = IS_HTTP ? PORT_HTTP : PORT_HTTPS;
//const PORT_WS = process.env.PORT_WS || 8090; // not used unless you want a second ws port

const PUBLIC_PATH = path.join(__dirname, "public");

// allow cross-domain access (CORS)
const app = express();
app.use(function(req, res, next) {
	res.header('Access-Control-Allow-Origin', '*');
	res.header('Access-Control-Allow-Methods', 'GET, OPTIONS');
	res.header('Access-Control-Allow-Headers', 'Content-Type');
	return next();
});

// promote http to https:
if (!IS_HTTP) {
	http.createServer(function(req, res) {
        res.writeHead(301, { "Location": "https://" + req.headers['host'] + req.url });
        res.end();
    }).listen(PORT_HTTP);
}

// create the primary server:
const server = IS_HTTP ? http.createServer(app) : https.createServer({
	key: fs.readFileSync(process.env.KEY_PATH),
	cert: fs.readFileSync(process.env.CERT_PATH)
}, app);

// serve static files from PUBLIC_PATH:
app.use(express.static(PUBLIC_PATH)); 
// default to index.html if no file given:
app.get("/", function(req, res) {
    res.sendFile(path.join(PUBLIC_PATH, "index.html"))
});
// add a websocket server:
const wss = new ws.Server({ server });
// start the server:
server.listen(PORT, function() {
	console.log("\nNode.js listening on port " + PORT);
});

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ 

console.log("GRAHAMS GREAT TEST")

// Audio Server 

require('child_process').fork('audioSignalingServer.js');

//if (location.hostname === "localhost" || location.hostname === "127.0.0.1"){
	//require('child_process').fork('audioSignalingServer.js');
// }

// else{
// 	//socket = io('https://agile-basin-71343.herokuapp.com/', { transports : ['websocket'] })
// }



const demoproject = {
  threejs: {
	geometries: [{ uuid: "geom_cube", type: "BoxGeometry" }],
	materials: [{ uuid: "mat_cube", type: "MeshStandardMaterial" }],
	object: {
		type: "Scene",
		children: [
			{ type: "Mesh", geometry: "geom_cube", material: "mat_cube", castShadow: true, matrix: [
				0.8775825618903728,
				0.22984884706593015,
				-0.4207354924039482,
				0,
				0,
				0.8775825618903728,
				0.47942553860420295,
				0,
				0.47942553860420295,
				-0.4207354924039482,
				0.7701511529340699,
				0,
				0,
				1.5,
				0,
				1
			]}
		]
	}
  }
};



const clients = {}
// a set of uniquely-named rooms
// each room would have a list of its occupants
// a client can only be in one room at a time
const rooms = {
	
}

// Server ID used for automerge operations.
const serverID = newID();
console.log('server ID: ' + serverID);

// get (or create) a room:
function getRoom(name="default") {
	if (!rooms[name]) {
		
		rooms[name] = {
			name: name,
			clients: {},
			project: demoproject,
			// Automerge state tracking for the shared scene in this room.
			merger: new merge.Merger(null, serverID),
			syncNeeded: false
		}
	}
	return rooms[name]
}

/**
 * Send a message to all users in a room.
 * @param {Room} room
 * @param {Message} message 
 */
function notifyRoom(room, message) {	
	if (!room) return;
	const clientsInRoom = Object.values(room.clients);
	message.sendToAll(clientsInRoom);
}

// generate a unique id if needed
// verify id is unused (or generate a new one instead)
// returns 128-bit UUID as a string:
function newID(id="") {
	// Removing hyphens so these IDs can double as automerge actor IDs (AM will not accept hyphens)
	while (!id || clients[id]) id = uuidv4().replace(/-/g, '');
	return id;
}

// Handle incoming connections as a new user joining a room.
wss.on('connection', (socket, req) => {
	// Read the path from the connection request and treat it as a room name, sanitizing and standardizing the format.
	// Actual room name might differ from this, if it's empty and we need to substitute a "default" instead.
	const requestedRoomName = url.parse(req.url).pathname.replace(/\/*$/, "").replace(/\/+/, "/")
	
	const clientID = newID();
	let client = {
		socket: socket,
		room: getRoom(requestedRoomName),
		shared: {
			// Structure for any rapidly-changing data (poses, etc.)
			volatile: {
				id: clientID,
				poses: [new PoseData()],
			},
			// Structure for rarely-changing user configuration (display name, colour, etc.)
			user: {}
		}
	}
	clients[clientID] = client
	// enter this room
	client.room.clients[clientID] = client;

	client.room.merger.addClient(clientID);

	client.trySync = function() {
		const payload = client.room.merger.makeSyncMessage(clientID);
		if (payload) {
			const toSend = `[${payload.toString()}]`;
			const message = new Message('sync', toSend);
			//console.log('sending: ', toSend, typeof(toSend), 'to: ', clientID);
			message.sendWith(socket);
			return true;
		}
		return false;
	}

	// Convenience function for getting everyone in the room *except* this client.
	function getOthersInRoom() {
		return Object.values(client.room.clients).filter(c => c.shared.volatile.id != clientID);
	}

	console.log(`client ${client.shared.volatile.id} connecting to room ${client.room.name}`);
	
	socket.on('message', (data) => {
		const msg = Message.fromData(data);
		
		switch(msg.cmd) {
			case "pose":
				// New pose update (and possibly other rapidly-changing data) from the client.
				client.shared.volatile = msg.val;
				// Insert our ID into this structure, so we can just batch-send all the volatile
				// info together and it already has our ID packed in.
				client.shared.volatile.id = clientID;			
				break;
			case "user": 
				// TODO: Send update to other users about changed info.
				client.shared.user = msg.val;

				// Tell everyone about the new/updated user.
				(new Message("user", {id: clientID, user: msg.val})).sendToAll(getOthersInRoom());
				break;
			case "sync":
				// Handle an automerge synchronization message from the client.
				client.room.merger.handleSyncMessage(JSON.parse(msg.val), clientID);
				// Flag that we may have new updates to propagate out to the other users in the room.
				client.room.syncNeeded = true;
				// Check to see if we need to reply back with more synchronization conversation,
				// and if so, do so.
				client.trySync();
				break;
		}	
	});

	socket.on('error', (err) => {
		console.log(err)
		// should we exit?
	});

	socket.on('close', () => {
		// console.log(Object.keys(clients))
		delete clients[clientID]

		// remove from room
		if (client.room) delete client.room.clients[clientID]


		// Tell everyone this user left.		
		notifyRoom(client.room, new Message("exit", clientID));

		console.log(`client ${clientID} left room ${client.room.name}`);		
	});

	// Welcome the new user and tell them their unique id.
	// TODO: Tell them their spawn position too.
	(new Message("handshake", {
		id: clientID, 
		serverID: serverID,
		others: getOthersInRoom().map(o=>o.shared)
	})).sendWith(socket);

	// Share the current 3D scene with the user.
	//(new Message("project", client.room.project)).sendWith(socket);
	client.trySync();
});

setInterval(function() {
	for (let roomid of Object.keys(rooms)) {
		const room = rooms[roomid];
		const clientlist = Object.values(room.clients);
		const message = new Message("others", clientlist.map(o=>o.shared.volatile));
		message.sendToAll(clientlist);

		if (room.syncNeeded) {
			for (let client of clientlist) {
				client.trySync();
			}
		}
		room.syncNeeded = false;
	}
}, 1000/30);