-- reload

local args = {
	"Rifle Ammo", -- ammo
	1, -- amount
	game:GetService("Players").LocalPlayer.Character:WaitForChild("AK") -- gun
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("WeaponReloadEvent"):FireServer(unpack(args))

-- firing

local args = {
	33, -- god knows
	vector.create(-382.4649353027344, 209.3190155029297, -509.8333740234375), -- cast to where
	[5] = 26, -- damage
	[6] = game:GetService("Players").LocalPlayer.Character:WaitForChild("AK"), -- gun
	[8] = 1 -- bullet amount
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MenuActionEvent"):FireServer(unpack(args))
