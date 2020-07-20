/*
  Goal:

  Want to establish P2P socket connections between clients over remote network, to make a teaparty
  But we don't know in advance the IP addresses or who is online, so we use a remote teaparty:
  - first we connect to the remote teaparty and let them know our IP, name, and other stats 
  - (we should also let the teaparty know when we leave)
  - the teaparty maintains a list of such connected users (called 'pals')
  - the teaparty shares with all pals the connection info for all the pals, including updating when pals join and leave
  - pals use this information to establish direct P2P connections between each other

  // Migrating host model (no longer in use)
  // - teaparty (signal server) chooses who is host (ground truth) at any time
  // - normally it would be the first to connect, but could be migrated to next partygoer if the host exits (e.g. internet dropout)
  // - everyone would have a socket connection to current host, and assume that the host has the 'ground truth' for merging OTs. 

  Future: many worlds, like server rooms. Anyone can start a world and invite. The default world is open like a lobby. 
  For now just do this default world.

  // Q: does it make sense to use websockets for this?
  // is there a more natural framework for such networks? e.g. the BUS pattern from nanomsg?

*/

// NOTE: The heroku app 'teaparty' will go to sleep if it goes 30 minutes before 
// receiving a connection request from an app.js. So, when you run app.js don't be 
// surprised if it takes 10-20 seconds to receive a response from teaparty

// most widely-used websocket module for node.js
const webSocket = require('ws');
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
const url = require('url')
const http = require('http');
const express = require('express');
const fs = require("fs");
const path = require("path");
// const bottleneck = require('Bottleneck')
const got = require(__dirname + "/gotlib/got.js")
// simplified cli args for script
const {argv} = require('yargs')
// interactive cli:
const vorpal = require('vorpal')();
var equal = require('deep-equal');
const equals = require('array-equal')
const fb = require('./detectCycles.js')

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

// LOCAL STUFF //
/// paths
const project_path = process.cwd();
const server_path = __dirname;
const client_path = path.join(server_path, "client");

let name;
if (process.argv[3]){
  name = process.argv[3]
} else {
  name = username.sync()
}


// NETWORKING //

let localConfig = {
  // get a username for this machine:
  username: name,
  // ip is figured out during init()
  ip: null, 
  // eventually, app.js will maintain status of connected client(s) and report them to the teaparty
  vr: null,
  sound: null,
  // for example, if someone wanted to observe a performance but not be a player:
  spectator: 0,
  // this is set by the teaparty, or:
  //TODO option to set as localhost using a cli arg (todo)
  host: {},
  // TODO determine where this should run. 
  p2pSignalServer: {
    ip: null,
    port: null
  },
  recordStatus: 0
};

// all websockets

// teapartyWebsocket operates on port 8090, runs as a client, and connects to the 
// teaparty (heroku cloud instance)
let teapartyWebsocket

// deltaWebsocket operates on port 8080, and connects as a client to mischmasch-host.herokuapp.com
// it's what communicates with all other machines (for got deltas)
let deltaWebsocket

// localWebsocket operates on port 8081, and handles communication between other 
// clients apps like VR and the max client
let localWebsocket

// still up for debate, but this is for non-delta data (like HMD and controller pos), 
// should be broadcast to all nodes. so likely a ws is not the right choice, 
// instead see about a mesh implementation
let p2pWebsocket 

let teapartyHost
let teapartyAddress
let hostIP
const teapartyWebsocketPort = '8090';
let teapartyWebsocketAddress


// we receive this as an array from the host. 
let sceneList =[]

if (argv.l){
  teapartyAddress = 'localhost'
  hostIP = "localhost"
  teapartyWebsocketAddress = `ws://${teapartyAddress}:${teapartyWebsocketPort}`
  console.log(`running app.js in local mode\nteaparty address 'ws://localhost:8090'\ndeltaWebsocket host address 'ws://localhost:8081'`)
  fs.readdirSync('./scenes').forEach(file=>{
    sceneList.push(file)
  })
  console.log(sceneList)
} else {
  teapartyAddress = "teaparty.herokuapp.com"
  hostIP = "mischmasch-host.herokuapp.com"
  teapartyWebsocketAddress = `ws://${teapartyAddress}/${teapartyWebsocketPort}`
  console.log('using heroku-based host.js at mischmasch-host.herokuapp.com')
}

const rwsOptions = {
  // make rws use the webSocket module implementation
  WebSocket: webSocket, 
  // ms to try reconnecting:
  connectionTimeout: 30000,
  //debug:true, 
}

startLocalWebsocket()
// attempt to connect to teaparty 
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
    //! i commented this out because it was interfering with the progressBar and attempts to rws
    teapartyWebsocket.addEventListener('error', (error) => {
      // clearInterval(progressBarTimer); 
      // reject(error.error);
    });
    
    // on successful connection to teaparty:
    teapartyWebsocket.addEventListener('open', () => {
      clearInterval(progressBarTimer);
      resolve(teapartyWebsocket);
    });
  });
}




// GOT STUFF

// a local copy of the current graph state, for synchronization purposes
let localGraph = {
	nodes: {},
	arcs: []
}








let guestlist = {

}

let blankifyScene = async () => { 

    let deltas = got.deltasFromGraph(localGraph, []);
    let inverse = got.inverseDelta(deltas)
    localGraph = got.applyDeltasToGraph(localGraph, inverse)
    return inverse

};


function sayGoodbye() {

  blankifyScene().then((inverse) => {
    let blankify = JSON.stringify({
      cmd: 'deltas',
      date: Date.now(), 
      data: inverse
    })
    sendAllLocalClients(blankify)

    let nuke = JSON.stringify({
      cmd: 'nuke',
      date: Date.now(), 
      data: 'nuke'
    })
    sendAllLocalClients(nuke)

    
    teapartyWebsocket.close()
  })

  

  teapartyWebsocket.addEventListener('close', () => {
    isConnectedToteaparty = 0;
    deltaWebsocket.close()
    
  });
  
  deltaWebsocket.addEventListener('close', () => {
    // localWebsocketServer.close()
    deltaWebsocket = null
    localGraph = {
      nodes: {},
      arcs: []
    }
    init()
  });
}

/* 
  TEAPARTY WEBSOCKET: 
*/
// run everything inside an async() so we can await as needed:
async function init() {
  
  try {
    
    // get our public IP address:
    localConfig.ip = await publicIP.v4()
    //=> '46.5.21.123'
    //localConfig.ip = await publicIP.v6()
    //=> 'fe80::200:f8ff:fe21:67cf'
  } catch(e) {
    console.log("error resolving public IP", e);
    process.exit();
  }


  // connect:
  teapartyWebsocket;
  try{
    teapartyWebsocket = await teapartyWebsocketConnect();
  } catch(e) {
    console.log("error connecting to teaparty maître d'", e);
    console.trace()
    init()
    // process.exit();
  }
  console.log('connected to teaparty')
  // TODO Q: shouldn't we be able to ask teapartyWebsocket this, rather than duplicating in a local variable?
  isConnectedToteaparty = 1;

  teapartyWebsocket.addEventListener('close', () => {
    isConnectedToteaparty = 0;
    console.log("teaparty connection closed");
    // TODO now what? 
    // shouldn't the ReconnectingWebSocket already be trying to reconnect?
    // didn't seem to be for me

  });

  // inform the teaparty teaparty of our important details
  let thisClient = JSON.stringify({
    cmd: 'newClient',
    date: Date.now(), 
    data: localConfig,
  })

  teapartyWebsocket.send(thisClient);

  // TODO: should have a way to send a message when we leave to notify teaparty we are gone
  // send a "goodbye" message
  // call teapartyWebsocket.close()
  // also notify partygoers via wsP2P.close(() => {});



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
        guestlist = msg.data
        let teapartyPals = msg.data.pals;
        let teapartyHeadCount = msg.data.headcount;
        teapartyHost = msg.data.host.name;



        // if the deltaWebsocket connection doesn't already exist
        if (!deltaWebsocket){
          // we are a pal! need to connect to host's websocket server
          // get host's ip
          if(!argv.l){
            hostIP = msg.data.host.ip          
          } else if (argv.host){
            // if the host ip is specified
            hostIP = argv.host
          } 
            //startLocalWebsocket(hostIP, 8082)       
            pal(hostIP, '8081')
        }

        // update our list of Pals here
        // i.e. we want a remove list and an add list to update our set of Pals

        // TODO possibly also p2p connections to all other members, if we want to have direct lines?
        // (e.g. for sending head/hand position data with minimal lag)
        //? not sure why this is necessary:
        /* 
        let addList = [];
        for (let username in teapartyPals) {
          // don't add ourselves!
          //if (guest == localConfig.username) continue;
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
          for (let username of removeList) {
            delete pals[username];
          }
        }
        if (addList.length) {
          for (let o of addList) {
            pals[o.username] = o;
          }
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
       console.log('\n\nunhandled message from remote teaparty: ', msg);
       break;
    }

  });

}

init();


// attempt to connect to Host
function pal(ip, port){

  // update the p2p webrtc client(s) with the new host ip/port
  //TODO use the send_all_clients function for this. 
  let configp2p = JSON.stringify({
    cmd: 'p2pSignalServer',
    date: Date.now(), 
    data: localConfig.p2pSignalServer
  })
  sendAllLocalClients(configp2p)

  let deltaWebsocketAddress
  if(!argv.l){
    deltaWebsocketAddress = 'ws://' + ip + '/' + port

  } else {
    deltaWebsocketAddress = 'ws://' + ip + ':' + port
  }
   

    console.log(`attempting to connect to deltaWebsocket Host at `, deltaWebsocketAddress)

    deltaWebsocket = new ReconnectingWebSocket(deltaWebsocketAddress, [], rwsOptions);
    
    deltaWebsocket.addEventListener('error', (error) => {
      console.log(`connection error from ${deltaWebsocketAddress}:`, error)
      // nuclear option. discard localGraph because the host is about to send us the deltas to build the current form of the graph
      localGraph = {
        nodes: {},
        arcs: []
      }
    });

    deltaWebsocket.addEventListener('close', (data)=>{
      console.log('deltaWebsocket closed')
      // nuclear option. discard localGraph because the host is about to send us the deltas to build the current form of the graph
      localGraph = {
        nodes: {},
        arcs: []
      }
    })
    
    // on successful connection to deltaWebsocket Host:
    deltaWebsocket.addEventListener('open', () => {
      console.log('connected to deltaWebsocket host')
      // no point sending a blank graph!
      if(equal(localGraph, {nodes: {}, arcs: []}) === false){
        
        let updateScene = got.deltasFromGraph(localGraph, [])
        let msg = JSON.stringify({
          cmd: 'deltas',
          date: Date.now(), 
          data: updateScene
        })
        sendAllLocalClients(msg)
      }

      deltaWebsocket.addEventListener('message', (data) =>{
        let msg = JSON.parse(data.data)

        switch(msg.cmd){

          case 'deltas':
            // synchronize our local copy:
            try {

              got.applyDeltasToGraph(localGraph, msg.data);

              // feedback path stuff
              //! urgent: need to apply a propchange to one outlet per feedback path outlet._props.history = true
              




            } catch (e) {
              console.warn(e);
            }

            // TODO: merge OTs
            
            let response = {
              cmd: "deltas",
              date: Date.now(),
              data: msg.data
            };
            
            // check if the recording status is active, if so push received delta(s) to the recordJSON
            if (localConfig.recordStatus === 1){
              
              for(i = 0; i < msg.data.length; i++){
                
                msg.data[i]["timestamp"] = Date.now()
                recordJSON.deltas.push(msg.data[i])
              }
              
            }

            //fs.appendFileSync(OTHistoryFile, ',' + JSON.stringify(response), "utf-8")

            //OTHistory.push(JSON.stringify(response))
            // send to all LOCAL clients:
            sendAllLocalClients(JSON.stringify(response));
          break

          case "sceneList":
            sceneList = msg.data
          break 

          case "nuclearOption":
            // line from a certain movie...
            console.log(msg.data)
            sayGoodbye()
 
          break
          case 'ping':
            // keepAlive for heroku instance
            let keepAlive = JSON.stringify({
              cmd: 'keepAlive',
              date: Date.now(), 
              data: name,
            })
            deltaWebsocket.send(keepAlive)
            
          break
          default: console.log('unhandled deltaWS message: ', msg)
        }
      })

      
    });


}



function handlemessage(msg, id) {

  switch (msg.cmd) {
    case "deltas": {
      
      runGOT(id, msg.data)
    } break;

    default: console.log("received JSON", msg, typeof msg);
  }
}

localClients = {
  vr: null,
  audio: {}
}
localClientID = 0
function startLocalWebsocket(){
  // host webapp (only on mojave)
  const app = express();
  app.use(express.static(client_path))
  app.use(express.static(path.join(__dirname, '/got/')))	
  app.get('/', function(req, res) {
    res.sendFile(path.join(client_path, 'index.html'));
    res.sendFile(path.join(__dirname, '/got/got.js'));
  });
  const server = http.createServer(app);
  // add a websocket service to the http server:
  // const wss = new WebSocket.Server({ 
  //   server: server,
  //   maxPayload: 1024 * 1024, 
  // });
  // ws for deltas


  localWebsocketServer = new webSocket.Server({ 
    server: server,
    // port: 8080,
    maxPayload: 1024 * 1024, 
  });
  let sessionId = 0;
      
  // whenever a pal connects to this websocket:
  localWebsocketServer.on('connection', function(ws, req) {
    localWebsocket = ws
   

    // inform client that the p2p signal server is running on localhost
    // let configp2p = JSON.stringify({
    //   cmd: 'p2pSignalServer',
    //   date: Date.now(), 
    //   data: localConfig.p2pSignalServer
    // })
    // localWebsocket.send(configp2p)
    // do any
    console.log("server received a connection");
    // console.log("server has "+ws.clients.size+" connected clients");
    //	ws.id = uuid.v4();
    const id = ++sessionId;
    const location = url.parse(req.url, true);
    // ip = req.connection.remoteAddress.split(':')[3] 
    // ip = req.headers.host.split(':')[0]
    // if(!ip){
    //   // console.log('vr', req.connection)
    //   ip = req.ip
    // }
    // const location = urlw.parse(req.url, true);


    localWebsocket.on('error', function (e) {
      if (e.message === "read ECONNRESET") {
        // ignore this, client will still emit close event
      } else {
        console.error("websocket error: ", e.message);
        if (localClients.vr = localWebsocket){
          localClients.vr = null
        }
      }
    });

    // what to do if client disconnects?
    localWebsocket.on('close', function(connection) {
      //clearInterval(handShakeInterval);
      console.log("connection closed");
      if (localClients.vr = localWebsocket){
        localClients.vr = null
      }
    });
    
    // respond to any messages from the client:
    localWebsocket.on('message', function(e) {
      if (e instanceof Buffer) {
        // get an arraybuffer from the message:
        const ab = e.buffer.slice(e.byteOffset,e.byteOffset+e.byteLength);
      } else {
        try {
          // handlemessage(JSON.parse(e), ws, id);
          let msg = JSON.parse(e)
          console.log('msg', msg)
          messageFromLocalClient(msg, localWebsocket)
        } catch (e) {
          console.log('bad JSON: ', e);
        }
      }
    });

  });
  server.listen(8080, function() {
    console.log(`localWebsocketServer listening on localhost:${server.address().port}`);
  });

}

function messageFromLocalClient(msg, localWebsocket){
  let message = msg
  console.log('message from local client', msg)
  switch(msg.cmd){
    case 'vrClientStatus':
      localConfig.vr = 1
      // teapartyWebsocket.send
      // localWebsocket.id = 'vr'
      localClients.vr = localWebsocket
    break;

    case 'get_scene':
      
      // no point sending a blank graph!
      if(equal(localGraph, {nodes: {}, arcs: []}) === false){
        let deltas = got.deltasFromGraph(localGraph, [])
        let msg = JSON.stringify({
          cmd: 'deltas',
          date: Date.now(),
          data: deltas
        })
        
        localWebsocket.send(msg)
      }

    break

    case 'deltas':
      console.log('delta from VR client', message)

      try {

        got.applyDeltasToGraph(localGraph, message.data);

        console.log(localGraph)

      } catch (e) {
        console.warn(e);
      }
      // feedback path stuff
      //! urgent: need to apply a propchange to one outlet per feedback path outlet._props.history = true
      // get list of child nodes in graph
      let nodes = fb.setup(localGraph)

      // get list of adjacent nodes per each node in the graph
      let adjacents = fb.getAdjacents(0, nodes, localGraph)

      // reset the nodes array with list of only parent nodes whose child nodes have adjacent connections:
      nodes.length = 0
      nodes = Object.keys(adjacents)
      nodeCount = nodes.length
      // get 
      updatedGraph = fb.visit(0, nodes, adjacents, localGraph, nodeCount)

      newDeltas = got.deltasFromGraph(updatedGraph,[])

      let msg = JSON.stringify({
        cmd: 'deltas',
        date: Date.now(),
        data: newDeltas
      })
      
      sendAllLocalClients(msg)
      deltaWebsocket.send(JSON.stringify(msg))
      // runGOT(id, msg.data)
    break

    case "audiovizLookup":
      // console.log(msg.data)
      if(localClients.vr){
        localClients.vr.send(JSON.stringify(msg))
      }
      // 
      // need to send this just to the vr client!
      // console.log(localClients.vr)
    break
  }
}
function sendToVRClient(msg, ignore) {
	deltaWebsocketServer.clients.forEach(function each(client) {
		if (client == ignore) return;
		try {
			client.send(msg);
		} catch (e) {
			console.error(e);
		};
	});
}



function runGOT(src, delta){
  console.log('runGOT', src, delta)
      // synchronize our local copy:
      try {
        got.applyDeltasToGraph(localGraph, delta)
      } catch (e) {
        console.warn(e);
      }

      // TODO: merge OTs
      
      let response = JSON.stringify({
        cmd: "deltas",
        date: Date.now(),
        data: delta
      });

      
      // check if the recording status is active, if so push received delta(s) to the recordJSON
      // if (localConfig.recordStatus === 1){
        
      //   for(i = 0; i < delta.length; i++){
          
      //     delta[i]["timestamp"] = Date.now()
      //     recordJSON.deltas.push(delta[i])
      //   }
        
      // }

      //fs.appendFileSync(OTHistoryFile, ',' + JSON.stringify(response), "utf-8")

      //OTHistory.push(JSON.stringify(response))

      if (teapartyHost === localConfig.username){
        // if this app.js is host, just send using the localWebsocket
        localWebsocket.send(response)
      } else {
        deltaWebsocket.send(response)

      }
      // send_all_clients(JSON.stringify(response));
}

function sendAllLocalClients(msg){
  localWebsocketServer.clients.forEach(function each(client) {
		// if (client == ignore) return;
		try {
      client.send(msg);
		} catch (e) {
			console.error(e);
		};
	});
}


// CLI stuff
var inquirer = require('inquirer');
let sceneChoice = null
vorpal
  .command('scenes', 'lists the scenes available from the host.')
  .action(function(args, callback) {
    
    inquirer
      .prompt([
        {
          type: 'list',
          name: 'loadScene',
          message: 'Choose the scene you want to load:',
          choices: sceneList,
        },
        // {
        //   type: 'list',
        //   name: 'size',
        //   message: 'What size do you need?',
        //   choices: ['Jumbo', 'Large', 'Standard', 'Medium', 'Small', 'Micro'],
        //   filter: function (val) {
        //     return val.toLowerCase();
        //   },
        // },
      ])
      .then((answers) => {
        sceneChoice = answers.loadScene
        let msg = JSON.stringify({
          cmd: 'loadScene',
          date: Date.now(),
          data: sceneChoice
        })
        deltaWebsocket.send(msg)
        callback();
      });
      
    
    
  });
 
vorpal
  .delimiter('appjs$')
  .show();

vorpal
  .command('clear', 'clears the scene, returns a blank scene.')
  .action(function(args, callback) {
    let msg = JSON.stringify({
      cmd: 'clearScene',
      date: Date.now(),
      data: 'clearScene'
    })
    deltaWebsocket.send(msg)
  callback();
})

vorpal
.delimiter('appjs$')
.show();

vorpal
  .command('reload', 'reloads the current scene file (loses changes).')
  .action(function(args, callback) {
    let msg = JSON.stringify({
      cmd: 'loadScene',
      date: Date.now(),
      data: sceneChoice
    })
    deltaWebsocket.send(msg)
    console.log('reloading ' + sceneChoice)
  callback();
})

vorpal
.delimiter('appjs$')
.show();


vorpal
  .command('nuclear', 'the gotlib nuclear option. clears the scene & delta history everywhere, including host, and returns a blank scene.')
  .action(function(args, callback) {
    let msg = JSON.stringify({
      cmd: 'nuclearOption',
      date: Date.now(),
      data: name
    })
    deltaWebsocket.send(msg)
  callback();
})

vorpal
.delimiter('appjs$')
.show();

vorpal
  .command('save', 'save current scene. requests filename, confirms overwrites.')
  .action(function(args, callback) {
    saveScene()
    function saveScene(){
      inquirer
        .prompt([
          {
            type: 'input',
            name: 'save',
            message: 'type a name of file'
          },
        ])
        .then((answers) => {
          let savename = answers.save + '.json'
          if(sceneList.includes(savename) === true){
              inquirer
                .prompt([
                  {
                    type: 'list',
                    name: 'nextStep',
                    message: 'filename in use. overwrite or try another name?',
                    choices: ['try a different filename','overwrite existing filename']
                  },
                ])
                .then((answers) => {
                  choice = answers.nextStep
                  if (choice === 'try a different filename'){
                    saveScene()
                  } else {
                    let msg = JSON.stringify({
                      cmd: 'saveScene',
                      date: Date.now(),
                      data: savename
                    })
                    deltaWebsocket.send(msg)
                    console.log('overwriting file ' + savename + ' on host')
                    callback();
                  }
                  
                })
            } else {
              let msg = JSON.stringify({
                cmd: 'saveScene',
                date: Date.now(),
                data: savename
              })
              deltaWebsocket.send(msg)
              console.log('saving file ' + savename + ' on host')
              callback();
            }
        })
      }
    })

vorpal
.delimiter('appjs$')
.show();


vorpal
  .command('delete', 'delete a scene file on the host. confirms choice. reserved files are not listed')
  .action(function(args, callback) {
    let deleteList = ["cancel, I don't want to delete a file"]
    for (i=0;i<sceneList.length;i++){
      switch(sceneList[i]){
        case "simple.json":
        case "scene_rich.json":
        case "self_patched.json":
          // don't make these scenes available for deletion
        break;

        default: deleteList.push(sceneList[i])
      }
    }
    inquirer
      .prompt([
        {
          type: 'list',
          name: 'deleteScene',
          message: 'Choose the scene file you want to delete:',
          choices: deleteList,
        },
        // {
        //   type: 'list',
        //   name: 'size',
        //   message: 'What size do you need?',
        //   choices: ['Jumbo', 'Large', 'Standard', 'Medium', 'Small', 'Micro'],
        //   filter: function (val) {
        //     return val.toLowerCase();
        //   },
        // },
      ])
      .then((answers) => {
        deleteChoice = answers.deleteScene
        if(deleteChoice === "cancel, I don't want to delete a file"){
          console.log('a scenefile lives another day')
          callback();
        } else {
          let msg = JSON.stringify({
            cmd: 'deleteScene',
            date: Date.now(),
            data: deleteChoice
          })
          deltaWebsocket.send(msg)
          callback();
        }
      });
      
    
    
  });
 
vorpal
  .delimiter('appjs$')
  .show();

  vorpal
  .command('fb', 'request a scene with feedback paths')
  .action(function(args, callback) {
        let msg = JSON.stringify({
          cmd: 'loadScene',
          date: Date.now(),
          data: 'scene_feedback.json'
        })
        deltaWebsocket.send(msg)
        callback();
      });
 
