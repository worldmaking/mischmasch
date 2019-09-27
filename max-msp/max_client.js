#!/usr/bin/env node

const http = require('http');
const url = require('url');
const fs = require("fs");
const path = require("path");
const os = require("os");
const assert = require("assert");
const performance = require('perf_hooks').performance;
const { exec, execSync, spawn, spawnSync, fork } = require('child_process');
// const IP = require('ip')
// const ip = IP.address()
const express = require('express');
const WebSocket = require('ws');
//console.log(got)

const max = require("max-api");





////// handshake with the vrContext running on the same machine:
const wss = new WebSocket.Server({ port: 8083 });
 
wss.on('connection', function connection(localHandshake) {
	localHandshake.on('message', function incoming(message) {
		msg = JSON.parse(message)
		switch (msg.cmd){

			case 'handshake':
				max.post('received: %s', message);
				max.outlet('vrContext', message.data)
				vrContextID = data.data.vrContext
			break
		}
  });
 
  localHandshake.send('something');
});






const ReconnectingWebSocket = require('reconnecting-websocket');

const options = {
    WebSocket: WebSocket, // custom WebSocket constructor
    connectionTimeout: 1000,
   // maxRetries: 10,
};
//const rws = new ReconnectingWebSocket('ws://my.site.com', [], options);

let vrContextID;

let sessionList = []
let sceneList = []

// post(ip)


//const scenefile = "scene_edited.json"
//const playbackSessionJSON = []
//function connect (){

// create a ws connection which can automatically attempt reconnections if server goes down
//let connection = new ReconnectingWebSocket('ws://192.168.137.1:8080/', [], options);
let connection;
max.post('node connecting to ip ' + process.argv[2])
if (process.argv[2] === 'localhost'){
	
	connection  = new ReconnectingWebSocket('ws://localhost:8080/', [], options);

	} else if (process.argv[2] && process.argv[2] !== 'localhost'){
	
	connection = new ReconnectingWebSocket('ws://' + process.argv[2] + ':8080/', [], options);

} else {
	max.post('\n\nERROR: websocket server host IP not provided.\nUse \'localhost\' or network IP')
	process.exit()
}

// run function when ws opens...
connection.addEventListener('open', () => {
	// clear the filename umenu in the controller.maxpat
	max.outlet('clearPlaybackList', 'clear')

	max.post('connected to server')
	// request the list of sessions and scenes from the server
	connection.send(JSON.stringify({
		cmd: "initMax_Client",
		date: Date.now(),
		data: 'max_client'
	}));
	connection.send(JSON.stringify({
		cmd: 'clientType',
		data: 'audioContext'
	}));
	connection.send(JSON.stringify({
		cmd: "get_scene",
		date: Date.now(),
		data: null
	}));
	
});

// listen for messages from the server
connection.addEventListener('message', (data) => {
	// the ReconnectingWebSocket package adds an extra layer of JSON stringification... took me a while to figure this out. So, need to parse data.data :(
	data = JSON.parse(data.data)
	//max.post(data)
	switch(data.cmd){
		// retrieve list of session recording filenames
		case "sessionRecordings":{
			sessionList.push(data.data)
			max.outlet('playbackList','append',data.data)
		} break;
		// retrieve list of sceneJSON filenames
		case "scene_files":{
			sceneList.push(data.data)
			max.outlet('sceneList','append',data.data)
		} break;

// 		///////// vr and audio contexts handshake ////////
		//NOTE: this is now in its own ws connection, served locally
// 		case 'contexts':
			
// 			// if (data.data.ip === 'localhost' || data.data[0] === '127.0.0.1'){
// 			// 	vrContextID = data.data[0]
// 			// 	max.post(data.data[0])
// 			// }
// //max.post(data.data.ip)
// 			if(data.data.vrContext){
// 				max.outlet('vrContext', data.data.vrContext)
// 				vrContextID = data.data.vrContext
// 			}
			
// 		break
		///////// GEN~ Client ///////////////////////

		case "clear_scene":
		case "deltas":
		case "patch":	
		dataGen = JSON.stringify(data)
		max.outlet('toGen', dataGen)
		max.post('\n\n', data)

		
		break;
		// headset & controller data
		case "user_pose":
			// get only the HMD & controller data that matches the vrContextID assigned to the client browser running on this same machine
			if (data.id === vrContextID){
				userData = JSON.stringify(data.pose)
				//newCmd = data.cmd
				
				// maxInstances.post(userData.cmd)
				max.outlet('userData', userData)
			}

		break;

		///////////////////////
		default: {
		//	max.post('unhandled message received', data) // probably don't want to print everything else since the server and other clients talk to each other a LOT
		} break;
	} 
})

//////////////////////////////////// LOAD SCENE ////////////////////////////////
// request a scene from the server (and subsequently send it to all clients)
max.addHandler("loadScene", (sceneName) => {
	connection.send(JSON.stringify({
		cmd: "loadScene",
		date: Date.now(),
		data: sceneName
	}));
})

//////////////////////////////////// CLEAR SCENE ////////////////////////////////
// clear the scene (except for 1 'outs' module)
max.addHandler("clearScene", () => {
	connection.send(JSON.stringify({
		cmd: "clear_scene",
		date: Date.now(),
		data: null
	}));
})

/////////////////// ENSURE SCENE ALWAYS HAS AT LEAST ONE OUTS MODULE ////////////////
max.addHandler("ensureOuts", () => {
	let newDate = Date.now()
	let outsRequest = '{\"cmd\":\"deltas\",\"date\":' + newDate + ',\"data\":[[{\"op\":\"newnode\",\"path\":\"outs_1\",\"kind\":\"outs\",\"pos\":[0.0605223497200336,1,0.0405112532755187],\"orient\":[-0.3121451653567321,0.369889483526838,0.14650496286711281,0.8627186456637955]},[{\"op\":\"newnode\",\"path\":\"outs_1.left\",\"kind\":\"inlet\",\"index\":0}],[{\"op\":\"newnode\",\"path\":\"outs_1.right\",\"kind\":\"inlet\",\"index\":1}],[{\"op\":\"newnode\",\"path\":\"outs_1.volume\",\"kind\":\"small_knob\",\"range\":[0,1],\"taper\":\"log 3.8\",\"value\":1,\"unit\":\"float\"}]]]}'
	
	connection.send(outsRequest);
})


//////////////////////////////////// SESSION RECORDER ////////////////////////////////
// record a sequence of OT deltas as a playable session
max.addHandler("record", (filename) => {
	// ensure filename has no spaces (replace them with underscores...)
	checkSpace = filename.replace(/\s/g, "_")
	recordingExists = sessionList.includes(checkSpace)
	// if the filename doesn't already exist, create it
	if (recordingExists === false || recordingExists === 0){
		// tell the server to start recording under the provided filename
		connection.send(JSON.stringify({
			cmd: "record",
			date: Date.now(),
			data: filename
		}));
		// add playback filename to maxpat's list
		max.outlet('playbackList','append',checkSpace + '.json')
		max.outlet("recordStatus", 1)
	} else {
		// if filename already exists, ignore recording request and throw warning in maxpat
		max.outlet('filenameExists','set', 'invalid: session filename already taken')
		max.outlet("recordStatus", 0)
	}
})
// tell server to stop the recording, and it will also save the file. 
max.addHandler("stopRecord", () => {
	connection.send(JSON.stringify({
		cmd: "stopRecord",
		date: Date.now(),
		data: null
	}));
})

//////////////////////////////////// SESSION PLAYER ////////////////////////////////
max.outlet("playbackStatus", 0)
let playbackSession;
let previous;
let next;
let times = []

max.addHandler("playback", (filename) => {
	sessionDir = __dirname.substring(0, __dirname.lastIndexOf('/')) + '/session_recordings/'  + filename
	//max.post(sessionDir)
	playbackSession = JSON.parse(fs.readFileSync(sessionDir))
		// console.log(JSON.parse(playbackSession))
	previous = undefined;
	next = undefined;
	times = []
	// add each OT's UTC into an array, the 'playback' function will then step through each array element and wait the UTC length before stepping to the next element. 
	for (var i = 0, l = playbackSession.length; i < l; i++) {
		var obj = playbackSession[i];

		if (previous){
			next = obj.date
			times.push(next - previous)
			// console.log(obj.date)
			// ...
			previous = next;
		} else{
			previous = obj.date
			times.push(0)
			// console.log(obj.date)
			// ...
		}
	}
	// reset the counter to 0 before running a new playback playbackSession
	counter = 0;
	max.post("starting playback")
	max.outlet("playbackStatus", 1)
	setTimeout(playback, times[counter]);
});


max.addHandler("stopPlayback", () => {
	// force the timeout to stop by increasing the counter past the array length limit...
	counter = playbackSession.length + 10;
	max.post("playback ended")
});


let index = 0
//counter = 0
//console.log('size',playbackSession.length)
let counter = 0;
// step through each OT, sending each one to the server as playback
let playback = function() {
	//counter *= 10;
	if (counter < playbackSession.length){
		data = playbackSession[counter].data
		// connection.send(playbackSession[counter])
		connection.send(JSON.stringify({
		cmd: "playback",
		date: Date.now(),
		data: data
	}));
		max.outlet("playback", data)
		console.log(playbackSession[counter])
		//connection.send(JSON.stringify(playbackSession[counter]));
		setTimeout(playback, times[counter]);
		counter++
		//console.log(counter)
	} else {
		max.post("playback ended")
		max.outlet("playbackStatus", 0)
	}
	// get first and last delta in OT recording
	function firstAndLast(playbackSession) {

		var firstItem = playbackSession[0].date;
		var lastItem = playbackSession[playbackSession.length-1].date;
		
		var objOutput = {};
		objOutput[firstItem]=lastItem
		console.log(firstItem, lastItem, lastItem - firstItem )
		return objOutput;
	}
	var display = firstAndLast(playbackSession);
	console.log(display, times);
}

