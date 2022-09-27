const { v4: uuidv4 } = require('uuid');
const replaceAll = require("replaceall");

console.log(replaceAll('-', '', uuidv4()))