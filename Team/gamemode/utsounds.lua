resource.AddFile("sound/hsp/quake/dominating.wav")
resource.AddFile("sound/hsp/quake/doublekill.mp3")
resource.AddFile("sound/hsp/quake/triplekill.mp3")
resource.AddFile("sound/hsp/quake/firstblood.wav")
resource.AddFile("sound/hsp/quake/godlike.wav")
resource.AddFile("sound/hsp/quake/headshot.wav")
resource.AddFile("sound/hsp/quake/holyshit.mp3")
resource.AddFile("sound/hsp/quake/killingspree.wav")
resource.AddFile("sound/hsp/quake/ludricouskill.wav")
resource.AddFile("sound/hsp/quake/monsterkill.wav")
resource.AddFile("sound/hsp/quake/multikill.wav")
resource.AddFile("sound/hsp/quake/rampage.wav")
resource.AddFile("sound/hsp/quake/ultrakill.wav")
resource.AddFile("sound/hsp/quake/unstoppable.wav")
resource.AddFile("sound/hsp/quake/wickedsick.wav")
resource.AddFile("sound/hsp/quake/headhunter.wav")

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
			killer.unreal_stats.Kills = killer.unreal_stats.Kills + 1
			if killer.unreal_stats.Kills == 5 then
				SPlayAll("hsp/quake/killingspree.wav")
			elseif killer.unreal_stats.Kills == 10 then
				SPlayAll("hsp/quake/rampage.wav")
			elseif killer.unreal_stats.Kills == 15 then
				SPlayAll("hsp/quake/dominating.wav")
			elseif killer.unreal_stats.Kills == 20 then
				SPlayAll("hsp/quake/unstoppable.wav")
			elseif killer.unreal_stats.Kills == 25 then
				SPlayAll("hsp/quake/godlike.wav")
			elseif killer.unreal_stats.Kills >= 30 then
				SPlayAll("hsp/quake/wickedsick.wav")
			end
		end
		if (inflictor:GetActiveWeapon():GetClass() == "weapon_crowbar") then
			SPlayAll("hsp/quake/humiliation.wav")
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

function unreal_DetectHitgroup(ply, hitgroup, dmginfo)
	if ( dmginfo:GetAttacker():IsPlayer()) then
		if (dmginfo:GetDamage() >= ply:Health()) then
			if (hitgroup == HITGROUP_HEAD) then
				dmginfo:GetAttacker().unreal_stats.Headshots = dmginfo:GetAttacker().unreal_stats.Headshots + 1
				if dmginfo:GetAttacker().unreal_stats.Headshots >= 15 then
					SPlayAll("hsp/quake/headhunter.wav")
				else
					SPlayAll("hsp/quake/headshot.wav")
				end
			end
		end
	end
end
hook.Add("ScalePlayerDamage", "unreal_DetectHitgroup", unreal_DetectHitgroup)