/*
	Coded by Fami Harukaze - Originally on Naisho, also known as nHook.
*/

hook.Add("OnPlayerChat", "GMOnPlayerChatHook", function( ply, text, team, dead ) 
	
			local group 	= "Groupless"
			
			local state 	= "*Unknown State*"
			
			local color 	= Color(255,0,0)
			
			local chatColor = Color(240,240,240)
			
			local name 		= "*Out of Sync*"
			
			if ply:EntIndex() == 0 then
			
				name 		= "Remote Console"
				
				color 		= Color(155,155,155)
				
				chatColor	= Color(240,30,0)
				
				group		= ""
				
				state		= ""
				
			else
			
				name 		= ply:Nick()
				
				color 		= Color(240, 240, 240)
								
				group		= "("..ply:GetNWString("UserGroup")..") "
				
				if group == "0" then
				
					group 	= ""
				
				else
					
					group 	= group
				
				end
				
				--[[if NYX:IsAdmin(ply) then
					
					if group == "0" then
					
						group 	= "(Administrator) "
						
					end
					
					chatColor	= Color(240,30,0)
					
				else
				
					chatColor	= Color(240,240,240)
					
				end]]
				
				chatColor	= Color(240,240,240)
				
				if ply:Alive() then
				
					state = ""
				
				else
				
					state = "*DEAD* "
				
				end
				
			end
	
		chat['AddText']( Color(240,10,0), state, color, group .. name .. " > ", chatColor, text )

	return true
end)

ATextAll("Loaded")
