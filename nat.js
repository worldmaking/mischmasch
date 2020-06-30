var natman = require('natman-api');
 
// var privatePort = 8081; //The port on your machine that you want to forward
// var publicPort = 8081;  //The port you want to open to the rest of the world.
// // var protocol = 'TCP';   //The protocol you want to open with can be 'UDP' or 'TCP' (default)
 
// natman(privatePort, publicPort, function(err, info){
//   if (err) {
//     console.error(err);
//   }
//   console.log(info);
// });

// var natman = require('natman-api');
 
var privatePort = 8081; //The port on your machine that you want to forward
var publicPort = 8081 //The port you want to open to the rest of the world.
 
natman(privatePort, publicPort);