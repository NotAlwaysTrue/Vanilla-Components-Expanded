---@meta
---@class Barotrauma.Networking.NetworkConnection : System.Object
---`Field Public Instance`
---@field Endpoint Barotrauma.Networking.Endpoint
---`Field Public Instance`
---@field Status Barotrauma.Networking.NetworkConnectionStatus
---`Field Public Static`
---@field TimeoutThreshold System.Double
---`Field Public Static`
---@field TimeoutThresholdInGame System.Double
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AccountInfo Barotrauma.Networking.AccountInfo
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Language Barotrauma.LanguageIdentifier
_G['NetworkConnection'] = {}

---`Method Public Instance`
---@param endPoint Barotrauma.Networking.Endpoint
---@return System.Boolean
_G['NetworkConnection'].EndpointMatches = function(endPoint) end

---`Method Public Instance Abstract Virtual`
---@param other Barotrauma.Networking.NetworkConnection
---@return System.Boolean
_G['NetworkConnection'].AddressMatches = function(other) end

---`Method Public Instance`
---@param newInfo Barotrauma.Networking.AccountInfo
_G['NetworkConnection'].SetAccountInfo = function(newInfo) end

---`Method Public Instance Virtual`
---@return System.String
_G['NetworkConnection'].ToString = function() end

---`Constructor NonPublic Instance`
---@overload fun(endpoint:Barotrauma.Networking.Endpoint):Barotrauma.Networking.NetworkConnection
---@return Barotrauma.Networking.NetworkConnection
_G['NetworkConnection'] = function() end

---`Constructor NonPublic Instance`
---@overload fun(endpoint:Barotrauma.Networking.Endpoint):Barotrauma.Networking.NetworkConnection
---@return Barotrauma.Networking.NetworkConnection
_G['NetworkConnection'].__new = function() end

---`Constructor Private Static`
---@overload fun(endpoint:Barotrauma.Networking.Endpoint):Barotrauma.Networking.NetworkConnection
---@return Barotrauma.Networking.NetworkConnection
_G['NetworkConnection'] = function() end

---`Constructor Private Static`
---@overload fun(endpoint:Barotrauma.Networking.Endpoint):Barotrauma.Networking.NetworkConnection
---@return Barotrauma.Networking.NetworkConnection
_G['NetworkConnection'].__new = function() end

