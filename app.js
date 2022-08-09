
const express = require('express')
const app = express()
const port = process.env.PORT || 3000
const path = require('path')

if(process.argv[2] === '-p'){
  app.use('/', express.static(path.join(__dirname, 'prototyper')))
} else {
  app.use('/', express.static(path.join(__dirname, 'dist')))
}

app.listen(port, () => {
  console.log(`app listening on port ${port}`)
})
