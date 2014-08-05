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

local tm = {}

function GM:PlayerConnect(name, ip)
	for k, v in pairs(player.GetAll()) do
		v:PrintMessage( HUD_PRINTTALK, name .. " just became a beta tester!")
		if v:IsSuperAdmin() then
			v:SendHint(name .. " joined (" .. ip .. ")", 0)
		end
	end
end

function GM:PlayerAuthed(ply, SteamID, UniqueID)

end

function GM:PlayerDisconnected( ply )
     PrintMessage( HUD_PRINTTALK, ply:Name().. " has left the server." )
end

function GM:PlayerInitialSpawn(ply)
	local tm[ply] = math.random(1,3)
	ply:SetGamemodeTeam(tm[ply])
end

function GM:PlayerSpawn(ply)
	local PlyModel = table.Random(PlayerModels)
	ply:SetModel(PlyModel)
	ply:GiveGamemodeWeapons()
	ply:SetupHands()
    ply:SetRunSpeed(500)
    ply:SetWalkSpeed(300)
    ply:SetGamemodeTeam(tm[ply])
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

function team_1( ply )
 
    ply:SetTeam(1)
    ply:Kill()
    tm[ply] = 1
end
 
function team_2( ply )
 
    ply:SetTeam(2)
    ply:Kill()
    tm[ply] = 2
end

function team_3( ply )
 
    ply:SetTeam(3)
    ply:Kill()
    tm[ply] = 3
end
 
concommand.Add( "team_1", team_1(ply) )
concommand.Add( "team_2", team_2(ply) )
concommand.Add( "team_3", team_3(ply) )
