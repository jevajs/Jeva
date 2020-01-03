-- the following values must satisfy the condtions (let x be the frequency) 
-- x ≥ 0.0
-- x must be a float type

local config = {
    pedFrequency = 1.0,
    trafficFrequency = 1.0,
}


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetPedDensityMultiplierThisFrame(config.pedFrequency) -- https://runtime.fivem.net/doc/natives/#_0x95E3D6257B166CF2
        --[[ 
        Values:  
        → 0.0 = no peds on streets  
        → 1.0 = normal peds on streets   
        ]]
        SetScenarioPedDensityMultiplierThisFrame(config.pedFrequency, config.pedFrequency) -- https://runtime.fivem.net/doc/natives/#_0x7A556143A1C03898
        -------------------------------
        SetRandomVehicleDensityMultiplierThisFrame(config.trafficFrequency) -- https://runtime.fivem.net/doc/natives/#_0xB3B3359379FE77D3
        SetParkedVehicleDensityMultiplierThisFrame(config.trafficFrequency) -- https://runtime.fivem.net/doc/natives/#_0xEAE6DCC7EEE3DB1D
        SetVehicleDensityMultiplierThisFrame(config.trafficFrequency) -- https://runtime.fivem.net/doc/natives/#_0x245A6883D966D537
        --[[ 
        Use this native inside a looped function.
        Values:
        0.0 = no vehicles on streets
        1.0 = normal vehicles on streets
        0.0 ≤ x ≤ 1.0
        ]]
    end 
end)