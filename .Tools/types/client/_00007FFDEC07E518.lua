---@meta
---@class Barotrauma.AICharacter : Barotrauma.Character
---`Field Private Instance`
---@field aiController Barotrauma.AIController
---`Getter Public Instance Virtual`
---@field AIController Barotrauma.AIController
_G['AICharacter'] = {}

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['AICharacter'].DrawFront = function(spriteBatch, cam) end

---`Method Public Instance`
---@param aiController Barotrauma.AIController
_G['AICharacter'].SetAI = function(aiController) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['AICharacter'].Update = function(deltaTime, cam) end

---`Constructor Public Instance`
---@param prefab Barotrauma.CharacterPrefab
---@param position Microsoft.Xna.Framework.Vector2
---@param seed System.String
---@param characterInfo? Barotrauma.CharacterInfo
---@param id? System.UInt16
---@param isNetworkPlayer? System.Boolean
---@param ragdoll? Barotrauma.RagdollParams
---@param spawnInitialItems? System.Boolean
---@return Barotrauma.AICharacter
_G['AICharacter'] = function(prefab, position, seed, characterInfo, id, isNetworkPlayer, ragdoll, spawnInitialItems) end

---`Constructor Public Instance`
---@param prefab Barotrauma.CharacterPrefab
---@param position Microsoft.Xna.Framework.Vector2
---@param seed System.String
---@param characterInfo? Barotrauma.CharacterInfo
---@param id? System.UInt16
---@param isNetworkPlayer? System.Boolean
---@param ragdoll? Barotrauma.RagdollParams
---@param spawnInitialItems? System.Boolean
---@return Barotrauma.AICharacter
_G['AICharacter'].__new = function(prefab, position, seed, characterInfo, id, isNetworkPlayer, ragdoll, spawnInitialItems) end

