Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            for i = 1, #locations, 1 do
                loc = locations[i]
                -- https://runtime.fivem.net/doc/natives/?_0x28477EC23D892089
                DrawMarker(
                    loc.marker,
                    loc.pos.x,
                    loc.pos.y,
                    loc.pos.z-0.75,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                    loc.scale,
                    loc.scale,
                    loc.scale,
                    loc.rgba[1],
                    loc.rgba[2],
                    loc.rgba[3],
                    loc.rgba[4],
                    false,
                    true,
                    2,
                    nil,
                    nil,
                    false
                )
                if loc.submarker ~= nil then DrawMarker(
                    loc.submarker.marker,loc.pos.x,loc.pos.y,loc.submarker.posz,
                    0.0,0.0,0.0,0.0,0.0,0.0,
                    loc.scale/2,loc.scale/2,loc.scale/2,
                    loc.rgba[1],loc.rgba[2],loc.rgba[3],loc.rgba[4],
                    false,true,2,nil,nil,false) end
                local playerCoord = GetEntityCoords(PlayerPedId(), false)
                local locVector = vector3(loc.pos.x, loc.pos.y, loc.pos.z)
                if Vdist2(playerCoord, locVector) < loc.scale*1.12 and GetVehiclePedIsIn(PlayerPedId(), false) == 0 then
                    SetEntityCoords(PlayerPedId(), loc.tpto.x, loc.tpto.y, loc.tpto.z, true, true, true, false)
                    SetEntityHeading(PlayerPedId(), 0)    
                    notify("You have been teleported to location ~b~#"..i) 
                end
            end
        end
    end
)
