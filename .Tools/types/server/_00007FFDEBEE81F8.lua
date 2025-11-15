---@meta
---@class Barotrauma.Radiation : System.Object
---`Field Public Instance`
---@field Map Barotrauma.Map
---`Field Public Instance`
---@field Params Barotrauma.RadiationParams
---`Field Private Instance`
---@field radiationTimer System.Single
---`Field Private Instance`
---@field increasedAmount System.Single
---`Field Private Instance`
---@field lastIncrease System.Single
---`Getter Public Instance Virtual`
---@field Name System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Amount System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Enabled System.Boolean
---`Getter Public Instance Virtual`
---@field SerializableProperties (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*SerializableProperty)|({[Barotrauma.Identifier]:(Barotrauma.SerializableProperty)})
_G['Radiation'] = {}

---`Method Public Instance`
---@param steps? System.Single
_G['Radiation'].OnStep = function(steps) end

---`Method Public Instance`
---@param amount System.Single
_G['Radiation'].IncreaseRadiation = function(amount) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['Radiation'].UpdateRadiation = function(deltaTime) end

---`Method Public Instance`
---@overload fun(location:Barotrauma.Location):(System.Single)
---@param entity Barotrauma.Entity
---@return System.Single
_G['Radiation'].DepthInRadiation = function(entity) end

---`Method Private Instance`
---@param pos Microsoft.Xna.Framework.Vector2
---@return System.Single
_G['Radiation'].DepthInRadiation = function(pos) end

---`Method Public Instance`
---@return System.Xml.Linq.XElement
_G['Radiation'].Save = function() end

---`Constructor Public Instance`
---@param map Barotrauma.Map
---@param radiationParams Barotrauma.RadiationParams
---@param element? System.Xml.Linq.XElement
---@return Barotrauma.Radiation
_G['Radiation'] = function(map, radiationParams, element) end

---`Constructor Public Instance`
---@param map Barotrauma.Map
---@param radiationParams Barotrauma.RadiationParams
---@param element? System.Xml.Linq.XElement
---@return Barotrauma.Radiation
_G['Radiation'].__new = function(map, radiationParams, element) end

