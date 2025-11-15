---@meta
---@class Barotrauma.SwarmBehavior : System.Object
---`Field Private Instance`
---@field minDistFromClosest System.Single
---`Field Private Instance`
---@field maxDistFromCenter System.Single
---`Field Private Instance`
---@field cohesion System.Single
---`Field Private Instance`
---@field ai Barotrauma.EnemyAIController
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ForceActive System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Members (System.Collections.Generic.List*1Barotrauma*AICharacter)|(Barotrauma.AICharacter[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ActiveMembers (System.Collections.Generic.HashSet*1Barotrauma*AICharacter)|(Barotrauma.AICharacter[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsActive System.Boolean
---`Getter Public Instance`
---@field IsEnoughMembers System.Boolean
_G['SwarmBehavior'] = {}

---`Method Public Static`
---@param swarm (System.Collections.Generic.IEnumerable*1Barotrauma*AICharacter)|(fun():(Barotrauma.AICharacter))
_G['SwarmBehavior'].CreateSwarm = function(swarm) end

---`Method Public Instance`
_G['SwarmBehavior'].Refresh = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['SwarmBehavior'].UpdateSteering = function(deltaTime) end

---`Constructor Public Instance`
---@param element System.Xml.Linq.XElement
---@param ai Barotrauma.EnemyAIController
---@return Barotrauma.SwarmBehavior
_G['SwarmBehavior'] = function(element, ai) end

---`Constructor Public Instance`
---@param element System.Xml.Linq.XElement
---@param ai Barotrauma.EnemyAIController
---@return Barotrauma.SwarmBehavior
_G['SwarmBehavior'].__new = function(element, ai) end

