-- @ttwiz_z


--// Configuration

local ShowNotifications = true
local AimKey = Enum.KeyCode.V
local AimPart = "HumanoidRootPart"
local TeamCheck = false
local ESP = true
local TriggerDistance = 100

--// Services

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local Debris = game:GetService("Debris")
local RunService = game:GetService("RunService")

--// Constants

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local Camera = workspace.CurrentCamera

--// Fields

local Aiming = false
local Target = nil


--// Notification Handler

local function Notify(Message)
    if ShowNotifications then
        StarterGui:SetCore("SendNotification", {
            Title = "Aimbot",
            Text = Message,
            Icon = "rbxassetid://16377272133",
            Duration = 0.5
        })
    end
end


--// Binding Key

UserInputService.InputBegan:Connect(function(Input)
    if not UserInputService:GetFocusedTextBox() and Input.KeyCode == AimKey and not Aiming then
        Aiming = true
        Notify("[Aiming Mode]: ON")
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if not UserInputService:GetFocusedTextBox() and Input.KeyCode == AimKey and Aiming then
        Aiming = false
        Target = nil
        Notify("[Aiming Mode]: OFF")
    end
end)


--// Checking Target

local function IsReady(Target)
    if Target and Target:FindFirstChildWhichIsA("Humanoid") and Target:FindFirstChildWhichIsA("Humanoid").Health > 0 and not Target:FindFirstChildWhichIsA("ForceField") and Target:FindFirstChild(AimPart) then
        if TeamCheck and Players:GetPlayerFromCharacter(Target).TeamColor == Player.TeamColor then
            return false
        end
        return true, Target, Target:FindFirstChild(AimPart)
    else
        return false
    end
end


--// String Generation

local function GenerateString()
    return string.lower(string.reverse(string.sub(HttpService:GenerateGUID(false), 1, 8)))
end


--// ESP Creation

local function CreateESP(Character)
    if ESP and not Character:FindFirstChildWhichIsA("SelectionBox") then
        local Hitbox = Instance.new("SelectionBox", Character)
        task.spawn(function()
            while task.wait() do
                for Index = 1, 230 do
                    if not Character:FindFirstChildWhichIsA("SelectionBox") then
                        break
                    elseif Target ~= Character then
                        Debris:AddItem(Hitbox, 0)
                        break
                    end
                    Hitbox.Name = GenerateString()
                    Hitbox.Color3 = Color3.fromHSV(Index / 230, 1, 1)
                    task.wait()
                end
            end
        end)
        Hitbox.LineThickness = 0.05
        Hitbox.Adornee = Character
    end
end


--// Aimbot Loop

RunService.RenderStepped:Connect(function()
    pcall(function()
        if Aiming then
            for _, _Player in next, Players:GetPlayers() do
                local IsCharacterReady, Character, Part = IsReady(_Player.Character)
                if _Player ~= Player and IsCharacterReady then
                    local Vector, IsInViewport = Camera:WorldToViewportPoint(Part.Position)
                    if IsInViewport then
                        local Magnitude = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Vector.X, Vector.Y)).Magnitude
                        if Magnitude < TriggerDistance and not Target then
                            Target = Character
                            CreateESP(Target)
                            Notify(string.format("[Target]: @%s", _Player.Name))
                        end
                    end
                end
            end
            local IsTargetReady, self, Part = IsReady(Target)
            if IsTargetReady then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, Part.Position)
            else
                Target = nil
            end
        end
    end)
end)