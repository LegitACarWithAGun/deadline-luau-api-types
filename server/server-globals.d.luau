--- PLEASE dont use this
declare set_require_domain: (url_prefix: string) -> nil
declare require: (url: string) -> nil

export type map_config = {
	map: string,
	time: number,
	gamemode: string,
	is_day: boolean,
}

declare map: {
	run_vote: () -> string, --- yields
	get_maps: () -> {string},
	set_time: (hour: number) -> number, --- returns the input?
	kill_map_lights: () -> nil,
	set_preset: (lighting_preset: string) -> nil,
	set_map_from_config: (config: map_config) -> nil, --- yields
	set_map: (map_name: string) -> nil, --- yields
}

--- todo prolly unintentional and unusable
export type gamemode_class = { }

--- https://recoil-group.github.io/deadline-modding/making-mods/scripting/api/#gamemode
declare gamemode: {
	available_gamemodes: {[string]: () -> gamemode_class},
	set_gamemode: unknown, -- hard to use
	force_set_gamemode: (mode_name: string) -> nil, --- yields
	started: Signal<nil>,
	finish: () -> nil,
	finished: Signal<boolean>, --- arg is called avoid_resetting_map
}

declare chat: {
	send_ingame_notification: (message: string) -> nil, --- does not yield
	set_spawning_disabled_reason: (reason: string) -> nil,
	send_announcement: (message: string, color: Color3?) -> nil, --- color doesnt seem to do anything currently
	player_chatted: Signal<string, string, string>, --- player_name, channel, message
}

export type weapon_slot = "primary" | "secondary" | "throwable1" | "throwable2"

export type ammo_data = {
	loose_magazines: {number},
	is_round_chambered_spent: boolean,
	is_round_chambered: boolean,
	type: string, -- todo; detachable_magazine
	rounds_in_magazine: number,
	metadata: {
		magazine_capacity: number,
		magazine_type: string, -- todo; standard
	},
}
export type setup_json = string
export type weapon_data = {
	ammo: ammo_data,
	type: "weapon",
	client_data: {
		setup: setup_json, -- todo same json
		name: string,
		type: "weapon",
		flashlight_enabled: boolean,
		ammo: ammo_data,
		laser_enabled: boolean,
		id: string,
	},
}

export type throwable_data = {
	name: string,
	type: "throwable", -- throwable
}

export type team_id = "attacker" | "defender"

export type player = {
	fire_client: (...any) -> nil,
	kill: () -> nil,
	explode: () -> nil,
	bot: {
		set_behavior: unknown,
		set_move_destination: unknown,
	},
	get_health: () -> number?,
	set_health: (health: number) -> nil,
	get_active_slot: () -> weapon_slot?,
	set_speed: (mult: number) -> nil,
	get_animation_speed: () -> number,
	set_animation_speed: (mult: number) -> nil, -- doesnt apply until you spawn again
	get_position: () -> Vector3?,
	get_weapon_from_loadout: (loadout: number, slot: weapon_slot) -> {
		data: setup_json, -- todo: format for this
		weapon: string,	
	} | string, --- if error, returns a string
	kick: () -> unknown,
	refill_ammo: () -> nil,
	player_id: number,
	get_weapon_data_from_character: weapon_data,
	spawn: () -> unknown, -- seems to return a table with with index 1 being a bool, 2 a string, cant define that tho
	respawn: () -> unknown, -- same return as player.spawn()
	set_weapon: (slot: weapon_slot, weapon: string | "nothing", setup: setup_json | "[]" | nil) -> nil,
	get_team: () -> team_id,
	set_team: (team: team_id) -> nil,
	equip_weapon: (slot: weapon_slot, put_away_instantly: boolean?) -> nil,
	ban_from_server: () -> unknown,
	set_position: (pos: Vector3) -> nil,
	set_model: (name: "orchids_shark_set" | "orchids_pbr_set" | "main" | "main_backup" | "mistake_mistake_set") -> nil,
	id: number,
	set_jump_multiplier: (mult: number) -> nil,
	set_initial_health: (health: number) -> nil,
	set_custom_camera_mode: (name: string) -> unknown,
	set_camera_mode: (mode: "Default" | "Freecam" | "TPerson") -> nil,
	name: string,
	is_bot: () -> boolean,
	is_alive: () -> boolean,
	give_money: unknown,
	get_profile_stats: () -> {
		achievements: {
			is_predemo_tester: boolean,
			is_alpha_tester: boolean,
		},
		player: {
			distance_travelled: number,
			level_rewards_given: unknown,
			total_explosive_kills: number,
			total_kills: number,
			total_penetration_kills: number,
			total_deaths: number,
			total_headshots: number,
			experience: number,
			weapon_use_time: {[string]: number},
			total_points_captured: number,
			total_matches_played: number,
			owned_weapons: {string},
			rounds_fired: number,
		},
		spendings: {
			attachments: number,
			weapons: number,			
		},
		weapon: {[string]: {
			attachment_stats: {[string]: {
				experience: number,
				kills: number,
			}},
			kills: number,
			deaths_with: number,
			experience: number,
			owned_attachments: {string},
			deaths_from: number,
			rounds_fired: number,
			owned_camo: unknown,
		}},			
	},
	get_leaderboard_stats: () -> {
		deaths: number,
		experience: number,
		weapon_use_time: {[string]: number},
		points: number,
		actions: unknown,
		kills: number,	
	},
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


-- todo not 100% on this, surely this is documented somewhere tho
export type sound_preset = {{
	id: string,
	occlude_inside: boolean,
}}

declare config: {
	sound_presets: {[string]: sound_preset},
	weapon_names: {string},
	maps: {
		STUDIO_CONFIGURATION: {[string]: map_config},
		SHOOTING_RANGE_CONFIGURATION: map_config,
		MAP_CONFIGURATION: {[string]: map_config},	
	},
	lighting_presets: {[string]: lighting_preset},
}

-- todo
type memory_signal_methods<T> = {

}

type memory_signal<T> = {
	value: T,
	changed: Signal<T>,
} & memory_signal_methods<T>

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
	lighting: memory_signal<string>, --- lighting preset name
	map_config: memory_signal<map_config>,
	map_code: memory_signal<string>, --- the name you use to load the map
	gamemode_title: memory_signal<string>, --- user-facing gamemode name
}

declare load_modfile: (string) -> unknown
declare on_modfile_loaded: Signal<unknown>

-- todo client networking stuff, not confident its this anyway
declare on_client_event: MicroSignal<(string, ...any)>

-- already reported this
--- melee makes the only field be type
export type killer_data = {
	type: string, --- "firearm", "grenade", "melee"
	name: string?, -- player name, nil with type == "melee"
	distance: string?, -- nil with type == "melee"
	weapon_setup: string?, --- type "grenade" and "melee" leave this nil
	weapon: string?, -- weapon name, nil with type == "melee"
}
declare on_player_died: MicroSignal<string, Vector3, killer_data, boolean> -- player name
declare on_player_left: MicroSignal<string> --- player name
declare on_player_joined: MicroSignal<string> --- player name
declare on_player_spawned: MicroSignal<string> --- player name

export type interactable = {
	new: (instance: luauInstance) -> interactable,
	interact: (self: interactable, player: player) -> nil,
}
declare register_interactable: (attribute: string, class: interactable) -> unknown

-- dont know what this describes
declare is_high_privileged: boolean

-- this module needs a lot more research than what I can currently spend.
-- glhf <3
export type setup_data = {
	data: setup_json,
	version: string, -- game version?
	weapon: string, -- weapon name
}
export type setup = {
	status: "failed" | "_" | string,
	data: "no code" | setup_data
}
export type setup_status = {
	state: {
		broken: boolean,
		sources: unknown,
		reason: string,
	},
	rail_state: {
		sources: unknown,
		failures: unknown,
	},
}
declare weapons: {
	get_setup_from_code: (code: string) -> setup,
	get_setup_status: (data: setup_data) -> setup_status | string,
}

-- player name, see sharedvars.vip_owner, prolly has extra functionality that I cant test rn
declare function_caller: string
