const vorpal = require('vorpal')();
var inquirer = require('inquirer');


'use strict';

let sceneFile = ['scene_rich.json', 'blank.json']

inquirer
  .prompt([
    {
      type: 'list',
      name: 'loadScene',
      message: 'What do you want to do?',
      choices: sceneFile,
    },
    // {
    //   type: 'list',
    //   name: 'size',
    //   message: 'What size do you need?',
    //   choices: ['Jumbo', 'Large', 'Standard', 'Medium', 'Small', 'Micro'],
    //   filter: function (val) {
    //     return val.toLowerCase();
    //   },
    // },
  ])
  .then((answers) => {
    console.log(answers.loadScene);
  });