------------------------
--Inventory management--
------------------------
--You need the "admininv" priv to run the commands. 
------------------------

minetest.register_privilege("admininv", "Player can use clear and copy")

minetest.register_chatcommand("clear", { --Register the clear command.
	params = "<Player>",
	description = "Clear inventory of a player",
	privs = {admininv = true},
	func = function(name,text)
	
    local input, rf = io.open(minetest.get_worldpath() .. "/players/" .. text, "r") --Check if the player file exist to prevent crash.
	if input then

	local inv = minetest.get_inventory({type="player", name=text}) --Get the inventory and stock it in inv.
	
	for i = 1 ,inv:get_size("main"), 1 do -- clear items of the main inventory grid of the player.    
	inv:set_stack("main", i, nil)
	 end
	
	for i = 1 ,inv:get_size("craft"), 1 do  -- clear items of the craft grid of the player.    
	inv:set_stack("craft", i, nil)
	end
	
	end
	end,
})

minetest.register_chatcommand("copy", { --Register the copy command.
	params = "<PlayerYouCopy>",
	description = "copy the inventory of a player and place the items in your inventory.",
	privs = {admininv = true},
	func = function(yname,param)
	
    local input, rf = io.open(minetest.get_worldpath() .. "/players/" .. param, "r") --Check if the player file exist to prevent crash.
	if input then

	local otherinv = minetest.get_inventory({type="player", name=param}) --Get the other player inventory and stock it in otherinv.
	local inv = minetest.get_inventory({type="player", name=yname})      --Get your inventory and stock it in inv.
	
	for i = 1 ,inv:get_size("main"), 1 do      -- Get items in the main inventory grid of the other player.    
	inv:set_stack("main", i, otherinv:get_stack("main", i))
	 end
	 
	for i = 1 ,inv:get_size("craft"), 1 do     -- Get items in the craft grid of the other player.             
	inv:set_stack("craft", i, otherinv:get_stack("craft", i))
	end
	
	end
	end,
})


