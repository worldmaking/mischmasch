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

//const scenefile = "scene_edited.json"
//const sessionJSON = []
var connection = new WebSocket('ws://localhost:8080');


connection.onopen = function () {
    


};

// Log errors
connection.onerror = function (error) {
  console.error('WebSocket Error ' + error);
};

// Log messages from the server
connection.onmessage = function (e) {

};

MaxAPI.outlet("playbackStatus", 0)

let session;
let previous;
let next;
let times = []

MaxAPI.addHandler("playback", (filename) => {
	session = JSON.parse(fs.readFileSync(__dirname + "/session_recordings/" + filename))

		// console.log(JSON.parse(session))
	previous = undefined;
	next = undefined;
	times = []
	for (var i = 0, l = session.length; i < l; i++) {
			var obj = session[i];

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
	// reset the counter to 0 before running a new playback session
	counter = 0;
	MaxAPI.post("starting playback")
	MaxAPI.outlet("playbackStatus", 1)
	setTimeout(playback, times[counter]);

});


MaxAPI.addHandler("stopPlayback", () => {
	// force the timeout to stop by increasing the counter past the array length limit...
	counter = session.length + 10;
	MaxAPI.post("playback ended")

});


let index = 0
//counter = 0
//console.log('size',session.length)
let counter = 0;
let playback = function() {



    //counter *= 10;
    if (counter < session.length){
        data = session[counter].data
       // connection.send(session[counter])
       connection.send(JSON.stringify({
        cmd: "playback",
        date: Date.now(),
				data: data
				
		}));
			MaxAPI.outlet("playback", data)
        console.log(session[counter])
        //connection.send(JSON.stringify(session[counter]));
        setTimeout(playback, times[counter]);
        counter++
       //console.log(counter)
    } else {
			MaxAPI.post("playback ended")
			MaxAPI.outlet("playbackStatus", 0)

			// return;
        //process.exit()
    }

//    if(counter > session.length)
//    {
       
//     console.log(counter, session.length)
//     clearTimeout(playback, 0);
//     //counter = 0;
//     return;
//     }


function firstAndLast(session) {

	var firstItem = session[0].date;
	var lastItem = session[session.length-1].date;
	
	var objOutput = {};
	objOutput[firstItem]=lastItem
	console.log(firstItem, lastItem, lastItem - firstItem )
	return objOutput;
	}
	
	var display = firstAndLast(session);
	
	console.log(display, times);
    
}

