RegisterCommand("clear", function()
    RemoveAllPedWeapons(GetPlayerPed(-1), true)
    notify("~r~Cleared All Weapons")
end)

-- Spawns a random car from the array or "table"
local cars = {"adder", "comet", "cheetah", "faggio"}
RegisterCommand("car", function()
    local car = (cars[math.random(#cars)])
    spawnCar(car)
    notify("~p~Spawned car: ~h~~g~" .. car)
end)

RegisterCommand("die", function()
    SetEntityHealth(PlayerPedId(), 0)
    notify("~r~ You Died.")
end)

Citizen.CreateThread(function()

    local h_key = 74
    while true do
        Citizen.Wait(1)
        if IsControlJustReleased(1, h_key) then
            print("The key ".. h_key .. " was pressed")
            giveWeapon("weapon_pistol")

            giveWeapon("weapon_pumpshotgun")
                weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_AR_FLSH")

            giveWeapon("weapon_knife")
            alert("~b~Given Weapons with ~INPUT_VEH_HEADLIGHT~")
        end
    end

end)