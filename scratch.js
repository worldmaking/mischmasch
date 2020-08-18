var Queue = require('tiny-queue');
var fifo = new Queue();
 
fifo.push('foo');
fifo.push('bar');
fifo.shift(); // 'foo'
console.log(fifo.shift()); //'bar'
fifo.length; // 0
fifo.shift(); // undefined