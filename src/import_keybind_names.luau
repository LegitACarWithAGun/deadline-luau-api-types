-- run this on the client and quadruple click on the output to select all of it
-- then paste the result in ./client/keybind_name.d.luau

local output = [[-- generated using ./src/import_keybind_names.luau
-- do not manually edit this

export type keybind_name =
| string
]]

local internal_names = {}
for id in config.keybinds do
	table.insert(internal_names, id)
end
table.sort(internal_names)

local last_id = ""
for _, id in internal_names do
	local info = config.keybinds[id]
	output ..= `| "{id}" -- {info.name}\n`
	last_id = id
end

print(output)
info(`last name: [{last_id}]`)
