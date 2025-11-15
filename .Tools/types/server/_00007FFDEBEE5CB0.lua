---@meta
---@class Barotrauma.LevelObject : System.Object
---`Field Public Instance`
---@field Prefab Barotrauma.LevelObjectPrefab
---`Field Public Instance`
---@field Position Microsoft.Xna.Framework.Vector3
---`Field Public Instance`
---@field NetworkUpdateTimer System.Single
---`Field Public Instance`
---@field Scale System.Single
---`Field Public Instance`
---@field Rotation System.Single
---`Field Private Instance`
---@field spriteIndex System.Int32
---`Field NonPublic Instance`
---@field tookDamage System.Boolean
---`Field Public Instance`
---@field ActivePrefab Barotrauma.LevelObjectPrefab
---`Field Public Instance`
---@field ParentCave Barotrauma.Level.Cave
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PhysicsBody Barotrauma.PhysicsBody
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Triggers (System.Collections.Generic.List*1Barotrauma*LevelTrigger)|(Barotrauma.LevelTrigger[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field NeedsNetworkSyncing System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field NeedsUpdate System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter Private Instance`
---@field Health System.Single
---`Getter Public Instance`
---@field Sprite Barotrauma.Sprite
---`Getter Public Instance Virtual`
---@field WorldPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field SimPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field Submarine Barotrauma.Submarine
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance Virtual`
---@field SerializableProperties (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*SerializableProperty)|({[Barotrauma.Identifier]:(Barotrauma.SerializableProperty)})
_G['LevelObject'] = {}

---`Method Public Instance Virtual`
---@param attacker Barotrauma.Character
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param attack Barotrauma.Attack
---@param impulseDirection Microsoft.Xna.Framework.Vector2
---@param deltaTime System.Single
---@param playSound? System.Boolean
---@return Barotrauma.AttackResult
_G['LevelObject'].AddDamage = function(attacker, worldPosition, attack, impulseDirection, deltaTime, playSound) end

---`Method Public Instance`
---@param damage System.Single
---@param deltaTime System.Single
---@param attacker Barotrauma.Entity
---@param isNetworkEvent? System.Boolean
_G['LevelObject'].AddDamage = function(damage, deltaTime, attacker, isNetworkEvent) end

---`Method Public Instance`
---@param localPosition Microsoft.Xna.Framework.Vector2
---@param swingState? System.Single
---@return Microsoft.Xna.Framework.Vector2
_G['LevelObject'].LocalToWorld = function(localPosition, swingState) end

---`Method Public Instance`
_G['LevelObject'].Remove = function() end

---`Method Public Instance Virtual`
---@return System.String
_G['LevelObject'].ToString = function() end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
_G['LevelObject'].ServerWrite = function(msg, c) end

---`Constructor Public Instance`
---@param prefab Barotrauma.LevelObjectPrefab
---@param position Microsoft.Xna.Framework.Vector3
---@param scale System.Single
---@param rotation? System.Single
---@return Barotrauma.LevelObject
_G['LevelObject'] = function(prefab, position, scale, rotation) end

---`Constructor Public Instance`
---@param prefab Barotrauma.LevelObjectPrefab
---@param position Microsoft.Xna.Framework.Vector3
---@param scale System.Single
---@param rotation? System.Single
---@return Barotrauma.LevelObject
_G['LevelObject'].__new = function(prefab, position, scale, rotation) end

