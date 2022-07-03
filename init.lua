ModMagicNumbersFileAdd( "mods/mould_theotherside/files/magic_numbers.xml" ) 
ModMaterialsFileAdd("mods/mould_theotherside/files/materials.xml")

local nxml = dofile_once("mods/mould_theotherside/lib/nxml.lua")
	
local content = ModTextFileGetContent("data/biome/_biomes_all.xml")
local xml = nxml.parse(content)
xml:add_children(nxml.parse_many[[
	<Biome height_index="0" color="ff64647f" biome_filename="data/biome/shrubbery_open.xml" />
	<Biome height_index="0" color="ff18181e" biome_filename="data/biome/shrubbery_solid.xml" />
]])
ModTextFileSetContent("data/biome/_biomes_all.xml", tostring(xml))


	
function OnModInit()
	print("Mod - OnModInit()")
end
	
function OnModPostInit()
	print("Mod - OnModPostInit()")
end
	
function OnPlayerSpawned( player_entity )

end
	
function OnWorldPostUpdate()

end
	
function OnPlayerDied()
	print("dead")
end
	
function Moulding()

end
	
GamePrint("A Small World")