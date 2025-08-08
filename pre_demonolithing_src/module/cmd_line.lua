local command_module = {}

command_module.commands = {
    help = {
        description = "List all available commands",
        execute = function(args)
            print("[help] commands available:")
            for name, cmd in pairs(command_module.commands) do
                print(" - " .. name .. ": " .. cmd.description)
            end
        end
    },

    kill = {
        description = "kills a player",
        execute = function(args)
            local target = args[1]
            print("[kill] Target:", target)
        end
    },

    say = {
        description = "say something to chat",
        execute = function(args)
            local message = table.concat(args, " ")
            print("[Say]:", message)
        end
    }
}

function command_module.execute(command_text)
    local tokens = command_text:split(" ")
    local command_name = tokens[1]:lower()
    table.remove(tokens, 1)

    local command = command_module.commands[command_name]
    if command then
        command.execute(tokens)
    else
        warn("[error] unknown command: " .. command_name)
    end
end

function command_module.get_suggestions(partial_input)
    local matches = {}
    for name, _ in pairs(command_module.commands) do
        if name:sub(1, #partial_input):lower() == partial_input:lower() then
            table.insert(matches, name)
        end
    end
    return matches
end

return command_module
