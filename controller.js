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

let sessionList = []

//const scenefile = "scene_edited.json"
//const playbackSessionJSON = []
var connection = new WebSocket('ws://localhost:8080');


connection.onopen = function () {
	// first clear the filename umenu in this patch
	MaxAPI.outlet('clearPlaybackList', 'clear')
	connection.send(JSON.stringify({
		cmd: "getSessions",
		date: Date.now(),
		data: null
	}));


};

// Log errors
connection.onerror = function (error) {
  console.error('WebSocket Error ' + error);
};


connection.on('message', function incoming(data) {
	//console.log(data);
	
	/*	MaxAPI.post('unhandled message received', e)

*/
data = JSON.parse(data)
	switch(data.cmd){

		case "sessionRecordings":{
			sessionList.push(data.data)
			MaxAPI.outlet('playbackList','append',data.data)
		} break;

		default: {
		//	MaxAPI.post('unhandled message received', data)
		} break;
	} 

});

//
//////////////////////////////////// SESSION RECORDER ////////////////////////////////
MaxAPI.outlet("recordStatus", 0)
MaxAPI.addHandler("record", (filename) => {
	if (sessionList.includes(filename.replace(/\s/g, "_") + '.json') === 0 ){

		connection.send(JSON.stringify({
			cmd: "record",
			date: Date.now(),
			data: filename
		}));
		filename = filename.replace(/\s/g, "_")
		MaxAPI.outlet('playbackList','append',filename + '.json')
	} else {

		MaxAPI.outlet('filenameExists','set', 'invalid: session filename already taken')
	}

})
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
	playbackSession = JSON.parse(fs.readFileSync(__dirname + "/session_recordings/" + filename))

		// console.log(JSON.parse(playbackSession))
	previous = undefined;
	next = undefined;
	times = []
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

			// return;
        //process.exit()
    }

//    if(counter > playbackSession.length)
//    {
       
//     console.log(counter, playbackSession.length)
//     clearTimeout(playback, 0);
//     //counter = 0;
//     return;
//     }


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

