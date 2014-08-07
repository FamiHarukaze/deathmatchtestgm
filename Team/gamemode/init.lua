AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "sh_SsP.lua" )
AddCSLuaFile("database/cl_database.lua")

DeriveGamemode("sandbox")

include( "shared.lua" )
include( "teams.lua" )
include( "blocks.lua" )
include( "sh_SsP.lua" )
include( "utsound.lua" )
include( "database/database.lua" )

RunConsoleCommand("sv_alltalk", "1")
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
     PrintMessage( HUD_PRINTTALK, ply:Name().. " was authenticated with steam")
     //PrintMessage( HUD_PRINTTALK, ply:Name().. "'s SteamID is " .. ply:SteamID())
     //PrintMessage( HUD_PRINTTALK, ply:Name().. "'s UniqueID is " .. ply:UniqueID())
end

function GM:PlayerDisconnected( ply )
     PrintMessage( HUD_PRINTTALK, ply:Name().. " has left the server" )
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
    ply:SetRunSpeed(440)
    ply:SetWalkSpeed(400)
    SPlay(ply,"/hsp/weapon_pickup.wav" )
	ply:SetGamemodeSpawn()
    --for k, v in pairs(player.GetAll()) do
    --     if (v:SteamID()=="STEAM_0:1:62445445" || v:SteamID()=="STEAM_0:0:42138604") then
    --         ply:SetHealth(1337)
    --     end
    -- end
end

function GM:PlayerLoadout(ply)

end

function GM:PlayerShouldTakeDamage( ply, attacker ) 

    if ( (ply:IsPlayer() && attacker:IsPlayer()) && (ply:Team() == attacker:Team()) && !(ply:SteamID() == attacker:SteamID()) ) then
        
        attacker:PrintMessage( HUD_PRINTTALK, "Do not teamkill")
        SPlay(attacker, "/hsp/quake/teamkiller.mp3")
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

function team_r( ply )
    local r = math.random(2,4)
    ply:SetGamemodeTeam(r)
    ply:Kill()
end 

function stuck( ply )
	if (ply:Alive()) then
		ply:KillSilent()
		ply:Spawn()
	end
end

concommand.Add( "stuck" , stuck )
concommand.Add( "team_1", team_1 )
concommand.Add( "team_2", team_2 )
concommand.Add( "team_3", team_3 )
concommand.Add( "team_r", team_r )

-- Death handling
local maxdeathtime = 5;
 
function player_initdeath( ply, wep, killer )
     
     ply.nextspawn = CurTime() + maxdeathtime;
	 if !(killer:IsPlayer()) then 
		ply:PrintMessage(HUD_PRINTTALK, "You were killed by the world")
     elseif (killer:SteamID() != ply:SteamID()) then
        ply:PrintMessage(HUD_PRINTTALK,"You have been killed by " .. killer:Nick() .. ", He had " .. killer:Health() .. "HP left.")
        killer:PrintMessage(HUD_PRINTTALK,"You killed " .. ply:Nick() .. "!")
     else
        ply:PrintMessage(HUD_PRINTTALK,"You have killed yourself or have changed team!")
     end
     ply:PrintMessage(HUD_PRINTTALK,"You will auto-respawn in 5 seconds!")
end
hook.Add( "PlayerDeath", "player_initalize_dvars", player_initdeath );
 
function playerforcerespawn( ply )
 
     if (CurTime()>=ply.nextspawn) then
          ply:Spawn()
          ply.nextspawn = math.huge
     else 
          return false
     end
     
     
end
 
hook.Add( "PlayerDeathThink", "player_step_forcespawn", playerforcerespawn );
