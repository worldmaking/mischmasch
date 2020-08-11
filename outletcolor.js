// let colorCount = 0

function cycleColor(c){
    colorCount = (c + 0.01)
    if(colorCount >=1.){
        cycleColor(0.)  
    } else {
        cycleColor(colorCount)
    }
}

cycleColor(0.)