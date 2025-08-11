
local next = next
local pcall = pcall
local xpcall = xpcall
local type = type
local typeof = typeof
local game = game
local tick = tick
local math_random = math.random
local string_char = string.char

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

local get_metamethod_from_error_stack = function(userdata, f, test)
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

local svc = {
	players = find_first_child_of_class(game, "Players"),
	rs = find_first_child_of_class(game, "ReplicatedStorage"),
	debris = find_first_child_of_class(game, "Debris"),
	run = find_first_child_of_class(game, "RunService"),
	tween = find_first_child_of_class(game, "TweenService"),
	ws = find_first_child_of_class(game, "Workspace"),
}

print(svc.players.LocalPlayer.Name)