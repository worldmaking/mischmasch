const Motu = require('motujs')

let motu = new Motu()
motu.connect('192.168.137.176')

// get value
motu.datastore.once('changed', function(a, b) {
    // datastore is synced after first change
    var value = motu.datastore.get('mix/chan/1/matrix/fader')
    console.log('Value of first fader is ', value)
    motu.disconnect()
  });

// listen for changes
motu.datastore.on('changed', function(a, b) {
    console.log(a.length + ' items changed by ' + b)
});

// setInterval(function () {
//     motu.datastore.set('mix/chan/1/matrix/fader', Math.random())
//   }, 500)