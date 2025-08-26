-- run this on the client and quadruple click on the output to select all of it
-- then paste the result in ./client/keybind_name.d.luau

local output = [[-- generated using ./src/import_keybind_names.luau
-- do not manually edit this

export type keybind_name =
| string
]]

local last_id = ""
for id, info in pairs(config.keybinds) do
	output ..= `| "{id}" -- {info.name}\n`
	last_id = id
end

print(output)
info(`last name: [{last_id}]`)
