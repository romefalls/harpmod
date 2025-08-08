
local use_local_files = true -- true means read from disk, false means read from repo
local local_modules_path = "C:/Users/linar/OneDrive/Dokumenti/GitHub/harpmod/src/mod/" -- this is just for me
local github_raw_base_url = "https://raw.githubusercontent.com/your_name/your_repo/main/src/modules/" 

local auto_boot_main = false
local entry_module_name = "main" 

-- modloader
local mod_loader = {
	cache = {},
	base_path = nil,
	base_url = "",
	no_cache = false,
}

function mod_loader.set_base_path(path)
	if not path or path == "" then
		mod_loader.base_path = nil
		return
	end
	local last = path:sub(-1)
	if last ~= "/" and last ~= "\\" then
		path = path .. "/"
	end
	mod_loader.base_path = path
end

function mod_loader.set_base_url(url)
	if not url or url == "" then
		mod_loader.base_url = ""
		return
	end
	mod_loader.base_url = url:match("/$") and url or (url .. "/")
end

local function name_to_paths(name)
	local rel = name:gsub("%.", "/")
	return rel .. ".luau", rel .. ".lua"
end

local function try_read_file(full_path)
	if readfile then
		local ok, data = pcall(function()
			return readfile(full_path)
		end)
		if ok and type(data) == "string" and #data > 0 then
			return data
		end
	end
	return nil
end

local function http_try(url)
	local req = http_request or request or httprequest
	if req then
		local r = req({ Url = url, Method = "GET" })
		local code = r.StatusCode or r.status_code or r.Status or r.status
		if code == 200 then
			return r.Body or r.body or r.Text or r.text or ""
		end
	end
	local ok, body = pcall(function()
		if game and game.HttpGet then
			return game:HttpGet(url)
		end
		return game:GetService("HttpService"):GetAsync(url)
	end)
	if ok and type(body) == "string" and #body > 0 then
		return body
	end
	return nil
end

function mod_loader.import(name)
	local cached = mod_loader.cache[name]
	if cached then
		return cached
	end

	local rel_luau, rel_lua = name_to_paths(name)
	local src

	if mod_loader.base_path then
		src = try_read_file(mod_loader.base_path .. rel_luau) or try_read_file(mod_loader.base_path .. rel_lua)
	end

	if not src and mod_loader.base_url ~= "" then
		local function with_buster(rel)
			local url = mod_loader.base_url .. rel
			if mod_loader.no_cache then
				url = url .. (url:find("?", 1, true) and "&" or "?") .. "_=" .. tostring(os.clock())
			end
			return url
		end
		src = http_try(with_buster(rel_luau)) or http_try(with_buster(rel_lua))
	end

	assert(type(src) == "string" and #src > 0, "module not found: " .. tostring(name))

	local fn, err = loadstring(src, "=" .. name)
	assert(fn, "compile error in " .. name .. ": " .. tostring(err))
	local ok, mod_or_err = pcall(fn)
	assert(ok, "runtime error in " .. name .. ": " .. tostring(mod_or_err))
	mod_loader.cache[name] = mod_or_err
	return mod_or_err
end

function mod_loader.reload(name)
	mod_loader.cache[name] = nil
	return mod_loader.import(name)
end

---
local env = (getgenv and getgenv()) or _G
env.import = function(name)
	return mod_loader.import(name)
end
rawset(env, "mod_loader", mod_loader)

if use_local_files then
	mod_loader.set_base_path(local_modules_path)
	mod_loader.set_base_url(github_raw_base_url)
	mod_loader.no_cache = false
else
	mod_loader.set_base_path(nil)
	mod_loader.set_base_url(github_raw_base_url)
	mod_loader.no_cache = true
end

if auto_boot_main then
	local ok, main_mod = pcall(function()
		return import(entry_module_name)
	end)
	if ok and main_mod then
		if type(main_mod) == "function" then
			pcall(main_mod)
		elseif type(main_mod) == "table" and type(main_mod.init) == "function" then
			pcall(main_mod.init, main_mod)
		end
	end
end
