---@meta
---@class Barotrauma.LevelWallVertexBuffer : System.Object
---`Field Public Instance`
---@field WallBuffer Microsoft.Xna.Framework.Graphics.VertexBuffer
---`Field Public Instance`
---@field WallEdgeBuffer Microsoft.Xna.Framework.Graphics.VertexBuffer
---`Field Public Instance`
---@field WallInnerBuffer Microsoft.Xna.Framework.Graphics.VertexBuffer
---`Field Public Instance`
---@field WallTexture Microsoft.Xna.Framework.Graphics.Texture2D
---`Field Public Instance`
---@field EdgeTexture Microsoft.Xna.Framework.Graphics.Texture2D
---`Field Private Instance`
---@field wallVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---`Field Private Instance`
---@field wallEdgeVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---`Field Private Instance`
---@field wallInnerVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColor-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColor[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsDisposed System.Boolean
_G['LevelWallVertexBuffer'] = {}

---`Method Public Instance`
---@param newWallVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---@param newWallEdgeVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---@param newWallInnerVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColor-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColor[])
_G['LevelWallVertexBuffer'].Append = function(newWallVertices, newWallEdgeVertices, newWallInnerVertices) end

---`Method Public Instance Virtual`
_G['LevelWallVertexBuffer'].Dispose = function() end

---`Constructor Public Instance`
---@param wallVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---@param wallEdgeVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---@param wallInnerVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColor-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColor[])
---@param wallTexture Microsoft.Xna.Framework.Graphics.Texture2D
---@param edgeTexture Microsoft.Xna.Framework.Graphics.Texture2D
---@return Barotrauma.LevelWallVertexBuffer
_G['LevelWallVertexBuffer'] = function(wallVertices, wallEdgeVertices, wallInnerVertices, wallTexture, edgeTexture) end

---`Constructor Public Instance`
---@param wallVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---@param wallEdgeVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---@param wallInnerVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColor-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColor[])
---@param wallTexture Microsoft.Xna.Framework.Graphics.Texture2D
---@param edgeTexture Microsoft.Xna.Framework.Graphics.Texture2D
---@return Barotrauma.LevelWallVertexBuffer
_G['LevelWallVertexBuffer'].__new = function(wallVertices, wallEdgeVertices, wallInnerVertices, wallTexture, edgeTexture) end

