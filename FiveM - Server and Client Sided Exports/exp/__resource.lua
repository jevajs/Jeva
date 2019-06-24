-- you may need this depending on how u use this
resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'
-- client src
client_script "client.lua"
-- client exports (function names only)
exports {"notify", "chat"}


-- server src
server_script "server.lua"
-- server exports (function names only)
server_exports {"log"}