include( "shared.lua" )
DeriveGamemode("sandbox")

print("Clientside lua startup")

function set_team()
 
local frame = vgui.Create( "DFrame" )
frame:SetPos( ScrW() / 2, ScrH() / 2 ) --Set the window in the middle of the players screen/game window
frame:SetSize( 300, 320 ) --Set the size
frame:SetTitle( "Change Team" ) --Set title
frame:SetVisible( true )
frame:SetDraggable( false )
frame:ShowCloseButton( false )
frame:MakePopup()
 
team_1 = vgui.Create( "DButton", frame )
team_1:SetPos( frame:GetTall() / 3, frame:GetWide() / 3 ) --Place it half way on the tall and 5 units in horizontal
team_1:SetSize( 90, 300 )
team_1:SetText( "Team 1" )
team_1.DoClick = function() --Make the player join team 1
    RunConsoleCommand( "team_1" )
end
 
team_2 = vgui.Create( "DButton", frame )
team_2:SetPos( frame:GetTall() / 3, frame:GetWide() / 3 ) --Place it next to our previous one
team_2:SetSize( 90, 300 )
team_2:SetText( "Team 2" )
team_2.DoClick = function() --Make the player join team 2
    RunConsoleCommand( "team_2" )
end

team_3 = vgui.Create( "DButton", frame )
team_3:SetPos( frame:GetTall() / 3, frame:GetWide() / 3 ) --Place it next to our previous one
team_3:SetSize( 90, 300 )
team_3:SetText( "Team 3" )
team_3.DoClick = function() --Make the player join team 3
    RunConsoleCommand( "team_3" )
end
 
end
concommand.Add( "team_menu", set_team )
 