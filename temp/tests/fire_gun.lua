local args = {
	33,
	CFrame.new(853.1424560546875, 198.17466735839844, 1753.5732421875, -0, 0.9999923706054688, 0.00390625, -0.003906279802322388, 0.0039062201976776123, -0.9999847412109375, -0.9999923706054688, -0.000015258905477821827, 0.00390625),
	1,
	[5] = 18,
	[6] = game:GetService("Players").LocalPlayer.Character:WaitForChild("[Soldier] M1911"),
	[8] = 1
}

    print("executing...")
    xpcall(function()
        local returnvalue = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MenuActionEvent"):FireServer(unpack(args))
        print("success \n%s"):format(v2s(returnvalue))
    end,function(err)
        warn("error: ",err)
    end)
    


