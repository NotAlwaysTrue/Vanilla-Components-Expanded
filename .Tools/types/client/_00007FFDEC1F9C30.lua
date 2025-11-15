---@meta
---@class Barotrauma.Networking.RespawnManager : Barotrauma.Entity
---`Field Private Instance`
---@field lastShuttleLeavingWarningTime System.DateTime
---`Field Private Instance`
---@field networkMember Barotrauma.Networking.NetworkMember
---`Field Private Instance`
---@field shuttleSteering (System.Collections.Generic.Dictionary*1Barotrauma*CharacterTeamType*1System*Collections*Generic*List*2Barotrauma*Items*Components*Steering)|({[Barotrauma.CharacterTeamType]:((System.Collections.Generic.List*1Barotrauma*Items*Components*Steering)|(Barotrauma.Items.Components.Steering[]))})
---`Field Private Instance`
---@field shuttleDoors (System.Collections.Generic.Dictionary*1Barotrauma*CharacterTeamType*1System*Collections*Generic*List*2Barotrauma*Items*Components*Door)|({[Barotrauma.CharacterTeamType]:((System.Collections.Generic.List*1Barotrauma*Items*Components*Door)|(Barotrauma.Items.Components.Door[]))})
---`Field Private Instance`
---@field respawnContainers (System.Collections.Generic.Dictionary*1Barotrauma*CharacterTeamType*1System*Collections*Generic*List*2Barotrauma*Items*Components*ItemContainer)|({[Barotrauma.CharacterTeamType]:((System.Collections.Generic.List*1Barotrauma*Items*Components*ItemContainer)|(Barotrauma.Items.Components.ItemContainer[]))})
---`Field Private Instance`
---@field teamSpecificStates (System.Collections.Generic.Dictionary*1Barotrauma*CharacterTeamType*1Barotrauma*Networking*RespawnManager*TeamSpecificState)|({[Barotrauma.CharacterTeamType]:(Barotrauma.Networking.RespawnManager.TeamSpecificState)})
---`Field Private Instance`
---@field maxTransportTime System.Single
---`Field Private Instance`
---@field updateReturnTimer System.Single
---`Field Private Instance`
---@field respawnShuttles (System.Collections.Generic.Dictionary*1Barotrauma*CharacterTeamType*1Barotrauma*Submarine)|({[Barotrauma.CharacterTeamType]:(Barotrauma.Submarine)})
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PendingRespawnCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RequiredRespawnCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ForceSpawnInMainSub System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ReturnTime System.DateTime
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RespawnTime System.DateTime
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field CurrentState Barotrauma.Networking.RespawnManager.State
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field ReturnCountdownStarted System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RespawnCountdownStarted System.Boolean
---`Getter Public Static`
---@field SkillLossPercentageOnDeath System.Single
---`Getter Public Static`
---@field SkillLossPercentageOnImmediateRespawn System.Single
---`Getter Public Static`
---@field UseDeathPrompt System.Boolean
---`Getter Public Instance`
---@field UsingShuttle System.Boolean
---`Getter Public Instance`
---@field RespawnShuttles (System.Collections.Generic.IEnumerable*1Barotrauma*Submarine)|(fun():(Barotrauma.Submarine))
_G['RespawnManager'] = {}

---`Method Public Static`
---@param delay? System.Single
_G['RespawnManager'].ShowDeathPromptIfNeeded = function(delay) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['RespawnManager'].ClientEventRead = function(msg, sendingTime) end

---`Method Public Instance`
---@param team Barotrauma.CharacterTeamType
---@return System.Boolean
_G['RespawnManager'].CanRespawnAgain = function(team) end

---`Method Private Instance`
---@param sender FarseerPhysics.Dynamics.Fixture
---@param other FarseerPhysics.Dynamics.Fixture
---@param contact FarseerPhysics.Dynamics.Contacts.Contact
---@return System.Boolean
_G['RespawnManager'].OnShuttleCollision = function(sender, other, contact) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['RespawnManager'].Update = function(deltaTime) end

---`Method Private Instance`
---@param teamSpecificState Barotrauma.Networking.RespawnManager.TeamSpecificState
---@param deltaTime System.Single
_G['RespawnManager'].UpdateTransporting = function(teamSpecificState, deltaTime) end

---`Method Private Instance`
---@param teamSpecificState Barotrauma.Networking.RespawnManager.TeamSpecificState
---@param deltaTime System.Single
_G['RespawnManager'].UpdateTransportingProjSpecific = function(teamSpecificState, deltaTime) end

---`Method Public Instance`
_G['RespawnManager'].ForceRespawn = function() end

---`Method Private Instance`
---@param teamSpecificState Barotrauma.Networking.RespawnManager.TeamSpecificState
---@param deltaTime System.Single
_G['RespawnManager'].UpdateReturning = function(teamSpecificState, deltaTime) end

---`Method Public Instance`
---@param team Barotrauma.CharacterTeamType
---@return Barotrauma.Submarine
_G['RespawnManager'].GetShuttle = function(team) end

---`Method Public Instance`
---@param team Barotrauma.CharacterTeamType
---@return Barotrauma.Networking.RespawnManager.TeamSpecificState
_G['RespawnManager'].GetTeamSpecificState = function(team) end

---`Method Private Instance`
---@param team Barotrauma.CharacterTeamType
---@param bodyType FarseerPhysics.BodyType
_G['RespawnManager'].SetShuttleBodyType = function(team, bodyType) end

---`Method Private Instance`
---@param teamSpecificState Barotrauma.Networking.RespawnManager.TeamSpecificState
_G['RespawnManager'].ResetShuttle = function(teamSpecificState) end

---`Method Public Static`
---@param characterInfo Barotrauma.CharacterInfo
---@param skill Barotrauma.Skill
---@param skillLossPercentage System.Single
---@param currentSkillLevel? System.Nullable*1System*Single
---@return System.Single
_G['RespawnManager'].GetReducedSkill = function(characterInfo, skill, skillLossPercentage, currentSkillLevel) end

---`Method Public Instance`
---@param shuttlePos System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['RespawnManager'].RespawnCharacters = function(shuttlePos) end

---`Method Public Static`
---@return Barotrauma.AfflictionPrefab
_G['RespawnManager'].GetRespawnPenaltyAfflictionPrefab = function() end

---`Method Public Static`
---@return Barotrauma.Affliction
_G['RespawnManager'].GetRespawnPenaltyAffliction = function() end

---`Method Public Static`
---@param character Barotrauma.Character
_G['RespawnManager'].GiveRespawnPenaltyAffliction = function(character) end

---`Method Public Instance`
---@param respawnShuttle Barotrauma.Submarine
---@param mainSub Barotrauma.Submarine
---@return Microsoft.Xna.Framework.Vector2
_G['RespawnManager'].FindSpawnPos = function(respawnShuttle, mainSub) end

---`Method Private Instance`
---@param respawnShuttle Barotrauma.Submarine
---@param minWidth System.Single
---@param minHeight System.Single
---@param minDistFromSubs System.Single
---@param minDistFromCharacters System.Single
---@return (System.Collections.Generic.List*1Barotrauma*Level*InterestingPosition)|(Barotrauma.Level.InterestingPosition[])
_G['RespawnManager'].FindValidSpawnPoints = function(respawnShuttle, minWidth, minHeight, minDistFromSubs, minDistFromCharacters) end

---`Constructor Public Instance`
---@param networkMember Barotrauma.Networking.NetworkMember
---@param shuttleInfo Barotrauma.SubmarineInfo
---@return Barotrauma.Networking.RespawnManager
_G['RespawnManager'] = function(networkMember, shuttleInfo) end

---`Constructor Public Instance`
---@param networkMember Barotrauma.Networking.NetworkMember
---@param shuttleInfo Barotrauma.SubmarineInfo
---@return Barotrauma.Networking.RespawnManager
_G['RespawnManager'].__new = function(networkMember, shuttleInfo) end

