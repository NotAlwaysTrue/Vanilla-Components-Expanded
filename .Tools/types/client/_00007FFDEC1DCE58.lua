---@meta
---@class Barotrauma.Sounds.VoipSound : Barotrauma.Sounds.Sound
---`Field Private Instance`
---@field queue Barotrauma.Networking.VoipQueue
---`Field Private Instance`
---@field bufferID System.Int32
---`Field Private Instance`
---@field soundChannel Barotrauma.Sounds.SoundChannel
---`Field Private Instance`
---@field decoder Concentus.Structs.OpusDecoder
---`Field Public Instance`
---@field UseRadioFilter System.Boolean
---`Field Public Instance`
---@field UseMuffleFilter System.Boolean
---`Field Public Instance`
---@field UsingRadio System.Boolean
---`Field Private Instance`
---@field muffleFilters (Barotrauma.Sounds.BiQuad-arr)|(Barotrauma.Sounds.BiQuad[])
---`Field Private Instance`
---@field radioFilters (Barotrauma.Sounds.BiQuad-arr)|(Barotrauma.Sounds.BiQuad[])
---`Field Private Instance`
---@field gain System.Single
---`Field Private Instance`
---@field client Barotrauma.Networking.Client
---`Field Private Static`
---@field PostRadioFilterBoost System.Single
---`Getter Public Instance Virtual`
---@field DurationSeconds System.Nullable*1System*Double
---`Getter Public Instance Virtual`
---@field SourcePoolIndex Barotrauma.Sounds.SoundManager.SourcePoolIndex
---`Getter Public Instance`
---@field IsPlaying System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Near System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Far System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Gain System.Single
---`Getter Public Instance`
---@field CurrentAmplitude System.Single
_G['VoipSound'] = {}

---`Method Public Instance Virtual`
---@param playbackPos System.Int32
---@return System.Single
_G['VoipSound'].GetAmplitudeAtPlaybackPos = function(playbackPos) end

---`Method Public Instance`
---@param pos System.Nullable*1Microsoft*Xna*Framework*Vector3
_G['VoipSound'].SetPosition = function(pos) end

---`Method Public Instance`
---@param near System.Single
---@param far System.Single
_G['VoipSound'].SetRange = function(near, far) end

---`Method Public Instance`
---@param buffer (System.Int16-arr)|(System.Int16[])
---@param readSamples System.Int32
_G['VoipSound'].ApplyFilters = function(buffer, readSamples) end

---`Method Public Instance Virtual`
---@overload fun(gain:System.Single, range:System.Single, position:Microsoft.Xna.Framework.Vector2, muffle?:System.Boolean):(Barotrauma.Sounds.SoundChannel)
---@overload fun(position:System.Nullable*1Microsoft*Xna*Framework*Vector3, gain:System.Single, freqMult?:System.Single, muffle?:System.Boolean):(Barotrauma.Sounds.SoundChannel)
---@overload fun(gain:System.Single):(Barotrauma.Sounds.SoundChannel)
---@return Barotrauma.Sounds.SoundChannel
_G['VoipSound'].Play = function() end

---`Method Public Instance Virtual`
---@param samplePos System.Int32
---@param buffer (System.Int16-arr)|(System.Int16[])
---@return System.Int32
_G['VoipSound'].FillStreamBuffer = function(samplePos, buffer) end

---`Method Public Instance Virtual`
_G['VoipSound'].Dispose = function() end

---`Constructor Public Instance`
---@param targetClient Barotrauma.Networking.Client
---@param owner Barotrauma.Sounds.SoundManager
---@param q Barotrauma.Networking.VoipQueue
---@return Barotrauma.Sounds.VoipSound
_G['VoipSound'] = function(targetClient, owner, q) end

---`Constructor Public Instance`
---@param targetClient Barotrauma.Networking.Client
---@param owner Barotrauma.Sounds.SoundManager
---@param q Barotrauma.Networking.VoipQueue
---@return Barotrauma.Sounds.VoipSound
_G['VoipSound'].__new = function(targetClient, owner, q) end

