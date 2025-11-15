---@meta
---@class Barotrauma.LuaCsLogger : System.Object
---`Field Public Static`
---@field HideUserNames System.Boolean
---`Field Private Static`
---@field lockLog System.Boolean
---`Field Public Static`
---@field MessageLogger (Barotrauma.LuaCsMessageLogger)|(fun(message:System.String))
---`Field Public Static`
---@field ExceptionHandler (Barotrauma.LuaCsExceptionHandler)|(fun(ex:System.Exception, origin:Barotrauma.LuaCsMessageOrigin))
---`Field Private Static`
---@field LogPrefix System.String
---`Field Private Static`
---@field NetMaxLength System.Int32
---`Field Private Static`
---@field NetMaxMessages System.Int32
_G['Logger'] = {}

---`Method Public Static`
---@param ex System.Exception
---@param origin Barotrauma.LuaCsMessageOrigin
_G['Logger'].HandleException = function(ex, origin) end

---`Method Public Static`
---@overload fun(message:System.String, origin:Barotrauma.LuaCsMessageOrigin)
---@param message System.String
_G['Logger'].LogError = function(message) end

---`Method Public Static`
---@param message System.String
---@param serverColor? System.Nullable*1Microsoft*Xna*Framework*Color
---@param clientColor? System.Nullable*1Microsoft*Xna*Framework*Color
_G['Logger'].LogMessage = function(message, serverColor, clientColor) end

---`Method Public Static`
---@param message System.String
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
---@param messageType? Barotrauma.Networking.ServerLog.MessageType
_G['Logger'].Log = function(message, color, messageType) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.LuaCsLogger
---@return Barotrauma.LuaCsLogger
_G['Logger'] = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.LuaCsLogger
---@return Barotrauma.LuaCsLogger
_G['Logger'].__new = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.LuaCsLogger
---@return Barotrauma.LuaCsLogger
_G['Logger'] = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.LuaCsLogger
---@return Barotrauma.LuaCsLogger
_G['Logger'].__new = function() end

