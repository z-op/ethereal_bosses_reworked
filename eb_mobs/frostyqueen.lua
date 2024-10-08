-- SOUNDS :
-- https://freesound.org/people/MadamVicious/sounds/218185/ (CC0)
-- https://freesound.org/people/satchdev/sounds/325411/ (CC0)

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
	shoot_interval = 15,
	shoot_offset = 1.5,
	arrow = "ethereal_bosses:spectrum_arrow",
	pathfinding = true,
	reach = 3,
	damage = 8,
	hp_min = 1500,
	hp_max = 1500,
	armor = 80,
	collisionbox = {-0.4, -0.2, -0.4, 0.4, 1.5, 0.4},
	visual = "mesh",
	visual_size = {x = 9, y = 9},
	mesh = "frostyqueen2.b3d",
	--rotate = 180,
	textures = {
		{"frosty_queen_2.png"},
	},
	--glow = 8,
	blood_texture = "fqp.png",
	makes_footstep_sound = true,
	sounds = {
		random = "girlsmile",
		death = "gameover",
	},

--	fly = true,
--	fly_in = "air",
	walk_velocity = 0,
	run_velocity = 0,
	jump_height = 1,
	stepheight = 1.1,
	floats = 0,
	view_range = 35,
	knock_back = false,
	drops = {
		--{name = "ethereal_bosses:crystal_gilly_staff", chance = 3, min = 1, max = 1},
		--{name = "ethereal_bosses:crystal_ingot", chance = 1, min = 1, max = 2},
		  {name = "ethereal_bosses:frostyqueen_trophy", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	animation = {
		speed_run = 15,
		stand_start = 1,
		stand_end = 20,
		walk_start = 30,
		walk_end = 50,
		run_start = 30,
		run_end = 50,
		shoot_start =60,
		shoot_end = 90,
	},

	-- ESSA PARTE FOI RETIRADA DO MOD DE ENDERMAN DO MOBS MINECLONE :)
	do_custom = function(self, dtime)

		
		local specpos = self.object:get_pos()
		local chanceOfParticle = math.random(0, 1)
		if chanceOfParticle == 1 then
			minetest.add_particle({
				pos = {
					x = specpos.x + math.random(-1, 1) * math.random() / 2,
					y = specpos.y + math.random(0, 3),
					z = specpos.z + math.random(-1, 1) * math.random() / 2
				},
				velocity = {
					x = math.random(-.25, .25),
					y = math.random(-.25, .25),
					z = math.random(-.25, .25)
				},
				acceleration = {
					x = math.random(-.5, .5),
					y = math.random(-.5, .5),
					z = math.random(-.5,.5)
				},
				expirationtime = 0.3,
				size = math.random(2,5),
				collisiondetection = true,
				vertical = false,
				texture = "fqp.png",
				glow = 8,
			})
		end
		
		
    
	end,

	on_die = function(self, pos) -- POSIÇÃO
		
	end
})





-- ARROW -----------------------------------------------------------
mobs:register_arrow("ethereal_bosses:spectrum_arrow", {
	visual = "sprite",
	visual_size = {x = 0.5, y = 0.5},
	velocity = 18,
	textures = {"fqp.png"},
	tail = 1,
	tail_texture = "fqp.png",
	tail_size = 10,
	glow = 5,
	expire = 0.1,


	hit_node = function(self, pos) -- self e pos
		-- Ajuste de posição das caveiras apos ser adicinadas
		local pos = {x = pos.x, z = pos.z, y =pos.y + 2}
		minetest.add_entity ( pos , "ethereal_bosses:icemonster")
	end
})


mobs:register_egg("ethereal_bosses:frostyqueen", "frostyqueen", "eggsfrostyqueen.png", 1)
