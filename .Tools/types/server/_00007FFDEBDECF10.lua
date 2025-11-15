---@meta
---@class Barotrauma.FactionPrefab : Barotrauma.Prefab
---`Field Public Instance`
---@field HireableCharacters (System.Collections.Immutable.ImmutableArray*1Barotrauma*FactionPrefab*HireableCharacter)|(Barotrauma.FactionPrefab.HireableCharacter[])
---`Field Public Instance`
---@field AutomaticMissions (System.Collections.Immutable.ImmutableArray*1Barotrauma*FactionPrefab*AutomaticMission)|(Barotrauma.FactionPrefab.AutomaticMission[])
---`Field Public Static`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*FactionPrefab)|(fun():(Barotrauma.FactionPrefab))
---`Getter Public Instance`
---@field Name Barotrauma.LocalizedString
---`Getter Public Instance`
---@field Description Barotrauma.LocalizedString
---`Getter Public Instance`
---@field ShortDescription Barotrauma.LocalizedString
---`Getter Public Instance`
---@field OpposingFaction Barotrauma.Identifier
---`Getter Public Instance`
---@field StartOutpost System.Boolean
---`Getter Public Instance`
---@field MenuOrder System.Int32
---`Getter Public Instance`
---@field MinReputation System.Int32
---`Getter Public Instance`
---@field MaxReputation System.Int32
---`Getter Public Instance`
---@field InitialReputation System.Int32
---`Getter Public Instance`
---@field ControlledOutpostPercentage System.Single
---`Getter Public Instance`
---@field SecondaryControlledOutpostPercentage System.Single
---`Getter Public Instance`
---@field IconColor Microsoft.Xna.Framework.Color
_G['FactionPrefab'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['FactionPrefab'].ToString = function() end

---`Method Public Instance Virtual`
_G['FactionPrefab'].Dispose = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.FactionsFile):Barotrauma.FactionPrefab
---@return Barotrauma.FactionPrefab
_G['FactionPrefab'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.FactionsFile):Barotrauma.FactionPrefab
---@return Barotrauma.FactionPrefab
_G['FactionPrefab'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.FactionsFile):Barotrauma.FactionPrefab
---@return Barotrauma.FactionPrefab
_G['FactionPrefab'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.FactionsFile):Barotrauma.FactionPrefab
---@return Barotrauma.FactionPrefab
_G['FactionPrefab'].__new = function() end

