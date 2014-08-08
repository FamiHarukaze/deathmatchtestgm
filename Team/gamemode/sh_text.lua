/*
	Serverside chat.AddText
	Credits:
			General HeX
			Liquid
*/

if (SERVER) then
	util.AddNetworkString( "ATextAll" )
	util.AddNetworkString( "AText" )

	function AText(...)
	local arg = { ... }
	local ply = nil
	if ( type( arg[1] ) == "Player" ) && arg[1]:IsValid() then
		ply = arg[1]
	else
		return
	end
	net.Start( "AText" )
		net.WriteInt( #{ ... }, 8 )
		for _, v in pairs( arg ) do
			if ( type( v ) == "string" ) then
				net.WriteString( v )
			elseif ( type( v ) == "table" ) then
				net.WriteColor( v )
			end
		end
		net.Send(ply)
	end
	
	function ATextAll(...)
		local arg = { ... }
		net.Start( "ATextAll" )
		net.WriteInt(  #arg, 8 )
		for _, v in pairs( arg ) do
			if ( type( v ) == "string" ) then
				net.WriteString( v )
			elseif ( type( v ) == "table" ) then
				net.WriteColor( v )
			end
		end
		net.Broadcast()
	end

elseif (CLIENT) then
	net.Receive( "AText", function()
		local argc = net.ReadInt(8)
		local args = { }
		for i = 1, argc / 2, 1 do
			table.insert( args, net.ReadColor() )
			table.insert( args, net.ReadString() )
		end
		
		timer.Simple(0.1, function()
			chat.AddText( unpack( args ) )
			chat.PlaySound()
		end)
	end)
	
	net.Receive( "ATextAll", function()
		local argc = net.ReadInt(8)
		local args = { }
		for i = 1, argc / 2, 1 do
			table.insert( args, net.ReadColor() )
			table.insert( args, net.ReadString() )
		end
		
		timer.Simple(0.1, function()
			print("chat add")
			chat.AddText( unpack( args ) )
			chat.PlaySound()
		end)
	end)
end