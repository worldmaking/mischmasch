const fs = require('fs')
const path = require('path')
const opsList = JSON.parse(fs.readFileSync(path.join(__dirname, 'genishOperators.json')))

module.exports = class Op{
  constructor(){

  }

}