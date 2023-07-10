## michael needs to add to pre-install script:

```shell
npm install @mapbox/node-pre-gyp --save
```

## Run with default settings

```shell
npm start
```

## CLI flags:

--username *input a string with no spaces for player name. defaults to system username*

--disableVR *include this flag to disable VR and run the app with keyboard and mouse*

--patchFile *enter name of a patch file found in /userData (don't include .json extension). default: blank scene*

i.e Load the *funzo* scene at start
```shell
npm start --patchFile funzo
```


## Mouse & Keyboard Controls

### Navigation
Forward: W
Back: S
Left: A
Right: D
Turn Left: Left Arrow
Turn Right: Right Arrow
