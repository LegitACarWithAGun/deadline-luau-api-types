

export type camera_controller = {
	new: (get_head_cframe: unknown) -> camera_controller,
	update: (self: camera_controller, delta_time: number) -> unknown,
}
declare register_camera_mode: (name: string, class: camera_controller) -> unknown


declare iris: unknown


declare ui: unknown


declare fire_server: (...any) -> nil


--- player name
declare local_player: string


declare InputType: {
	Began: number,
	Ended: number,
}

declare input: {
	--- equivalent to UserInputService:GetMouseDelta()
	--- https://create.roblox.com/docs/reference/engine/classes/UserInputService#GetMouseDelta
	get_mouse_delta: () -> Vector2,
	--- gets the player's Roblox sensitivity setting
	get_mouse_sensitivity: () -> number,
	--- equivelent to Mouse.Origin
	--- https://create.roblox.com/docs/reference/engine/classes/Mouse#Origin
	get_mouse_origin: () -> CFrame,
	--- equivelent to UserInputService.GetMouseLocation()
	--- https://create.roblox.com/docs/reference/engine/classes/UserInputService#GetMouseLocation
	get_mouse_position: () -> Vector2,

	--- stops the game from listening to the action (ie "crouching")
	disable_default_action: (action_name: string) -> nil,
	--- makes the game listen to the action again
	enable_default_action: (action_name: string) -> nil,
}

-- todo
type ClientInputGroup_methods = {
	bind_user_setting: unknown,
	bind: unknown,
	disconnect_all_binds: unknown,
	constructor: unknown,
	disconnect_bind_by_name: unknown,
	new: () -> ClientInputGroup,
}
type ClientInputGroup = {
	events: unknown,
	key_events: unknown,
} & ClientInputGroup_methods
declare ClientInputGroup: ClientInputGroup_methods

-- todo
type InputGroup_methods = {
	bind_key: unknown,
	constructor: unknown,
	bind: unknown,
	disconnect_all_binds: unknown,
	bind_mouse: unknown,
	disconnect_bind_by_name: unknown,
	new: unknown,
}
type InputGroup = {
	events: unknown,
} & InputGroup_methods
declare InputGroup: InputGroup_methods


declare on_server_event: MicroSignal<...any>


declare framework: {
	on_died: MicroSignal<unknown>,
	character: {
		--- returns nil if you dont have a night scope And dont have your nvgs enabled
		is_nv_enabled: () -> nil | boolean,
		--- returns false even if looking through a night scope
		is_nv_head_gear_enabled: () -> boolean,
		get_camera_cframe: () -> CFrame,

		is_alive: () -> boolean,
		--- errors when not alive
		set_nv_enabled: (enable: boolean) -> nil,
		--- errors when not alive
		get_health: () -> number,
		get_position: () -> Vector3,
	},
	on_spawned: MicroSignal<unknown>,
}


export type settings_row_text = {
	type: "text",
	text: string,
}
export type settings_row_split = {
	type: "split",
}
export type settings_row_small_text = {
	type: "small_text",
	text: string,
}
export type settings_row_setting = {
	type: "setting",
	setting: string,
}
export type settings_row_keybind = {
	type: "keybind",
	keybind: string,
}
export type settings_row_chat_tag = {
	type: "chat_tag",
}
export type settings_row_restore_data = {
	type: "restore_data",
}
export type settings_row_delete_data = {
	type: "delete_data",
}
export type settings_row = settings_row_text | settings_row_split | settings_row_small_text | settings_row_setting | settings_row_keybind |
	settings_row_chat_tag | settings_row_restore_data | settings_row_delete_data

export type material_sounds = {
	[Enum.Material]: {rbxassetid | ""}
}

declare config: {
	gunshots: {
		[string]: rbxassetid,
	},
	--- you Can add new keys to this, but it crashes if you remove any of them (including the one you just added)
	--- you can also add new rows to all of the lists
	settings_layout: {
		[string]: {settings_row},
		general: {settings_row},
		controls: {settings_row},
		graphics: {settings_row},
		colors: {settings_row},
		keybinds: {settings_row},
		accessibility: {settings_row},
		legal: {settings_row},
	},
	keybinds: {
		[string]: {
			name: string,
			description: string,
			default: { {
				input_type: Enum.UserInputType?,
				key_code: Enum.KeyCode?,
			} },
			category: "player" | "menu" | "weapon" | string,
		}
	},
	game_sounds: {
		jump_sounds: material_sounds,
		general_game_sounds: {
			_: unknown,
			grass: unknown,
			glass: unknown,
			sand: unknown,
			water: unknown,
			wood: unknown,
			dirt: unknown,
			plastic: unknown,
			metal: unknown,
			concrete: unknown,
			universal_movement: unknown,
			bullet_cracks: unknown,
			damage_dealt_sounds: unknown,
			head_hits: unknown,
			grenade_pops: unknown,
			magazine_impacts: unknown,
			radio_transmission: unknown,
			bullet_whiz: unknown,
			body_hits: unknown,
			custom: unknown,
			death_hit: unknown,
		},
		walk_sounds: material_sounds,
		crawl_sounds: material_sounds,
		run_sounds: material_sounds,
		materials: {
			[Enum.Material]: {
				sounds: {rbxassetid},
				effect: "dust" | "neonSpecific" | "sparks" | "water" | string,
			},
		},
		to_prone: material_sounds,
		grenade_impacts: material_sounds,
		land_sounds: material_sounds,
		grenade_rattle: material_sounds,
	},
	lighting_presets: lighting_preset,
}