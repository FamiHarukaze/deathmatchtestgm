local ply = FindMetaTable("Player")

local teams = {}

teams[1] = {name = "Un-Dec", color = Vector( 1.0, 1.0, 1.0 ), weapons = {}, spawn = { Vector(-4461.976563, 5279.816406, 2496.031250), Vector(-4470.631836, 5379.154297, 2496.031250), Vector(-4458.643555, 5134.977051, 2496.031250) } } // gm_construct spawns, dont use for other maps.
teams[2] = {name = "Team 1", color = Vector( 1.0, .2, .2 ), weapons = {"weapon_crowbar", "weapon_crossbow", "weapon_frag"}, spawn = { Vector(-4918.774902, -3199.172119, 250.031250), Vector(-4923.853516, -3282.815918, 250.031250), Vector(-4802.603516, -3303.967285, 250.031250)  } }
teams[3] = {name = "Team 2", color = Vector( .2, 1.0, .2 ), weapons = {"weapon_crowbar", "weapon_crossbow", "weapon_frag"}, spawn = { Vector(1702.704712, -2062.901855, -143.968750), Vector(1043.877563 -2042.461182 -143.968750), Vector(930.436890, -2056.168213, -143.968750)   } }
teams[4] = {name = "Team 3", color = Vector( .2, .2, 1.0 ), weapons = {"weapon_crowbar", "weapon_crossbow", "weapon_frag"}, spawn = { Vector(1501.380615, 6024.310059, -31.968750), Vector(1288.822998, 6071.100586, -31.968750), Vector(1701.881226, 5951.388672, -31.968750)   } }

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
    self:SetAmmo( 2,   "Grenade", true )
	if (self:IsAdmin() || self:IsSuperAdmin() ) then
		self:Give("weapon_physgun")
		self:Give("gmod_tool")
	end
end

function ply:SetGamemodeSpawn( )
	local n = self:Team()
	self:SetPos( table.Random(teams[n].spawn) )
end