local args = {
	1,
	"Node",
	CFrame.new(-1000000000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuildingEvent"):FireServer(unpack(args))
