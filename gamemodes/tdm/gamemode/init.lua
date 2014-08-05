AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

function GM:PlayerConnect(name, ip)

end

function GM:PlayerInitialSpawn(ply)

end

function GM:PlayerAuthed(ply, SteamID, UniqueID)

end

function GM:PlayerSpawn(ply)
	ply:SetModel( "models/player/odessa.mdl" )
end

function GM:PlayerSetModel( ply )

end