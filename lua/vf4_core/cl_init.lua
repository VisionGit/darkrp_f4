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
File Name: 			cl_init.lua
File Description: 	Need to make one.
Date Modified:		29/01/2017 - 1:53AM
======================================================]]

-- Variables
local VF4 = {}
local VF4_F4Frame

-- Menu (Open/Create)
function VF4:OpenF4Menu()
	if VF4_F4Frame and ValidPanel( VF4_F4Frame ) then
		
		RunConsoleCommand("vrphud_toggle", "1")
		
		-- Open
		VF4_F4Frame:SetVisible( true )
		VF4_F4Frame:Show()

		VF4_F4Frame.PanelReady = false
		
		VF4_F4Frame.ActivePanel:RefillData()

	else
 		RunConsoleCommand("vrphud_toggle", "0")

		-- Create
		VF4_F4Frame = vgui.Create( "VF4_F4Menu" )

		-- Default Panel
		VF4_F4Frame:MakePanels( VF4_Config.SidebarButtons[1]['panel'] )
		VF4_F4Frame.sidebuttons[1].Active = true

		-- Update Panel
		if VF4_F4Frame.ActivePanel != nil then
			VF4_F4Frame.ActivePanel:RefillData()
		end
		
		-- Show
		VF4_F4Frame:SetVisible( true )
		VF4_F4Frame:Show()

	end
end
concommand.Add( "VF4_f4menu_open", function() VF4:OpenF4Menu() end )

-- Menu (Close)
function VF4:CloseF4Menu()
	if VF4_F4Frame then

		RunConsoleCommand("vrphud_toggle", "1")
		
		-- Hide
		VF4_F4Frame:SetVisible( false )
		VF4_F4Frame:Hide()

		-- Timer
		VF4_F4Frame.PanelReady = false

	else
		RunConsoleCommand("vrphud_toggle", "0")

		-- Create
		VF4:OpenF4Menu()

	end
end
concommand.Add( "VF4_f4menu_close", function() VF4:CloseF4Menu() end )

-- Handle ( Open / Close )
function VF4:HandleF4Menu()
	if not ValidPanel(VF4_F4Frame) or not VF4_F4Frame:IsVisible() then
		
		-- Open
		VF4:OpenF4Menu()

	else

		-- Close
		VF4:CloseF4Menu()

	end

	--if not ValidPanel(VF4_F4Frame) or not VF4_F4Frame:IsVisible() then
	--	RunConsoleCommand("vrphud_toggle", "0")
	--else
	--	RunConsoleCommand("vrphud_toggle", "1")
	--end
end
hook.Add( VF4_Config.ActivationKey1, "VF4.HandleF4Menu", VF4.HandleF4Menu)