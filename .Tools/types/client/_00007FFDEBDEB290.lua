---@meta
---@class Barotrauma.Media.Video : System.Object
---`Field Private Instance`
---@field videoInternal System.IntPtr
---`Field Private Instance`
---@field texture Microsoft.Xna.Framework.Graphics.Texture2D
---`Field Private Instance`
---@field textureChanged System.Boolean
---`Field Private Instance`
---@field textureData (System.Int32-arr)|(System.Int32[])
---`Field Private Instance`
---@field mutex System.Object
---`Field Private Instance`
---@field sound Barotrauma.Sounds.VideoSound
---`Field Private Static`
---@field VideoFrameCallback (Barotrauma.Media.Video.Internal.EventCallback)|(fun(videoInternal:System.IntPtr, data:System.IntPtr, dataElemSize:System.Int32, dataLen:System.Int32))
---`Field Private Static`
---@field VideoAudioCallback (Barotrauma.Media.Video.Internal.EventCallback)|(fun(videoInternal:System.IntPtr, data:System.IntPtr, dataElemSize:System.Int32, dataLen:System.Int32))
---`Field Private Static`
---@field videos (System.Collections.Generic.Dictionary*1System*IntPtr*1Barotrauma*Media*Video)|({[System.IntPtr]:(Barotrauma.Media.Video)})
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Width System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Height System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field AudioGain System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field LoadFailed System.Boolean
---`Getter Public Instance`
---@field IsPlaying System.Boolean
_G['Video'] = {}

---`Method Public Static`
_G['Video'].Init = function() end

---`Method Public Static`
_G['Video'].Close = function() end

---`Method Public Static`
---@param graphicsDevice Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param soundManager Barotrauma.Sounds.SoundManager
---@param filename System.String
---@return Barotrauma.Media.Video
_G['Video'].Load = function(graphicsDevice, soundManager, filename) end

---`Method Public Instance`
_G['Video'].Play = function() end

---`Method Public Instance Virtual`
_G['Video'].Dispose = function() end

---`Method Public Instance`
---@return Microsoft.Xna.Framework.Graphics.Texture2D
_G['Video'].GetTexture = function() end

---`Method Public Instance`
---@param data System.IntPtr
_G['Video'].SetFrameData = function(data) end

---`Method Private Static`
---@param videoInternal System.IntPtr
---@param data System.IntPtr
---@param dataElemSize System.Int32
---@param dataLen System.Int32
_G['Video'].VideoFrameUpdate = function(videoInternal, data, dataElemSize, dataLen) end

---`Method Private Static`
---@param videoInternal System.IntPtr
---@param data System.IntPtr
---@param dataElemSize System.Int32
---@param dataLen System.Int32
_G['Video'].VideoAudioUpdate = function(videoInternal, data, dataElemSize, dataLen) end

---`Constructor Private Instance`
---@param graphicsDevice Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param soundManager Barotrauma.Sounds.SoundManager
---@param filename System.String
---@return Barotrauma.Media.Video
_G['Video'] = function(graphicsDevice, soundManager, filename) end

---`Constructor Private Instance`
---@param graphicsDevice Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param soundManager Barotrauma.Sounds.SoundManager
---@param filename System.String
---@return Barotrauma.Media.Video
_G['Video'].__new = function(graphicsDevice, soundManager, filename) end

