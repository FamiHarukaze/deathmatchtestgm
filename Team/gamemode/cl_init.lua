include( "shared.lua" )
include( "sh_SsP.lua" )
include( "sh_text.lua" )

AddCSLuaFile( "sh_SsP.lua" )
AddCSLuaFile( "sh_text.lua" )
AddCSLuaFile( "database/cl_database.lua" )
DeriveGamemode("sandbox")

print("Clientside lua startup")

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

function HUDHide( myhud )
for k, v in pairs{"CHUDHealth","CHudBattery",} do 
if myhud == v then return false end
end
end
hook.Add("HUDShouldDraw","HudHide",HUDHide)

function GM:HUDPaint()
    self.BaseClass:HUDPaint()
    local ply = LocalPlayer()
    local HP = LocalPlayer():Health()
    local ARM = LocalPlayer():Armor()

    surface.CreateFont("HUD", {size = 20, weight = 900, antialias = true, shadow = false, font = "DermaLarge"})
    hook.Add( "HUDPaint", "HUDHP", function() surface.SetFont( "HUD" ) surface.SetTextColor( 255, 0, 0 ) surface.SetTextPos( 32, 32 ) surface.DrawText( ply:Health() ) end )﻿
end