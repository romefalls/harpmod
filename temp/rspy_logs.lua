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

local args = {
	33, -- opcode
	CFrame.new(-340.13323974609375, 150.921875, -135.8498077392578, -0, 1, -0, -0, 0, -1, -1, 0, -0), --where
	1, -- unknown
	[5] = 18, -- damage
	[6] = game:GetService("Players").LocalPlayer.Character:WaitForChild("[Soldier] M1911"), -- gun
	[8] = 1 -- bullet amount
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MenuActionEvent"):FireServer(unpack(args))

local args = {
	33, -- primary opcode
	CFrame.new(1,2,3), -- yes
	1, -- secondary opcode (i didnt hit shit)
	[5] = 18,
	[6] = game:GetService("Players").LocalPlayer.Character:WaitForChild("[Soldier] M1911"),
	[8] = 1
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MenuActionEvent"):FireServer(unpack(args))


-- on hit:

local args = {
	33, -- primary opcode
	CFrame.new(1,2,3), -- yes
	2, -- secondary opcode (i did infact hit shit)
	game:GetService("Players"):WaitForChild("player").Character:WaitForChild("Humanoid"), -- and this is the humanoid of the person i hit
	26,
	game:GetService("Players").LocalPlayer:WaitForChild("Backpack"):WaitForChild("AK"),
	[8] = 1
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MenuActionEvent"):FireServer(unpack(args))

local args = {
	33,
	CFrame.new(132.78843688964844, 154.60098266601562, -1558.9354248046875, -0.22731374204158783, 0.06480250507593155, -0.9716630578041077, 9.313225746154785e-10, 0.9977835416793823, 0.0665445327758789, 0.9738216400146484, 0.015126485377550125, -0.22680988907814026),
	2,
	game:GetService("Players"):WaitForChild("player").Character:WaitForChild("Humanoid"),
	26,
	game:GetService("Players").LocalPlayer.Character:WaitForChild("AK"),
	[8] = 1
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MenuActionEvent"):FireServer(unpack(args))


--cola drink

local args = {
	4,
	Instance.new("Tool", nil)
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ToolsEvent"):FireServer(unpack(args))

-- mythic cola

local args = {
	4,
	game:GetService("Players").LocalPlayer:WaitForChild("Backpack"):WaitForChild("Mythic Bloxy Cola")
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ToolsEvent"):FireServer(unpack(args))

-- buy printer

local args = {
	2,
	"Money Printer Advanced",
	[4] = 8
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MenuEvent"):FireServer(unpack(args))
