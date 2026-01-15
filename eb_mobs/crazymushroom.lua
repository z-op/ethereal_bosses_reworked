
local S = core.get_translator("ethereal_bosses")

-- SOUND :
-- https://freesound.org/people/Volvion/sounds/609780/ (CC0)
-- https://freesound.org/people/newagesoup/sounds/348244/ (CC0)

mobs:register_mob("ethereal_bosses:crazymushroom", {
	--nametag = "Crazy Mushroom Boss",
	type = "monster",
	passive = false,
	attack_npcs = false,
	attack_type = "dogshoot",
	dogshoot_switch = 1,
	dogshoot_count_max = 2, 
	dogshoot_count2_max = 2, 
	shoot_interval = 5,
	shoot_offset = 1.5,
	arrow = "ethereal_bosses:mushroom_shot",
	pathfinding = true,
	reach = 8,
	damage = 18,
	hp_min = 1100,
	hp_max = 1100,
	armor = 80,
	collisionbox = {-0.7, -0, -0.7, 0.7,3.5, 0.7},
	visual = "mesh",
	visual_size = {x = 15, y = 15},
	mesh = "crazymushrrom.b3d",
	textures = {
		{"crazymushrrom.png"},
	},
	blood_texture = "ethereal_mushroom_sapling.png",
	makes_footstep_sound = true,
	sounds = {
		random = "crazyman",
		--shoot_attack = "punch_boxing",
		--attack = "",
		--death = "",
	},
    
	pathfinding = 1,
	walk_velocity = 2,
	run_velocity = 4,
	jump_height = 5,
	stepheight = 3.0,
	floats = 0,
	knock_back = false,
	view_range = 35,
	drops = {
		{name = "ethereal_bosses:glove_glove", chance = 1, min = 1, max = 1},
		{name = "ethereal_bosses:crazymushrrom_trophy", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		walk_run = 15,
		stand_start = 1,
		stand_end = 20,
		walk_start = 130,
		walk_end = 170,
		run_start = 130,
		run_end = 170,
		punch_start = 31,
		punch_end = 49,
		shoot_start =81,
		shoot_end = 120,
	},
	
	after_activate = function(self, staticdata, def, dtime)
	  if core.get_modpath("mcl_armor") then
	   self.damage = 3
         end
	end,	
})

mobs:register_arrow("ethereal_bosses:mushroom_shot", {
	visual = "cube",
	visual_size = {x = 1, y = 1},
	collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
	velocity = 55,
	textures = {"ethereal_mushroom_block.png","ethereal_mushroom_block.png","ethereal_mushroom_block.png","ethereal_mushroom_block.png","ethereal_mushroom_block.png","ethereal_mushroom_block.png",},
	
	on_activate = function(self, staticdata, dtime_s)
	   self.object:set_armor_groups({immortal = 1, fleshy = 100})	
	        	   
	   self.damage = 18	   
	   
	   if core.get_modpath("mcl_armor") then
	    self.damage = 4	  
           end
          
	end,
	
	on_punch = function(self, hitter, tflp, tool_capabilities, dir)

		if hitter and hitter:is_player() and tool_capabilities and dir then

			local damage = tool_capabilities.damage_groups and
			tool_capabilities.damage_groups.fleshy or 1

			local tmp = tflp / (tool_capabilities.full_punch_interval or 1.4)

			if damage > 6 and tmp < 4 then

				self.object:set_velocity({
					x = dir.x * self.velocity,
					y = dir.y * self.velocity,
					z = dir.z * self.velocity,
				})
			end
		end
	end,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = self.damage},
		}, nil)
	end,
	
	hit_object = function(self, player)
		player:punch(self.object,1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 18},	
		}, nil)
	end,
	
	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 18},
		}, nil)
	end,
		
	hit_node = function(self, pos, node)
	end,
})

mobs:register_egg("ethereal_bosses:crazymushroom",S("Crazy Mushroom"),"crazymushrrom_egg.png", 0)

