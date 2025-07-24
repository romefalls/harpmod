local target = "zKa_i"
local max_price = 1000
local silent_target = false -- will not alert the target that theyre being hunted, in other words won't give them the bounty popup

for _, v in game.Players:GetPlayers() do -- for each player (v), do this:
	print("let's handle ", v )
	if v == game:GetService("Players"):WaitForChild(target) then -- is this player our target?
		if silent_target then -- ok they are, is silent_target on?
			return -- it's on, let's do nothing
		end
	end
	if v.TargetBounty.HirePrice.Value <= max_price then -- are they hiring for 1000 dolla or less?
		local args = {
			15, -- opcode
			v, -- tell this player
			game:GetService("Players"):WaitForChild(target), -- to hunt this player
		}

		game:GetService("ReplicatedStorage")
			:WaitForChild("Events")
			:WaitForChild("MenuActionEvent")
			:FireServer(unpack(args)) -- tell the server that youre hiring v against target
		print("hired ", v, " against " .. target)
	else print("price was too large, expected ", max_price, " or less, got " .. v.TargetBounty.HirePrice.Value)

	end
end

