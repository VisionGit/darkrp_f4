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
File Name: 			cl_panel_mainmenu.lua
File Description: 	Main menu of F4, displays user info.
Date Modified:		10/2/2017 - 10:06PM
======================================================]]
local OldXP = 0
//local VisionMainBanner 	= Material( "visioninterface/scoreboard/visionlogo", "unlitgeneric" )
local VisionMainBanner  = Material( "visionroleplay-ts3logo.png", "unlitgeneric" )

local VisionMainHPHilt 	= Material( "visioninterface/hud/bar1", "noclamp smooth" )
local VisionMainHPBar 	= Material( "visioninterface/hud/healthbar", "noclamp smooth" )
local VisionMainARMBar	= Material( "visioninterface/hud/armourbar", "noclamp smooth" )

surface.CreateFont( "MainInfoTitle", { font = "bebasneue", size = 32, weight = 500, blursize = 0, scanlines = 0, antialias = true } )
surface.CreateFont( "MainInfoText", { font = "bebasneue", size = 27, weight = 500, blursize = 0, scanlines = 0, antialias = true } )
surface.CreateFont( "MainInfoSmall", { font = "bebasneue", size = 19, weight = 500, blursize = 0, scanlines = 0, antialias = true } )



-- Variables
local PANEL = {}

-- Panel
function PANEL:Init()

    local ModelTraineeFix = ""

	self:SetSize( ScrW()-250, ScrH() )
	self:SetPos( 250, 2 )
	self.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, self:GetWide(), self:GetTall(), Color( 0, 0, 0, 0 ), false, true, false, false )

		surface.SetMaterial( VisionMainBanner )
		surface.SetDrawColor( 255, 255, 255, 255)
		surface.DrawTexturedRect( self:GetWide()/2-(self:GetWide()*0.2), 0, self:GetWide()*0.4565, self:GetTall()*0.165)

	end

	local MainInfoLabel = vgui.Create( "DPanel", self )
	MainInfoLabel:SetSize( self:GetWide()*0.6, self:GetTall()*0.65 )
	MainInfoLabel:SetPos( self:GetWide()/2-(MainInfoLabel:GetWide()/2)+self:GetWide()*0.08, self:GetTall()/2-(MainInfoLabel:GetTall()/2)+self:GetTall()*0.04 )
	MainInfoLabel.Paint = function()

		draw.RoundedBoxEx( 0, 0, 0, MainInfoLabel:GetWide(), MainInfoLabel:GetTall(), Color( 55, 55, 55, 240 ), false, true, false, false )

        --Health Bar Draw
        local phealthbar = math.Clamp( LocalPlayer():Health() / (LocalPlayer():GetMaxHealth() or 100), 0, 1 )
        HPbarWidth = (MainInfoLabel:GetWide()*0.56) * phealthbar
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial( VisionMainHPBar )
        surface.DrawTexturedRect( 160+111, 16, HPbarWidth, 25 )
        draw.SimpleTextOutlined((LocalPlayer():Health() or 0), "MainInfoText", MainInfoLabel:GetWide()*0.565, 27, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
        surface.SetDrawColor(Color(215,215,215))
        surface.SetMaterial( VisionMainHPHilt )
        surface.DrawTexturedRect( 160, 13, 128, 32)

        --Armour Bar Draw
        local parmorbar = math.Clamp( LocalPlayer():Armor() / 200, 0, 1 )
        ARMbarWidth = (MainInfoLabel:GetWide()*0.56) * parmorbar
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetMaterial( VisionMainARMBar )
        surface.DrawTexturedRect( 160+111, 56, ARMbarWidth, 25 )
        draw.SimpleTextOutlined((LocalPlayer():Armor() or 0), "MainInfoText", MainInfoLabel:GetWide()*0.565, 67, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255))
        surface.SetDrawColor(Color(215,215,215))
        surface.SetMaterial( VisionMainHPHilt )
        surface.DrawTexturedRect(160, 53, 128, 32)


        draw.SimpleTextOutlined("Health Status: ", "MainInfoTitle", MainInfoLabel:GetWide()*0.03, 16, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, Color(0,0,0,255))
        draw.SimpleTextOutlined("Armour Status: ", "MainInfoTitle", MainInfoLabel:GetWide()*0.03-4, 56, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, Color(0,0,0,255))
        draw.SimpleTextOutlined("Unit Name:          "..LocalPlayer():getDarkRPVar("rpname"), "MainInfoTitle", MainInfoLabel:GetWide()*0.03-5, 140, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, Color(0,0,0,255))
        draw.SimpleTextOutlined("Credit Balance:      "..LocalPlayer():getDarkRPVar("money").."CR", "MainInfoTitle", MainInfoLabel:GetWide()*0.03-5, 175, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, Color(0,0,0,255))
        draw.SimpleTextOutlined("Credit Income:       "..LocalPlayer():getDarkRPVar("salary").."CR", "MainInfoTitle", MainInfoLabel:GetWide()*0.03-5, 210, Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, 1, Color(0,0,0,255))
        //draw.SimpleTextOutlined("Current Level: "..LocalPlayer():getDarkRPVar("level"), "MainInfoTitle", MainInfoLabel:GetWide()/2, MainInfoLabel:GetTall()-57, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0,0,0,255))
        draw.SimpleTextOutlined("Current Level: 10", "MainInfoTitle", MainInfoLabel:GetWide()/2, MainInfoLabel:GetTall()-57, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0,0,0,255))

        --Preparing the level bar
        local PlayerLevel = LocalPlayer():getDarkRPVar('level')
        local PlayerXP = LocalPlayer():getDarkRPVar('xp')
        local percent = 100--( ( PlayerXP or 0 ) / ( ( (10 + ( ( ( PlayerLevel or 1 ) * ( ( PlayerLevel or 1 ) + 1 ) * 90 ) ) ) ) * LevelSystemConfiguration.XPMult ) ) //Gets the accurate level up percentage
        local drawXP = Lerp( 8 * FrameTime(), OldXP, percent )
        OldXP = drawXP
        local percent2 = percent*100
        percent2 = math.Round( percent2 )
        percent2 = math.Clamp( percent2, 0, 99 ) //Make sure it doesnt round past 100%
        --Drawing the level bar
        surface.SetDrawColor( 0, 0, 0, 200 )
        surface.DrawRect(2,MainInfoLabel:GetTall()-27,MainInfoLabel:GetWide()-4,25)
        surface.SetDrawColor( 0, 150, 150, 255 )
        surface.DrawRect(2,MainInfoLabel:GetTall()-27,tonumber(MainInfoLabel:GetWide()-4)*drawXP,25)
        draw.DrawText(percent2 ..'%', "MainInfoText", MainInfoLabel:GetWide()/2,MainInfoLabel:GetTall()-27,Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	end

    --Main Menu Buttons
    local btnOpenTime = vgui.Create( "DButton", self )
    btnOpenTime:SetPos( self:GetWide()/2-(MainInfoLabel:GetWide()/2)+self:GetWide()*0.08+2, self:GetTall()*0.5+2 )
    btnOpenTime:SetSize( MainInfoLabel:GetWide()-4, MainInfoLabel:GetTall()*0.08-4 )
    btnOpenTime:SetText( "" )
    btnOpenTime.Hover     = false
    btnOpenTime.OnCursorEntered   = function() btnOpenTime.Hover = true  end
    btnOpenTime.OnCursorExited    = function() btnOpenTime.Hover = false end
    function btnOpenTime:Paint()
        if btnOpenTime.Hover == true then
            draw.RoundedBox( 0, 1, 1, btnOpenTime:GetWide()-2, btnOpenTime:GetTall()-2, Color(0,90,90,255) )
        else
            draw.RoundedBox( 0, 1, 1, btnOpenTime:GetWide()-2, btnOpenTime:GetTall()-2, Color(0,150,150,255) )
        end
        draw.RoundedBox( 0, 0, 0, btnOpenTime:GetWide(), btnOpenTime:GetTall(), Color(0,0,0,200) )
        
        draw.DrawText("Open Time Menu", "MainInfoText", btnOpenTime:GetWide()/2, 10, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    end
    function btnOpenTime:DoClick()
        LocalPlayer():ConCommand("ppt_menu")
    end

    local btnCallAdmin = vgui.Create( "DButton", self )
    btnCallAdmin:SetPos( self:GetWide()/2-(MainInfoLabel:GetWide()/2)+self:GetWide()*0.08+2, self:GetTall()*0.57+2 )
    btnCallAdmin:SetSize( MainInfoLabel:GetWide()-4, MainInfoLabel:GetTall()*0.08-4 )
    btnCallAdmin:SetText( "" )
    btnCallAdmin.Hover     = false
    btnCallAdmin.OnCursorEntered   = function() btnCallAdmin.Hover = true  end
    btnCallAdmin.OnCursorExited    = function() btnCallAdmin.Hover = false end
    function btnCallAdmin:Paint()
        if btnCallAdmin.Hover == true then
            draw.RoundedBox( 0, 1, 1, btnCallAdmin:GetWide()-2, btnCallAdmin:GetTall()-2, Color(0,90,90,255) )
        else
            draw.RoundedBox( 0, 1, 1, btnCallAdmin:GetWide()-2, btnCallAdmin:GetTall()-2, Color(0,150,150,255) )
        end
        draw.RoundedBox( 0, 0, 0, btnCallAdmin:GetWide(), btnCallAdmin:GetTall(), Color(0,0,0,200) )
        
        draw.DrawText("Call An Admin", "MainInfoText", btnCallAdmin:GetWide()/2, 10, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    end
    function btnCallAdmin:DoClick()
        local calladminmenu = vgui.Create("DFrame")
        calladminmenu:SetPos(0, 0)
        calladminmenu:SetSize(280, 125)
        calladminmenu:ShowCloseButton(false)
        calladminmenu:SetDraggable(false)
        calladminmenu:SetTitle("")
        calladminmenu:SlideDown(0.5) 
        calladminmenu:Center()
        calladminmenu:MakePopup()
        function calladminmenu:Paint()
            draw.RoundedBox( 0, 0, 0, calladminmenu:GetWide(), calladminmenu:GetTall(), Color( 50, 50, 50, 255 ) )--Frame
            draw.RoundedBox( 0, 0, 0, calladminmenu:GetWide(), 25, Color( 0, 150, 150, 255 ) )--Header
            draw.DrawText("Requesting Staff", "MainInfoText", 65, 1, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
        end

        local calladminclose = vgui.Create('DButton', calladminmenu)
        calladminclose:SetFont('MainInfoTitle')
        calladminclose:SetText('X')
        calladminclose:SetColor(Color(255,255,255,255))
        calladminclose:SetSize(60, 25)
        calladminclose:SetDrawBackground(true)
        calladminclose:SetPos( calladminmenu:GetWide()-60, 0)
        calladminclose.DoClick = function()
            calladminmenu:Remove() 
        end
        calladminclose.Paint = function()
            surface.SetDrawColor(255,0,0,255)
            surface.DrawRect(0, 0, calladminclose:GetWide() + 5, calladminclose:GetTall() + 5)
        end

        local entersitinfo = vgui.Create("DTextEntry", calladminmenu)
        entersitinfo:SetSize(260,65) 
        entersitinfo:SetPos(10,30)
        entersitinfo:SetValue( "Explain the situation in detail here." )
        entersitinfo.OnGetFocus = function()
            entersitinfo:SetValue("")
        end

        local calladminconfirm = vgui.Create( "DButton", calladminmenu )
        calladminconfirm:SetPos( 10, 100 )
        calladminconfirm:SetSize( 260, 20 )
        calladminconfirm:SetText( "" )
        function calladminconfirm:Paint()
            draw.RoundedBox( 0, 0, 0, calladminconfirm:GetWide(), calladminconfirm:GetTall(), Color( 0, 150, 150, 255 ) )
            draw.DrawText("Submit Staff Help Request", "MainInfoText", 120, 0-1, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
        end
        function calladminconfirm:DoClick()
            RunConsoleCommand( "say", "@"..entersitinfo:GetValue() )
            calladminmenu:Remove()
        end
    end

    local btnChangeName = vgui.Create( "DButton", self )
    btnChangeName:SetPos( self:GetWide()/2-(MainInfoLabel:GetWide()/2)+self:GetWide()*0.08+2, self:GetTall()*0.64+2 )
    btnChangeName:SetSize( MainInfoLabel:GetWide()-4, MainInfoLabel:GetTall()*0.08-4 )
    btnChangeName:SetText( "" )
    btnChangeName.Hover     = false
    btnChangeName.OnCursorEntered   = function() btnChangeName.Hover = true  end
    btnChangeName.OnCursorExited    = function() btnChangeName.Hover = false end
    function btnChangeName:Paint()
        if btnChangeName.Hover == true then
            draw.RoundedBox( 0, 1, 1, btnChangeName:GetWide()-2, btnChangeName:GetTall()-2, Color(0,90,90,255) )
        else
            draw.RoundedBox( 0, 1, 1, btnChangeName:GetWide()-2, btnChangeName:GetTall()-2, Color(0,150,150,255) )
        end
        draw.RoundedBox( 0, 0, 0, btnChangeName:GetWide(), btnChangeName:GetTall(), Color(0,0,0,200) )
        
        draw.DrawText("Change Your Name", "MainInfoText", btnChangeName:GetWide()/2, 10, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    end
    function btnChangeName:DoClick()
        local namechangemenu = vgui.Create("DFrame")
        namechangemenu:SetPos(0, 0)
        namechangemenu:SetSize(280, 85)
        namechangemenu:SlideDown(1)
        namechangemenu:ShowCloseButton(false)
        namechangemenu:SetDraggable(false)
        namechangemenu:SetTitle("")
        namechangemenu:Center()
        namechangemenu:MakePopup()
        function namechangemenu:Paint()
            draw.RoundedBox( 0, 0, 0, namechangemenu:GetWide(), namechangemenu:GetTall(), Color( 50, 50, 50, 255 ) )--Frame
            draw.RoundedBox( 0, 0, 0, namechangemenu:GetWide(), 25, Color( 0, 150, 150, 255 ) )--Header
            draw.DrawText("Changing Name", "MainInfoText", 60, 1, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
        end

        local namechangeclose = vgui.Create('DButton', namechangemenu)
        namechangeclose:SetFont('MainInfoTitle')
        namechangeclose:SetText('X')
        namechangeclose:SetColor(Color(255,255,255,255))
        namechangeclose:SetSize(60, 25)
        namechangeclose:SetDrawBackground(true)
        namechangeclose:SetPos( namechangemenu:GetWide()-60, 0)
        namechangeclose.DoClick = function()
            namechangemenu:Remove()
        end
        namechangeclose.Paint = function()
            surface.SetDrawColor(255,0,0,255)
            surface.DrawRect(0, 0, namechangeclose:GetWide() + 5, namechangeclose:GetTall() + 5)
        end

        local enternameinfo = vgui.Create("DTextEntry", namechangemenu)
        enternameinfo:SetSize(260,25) 
        enternameinfo:SetPos(10,30)
        enternameinfo:SetValue( "Enter your desired name here." )
        enternameinfo.OnGetFocus = function()
            enternameinfo:SetValue("")
        end

        local confirmnamebutt = vgui.Create( "DButton", namechangemenu )
        confirmnamebutt:SetPos( 10, 60 )
        confirmnamebutt:SetSize( 260, 20 )
        confirmnamebutt:SetText( "" )
        function confirmnamebutt:Paint()
            draw.RoundedBox( 0, 0, 0, confirmnamebutt:GetWide(), confirmnamebutt:GetTall(), Color( 0, 150, 150, 255 ) )
            draw.DrawText("Submit Name Change", "MainInfoText", 120, 0-1, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
        end
        function confirmnamebutt:DoClick()
            RunConsoleCommand( "say", "/name "..enternameinfo:GetValue() )
            namechangemenu:Remove()
        end
    end

    local btnAdminMenu = vgui.Create( "DButton", self )
    btnAdminMenu:SetPos( self:GetWide()/2-(MainInfoLabel:GetWide()/2)+self:GetWide()*0.08+2, self:GetTall()*0.71+2 )
    btnAdminMenu:SetSize( MainInfoLabel:GetWide()-4, MainInfoLabel:GetTall()*0.08-4 )
    btnAdminMenu:SetText( "" )
    btnAdminMenu.Hover     = false
    btnAdminMenu.OnCursorEntered   = function() btnAdminMenu.Hover = true  end
    btnAdminMenu.OnCursorExited    = function() btnAdminMenu.Hover = false end
    function btnAdminMenu:Paint()
        if !LocalPlayer():GetUserGroup() == "user" or !LocalPlayer():GetUserGroup() == "vip" or !LocalPlayer():GetUserGroup() == "pacvip" then
            draw.RoundedBox( 0, 1, 1, btnAdminMenu:GetWide()-2, btnAdminMenu:GetTall()-2, Color(0,150,150,255) )
        else
            draw.RoundedBox( 0, 1, 1, btnAdminMenu:GetWide()-2, btnAdminMenu:GetTall()-2, Color(130,0,0,255) )
        end
        draw.DrawText("VisionAdmin Staff Menu", "MainInfoText", btnAdminMenu:GetWide()/2, 10, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
    end
    function btnAdminMenu:DoClick()
        LocalPlayer():ConCommand("dadmin menu")
    end


    if VF4_Config.ServerID == "ImperialRP" then
        if team.GetName( LocalPlayer():Team() ) == "Cadet" then
            ModelTraineeFix = "models/player/fatal/troopers/trooper.mdl"
        else
            ModelTraineeFix = LocalPlayer():GetModel()
        end
    else
        ModelTraineeFix = LocalPlayer():GetModel()
    end


	local MainModel = vgui.Create( "DModelPanel", self )
	MainModel:SetPos( 0-100, self:GetTall()/2-(self:GetTall()*0.36) )
	MainModel:SetSize( ScrW()*0.35, self:GetTall()*0.75 )
	--MainModel:SetModel( "models/player/alyx.mdl" )

    MainModel:SetModel( ModelTraineeFix )
	MainModel:SetCamPos(Vector(45, -20, 50))
    MainModel:SetAnimated( true )
    
    local idlestand = MainModel:GetEntity():LookupSequence( "pose_standing_01" )
    MainModel:GetEntity():SetSequence( idlestand )
	function MainModel:LayoutEntity( Entity ) return end
	function MainModel.Entity:GetPlayerColor() return Vector ( 1, 0, 0 ) end

end

-- Refill
function PANEL:RefillData()

end

-- Derma 
vgui.Register( "VF4_panel_mainmenu", PANEL, "DPanel" )