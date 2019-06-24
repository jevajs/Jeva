RegisterCommand("exports_server", function(source, args) 
    local argString = table.concat(args, " ")
    exports.exp:log(argString)
end)