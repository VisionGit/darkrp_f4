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
File Name: 			vf4_cl_load.lua
File Description: 	To load all files on client.
Date Modified:		29/01/2017 - 1:53AM
======================================================]]

--CLIENTSIDE
local VF4_LoadType = "Client"

include("vf4_config.lua")

for k, v in pairs(file.Find("vf4_core/cl_*.lua", "LUA")) do
	include("vf4_core/".. v)
end

for k, v in pairs(file.Find("vf4_core/sh_*.lua", "LUA")) do
	include("vf4_core/".. v)
end

print(VF4_Config.Prefix.."Files loaded on the "..VF4_LoadType..".")