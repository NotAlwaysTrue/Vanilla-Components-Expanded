---@meta
---@class Barotrauma.Networking.RespawnManager : Barotrauma.Entity
---`Field Private Instance`
---@field shuttleEmptyTimer System.Single
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
---@field IsShuttleInsideLevel System.Boolean
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

---`Method Private Instance`
---@param teamId Barotrauma.CharacterTeamType
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Networking*Client)|(fun():(Barotrauma.Networking.Client))
_G['RespawnManager'].GetClientsToRespawn = function(teamId) end

---`Method Private Static`
---@param c Barotrauma.Networking.Client
---@return System.Boolean
_G['RespawnManager'].IsRespawnDecisionPendingForClient = function(c) end

---`Method Private Static`
---@param c Barotrauma.Networking.Client
---@return System.Boolean
_G['RespawnManager'].ClientHasChosenNewBotViaShuttle = function(c) end

---`Method Private Static`
---@param teamId Barotrauma.CharacterTeamType
---@return (System.Collections.Generic.List*1Barotrauma*CharacterInfo)|(Barotrauma.CharacterInfo[])
_G['RespawnManager'].GetBotsToRespawn = function(teamId) end

---`Method Private Instance`
---@param team Barotrauma.CharacterTeamType
---@return System.String
_G['RespawnManager'].GetRespawnShuttleText = function(team) end

---`Method Private Instance`
---@param team Barotrauma.CharacterTeamType
---@return System.String
_G['RespawnManager'].GetTeamNameText = function(team) end

---`Method Private Instance`
---@overload fun(teamSpecificState:Barotrauma.Networking.RespawnManager.TeamSpecificState):(System.Boolean)
---@param characterToRespawnCount System.Int32
---@return System.Boolean
_G['RespawnManager'].ShouldStartRespawnCountdown = function(characterToRespawnCount) end

---`Method Private Static`
---@return System.Int32
_G['RespawnManager'].GetMinCharactersToRespawn = function() end

---`Method Public Instance`
---@param teamSpecificState Barotrauma.Networking.RespawnManager.TeamSpecificState
_G['RespawnManager'].DispatchShuttle = function(teamSpecificState) end

---`Method Private Instance`
---@param deltaTime System.Single
---@return System.Boolean
_G['RespawnManager'].CheckShuttleEmpty = function(deltaTime) end

---`Method Private Instance`
---@param teamSpecificState Barotrauma.Networking.RespawnManager.TeamSpecificState
_G['RespawnManager'].RespawnCharacters = function(teamSpecificState) end

---`Method Public Instance`
---@param shuttlePos System.Nullable*1Microsoft*Xna*Framework*Vector2
_G['RespawnManager'].RespawnCharacters = function(shuttlePos) end

---`Method Public Static`
---@param characterInfo Barotrauma.CharacterInfo
---@param applyExtraSkillLoss? System.Boolean
_G['RespawnManager'].ReduceCharacterSkillsOnDeath = function(characterInfo, applyExtraSkillLoss) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['RespawnManager'].ServerEventWrite = function(msg, c, extraData) end

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
_G['RespawnManager'].UpdateWaiting = function(teamSpecificState) end

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

---`Method Private Instance`
---@param teamSpecificState Barotrauma.Networking.RespawnManager.TeamSpecificState
---@param deltaTime System.Single
_G['RespawnManager'].UpdateReturningProjSpecific = function(teamSpecificState, deltaTime) end

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

