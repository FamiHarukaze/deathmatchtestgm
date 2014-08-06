/*
	Serverside surface.Playsound
	Credits:
			Liquid

*/

print("Ss.P loaded!")

if (SERVER) then
	util.AddNetworkString( "SPlayAll" )
	util.AddNetworkString( "SPlay" )
	util.AddNetworkString( "Example1" )
	
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
	function NetExample()
	net.Start( "Example1" )
        net.WriteTable( "Hello" )
    net.Broadcast() 
	end
	
	print("Ss.P loaded serverside!")
end

if (CLIENT) then
	net.Receive( "SPlay", function( len )
		surface.PlaySound( net.ReadString() )
	end)
   
    net.Receive( "SPlayAll", function( len )
		local sound = net.ReadString()
        surface.PlaySound( Sound(sound) )
	end)
	
	net.Receive( "Example1", function( len )
       print( "EXAMPLE 1: Received message ( " .. len .. " bits )" )
       print( net.ReadString() )   
   end)
	
	print("Ss.P loaded clientside!")
end