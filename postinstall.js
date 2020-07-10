const {exec, spawn} = require('child_process')

// update the submodule(s) in this repo
// please don't remove this file!
// exec('git config submodule.recurse true', (stdout,stderr,err) =>{
// })
// exec('git submodule update --remote', (stdout,stderr,err) =>{
// })

var ls = spawn('git', ['submodule', 'update', '--remote']);