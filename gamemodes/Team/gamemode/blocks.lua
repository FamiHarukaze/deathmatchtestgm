function BlockSents( ply, sent_type )
 
    if !(ply:IsSuperAdmin()) then

           return false

     end
 
end
 
hook.Add( "PlayerSpawnSENT", "BlockSents", BlockSents )