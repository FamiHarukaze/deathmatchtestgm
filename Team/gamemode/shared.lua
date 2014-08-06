GM.Name = "Team Deathmatch"
GM.Author = "N/A"
GM.Email = "N/A"
GM.Website = "N/A"

function GM:Initialize()
	self.BaseClass.Initialize( self )
end

team.SetUp( 1, "UnDec", Color( 225, 255, 255, 255 ) )
team.SetUp( 2, "Team1", Color( 255, 125, 125, 255 ) )
team.SetUp( 3, "Team2", Color( 125, 255, 125, 255 ) )
team.SetUp( 4, "Team3", Color( 125, 125, 255, 255 ) )