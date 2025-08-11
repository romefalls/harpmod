script:Destroy()
local u1 = game.Players.LocalPlayer
local u2 = game:GetService("UserInputService")
game:GetService("StarterGui")
local u3 = u1:WaitForChild("PlayerGui"):WaitForChild("Vehicle")
local u4 = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("CarEvent")
local u5 = workspace.CurrentCamera
local u6 = nil
local u7 = 2.75
local u8 = 0.008
local u9 = {}
repeat
    wait()
until u1.Character ~= nil
local u10 = 0
local u11 = nil
local u12 = nil
local u13 = nil
local u14 = nil
local u15 = nil
local u16 = nil
local u17 = nil
local u18 = nil
local u19 = {}
local u20 = nil
local u21 = 0
local u22 = {}
local u23 = false
local u24 = 100
local u25 = u3:WaitForChild("Boost")
local u26 = false
local u27 = 0
local u28 = {
    ["rbxassetid://3482305681"] = { 0.006 },
    ["rbxassetid://3656796538"] = { 0.003 },
    ["rbxassetid://3651987136"] = { 0.01, 0.5 },
    ["rbxassetid://3940831369"] = { 0.01, 1.6 },
    ["rbxassetid://3993504282"] = { 0.01, 0.25 },
    ["rbxassetid://3646494889"] = { 0.002, 0.6 },
    ["rbxassetid://3365207099"] = { 0.004, 0.4 },
    ["rbxassetid://6934063987"] = { 0.004, 0.4 },
    ["rbxassetid://6524798166"] = { 0.004, 0.6 },
    ["rbxassetid://6595418285"] = { 0.004, 0.6 }
}
local function u39(p29, p30) --[[Anonymous function at line 72]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u1
    --]]
    local v31 = p30.magnitude
    local v32 = p30.unit
    local v33 = { u6, u1.Character }
    local v34 = p29
    local v35 = 0
    while true do
        local v36 = Ray.new(p29, v32 * (v31 - v35))
        local v37, v38
        v37, p29, v38 = game.Workspace:FindPartOnRayWithIgnoreList(v36, v33, false, true)
        if v37 and (not v37.CanCollide or (not v37.Anchored or v37.Transparency >= 1)) then
            table.insert(v33, v37)
        end
        v35 = (v34 - p29).magnitude
        if v31 - 0.1 <= v35 or v37 and (v37.CanCollide and (v37.Anchored and v37.Transparency < 1)) then
            return v37, p29, v38
        end
    end
end
local function u51(p40, p41) --[[Anonymous function at line 94]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u1
    --]]
    local v42 = p41.magnitude
    local v43 = p41.unit
    local v44 = { u6, u1.Character }
    local v45 = p40
    local v46 = 0
    while true do
        local v47 = Ray.new(p40, v43 * (v42 - v46))
        local v48, v49, v50
        v48, p40, v49, v50 = game.Workspace:FindPartOnRayWithIgnoreList(v47, v44, false, true)
        if v48 and (not v48.CanCollide or (not v48.Anchored or v48.Transparency >= 1)) then
            table.insert(v44, v48)
        end
        v46 = (v45 - p40).magnitude
        if v42 - 0.1 <= v46 or v48 and (v48.CanCollide and (v48.Anchored and v48.Transparency < 1)) then
            return v48, p40, v49, v50
        end
    end
end
local function u64(p52, p53) --[[Anonymous function at line 120]]
    local v54 = p52.PrimaryPart.Velocity
    local v55 = p52.PrimaryPart.CFrame.lookVector:Dot(v54)
    local v56 = v54.Magnitude
    if v55 > 0 and p53 then
        local v57 = p52.Main.tokyodrift
        local v58 = v55 / v56
        local v59 = -0.05 + 1.05 * (1 - math.pow(v58, 2))
        local v60 = v56 / 30
        local v61 = v59 * math.clamp(v60, 0, 1)
        v57.Volume = math.clamp(v61, 0, 0.25)
    else
        local v62 = p52.Main.tokyodrift
        local v63 = p52.Main.tokyodrift.Volume
        v62.Volume = v63 + (0 - v63) * 0.1
    end
end
function GetPitch(p65, p66)
    local v67 = math.abs(p65) / p66
    local v68 = math.min(v67, 0.999)
    return (v68 % 0.2 * 3 + v68 / 2 * 10 / 10 + 1) * 0.68
end
local u69 = nil
local u70 = nil
local function u89(p71) --[[Anonymous function at line 145]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u21
        [3] = u19
        [4] = u51
        [5] = u20
    --]]
    local v72 = u6.PrimaryPart.Velocity.Magnitude
    local v73 = u21
    u21 = v73 + (u6.VehicleSeat.Steer - v73) * 0.1
    local _, _, v74 = u6.WheelModels.Wheel.ManualWeld.C1:toEulerAnglesXYZ()
    for _, v75 in pairs(u19) do
        local v76 = u51
        local v77 = v75.Center.Position
        local v78 = v75.Center.CFrame
        local v79 = -u20 * 0.75
        local v80, v81, _, v82 = v76(v77, v78:vectorToWorldSpace((Vector3.new(0, v79, 0))), u6)
        local v83 = 0
        if v75.Name == "WheelF" then
            v83 = 1
        else
            local v84 = v75.ParticleEmitter
            local v85
            if v80 == nil or v72 <= 35 then
                v85 = false
            else
                v85 = (v82 == Enum.Material.Sand or (v82 == Enum.Material.Sandstone or v82 == Enum.Material.Limestone)) and true or v82 == Enum.Material.Ground
            end
            v84.Enabled = v85
        end
        local v86 = v75.Center.Position.Y - v81.Y
        local v87 = -math.abs(v86) + u20 / 2
        local v88 = math.clamp(v87, -1, 0.2)
        v75.ManualWeld.C1 = CFrame.new(0, v88, 0) * CFrame.Angles(0, -0.7853981633974483 * u21 * v83, 0) * CFrame.Angles(0, 0, p71 * 3.141592653589793 * 0.002 + v74)
    end
end
local function u107(p90, p91) --[[Anonymous function at line 169]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u19
        [3] = u20
        [4] = u51
    --]]
    if p91 == nil then
        p91 = u6
    end
    local _ = p91.PrimaryPart.Velocity.Magnitude
    local _, _, v92 = p91.WheelModels.Wheel.ManualWeld.C1:toEulerAnglesXYZ()
    local v93, v94
    if p91 == u6 then
        v93 = u19
        v94 = u20
    else
        v93 = p91.WheelModels:GetChildren()
        local v95 = v93[1].WheelModel.Size.X
        local v96 = v93[1].WheelModel.Size.Y
        local v97 = v93[1].WheelModel.Size.Z
        v94 = math.max(v95, v96, v97)
    end
    for _, v98 in pairs(v93) do
        local v99 = u51
        local v100 = v98.Center.Position
        local v101 = v98.Center.CFrame
        local v102 = -v94 * 0.75
        local _, v103, _, _ = v99(v100, v101:vectorToWorldSpace((Vector3.new(0, v102, 0))), p91)
        local _ = v98.Name == "WheelF"
        local v104 = v98.Center.Position.Y - v103.Y
        local v105 = -math.abs(v104) + v94 / 2
        local v106 = math.clamp(v105, -1, 0.2)
        v98.ManualWeld.C1 = CFrame.new(0, v106, 0) * CFrame.Angles(0, 0, p90 * 3.141592653589793 * 0.002 / 0.3333333333333333 + v92)
    end
end
local function u125(p108, p109, _) --[[Anonymous function at line 202]]
    --[[
    Upvalues:
        [1] = u39
        [2] = u7
        [3] = u6
        [4] = u69
        [5] = u10
        [6] = u70
    --]]
    local v110 = p108:FindFirstChild("BodyThrust") or Instance.new("BodyThrust", p108)
    local v111 = 1
    local v112, v113 = u39(p108.Position, p108.CFrame:vectorToWorldSpace(Vector3.new(0, -1, 0) * u7), u6)
    local v114 = (v113 - p108.Position).magnitude
    local v115 = 1 / (p109 / 0.016666666666666666)
    if v112 and v112.CanCollide then
        if p108.Name == "1" then
            local v116 = u6.VehicleSeat.Steer * (u6.PrimaryPart.Velocity.Magnitude / 20)
            v111 = 1 - math.clamp(v116, 0, 0.7)
        elseif p108.Name == "4" then
            local v117 = -u6.VehicleSeat.Steer * (u6.PrimaryPart.Velocity.Magnitude / 20)
            v111 = 1 - math.clamp(v117, 0, 0.7)
        end
        local v118 = (u7 - v114) ^ 2 * (u69 / u7 ^ 2) * v115 * v111
        local v119 = -u10 * 1.5
        local v120 = u10 * 1.5
        local v121 = math.clamp(v118, v119, v120)
        v110.force = Vector3.new(0, v121, 0)
        local v122 = p108.CFrame:toObjectSpace(CFrame.new(p108.Velocity + p108.Position)).p * u70 * v115
        local v123 = v110.force
        local v124 = v122.Y
        v110.force = v123 - Vector3.new(0, v124, 0)
    else
        v110.force = Vector3.new(0, 0, 0)
    end
end
local function u146(_, p126, p127) --[[Anonymous function at line 226]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u8
        [4] = u23
    --]]
    if not p127 then
        return Vector3.new(0, 0, 0)
    end
    local v128 = u6.PrimaryPart.Velocity
    local v129 = v128 == Vector3.new(0, 0, 0) and Vector3.new(0, 1, 0) or v128
    local v130 = v129.magnitude
    local v131 = (v129.unit + Vector3.new(0.001, 0.001, -0.001)):Dot(u6.PrimaryPart.CFrame.rightVector)
    local v132 = (v129.unit + Vector3.new(0.001, 0.001, -0.001)):Dot(u6.PrimaryPart.CFrame.lookVector)
    local v133 = math.sign(v132)
    local v134 = v131 == nil and 0 or v131
    local v135 = v133 == nil and 0 or v133
    local v136 = v134 * v130 * u10 / 2 * 0.07
    local v137 = v130 / 40
    local v138 = v136 * (1 + -0.7 * math.clamp(v137, 0, 1))
    local v139 = u10 / 5 * u8 * v130 * v135
    local _ = u6.VehicleSeat.Throttle == 0
    local v140 = 0
    local v141 = u6.VehicleSeat.Throttle
    local v142 = math.abs(v141) * u10 / 5 * 0.011 * v130 * v135
    local v143 = u23 and 1.5 or u6.VehicleSeat.Throttle
    if not (p127 or u23) then
        return Vector3.new(0, 0, 0)
    end
    local v144 = -v138 * (p126 / 0.016666666666666666)
    local v145 = u10 / 2 * 0.5 * -math.clamp(v143, -0.65, 1) + v139 + v140 + v142
    return Vector3.new(v144, 0, v145)
end
local u147 = false
local function u148() --[[Anonymous function at line 267]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u147
    --]]
    if u6.VehicleSeat.Throttle == 1 then
        u147 = true
    else
        if u147 then
            u6.Main.boost.TimePosition = 29.6
        end
        u147 = false
    end
end
local function u182(p149) --[[Anonymous function at line 278]]
    --[[
    Upvalues:
        [1] = u39
        [2] = u6
        [3] = u7
        [4] = u26
        [5] = u23
        [6] = u11
        [7] = u10
        [8] = u64
        [9] = u125
        [10] = u12
        [11] = u146
        [12] = u89
        [13] = u13
    --]]
    local v150, _ = u39(u6.PrimaryPart.CFrame.p, u6.PrimaryPart.CFrame:vectorToWorldSpace(Vector3.new(0, -1, 0) * (u7 + 2.5)))
    local v151 = v150 and true or false
    local v152 = u6.Main.Velocity.magnitude
    if not u26 then
        if u23 then
            local v153 = u11
            local v154 = u10 * 0.4
            local v155 = u10 * 0.4
            local v156 = u10 * 0.4
            v153.MaxTorque = Vector3.new(v154, v155, v156)
            u11.CFrame = CFrame.new(Vector3.new(), u6.PrimaryPart.Velocity)
        elseif v151 then
            u11.MaxTorque = Vector3.new(0, 99900000, 0)
            local v157 = u11
            local v158 = u11.CFrame
            local v159 = CFrame.Angles
            local v160 = u6.VehicleSeat.Steer * -0.02 * (p149 / 0.016666666666666666) * 0.9
            local v161 = u6.Main.Velocity.magnitude / 15
            local v162 = v160 * math.clamp(v161, 0, 1)
            local v163 = u6.Main.Velocity:Dot(u6.Main.CFrame.lookVector)
            v157.CFrame = v158 * v159(0, v162 * math.sign(v163), 0)
        else
            u11.MaxTorque = Vector3.new(0, 0, 0)
            local v164 = u6.PrimaryPart.CFrame * CFrame.new(0, 0, -50)
            local v165 = u11
            local v166 = CFrame.new
            local v167 = u6.PrimaryPart.CFrame.p
            local v168 = v164.x
            local v169 = u6.PrimaryPart.CFrame.y
            local v170 = v164.z
            v165.CFrame = v166(v167, (Vector3.new(v168, v169, v170)))
        end
    end
    local v171 = v152 / 45
    u11.P = 250 + -100 * math.clamp(v171, 0, 1)
    u64(u6, v151)
    u125(u6.Thrusters[1], p149, 1)
    u125(u6.Thrusters[2], p149, 2)
    u125(u6.Thrusters[3], p149, 3)
    u125(u6.Thrusters[4], p149, 4)
    u12.Force = u146(v152, p149, v151)
    local v172 = u6.PrimaryPart.Velocity.X
    local v173 = u6.PrimaryPart.Velocity.Z
    local v174 = Vector3.new(v172, 0, v173):Dot(u6.PrimaryPart.CFrame.LookVector)
    u89(v174)
    if v151 then
        local v175 = u6.Main.boost
        local v176 = u6.Main.boost.Pitch
        v175.PlaybackSpeed = v176 + (GetPitch(v174, 60) + u6.VehicleSeat.Throttle * 0.2 - v176) * 0.1
    elseif not v151 or u23 then
        local v177 = u6.Main.boost
        local v178 = u6.Main.boost.PlaybackSpeed
        v177.PlaybackSpeed = v178 + (1.8 - v178) * 0.2
    end
    if u6.VehicleSeat.Throttle == 0 and v174 <= 2 then
        local v179 = u13
        local v180 = u10 / 20
        local v181 = u10 / 20
        v179.MaxForce = Vector3.new(v180, 500, v181)
    else
        u13.MaxForce = Vector3.new(0, 0, 0)
    end
    if u6.PrimaryPart.Velocity.Magnitude >= 500 then
        u13.MaxForce = Vector3.new(inf, inf, inf)
    end
    update_turboUI()
end
function u9.Initiate(p183, p184) --[[Anonymous function at line 325]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u1
        [4] = u11
        [5] = u12
        [6] = u13
        [7] = u14
        [8] = u19
        [9] = u20
        [10] = u69
        [11] = u70
        [12] = u27
        [13] = u3
        [14] = u182
        [15] = u15
        [16] = u148
        [17] = u16
        [18] = u9
        [19] = u17
        [20] = u2
        [21] = u18
        [22] = u8
        [23] = u28
        [24] = u7
        [25] = u5
    --]]
    if p183 then
        u6 = p184
        for _, v185 in pairs(u6:GetDescendants()) do
            if v185:IsA("BasePart") then
                u10 = u10 + v185:GetMass() * 196.2
            end
        end
        for _, v186 in pairs(u1.Character:GetDescendants()) do
            if v186:IsA("BasePart") then
                u10 = u10 + v186:GetMass() * 196.2
            end
        end
        u6.Main.boost:Play()
        u6.Main.tokyodrift:Play()
        u11 = u6.PrimaryPart:FindFirstChild("BodyGyro") or Instance.new("BodyGyro", u6.PrimaryPart)
        u11.MaxTorque = Vector3.new(0, 99900000, 0)
        u11.D = 50
        u11.P = 500
        u11.CFrame = u6.PrimaryPart.CFrame
        u12 = u6.PrimaryPart:FindFirstChild("BodyThrust") or Instance.new("BodyThrust", u6.PrimaryPart)
        u13 = u6.PrimaryPart:FindFirstChild("BodyVelocity") or Instance.new("BodyVelocity", u6.PrimaryPart)
        u13.Velocity = Vector3.new(0, 0, 0)
        u13.MaxForce = Vector3.new(0, 0, 0)
        local v187 = u6.Main.BodyForce
        local v188 = u10 * 0.65
        v187.Force = Vector3.new(0, v188, 0)
        u14 = Instance.new("Part", game.Workspace)
        u14.Transparency = 1
        u14.Size = Vector3.new(0, 0, 0)
        u14.CanCollide = false
        u14.Anchored = true
        u14.CFrame = u1.Character.Head.CFrame
        u19 = u6.WheelModels:GetChildren()
        local v189 = u19[1].WheelModel.Size.X
        local v190 = u19[1].WheelModel.Size.Y
        local v191 = u19[1].WheelModel.Size.Z
        u20 = math.max(v189, v190, v191)
        for _, v192 in pairs(u19) do
            v192.WheelModel.CanCollide = false
        end
        u69 = u10 * 2
        u70 = u69 / 100
        local v193, v194, v195 = u6.Main.CFrame:toEulerAnglesXYZ()
        _ = v193
        u27 = v194
        _ = v195
        u3.Enabled = true
        game:GetService("RunService"):BindToRenderStep("bike", Enum.RenderPriority.Character.Value, u182)
        u15 = u6:WaitForChild("VehicleSeat"):GetPropertyChangedSignal("Throttle"):connect(u148)
        u16 = u6.VehicleSeat.ChildRemoved:connect(function(p196) --[[Anonymous function at line 370]]
            --[[
            Upvalues:
                [1] = u9
            --]]
            if p196.Name == "SeatWeld" then
                u9.Initiate(false)
            end
        end)
        u17 = u2.InputBegan:connect(InputFunction)
        u18 = u2.InputEnded:connect(InputFunctionEnd)
        u8 = u28[u6.MeshPart.MeshId][1]
        u7 = 2.75 + (u28[u6.MeshPart.MeshId][2] or 0)
        game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        _G.ToggleHotbar(false)
        toggleTurbo(false)
    else
        game:GetService("RunService"):UnbindFromRenderStep("bike")
        u3.Enabled = false
        u11:Destroy()
        u12:Destroy()
        u13:Destroy()
        u6.Main.boost:Stop()
        u6.Main.tokyodrift:Stop()
        for _, v197 in pairs(u19) do
            v197.WheelModel.CanCollide = true
            v197.ManualWeld.C1 = CFrame.new()
            if v197:FindFirstChild("ParticleEmitter") then
                v197.ParticleEmitter.Enabled = false
            end
        end
        u15:disconnect()
        u15 = nil
        u16:disconnect()
        u16 = nil
        u17:Disconnect()
        u18:Disconnect()
        u17 = nil
        u18 = nil
        u5.CameraSubject = u1.Character.Humanoid
        u6.Main.BodyForce.Force = Vector3.new(0, 0, 0)
        u10 = 0
        u6.Thrusters[1].BodyThrust:Destroy()
        u6.Thrusters[2].BodyThrust:Destroy()
        u6.Thrusters[3].BodyThrust:Destroy()
        u6.Thrusters[4].BodyThrust:Destroy()
        _G.ToggleHotbar(true)
        u6 = nil
    end
end
local u198 = {
    0,
    0,
    0,
    0
}
local function v206() --[[Anonymous function at line 413]]
    --[[
    Upvalues:
        [1] = u198
        [2] = u11
        [3] = u6
        [4] = u26
    --]]
    if tick() - u198[4] >= 1 then
        u198[4] = tick()
        if u11 ~= nil and (u6.PrimaryPart.CFrame.upVector.Y < 0.25 and u6.PrimaryPart.Velocity.Magnitude < 10) then
            local v199 = u6.PrimaryPart.CFrame * CFrame.new(0, 0, -50)
            local v200 = u11
            local v201 = CFrame.new
            local v202 = u6.PrimaryPart.CFrame.p
            local v203 = v199.x
            local v204 = u6.PrimaryPart.CFrame.y
            local v205 = v199.z
            v200.CFrame = v201(v202, (Vector3.new(v203, v204, v205)))
            u11.MaxTorque = Vector3.new(4000000, 4000000, 4000000)
            u11.D = 30
            u26 = true
            delay(1, function() --[[Anonymous function at line 423]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u26
                --]]
                u11.MaxTorque = Vector3.new(0, 99900000, 0)
                u11.D = 50
                u26 = false
            end)
        end
    end
end
u3.Frame["1"].MouseButton1Click:Connect(function() --[[Function name: toggleLights, line 432]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4:FireServer(1)
end)
u3.Frame["2"].MouseButton1Click:Connect(function() --[[Function name: ToggleHonk, line 444]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    u4:FireServer(3, u6.SeatLocks.Value)
end)
u3.Frame["3"].MouseButton1Click:Connect(function() --[[Function name: Eject, line 447]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4:FireServer(4)
end)
u3.Frame["4"].MouseButton1Click:Connect(v206)
u3.Frame["5"].MouseButton1Click:Connect(function() --[[Function name: toggleLocks, line 435]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u4
    --]]
    u6.SeatLocks.Value = not u6.SeatLocks.Value
    if u6.SeatLocks.Value then
        u3.Frame["5"].icon.ImageColor3 = Color3.fromRGB(255, 179, 179)
    else
        u3.Frame["5"].icon.ImageColor3 = Color3.new(1, 1, 1)
    end
    u4:FireServer(2, u6.SeatLocks.Value)
end)
local u207 = u10
local u208 = u23
for u209 = 1, 5 do
    u3.Frame[u209].MouseEnter:Connect(function() --[[Anonymous function at line 456]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u209
        --]]
        u3.Frame[u209].ImageColor3 = Color3.fromRGB(162, 154, 140)
        u3.Frame[u209].Title.Visible = true
    end)
    u3.Frame[u209].MouseLeave:Connect(function() --[[Anonymous function at line 460]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u209
        --]]
        u3.Frame[u209].ImageColor3 = Color3.fromRGB(127, 121, 110)
        u3.Frame[u209].Title.Visible = false
    end)
end
function toggleTurbo(p210)
    --[[
    Upvalues:
        [1] = u24
        [2] = u208
        [3] = u6
        [4] = u207
    --]]
    if p210 and u24 ~= 400 then
        return
    else
        local v211 = u208
        u208 = p210
        u6.PrimaryPart.Turbo1.ParticleEmitter.Enabled = p210
        u6.PrimaryPart.Turbo2.ParticleEmitter.Enabled = p210
        if p210 then
            u6.Main.turbo:Play()
            local v212 = u6.Main.BodyForce
            local v213 = u207 * 0.9
            v212.Force = Vector3.new(0, v213, 0)
            u6.PrimaryPart.Velocity = u6.PrimaryPart.Velocity + u6.PrimaryPart.CFrame.lookVector * 35
        else
            if v211 and u24 > 200 then
                u24 = 200
            end
            local v214 = u6.Main.BodyForce
            local v215 = u207 * 0.65
            v214.Force = Vector3.new(0, v215, 0)
        end
    end
end
function update_turboUI()
    --[[
    Upvalues:
        [1] = u208
        [2] = u24
        [3] = u25
    --]]
    if u208 then
        local v216 = u24 - 3
        u24 = math.clamp(v216, 0, 400)
    else
        local v217 = u24 + 1
        u24 = math.clamp(v217, 0, 400)
    end
    u25.Frame.Frame.Size = UDim2.new(u24 / 400, 0, 1, 0)
    if u24 == 0 then
        toggleTurbo(false)
    end
end
function InputFunction(p218)
    --[[
    Upvalues:
        [1] = u2
    --]]
    if u2:GetFocusedTextBox() == nil and p218.KeyCode == Enum.KeyCode.LeftShift then
        toggleTurbo(true)
    end
end
function InputFunctionEnd(p219)
    if p219.KeyCode == Enum.KeyCode.LeftShift then
        toggleTurbo(false)
    end
end
local u220 = tick()
game.Workspace.Vehicles.ChildRemoved:Connect(function(p221) --[[Anonymous function at line 508]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    u22[p221] = nil
end)
game.Workspace.Vehicles.ChildAdded:Connect(function(p222) --[[Anonymous function at line 511]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    if p222:FindFirstChild("WheelModels") then
        u22[p222] = 0
    end
end)
function u9.updateOtherCarWheels() --[[Anonymous function at line 516]]
    --[[
    Upvalues:
        [1] = u220
        [2] = u22
        [3] = u1
        [4] = u107
    --]]
    if tick() - u220 > 0.05 then
        u220 = tick()
        for v223, _ in pairs(u22) do
            if v223:FindFirstChild("VehicleSeat") and (v223.VehicleSeat.Occupant ~= nil and (v223.VehicleSeat.Occupant ~= u1 and u1:DistanceFromCharacter(v223.PrimaryPart.Position) < 100)) then
                local v224 = v223.PrimaryPart.boost
                local v225 = v223.PrimaryPart.boost.Pitch
                v224.PlaybackSpeed = v225 + (GetPitch(v223.PrimaryPart.Velocity.Magnitude, 60) + v223.VehicleSeat.Throttle * 0.2 - v225) * 0.1
                u107(v223.PrimaryPart.Velocity.Magnitude, v223)
            end
        end
    end
end
return u9

-- // Function Dumper made by King.Kevin
-- // Script Path: VC2

--[[
Function Dump: Initiate

Function Upvalues: Initiate
		1 [Instance] = Sedan
		2 [number] = 131614.47145999072
		3 [Instance] = brainrotted_rigga123
		4 [Instance] = BodyGyro
		5 [Instance] = BodyThrust
		6 [Instance] = BodyVelocity
		7 [Instance] = Part
		8 [table]:
		8 [table] table: 0x8e2f9988dad6e7ef
				1 [Instance] = Wheel
				2 [Instance] = WheelF
				3 [Instance] = WheelF
				4 [Instance] = Wheel
		9 [number] = 3.693519115447998
		10 [number] = 263228.94291998143
		11 [number] = 2632.2894291998145
		12 [number] = 0.22828005254268646
		13 [Instance] = Vehicle
		14 [function] = Update
		15 [RBXScriptConnection] = Connection
		16 [function] = SeatChanged
		17 [RBXScriptConnection] = Connection
		18 [table]:
		18 [table] table: 0xfb6e656256fc209f
				1 [function] = Initiate
				2 [function] = updateOtherCarWheels
		19 [RBXScriptConnection] = Connection
		20 [Instance] = UserInputService
		21 [RBXScriptConnection] = Connection
		22 [number] = 0.01
		23 [table]:
		23 [table] table: 0xee8f288622288cff
				1 [table]:
				rbxassetid://3482305681 [table] table: 0xb24f7af380f9a6af
						1 [number] = 0.006
				2 [table]:
				rbxassetid://3646494889 [table] table: 0x96089f749479f8df
						1 [number] = 0.002
						2 [number] = 0.6
				3 [table]:
				rbxassetid://6934063987 [table] table: 0xad95b62dd09aec7f
						1 [number] = 0.004
						2 [number] = 0.4
				4 [table]:
				rbxassetid://6595418285 [table] table: 0x75136fdaf73fc01f
						1 [number] = 0.004
						2 [number] = 0.6
				5 [table]:
				rbxassetid://3651987136 [table] table: 0x83cc2288bd19478f
						1 [number] = 0.01
						2 [number] = 0.5
				6 [table]:
				rbxassetid://3656796538 [table] table: 0x870dcced254bdf9f
						1 [number] = 0.003
				7 [table]:
				rbxassetid://3940831369 [table] table: 0x988b773bb9e8efbf
						1 [number] = 0.01
						2 [number] = 1.6
				8 [table]:
				rbxassetid://3365207099 [table] table: 0xe5b6644b5ecb76cf
						1 [number] = 0.004
						2 [number] = 0.4
				9 [table]:
				rbxassetid://6524798166 [table] table: 0xac72dbb66f69562f
						1 [number] = 0.004
						2 [number] = 0.6
				10 [table]:
				rbxassetid://3993504282 [table] table: 0xb2c9032009a7666f
						1 [number] = 0.01
						2 [number] = 0.25
		24 [number] = 3
		25 [Instance] = Camera

Function Constants: Initiate
		1 [string] = pairs
		2 [userdata] = userdata: 0x8de376714b257e5f
		3 [string] = GetDescendants
		4 [string] = BasePart
		5 [string] = IsA
		6 [number] = 196.2
		7 [string] = GetMass
		8 [string] = Character
		9 [string] = Main
		10 [string] = boost
		11 [string] = Play
		12 [string] = tokyodrift
		13 [string] = PrimaryPart
		14 [string] = BodyGyro
		15 [string] = FindFirstChild
		16 [string] = Instance
		17 [string] = new
		18 [userdata] = userdata: 0x25e3f032b455a12f
		19 [Vector3] = 0, 99900000, 0
		20 [string] = MaxTorque
		21 [string] = D
		22 [string] = P
		23 [string] = CFrame
		24 [string] = BodyThrust
		25 [string] = BodyVelocity
		26 [Vector3] = 0, 0, 0
		27 [string] = Velocity
		28 [string] = MaxForce
		29 [string] = BodyForce
		30 [number] = 0.65
		31 [string] = Vector3
		32 [userdata] = userdata: 0x35a26aeeb490d3bf
		33 [string] = Force
		34 [string] = Part
		35 [string] = game
		36 [Instance] = Ugc
		37 [string] = Workspace
		38 [string] = Transparency
		39 [string] = Size
		40 [string] = CanCollide
		41 [string] = Anchored
		42 [string] = Head
		43 [string] = WheelModels
		44 [string] = GetChildren
		45 [string] = WheelModel
		46 [string] = X
		47 [string] = Y
		48 [string] = Z
		49 [string] = math
		50 [string] = max
		51 [userdata] = userdata: 0x8da2dc1bb3cb004f
		52 [number] = 2
		53 [number] = 100
		54 [string] = toEulerAnglesXYZ
		55 [string] = _
		56 [string] = Enabled
		57 [string] = RunService
		58 [string] = GetService
		59 [string] = bike
		60 [string] = Enum
		61 [string] = RenderPriority
		62 [EnumItem] = Enum.RenderPriority.Character
		63 [string] = Value
		64 [string] = BindToRenderStep
		65 [string] = VehicleSeat
		66 [string] = WaitForChild
		67 [string] = Throttle
		68 [string] = GetPropertyChangedSignal
		69 [string] = connect
		70 [string] = ChildRemoved
		71 [userdata] = userdata: 0x1d64a2263e06b71f
		72 [string] = InputBegan
		73 [string] = InputFunction
		74 [string] = InputEnded
		75 [string] = InputFunctionEnd
		76 [string] = MeshPart
		77 [string] = MeshId
		78 [number] = 2.75
		79 [number] = 0
		80 [string] = Players
		81 [string] = LocalPlayer
		82 [string] = Humanoid
		83 [string] = UnequipTools
		84 [string] = ToggleHotbar
		85 [string] = _G
		87 [string] = toggleTurbo
		88 [string] = UnbindFromRenderStep
		89 [string] = Destroy
		90 [string] = Stop
		91 [string] = ManualWeld
		92 [userdata] = userdata: 0xc56438c23140626f
		93 [string] = C1
		94 [string] = ParticleEmitter
		95 [string] = disconnect
		96 [string] = Disconnect
		97 [string] = CameraSubject
		98 [string] = Thrusters

====================================================================================================

Function Dump: updateOtherCarWheels

Function Upvalues: updateOtherCarWheels
		1 [number] = 1754691453.8287947
		2 [table]:
		2 [table] table: 0xed4da93edc58b94f
		3 [Instance] = brainrotted_rigga123
		4 [function] = updateWheelAnimationOther

Function Constants: updateOtherCarWheels
		1 [string] = tick
		2 [userdata] = userdata: 0xf2a5afbe33bd6dff
		3 [number] = 0.05
		4 [string] = pairs
		5 [userdata] = userdata: 0xfea51d8a30f63f0f
		6 [string] = VehicleSeat
		7 [string] = FindFirstChild
		8 [string] = Occupant
		9 [string] = PrimaryPart
		10 [string] = Position
		11 [string] = DistanceFromCharacter
		12 [string] = boost
		13 [string] = Pitch
		14 [string] = GetPitch
		15 [string] = Velocity
		16 [string] = Magnitude
		17 [number] = 0.2
		18 [string] = Throttle
		19 [number] = 0.1
		20 [string] = PlaybackSpeed

====================================================================================================

Function Dump: toggleTurbo

Function Upvalues: toggleTurbo
		1 [number] = 400
		2 [boolean] = false
		3 [Instance] = Sedan
		4 [number] = 131614.47145999072

Function Constants: toggleTurbo
		1 [number] = 400
		2 [string] = PrimaryPart
		3 [string] = Turbo1
		4 [string] = ParticleEmitter
		5 [string] = Enabled
		6 [string] = Turbo2
		7 [string] = Main
		8 [string] = turbo
		9 [string] = Play
		10 [string] = BodyForce
		11 [number] = 0.9
		12 [string] = Vector3
		13 [string] = new
		14 [userdata] = userdata: 0xc2e68a95b1338cdf
		15 [string] = Force
		16 [string] = Velocity
		17 [number] = 35
		18 [string] = CFrame
		19 [string] = lookVector
		20 [number] = 0.65

====================================================================================================

Function Dump: unflipVehicle

Function Upvalues: unflipVehicle
		1 [table]:
		1 [table] table: 0x46b1bbfa7f89520f
				1 [number] = 0
				2 [number] = 0
				3 [number] = 0
				4 [number] = 0
		2 [Instance] = BodyGyro
		3 [Instance] = Sedan
		4 [boolean] = false

Function Constants: unflipVehicle
		1 [string] = tick
		2 [userdata] = userdata: 0xe6e603d6b26ce5af
		3 [string] = PrimaryPart
		4 [string] = CFrame
		5 [string] = upVector
		6 [string] = Y
		7 [number] = 0.25
		8 [string] = Velocity
		9 [string] = Magnitude
		10 [string] = new
		11 [userdata] = userdata: 0x12a7854aaeaa373f
		12 [string] = p
		13 [string] = x
		14 [string] = y
		15 [string] = z
		16 [string] = Vector3
		17 [userdata] = userdata: 0xcea7153f4de08acf
		18 [Vector3] = 4000000, 4000000, 4000000
		19 [string] = MaxTorque
		20 [string] = D
		21 [string] = delay
		22 [userdata] = userdata: 0xa3689703d4df5a9f

====================================================================================================

Function Dump: GetThrustForce

Function Upvalues: GetThrustForce
		1 [Instance] = Sedan
		2 [number] = 131614.47145999072
		3 [number] = 0.01
		4 [boolean] = false

Function Constants: GetThrustForce
		1 [Vector3] = 0, 0, 0
		2 [string] = PrimaryPart
		3 [string] = Velocity
		4 [Vector3] = 0, 1, 0
		5 [string] = magnitude
		6 [string] = unit
		7 [Vector3] = 0.0010000000474974513, 0.0010000000474974513, -0.0010000000474974513
		8 [string] = CFrame
		9 [string] = rightVector
		10 [string] = Dot
		11 [string] = lookVector
		12 [string] = math
		13 [string] = sign
		14 [userdata] = userdata: 0x07682927171a2fef
		15 [number] = 2
		16 [number] = 0.07
		17 [number] = 40
		18 [string] = clamp
		19 [userdata] = userdata: 0x53a9a5451a50f87f
		20 [number] = -0.7
		21 [number] = 5
		22 [string] = VehicleSeat
		23 [string] = Throttle
		24 [number] = 0
		25 [number] = 0.011
		26 [string] = abs
		27 [userdata] = userdata: 0x5fa923e95a8dc88f
		28 [number] = 1.5
		29 [number] = 0.016666666666666666
		30 [number] = 0.5
		31 [number] = -0.65
		32 [string] = Vector3
		33 [string] = new
		34 [userdata] = userdata: 0x03ea58bddfca075f

====================================================================================================

Function Dump: updateWheelAnimationOther

Function Upvalues: updateWheelAnimationOther
		1 [Instance] = Sedan
		2 [table] (Recursive table detected)
		3 [number] = 3.693519115447998
		4 [function] = RaycastM

Function Constants: updateWheelAnimationOther
		1 [string] = PrimaryPart
		2 [string] = Velocity
		3 [string] = Magnitude
		4 [string] = WheelModels
		5 [string] = Wheel
		6 [string] = ManualWeld
		7 [string] = C1
		8 [string] = toEulerAnglesXYZ
		9 [string] = GetChildren
		10 [string] = WheelModel
		11 [string] = Size
		12 [string] = X
		13 [string] = Y
		14 [string] = Z
		15 [string] = math
		16 [string] = max
		17 [userdata] = userdata: 0x77eaee7098077a2f
		18 [string] = pairs
		19 [userdata] = userdata: 0x73ab7fd4997baabf
		20 [string] = Center
		21 [string] = Position
		22 [string] = CFrame
		23 [number] = 0.75
		24 [string] = Vector3
		25 [string] = new
		26 [userdata] = userdata: 0x0fabced847be1f4f
		27 [string] = vectorToWorldSpace
		28 [string] = Name
		29 [string] = WheelF
		30 [string] = abs
		31 [userdata] = userdata: 0x636c406feaf1cc1f
		32 [number] = 2
		33 [number] = 0.2
		34 [string] = clamp
		35 [userdata] = userdata: 0x576cca000d34b36f
		36 [userdata] = userdata: 0x32ad34e4ec6e66ff
		37 [string] = Angles
		38 [userdata] = userdata: 0xbeadb6484ca3560f
		39 [number] = 0.3333333333333333
		40 [number] = 0.002
		41 [number] = 3.141592653589793

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [Instance] = Vehicle
		2 [number] = 5

Function Constants: Unknown Name
		1 [string] = Frame
		2 [string] = Color3
		3 [string] = fromRGB
		4 [userdata] = userdata: 0xc2edd85de5e483df
		5 [string] = ImageColor3
		6 [string] = Title
		7 [string] = Visible

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [Instance] = Vehicle
		2 [number] = 5

Function Constants: Unknown Name
		1 [string] = Frame
		2 [string] = Color3
		3 [string] = fromRGB
		4 [userdata] = userdata: 0x16ee669086d9f0af
		5 [string] = ImageColor3
		6 [string] = Title
		7 [string] = Visible

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [Instance] = Vehicle
		2 [number] = 4

Function Constants: Unknown Name
		1 [string] = Frame
		2 [string] = Color3
		3 [string] = fromRGB
		4 [userdata] = userdata: 0x92aee5b4e310e03f
		5 [string] = ImageColor3
		6 [string] = Title
		7 [string] = Visible

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [Instance] = Vehicle
		2 [number] = 4

Function Constants: Unknown Name
		1 [string] = Frame
		2 [string] = Color3
		3 [string] = fromRGB
		4 [userdata] = userdata: 0xceaf7b774057b3cf
		5 [string] = ImageColor3
		6 [string] = Title
		7 [string] = Visible

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [Instance] = Vehicle
		2 [number] = 3

Function Constants: Unknown Name
		1 [string] = Frame
		2 [string] = Color3
		3 [string] = fromRGB
		4 [userdata] = userdata: 0xe55010cbe08a419f
		5 [string] = ImageColor3
		6 [string] = Title
		7 [string] = Visible

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [Instance] = Vehicle
		2 [number] = 3

Function Constants: Unknown Name
		1 [string] = Frame
		2 [string] = Color3
		3 [string] = fromRGB
		4 [userdata] = userdata: 0xf50f9d1f03c116ef
		5 [string] = ImageColor3
		6 [string] = Title
		7 [string] = Visible

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [Instance] = Vehicle
		2 [number] = 2

Function Constants: Unknown Name
		1 [string] = Frame
		2 [string] = Color3
		3 [string] = fromRGB
		4 [userdata] = userdata: 0xcd4f0f02e605a37f
		5 [string] = ImageColor3
		6 [string] = Title
		7 [string] = Visible

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [Instance] = Vehicle
		2 [number] = 2

Function Constants: Unknown Name
		1 [string] = Frame
		2 [string] = Color3
		3 [string] = fromRGB
		4 [userdata] = userdata: 0xdd8ebf39457afd8f
		5 [string] = ImageColor3
		6 [string] = Title
		7 [string] = Visible

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [Instance] = Vehicle
		2 [number] = 1

Function Constants: Unknown Name
		1 [string] = Frame
		2 [string] = Color3
		3 [string] = fromRGB
		4 [userdata] = userdata: 0x85ce09f5e3bf0c5f
		5 [string] = ImageColor3
		6 [string] = Title
		7 [string] = Visible

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [Instance] = Vehicle
		2 [number] = 1

Function Constants: Unknown Name
		1 [string] = Frame
		2 [string] = Color3
		3 [string] = fromRGB
		4 [userdata] = userdata: 0x340d93518cf45b2f
		5 [string] = ImageColor3
		6 [string] = Title
		7 [string] = Visible

====================================================================================================

Function Dump: ToggleHonk

Function Upvalues: ToggleHonk
		1 [Instance] = CarEvent
		2 [Instance] = Sedan

Function Constants: ToggleHonk
		1 [string] = SeatLocks
		2 [string] = Value
		3 [string] = FireServer

====================================================================================================

Function Dump: SeatChanged

Function Upvalues: SeatChanged
		1 [Instance] = Sedan
		2 [boolean] = false

Function Constants: SeatChanged
		1 [string] = VehicleSeat
		2 [string] = Throttle
		3 [number] = 1
		4 [string] = Main
		5 [string] = boost
		6 [number] = 29.6
		7 [string] = TimePosition

====================================================================================================

Function Dump: RaycastM

Function Upvalues: RaycastM
		1 [Instance] = Sedan
		2 [Instance] = brainrotted_rigga123

Function Constants: RaycastM
		1 [string] = magnitude
		2 [string] = unit
		3 [string] = Character
		4 [string] = Ray
		5 [string] = new
		6 [userdata] = userdata: 0x3dcd129eed2665bf
		7 [string] = game
		8 [Instance] = Ugc
		9 [string] = Workspace
		10 [string] = FindPartOnRayWithIgnoreList
		11 [string] = CanCollide
		12 [string] = Anchored
		13 [string] = Transparency
		14 [string] = table
		15 [string] = insert
		16 [userdata] = userdata: 0x8d8cf98a4a61364f
		17 [number] = 0.1

====================================================================================================

Function Dump: Raycast

Function Upvalues: Raycast
		1 [Instance] = Sedan
		2 [Instance] = brainrotted_rigga123

Function Constants: Raycast
		1 [string] = magnitude
		2 [string] = unit
		3 [string] = Character
		4 [string] = Ray
		5 [string] = new
		6 [userdata] = userdata: 0x254c66a7e6acd91f
		7 [string] = game
		8 [Instance] = Ugc
		9 [string] = Workspace
		10 [string] = FindPartOnRayWithIgnoreList
		11 [string] = CanCollide
		12 [string] = Anchored
		13 [string] = Transparency
		14 [string] = table
		15 [string] = insert
		16 [userdata] = userdata: 0x550be4421997886f
		17 [number] = 0.1

====================================================================================================

Function Dump: UpdateThruster

Function Upvalues: UpdateThruster
		1 [function] = Raycast
		2 [number] = 3
		3 [Instance] = Sedan
		4 [number] = 263228.94291998143
		5 [number] = 131614.47145999072
		6 [number] = 2632.2894291998145

Function Constants: UpdateThruster
		1 [string] = BodyThrust
		2 [string] = FindFirstChild
		3 [string] = Instance
		4 [string] = new
		5 [userdata] = userdata: 0x8d4b562ed8d33fff
		6 [string] = Position
		7 [string] = CFrame
		8 [Vector3] = 0, -1, 0
		9 [string] = vectorToWorldSpace
		10 [string] = magnitude
		11 [number] = 1
		12 [number] = 0.016666666666666666
		13 [string] = CanCollide
		14 [string] = Name
		15 [string] = 1
		16 [string] = VehicleSeat
		17 [string] = Steer
		18 [number] = 20
		19 [string] = PrimaryPart
		20 [string] = Velocity
		21 [string] = Magnitude
		22 [number] = 0.7
		23 [string] = math
		24 [string] = clamp
		25 [userdata] = userdata: 0x628ab01a5f1c690f
		26 [string] = 4
		27 [number] = 2
		28 [number] = 1.5
		29 [string] = Vector3
		30 [userdata] = userdata: 0x46ca3a699a599adf
		31 [string] = force
		32 [userdata] = userdata: 0x92094c359a82c7af
		33 [string] = toObjectSpace
		34 [string] = p
		35 [string] = Y
		36 [Vector3] = 0, 0, 0

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [table] (Recursive table detected)

Function Constants: Unknown Name
		1 [string] = WheelModels
		2 [string] = FindFirstChild

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [table] (Recursive table detected)

Function Constants: Unknown Name

====================================================================================================

Function Dump: InputFunction

Function Upvalues: InputFunction
		1 [Instance] = UserInputService

Function Constants: InputFunction
		1 [string] = GetFocusedTextBox
		2 [string] = KeyCode
		3 [string] = Enum
		4 [string] = LeftShift
		5 [EnumItem] = Enum.KeyCode.LeftShift
		6 [string] = toggleTurbo

====================================================================================================

Function Dump: Eject

Function Upvalues: Eject
		1 [Instance] = CarEvent

Function Constants: Eject
		1 [string] = FireServer

====================================================================================================

Function Dump: toggleLights

Function Upvalues: toggleLights
		1 [Instance] = CarEvent

Function Constants: toggleLights
		1 [string] = FireServer

====================================================================================================

Function Dump: Unknown Name

Function Upvalues: Unknown Name
		1 [table] (Recursive table detected)

Function Constants: Unknown Name
		1 [string] = Name
		2 [string] = SeatWeld
		3 [string] = Initiate

====================================================================================================

Function Dump: InputFunctionEnd

Function Upvalues: InputFunctionEnd

Function Constants: InputFunctionEnd
		1 [string] = KeyCode
		2 [string] = Enum
		3 [string] = LeftShift
		4 [EnumItem] = Enum.KeyCode.LeftShift
		5 [string] = toggleTurbo

====================================================================================================

Function Dump: GetPitch

Function Upvalues: GetPitch

Function Constants: GetPitch
		1 [string] = math
		2 [string] = abs
		3 [userdata] = userdata: 0x1ec9def2d7cff53f
		4 [number] = 0.999
		5 [string] = min
		6 [userdata] = userdata: 0x42884faf540a9ccf
		7 [number] = 0.68
		8 [number] = 1
		9 [number] = 3
		10 [number] = 0.2
		11 [number] = 10
		12 [number] = 2

====================================================================================================

Function Dump: updateCarDrift

Function Upvalues: updateCarDrift

Function Constants: updateCarDrift
		1 [string] = PrimaryPart
		2 [string] = Velocity
		3 [string] = CFrame
		4 [string] = lookVector
		5 [string] = Dot
		6 [string] = Magnitude
		7 [string] = Main
		8 [string] = tokyodrift
		9 [number] = 1
		10 [number] = 2
		11 [string] = math
		12 [string] = pow
		13 [userdata] = userdata: 0xa748fd9b2d714c9f
		14 [number] = -0.05
		15 [number] = 1.05
		16 [number] = 30
		17 [string] = clamp
		18 [userdata] = userdata: 0x33076ce70fbc7def
		19 [number] = 0.25
		20 [string] = Volume
		21 [number] = 0.1
		22 [number] = 0

====================================================================================================

Function Dump: update_turboUI

Function Upvalues: update_turboUI
		1 [boolean] = false
		2 [number] = 400
		3 [Instance] = Boost

Function Constants: update_turboUI
		1 [number] = 3
		2 [string] = math
		3 [string] = clamp
		4 [userdata] = userdata: 0xcf47dbc332fb527f
		5 [number] = 1
		6 [string] = Frame
		7 [string] = UDim2
		8 [string] = new
		9 [userdata] = userdata: 0xa386217cb127a68f
		10 [number] = 400
		11 [string] = Size
		12 [number] = 0
		13 [string] = toggleTurbo

====================================================================================================

Function Dump: toggleLocks

Function Upvalues: toggleLocks
		1 [Instance] = Sedan
		2 [Instance] = Vehicle
		3 [Instance] = CarEvent

Function Constants: toggleLocks
		1 [string] = SeatLocks
		2 [string] = Value
		3 [string] = 5
		4 [string] = Frame
		5 [string] = icon
		6 [string] = Color3
		7 [string] = fromRGB
		8 [userdata] = userdata: 0x07c6a509b06cf15f
		9 [string] = ImageColor3
		10 [string] = new
		11 [userdata] = userdata: 0xf0053715b0a9c02f
		12 [string] = FireServer

====================================================================================================

Function Dump: Update

Function Upvalues: Update
		1 [function] = Raycast
		2 [Instance] = Sedan
		3 [number] = 3
		4 [boolean] = false
		5 [boolean] = false
		6 [Instance] = BodyGyro
		7 [number] = 131614.47145999072
		8 [function] = updateCarDrift
		9 [function] = UpdateThruster
		10 [Instance] = BodyThrust
		11 [function] = GetThrustForce
		12 [function] = updateWheelAnimation
		13 [Instance] = BodyVelocity

Function Constants: Update
		1 [string] = PrimaryPart
		2 [string] = CFrame
		3 [string] = p
		4 [Vector3] = 0, -1, 0
		5 [number] = 2.5
		6 [string] = vectorToWorldSpace
		7 [string] = Main
		8 [string] = Velocity
		9 [string] = magnitude
		10 [number] = 0.4
		11 [string] = Vector3
		12 [string] = new
		13 [userdata] = userdata: 0xffc59150b19690bf
		14 [string] = MaxTorque
		15 [userdata] = userdata: 0x0384194c3ed4614f
		16 [Vector3] = 0, 99900000, 0
		17 [string] = Angles
		18 [userdata] = userdata: 0xd74483f8331f321f
		19 [number] = 0.9
		20 [number] = -0.02
		21 [string] = VehicleSeat
		22 [string] = Steer
		23 [number] = 0.016666666666666666
		24 [number] = 15
		25 [string] = math
		26 [string] = clamp
		27 [userdata] = userdata: 0xd305028c3442856f
		28 [string] = lookVector
		29 [string] = Dot
		30 [string] = sign
		31 [userdata] = userdata: 0x0f4288603485d4ff
		32 [Vector3] = 0, 0, 0
		33 [string] = x
		34 [string] = y
		35 [string] = z
		36 [number] = 45
		37 [string] = P
		38 [string] = Thrusters
		39 [string] = Force
		40 [string] = X
		41 [string] = Z
		42 [string] = LookVector
		43 [string] = boost
		44 [string] = Pitch
		45 [string] = GetPitch
		46 [number] = 0.2
		47 [string] = Throttle
		48 [number] = 0.1
		49 [string] = PlaybackSpeed
		50 [number] = 1.8
		51 [number] = 0
		52 [number] = 20
		53 [string] = MaxForce
		54 [string] = Magnitude
		55 [Vector3] = inf, inf, inf
		56 [string] = update_turboUI

====================================================================================================

Function Dump: updateWheelAnimation

Function Upvalues: updateWheelAnimation
		1 [Instance] = Sedan
		2 [number] = 1.360684140669282e-27
		3 [table] (Recursive table detected)
		4 [function] = RaycastM
		5 [number] = 3.693519115447998

Function Constants: updateWheelAnimation
		1 [string] = PrimaryPart
		2 [string] = Velocity
		3 [string] = Magnitude
		4 [string] = VehicleSeat
		5 [string] = Steer
		6 [number] = 0.1
		7 [string] = WheelModels
		8 [string] = Wheel
		9 [string] = ManualWeld
		10 [string] = C1
		11 [string] = toEulerAnglesXYZ
		12 [string] = pairs
		13 [userdata] = userdata: 0xa2821fc4abc9240f
		14 [string] = Center
		15 [string] = Position
		16 [string] = CFrame
		17 [number] = 0.75
		18 [string] = Vector3
		19 [string] = new
		20 [userdata] = userdata: 0xb6c3ac298e326ddf
		21 [string] = vectorToWorldSpace
		22 [string] = Name
		23 [string] = WheelF
		24 [string] = ParticleEmitter
		25 [string] = Enum
		26 [string] = Material
		27 [string] = Sand
		28 [EnumItem] = Enum.Material.Sand
		29 [string] = Sandstone
		30 [EnumItem] = Enum.Material.Sandstone
		31 [string] = Limestone
		32 [EnumItem] = Enum.Material.Limestone
		33 [string] = Ground
		34 [EnumItem] = Enum.Material.Ground
		35 [string] = Enabled
		36 [string] = Y
		37 [string] = math
		38 [string] = abs
		39 [userdata] = userdata: 0x12033a7da9745eaf
		40 [number] = 2
		41 [number] = 0.2
		42 [string] = clamp
		43 [userdata] = userdata: 0x9ec0a0314bb90a3f
		44 [userdata] = userdata: 0x42805ad728e1f9cf
		45 [string] = Angles
		46 [userdata] = userdata: 0x7541d45b1924d79f
		47 [number] = -0.7853981633974483
		48 [number] = 0.002
		49 [number] = 3.141592653589793

====================================================================================================
]]
