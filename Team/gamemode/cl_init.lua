include( "shared.lua" )
include( "sh_SsP.lua" )
include( "sh_text.lua" )

AddCSLuaFile( "sh_SsP.lua" )
AddCSLuaFile( "sh_text.lua" )
AddCSLuaFile( "database/cl_database.lua" )
DeriveGamemode("sandbox")

print("plyside lua startup")

function set_team(ply)
 
local frame = vgui.Create( "DFrame" )
frame:SetPos( ScrW() / 2, ScrH() / 2 ) --Set the window in the middle of the players screen/game window
frame:SetSize( 310, 320 ) --Set the size
frame:SetTitle( "Change Team" ) --Set title
frame:SetVisible( true )
frame:SetDraggable( false )
frame:ShowCloseButton( false )
frame:MakePopup()
 
team_1 = vgui.Create( "DButton", frame )
team_1:SetPos( 10, 31 ) --Place it half way on the tall and 5 units in horizontal
team_1:SetSize( 90, 218 )
team_1:SetText( "Team 1" )
team_1.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "team_1" )
    frame:SetVisible( false )
end
 
team_2 = vgui.Create( "DButton", frame )
team_2:SetPos( 110, 31 ) --Place it next to our previous one
team_2:SetSize( 90, 218 )
team_2:SetText( "Team 2" )
team_2.DoClick = function() --Make the player join team 2
    RunConsoleCommand( "team_2" )
    frame:SetVisible( false )
end

team_3 = vgui.Create( "DButton", frame )
team_3:SetPos( 210, 31 ) --Place it next to our previous one
team_3:SetSize( 90, 218 )
team_3:SetText( "Team 3" )
team_3.DoClick = function() --Make the player join team 3
    RunConsoleCommand( "team_3" )
    frame:SetVisible( false )
end

team_r = vgui.Create( "DButton", frame )
team_r:SetPos( 10, 258 ) --Place it next to our previous one
team_r:SetSize( 290, 50 )
team_r:SetText( "Random Team" )
team_r.DoClick = function() --Make the player join a random team
    RunConsoleCommand( "team_r" )
    frame:SetVisible( false )
end
 
end
concommand.Add( "team_menu", set_team )

function myhud()
	local client = LocalPlayer()
	if !client:Alive() then return end
	if(client:GetActiveWeapon() == NULL or client:GetActiveWeapon() == "Camera") then return end
	draw.SimpleText(client:Health() .. "%", "DermaLarge", 64, 699, Color(255, 255, 60, 90), 0, 0)
	local mag_left = client:GetActiveWeapon():Clip1() // How much ammunition you have inside the current magazine
	local mag_extra = client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()) // How much ammunition you have outside the current magazine
	local secondary_ammo = client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType())// How much ammunition you have for your secondary fire, such as the MP7's grenade launcher
end
hook.Add("HUDPaint", "myhud", myhud)
 
local tohide = { -- This is a table where the keys are the HUD items to hide
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudAmmo"] = true,
	["CHudSecondaryAmmo"] = true
}
local function HUDShouldDraw(name) -- This is a local function because all functions should be local unless another file needs to run it
	if (tohide[name]) then     -- If the HUD name is a key in the table
		return false;      -- Return false.
	end
end
hook.Add("HUDShouldDraw", "How to: HUD Example HUD hider", HUDShouldDraw)