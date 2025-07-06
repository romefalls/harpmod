require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("TS"):WaitForChild("MEL-GHO")).Initiate(script.Parent)


local args = {
	game:GetService("Players").LocalPlayer.Character:WaitForChild("hi bro"),
	2
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("GhostEvent"):FireServer(unpack(args))
