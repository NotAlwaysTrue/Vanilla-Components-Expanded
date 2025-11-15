---@meta
---@class Barotrauma.SpriteRecorder : System.Object
---`Field Private Instance`
---@field recordedBuffers (System.Collections.Generic.List*1Barotrauma*SpriteRecorder*RecordedBuffer)|(Barotrauma.SpriteRecorder.RecordedBuffer[])
---`Field Private Instance`
---@field commandList (System.Collections.Generic.List*1Barotrauma*SpriteRecorder*Command)|(Barotrauma.SpriteRecorder.Command[])
---`Field Private Instance`
---@field currentSortMode Microsoft.Xna.Framework.Graphics.SpriteSortMode
---`Field Private Instance`
---@field indexBuffer Microsoft.Xna.Framework.Graphics.IndexBuffer
---`Field Private Instance`
---@field maxSpriteCount System.Int32
---`Field Public Instance`
---@field ReadyToRender System.Boolean
---`Field Private Instance`
---@field isDisposed System.Boolean
---`Field Public Static`
---@field BasicEffect Microsoft.Xna.Framework.Graphics.BasicEffect
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Min Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Max Microsoft.Xna.Framework.Vector2
_G['SpriteRecorder'] = {}

---`Method Public Instance`
---@param sortMode Microsoft.Xna.Framework.Graphics.SpriteSortMode
_G['SpriteRecorder'].Begin = function(sortMode) end

---`Method Private Instance`
---@param command Barotrauma.SpriteRecorder.Command
_G['SpriteRecorder'].AppendCommand = function(command) end

---`Method Public Instance Virtual`
---@overload fun(texture:Microsoft.Xna.Framework.Graphics.Texture2D, pos:Microsoft.Xna.Framework.Vector2, srcRect:System.Nullable*1Microsoft*Xna*Framework*Rectangle, color:Microsoft.Xna.Framework.Color, rotationRad:System.Single, origin:Microsoft.Xna.Framework.Vector2, scale:Microsoft.Xna.Framework.Vector2, effects:Microsoft.Xna.Framework.Graphics.SpriteEffects, depth:System.Single)
---@param texture Microsoft.Xna.Framework.Graphics.Texture2D
---@param vertices (Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture-arr)|(Microsoft.Xna.Framework.Graphics.VertexPositionColorTexture[])
---@param layerDepth System.Single
---@param count? System.Nullable*1System*Int32
_G['SpriteRecorder'].Draw = function(texture, vertices, layerDepth, count) end

---`Method Public Instance`
_G['SpriteRecorder'].End = function() end

---`Method Public Instance`
---@param cam Barotrauma.Camera
_G['SpriteRecorder'].Render = function(cam) end

---`Method Public Instance Virtual`
_G['SpriteRecorder'].Dispose = function() end

---`Constructor Public Instance`
---@return Barotrauma.SpriteRecorder
_G['SpriteRecorder'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.SpriteRecorder
_G['SpriteRecorder'].__new = function() end

