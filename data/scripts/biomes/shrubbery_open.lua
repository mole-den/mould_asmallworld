CHEST_LEVEL = 3
dofile_once("data/scripts/director_helpers.lua")
dofile_once("data/scripts/director_helpers_design.lua")
dofile_once("data/scripts/biome_scripts.lua")

RegisterSpawnFunction( 0xffffeedd, "init" )
--RegisterSpawnFunction( 0xff528900, "spawn_small_enemies" )
--RegisterSpawnFunction( 0xff400080, "spawn_big_enemies" ) 


g_small_enemies =
{
	total_prob = 0,

	{
		prob   		= 0.7,
		min_count	= 1,
		max_count	= 2,    
		entity 	= "data/entities/animals/monk.xml"
	},

}

g_big_enemies =
{
	total_prob = 0,

	{
		prob   		= 1,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/deer.xml"
	},
}

function spawn_small_enemies(x, y)
	spawn(g_small_enemies,x,y)
end

function spawn_big_enemies(x, y)
	spawn(g_big_enemies,x,y)
end

function init( x, y, w, h )
	LoadPixelScene( "", "", x, y, "data/weather_gfx/background_shrubbery.png", true )
end