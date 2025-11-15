---@meta
---@class Barotrauma.Sounds.VideoSound : Barotrauma.Sounds.Sound
---`Field Private Instance`
---@field mutex System.Object
---`Field Private Instance`
---@field sampleQueue (System.Collections.Generic.Queue*1System*Int16-arr)|(fun():((System.Int16-arr)|(System.Int16[])))
---`Field Private Instance`
---@field soundChannel Barotrauma.Sounds.SoundChannel
---`Field Private Instance`
---@field video Barotrauma.Media.Video
---`Getter Public Instance Virtual`
---@field DurationSeconds System.Nullable*1System*Double
_G['VideoSound'] = {}

---`Method Public Instance Virtual`
---@param playbackPos System.Int32
---@return System.Single
_G['VideoSound'].GetAmplitudeAtPlaybackPos = function(playbackPos) end

---`Method Public Instance Virtual`
---@return System.Boolean
_G['VideoSound'].IsPlaying = function() end

---`Method Public Instance`
---@param buf (System.Int16-arr)|(System.Int16[])
_G['VideoSound'].Enqueue = function(buf) end

---`Method Public Instance Virtual`
---@overload fun(gain:System.Single, range:System.Single, position:Microsoft.Xna.Framework.Vector2, muffle?:System.Boolean):(Barotrauma.Sounds.SoundChannel)
---@overload fun(position:System.Nullable*1Microsoft*Xna*Framework*Vector3, gain:System.Single, freqMult?:System.Single, muffle?:System.Boolean):(Barotrauma.Sounds.SoundChannel)
---@overload fun(gain:System.Single):(Barotrauma.Sounds.SoundChannel)
---@return Barotrauma.Sounds.SoundChannel
_G['VideoSound'].Play = function() end

---`Method Public Instance Virtual`
---@param samplePos System.Int32
---@param buffer (System.Int16-arr)|(System.Int16[])
---@return System.Int32
_G['VideoSound'].FillStreamBuffer = function(samplePos, buffer) end

---`Method Public Instance Virtual`
_G['VideoSound'].Dispose = function() end

---`Constructor Public Instance`
---@param owner Barotrauma.Sounds.SoundManager
---@param filename System.String
---@param sampleRate System.Int32
---@param channelCount System.Int32
---@param vid Barotrauma.Media.Video
---@return Barotrauma.Sounds.VideoSound
_G['VideoSound'] = function(owner, filename, sampleRate, channelCount, vid) end

---`Constructor Public Instance`
---@param owner Barotrauma.Sounds.SoundManager
---@param filename System.String
---@param sampleRate System.Int32
---@param channelCount System.Int32
---@param vid Barotrauma.Media.Video
---@return Barotrauma.Sounds.VideoSound
_G['VideoSound'].__new = function(owner, filename, sampleRate, channelCount, vid) end

