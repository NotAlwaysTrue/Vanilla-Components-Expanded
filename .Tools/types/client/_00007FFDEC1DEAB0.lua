---@meta
---@class Barotrauma.SoundPlayer : System.Object
---`Field Private Static`
---@field currentMusic (Barotrauma.BackgroundMusic-arr)|(Barotrauma.BackgroundMusic[])
---`Field Private Static`
---@field musicChannel (Barotrauma.Sounds.SoundChannel-arr)|(Barotrauma.Sounds.SoundChannel[])
---`Field Private Static`
---@field targetMusic (Barotrauma.BackgroundMusic-arr)|(Barotrauma.BackgroundMusic[])
---`Field Private Static`
---@field previousDefaultMusic Barotrauma.BackgroundMusic
---`Field Private Static`
---@field updateMusicTimer System.Single
---`Field Private Static`
---@field waterAmbienceChannels (System.Collections.Generic.HashSet*1Barotrauma*Sounds*SoundChannel)|(Barotrauma.Sounds.SoundChannel[])
---`Field Private Static`
---@field ambientSoundTimer System.Single
---`Field Private Static`
---@field ambientSoundInterval Microsoft.Xna.Framework.Vector2
---`Field Private Static`
---@field hullSoundChannel Barotrauma.Sounds.SoundChannel
---`Field Private Static`
---@field hullSoundSource Barotrauma.Hull
---`Field Private Static`
---@field hullSoundTimer System.Single
---`Field Private Static`
---@field hullSoundInterval Microsoft.Xna.Framework.Vector2
---`Field Private Static`
---@field targetFlowLeft (System.Single-arr)|(System.Single[])
---`Field Private Static`
---@field targetFlowRight (System.Single-arr)|(System.Single[])
---`Field Private Static`
---@field flowSoundChannels (Barotrauma.Sounds.SoundChannel-arr)|(Barotrauma.Sounds.SoundChannel[])
---`Field Private Static`
---@field flowVolumeLeft (System.Single-arr)|(System.Single[])
---`Field Private Static`
---@field flowVolumeRight (System.Single-arr)|(System.Single[])
---`Field Private Static`
---@field fireSoundChannels (Barotrauma.Sounds.SoundChannel-arr)|(Barotrauma.Sounds.SoundChannel[])
---`Field Private Static`
---@field fireVolumeLeft (System.Single-arr)|(System.Single[])
---`Field Private Static`
---@field fireVolumeRight (System.Single-arr)|(System.Single[])
---`Field Private Static`
---@field fireSoundTags (System.String-arr)|(System.String[])
---`Field Private Static`
---@field firstTimeInMainMenu System.Boolean
---`Field Public Static`
---@field OverrideMusicDuration System.Nullable*1System*Single
---`Field Private Static`
---@field lastMusicLogTime System.Double
---`Field Private Static`
---@field MusicLerpSpeed System.Single
---`Field Private Static`
---@field UpdateMusicInterval System.Single
---`Field Public Static`
---@field MuffleFilterFrequency System.Single
---`Field Private Static`
---@field MaxMusicChannels System.Int32
---`Field Private Static`
---@field FlowSoundRange System.Single
---`Field Private Static`
---@field MaxFlowStrength System.Single
---`Field Private Static`
---@field FireSoundRange System.Single
---`Field Private Static`
---@field FireSoundMediumLimit System.Single
---`Field Private Static`
---@field FireSoundLargeLimit System.Single
---`Field Private Static`
---@field fireSizes System.Int32
---`Field Private Static`
---@field MusicLogInterval System.Double
---`Getter Private Static`
---@field musicClips (System.Collections.Generic.IEnumerable*1Barotrauma*BackgroundMusic)|(fun():(Barotrauma.BackgroundMusic))
---`Getter Private Static`
---@field waterAmbienceIn Barotrauma.SoundPrefab
---`Getter Private Static`
---@field waterAmbienceOut Barotrauma.SoundPrefab
---`Getter Private Static`
---@field waterAmbienceMoving Barotrauma.SoundPrefab
---`Getter Public Static`
---@field FlowSounds (System.Collections.Generic.IReadOnlyList*1Barotrauma*SoundPrefab)|(Barotrauma.SoundPrefab[])
---`Getter Public Static`
---@field SplashSounds (System.Collections.Generic.IReadOnlyList*1Barotrauma*SoundPrefab)|(Barotrauma.SoundPrefab[])
---`Getter Private Static`
---@field damageSounds (System.Collections.Generic.IEnumerable*1Barotrauma*DamageSound)|(fun():(Barotrauma.DamageSound))
---`Getter Private Static`
---@field startUpSound Barotrauma.Sounds.Sound
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field OverrideMusicType Barotrauma.Identifier
_G['SoundPlayer'] = {}

---`Method Public Static`
---@param deltaTime System.Single
_G['SoundPlayer'].Update = function(deltaTime) end

---`Method Private Static`
---@param ambienceVolume System.Single
---@param deltaTime System.Single
_G['SoundPlayer'].UpdateWaterAmbience = function(ambienceVolume, deltaTime) end

---`Method Private Static`
---@param deltaTime System.Single
_G['SoundPlayer'].UpdateWaterFlowSounds = function(deltaTime) end

---`Method Private Static`
---@param deltaTime System.Single
_G['SoundPlayer'].UpdateFireSounds = function(deltaTime) end

---`Method Private Static`
---@param deltaTime System.Single
_G['SoundPlayer'].UpdateRandomAmbience = function(deltaTime) end

---`Method Private Static`
---@param deltaTime System.Single
_G['SoundPlayer'].UpdateHullSounds = function(deltaTime) end

---`Method Public Static`
---@param soundTag System.String
---@return Barotrauma.Sounds.Sound
_G['SoundPlayer'].GetSound = function(soundTag) end

---`Method Public Static`
---@overload fun(soundTag:System.String, volume?:System.Single):(Barotrauma.Sounds.SoundChannel)
---@overload fun(soundTag:System.String, position:Microsoft.Xna.Framework.Vector2, volume?:System.Nullable*1System*Single, range?:System.Nullable*1System*Single, hullGuess?:Barotrauma.Hull):(Barotrauma.Sounds.SoundChannel)
---@overload fun(sound:Barotrauma.RoundSound, position:Microsoft.Xna.Framework.Vector2, volume?:System.Nullable*1System*Single, hullGuess?:Barotrauma.Hull):(Barotrauma.Sounds.SoundChannel)
---@param sound Barotrauma.Sounds.Sound
---@param position Microsoft.Xna.Framework.Vector2
---@param volume? System.Nullable*1System*Single
---@param range? System.Nullable*1System*Single
---@param freqMult? System.Nullable*1System*Single
---@param hullGuess? Barotrauma.Hull
---@param ignoreMuffling? System.Boolean
---@param muteBackgroundMusic? System.Boolean
---@return Barotrauma.Sounds.SoundChannel
_G['SoundPlayer'].PlaySound = function(sound, position, volume, range, freqMult, hullGuess, ignoreMuffling, muteBackgroundMusic) end

---`Method Public Static`
_G['SoundPlayer'].DisposeDisabledMusic = function() end

---`Method Public Static`
_G['SoundPlayer'].ForceMusicUpdate = function() end

---`Method Private Static`
---@param deltaTime System.Single
_G['SoundPlayer'].UpdateMusic = function(deltaTime) end

---`Method Private Static`
_G['SoundPlayer'].LogCurrentMusic = function() end

---`Method Private Static`
---@param index System.Int32
_G['SoundPlayer'].DisposeMusicChannel = function(index) end

---`Method Private Static`
---@param musicType Barotrauma.Identifier
---@param currentIntensity System.Single
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*BackgroundMusic)|(fun():(Barotrauma.BackgroundMusic))
_G['SoundPlayer'].GetSuitableMusicClips = function(musicType, currentIntensity) end

---`Method Private Static`
---@param music Barotrauma.BackgroundMusic
---@param musicType Barotrauma.Identifier
---@param currentIntensity System.Single
---@return System.Boolean
_G['SoundPlayer'].IsSuitableMusicClip = function(music, musicType, currentIntensity) end

---`Method Private Static`
---@return Barotrauma.Identifier
_G['SoundPlayer'].GetCurrentMusicType = function() end

---`Method Public Static`
---@param listener Barotrauma.Character
---@param soundWorldPos Microsoft.Xna.Framework.Vector2
---@param range System.Single
---@param hullGuess Barotrauma.Hull
---@return System.Boolean
_G['SoundPlayer'].ShouldMuffleSound = function(listener, soundWorldPos, range, hullGuess) end

---`Method Public Static`
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param strength System.Single
_G['SoundPlayer'].PlaySplashSound = function(worldPosition, strength) end

---`Method Public Static`
---@overload fun(damageType:System.String, damage:System.Single, body:Barotrauma.PhysicsBody)
---@param damageType System.String
---@param damage System.Single
---@param position Microsoft.Xna.Framework.Vector2
---@param range? System.Single
---@param tags? (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---@param gain? System.Single
_G['SoundPlayer'].PlayDamageSound = function(damageType, damage, position, range, tags, gain) end

---`Method Public Static`
---@overload fun(soundType:Barotrauma.GUISoundType)
---@param soundType System.Nullable*1Barotrauma*GUISoundType
_G['SoundPlayer'].PlayUISound = function(soundType) end

---`Constructor Private Static`
---@return Barotrauma.SoundPlayer
_G['SoundPlayer'] = function() end

---`Constructor Private Static`
---@return Barotrauma.SoundPlayer
_G['SoundPlayer'].__new = function() end

