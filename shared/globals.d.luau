-- remember to reload the window after changing this

-- refer to export/sharedvars.luau for the full list of sharedvars
declare sharedvars_descriptions: {[string]: string}

-- Timer class + global
type Timer_methods = {
	reset: (self: Timer) -> nil,
	expired: (self: Timer) -> boolean,
	expire: (self: Timer) -> nil, -- todo
	new: (length: number?) -> Timer,
}
export type Timer = {
	timeout: number,
	next_time: number,
} & Timer_methods
declare Timer: Timer_methods

-- Spring class + global
type Spring_methods = {
	update: (self: Spring, delta_time: number) -> nil,
	shove: (self: Spring, direction: Vector3) -> nil,
	new: (mass: number?, force: number?, damping: number?, speed: number?) -> Spring,
}
export type Spring = {
	mass: number, -- 0.8
	force: number, -- 40
	damping: number, -- 6
	speed: number, -- 1.9
	position: Vector3,
	target: Vector3,
	velocity: Vector3,
} & Spring_methods
declare Spring: Spring_methods

export type signal_connection = {} -- todo
export type Signal<args...> = {
	-- todo on all of these
	_head: boolean,
	DisconnectAll: unknown, -- cant get this to not error?
	is: unknown,
	wrap: unknown, -- no idea what this would even be for
	Connect: (self: Signal<args...>, callback: (args...) -> nil) -> signal_connection,
	Destroy: unknown,
	Fire: unknown,
	Wait: unknown,
	Once: (self: Signal<args...>, callback: (args...) -> nil) -> unknown, -- presumably?
	new: () -> Signal<args...>,
}
declare Signal: {
	is: unknown,
	wrap: unknown,
	new: <args...>() -> Signal<args...>,
}

declare time: {
	renderstep: (label: string, callback: (delta_time: number) -> nil) -> signal_connection,
	heartbeat: (label: string, callback: (delta_time: number) -> nil) -> signal_connection,
	update_heartbeat: (delta_time: number) -> nil,
	wait: (length: number) -> boolean, --- always returns true, idk why
	delay: (seconds: number, () -> nil) -> nil,
	get_time: () -> number,
	get_synced_time: () -> number,
	play_sound: (object: Sound) -> unknown, -- errors currently, because it cant access .Play
	get_speed: () -> number,
	set_local_timescale: (timescale: number) -> nil, --- seems to only change the ui speed, no gameplay changes
	local_timescale_changed: Signal<nil>, --- I checked any it really doesnt get any args
}

-- prints as luauInstance(INSTANCE_NAME), just stealing that
export type luauInstance = {
	play: () -> nil,
	stop: () -> nil,
	add_tag: (string) -> nil,
	get_tags: () -> {string},
	remove_tag: (string) -> nil,
	set_attribute: (name: string, value: any) -> nil,
	get_attribute: (name: string) -> any,
	destroy: () -> nil,
	get_pivot: () -> CFrame,
	pivot_to: (CFrame) -> nil,
	is_in_workspace: boolean,
	find_first_child: (name: string) -> luauInstance,
	is_a: (object_class: string) -> boolean,
	is_descendant_of: (object: luauInstance) -> boolean,
	get_descendants: () -> {luauInstance},
	get_children: () -> {luauInstance},
	clone: () -> luauInstance,
	__secure_get_owner: (unknown) -> unknown, -- errors as `post-opcode sandbox escape detected`, glhf <3
	Parent: luauInstance,
	Name: string,


	-- TODO
	-- properties that depend on the type of instance
	-- you also do not have access to every property and method.
	Volume: number?, -- only on sound objects
	apply_impulse_at_position: nil | (impulse: Vector3, position: Vector3) -> nil,
	apply_angular_impulse_at_position: nil | (impulse: Vector3, position: Vector3) -> nil,
	apply_impulse: nil | (impulse: Vector3) -> nil,
	set_network_owner: nil | (player: string) -> nil,
	-- get_primary_part: () -> luauInstance?, -- whered I get this one from?
}

declare create_instance: (instance_name: string) -> luauInstance

declare sound: {
	play_sick_riff: () -> nil,
	create: () -> luauInstance
}
declare get_map_root: () -> luauInstance
declare get_chars_root: () -> luauInstance
declare clear_console: () -> nil

declare tags: {
	get_tags: () -> {string},
	get_tagged: (string) -> {luauInstance},
	get_all_tagged: (string) -> {luauInstance},
}

export type raycast_params = {
	filter_descendants_instances: ({luauInstance}) -> nil,
	collision_group: (name: string) -> nil,
	filter_type: (filter: Enum.RaycastFilterType) -> nil,
	add_to_filter: (list: luauInstance | {luauInstance}) -> nil, 
	ignore_water: (boolean) -> nil, --- cant confirm the input currently
	respect_can_collide: (boolean) -> nil, --- cant confirm the input currently
	brute_force: (boolean) -> nil, --- cant confirm the input currently
	__NOMINAL: string, -- always "luauRaycastParams". If I had to guess, its prolly a class identifier
	__secure_get_owner: () -> RaycastParams,
}
export type raycast_result = {
	normal: Vector3,
	position: Vector3,
	instance: luauInstance,
	distance: number,
	material: Enum.Material,
}
declare query: {
	create_raycast_params: () -> raycast_params,
	-- not super confident in all of these, since I cant properly test these
	raycast: (origin: Vector3, direction: Vector3, params: raycast_params) -> raycast_result?,
	shapecast: (part: luauInstance, direction: Vector3, params: raycast_params) -> raycast_result?,
	spherecast: (position: Vector3, radius: number, direction: Vector3, params: raycast_params) -> raycast_result?,
	blockcast: (cframe: CFrame, size: Vector3, direction: Vector3, params: raycast_params) -> raycast_result,
}
