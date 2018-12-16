RegisterCommand("save", function(source, args)
    local argString = table.concat(args, " ")
    MySQL.Async.fetchAll("INSERT INTO main (id, name, args) VALUES(@source, @name, @args)",     
    --[[ 
        (id, name, args)
        These are the columns (in our database) we will be insterting the data into  
    ]]
    {["@source"] = GetPlayerIdentifiers(source)[1], ["@name"] = GetPlayerName(source), ["@args"] = argString},
        --[[ 
            Here we are defining the '@' variables to in-game native functions
         ]]
        function (result)
        TriggerClientEvent("output", source, "^2".. argString.. "^0")

    end)
end)
