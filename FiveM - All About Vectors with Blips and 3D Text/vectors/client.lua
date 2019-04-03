-- 3d vector (airport) <x,y,z>
local v1 = vector3(-1377.514282266, -2852.64941406, 13.9448)
-- 2d vector (airport) <x,y>
local v2 = vector2(-1299.757, -2846.576)
-- '4d' vector (airport) <x,y,z,w>
local v3 = vector4(-1377.514282266, -2852.64941406, 13.9448, 360)

local blip = AddBlipForCoord(v2.x, v2.y)
-- sets the blip id (which icon will be desplayed)
-- https://runtime.fivem.net/doc/natives/#_0xDF735600A4696DAF
SetBlipSprite(blip, 364)
-- sets where the blip to be shown on both the minimap and the menu map 
-- https://runtime.fivem.net/doc/natives/#_0x9029B2F3DA924928
SetBlipDisplay(blip, 6)
-- how big the blip will be
-- https://runtime.fivem.net/doc/natives/#_0xD38744167B2FA257
SetBlipScale(blip, 0.9)
-- blip entry type
BeginTextCommandSetBlipName("STRING");
-- The title of the blip
AddTextComponentString("Do not enter")
EndTextCommandSetBlipName(blip)


RegisterCommand("tp", function(source, args) 
    -- https://runtime.fivem.net/doc/natives/#_0x06843DA7060A026B
    SetEntityCoords(PlayerPedId(), v3.x, v3.y, v3.z, true, true, true, false)
    SetEntityHeading(PlayerPedId(), v3.w)
end)


-- forked from https://forum.fivem.net/t/3d-text-above-cyrcle-marker-trigger/161363/7 user: MixZira
function Draw3DText(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local p = GetGameplayCamCoords()
    local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
    local scale = (1 / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0, 0.35)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local distance_until_text_disappears = 5000

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
            -- the "Vdist2" native checks how far two vectors are from another. 
            -- https://runtime.fivem.net/doc/natives/#_0xB7A628320EFF8E47
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance_until_text_disappears then
                Draw3DText(v1.x,v1.y,v1.z, "test")
            end
    end
end)