if VCE.ArmorSystem == nil then VCE.ArmorSystem = {} end

local function calculateHash(configtable)
    local count = 0
    local localhash = 0
    for id,config in pairs(configtable) do
        if type(config) == "table" then
            if config.level == nil then return nil end
            count = 1 + count
            localhash = (config.level + localhash * count) / 65
        end
    end
    return localhash
end

local hash

-- WARN: YOU SHOULD MAKE SURE YOUR CONFIG IS CORRECT BEFORE LOADING INTO MAIN CONFIG!
function VCE.ArmorSystem.AddtoMain(configtable)
    for id,config in pairs(configtable) do
        if VCE.ArmorConfigs[id] == nil then goto goodend end
        if config.override ~= true then
            print("‖color:gui.yellow‖Warning: Config for " .. id .. " already exists. Please use override control parameter.‖end‖")
            goto loopend
        elseif VCE.ArmorConfigs[id].protected == true and config.forceoverride ~= true then
            print("‖color:gui.yellow‖Warning: Config for " .. id .. " is protected. Skipping...‖end‖")
            goto loopend
        end
        ::goodend::                     --Green Light. All clear to go. NO VALIDATION CHECK.
        VCE.ArmorConfigs[id] = config
        if CLIENT and config.RicochetSoundPath then
            VCE.LoadedSounds[id] = Game.SoundManager.LoadSound(config.RicochetSoundPath)
        end
        ::loopend::                     --Red Light. Next.
    end
    hash = calculateHash(VCE.ArmorConfigs)
end


Hook.Patch("Golf","Barotrauma.Character", "DamageLimb", function(_, _)
    if calculateHash(VCE.ArmorConfigs) ~= hash then
        for character in Character.CharacterList do
            --[[
            local prefab = AfflictionPrefab.Prefabs["DEEP_TABLEMISMATCH"]
            local aff = prefab.Instantiate(100, nil)
            char.CharacterHealth.ApplyAffliction(LimbType.Head,aff,true,false,false)
            ]]
            print("CONFIG MISMATCH! ARMOR SYSTEM DISABLED!")
        end
        VCE.ArmorConfigs = nil
        Hook.RemovePatch("Kilo", "Barotrauma.Character", "DamageLimb", nil, Hook.HookMethodType.Before)
    end
    Hook.RemovePatch("Golf", "Barotrauma.Character", "DamageLimb", nil, Hook.HookMethodType.Before)
end,Hook.HookMethodType.Before)