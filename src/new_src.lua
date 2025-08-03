--[[
:troll:
5459982119,7485988593,7141616809,6216526940,5644827120,4899180116,7391765296,7488505563,7044363720 -- fur?
5994725824,5999900363,5833333796,4995609156,5891839311,5699732631,5918270333 --deleted?
66330310,10824058593,13994562389,9959698899,14753582362,14753582362,16930850454,14854926827,99611979328492 --idfk?
7145824116,7145825706,9323462320,11676800530,12581448928,12669543527,13002675302,13479814214,13794250687,14067973844,14124935972 --zaak
17814441976,109552074033966,18613673779,135872614955430,128593425863840,76612888997160,126205541378879,13206455309,120589223050335,15729409885,11788143966,12965267930,136945645973532,136573284940700,114875031523165

113125855719310,127525655322888,140005051270169,95142529401183,11329982793,12887896690,13755077679,15410138203,76702975182371,80369278035394,83943590095074,6507032568 -- need to find pants
8329686,5169172334,9795989643,11608391734,12624719830,13206500917,13388666356,13593572933,14753582362 -- lena gave this
8712093611,8712096002,7394702369,7214160607,4080208424,5765092840,9363116149 -- white?
1365767,494291269,6239388754,14914986902,15410138203,17106982150,17377789513,18943865303,93476707243800,98635691061608,106678253654168,132807754522097 -- lena too
]]

local rage = {
	killaura = true,
	aimbot = false,
	auto_reload = true,
	auto_modder = false,
	auto_cola = false, -- for normal ones
	cola_god = false, -- for mythic one
}

local legit = {
	autobuy = true,
	max_hunger = true,
}

local killaura_settings = {
	target = {
		white_names = false,
		yellow_names = true,
		red_names = true,
		govt_workers = false, -- TODO: this is not a be all end all solution! Government workers can still be off duty.
	},
	ray_beam = {
		enabled = true,
		animated = true,
	},
	radius = 200,
	last_kill_time = 0,
	shoot_delay = 0.045,
	last_target_index = 1,
	shoot_amount = 5,
}

local reload_settings = {
	last_reload_time = 0,
	reload_delay = 0, -- s
}

local transparency = {
	killaura = {
		idfk = 0.5,
	},
}

local bounty = {
	target = nil,
	target_silently = false,
	max_price = 1000,
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
local tick = tick
local os_clock = os.clock
local math_random = math.random
local math_clamp = math.clamp
local math_ceil = math.ceil
local math_floor = math.floor
local math_abs = math.abs
local math_lerp = math.lerp -- selene and/or the luau lsp don't know that math.lerp has existed for the past 5 months, why the fuck are you guys asleep?
local string_char = string.char
local coroutine_wrap = coroutine.wrap
local v3int16 = Vector3int16
local v2 = Vector2.new
local task_wait = task.wait
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
local angles = CFrame.fromEulerAngles
local cframe = CFrame.new


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

local ins_set = get_metamethod_from_error_stack(game, function(a, b, c)
	a[b] = c
end, function(f)
	local a = instance("Folder")
	local b = random_string()
	f(a, "Name", b)
	return a.Name == b
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

local camera = ins_get(svc.ws, "CurrentCamera")

local get_players = ins_get(svc.players, "GetPlayers")
local is_a = ins_get(game, "IsA")
local raycast = ins_get(svc.ws, "Raycast")
local heartbeat = ins_get(svc.run, "Heartbeat")
local connect = heartbeat.Connect
local get_property_changed_signal = ins_get(game, "GetPropertyChangedSignal")
local get_children = ins_get(game, "GetChildren")
local find_first_child = ins_get(game, "FindFirstChild")
local descendants = ins_get(game, "GetDescendants")
local world_to_viewport_point = ins_get(camera, "WorldToViewportPoint")

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
local v3_lerp = function(a, b, t)
	return vector3(math_lerp(a.X, b.X, t), math_lerp(a.Y, b.Y, t), math_lerp(a.Z, b.Z, t))
end

local wait_for_child = function(parent, instance)
	for _, v in get_children(parent) do
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
for _, gun in modded_gun_data do
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


local function world_to_screen(pos)
	local screen_pos, on_screen = world_to_viewport_point(camera, pos)
	return v2(screen_pos.X, screen_pos.Y), on_screen
end

local function draw_ray_line(origin, final, color, transparency)
	if not killaura_settings.ray_beam.enabled then
		return
	end
	debug_profilebegin("harpmod.draw_ray_line")
	coroutine_wrap(function()
		local start_2d, on_screen_1 = world_to_screen(origin)
		local end_2d, on_screen_2 = world_to_screen(final)
		if not (on_screen_1 and on_screen_2) then
			return
		end
		local line = Drawing.new("Line")
		line.From = start_2d
		line.To = end_2d
		line.Color = color
		line.Thickness = 2
		line.Transparency = transparency or 1
		line.Visible = true
		if killaura_settings.ray_beam.animated then
			local duration = 0.5
			local start_time = os_clock()
			while true do
				local now = os_clock()
				local elapsed = now - start_time
				local alpha = math_clamp(elapsed / duration, 0, 1)
				line.Transparency = (transparency or 1) * (1 - alpha)
				if alpha >= 1 then
					break
				end
				local s, o1 = world_to_screen(origin)
				local e, o2 = world_to_screen(final)
				if o1 and o2 then
					line.From = s
					line.To = e
				else
					break
				end
				task_wait()
			end
		else
			task_wait(0.1)
		end
		line:Remove()
	end)()

	debug_profileend()
end
local ray_params = raycast_params()
ray_params.FilterType = enum.RaycastFilterType.Exclude
ray_params.IgnoreWater = true

local cast_ray = function(origin, final)
	debug_profilebegin("harpmod.cast_ray")
	debug_profilebegin("setting properties")
	local exclude = { local_player.Character, workspace.Vehicles }
	local direction = (final - origin)
	ray_params.FilterDescendantsInstances = exclude
	debug_profileend()
	debug_profilebegin("raycast")
	local result = raycast(svc.ws, origin, direction, ray_params)
	debug_profileend()
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
	for ammo_category, gun_list in gun do
		for _, name in gun_list do
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
		and find_first_child(player.Character, "NameTag")
		and find_first_child(player.Character.NameTag, "TextLabel")
	return (label and label.TextColor3) or name_color.white
end

local get_player_name_key = function(player)
	local col = get_player_name_color(player)
	for key, color_val in name_color do
		if color_val == col then
			return key
		end
	end
	return "white"
end

for gun_name, data in modded_gun do
	data.ammo_type = get_ammo_type(gun_name)
end

local is_gun = function(tool)
	if not tool then
		return
	end
	local handle = find_first_child(tool, "Handle")
	if not handle then
		return
	end
	local has_fire = find_first_child(handle, "Fire")
	local has_reload = find_first_child(handle, "Reload")
	if not has_fire and not has_reload then
		return false
	end
	return true
end

local target_bounty = function()
	for _, v in get_players(svc.players) do
		if find_first_child(svc.players, bounty.target) then
			if bounty.silent_target then
				return
			end
		end
		if v.TargetBounty.HirePrice.Value <= bounty.max_price then
			local args = {
				15,
				v,
				find_first_child(svc.players, bounty.target),
			}
			game_event.menu_action:FireServer(unpack(args))
		else
			warn("price was too large, expected ", bounty.max_price, " or less, got " .. v.TargetBounty.HirePrice.Value)
		end
	end
end

local modify_gun = function(old_gun, new_gun_name, ammo_type, gun_sound, spread, fire_rate, anim_type)
	if rage.auto_modder ~= true then
		note:Fire("mod " .. old_gun, "Make sure to have your " .. old_gun .. " unequipped", 5)
	end
	local gun = local_player.Backpack:FindFirstChild("old_gun")
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
	get_nearby_targets = function()
		debug_profilebegin("harpmod.killaura_func.get_nearby_targets")
		debug_profilebegin("check local_char_and_hrp")
		local my_char = ins_get(local_player, "Character")
		if not my_char then
			return {}
		end
		local my_hrp = find_first_child(my_char, "HumanoidRootPart")
		if not my_hrp then
			return {}
		end
		debug_profileend()
		local targets = {}
		for _, player in get_players(svc.players) do
			debug_profilebegin("player_" .. player.Name)
			if player == local_player then
				debug_profileend()
				continue
			end
			local player_char = ins_get(player, "Character")
			if not player_char then
				debug_profileend()
				continue
			end
			local hrp = find_first_child(player_char, "HumanoidRootPart")
			if not hrp then
				debug_profileend()
				continue
			end
			if killaura_whitelist[player.Name] then
				debug_profileend()
				continue
			end
			debug_profilebegin("check name")
			local name_key = get_player_name_key(player)
			local is_allowed_color = killaura_settings.target[name_key .. "_names"]
			debug_profileend()
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
	local char = ins_get(local_player, "Character")
	local tool = find_first_child_of_class(char, "Tool")
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
	local now = os_clock()
	if now - reload_settings.last_reload_time < reload_settings.reload_delay then
		return
	end
	local char = ins_get(local_player, "Character")
	local tool = find_first_child_of_class(char, "Tool")
	if tool then
		if is_gun(tool) then
			game_event.reload_action:FireServer(get_ammo_type(tool.Name), amount, tool)
			reload_settings.last_reload_time = now
		end
	end
end
local on_heartbeat = {
	killaura = function()
		if rage.killaura == true then
			debug_profilebegin("harpmod.on_heartbeat.killaura")
			local char = ins_get(local_player, "Character")
			local hrp = find_first_child(char, "HumanoidRootPart")
			local get_pos = cf_get(hrp.CFrame, "Position")
			if os_clock() - killaura_settings.last_kill_time > killaura_settings.shoot_delay then
				killaura_settings.last_kill_time = os_clock()
				task_spawn(function()
					local targets = killaura_func.get_nearby_targets()
					if #targets > 0 then
						local total_targets = #targets
						for _ = 1, total_targets do
							killaura_settings.last_target_index = killaura_settings.last_target_index + 1
							if killaura_settings.last_target_index > total_targets then
								killaura_settings.last_target_index = 1
							end
							local target = targets[killaura_settings.last_target_index]
							local pos = target.part.Position
							local hum = find_first_child(target.part.Parent, "Humanoid")
							if cast_ray(get_pos, pos) then
								reload_gun(30)
								for _ = 1, killaura_settings.shoot_amount do
									shoot_gun(pos.X, pos.Y, pos.Z, hum)
								end
								break
							end
						end
					end
				end)
			end
			debug_profileend()
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
			reload_gun(10)
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

for _, ammo_name in ammo_type do
	local ammo_stat = find_first_child(player_data, ammo_name)
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

connect(local_player.Backpack.ChildAdded, function(child) -- TODO: this is unreliable
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

connect(heartbeat, function()
	debug_profilebegin("harpmod.heartbeat")
	for _, v in on_heartbeat do
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
	MenuFadeTime = 0.1,
})

local tab = {
	main = window:AddTab("Main"),
	killaura = window:AddTab("Killaura"),
	bounty_targeter = window:AddTab("Bounty Targeter"),
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
		visuals = tab.killaura:AddLeftGroupbox("Visuals"),
	},
	rage = {
		toggles = tab.killaura:AddLeftGroupbox("Misc"),
	},
	bounty_targeter = {
		stats = tab.bounty_targeter:AddLeftGroupbox("Stats"),
		target = tab.bounty_targeter:AddRightGroupbox("Target"),
	},
	modder = {
		stat_maker = tab.gun_modder:AddLeftGroupbox("Stats"),
		processor = tab.gun_modder:AddRightGroupbox("Name & Build"),
	},
}
--[[
local button = {
	bounty_targeter = {
		target = groupbox.bounty_targeter.target:AddButton("target", {
			Text = "Target player",
			Tooltip = "Hires everyone in the server.",
			Func = function()
				target_bounty()
			end,
			[[
		}),
	},
}
]]
local slider = {
	killaura = {
		range = groupbox.killaura.sliders:AddSlider("killaura_range", {
			Text = "Range",
			Tooltip = "Killaura will not target anyone past this range. Max limit as defined by serverside checks.",
			Default = killaura_settings.radius,
			Min = 1,
			Max = 250,
			Rounding = 1,
			Compact = false,
		}),
		speed = groupbox.killaura.sliders:AddSlider("killaura_speed", {
			Text = "Speed",
			Tooltip = "Set to 0 if using a rem or bfist for maximum epic.",
			Default = killaura_settings.shoot_delay,
			Min = 0,
			Max = 1,
			Rounding = 5,
			Compact = false,
		}),
		amount = groupbox.killaura.sliders:AddSlider("killaura_fire_amount", {
			Text = "Amount",
			Tooltip = "Only makes sense to use with rems and bfists. Set to 1 if using any other gun.",
			Default = killaura_settings.shoot_amount,
			Min = 1,
			Max = 50,
			Rounding = 0, -- fuck if i know how the rounding works in linoria
			Compact = false,
		}),
		-- fuck this
		lab = groupbox.killaura.sliders:AddLabel(
			[[
		At 120 FPS, targeting a single player,
		killaura will execute 120 * Amount attacks per second.
		This occurs regardless of server-side conditions,
		including weapon type restrictions (e.g. Remington, Bfist).
		If Amount is set to 2 it'll fire 240 times per second.
	]],
			true
		),
	},
	bounty_targeter = {
		max_price = groupbox.bounty_targeter.stats:AddSlider("max_price", {
			Text = "Max Price",
			Default = bounty.max_price,
			Min = 1000,
			Max = 30000,
			Rounding = 1,
			Compact = false,
			Tooltip = "Will not hire people if their bounty price is set above this threshold.",
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
	bounty_target = groupbox.bounty_targeter.target:AddDropdown("player_target", {
		SpecialType = "Player",
		Text = "Target",
		Tooltip = "Set the player to be targeted.",
	}),
}

local toggle = {
	profiling_on = groupbox.main.debug:AddToggle("microprofiler_labels_on", {
		Text = "Profiling",
		Default = profiling_enabled,
		Tooltip = "Toggles label profiling for use in MicroProfiler. Disable if you don't know what that means.",
	}),
	bounty_targeter_silent_target = groupbox.bounty_targeter.stats:AddToggle("bounty_targeter_silent_target", {
		Text = "Silent Target",
		Default = bounty.silent_target,
		Tooltip = "Will not hire the target themselves.",
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
	}), -- un PargbmGagoK7I($Vt4$Ohj@V7YS5X8%B HI_b61eb75b-668a-4463-9580-b472bacbd749
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
	killaura_ray_beam_on = groupbox.killaura.visuals:AddToggle("killaura_ray_beam_enabled", {
		Text = "Raycast Beam",
		Default = killaura_settings.ray_beam.enabled,
		Tooltip = "Adds a visual tracer of where your targets are. Disable to improve performance.",
	}),
	killaura_ray_beam_animated = groupbox.killaura.visuals:AddToggle("killaura_ray_beam_animated", {
		Text = "Animated",
		Default = killaura_settings.ray_beam.animated,
		Tooltip = "Animates the visual tracer. Disable to improve performance.",
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
toggle.killaura_ray_beam_on:OnChanged(function()
	killaura_settings.ray_beam.enabled = toggle.killaura_ray_beam_on.Value
end)
toggle.killaura_ray_beam_animated:OnChanged(function()
	killaura_settings.ray_beam.animated = toggle.killaura_ray_beam_animated.Value
end)

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
slider.killaura.amount:OnChanged(function()
	killaura_settings.shoot_amount = slider.killaura.amount.Value
end)
slider.bounty_targeter.max_price:OnChanged(function()
	bounty.max_price = slider.bounty_targeter.max_price.Value
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

toggle.bounty_targeter_silent_target:OnChanged(function()
	bounty.silent_target = toggle.bounty_targeter_silent_target.Value
end)

note:Fire("success", "ran successfully", 5)
