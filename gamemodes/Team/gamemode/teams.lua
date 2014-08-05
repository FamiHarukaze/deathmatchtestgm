local ply = FindMetaTable("Player")

local teams = {}

teams[1] = {name = "Team 1", color = Vector( .2, 1.0, 1.0 ), weapons = {"weapon_crowbar", "weapon_crossbow"} } //Add weapons here, teams can be viewed in shared.lua
teams[2] = {name = "Team 2", color = Vector( 1.0, .2, 1.0 ), weapons = {"weapon_crowbar", "weapon_crossbow"} }
teams[3] = {name = "Team 3", color = Vector( 1.0, 1.0, .2 ), weapons = {"weapon_crowbar", "weapon_crossbow"} }

function ply:SetGamemodeTeam( n )
	if not teams[n] then return end
	
	self:SetTeam( n )
	
	self:SetPlayerColor( teams[n].color )
	
	self:GiveGamemodeWeapons()
	
	return true
end

function ply:GiveGamemodeWeapons()
	local n = self:Team()
	self:StripWeapons()
	if (ply:IsAdmin() || ply:IsSuperAdmin() ) then
		ply:Give("weapon_physgun")
		ply:Give("gmod_tool")
	end
	
	for k, wep in pairs(teams[n].weapons) do
		self:Give(wep)
		self:GiveAmmo( 500, "XBowBolt", true )
	end
end