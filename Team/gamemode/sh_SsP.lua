/*
	Serverside surface.Playsound
	Credits:
			Liquid

*/

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
	
	//print("Ss.P loaded serverside!")
end

if (CLIENT) then
	net.Receive( "SPlay", function( len )
		local sound = net.ReadString()
		surface.PlaySound( Sound(sound) )
	end)
   
    net.Receive( "SPlayAll", function( len )
		local sound = net.ReadString()
        surface.PlaySound( Sound(sound) )
	end)
	
	//print("Ss.P loaded clientside!")
end