-- CURA
minetest.register_craft({
	output = "ethereal_bosses:miraclehealing 1",
	recipe = {
		{"group:glass", "ethereal_bosses:nectar", "group:glass"},
		{"group:glass", "ethereal_bosses:deye", "group:glass"},
		{"group:glass", "group:glass", "group:glass"}
	}
})


-- TOOLS  : ===============================================================================

minetest.register_craft({
    type = "shaped",
    output = "ethereal_bosses:pick_mushroom",
    recipe = {
         {"group:mushroom","group:mushroom","group:mushroom"},
        {"","group:stick",""},
        {"", "group:stick",""}
    }
})


minetest.register_craft({
    type = "shaped",
    output = "ethereal_bosses:shovel_mushroom",
    recipe = {
         {"","group:mushroom",""},
        {"","group:stick",""},
        {"", "group:stick",""}
    }
})


minetest.register_craft({
    type = "shaped",
    output = "ethereal_bosses:axe_mushroom",
    recipe = {
        {"group:mushroom","group:mushroom",""},
        {"group:mushroom","group:mushroom",""},
        {"", "group:stick",""}
    }
})

minetest.register_craft({
    type = "shaped",
    output = "ethereal_bosses:sword_mushroom",
    recipe = {
        {"","group:mushroom",""},
        {"","group:mushroom",""},
        {"", "group:stick",""}
    }
})



--NATURE ITENS : ==========================================================================
-- CRAFT :

minetest.register_craft({
    type = "shaped",
    output = "ethereal_bosses:naturewhip",
    recipe = {
        {"","natureguardian:natureroots",""},
        {"natureguardian:natureroots","default:stick",""},
        {"", "group:stick",""}
    }
})


minetest.register_craft({
    type = "shaped",
    output = "ethereal_bosses:naturerod",
    recipe = {
        {"","group:stone",""},
        {"","natureguardian:natureroots",""},
        {"", "group:stick",""}
    }
})



-- NOVOS ITENS : ==================================================================================
minetest.register_craft({
	output = "ethereal_bosses:nectar 1",
	recipe = {
		
		{"group:flower", "group:flower", "group:flower"},
		
	}
})



minetest.register_craft({
	output = "ethereal_bosses:rotten_wood 1",
	recipe = {
		{"", "group:tree", "group:water_bucket"},
		
	}
})

