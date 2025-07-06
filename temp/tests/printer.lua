
local args = {
	2,
	"Money Printer Advanced",
	[4] = 8
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MenuEvent"):FireServer(unpack(args))
