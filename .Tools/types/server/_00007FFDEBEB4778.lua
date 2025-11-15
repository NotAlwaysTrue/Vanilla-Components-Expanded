---@meta
---@class Barotrauma.CampaignMetadata : System.Object
---`Field Private Instance`
---@field data (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Object)|({[Barotrauma.Identifier]:(System.Object)})
_G['CampaignMetadata'] = {}

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['CampaignMetadata'].Load = function(element) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@param value System.Object
_G['CampaignMetadata'].SetValue = function(identifier, value) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@param defaultValue? System.Nullable*1System*Single
---@return System.Single
_G['CampaignMetadata'].GetFloat = function(identifier, defaultValue) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@param defaultValue? System.Nullable*1System*Int32
---@return System.Int32
_G['CampaignMetadata'].GetInt = function(identifier, defaultValue) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@param defaultValue? System.Nullable*1System*Boolean
---@return System.Boolean
_G['CampaignMetadata'].GetBoolean = function(identifier, defaultValue) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@param defaultValue? System.String
---@return System.String
_G['CampaignMetadata'].GetString = function(identifier, defaultValue) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['CampaignMetadata'].HasKey = function(identifier) end

---`Method Private Instance`
---@param identifier Barotrauma.Identifier
---@param type System.Type
---@param defaultValue System.Object
---@return System.Object
_G['CampaignMetadata'].GetTypeOrDefault = function(identifier, type, defaultValue) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@return System.Object
_G['CampaignMetadata'].GetValue = function(identifier) end

---`Method Public Instance`
---@param modeElement System.Xml.Linq.XElement
_G['CampaignMetadata'].Save = function(modeElement) end

---`Constructor Public Instance`
---@return Barotrauma.CampaignMetadata
_G['CampaignMetadata'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.CampaignMetadata
_G['CampaignMetadata'].__new = function() end

