--[[

note:
you arent supposed to autorun this script
i removed a LOT of waitforchilds


:troll:
5459982119,7485988593,7141616809,6216526940,5644827120,4899180116,7391765296,7488505563,7044363720
5994725824,5999900363,5833333796,4995609156,5891839311,5699732631,5918270333
66330310,10824058593,13994562389,9959698899,14753582362,14753582362,16930850454,14854926827,99611979328492
7145824116,7145825706,9323462320,11676800530,12581448928,12669543527,13002675302,13479814214,13794250687,14067973844,14124935972
]]

local task_spawn = task.spawn
--local _task_wait = task.wait -- selene can you shut up already thank you
local table_insert = table.insert
local table_find = table.find

local next = next
local pcall = pcall
local xpcall = xpcall
local type = type
local typeof = typeof
local game = game

local math_random = math.random
local string_char = string.char

local instance = Instance.new
local vector3 = Vector3.new
local color3 = Color3.fromRGB
local cframe = CFrame.new
local enum = Enum
local raycast_params = RaycastParams.new

local random_string = function()
	local s = ""
	for _ = 1, math_random(8, 15) do
		if math_random(2) == 2 then
			s = s .. string_char(math_random(65, 90))
		else
			s = s .. string_char(math_random(97, 122))
		end
	end
	return s
end

local get_metamethod_from_error_stack = function(userdata, f, test) --[[
		full disclosure:
		i dont know what the fuck this does
		this is probably elite roblox knowledge,
		for those uninitiated, this is like reading c after thousands of years of using lua
	]]
	local ret = nil
	xpcall(f, function()
		ret = debug.info(2, "f")
	end, userdata, nil, 0)
	if (type(ret) ~= "function") or not test(ret) then
		return f
	end
	return ret
end

local ins_get = get_metamethod_from_error_stack(game, function(a, b) -- problem here
	return a[b]
end, function(f)
	local a = Instance.new("Folder")
	local b = random_string()
	a.Name = b
	return f(a, "Name") == b
end)

local find_first_child_of_class = ins_get(game, "FindFirstChildOfClass")

local svc = { -- apparently findfirstchildofclass is faster than getservice?
	players = find_first_child_of_class(game, "Players"),
	rs = find_first_child_of_class(game, "ReplicatedStorage"),
	debris = find_first_child_of_class(game, "Debris"),
	run = find_first_child_of_class(game, "RunService"),
	tween = find_first_child_of_class(game, "TweenService"),
	ws = find_first_child_of_class(game, "Workspace"),
}

local get_players = ins_get(svc.players, "GetPlayers")
local is_a = ins_get(game, "IsA")
local raycast = ins_get(svc.ws, "Raycast")
local renderstepped = ins_get(svc.run, "RenderStepped")
local heartbeat = ins_get(svc.run, "Heartbeat")
local connect = heartbeat.Connect
local get_property_changed_signal = ins_get(game, "GetPropertyChangedSignal")
local get_children = ins_get(game, "GetChildren")

local find_first_child_and_class_check = function(parent, instance, class) -- isnt this just findfirstchildofclass?
	for _, v in next, get_children(parent) do
		if is_a(v, class) and (ins_get(v, "Name") == instance) then
			return v
		end
	end
	return nil
end

local game_instance = {
	events = svc.rs.Events,
}

local game_event = {
	menu_action = game_instance.events.MenuActionEvent,
	reload_action = game_instance.events.WeaponReloadEvent,
	menu = game_instance.events.MenuEvent,
	tool = game_instance.events.ToolsEvent,
}

local local_player = ins_get(svc.players, "LocalPlayer")

local player_data = local_player.PlayerData
local note = game.ReplicatedStorage.Events.Note

local rage = {
	killaura = true,
	aimbot = false,
	auto_reload = true,
	auto_modder = true,
	auto_cola = true, -- for normal ones
	cola_god = true, -- for mythic one
}

local legit = {
	autobuy = true,
	max_hunger = true,
}

local tsi = {
	exponentiate_out = function(t)
		return TweenInfo.new(t, enum.EasingStyle.Exponential, enum.EasingDirection.Out)
	end,
	sine_inout = function(t)
		return TweenInfo.new(t, enum.EasingStyle.Sine, enum.EasingDirection.InOut)
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
		"Remington",
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

local melee = {
	"Toilet Plunger",
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
for _, gun in next, modded_gun_data do
	setmetatable(gun, {
		__index = default_modded_gun_properties,
	})
end

local create_default_gun = function()
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
			local size = vector3(4, 4, 4)
			local part = instance("Part")
			part.Size = size
			part.Anchored = true
			part.CanCollide = false
			part.CanQuery = false
			part.Transparency = 0.93
			part.Color = color or color3(0, 255, 0)
			part.Position = (cell_vec3 * 4) + size / 2
			part.Parent = workspace

			svc.debris:AddItem(part, 1.5)
		end,
	},
}

local tween = function(i, t, p)
	return svc.tween:Create(i, t, p):Play()
end

local draw_ray_line = function(origin, final, color, transparency)
	coroutine.wrap(function()
		local ray_part = instance("Part")
		ray_part.Anchored = true
		ray_part.CanCollide = false
		ray_part.CanQuery = false
		ray_part.CanTouch = false
		ray_part.Material = enum.Material.Neon
		ray_part.Color = color
		ray_part.Transparency = transparency or 0

		local direction = final - origin
		local distance = direction.Magnitude
		local mid_point = origin + (direction / 2)

		ray_part.Size = vector3(0.1, 0.1, distance)
		ray_part.CFrame = cframe(mid_point, final)
		ray_part.Parent = workspace
		tween(ray_part, tsi.sine_inout(0.5), { Transparency = 1, Size = vector3(0, 0, distance) })
		task.wait(0.5)
		ray_part:Destroy()
	end)()
end

local cast_ray = function(origin, final)
	local ray_params = raycast_params()
	ray_params.FilterType = enum.RaycastFilterType.Exclude
	ray_params.IgnoreWater = true
	local exclude = { local_player.Character, workspace.Vehicles }
	for _, v in next, get_players(svc.players) do
		if v.Character then
			local tool = v.Character:FindFirstChildOfClass("Tool")
			if tool then
				table_insert(exclude, tool)
			end
			for _, accessory in next, get_children(v.Character) do
				if accessory:IsA("Accessory") then
					table_insert(exclude, accessory)
				end
			end
		end
	end
	ray_params.FilterDescendantsInstances = exclude
	local direction = (final - origin)
	local result = raycast(svc.ws, origin, direction, ray_params)

	if result then
		local hit_pos = result.Position

		local distance_to_target = (hit_pos - final).Magnitude
		if distance_to_target < 2 then
			draw_ray_line(origin, hit_pos, color3(50, 255, 50))
			return true
		else
			draw_ray_line(origin, hit_pos, color3(255, 50, 50), 0.6)
			return false
		end
	else
		draw_ray_line(origin, origin + direction, color3(100, 100, 100))
		return false
	end
end

local get_ammo_type = function(gun_name)
	for ammo_category, gun_list in next, gun do
		for _, name in next, gun_list do
			if name == gun_name then
				return ammo_type[ammo_category]
			end
		end
	end
	return ammo_type.pistol
end

local buy_item_from_store = function(what)
	local args = {
		[1] = 2,
		[2] = what,
		[3] = nil,
		[4] = 8,
	}
	game_event.menu:FireServer(unpack(args))
end

local name_color = {
	white = color3(255, 255, 255),
	yellow = color3(255, 187, 69),
	red = color3(255, 33, 33),
}

local get_player_name_color = function(player)
	local label = player.Character
		and find_first_child_and_class_check(player.Character, "NameTag", "BillboardGui")
		and find_first_child_and_class_check(player.Character.NameTag, "TextLabel", "TextLabel")
	return (label and label.TextColor3) or name_color.white
end

local get_player_name_key = function(player)
	local col = get_player_name_color(player)
	for key, color_val in next, name_color do
		if color_val == col then
			return key
		end
	end
	return "white"
end

for gun_name, data in next, modded_gun do
	data.ammo_type = get_ammo_type(gun_name)
end

local is_gun = function(tool)
	if not tool then
		return
	end
	local handle = tool:FindFirstChild("Handle")
	if not handle then
		return
	end
	local has_fire = handle:FindFirstChild("Fire") -- i am way too lazy to find another way to check if this is a gun
	local has_reload = handle:FindFirstChild("Reload")
	if not has_fire and not has_reload then
		return false
	end
	return true
end

local modify_gun = function(old_gun, new_gun_name, ammo_type, gun_sound)
	if rage.auto_modder ~= true then
		note:Fire("mod " .. old_gun, "Make sure to have your " .. old_gun .. " unequipped", 5)
	end
	local gun = local_player.Backpack:WaitForChild(old_gun)
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
		size = 4,
		last_cell = nil,
		pending_update = true,
	},
	target = {
		white_names = false,
		yellow_names = true,
		red_names = true,
	},
	radius = 200,
	last_kill_time = 0,
	shoot_delay = 0.045,
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
		local my_char = local_player.Character
		if not my_char then
			return {}
		end
		local my_hrp = find_first_child_and_class_check(my_char, "HumanoidRootPart", "BasePart")
		if not my_hrp then
			return {}
		end
		local targets = {}
		for _, player in next, get_players(svc.players) do
			if
				player ~= local_player
				and player.Character
				and find_first_child_and_class_check(player.Character, "HumanoidRootPart", "BasePart")
			then
				if killaura_whitelist[player.Name] then
					continue
				end
				local name_key = get_player_name_key(player)
				local is_allowed_color = killaura_settings.target[name_key .. "_names"]
				if not is_allowed_color then
					continue
				end
				if #killaura_blacklist > 0 and not table_find(killaura_blacklist, player.Name) then
					continue
				end
				local enemy_hrp = player.Character.HumanoidRootPart
				local distance = (enemy_hrp.Position - my_hrp.Position).Magnitude

				if distance < killaura_settings.radius then
					table_insert(targets, { player = player, part = enemy_hrp })
				end
			end
		end
		return targets
	end,
}

local shoot_gun = function(x, y, z, humanoid)
	local tool = local_player.Character:FindFirstChildOfClass("Tool")
	if is_gun(tool) then
		local args = {
			[1] = 33,
			[2] = cframe(x, y, z),
			[3] = 2,
			[4] = humanoid,
			[5] = 100,
			[6] = tool,
			[7] = nil,
			[8] = 1,
		}
		game_event.menu_action:FireServer(unpack(args))
	end
end

local swing_melee = function(target_player)
	local args = {
		34,
		workspace:FindFirstChild(target_player):WaitForChild("Humanoid"),
		workspace:FindFirstChild(target_player):WaitForChild("HumanoidRootPart").CFrame,
	}
	game_event.menu_action:FireServer(unpack(args))
end

local reload_settings = {
	last_reload_time = 0,
	reload_delay = 0.1, -- s
}

local reload_gun = function(amount)
	local now = tick()
	if now - reload_settings.last_reload_time < reload_settings.reload_delay then
		return
	end
	local tool = local_player.Character:FindFirstChildOfClass("Tool")
	if tool then
		if is_gun(tool) then
			game_event.reload_action:FireServer(get_ammo_type(tool.Name), amount, tool)
			reload_settings.last_reload_time = now
		end
	end
end

function make_node_on_spawn() -- one day
	local args = {
		1,
		"Node",
		cframe(1, 2, 3),
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuildingEvent"):FireServer(unpack(args))
end

local on_render_stepped = {
	killaura = function()
		if rage.killaura == true then
			local get_pos = local_player.Character:WaitForChild("HumanoidRootPart").CFrame.Position

			local current_cell = killaura_func.get_current_cell()
			if current_cell ~= killaura_settings.cell.last_cell then
				killaura_settings.cell.last_cell = current_cell
				killaura_settings.cell.pending_update = true
			end
			if
				killaura_settings.cell.pending_update
				and tick() - killaura_settings.last_kill_time > killaura_settings.shoot_delay
			then
				killaura_settings.cell.pending_update = true -- setting this to true means that it will keep updating over and over again, functioning like a normal killaura
				killaura_settings.last_kill_time = tick()
				task_spawn(function()
					local targets = killaura_func.get_nearby_cell_targets()
					if #targets > 0 then
						local total_targets = #targets
						for _ = 1, total_targets do
							killaura_settings.last_target_index = killaura_settings.last_target_index + 1
							if killaura_settings.last_target_index > total_targets then
								killaura_settings.last_target_index = 1
							end
							local target = targets[killaura_settings.last_target_index]
							local pos = target.part.Position
							local hum = target.part.Parent:WaitForChild("Humanoid")
							if cast_ray(get_pos, pos) then
								shoot_gun(pos.X, pos.Y, pos.Z, hum)
								break
							end
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
							local offset = vector3(x, y, z)
							local cell = current_cell + offset
							local center_pos = (cell * killaura_settings.cell.size)
								+ vector3( -- apparently using * and + operators on vector3s are faster than /?
									killaura_settings.cell.size * 0.5,
									killaura_settings.cell.size * 0.5,
									killaura_settings.cell.size * 0.5
								)

							if (center_pos - get_pos).Magnitude <= killaura_settings.radius then
								debug.killaura.draw_cells(cell, color3(0, 255, 0))
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
			local_player.PlayerData.Hunger.Value = 100
		end
	end,
	auto_cola = function()
		local character = local_player.Character
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
	--[[
	cola_god = function()
		local cola = local_player.Backpack:FindFirstChild("Mythic Bloxy Cola")
		if not cola then
			return
		end
		game_event.tool:FireServer({ 4, cola })
	end,
	]]
}

for _, ammo_name in next, ammo_type do
	local ammo_stat = player_data:WaitForChild(ammo_name)
	connect(get_property_changed_signal(ammo_stat, "Value"), function()
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

connect(local_player.Backpack.ChildAdded, function(child)
	if rage.auto_modder == true then
		if is_gun(child) then
			local gun_name = child.Name
			local mod_data = modded_gun[gun_name]

			local new_name = mod_data.new_gun_name
			local sound = mod_data.sound
			local ammo = get_ammo_type(gun_name)

			modify_gun(gun_name, new_name, ammo, sound)
		end
	end
end)

renderstepped:Connect(function()
	for _, v in next, on_render_stepped do
		xpcall(function()
			task_spawn(v)
		end, function(err)
			note:Fire("are you stupid", err, 4)
		end)
	end
end)

note:Fire("success", "ran successfully", 5)
