AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

DeriveGamemode("sandbox")

include( "shared.lua" )
include( "teams.lua" )

//Serverside stuff goes here
local PlayerModels = {
Model("models/player/Group01/Female_01.mdl"),
Model("models/player/Group01/Female_02.mdl"),
Model("models/player/Group01/Female_03.mdl"),
Model("models/player/Group01/Female_04.mdl"),
Model("models/player/Group01/Female_05.mdl"),
Model("models/player/Group01/Female_06.mdl"),
Model("models/player/Group01/Male_01.mdl"),
Model("models/player/Group01/male_02.mdl"),
Model("models/player/Group01/male_03.mdl"),
Model("models/player/Group01/Male_04.mdl"),
Model("models/player/Group01/Male_05.mdl"),
Model("models/player/Group01/male_06.mdl"),
Model("models/player/Group01/male_07.mdl"),
Model("models/player/Group01/male_08.mdl"),
Model("models/player/Group01/male_09.mdl")
}


function GM:PlayerConnect(name, ip)

end

function GM:PlayerInitialSpawn(ply)

end

function GM:PlayerAuthed(ply, SteamID, UniqueID)

end

function GM:PlayerSpawn(ply)
    local RanTeam = math.random(1,3)
	ply:SetGamemodeTeam( RanTeam )
	local PlyModel = table.Random(PlayerModels)
	ply:SetModel(PlyModel)
	if (ply:IsAdmin() || ply:IsSuperAdmin() ) then
		ply:Give("weapon_physgun")
		ply:Give("gmod_tool")
	end
	ply:GiveGamemodeWeapons()
end

function GM:PlayerLoadout(ply)

end