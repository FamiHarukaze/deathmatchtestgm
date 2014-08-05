AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
DeriveGamemode("sandbox")

include( "shared.lua" )

//Serverside stuff goes here

function GM:PlayerConnect(name, ip)

end

function GM:PlayerInitialSpawn(ply)

end

function GM:PlayerAuthed(ply, SteamID, UniqueID)

end

function GM:PlayerSpawn(ply)
	ply:SetModel( "models/player/odessa.mdl" )
	ply:Give("weapon_crowbar")
	ply:Give("weapon_physgun")
	ply:Give("gmod_tool")
end

function GM:PlayerLoadout(ply)
	if (ply:IsAdmin() || ply:IsSuperAdmin() ) then
		ply:Give("weapon_physgun")
		ply:Give("gmod_tool")
	end
end