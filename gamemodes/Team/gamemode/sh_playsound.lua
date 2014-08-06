--[[
	=== HSP Base Plugin ===
	sh_B_SPS, v1.3
	Serverside surface.PlaySound!
	Credits: HeX
]]


if (SERVER) then
	local function SendUM(ply,snd)
		umsg.Start("SPlay", ply)
			umsg.String(snd)
		umsg.End()
	end
	
	local pMeta = FindMetaTable("Player")
	function pMeta:SPlay(snd)
		SendUM(self,snd)
	end
	
	function SPlay(ply,snd)
		if type(ply) == "string" then
			SendUM(nil,ply)
		else
			SendUM(ply,snd)
		end
	end
end


if (CLIENT) then
	local function SPlay(um)
		surface.PlaySound( um:ReadString() )
	end
	usermessage.Hook("SPlay", SPlay)
end

print("Playsound loaded")