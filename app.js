/*
  Goal:

  Want to establish P2P socket connections between clients over remote network, to make a teaparty
  But we don't know in advance the IP addresses or who is online, so we use a remote teaparty:
  - first we connect to the remote teaparty and let them know our IP, name, and other stats 
  - (we should also let the teaparty know when we leave)
  - the teaparty maintains a list of such connected users
  - the teaparty shares with all users the connection info for all the users, including updating when users join and leave
  - users use this information to establish direct P2P connections between each other

  Migrating host model
  - teaparty (signal server) chooses who is host (ground truth) at any time
  - normally it would be the first to connect, but could be migrated to next partygoer if the host exits (e.g. internet dropout)
  - everyone would have a socket connection to current host, and assume that the host has the 'ground truth' for merging OTs. 

  Future: many worlds, like server rooms. Anyone can start a world and invite. The default world is open like a lobby. 
  For now just do this default world.

  Q: does it make sense to use websockets for this?
  is there a more natural framework for such networks? e.g. the BUS pattern from nanomsg?

*/

// NOTE: The heroku app 'teaparty' will go to sleep if it goes 30 minutes before 
// receiving a connection request from an app.js. So, when you run app.js don't be 
// surprised if it takes 10-20 seconds to receive a response from teaparty

// most widely-used websocket module for node.js
const webSocket = require('ws');
const webSocketServer = webSocket.Server;
// 
const publicIP = require('public-ip');
// https://www.npmjs.com/package/username Get the username of the current user
// It first tries to get the username from the SUDO_USER LOGNAME USER LNAME USERNAME environment letiables. Then falls back to $ id -un on macOS / Linux and $ whoami on Windows, in the rare case none of the environment letiables are set. The result is cached.
const username = require('username')
// https://www.npmjs.com/package/reconnecting-websocket WebSocket that will automatically reconnect if the connection is closed
const ReconnectingWebSocket = require('reconnecting-websocket');
// https://www.npmjs.com/package/progress
// cute way to show progress on the command line
const ProgressBar = require('progress');

// const http = require('http');
// const express = require('express');
// const url = require('url');
const fs = require("fs");
const path = require("path");
const bottleneck = require('Bottleneck')
const got = require("./got/got")


// all websockets

// teapartyWebsocket operates on port 8090, runs as a client, and connects to the 
// teaparty (heroku cloud instance)
let teapartyWebsocket

// deltaWebsocket operates on port 8080, and is assigned as either server or client 
// by the teaparty. it's what communicates with all other machines (for got deltas)
let deltaWebsocket

// localWebsocket operates on port 8081, and handles communication between other 
// clients apps like VR and the max client
let localWebsocket

// still up for debate, but this is for non-delta data (like HMD and controller pos), 
// should be broadcast to all nodes. so likely a ws is not the right choice, 
// instead see about a mesh implementation
let p2pWebsocket 

/// paths
const project_path = process.cwd();
const server_path = __dirname;
const client_path = path.join(server_path, "client");
console.log("project_path", project_path);
console.log("server_path", server_path);
console.log("client_path", client_path);
// // // // // //

// let ctrl-c quit:
{
	let stdin = process.stdin;
	// without this, we would only get streams once enter is pressed
	if (process.stdin.setRawMode){
		process.stdin.setRawMode(true)
	}
	// resume stdin in the parent process (node app won't quit all by itself
	// unless an error or process.exit() happens)
	stdin.resume();
	// i don't want binary, do you?
	stdin.setEncoding( 'utf8' );
	// on any data into stdin
	stdin.on( 'data', function( key ){
		// ctrl-c ( end of text )
		if ( key === '\u0003' ) {
			process.exit();
		}
		// write the key to stdout all normal like
		process.stdout.write( key );
	});
}


// note we're not setting up an express instance. 


// fix for OSX because /usr/local/bin is not inherited by the Node.js script 
// (.bash etc. profile is not inherited automatically)
//process.env.PATH = [process.env.PATH, "/usr/local/bin"].join(":");

// figure out where the teaparty for to the teaparty is?
let isConnectedToteaparty = 0; // becomes 1 when connected to teaparty
const teapartyAddress = 
    (process.argv[2] === 'lan' && process.argv[3]) ? process.argv[3]
  : (process.argv[2] === 'localhost') ? '127.0.0.1'
  : "teaparty.herokuapp.com";
const teapartyWebsocketPort = '8090';
const teapartyWebsocketAddress = 
  (process.argv[2] === 'lan' && process.argv[3]) || (process.argv[2] === 'localhost') ? `ws://${teapartyAddress}:${teapartyWebsocketPort}`
  : `ws://${teapartyAddress}/${teapartyWebsocketPort}`;

// TODO this is the port used for P2P connections
// const teapartyP2PWebsocketPort = 8081;

const rwsOptions = {
  // make rws use the webSocket module implementation
  WebSocket: webSocket, 
  // ms to try reconnecting:
  connectionTimeout: 30000,
  //debug:true, 
}

// attempt to connect to teaparty teaparty
// returns the websocket via a Promise
function teapartyWebsocketConnect() {
  return new Promise((resolve, reject) => {
    // create a websocket to find out who is at the teaparty:
    console.log(`attempting to connect to teaparty at ${teapartyWebsocketAddress}`)
    teapartyWebsocket = new ReconnectingWebSocket(teapartyWebsocketAddress, [], rwsOptions);
    // show a progress bar while connecting:
    let bar = new ProgressBar(':bar', { total: 25 });
    let progressBarTimer = setInterval(function () {
      bar.tick();
      if (bar.complete) {
          clearInterval(progressBarTimer)
          // TODO: should it give up like this, or maybe ask user if they want to retry?
          reject(`connection timeout: ${teapartyAddress} might be down`);
      }
    }, 1000);
    
    // fail the promise if the server responds with an error
    teapartyWebsocket.addEventListener('error', (error) => {
      console.log(`connection error from ${teapartyAddress}:`)
      clearInterval(progressBarTimer); 
      reject(error.error);
    });
    
    // on successful connection to teaparty:
    teapartyWebsocket.addEventListener('open', () => {
      clearInterval(progressBarTimer);
      resolve(teapartyWebsocket);
    });
  });
}

let name;
if (process.argv[3]){
  name = process.argv[3]
} else {
  name = username.sync()
}

let thisClientConfiguration = {
  // get a username for this machine:
  username: name,
  // ip is figured out during init()
  ip: null, 
  // eventually, app.js will maintain status of connected client(s) and report them to the teaparty
  vr: null,
  sound: null,
  // for example, if someone wanted to observe a performance but not be a player:
  spectator: 0
};

// run everything inside an async() so we can await as needed:
async function init() {

  try {
    // get our public IP address:
    thisClientConfiguration.ip = await publicIP.v4()
    //=> '46.5.21.123'
    //thisClientConfiguration.ip = await publicIP.v6()
    //=> 'fe80::200:f8ff:fe21:67cf'
  } catch(e) {
    console.log("error resolving public IP", e);
    process.exit();
  }

  console.log('my hostname', thisClientConfiguration.username)
  console.log('my public IP is', thisClientConfiguration.ip);

  // connect:
  teapartyWebsocket;
  try{
    teapartyWebsocket = await teapartyWebsocketConnect();
  } catch(e) {
    console.log("error connecting to teaparty maître d'", e);
    console.trace()
    process.exit();
  }
  console.log('\nconnected to teaparty\n')
  // TODO Q: shouldn't we be able to ask teapartyWebsocket this, rather than duplicating in a local variable?
  isConnectedToteaparty = 1;

  teapartyWebsocket.addEventListener('close', () => {
    isConnectedToteaparty = 0;
    console.log("teaparty teaparty connection closed");
    // TODO now what? 
    // shouldn't the ReconnectingWebSocket already be trying to reconnect?
    // didn't seem to be for me
  });


  // TODO start our own ws server for P2P communication (only for use with controller data):
  // const wsP2P = new webSocketServer({port: teapartyP2PWebsocketPort});

  // wsP2P.on('connection', function connection(wsguest) {

  //   // TODO at this point we should be adding the wsguest to our list of incoming pals somehow

  //   wsguest.on('message', function incoming(message) {
  //     console.log('received: %s', message, 'from guest', wsguest);
  //     // TODO dispatch this message accordingly
  //   });
   
  //   // why not say hello?
  //   wsguest.send('good afternoon from ' + thisClientConfiguration.username);
  // });

  // inform the teaparty teaparty of our important details
  let thisClient = JSON.stringify({
    cmd: 'newClient',
    date: Date.now(), 
    data: thisClientConfiguration,
  })

  teapartyWebsocket.send(thisClient);

  // TODO: should have a way to send a message when we leave to notify teaparty we are gone
  // send a "goodbye" message
  // call teapartyWebsocket.close()
  // also notify partygoers via wsP2P.close(() => {});

  function sayGoodbye() {
    teapartyWebsocket.close();
  }

  process.on('SIGINT', function() {
      console.log("Caught interrupt signal");
      sayGoodbye();
      process.exit();
  });




  teapartyWebsocket.addEventListener('message', (data) => {
    let msg = JSON.parse(data.data);
    let cmd = msg.cmd;
    switch (cmd) {

      // lists all clients actively registered with the teaparty
      // should be received at reasonable frequency (i.e. also serves as a ping)
      case 'guestlist': {
        console.log(msg.data)

        let teapartyPals = msg.data.pals;
        let teapartyHeadCount = msg.data.headcount;
        let teapartyHost = msg.data.host;

        // TODO messages to invite being the host (accept or reject/timeout)

        // TODO if the host has changed, need to closse current deltaWebsocket and
        // TODO connect to new, or start host if assigned
        if(thisClientConfiguration.username === msg.data.host){
          // if previously connected to a different host, first close our pal websocket
          if (deltaWebsocket){
            deltaWebsocket.close()
          }
          // we are the host! need to start a websocket server
          console.log('host')
          console.log('check username: ', thisClientConfiguration.username)

          host()
        } else {
          // we are a pal! need to connect to host's websocket server

          // if previously connected to a different host, first close our pal websocket
          if (deltaWebsocket){
            deltaWebsocket.close()
          }
          // get host's ip
          hostIP = teapartyPals[teapartyHost].ip
          console.log('host ip', hostIP)
          pal(hostIP, '8080')
          console.log('running deltaWebsocket as pal')
        }

        // update our list of Pals here
        // i.e. we want a remove list and an add list to update our set of Pals

        // TODO: want ot know which guest is host, and make sure we have a p2p connection to them
        // (unless we are the host!)
        // TODO: deal with case that we WERE host but are not any longer
        
        // TODO possibly also p2p connections to all other members, if we want to have direct lines?
        // (e.g. for sending head/hand position data with minimal lag)
        //? not sure why this is necessary:
        /* 
        let addList = [];
        for (let username in teapartyPals) {
          // don't add ourselves!
          //if (guest == thisClientConfiguration.username) continue;
          // don't add if we already know about them
          if (pals[username]) continue;
          // otherwise, we need to add them
          addList.push(teapartyPals[username]);
        }

        let removeList = [];
        for (let guest in pals) {
          // is this in the teapartypals set?
          if (!teapartyPals[guest]) {
            removeList.push(guest);
          }
        }

        if (removeList.length) {
          console.log("removing", removeList);
          for (let username of removeList) {
            delete pals[username];
          }
          // console.log("received from teaparty: updated guestlist (removed)", msg.data)
        }
        if (addList.length) {
          // console.log("adding", addList);
          for (let o of addList) {
            pals[o.username] = o;
          }
          // console.log("received from teaparty: updated guestlist (added)", msg.data)
        }
        */
        // TODO implement these actions in separate functions, as they may be triggered in other ways.
        // adding should attempt to create a p2p rws-socket
        // removing should cancel such a socket


      } break;
      case "ping": {
        // ignore
      }
      break;

    
      // these cases are kind of subsumed by the "network" case (TODO consider renaming that)
      // case "addguest":
      // case "removeguest"

      // maybe this is redundant if we treat the "network" message as ping
      // case 'ping':
      //   // ignore this, the teaparty sends this as a hack to prevent heroku from stopping the dyno
      //   break;
  
      default:
       console.log('\n\nFor developer: unhandled message from remote teaparty: ', msg);
       break;
    }

  });

}

init();



// module.exports = {
//   teapartyWebsocketConnect: teapartyWebsocketConnect
// }

function host(){
  console.log('\n\nStarting up server\n\n')
  deltaWebsocket = new webSocket.Server({ 
    // server: server,
    port: 8080,
    maxPayload: 1024 * 1024, 
  });
    // whenever a client connects to this websocket:
  let sessionId = 0;
  console.log('running deltaWebsocket as HOST')
  deltaWebsocket.on('connection', function(ws, req) {

    // do any
    console.log("server received a connection");
    console.log("server has "+deltaWebsocket.clients.size+" connected clients");
    //	ws.id = uuid.v4();
    const id = ++sessionId;
    const location = url.parse(req.url, true);
    // ip = req.connection.remoteAddress.split(':')[3] 
    ip = req.headers.host.split(':')[0]
    if(!ip){
      // console.log('vr', req.connection)
      ip = req.ip
    }
    //console.log(ip)
    // const location = urlw.parse(req.url, true);
    // console.log(location)

    // clients[id] = ip
    // if (!clients[ip]){
    // 	clients[ip] = {}
    // }
    // console.log('connected clients, sessionIDs & clientTypes: ', clients)
    // //console.log(req.connection.remoteAddress)
    // let handShakeInterval = setInterval(function(){ 
    // 	console.log('clients handshake: ', clients)
    // 	ws.send(JSON.stringify({
    // 		cmd:'contexts',
    // 		data: clients[ip],
    // 		ip: ip
    // 	})) 
    // }, 3000);
    
    // clients[ip] = {: ip, } 
    // ws.send(JSON.stringify({
    // 	cmd: 'assignID',
    // 	data: id,
    // 	date: Date.now()
    // }))
    
    // You might use location.query.access_token to authenticate or share sessions
    // or req.headers.cookie (see http://stackoverflow.com/a/16395220/151312)
    
    deltaWebsocket.on('error', function (e) {
      if (e.message === "read ECONNRESET") {
        // ignore this, client will still emit close event
      } else {
        console.error("websocket error: ", e.message);
      }
    });

    // what to do if client disconnects?
    deltaWebsocket.on('close', function(connection) {
      //clearInterval(handShakeInterval);
      console.log("connection closed");
          console.log("server has "+wss.clients.size+" connected clients");
    });
    
    // respond to any messages from the client:
    deltaWebsocket.on('message', function(e) {
      if (e instanceof Buffer) {
        // get an arraybuffer from the message:
        const ab = e.buffer.slice(e.byteOffset,e.byteOffset+e.byteLength);
        //console.log("received arraybuffer", ab);
        // as float32s:
        //console.log(new Float32Array(ab));

      } else {
        try {
          handlemessage(JSON.parse(e), ws, id);
        } catch (e) {
          console.log('bad JSON: ', e);
        }
      }
    });
      
    
    // // Example sending binary:
    // const array = new Float32Array(5);
    // for (var i = 0; i < array.length; ++i) {
    // 	array[i] = i / 2;
    // }
      // ws.send(array);
      
      //send_all_clients("hi")
  });
}

function pal(ip, port){

  deltaWebsocket = new webSocket('ws://' + ip + ':' + port);
 
  deltaWebsocket.on('open', function open() {
    ws.send('something');
  });
  
  deltaWebsocket.on('message', function incoming(data) {
    console.log(data);
  });

}