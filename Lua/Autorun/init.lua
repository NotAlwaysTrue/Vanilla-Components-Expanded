VCE = {}
VCE.Path = ...

dofile(VCE.Path .. "/Lua/Scripts/HelpFunctions.lua")
dofile(VCE.Path .. "/Lua/Scripts/armorconfigs.lua")

if SERVER or not Game.IsMultiplayer then
    dofile(VCE.Path .. "/Lua/Scripts/armorMain.lua")
end

if CLIENT or not Game.IsMultiplayer then
    dofile(VCE.Path .. "/Lua/Scripts/CL_PlayRicochetSound.lua")
end

dofile(VCE.Path .. "/Lua/Scripts/configmisc.lua")