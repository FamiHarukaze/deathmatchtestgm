GM.Name = "Team Deathmatch"
GM.Author = "N/A"
GM.Email = "N/A"
GM.Website = "N/A"

function GM:Initialize()
	self.BaseClass.Initialize( self )
end

team.SetUp( 1, "Team1", Color( 225, 125, 125, 255 ) )
team.SetUp( 2, "Team2", Color( 125, 225, 125, 255 ) )
team.SetUp( 3, "Team3", Color( 125, 125, 225, 255 ) )