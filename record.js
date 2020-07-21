
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



const got = require("./gotlib/got")

const a = JSON.parse(fs.readFileSync(__dirname + "/session_recordings/session_1555703001037.json", "utf-8"))

let graph = got.applyDeltasToGraph(a, []);
console.log(a)

for (var i = 0, l = a.length; i < l; i++) {
  var obj = a[i]
  console.log(obj.data)
}
// test = got.graphFromDeltas(OTHistory);
// console.log(test)