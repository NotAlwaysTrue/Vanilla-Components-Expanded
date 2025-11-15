---@meta
---@class Barotrauma.Md5Hash : System.Object
---`Field Public Instance`
---@field ByteRepresentation (System.Byte-arr)|(System.Byte[])
---`Field Public Instance`
---@field StringRepresentation System.String
---`Field Public Instance`
---@field ShortRepresentation System.String
---`Field Public Static`
---@field Blank Barotrauma.Md5Hash
---`Field Private Static`
---@field stringHashRegex System.Text.RegularExpressions.Regex
_G['Md5Hash'] = {}

---`Method Private Static`
---@param s System.String
---@return System.String
_G['Md5Hash'].RemoveWhitespace = function(s) end

---`Method Private Static`
---@param bytes (System.Byte-arr)|(System.Byte[])
---@param stringRepresentation System.String-ref
---@param byteRepresentation System.Byte-arr-ref
_G['Md5Hash'].CalculateHash = function(bytes, stringRepresentation, byteRepresentation) end

---`Method Private Static`
---@param byteHash (System.Byte-arr)|(System.Byte[])
---@return System.String
_G['Md5Hash'].ByteRepresentationToStringRepresentation = function(byteHash) end

---`Method Private Static`
---@param strHash System.String
---@return (System.Byte-arr)|(System.Byte[])
_G['Md5Hash'].StringRepresentationToByteRepresentation = function(strHash) end

---`Method Public Static`
---@param fullHash System.String
---@return System.String
_G['Md5Hash'].GetShortHash = function(fullHash) end

---`Method Public Static`
---@param hash System.String
---@return Barotrauma.Md5Hash
_G['Md5Hash'].StringAsHash = function(hash) end

---`Method Public Static`
---@param hashes (System.Collections.Generic.IEnumerable*1Barotrauma*Md5Hash)|(fun():(Barotrauma.Md5Hash))
---@return Barotrauma.Md5Hash
_G['Md5Hash'].MergeHashes = function(hashes) end

---`Method Public Static`
---@param bytes (System.Byte-arr)|(System.Byte[])
---@return Barotrauma.Md5Hash
_G['Md5Hash'].CalculateForBytes = function(bytes) end

---`Method Public Static`
---@param bytes (System.Byte-arr)|(System.Byte[])
---@return Barotrauma.Md5Hash
_G['Md5Hash'].BytesAsHash = function(bytes) end

---`Method Public Static`
---@param path System.String
---@param options Barotrauma.Md5Hash.StringHashOptions
---@return Barotrauma.Md5Hash
_G['Md5Hash'].CalculateForFile = function(path, options) end

---`Method Public Static`
---@param str System.String
---@param options Barotrauma.Md5Hash.StringHashOptions
---@return Barotrauma.Md5Hash
_G['Md5Hash'].CalculateForString = function(str, options) end

---`Method Public Instance Virtual`
---@return System.String
_G['Md5Hash'].ToString = function() end

---`Method Public Instance Virtual`
---@param obj System.Object
---@return System.Boolean
_G['Md5Hash'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['Md5Hash'].GetHashCode = function() end

---`Constructor Private Instance`
---@overload fun(md5Hash:System.String):Barotrauma.Md5Hash
---@overload fun(bytes:(System.Byte-arr)|(System.Byte[]), calculate:System.Boolean):Barotrauma.Md5Hash
---@return Barotrauma.Md5Hash
_G['Md5Hash'] = function() end

---`Constructor Private Instance`
---@overload fun(md5Hash:System.String):Barotrauma.Md5Hash
---@overload fun(bytes:(System.Byte-arr)|(System.Byte[]), calculate:System.Boolean):Barotrauma.Md5Hash
---@return Barotrauma.Md5Hash
_G['Md5Hash'].__new = function() end

---`Constructor Private Static`
---@overload fun(md5Hash:System.String):Barotrauma.Md5Hash
---@overload fun(bytes:(System.Byte-arr)|(System.Byte[]), calculate:System.Boolean):Barotrauma.Md5Hash
---@return Barotrauma.Md5Hash
_G['Md5Hash'] = function() end

---`Constructor Private Static`
---@overload fun(md5Hash:System.String):Barotrauma.Md5Hash
---@overload fun(bytes:(System.Byte-arr)|(System.Byte[]), calculate:System.Boolean):Barotrauma.Md5Hash
---@return Barotrauma.Md5Hash
_G['Md5Hash'].__new = function() end

