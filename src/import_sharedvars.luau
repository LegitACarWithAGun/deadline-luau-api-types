-- QUADRUPLE CLICK ON THE LONG OUTPUT TO COPY ALL OF IT
-- deadline imposes a limit on the maximum amount of lines a printed message can display
-- clicking on it 4 times circumvents it

type sharedvar_info = {
	name: string,
	type: string,
	description: string,
	default: any,
}

-- NOTICE: read-only is only specified on some of the sharedvars that are treated as read-only 
local READ_ONLY_PATTERN = "READ%-ONLY"

local sharedvar_list: {sharedvar_info} = {}
local sharedvar_existance_map = {}

local insert_sharedvar = function(name: string, type_name: string, description: string, default: any)
	table.insert(sharedvar_list, {
		name = name,
		type = type_name,
		description = description,
		default = sharedvars[name],
	})
	sharedvar_existance_map[name] = true
end

-- expected pattern: (READ-ONLY type) description
-- ie: (number) Player damage multiplier
-- ie: (READ-ONLY string) Game branch
for name, description in sharedvars_descriptions do
    -- description has format '(READ-ONLY? type) description'
	-- this just gets everything inside the brackets
    local type_name = string.match(description, "^%(.-%)")
	if type_name == nil then
		error(`cant get the brackets (and thus type information) from the start of description for {name}: [{description}]`)
	end
    
    -- remove the type info from the description
    description = string.sub(description, #type_name+2)
    -- remove brackets from the type name
    type_name = string.sub(type_name, 2, #type_name-1)

	-- move READ_ONLY from the type name to the description
	local read_only = string.match(type_name, READ_ONLY_PATTERN)
	if read_only then
		type_name = string.sub(type_name, #read_only+2)
		description = `(READ-ONLY) ` .. description
	end

	insert_sharedvar(name, type_name, description)
end

-- add any sharedvars that werent in sharedvars_descriptions
-- user will get warned of them later
-- TODO: currently does nothing, cant loop over sharedvars
local vars_without_type_information: {string} = {}
for name, _value in sharedvars do
	-- check if we already have the sharedvar
	if sharedvar_existance_map[name] then
		continue
	end

	table.insert(vars_without_type_information, name)
	insert_sharedvar(name, "unknown", "N/A")
end

-- sort sharedvars alphabetically so they wont move around every time you reimport them
table.sort(sharedvar_list, function(a: sharedvar_info, b: sharedvar_info): boolean
	return string.lower(a.name) < string.lower(b.name)
end)

-- print sharedvars for usage as types
local main_output = [[-- generated using ./src/import_sharedvars.luau
-- do not manually edit this

declare sharedvars: {
]]
for i, info in sharedvar_list do
	if i ~= 1 then
		main_output ..= "\n"
	end

	main_output ..= `	--- {info.description}\n`
	main_output ..= `	--- Default: {info.default}\n`
	main_output ..= `	{info.name}: {info.type},\n`
end
main_output ..= "}"
print(main_output)

-- make sure the user understands what the last item in the list is
print()
print(`last item in list:`)
warn(sharedvar_list[#sharedvar_list].name)

-- warn user of any sharedvars that dont have good type and description
print("")
if #vars_without_type_information > 0 then
	warn("sharedvars that dont have type information attached: ")
	local warn_output = ""
	for _, name in pairs(vars_without_type_information) do
		warn_output ..= `- {name}\n`
	end
	warn(warn_output)
else
	print("no detected type problems")
end
