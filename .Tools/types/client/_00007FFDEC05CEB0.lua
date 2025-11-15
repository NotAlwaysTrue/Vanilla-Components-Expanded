---@meta
---@class Barotrauma.EventManager : System.Object
---`Field Private Instance`
---@field intensityGraph Barotrauma.Graph
---`Field Private Instance`
---@field targetIntensityGraph Barotrauma.Graph
---`Field Private Instance`
---@field monsterStrengthGraph Barotrauma.Graph
---`Field Private Instance`
---@field lastIntensityUpdate System.Single
---`Field Private Instance`
---@field pinnedPosition Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field isDragging System.Boolean
---`Field Private Instance`
---@field isGraphSelected System.Boolean
---`Field Private Instance`
---@field debugPositions (System.Collections.Generic.List*1Barotrauma*EventManager*DebugLine)|(Barotrauma.EventManager.DebugLine[])
---`Field Private Instance`
---@field level Barotrauma.Level
---`Field Private Instance`
---@field preloadedSprites (System.Collections.Generic.List*1Barotrauma*Sprite)|(Barotrauma.Sprite[])
---`Field Private Instance`
---@field currentIntensity System.Single
---`Field Private Instance`
---@field targetIntensity System.Single
---`Field Private Instance`
---@field musicIntensity System.Single
---`Field Private Instance`
---@field eventThreshold System.Single
---`Field Private Instance`
---@field eventCoolDown System.Single
---`Field Private Instance`
---@field intensityUpdateTimer System.Single
---`Field Private Instance`
---@field pathFinder Barotrauma.PathFinder
---`Field Private Instance`
---@field totalPathLength System.Single
---`Field Private Instance`
---@field calculateDistanceTraveledTimer System.Single
---`Field Private Instance`
---@field distanceTraveled System.Single
---`Field Private Instance`
---@field avgCrewHealth System.Single
---`Field Private Instance`
---@field avgHullIntegrity System.Single
---`Field Private Instance`
---@field floodingAmount System.Single
---`Field Private Instance`
---@field fireAmount System.Single
---`Field Private Instance`
---@field enemyDanger System.Single
---`Field Private Instance`
---@field monsterStrength System.Single
---`Field Public Instance`
---@field CumulativeMonsterStrengthMain System.Single
---`Field Public Instance`
---@field CumulativeMonsterStrengthRuins System.Single
---`Field Public Instance`
---@field CumulativeMonsterStrengthWrecks System.Single
---`Field Public Instance`
---@field CumulativeMonsterStrengthCaves System.Single
---`Field Private Instance`
---@field roundDuration System.Single
---`Field Private Instance`
---@field isCrewAway System.Boolean
---`Field Private Instance`
---@field crewAwayResetTimer System.Single
---`Field Private Instance`
---@field crewAwayDuration System.Single
---`Field Private Instance`
---@field pendingEventSets (System.Collections.Generic.List*1Barotrauma*EventSet)|(Barotrauma.EventSet[])
---`Field Private Instance`
---@field selectedEvents (System.Collections.Generic.Dictionary*1Barotrauma*EventSet*1System*Collections*Generic*List*2Barotrauma*Event)|({[Barotrauma.EventSet]:((System.Collections.Generic.List*1Barotrauma*Event)|(Barotrauma.Event[]))})
---`Field Private Instance`
---@field activeEvents (System.Collections.Generic.List*1Barotrauma*Event)|(Barotrauma.Event[])
---`Field Private Instance`
---@field finishedEvents (System.Collections.Generic.HashSet*1Barotrauma*Event)|(Barotrauma.Event[])
---`Field Private Instance`
---@field nonRepeatableEvents (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field settings Barotrauma.EventManagerSettings
---`Field Private Instance`
---@field isClient System.Boolean
---`Field Public Instance`
---@field QueuedEvents (System.Collections.Generic.Queue*1Barotrauma*Event)|(fun():(Barotrauma.Event))
---`Field Public Instance`
---@field QueuedEventsForNextRound (System.Collections.Generic.Queue*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---`Field Private Instance`
---@field timeStamps (System.Collections.Generic.List*1Barotrauma*EventManager*TimeStamp)|(Barotrauma.EventManager.TimeStamp[])
---`Field Public Instance`
---@field EventLog Barotrauma.EventLog
---`Field Public Instance`
---@field Enabled System.Boolean
---`Field Private Instance`
---@field random Barotrauma.MTRandom
---`Field Private Instance`
---@field eventsInitialized System.Boolean
---`Field Private Static`
---@field intensityGraphUpdateInterval System.Single
---`Field Private Static`
---@field IntensityUpdateInterval System.Single
---`Field Private Static`
---@field CalculateDistanceTraveledInterval System.Single
---`Field Private Static`
---@field MaxEventHistory System.Int32
---`Field Private Static`
---@field CrewAwayResetDelay System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field PinnedEvent Barotrauma.Event
---`Getter Public Instance`
---@field CurrentIntensity System.Single
---`Getter Public Instance`
---@field MusicIntensity System.Single
---`Getter Public Instance`
---@field ActiveEvents (System.Collections.Generic.IEnumerable*1Barotrauma*Event)|(fun():(Barotrauma.Event))
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field RandomSeed System.Int32
_G['EventManager'] = {}

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['EventManager'].DebugDraw = function(spriteBatch) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param y System.Single
_G['EventManager'].DebugDrawHUD = function(spriteBatch, y) end

---`Method Public Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
_G['EventManager'].DrawPinnedEvent = function(spriteBatch) end

---`Method Private Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param scriptedEvent Barotrauma.ScriptedEvent
_G['EventManager'].DrawEventTargetTags = function(spriteBatch, scriptedEvent) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param ev Barotrauma.Event
---@param parentRect? System.Nullable*1Microsoft*Xna*Framework*Rectangle
---@return Microsoft.Xna.Framework.Rectangle
_G['EventManager'].DrawEvent = function(spriteBatch, ev, parentRect) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param scriptedEvent Barotrauma.ScriptedEvent
---@param parentRect? System.Nullable*1Microsoft*Xna*Framework*Rectangle
---@return Microsoft.Xna.Framework.Rectangle
_G['EventManager'].DrawScriptedEvent = function(spriteBatch, scriptedEvent, parentRect) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param artifactEvent Barotrauma.ArtifactEvent
---@param parentRect? System.Nullable*1Microsoft*Xna*Framework*Rectangle
---@return Microsoft.Xna.Framework.Rectangle
_G['EventManager'].DrawArtifactEvent = function(spriteBatch, artifactEvent, parentRect) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param monsterEvent Barotrauma.MonsterEvent
---@param parentRect? System.Nullable*1Microsoft*Xna*Framework*Rectangle
---@return Microsoft.Xna.Framework.Rectangle
_G['EventManager'].DrawMonsterEvent = function(spriteBatch, monsterEvent, parentRect) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param event Barotrauma.Event
---@param text System.String
---@param parentRect? System.Nullable*1Microsoft*Xna*Framework*Rectangle
---@param drawPoints? (System.Collections.Generic.List*1Barotrauma*EventManager*DebugLine)|(Barotrauma.EventManager.DebugLine[])
---@return Microsoft.Xna.Framework.Rectangle
_G['EventManager'].DrawInfoRectangle = function(spriteBatch, event, text, parentRect, drawPoints) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
_G['EventManager'].ClientRead = function(msg) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['EventManager'].ApplyNetworkMessageWhenRoundLoaded = function(msg) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
_G['EventManager'].ClientApplyNetworkMessage = function(msg) end

---`Method Private Instance`
---@param client Barotrauma.Networking.GameClient
---@param msg Barotrauma.Networking.IReadMessage
_G['EventManager'].ClientReadEventLog = function(client, msg) end

---`Method Private Static`
---@param client Barotrauma.Networking.GameClient
---@param msg Barotrauma.Networking.IReadMessage
_G['EventManager'].ClientReadEventObjective = function(client, msg) end

---`Method Public Instance`
---@param e Barotrauma.Event
_G['EventManager'].AddTimeStamp = function(e) end

---`Method Public Instance`
---@param level Barotrauma.Level
_G['EventManager'].StartRound = function(level) end

---`Method Public Instance`
---@param newEvent Barotrauma.Event
_G['EventManager'].ActivateEvent = function(newEvent) end

---`Method Public Instance`
_G['EventManager'].ClearEvents = function() end

---`Method Private Instance`
_G['EventManager'].SelectSettings = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentFile)|(fun():(Barotrauma.ContentFile))
_G['EventManager'].GetFilesToPreload = function() end

---`Method Public Instance`
---@param contentFiles (System.Collections.Generic.IEnumerable*1Barotrauma*ContentFile)|(fun():(Barotrauma.ContentFile))
_G['EventManager'].PreloadContent = function(contentFiles) end

---`Method Public Instance`
_G['EventManager'].TriggerOnEndRoundActions = function() end

---`Method Public Instance`
_G['EventManager'].EndRound = function() end

---`Method Public Instance`
---@param registerFinishedOnly? System.Boolean
_G['EventManager'].StoreEventDataAtRoundEnd = function(registerFinishedOnly) end

---`Method Public Instance`
_G['EventManager'].SkipEventCooldown = function() end

---`Method Private Instance`
---@param eventPrefab Barotrauma.EventPrefab
---@param baseCommonness System.Single
---@return System.Single
_G['EventManager'].CalculateCommonness = function(eventPrefab, baseCommonness) end

---`Method Private Instance`
---@param eventSet Barotrauma.EventSet
_G['EventManager'].CreateEvents = function(eventSet) end

---`Method Private Instance`
---@param eventSets (System.Collections.Generic.IReadOnlyList*1Barotrauma*EventSet)|(Barotrauma.EventSet[])
---@param requireCampaignSet? System.Nullable*1System*Boolean
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*EventSet)|(fun():(Barotrauma.EventSet))
_G['EventManager'].GetAllowedEventSets = function(eventSets, requireCampaignSet) end

---`Method Private Instance`
---@param eventSets (System.Collections.Generic.IReadOnlyList*1Barotrauma*EventSet)|(Barotrauma.EventSet[])
---@param requireCampaignSet? System.Nullable*1System*Boolean
---@param random? System.Random
---@return Barotrauma.EventSet
_G['EventManager'].SelectRandomEvents = function(eventSets, requireCampaignSet, random) end

---`Method Public Static`
---@param e Barotrauma.EventPrefab
---@param level Barotrauma.Level
---@return System.Boolean
_G['EventManager'].IsSuitable = function(e, level) end

---`Method Public Static`
---@param e Barotrauma.EventPrefab
---@param level Barotrauma.Level
---@return System.Boolean
_G['EventManager'].IsLevelSuitable = function(e, level) end

---`Method Private Static`
---@param factionId Barotrauma.Identifier
---@param level Barotrauma.Level
---@return System.Boolean
_G['EventManager'].IsFactionSuitable = function(factionId, level) end

---`Method Private Static`
---@param eventSet Barotrauma.EventSet
---@param level Barotrauma.Level
---@return System.Boolean
_G['EventManager'].IsValidForLevel = function(eventSet, level) end

---`Method Private Instance`
---@param eventSet Barotrauma.EventSet
---@param location Barotrauma.Location
---@return System.Boolean
_G['EventManager'].IsValidForLocation = function(eventSet, location) end

---`Method Private Instance`
---@return Barotrauma.Location
_G['EventManager'].GetEventLocation = function() end

---`Method Private Instance`
---@param eventSet Barotrauma.EventSet
---@return System.Boolean
_G['EventManager'].CanStartEventSet = function(eventSet) end

---`Method Public Instance`
---@param deltaTime System.Single
_G['EventManager'].Update = function(deltaTime) end

---`Method Public Instance`
---@param entity Barotrauma.Entity
_G['EventManager'].EntitySpawned = function(entity) end

---`Method Private Instance`
---@param deltaTime System.Single
_G['EventManager'].CalculateCurrentIntensity = function(deltaTime) end

---`Method Private Instance`
---@return System.Single
_G['EventManager'].CalculateDistanceTraveled = function() end

---`Method Public Static`
---@param acceptRemoteControlledSubs? System.Boolean
---@return Barotrauma.ISpatialEntity
_G['EventManager'].GetRefEntity = function(acceptRemoteControlledSubs) end

---`Method Private Instance`
---@return System.Boolean
_G['EventManager'].IsCrewAway = function() end

---`Method Private Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['EventManager'].IsCharacterAway = function(character) end

---`Method Public Instance`
---@param element System.Xml.Linq.XElement
_G['EventManager'].Load = function(element) end

---`Method Public Instance`
---@return System.Xml.Linq.XElement
_G['EventManager'].Save = function() end

---`Constructor Public Instance`
---@return Barotrauma.EventManager
_G['EventManager'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.EventManager
_G['EventManager'].__new = function() end

