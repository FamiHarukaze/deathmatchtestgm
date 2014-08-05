local ply = FindMetaTable("Player")

local teams = {}

teams[1] = {name = "Un-Dec", color = Vector( 1.0, 1.0, 1.0 ), weapons = {} } //Add weapons here, teams can be viewed in shared.lua
teams[2] = {name = "Team 1", color = Vector( .2, 1.0, .2 ), weapons = {"weapon_crowbar", "weapon_crossbow"} }
teams[3] = {name = "Team 2", color = Vector( .2, .2, 1.0 ), weapons = {"weapon_crowbar", "weapon_crossbow"} }
teams[3] = {name = "Team 3", color = Vector( .2, .2, 1.0 ), weapons = {"weapon_crowbar", "weapon_crossbow"} }

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
	
	for k, wep in pairs(teams[n].weapons) do
		self:Give(wep)
	end
	self:GiveAmmo( 500, "XBowBolt", true )
	if (self:IsAdmin() || self:IsSuperAdmin() ) then
		self:Give("weapon_physgun")
		self:Give("gmod_tool")
	end
end
