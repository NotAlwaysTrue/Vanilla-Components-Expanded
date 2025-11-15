---@meta
---@class Barotrauma.DeconstructItem : System.ValueType
---`Field Public Instance`
---@field ItemIdentifier Barotrauma.Identifier
---`Field Public Instance`
---@field Amount System.Int32
---`Field Public Instance`
---@field MinCondition System.Single
---`Field Public Instance`
---@field MaxCondition System.Single
---`Field Public Instance`
---@field OutConditionMin System.Single
---`Field Public Instance`
---@field OutConditionMax System.Single
---`Field Public Instance`
---@field CopyCondition System.Boolean
---`Field Public Instance`
---@field RequiredDeconstructor (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field RequiredOtherItem (Barotrauma.Identifier-arr)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field ActivateButtonText System.String
---`Field Public Instance`
---@field InfoText System.String
---`Field Public Instance`
---@field InfoTextOnOtherItemMissing System.String
---`Field Public Instance`
---@field Commonness System.Single
_G['DeconstructItem'] = {}

---`Method Public Instance`
---@param deconstructor Barotrauma.Item
---@return System.Boolean
_G['DeconstructItem'].IsValidDeconstructor = function(deconstructor) end

---`Constructor Public Instance`
---@param element System.Xml.Linq.XElement
---@param parentDebugName Barotrauma.Identifier
---@return Barotrauma.DeconstructItem
_G['DeconstructItem'] = function(element, parentDebugName) end

---`Constructor Public Instance`
---@param element System.Xml.Linq.XElement
---@param parentDebugName Barotrauma.Identifier
---@return Barotrauma.DeconstructItem
_G['DeconstructItem'].__new = function(element, parentDebugName) end

