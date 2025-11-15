---@meta
---@class Barotrauma.Items.Components.EntitySpawnerComponent : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field spawnTimer System.Single
---`Field Private Instance`
---@field spawnTimerGoal System.Nullable*1System*Single
---`Field Private Instance`
---@field spawnedAmount System.Int32
---`Field Private Instance`
---@field preloadedCharacter Barotrauma.Character
---`Field Private Instance`
---@field preloadInitiated System.Boolean
---`Getter Public Instance Virtual`
---@field DrawSize Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ItemIdentifier System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpeciesName System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field OnlySpawnWhenCrewInRange System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CrewAreaShape Barotrauma.Items.Components.EntitySpawnerComponent.AreaShape
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CrewAreaBounds Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CrewAreaRadius System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CrewAreaOffset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpawnAreaShape Barotrauma.Items.Components.EntitySpawnerComponent.AreaShape
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpawnAreaBounds Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpawnAreaRadius System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpawnAreaOffset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpawnTimerRange Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpawnAmountRange Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaximumAmount System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaximumAmountInArea System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaximumAmountRangePadding System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CanSpawn System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PreloadCharacter System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AffectedByPvPSpawnMonstersSetting System.Boolean
---`Getter Private Instance`
---@field DisabledByByPvPSpawnMonstersSetting System.Boolean
_G['Components']['EntitySpawnerComponent'] = {}

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param editing System.Boolean
---@param itemDepth? System.Single
---@param overrideColor? System.Nullable*1Microsoft*Xna*Framework*Color
_G['Components']['EntitySpawnerComponent'].Draw = function(spriteBatch, editing, itemDepth, overrideColor) end

---`Method Public Instance Virtual`
_G['Components']['EntitySpawnerComponent'].OnItemLoaded = function() end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['EntitySpawnerComponent'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['EntitySpawnerComponent'].ReceiveSignal = function(signal, connection) end

---`Method Private Instance`
---@param size Microsoft.Xna.Framework.Vector2
---@param offset Microsoft.Xna.Framework.Vector2
---@param draw System.Boolean
---@return Microsoft.Xna.Framework.RectangleF
_G['Components']['EntitySpawnerComponent'].GetAreaRectangle = function(size, offset, draw) end

---`Method Private Instance`
---@return System.Boolean
_G['Components']['EntitySpawnerComponent'].CanSpawnMore = function() end

---`Method Private Instance`
---@param worldPos Microsoft.Xna.Framework.Vector2
---@param crewArea? System.Boolean
---@param rangePad? System.Boolean
---@return System.Boolean
_G['Components']['EntitySpawnerComponent'].IsInRange = function(worldPos, crewArea, rangePad) end

---`Method Public Instance`
_G['Components']['EntitySpawnerComponent'].Spawn = function() end

---`Method Private Instance`
---@param pos Microsoft.Xna.Framework.Vector2
---@param onSpawn? (System.Action*1Barotrauma*Character)|(fun(obj:Barotrauma.Character))
_G['Components']['EntitySpawnerComponent'].SpawnCharacter = function(pos, onSpawn) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.EntitySpawnerComponent
_G['Components']['EntitySpawnerComponent'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.EntitySpawnerComponent
_G['Components']['EntitySpawnerComponent'].__new = function(item, element) end

