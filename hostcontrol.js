const vorpal = require('vorpal')();
const webSocket = require('ws');
const ReconnectingWebSocket = require('reconnecting-websocket');

let deltaWebsocketAddress = 'ws://mischmasch-host.herokuapp.com/8081'

const rwsOptions = {
    // make rws use the webSocket module implementation
    WebSocket: webSocket, 
    // ms to try reconnecting:
    connectionTimeout: 30000,
    //debug:true, 
  }

    console.log(`attempting to connect to deltaWebsocket Host at `, deltaWebsocketAddress)

    deltaWebsocket = new ReconnectingWebSocket(deltaWebsocketAddress, [], rwsOptions);
    
    deltaWebsocket.addEventListener('error', (error) => {
      console.log(`connection error from ${deltaWebsocketAddress}:`, error)
      // nuclear option. discard localGraph because the host is about to send us the deltas to build the current form of the graph
    });

    deltaWebsocket.addEventListener('close', (data)=>{
      console.log('deltaWebsocket closed')
      // nuclear option. discard localGraph because the host is about to send us the deltas to build the current form of the graph

    })
    
    // on successful connection to deltaWebsocket Host:
    deltaWebsocket.addEventListener('open', () => {
      console.log('connected to deltaWebsocket host')
      // no point sending a blank graph!
      

      deltaWebsocket.addEventListener('message', (data) =>{
        let msg = JSON.parse(data.data)
        switch(msg.cmd){

          case "sceneList":
            sceneList = msg.data
          break 

          case "nuclearOption":
            // line from a certain movie...
            console.log(msg.data)
            
 
          break

          case "deltas":
              case "ping":
            break
          default: console.log('unhandled deltaWS message: ', msg)
        }
      })

      
    });

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
 