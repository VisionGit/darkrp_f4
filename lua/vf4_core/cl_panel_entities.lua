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
File Name: 			cl_panel_entities.lua
File Description: 	Need to make one.
Date Modified:		29/01/2017 - 1:53AM
======================================================]]

-- Variables
local PANEL = {}
local VF4_Scroll

-- Panel
function PANEL:Init()

	self:SetSize( ScrW()-250, ScrH() )
	self:SetPos( 250, 0 )
	self.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 0 ), false, true, false, false )

	end

	VF4_Scroll = vgui.Create( "VF4_panel_scroll", self )

	-- Fill Data
	self:FillData( VF4_Scroll )

end

-- Fill Data
function PANEL:FillData( parent )

	local StartYPos = 0

	for i, item in ipairs(DarkRPEntities) do

		local ShowThisItem = true
		if VF4_Config.HideWrongJob == true then

			if istable(item.allowed) 	and not table.HasValue( item.allowed, LocalPlayer():Team() ) 	then ShowThisItem = false end
			if item.customCheck 		and not item.customCheck( LocalPlayer() ) 						then ShowThisItem = false end

		end

		if ShowThisItem == true then

			CurrentItem = vgui.Create( "VF4_panel_item", parent )
			CurrentItem:SetPos( 0, StartYPos )

			CurrentItem:UpdateInfo( item, "entities", "entities" )

			StartYPos = StartYPos + CurrentItem:GetTall() + 11

		end

	end

	if VF4_Config.HideWrongJob == true then
		
		local HideElementsMsg = vgui.Create( "VF4_panel_hidden", parent )
		HideElementsMsg:SetPos( 0, StartYPos )

	end

end

-- Refill Data
function PANEL:RefillData()

	-- Remove Items
	VF4_Scroll:Clear()

	-- Scroll Fix
	VF4_Scroll:ScrollFix()
	
	-- Fill Items
	self:FillData( VF4_Scroll )

end

-- Derma 
vgui.Register( "VF4_panel_entities", PANEL, "DPanel" )