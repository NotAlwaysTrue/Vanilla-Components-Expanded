---@meta
---@class Barotrauma.Item.ChangePropertyEventData : System.ValueType
---`Field Public Instance`
---@field SerializableProperty Barotrauma.SerializableProperty
---`Field Public Instance`
---@field Entity Barotrauma.ISerializableEntity
---`Getter Public Instance Virtual`
---@field EventType Barotrauma.Item.EventType
_G['Item']['ChangePropertyEventData'] = {}

---`Constructor Public Instance`
---@param serializableProperty Barotrauma.SerializableProperty
---@param entity Barotrauma.ISerializableEntity
---@return Barotrauma.Item.ChangePropertyEventData
_G['Item']['ChangePropertyEventData'] = function(serializableProperty, entity) end

---`Constructor Public Instance`
---@param serializableProperty Barotrauma.SerializableProperty
---@param entity Barotrauma.ISerializableEntity
---@return Barotrauma.Item.ChangePropertyEventData
_G['Item']['ChangePropertyEventData'].__new = function(serializableProperty, entity) end

