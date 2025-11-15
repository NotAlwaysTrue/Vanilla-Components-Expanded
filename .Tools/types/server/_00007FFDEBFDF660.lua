---@meta
---@class Barotrauma.Character.UpdateSkillsEventData : System.ValueType
---`Field Public Instance`
---@field ForceNotification System.Boolean
---`Field Public Instance`
---@field SkillIdentifier Barotrauma.Identifier
---`Getter Public Instance Virtual`
---@field EventType Barotrauma.Character.EventType
_G['Character']['UpdateSkillsEventData'] = {}

---`Constructor Public Instance`
---@param skillIdentifier Barotrauma.Identifier
---@param forceNotification System.Boolean
---@return Barotrauma.Character.UpdateSkillsEventData
_G['Character']['UpdateSkillsEventData'] = function(skillIdentifier, forceNotification) end

---`Constructor Public Instance`
---@param skillIdentifier Barotrauma.Identifier
---@param forceNotification System.Boolean
---@return Barotrauma.Character.UpdateSkillsEventData
_G['Character']['UpdateSkillsEventData'].__new = function(skillIdentifier, forceNotification) end

