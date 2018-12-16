RegisterCommand("save", function(source, args)
    local argString = table.concat(args, " ")
    MySQL.Async.fetchAll("INSERT INTO main (id, name, args) VALUES(@source, @name, @args)",
    {["@source"] = GetPlayerIdentifiers(source)[1], ["@name"] = GetPlayerName(source), ["@args"] = argString},
    function(result)
        TriggerClientEvent("output", source, "^2"..argString.."^0")
    end)
end)

RegisterCommand("get", function(source, args) 
    local argString = table.concat(args, " ")
    MySQL.Async.fetchAll("SELECT * FROM main ORDER BY id DESC LIMIT 1",{}, 
    function(result)
            TriggerClientEvent("output", source, "^3("..result[1].name ..") - ^8".. result[1].id .."^0: " .. result[1].args)  
    end)    
end)


