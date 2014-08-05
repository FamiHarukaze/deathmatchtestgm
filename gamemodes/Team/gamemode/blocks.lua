
function BlockSents( ply, sent_type )
	if !ply:IsSuperAdmin() then return false end
end
 
hook.Add( "PlayerSpawnSENT", "BlockSents", BlockSents )

function BlockDriving( ply, ent )
	if !ply:IsSuperAdmin() then return false end
end
hook.Add( "CanDrive", "BlockDriving", BlockDriving )

function BlockNPCs( ply, ent )
	if !ply:IsSuperAdmin() then return false end
end
hook.Add( "PlayerSpawnNPC", "BlockNPCs", BlockNPCs )