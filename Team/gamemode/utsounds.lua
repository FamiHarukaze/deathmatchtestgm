function unrealsound(victim, inflictor, killer)
	if !(victim:IsNPC()) && !(killer == victim) then
		if (killer.unreal_stats) then
		killer.unreal_stats.ComboTime = CurTime() + 3.5
		killer.unreal_stats.Combo = killer.unreal_stats.Combo + 1
			if killer.unreal_stats.Combo == 2 then
				SPlayAll("hsp/quake/doublekill.mp3")
			elseif killer.unreal_stats.Combo == 3 then
				SPlayAll("hsp/quake/triplekill.mp3")
			elseif killer.unreal_stats.Combo == 4 then
				SPlayAll("hsp/quake/multikill.wav")
			elseif killer.unreal_stats.Combo == 5 then
				SPlayAll("hsp/quake/ultrakill.wav")
			elseif killer.unreal_stats.Combo == 6 then
				SPlayAll("hsp/quake/monsterkill.wav")
			elseif killer.unreal_stats.Combo == 7 then
				SPlayAll("hsp/quake/ludricouskill.wav")
			elseif killer.unreal_stats.Combo >= 8 then
				SPlayAll("hsp/quake/holyshit.mp3")
			end
		end
	end
end

hook.Add("PlayerDeath", "unrealsound", unrealsound)


function unrealreset(ply)
	ply.unreal_stats = {
	Combo = 0,
	Kills = 0,
	Headshots = 0,
	ComboTime = CurTime()
	}
end
hook.Add("PlayerSpawn", "unrealreset", unrealreset)

function unreal_Think()
	for k, v in pairs(player.GetAll()) do
		if (v.unreal_stats) then
			if v.unreal_stats.Combo > 0 then
				if v.unreal_stats.ComboTime < CurTime() then
					v.unreal_stats.Combo = 0
				end
			end
		end
	end
end
hook.Add("Think", "unreal_Think", unreal_Think)