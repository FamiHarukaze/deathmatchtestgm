/*
	Serverside surface.Playsound
	Credits:
			Liquid

*/

print("Ss.P loaded!")

if (SERVER) then
	util.AddNetworkString( "SPlayAll" )
	util.AddNetworkString( "SPlay" )
	
	function SPlay(ply, msg)
		net.Start( "SPlay" )
			net.WriteString( msg )
		net.Send(ply)
	end
	
	function SPlayAll(msg)
		net.Start( "SPlayAll" )
			net.WriteString( msg )
		net.Broadcast()
	end
end

if (CLIENT) then
	net.Receive( "SPlay", function( msg )
		surface.PlaySound( net.ReadString )
	end)
   
    net.Receive( "SPlayAll", function( msg )
        surface.PlaySound( net.ReadString )
	end)
end