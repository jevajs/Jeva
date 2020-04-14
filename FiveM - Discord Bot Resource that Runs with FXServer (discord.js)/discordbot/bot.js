const { Client } = require('discord.js');
const client = new Client;
const {updatePlayerCount} = require("./utils/")
global.config = require("./config.json")
// invite your bot
// https://discordapp.com/oauth2/authorize?client_id=your_client_id&scope=bot&permissions=8
client.on('ready', () => {
    console.log(`Discord Bot logged in as ${client.user.tag}`);
    updatePlayerCount(client, 5)
    //this will update the bot's activity every 5 seconds
});

client.login(config.token);