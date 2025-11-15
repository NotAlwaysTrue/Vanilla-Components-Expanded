---@meta
---@class Barotrauma.ReadyCheck : System.Object
---`Field Private Instance`
---@field endTime System.DateTime
---`Field Private Instance`
---@field startTime System.DateTime
---`Field Public Instance`
---@field Clients (System.Collections.Generic.Dictionary*1System*Byte*1Barotrauma*ReadyStatus)|({[System.Byte]:(Barotrauma.ReadyStatus)})
---`Field Public Instance`
---@field IsFinished System.Boolean
---`Getter Private Static`
---@field ActivePlayers (System.Collections.Generic.List*1Barotrauma*Networking*Client)|(Barotrauma.Networking.Client[])
_G['ReadyCheck'] = {}

---`Method Public Instance`
---@param author System.String
---@param sender? Barotrauma.Networking.Client
_G['ReadyCheck'].InitializeReadyCheck = function(author, sender) end

---`Method Private Instance`
---@param otherClient System.Byte
---@param state Barotrauma.ReadyStatus
_G['ReadyCheck'].UpdateReadyCheck = function(otherClient, state) end

---`Method Public Static`
---@param inc Barotrauma.Networking.IReadMessage
---@param client Barotrauma.Networking.Client
_G['ReadyCheck'].ServerRead = function(inc, client) end

---`Method Public Static`
---@param author System.String
---@param sender? Barotrauma.Networking.Client
_G['ReadyCheck'].StartReadyCheck = function(author, sender) end

---`Method Private Instance`
_G['ReadyCheck'].EndReadyCheck = function() end

---`Method Public Instance`
---@param deltaTime System.Single
_G['ReadyCheck'].Update = function(deltaTime) end

---`Constructor Public Instance`
---@overload fun(clients:(System.Collections.Generic.List*1System*Byte)|(System.Byte[]), startTime:System.DateTime, endTime:System.DateTime):Barotrauma.ReadyCheck
---@overload fun(clients:(System.Collections.Generic.List*1System*Byte)|(System.Byte[]), duration:System.Single):Barotrauma.ReadyCheck
---@param clients (System.Collections.Generic.List*1System*Byte)|(System.Byte[])
---@return Barotrauma.ReadyCheck
_G['ReadyCheck'] = function(clients) end

---`Constructor Public Instance`
---@overload fun(clients:(System.Collections.Generic.List*1System*Byte)|(System.Byte[]), startTime:System.DateTime, endTime:System.DateTime):Barotrauma.ReadyCheck
---@overload fun(clients:(System.Collections.Generic.List*1System*Byte)|(System.Byte[]), duration:System.Single):Barotrauma.ReadyCheck
---@param clients (System.Collections.Generic.List*1System*Byte)|(System.Byte[])
---@return Barotrauma.ReadyCheck
_G['ReadyCheck'].__new = function(clients) end

---`Constructor Private Instance`
---@overload fun(clients:(System.Collections.Generic.List*1System*Byte)|(System.Byte[]), startTime:System.DateTime, endTime:System.DateTime):Barotrauma.ReadyCheck
---@overload fun(clients:(System.Collections.Generic.List*1System*Byte)|(System.Byte[]), duration:System.Single):Barotrauma.ReadyCheck
---@param clients (System.Collections.Generic.List*1System*Byte)|(System.Byte[])
---@return Barotrauma.ReadyCheck
_G['ReadyCheck'] = function(clients) end

---`Constructor Private Instance`
---@overload fun(clients:(System.Collections.Generic.List*1System*Byte)|(System.Byte[]), startTime:System.DateTime, endTime:System.DateTime):Barotrauma.ReadyCheck
---@overload fun(clients:(System.Collections.Generic.List*1System*Byte)|(System.Byte[]), duration:System.Single):Barotrauma.ReadyCheck
---@param clients (System.Collections.Generic.List*1System*Byte)|(System.Byte[])
---@return Barotrauma.ReadyCheck
_G['ReadyCheck'].__new = function(clients) end

