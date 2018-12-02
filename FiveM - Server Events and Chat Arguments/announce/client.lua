RegisterCommand("announce", function(source, args)
    TriggerServerEvent('announce', table.concat(args, " "))
     -- we have to concatenate the table because the 'args' cb return a table (array)
     -- the 2nd parameter in 'table.concat' is just spacing each args out
end)
