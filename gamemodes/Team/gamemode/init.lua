AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

DeriveGamemode("sandbox")

include( "shared.lua" )
include( "teams.lua" )
include( "blocks.lua" )

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
	for k, v in pairs(player.GetAll()) do
		v:PrintMessage( HUD_PRINTTALK, name .. " just became a beta tester!")
		if v:IsSuperAdmin() then
			v:SendHint(name .. " joined (" .. ip .. ")")
		end
	end
end

function GM:PlayerInitialSpawn(ply)
	local RanTeam = math.random(1,3)
	ply:SetGamemodeTeam( RanTeam )
end

function GM:PlayerAuthed(ply, SteamID, UniqueID)

end

function GM:PlayerSpawn(ply)
	local PlyModel = table.Random(PlayerModels)
	ply:SetModel(PlyModel)
	ply:GiveGamemodeWeapons()
	ply:SetupHands()
    ply:SetRunSpeed(500)
    ply:SetWalkSpeed(300)
end

function GM:PlayerLoadout(ply)

end

function GM:PlayerShouldTakeDamage( ply, attacker ) 

    if ( (ply:IsPlayer() && attacker:IsPlayer()) && (ply:Team() == attacker:Team()) ) then
        
        attacker:PrintMessage(HUD_PRINTTALK, "Do not teamkill!")
        return false

    end
 
    return true

end

function GM:PlayerSetHandsModel( ply, ent )

	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end

end