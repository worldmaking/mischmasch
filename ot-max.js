
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
console.log(got)

const scenefile = "scene_edited.json"

const MaxAPI = (() => {
    try {
        return require("max-api");
    } catch(e) {
        console.log("not running in Max")
    }
})();


MaxAPI.addHandler("ot", (msg) => {

    var ot = JSON.parse(msg)

    cmd = ot.cmd

    switch(cmd){

        case "deltas":
            MaxAPI.post(ot.data)
            MaxAPI.setDict("delta", ot)
        break;

        case "patch":

        break;

        case "user_pose":

        break;

        default:

        MaxAPI.post("unknown msg received: ", msg)
    }
    MaxAPI.outlet(ot.cmd);
    

    // var jsonString = JSON.stringify(jsonObjectFromSomewhere);
//var d = new Dict("ot");
//d.parse(msg);

//	var cmd = JSON.stringify(msg.cmd)

//	switch (
//var pose = new Dict("pose");
//pose.parse(msg.pose);

});


function client(msg){

    


// var jsonString = JSON.stringify(jsonObjectFromSomewhere);
var d = new Dict("ot");
d.parse(msg);

//	var cmd = JSON.stringify(msg.cmd)

//	switch (
var pose = new Dict("pose");
pose.parse(msg.pose);
}
