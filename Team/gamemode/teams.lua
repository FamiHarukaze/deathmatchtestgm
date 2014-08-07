local ply = FindMetaTable("Player")

local teams = {}

teams[1] = {name = "Un-Dec", color = Vector( 1.0, 1.0, 1.0 ), weapons = {}, spawn = Vector(-4461.976563, 5279.816406, 2496.031250) } // gm_construct spawns, dont use for other maps.
teams[2] = {name = "Team 1", color = Vector( 1.0, .2, .2 ), weapons = {"weapon_crowbar", "weapon_crossbow"}, spawn = Vector(-4918.774902, -3199.172119, 250.031250) }
teams[3] = {name = "Team 2", color = Vector( .2, 1.0, .2 ), weapons = {"weapon_crowbar", "weapon_crossbow"}, spawn = Vector(1694.484131, 767.112000, -143.968750) }
teams[4] = {name = "Team 3", color = Vector( .2, .2, 1.0 ), weapons = {"weapon_crowbar", "weapon_crossbow"}, spawn = Vector(1501.380615, 6024.310059, -31.968750)  }

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
	self:SetAmmo( 500, "XBowBolt", true )
	if (self:IsAdmin() || self:IsSuperAdmin() ) then
		self:Give("weapon_physgun")
		self:Give("gmod_tool")
	end
end

function ply:SetGamemodeSpawn( )
	local n = self:Team()
	self:SetPos( teams[n].spawn )
end