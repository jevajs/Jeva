var tmi = require("tmi.js")
var channel = "thatziv"

var config = {
    options: {
        debug: true
    }, 
    connection: {
        cluster: "aws", 
        reconnect: true
    },
    identity: {
        username: "thatziv",
        // get yours at http://twitchapps.com/tmi
        password: "oauth:qbwr6ewvtvz7v56g2luh4olt84kn5b"
    },
    channels: [channel]
}

var client = new tmi.client(config)
client.connect();

client.on("connected", (address, port) => {
    client.action(channel, "The bot has connected on" + address + ":" + port)
})

client.on("chat", (channel, user, message, self) => {
    if (self) return;
    if (message == "hi") {
        client.say(channel, "hey pal.")
    }
})