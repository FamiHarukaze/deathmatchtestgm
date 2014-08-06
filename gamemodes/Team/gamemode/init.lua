AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "sh_playsound.lua")

DeriveGamemode("sandbox")

include( "shared.lua" )
include( "teams.lua" )
include( "blocks.lua" )
include( "sh_playsound.lua")

RunConsoleCommand("sv_alltalk 1")
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
	ply:SetGamemodeTeam(1)
    ply:ConCommand( "team_menu" )
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

    if ( (ply:IsPlayer() && attacker:IsPlayer()) && (ply:Team() == attacker:Team()) && !(ply:SteamID() == attacker:SteamID()) ) then
        
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
    ply:SetGamemodeTeam(2)
    ply:Kill()
end
 
function team_2( ply )
    ply:SetGamemodeTeam(3)
    ply:Kill()
end

function team_3( ply )
    ply:SetGamemodeTeam(4)
    ply:Kill()
end
 
concommand.Add( "team_1", team_1 )
concommand.Add( "team_2", team_2 )
concommand.Add( "team_3", team_3 )

-- Death handling
local maxdeathtime = 5;
 
function player_initdeath( ply, wep, killer )
 
     ply.nextspawn = CurTime() + maxdeathtime;
	 if !(killer:IsPlayer()) then 
		ply:PrintMessage(HUD_PRINTTALK, "You were killed by the world")
	 end
	 
     if (killer:SteamID() != ply:SteamID()) then
        ply:PrintMessage(HUD_PRINTTALK,"You have been killed by " .. killer:Nick() .. ", He had " .. killer:Health() .. "HP left.")
     else
        ply:PrintMessage(HUD_PRINTTALK,"You have killed youself or have changed team!")
     end
     ply:PrintMessage(HUD_PRINTTALK,"You will auto-respawn in 5 seconds!")
end
hook.Add( "PlayerDeath", "player_initalize_dvars", player_initdeath );
 
function playerforcerespawn( ply )
 
     if (CurTime()>=ply.nextspawn && killer:IsPlayer()) then
          ply:Spawn()
          ply.nextspawn = math.huge
          
     elseif (!killer:IsPlayer()) then
          ply:Spawn()
          
     else 
          return false
     end
     
     
end
 
hook.Add( "PlayerDeathThink", "player_step_forcespawn", playerforcerespawn );
