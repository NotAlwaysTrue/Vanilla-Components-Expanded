---@meta
---@class Barotrauma.WaterRenderer : System.Object
---`Field Public Instance`
---@field waterColor Microsoft.Xna.Framework.Color
---`Field Public Instance`
---@field IndoorsWaterColor Barotrauma.WaterVertexData
---`Field Public Instance`
---@field IndoorsSurfaceTopColor Barotrauma.WaterVertexData
---`Field Public Instance`
---@field IndoorsSurfaceBottomColor Barotrauma.WaterVertexData
---`Field Public Instance`
---@field vertices (Microsoft.Xna.Framework.Graphics.VertexPositionTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionTexture[])
---`Field Public Instance`
---@field IndoorsVertices (System.Collections.Generic.Dictionary*1Barotrauma*EntityGrid*1Microsoft*Xna*Framework*Graphics*VertexPositionColorTexture-arr)|({[Barotrauma.EntityGrid]:((Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[]))})
---`Field Private Instance`
---@field basicEffect Microsoft.Xna.Framework.Graphics.BasicEffect
---`Field Public Instance`
---@field PositionInBuffer System.Int32
---`Field Public Instance`
---@field PositionInIndoorsBuffer (System.Collections.Generic.Dictionary*1Barotrauma*EntityGrid*1System*Int32)|({[Barotrauma.EntityGrid]:(System.Int32)})
---`Field Private Instance`
---@field tempVertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---`Field Private Instance`
---@field tempCorners (Microsoft.Xna.Framework.Vector3-arr)|(Microsoft.Xna.Framework.Vector3[])
---`Field Private Instance`
---@field buffersToRemove (System.Collections.Generic.List*1Barotrauma*EntityGrid)|(Barotrauma.EntityGrid[])
---`Field Public Static`
---@field Instance Barotrauma.WaterRenderer
---`Field Public Static`
---@field DistortionScale Microsoft.Xna.Framework.Vector2
---`Field Public Static`
---@field DistortionStrength Microsoft.Xna.Framework.Vector2
---`Field Public Static`
---@field BlurAmount System.Single
---`Field Public Static`
---@field DefaultBufferSize System.Int32
---`Field Public Static`
---@field DefaultIndoorsBufferSize System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field WavePos Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field WaterEffect Microsoft.Xna.Framework.Graphics.Effect
---`Getter Public Instance`
---@field WaterTexture Microsoft.Xna.Framework.Graphics.Texture2D
_G['WaterRenderer'] = {}

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param texture Microsoft.Xna.Framework.Graphics.RenderTarget2D
---@param cam Barotrauma.Camera
_G['WaterRenderer'].RenderWater = function(spriteBatch, texture, cam) end

---`Method Public Instance`
---@param vel Microsoft.Xna.Framework.Vector2
---@param deltaTime System.Single
_G['WaterRenderer'].ScrollWater = function(vel, deltaTime) end

---`Method Public Instance`
---@param graphicsDevice Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param cam Barotrauma.Camera
---@param texture Microsoft.Xna.Framework.Graphics.RenderTarget2D
---@param transform Microsoft.Xna.Framework.Matrix
_G['WaterRenderer'].RenderAir = function(graphicsDevice, cam, texture, transform) end

---`Method Public Instance`
_G['WaterRenderer'].ResetBuffers = function() end

---`Method Public Instance Virtual`
_G['WaterRenderer'].Dispose = function() end

---`Constructor Public Instance`
---@overload fun(graphicsDevice:Microsoft.Xna.Framework.Graphics.GraphicsDevice):Barotrauma.WaterRenderer
---@return Barotrauma.WaterRenderer
_G['WaterRenderer'] = function() end

---`Constructor Public Instance`
---@overload fun(graphicsDevice:Microsoft.Xna.Framework.Graphics.GraphicsDevice):Barotrauma.WaterRenderer
---@return Barotrauma.WaterRenderer
_G['WaterRenderer'].__new = function() end

---`Constructor Private Static`
---@overload fun(graphicsDevice:Microsoft.Xna.Framework.Graphics.GraphicsDevice):Barotrauma.WaterRenderer
---@return Barotrauma.WaterRenderer
_G['WaterRenderer'] = function() end

---`Constructor Private Static`
---@overload fun(graphicsDevice:Microsoft.Xna.Framework.Graphics.GraphicsDevice):Barotrauma.WaterRenderer
---@return Barotrauma.WaterRenderer
_G['WaterRenderer'].__new = function() end

