---@meta
---@class Barotrauma.Sounds.SoundChannel : System.Object
---`Field Private Instance`
---@field streamShortBuffer (System.Int16-arr)|(System.Int16[])
---`Field Private Instance`
---@field debugName System.String
---`Field Private Instance`
---@field position System.Nullable*1Microsoft*Xna*Framework*Vector3
---`Field Private Instance`
---@field near System.Single
---`Field Private Instance`
---@field far System.Single
---`Field Private Instance`
---@field gain System.Single
---`Field Private Instance`
---@field looping System.Boolean
---`Field Public Instance`
---@field frequencyMultiplier System.Single
---`Field Private Instance`
---@field decayTimer System.Int32
---`Field Private Instance`
---@field muffled System.Boolean
---`Field Private Instance`
---@field streamAmplitude System.Single
---`Field Private Instance`
---@field category Barotrauma.Identifier
---`Field Private Instance`
---@field streamSeekPos System.Int32
---`Field Private Instance`
---@field buffersToRequeue System.Int32
---`Field Private Instance`
---@field reachedEndSample System.Boolean
---`Field Private Instance`
---@field queueStartIndex System.Int32
---`Field Private Instance`
---@field streamBuffers (System.UInt32-arr)|(System.UInt32[])
---`Field Private Instance`
---@field unqueuedBuffers (System.UInt32-arr)|(System.UInt32[])
---`Field Private Instance`
---@field streamBufferAmplitudes (System.Single-arr)|(System.Single[])
---`Field Public Instance`
---@field MuteBackgroundMusic System.Boolean
---`Field Private Instance`
---@field mutex System.Object
---`Field Private Static`
---@field STREAM_BUFFER_SIZE System.Int32
---`Field Public Static`
---@field MinFrequencyMultiplier System.Single
---`Field Public Static`
---@field MaxFrequencyMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Position System.Nullable*1Microsoft*Xna*Framework*Vector3
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Near System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Far System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Gain System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Looping System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FrequencyMultiplier System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FilledByNetwork System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Muffled System.Boolean
---`Getter Public Instance`
---@field CurrentAmplitude System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Category Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Sound Barotrauma.Sounds.Sound
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ALSourceIndex System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field IsStream System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field StreamSeekPos System.Int32
---`Getter Public Instance`
---@field MaxStreamSeekPos System.Int64
---`Getter Public Instance`
---@field IsPlaying System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FadingOutAndDisposing System.Boolean
_G['SoundChannel'] = {}

---`Method Public Instance Virtual`
---@return System.String
_G['SoundChannel'].ToString = function() end

---`Method Public Instance`
_G['SoundChannel'].FadeOutAndDispose = function() end

---`Method Public Instance Virtual`
_G['SoundChannel'].Dispose = function() end

---`Method Public Instance`
_G['SoundChannel'].UpdateStream = function() end

---`Constructor Public Instance`
---@param sound Barotrauma.Sounds.Sound
---@param gain System.Single
---@param position System.Nullable*1Microsoft*Xna*Framework*Vector3
---@param freqMult System.Single
---@param near System.Single
---@param far System.Single
---@param category Barotrauma.Identifier
---@param muffle? System.Boolean
---@return Barotrauma.Sounds.SoundChannel
_G['SoundChannel'] = function(sound, gain, position, freqMult, near, far, category, muffle) end

---`Constructor Public Instance`
---@param sound Barotrauma.Sounds.Sound
---@param gain System.Single
---@param position System.Nullable*1Microsoft*Xna*Framework*Vector3
---@param freqMult System.Single
---@param near System.Single
---@param far System.Single
---@param category Barotrauma.Identifier
---@param muffle? System.Boolean
---@return Barotrauma.Sounds.SoundChannel
_G['SoundChannel'].__new = function(sound, gain, position, freqMult, near, far, category, muffle) end

