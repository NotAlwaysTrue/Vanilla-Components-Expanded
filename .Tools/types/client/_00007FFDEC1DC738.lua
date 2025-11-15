---@meta
---@class Barotrauma.Sounds.OggSound : Barotrauma.Sounds.Sound
---`Field Private Instance`
---@field streamReader NVorbis.VorbisReader
---`Field Private Instance`
---@field playbackAmplitude (System.Collections.Generic.List*1System*Single)|(System.Single[])
---`Field Private Instance`
---@field sampleBuffer (System.Int16-arr)|(System.Int16[])
---`Field Private Instance`
---@field muffleBuffer (System.Int16-arr)|(System.Int16[])
---`Field Private Instance`
---@field durationSeconds System.Double
---`Field Private Instance`
---@field streamFloatBuffer (System.Single-arr)|(System.Single[])
---`Field Private Static`
---@field AMPLITUDE_SAMPLE_COUNT System.Int32
---`Getter Public Instance`
---@field MaxStreamSamplePos System.Int64
---`Getter Public Instance Virtual`
---@field DurationSeconds System.Nullable*1System*Double
_G['OggSound'] = {}

---`Method Private Static`
---@param reader NVorbis.VorbisReader
---@return System.Threading.Tasks.Task*1Barotrauma*Sounds*OggSound*TaskResult
_G['OggSound'].LoadSamples = function(reader) end

---`Method Public Instance Virtual`
---@param playbackPos System.Int32
---@return System.Single
_G['OggSound'].GetAmplitudeAtPlaybackPos = function(playbackPos) end

---`Method Public Instance Virtual`
---@param samplePos System.Int32
---@param buffer (System.Int16-arr)|(System.Int16[])
---@return System.Int32
_G['OggSound'].FillStreamBuffer = function(samplePos, buffer) end

---`Method Private Static`
---@param buffer (System.Single-arr)|(System.Single[])
---@param sampleRate System.Int32
_G['OggSound'].MuffleBuffer = function(buffer, sampleRate) end

---`Method Public Instance Virtual`
_G['OggSound'].InitializeAlBuffers = function() end

---`Method Public Instance Virtual`
_G['OggSound'].FillAlBuffers = function() end

---`Method Public Instance Virtual`
_G['OggSound'].Dispose = function() end

---`Constructor Public Instance`
---@param owner Barotrauma.Sounds.SoundManager
---@param filename System.String
---@param stream System.Boolean
---@param xElement Barotrauma.ContentXElement
---@return Barotrauma.Sounds.OggSound
_G['OggSound'] = function(owner, filename, stream, xElement) end

---`Constructor Public Instance`
---@param owner Barotrauma.Sounds.SoundManager
---@param filename System.String
---@param stream System.Boolean
---@param xElement Barotrauma.ContentXElement
---@return Barotrauma.Sounds.OggSound
_G['OggSound'].__new = function(owner, filename, stream, xElement) end

