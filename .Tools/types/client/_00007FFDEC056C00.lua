---@meta
---@class Barotrauma.LevelRenderer : System.Object
---`Field Private Instance`
---@field waterParticleOffset Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field waterParticleVelocity Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field flashCooldown System.Single
---`Field Private Instance`
---@field flashTimer System.Single
---`Field Private Instance`
---@field cullNone Microsoft.Xna.Framework.Graphics.RasterizerState
---`Field Private Instance`
---@field level Barotrauma.Level
---`Field Private Instance`
---@field vertexBuffers (System.Collections.Generic.List*1Barotrauma*LevelWallVertexBuffer)|(Barotrauma.LevelWallVertexBuffer[])
---`Field Private Instance`
---@field chromaticAberrationStrength System.Single
---`Field Private Static`
---@field wallEdgeEffect Microsoft.Xna.Framework.Graphics.BasicEffect
---`Field Private Static`
---@field wallCenterEffect Microsoft.Xna.Framework.Graphics.BasicEffect
---`Field Private Static`
---@field wallInnerEffect Microsoft.Xna.Framework.Graphics.BasicEffect
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FlashColor Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ChromaticAberrationStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CollapseEffectStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CollapseEffectOrigin Microsoft.Xna.Framework.Vector2
_G['LevelRenderer'] = {}

---`Method Public Instance`
_G['LevelRenderer'].ReloadTextures = function() end

---`Method Public Instance`
_G['LevelRenderer'].Flash = function() end

---`Method Public Instance`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['LevelRenderer'].Update = function(deltaTime, cam) end

---`Method Public Static`
---@param vertices (Microsoft.Xna.Framework.Graphics.VertexPositionTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionTexture[])
---@param color Microsoft.Xna.Framework.Color
---@return (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
_G['LevelRenderer'].GetColoredVertices = function(vertices, color) end

---`Method Public Instance`
---@param wallVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---@param wallEdgeVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---@param wallInnerVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColor-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColor[])
---@param wallTexture Microsoft.Xna.Framework.Graphics.Texture2D
---@param edgeTexture Microsoft.Xna.Framework.Graphics.Texture2D
_G['LevelRenderer'].SetVertices = function(wallVertices, wallEdgeVertices, wallInnerVertices, wallTexture, edgeTexture) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
---@param backgroundSpriteManager? Barotrauma.LevelObjectManager
---@param backgroundCreatureManager? Barotrauma.BackgroundCreatureManager
---@param particleManager? Barotrauma.Particles.ParticleManager
_G['LevelRenderer'].DrawBackground = function(spriteBatch, cam, backgroundSpriteManager, backgroundCreatureManager, particleManager) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
---@param backgroundSpriteManager? Barotrauma.LevelObjectManager
_G['LevelRenderer'].DrawForeground = function(spriteBatch, cam, backgroundSpriteManager) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['LevelRenderer'].DrawDebugOverlay = function(spriteBatch, cam) end

---`Method Public Instance`
---@param graphicsDevice Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param cam Barotrauma.Camera
_G['LevelRenderer'].RenderWalls = function(graphicsDevice, cam) end

---`Method Public Instance Virtual`
_G['LevelRenderer'].Dispose = function() end

---`Constructor Public Instance`
---@param level Barotrauma.Level
---@return Barotrauma.LevelRenderer
_G['LevelRenderer'] = function(level) end

---`Constructor Public Instance`
---@param level Barotrauma.Level
---@return Barotrauma.LevelRenderer
_G['LevelRenderer'].__new = function(level) end

