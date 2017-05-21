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
File Name: 			cl_panel_jobs.lua
File Description: 	Need to make one.
Date Modified:		29/01/2017 - 1:53AM
======================================================]]

-- Variables
local PANEL = {}
local VF4_Scroll,VF4_BigList

surface.CreateFont( "VF4_F4Menu_Right", {font = "Bebas Neue",size = 30,weight = 1000,blursize = 0,scanlines = 0,antialias = true,underline = false,italic = false,strikeout = false,symbol = false,rotary = false,shadow = false,additive = false,outline = false} )
surface.CreateFont( "VF4_F4Menu_Right2", {font = "Bebas Neue Bold",size = 20,weight = 100,blursize = 0,scanlines = 0,antialias = true,underline = false,italic = false,strikeout = false,symbol = false,rotary = false,shadow = false,additive = false,outline = false} )
surface.CreateFont( "VF4_F4Menu_Right3", {font = "Bebas Neue Book",size = 17,weight = 100,blursize = 0,scanlines = 0,antialias = true,underline = false,italic = false,strikeout = false,symbol = false,rotary = false,shadow = false,additive = false,outline = false} )
surface.CreateFont( "VF4_F4Menu_Right33", {font = "Bebas Neue Book",size = 12,weight = 100,blursize = 0,scanlines = 0,antialias = true,underline = false,italic = false,strikeout = false,symbol = false,rotary = false,shadow = false,additive = false,outline = false} )

-- Panel
function PANEL:Init()

	-- Main Frame
	self:SetSize( ScrW()/2-100, 105 )
	self.Paint = function( pnl, w, h )
		w=ScrW()/2-150
		draw.RoundedBox( 0, 0, 0, w - 0, h - 0, Color( 0, 0, 0, 100 ) )
		draw.RoundedBox( 0, 2, 2, w - 4, h - 4, Color( 60, 60, 60, 255 ) )

	end

	-- Model View
	self.model = vgui.Create( "ModelImage", self )
	self.model:SetSize( 100, 100 )
	self.model:SetPos( 2, 2 )
	self.model:SetModel( "models/player/alyx.mdl" )

	-- Job Name
	self.info = vgui.Create( "DPanel", self )
	self.info:SetSize( ScrW()*0.7, 70 )
	self.info:SetPos( 90, 10 )
	self.info.name 	= "-"
	self.info.wep 	= ""
	self.info.Paint = function( pnl, w, h )

		draw.DrawText( self.info.name, "VF4_F4Menu_Right", 0 + 1, 5 + 1, Color( 0, 0, 0, 255 ), 0 )
		draw.DrawText( self.info.name, "VF4_F4Menu_Right", 0, 5 + 0, Color( 255, 255, 255, 255 ), 0 )
		draw.DrawText( self.info.wep, "VF4_F4Menu_Right33", 0 + 1, 34 + 1, Color( 0, 0, 0, 255 ), 0 )
		draw.DrawText( self.info.wep, "VF4_F4Menu_Right33", 0, 34 + 0, Color( 255, 255, 255, 255 ), 0 )

	end

    self.Categories = {}


	-- Join Button
	self.join = vgui.Create( "DButton", self )
	self.join:SetSize( 150, 34 )
	self.join:SetPos( self:GetWide() - 205 - 20, 10 )
	self.join:SetText( "" )
	self.join.Hover 	= false
	self.join.Status 	= false
	self.join.OnCursorEntered	= function() self.join.Hover = true  end
	self.join.OnCursorExited 	= function() self.join.Hover = false end
	self.join.DoClick = function() end
	self.join.Paint = function( pnl, w, h )


		draw.RoundedBox( 0, 2, 2, w - 4, h - 4, Color( 0, 185, 185, 255 ) )
		draw.RoundedBox( 0, 4, 4, w - 8, h - 8, Color( 0, 150, 150, 255 ) )

		if self.join.Hover == true then
			draw.RoundedBox( 0, 4, 4, w - 8, h - 8, Color( 0, 0, 0, 50 ) )
		end

		if self.join.Status == true then
			draw.RoundedBox( 0, 2, 2, w - 4, h - 4, Color( 90, 0, 0, 255 ) )
			draw.RoundedBox( 0, 4, 4, w - 8, h - 8, Color( 135, 0, 0, 255 ) )
		end

		draw.DrawText( "Become Role", "VF4_F4Menu_Right2", w / 2 + 1, 5 + 1, Color( 0, 0, 0, 255 ), 1 )
		draw.DrawText( "Become Role", "VF4_F4Menu_Right2", w / 2 + 0, 5 + 0, Color( 255, 255, 255, 255 ), 1 )

	end

	-- Slots
	self.slots = vgui.Create( "DPanel", self )
	self.slots:SetSize( 200, 20 )
	self.slots:SetPos( self:GetWide() - 200 - 10, 50 )
	self.slots.text = "0 / 0"
	self.slots.Paint = function( pnl, w, h )

		draw.DrawText( self.slots.text, "VF4_F4Menu_Right2", w/ 2, 0, Color( 255, 255, 255, 255 ), 1 )

	end
end

-- Update
function PANEL:UpdateInfo( job, team, name, model, max, players, description, vote, cmd, ctg )

	self.info.name 		= name
	self.info.wep 		= description
	self.slots.text 	= players.." / "..max

	if max != 0 and max != "#" and tonumber(players) >= max then
		self.join.Status = true
	end

	if team == LocalPlayer():Team() then
		self.join.Status = true
	end

	if job['NeedToChangeFrom'] and LocalPlayer():Team() != job['NeedToChangeFrom'] then
		self.join.Status = true
	end

	local closeFunc = function() RunConsoleCommand( "VF4_f4menu_close" ) end
	if self.join.Status != true then
		if vote then
			self.join.DoClick = fn.Compose{closeFunc, fn.Partial(RunConsoleCommand, "darkrp", "vote" .. cmd)}
		else
			self.join.DoClick = fn.Compose{closeFunc, fn.Partial(RunConsoleCommand, "darkrp", cmd)}
		end
	end
	
	self.model:SetModel( model )

end

-- Derma
vgui.Register( "VF4_panel_jobs_item", PANEL, "DPanel" )

-- Variables
local PANEL = {}

-- Panel
function PANEL:Init()

	-- Main Frame
	self:SetSize( ScrW()-250, ScrH() )
	self:SetPos( 250, 0 )
	self.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 0 ), false, true, false, false )

	end

	VF4_Scroll = vgui.Create( "VF4_panel_scroll", self )
	
	VF4_BigList = vgui.Create( "DPanelList", VF4_Scroll )
	VF4_BigList:SetSpacing( 5 )
	VF4_BigList:SetSize(VF4_Scroll:GetWide(),VF4_Scroll:GetTall())
	VF4_BigList:EnableHorizontal( false )
	VF4_BigList:EnableVerticalScrollbar( false )

	-- make categories
	self:MakeCategories(VF4_Scroll,VF4_BigList)

end

-- make cagteogires
function PANEL:MakeCategories( parent, biglist )

	if not((biglist)and(IsValid(biglist)))then
		VF4_BigList = vgui.Create( "DPanelList", parent )
		VF4_BigList:SetSpacing( 5 )
		VF4_BigList:SetSize(parent:GetWide(),parent:GetTall())
		VF4_BigList:EnableHorizontal( false )
		VF4_BigList:EnableVerticalScrollbar( false )
		biglist=VF4_BigList
	end

	local StartYPos,Cats = 0,{}

	for i, job in ipairs(RPExtraTeams) do
		local Cat=job['category']
		if not(table.HasValue(Cats,Cat))then table.insert(Cats,Cat) end
	end

	for key,categ in pairs(Cats)do
		local DCollapsibleCategory = vgui.Create( "DCollapsibleCategory", parent )
		DCollapsibleCategory.TheCategory=categ
		DCollapsibleCategory:SetPos( 10, StartYPos+11 )
		DCollapsibleCategory:SetSize( parent:GetWide()-40,40 )
		DCollapsibleCategory:SetExpanded(0)
		DCollapsibleCategory:SetLabel( categ )
		DCollapsibleCategory.Paint=function(pnl)
			draw.RoundedBoxEx( 0, 0, 2, pnl:GetWide()-20, 25, Color( 0, 137, 137, 255 ), false, true, false, false )
		end
		
		local DermaList = vgui.Create( "DPanelList", parent )
		DermaList:SetSpacing( 5 )
		DermaList:EnableHorizontal( false )
		DermaList:EnableVerticalScrollbar( false )
		DCollapsibleCategory:SetContents( DermaList )

		StartYPos=StartYPos+56
		
		self:FillData(parent,DCollapsibleCategory,DermaList)
		
		biglist:AddItem(DCollapsibleCategory)
	end
end

-- Fill Data
function PANEL:FillData( parent, categ, list )

	local First,Container=true,nil
	
	local CorrectJobs={}
	for k,jerb in pairs(RPExtraTeams)do
		local ShowThisItem = true
		if VF4_Config.HideWrongJob == true then

			if jerb.customCheck 		and not jerb.customCheck(LocalPlayer()) 				then ShowThisItem = false end
			if jerb.NeedToChangeFrom and jerb.NeedToChangeFrom != LocalPlayer():Team() 	then ShowThisItem = false end

		end
		
		local job_ctg	= jerb['category']		or ""
		
		if ((ShowThisItem == true)and(job_ctg==categ.TheCategory)) then table.insert(CorrectJobs,jerb) end
	end
	for i, job in ipairs(CorrectJobs) do

		if(First)then
			Container=vgui.Create("DPanel")
			Container:SetSize(ScrW(),105)
			Container.Paint=function() end
		end
		CurrentJob = vgui.Create( "VF4_panel_jobs_item", Container )
		if not(First)then CurrentJob:SetPos(ScrW()/2-140,5) else CurrentJob:SetPos(0,5) end

		-- Update
		local job_team 	= job['team'] 			or ""
		local job_name 	= job['name']			or ""
		local job_desc	= job['description']	or ""
		local job_max	= job['max'] 			or 0
		local job_vote	= job['vote']			or false
		local job_cmd	= job['command']		or ""

		local job_ply	= team.NumPlayers( job['team'] ) or 0
		local job_mdl	= ""

		if job_max == 0 then job_max = "#" end 		// ∞

		if istable( job['model'] ) then job_mdl = job['model'][1] else job_mdl = job['model'] end

		CurrentJob:UpdateInfo( job, job_team, job_name, job_mdl, job_max, job_ply, job_desc, job_vote, job_cmd, job_ctg )

		if((not(First))or(i==#CorrectJobs))then list:AddItem(Container) end
		
		First=!First

	end
	--[[
	if VF4_Config.HideWrongJob == true then
		
		local HideElementsMsg = vgui.Create( "VF4_panel_hidden" )
		HideElementsMsg:SetPos( 0, StartYPos )

	end
	--]]
end

-- Refill Data
function PANEL:RefillData()

	-- Remove Items
	VF4_Scroll:Clear()

	-- Scroll Fix
	VF4_Scroll:ScrollFix()
	
	-- Fill Items
	self:MakeCategories(VF4_Scroll,VF4_BigList)

end

-- Derma
vgui.Register( "VF4_panel_jobs", PANEL, "DPanel" )