---@meta
---@class Barotrauma.LuaCsPerformanceCounter : System.Object
---`Field Public Instance`
---@field EnablePerformanceCounter System.Boolean
---`Field Public Instance`
---@field UpdateElapsedTime System.Double
---`Field Public Instance`
---@field HookElapsedTime (System.Collections.Generic.Dictionary*1System*String*1System*Collections*Generic*Dictionary*2System*String*2System*Double)|({[System.String]:((System.Collections.Generic.Dictionary*1System*String*1System*Double)|({[System.String]:(System.Double)}))})
---`Getter Public Static`
---@field MemoryUsage System.Single
_G['PerformanceCounter'] = {}

---`Method Public Instance`
---@param eventName System.String
---@param hookName System.String
---@param ticks System.Int64
_G['PerformanceCounter'].SetHookElapsedTicks = function(eventName, hookName, ticks) end

---`Constructor Public Instance`
---@return Barotrauma.LuaCsPerformanceCounter
_G['PerformanceCounter'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.LuaCsPerformanceCounter
_G['PerformanceCounter'].__new = function() end

