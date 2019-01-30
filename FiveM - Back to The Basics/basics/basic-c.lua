RegisterCommand("serverid", function(source)
    chatMessage(GetPlayerServerId(source))
end)

RegisterCommand("name", function(source)
    chatMessage(GetPlayerName(source))
end)

RegisterNetEvent("returnPing")
AddEventHandler("returnPing", function(ping)
     pingNumber = ping
end)

RegisterCommand("ping", function(source)
    --[[ More examples at https://pastebin.com/A8Ny8AHZ ]]
    PlaySound(source, "CANCEL", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
    TriggerServerEvent("pinging")
    chatMessage(pingNumber)
end)

RegisterCommand("health", function(source, args)
    SetEntityHealth(GetPlayerPed(-1), tonumber(args[1]))
    chatMessage("Set health to ".. GetEntityHealth(GetPlayerPed(-1)))
end)

-----------------------------
function chatMessage(msg)
    TriggerEvent("chatMessage", "", {0,255,0}, msg)
end

