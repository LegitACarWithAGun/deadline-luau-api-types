-- remember to reload the window after changing this
-- todo: figure out under what global the event class is stored as

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

export type event_connection = {} -- todo
export type event_methods<i...> = {
	-- todo on all of these
	DisconnectAll: unknown, -- cant get this to not error?
	is: (unknown) -> boolean,
	wrap: unknown, -- no idea what this would even be for
	Connect: (callback: (i...) -> nil) -> event_connection,
	Destroy: unknown,
	Fire: unknown,
	Wait: unknown,
	Once: (callback: (i...) -> nil) -> unknown, -- presumably?
}

declare time: {
	renderstep: (label: string, callback: (delta_time: number) -> nil) -> event_connection,
	heartbeat: (label: string, callback: (delta_time: number) -> nil) -> event_connection,
	update_heartbeat: (delta_time: number) -> unknown,
	wait: (length: number) -> unknown,
	delay: (seconds: number, () -> nil) -> unknown,
	get_time: () -> number,
	get_synced_time: () -> number,
	play_sound: (object: Sound) -> unknown, -- fairly confident this is it
	get_speed: () -> number,
	set_local_timescale: (timescale: number) -> unknown,
	local_timescale_changed: unknown,
}

-- print returns as luauInstance(INSTANCE_NAME), just stealing that
-- todo check these
export type luauInstance = {
	play: (unknown) -> unknown,
	stop: (unknown) -> unknown,
	add_tag: (string) -> unknown,
	get_tags: (unknown) -> {string},
	remove_tag: (string) -> unknown,
	set_attribute: (name: string, value: any) -> unknown,
	get_attribute: (name: string) -> any,
	destroy: (unknown) -> unknown,
	get_pivot: (unknown) -> CFrame,
	pivot_to: (CFrame) -> unknown,
	is_in_workspace: boolean,
	find_first_child: (name: string) -> luauInstance,
	is_a: (object_class: string) -> boolean,
	is_descendant_of: (object: luauInstance) -> boolean,
	get_descendants: (unknown) -> {luauInstance},
	get_children: (unknown) -> {luauInstance},
	get_primary_part: (unknown) -> luauInstance?,
	clone: luauInstance,
	__secure_get_owner: unknown,

	-- known properties, todo
	-- implied that this has access to every instance method and property so idk how Im gonna do that
	Parent: luauInstance,
	Name: string,
	Volume: number,
}

declare create_instance: (instance_name: string) -> luauInstance

declare sound: {
	play_sick_riff: (unknown) -> unknown,
	create: (unknown) -> luauInstance
}
declare get_map_root: (unknown) -> luauInstance
declare get_chars_root: (unknown) -> luauInstance
declare clear_console: (unknown) -> unknown

declare tags: {
	get_tags: () -> {string},
	get_tagged: (string) -> {Instance},
	get_all_tagged: (string) -> {Instance},
}

declare query: {
	spherecast: unknown,
	blockcast: unknown,
	shapecast: unknown,
	raycast: unknown,
	create_raycast_params: unknown,
}
