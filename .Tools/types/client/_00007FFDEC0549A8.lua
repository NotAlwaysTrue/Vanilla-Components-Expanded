---@meta
---@class Barotrauma.LevelObjectManager : Barotrauma.Entity
---`Field Private Instance`
---@field visibleObjectsBack (System.Collections.Generic.List*1Barotrauma*LevelObject)|(Barotrauma.LevelObject[])
---`Field Private Instance`
---@field visibleObjectsMid (System.Collections.Generic.List*1Barotrauma*LevelObject)|(Barotrauma.LevelObject[])
---`Field Private Instance`
---@field visibleObjectsFront (System.Collections.Generic.List*1Barotrauma*LevelObject)|(Barotrauma.LevelObject[])
---`Field Private Instance`
---@field allVisibleObjects (System.Collections.Generic.HashSet*1Barotrauma*LevelObject)|(Barotrauma.LevelObject[])
---`Field Private Instance`
---@field NextRefreshTime System.Double
---`Field Private Instance`
---@field currentGridIndices Microsoft.Xna.Framework.Rectangle
---`Field Public Instance`
---@field ForceRefreshVisibleObjects System.Boolean
---`Field Private Instance`
---@field objects (System.Collections.Generic.List*1Barotrauma*LevelObject)|(Barotrauma.LevelObject[])
---`Field Private Instance`
---@field updateableObjects (System.Collections.Generic.List*1Barotrauma*LevelObject)|(Barotrauma.LevelObject[])
---`Field Private Instance`
---@field objectGrid (System.Collections.Generic.List)|((System.Collections.Generic.List*1Barotrauma*LevelObject)|(Barotrauma.LevelObject[])[])
---`Field Private Static`
---@field objectsInRange (System.Collections.Generic.HashSet*1Barotrauma*LevelObject)|(Barotrauma.LevelObject[])
---`Field Private Static`
---@field MaxVisibleObjects System.Int32
---`Field Private Static`
---@field GridSize System.Int32
---`Field Public Static`
---@field ParallaxStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field GlobalForceDecreaseTimer System.Single
_G['LevelObjectManager'] = {}

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*LevelObject)|(fun():(Barotrauma.LevelObject))
_G['LevelObjectManager'].GetAllVisibleObjects = function() end

---`Method Private Instance`
---@param currentIndices Microsoft.Xna.Framework.Rectangle
---@param zoom System.Single
_G['LevelObjectManager'].RefreshVisibleObjects = function(currentIndices, zoom) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['LevelObjectManager'].DrawObjectsBack = function(spriteBatch, cam) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['LevelObjectManager'].DrawObjectsMid = function(spriteBatch, cam) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['LevelObjectManager'].DrawObjectsFront = function(spriteBatch, cam) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
---@param objectList (System.Collections.Generic.List*1Barotrauma*LevelObject)|(Barotrauma.LevelObject[])
_G['LevelObjectManager'].DrawObjects = function(spriteBatch, cam, objectList) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['LevelObjectManager'].ClientEventRead = function(msg, sendingTime) end

---`Method Public Instance`
---@param level Barotrauma.Level
---@param amount System.Int32
_G['LevelObjectManager'].PlaceObjects = function(level, amount) end

---`Method Public Instance`
---@param level Barotrauma.Level
---@param cave Barotrauma.Level.Cave
---@param nestPosition Microsoft.Xna.Framework.Vector2
---@param nestRadius System.Single
---@param objectAmount System.Int32
_G['LevelObjectManager'].PlaceNestObjects = function(level, cave, nestPosition, nestRadius, objectAmount) end

---`Method Private Instance`
---@param prefab Barotrauma.LevelObjectPrefab
---@param spawnPosition Barotrauma.LevelObjectManager.SpawnPosition
---@param level Barotrauma.Level
---@param parentCave? Barotrauma.Level.Cave
_G['LevelObjectManager'].PlaceObject = function(prefab, spawnPosition, level, parentCave) end

---`Method Private Instance`
---@param newObject Barotrauma.LevelObject
---@param level Barotrauma.Level
_G['LevelObjectManager'].AddObject = function(newObject, level) end

---`Method Public Static`
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@return Microsoft.Xna.Framework.Point
_G['LevelObjectManager'].GetGridIndices = function(worldPosition) end

---`Method Public Instance`
---@overload fun():((System.Collections.Generic.IEnumerable*1Barotrauma*LevelObject)|(fun():(Barotrauma.LevelObject)))
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param radius System.Single
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*LevelObject)|(fun():(Barotrauma.LevelObject))
_G['LevelObjectManager'].GetAllObjects = function(worldPosition, radius) end

---`Method Private Static`
---@param cells (System.Collections.Generic.IEnumerable*1Voronoi2*VoronoiCell)|(fun():(Voronoi2.VoronoiCell))
---@param spawnPosType Barotrauma.LevelObjectPrefab.SpawnPosType
---@return (System.Collections.Generic.List*1Barotrauma*LevelObjectManager*SpawnPosition)|(Barotrauma.LevelObjectManager.SpawnPosition[])
_G['LevelObjectManager'].GetAvailableSpawnPositions = function(cells, spawnPosType) end

---`Method Public Instance`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['LevelObjectManager'].Update = function(deltaTime, cam) end

---`Method Private Instance`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['LevelObjectManager'].UpdateProjSpecific = function(deltaTime, cam) end

---`Method Private Instance`
---@param triggeredObject Barotrauma.LevelObject
---@param trigger Barotrauma.LevelTrigger
---@param triggerer Barotrauma.Entity
_G['LevelObjectManager'].OnObjectTriggered = function(triggeredObject, trigger, triggerer) end

---`Method Private Static`
---@overload fun(level:Barotrauma.Level, availablePrefabs:(System.Collections.Generic.IList*1Barotrauma*LevelObjectPrefab)|(Barotrauma.LevelObjectPrefab[])):(Barotrauma.LevelObjectPrefab)
---@param caveParams Barotrauma.CaveGenerationParams
---@param availablePrefabs (System.Collections.Generic.IList*1Barotrauma*LevelObjectPrefab)|(Barotrauma.LevelObjectPrefab[])
---@param requireCaveSpecificOverride System.Boolean
---@return Barotrauma.LevelObjectPrefab
_G['LevelObjectManager'].GetRandomPrefab = function(caveParams, availablePrefabs, requireCaveSpecificOverride) end

---`Method Public Instance Virtual`
_G['LevelObjectManager'].Remove = function() end

---`Method Private Instance`
_G['LevelObjectManager'].RemoveProjSpecific = function() end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['LevelObjectManager'].ServerEventWrite = function(msg, c, extraData) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.LevelObjectManager
---@return Barotrauma.LevelObjectManager
_G['LevelObjectManager'] = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.LevelObjectManager
---@return Barotrauma.LevelObjectManager
_G['LevelObjectManager'].__new = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.LevelObjectManager
---@return Barotrauma.LevelObjectManager
_G['LevelObjectManager'] = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.LevelObjectManager
---@return Barotrauma.LevelObjectManager
_G['LevelObjectManager'].__new = function() end

