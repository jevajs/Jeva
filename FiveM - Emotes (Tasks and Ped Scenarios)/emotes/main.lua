player = nil
status = false
RegisterCommand("emote", function(source, args)
    player = GetPlayerPed(-1);
    local emoteToPlay = args[1]
    if GetVehiclePedIsIn(player, false) ~= 0 then return end; -- wont play emotes in any vehicle
    startEmote(emoteToPlay)
end)


function startEmote(anim)
    if emotes[anim] and player and status == false then 
    -- checks if the emote actually exists in the table, if the player is defined, and if there is no emote playing
        TaskStartScenarioInPlace(player, emotes[anim].anim, 0, true)
        status = true
    else 
        return; 
    end;
end

Citizen.CreateThread(function()
    while true do
    --while the emote is being played for the bed, this thread will listen to any movement keys being pressed to cancel the emote
        if status then
            if 
                IsControlPressed(1, 32) --[[ "W" key ]]
                or IsControlPressed(1, 34) --[[ "A" key ]] 
                or IsControlPressed(1, 33) --[[ "S" key ]]
                or IsControlPressed(1, 35) --[[ "D" key ]]
                or IsControlPressed(1, 55) --[[ "SPACEBAR" key ]] 
            then
                ClearPedTasks(player);
                status = false
            end
        end
        Citizen.Wait(0)
    end
end)