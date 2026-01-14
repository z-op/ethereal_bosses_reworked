local S = core.get_translator("ethereal_bosses")

local glover_user = {}

--=========== MUSHROOM TOOLS :
core.register_tool("ethereal_bosses:pick_mushroom", {
	description = S("Mushroom Pickaxe"),
	inventory_image = "mushroom_pick.png",
	_mcl_toollike_wield = true,
	tool_capabilities = {
		full_punch_interval = 1.3,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=1.5, [3]=1.00}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1,pickaxey = 1,weapon = 1,enchantability = -1},
})

core.register_tool("ethereal_bosses:shovel_mushroom", {
	description = S("Mushroom Shovel"),
	inventory_image = "mushroom_shovel.png",
	wield_image = "mushroom_shovel.png",
	_mcl_toollike_wield = true,
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=1.0, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1,weapon = 1,enchantability = -1},
})

core.register_tool("ethereal_bosses:axe_mushroom", {
	description = S("Mushroom Axe"),
	inventory_image = "mushroom_axe.png",
	_mcl_toollike_wield = true,
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.50, [3]=1.0}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=3},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1,weapon = 1,enchantability = -1},
})

core.register_tool("ethereal_bosses:sword_mushroom", {
	description = S("Mushroom Sword"),
	inventory_image = "mushroom_sword.png",
	_mcl_toollike_wield = true,
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1,weapon = 1,enchantability = -1},
})

-- Sound whip : https://freesound.org/people/CGEffex/sounds/93100/
core.register_tool("ethereal_bosses:naturewhip", {
	description = S("Nature Whip"),
	inventory_image = "Nature_Whip.png",
	range = 15,
	_mcl_toollike_wield = true,
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=3,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=4, knockback=2},
	},
	sound = {
	breaks = "default_tool_breaks",
	punch_use = "whip",
	},	
})

core.register_tool("ethereal_bosses:naturerod", {
	description = S("Nature Rod"),
	wield_scale = {x = 1.5, y = 3.1, z = 1.5},
	inventory_image = "Nature_Rod.png",
	range = 15,
	_mcl_toollike_wield = true,
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=3,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=2},
		},
		damage_groups = {fleshy=5, knockback=2},
	},
	sound = {
	breaks = "default_tool_breaks"
	},
})

core.register_tool("ethereal_bosses:sword_obsidian", { -- SERA REMOVIDA, N SERÁ MAIS NADA,NEM PREMIO,NEM NADA
	wield_scale = {x = 1.5, y = 1.5, z = 2.5},
	description = S("Obsidian Sword"),
	inventory_image = "obsidian_sword.png",
	_mcl_toollike_wield = true,
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level = 1,
		groupcaps = {
			snappy = {
				times = {[1] = 1.90, [2] = 0.90, [3] = 0.30},
				uses = 80,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 9},
	},
	
	sound = {
	punch_use = "swoosh1",
	punch_use_air ="swoosh1",
	},
	
	groups = {sword = 1,weapon = 1,enchantability = -1},
})

core.register_tool("ethereal_bosses:glove_glove", {
	description = S("Glove"),
	inventory_image = "ethereal_bosses_inv_glove_glove.png",
	wield_image == "ethereal_bosses_inv_glove_glove.png",
	range = 4.0,
	_mcl_toollike_wield = true,
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level = 1,
		groupcaps = {
			snappy = {
				times = {[1] = 1.90, [2] = 0.90, [3] = 0.30},
				uses = 80,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 12,knockback=2},
	},	
	sound = {punch_use = "punch_boxing",punch_use_air ="punch_boxing"},	
        groups = {armor_hand = 2, armor_heal = 2, armor_use = 40,physics_speed = 0.5, physics_jump = 1},
	
	on_use = function(itemstack, user, pointed_thing)
         local dir = user:get_look_dir()
         local player_pos = user:get_pos()  
         local pn = user:get_player_name()
         
         -- COOLDOWN:
         if not glover_user[pn] then
                glover_user[pn] = false
         end 
         
	 if  glover_user[pn] == false then
	    glover_user[pn] = true
	    core.after(2.5, function()
		 glover_user[pn] = false
	    end)
	    else
	    return
	 end
  
         itemstack:add_wear_by_uses(300)
        
         local eye_height = user:get_properties().eye_height or 1.625
			local shoot_pos = {
			    x = player_pos.x,
			    y = player_pos.y + eye_height,
			    z = player_pos.z
			}

			local proj = core.add_entity(
			    vector.add(shoot_pos, vector.multiply(dir, 0.5)), 
			   "ethereal_bosses:mushroom_shot"
			)

			proj:set_velocity(
			       {
			          x = dir.x * 15,
			          y = dir.y * 15, 
			          z = dir.z * 15
			       }
			    )

			proj:set_acceleration(
			       {
			          x = dir.x * 0.1,
			          y = dir.y * 0.1,
			          z = dir.z * 0.1
			       }
			    )
            
         return itemstack
      end,
})

-- ESPADA FLAMEJANTE :
core.register_tool("ethereal_bosses:flaming_sword", {
	wield_scale = {x = 2, y = 2, z = 2},
	description = core.colorize("#ff8600",S("Flaming Sword")),
	inventory_image = "flaming_sword.png",
	light_source =12 ,
	_mcl_toollike_wield = true,
	-- _repair_material = "ethereal_bosses:flaming_sword",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 1,
		groupcaps = {
			snappy = {
				times = {[1] = 1.90, [2] = 0.90, [3] = 0.30},
				uses = 5000,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 20,fire=1},
	},
	sound = {
	--breaks = "default_tool_breaks",
	punch_use = "swoosh1",
	punch_use_air ="swoosh1",
	},
	groups = {sword = 1,weapon = 1,enchantability = -1},
})

-- AURORA TOOLS: ======================================================================================
core.register_tool("ethereal_bosses:pick_aurora", {
	description = core.colorize("#cb51a3","Aurora Pickaxe"),
	inventory_image = "aurora_pick.png",
	light_source =12 ,
	_mcl_toollike_wield = true,
	_repair_material = "ethereal_bosses:aurora_crystal",
	tool_capabilities = {
		full_punch_interval = 0.86,
		max_drop_level=3,
		groupcaps={
			cracky = {times={[4]=3.50, [1]=1.5, [2]=0.85, [3]=0.40}, uses=100, maxlevel=5},
			
		},
		damage_groups = {fleshy=7},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {pickaxe = 1,weapon = 1,enchantability = -1},
})

core.register_tool("ethereal_bosses:shovel_aurora", {
	description = core.colorize("#cb51a3","Aurora Shovel"),
	inventory_image = "aurora_shovel.png",
	light_source =12 ,
	_mcl_toollike_wield = true,
	_repair_material = "ethereal_bosses:aurora_crystal",
	tool_capabilities = {
		full_punch_interval = 0.86,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=0.8, [2]=0.30, [3]=0.20}, uses=100, maxlevel=3},
		},
		damage_groups = {fleshy=5},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {shovel = 1,weapon = 1,enchantability = -1},
})


core.register_tool("ethereal_bosses:axe_aurora", {
	description = core.colorize("#cb51a3","Aurora Axe"),
	inventory_image = "aurora_axe.png",
	light_source =12 ,
	_mcl_toollike_wield = true,
	_repair_material = "ethereal_bosses:aurora_crystal",
	tool_capabilities = {
		full_punch_interval = 0.86,
		max_drop_level=1,
		groupcaps={
			choppy={times={[5]=1.6, [2]=0.60, [3]=0.35}, uses=100, maxlevel=5},
		},
		damage_groups = {fleshy=8},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {axe = 1,weapon = 1,enchantability = -1},
})


core.register_tool("ethereal_bosses:sword_aurora", {
	description = core.colorize("#cb51a3","Aurora Sword"),
	inventory_image = "aurora_sword.png",
	light_source =12 ,
	_mcl_toollike_wield = true,
	_repair_material = "ethereal_bosses:aurora_crystal",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 1,
		groupcaps = {
			snappy = {
				times = {[1] = 1.90, [2] = 0.90, [3] = 0.30},
				uses = 5000,
				maxlevel = 3
			},
		},
		damage_groups = {fleshy = 25},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1,weapon = 1,enchantability = -1},
})


core.register_craft({
	output = "ethereal_bosses:pick_aurora",
	recipe = {
		{ "ethereal_bosses:aurora_crystal", "ethereal_bosses:aurora_crystal", "ethereal_bosses:aurora_crystal" },
		{ "", "default:steel_ingot", "" },
		{ "", "default:steel_ingot", "" }
	}
})

core.register_craft({
	output = "ethereal_bosses:shovel_aurora",
	recipe = {
		{ "ethereal_bosses:aurora_crystal" },
		{ "default:steel_ingot" },
		{ "default:steel_ingot" }
	}
})

core.register_craft({
	output = "ethereal_bosses:axe_aurora",
	recipe = {
		{ "ethereal_bosses:aurora_crystal", "ethereal_bosses:aurora_crystal" },
		{ "ethereal_bosses:aurora_crystal", "ethereal_bosses:aurora_crystal" },
		{ "", "default:steel_ingot" }
	}
})

core.register_craft({
	output = "ethereal_bosses:sword_aurora",
	recipe = {
		{ "ethereal_bosses:aurora_crystal" },
		{ "ethereal_bosses:aurora_crystal" },
		{ "default:steel_ingot" }
	}
})

