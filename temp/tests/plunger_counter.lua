
game:GetService("RunService").RenderStepped:Connect(function()
local args = {
	34,
	workspace.BlockSkat3r201070:WaitForChild("Humanoid"),
	workspace.BlockSkat3r201070:WaitForChild("HumanoidRootPart").CFrame
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MenuActionEvent"):FireServer(unpack(args))
end)