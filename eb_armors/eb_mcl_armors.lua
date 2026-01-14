-- ARMADURA AGORA SOMENTE NO 3d ARMOR , NÃO MCL
local S = core.get_translator("ethereal_bosses")

mcl_armor.register_set({
	name = "roots",
	descriptions = {
		head = S("Roots Helmet"),
		torso = S("Roots Chestplate"),
	},
	durability = 240,
	enchantability = 9,
	points = {
		head = 2,
		torso = 6,
	},
	craft_material = "ethereal_bosses:natureroots",
	--cook_material = "ethereal_bosses:natureroots",
	--sound_equip = "mcl_armor_equip_roots",
	--sound_unequip = "mcl_armor_unequip_roots",
	
	on_equip_callbacks = {
		torso = function(obj, itemstack)
			playerphysics.add_physics_factor(obj, "gravity", "ethereal_bosses:roots_gravity",0.7)
		end,
	},
	
	on_unequip_callbacks = {
		torso = function(obj, itemstack)
			playerphysics.remove_physics_factor(obj, "gravity", "ethereal_bosses:roots_gravity")
		end,
	},
	
	on_break_callbacks = {
		torso = function(obj)
			playerphysics.remove_physics_factor(obj, "gravity", "ethereal_bosses:roots_gravity")
		end,
	},
})

core.clear_craft({
    output = "ethereal_bosses:boots_roots"
})

core.clear_craft({
    output = "ethereal_bosses:leggings_roots"
})

-- AURORA ARMOR:
mcl_armor.register_set({
	name = "aurora_mcl",
	descriptions = {
		head = S("Aurora Helmet"),
		torso = S("Aurora Chestplate"),
		legs = S("Aurora Leggings"),
		feet = S("Aurora Boots"),
	},	durability = 900,
	enchantability = 10,
	points = {
		head = 7,
		torso = 11,
		legs = 9,
		feet = 6,
	},
	groups = {armor_feet=1, armor_heal=12.6, armor_use=700,physics_jump=0.5,physics_speed=1,physics_gravity=-0.04},
	craft_material = "ethereal_bosses:aurora_crystal",
	repair_material = "ethereal_bosses:aurora_crystal",
	sound_equip = "mcl_armor_equip_diamond",
	sound_unequip = "mcl_armor_unequip_diamond",
	
	on_equip_callbacks = {
	
		feet = function(obj, itemstack)
		     playerphysics.add_physics_factor(obj, "jump", "ethereal_bosses:aurora_jump",1.6)   
		end,
	},
	
	on_unequip_callbacks = {
		feet = function(obj, itemstack)
		     playerphysics.remove_physics_factor(obj, "jump", "ethereal_bosses:aurora_jump")
		end,
	},
	
	on_break_callbacks = {
		feet = function(obj)
		     playerphysics.remove_physics_factor(obj, "jump", "ethereal_bosses:jumps")
		end,
	},
})
