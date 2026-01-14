--[[
mobs:spawn({
	name = "ethereal_bosses:elder",
	nodes = "group:soil",
	max_light = 7,
	chance = 4000,
	min_height = 0,
	max_height = 200,
	active_object_count = 1,
})
]]
-- SPAWNS DEF : =============================================================================
mobs:spawn({
	name = "ethereal_bosses:crazymushroom",
	nodes = {"ethereal:mushroom_dirt","ethereal:mushroom","mcl_core:mycelium"},
	max_light = 7,
	chance = 8000,
	min_height = -200,
	max_height = 200,
	active_object_count = 1,
})

mobs:spawn({
	name = "ethereal_bosses:heated",
	nodes = {"ethereal:fiery_dirt","mcl_nether:netherrack","mcl_blackstone:blackstone","mcl_nether:nether_wart_block","mcl_crimson:crimson_nylium"},
	min_light = 7,
	chance = 8000,
	max_height = 200,
	active_object_count = 1,
})

mobs:spawn({
	name = "ethereal_bosses:frostyqueen",
	nodes = {"ethereal:crystal_dirt", "ethereal:frost_leaves","mcl_core:snowblock","mcl_core:ice"},
	max_light = 7,
	chance = 8000,
	min_height = -200,
	max_height = 200,
	active_object_count = 1,
})

mobs:spawn({
	name = "ethereal_bosses:depthseye",
	nodes = {"air"},
	max_light = 7,
	chance = 8000,
	active_object_count = 1,
	max_height = -100,
})

mobs:spawn({
	name = "ethereal_bosses:fungs",
	nodes = {"ethereal:mushroom_dirt","ethereal:mushroom","mcl_core:mycelium"},
	min_light = 8,
	max_light = 14,
	interval = 60,
	chance = 2000,
	min_height = 0,
	max_height = 200,	
})

mobs:spawn({
	name = "ethereal_bosses:nature_guardian",
	nodes = {"ethereal:prairie_dirt","mcl_lush_caves:moss"},
	min_light = 8,
	--max_light = 14,
	chance = 4000,
	min_height = -10,
	max_height = 200,
})

