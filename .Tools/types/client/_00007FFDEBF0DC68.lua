---@meta
---@class Barotrauma.RawLString : Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---@field Loaded System.Boolean
_G['RawLString'] = {}

---`Method NonPublic Instance Virtual`
---@return System.Boolean
_G['RawLString'].MustRetrieveValue = function() end

---`Method Public Instance Virtual`
_G['RawLString'].RetrieveValue = function() end

---`Constructor Public Instance`
---@param value System.String
---@return Barotrauma.RawLString
_G['RawLString'] = function(value) end

---`Constructor Public Instance`
---@param value System.String
---@return Barotrauma.RawLString
_G['RawLString'].__new = function(value) end

