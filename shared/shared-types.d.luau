type lighting_values<T> = {
	night: T,
	dat: T,
	datatype: string, -- "number", "color"
}
export type lighting_preset = {
	instance_properties: {
		preset_atmosphere: {
			Density: lighting_values<number>,
			Offset: lighting_values<number>,
			Color: lighting_values<Color3>,
			Decay: lighting_values<Color3>,
			Haze: lighting_values<number>,
			Glare: lighting_values<number>,
		},
		preset_correction: {
			Contrast: lighting_values<number>,
		},
	},
	sky: {
		StarCount: number,
		SkyboxUp: string,
		MoonTextureId: string,
		SkyboxBk: string,
		CelestialBodiesShown: boolean,
		SkyboxDn: string,
		SkyboxLf: string,
		SunTextureId: string,
		SunAngularSize: number,
		SkyboxFt: string,
		SkyboxRt: string,
		MoonAngularSize: number,
	},
	volumika_properties: {
		LightInfluence: lighting_values<number>,
		ZOffset: lighting_values<number>,
		Tint: lighting_values<Color3>,
	},
	lighting_properties: {
		ColorShift_Bottom: lighting_values<Color3>,
		Ambient: lighting_values<Color3>,
		OutdoorAmbient: lighting_values<Color3>,
		EnvironmentDiffuseScale: lighting_values<number>,
		Brightness: lighting_values<number>,
		ColorShift_Top: lighting_values<Color3>,
		EnvironmentSpecularScale: lighting_values<number>,
	},
	day_time: number,
	material_properties: {
		terrain_colors: {[Enum.Material]: Color3},
		material_overrides: {[Enum.Material]: string},
	},
	night_time: number,
}

--- roblox asset url, ex: `rbxassetid://119195862204442`
export type rbxassetid = string