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
File Name: 			cl_panel_custom.lua
File Description: 	Need to make one.
Date Modified:		29/01/2017 - 1:53AM
======================================================]]

-- Variables
local PANEL = {}

-- Panel
function PANEL:Init()

	self:SetSize( ScrW()-250, ScrH() )
	self:SetPos( 250, 2 )
	self.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 0 ), false, true, false, false )

		draw.DrawText( "Loading...", "VF4_F4Menu_Right2", self:GetWide() / 2, self:GetTall() / 2, Color( 255, 255, 255, 255 ), 1 )

	end

	local WebPanel = vgui.Create( "HTML", self )
	WebPanel:SetPos( 6, 6 )
	WebPanel:SetSize( self:GetWide() - 12, self:GetTall() - 12 )
	WebPanel:OpenURL( VF4_Config.WebPanel_1 )

end

-- Refill
function PANEL:RefillData()

end

-- Derma 
vgui.Register( "VF4_panel_forums", PANEL, "DPanel" )

-- Variables
local PANEL = {}

-- Panel
function PANEL:Init()

	self:SetSize( ScrW()-250, ScrH() )
	self:SetPos( 250, 2 )
	self.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 0 ), false, true, false, false )

		draw.DrawText( "Loading...", "VF4_F4Menu_Right2", self:GetWide() / 2, self:GetTall() / 2, Color( 255, 255, 255, 255 ), 1 )

	end

	local WebPanel = vgui.Create( "HTML", self )
	WebPanel:SetPos( 6, 6 )
	WebPanel:SetSize( self:GetWide() - 12, self:GetTall() - 12 )
	WebPanel:OpenURL( VF4_Config.WebPanel_2 )

end

-- Refill
function PANEL:RefillData()

end

-- Derma 
vgui.Register( "VF4_panel_rules", PANEL, "DPanel" )

-- Variables
local PANEL = {}

-- Panel
function PANEL:Init()

	self:SetSize( ScrW()-250, ScrH() )
	self:SetPos( 250, 2 )
	self.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 0 ), false, true, false, false )

		draw.DrawText( "Loading...", "VF4_F4Menu_Right2", self:GetWide() / 2, self:GetTall() / 2, Color( 255, 255, 255, 255 ), 1 )

	end

	local WebPanel = vgui.Create( "HTML", self )
	WebPanel:SetPos( 6, 6 )
	WebPanel:SetSize( self:GetWide() - 12, self:GetTall() - 12 )
	WebPanel:OpenURL( VF4_Config.WebPanel_3 )

end

-- Refill
function PANEL:RefillData()

end

-- Derma 
vgui.Register( "VF4_panel_group", PANEL, "DPanel" )

-- Variables
local PANEL = {}

-- Panel
function PANEL:Init()

	self:SetSize( ScrW()-250, ScrH() )
	self:SetPos( 250, 2 )
	self.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 0 ), false, true, false, false )

		draw.DrawText( "Loading...", "VF4_F4Menu_Right2", self:GetWide() / 2, self:GetTall() / 2, Color( 255, 255, 255, 255 ), 1 )

	end

	local WebPanel = vgui.Create( "HTML", self )
	WebPanel:SetPos( 6, 6 )
	WebPanel:SetSize( self:GetWide() - 12, self:GetTall() - 12 )
	WebPanel:OpenURL( VF4_Config.WebPanel_4 )

end

-- Refill
function PANEL:RefillData()

end

-- Derma 
vgui.Register( "VF4_panel_donate", PANEL, "DPanel" )

-- Variables
local PANEL = {}

-- Panel
function PANEL:Init()

	self:SetSize( ScrW()-250, ScrH() )
	self:SetPos( 250, 2 )
	self.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 0 ), false, true, false, false )

		draw.DrawText( "Loading...", "VF4_F4Menu_Right2", self:GetWide() / 2, self:GetTall() / 2, Color( 255, 255, 255, 255 ), 1 )

	end

	local WebPanel = vgui.Create( "HTML", self )
	WebPanel:SetPos( 6, 6 )
	WebPanel:SetSize( self:GetWide() - 12, self:GetTall() - 12 )
	WebPanel:OpenURL( VF4_Config.WebPanel_5 )

end

-- Refill
function PANEL:RefillData()

end

-- Derma 
vgui.Register( "VF4_panel_content", PANEL, "DPanel" )

-- Variables
local PANEL = {}

-- Panel
function PANEL:Init()

	self:SetSize( ScrW()-250, ScrH() )
	self:SetPos( 250, 2 )
	self.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 0 ), false, true, false, false )

		draw.DrawText( "Loading...", "VF4_F4Menu_Right2", self:GetWide() / 2, self:GetTall() / 2, Color( 255, 255, 255, 255 ), 1 )

	end

	local WebPanel = vgui.Create( "HTML", self )
	WebPanel:SetPos( 6, 6 )
	WebPanel:SetSize( self:GetWide() - 12, self:GetTall() - 12 )
	WebPanel:OpenURL( VF4_Config.WebPanel_6 )

end

-- Refill
function PANEL:RefillData()

end

-- Derma 
vgui.Register( "VF4_panel_eventboard", PANEL, "DPanel" )

-- Variables
local PANEL = {}

-- Panel
function PANEL:Init()

	self:SetSize( ScrW()-250, ScrH() )
	self:SetPos( 250, 2 )
	self.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 0 ), false, true, false, false )

		draw.DrawText( "Loading...", "VF4_F4Menu_Right2", self:GetWide() / 2, self:GetTall() / 2, Color( 255, 255, 255, 255 ), 1 )

	end

	local WebPanel = vgui.Create( "HTML", self )
	WebPanel:SetPos( 6, 6 )
	WebPanel:SetSize( self:GetWide() - 12, self:GetTall() - 12 )
	WebPanel:OpenURL( VF4_Config.WebPanel_7 )

end

-- Refill
function PANEL:RefillData()

end

-- Derma 
vgui.Register( "VF4_panel_staff", PANEL, "DPanel" )

-- Variables
local PANEL = {}

-- Panel
function PANEL:Init()

	self:SetSize( ScrW()-250, ScrH() )
	self:SetPos( 250, 2 )
	self.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 0 ), false, true, false, false )

		draw.DrawText( "Loading...", "VF4_F4Menu_Right2", self:GetWide() / 2, self:GetTall() / 2, Color( 255, 255, 255, 255 ), 1 )

	end

	local WebPanel = vgui.Create( "HTML", self )
	WebPanel:SetPos( 6, 6 )
	WebPanel:SetSize( self:GetWide() - 12, self:GetTall() - 12 )
	WebPanel:OpenURL( VF4_Config.WebPanel_8 )

end

-- Refill
function PANEL:RefillData()

end

-- Derma 
vgui.Register( "VF4_panel_trello", PANEL, "DPanel" )