if workspace:FindFirstChild("CubifySettings") then
    warn("CubifySettings folder already exists. Script will not run again.")
    return
end

local settingsFolder = Instance.new("Folder")
settingsFolder.Name = "CubifySettings"
settingsFolder.Parent = workspace

local function getOrCreateNumberValue(name, defaultValue)
    local val = settingsFolder:FindFirstChild(name)
    if not val then
        val = Instance.new("NumberValue")
        val.Name = name
        val.Value = defaultValue
        val.Parent = settingsFolder
    end
    return val
end

local function getOrCreateBoolValue(name, defaultValue)
    local val = settingsFolder:FindFirstChild(name)
    if not val then
        val = Instance.new("BoolValue")
        val.Name = name
        val.Value = defaultValue
        val.Parent = settingsFolder
    end
    return val
end

local cubeSizeVal = getOrCreateNumberValue("CubeSize", 30)
local outerCubeSizeVal = getOrCreateNumberValue("OuterCubeSize", cubeSizeVal.Value + 2)
local wallThicknessVal = getOrCreateNumberValue("WallThickness", 4)
local outerWallThicknessVal = getOrCreateNumberValue("OuterWallThickness", 3)
local outerOffsetVal = getOrCreateNumberValue("OuterOffset", (outerCubeSizeVal.Value - cubeSizeVal.Value) / 2)
local showESPVal = getOrCreateBoolValue("ShowESP", true) -- Unused now

local function updateDependentValues()
    outerCubeSizeVal.Value = cubeSizeVal.Value + 2
    outerOffsetVal.Value = (outerCubeSizeVal.Value - cubeSizeVal.Value) / 2
end

cubeSizeVal.Changed:Connect(updateDependentValues)

local Settings = {
    NodeOwner = game.Players.LocalPlayer.Name,
}

local Nodes = workspace.Buildings
local BuildingEvent = game.ReplicatedStorage.Events.BuildingEvent

local UsernamePartsFolder = workspace:WaitForChild("UsernameParts")

-- Wall usage tracking
local wallUsage = {} -- [Wall] = playerName
local playerWalls = {} -- [playerName] = {wall1, wall2, ...}

-- Utility: Get wall positions for a cube
local function getWallPositions(center, size, thickness, offset)
    return {
        {center + Vector3.new(0, 0, (size / 2) + offset), CFrame.new(center + Vector3.new(0, 0, (size / 2) + offset)), Vector3.new(size, size, thickness)},
        {center + Vector3.new(0, 0, -(size / 2) - offset), CFrame.new(center + Vector3.new(0, 0, -(size / 2) - offset)), Vector3.new(size, size, thickness)},
        {center + Vector3.new((size / 2) + offset, 0, 0), CFrame.new(center + Vector3.new((size / 2) + offset, 0, 0)) * CFrame.Angles(0, math.rad(90), 0), Vector3.new(size, size, thickness)},
        {center + Vector3.new(-(size / 2) - offset, 0, 0), CFrame.new(center + Vector3.new(-(size / 2) - offset, 0, 0)) * CFrame.Angles(0, math.rad(-90), 0), Vector3.new(size, size, thickness)},
        {center + Vector3.new(0, (size / 2) + offset, 0), CFrame.new(center + Vector3.new(0, (size / 2) + offset, 0)) * CFrame.Angles(math.rad(90), 0, 0), Vector3.new(size, size, thickness)},
        {center + Vector3.new(0, -(size / 2) - offset, 0), CFrame.new(center + Vector3.new(0, -(size / 2) - offset, 0)) * CFrame.Angles(math.rad(-90), 0, 0), Vector3.new(size, size, thickness)}
    }
end

local function getAvailableWalls(playerWallsFolder)
    local available = {}
    for _, Prop in ipairs(playerWallsFolder:GetChildren()) do
        if Prop.Name == "Resizable Wall" and Prop.PrimaryPart and not wallUsage[Prop] then
            table.insert(available, Prop)
        end
    end
    return available
end

local function setupWallFolderCleanup(wallsFolder)
    wallsFolder.ChildRemoved:Connect(function(child)
        if wallUsage[child] then
            local playerName = wallUsage[child]
            wallUsage[child] = nil
            if playerWalls[playerName] then
                for i, wall in ipairs(playerWalls[playerName]) do
                    if wall == child then
                        table.remove(playerWalls[playerName], i)
                        break
                    end
                end
                if #playerWalls[playerName] == 0 then
                    playerWalls[playerName] = nil
                end
            end
        end
    end)
end

local function releasePlayerWalls(playerName)
    if playerWalls[playerName] then
        for _, wall in ipairs(playerWalls[playerName]) do
            wallUsage[wall] = nil
        end
        playerWalls[playerName] = nil
    end
end

-- Utility: Check if any player is inside the cube
local function anyPlayerInsideCube(center, size)
    local half = size / 2
    for _, player in ipairs(game.Players:GetPlayers()) do
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos = hrp.Position
            if math.abs(pos.X - center.X) <= half and
               math.abs(pos.Y - center.Y) <= half and
               math.abs(pos.Z - center.Z) <= half then
                return true
            end
        end
    end
    return false
end

-- Utility: Return walls to localplayer's node
local function returnWallsToNode(walls)
    local localPlayerName = game.Players.LocalPlayer.Name
    local folder = workspace:FindFirstChild("Buildings")
    if not folder then return end
    local userFolder = folder:FindFirstChild(localPlayerName)
    if not userFolder then return end
    local nodeModel = userFolder:FindFirstChild("Node")
    if not nodeModel then return end
    local nodePart = nodeModel:FindFirstChild("Node")
    if not nodePart then return end
    local cframe = nodePart.CFrame
    for _, wall in ipairs(walls) do
        BuildingEvent:FireServer(7, wall, cframe, nil, Vector3.new(1,1,1))
    end
end

-- Notification function (executor/client-side)
local function notifyCubified(playerName)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Cubified!",
            Text = playerName .. " has been cubified!",
            Duration = 3
        })
    end)
end

-- Main cubify function (ESP removed, add idle return logic)
local function cubifyPlayer(Client)
    if not Client or not Client.Character or not Client.Character:FindFirstChild("HumanoidRootPart") then return end

    local center = Client.Character.HumanoidRootPart.Position

    local cubeSize = cubeSizeVal.Value
    local outerCubeSize = outerCubeSizeVal.Value
    local wallThickness = wallThicknessVal.Value
    local outerWallThickness = outerWallThicknessVal.Value
    local outerOffset = outerOffsetVal.Value

    local cubeWalls = getWallPositions(center, cubeSize, wallThickness, 0)
    local outerWalls = getWallPositions(center, outerCubeSize, outerWallThickness, outerOffset)

    local playerWallsFolder = Nodes:FindFirstChild(Settings.NodeOwner)
    if not playerWallsFolder then
        warn("NodeOwner folder not found")
        return
    end

    setupWallFolderCleanup(playerWallsFolder)

    -- If player already has walls, reuse them
    local allocatedWalls = playerWalls[Client.Name]
    if not allocatedWalls or #allocatedWalls < 12 then
        -- Release any partial assignment
        releasePlayerWalls(Client.Name)
        -- Assign new walls
        local availableWalls = getAvailableWalls(playerWallsFolder)
        if #availableWalls < 12 then
            warn("Not enough walls available to cubify player:", Client.Name)
            return
        end
        allocatedWalls = {}
        for i = 1, 12 do
            local wall = availableWalls[i]
            wallUsage[wall] = Client.Name
            table.insert(allocatedWalls, wall)
        end
        playerWalls[Client.Name] = allocatedWalls
    end

    local wallCframes = {}
    for i = 1, 12 do
        local Prop = allocatedWalls[i]
        local isOuterLayer = i > 6
        local wallSet = isOuterLayer and outerWalls or cubeWalls
        local index = ((i - 1) % 6) + 1
        local position, cframe, size = wallSet[index][1], wallSet[index][2], wallSet[index][3]

        BuildingEvent:FireServer(5, Prop, cframe, BrickColor.new(1032), "Granite")
        table.insert(wallCframes, {Prop, cframe, size})
    end

    for _, data in ipairs(wallCframes) do
        local Prop, cframe, size = data[1], data[2], data[3]
        BuildingEvent:FireServer(7, Prop, cframe, nil, size)
    end

    -- Show notification (client-side/executor)
    notifyCubified(Client.Name)

    -- Start idle timer: if no one is inside for 5 seconds, return walls
    task.spawn(function()
        local idleTime = 0
        while true do
            if anyPlayerInsideCube(center, cubeSize) then
                idleTime = 0
            else
                idleTime = idleTime + 0.5
                if idleTime >= 5 then
                    returnWallsToNode(allocatedWalls)
                    releasePlayerWalls(Client.Name)
                    break
                end
            end
            task.wait(0.5)
        end
    end)
end

local function cubifyPlayerIfPartExists(player)
    if not player.Character then return end

    if UsernamePartsFolder:FindFirstChild(player.Name) then
        cubifyPlayer(player)
    else
        print("No UsernamePart found for player:", player.Name)
    end
end

local function cubifyAllDynamic()
    for _, player in ipairs(game.Players:GetPlayers()) do
        cubifyPlayerIfPartExists(player)
    end
end

game.Players.PlayerRemoving:Connect(function(player)
    releasePlayerWalls(player.Name)
end)

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        local root = player.Character:WaitForChild("HumanoidRootPart", 5)
        if root then
            cubifyPlayerIfPartExists(player)
        else
            warn("HumanoidRootPart missing for player:", player.Name)
        end
    end)
    player.CharacterRemoving:Connect(function()
        releasePlayerWalls(player.Name)
    end)
end)

for _, player in ipairs(game.Players:GetPlayers()) do
    player.CharacterAdded:Connect(function()
        local root = player.Character:WaitForChild("HumanoidRootPart", 5)
        if root then
            cubifyPlayerIfPartExists(player)
        else
            warn("HumanoidRootPart missing for player:", player.Name)
        end
    end)
    player.CharacterRemoving:Connect(function()
        releasePlayerWalls(player.Name)
    end)
end

-- ESP toggle: No longer needed, but kept for compatibility
showESPVal.Changed:Connect(function()
    -- No action needed
end)