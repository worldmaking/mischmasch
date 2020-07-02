// const pmp = require('pmp');
// const defaultGateway = require('default-gateway');
// const {gateway, interface} = defaultGateway.v4.sync();

// // pmp.getExternalAddress('192.168.2.1',function(err,rslt){
// //     console.log(err,rslt);
// // });
// console.log(gateway)
// pmp.portMap(gateway,8081,8081,3600,function(err,rslt){1
//   console.log(err,rslt, result.ttl);
// });

// // create a "client" instance connecting to your local gateway
// var client = natpmp.connect('10.0.1.1');


// // explicitly ask for the current external IP address
// client.externalIp(function (err, info) {
//   if (err) throw err;
//   console.log('Current external IP address: %s', info.ip.join('.'));
// });


// // setup a new port mapping
// client.portMapping({ private: 22, public: 2222, ttl: 3600 }, function (err, info) {
//   if (err) throw err;
//   console.log(info);
//   // {
//   //   type: 'tcp',
//   //   epoch: 8922109,
//   //   private: 22,
//   //   public: 2222,
//   //   ...
//   // }
// });
const natUpnp = require('nat-upnp')
var client = natUpnp.createClient();
 
client.portMapping({
  public: 8081,
  private: 8081,
  ttl: 10
}, function(err) {
  // Will be called once finished
  console.log('finished', err)
});
 
// client.portUnmapping({
//   public: 12345
// });
 
client.getMappings(function(err, results) {
  console.log( err, results)
});
 
client.getMappings({ local: true }, function(err, results) {
  console.log( err, 'mappings:', results)

});
 
client.externalIp(function(err, ip) {
  console.log( err, 'ip:', ip)

});
