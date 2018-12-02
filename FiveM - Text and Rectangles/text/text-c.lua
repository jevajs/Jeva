local color = {
    r=255,
    g=0,
    b=75,
    a=255
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        SetTextFont(0) -- 0-4
        SetTextScale(0.4, 0.4) -- Size of text
        SetTextColour(color.r, color.g, color.b, color.a) -- RGBA
        SetTextEntry("STRING")
        AddTextComponentString("My Epic Server!") -- Main Text string
        DrawText( 0.0001, 0.0001) -- x,y of the screen
        
        DrawRect(150 --[[ x ]],100--[[ y ]],3.2--[[ width ]],0.05--[[ height ]],24, 36, 46, 245--[[ rgb ]] )
    end
end)