<<<<<<< HEAD
--[[=========================================================
__      __ _       _                ______  _  _                                                      
\ \    / /(_)     (_)              |  ____|| || |                                                     
 \ \  / /  _  ___  _   ___   _ __  | |__   | || |_                                                    
  \ \/ /  | |/ __|| | / _ \ | '_ \ |  __|  |__   _|                                                   
   \  /   | |\__ \| || (_) || | | || |        | |                                                     
    \/    |_||___/|_| \___/ |_| |_||_|        |_|                                                     

			 	[  By Derpes  ]
			[  For Vision Roleplay  ]
		[	Credits to TheCodingBeast   ]
[Based on his F4, this is not to be sold for that reason :)]
-------------------------------------------------------------
File Name: 			vf4_config.lua
File Description: 	Configure any changing variables.
Date Modified:		29/01/2017 - 1:53AM
===========================================================]]
VF4_Config = {}


--[[-------------------------------------]
[-        General Configuration         -]
[---------------------------------------]]
--Set enums/keynames for opening the menu
VF4_Config.ActivationKey1 	= "ShowSpare2"
VF4_Config.ActivationKey2	= KEY_F4
--Server ID
VF4_Config.ServerID 		= "ImperialRP" --"ImperialRP", "ClonewarsRP", "MilitaryRP", "CityRP"
--Toggleable Options
VF4_Config.HideWrongJob 	= false
--Website URLs for any web buttons
VF4_Config.WebPanel_1 		= "http://visionroleplay.com"
VF4_Config.WebPanel_2 		= "http://visionroleplay.com/showthread.php?tid=1&pid=1#pid1"
VF4_Config.WebPanel_3		= "http://steamcommunity.com/groups/visionroleplay"
VF4_Config.WebPanel_4		= "http://visionroleplay.com/store"
VF4_Config.WebPanel_5 		= "http://steamcommunity.com/sharedfiles/filedetails/?id=817796904"
VF4_Config.WebPanel_6 		= "http://visionroleplay.com/forumdisplay.php?fid=59"
VF4_Config.WebPanel_7		= "http://visionroleplay.com/memberlist.php?action=staff"
VF4_Config.WebPanel_8		= "http://trello.com/visionroleplay"
-- Buttons
VF4_Config.SidebarButtons = {
	
	{ text = "Main Menu", 			panel = "VF4_panel_mainmenu", 	info = true, 	func = 6			},

	{ text = "Divider",				panel = "",						info = false,	func = 0 			},

	{ text = "Roles", 				panel = "VF4_panel_jobs",		info = true,	func = "jobs"  		},
	{ text = "Spawnables",			panel = "VF4_panel_entities",	info = true,	func = "entities"	},
	
	{ text = "Divider",				panel = "",						info = false,	func = 0 			},

	{ text = "Forum",				panel = "VF4_panel_forums",	info = false,	func = 0 			},
	{ text = "Rules",				panel = "VF4_panel_rules",	info = false,	func = 0 			},
	{ text = "Group",				panel = "VF4_panel_group",	info = false,	func = 0 			},
	{ text = "Donate",				panel = "VF4_panel_donate",	info = false,	func = 0 			},

	{ text = "Divider",				panel = "",						info = false,	func = 0 			},

	{ text = "Content",				panel = "VF4_panel_content",	info = false,	func = 0 			},
	{ text = "Events Board",		panel = "VF4_panel_eventboard",	info = false,	func = 0 			},
	{ text = "Staff",				panel = "VF4_panel_staff",		info = false,	func = 0 			},
	{ text = "Vision Trello",		panel = "VF4_panel_trello",		info = false,	func = 0 			},
	
}


--[[-------------------------------------]
[-         Visual Configuration         -]
[---------------------------------------]]
--Colour Scheme
VF4_Config.Theme 			= Color(0, 150, 150, 255) --Theme colour to go with the secondary colours
VF4_Config.White 			= Color(255, 255, 255, 255) --Theme colour to go with the secondary colours
VF4_Config.Secondary1 		= Color(25, 25, 25, 255) --Theme's secondary colour, darkest
VF4_Config.Secondary2 		= Color(35, 35, 35, 255) --Theme's secondary colour, medium
VF4_Config.Secondary3 		= Color(55, 55, 55, 255) --Theme's secondary colour, lightest
--Title/Subtitle Text
VF4_Config.MainText 		= "VisionF4"

--[[-------------------------------------]
[-        Language Configuration        -]
[---------------------------------------]]
VF4_Config.Prefix 			= "[VisionF4] " --The text on the left hand of chat printed messages
--Chat printed message configuration
VF4_Config.NoPerms 			= VF4_Config.Prefix.."You do not have permission to do this, sorry."
VF4_Config.Example1 		= VF4_Config.Prefix.."This is the first example message." --(*COMING SOON*)
VF4_Config.Example2 		= VF4_Config.Prefix.."This is the second example message." --(*COMING SOON*)
VF4_Config.Example3 		= VF4_Config.Prefix.."This is the third example message." --(*COMING SOON*)
=======
--[[=========================================================
__      __ _       _                ______  _  _                                                      
\ \    / /(_)     (_)              |  ____|| || |                                                     
 \ \  / /  _  ___  _   ___   _ __  | |__   | || |_                                                    
  \ \/ /  | |/ __|| | / _ \ | '_ \ |  __|  |__   _|                                                   
   \  /   | |\__ \| || (_) || | | || |        | |                                                     
    \/    |_||___/|_| \___/ |_| |_||_|        |_|                                                     

			 	[  By Derpes  ]
			[  For Vision Roleplay  ]
		[	Credits to TheCodingBeast   ]
[Based on his F4, this is not to be sold for that reason :)]
-------------------------------------------------------------
File Name: 			vf4_config.lua
File Description: 	Configure any changing variables.
Date Modified:		29/01/2017 - 1:53AM
===========================================================]]
VF4_Config = {}


--[[-------------------------------------]
[-        General Configuration         -]
[---------------------------------------]]
--Set enums/keynames for opening the menu
VF4_Config.ActivationKey1 	= "ShowSpare2"
VF4_Config.ActivationKey2	= KEY_F4
--Server ID
VF4_Config.ServerID 		= "ImperialRP" --"ImperialRP", "ClonewarsRP", "MilitaryRP", "CityRP"
--Toggleable Options
VF4_Config.HideWrongJob 	= false
--Website URLs for any web buttons
VF4_Config.WebPanel_1 		= "http://visionroleplay.com"
VF4_Config.WebPanel_2 		= "http://visionroleplay.com/showthread.php?tid=1&pid=1#pid1"
VF4_Config.WebPanel_3		= "http://steamcommunity.com/groups/visionroleplay"
VF4_Config.WebPanel_4		= "http://visionroleplay.com/store"
VF4_Config.WebPanel_5 		= "http://steamcommunity.com/sharedfiles/filedetails/?id=817796904"
VF4_Config.WebPanel_6 		= "http://visionroleplay.com/forumdisplay.php?fid=59"
VF4_Config.WebPanel_7		= "http://visionroleplay.com/memberlist.php?action=staff"
VF4_Config.WebPanel_8		= "http://trello.com/visionroleplay"
-- Buttons
VF4_Config.SidebarButtons = {
	
	{ text = "Main Menu", 			panel = "VF4_panel_mainmenu", 	info = true, 	func = 6			},

	{ text = "Divider",				panel = "",						info = false,	func = 0 			},

	{ text = "Roles", 				panel = "VF4_panel_jobs",		info = true,	func = "jobs"  		},
	{ text = "Spawnables",			panel = "VF4_panel_entities",	info = true,	func = "entities"	},
	
	{ text = "Divider",				panel = "",						info = false,	func = 0 			},

	{ text = "Forum",				panel = "VF4_panel_forums",	info = false,	func = 0 			},
	{ text = "Rules",				panel = "VF4_panel_rules",	info = false,	func = 0 			},
	{ text = "Group",				panel = "VF4_panel_group",	info = false,	func = 0 			},
	{ text = "Donate",				panel = "VF4_panel_donate",	info = false,	func = 0 			},

	{ text = "Divider",				panel = "",						info = false,	func = 0 			},

	{ text = "Content",				panel = "VF4_panel_content",	info = false,	func = 0 			},
	{ text = "Events Board",		panel = "VF4_panel_eventboard",	info = false,	func = 0 			},
	{ text = "Staff",				panel = "VF4_panel_staff",		info = false,	func = 0 			},
	{ text = "Vision Trello",		panel = "VF4_panel_trello",		info = false,	func = 0 			},
	
}


--[[-------------------------------------]
[-         Visual Configuration         -]
[---------------------------------------]]
--Colour Scheme
VF4_Config.Theme 			= Color(0, 150, 150, 255) --Theme colour to go with the secondary colours
VF4_Config.White 			= Color(255, 255, 255, 255) --Theme colour to go with the secondary colours
VF4_Config.Secondary1 		= Color(25, 25, 25, 255) --Theme's secondary colour, darkest
VF4_Config.Secondary2 		= Color(35, 35, 35, 255) --Theme's secondary colour, medium
VF4_Config.Secondary3 		= Color(55, 55, 55, 255) --Theme's secondary colour, lightest
--Title/Subtitle Text
VF4_Config.MainText 		= "VisionF4"

--[[-------------------------------------]
[-        Language Configuration        -]
[---------------------------------------]]
VF4_Config.Prefix 			= "[VisionF4] " --The text on the left hand of chat printed messages
--Chat printed message configuration
VF4_Config.NoPerms 			= VF4_Config.Prefix.."You do not have permission to do this, sorry."
VF4_Config.Example1 		= VF4_Config.Prefix.."This is the first example message." --(*COMING SOON*)
VF4_Config.Example2 		= VF4_Config.Prefix.."This is the second example message." --(*COMING SOON*)
VF4_Config.Example3 		= VF4_Config.Prefix.."This is the third example message." --(*COMING SOON*)
>>>>>>> 1486e02eb9f5aec7a040d6bf906aa63a27203964
