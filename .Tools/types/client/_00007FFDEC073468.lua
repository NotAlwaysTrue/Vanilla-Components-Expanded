---@meta
---@class Barotrauma.JobPrefab : Barotrauma.PrefabWithUintIdentifier
---`Field Public Instance`
---@field JobItems (System.Collections.Immutable.ImmutableDictionary*1System*Int32*1System*Collections*Immutable*ImmutableArray*2Barotrauma*JobPrefab*JobItem)|({[System.Int32]:((System.Collections.Immutable.ImmutableArray*1Barotrauma*JobPrefab*JobItem)|(Barotrauma.JobPrefab.JobItem[]))})
---`Field Public Instance`
---@field Skills (System.Collections.Generic.List*1Barotrauma*SkillPrefab)|(Barotrauma.SkillPrefab[])
---`Field Public Instance`
---@field AutonomousObjectives (System.Collections.Generic.List*1Barotrauma*AutonomousObjective)|(Barotrauma.AutonomousObjective[])
---`Field Public Instance`
---@field AppropriateOrders (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field Name Barotrauma.LocalizedString
---`Field Public Instance`
---@field Description Barotrauma.LocalizedString
---`Field Public Instance`
---@field Icon Barotrauma.Sprite
---`Field Public Instance`
---@field IconSmall Barotrauma.Sprite
---`Field Public Static`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*JobPrefab)|(fun():(Barotrauma.JobPrefab))
---`Field Private Static`
---@field _itemRepairPriorities (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Single)|({[Barotrauma.Identifier]:(System.Single)})
---`Getter Public Static`
---@field ItemRepairPriorities (System.Collections.Generic.IReadOnlyDictionary*1Barotrauma*Identifier*1System*Single)|({[Barotrauma.Identifier]:(System.Single)})
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UIColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IdleBehavior Barotrauma.AIObjectiveIdle.BehaviorType
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field OnlyJobSpecificDialog System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field InitialCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CampaignSetupUIOrder System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AllowAlways System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MaxNumber System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MinNumber System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field MinKarma System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PriceMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field VitalityModifier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HiddenJob System.Boolean
---`Getter Public Instance`
---@field PrimarySkill Barotrauma.SkillPrefab
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Element Barotrauma.ContentXElement
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Variants System.Int32
_G['JobPrefab'] = {}

---`Method Public Instance`
---@param isPvP System.Boolean
---@param buttonContainer Barotrauma.GUIComponent-ref
---@return Barotrauma.GUIButton
_G['JobPrefab'].CreateInfoFrame = function(isPvP, buttonContainer) end

---`Method Public Instance`
---@param team Barotrauma.CharacterTeamType
---@param isPvPMode System.Boolean
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Sprite)|(fun():(Barotrauma.Sprite))
_G['JobPrefab'].GetJobOutfitSprites = function(team, isPvPMode) end

---`Method Public Instance Virtual`
_G['JobPrefab'].Dispose = function() end

---`Method Public Static`
---@param identifier Barotrauma.Identifier
---@return Barotrauma.JobPrefab
_G['JobPrefab'].Get = function(identifier) end

---`Method Public Instance`
---@param jobVariant System.Int32
---@param predicate (System.Func*1Barotrauma*JobPrefab*JobItem*1System*Boolean)|(fun(arg:Barotrauma.JobPrefab.JobItem):(System.Boolean))
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*JobPrefab*JobItem)|(fun():(Barotrauma.JobPrefab.JobItem))
_G['JobPrefab'].GetJobItems = function(jobVariant, predicate) end

---`Method Public Instance`
---@param jobVariant System.Int32
---@param predicate (System.Func*1Barotrauma*JobPrefab*JobItem*1System*Boolean)|(fun(arg:Barotrauma.JobPrefab.JobItem):(System.Boolean))
---@return System.Boolean
_G['JobPrefab'].HasJobItem = function(jobVariant, predicate) end

---`Method Public Static`
---@param sync Barotrauma.Rand.RandSync
---@param predicate? (System.Func*1Barotrauma*JobPrefab*1System*Boolean)|(fun(arg:Barotrauma.JobPrefab):(System.Boolean))
---@return Barotrauma.JobPrefab
_G['JobPrefab'].Random = function(sync, predicate) end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.JobsFile):Barotrauma.JobPrefab
---@return Barotrauma.JobPrefab
_G['JobPrefab'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.JobsFile):Barotrauma.JobPrefab
---@return Barotrauma.JobPrefab
_G['JobPrefab'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.JobsFile):Barotrauma.JobPrefab
---@return Barotrauma.JobPrefab
_G['JobPrefab'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.JobsFile):Barotrauma.JobPrefab
---@return Barotrauma.JobPrefab
_G['JobPrefab'].__new = function() end

