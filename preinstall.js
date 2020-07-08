const {exec} = require('child_process')
const fs = require('fs')
// update the submodule(s) in this repo
// please don't remove this file!
if (fs.existsSync(__dirname + '/gotlib')) {
    // Do something
    console.log(__dirname + '/gotlib already installed')
} else {
    exec('git submodule add -b master https://github.com/worldmaking/gotlib.git', (stdout,stderr,err) =>{
    console.log(stdout, stderr, err)
})
}


