// this event will listen through both scopes for a trigger
RegisterNetEvent('js:chat');
onNet("js:chat", (msg, color) => {
    emitNet("chat:addMessage", -1, {
        args: [msg],
        color: color
    })
    console.log(msg)
    return
})
