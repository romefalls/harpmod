-- didnt work

game:GetService("RunService").RenderStepped:Connect(function()
	task.spawn(function()
        local hum = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        if not hum then return end
        local medigun = game.Players.LocalPlayer.Character:WaitForChild("[Doctor] MediGun")
        if not medigun then return end
		local args = {
			5,
			hum,
		}
		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ToolsEvent"):FireServer(unpack(args))
	end)
end)
