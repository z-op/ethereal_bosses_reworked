
local dialod_txt = [[

            	 There was a queen who, seeking revenge,
     used forbidden magic. Her heart froze, and she became the
     frosty queen. Her army turned into ice monsters, and the magic created two 
     terrifying beings: one a crazy mushroom and the other one that emerged from lava.
  													Be careful, adventurer!

     Do you have 20 Eyes? I will give you something in return.


]]

--"Yes, I have them."
local function elder_dialog(self,clicker)

        
         local formspec_dialog = {
            "size[10,4]".. 
            "image[0,0.6;2,2;elder_fotinha.png] "..        
            "label[1.5.1,0.1;"..dialod_txt.."]"..
            "button[3.7,3;2,2;yes;Yes, I have them]"..
            "background[1,2;6,4;elder_gui_bg.png;true]"
        }
        
        return table.concat(formspec_dialog, "")
 
end



mobs:register_mob("ethereal_bosses:elder", {

    type = "npc",
    nametag = "Elder" ,
    hp_max = 999,
    hp_min = 999,
    walk_velocity = 0,
    run_velocity = 0,
    jump = false,
    fall_speed = -10,
    collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
    visual = "mesh",
    mesh = "elder.b3d",
    textures = {"elder.png"},
    --visual_size = {x=10, y=10},
    makes_footstep_sound = true,
   -- sounds = { },
    
    
    on_rightclick = function(self, clicker)
       
    	
         local open =  elder_dialog()
         minetest.show_formspec(clicker:get_player_name(), "ethereal_bosses:elder_dialog", open)
        
        
         
        
    end,
   
})


minetest.register_on_player_receive_fields(function(player, formname, fields)

   
    local eyes = player:get_inventory():contains_item("main", "ethereal_bosses:deye 20")
    
	    if formname == "ethereal_bosses:elder_dialog" and fields.yes then
	    
		     if eyes then
		     player:get_inventory():remove_item("main","ethereal_bosses:deye 20" )
		     player:get_inventory():add_item("main", "ethereal_bosses:sword_obsidian")
		     minetest.chat_send_player(player:get_player_name(), "<Elder> Thank you, it was a pleasure doing business with you, good luck..") 
		    
		        else
		        
		     minetest.chat_send_player(player:get_player_name(), "<Elder> You don't have enough eyes, don't try to fool me, that's ugly..") 
		     
		     end
	    
	    end
      
end)

mobs:register_egg("ethereal_bosses:elder", "Elder", "elder_gui_bg.png", 0)
