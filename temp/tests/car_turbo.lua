-- Wait for the functions to exist
repeat wait() until type(toggleTurbo) == "function" and type(update_turboUI) == "function"

-- Now lock u24
spawn(function()
    while true do
        -- For toggleTurbo
        for i = 1, math.huge do
            local name, value = debug.getupvalue(toggleTurbo, i)
            if name == "u24" then
                debug.setupvalue(toggleTurbo, i, 400)
                break
            end
        end
        -- For update_turboUI
        for i = 1, math.huge do
            local name, value = debug.getupvalue(update_turboUI, i)
            if name == "u24" then
                debug.setupvalue(update_turboUI, i, 400)
                break
            end
        end
        wait(0.05)
    end
end)