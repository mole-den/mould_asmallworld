-- default biome functions that get called if we can't find a a specific biome that works for us
--CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/biomes/mountain/mountain.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )
RegisterSpawnFunction( 0xff528900, "spawn_portal" )

--[[RegisterSpawnFunction( 0xffC4189B, "spawn_trees" )
RegisterSpawnFunction( 0xffC41820, "spawn_big_bushes" )
RegisterSpawnFunction( 0xffC41860, "spawn_vines" )]]--

RegisterSpawnFunction( 0xffc4186a, "spawn_wasd" )
RegisterSpawnFunction( 0xffc45f7b, "spawn_wasd_trigger" )
RegisterSpawnFunction( 0xffc4186b, "spawn_mouse" )
RegisterSpawnFunction( 0xffc4187b, "spawn_mouse_trigger" )

--[[RegisterSpawnFunction( 0xffc4187c, "spawn_grass" )
RegisterSpawnFunction( 0xffff5a0f, "spawn_music_trigger" )
RegisterSpawnFunction( 0xff80FF5A, "spawn_vines_b" )]]--

function spawn_wands( x, y ) end

function spawn_portal(x, y)
	EntityLoad( "data/entities/buildings/eldritch_portal_start.xml", x, y )
end

g_trees =
{
	total_prob = 0,

}

g_big_bushes =
{
	total_prob = 0,

}

g_props =
{
	total_prob = 0,

}

g_surprise =
{
	total_prob = 0,
	
}

function init( x, y, w, h )
	
	if GameGetIsGamepadConnected() then
		LoadPixelScene( "data/biome_impl/mountain/left_entrance.png", "data/biome_impl/mountain/left_entrance_visual.png", x, y, "data/biome_impl/mountain/left_entrance_background_gamepad.png", true )
	else
		LoadPixelScene( "data/biome_impl/mountain/left_entrance.png", "data/biome_impl/mountain/left_entrance_visual.png", x, y, "data/biome_impl/mountain/left_entrance_background.png", true )
	end
end

function spawn_trees( x, y )
	spawn( g_trees, x, y+28, 0, 0 )
end

function spawn_big_bushes( x, y )
	spawn( g_big_bushes, x, y+12, 0, 0 )
end

function spawn_vines( x, y )
	spawn( g_vines, x, y )
end

function spawn_vines_b(x, y)
	spawn(g_vines,x,y)
end

function spawn_wasd( x, y )
	if (GameGetIsGamepadConnected() == false) then
		EntityLoad( "data/entities/particles/image_emitters/controls_wasd.xml", x, y )
	else
		EntityLoad( "data/entities/particles/image_emitters/controls_stick.xml", x-1, y-1 )
	end
	
	spawn(g_surprise,x,y,0,0)
end

function spawn_mouse( x, y )
	if (GameGetIsGamepadConnected() == false) then
		EntityLoad( "data/entities/particles/image_emitters/controls_mouse.xml", x, y )
	else
		EntityLoad( "data/entities/particles/image_emitters/controls_lt.xml", x, y-2 )
	end
end

function spawn_wasd_trigger( x, y )
	if ( GameIsIntroPlaying() == false ) then 
		EntityLoad( "data/entities/buildings/controls_wasd_trigger.xml", x, y )
	end
end

function spawn_mouse_trigger( x, y )
	EntityLoad( "data/entities/buildings/controls_mouse_trigger.xml", x, y )
end

function spawn_grass( x, y )
	EntityLoad( "data/entities/props/mountain_left_entrance_grass.xml", x, y )
end

function spawn_potions( x, y ) end

function spawn_music_trigger( x, y )
	EntityLoad( "data/entities/buildings/music_trigger_mountain_left_entrance.xml", x, y )
end

function spawn_props(x, y)
	spawn(g_props,x,y,0,0)
end

