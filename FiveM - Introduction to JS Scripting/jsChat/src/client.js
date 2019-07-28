/**
 * In this example we will trigger an event from the client-side that is listening on the server-side 
 */

// chat command using net events (server/client)
RegisterCommand("jschat", async (source, args) => {
    let argString = args.join(" ")
    if (!argString) {argString = "Nothing..."}
    emitNet("js:chat", argString, [0,255,0]) // this will trigger it
    return
})


