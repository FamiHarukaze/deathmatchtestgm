
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

function BlockRagdolls( ply, ent )
	if !ply:IsSuperAdmin() then return false end
end
hook.Add( "PlayerSpawnRagdoll", "BlockRagdolls", BlockRagdolls )

function BlockVehicles( ply, model, name, info )
	if !ply:IsSuperAdmin() then return false end
end
hook.Add( "PlayerSpawnVehicle", "BlockVehicle", BlockVehicles )

function BlockEffects( ply, ent )
	if !ply:IsSuperAdmin() then return false end
end
hook.Add( "PlayerSpawnEffect", "BlockEffect", BlockEffect )

function BlockObject( ply, model, skin )
	if !ply:IsSuperAdmin() then return false end
end
//hook.Add( "PlayerSpawnObject", "BlockObject", BlockObject )

function BlockTool( ply, tr, tool )
	if !ply:IsSuperAdmin() then return false end
end
hook.Add( "CanTool", "BlockTool", BlockTool )

function BlockWeapon( ply, ent, info )
	if !ply:IsSuperAdmin() then return false end
end
hook.Add( "PlayerSpawnWeapon", "BlockWeapon", BlockWeapon )