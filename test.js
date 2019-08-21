signalServer = new WebSocket('ws://localhost:8082')

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
 
signalServer.on('message', function incoming(message) {
  msg = JSON.parse(message)
  cmd = msg.cmd
    //////////// filter messages for just this peer:

});
