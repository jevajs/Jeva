RegisterServerEvent("pinging")
AddEventHandler("pinging", function()
    local src = source
    local ping = GetPlayerPing(src)
    TriggerClientEvent("returnPing", src, ping)
end)