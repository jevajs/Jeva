function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end

--https://runtime.fivem.net/doc/natives/#_0xBF0FD6E56C964FCB
--Ped ped, Hash weaponHash, int ammoCount, BOOL isHidden, BOOL equipNow
function giveWeapon(weaponHash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(weaponHash), 999, false, false --[[equips when gotten]])
end