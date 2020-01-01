Citizen.CreateThread(function() 	
    while true do 		
        Citizen.Wait(0) 		
        if IsControlPressed(1, 73 --[[ "x" key ]]) then 		
            -- https://runtime.fivem.net/doc/natives/#_0xAE99FB955581844A
            SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, true, true, false) 
        end 	
    end 
end)
