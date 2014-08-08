/*
If /ooc then say im gay
8 plays hac/eight.wav
chat tags
*/

function PlayerSay(ply, txt, teamChat)
	if string.sub( txt, 1, 4 ) == "/ooc" then // ShitRP
		return "i am gay"
		SPlay(ply, "hac/horns_new.mp3")
	end
	
	if txt == "8" then // Eight
		SPlayAll("hac/eight.wav")
	end
	//I'll add chattags later. - Liquid
end
hook.Add("PlayerSay", "PlayerSay", PlayerSay)