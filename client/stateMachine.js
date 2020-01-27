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
                            target: 'disconnect',
                            cond: ['controller', 'targetexists','is Jack src or dst']
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
                        GRABRELEASE: 'default'
                    },
                    active: {
                        entry: ['setTwiddleState', 'cacheCurrentRot']
                    }
                },
                disconnect: {
                    on:{
                        IMMEDIATE: 'cabling'
                    },
                    active: {
                        entry: 'sendDisconnectDelta'
                    }
                },
                cabling: {
                    on:{
                        GRABPRESS: {
                            target: 'connect',
                            cond: 'cableFullyConnected'
                        },
                        GRABPRESS: {
                            target: 'destroyCable',
                            cond: 'cableFullyDisconnected'
                        },
                        GRABPRESS: {
                            target: 'default',
                            cond: 'cablePartiallyConnected'
                        }
                    },
                    active: {
                        entry: 'setCablingState'
                    }
                },
                connect: {
                    on:{
                        IMMEDIATE: 'destroyCable'
                    }
                },
                destroyCable: {
                    on:{
                        IMMEDIATE: 'default'
                    }
                },
            }
        },
        menuMode: {
            initial: 'default',
            states: {

            }
        }
    }
});