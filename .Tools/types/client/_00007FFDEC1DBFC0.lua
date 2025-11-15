---@meta
---@class Barotrauma.Sounds.SoundManager : System.Object
---`Field Private Instance`
---@field alcDevice System.IntPtr
---`Field Private Instance`
---@field alcContext System.IntPtr
---`Field Private Instance`
---@field sourcePools (Barotrauma.Sounds.SoundSourcePool-arr)|(Barotrauma.Sounds.SoundSourcePool[])
---`Field Private Instance`
---@field loadedSounds (System.Collections.Generic.List*1Barotrauma*Sounds*Sound)|(Barotrauma.Sounds.Sound[])
---`Field Private Instance`
---@field playingChannels (Barotrauma.Sounds.SoundChannel-arr-arr)|((Barotrauma.Sounds.SoundChannel-arr)|(Barotrauma.Sounds.SoundChannel[])[])
---`Field Private Instance`
---@field threadDeathMutex System.Object
---`Field Private Instance`
---@field updateChannelsThread System.Threading.Thread
---`Field Private Instance`
---@field listenerPosition Microsoft.Xna.Framework.Vector3
---`Field Private Instance`
---@field listenerOrientation (System.Single-arr)|(System.Single[])
---`Field Private Instance`
---@field listenerGain System.Single
---`Field Private Instance`
---@field voipAttenuatedGain System.Single
---`Field Private Instance`
---@field lastAttenuationTime System.Double
---`Field Private Instance`
---@field categoryModifiers (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*Sounds*SoundManager*CategoryModifier)|({[Barotrauma.Identifier]:(Barotrauma.Sounds.SoundManager.CategoryModifier)})
---`Field Private Instance`
---@field needsUpdateChannels System.Boolean
---`Field Private Instance`
---@field updateChannelsMre System.Threading.ManualResetEvent
---`Field Public Static`
---@field SoundCategoryDefault Barotrauma.Identifier
---`Field Public Static`
---@field SoundCategoryUi Barotrauma.Identifier
---`Field Public Static`
---@field SoundCategoryWaterAmbience Barotrauma.Identifier
---`Field Public Static`
---@field SoundCategoryMusic Barotrauma.Identifier
---`Field Public Static`
---@field SoundCategoryVoip Barotrauma.Identifier
---`Field Public Static`
---@field SourceCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Disabled System.Boolean
---`Getter Public Instance`
---@field LoadedSounds (System.Collections.Generic.IReadOnlyList*1Barotrauma*Sounds*Sound)|(Barotrauma.Sounds.Sound[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CanDetectDisconnect System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Disconnected System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ListenerPosition Microsoft.Xna.Framework.Vector3
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ListenerTargetVector Microsoft.Xna.Framework.Vector3
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ListenerUpVector Microsoft.Xna.Framework.Vector3
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ListenerGain System.Single
---`Getter Public Instance`
---@field PlaybackAmplitude System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CompressionDynamicRangeGain System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field VoipAttenuatedGain System.Single
---`Getter Public Instance`
---@field LoadedSoundCount System.Int32
---`Getter Public Instance`
---@field UniqueLoadedSoundCount System.Int32
_G['SoundManager'] = {}

---`Method Private Static`
---@param deviceName System.String
_G['SoundManager'].SetAudioOutputDevice = function(deviceName) end

---`Method Public Instance`
---@param deviceName System.String
---@return System.Boolean
_G['SoundManager'].InitializeAlcDevice = function(deviceName) end

---`Method Public Instance`
---@overload fun(filename:System.String, stream?:System.Boolean):(Barotrauma.Sounds.Sound)
---@param element Barotrauma.ContentXElement
---@param stream? System.Boolean
---@param overrideFilePath? System.String
---@return Barotrauma.Sounds.Sound
_G['SoundManager'].LoadSound = function(element, stream, overrideFilePath) end

---`Method Public Instance`
---@param poolIndex Barotrauma.Sounds.SoundManager.SourcePoolIndex
---@param ind System.Int32
---@return Barotrauma.Sounds.SoundChannel
_G['SoundManager'].GetSoundChannelFromIndex = function(poolIndex, ind) end

---`Method Public Instance`
---@param poolIndex Barotrauma.Sounds.SoundManager.SourcePoolIndex
---@param srcInd System.Int32
---@return System.UInt32
_G['SoundManager'].GetSourceFromIndex = function(poolIndex, srcInd) end

---`Method Public Instance`
---@param newChannel Barotrauma.Sounds.SoundChannel
---@return System.Int32
_G['SoundManager'].AssignFreeSourceToChannel = function(newChannel) end

---`Method Public Instance`
---@param ind System.Int32
_G['SoundManager'].DebugSource = function(ind) end

---`Method Public Instance`
---@param sound Barotrauma.Sounds.Sound
---@return System.Boolean
_G['SoundManager'].IsPlaying = function(sound) end

---`Method Public Instance`
---@param sound Barotrauma.Sounds.Sound
---@return System.Int32
_G['SoundManager'].CountPlayingInstances = function(sound) end

---`Method Public Instance`
---@param sound Barotrauma.Sounds.Sound
---@return Barotrauma.Sounds.SoundChannel
_G['SoundManager'].GetChannelFromSound = function(sound) end

---`Method Public Instance`
---@param sound Barotrauma.Sounds.Sound
_G['SoundManager'].KillChannels = function(sound) end

---`Method Public Instance`
---@param sound Barotrauma.Sounds.Sound
_G['SoundManager'].RemoveSound = function(sound) end

---`Method Public Instance`
---@param sound Barotrauma.Sounds.Sound
---@param pos System.Int32
_G['SoundManager'].MoveSoundToPosition = function(sound, pos) end

---`Method Public Instance`
---@param category Barotrauma.Identifier
---@param gain System.Single
---@param index? System.Int32
_G['SoundManager'].SetCategoryGainMultiplier = function(category, gain, index) end

---`Method Public Instance`
---@param category Barotrauma.Identifier
---@param index? System.Int32
---@return System.Single
_G['SoundManager'].GetCategoryGainMultiplier = function(category, index) end

---`Method Public Instance`
---@param category Barotrauma.Identifier
---@param muffle System.Boolean
_G['SoundManager'].SetCategoryMuffle = function(category, muffle) end

---`Method Public Instance`
---@param category Barotrauma.Identifier
---@return System.Boolean
_G['SoundManager'].GetCategoryMuffle = function(category) end

---`Method Public Instance`
_G['SoundManager'].Update = function() end

---`Method Public Instance`
_G['SoundManager'].ApplySettings = function() end

---`Method Public Instance`
_G['SoundManager'].InitUpdateChannelThread = function() end

---`Method Private Instance`
_G['SoundManager'].UpdateChannels = function() end

---`Method Public Instance`
_G['SoundManager'].ForceStreamUpdate = function() end

---`Method Private Instance`
_G['SoundManager'].ReloadSounds = function() end

---`Method Private Instance`
---@param keepSounds System.Boolean
_G['SoundManager'].ReleaseResources = function(keepSounds) end

---`Method Public Instance Virtual`
_G['SoundManager'].Dispose = function() end

---`Method Public Static`
_G['SoundManager'].TryRefreshDevice = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.Sounds.SoundManager
---@return Barotrauma.Sounds.SoundManager
_G['SoundManager'] = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.Sounds.SoundManager
---@return Barotrauma.Sounds.SoundManager
_G['SoundManager'].__new = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.Sounds.SoundManager
---@return Barotrauma.Sounds.SoundManager
_G['SoundManager'] = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.Sounds.SoundManager
---@return Barotrauma.Sounds.SoundManager
_G['SoundManager'].__new = function() end

