---@meta
---@class Barotrauma.Sounds.PeakFilter : Barotrauma.Sounds.BiQuad
_G['Sounds']['PeakFilter'] = {}

---`Method NonPublic Instance Virtual`
_G['Sounds']['PeakFilter'].CalculateBiQuadCoefficients = function() end

---`Constructor Public Instance`
---@param sampleRate System.Int32
---@param frequency System.Double
---@param bandWidth System.Double
---@param peakGainDB System.Double
---@return Barotrauma.Sounds.PeakFilter
_G['Sounds']['PeakFilter'] = function(sampleRate, frequency, bandWidth, peakGainDB) end

---`Constructor Public Instance`
---@param sampleRate System.Int32
---@param frequency System.Double
---@param bandWidth System.Double
---@param peakGainDB System.Double
---@return Barotrauma.Sounds.PeakFilter
_G['Sounds']['PeakFilter'].__new = function(sampleRate, frequency, bandWidth, peakGainDB) end

