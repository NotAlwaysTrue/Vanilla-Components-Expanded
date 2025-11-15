---@meta
---@class Barotrauma.TextureLoader : System.Object
---`Field Private Static`
---@field cancelAll System.Boolean
---`Field Private Static`
---@field _graphicsDevice Microsoft.Xna.Framework.Graphics.GraphicsDevice
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field PlaceHolderTexture Microsoft.Xna.Framework.Graphics.Texture2D
_G['TextureLoader'] = {}

---`Method Public Static`
---@param graphicsDevice Microsoft.Xna.Framework.Graphics.GraphicsDevice
---@param needsBmp? System.Boolean
_G['TextureLoader'].Init = function(graphicsDevice, needsBmp) end

---`Method Public Static`
_G['TextureLoader'].CancelAll = function() end

---`Method Private Static`
---@param data (System.Byte-arr)|(System.Byte[])
---@param width System.Int32
---@param height System.Int32
---@return (System.Byte-arr)|(System.Byte[])
_G['TextureLoader'].CompressDxt5 = function(data, width, height) end

---`Method Private Static`
---@param data (System.Byte-arr)|(System.Byte[])
---@param inputOffset System.Int32
---@param width System.Int32
---@param output (System.Byte-arr)|(System.Byte[])
---@param outputOffset System.Int32
_G['TextureLoader'].CompressDxt5Block = function(data, inputOffset, width, output, outputOffset) end

---`Method Public Static`
---@param path System.String
---@param compress? System.Boolean
---@param mipmap? System.Boolean
---@param contentPackage? Barotrauma.ContentPackage
---@return Microsoft.Xna.Framework.Graphics.Texture2D
_G['TextureLoader'].FromFile = function(path, compress, mipmap, contentPackage) end

---`Method Public Static`
---@param stream System.IO.Stream
---@param path? System.String
---@param compress? System.Boolean
---@param mipmap? System.Boolean
---@param contentPackage? Barotrauma.ContentPackage
---@return Microsoft.Xna.Framework.Graphics.Texture2D
_G['TextureLoader'].FromStream = function(stream, path, compress, mipmap, contentPackage) end

