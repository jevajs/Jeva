const express = require("express")
const path = require("path")
const bodyParser = require('body-parser') // for parsing body content
const routing = require("./routing")
const middleware = require('./routing/middleware')
const app = express()
const port = 5000

app.use(express.static(path.join(__dirname, "../client"))) // serve static files under the client folder

app.use(bodyParser.urlencoded({  // to support URL-encoded bodies
    extended: true
}));

app.use('/api', middleware, routing)

app.listen(port, () => {
    console.log(`Backend listening on port ${port}`)
})