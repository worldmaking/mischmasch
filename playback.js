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

const got = require("./got/got")
//console.log(got)

//const scenefile = "scene_edited.json"
//const sessionJSON = []
let session;
if (process.argv[2]){
    session = JSON.parse(fs.readFileSync("D:\\github\\msvr\\session_recordings\\session_" + process.argv[2] + ".json"))
} else {
    console.log('error! first argument required: supply the utc time stamp of the session recording to playback \n\nhint: its the number in the filename, i.e. node playback.js 1555683230855')
    process.exit()
}

// 1555106414852
// 1555683230855
var connection = new WebSocket('ws://localhost:8080');

connection.onopen = function () {
    setTimeout(myFunction, times[counter]);


};

// Log errors
connection.onerror = function (error) {
  console.error('WebSocket Error ' + error);
};

// Log messages from the server
connection.onmessage = function (e) {

};

// console.log(JSON.parse(session))
let previous;
let next;
let times = []
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
// let arrayIndex = 0

// let counter = 0;

// function elapse(){
//     var intervalId = setInterval(function(){
//         var timoutId = setTimeout(function(){ 
//             console.log("wait for me!");
//             console.log(times[counter])
//         }, parseInt(times[counter]));
//         //console.log(times[counter])
//         counter++

//         //console.log("wait for me!");
//      }, parseInt(times[counter]));
// }

// elapse()
/*
let index = 0
counter = 0
function elapse(){
    var intervalId = setInterval(function(){
//         var timoutId = setTimeout(function(){ 
//             console.log("wait for me!");
//             console.log(times[counter])
//         }, parseInt(times[counter]));
//         //console.log(times[counter])
//         counter++
        // var counter = 0;

        index = times[counter]

        console.log(counter, index, session[index])
        counter++
        //console.log("wait for me!");
    }, 1 * index);
     //elapse()

}

elapse()

*/
let index = 0
//counter = 0
//console.log('size',session.length)
var counter = 0;
var myFunction = function() {
    //counter *= 10;
    if (counter < session.length){
        data = session[counter].data
       // connection.send(session[counter])
       connection.send(JSON.stringify({
        cmd: "playback",
        date: Date.now(),
        data: data
    }));
        console.log(session[counter])
        //connection.send(JSON.stringify(session[counter]));
        setTimeout(myFunction, times[counter]);
        counter++
       //console.log(counter)
    } else {
        console.log('playback ended')
        // return;
        process.exit()
    }

//    if(counter > session.length)
//    {
       
//     console.log(counter, session.length)
//     clearTimeout(myFunction, 0);
//     //counter = 0;
//     return;
//     }
    
}

//var myArray = ['Rodel', 'Mike', 'Ronnie', 'Betus'];

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