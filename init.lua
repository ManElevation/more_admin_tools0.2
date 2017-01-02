dofile(modpath .. "/adminpic.lua")
dofile(modpath .. "/admininv.lua")
dofile(modpath .. "/adminblock.lua")

if minetest.setting_getbool("log_mods") then
	minetest.log("action", S("More Admin Tools loaded!"))
end
