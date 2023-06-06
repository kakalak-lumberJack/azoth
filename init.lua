local AZOTH_ORE_DEPTH = -1024
local AZOTH_POOL_DEPTH = -11000

minetest.register_node("azoth:azoth_source", {
	description = "Azoth Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "azoth_source.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	special_tiles = {
		{
			name = "azoth_source.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
			backface_culling = false,
		},
	},
	paramtype = "light",
	light_source = 8,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = true,
	liquidtype = "source",
	liquid_alternative_flowing = "azoth:azoth_flowing",
	liquid_alternative_source = "azoth:azoth_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 191, r = 245, g = 245, b = 255},
	groups = {liquid = 2, azoth = 1},
})

minetest.register_node("azoth:azoth_flowing", {
	description = "Flowing Azoth",
	drawtype = "flowingliquid",
	tiles = {"azoth.png"},
	special_tiles = {
		{
			name = "azoth_flowing.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "azoth_flowing.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = 8,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = "",
	liquidtype = "flowing",
	liquid_alternative_flowing = "azoth:azoth_flowing",
	liquid_alternative_source = "azoth:azoth_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 191, r = 245, g = 245, b = 255},
	groups = {liquid = 2, not_in_creative_inventory = 1, azoth = 1},
})

-- Azoth as rare scatter ore

minetest.register_ore({
	ore_type        = "blob",
	ore             = "azoth:azoth_source",
	wherein         = {"default:stone"},
	clust_scarcity  = 72 * 72 * 72,
	clust_size      = 3,
	y_max           = AZOTH_ORE_DEPTH,
	y_min           = -31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.2,
		spread = {x = 2, y = 2, z = 1},
		seed = -469,
		octaves = 1,
		persist = 0.0
	},
})

-- Azoth Biomes
minetest.register_biome({
	name = "azoth_under_1",
	node_cave_liquid = {"azoth:azoth_source", "default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = AZOTH_POOL_DEPTH,
	y_min = -31000,
	heat_point = 37,
	humidity_point = 49,
})

minetest.register_biome({
	name = "azoth_under_2",
	node_cave_liquid = {"azoth:azoth_source", "default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = AZOTH_POOL_DEPTH * 2,
	y_min = -31000,
	heat_point = 71,
	humidity_point = 67,
})

dofile(minetest.get_modpath("azoth").."/mese_bucket.lua")
dofile(minetest.get_modpath("azoth").."/crafts.lua")
