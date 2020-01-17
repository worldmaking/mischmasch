const express = require('express');
const WebSocket = require('ws');
const rws = require('reconnecting-websocket');
const fs = require('fs')
const inquirer = require('inquirer')
const nanotimer = require('nanotimer')
const statman = require('statman');
const stopwatch = new statman.Stopwatch();

const options = {
    WebSocket: WebSocket, // custom WebSocket constructor
    connectionTimeout: 1000,
   // maxRetries: 10,
};


let recording;

fs.readFile(__dirname + '/select_histories/palumboTest.json', 'utf8', (err, jsonString) => {
  if (err) {
      console.log("File read failed:", err)
      return
  }
  recording = JSON.parse(jsonString)
})


// create a ws connection which can automatically attempt reconnections if server goes down
ws = new rws('ws://localhost:8080/', [], options);

ws.addEventListener('open', () => {
  console.log('open')
  prompt()
})  
 
  ws.addEventListener('message', (data) => {
  })

  function prompt(){

    inquirer
      .prompt([
        {
          type: 'rawlist',
          name: 'cmd',
          message: 'Choose sequencer action',
          choices: [
            'getOT', 'playback', 'record'
          ],
        },
      ])
      .then(answers => {

        switch (answers.cmd){

          case 'playback':
            playback(recording)
          break

          default:

          console.log(answers.cmd)
        }
    });     
  }

  let tapeHead = new nanotimer()
  let interval

function playback(session){


  let keyframe = session.header.scene
  let keyframeTime = session.header.timestamp
  let deltas = session.deltas
  let numDeltas = deltas.length
  console.log(keyframe, keyframeTime, numDeltas)
  let prev;
  let next;
  let timeArray = []
  let indexCount = 0
  for (i = 0; i < numDeltas; i++){
    
    if(i === 0){
      prev = deltas[0].timestamp
      timeArray.push(0)
    } else {
      next = deltas[i].timestamp - prev
      timeArray.push(next)
      prev = deltas[i].timestamp
    }
  }
  console.log(timeArray)
  interval = timeArray[1] + 'm'
  console.log(interval)
  console.log(deltas[0])

  // play()
  stopwatch.start()
  tapeHead.setInterval(task, '', interval, function(err) {
    if(err) {
        //error
    } 
  });

  function task(){
    let playbackDelta = JSON.stringify({
      cmd: "playback",
      date: Date.now(),
      data: deltas[indexCount]
    })
    ws.send(playbackDelta)
    if (indexCount >= numDeltas - 1){
      tapeHead.clearInterval();
      stopwatch.stop()
      const swdelta = stopwatch.read();
      console.log('calculated time elapsed between first read and last-read delta:', swdelta)
      prompt()

    }
    // console.log('\n',indexCount, interval, deltas[indexCount])
    indexCount++
    iCount = indexCount + 1
    interval = timeArray[iCount] + 'm'
  }

  // to do, compare the time the playback takes against how much time between deltas[0] and deltas[numDeltas - 1]
  lastDelta = numDeltas - 1
  lastDelta = deltas[lastDelta].timestamp
  firstDelta = deltas[0].timestamp
  console.log('calculated time between delta history', lastDelta - firstDelta, firstDelta, lastDelta)

  
}



