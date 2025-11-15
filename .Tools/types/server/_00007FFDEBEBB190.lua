---@meta
---@class Barotrauma.SteeringPath : System.Object
---`Field Private Instance`
---@field nodes (System.Collections.Generic.List*1Barotrauma*WayPoint)|(Barotrauma.WayPoint[])
---`Field Private Instance`
---@field currentIndex System.Int32
---`Field Private Instance`
---@field totalLength System.Nullable*1System*Single
---`Field Private Instance`
---@field nodeDistances (System.Collections.Generic.List*1System*Single)|(System.Single[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Unreachable System.Boolean
---`Getter Public Instance`
---@field TotalLength System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HasOutdoorsNodes System.Boolean
---`Getter Public Instance`
---@field CurrentIndex System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Cost System.Single
---`Getter Public Instance`
---@field PrevNode Barotrauma.WayPoint
---`Getter Public Instance`
---@field CurrentNode Barotrauma.WayPoint
---`Getter Public Instance`
---@field IsAtEndNode System.Boolean
---`Getter Public Instance`
---@field Nodes (System.Collections.Generic.List*1Barotrauma*WayPoint)|(Barotrauma.WayPoint[])
---`Getter Public Instance`
---@field NextNode Barotrauma.WayPoint
---`Getter Public Instance`
---@field Finished System.Boolean
_G['SteeringPath'] = {}

---`Method Public Instance`
---@param startIndex? System.Nullable*1System*Int32
---@param endIndex? System.Nullable*1System*Int32
---@return System.Single
_G['SteeringPath'].GetLength = function(startIndex, endIndex) end

---`Method Private Instance`
_G['SteeringPath'].CalculateTotalLength = function() end

---`Method Public Instance`
---@param node Barotrauma.WayPoint
_G['SteeringPath'].AddNode = function(node) end

---`Method Public Instance`
_G['SteeringPath'].SkipToNextNode = function() end

---`Method Public Instance`
---@param nodeIndex System.Int32
_G['SteeringPath'].SkipToNode = function(nodeIndex) end

---`Method Public Instance`
---@param simPosition Microsoft.Xna.Framework.Vector2
---@param minSimDistance? System.Single
---@return Barotrauma.WayPoint
_G['SteeringPath'].CheckProgress = function(simPosition, minSimDistance) end

---`Method Public Instance`
_G['SteeringPath'].ClearPath = function() end

---`Constructor Public Instance`
---@param unreachable? System.Boolean
---@return Barotrauma.SteeringPath
_G['SteeringPath'] = function(unreachable) end

---`Constructor Public Instance`
---@param unreachable? System.Boolean
---@return Barotrauma.SteeringPath
_G['SteeringPath'].__new = function(unreachable) end

