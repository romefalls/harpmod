--[[
:troll:
5459982119,7485988593,7141616809,6216526940,5644827120,4899180116,7391765296,7488505563,7044363720 -- fur?
5994725824,5999900363,5833333796,4995609156,5891839311,5699732631,5918270333 --deleted?
66330310,10824058593,13994562389,9959698899,14753582362,14753582362,16930850454,14854926827,99611979328492 --idfk?
7145824116,7145825706,9323462320,11676800530,12581448928,12669543527,13002675302,13479814214,13794250687,14067973844,14124935972 --zaak
17814441976,109552074033966,18613673779,135872614955430,128593425863840,76612888997160,126205541378879,13206455309,120589223050335,15729409885,11788143966,12965267930,136945645973532,136573284940700,114875031523165
]]

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

local killaura_settings = {
	cell = {
		size = 4,
		last_cell = nil,
		pending_update = true,
		always_scanning = true,
	},
	target = {
		white_names = false,
		yellow_names = true,
		red_names = true,
		govt_workers = false,
	},
	radius = 200,
	last_kill_time = 0,
	shoot_delay = 0.045,
	last_target_index = 1,
}

local reload_settings = {
	last_reload_time = 0,
	reload_delay = 0.1, -- s
}

local transparency = {
	killaura = {
		idfk = 0.5,
	},
}

local ui = {
	repo = "https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/",
	library = loadstring(
		game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua")
	)(),
	man = loadstring(
		game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/ThemeManager.lua")
	)(),
	man_save = loadstring(
		game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua")
	)(),
}

local profiling_enabled = true

local task_spawn = task.spawn
local _task_wait = task.wait
local table_insert = table.insert
local table_find = table.find

local next = next
local pcall = pcall
local xpcall = xpcall
local type = type
local typeof = typeof
local game = game

local math_random = math.random
local math_ceil = math.ceil
local math_floor = math.floor
local math_abs = math.abs
local string_char = string.char

local v3int16 = Vector3int16

local profile_begin = debug.profilebegin
local profile_end = debug.profileend

local debug_profilebegin = function(str)
	if profiling_enabled then
		profile_begin(str)
	end
end

local debug_profileend = function()
	if profiling_enabled then
		profile_end()
	end
end

local instance = Instance.new
local vector3 = Vector3.new
local color3 = Color3.fromRGB
local enum = Enum
local raycast_params = RaycastParams.new
local v2 = Vector2.new
local angles = CFrame.fromEulerAngles --faster than .Angles

local tracked_items = {}

local killaura_whitelist = {}
local killaura_blacklist = {}

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

local ins_get = get_metamethod_from_error_stack(game, function(a, b)
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

local cf_get = get_metamethod_from_error_stack(cf_0, function(a, b)
	return a[b]
end, function(f)
	return f(cframe(1, 2, 3), "Position") == vector3(1, 2, 3)
end)
local cf_mul = get_metamethod_from_error_stack(cf_0, function(a, b)
	return a * b
end, function(f)
	return angles(1, 2, 3) * angles(1, 2, 3) == f(angles(1, 2, 3), angles(1, 2, 3))
end)
local cf_add = get_metamethod_from_error_stack(cf_0, function(a, b)
	return a + b
end, function(f)
	return cframe(1, 2, 3) + vector3(1, 2, 3) == f(cframe(1, 2, 3), vector3(1, 2, 3))
end)
local v3_get = get_metamethod_from_error_stack(v3_0, function(a, b)
	return a[b]
end, function(f)
	return vector3(1, 2, 3).Unit == f(vector3(1, 2, 3), "Unit")
end)

local find_first_child_and_class_check = function(parent, instance, class) -- isnt this just findfirstchildofclass?
	for _, v in next, get_children(parent) do
		if is_a(v, class) and (ins_get(v, "Name") == instance) then
			return v
		end
	end
	return nil
end

local wait_for_child = function(parent, instance)
	for _, v in next, get_children(parent) do
		if ins_get(v, "Name") == instance then
			return v
		end
	end
	return nil
end

local local_player = ins_get(svc.players, "LocalPlayer")

local game_instance = {
	events = svc.rs.Events,
}

local game_event = {
	menu_action = game_instance.events.MenuActionEvent,
	reload_action = game_instance.events.WeaponReloadEvent,
	menu = game_instance.events.MenuEvent,
	tool = game_instance.events.ToolsEvent,
}

local color = {
	killaura = {
		unable_to_find_line_of_sight = color3(255, 50, 50),
		found_line_of_sight_and_firing = color3(50, 255, 50),
		no_result_was_found = color3(100, 100, 100),
	},
}

local player_data = local_player.PlayerData
local note = game_instance.events.Note

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
		-- ...
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

local _melee = {
	"Toilet Plunger",
	"Wooden Sword", -- i need more
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

local track_character = function(character)
	debug_profilebegin("harpmod.track_character")
	if not character then
		return
	end
	local items = {}

	for _, desc in next, character:GetDescendants() do
		if desc:IsA("Tool") or desc:IsA("Accessory") then
			table_insert(items, desc)
		end
	end

	tracked_items[character] = items

	character.DescendantAdded:Connect(function(desc)
		if desc:IsA("Tool") or desc:IsA("Accessory") then
			table_insert(tracked_items[character], desc)
		end
	end)

	character.AncestryChanged:Connect(function(_, parent)
		if not parent then
			tracked_items[character] = nil
		end
	end)
	debug_profileend()
end

for _, player in next, get_players(svc.players) do
	track_character(player.Character)
	player.CharacterAdded:Connect(track_character)
end

local draw_ray_line = function(origin, final, color, transparency)
	debug_profilebegin("harpmod.draw_ray_line")
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
	debug_profileend()
end

local cast_ray = function(origin, final)
	debug_profilebegin("harpmod.cast_ray")
	local ray_params = raycast_params()
	local exclude = { local_player.Character, workspace.Vehicles }
	ray_params.FilterType = enum.RaycastFilterType.Exclude
	ray_params.IgnoreWater = true
	local direction = (final - origin)
	for _, items in next, tracked_items do
		for _, item in next, items do
			table_insert(exclude, item)
		end
	end
	ray_params.FilterDescendantsInstances = exclude
	local result = raycast(svc.ws, origin, direction, ray_params)

	if result then
		local hit_pos = result.Position

		local distance_to_target = (hit_pos - final).Magnitude
		if distance_to_target < 2 then
			draw_ray_line(origin, hit_pos, color.killaura.found_line_of_sight_and_firing)
			debug_profileend()
			return true
		else
			draw_ray_line(origin, hit_pos, color.killaura.unable_to_find_line_of_sight, 0.6)
			debug_profileend()
			return false
		end
	else
		draw_ray_line(origin, origin + direction, color.killaura.no_result_was_found)
		debug_profileend()
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
	government = color3(112, 186, 255),
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

local get_position_cell = function(pos)
	return v3int16.new(
		math_floor(pos.X / killaura_settings.cell.size),
		math_floor(pos.Y / killaura_settings.cell.size),
		math_floor(pos.Z / killaura_settings.cell.size)
	)
end

local modify_gun = function(old_gun, new_gun_name, ammo_type, gun_sound, spread, fire_rate, anim_type)
	if rage.auto_modder ~= true then
		note:Fire("mod " .. old_gun, "Make sure to have your " .. old_gun .. " unequipped", 5)
	end
	local gun = wait_for_child(local_player.Backpack, old_gun)
	gun.LocalScript:Destroy()
	require(svc.rs.Modules.TS[(false and "ANS") or "GNS"]).Initiate(
		gun, -- old gun
		2.2, -- idfk
		100, -- max ammo
		fire_rate or 0, -- firerate
		100, -- damage
		spread or 0, -- spread
		gun_sound or 4, -- gun sound
		anim_type or 1, -- animation type
		nil, -- idfk
		ammo_type, -- ammo type
		1, -- idfk
		2, -- idfk
		2 -- IDFK
	)
	gun.Name = new_gun_name
	if rage.auto_modder ~= true then -- whatever
		note:Fire("Done!", "Modding is done. Equip your " .. new_gun_name .. " now", 5)
	end
end

local killaura_func = {
	get_current_cell = function()
		return workspace.CurrentCamera.CFrame.Position // killaura_settings.cell.size
	end,
	get_nearby_cell_targets = function()
		debug_profilebegin("harpmod.killaura_func.get_nearby_cell_targets")
		local my_char = local_player.Character
		if not my_char then
			return {}
		end
		local my_hrp = wait_for_child(my_char, "HumanoidRootPart")
		if not my_hrp then
			return {}
		end
		local my_cell = get_position_cell(my_hrp.Position)
		local targets = {}
		for _, player in next, get_players(svc.players) do
			debug_profilebegin("player_" .. player.Name)
			if player == local_player or not player.Character then
				debug_profileend()
				continue
			end
			local hrp = wait_for_child(player.Character, "HumanoidRootPart")
			if not hrp then
				debug_profileend()
				continue
			end
			local their_cell = get_position_cell(hrp.Position)
			local dx = math_abs(my_cell.X - their_cell.X)
			local dy = math_abs(my_cell.Y - their_cell.Y)
			local dz = math_abs(my_cell.Z - their_cell.Z)
			local max_cell_distance = math_ceil(killaura_settings.radius / killaura_settings.cell.size)
			if dx > max_cell_distance or dy > max_cell_distance or dz > max_cell_distance then
				debug_profileend()
				continue
			end
			if killaura_whitelist[player.Name] then
				debug_profileend()
				continue
			end
			debug_profilebegin("player_" .. player.Name .. "_checks")
			local name_key = get_player_name_key(player)
			local is_allowed_color = killaura_settings.target[name_key .. "_names"]
			if not is_allowed_color then
				debug_profileend()
				continue
			end
			if #killaura_blacklist > 0 and not table_find(killaura_blacklist, player.Name) then
				debug_profileend()
				continue
			end
			local dist = (hrp.Position - my_hrp.Position).Magnitude
			if dist < killaura_settings.radius then
				table_insert(targets, { player = player, part = hrp })
			end
			debug_profileend()
		end
		debug_profileend()
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

local _swing_melee = function(target_player)
	local args = {
		34, --opcode
		workspace:FindFirstChild(target_player):WaitForChild("Humanoid"), --unlucky guy's health
		workspace:FindFirstChild(target_player):WaitForChild("HumanoidRootPart").CFrame, -- unlucky guy's position
	}
	game_event.menu_action:FireServer(unpack(args))
end

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

local on_render_stepped = {
	killaura = function()
		if rage.killaura == true then
			debug_profilebegin("harpmod.on_render_stepped.killaura")
			local get_pos = wait_for_child(local_player.Character, "HumanoidRootPart").CFrame.Position

			local current_cell = killaura_func.get_current_cell()
			if current_cell ~= killaura_settings.cell.last_cell then
				killaura_settings.cell.last_cell = current_cell
				killaura_settings.cell.pending_update = true
			end
			if
				killaura_settings.cell.pending_update
				and tick() - killaura_settings.last_kill_time > killaura_settings.shoot_delay
			then
				if killaura_settings.cell.always_scanning == true then
					killaura_settings.cell.pending_update = true -- setting this to true means that it will keep updating over and over again, functioning like a normal killaura
				else
					killaura_settings.cell.pending_update = false
				end
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
							local hum = wait_for_child(target.part.Parent, "Humanoid")
							if cast_ray(get_pos, pos) then
								shoot_gun(pos.X, pos.Y, pos.Z, hum)
								break
							end
						end
					end
				end)
				debug_profileend()
			end
			if debug.enabled then
				local range = math_ceil(killaura_settings.radius / killaura_settings.cell.size)
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
			debug_profilebegin("harpmod.on_render_stepped.auto_reload")
			reload_gun(5)
			debug_profileend()
		end
	end,
	max_hunger = function()
		if legit.max_hunger == true then
			local_player.PlayerData.Hunger.Value = 100
		end
	end,
	--[[
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
	local ammo_stat = wait_for_child(player_data, ammo_name)
	connect(get_property_changed_signal(ammo_stat, "Value"), function()
		if legit.autobuy == true then
			debug_profilebegin("harpmod.auto_buy")
			if ammo_stat.Value < 20 then
				local key = ammo_type_to_key[ammo_name]
				local item_name_in_shop = ammo_type_in_shop[key]
				if item_name_in_shop then
					buy_item_from_store(item_name_in_shop)
				else
					warn("no matching shop item for", ammo_name)
				end
			end
			debug_profileend()
		end
	end)
end

connect(local_player.Backpack.ChildAdded, function(child)
	debug_profilebegin("harpmod.lp.bp.ChildAdded.auto_modder")
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
	debug_profileend()
end)

renderstepped:Connect(function()
	debug_profilebegin("harpmod.renderstepped")
	for _, v in next, on_render_stepped do
		xpcall(function()
			task_spawn(v)
		end, function(err)
			note:Fire("are you stupid", err, 4)
		end)
	end
	debug_profileend()
end)

local window = ui.library:CreateWindow({
	Title = "Harpmod 2",
	Center = true,
	AutoShow = true,
	TabPadding = 8,
	MenuFadeTime = 0.2,
})

local tab = {
	main = window:AddTab("Main"),
	killaura = window:AddTab("Killaura"),
	rage = window:AddTab("Rage"),
	legit = window:AddTab("Legit"),
	gun_modder = window:AddTab("Gun Modder"),
}

local gun_modder_stats = {}

local groupbox = {
	main = {
		debug = tab.main:AddLeftGroupbox("Debugging"),
	},
	killaura = {
		bools = tab.killaura:AddLeftGroupbox("Bools"),
		sliders = tab.killaura:AddRightGroupbox("Sliders"),
		toggles = tab.killaura:AddLeftGroupbox("Toggles"),
		dropdowns = tab.killaura:AddRightGroupbox("Targets"),
	},
	rage = {
		toggles = tab.killaura:AddLeftGroupbox("Misc"),
	},
	modder = {
		stat_maker = tab.gun_modder:AddLeftGroupbox("Stats"),
		processor = tab.gun_modder:AddRightGroupbox("Name & Build"),
	},
}
local slider = {
	killaura = {
		range = groupbox.killaura.sliders:AddSlider("killaura_range", {
			Text = "Range",
			Default = killaura_settings.radius,
			Min = 1,
			Max = 250,
			Rounding = 1,
			Compact = false,
		}),
		speed = groupbox.killaura.sliders:AddSlider("killaura_speed", {
			Text = "Speed",
			Default = killaura_settings.shoot_delay,
			Min = 0,
			Max = 5,
			Rounding = 5,
			Compact = false,
		}),
	},
}
local dropdown = {
	killaura_player_whitelist = groupbox.killaura.dropdowns:AddDropdown("player_whitelist", {
		SpecialType = "Player",
		Text = "Whitelist",
		Tooltip = "Killaura will not target these players for any reason",
		Multi = true,
	}),
	killaura_player_blacklist = groupbox.killaura.dropdowns:AddDropdown("player_blacklist", {
		SpecialType = "Player",
		Text = "Blacklist",
		Tooltip = "Killaura will target these players regardless of their name color",
		Multi = true,
	}),
}
--[[

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


]]
local toggle = {
	profiling_on = groupbox.main.debug:AddToggle("microprofiler_labels_on", {
		Text = "Profiling",
		Default = profiling_enabled,
		Tooltip = "Toggles label profiling for use in MicroProfiler. Disable if you don't know what that means.",
	}),
	aimbot_on = groupbox.rage.toggles:AddToggle("aimbot_on", {
		Text = "Aimbot",
		Default = rage.aimbot,
		Tooltip = "Toggles aimbot on or off. Warning: doesn't do anything rn",
	}),
	auto_reload = groupbox.rage.toggles:AddToggle("auto_reload", {
		Text = "Auto Reload",
		Default = rage.auto_reload,
		Tooltip = "Auto Reload will reload any gun that you hold instantly.",
	}),
	auto_modder = groupbox.rage.toggles:AddToggle("auto_modder_on", {
		Text = "Auto Modder",
		Default = rage.auto_modder,
		Tooltip = "Modifies your guns to have custom stats. Warning: very janky",
	}),
	killaura_on = groupbox.killaura.bools:AddToggle("killaura_enabled", {
		Text = "Enabled",
		Default = rage.killaura,
		Tooltip = "Toggles killaura on or off",
	}),
	killaura_spatial_partitioning = groupbox.killaura.bools:AddToggle("killaura_spatial_partitioning", {
		Text = "Always Scanning",
		Default = killaura_settings.cell.always_scanning,
		Tooltip = "If set to 'off', killaura will only scan when camera enters a new cell.",
	}),
	killaura_target = { --[[
		since linoria weird and i lazy, ill do it like this:
	]]
		name_white = groupbox.killaura.dropdowns:AddToggle("white_names", {
			Text = "Whitenames",
			Default = killaura_settings.target.white_names,
			Tooltip = "Killaura will target whitenames if enabled.",
		}),
		name_yellow = groupbox.killaura.dropdowns:AddToggle("yellow_names", {
			Text = "Yellownames",
			Default = killaura_settings.target.yellow_names,
			Tooltip = "Killaura will target yellownames if enabled.",
		}),
		name_red = groupbox.killaura.dropdowns:AddToggle("red_names", {
			Text = "Rednames",
			Default = killaura_settings.target.red_names,
			Tooltip = "Killaura will target rednames if enabled.",
		}),
		name_govt = groupbox.killaura.dropdowns:AddToggle("govt_names", {
			Text = "Government Workers",
			Default = killaura_settings.target.govt_names,
			Tooltip = "Killaura will target government agents (i.e. Soldiers, Detectives, Mayors) if enabled.",
		}),
	},
}

toggle.profiling_on:OnChanged(function()
	profiling_enabled = toggle.profiling_on.Value
end)

toggle.aimbot_on:OnChanged(function()
	rage.aimbot = toggle.aimbot_on.Value
end)

toggle.auto_reload:OnChanged(function()
	rage.auto_reload = toggle.auto_reload.Value
end)

toggle.auto_modder:OnChanged(function()
	rage.auto_modder = toggle.auto_modder.Value
end)

slider.killaura.range:OnChanged(function()
	killaura_settings.radius = slider.killaura.range.Value
end)

slider.killaura.speed:OnChanged(function()
	killaura_settings.shoot_delay = slider.killaura.speed.Value
end)

toggle.killaura_target.name_white:OnChanged(function()
	killaura_settings.target.white_names = toggle.killaura_target.name_white.Value
end)

toggle.killaura_target.name_yellow:OnChanged(function()
	killaura_settings.target.yellow_names = toggle.killaura_target.name_yellow.Value
end)

toggle.killaura_target.name_red:OnChanged(function()
	killaura_settings.target.red_names = toggle.killaura_target.name_red.Value
end)

toggle.killaura_target.name_govt:OnChanged(function()
	killaura_settings.target.govt_names = toggle.killaura_target.name_govt.Value
end)

dropdown.killaura_player_whitelist:OnChanged(function()
	killaura_whitelist = dropdown.killaura_player_whitelist.Value
end)

dropdown.killaura_player_blacklist:OnChanged(function()
	killaura_blacklist = dropdown.killaura_player_blacklist.Value
end)

toggle.killaura_on:OnChanged(function()
	rage.killaura = toggle.killaura_on.Value
end)

toggle.killaura_spatial_partitioning:OnChanged(function()
	killaura_settings.cell.always_scanning = toggle.killaura_spatial_partitioning.Value
end)

note:Fire("success", "ran successfully", 5)
