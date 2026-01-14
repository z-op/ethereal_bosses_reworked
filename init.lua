local path = core.get_modpath("ethereal_bosses")

-- MONSTERS ; =========================================
if core.get_modpath("boss_s_hudbar") then 
dofile(path .. "/eb_bar.lua")
end

dofile(path.."/eb_mobs/crazymushroom.lua")
dofile(path.."/eb_mobs/depths_eye.lua")
dofile(path.."/eb_mobs/frostyqueen.lua")
dofile(path.."/eb_mobs/fungs.lua")
dofile(path.."/eb_mobs/heated.lua")
dofile(path.."/eb_mobs/icemonster.lua")
dofile(path.."/eb_mobs/nature_guardian.lua")
dofile(path.."/eb_mobs/pixies.lua")

dofile(path.."/eb_mobs/elder.lua")

-- ITENS; ===========================================
dofile(path .. "/eb_itens.lua")
dofile(path .. "/eb_recipes.lua")
-- TOOLS : ==========================================
dofile(path .. "/eb_tools.lua")
-- SPAWN : ===========================================

if core.get_modpath("3d_armor") then
dofile(path.."/eb_armors/eb_3d_armors.lua")
end

if core.get_modpath("mcl_armor") then
dofile(path.."/eb_compatibility.lua")
dofile(path.."/eb_armors/eb_mcl_armors.lua")
end

if core.get_modpath("ethereal") or core.get_modpath("mcl_core") then
dofile(path .. "/eb_spawn_mods.lua")
else
dofile(path .. "/eb_spawn.lua")
end



