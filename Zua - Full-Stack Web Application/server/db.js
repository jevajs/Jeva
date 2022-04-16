const { JsonDB } = require('node-json-db');
var db = new JsonDB("./database.json") // this object will act as a pseudo database
module.exports = db