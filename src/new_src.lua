--[[

todo:

svc.players.localplayer should be just 1 upvalue
fix autobuy
modules

killaura:
- whites yellows reds
- blacklist skips all checks and just kills
- sentry mode for killzone as guard badass
- debug cell drawing gives u negative fps 

]]
local svc = {
	players = game:GetService("Players"),
	rs = game:GetService("ReplicatedStorage"),
	debris = game:GetService("Debris"),
	run = game:GetService("RunService"),
	tween = game:GetService("TweenService"),
}

local game_instance = {
	events = svc.rs:WaitForChild("Events"),
}

local game_event = {
	menu_action = game_instance.events:WaitForChild("MenuActionEvent"),
	reload_action = game_instance.events:WaitForChild("WeaponReloadEvent"),
	menu = game_instance.events:WaitForChild("MenuEvent"),
}

local player_data = svc.players.LocalPlayer:WaitForChild("PlayerData")
local note = game.ReplicatedStorage.Events.Note

local rage = {
	killaura = true,
	aimbot = false,
	auto_reload = true,
	auto_modder = true,
	auto_cola = true,
}

local legit = {
	autobuy = true,
	max_hunger = true,
}

local tsi = {
	exponentiate_out = function(t)
		return TweenInfo.new(t, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
	end,
	sine_inout = function(t)
		return TweenInfo.new(t, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
	end,
}

local ammo_type = {
	heavy = "Heavy Ammo",
	pistol = "Pistol Ammo",
	rifle = "Rifle Ammo",
	smg = "SMG Ammo",
}

local ammo_type_to_key = {
	["Heavy Ammo"] = "heavy",
	["Pistol Ammo"] = "pistol",
	["Rifle Ammo"] = "rifle",
	["SMG Ammo"] = "smg",
}

local ammo_type_in_shop = {
	heavy = "Heavy Ammo (10x)",
	pistol = "Pistol Ammo (30x)",
	rifle = "Rifle Ammo (30x)",
	smg = "SMG Ammo (60x)",
}

local gun = {
	heavy = {
		"Laser Musket",
		-- .. i think thats it
	},
	pistol = {
		"Deagle",
		"M1911",
		"Mauser",
		"USP",
		-- ...
	},
	rifle = {
		"M4",
		"M16",
		"AK",
		"Schofield Revolver",
		"Garand",
		"Vermin Rifle",
		"Snubnose",
		".45 Revolver",
		-- ...
	},
	smg = {
		"Tec9",
		"Bizon",
		"Tommy Gun",
		-- ...
	},
}
local default_modded_gun_properties = {
	new_gun_name = "hi bro",
	sound = 4,
}

local modded_gun_data = {
	-- pistols
	Deagle = {
		new_gun_name = "DX177",
		sound = 9,
	},
	USP = {
		new_gun_name = "XM9",
		sound = 18,
	},

	-- smgs
	Tec9 = {
		new_gun_name = "Dylan's Acquaintance",
		sound = 12,
	},

	-- rifles
	Garand = {
		new_gun_name = "M4 Garand",
		sound = 19,
	},
	AK = {
		new_gun_name = "AN-94",
		sound = 19,
	},
}
for _, gun in pairs(modded_gun_data) do
	setmetatable(gun, {
		__index = default_modded_gun_properties,
	})
end

function create_default_gun()
	return setmetatable({}, { __index = default_modded_gun_properties })
end

local modded_gun = setmetatable({}, {
	__index = function(_, key)
		if modded_gun_data[key] then
			return modded_gun_data[key]
		end
		return create_default_gun()
	end,
})

local debug = {
	enabled = false,
	killaura = {
		draw_cells = function(cell_vec3, color)
			local size = Vector3.new(4, 4, 4)
			local part = Instance.new("Part")
			part.Size = size
			part.Anchored = true
			part.CanCollide = false
			part.CanQuery = false
			part.Transparency = 0.93
			part.Color = color or Color3.fromRGB(0, 255, 0)
			part.Position = (cell_vec3 * 4) + size / 2
			part.Parent = workspace

			svc.debris:AddItem(part, 1.5)
		end,
	},
}

function tween(i, t, p)
	return svc.tween:Create(i, t, p):Play()
end

function draw_ray_line(origin, final, color, transparency)
	coroutine.wrap(function()
		local ray_part = Instance.new("Part")
		ray_part.Anchored = true
		ray_part.CanCollide = false
		ray_part.CanQuery = false
		ray_part.CanTouch = false
		ray_part.Material = Enum.Material.Neon
		ray_part.Color = color
		ray_part.Transparency = transparency or 0

		local direction = final - origin
		local distance = direction.Magnitude
		local mid_point = origin + (direction / 2)

		ray_part.Size = Vector3.new(0.1, 0.1, distance)
		ray_part.CFrame = CFrame.new(mid_point, final)
		ray_part.Parent = workspace
		tween(ray_part, tsi.sine_inout(0.5), { Transparency = 1, Size = Vector3.new(0, 0, distance) })
		svc.debris:AddItem(ray_part, 0.5)
	end)()
end

function cast_ray(origin, final)
	local ray_params = RaycastParams.new()
	ray_params.FilterType = Enum.RaycastFilterType.Exclude
	ray_params.FilterDescendantsInstances = { svc.players.LocalPlayer.Character, workspace.Vehicles }
	ray_params.IgnoreWater = true

	local direction = (final - origin)
	local result = workspace:Raycast(origin, direction, ray_params)

	if result then
		local hit_pos = result.Position

		local distance_to_target = (hit_pos - final).Magnitude
		if distance_to_target < 2 then
			draw_ray_line(origin, hit_pos, Color3.fromRGB(50, 255, 50))
			return true
		else
			draw_ray_line(origin, hit_pos, Color3.fromRGB(255, 50, 50), 0.6)
			return false
		end
	else
		draw_ray_line(origin, origin + direction, Color3.fromRGB(100, 100, 100))
		return false
	end
end

function get_ammo_type(gun_name)
	for ammo_category, gun_list in pairs(gun) do
		for _, name in ipairs(gun_list) do
			if name == gun_name then
				return ammo_type[ammo_category]
			end
		end
	end
	return ammo_type.pistol
end

function buy_item_from_store(what)
	local args = {
		[1] = 2,
		[2] = what,
		[3] = nil,
		[4] = 8,
	}
	game_event.menu:FireServer(unpack(args))
end

for gun_name, data in pairs(modded_gun) do
	data.ammo_type = get_ammo_type(gun_name)
end

function modify_gun(old_gun, new_gun_name, ammo_type, gun_sound)
	if rage.auto_modder ~= true then
		note:Fire("mod " .. old_gun, "Make sure to have your " .. old_gun .. " unequipped", 5)
	end
	local gun = svc.players.LocalPlayer.Backpack:WaitForChild(old_gun)
	gun.LocalScript:Destroy()
	require(svc.rs.Modules.TS[(false and "ANS") or "GNS"]).Initiate(
		gun,
		2.2,
		100,
		0,
		100,
		0,
		gun_sound,
		4,
		nil,
		ammo_type,
		1,
		2,
		2
	)
	gun.Name = new_gun_name
	if rage.auto_modder ~= true then -- whatever
		note:Fire("Done!", "Modding is done. Equip your " .. new_gun_name .. " now", 5)
	end
end

local killaura_settings = {
	cell = {
		size = 2,
		last_cell = nil,
		pending_update = true,
	},
	radius = 200,
	last_kill_time = 0,
	shoot_delay = 0.05,
	last_target_index = 1,
}

local killaura_whitelist = {
	Zhawrina = true,
	Z6MN7P2A9Q79hUILLUiw = true,
}

local killaura_blacklist = {}

local killaura_func = {
	get_current_cell = function()
		return workspace.CurrentCamera.CFrame.Position // killaura_settings.cell.size
	end,
	get_nearby_cell_targets = function()
		local local_player = svc.players.LocalPlayer
		local my_char = local_player.Character
		if not my_char then
			return {}
		end

		local my_hrp = my_char:FindFirstChild("HumanoidRootPart")
		if not my_hrp then
			return {}
		end

		local targets = {}

		for _, player in pairs(svc.players:GetPlayers()) do
			if player ~= local_player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				if not killaura_whitelist[player.Name] then
					if #killaura_blacklist == 0 or table.find(killaura_blacklist, player.Name) then
						local enemy_hrp = player.Character.HumanoidRootPart
						local distance = (enemy_hrp.Position - my_hrp.Position).Magnitude
						if distance < killaura_settings.radius then
							table.insert(targets, { player = player, part = enemy_hrp })
						end
					end
				end
			end
		end

		return targets
	end,
}

function shoot_gun(x, y, z, humanoid)
	local tool = svc.players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
	if not tool then
		return
	end
	local args = {
		[1] = 33, --opcode
		[2] = CFrame.new(x, y, z), -- yes
		[3] = 2, -- yes
		[4] = humanoid, -- why yes
		[5] = 100, -- yes
		[6] = tool, -- probably
		[7] = nil, -- probably maybe yes
		[8] = 1, -- sometimes
	}
	game_event.menu_action:FireServer(unpack(args))
end

local reload_settings = {
	last_reload_time = 0,
	reload_delay = 0.1, -- s
}

function reload_gun(amount)
	local now = tick()
	if now - reload_settings.last_reload_time < reload_settings.reload_delay then
		return
	end
	local tool = svc.players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
	if not tool then
		return
	end

	game_event.reload_action:FireServer(get_ammo_type(tool.Name), amount, tool)
	reload_settings.last_reload_time = now
end

function drink_cola()

end

function make_node_on_spawn() -- one day
	local args = {
		1,
		"Node",
		CFrame.new(
			-320.34494,
			154.018173,
			-161.205093,
			-0.934287548,
			-2.03324539e-08,
			-0.356520385,
			-2.12887876e-08,
			1,
			-1.24145705e-09,
			0.356520385,
			6.43000897e-09,
			-0.934287548
		),
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuildingEvent"):FireServer(unpack(args))
end

local on_render_stepped = {
	killaura = function()
		if rage.killaura == true then
			local get_pos = svc.players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame.Position

			local current_cell = killaura_func.get_current_cell()
			if current_cell ~= killaura_settings.cell.last_cell then
				killaura_settings.cell.last_cell = current_cell
				killaura_settings.cell.pending_update = true
			end
			if
				killaura_settings.cell.pending_update
				and tick() - killaura_settings.last_kill_time > killaura_settings.shoot_delay
			then
				killaura_settings.cell.pending_update = false
				killaura_settings.last_kill_time = tick()
				task.spawn(function()
					local targets = killaura_func.get_nearby_cell_targets()
					if #targets > 0 then
						killaura_settings.last_target_index = killaura_settings.last_target_index + 1
						if killaura_settings.last_target_index > #targets then
							killaura_settings.last_target_index = 1
						end
						local target = targets[killaura_settings.last_target_index]
						local pos = target.part.Position
						local hum = target.part.Parent:WaitForChild("Humanoid")
						if cast_ray(get_pos, pos) then
							shoot_gun(pos.X, pos.Y, pos.Z, hum)
						end
					end
				end)
			end
			if debug.enabled then
				local range = math.ceil(killaura_settings.radius / killaura_settings.cell.size)
				local current_cell = get_pos // killaura_settings.cell.size
				for x = -range, range do
					for y = -range, range do
						for z = -range, range do
							local offset = Vector3.new(x, y, z)
							local cell = current_cell + offset
							local center_pos = (cell * killaura_settings.cell.size)
								+ Vector3.new(
									killaura_settings.cell.size / 2,
									killaura_settings.cell.size / 2,
									killaura_settings.cell.size / 2
								)

							if (center_pos - get_pos).Magnitude <= killaura_settings.radius then
								debug.killaura.draw_cells(cell, Color3.fromRGB(0, 255, 0))
							end
						end
					end
				end
			end
		end
	end,
	aimbot = function()
		if rage.aimbot == true then
			print("are you stupid")
		end
	end,
	auto_reload = function()
		if rage.auto_reload == true then
			reload_gun(5)
		end
	end,
	max_hunger = function()
		if legit.max_hunger == true then
			svc.players.LocalPlayer.PlayerData.Hunger.Value = 100
		end
	end,
	auto_cola = function()
		local character = svc.players.LocalPlayer.Character
		if not character then
			return
		end
		local humanoid = character:WaitForChild("Humanoid")
		if not humanoid then
			return
		end
		if humanoid.Health < 50 then
			drink_cola()
		end
	end,
}

for _, ammo_name in next, ammo_type do
	local ammo_stat = player_data:WaitForChild(ammo_name)
	ammo_stat:GetPropertyChangedSignal("Value"):Connect(function()
		if legit.autobuy == true then
			if ammo_stat.Value < 20 then
				local key = ammo_type_to_key[ammo_name]
				local item_name_in_shop = ammo_type_in_shop[key]
				if item_name_in_shop then
					buy_item_from_store(item_name_in_shop)
				else
					warn("no matching shop item for", ammo_name)
				end
			end
		end
	end)
end

svc.players.LocalPlayer.Backpack.ChildAdded:Connect(function(child)
	if rage.auto_modder == true then
		local handle = child:FindFirstChild("Handle")
		if not handle then
			return
		end
		local has_fire = handle:FindFirstChild("Fire") -- i am way too lazy to find another way to check if this is a gun
		local has_reload = handle:FindFirstChild("Reload")
		if not has_fire and not has_reload then
			return
		end

		local gun_name = child.Name
		local mod_data = modded_gun[gun_name]

		local new_name = mod_data.new_gun_name
		local sound = mod_data.sound
		local ammo = get_ammo_type(gun_name)

		modify_gun(gun_name, new_name, ammo, sound)
	end
end)

svc.run.RenderStepped:Connect(function(dt)
	for _, v in next, on_render_stepped do
		xpcall(function()
			task.spawn(v)
		end, function(err)
			warn("are you stupid: ", err)
		end)
	end
end)

print("hello world")
