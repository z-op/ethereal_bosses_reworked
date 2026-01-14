local S = core.get_translator("ethereal_bosses")

mobs:register_mob("ethereal_bosses:icemonster", {
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	reach = 3,
	damage = 15,
	hp_min = 35,
	hp_max = 35,
	armor = 120,
	collisionbox = {-0.4, -0.8, -0.4, 0.4,1.0, 0.4},
	visual = "mesh",
	visual_size = {x = 16, y = 16},
	mesh = "ice_monster_guardian.b3d",
	textures = {
		{"ice_monster_guardian.png"},
	},
	blood_texture = "default_ice.png",
	makes_footstep_sound = true,
	sounds = {
		--attack = "",
		--death = "",
	},

	pathfinding = 1,
	walk_velocity = 1,
	run_velocity = 5,
	jump_height = 4,
	stepheight = 1.1,
	floats = 0,
	view_range = 35,
	drops = {},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 0,
		stand_end = 0,
		walk_start = 20,
		walk_end = 60,
		run_start = 70,
		run_end = 90,
		punch_start = 100,
		punch_end = 139,
	},
	
	after_activate = function(self, staticdata, def, dtime)
	  if core.get_modpath("mcl_armor") then
	   self.damage = 2
	   --core.log(tostring( self.damage))
         end
         
        -- core.after(10,function ()
         --  self.object:remove()
         --end)
         
	end,
})

mobs:register_egg("ethereal_bosses:icemonster", S("Ice Monster"), "ice_monster_guardian_egg.png", 0)

