Citizen.CreateThread(function()
    local types = {
        "CLEAR",  
        "EXTRASUNNY",  
        "CLOUDS",  
        "OVERCAST",  
        "RAIN",  
        "CLEARING",  
        "THUNDER",  
        "SMOG",  
        "FOGGY",  
        "XMAS",  
        "SNOWLIGHT",  
        "BLIZZARD"  
    }
    while true do
        local weather = (types[math.random(#types)])
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist(weather)
        SetWeatherTypeNow(weather)
        SetWeatherTypeNowPersist(weather)
        Citizen.Wait(3500)
    end
end)