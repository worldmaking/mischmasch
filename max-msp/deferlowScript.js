// this is used for anything that needs to happen after other operations are completed (aka i don't know if max/es5 has async or proimises)
inlets = 1
outlets = 1

function genConnect(genOutCounter, speakerVarname){
    post("script", "connect", 'world', genOutCounter -1, speakerVarname, 0)								
    //post('\n\nvarname', vrSource.varname, '\n')
    this.patcher.message("script", "connect", 'world', genOutCounter -1, speakerVarname, 0);
    
}