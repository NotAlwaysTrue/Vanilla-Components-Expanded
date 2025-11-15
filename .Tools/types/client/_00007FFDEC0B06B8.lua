---@meta
---@class Barotrauma.AIController : System.Object
---`Field Public Instance`
---@field Enabled System.Boolean
---`Field Public Instance`
---@field Character Barotrauma.Character
---`Field NonPublic Instance`
---@field _lastAiTarget Barotrauma.AITarget
---`Field NonPublic Instance`
---@field _previousAiTarget Barotrauma.AITarget
---`Field NonPublic Instance`
---@field _selectedAiTarget Barotrauma.AITarget
---`Field NonPublic Instance`
---@field steeringManager Barotrauma.SteeringManager
---`Field Private Instance`
---@field visibleHulls (System.Collections.Generic.IEnumerable*1Barotrauma*Hull)|(fun():(Barotrauma.Hull))
---`Field Private Instance`
---@field hullVisibilityTimer System.Single
---`Field NonPublic Instance`
---@field colliderWidth System.Single
---`Field NonPublic Instance`
---@field minGapSize System.Single
---`Field NonPublic Instance`
---@field colliderLength System.Single
---`Field NonPublic Instance`
---@field avoidLookAheadDistance System.Single
---`Field Private Instance`
---@field unequippedItems (System.Collections.Generic.HashSet*1Barotrauma*Item)|(Barotrauma.Item[])
---`Field Private Instance`
---@field escapeTargetSeekInterval System.Single
---`Field Private Instance`
---@field escapeTimer System.Single
---`Field NonPublic Instance`
---@field allGapsSearched System.Boolean
---`Field NonPublic Instance`
---@field unreachableGaps (System.Collections.Generic.HashSet*1Barotrauma*Gap)|(Barotrauma.Gap[])
---`Field Private Static`
---@field hullVisibilityInterval System.Single
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field SelectedAiTarget Barotrauma.AITarget
---`Getter Public Instance`
---@field SteeringManager Barotrauma.SteeringManager
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Steering Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field SimPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field WorldPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field Velocity Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field CanEnterSubmarine Barotrauma.CanEnterSubmarine
---`Getter Public Instance Virtual`
---@field CanFlip System.Boolean
---`Getter Public Instance Virtual`
---@field IsMentallyUnstable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field VisibleHulls (System.Collections.Generic.IEnumerable*1Barotrauma*Hull)|(fun():(Barotrauma.Hull))
---`Getter Public Instance`
---@field IsCurrentPathNullOrUnreachable System.Boolean
---`Getter Public Instance`
---@field IsCurrentPathUnreachable System.Boolean
---`Getter Public Instance`
---@field IsCurrentPathFinished System.Boolean
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field IsSteeringThroughGap System.Boolean
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field IsTryingToSteerThroughGap System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field EscapeTarget Barotrauma.Gap
_G['AIController'] = {}

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['AIController'].DebugDraw = function(spriteBatch) end

---`Method Public Instance`
---@param requireNonDirty? System.Boolean
---@param requireUnfinished? System.Boolean
---@param nodePredicate? (System.Func*1Barotrauma*WayPoint*1System*Boolean)|(fun(arg:Barotrauma.WayPoint):(System.Boolean))
---@return System.Boolean
_G['AIController'].HasValidPath = function(requireNonDirty, requireUnfinished, nodePredicate) end

---`Method Public Instance Virtual`
---@param healer Barotrauma.Character
---@param healAmount System.Single
_G['AIController'].OnHealed = function(healer, healAmount) end

---`Method Public Instance Virtual`
---@param attacker Barotrauma.Character
---@param attackResult Barotrauma.AttackResult
_G['AIController'].OnAttacked = function(attacker, attackResult) end

---`Method Public Instance Virtual`
---@param target Barotrauma.AITarget
_G['AIController'].SelectTarget = function(target) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
_G['AIController'].Update = function(deltaTime) end

---`Method Public Instance Virtual`
_G['AIController'].Reset = function() end

---`Method NonPublic Instance`
_G['AIController'].ResetAITarget = function() end

---`Method Public Instance`
---@param target Barotrauma.ISpatialEntity
_G['AIController'].FaceTarget = function(target) end

---`Method Public Instance Virtual`
---@overload fun(wall:Barotrauma.Structure, section:Barotrauma.WallSection, targetWorldPos:Microsoft.Xna.Framework.Vector2, deltaTime:System.Single):(System.Boolean)
---@param gap Barotrauma.Gap
---@param targetWorldPos Microsoft.Xna.Framework.Vector2
---@param deltaTime System.Single
---@param maxDistance? System.Single
---@return System.Boolean
_G['AIController'].SteerThroughGap = function(gap, targetWorldPos, deltaTime, maxDistance) end

---`Method Public Instance`
---@param wall Barotrauma.Structure
---@param sectionIndex System.Int32
---@param requiredHoleCount System.Int32
---@return System.Boolean
_G['AIController'].CanPassThroughHole = function(wall, sectionIndex, requiredHoleCount) end

---`Method NonPublic Instance`
---@param wall Barotrauma.Structure
---@return System.Boolean
_G['AIController'].IsWallDisabled = function(wall) end

---`Method Public Instance`
---@param item Barotrauma.Item
---@param targetInventory Barotrauma.CharacterInventory
---@param equip System.Boolean
---@param wear? System.Boolean
---@param dropOtherIfCannotMove? System.Boolean
---@param allowSwapping? System.Boolean
---@param storeUnequipped? System.Boolean
---@param targetTags? (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@return System.Boolean
_G['AIController'].TakeItem = function(item, targetInventory, equip, wear, dropOtherIfCannotMove, allowSwapping, storeUnequipped, targetTags) end

---`Method Public Instance`
---@param parentItem Barotrauma.Item
---@param avoidDroppingInSea? System.Boolean
---@param allowDestroying? System.Boolean
_G['AIController'].UnequipEmptyItems = function(parentItem, avoidDroppingInSea, allowDestroying) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param parentItem Barotrauma.Item
---@param avoidDroppingInSea? System.Boolean
---@param allowDestroying? System.Boolean
_G['AIController'].UnequipEmptyItems = function(character, parentItem, avoidDroppingInSea, allowDestroying) end

---`Method Public Instance`
---@param parentItem Barotrauma.Item
---@param predicate? (System.Func*1Barotrauma*Item*1System*Boolean)|(fun(arg:Barotrauma.Item):(System.Boolean))
---@param avoidDroppingInSea? System.Boolean
---@param allowDestroying? System.Boolean
---@param unequipMax? System.Nullable*1System*Int32
_G['AIController'].UnequipContainedItems = function(parentItem, predicate, avoidDroppingInSea, allowDestroying, unequipMax) end

---`Method Public Static`
---@param character Barotrauma.Character
---@param parentItem Barotrauma.Item
---@param predicate (System.Func*1Barotrauma*Item*1System*Boolean)|(fun(arg:Barotrauma.Item):(System.Boolean))
---@param avoidDroppingInSea? System.Boolean
---@param allowDestroying? System.Boolean
---@param unequipMax? System.Nullable*1System*Int32
_G['AIController'].UnequipContainedItems = function(character, parentItem, predicate, avoidDroppingInSea, allowDestroying, unequipMax) end

---`Method Public Instance`
---@overload fun(itemIdentifiers:(System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))):(System.Boolean)
---@param itemIdentifier Barotrauma.Identifier
---@return System.Boolean
_G['AIController'].HasInfiniteItemSpawns = function(itemIdentifier) end

---`Method Public Instance`
_G['AIController'].ReequipUnequipped = function() end

---`Method Public Instance Abstract Virtual`
---@param deltaTime System.Single
---@return System.Boolean
_G['AIController'].Escape = function(deltaTime) end

---`Method NonPublic Instance`
---@param deltaTime System.Single
---@param canAttackDoors System.Boolean
---@return System.Boolean
_G['AIController'].UpdateEscape = function(deltaTime, canAttackDoors) end

---`Method Public Instance`
_G['AIController'].ResetEscape = function() end

---`Method NonPublic Instance Virtual`
---@param from Barotrauma.AIState
---@param to Barotrauma.AIState
_G['AIController'].OnStateChanged = function(from, to) end

---`Method NonPublic Instance Virtual`
---@param previousTarget Barotrauma.AITarget
---@param newTarget Barotrauma.AITarget
_G['AIController'].OnTargetChanged = function(previousTarget, newTarget) end

---`Constructor Public Instance`
---@param c Barotrauma.Character
---@return Barotrauma.AIController
_G['AIController'] = function(c) end

---`Constructor Public Instance`
---@param c Barotrauma.Character
---@return Barotrauma.AIController
_G['AIController'].__new = function(c) end

