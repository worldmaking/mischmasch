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

const username = require('username')
const filename = path.basename(__filename)

const got = require('../gotlib/got.js')

const ReconnectingWebSocket = require('reconnecting-websocket');

const options = {
    WebSocket: WebSocket, // custom WebSocket constructor
    connectionTimeout: 1000,
   // maxRetries: 10,
};
//const rws = new ReconnectingWebSocket('ws://my.site.com', [], options);

let localGraph = {
	nodes: {		
	},
	arcs: [
	]

}

let sessionList = []
let sceneList = []

// create a ws connection which can automatically attempt reconnections if server goes down
//let connection = new ReconnectingWebSocket('ws://192.168.137.1:8080/', [], options);
let connection;
let connectionStatus = 0
connection  = new ReconnectingWebSocket('ws://localhost:8080/', [], options);


// run function when ws opens...
connection.addEventListener('open', () => {
	connectionStatus = 1
	max.outlet('toAudioviz', 1)
	max.outlet('loadbang')
	// clear the filename umenu in the controller.maxpat
	max.outlet('clearPlaybackList', 'clear')
	connection.send(JSON.stringify({ cmd:"maxClientStatus"}))
	max.post('connected to localWebsocketServer')
	// request the list of sessions and scenes from the server
	// connection.send(JSON.stringify({
	// 	cmd: "initMax_Client",
	// 	date: Date.now(),
	// 	data: 'max_client'
	// }));
	// connection.send(JSON.stringify({
	// 	cmd: 'clientType',
	// 	data: 'audioContext'
	// }));
	connection.send(JSON.stringify({
		cmd: "get_scene",
		date: Date.now(),
		data: null
	}));
	
});
tempcount = 0
// listen for messages from the server
connection.addEventListener('message', (data) => {
	// the ReconnectingWebSocket package adds an extra layer of JSON stringification... took me a while to figure this out. So, need to parse data.data :(
	data = JSON.parse(data.data)
	switch(data.cmd){

		// case deltas
		case "deltas":
		// in case the nuclear option was called
		case "nuke":
			// case "patch":	
			deltas = JSON.stringify(data)
			max.outlet('fromLocalWebsocket', deltas)

		break;

		case "HMD":
			max.outlet('hmd', 'position', data.data.pos[0], data.data.pos[1], data.data.pos[2], 'quat', data.data.orient[0], data.data.orient[1], data.data.orient[2], data.data.orient[3])
		break 

		case "rightWandPos":
			max.outlet('wands', 'rightWand', JSON.stringify(data.data))

		break

		default: {
		//	max.post('unhandled message received', data) // probably don't want to print everything else since the server and other clients talk to each other a LOT
		} break;
	} 
})


connection.addEventListener('close', () => {
	max.post('connection closed!')
	connectionStatus = 0
	max.outlet('toAudioviz', 0)
	max.outlet('hardReset')
	localGraph = {
		nodes: {		
		},
		arcs: [
		]
	}
})

max.addHandler('audiovizLookup', (audiovizLookup)=>{
	if(connectionStatus === 1){
		connection.send(JSON.stringify({
			cmd: "audiovizLookup",
			date: Date.now(),
			data: [audiovizLookup]
		}));
	}
})

max.addHandler('clearScene', ()=>{
	connection.send(JSON.stringify({
		cmd: "hostClearScene",
		date: Date.now(),
		data: null
	}));
})


