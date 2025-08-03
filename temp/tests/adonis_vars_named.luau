client = nil
service = nil
Pcall = nil
Routine = nil
GetEnv = nil
origEnv = nil
logError = nil
return function(_, p1) --[[Anonymous function at line 11]]
    local v2 = p1(nil, {
        ["script"] = script
    })
    setfenv(1, v2)
    local _ = _G
    local game = game
    local _ = script
    local getfenv = getfenv
    local _ = setfenv
    local workspace = workspace
    local v6 = getmetatable
    local v7 = setmetatable
    local _ = loadstring
    local u8 = coroutine
    local u9 = rawequal
    local _ = typeof
    local _ = print
    local _ = math
    local warn = warn
    local _ = error
    local pcall = pcall
    local u12 = xpcall
    local v13 = select
    local _ = rawset
    local _ = rawget
    local _ = ipairs
    local _ = pairs
    local _ = next
    local _ = Rect
    local _ = Axes
    local _ = os
    local v14 = time
    local _ = Faces
    local _ = unpack
    local u15 = string
    local _ = Color3
    local v16 = newproxy
    local u17 = tostring
    local _ = tonumber
    local v18 = Instance
    local _ = TweenInfo
    local _ = BrickColor
    local _ = NumberRange
    local _ = ColorSequence
    local _ = NumberSequence
    local _ = ColorSequenceKeypoint
    local _ = NumberSequenceKeypoint
    local _ = PhysicalProperties
    local _ = Region3int16
    local _ = Vector3int16
    local _ = require
    local v19 = table
    local u20 = type
    local _ = wait
    local u21 = Enum
    local _ = UDim
    local _ = UDim2
    local _ = Vector2
    local _ = Vector3
    local _ = Region3
    local _ = CFrame
    local _ = Ray
    local _ = delay
    local u22 = nil
    local u23 = nil
    local u24 = nil
    local u25 = nil
    local u26 = v2.service
    local u27 = v2.client
    local u28 = u27.Core
    local u29 = u27.Remote
    local u30 = u27.Functions
    local u31 = u27.Disconnect
    local u32 = u27.Remote.Send
    local u33 = u27.Remote.Get
    local u34 = u26.NetworkClient
    local u35 = u27.Kill
    local u36 = u26.Players.LocalPlayer
    local u37 = v13(2, pcall(u26.RunService.IsStudio, u26.RunService))
    local u38 = u36.Kick
    local u39 = u26.GuiService:IsTenFootInterface()
    local u40 = u26.UserInputService.TouchEnabled and not u26.UserInputService.KeyboardEnabled
    if u40 then
        u40 = not u26.UserInputService.MouseEnabled
    end
    getfenv().client = nil
    getfenv().service = nil
    getfenv().script = nil
    local function u44(p41, p42, p43) --[[Anonymous function at line 81]]
        --[[
        Upvalues:
            [1] = u34
            [2] = pcall
            [3] = u32
            [4] = u17
            [5] = u39
            [6] = u40
            [7] = u37
            [8] = u36
            [9] = u31
            [10] = u35
        --]]
        if u34 and p41 ~= "_" then
            pcall(u32, "Detected", p41, u17(p42) .. (u39 and " - On Xbox" or (u40 and " - On mobile" or "")))
            task.wait(0.5)
            if p41 == "kick" and not u37 then
                if p43 then
                    u36:Kick(":" .. ":" .. " " .. "A" .. "d" .. "o" .. "n" .. "i" .. "s" .. " " .. "A" .. "n" .. "t" .. "i" .. " " .. "C" .. "h" .. "e" .. "a" .. "t" .. ":" .. ":" .. "\n" .. u17(p42))
                else
                    u31(p42)
                end
            elseif p41 == "crash" and not u37 then
                u35(p42)
            end
        end
        return true
    end
    local u45 = nil
    local u46 = nil
    local u47 = nil
    task.spawn(u12, function() --[[Anonymous function at line 99]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u46
            [3] = u47
            [4] = u44
        --]]
        local v48, v49, v50 = debug.info(u44, "nsl")
        u45 = v48
        u46 = v49
        u47 = v50
    end, function() --[[Anonymous function at line 101]]
        --[[
        Upvalues:
            [1] = u44
            [2] = pcall
            [3] = u31
            [4] = u35
            [5] = u38
            [6] = u36
        --]]
        u44("crash", "Tamper Protection 0xCCD44")
        task.wait(1)
        pcall(u31, "Adonis_0xCCD44")
        pcall(u35, "Adonis_0xCCD44")
        pcall(u38, u36, "Adonis_0xCCD44")
    end)
    local function u54(p51, p52) --[[Anonymous function at line 109]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u9
        --]]
        if u26.CountTable(p51) ~= u26.CountTable(p52) then
            return false
        end
        for v53, _ in p51 do
            if not u9(p51[v53], p52[v53]) then
                return false
            end
        end
        return true
    end
    local u55 = v16(true)
    local v56 = v6(u55)
    function v56.__index() --[[Anonymous function at line 128]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44("kick", "Proxy metaMethod 0x215F")
        return task.wait(200)
    end
    function v56.__newindex() --[[Anonymous function at line 134]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44("kick", "Proxy metaMethod 0x86F1")
        return task.wait(200)
    end
    function v56.__tostring() --[[Anonymous function at line 140]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44("kick", "Proxy metaMethod 0xC0BD0")
        return task.wait(200)
    end
    function v56.__unm() --[[Anonymous function at line 146]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44("kick", "Proxy metaMethod 0x10F00")
        return task.wait(200)
    end
    function v56.__add() --[[Anonymous function at line 152]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44("kick", "Proxy metaMethod 0x60DC3")
        return task.wait(200)
    end
    function v56.__sub() --[[Anonymous function at line 158]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44("kick", "Proxy metaMethod 0x90F5D")
        return task.wait(200)
    end
    function v56.__mul() --[[Anonymous function at line 164]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44("kick", "Proxy metaMethod 0x19999")
        return task.wait(200)
    end
    function v56.__div() --[[Anonymous function at line 170]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44("kick", "Proxy metaMethod 0x1D14AC")
        return task.wait(200)
    end
    function v56.__mod() --[[Anonymous function at line 176]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44("kick", "Proxy metaMethod 0x786C64")
        return task.wait(200)
    end
    function v56.__pow() --[[Anonymous function at line 182]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44("kick", "Proxy metaMethod 0x1D948C")
        return task.wait(200)
    end
    function v56.__len() --[[Anonymous function at line 188]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        u44("kick", "Proxy metaMethod 0xBE931")
        return task.wait(200)
    end
    v56.__metatable = "The metatable is locked"
    local u57 = v19.freeze({
        ["indexInstance"] = {},
        ["newindexInstance"] = {},
        ["namecallInstance"] = {},
        ["indexEnum"] = {},
        ["namecallEnum"] = {},
        ["eqEnum"] = {}
    })
    local u58 = {}
    local u59 = u26.UnWrap(game)
    local function u64(p60) --[[Anonymous function at line 212]]
        --[[
        Upvalues:
            [1] = u57
        --]]
        local v61 = #u57[p60] <= 0
        for v62 = 3, 4 do
            local v63 = debug.info(v62, "f")
            if v61 then
                u57[p60][v62] = v63
            elseif u57[p60][v62] ~= v63 then
                return true
            end
        end
        return false
    end
    local function u66(p65) --[[Anonymous function at line 228]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        return p65 and (u20(p65) == "function" and (debug.info(p65, "s") == "[C]" and (debug.info(p65, "l") == -1 and (debug.info(p65, "n") == "" and debug.info(p65, "a") == 0)))) and true or false
    end
    local u108 = v19.freeze({
        ["indexInstance"] = v19.freeze({ "kick", function() --[[Anonymous function at line 244]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u59
                    [3] = u64
                    [4] = u66
                    [5] = pcall
                    [6] = u55
                    [7] = u58
                    [8] = u54
                --]]
                local u67 = false
                local u68 = nil
                local v69, v70 = u12(function() --[[Anonymous function at line 248]]
                    --[[
                    Upvalues:
                        [1] = u59
                    --]]
                    local _ = u59.____________
                end, function() --[[Anonymous function at line 250]]
                    --[[
                    Upvalues:
                        [1] = u68
                        [2] = u67
                        [3] = u64
                    --]]
                    u68 = debug.info(2, "f")
                    if u67 or u64("indexInstance") then
                        u67 = true
                    end
                end)
                if not u66(u68) then
                    return true
                end
                local v71, v72 = pcall(u68, u59)
                local v73, v74 = pcall(u68)
                pcall(u68, u55, "GetChildren")
                pcall(u68, u55)
                pcall(u68, u59, u55)
                if u67 or (v69 or (v73 or v71)) then
                    return true
                end
                if not u58.indexInstance then
                    u58.indexInstance = { v70, v74, v72 }
                end
                return not u54(u58.indexInstance, { v70, v74, v72 })
            end }),
        ["newindexInstance"] = v19.freeze({ "kick", function() --[[Anonymous function at line 275]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u59
                    [3] = u64
                    [4] = u66
                    [5] = pcall
                    [6] = u55
                    [7] = u58
                    [8] = u54
                --]]
                local u75 = false
                local u76 = nil
                local v77, v78 = u12(function() --[[Anonymous function at line 279]]
                    --[[
                    Upvalues:
                        [1] = u59
                    --]]
                    u59.____________ = 5
                end, function() --[[Anonymous function at line 281]]
                    --[[
                    Upvalues:
                        [1] = u76
                        [2] = u75
                        [3] = u64
                    --]]
                    u76 = debug.info(2, "f")
                    if u75 or u64("newindexInstance") then
                        u75 = true
                    end
                end)
                if not u66(u76) then
                    return true
                end
                local v79, v80 = pcall(u76, u59)
                local v81, v82 = pcall(u76)
                pcall(u76, u55, "GetChildren")
                pcall(u76, u55)
                pcall(u76, u59, u55)
                pcall(u76, u59, "AllowThirdPartySales", u55)
                if u75 or (v77 or (v81 or v79)) then
                    return true
                end
                if not u58.newindexInstance then
                    u58.newindexInstance = { v78, v82, v80 }
                end
                return not u54(u58.newindexInstance, { v78, v82, v80 })
            end }),
        ["namecallInstance"] = v19.freeze({ "kick", function() --[[Anonymous function at line 307]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u59
                    [3] = u64
                    [4] = u66
                    [5] = pcall
                    [6] = u55
                    [7] = u37
                    [8] = u58
                    [9] = u54
                --]]
                local u83 = false
                local u84 = nil
                local v85, v86 = u12(function() --[[Anonymous function at line 311]]
                    --[[
                    Upvalues:
                        [1] = u59
                    --]]
                    u59:____________()
                end, function() --[[Anonymous function at line 313]]
                    --[[
                    Upvalues:
                        [1] = u84
                        [2] = u83
                        [3] = u64
                    --]]
                    u84 = debug.info(2, "f")
                    if u83 or u64("namecallInstance") then
                        u83 = true
                    end
                end)
                if not u66(u84) then
                    return true
                end
                local v87, v88 = pcall(u84, u59)
                local v89, v90 = pcall(u84)
                pcall(u84, u55)
                pcall(u84, u59, u55)
                if u83 or (v85 or (v89 or v87)) then
                    return not u37
                end
                if not u58.namecallInstance then
                    u58.namecallInstance = { v86, v90, v88 }
                end
                local v91 = not u54(u58.namecallInstance, { v86, v90, v88 })
                if v91 then
                    v91 = not u37
                end
                return v91
            end }),
        ["indexEnum"] = v19.freeze({ "kick", function() --[[Anonymous function at line 337]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u21
                    [3] = u64
                    [4] = u66
                    [5] = pcall
                    [6] = u55
                    [7] = u58
                    [8] = u54
                --]]
                local u92 = false
                local u93 = nil
                local v94, v95 = u12(function() --[[Anonymous function at line 341]]
                    --[[
                    Upvalues:
                        [1] = u21
                    --]]
                    local _ = u21.HumanoidStateType.____________
                end, function() --[[Anonymous function at line 343]]
                    --[[
                    Upvalues:
                        [1] = u93
                        [2] = u92
                        [3] = u64
                    --]]
                    u93 = debug.info(2, "f")
                    if u92 or u64("indexEnum") then
                        u92 = true
                    end
                end)
                if not u66(u93) then
                    return true
                end
                local v96, v97 = pcall(u93, u21.HumanoidStateType)
                local v98, v99 = pcall(u93)
                pcall(u93, u55, "Name")
                pcall(u93, u55)
                pcall(u93, u21.HumanoidStateType, u55)
                if u92 or (v94 or (v98 or v96)) then
                    return true
                end
                if not u58.indexEnum then
                    u58.indexEnum = { v95, v99, v97 }
                end
                return not u54(u58.indexEnum, { v95, v99, v97 })
            end }),
        ["namecallEnum"] = v19.freeze({ "kick", function() --[[Anonymous function at line 368]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u21
                    [3] = u64
                    [4] = u66
                    [5] = pcall
                    [6] = u55
                    [7] = u58
                    [8] = u54
                --]]
                local u100 = false
                local u101 = nil
                local v102, v103 = u12(function() --[[Anonymous function at line 372]]
                    --[[
                    Upvalues:
                        [1] = u21
                    --]]
                    u21.HumanoidStateType:____________()
                end, function() --[[Anonymous function at line 374]]
                    --[[
                    Upvalues:
                        [1] = u101
                        [2] = u100
                        [3] = u64
                    --]]
                    u101 = debug.info(2, "f")
                    if u100 or u64("namecallEnum") then
                        u100 = true
                    end
                end)
                if not u66(u101) then
                    return true
                end
                local v104, v105 = pcall(u101, u21.HumanoidStateType)
                local v106, v107 = pcall(u101)
                pcall(u101, u55)
                pcall(u101, u21.HumanoidStateType, u55)
                if u100 or (v102 or (v106 or v104)) then
                    return true
                end
                if not u58.namecallEnum then
                    u58.namecallEnum = { v103, v107, v105 }
                end
                return not u54(u58.namecallEnum, { v103, v107, v105 })
            end }),
        ["eqEnum"] = v19.freeze({ "kick", function() --[[Anonymous function at line 398]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                return u21.HumanoidStateType.Running ~= u21.HumanoidStateType.Running
            end })
    })
    local u109 = u26.UnWrap(v18.new("RemoteEvent"))
    local pcall0 = u26.UnWrap(v18.new("RemoteFunction"))
    local pcall1 = u26.UnWrap(u26.LogService)
    local pcall2 = v7({}, {
        ["__mode"] = "k"
    })
    u26.UnWrap(u26.Players).ChildRemoved:Connect(function(p113) --[[Anonymous function at line 408]]
        --[[
        Upvalues:
            [1] = pcall2
        --]]
        if p113:IsA("Player") then
            pcall2[p113] = true
        end
    end)
    Routine(function() --[[Anonymous function at line 414]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u46
            [3] = u47
            [4] = u45
            [5] = u108
            [6] = pcall
            [7] = u31
            [8] = u35
            [9] = u38
            [10] = u36
            [11] = u12
            [12] = u26
            [13] = u5
            [14] = u15
            [15] = u10
            [16] = pcall2
            [17] = u59
            [18] = pcall1
            [19] = u109
            [20] = u55
            [21] = pcall0
        --]]
        while true do
            local v114, v115, v116, v117, v118, v119 = debug.info(u44, "slanf")
            if v114 ~= u46 or (v115 ~= u47 or (v118 ~= u45 or (v116 ~= 3 or (v117 or (v119 ~= u44 or not u44("_", "_", true)))))) then
                break
            end
            for v120, v121 in u108 do
                local v122 = v121[1]
                local v123, v124 = pcall(v121[2])
                if v123 and (v124 == false or v124 == true) then
                    if v124 then
                        u44(v122, (("%* detector detected"):format(v120)))
                    end
                else
                    u44("crash", "Tamper Protection 0xDD42F")
                    task.wait(1)
                    pcall(u31, "Adonis_0xDD42F")
                    pcall(u35, "Adonis_0xDD42F")
                    pcall(u38, u36, "Adonis_0xDD42F")
                end
            end
            local u125 = false
            task.spawn(u12, function() --[[Anonymous function at line 447]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u36
                    [3] = u5
                    [4] = pcall
                    [5] = u15
                    [6] = u44
                    [7] = u10
                    [8] = pcall2
                    [9] = u59
                    [10] = u125
                --]]
                local u126 = u26.UnWrap(u36)
                local u127 = u26.UnWrap(u5)
                local v128, v129 = pcall(function() --[[Anonymous function at line 451]]
                    --[[
                    Upvalues:
                        [1] = u126
                        [2] = u127
                    --]]
                    u126.Kick(u127, "If this message appears, report it to Adonis maintainers. 0x1")
                end)
                local v130, v131 = pcall(function() --[[Anonymous function at line 454]]
                    --[[
                    Upvalues:
                        [1] = u127
                    --]]
                    u127:Kick("If this message appears, report it to Adonis maintainers. 0x2")
                end)
                if v128 or (v129 ~= "Expected \':\' not \'.\' calling member function Kick" or (v130 or (u15.match(v131, "^Kick is not a valid member of Workspace \"(.+)\"$") or "") ~= u127:GetFullName())) then
                    u44("kick", "Anti kick found! Method 0x3")
                    warnv128, v129, "|", v130, v131)
                end
                if #u26.Players:GetPlayers() > 1 then
                    local v132 = u26.Players
                    for _, v133 in u26.Players:GetPlayers() do
                        local u134 = u26.UnWrap(v133)
                        if u134 and (not pcall2[u134] and (u134.Parent == v132 and u134 ~= u126)) then
                            local v135, v136 = pcall(u126.Kick, u134, "If this message appears, report it to Adonis maintainers. 0x2")
                            local v137, v138 = pcall(function() --[[Anonymous function at line 474]]
                                --[[
                                Upvalues:
                                    [1] = u134
                                --]]
                                u134:Kick("If this message appears, report it to Adonis maintainers. 0x4")
                            end)
                            if v135 or (v136 ~= "Cannot kick a non-local Player from a LocalScript" or (v137 or v138 ~= "Cannot kick a non-local Player from a LocalScript")) then
                                u44("kick", "Anti kick found! Method 0x6")
                                warn(v135, v136, "|", v137, v138)
                            end
                        end
                    end
                end
                local v139, v140 = pcall(function() --[[Anonymous function at line 492]]
                    --[[
                    Upvalues:
                        [1] = u126
                    --]]
                    u126:KicK("If this message appears, report it to Adonis maintainers. 0x5")
                end)
                if v139 or (u15.match(v140, "^%a+ is not a valid member of Player \"(.+)\"$") or "") ~= u126:GetFullName() then
                    u44("kick", "Anti kick found! Method 0x4")
                end
                local v141, v142 = pcall(u26.UnWrap(u127).GetRealPhysicsFPS, u59)
                if v141 or not u15.match(v142, "Expected \':\' not \'.\' calling member function GetRealPhysicsFPS") then
                    u44("kick", "Anti FPS detection found!")
                end
                u125 = true
            end, function() --[[Anonymous function at line 506]]
                --[[
                Upvalues:
                    [1] = u44
                    [2] = pcall
                    [3] = u31
                    [4] = u35
                    [5] = u38
                    [6] = u36
                --]]
                u44("crash", "Tamper Protection 0x16E68")
                task.wait(1)
                pcall(u31, "Adonis_0x16E68")
                pcall(u35, "Adonis_0x16E68")
                pcall(u38, u36, "Adonis_0x16E68")
            end)
            task.spawn(u12, function() --[[Anonymous function at line 514]]
                --[[
                Upvalues:
                    [1] = u125
                    [2] = u44
                --]]
                task.wait(4)
                if not u125 then
                    u44("kick", "Anti kick found! Method 0x3")
                end
            end, function() --[[Anonymous function at line 519]]
                --[[
                Upvalues:
                    [1] = u44
                    [2] = pcall
                    [3] = u31
                    [4] = u35
                    [5] = u38
                    [6] = u36
                --]]
                u44("crash", "Tamper Protection 0x7D2B")
                task.wait(1)
                pcall(u31, "Adonis_0x7D2B")
                pcall(u35, "Adonis_0x7D2B")
                pcall(u38, u36, "Adonis_0x7D2B")
            end)
            local u143 = false
            task.spawn(u12, function() --[[Anonymous function at line 528]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u5
                    [3] = pcall
                    [4] = pcall1
                    [5] = u15
                    [6] = u44
                    [7] = u109
                    [8] = u55
                    [9] = pcall0
                    [10] = u143
                --]]
                local u144 = u26.UnWrap(u5)
                local v145, v146 = pcall(function() --[[Anonymous function at line 533]]
                    --[[
                    Upvalues:
                        [1] = pcall1
                    --]]
                    pcall1:getlogHistory()
                end)
                local v147, v148 = pcall(function() --[[Anonymous function at line 536]]
                    --[[
                    Upvalues:
                        [1] = pcall1
                        [2] = u144
                    --]]
                    pcall1.GetLogHistory(u144)
                end)
                local v149, v150 = pcall(function() --[[Anonymous function at line 539]]
                    --[[
                    Upvalues:
                        [1] = u144
                    --]]
                    u144:GetLogHistory()
                end)
                if v145 or ((u15.match(v146, "^%a+ is not a valid member of LogService \"(.+)\"$") or "") ~= pcall1:GetFullName() or (v147 or (v148 ~= "Expected \':\' not \'.\' calling member function GetLogHistory" or (v149 or (u15.match(v150, "^GetLogHistory is not a valid member of Workspace \"(.+)\"$") or "") ~= u144:GetFullName())))) then
                    u44("kick", "0x7D3C GetLogHistory function hooks detected")
                end
                local v151, v152 = pcall(function() --[[Anonymous function at line 554]]
                    --[[
                    Upvalues:
                        [1] = u109
                    --]]
                    u109:fireserver()
                end)
                local v153, v154 = pcall(function() --[[Anonymous function at line 557]]
                    --[[
                    Upvalues:
                        [1] = u109
                        [2] = u144
                    --]]
                    u109.FireServer(u144)
                end)
                local v155, v156 = pcall(function() --[[Anonymous function at line 560]]
                    --[[
                    Upvalues:
                        [1] = u144
                    --]]
                    u144:FireServer()
                end)
                if v151 or ((u15.match(v152, "^%a+ is not a valid member of RemoteEvent \"(.+)\"$") or "") ~= u109:GetFullName() or (v153 or (v154 ~= "Expected \':\' not \'.\' calling member function FireServer" or (v155 or (u15.match(v156, "^FireServer is not a valid member of Workspace \"(.+)\"$") or "") ~= u144:GetFullName())))) then
                    u44("kick", "FireServer function hooks detected")
                end
                pcall(u109.FireServer, u55, u55)
                local v157, v158 = pcall(function() --[[Anonymous function at line 576]]
                    --[[
                    Upvalues:
                        [1] = pcall0
                    --]]
                    pcall0:invokeserver()
                end)
                local v159, v160 = pcall(function() --[[Anonymous function at line 579]]
                    --[[
                    Upvalues:
                        [1] = pcall0
                        [2] = u144
                    --]]
                    pcall0.InvokeServer(u144)
                end)
                local v161, v162 = pcall(function() --[[Anonymous function at line 582]]
                    --[[
                    Upvalues:
                        [1] = u144
                    --]]
                    u144:InvokeServer()
                end)
                if v157 or ((u15.match(v158, "^%a+ is not a valid member of RemoteFunction \"(.+)\"$") or "") ~= pcall0:GetFullName() or (v159 or (v160 ~= "Expected \':\' not \'.\' calling member function InvokeServer" or (v161 or (u15.match(v162, "^InvokeServer is not a valid member of Workspace \"(.+)\"$") or "") ~= u144:GetFullName())))) then
                    u44("kick", "InvokeServer function hooks detected")
                end
                pcall(pcall0.InvokeServer, u55, u109)
                u143 = true
            end, function() --[[Anonymous function at line 597]]
                --[[
                Upvalues:
                    [1] = u44
                    [2] = pcall
                    [3] = u31
                    [4] = u35
                    [5] = u38
                    [6] = u36
                --]]
                u44("crash", "Tamper Protection 0xB3EB")
                task.wait(1)
                pcall(u31, "Adonis_0xB3EB")
                pcall(u35, "Adonis_0xB3EB")
                pcall(u38, u36, "Adonis_0xB3EB")
            end)
            task.spawn(u12, function() --[[Anonymous function at line 605]]
                --[[
                Upvalues:
                    [1] = u143
                    [2] = u44
                --]]
                task.wait(4)
                if not u143 then
                    u44("kick", "Remote and/or logservice spoofcheck failed")
                end
            end, function() --[[Anonymous function at line 610]]
                --[[
                Upvalues:
                    [1] = u44
                    [2] = pcall
                    [3] = u31
                    [4] = u35
                    [5] = u38
                    [6] = u36
                --]]
                u44("crash", "Tamper Protection 0x33E0")
                task.wait(1)
                pcall(u31, "Adonis_0x33E0")
                pcall(u35, "Adonis_0x33E0")
                pcall(u38, u36, "Adonis_0x33E0")
            end)
            task.wait(5)
        end
        while true do

        end
    end)
    local u163 = {}
    local u169 = u26.ReadOnly({
        ["Init"] = function() --[[Function name: Init, line 54]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u27
                [3] = u22
                [4] = u25
                [5] = u23
            --]]
            u24 = u27.UI
            u22 = u27.Anti
            u25 = u27.Variables
            u23 = u27.Process
            u22.Init = nil
        end,
        ["RunLast"] = function() --[[Function name: RunLast, line 73]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22.RunLast = nil
        end,
        ["RunAfterLoaded"] = function() --[[Function name: RunAfterLoaded, line 63]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u22
            --]]
            u26.Player.Changed:Connect(function() --[[Anonymous function at line 64]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u26
                --]]
                if u22.RLocked(u26.Player) then
                    u22.Detected("kick", "Player is Roblox Locked")
                end
            end)
            u22.RunAfterLoaded = nil
        end,
        ["Launch"] = function(p164, p165) --[[Anonymous function at line 623]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u26
            --]]
            if u22.Detectors[p164] and u26.NetworkClient then
                u22.Detectors[p164](p165)
            end
        end,
        ["Detected"] = u44,
        ["Detectors"] = u26.ReadOnly(v7({}, {
            ["__index"] = u163
        }), false, true),
        ["AddDetector"] = function(p166, p167) --[[Function name: AddDetector, line 639]]
            --[[
            Upvalues:
                [1] = u163
            --]]
            if not u163[p166] then
                u163[p166] = p167
            end
        end,
        ["RLocked"] = function(u168) --[[Function name: RLocked, line 645]]
            --[[
            Upvalues:
                [1] = pcall
            --]]
            return not pcall(function() --[[Anonymous function at line 646]]
                --[[
                Upvalues:
                    [1] = u168
                --]]
                return u168.GetFullName(u168)
            end)
        end
    }, {
        ["Init"] = true,
        ["RunLast"] = true,
        ["RunAfterLoaded"] = true
    }, true)
    u27.Anti = u169
    local v170 = u26.MetaFunc
    local v171 = v170(u26.TrackTask)
    local u172 = v170(pcall)
    local u173 = v170(task.wait)
    v170(v14)
    v171("Thread: TableCheck", v170(function() --[[Anonymous function at line 661]]
        --[[
        Upvalues:
            [1] = u173
            [2] = u8
            [3] = u27
            [4] = u28
            [5] = u29
            [6] = u30
            [7] = u169
            [8] = u32
            [9] = u33
            [10] = u44
            [11] = u31
            [12] = u35
            [13] = u172
            [14] = u38
            [15] = u36
        --]]
        while u173(1) do
            local v174, v175, v176, v177, v178, v179, v180, v181, v182, v183 = u8.resume(u8.create(function() --[[Anonymous function at line 663]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                return u27.Core, u27.Remote, u27.Functions, u27.Anti, u27.Remote.Send, u27.Remote.Get, u27.Anti.Detected, u27.Disconnect, u27.Kill
            end))
            if not v174 or (v175 ~= u28 or (v176 ~= u29 or (v177 ~= u30 or (v178 ~= u169 or (v179 ~= u32 or (v180 ~= u33 or (v181 ~= u44 or (v182 ~= u31 or v183 ~= u35)))))))) then
                u172(u44, "crash", "Tamper Protection 0x273A")
                u173(1)
                u172(u31, "Adonis_0x273A")
                u172(u35, "Adonis_0x273A")
                u172(u38, u36, "Adonis_0x273A")
            end
        end
    end))
end
