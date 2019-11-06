const express = require('express');
const WebSocket = require('ws');
const rws = require('reconnecting-websocket');
const fs = require('fs')

const options = {
    WebSocket: WebSocket, // custom WebSocket constructor
    connectionTimeout: 1000,
   // maxRetries: 10,
};

// create a ws connection which can automatically attempt reconnections if server goes down
ws = new rws('ws://localhost:8080/', [], options);

ws.addEventListener('open', () => {
  console.log('open')
})
 
  ws.addEventListener('message', (data) => {
  })