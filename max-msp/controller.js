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
//console.log(got)

const MaxAPI = require("max-api");

const ReconnectingWebSocket = require('reconnecting-websocket');

const options = {
    WebSocket: WebSocket, // custom WebSocket constructor
    connectionTimeout: 1000,
   // maxRetries: 10,
};
//const rws = new ReconnectingWebSocket('ws://my.site.com', [], options);



let sessionList = []
let sceneList = []

//const scenefile = "scene_edited.json"
//const playbackSessionJSON = []
//function connect (){

// create a ws connection which can automatically attempt reconnections if server goes down
let connection = new ReconnectingWebSocket('ws://localhost:8080/', [], options);

// run function when ws opens...
connection.addEventListener('open', () => {
	// clear the filename umenu in the controller.maxpat
	MaxAPI.outlet('clearPlaybackList', 'clear')

	MaxAPI.post('connected to server')
	// request the list of sessions and scenes from the server
	connection.send(JSON.stringify({
		cmd: "initController",
		date: Date.now(),
		data: null
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
	switch(data.cmd){
		// retrieve list of session recording filenames
		case "sessionRecordings":{
			sessionList.push(data.data)
			MaxAPI.outlet('playbackList','append',data.data)
		} break;
		// retrieve list of sceneJSON filenames
		case "scene_files":{
			sceneList.push(data.data)
			MaxAPI.outlet('sceneList','append',data.data)
		} break;

		///////// GEN~ Client ///////////////////////

		case "clear_scene":
		case "deltas":
		case "patch":	
		dataGen = JSON.stringify(data)
		MaxAPI.outlet('toGen', dataGen)
		//MaxAPI.post(JSON.stringify(dataGen))
		{

		}break;


		///////////////////////
		default: {
		//	MaxAPI.post('unhandled message received', data) // probably don't want to print everything else since the server and other clients talk to each other a LOT
		} break;
	} 
})

//////////////////////////////////// LOAD SCENE ////////////////////////////////
// request a scene from the server (and subsequently send it to all clients)
MaxAPI.addHandler("loadScene", (sceneName) => {
	connection.send(JSON.stringify({
		cmd: "loadScene",
		date: Date.now(),
		data: sceneName
	}));
})

//////////////////////////////////// CLEAR SCENE ////////////////////////////////
// clear the scene (except for 1 'outs' module)
MaxAPI.addHandler("clearScene", () => {
	connection.send(JSON.stringify({
		cmd: "clear_scene",
		date: Date.now(),
		data: null
	}));
})

/////////////////// ENSURE SCENE ALWAYS HAS AT LEAST ONE OUTS MODULE ////////////////
MaxAPI.addHandler("ensureOuts", () => {
	let outsRequest = "{\"cmd\":\"deltas\",\"date\":1556119899845,\"data\":[[{\"op\":\"newnode\",\"path\":\"outs_1\",\"kind\":\"outs\",\"pos\":[-2.0605223497200336,0.46826704387316614,-2.0405112532755187],\"orient\":[-0.3121451653567321,0.369889483526838,0.14650496286711281,0.8627186456637955]},[{\"op\":\"newnode\",\"path\":\"outs_1.left\",\"kind\":\"inlet\",\"index\":0}],[{\"op\":\"newnode\",\"path\":\"outs_1.right\",\"kind\":\"inlet\",\"index\":1}],[{\"op\":\"newnode\",\"path\":\"outs_1.volume\",\"kind\":\"small_knob\",\"range\":[0,1],\"taper\":\"log 3.8\",\"value\":1,\"unit\":\"float\"}]]]}"
	
	connection.send(outsRequest);
})


//////////////////////////////////// SESSION RECORDER ////////////////////////////////
// record a sequence of OT deltas as a playable session
MaxAPI.addHandler("record", (filename) => {
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
		MaxAPI.outlet('playbackList','append',checkSpace + '.json')
		MaxAPI.outlet("recordStatus", 1)
	} else {
		// if filename already exists, ignore recording request and throw warning in maxpat
		MaxAPI.outlet('filenameExists','set', 'invalid: session filename already taken')
		MaxAPI.outlet("recordStatus", 0)
	}
})
// tell server to stop the recording, and it will also save the file. 
MaxAPI.addHandler("stopRecord", () => {
	connection.send(JSON.stringify({
		cmd: "stopRecord",
		date: Date.now(),
		data: null
	}));
})

//////////////////////////////////// SESSION PLAYER ////////////////////////////////
MaxAPI.outlet("playbackStatus", 0)
let playbackSession;
let previous;
let next;
let times = []

MaxAPI.addHandler("playback", (filename) => {
	sessionDir = __dirname.substring(0, __dirname.lastIndexOf('/')) + '/session_recordings/'  + filename
	//MaxAPI.post(sessionDir)
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
	MaxAPI.post("starting playback")
	MaxAPI.outlet("playbackStatus", 1)
	setTimeout(playback, times[counter]);
});


MaxAPI.addHandler("stopPlayback", () => {
	// force the timeout to stop by increasing the counter past the array length limit...
	counter = playbackSession.length + 10;
	MaxAPI.post("playback ended")
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
		MaxAPI.outlet("playback", data)
		console.log(playbackSession[counter])
		//connection.send(JSON.stringify(playbackSession[counter]));
		setTimeout(playback, times[counter]);
		counter++
		//console.log(counter)
	} else {
		MaxAPI.post("playback ended")
		MaxAPI.outlet("playbackStatus", 0)
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

