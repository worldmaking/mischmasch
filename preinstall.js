const {exec} = require('child_process')
const fs = require('fs')
// update the submodule(s) in this repo
// please don't remove this file!
if (fs.existsSync(__dirname + '/gotlib')) {
    // Do something
    console.log(__dirname + '/gotlib already installed')
} else {
    console.log('installing dependency: gotlib')

    exec('git submodule add -b master https://github.com/worldmaking/gotlib.git', (stdout,stderr,err) =>{
    console.log(stdout, stderr, err)
    })

    // https://github.com/worldmaking/Max_Worldmaking_Package.git
    exec('git submodule init', (stdout,stderr,err) =>{
        console.log(stdout, stderr, err)
    })

}

if (fs.existsSync(__dirname + '/max-msp/Max_Worldmaking_Package')) {
    // Do something
    console.log(__dirname + '/Max_Worldmaking_Package already installed')
} else {
    console.log('installing max package: Max Worldmaking Package')

    exec('git submodule add -b devel https://github.com/worldmaking/Max_Worldmaking_Package.git', {cwd: __dirname + '/max-msp'}, (stdout,stderr,err) =>{
    console.log(stdout, stderr, err)
    })

    exec('git submodule init', (stdout,stderr,err) =>{
        console.log(stdout, stderr, err)
    })
}

if (fs.existsSync(__dirname + '/max-msp/vr')) {
    // Do something
    console.log(__dirname + '/vr  already installed')
} else {
    console.log('installing max package: vr')
    exec('git submodule add --force -b master https://github.com/worldmaking/vr.git', {cwd: __dirname + '/max-msp'}, (stdout,stderr,err) =>{
    console.log(stdout, stderr, err)
    })

    exec('git submodule init', (stdout,stderr,err) =>{
        console.log(stdout, stderr, err)
    })
}



