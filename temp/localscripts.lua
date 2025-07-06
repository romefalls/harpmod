-- m4

require(game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("TS"):WaitForChild("ANS")).Initiate(
	script.Parent, --1: gun
	2.1, --2: reload time?
	25, --3: max ammo? 
	0.12, --4: firerate?
	26, --5: damage?
	5, --6: ?
	6, --7: ?
	1, --[[8: animation set? 
        1 returns AR/AK animset
        2 returns pistol animset
        3 returns ballfist animset
    ]]
	4.206, --9: time pos event?
	"Rifle Ammo" -- 10: ammo
)
