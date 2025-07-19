local GunToMod = "G36"
local NewGunName = "Hi nigga let's go band 4 band"
local AmmoType = "Rifle"
local MaxAmmo = 7
local FireRate = 0
local Spread = 0
local GunSound = 5
local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
Gun.LocalScript:Destroy()
require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(
	Gun,
	2.2,
	MaxAmmo,
	FireRate,
	35,
	Spread,
	GunSound,
	1,
	nil,
	AmmoType .. " Ammo",
	1,
	2,
	2
)
Gun.Name = NewGunName
Gun.ToolTip = "Modified by Harpmod"

--[[
                            
                            
1: jetpack
2: unused pistol caliber gun
3: m1911
4: lever action
5: laser pistol of some sort
6: semi auto rifle       
7: nothing
8: nothing
9: explosions
10: deagle and revolvers
11: unused lasery pistol thing?
12: mausery unused pistol thing?
13: explosions
14: ricochets
15: jetpack
16: mauser and usp
17: nothing
18: nothing
19: garand?
20: laser musket
21: m16
22: varmint rifle (or was it vermin rifle i dont remember)
23: nil
                            
                            
                            
                            
                            
                            ]]
