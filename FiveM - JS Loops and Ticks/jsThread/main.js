tick = 0

// this will run every 1s
setTick(async () => {
    await Wait(1000)
    emitNet("js:chat", tick++)
})

// this will run constantly because drawing text needs to be seen every tick
setTick(async () => {
    text()
})


// this just outputs the little js logo on bottom right of screen
function text() {
    SetTextFont(0)
    SetTextScale(0.475, 0.475)
    SetTextColour(0, 0, 0, 255)
    SetTextEntry("STRING")
    AddTextComponentString("JS")
    DrawText(0.97, 0.95)
    DrawRect(0.973, 0.955, 0.03, 0.05, 255, 242, 64, 255)
}