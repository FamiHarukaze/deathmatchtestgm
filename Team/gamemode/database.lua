local ply = FindMetaTable("Player")
util.AddNetworkString( "database" )

function ply:ShortSteamID()
	local id = self:SteamID()
	local id = tostring(id)
	local id = string.Replace(id, "STEAM_0:0:", "")
	local id = string.Replace(id, "STEAM_0:1:", "")
	return id
end

local oldPrint = print
local function print(s)
	oldPrint("database.lua: " .. tostring(s))
end

function ply:databaseDefault()
	self:databaseSetValue( "killtokens", 0 )
	self:databaseSetValue( "exp", 0 )
	local i = {}
	--i["<item>"] = { amount = <amount> }
	self:databaseSetValue( "inventory", i )
end

function ply:databaseNetworkedData()
	local ktokens = self:databaseGetValue( "killtokens" )
	local exp = self:databaseGetValue( "exp" )
	self:SetNWInt("killtokens", ktokens)
	self:SetNWInt("exp", exp)
	
	self:KillSilent()
	self:Spawn()
end

function ply:databaseFolder()
	return "players/"
end

function ply:databasePath()
	return self:databaseFolder() .. self:ShortSteamID().. ".txt"
end

function ply:databaseSet( tab )
	self.database = tab
end

function ply:databaseGet()
	return self.database
end

function ply:databaseCheck()
	self.database = {}
	local f = self:databaseExists()
	if f then
		self:databaseRead()
	else
		self:databaseCreate()
	end
	self:databaseSend()
	self:databaseNetworkedData()
end
	
function ply:databaseSend()
	net.Start( "database" )
		net.WriteTable( self:databaseGet() )
	net.Send( self )
end

function ply:databaseExists()
	local f = file.Exists(self:databasePath(), "DATA")
	return f
end

function ply:databaseRead()
	local str = file.Read(self:databasePath(), "DATA")
	self:databaseSet( util.KeyValuesToTable(str) )
end

function ply:databaseSave()
	local str = util.TableToKeyValues(self.database)
	local f = file.Write(self:databasePath(), str)
	self:databaseSend()
end

function ply:databaseCreate()
	self:databaseDefault()
	local b = file.CreateDir( self:databaseFolder() )
	self:databaseSave()
end

function ply:databaseDisconnect()
	self:databaseSave()
end

function ply:databaseSetValue( name, v )
	if not v then return end
	
	if type(v) == "table" then
		if name == "inventory" then
			for k,b in pairs(v) do
				if b.amount <= 0 then
					v[k] = nil
				end
			end
		end
	end
	
	local d = self:databaseGet()
	d[name] = v
	
	self:databaseSave()
end

function ply:databaseGetValue( name )
	local d = self:databaseGet()
	return d[name]
end