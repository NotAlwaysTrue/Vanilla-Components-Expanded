---@meta
---@class Barotrauma.JoinLString : Barotrauma.LocalizedString
---`Field Private Instance`
---@field subStrs (System.Collections.Generic.IEnumerable*1Barotrauma*LocalizedString)|(fun():(Barotrauma.LocalizedString))
---`Field Private Instance`
---@field separator System.String
---`Getter Public Instance Virtual`
---@field Loaded System.Boolean
_G['JoinLString'] = {}

---`Method Public Instance Virtual`
_G['JoinLString'].RetrieveValue = function() end

---`Constructor Public Instance`
---@param separator System.String
---@param subStrs (System.Collections.Generic.IEnumerable*1Barotrauma*LocalizedString)|(fun():(Barotrauma.LocalizedString))
---@return Barotrauma.JoinLString
_G['JoinLString'] = function(separator, subStrs) end

---`Constructor Public Instance`
---@param separator System.String
---@param subStrs (System.Collections.Generic.IEnumerable*1Barotrauma*LocalizedString)|(fun():(Barotrauma.LocalizedString))
---@return Barotrauma.JoinLString
_G['JoinLString'].__new = function(separator, subStrs) end

