-- ARMADURA AGORA SOMENTE NO 3d ARMOR , NÃO MCL
local S = core.get_translator("ethereal_bosses")

if core.global_exists("armor") and armor.elements then
	table.insert(armor.elements, "hand")
end

armor:register_armor("ethereal_bosses:helmet_roots", {
 description = S("Roots Helmet"),
 inventory_image = "ethereal_bosses_inv_helmet_roots.png",
 groups = {armor_head=1, armor_heal=6, armor_use=300,
 physics_speed=-0.02, physics_gravity=-0.1},
 armor_groups = {fleshy=10},
 damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
})

armor:register_armor("ethereal_bosses:chestplate_roots", {
 description = S("Roots Chestplate"),
 inventory_image = "ethereal_bosses_inv_chestplate_roots.png",
 groups = {armor_torso=1, armor_heal=6, armor_use=300,
 physics_speed=-0.05, physics_gravity=-0.2},
 armor_groups = {fleshy=15},
 damage_groups = {cracky=1, snappy=2, choppy=2, crumbly=3, level=2},
})

core.register_craft({
 type = "shaped",
 output = "ethereal_bosses:helmet_roots",
 recipe = {
 {"ethereal_bosses:natureroots","ethereal_bosses:natureroots","ethereal_bosses:natureroots"},
 {"ethereal_bosses:natureroots","","ethereal_bosses:natureroots"},
 {"", "",""}
 }
})

core.register_craft({
 type = "shaped",
 output = "ethereal_bosses:chestplate_roots",
 recipe = {
 {"ethereal_bosses:natureroots","","ethereal_bosses:natureroots"},
 {"ethereal_bosses:natureroots","ethereal_bosses:natureroots","ethereal_bosses:natureroots"},
 {"ethereal_bosses:natureroots", "ethereal_bosses:natureroots","ethereal_bosses:natureroots"}
 }
})

------------- aurora ARMOR
armor:register_armor("ethereal_bosses:helmet_aurora", {
		description = "Aurora Helmet",
		inventory_image = "ethereal_bosses_inv_helmet_aurora.png",
		groups = {armor_head=1, armor_heal=14, armor_use=700,physics_speed=1,physics_gravity=-0.04},
		armor_groups = {fleshy=16.5},
		damage_groups = {cracky=2, snappy=2, level=3},
		--light_source = 8,
})
    	
armor:register_armor("ethereal_bosses:chestplate_aurora", {
		description = "Aurora Chestplate",
		inventory_image = "ethereal_bosses_inv_chestplate_aurora.png",
		groups = {armor_torso=1, armor_heal=12.6, armor_use=700},
		armor_groups = {fleshy=21.5, physics_gravity=-0.04},
		damage_groups = {cracky=2, snappy=3, choppy=2, level=3},
})
	
armor:register_armor("ethereal_bosses:leggings_aurora", {
		description = "Aurora Leggings",
		inventory_image = "ethereal_bosses_inv_leggings_aurora.png",
		groups = {armor_legs=1, armor_heal=12.6, armor_use=700},
		armor_groups = {fleshy=21.5,physics_gravity=-0.04},
		damage_groups = {cracky=2, snappy=3, choppy=2, level=3},
})
	
armor:register_armor("ethereal_bosses:boots_aurora", {
		description = "Aurora Boots",
		inventory_image = "ethereal_bosses_inv_boots_aurora.png",
		groups = {armor_feet=1, armor_heal=12.6, armor_use=700,physics_jump=0.5,physics_speed=1,physics_gravity=-0.04},
		armor_groups = {fleshy=16.5},
		damage_groups = {cracky=2, snappy=3, choppy=2, level=3},
})


core.register_craft({
	output = "ethereal_bosses:helmet_aurora",
	recipe = {
		{ "ethereal_bosses:aurora_crystal", "ethereal_bosses:aurora_crystal", "ethereal_bosses:aurora_crystal" },
		{ "ethereal_bosses:aurora_crystal", "", "ethereal_bosses:aurora_crystal" },
		{ "", "", "" }
	}
})

core.register_craft({
	output = "ethereal_bosses:chestplate_aurora",
	recipe = {
		{ "ethereal_bosses:aurora_crystal", "", "ethereal_bosses:aurora_crystal" },
		{ "ethereal_bosses:aurora_crystal", "ethereal_bosses:aurora_crystal", "ethereal_bosses:aurora_crystal" },
		{ "ethereal_bosses:aurora_crystal", "ethereal_bosses:aurora_crystal", "ethereal_bosses:aurora_crystal" }
	}
})

core.register_craft({
	output = "ethereal_bosses:leggings_aurora",
	recipe = {
		{ "ethereal_bosses:aurora_crystal", "ethereal_bosses:aurora_crystal", "ethereal_bosses:aurora_crystal" },
		{ "ethereal_bosses:aurora_crystal", "", "ethereal_bosses:aurora_crystal" },
		{ "ethereal_bosses:aurora_crystal", "", "ethereal_bosses:aurora_crystal" }
	}
})

core.register_craft({
	output = "ethereal_bosses:boots_aurora",
	recipe = {
		{ "ethereal_bosses:aurora_crystal","", "ethereal_bosses:aurora_crystal" },
		{ "ethereal_bosses:aurora_crystal", "","ethereal_bosses:aurora_crystal" },
		{ "", "","" }
	}
})


