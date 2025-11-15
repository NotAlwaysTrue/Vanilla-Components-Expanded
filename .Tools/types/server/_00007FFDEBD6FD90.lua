---@meta
---@class Barotrauma.Networking.BannedPlayer : System.Object
---`Field Public Instance`
---@field Name System.String
---`Field Public Instance`
---@field AddressOrAccountId Barotrauma.Either*1Barotrauma*Networking*Address*1Barotrauma*Networking*AccountId
---`Field Public Instance`
---@field Reason System.String
---`Field Public Instance`
---@field ExpirationTime Barotrauma.Option*1Barotrauma*SerializableDateTime
---`Field Public Instance`
---@field UniqueIdentifier System.UInt32
---`Field Private Static`
---@field LastIdentifier System.UInt32
---`Getter Public Instance`
---@field Expired System.Boolean
_G['BannedPlayer'] = {}

---`Method Public Instance`
---@param client Barotrauma.Networking.Client
---@return System.Boolean
_G['BannedPlayer'].MatchesClient = function(client) end

---`Constructor Public Instance`
---@param name System.String
---@param addressOrAccountId Barotrauma.Either*1Barotrauma*Networking*Address*1Barotrauma*Networking*AccountId
---@param reason System.String
---@param expirationTime Barotrauma.Option*1Barotrauma*SerializableDateTime
---@return Barotrauma.Networking.BannedPlayer
_G['BannedPlayer'] = function(name, addressOrAccountId, reason, expirationTime) end

---`Constructor Public Instance`
---@param name System.String
---@param addressOrAccountId Barotrauma.Either*1Barotrauma*Networking*Address*1Barotrauma*Networking*AccountId
---@param reason System.String
---@param expirationTime Barotrauma.Option*1Barotrauma*SerializableDateTime
---@return Barotrauma.Networking.BannedPlayer
_G['BannedPlayer'].__new = function(name, addressOrAccountId, reason, expirationTime) end

