--[[
	=== HSP Base Plugin ===
	sh_B_SPS, v1.3
	Serverside surface.PlaySound!
	Credits: HeX
]]


if (SERVER) then
	local function SendUM(ply,snd)
		umsg.Start("HSP.SPS", ply)
			umsg.String(snd)
		umsg.End()
	end
	
	local pMeta = FindMetaTable("Player")
	function pMeta:SPS(snd)
		SendUM(self,snd)
	end
	
	function HSP.SPS(ply,snd)
		if type(ply) == "string" then
			SendUM(nil,ply)
		else
			SendUM(ply,snd)
		end
	end
end


if (CLIENT) then
	local function PlaySound(um)
		surface.PlaySound( um:ReadString() )
	end
	usermessage.Hook("HSP.SPS", PlaySound)
end
