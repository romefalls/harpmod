local args = {
	4,
	1,
	CFrame.new(-100000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuildingEvent"):FireServer(unpack(args))
