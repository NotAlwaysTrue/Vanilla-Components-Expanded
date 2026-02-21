VCE.ArmorSystem = {}

if not Game.IsMultiplayer then
    local RicochetSound = Game.SoundManager.LoadSound(VCE.Path .. "/ricochet.ogg")
end

-- Limb convertion stuff
local limbtoslot = {
    [LimbType.Head] = {InvSlotType.Head,0},
    [LimbType.Torso] = {InvSlotType.OuterClothes,0},
    [LimbType.Waist] = {InvSlotType.OuterClothes,0},
    [LimbType.LeftArm] = {InvSlotType.OuterClothes,1},
    [LimbType.LeftForearm] = {InvSlotType.OuterClothes,1},
    [LimbType.LeftHand] = {InvSlotType.OuterClothes,1},
    [LimbType.RightArm] = {InvSlotType.OuterClothes,1},
    [LimbType.RightForearm] = {InvSlotType.OuterClothes,1},
    [LimbType.RightHand] = {InvSlotType.OuterClothes,1},
    [LimbType.LeftThigh] = {InvSlotType.OuterClothes,2},
    [LimbType.LeftLeg] = {InvSlotType.OuterClothes,nil},
    [LimbType.LeftFoot] = {InvSlotType.OuterClothes,nil},
    [LimbType.RightThigh] = {InvSlotType.OuterClothes,2},
    [LimbType.RightLeg] = {InvSlotType.OuterClothes,nil},
    [LimbType.RightFoot] = {InvSlotType.OuterClothes,nil},
}

--Functions
function VCE.ArmorSystem.getArmor(character,targetlimb)
    if character == nil or targetlimb == nil then return nil,nil end
    local characterInv = character.Inventory                                    --Get character inv
    if characterInv == nil then return nil,nil end
    local targetinv = limbtoslot[targetlimb.type]                               --Get corresponding limb and its slot
    
    if targetlimb.type == LimbType.Head then
        if characterInv.GetItemInLimbSlot(InvSlotType.OuterClothes) ~= nil then --2025/9/15 Update: Fixed an issue with bodyarmor covering head
            local item = characterInv.GetItemInLimbSlot(InvSlotType.OuterClothes)
            if VCE.ArmorConfigs[item.Prefab.Identifier.Value] ~= nil then
                if VCE.ArmorConfigs[item.Prefab.Identifier.Value].protectionarea[LimbType.Head] then
                    targetinv = limbtoslot[LimbType.Torso]
                end
            end
        end
    end

    if targetinv == nil then return nil,nil end
    local outeritem = characterInv.GetItemInLimbSlot(targetinv[1])              --Get outer cloth(item)
    if outeritem == nil then return nil,nil end
    if outeritem.OwnInventory == nil or targetinv[2] == nil then return outeritem,nil end
    local inneritem = outeritem.OwnInventory.GetItemAt(targetinv[2])            --Get contained plate(item)
    return outeritem,inneritem                                                  --Return armor(item)
end

local function CaculateCeramicDamage(item,affliction,data)
    local condition = item.Condition
    condition = condition - VCE.HF.clamp(affliction.Strength / 20,1,math.huge) * (data.maxcondition / condition) * (data.maxcondition / data.maxhits)
    return condition
end

local function CaculateCompositeDamage(item,affliction,data)
    local condition = item.Condition
    condition = condition - VCE.HF.clamp(affliction.Strength / 20,1,math.huge) * (data.maxcondition / data.maxhits)
    return condition
end

local function CaculateMetalDamage(item,affliction,data)
    local condition = item.Condition
    condition = condition - (data.maxcondition / data.maxhits)
    return condition
end


function VCE.ArmorSystem.PlateMain(data,item,penlevel,damagemultiplier,affliction,char,limb)
    local continue = true

    if data.isHelmet and item.GetComponentString("LightComponent").IsOn then                --If target is a masked helmet and mask was raised
        return damagemultiplier, penlevel, continue                                         --We are out, mask raised = no protection
    end
    
    local ricochet = VCE.HF.DoChance(data.ricochetchance)                                          --Roll the dice

    if data.enablecorrection == true and data.correctionaffliction ~= nil then              --Corrections
        local prefab = AfflictionPrefab.Prefabs[data.correctionaffliction]
        local strength = affliction.Strength * data.correctionmultiplier * damagemultiplier
        local correctaffliction = prefab.Instantiate(strength, nil)
        char.CharacterHealth.ApplyAffliction(limb,correctaffliction,true,false,false)
    end

    if penlevel - data.level >= 2 then ricochet = false end                                 --Overwhelming pen, no ricochet :)

    if ricochet then                                                                        --Jackpot
        continue = false
        if Game.IsMultiplayer then
            local message = Networking.Start("PlayRicochetSound")
            message.WriteDouble(item.WorldPosition.X)
            message.WriteDouble(item.WorldPosition.Y)
            --for client in Client.ClientList do
            --    Networking.Send(message, client.Connection)    --abadoned due to potential to kill the server networ :(
            --end
            local client = Util.FindClientCharacter(char)
            if client then
                Networking.Send(message, client.Connection)
            end
        end
        if not Game.IsMultiplayer then
            SoundPlayer.PlaySound(RicochetSound, item.WorldPosition, 1, 5000, 1)
        end
        return 0, 0, continue
    end

    --Plate damage stuff
    if not data.ignoredamage and penlevel ~= 0 then
        if data.type == "ceramic" then
            item.Condition = CaculateCeramicDamage(item,affliction,data)
        elseif data.type == "composite" then
            item.Condition = CaculateCompositeDamage(item,affliction,data)
        elseif data.type == "metal" then
            item.Condition = CaculateMetalDamage(item,affliction,data)
        else
            item.Condition = data.customexpression(item,affliction,data)                    --Require custom expression
        end
    end

    if penlevel < data.level and item.Condition > 0 then                                    --No Pen, good condition
        continue = false
        return 0, 0, continue
    end

    if item.Condition > 0 then
        penlevel = penlevel - math.floor(data.level * data.penresistance)                   --Reamining pen
                                                                                            --Note: This is not an issue, the remain pen is caculated as shown.
        damagemultiplier = damagemultiplier * data.aftereffectmultiplier
    end


    return damagemultiplier,penlevel,continue                                               --Damage caculation thing, work after everything is done
end

local function checkid(input, required)                                                     --2025/7/21 qol update
    if type(required) == "string" then                                                      --Legacy:    
        if input == required then                                                           --Old define method, compare against strings
            return true
        else
            return false
        end
    end

    if type(required) == "table" then                                                       --Standard:    
        if required[input] then                                                             --New define method, checks if "greenlight table" contains input
            return true
        else
            return false
        end
    end
end

--Main stuff
Hook.Patch("Kilo","Barotrauma.Character", "DamageLimb", function(instance, ptable)
    local targetlimb = ptable["hitLimb"]
    if targetlimb == nil then return end
    local afflictions = ptable["afflictions"]

    -- if something already put something into it, which will change the type of it
    -- then just return because we assume something had done something on that already.
    if type(ptable["penetration"]) ~= "number" then 
        return
    end

    local penetrationlevel = math.floor((ptable["penetration"]+0.00001)*10)
    local targetcharacter = targetlimb.character
    --if not targetcharacter.IsHuman then return end
    local outercloth,innerplate = VCE.ArmorSystem.getArmor(targetcharacter,targetlimb)
    local outertargetid,innertargetid
    local clothdata, platedata = nil,nil
    --find plate carrier data, if any
    if outercloth ~= nil then 
        clothdata = VCE.ArmorConfigs[outercloth.Prefab.Identifier.Value]
        if clothdata ~= nil then
            outertargetid = clothdata.targetidentifier
        else
            return                                                                                              --Not valid. Bye.
        end
    end
    --find plate data, if any
    if innerplate ~= nil then
        platedata = VCE.ArmorConfigs[innerplate.Prefab.Identifier.Value]
        if platedata ~= nil then
            innertargetid = platedata.targetidentifier
        end
    end

    if outertargetid == nil and innertargetid == nil then return end

    local executecloth = false
    local executeplate = false

    local clothaffliction = {Strength = 0}
    local plateaffliction = {Strength = 0}

    if outertargetid == "Any" then executecloth = true end                                                      --Force override in "Any" case
    if innertargetid == "Any" then executeplate = true end

    --let's find out if it is a valid attack
    for i in afflictions do
        if clothdata ~= nil and not executecloth and (checkid(i.identifier.Value, outertargetid) or checkid(i.Prefab.AfflictionType.Value, outertargetid)) then
            if i.Strength > clothaffliction.Strength then clothaffliction = i end
            executecloth = true
        end
        if platedata~= nil and not executeplate and (checkid(i.identifier.Value, innertargetid) or checkid(i.Prefab.AfflictionType.Value, innertargetid)) then
            if i.Strength > plateaffliction.Strength then plateaffliction = i end
            executeplate = true
        end
        if clothdata ~= nil and outertargetid == "Any" then                                                     --Here we add up all strength for "Any" case
            clothaffliction.Strength = clothaffliction.Strength + i.Strength                                    --We actually trick our own codes. Makesure
            executecloth = true
        end                                                                                                     --you wont use anything else than Strength
        if platedata ~= nil and innertargetid == "Any" then                                                     --in "Any" case. This var only contains
            plateaffliction.Strength = plateaffliction.Strength + i.Strength                                    --Strength in that case.
            executeplate = true
        end
    end

    if executeplate and (not clothdata.isPlateCarrier) then executeplate = false end                            --Not a valid carrier, dont execute plate

    if not executecloth and not executeplate then return end                                                    --Did u mean run even if unnecessary?
    
    local damagemultiplier = 1.0
    local continue = true
    --A "little" bit tooooooooooo long :(
    if executeplate then
        damagemultiplier,penetrationlevel,continue = VCE.ArmorSystem.PlateMain(platedata,innerplate,penetrationlevel,damagemultiplier,plateaffliction,targetcharacter,targetlimb)
        ptable.PreventExecution = not continue
        if not continue then return end
    end
    --Note: Basically we are doing what we did again.
    if executecloth and clothdata.protectionarea[targetlimb.type] then
        damagemultiplier,penetrationlevel,continue =  Deep_Lua.Main.PlateMain(clothdata,outercloth,penetrationlevel,damagemultiplier,clothaffliction,targetcharacter,targetlimb)
        ptable.PreventExecution = not continue
        if not continue then return end
    end

    --Damage stuffs

    local decreasedpen = ptable["penetration"] - (penetrationlevel / 10)
    ptable["penetration"] = Single(ptable["penetration"] + 0.00001 - decreasedpen)
    ptable["damageMultiplier"] = Single(ptable["damageMultiplier"] * damagemultiplier)

end, Hook.HookMethodType.Before)