-- this scripts exists to get a list of roblox globals that arent accessible in the sandbox
-- creates a script that prints every roblox global that doesnt have a value in the sandbox

-- usage:
-- 1. run this script, any lua runtime that supports the `pairs` function and the table library works
-- 2. run the output of that in Either deadline console
-- 3. copy the output to .vscode/settings.json -> luau-lsp.types.disabledGlobals

local default_globals = {
	-- https://create.roblox.com/docs/reference/engine/globals/LuaGlobals
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

	-- https://create.roblox.com/docs/reference/engine/globals/RobloxGlobals
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

	-- https://create.roblox.com/docs/reference/engine/datatypes
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

	-- https://create.roblox.com/docs/reference/engine/libraries
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
}

-- generate script

local script = [[
local disabled_globals = {}

function add_if_not_exist(arg, name)
	if arg then
		return
	end
	table.insert(disabled_globals, name)
end

function print_result()
	table.sort(disabled_globals)

	local output = ""
	for _, name in pairs(disabled_globals) do
		output ..= `		"{name}",\n`
	end
	print(output)
end

]]

for _, name in pairs(default_globals) do
	script ..= `add_if_not_exist({name}, "{name}")\n`
end

script ..= "print_result()"

print(script)
