                          local GunToMod = "Lever Action"
                            local NewGunName = "Hi nigga let's go band 4 band"
                            local AmmoType = "Rifle"
                            local MaxAmmo = 7
                            local FireRate = 0
                            local Spread = 0
                            local GunSound = 9
                            local Gun = game:GetService("Players").LocalPlayer.Backpack:WaitForChild(GunToMod)
                            Gun.LocalScript:Destroy()
                            require(game:GetService("ReplicatedStorage").Modules.TS[(false and "ANS") or "GNS"]).Initiate(Gun,2.2,MaxAmmo,FireRate,35,Spread,GunSound,4,nil,AmmoType .. " Ammo",1,2,2)
                            Gun.Name = NewGunName
                            Gun.ToolTip = "Modified by Harpmod"