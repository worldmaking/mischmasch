const WebSocket = require('ws');
const ip = require('ip')
const express = require('express');
const hostname = require('hostname')
const signalServer = new WebSocket('ws://localhost:8083')


signalServer.on('open', function open() {
  let newServer = JSON.stringify({
    cmd: 'newServer',
    data: {
      hostname: hostname(),
      ip: ip.address(),
    },
    date: Date.now() 
  })
  signalServer.send(newServer);
  //process.exit()
});

signalServer.on('error', cb =>{
	console.log('\n\n\n\n\n\n\n', cb, '\n\n\n\n\n\n\n')
})
signalServer.on('message', function incoming(message) {
  msg = JSON.parse(message)
  cmd = msg.cmd
    //////////// filter messages for just this peer:

});