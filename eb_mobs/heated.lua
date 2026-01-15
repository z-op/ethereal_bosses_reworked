-- SOUND :
-- https://freesound.org/people/NicknameLarry/sounds/489901/ (CC0)

local S = core.get_translator("ethereal_bosses")

ethereal_bosses.heated_particles = core.settings:get_bool("heated_particles", true)

local function heated_part (pos)
core.add_particlespawner({
amount = 10, 
time = 1, 		    
minpos = {x = pos.x + 1.7 , y = pos.y+1, z = pos.z + 1.7},
maxpos = {x = pos.x - 1.7, y = pos.y + 4, z = pos.z - 1.7},		    
minvel = {x = 0, y = 1, z = 0}, 
maxvel = {x = 0, y = 4, z = 0},  
minacc = {x = -2, y = -1, z = -2},
maxacc = {x = 2, y = 4, z = 2}, 		    
minexptime = 1, 
maxexptime = 1,		     
minsize = 5,
maxsize = 10,		    
collisiondetection = false,
vertical = true, 
texture = "eb_smoke.png", 
glow = 4, 
})
end


mobs:register_mob("ethereal_bosses:heated", {
	--nametag = "Heated Boss",
	type = "monster",
	passive = false,
	attack_npcs = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 8,
	damage = 20,
	hp_min = 1300,
	hp_max = 1300,
	armor = 80,
	friendly_fire = true,
	collisionbox = {-1.0, -0.5, -1.0, 1.0, 3.0, 1.0},
	visual = "mesh",
	visual_size = {x = 30, y = 30},
	mesh = "heated_sword.b3d",
	--rotate = 180,
	textures = {
		{"heated_sword.png"},
	},
	glow = 8,
	blood_texture = "eb_smoke.png",
	makes_footstep_sound = true,
	sounds = {
		random = "monsterhot",
		--attack = "flaming_sword",
		--death = "",
	},
	--fly = false,
	--fly_in = "air",
	pathfinding = 1,
	walk_velocity = 2,
	run_velocity = 4,
	jump_height = 2,
	stepheight = 3.0,
	floats = 0,
	knock_back = false,
	view_range = 35,
	drops = {
		{name = "ethereal_bosses:flaming_sword", chance = 1, min = 1, max = 1},
		{name = "ebitems:heated_trophy", chance = 1, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 30,
		speed_punch = 50,
		stand_start = 1,
		stand_end = 20,
		walk_start = 30,
		walk_end = 50,
		run_start = 30,
		run_end = 50,
		punch_start = 55,
		punch_end = 100,
		punch_loop = false,
		punch2_start = 110,
		punch2_end = 150, -- 100 termina a espada
		punch2_loop = false,
		die_start = 160,
		die_end = 200,
	},
	
	after_activate = function(self, staticdata, def, dtime)
	  if core.get_modpath("mcl_armor") then
	   self.damage = 3
         end
	end,
	
	do_custom = function(self, dtime)
	   if not ethereal_bosses.heated_particles then return end
           local ht_pos = self.object:get_pos()
           local current_time = core.get_us_time()
           
	   self.last_part_ht = self.last_part_ht or 0
	   	
           if current_time - self.last_part_ht >= 2 * (10^6) then
	      self.last_part_ht = current_time
	         heated_part (ht_pos)
	   end	    
	end,

	custom_attack = function(self, to_attack)
  
	self.attack_count = (self.attack_count or 0) + 1
	if self.attack_count < 3 then return end
	self.attack_count = 0

	self:set_animation("punch", true)

	return true -- PARA CONTINUAR.
	end,					
})
	  
mobs:register_egg("ethereal_bosses:heated", S("Heated"), "eggsheated.png", 0)

