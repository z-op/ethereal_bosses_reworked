-- SOUND :
-- https://freesound.org/people/NicknameLarry/sounds/489901/ (CC0)

local S = core.get_translator("ethereal_bosses")
local last_attack = 0
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
	
	
	custom_attack = function(self, to_attack)	
	 local current_time = core.get_us_time()
	 local pos_ht = self.object:get_pos()
	  if current_time - last_attack >= 3 * (10^6)  then 
		last_attack = current_time 
	            
	            self:set_animation("punch")
	            core.log("punch ok")

		    core.after(0.5,function()
		     self.attack:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = self.damage}
		     }, nil)	
		   end)	     
	     end	
        end,			
})

mobs:register_egg("ethereal_bosses:heated", S("Heated"), "eggsheated.png", 0)

