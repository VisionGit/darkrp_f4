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
File Name: 			cl_frame.lua
File Description: 	Define the main panels & frames.
Date Modified:		29/01/2017 - 1:53AM
======================================================]]

-- Variables
local PANEL = {}
local VF4 	= {}

PANEL.PanelReady 	= false
PANEL.ActivePanel	= nil

-- Fonts
surface.CreateFont( "VF4_F4Menu_Big", {
	font = "Bebas Neue Bold",
	size = 40,
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "VF4_F4Menu_Medium", {
	font = "Bebas Neue Thin",
	size = 26,
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "VF4_F4Menu_Medium", {
	font = "Bebas Neue Book",
	size = 23,
	weight = 600,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "VF4_F4Menu_Small", {
	font = "Bebas Neue Book",
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

-- Format Number
local function formatNumber(n)
	if not n then return "" end
	if n >= 1e14 then return tostring(n) end
	n = tostring(n)
	local sep = sep or ","
	local dp = string.find(n, "%.") or #n+1
	for i=dp-4, 1, -3 do
		n = n:sub(1, i) .. sep .. n:sub(i+1)
	end
	return n
end

-- Base Stuff
function PANEL:Init()

	-- Status
	timer.Simple( 0.2, function() PANEL.PanelReady = true end)

	-- Frame
	self:SetSize( ScrW(), ScrH() )
	self:SetTitle( "" )
	self:SetVisible( true )
	self:SetDraggable( false )
	self:ShowCloseButton( false )
	self:SetDeleteOnClose( false )
	self:MakePopup()
	self:Center()
	self.Paint = function( pnl, w, h )

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide()-0, self:GetTall()-0, Color( 255, 255, 255, 2 ), true, true, false, false )
		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 150 ), true, true, false, false )

	end

	-- Open Frame
	self:Frame()

end

-- Panel Status
function PANEL:Show()
	if PANEL.PanelReady != true then
		timer.Simple( 0.2, function() PANEL.PanelReady = true end)
	end
end

-- Close Frame
function PANEL:Think()
	if PANEL.PanelReady == true and input.IsKeyDown( KEY_F4 ) then -- <!-- Fix
		
		-- Hide
		self:SetVisible( false )
		self:Hide()

		-- Status
		PANEL.PanelReady = false

	end
end

-- Base VGUI
function PANEL:Frame()

	-- Side Bar
	local VF4_SideBar = vgui.Create( "DPanel", self )
	VF4_SideBar:SetSize( 250, self:GetTall())
	VF4_SideBar:SetPos( 0, 0 )
	VF4_SideBar.Paint = function( pnl, w, h )

		draw.RoundedBoxEx( 0, 0, 0, w, h, Color( 5, 145, 145, 140 ), true, false, false, false )

		-- Title One
		draw.DrawText( VF4_Config.MainText, "VF4_F4Menu_Big", 250 / 2 + 1, 15 + 1, Color( 0, 0, 0, 255 ), 1 )
		draw.DrawText( VF4_Config.MainText, "VF4_F4Menu_Big", 250 / 2 + 0, 15 + 0, VF4_Config.White, 1 )

	end

	-- Close Button
	local CloseButton = vgui.Create( "DButton", VF4_SideBar )
	CloseButton:SetSize( VF4_SideBar:GetWide() - 4, 40 )
	CloseButton:SetPos( 2, VF4_SideBar:GetTall() - 2 - 40 )
	CloseButton:SetText( "" )
	CloseButton.Hover 	= false
	CloseButton.Active 	= false
	CloseButton.OnCursorEntered	= function() CloseButton.Hover = true  end
	CloseButton.OnCursorExited 	= function() CloseButton.Hover = false end
	CloseButton.DoClick = function() RunConsoleCommand( "VF4_f4menu_close" ) end
	CloseButton.Paint = function( pnl, w, h )

		draw.RoundedBox( 0, 0, 0, w, h, Color( 36, 36, 36, 255 ) )

		if CloseButton.Hover == false then
			draw.RoundedBox( 0, 0, 0, w, h, Color( 42, 42, 42, 255 ) )
		else
			draw.RoundedBox( 0, 0, 0, w, h, Color( 36, 36, 36, 255 ) )
		end

		draw.DrawText( "Close", "VF4_F4Menu_Medium", w/2, 10, Color( 200, 200, 200, 255 ), 1 )

	end


	-- Add Buttons
	SidebarY = 75
	pb = {}
	bb = {}
	for _, button in pairs(VF4_Config.SidebarButtons) do

		if button['text'] == "Divider" then
			
			SidebarY = SidebarY + 11 + 2

		else

			local CurButton = vgui.Create( "DButton", VF4_SideBar )
			CurButton:SetSize( VF4_SideBar:GetWide()-4, 40 )
			CurButton:SetPos( 2, SidebarY )
			CurButton:SetText( "" )
			CurButton.Hover 	= false
			CurButton.Active 	= false
			CurButton.OnCursorEntered	= function() CurButton.Hover = true  end
			CurButton.OnCursorExited 	= function() CurButton.Hover = false end

			if isnumber(button['func']) then
			
				button['func'] = button['func']
			
			else
			
				if button['func'] == "jobs" then 

					button['func'] = #RPExtraTeams 

				elseif button['func'] == "entities" then 

					button['func'] = #DarkRPEntities

				elseif button['func'] == "weapons" then 

					button['func'] = 0
					for k,v in ipairs(CustomShipments) do
						if v['seperate'] then
							button['func'] = button['func'] + 1
						end
					end

				elseif button['func'] == "shipments" then 

					button['func'] = 0
					for k,v in ipairs(CustomShipments) do
						if !v['noship'] then
							button['func'] = button['func'] + 1
						end
					end

				elseif button['func'] == "ammo" then 

					button['func'] = #GAMEMODE.AmmoTypes 

				elseif button['func'] == "vehicles" then 

					button['func'] = #CustomVehicles
				
				else
				
					button['func'] = 0
				
				end
			
			end

			CurButton.DoClick = function() 
	 
				self:ButtonStatus()
				self:HidePanels()
				self:MakePanels( button['panel'] )

				CurButton.Active = true

			end

			CurButton.Paint = function( pnl, w, h )

				if CurButton.Active == false then

					draw.RoundedBox( 0, 0, 0, w, h, Color( 36, 36, 36, 255 ) )

					if CurButton.Hover == false then
						draw.RoundedBox( 0, 0, 0, w, h, Color( 42, 42, 42, 255 ) )
					else
						draw.RoundedBox( 0, 0, 0, w, h, Color( 36, 36, 36, 255 ) )
					end

					draw.DrawText( button['text'], "VF4_F4Menu_Medium", 10, 8, Color( 200, 200, 200, 255 ) )

				else

					draw.RoundedBox( 0, 0, 0, w, h, VF4_Config.Theme )

					draw.DrawText( button['text'], "VF4_F4Menu_Medium", 10, 8, Color( 255, 255, 255, 255 ) )

				end


			end

			SidebarY = SidebarY + 40 + 2

			table.insert( bb, CurButton )

		end

	end

	self.sidebuttons = bb

end

-- Button Status
function PANEL:ButtonStatus()
	for k, v in pairs(bb) do

		v.Active = false

	end
end

-- Make Panels
function PANEL:MakePanels( panel )

	local CurPanelName = pb['p_'..panel]

	if ValidPanel(CurPanelName) then

		CurPanelName:RefillData()

		CurPanelName:SetVisible( true )

	else

		pb['p_'..panel] = vgui.Create( panel, self )

	end

	self.ActivePanel 	= pb['p_'..panel]

end

-- Hide Panels
function PANEL:HidePanels()
	for k, v in pairs(VF4_Config.SidebarButtons) do
		
		local CurPanelName = pb['p_'..v['panel']]

		if ValidPanel(CurPanelName) and CurPanelName:IsVisible() then

			CurPanelName:SetVisible( false )

		end

	end
end

-- Define VGUI
vgui.Register( "VF4_F4Menu", PANEL, "DFrame" )