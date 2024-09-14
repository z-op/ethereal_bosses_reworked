
-- Obsidian Sword (Agora item de troca com Elder)

minetest.register_tool("ethereal_bosses:sword_obsidian", {
	wield_scale = {x = 1.5, y = 1.5, z = 2.5},
	description = "Obsidian Sword",
	inventory_image = "obsidian_sword.png",
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
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1}
})


-- ESPADA FLAMEJANTE :

minetest.register_tool("ethereal_bosses:flaming_sword", {
	wield_scale = {x = 1.5, y = 1.5, z = 2.5},
	description = "Flaming Sword",
	inventory_image = "flaming_sword.png",
	light =12 ,
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
		damage_groups = {fleshy = 12 , fire=1},
	},
	sound = {breaks = "default_tool_breaks"},
	groups = {sword = 1},

	

})

-- DEATHUS EYE : 

minetest.register_craftitem("ethereal_bosses:deye", {
    description = "Eye",
    inventory_image = "deye.png",
 	
 
})


--- NECTAR


minetest.register_craftitem("ethereal_bosses:nectar", {
    description = "Nectar",
    inventory_image = "nectar.png",
 	
 
})


-- ROTTEN WOOD :


minetest.register_craftitem("ethereal_bosses:rotten_wood", {
    description = "Rotten Wood",
    inventory_image = "rotten_wood.png",
 	
 
})



-- NATURE DROPS : ===========================================================================

minetest.register_craftitem("ethereal_bosses:natureroots", {
    description = "Nature Guardian Roots",
    inventory_image = "natureroots.png",
 
	
})



-- TROFÉUS : =================================================================================

minetest.register_node("ethereal_bosses:frostyqueen_trophy", {
	description = "Frosty Queen Trophy",
	drawtype = "mesh",
	mesh = "trofeus_ethreal.obj",
	tiles = {"trufeus_frostyqueen.png"},
	use_texture_alpha = "clip",
	wield_scale = {x = 1, y = 1, z = 1},
	groups = {dig_immediate = 3},
	paramtype = "light",
	paramtype2 = "facedir",
	-- CAIXA DE COLISÃO :
	selection_box = {
		type = "fixed", -- fica no formato da caixa se ajustado
		fixed = {
			{-0.5, -0.5, 0.45, 0.5, 0.5, 0.5},
		},
	},
})

minetest.register_node("ethereal_bosses:crazymushrrom_trophy", {
	description = "Crazy Mushrrom Trophy",
	drawtype = "mesh",
	mesh = "trofeus_ethreal.obj",
	tiles = {"trufeus_crazymushroom.png"},
	use_texture_alpha = "clip",
	wield_scale = {x = 1, y = 1, z = 1},
	groups = {dig_immediate = 3},
	paramtype = "light",
	paramtype2 = "facedir",
	-- CAIXA DE COLISÃO :
	selection_box = {
		type = "fixed", -- fica no formato da caixa se ajustado
		fixed = {
			{-0.5, -0.5, 0.45, 0.5, 0.5, 0.5},
		},
	},
})

minetest.register_node("ethereal_bosses:heated_trophy", {
	description = "Heated Trophy",
	drawtype = "mesh",
	mesh = "trofeus_ethreal.obj",
	tiles = {"trufeus_heated.png"},
	use_texture_alpha = "clip",
	wield_scale = {x = 1, y = 1, z = 1},
	groups = {dig_immediate=3},
	paramtype = "light",
	paramtype2 = "facedir",
	-- CAIXA DE COLISÃO :
	paramtype2 = "facedir",
	selection_box = {
		type = "fixed", -- fica no formato da caixa se ajustado
		fixed = {
			{-0.5, -0.5, 0.45, 0.5, 0.5, 0.5},
		},
	},
})




---- ITENS : ========================================================================================

-- CURA MILAGROSA :
-- Sound : https://freesound.org/people/craigglenday/sounds/517173/ (CC0)

minetest.register_craftitem("ethereal_bosses:miraclehealing", {
	description = "Miracle Healing ",
	inventory_image = "miraclehealing.png",
	stack_max = 1,
	groups = {vessel = 1},
	-- função para recuperar vida simples
	on_use = function(itemstack, user, pointed_thing,pos)
		local hp = user:get_hp() -- usuario consegue o valor atual de sua vida
		if hp ~= 20 then -- comparando vida
			user:set_hp(hp + 10)  -- atribuindo mais 10 de vida
		end

		minetest.sound_play("bebendo", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		}, true)

		local pos = user:get_pos()

		for i = 1, 30 do

			minetest.add_particle({
				pos = pos,
				acceleration = 0,
				velocity = {
					x = math.random(-3, 3),
					y = math.random(-3, 3),
					z = math.random(-3, 3)
				},
				-- x ou y ,ou z  = random (-3 right , 3 left )
				size = 2,
				expirationtime = 2.0,
				collisiondetection = false,
				vertical = false,
				texture = "curam.png",
				glow = 8,
			})
		end

		return  "vessels:glass_bottle"
	end
})



