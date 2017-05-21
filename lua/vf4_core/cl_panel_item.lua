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
File Name: 			cl_panel_item.lua
File Description: 	Need to make one.
Date Modified:		29/01/2017 - 1:53AM
======================================================]]

-- Variables
local PANEL = {}

surface.CreateFont( "VF4_F4Menu_Right", {
	font = "Bebas Neue",
	size = 30,
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

surface.CreateFont( "VF4_F4Menu_Right2", {
	font = "Bebas Neue Book",
	size = 20,
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

-- Panel
function PANEL:Init()

	-- Main Frame
	self:SetSize( ScrW()-275, 76 )
	self.Paint = function( pnl, w, h )

		draw.RoundedBox( 0, 0, 0, w - 0, h - 0, Color( 0, 0, 0, 100 ) )
		draw.RoundedBox( 0, 2, 2, w - 4, h - 4, Color( 60, 60, 60, 255 ) )

	end

	-- Model View
	self.model = vgui.Create( "ModelImage", self )
	self.model:SetSize( 72, 72 )
	self.model:SetPos( 4, 2 )
	self.model:SetModel( "models/props_lab/reciever01b.mdl" )

	-- Item Name
	self.info = vgui.Create( "DPanel", self )
	self.info:SetSize( 310, 56 )
	self.info:SetPos( 80, 10 )
	self.info.name 	= "-"
	self.info.two 	= ""
	self.info.Paint = function( pnl, w, h )

		--draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 255, 20 ) )

		draw.DrawText( self.info.name, "VF4_F4Menu_Right", 0 + 1, 5 + 1, Color( 0, 0, 0, 255 ), 0 )
		draw.DrawText( self.info.name, "VF4_F4Menu_Right", 0, 5 + 0, Color( 255, 255, 255, 255 ), 0 )

		draw.DrawText( self.info.two, "VF4_F4Menu_Right2", 0 + 1, 34 + 1, Color( 0, 0, 0, 255 ), 0 )
		draw.DrawText( self.info.two, "VF4_F4Menu_Right2", 0, 34 + 0, Color( 255, 255, 255, 255 ), 0 )

	end

	-- Join Button
	self.buy = vgui.Create( "DButton", self )
	self.buy:SetSize( 200, 34 )
	self.buy:SetPos( self:GetWide() - 205 - 10, 10 )
	self.buy:SetText( "" )
	self.buy.Hover 	= false
	self.buy.Status = false
	self.buy.OnCursorEntered	= function() self.buy.Hover = true  end
	self.buy.OnCursorExited 	= function() self.buy.Hover = false end
	self.buy.DoClick = function() end
	self.buy.Paint = function( pnl, w, h )


		draw.RoundedBox( 0, 2, 2, w - 4, h - 4, Color( 0, 185, 185, 255 ) )
		draw.RoundedBox( 0, 4, 4, w - 8, h - 8, Color( 0, 150, 150, 255 ) )

		if self.buy.Hover == true then
			draw.RoundedBox( 0, 4, 4, w - 8, h - 8, Color( 0, 0, 0, 50 ) )
		end

		if self.buy.Status == true then
			draw.RoundedBox( 0, 2, 2, w - 4, h - 4, Color( 90, 0, 0, 255 ) )
			draw.RoundedBox( 0, 4, 4, w - 8, h - 8, Color( 135, 0, 0, 255 ) )
		end

		draw.DrawText( "Spawn", "VF4_F4Menu_Right2", w / 2 + 1, 5 + 1, Color( 0, 0, 0, 255 ), 1 )
		draw.DrawText( "Spawn", "VF4_F4Menu_Right2", w / 2 + 0, 5 + 0, Color( 255, 255, 255, 255 ), 1 )

	end

	-- Slots
	self.slots = vgui.Create( "DPanel", self )
	self.slots:SetSize( 200, 20 )
	self.slots:SetPos( self:GetWide() - 200 - 10, 50 )
	self.slots.text = "-"
	self.slots.Paint = function( pnl, w, h )

		draw.DrawText( self.slots.text, "VF4_F4Menu_Right2", w/ 2, 0, Color( 255, 255, 255, 255 ), 1 )

	end
	
end

-- Update
function PANEL:UpdateInfo( item, type, check )

	self.model:SetModel( item.model )

	self.info.name 	= item.name

	if type == "weapons" then
		self.slots.text = "Price: "..DarkRP.formatMoney( item.pricesep )
		if not LocalPlayer():canAfford( item.pricesep ) then
			self.buy.Status = true
		end

		if GAMEMODE.Config.restrictbuypistol and not table.HasValue(item.allowed, LocalPlayer():Team()) then
			self.buy.Status = true
		end
		if item.customCheck and not item.customCheck( LocalPlayer() ) then
			self.buy.Status = true 
		end
	else
		self.slots.text = "Price: "..DarkRP.formatMoney( item.price )
		if not LocalPlayer():canAfford( item.price ) then
			self.buy.Status = true
		end

		if istable(item.allowed) and table.Count(item.allowed) >= 1 and not table.HasValue(item.allowed, LocalPlayer():Team()) then
			self.buy.Status = true 
		end
		
		if item.customCheck and not item.customCheck( LocalPlayer() ) then
			self.buy.Status = true 
		end
	end

	local closeFunc = function() RunConsoleCommand( "VF4_f4menu_close" ) end
	if type == "entities" then
		self.info.two 	= "Max: "..item.max
		if self.buy.Status != true then
			self.buy.DoClick = fn.Compose{closeFunc, fn.Partial(RunConsoleCommand, "DarkRP", item.cmd)}
		end
	elseif type == "weapons" then
		self.info.two 	= "-"
		if self.buy.Status != true then
			self.buy.DoClick = fn.Compose{closeFunc, fn.Partial(RunConsoleCommand, "DarkRP", "buy", item.name)}
		end
	elseif type == "shipments" then
		self.info.two 	= "Weapons: "..item.amount
		if self.buy.Status != true then
			self.buy.DoClick = fn.Compose{closeFunc, fn.Partial(RunConsoleCommand, "DarkRP", "buyshipment", item.name)}
		end
	elseif type == "ammo" then
		self.info.two 	= "Bullets: "..item.amountGiven
		if self.buy.Status != true then
			self.buy.DoClick = fn.Compose{closeFunc, fn.Partial(RunConsoleCommand, "DarkRP", "buyammo", item.ammoType)}
		end
	elseif type == "vehicles" then
		self.info.name 	= item.label or item.name
		self.info.two 	= "-"
		if self.buy.Status != true then
			self.buy.DoClick = fn.Compose{closeFunc, fn.Partial(RunConsoleCommand, "DarkRP", "buyvehicle", item.name)}
		end
	else
		self.info.two 	= "-"
	end
	
end

-- Derma 
vgui.Register( "VF4_panel_item", PANEL, "DPanel" )