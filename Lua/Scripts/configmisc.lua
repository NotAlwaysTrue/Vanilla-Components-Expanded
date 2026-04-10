-- WARN: YOU SHOULD MAKE SURE YOUR CONFIG IS CORRECT BEFORE LOADING INTO MAIN CONFIG!
function VCE.ArmorSystem.AddtoMain(configtable)
    if configtable == nil then return end
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
end