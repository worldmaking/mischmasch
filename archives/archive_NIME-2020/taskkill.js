const {exec} = require('child_process')

const tasklist = require('tasklist');
 
(async () => {
    // console.log();

    let tasks = await tasklist()

    for(i = 0; i < tasks.length; i++){
        // console.log(tasks[i].imageName)
        switch(tasks[i].imageName){
            case 'node.exe':
            case 'Max Helper.exe':

            console.log('true')

        }
    }

})();