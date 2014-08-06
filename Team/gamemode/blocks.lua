local WLProps = {
Model("models/props_borealis/borealis_door001a.mdl"),
Model("models/props_borealis/bluebarrel001.mdl"),
Model("models/props_building_details/Storefront_Template001a_Bars.mdl"),
Model("models/props_c17/concrete_barrier001a.mdl"),
Model("models/props_c17/door01_left.mdl"),
Model("models/props_c17/door02_double.mdl"),
Model("models/props_c17/fence01a.mdl"),
Model("models/props_c17/fence01b.mdl"),
Model("models/props_c17/fence02a.mdl"),
Model("models/props_c17/fence02b.mdl"),
Model("models/props_c17/fence03a.mdl"),
Model("models/props_c17/fence04a.mdl"),
Model("models/props_c17/oildrum001.mdl"),
Model("models/props_debris/metal_panel02a.mdl"),
Model("models/props_debris/metal_panel01a.mdl"),
Model("models/props_docks/channelmarker_gib02.mdl"),
Model("models/props_docks/channelmarker_gib01.mdl"),
Model("models/props_doors/door03_slotted_left.mdl"),
Model("models/props_junk/CinderBlock01a.mdl"),
Model("models/props_junk/PushCart01a.mdl"),
Model("models/props_junk/TrashDumpster02b.mdl"),
Model("models/props_junk/TrashDumpster01a.mdl"),
Model("models/props_lab/blastdoor001a.mdl"),
Model("models/props_lab/blastdoor001b.mdl"),
Model("models/props_lab/blastdoor001c.mdl"),
Model("models/props_junk/wood_crate001a.mdl"),
Model("models/props_junk/wood_crate001a_damaged.mdl"),
Model("models/props_junk/wood_crate002a.mdl"),
Model("models/props_wasteland/barricade001a.mdl"),
Model("models/props_wasteland/barricade002a.mdl"),
Model("models/props_wasteland/controlroom_desk001a.mdl"),
Model("models/props_wasteland/controlroom_filecabinet002a.mdl"),
Model("models/props_wasteland/controlroom_storagecloset001a.mdl"),
Model("models/props_wasteland/controlroom_storagecloset001b.mdl"),
Model("models/props_wasteland/controlroom_desk001b.mdl"),
Model("models/props_wasteland/interior_fence002d.mdl"),
Model("models/props_wasteland/kitchen_counter001b.mdl"),
Model("models/props_wasteland/kitchen_counter001d.mdl"),
Model("models/props_wasteland/kitchen_shelf001a.mdl"),
Model("models/props_wasteland/kitchen_shelf002a.mdl"),
Model("models/props_wasteland/wood_fence01a.mdl"),
Model("models/props_wasteland/wood_fence02a.mdl")
}


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
	if (!(ply:IsSuperAdmin()) && !(table.HasValue(WLProps, model))) then
		return false 
	else 
		return true
	end
end
hook.Add( "PlayerSpawnObject", "BlockObject", BlockObject )

function BlockTool( ply, tr, tool )
	if !ply:IsSuperAdmin() then return false end
end
hook.Add( "CanTool", "BlockTool", BlockTool )

function BlockWeapon( ply, ent, info )
	if !ply:IsSuperAdmin() then return false end
end
hook.Add( "PlayerSpawnWeapon", "BlockWeapon", BlockWeapon )

function BlockProperty( ply, property, ent )
	if !ply:IsSuperAdmin() then return false end
end
hook.Add( "CanProperty", "BlockProperty", BlockProperty )

function BlockSWEP( ply, class, swep)
    if !ply:IsSuperAdmin() then return false end
end
hook.Add("PlayerSpawnSWEP", "BlockSwep", BlockSWEP)

function BlockSWEPGive( ply, class, swep)
    if !ply:IsSuperAdmin() then return false end
end
hook.Add("PlayerGiveSWEP", "BlockSWEPGive", BlockSWEPGive)