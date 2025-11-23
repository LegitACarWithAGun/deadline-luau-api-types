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
	--- default: 0.8
	mass: number,
	--- default: 40
	force: number,
	--- default: 6
	damping: number,
	--- default: 1.9
	speed: number,
	position: Vector3,
	target: Vector3,
	velocity: Vector3,
} & Spring_methods
declare Spring: Spring_methods

--- todo: proper typing for this
export type Signal<args...> = {
	_head: boolean,
	--- todo: cant get this to not error
	DisconnectAll: unknown,
	is: unknown,
	--- dont know what this is for
	wrap: unknown,
	Connect: (self: Signal<args...>, callback: (args...) -> nil) -> RBXScriptConnection,
	Destroy: unknown,
	Fire: unknown,
	Wait: unknown,
	--- not super confident in the signature for this
	Once: (self: Signal<args...>, callback: (args...) -> nil) -> unknown,
	new: () -> Signal<args...>,
}
declare Signal: {
	is: unknown,
	wrap: unknown,
	new: <args...>() -> Signal<args...>,
}

-- idk why deadline has multiple signal types
export type MicroSignal_connection = {
	_fn: unknown,
	Connected: boolean,
	_signal: unknown,
	_varargs: boolean,
	_prev: boolean,
	_next: unknown,

	-- meta
	Destroy: unknown,
	Reconnect: unknown,
	__index: unknown,
	Disconnect: unknown,
}
export type MicroSignal<args...> = {
	Connect: (self: MicroSignal<args...>, callback: (args...) -> nil) -> MicroSignal_connection
}

declare time: {
	renderstep: (label: string, callback: (delta_time: number) -> nil) -> RBXScriptConnection,
	heartbeat: (label: string, callback: (delta_time: number) -> nil) -> RBXScriptConnection,
	update_heartbeat: (delta_time: number) -> nil,
	--- always returns true, idk why
	wait: (length: number) -> boolean,
	delay: (seconds: number, () -> nil) -> nil,
	get_time: () -> number,
	get_synced_time: () -> number,
	--- errors currently, because it cant access .Play
	play_sound: (object: Sound) -> unknown,
	get_speed: () -> number,
	--- seems to only change the ui speed, no gameplay changes
	set_local_timescale: (timescale: number) -> nil,
	--- seemingly doesnt get args
	local_timescale_changed: Signal<nil>,
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
	--- errors as `post-opcode sandbox escape detected`, glhf <3
	__secure_get_owner: (unknown) -> unknown,
	Parent: luauInstance,
	Name: string,


	-- TODO
	-- properties that depend on the type of instance
	-- you also do not have access to every property and method.
	--- only on sound objects
	Volume: number?,
	apply_impulse_at_position: nil | (impulse: Vector3, position: Vector3) -> nil,
	apply_angular_impulse_at_position: nil | (impulse: Vector3, position: Vector3) -> nil,
	apply_impulse: nil | (impulse: Vector3) -> nil,
	set_network_owner: nil | (player: string) -> nil,
	-- get_primary_part: () -> luauInstance?, -- idk where I got this one from?
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
	--- cant confirm the input currently
	ignore_water: (boolean) -> nil,
	--- cant confirm the input currently
	respect_can_collide: (boolean) -> nil,
	--- cant confirm the input currently
	brute_force: (boolean) -> nil,
	--- always "luauRaycastParams". If I had to guess, its prolly a class identifier
	__NOMINAL: string,
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
	--- not super confident in the signature for these
	raycast: (origin: Vector3, direction: Vector3, params: raycast_params) -> raycast_result?,
	--- not super confident in the signature for these
	shapecast: (part: luauInstance, direction: Vector3, params: raycast_params) -> raycast_result?,
	--- not super confident in the signature for these
	spherecast: (position: Vector3, radius: number, direction: Vector3, params: raycast_params) -> raycast_result?,
	--- not super confident in the signature for these
	blockcast: (cframe: CFrame, size: Vector3, direction: Vector3, params: raycast_params) -> raycast_result,
}

declare is_studio: () -> boolean
declare is_private_server: () -> boolean

--- a blue version of print/warn
declare info: (...any) -> nil 

--- dont know what this does, neither on the client or the server
declare output_trace: (unknown) -> unknown