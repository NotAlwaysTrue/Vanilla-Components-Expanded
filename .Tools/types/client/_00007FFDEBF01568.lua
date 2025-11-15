---@meta
---@class Barotrauma.PerformanceCounter : System.Object
---`Field Private Instance`
---@field mutex System.Object
---`Field Private Instance`
---@field sampleBuffer (System.Collections.Generic.Queue*1System*Double)|(fun():(System.Double))
---`Field Private Instance`
---@field averageFramesPerSecondBuffer (System.Collections.Generic.Queue*1System*Double)|(fun():(System.Double))
---`Field Private Instance`
---@field timer System.Diagnostics.Stopwatch
---`Field Private Instance`
---@field lastSecondMark System.Int64
---`Field Private Instance`
---@field lastMinuteMark System.Int64
---`Field Private Instance`
---@field elapsedTicks (System.Collections.Generic.Dictionary*1System*String*1System*Collections*Generic*Queue*2System*Int64)|({[System.String]:((System.Collections.Generic.Queue*1System*Int64)|(fun():(System.Int64)))})
---`Field Private Instance`
---@field avgTicksPerFrame (System.Collections.Generic.Dictionary*1System*String*1System*Int64)|({[System.String]:(System.Int64)})
---`Field NonPublic Instance`
---@field UpdateTimeGraph Barotrauma.Graph
---`Field NonPublic Instance`
---@field DrawTimeGraph Barotrauma.Graph
---`Field Private Instance`
---@field tempSavedIdentifiers (System.Collections.Generic.List*1System*String)|(System.String[])
---`Field Public Static`
---@field MaximumSamples System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AverageFramesPerSecond System.Double
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrentFramesPerSecond System.Double
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AverageFramesPerSecondInPastMinute System.Double
---`Getter Public Instance`
---@field GetSavedIdentifiers (System.Collections.Generic.IReadOnlyList*1System*String)|(System.String[])
_G['PerformanceCounter'] = {}

---`Method Public Instance`
---@param identifier System.String
---@param ticks System.Int64
_G['PerformanceCounter'].AddElapsedTicks = function(identifier, ticks) end

---`Method Public Instance`
---@param identifier System.String
---@return System.Single
_G['PerformanceCounter'].GetAverageElapsedMillisecs = function(identifier) end

---`Method Public Instance`
---@param deltaTime System.Double
---@return System.Boolean
_G['PerformanceCounter'].Update = function(deltaTime) end

---`Constructor Public Instance`
---@return Barotrauma.PerformanceCounter
_G['PerformanceCounter'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.PerformanceCounter
_G['PerformanceCounter'].__new = function() end

