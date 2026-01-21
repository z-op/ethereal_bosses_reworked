--- PIXOES
mobs:spawn({
	name = "ethereal_bosses:pixies_red",
	nodes = "air",
	neighbors = {"group:flower"},
	max_light = 7,
	chance = 4000,
	interval = 60,
	min_height = 0,
	max_height = 40,
	active_object_count = 4,
})


mobs:spawn({
	name = "ethereal_bosses:pixies_green",
	nodes = "air",
	neighbors = {"group:flower"},
	max_light = 7,
	chance = 4000,
	interval = 60,
	min_height = 0,
	max_height = 40,
	active_object_count = 4,
})


mobs:spawn({
	name = "ethereal_bosses:pixies_blue",
	nodes = "air",
	neighbors = {"group:flower"},
	max_light = 7,
	interval = 60,
	chance = 4000,
	min_height = 0,
	max_height = 40,
	active_object_count = 4,
})

--[[
mobs:spawn({
	name = "ethereal_bosses:elder",
	nodes = "default:dirt_with_grass",
	max_light = 7,
	chance = 4000,
	min_height = 0,
	max_height = 200,
	active_object_count = 1,
})
]]

mobs:spawn({
	name = "ethereal_bosses:crazymushroom",
	nodes = {"default:dirt_with_coniferous_litter"},
	max_light = 7,
	chance = 8000,
	min_height = -200,
	max_height = 200,
	--active_object_count = 1,
})

mobs:spawn({
	name = "ethereal_bosses:heated",
	nodes = {"default:lava_source","nether:rack"},
	min_light = 8,
	max_light = 14,
	chance = 8000,
	min_height = -2000,
	max_height = 200,
	--active_object_count = 1,
})

mobs:spawn({
	name = "ethereal_bosses:frostyqueen",
	nodes = {"default:snow","default:snowblock"},
	max_light = 7,
	chance = 8000,
	min_height = -200,
	max_height = 200,
	--active_object_count = 1,
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
	nodes = {"default:dirt_with_coniferous_litter"},
	min_light = 8,
	max_light = 14,
	interval = 60,
	chance = 4000,
	min_height = 0,
	max_height = 200,	
})

mobs:spawn({
	name = "ethereal_bosses:nature_guardian",
	nodes = {"group:flora","everness:moss_block"},
	min_light = 8,
	--max_light = 14,
	chance = 4000,
	min_height = -10,
	max_height = 200,
})
