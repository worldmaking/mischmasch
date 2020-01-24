const test = Machine({
    id: 'world',
    initial: 'editmode',
    machines: {
        editmode:{
            initial: 'default',
            states:{
                default:{
                    on:{
                        GRABDOWN: {
                            target: 'dragging', 
                            cond: ['controller', 'targetexists', 'backpanel'],
                        },
                        GRABDOWN: {
                            target:  'twiddling',
                            cond: ['controller', 'targetexists', 'twiddleable'],
                        },
                        GRABPRESS: {
                            target: 'cabling',
                            cond: ['controller', 'targetexists','is Jack, inlet or outlet']
                        }
                    }
                },
                dragging: {
                    on:{
                        GRABRELEASE: 'deletenode'
                    }
                },
                deletenode : {
                    on:{
                        IMMEDIATE: 'default'
                    }
                },
                twiddling: {
                    on:{

                    }
                },
                disconnect: {
                    on:{

                    }
                },
                cabling: {
                    on:{

                    }
                },
                connect: {
                    on:{

                    }
                },
                destroycable: {
                    on:{

                    }
                },
            }
        },
        menumode: {
            initial: 'default',
            states: {

            }
        }
    }
});