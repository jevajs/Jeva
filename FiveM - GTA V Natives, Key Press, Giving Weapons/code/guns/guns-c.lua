RegisterCommand("clear", function()
    RemoveAllPedWeapons(GetPlayerPed(-1), true)
    notify('~r~Cleared All Weapons.')
end)
Citizen.CreateThread(function()
    local h_key = 74
    local x_key = 73
    while true do
        Citizen.Wait(1)
        if IsControlJustReleased(1,  h_key --[[ H key ]]) then
            giveWeapon("weapon_pistol")
            giveWeapon("weapon_knife")
            alert("~b~Given weapons with ~INPUT_VEH_HEADLIGHT~")

        elseif IsControlJustReleased(1,  x_key --[[ X key ]]) then
            giveWeapon("weapon_combatmg")
            alert("~g~Given weapons with ~INPUT_VEH_DUCK~")
        end
    end
end)

