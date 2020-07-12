function spawnVeh(car, persistent)
    persistent = persistent or false
    local car = GetHashKey(car)
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, x + 2, y + 2, z + 1, GetEntityHeading(PlayerPedId()), true, false)
    SetPedIntoVehicle(PlayerPedId(), vehicle, -1)

    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(veh)

    if persistent then
        SetEntityAsMissionEntity(vehicle, true, true)
    end
    return vehicle
end

function ApplyVehicleMod(vehicle, modType, mod)
    if type(mod) == "boolean" then
        ToggleVehicleMod(vehicle, modType, mod)
    else
        SetVehicleMod(vehicle, modType, mod, false)
    end
end
