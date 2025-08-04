-- this scripts exists to get a list of roblox globals that arent accessible in the sandbox

-- this script creates a script that prints every roblox global that doesnt have a value in the sandbox

-- usage:
-- - run this script, any lua runtime that supports pairs, and the table library works
-- - run the output of that in deadline's console
-- - copy the outputs to .vscode/settings.json -> luau-lsp.types.disabledGlobals

local default_globals = {
	-- https://create.roblox.com/docs/reference/engine/globals/LuaGlobals
	["lua globals"] = {
		"assert",
		"collectgarbage",
		"error",
		"gcinfo",
		"getfenv",
		"getmetatable",
		"ipairs",
		"loadstring",
		"newproxy",
		"next",
		"pairs",
		"pcall",
		"print",
		"rawequal",
		"rawget",
		"rawlen",
		"rawset",
		"require",
		"select",
		"setfenv",
		"setmetatable",
		"tonumber",
		"tostring",
		"type",
		"unpack",
		"xpcall",
		"_G",
		"_VERSION",
	},

	-- https://create.roblox.com/docs/reference/engine/globals/RobloxGlobals
	["roblox globals"] = {
		"delay",
		"elapsedTime",
		"printidentity",
		"settings",
		"spawn",
		"stats",
		"tick",
		"time",
		"typeof",
		"UserSettings",
		"version",
		"wait",
		"warn",
		"ypcall",
		"Enum",
		"game",
		"plugin",
		"shared",
		"script",
		"workspace",
	},

	-- https://create.roblox.com/docs/reference/engine/datatypes
	["roblox data types"] = {
		"Axes",
		"BrickColor",
		"CatalogSearchParams",
		"CFrame",
		"Color3",
		"ColorSequence",
		"ColorSequenceKeypoint",
		"Content",
		"DateTime",
		"DockWidgetPluginGuiInfo",
		-- "Enum", -- these 3 are used as types, and conflict with the already existing Enum global
		-- "EnumItem",
		-- "Enums",
		"Faces",
		"FloatCurveKey",
		"Font",
		"Instance",
		"NumberRange",
		"NumberSequence",
		"NumberSequenceKeypoint",
		"OverlapParams",
		"Path2DControlPoint",
		"PathWaypoint",
		"PhysicalProperties",
		"Random",
		"Ray",
		"RaycastParams",
		"RaycastResults",
		"RBXScriptConnection",
		"RBXScriptSignal",
		"Rect",
		"Region3",
		"Region3int16",
		"RotationCurveKey",
		"Secret",
		"SecurityCapabilities", -- accessible as a global, isnt in the list provided by roblox?
		"SharedTable",
		"TweenInfo",
		"UDim",
		"UDim2",
		"Vector2",
		"Vector2int16",
		"Vector3",
		"Vector3int16",
	},

	-- https://create.roblox.com/docs/reference/engine/libraries
	["libraries"] = {
		"bit32",
		"buffer",
		"corutine",
		"debug",
		"math",
		"os",
		"string",
		"table",
		"task",
		"utf8",
		"vector",
	},
}


-- generate script

local script = [[
local result = {}

function add_if_not_exist(category, arg, name)
	if arg then
		return
	end
	table.insert(result[category], name)
end

function print_result()
	-- order in a consisten order
	local category_list = {}
	for i, _ in pairs(result) do
		table.insert(category_list, i)
	end
	table.sort(category_list)

	local output = ""
	for _, category in pairs(category_list) do
		local entries = result[category]
		output ..= `		// {category}\n`
		for _, name in pairs(entries) do
			output ..= `		"{name}",\n`
		end
		output ..= "\n"
	end
	print(output)
end

]]

for category, names in pairs(default_globals) do
	script ..= `result["{category}"] = \{}\n`
	for _, name in pairs(names) do
		script ..= `add_if_not_exist("{category}", {name}, "{name}")\n`
	end
	script ..= "\n"
end

script ..= "print_result()"

print(script)
