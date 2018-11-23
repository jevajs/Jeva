local mph = true 

if mph == true then
    local factor = 2.2369
else 
    local factor = 3.6
end
--[[ 
local mph = 2.2369
local kph = 3.6 
]]

function text(content) 
    SetTextFont(1)
    SetTextProportional(0)
    SetTextScale(1.9,1.9)
    SetTextEntry("STRING")
    AddTextComponentString(content)
    DrawText(0.9,0.5)
end
Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)
        local speed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*factor)
        -- Condition to check if the ped is in a vehicle
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            text(math.floor(speed))
        end
    end
end)