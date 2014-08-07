function UTsound(victim, inflictor, attacker )
	if !(victim:IsNPC()) && !(attacker == victim) then
		attacker.UT.ComboTime = CurTime() + 3.5
		attacker.UT.Combo = attacker.UT.Combo + 1
		if attacker.UT.Combo == 2 then
			SPlayAll("hsp/quake/doublekill.mp3")
		elseif attacker.UT.Combo == 3 then
			SPlayAll("hsp/quake/triplekill.mp3"
		elseif attacker.UT.Combo == 4 then
			SPlayAll("hsp/quake/multikill.wav")
		elseif attacker.UT.Combo == 5 then
			SPlayAll("hsp/quake/ultrakill.wav")
		elseif attacker.UT.Combo == 6 then
			SPlayAll("hsp/quake/monsterkill.wav")
		elseif attacker.UT.Combo == 7 then
			SPlayAll("hsp/quake/ludricouskill.wav")
		elseif attacker.UT.Combo >= 8 then
			SPlayAll("hsp/quake/holyshit.mp3")
		end
	end
end

hook.Add("PlayerDeath", "UTsound", UTsound)


function UTreset(ply)
	ply.UT.Combo = 0
	ply.UT.kills = 0
	ply.UT.headshot = 0
	ply.UT.ComboTime = CurTime()
end
hook.Add("PlayerSpawn", "UTreset", UTreset)

function unreal_Think()
	for k, v in pairs(player.GetAll()) do
		if v.UT.combo > 0 then
			if v.UT.combotime < CurTime() then
				v.UT.combo = 0
			end
		end
	end
end
hook.Add("Think", "unreal_Think", unreal_Think)