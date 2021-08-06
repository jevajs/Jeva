RegisterServerEvent("blips:takeBlip")
AddEventHanlder(
    "blips:takeBlip",
    function(x, y, z)
        print(string.format("[Blips Resource]: updated coords to (x=%s, y=%s, z=%s)", x, y, z))
        TriggerClientEvent("blips:setBlip", -1, x, y, z)
        -- This will allow us to give the updated coords of the blip to everyone on the server
        -- The second argument of TRIGGER_CLIENT_EVENT (the -1), means that everyone on will take the new coords
    end
)
