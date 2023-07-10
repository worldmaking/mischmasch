// Require lepikEvents
const lepikEvents = require('lepikevents');

lepikEvents.events.on('keyDown', (data) => {
  switch(data){
    case "A":
      console.log('add a new op')
    break;
    default:
  }
  // Returns key pushed as String 
  console.log(data); // e||esc||space||backspace ...
});