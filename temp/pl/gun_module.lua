--Decompiled by Medal, I take no credit I only Made The dumper and I I.. I iron man
--[[
game:GetService("Players").LocalPlayer.Backpack.M9.GunStates


return {
	["Damage"] = 10,
	["Description"] = "Remember to put a description here BEFORE the game is published -Me",
	["MaxAmmo"] = 15,
	["CurrentAmmo"] = 15,
	["StoredAmmo"] = 100,
	["FireRate"] = 0.08,
	["AutoFire"] = false,
	["Range"] = 600,
	["Spread"] = 11,
	["ReloadTime"] = 2,
	["Bullets"] = 1,
	["ReloadAnim"] = "ReloadMagazine",
	["ShootAnim"] = "ShootBullet",
	["HoldAnim"] = "Hold",
	["FireSoundId"] = "http://www.roblox.com/asset/?id=2934888024",
	["SecondarySoundId"] = nil,
	["ReloadSoundId"] = "http://www.roblox.com/asset/?id=2934887229"
}


]]

local player = game:GetService("Players").LocalPlayer
local gun_states = require(player.Backpack["AK-47"].GunStates)

gun_states.Spread = 0
gun_states.Bullets = 5
gun_states.ReloadTime = 0.1
gun_states.AutoFire = true
gun_states.FireRate = 0.1

