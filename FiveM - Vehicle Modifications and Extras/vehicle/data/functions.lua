function spawnVeh(car)
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
    
    -- uncomment below if you want the vehicle to be persistent
    --SetEntityAsMissionEntity(vehicle, true, true)
    return vehicle
end

function table.length(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end