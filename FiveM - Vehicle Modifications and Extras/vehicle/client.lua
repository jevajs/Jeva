RegisterCommand(
    "vehicle",
    function(source, args)
        local category = args[1]
        if category == "spawn" then
            local vehicle = args[2]
            local carPaint = colors.metal["Pure Gold"]
            local veh = spawnVeh(vehicle, true)
            print(string.format("Spawned in a(n) %s.", GetLabelText(GetDisplayNameFromVehicleModel(vehicle))))
            SetVehicleColours(veh, carPaint, carPaint)
        elseif category == "customize" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            SetVehicleModKit(veh, 0)
            for modType = 0, 10, 1 do 
                -- You can do 50 iterations total 
                -- to loop through ALL customizations 
                -- the first 10 iterations will
                -- apply body features
                local bestMod = GetNumVehicleMods(veh, modType)
                SetVehicleMod(veh, modType, bestMod, false)
            end
        elseif category == "extras" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            for id=0, 20 do
                if DoesExtraExist(veh, id) then
                    SetVehicleExtra(veh, id, 1) -- p3 should be 0 for off or 1 for on
                end
            end
        elseif category == "repair" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            SetVehicleFixed(veh)
            SetVehicleEngineHealth(veh, 1000.0) -- https://runtime.fivem.net/doc/natives/?_0x45F6D8EEF34ABEF1
        elseif category == "doors" then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local open = GetVehicleDoorAngleRatio(veh, 0) < 0.1
            if open then
                for i = 0, 7, 1 do
                    SetVehicleDoorOpen(veh, i, false, false)
                end
            else
                SetVehicleDoorsShut(veh, false)
            end
        elseif category == "upgrade" then
            --[[
                16 - Armor
                15 - Suspension
                13 - Transmission
                14 - Horn
                12 - Brakes
                11 - Engine

             ]]
            --https://github.com/Sighmir/FiveM-Scripts/blob/master/vrp/vrp_lscustoms/client.lua
            --https://github.com/TomGrobbe/vMenu/blob/master/vMenu/menus/VehicleOptions.cs#L1713
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local color = colors.matte["Red"]
            local ourSelection = {
                -- These will be the upgrades we want to install
                ["Armour"] = "Armor Upgrade 100%",
                ["Engine"] = "EMS Upgrade, Level 4",
                ["Transmission"] = "Race Transmission",
                ["Suspension"] = "Competition Suspension",
                ["Horns"] = "Sadtrombone Horn",
                ["Brakes"] = "Race Brakes",
                ["Lights"] = "Xenon Lights",
                ["Turbo"] = "Turbo Tuning"
            }
            SetVehicleModKit(veh, 0) -- this has to be called before setting vehicle mods
            for k, v in pairs(ourSelection) do
                local modType = upgrades[k].type
                local mod = upgrades[k].types[v].index
                ApplyVehicleMod(veh, modType, mod)
            end
            SetVehicleColours(veh, color, color)
            ToggleVehicleMod(veh, upgrades["Lights"].type, true)
            -- pretty sure light colors will only work if you have xenon lights equipped
            SetVehicleXenonLightsColour(veh, upgrades["Lights"].xenonHeadlightColors["Red"].index)
            
        end
    end
)


