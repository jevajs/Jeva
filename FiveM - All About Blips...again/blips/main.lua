blip = nil

Citizen.CreateThread(function()
    local blipName = "Pier"
    local blipCoords = landmarks[blipName] -- "landmark" var is referred to in "coords.lua"
    blip = AddBlipForCoord(blipCoords.x, blipCoords.y, blipCoords.z) -- Blip ADD_BLIP_FOR_COORD(float x, float y, float z);
    SetBlipScale(blip, 1.0) -- void SET_BLIP_SCALE(Blip blip, float scale);
    SetBlipSprite(blip, 356) -- void SET_BLIP_SPRITE(Blip blip, int spriteId);
    -- This sprite: https://docs.fivem.net//blips/radar_dock.png
    -- list of blips: https://docs.fivem.net/docs/game-references/blips/
    SetBlipColour(blip, 32) -- void SET_BLIP_COLOUR(Blip blip, int color);
    -- List of blip colours: https://docs.fivem.net/docs/game-references/blips/#blip-colors
    SetBlipAlpha(blip, 255) -- void SET_BLIP_ALPHA(Blip blip, int alpha [0-255]);
    AddTextEntry("PIER", "The Pier")
    BeginTextCommandSetBlipName("PIER") -- void BEGIN_TEXT_COMMAND_SET_BLIP_NAME(char* textLabel);
    SetBlipCategory(blip, 2) -- void SET_BLIP_CATEGORY(Blip blip, int index);, where the index=2: shows the distance you are away from the blip
    EndTextCommandSetBlipName(blip) -- void END_TEXT_COMMAND_SET_BLIP_NAME(Blip blip);
    print("Blip int: " .. blip)
end) -- does not need to be done every frame, just once

RegisterCommand(
    "removeblip",
    function(source, args)
        if DoesBlipExist(blip) then
            TriggerServerEvent("blips:takeBlip")
        end
    end
)

RegisterCommand(
    "bliptome",
    function(source, args)
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
        TriggerServerEvent("blips:takeBlip", x, y, z)
    end
)

RegisterNetEvent("blips:setBlip", function(x, y, z)
        if DoesBlipExist(blip) and x ~= nil then
            SetBlipCoords(blip, x, y, z) -- void SET_BLIP_COORDS(Blip blip, float posX, float posY, float posZ);
            SetBlipAsShortRange(blip, true) -- void SET_BLIP_AS_SHORT_RANGE(Blip blip, BOOL toggle);
            SetBlipHiddenOnLegend(blip, true) -- void SET_BLIP_HIDDEN_ON_LEGEND(Blip blip, BOOL toggle);
        else
            RemoveBlip(blip)
            blip = nil
        end
    end
)
