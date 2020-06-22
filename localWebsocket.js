// local client websocket:


    let localWebsocketAddress = 'ws://localhost:8080'
  
      console.log(`attempting to connect to deltaWebsocket Host at `, localWebsocketAddress)
      localWebsocket = new ReconnectingWebSocket(localWebsocketAddress, [], rwsOptions);
      
      localWebsocket.addEventListener('error', (error) => {
        console.log(`connection error from ${localWebsocketAddress}:`)
      });
      
      // on successful connection to deltaWebsocket Host:
      localWebsocket.addEventListener('open', () => {
        let highFive = JSON.stringify({
          cmd: 'highFive',
          date: Date.now(), 
          data: 'hello from Pal',
        })
        localWebsocket.send(highFive)
  
        localWebsocket.addEventListener('message', (data) =>{
          let msg = data.data
          console.log(msg)
        })
      });
    
  
