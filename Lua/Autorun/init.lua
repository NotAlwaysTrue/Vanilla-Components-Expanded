VCE = {}
VCE.Path = ...

dofile(VCE.Path .. "/Lua/Scripts/HelpFunctions.lua")

if SERVER or not Game.IsMultiplayer then
    dofile(VCE.Path .. "/Lua/Scripts/armorconfigs.lua")
    dofile(VCE.Path .. "/Lua/Scripts/armorMain.lua")
end