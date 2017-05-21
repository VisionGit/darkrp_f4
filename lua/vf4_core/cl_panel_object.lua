--[[======================================================
__      __ _       _                ______  _  _                                                      
\ \    / /(_)     (_)              |  ____|| || |                                                     
 \ \  / /  _  ___  _   ___   _ __  | |__   | || |_                                                    
  \ \/ /  | |/ __|| | / _ \ | '_ \ |  __|  |__   _|                                                   
   \  /   | |\__ \| || (_) || | | || |        | |                                                     
    \/    |_||___/|_| \___/ |_| |_||_|        |_|                                                     

			 	[  By Derpes  ]
			[  For Vision Roleplay  ]
--------------------------------------------------------
File Name: 			cl_panel_object.lua
File Description: 	Need to make one.
Date Modified:		29/01/2017 - 1:53AM
======================================================]]

-- Variables
local PANEL = {}

-- Panel
function PANEL:Init()

	self:SetSize( self:GetParent():GetWide() - 20, self:GetParent():GetTall() - 20 )
	self:SetPos( 10, 10 )
	self.Paint = function() end

	self.VBar.Paint 			= function( pnl, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 0, 0, 50) ) end 
	self.VBar.btnUp.Paint 		= function( pnl, w, h ) draw.RoundedBox( 4, 2, 2, w - 4, h - 4, Color( 255, 255, 255, 25 ) ) draw.DrawText( "▲", "HudHintTextSmall", 3, 2, Color( 255, 255, 255, 255 ) ) end
	self.VBar.btnDown.Paint 	= function( pnl, w, h ) draw.RoundedBox( 4, 2, 2, w - 4, h - 4, Color( 255, 255, 255, 25 ) ) draw.DrawText( "▼", "HudHintTextSmall", 3, 2, Color( 255, 255, 255, 255 ) ) end
	self.VBar.btnGrip.Paint 	= function( pnl, w, h ) draw.RoundedBox( 4, 2, 2, w - 4, h - 4, Color( 255, 255, 255, 25 ) ) end

	-- Dirty Fix
	self:ScrollFix()

end

-- Scroll Fix
function PANEL:ScrollFix()

	-- Dirty Fix
	local ScrollFix = vgui.Create( "DPanel", self )
	ScrollFix:SetSize( 0, self:GetTall() + 1 )
	ScrollFix:SetPos( 0, 0 )
	ScrollFix.Paint = function() end 

end

-- Derma
vgui.Register( "VF4_panel_scroll", PANEL, "DScrollPanel" )



-- Variables
local PANEL = {}

-- Panel
function PANEL:Init()

	self:SetSize( ScrW()-self:GetParent():GetWide(), 30 )
	self.Paint = function( pnl, w, h )

		draw.RoundedBox( 0, 0, 0, w - 0, h - 0, Color( 0, 0, 0, 100 ) )
		draw.RoundedBox( 0, 2, 2, w - 4, h - 4, Color( 60, 60, 60, 255 ) )

		draw.DrawText( "Some items might be hidden because you have the wrong job or rank!", "Trebuchet18", w/2+1, 7+1, Color( 0, 0, 0, 255 ), 1 )
		draw.DrawText( "Some items might be hidden because you have the wrong job or rank!", "Trebuchet18", w/2+0, 7+0, Color( 255, 255, 255, 255 ), 1 )

	end

end

-- Derma
vgui.Register( "VF4_panel_hidden", PANEL, "DPanel" )