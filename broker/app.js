
'use strict';

// [START appengine_websockets_app]
const WebSocket = require('ws');

const app = require('express')();
app.set('view engine', 'pug');

const server = require('http').Server(app);
const io = require('socket.io')(server);

let clients = {}
let lookup = {}
let connections = 0;
let id = 0;


app.get('/', (req, res) => {
  res.render('index.pug');
});

io.on('connection', socket => {

  //send current list of running sessions
  io.emit('allSessions', clients)

  socket.on('chat message', msg => {
    io.emit('chat message', msg);
  });
});

if (module === require.main) {
  const PORT = process.env.PORT || 8082;
  server.listen(PORT, () => {
    console.log(`App listening on port ${PORT}`);
    console.log('Press Ctrl+C to quit.');
  });
}
// [END appengine_websockets_app]


const wss = new WebSocket.Server({ port: 8083, clientTracking: true });


wss.on('connection', function connection(ws, req, client) {
  id++
  
  // lookup[id] = ws;
  //var id = req.headers['sec-websocket-key'];

  
  ws.on('message', function incoming(message) {
    let msg = JSON.parse(message)

    switch (msg.cmd){
      case 'newClient':
        console.log(msg)
      break;
      case 'newServer':
          // prevent duplicate entries from client if it re-connects
          // IMPORTANT GET THIS TO WORK SOON:
          Object.keys(lookup).forEach(function(key){
            if(lookup[key] === msg.data.hostname){
              delete lookup[key]
            }
          })
          console.log(msg)
          io.emit('addSession', msg.data);
        lookup[id] = msg.data.hostname
        lookup[msg.data.hostname] = id
        // msg.data['backChannelID'] = id
        clients[msg.data.hostname] = msg.data
        //clients[id] = msg.data
        // let newMsg = JSON.stringify({
        //   cmd: 'serverMsg',
        //   data: msg.data.hostname + ' has connected',
        //   date: Date.now() 
        // })
        // broadcast(newMsg)

        // let network = JSON.stringify({
        //   cmd: 'network',
        //   data: clients,
        //   date: Date.now() 
        // })
        // broadcast(network)
        // console.log('clients:', clients)
        // console.log('lookupTable:', lookup)
      break;

      // case 'jackBufferSize':
      // case 'jackServer':  
      // case 'jackSampleRate':
      // case 'iperf3_server':
      //   host = lookup[id]
      //   clients[host][msg.cmd] = msg.data
      //   // if the jack server was previously running at some point, but is no longer, remove the reported buffer and sample rate values
      //   if (msg.cmd === 'jackServer' && msg.data === 'Not Running' && clients[host].jackBufferSize && clients[host].jackBufferSize){  
      //     delete clients[host].jackBufferSize
      //     delete clients[host].jackSampleRate
      //   }
      //   updateNetwork(clients)
      break;

      case 'hardReset':
        // tell all clients that signal server has been reset
        // broadcast(msg)
      break;
            //console.log(clients)

      
      default:
        console.log(lookup[id] + ' sent unhandled message ' + msg)
      break;

      

      }
  });

  ws.on('close', function(code, reason) {

    let d = lookup[id] + ' has disconnected'
    // let msg = JSON.stringify({
    //   cmd: 'serverMsg',
    //   data: d,
    //   date: Date.now() 
    // })

    io.emit('removeSession', lookup[id])

    // broadcast(msg)
    console.log(d)
    // remove client info from list of active clients
    delete clients[id]
  })
});

  function broadcast(msg){
    wss.clients.forEach(function each(client) {
      if (client.readyState === WebSocket.OPEN) {
        client.send(msg);
      }
    });
  }

function updateNetwork(msg){
  
  network = JSON.stringify({
    cmd: 'network',
    data: msg,
    date: Date.now() 
  })
  broadcast(network)
}
// use this to reset the signal server from a client. 
function hardReset(){
  
}
