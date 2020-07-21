const {exec} = require('child_process')
const fs = require('fs')
// update the submodule(s) in this repo
// please don't remove this file!
if (fs.existsSync(__dirname + '/gotlib')) {
    // Do something
    console.log(__dirname + '/gotlib already installed, updating')
    exec('git submodule update --init --recursive', (stdout,stderr,err) =>{
    })
} else {
    console.log('installing dependency: gotlib')

    exec('git submodule add -b master https://github.com/worldmaking/gotlib.git', (stdout,stderr,err) =>{
    })

    // https://github.com/worldmaking/Max_Worldmaking_Package.git
    exec('git submodule init', (stdout,stderr,err) =>{
    })

}



