--- PLEASE dont use this
declare set_require_domain: (url_prefix: string) -> nil

-- todo
export type map_preset = {
	
}

declare map: {
	run_vote: () -> string, --- yields
	get_maps: () -> {string},
	set_time: (hour: number) -> number, --- returns the input?
	kill_map_lights: () -> nil,
	set_preset: (preset_name: string) -> nil,
	set_map_from_config: (map_preset) -> nil, --- yields
	set_map: (map_name: string) -> nil, --- yields
}

--- todo prolly unintentional and unusable
export type gamemode_class = { }

--- https://recoil-group.github.io/deadline-modding/making-mods/scripting/api/#gamemode
declare gamemode: {
	available_gamemodes: {[string]: () -> gamemode_class},
	set_gamemode: unknown, -- hard to use
	force_set_gamemode: (mode_name: string) -> nil, --- yields
	started: event<nil>,
	finish: () -> nil,
	finished: event<boolean>, --- arg is called avoid_resetting_map
}

declare chat: {
	send_ingame_notification: (message: string) -> nil, --- does not yield
	set_spawning_disabled_reason: (reason: string) -> nil,
	send_announcement: (message: string, color: Color3?) -> nil, --- color doesnt seem to do anything currently
	player_chatted: event<string, string, string>, --- player_name, channel, message
}

-- todo
export type player = {

}

declare players: {
	get_all: () -> {player},
	reset_ragdolls: () -> nil,
	get_alive: () -> {player},
	get_by_userid: (userid: number) -> player?,
	get: (name: string) -> player?,
}

declare spawning: {
	monster: () -> string,
	bot: () -> string, --- returns the name of the bot
	explosion: (position: Vector3) -> nil,
}

-- todo
export type sound_preset = {

}

-- todo
export type lighting_preset = {

}

declare config: {
	sound_presets: {[string]: sound_preset},
	weapon_names: {string},
	maps: {
		STUDIO_CONFIGURATION: unknown,
		SHOOTING_RANGE_CONFIGURATION: unknown,
		MAP_CONFIGURATION: unknown,	
	},
	lighting_presets: {[string]: lighting_preset},
}

-- todo
type memory_signal_methods<T>: {

}

type memory_signal<T>: {
	value: T,
	changed: event<T>,
} & memory_signal_methods

declare game_data: {
	map_properties: memory_signal<{
		description: string,
		code: string,
		minimap: {
			size: number,
			image: string, --- roblox asset id
		},
		sound_preset: string,
		name: string,
		location: string,
		lamps: {
			on_time: number,
			off_time: number,
		},
		lighting_preset: string,
		images: {
			thumbnail_night: string, --- roblox asset id
			thumbnail_day: string, --- roblox asset id
		},
	}>,
	gamemode: memory_signal<string>, --- weird behavior that I need to make a bug report about
	map_loaded: memory_signal<boolean>,
	lighting: memory_signal<string>, --- preset name
	map_config: memory_signal<{
		map: string,
		time: number,
		gamemode: string,
		is_day: boolean,
	}>,
	map_code: memory_signal<string>, --- the name you use to load the map
	gamemode_title: memory_signal<string>, --- user-facing gamemode name
}

declare load_modfile: (string) -> unknown
declare on_modfile_loaded: event<unknown>

-- todo client networking stuff, not confident its this anyway
declare on_client_event: event<string, any...>

export type interactable = {
	new: (instance: luauInstance) -> interactable,
	interact: (self: interactable, player: player) -> nil,
}
declare register_interactable: (attribute: string, class: interactable)
