minetest.register_node('moretools:admin_block', {
	description = "Admin Block",
	tiles = {"admin_block.png"},
	wield_image = "admin_block.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	groups = {snappy=2,cracky=2,oddly_breakable_by_hand=3},
	legacy_wallmounted = true,
})


minetest.register_craft({
	type = "cooking",
	output = "moretools:admin_block",
	recipe = "default:diamond",
})