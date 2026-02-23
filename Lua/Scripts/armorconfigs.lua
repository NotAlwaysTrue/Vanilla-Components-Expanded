VCE.ArmorConfigs = {
    sampleitemid = {
        --Universal
        name = "something",                         --Name, not actually used in game. Optional, you can remove this if you know what is what.
        type = "typename",                          --Armorplate type, available: "metal","composite","ceramic","custom"
        ricochetchance = 0.0,                       --Define ricochet chance, range 0-1, will not affect force-pen
        level = 0,                                  --Bulletproof level, range 0-10, 10+ is also possible.(I dont think that will be useful, really)
        aftereffectmultiplier  = 0.0,               --Define damage multiplier if pen-ed
        correctionaffliction = nil,                 --Define affliction applied to user if non-pen, TODO: Use table instead of single string(Low Prior)
        correctionmultiplier = 0.0,                 --Define how many damage should pass to user
        enablecorrection = false,                   --Define should give non-pen affliction
        penresistance = 0.8,                        --Define pen resistance, will use to caculate remaining pen
        targetidentifier = {                        --Define what damage will this plate/helmet/armor protect against. For most cases gunshotwound.
            ["gunshotwound"] = true
        },
        --targetidentifier = "Any" if you want to define a full-protection armor(Also work for pre-defined types)

        --Condition caculation
        maxhits = 0,                                --Define how many hits this armorplate can take, use to caculate condition
        maxcondition = 0,                           --Define max condition for this armorplate, use to caculate condition
        ignoredamage = false,                       --Will the item take damage or not.

        --Carrier/Helmet with extra armor plate Specific
        isPlateCarrier = false,                     --Decided whether this is a plate carrier. Only work for outer cloth/helmet.
        protectionarea = {                          --Define areas of protection, only necessary for plate carriers. Define this for plates wont work.
            [LimbType.Torso] = true,                --Only add true items.
            [LimbType.Waist] = true,                --Note: This list may not up-to-date so please note we accept any limbs here. Use custom limbs at your own risk
            [LimbType.LeftArm] = true,
            [LimbType.LeftForearm] = true,
            [LimbType.LeftHand] = true,
            [LimbType.RightArm] = true,
            [LimbType.RightForearm] = true,
            [LimbType.RightHand] = true,
            [LimbType.LeftThigh] = true,
            [LimbType.RightThigh] = true,
            [LimbType.LeftLeg] = true,
            [LimbType.RightLeg] = true,
            [LimbType.LeftFoot] = true,
            [LimbType.RightFoot] = true,
        },
        
        RicochetSoundPath = VCE.Path .. "/Sounds/BRUH.ogg",               --Path for ricochet sounds. Only necessary for items that ricochet probability above 0
        SoundRange = 100,

        --Masked Helmet Specific
        isHelmet = false,                           --Define whether this is a masked helmet, if true use masked helmet specific code
                                                    --Use this ONLY when you want to define a helmet with a mask. Otherwise keep this false, = a standard armor for your head.

        --Custom stuff, only work if type "custom"
        customexpression = function(item,affliction,data)         --expression to caculate plate damage
            return item.Condition - (affliction.Strength / 100) * (data.maxcondition / data.maxhits)
        end,

        --Third-Party Support
        protected = true,                           --Protected or not
        override = true,                            --Override control parameter
        forceoverride = false,                      --Force override control parameter
                                                    --Be aware what are u doing before using this parameter!

    },
}
-- penlevel = floor(pen*10)
-- overwhelming pen : penlevel - level >= 2
-- Non-pen correction: correctionaffliction = targetaffliction * correctionmultiplier

-- composite armor condition = condition - (gunshotwound / 20 or 1(min)) * (maxcondition / maxhits)
-- ceramic armor condition = condition - (gunshotwound / 20 or 1(min)) * (maxcondition / condition) * (maxcondition / maxhits)
-- metal armor condition = condition - (maxcondition / maxhits), only available if allowdamage is true
-- remaining penlevel = penlevel - floor(level * penresistance)

-- All pre-defined type will only decide damage with gunshot wound is valid.


-- LOAD YOUR CONFIG WITH FOLLOWING FUNCTION
--[[
Timer.Wait(function()
     VCE.ArmorSystem.AddtoMain(yourconfigtable)
end,10)
]]

