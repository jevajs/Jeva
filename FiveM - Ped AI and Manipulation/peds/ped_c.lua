-- https://forum.cfx.re/t/friendly-fire-how-to-properly-assign-teams/89739 more reference
local j = nil

local teams = {
    {name = "allies", model = "s_m_y_swat_01", weapon = "WEAPON_CARBINERIFLE"} --[[ -- bodyguards, 'friendly' ]],
    {name = "enemies", model = "g_m_m_chicold_01", weapon = "WEAPON_ASSAULTRIFLE"}, 
    
}
for i=1, #teams, 1 do 
    AddRelationshipGroup(teams[i].name)
end

RegisterCommand("war", function(source, args)
    local totalPeople = tonumber(args[1])
    for i=1,totalPeople, 1 do --[[ this loop will create two peds, one being an enemy and the other being an ally ]]
        j = math.random(1,#teams) --[[ this is just a lazy way to alternate between spawning an enemy or ally ]]
        local ped = GetHashKey(teams[j].model)
        -- preload the model
        RequestModel(ped)
        while not HasModelLoaded(ped) do 
            Citizen.Wait(1)
        end
        -- get the source's coords
        local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
        -- refer to ped types here under "PedTypes" -> https://runtime.fivem.net/doc/natives/#_0xD49F9B0955C367DE
        newPed = CreatePed(4 --[[refer above (4 only works for male peds and 5 is for female peds)]], ped, x+math.random(-totalPeople,totalPeople),y+math.random(-totalPeople,totalPeople) --[[ This random number will space them out more ]],z , 0.0 --[[float (int) Heading]], false, true)
        --- now lets give the ped some attributes -> https://runtime.fivem.net/doc/natives/#_0x9F7794730795E019
        SetPedCombatAttributes(newPed, 0, true) --[[ BF_CanUseCover ]]
        SetPedCombatAttributes(newPed, 5, true) --[[ BF_CanFightArmedPedsWhenNotArmed ]]
        SetPedCombatAttributes(newPed, 46, true) --[[ BF_AlwaysFight ]]
        SetPedFleeAttributes(newPed, 0, true) --[[ allows/disallows the ped to flee from a threat i think]]
        -- [[ find more groups here https://github.com/jorjic/fivem-docs/wiki/Ped-Types-&-Relationships#default-relationship-groups ]]
        SetPedRelationshipGroupHash(newPed, GetHashKey(teams[j].name)) --[[ when i did army, the peds fought eachother and it was pretty funny - https://runtime.fivem.net/doc/natives/#_0xC80A74AC829DDD92 ]]
        SetRelationshipBetweenGroups(5, GetHashKey(teams[1].name), GetHashKey(teams[2].name)) --[[ 
            More types (int) here https://github.com/jorjic/fivem-docs/wiki/Ped-Types-&-Relationships#relationship-types 
            Above, this will make enemies and allies hate eachother
        ]]
        if teams[j].name == "allies" then
            SetRelationshipBetweenGroups(0, GetHashKey(teams[j].name), GetHashKey("PLAYER"))
            SetPedAccuracy(newPed, 100) --[[ Allies will have 100 percent accuracy ]]
        else 
            SetRelationshipBetweenGroups(5, GetHashKey(teams[j].name), GetHashKey("PLAYER")) --[[ this is really janky sorry  ]]
        end
        TaskStartScenarioInPlace(newPed, "WORLD_HUMAN_SMOKING", 0, true)
        GiveWeaponToPed(newPed, GetHashKey(teams[j].weapon), 2000, true--[[ weapon is hidden or not (bool)]], false) --[[ https://runtime.fivem.net/doc/natives/#_0xBF0FD6E56C964FCB]]
        SetPedArmour(newPed, 100)
        SetPedMaxHealth(newPed, 100)
    end
end)