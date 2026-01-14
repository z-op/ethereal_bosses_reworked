local S = core.get_translator("ethereal_bosses")

mobs:register_mob("ethereal_bosses:fungs", {
	type = "npc",
	passive = true,
	attack_type = "dogfight",
	owner_loyal = true,
	pathfinding = true,
	reach = 2,
	damage = 5,
	hp_min = 80,
	hp_max = 80,
	armor = 80,
	collisionbox = {-0.4, -0.5, -0.4, 0.4, 0.5, 0.4},
	visual = "mesh",
	visual_size = {x = 9, y = 9},
	mesh = "fungs.b3d",
	textures = {
		{"fungs.png"},
	},
	--blood_texture = ".png",
	makes_footstep_sound = true,
	sounds = {
		random = "monster1",
	},

	pathfinding = 1,
	walk_velocity = 5,
	run_velocity = 7,
	jump_height = 2,
	stepheight = 1.1,
	floats = 0,
	view_range = 45,
	owner = "", 
	order = "follow",
	drops = {},
	water_damage = 0,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		speed_run = 15,
		stand_start = 1,
		stand_end = 1,
		walk_start = 30,
		walk_end = 49,
		run_start = 80,
		run_end = 99,
	},

	follow = {
		"ethereal_bosses:rotten_wood",
	},

	on_rightclick = function(self, clicker)

	        if mobs:feed_tame(self, clicker, 1, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 50, 50, 90, false, nil) then return end

		 if self.owner and self.owner == clicker:get_player_name() then

			 if self.order ~= "stand" then
				self.order = "stand"
				self.state = "stand"
				self.object:set_velocity({x = 0, y = 0, z = 0})
				mobs:set_animation(self, "stand")

			 else
				self.order = "follow"
				mobs:set_animation(self, "walk")

			 end
		   end
	      end,
})

mobs:register_egg("ethereal_bosses:fungs", S("Fungs"), "fungs_egg.png", 0)

