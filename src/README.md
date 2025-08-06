# Harpmod source

warning: yap

Writing Harpmod has given me a whole new insight into micro-optimization. 
It has accurately demonstrated a new level of Luau and its inner workings, 
alongside brought a whole new perspective that has forever changed how I write code in my work.

Using Electric State as a playground was a great choice in this case, 
as its anti-exploit systems have holes in them and are flawed. 
The game itself has a few things to keep track of when writing the killaura for example.

You have to keep track of:

1. the player's combat status (pacified, flagged, dangerous,)
2. whether you have a gun out or not,
3. whether the player is in range,
4. whether the player is dead,
5. whether the player can be shot,

and the list keeps going on and on.

The killaura loop is my best work yet; 
running at a max range of 250 and speed of 0, 
MicroProfiler tests show that on low-end hardware, 
the loop runs at about 0.5 ms averages, 
whereas on common mid-range hardware, 
the loop runs at about 0.1 ms averages, 
just about pushing the limit of what your CPU and/or Roblox can do. 

Here's how the source differs from standard Roblox conventions:

## Caching environment values as local upvalues

```lua
local os_clock = os.clock
-- ...
```

This is done so that the script doesn't have to search the environment for `os`, 
and so that the script doesn't have to index `os` with `clock`. 
This is just a pointer to `os.clock`.

While Luau may optimize some global accesses, 
using local references ensures faster access 
and can reduce memory pressure by 
keeping references short-lived.

## Caching players and player characters

```lua
local player_cache = {}
local char_cache = {}
local hrp_cache = {}
local name_color_cache = {}
```

Player caching is done so that the killaura doesn't have to call `GetPlayers` per each frame, 
and check to make sure that each player character has a valid `HumanoidRootPart`, `NameTag`, 
and `NameTag.TextLabel`. No, by default the killaura doesn't run on every frame but more on that later. 

## Extracting metamethods via error stack introspection

In Luau, certain metamethods (`__index`, `__tostring`, `__call`, ...) 
are invoked implicitly during operations on userdata. 
The script uses this to its advantage to dynamically extract 
these metamethods from a given userdata object 
without directly inspecting the metatable 
which could be locked or obfuscated.

This is done using controlled exception handling through `xpcall`, 
which allows introspection of the call stack to 
find the function that was invoked implicitly during an operation. 
Here's what I'm talking about:

```lua
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
```

## What is ins_get?

By extracting the underlying function pointer for a method (like `FindFirstChild`), 
`ins_get` allows you to call the method directly, bypassing the usual metatable and `__namecall` lookup. 
This reduces the number of steps that the Lua VM and Roblox engine have to perform for each call. 
Once the function is extracted, it’s stored in a local variable. 
Local variables in Lua are much faster to access than globals or table fields, 
so repeated calls are significantly faster.

## Event connection and cache invalidation

The script connects to events such as
`PlayerAdded`, `PlayerRemoving`, `CharacterAdded`, `ChildAdded`, ..., 
to maintain up-to-date caches of players, characters, hrp's, and name color tags. 
This ensures that all targeting and automation logic operates on current data, 
minimizing the risk of acting on stale or invalid references.

Cache invalidation is handled immediately on player removal or character respawn, 
preventing memory leaks and logic errors for obvious reasons.

## Micro-optimization and profiling

The script is structured to minimize per-frame allocations, 
avoid unnecessary table creation, and batch expensive operations. 
All hot paths are kept as short as possible, with early returns and minimal branching.

Why do I like optimizing to such an extent? My laptop sucks that's why. 
You can get even better processing times if you have even a 10th gen Intel.

