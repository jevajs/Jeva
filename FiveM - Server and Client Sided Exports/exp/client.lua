-- The two functions below need to be refered in the __resource.lua
function notify(str)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(str)
    DrawNotification(true, false) -- More options can be found here https://runtime.fivem.net/doc/natives/#_0x2ED7843F8F801023
end

function chat(str)
    TriggerEvent(
        'chat:addMessage',
        {
            color = {255, 0, 0},
            multiline = true,
            args = {'Exported', str}
        }
    )
end

exports(
    'client_log',
    function(str) -- these exports don't need to be refered in __resource.lua (defined in the global scope)
        print(str)
    end
)
