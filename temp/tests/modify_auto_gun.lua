
function modify_gun_auto(old_gun, new_gun_name, ammo_type)

	local gun = game.Players.LocalPlayer.Backpack:WaitForChild(old_gun)
	--gun.LocalScript:Destroy()
    require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("TS"):WaitForChild("ANS")).Initiate(
        old_gun, --1: gun
        0, --2: unused, spread?
        25, --3: unused? 
        0.03, --4: firerate?
        26, --5: damage?
        5, --6: ?
        6, --7: ?
        1, --[[8: animation set? 
            1 returns AR/AK animset
            2 returns pistol animset
            3 returns ballfist animset
        ]]
        4.206, --9: time pos event?
        ammo_type -- 10: ammo
    )
	gun.Name = new_gun_name
    warn("success")
end


modify_gun_auto("M4","XM5","Rifle Ammo")