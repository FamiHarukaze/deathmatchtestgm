/*
If /ooc then say im gay
8 plays hac/eight.wav
chat tags
*/

function PlayerSay(ply, txt, teamChat)
	if string.sub( txt, 1, 4 ) == "/ooc" then // ShitRP
		SPlay(ply, "hac/horns_new.mp3")
		return "i am gay"
	end
	
	if txt == "8" then // Eight
		SPlayAll("hac/eight.wav")
	end
	
	if string.sub( txt, 1, 1 ) == ">" then
		local teamcolor = team.GetColor(ply:Team())
		ATextAll(teamcolor, ply:Nick(), color_white, ": ", Color(120, 153, 69), txt)
		return ""
	end
	//I'll add chattags later. - Liquid
end
hook.Add("PlayerSay", "PlayerSay", PlayerSay)

ATextAll("Loaded")