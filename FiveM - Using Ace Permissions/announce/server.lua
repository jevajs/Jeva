RegisterServerEvent("announce")
AddEventHandler("announce", function(param)
    -- Checks if the player's steam ID is equal to the principle we added in perms.cfg
    if IsPlayerAceAllowed(source, "administrator") then
        print("^7[^1Announcement^7]^5:" .. param)
        TriggerClientEvent("chatMessage", -1, "^7[^1Announcement^7]^2", {0,0,0}, param)
    else 
        -- [Error handler] This triggers the event we registered in the client (due to the error message ONLY for the single client)
        TriggerClientEvent("no-perms", source)
    end
end)
