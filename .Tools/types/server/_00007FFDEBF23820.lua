---@meta
---@class Barotrauma.PetBehavior : System.Object
---`Field Private Instance`
---@field hunger System.Single
---`Field Private Instance`
---@field happiness System.Single
---`Field Private Instance`
---@field itemsToProduce (System.Collections.Generic.List*1Barotrauma*PetBehavior*ItemProduction)|(Barotrauma.PetBehavior.ItemProduction[])
---`Field Private Instance`
---@field foods (System.Collections.Generic.List*1Barotrauma*PetBehavior*Food)|(Barotrauma.PetBehavior.Food[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Hunger System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Happiness System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UnhappyThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HappyThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxHappiness System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HideStatusIndicators System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HungryThreshold System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxHunger System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HappinessDecreaseRate System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HungerIncreaseRate System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PlayForce System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PlayTimer System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PlayCooldown System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ToggleOwner System.Boolean
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field UnstunY System.Nullable*1System*Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AIController Barotrauma.EnemyAIController
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Owner Barotrauma.Character
_G['PetBehavior'] = {}

---`Method Public Instance`
---@return Barotrauma.PetBehavior.StatusIndicatorType
_G['PetBehavior'].GetCurrentStatusIndicatorType = function() end

---`Method Public Instance`
---@overload fun(item:Barotrauma.Item):(System.Boolean)
---@overload fun(character:Barotrauma.Character):(System.Boolean)
---@param tag Barotrauma.Identifier
---@return System.Boolean
_G['PetBehavior'].OnEat = function(tag) end

---`Method Private Instance`
---@param tags (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['PetBehavior'].OnEat = function(tags) end

---`Method Public Instance`
---@param player Barotrauma.Character
---@return System.Boolean
_G['PetBehavior'].CanPlayWith = function(player) end

---`Method Public Instance`
---@param player Barotrauma.Character
_G['PetBehavior'].Play = function(player) end

---`Method Public Instance`
---@return System.String
_G['PetBehavior'].GetTagName = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['PetBehavior'].Update = function(deltaTime) end

---`Method Public Static`
---@param petsElement System.Xml.Linq.XElement
_G['PetBehavior'].SavePets = function(petsElement) end

---`Method Public Static`
---@param petsElement System.Xml.Linq.XElement
_G['PetBehavior'].LoadPets = function(petsElement) end

---`Constructor Public Instance`
---@param element System.Xml.Linq.XElement
---@param aiController Barotrauma.EnemyAIController
---@return Barotrauma.PetBehavior
_G['PetBehavior'] = function(element, aiController) end

---`Constructor Public Instance`
---@param element System.Xml.Linq.XElement
---@param aiController Barotrauma.EnemyAIController
---@return Barotrauma.PetBehavior
_G['PetBehavior'].__new = function(element, aiController) end

