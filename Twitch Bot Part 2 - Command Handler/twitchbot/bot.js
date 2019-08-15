const tmi = require("tmi.js")

// changed this var from channel to channelName 
var channelName = "thatziv"
// this is the prefix for your commands
var prefix = "!"


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
        password: "oauth:xvzxsofx09xnj2l7l4oe3nv6gntq10"
    },
    channels: [channelName]
}

var client = new tmi.client(config)
client.connect();

client.on("connected", (address, port) => {
    client.action(channelName, "The bot has connected on" + address + ":" + port)
})

client.on("chat", (channel, user, message, self) => {
    if (self) return;
    if (message == "hi") {
        client.say(channelName, "hey pal.")
    }

    // cmd handler
    const args = message.slice(prefix.length).trim().split(/ +/g);
    const cmd = args.shift().toLowerCase();
    try {
        let commandFile = require(`./commands/${cmd}.js`)
        commandFile.run(client, message, args, user, channel, self) 
    } catch (err) {
        return;
    }
    
})