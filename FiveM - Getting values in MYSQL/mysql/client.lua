RegisterNetEvent("output")
AddEventHandler("output", function(argument)
    TriggerEvent("chatMessage", "[Success]", {0,255,0}, argument)
end) 
