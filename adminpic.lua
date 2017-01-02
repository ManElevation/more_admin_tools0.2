minetest.register_tool("moretools:pick_admin", {
	description = S("Admin Pickaxe"),
	range = 12,
	inventory_image = "moretools_adminpick.png",
	groups = {not_in_creative_inventory = moretools.creative},
	tool_capabilities = {
		full_punch_interval = 0.1,
		max_drop_level = 3,
		groups = {cracky = 3},
		groupcaps= {
			unbreakable = {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			fleshy =      {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			choppy =      {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			bendy =       {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			cracky =      {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			crumbly =     {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			snappy =      {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
		},
		damage_groups = {fleshy = 1000},
	},
})

minetest.register_tool("moretools:pick_admin_with_drops", {
	description = S("Admin Pickaxe with Drops"),
	range = 12,
	inventory_image = "moretools_adminpick_with_drops.png",
	groups = {not_in_creative_inventory = moretools.creative},
	tool_capabilities = {
		full_punch_interval = 0.35,
		max_drop_level = 3,
		groupcaps = {
			unbreakable = {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			fleshy =      {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			choppy =      {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			bendy =       {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			cracky =      {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			crumbly =     {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
			snappy =      {times={[1] = 0, [2] = 0, [3] = 0}, uses = 0, maxlevel = 3},
		},
		damage_groups = {fleshy = 1000},
	},
})

minetest.register_on_punchnode(function(pos, node, puncher)
	if puncher:get_wielded_item():get_name() == "moretools:pick_admin"
	and minetest.get_node(pos).name ~= "air" then
		minetest.log("action", puncher:get_player_name() .. " digs " .. minetest.get_node(pos).name .. " at " .. minetest.pos_to_string(pos) .. " using an Admin Pickaxe.")
		minetest.remove_node(pos) -- The node is removed directly, which means it even works on non-empty containers and group-less nodes.
		nodeupdate(pos) -- Run node update actions like falling nodes.
	end
end)

if minetest.setting_getbool("log_mods") then
	minetest.log("action", S("More Admin Tools loaded."))
end