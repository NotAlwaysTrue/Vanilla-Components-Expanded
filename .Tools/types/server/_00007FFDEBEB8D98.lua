---@meta
---@class Barotrauma.IndoorsSteeringManager : Barotrauma.SteeringManager
---`Field Private Instance`
---@field pathFinder Barotrauma.PathFinder
---`Field Private Instance`
---@field currentPath Barotrauma.SteeringPath
---`Field Private Instance`
---@field canOpenDoors System.Boolean
---`Field Private Instance`
---@field character Barotrauma.Character
---`Field Private Instance`
---@field currentTargetPos Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field findPathTimer System.Single
---`Field Private Instance`
---@field checkDoorsTimer System.Single
---`Field Private Instance`
---@field buttonPressTimer System.Single
---`Field Private Instance`
---@field lastDoor System.ValueTuple*1Barotrauma*Items*Components*Door*1System*Boolean
---`Field Public Static`
---@field smallRoomSize System.Single
---`Field Private Static`
---@field ButtonPressCooldown System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CanBreakDoors System.Boolean
---`Getter Public Instance`
---@field CurrentPath Barotrauma.SteeringPath
---`Getter Public Instance`
---@field PathFinder Barotrauma.PathFinder
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsPathDirty System.Boolean
---`Getter Public Instance`
---@field PathHasStairs System.Boolean
---`Getter Public Instance`
---@field IsCurrentNodeLadder System.Boolean
---`Getter Public Instance`
---@field IsNextNodeLadder System.Boolean
---`Getter Public Instance`
---@field IsNextLadderSameAsCurrent System.Boolean
_G['IndoorsSteeringManager'] = {}

---`Method Private Instance`
---@param door Barotrauma.Items.Components.Door
---@return System.Boolean
_G['IndoorsSteeringManager'].ShouldBreakDoor = function(door) end

---`Method Public Instance Virtual`
---@param speed System.Single
_G['IndoorsSteeringManager'].Update = function(speed) end

---`Method Public Instance`
---@param targetPos Microsoft.Xna.Framework.Vector2
---@param path Barotrauma.SteeringPath
_G['IndoorsSteeringManager'].SetPath = function(targetPos, path) end

---`Method Public Instance`
_G['IndoorsSteeringManager'].ResetPath = function() end

---`Method Public Instance`
---@param targetSimPos Microsoft.Xna.Framework.Vector2
---@param weight? System.Single
_G['IndoorsSteeringManager'].SteeringSeekSimple = function(targetSimPos, weight) end

---`Method Public Instance`
---@param target Microsoft.Xna.Framework.Vector2
---@param weight System.Single
---@param minGapWidth? System.Single
---@param startNodeFilter? (System.Func*1Barotrauma*PathNode*1System*Boolean)|(fun(arg:Barotrauma.PathNode):(System.Boolean))
---@param endNodeFilter? (System.Func*1Barotrauma*PathNode*1System*Boolean)|(fun(arg:Barotrauma.PathNode):(System.Boolean))
---@param nodeFilter? (System.Func*1Barotrauma*PathNode*1System*Boolean)|(fun(arg:Barotrauma.PathNode):(System.Boolean))
---@param checkVisiblity? System.Boolean
---@param outsideNodePenalty? System.Single
_G['IndoorsSteeringManager'].SteeringSeek = function(target, weight, minGapWidth, startNodeFilter, endNodeFilter, nodeFilter, checkVisiblity, outsideNodePenalty) end

---`Method Public Instance`
---@return Barotrauma.Items.Components.Ladder
_G['IndoorsSteeringManager'].GetCurrentLadder = function() end

---`Method Public Instance`
---@return Barotrauma.Items.Components.Ladder
_G['IndoorsSteeringManager'].GetNextLadder = function() end

---`Method Private Instance`
---@param wp Barotrauma.WayPoint
---@return Barotrauma.Items.Components.Ladder
_G['IndoorsSteeringManager'].GetLadder = function(wp) end

---`Method Private Instance`
---@param target Microsoft.Xna.Framework.Vector2
---@param weight System.Single
---@param minGapSize? System.Single
---@param startNodeFilter? (System.Func*1Barotrauma*PathNode*1System*Boolean)|(fun(arg:Barotrauma.PathNode):(System.Boolean))
---@param endNodeFilter? (System.Func*1Barotrauma*PathNode*1System*Boolean)|(fun(arg:Barotrauma.PathNode):(System.Boolean))
---@param nodeFilter? (System.Func*1Barotrauma*PathNode*1System*Boolean)|(fun(arg:Barotrauma.PathNode):(System.Boolean))
---@param checkVisibility? System.Boolean
---@param outsideNodePenalty? System.Single
---@return Microsoft.Xna.Framework.Vector2
_G['IndoorsSteeringManager'].CalculateSteeringSeek = function(target, weight, minGapSize, startNodeFilter, endNodeFilter, nodeFilter, checkVisibility, outsideNodePenalty) end

---`Method NonPublic Instance Virtual`
---@param target Microsoft.Xna.Framework.Vector2
---@param weight System.Single
---@return Microsoft.Xna.Framework.Vector2
_G['IndoorsSteeringManager'].DoSteeringSeek = function(target, weight) end

---`Method Private Instance`
---@return Microsoft.Xna.Framework.Vector2
_G['IndoorsSteeringManager'].DiffToCurrentNode = function() end

---`Method Private Instance`
---@param checkDoors System.Boolean
_G['IndoorsSteeringManager'].NextNode = function(checkDoors) end

---`Method Public Instance`
---@param door Barotrauma.Items.Components.Door
---@param buttonFilter? (System.Func*1Barotrauma*Items*Components*Controller*1System*Boolean)|(fun(arg:Barotrauma.Items.Components.Controller):(System.Boolean))
---@return System.Boolean
_G['IndoorsSteeringManager'].CanAccessDoor = function(door, buttonFilter) end

---`Method Private Instance`
---@return Microsoft.Xna.Framework.Vector2
_G['IndoorsSteeringManager'].GetColliderSize = function() end

---`Method Private Instance`
---@return System.Single
_G['IndoorsSteeringManager'].GetColliderLength = function() end

---`Method Private Instance`
---@return System.Single
_G['IndoorsSteeringManager'].GetDoorCheckTime = function() end

---`Method Private Instance`
_G['IndoorsSteeringManager'].CheckDoorsInPath = function() end

---`Method Private Instance`
---@param node Barotrauma.PathNode
---@param nextNode Barotrauma.PathNode
---@return System.Nullable*1System*Single
_G['IndoorsSteeringManager'].GetNodePenalty = function(node, nextNode) end

---`Method Private Instance`
---@param node Barotrauma.PathNode
---@return System.Nullable*1System*Single
_G['IndoorsSteeringManager'].GetSingleNodePenalty = function(node) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param wallAvoidDistance? System.Single
---@param stayStillInTightSpace? System.Boolean
_G['IndoorsSteeringManager'].Wander = function(deltaTime, wallAvoidDistance, stayStillInTightSpace) end

---`Constructor Public Instance`
---@overload fun(host:Barotrauma.ISteerable, canOpenDoors:System.Boolean, canBreakDoors:System.Boolean):Barotrauma.IndoorsSteeringManager
---@return Barotrauma.IndoorsSteeringManager
_G['IndoorsSteeringManager'] = function() end

---`Constructor Public Instance`
---@overload fun(host:Barotrauma.ISteerable, canOpenDoors:System.Boolean, canBreakDoors:System.Boolean):Barotrauma.IndoorsSteeringManager
---@return Barotrauma.IndoorsSteeringManager
_G['IndoorsSteeringManager'].__new = function() end

---`Constructor Private Static`
---@overload fun(host:Barotrauma.ISteerable, canOpenDoors:System.Boolean, canBreakDoors:System.Boolean):Barotrauma.IndoorsSteeringManager
---@return Barotrauma.IndoorsSteeringManager
_G['IndoorsSteeringManager'] = function() end

---`Constructor Private Static`
---@overload fun(host:Barotrauma.ISteerable, canOpenDoors:System.Boolean, canBreakDoors:System.Boolean):Barotrauma.IndoorsSteeringManager
---@return Barotrauma.IndoorsSteeringManager
_G['IndoorsSteeringManager'].__new = function() end

