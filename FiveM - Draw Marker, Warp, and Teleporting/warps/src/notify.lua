-- https://runtime.fivem.net/doc/natives/?_0x2ED7843F8F801023
-- this is the new notification method
function notify(str)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(str)
    EndTextCommandThefeedPostTicker(true, false)
end
