declare sharedvars: {
	--- Whether staying in the air will kill you
	--- Default: true
	ac_airtime_kill: boolean,

	--- Whether movement anticheat is enabled
	--- Default: true
	ac_movement: boolean,

	--- Timeout before invalidating a shot
	--- Default: 15
	ac_shot_timeout: number,

	--- Whether analytics are enabled
	--- Default: false
	api_analytics_enabled: boolean,

	--- Game-wide announcement
	--- Default: You can restore your game data in the settings. Keep trying if it doesn't work.
	api_announcement: string,

	--- Whether the server will handle messages from deadlinegame.com
	--- Default: true
	api_messaging_enabled: boolean,

	--- Newest server version
	--- Default: 0.24.3
	api_newest_server_version: string,

	--- Game update message shown to returning players
	--- Default: You can restore your game data in the settings. Keep trying if it doesn't work.
	api_update_message: string,

	--- How close a bot has to be to its target to consider it reached
	--- Default: 7
	bot_target_reach_distance: number,

	--- Whether chat announces server changes
	--- Default: true
	chat_announce_changes: boolean,

	--- Whether chat is disabled
	--- Default: false
	chat_disable: boolean,

	--- Maximum chat history
	--- Default: 25
	chat_max_history: number,

	--- How often chat tips are shown
	--- Default: 240
	chat_tip_frequency: number,

	--- Whether chat tips are enabled
	--- Default: true
	chat_tips_enabled: boolean,

	--- Whether the server is shutting down
	--- Default: false
	crit_shutdown: boolean,

	--- Whether backblast debug is active
	--- Default: false
	dbg_backblast: boolean,

	--- whether bot pathfinding lines are enabled
	--- Default: false
	dbg_bot_pathfind_lines: boolean,

	--- whether Canim animator debug is enabled
	--- Default: false
	dbg_canim: boolean,

	--- Whether additional error info exists
	--- Default: true
	dbg_catch_errors: boolean,

	--- whether character controller gizmos are enabled
	--- Default: false
	dbg_char_gizmos: boolean,

	--- 
	--- Default: false
	dbg_check_for_thread_yielding: boolean,

	--- whether to show node offset debug ui in builder
	--- Default: false
	dbg_debug_node_offsets: boolean,

	--- whether lighting will update according to lighting preset and time
	--- Default: false
	dbg_disable_weather: boolean,

	--- debugger in the editor
	--- Default: false
	dbg_editor_debugger: boolean,

	--- whether stats previews are disabled in the editor
	--- Default: false
	dbg_editor_disable_stat_previews: boolean,

	--- enables the recommended attachment system in the editor
	--- Default: true
	dbg_enable_editor_recommended: boolean,

	--- hold to interact time for magchecking and firemode checking
	--- Default: 0.2
	dbg_game_hold_to_interact_time: number,

	--- whether fps is limited to dbg_max_fps
	--- Default: false
	dbg_limit_fps: boolean,

	--- logservice screen output
	--- Default: false
	dbg_logservice: boolean,

	--- enables customizing the ammo positions in the editor
	--- Default: false
	dbg_mag_stack: boolean,

	--- max fps limit while dbg_limit_fps is enabled
	--- Default: 15
	dbg_max_fps: number,

	--- debugger for aimmarker positioning error
	--- Default: false
	dbg_optics: boolean,

	--- whether to regen weapon offsets at runtime
	--- Default: false
	dbg_position_runtime_regen: boolean,

	--- delay after dying before death screen
	--- Default: 5
	dbg_post_death_delay: number,

	--- whether rigging mode is enabled
	--- Default: false
	dbg_prepare_for_rig: boolean,

	--- Whether microprofiler tags are enabled
	--- Default: false
	dbg_profiling: boolean,

	--- projectile gizmos
	--- Default: false
	dbg_projectile: boolean,

	--- enables customizing any weapon recoil patterns in the F10 menu
	--- Default: false
	dbg_recoil: boolean,

	--- whether shell extraction location is shown
	--- Default: false
	dbg_show_shell_location: boolean,

	--- whether to show raycast shot trajectory
	--- Default: false
	dbg_show_shot_trajectory: boolean,

	--- spawn transition time
	--- Default: 1
	dbg_spawn_transition_time: number,

	--- Whether to log rodux store changes
	--- Default: false
	dbg_store_changes: boolean,

	--- whether the gunshot emitter test mode is enabled. Only works while joining
	--- Default: false
	dbg_test_gunshot_emitter: boolean,

	--- whether vaulting debug is enabled
	--- Default: false
	dbg_vault_lines: boolean,

	--- whether warpzone debug is enabled
	--- Default: false
	dbg_warpzones: boolean,

	--- Whether compatibility check limits are enabled
	--- Default: true
	editor_compatibility_checks: boolean,

	--- Editor hover distance
	--- Default: 20
	editor_hover_distance: number,

	--- Whether you can mount any attachment in any attachment slot. Allows for very scuffed gun builds
	--- Default: false
	editor_mount_anything: boolean,

	--- Whether attachment streaming on-demand is enabled
	--- Default: false
	ff_attachment_streaming: boolean,

	--- 
	--- Default: false
	ff_field_voicelines: boolean,

	--- (READ-ONLY) Game branch
	--- Default: release
	game_branch: string,

	--- (READ-ONLY) Game version
	--- Default: 0.24.3
	game_version: string,

	--- Whether loadout editing is disabled
	--- Default: false
	gm_disable_loadout_editing: boolean,

	--- How long a TDM match lasts in minutes
	--- Default: 20
	gm_match_time_minutes: number,

	--- Whether objective markers are enabled
	--- Default: true
	gm_objective_markers: boolean,

	--- How many points to award per second in other gamemodes
	--- Default: 5
	gm_points_per_second: number,

	--- Whether players are forced to spawn in push
	--- Default: false
	gm_push_force_spawning: boolean,

	--- How long to wait before spawning players in push
	--- Default: 30
	gm_push_spawn_timer: number,

	--- Whether spawning is enabled in push
	--- Default: true
	gm_push_spawning: boolean,

	--- How long to wait before capturing a point in push
	--- Default: 30
	gm_push_time_to_capture: number,

	--- How long to wait before refilling ammo with the refill interactable
	--- Default: 5
	gm_refill_interactable_cooldown_time: number,

	--- Server replication frequency in hertz
	--- Default: 30
	gm_replication_frequency_hz: number,

	--- Server replication packet size for outgoing player data
	--- Default: 80
	gm_replication_packet_size_bytes_outgoing: number,

	--- The amount of players a team can be unbalanced by before team switching isn't allowed
	--- Default: 2
	gm_team_balancing_threshold: number,

	--- Whether team scrambling is enabled when a match starts
	--- Default: true
	gm_team_scrambling: boolean,

	--- How long to wait before capturing a point in other gamemodes
	--- Default: 15
	gm_time_to_capture: number,

	--- (READ-ONLY) Whether the server is a VIP server
	--- Default: true
	is_vip_server: boolean,

	--- (READ-ONLY) Place configuration. decides whether the server runs as the lobby or main game
	--- Default: lobby
	place_config: string,

	--- Whether aiming in bushes is enabled
	--- Default: true
	plr_aim_in_bushes: boolean,

	--- Whether the magcheck UI is always shown
	--- Default: false
	plr_always_show_magcheck: boolean,

	--- Player arm stamina drain
	--- Default: 2
	plr_arm_stamina_drain: number,

	--- Player arm stamina drain while holding breath
	--- Default: 3
	plr_arm_stamina_drain_hold_breath: number,

	--- Player arm stamina regen speed
	--- Default: 6
	plr_arm_stamina_regen: number,

	--- Player arm stamina regen speed while crouching
	--- Default: 4.5
	plr_arm_stamina_regen_crouch: number,

	--- Whether auto jump is enabled
	--- Default: false
	plr_auto_jump: boolean,

	--- Player barrel deviation
	--- Default: 1
	plr_barrel_deviation: number,

	--- Player base weight
	--- Default: 0.7
	plr_base_weight: number,

	--- Player buck barrel deviation
	--- Default: 1
	plr_buck_barrel_deviation: number,

	--- Debounce before you can cancel a reload again
	--- Default: 0.8
	plr_cancel_reload_timeout: number,

	--- Whether ceasefire is enabled
	--- Default: false
	plr_ceasefire: boolean,

	--- Player damage multiplier
	--- Default: 1
	plr_damage_multiplier: number,

	--- Whether shot location is shown in death view
	--- Default: true
	plr_death_view_shot_location: boolean,

	--- Default camera mode. values include Default, Freecam, TPerson
	--- Default: Default
	plr_default_camera_mode: string,

	--- Default NVG DOF focus distance
	--- Default: 10
	plr_default_nvg_dof_distance: number,

	--- Whether explosive projectile arming is disabled, meaning they will explode upon contact immediately
	--- Default: false
	plr_disable_arming: boolean,

	--- Whether NVG is disabled
	--- Default: false
	plr_disable_nvg: boolean,

	--- Whether RPG ammo refills are disabled
	--- Default: false
	plr_disable_rpg_refill: boolean,

	--- How long it takes to drown
	--- Default: 20
	plr_drown_time: number,

	--- Drum magazines available when spawning for drums
	--- Default: 1
	plr_drum_magazines: number,

	--- Whether one hand aiming is enabled. When enabled, the default keybind is I
	--- Default: true
	plr_enable_gangsta_control: boolean,

	--- Whether markers are enabled
	--- Default: true
	plr_enable_markers: boolean,

	--- Whether mounting is enabled
	--- Default: false
	plr_enable_mounting: boolean,

	--- Player ergonomics multiplier
	--- Default: 1
	plr_ergonomics_multiplier: number,

	--- Player explosion blast pressure
	--- Default: 1
	plr_explosion_blast_pressure: number,

	--- Player explosion damage multiplier
	--- Default: 1
	plr_explosion_damage_multiplier: number,

	--- Whether fall damage is enabled
	--- Default: true
	plr_fall_damage: boolean,

	--- Camera FOV while in freecam
	--- Default: 70
	plr_freecam_fov: number,

	--- Player grenade throw strength
	--- Default: 1
	plr_grenade_throw_strength: number,

	--- Player headshot damage multiplier
	--- Default: 1
	plr_headshot_damage_multiplier: number,

	--- Player health regen speed
	--- Default: 1
	plr_health_regen_sec: number,

	--- Player hip height
	--- Default: 3
	plr_hipheight: number,

	--- Player initial health
	--- Default: 100
	plr_initial_health: number,

	--- How much time the player has after spawning to reset to the lobby instantly
	--- Default: 8
	plr_instant_lobby_return_time: number,

	--- Whether you can switch directions while in the air
	--- Default: false
	plr_jump_control_momentum: boolean,

	--- Player jump frequency in hz
	--- Default: 0.67
	plr_jump_frequency: number,

	--- Player jump multiplier
	--- Default: 1
	plr_jump_multiplier: number,

	--- Player jump recovery time in seconds
	--- Default: 0.75
	plr_jump_recovery: number,

	--- Player laser max directional distance
	--- Default: 0.03
	plr_laser_max_directional_distance: number,

	--- Whether lens flare is enabled
	--- Default: true
	plr_lens_flare: boolean,

	--- How long to wait before hiding magazine stats
	--- Default: 5
	plr_mag_stats_timeout: number,

	--- Magazines available when spawning for non-drum weapons
	--- Default: 3
	plr_magazines: number,

	--- Player max arm stamina
	--- Default: 60
	plr_max_arm_stamina: number,

	--- Player max directional distance
	--- Default: 0.13
	plr_max_directional_distance: number,

	--- Player max object interaction distance
	--- Default: 5.5
	plr_max_interaction_distance: number,

	--- Player max stamina
	--- Default: 120
	plr_max_stamina: number,

	--- Player model. values include main, orchids_pbr_set, orchids_shark_set
	--- Default: main
	plr_model: string,

	--- Whether momentum is enabled
	--- Default: true
	plr_momentum: boolean,

	--- Player movement smoothing
	--- Default: 100
	plr_movement_damping: number,

	--- Player movement stiffness at maximum weight
	--- Default: 60
	plr_movement_max_stiffness: number,

	--- Player movement stiffness at minimum weight
	--- Default: 10
	plr_movement_min_stiffness: number,

	--- Color player NVG
	--- Default: 0.529412, 1, 0.313726
	plr_nv_color: Color3,

	--- Projectile penetration multiplier
	--- Default: 1
	plr_penetration_multiplier: number,

	--- Maximum allowed player ping
	--- Default: 30
	plr_ping_limit_sec: number,

	--- How long the ping has to be over plr_ping_limit_sec for the client to get kicked
	--- Default: 40
	plr_ping_timeout_sec: number,

	--- ping warning threshold in milliseconds
	--- Default: 250
	plr_ping_warning_threshold_ms: number,

	--- Whether PVP is enabled
	--- Default: true
	plr_pvp: boolean,

	--- Player ragdoll throw strength
	--- Default: 12
	plr_ragdoll_strength: number,

	--- Global recoil multiplier
	--- Default: 1
	plr_recoil: number,

	--- Player replication frequency in hz
	--- Default: 30
	plr_replication_frequency_hz: number,

	--- Player replication rollback time in milliseconds
	--- Default: 190
	plr_replication_rollback_time_ms: number,

	--- Delay before the player dies after resetting
	--- Default: 0
	plr_reset_delay: number,

	--- Player shove bayonet distance
	--- Default: 4.5
	plr_shove_bayonet_distance: number,

	--- Player shove bayonet headshot damage
	--- Default: 105
	plr_shove_bayonet_headshot_damage: number,

	--- Player shove bayonet limb damage
	--- Default: 45
	plr_shove_bayonet_limb_damage: number,

	--- Player shove bayonet torso damage
	--- Default: 105
	plr_shove_bayonet_torso_damage: number,

	--- Player shove distance
	--- Default: 3
	plr_shove_distance: number,

	--- Player shove headshot damage
	--- Default: 75
	plr_shove_headshot_damage: number,

	--- Player shove limb damage
	--- Default: 35
	plr_shove_limb_damage: number,

	--- Player shove melee headshot damage
	--- Default: 105
	plr_shove_melee_headshot_damage: number,

	--- Player shove melee limb damage
	--- Default: 55
	plr_shove_melee_limb_damage: number,

	--- Player shove melee torso damage
	--- Default: 75
	plr_shove_melee_torso_damage: number,

	--- Player shove torso damage
	--- Default: 55
	plr_shove_torso_damage: number,

	--- Whether the magcheck UI shows exact ammo
	--- Default: false
	plr_show_exact_magcheck_ammo: boolean,

	--- Spare rounds for single-shot weapons
	--- Default: 2
	plr_single_shot_spare_rounds: number,

	--- Spare rounds for internal-magazine weapons
	--- Default: 30
	plr_spare_rounds: number,

	--- Player speed multiplier
	--- Default: 1
	plr_speed: number,

	--- Player stamina regen speed while crouching
	--- Default: 2
	plr_stamina_crouch_regen: number,

	--- Player stamina jump drain
	--- Default: 3
	plr_stamina_jump_drain: number,

	--- Player stamina lean drain
	--- Default: 0.25
	plr_stamina_lean_drain: number,

	--- Player stamina regen speed
	--- Default: 1.76
	plr_stamina_regen: number,

	--- Player stamina run drain
	--- Default: 1.4
	plr_stamina_run_drain: number,

	--- Player stamina shake multiplier
	--- Default: 1
	plr_stamina_shake_multiplier: number,

	--- Whether suppression is enabled
	--- Default: true
	plr_suppression: boolean,

	--- Player swift switch speed multiplier
	--- Default: 1.15
	plr_swift_switch_speed_multiplier: number,

	--- Whether team killing is enabled
	--- Default: false
	plr_team_kill: boolean,

	--- Player vault barrier detection raycast multiplier. Set dbg_vault_lines to true before playing with these values!
	--- Default: 1.4
	plr_vault_barrier_detection_raycast_multiplier: number,

	--- Player vault barrier distance addition. Set dbg_vault_lines to true before playing with these values!
	--- Default: 1
	plr_vault_barrier_distance_addition: number,

	--- Player vault barrier height reduction. Set dbg_vault_lines to true before playing with these values!
	--- Default: -0.5
	plr_vault_barrier_height_reduction: number,

	--- Player vault barrier initial delay multiplier. Set dbg_vault_lines to true before playing with these values!
	--- Default: 0.5
	plr_vault_barrier_initial_delay_multiplier: number,

	--- Player vault barrier move time multiplier. Set dbg_vault_lines to true before playing with these values!
	--- Default: 0.6
	plr_vault_barrier_move_time_multiplier: number,

	--- Player vault barrier throw multiplier. Set dbg_vault_lines to true before playing with these values!
	--- Default: 1
	plr_vault_barrier_throw_multiplier: number,

	--- Player vault frontal detection length. Set dbg_vault_lines to true before playing with these values!
	--- Default: 4
	plr_vault_frontal_detection_length: number,

	--- Player vault frontal size x. Set dbg_vault_lines to true before playing with these values!
	--- Default: 2
	plr_vault_frontal_size_x: number,

	--- Player vault frontal size y. Set dbg_vault_lines to true before playing with these values!
	--- Default: 1.4
	plr_vault_frontal_size_y: number,

	--- Player vault height
	--- Default: 2.5
	plr_vault_height: number,

	--- Player vault inward offset. Set dbg_vault_lines to true before playing with these values!
	--- Default: 0.5
	plr_vault_inward_offset: number,

	--- Player vault max delay before starting animation
	--- Default: 0.35
	plr_vault_max_delay: number,

	--- Player vault max vault animation time
	--- Default: 1.3
	plr_vault_max_vault_time: number,

	--- Player vault minimum delay before starting animation
	--- Default: 0.05
	plr_vault_min_delay: number,

	--- Player vault minimum vault animation time
	--- Default: 0.7
	plr_vault_min_vault_time: number,

	--- Player vault rotation limit. Set dbg_vault_lines to true before playing with these values!
	--- Default: 1.1
	plr_vault_rotation_limit: number,

	--- Player stamina drain while vaulting
	--- Default: 7
	plr_vault_stamina_drain: number,

	--- Player vault top check max hits. Set dbg_vault_lines to true before playing with these values!
	--- Default: 6
	plr_vault_top_check_max_hits: number,

	--- Player vault top check raycast count. Set dbg_vault_lines to true before playing with these values!
	--- Default: 10
	plr_vault_top_check_raycast_count: number,

	--- Player vault top detection length
	--- Default: 3
	plr_vault_top_detection_length: number,

	--- Player viewmodel state transition speed multiplier
	--- Default: 1
	plr_viewmodel_state_transition_speed: number,

	--- Whether weapon stats are clamped
	--- Default: true
	plr_weapon_clamp_stats_values: boolean,

	--- Whether progression related buying features and limits are enabled
	--- Default: false
	ro_earnings_enabled: boolean,

	--- Whether Staging branch players get money
	--- Default: false
	ro_infinite_money_in_staging: boolean,

	--- Server join message. Set with (set-join-message message)
	--- Default: 
	ro_join_message: string,

	--- Whether players without chat roles are kicked from the game
	--- Default: false
	ro_kick_non_roled_players: boolean,

	--- Whether money functions are enabled
	--- Default: false
	ro_luau_give_money_enabled: boolean,

	--- Reason why spawning is disabled. Set with (set-spawning-disabled-reason reason)
	--- Default: 
	ro_spawning_disabled_reason: string,

	--- Server creation time
	--- Default: 1755367282.657926
	sv_creation_time: number,

	--- Server day cycle speed in seconds. A value of 1 is 1:1 to real life
	--- Default: 0
	sv_day_cycle_speed: number,

	--- Server gravity. Mapped to workspace.Gravity
	--- Default: 60
	sv_gravity: number,

	--- When the match intermission ends, or nil if there is none
	--- Default: nil
	sv_intermission_finish: nil,

	--- Whether the gun editor is only enabled during intermission
	--- Default: false
	sv_intermission_only_editor: boolean,

	--- Whether only preload list attachments are loaded
	--- Default: false
	sv_load_only_preloaded_attachments: boolean,

	--- Geographical server location
	--- Default: No known location
	sv_location: string,

	--- How long the intermission between matches lasts
	--- Default: 90
	sv_map_intermission_time: number,

	--- How long map voting lasts
	--- Default: 35
	sv_map_vote_time: number,

	--- Whether map voting is enabled
	--- Default: true
	sv_map_voting: boolean,

	--- Whether modfiles are enabled
	--- Default: true
	sv_modfiles_enabled: boolean,

	--- Whether tracers have random colors
	--- Default: false
	sv_rainbow_tracers: boolean,

	--- Whether the server uses the map's defined preset when switching maps
	--- Default: true
	sv_respect_preset_properties: boolean,

	--- Whether set dressing events are enabled. Events include background audio or passing aircraft
	--- Default: false
	sv_set_dressing_events_enabled: boolean,

	--- How often set dressing events are triggered
	--- Default: 2
	sv_set_dressing_events_frequency_hz: number,

	--- Server sound speed in studs
	--- Default: 1120
	sv_sound_speed: number,

	--- Whether spawning is enabled
	--- Default: true
	sv_spawning_enabled: boolean,

	--- Server time offset in hours. A value of 1 means 1 hour forwards
	--- Default: 0
	sv_time_offset: number,

	--- Server timescale. 1 means realtime. Setting this to 0 will break the game
	--- Default: 1
	sv_timescale: number,

	--- Tracer bullet size
	--- Default: 0.5
	sv_tracer_size: number,

	--- Whether Volumika is enabled
	--- Default: false
	sv_volumika: boolean,

	--- (READ-ONLY) VIP server owner
	--- Default: LegitACarWithAGun
	vip_owner: string,
}