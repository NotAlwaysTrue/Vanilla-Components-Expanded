VCE = {}
VCE.Path = ...

VCE.ArmorSystem = {}

dofile(VCE.Path .. "/Lua/Scripts/HelpFunctions.lua")
dofile(VCE.Path .. "/Lua/Scripts/armorconfigs.lua")
dofile(VCE.Path .. "/Lua/Scripts/configmisc.lua")

if SERVER or not Game.IsMultiplayer then
    dofile(VCE.Path .. "/Lua/Scripts/armorMain.lua")
end

if CLIENT or not Game.IsMultiplayer then
    dofile(VCE.Path .. "/Lua/Scripts/CL_PlayRicochetSound.lua")
end