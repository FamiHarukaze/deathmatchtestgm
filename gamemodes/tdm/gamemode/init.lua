AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
DeriveGamemode("sandbox")

include( "shared.lua" )

//Serverside stuff goes here
local PlayerModels = {
Model("models/player/Group01/Female_01.mdl"),
Model("models/player/Group01/Female_02.mdl"),
Model("models/player/Group01/Female_03.mdl"),
Model("models/player/Group01/Female_04.mdl"),
Model("models/player/Group01/Female_05.mdl"),
Model("models/player/Group01/Female_06.mdl"),
Model("models/player/Group01/Female_07.mdl"),
Model("models/player/Group01/Male_01.mdl"),
Model("models/player/Group01/Male_02.mdl"),
Model("models/player/Group01/Male_03.mdl"),
Model("models/player/Group01/Male_04.mdl"),
Model("models/player/Group01/Male_05.mdl"),
Model("models/player/Group01/Male_06.mdl"),
Model("models/player/Group01/Male_07.mdl"),
Model("models/player/Group01/Male_08.mdl"),
Model("models/player/Group01/Male_09.mdl")
}


function GM:PlayerConnect(name, ip)

end

function GM:PlayerInitialSpawn(ply)

end

function GM:PlayerAuthed(ply, SteamID, UniqueID)

end

function GM:PlayerSpawn(ply)
	ply:SetModel(table.Random(PlayerModels))
	ply:Give("weapon_crowbar")
	if (ply:IsAdmin() || ply:IsSuperAdmin() ) then
		ply:Give("weapon_physgun")
		ply:Give("gmod_tool")
	end
end

function GM:PlayerLoadout(ply)

end