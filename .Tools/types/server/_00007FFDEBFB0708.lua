---@meta
---@class Barotrauma.Items.Components.Repairable : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field prevLoggedFixer Barotrauma.Character
---`Field Private Instance`
---@field prevLoggedFixAction Barotrauma.Items.Components.Repairable.FixActions
---`Field Private Instance`
---@field header Barotrauma.LocalizedString
---`Field Private Instance`
---@field deteriorationTimer System.Single
---`Field Private Instance`
---@field updateDeteriorationCounter System.Int32
---`Field Private Instance`
---@field prevSentConditionValue System.Int32
---`Field Private Instance`
---@field conditionSignal System.String
---`Field Private Instance`
---@field wasBroken System.Boolean
---`Field Private Instance`
---@field wasGoodCondition System.Boolean
---`Field Public Instance`
---@field LastActiveTime System.Single
---`Field Private Instance`
---@field skillRequirementMultiplier System.Single
---`Field Private Instance`
---@field isTinkering System.Boolean
---`Field Private Instance`
---@field currentRepairItem Barotrauma.Item
---`Field Private Instance`
---@field tinkeringDuration System.Single
---`Field Private Instance`
---@field tinkeringStrength System.Single
---`Field Private Instance`
---@field tinkeringPowersDevices System.Boolean
---`Field Private Instance`
---@field currentFixerAction Barotrauma.Items.Components.Repairable.FixActions
---`Field Private Static`
---@field UpdateDeteriorationInterval System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ForceDeteriorationTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DeteriorationSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MinDeteriorationDelay System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxDeteriorationDelay System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MinDeteriorationCondition System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MinSabotageCondition System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SabotageDeteriorationDuration System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RepairThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxStressDeteriorationMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StressDeteriorationThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StressDeteriorationIncreaseSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StressDeteriorationDecreaseSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FixDurationLowSkill System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FixDurationHighSkill System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SkillRequirementMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsTinkering System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrentFixer Barotrauma.Character
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field StressDeteriorationMultiplier System.Single
---`Getter Public Instance`
---@field TinkeringStrength System.Single
---`Getter Public Instance`
---@field TinkeringPowersDevices System.Boolean
---`Getter Public Instance`
---@field IsBelowRepairThreshold System.Boolean
---`Getter Public Instance`
---@field IsBelowRepairIconThreshold System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrentFixerAction Barotrauma.Items.Components.Repairable.FixActions
_G['Components']['Repairable'] = {}

---`Method Public Instance Virtual`
_G['Components']['Repairable'].OnMapLoaded = function() end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param c Barotrauma.Networking.Client
_G['Components']['Repairable'].ServerEventRead = function(msg, c) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['Repairable'].ServerEventWrite = function(msg, c, extraData) end

---`Method Public Instance Virtual`
_G['Components']['Repairable'].OnItemLoaded = function() end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param bestRepairItem Barotrauma.Item
---@return System.Boolean
_G['Components']['Repairable'].CheckCharacterSuccess = function(character, bestRepairItem) end

---`Method Public Instance Virtual`
---@return System.Single
_G['Components']['Repairable'].GetSkillMultiplier = function() end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param skills (System.Collections.Generic.List*1Barotrauma*Skill)|(Barotrauma.Skill[])
---@return System.Single
_G['Components']['Repairable'].RepairDegreeOfSuccess = function(character, skills) end

---`Method Public Instance`
---@param qteSuccess System.Boolean
_G['Components']['Repairable'].RepairBoost = function(qteSuccess) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@param action Barotrauma.Items.Components.Repairable.FixActions
---@return System.Boolean
_G['Components']['Repairable'].StartRepairing = function(character, action) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Components']['Repairable'].StopRepairing = function(character) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Repairable'].UpdateBroken = function(deltaTime, cam) end

---`Method Public Instance`
_G['Components']['Repairable'].ResetDeterioration = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Repairable'].Update = function(deltaTime, cam) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['Components']['Repairable'].UpdateDeterioration = function(deltaTime) end

---`Method Private Instance`
---@param character Barotrauma.Character
---@return System.Single
_G['Components']['Repairable'].GetMaxRepairConditionMultiplier = function(character) end

---`Method Private Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Components']['Repairable'].IsTinkerable = function(character) end

---`Method Private Instance`
---@param character Barotrauma.Character
---@return Barotrauma.Affliction
_G['Components']['Repairable'].GetTinkerExhaustion = function(character) end

---`Method Private Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Components']['Repairable'].CanTinker = function(character) end

---`Method Public Instance`
---@param powerConsumption System.Single-ref
_G['Components']['Repairable'].AdjustPowerConsumption = function(powerConsumption) end

---`Method Private Instance`
---@return System.Boolean
_G['Components']['Repairable'].ShouldDeteriorate = function() end

---`Method Private Instance`
---@return System.Single
_G['Components']['Repairable'].GetDeteriorationDelayMultiplier = function() end

---`Method Private Instance`
---@param character Barotrauma.Character
_G['Components']['Repairable'].UpdateFixAnimation = function(character) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['Repairable'].ReceiveSignal = function(signal, connection) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Repairable
_G['Components']['Repairable'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Repairable
_G['Components']['Repairable'].__new = function(item, element) end

