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
                        GRABRELEASE: {
                            target: 'deletenode',
                            cond: 'Target.y < 0'
                        },
                        GRABRELEASE: {
                            target: 'default',
                            cond: 'Target.y >= 0'
                        }
                    },
                    active: {
                        entry: ['setDragState', 'reparent Target'],
                        exit: ['reparent Target']
                    }
                },
                deletenode : {
                    on:{
                        IMMEDIATE: 'default'
                    },
                    active: {
                        exit: ['delnode Delta']
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