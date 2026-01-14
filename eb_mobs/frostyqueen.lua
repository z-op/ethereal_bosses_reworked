-- SOUNDS :
-- https://freesound.org/people/MadamVicious/sounds/218185/ (CC0)
-- https://freesound.org/people/satchdev/sounds/325411/ (CC0)
-- https://freesound.org/people/MadamVicious/sounds/347339/  (CC0)

local S = core.get_translator("ethereal_bosses")

local last_part = 0
local last_attack = 0

local function frosty_queem_part (pos)
core.add_particlespawner({
amount = 10, 
time = 1, 		    
minpos = {x = pos.x + 0.7 , y = pos.y, z = pos.z + 0.7},
maxpos = {x = pos.x - 0.7, y = pos.y + 2, z = pos.z - 0.7},		    
minvel = {x = 0, y = 1, z = 0}, 
maxvel = {x = 0, y = 1, z = 0},  
minacc = {x = -1, y = -1, z = -1},
maxacc = {x = 1, y = 1, z = 1}, 		    
minexptime = 1, 
maxexptime = 1,		     
minsize = 2,
maxsize = 3,		    
collisiondetection = false,
vertical = true, 
texture = "fqp.png", 
glow = 4, 
})
end

mobs:register_mob("ethereal_bosses:frostyqueen", {
	--nametag = "Frosty Queen Boss",
	type = "monster",
	passive = false,
	attack_npcs = false,
	--attack_type = "shoot",
	attack_type = "dogshoot",
	dogshoot_switch = 1,
	dogshoot_count_max = 2, 
	dogshoot_count2_max = 2, 
	shoot_interval = 1.5,
	shoot_offset = 1.5,
	arrow = "ethereal_bosses:snowflake",
	pathfinding = true,
	reach = 5,
	damage = 20,
	hp_min = 1500,
	hp_max = 1500,
	armor = 80,
	collisionbox = {-0.4, -0.2, -0.4, 0.4, 2, 0.4},
	visual = "mesh",
	visual_size = {x = 9, y = 9},
	mesh = "frosty_queen.b3d",
	--rotate = 180,
	textures = {
		{"frosty_queen.png"},
	},
	glow = 8,
	blood_texture = "fqp.png",
	makes_footstep_sound = true,
	sounds = {
		random = "girlsmile",
		--damage = "golpeada",
		attack = "attack_range_queen",
		death = "gameover",	
	},
	
	walk_velocity = 0,
	run_velocity = 0,
	jump_height = 1,
	stepheight = 1.1,
	floats = 0,
	view_range = 35,
	knock_back = false,
	drops = {
		  {name = "ethereal_bosses:aurora_crystal", chance = 1, min = 9, max = 9},
		  {name = "ethereal_bosses:frostyqueen_trophy", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_run = 15,
		stand_start = 1,
		stand_end = 39,
		walk_start = 1,
		walk_end = 39,
		run_start = 1,
		run_end = 39,
		punch_start = 50,
		punch_end = 90,
		shoot_start =101,
		shoot_end = 120,	
	},
	
	after_activate = function(self, staticdata, def, dtime)	  
	  if core.get_modpath("mcl_armor") then
	   self.damage = 2
         end
	end,
	
	do_custom = function(self, dtime)

    	         local current_time = core.get_us_time()
    	         
		 if current_time - last_part >= 2 * (10^6)  then 
		 last_part = current_time
		
		 local pos = self.object:get_pos()
		   frosty_queem_part (pos)
		end   
	end,
	
        custom_attack = function(self, to_attack)	
	 local current_time = core.get_us_time()
	 
	  if current_time - last_attack >= 15 * (10^6)  then 
		last_attack = current_time 
		
                self:set_animation("punch")
                
		local pos = self.object:get_pos()
		core.sound_play("attack_range_queen", {pos = pos, gain = 0.5})
		
                core.add_entity({x=pos.x +3,y=pos.y,z=pos.z}, "ethereal_bosses:icemonster")
                core.add_entity({x=pos.x -3,y=pos.y,z=pos.z}, "ethereal_bosses:icemonster")
                core.add_entity({x=pos.x,y=pos.y,z=pos.z-3}, "ethereal_bosses:icemonster")
                core.add_entity({x=pos.x,y=pos.y,z=pos.z+3}, "ethereal_bosses:icemonster")
                
	     
	     end	
	end,					
})

-- ARROW -----------------------------------------------------------
mobs:register_arrow("ethereal_bosses:snowflake", {
	visual = "cube",
	visual_size = {x = 1.5, y = 1.5},
	collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
	velocity = 35,
	textures = {"default_ice.png","default_ice.png","default_ice.png","default_ice.png","default_ice.png","default_ice.png"},
	glow = 2,
	expire = 0.25,

	on_activate = function(self, staticdata, dtime_s)
	   self.object:set_armor_groups({immortal = 1, fleshy = 100})	
	        	   
	   self.damage = 22	   
	   
	   if core.get_modpath("mcl_armor") then
	    self.damage = 4	  
           end
          
	end,
	
	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = self.damage},
		}, nil)
	end,
	
	hit_node = function(self, pos, node)
	end,
	
})

mobs:register_egg("ethereal_bosses:frostyqueen", S("Frosty Queen"), "eggsfrostyqueen.png", 0)

