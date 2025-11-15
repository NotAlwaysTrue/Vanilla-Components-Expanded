---@meta
---@class Barotrauma.LuaCsFile : System.Object
_G['File'] = {}

---`Method Public Static`
---@param path System.String
---@return System.Boolean
_G['File'].CanReadFromPath = function(path) end

---`Method Public Static`
---@param path System.String
---@return System.Boolean
_G['File'].CanWriteToPath = function(path) end

---`Method Public Static`
---@param path System.String
---@param write? System.Boolean
---@param origin? Barotrauma.LuaCsMessageOrigin
---@return System.Boolean
_G['File'].IsPathAllowedException = function(path, write, origin) end

---`Method Public Static`
---@param path System.String
---@param write? System.Boolean
---@return System.Boolean
_G['File'].IsPathAllowedLuaException = function(path, write) end

---`Method Public Static`
---@param path System.String
---@param write? System.Boolean
---@return System.Boolean
_G['File'].IsPathAllowedCsException = function(path, write) end

---`Method Public Static`
---@param path System.String
---@return System.String
_G['File'].Read = function(path) end

---`Method Public Static`
---@param path System.String
---@param text System.String
_G['File'].Write = function(path, text) end

---`Method Public Static`
---@param path System.String
_G['File'].Delete = function(path) end

---`Method Public Static`
---@param path System.String
_G['File'].DeleteDirectory = function(path) end

---`Method Public Static`
---@param path System.String
---@param destination System.String
_G['File'].Move = function(path, destination) end

---`Method Public Static`
---@param path System.String
---@return System.IO.FileStream
_G['File'].OpenRead = function(path) end

---`Method Public Static`
---@param path System.String
---@return System.IO.FileStream
_G['File'].OpenWrite = function(path) end

---`Method Public Static`
---@param path System.String
---@return System.Boolean
_G['File'].Exists = function(path) end

---`Method Public Static`
---@param path System.String
---@return System.Boolean
_G['File'].CreateDirectory = function(path) end

---`Method Public Static`
---@param path System.String
---@return System.Boolean
_G['File'].DirectoryExists = function(path) end

---`Method Public Static`
---@param path System.String
---@return (System.String-arr)|(System.String[])
_G['File'].GetFiles = function(path) end

---`Method Public Static`
---@param path System.String
---@return (System.String-arr)|(System.String[])
_G['File'].GetDirectories = function(path) end

---`Method Public Static`
---@param sDir System.String
---@return (System.String-arr)|(System.String[])
_G['File'].DirSearch = function(sDir) end

---`Constructor Public Instance`
---@return Barotrauma.LuaCsFile
_G['File'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.LuaCsFile
_G['File'].__new = function() end

