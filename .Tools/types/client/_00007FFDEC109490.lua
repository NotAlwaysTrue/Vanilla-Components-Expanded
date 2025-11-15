---@meta
---@class Barotrauma.Items.Components.Sonar : Barotrauma.Items.Components.Powered
---`Field Private Instance`
---@field pathFinder Barotrauma.PathFinder
---`Field Private Instance`
---@field dynamicDockingIndicator System.Boolean
---`Field Private Instance`
---@field unsentChanges System.Boolean
---`Field Private Instance`
---@field networkUpdateTimer System.Single
---`Field Private Instance`
---@field activeTickBox Barotrauma.GUITickBox
---`Field Private Instance`
---@field passiveTickBox Barotrauma.GUITickBox
---`Field Private Instance`
---@field signalWarningText Barotrauma.GUITextBlock
---`Field Private Instance`
---@field lowerAreaFrame Barotrauma.GUIFrame
---`Field Private Instance`
---@field zoomSlider Barotrauma.GUIScrollBar
---`Field Private Instance`
---@field directionalModeSwitch Barotrauma.GUIButton
---`Field Private Instance`
---@field pingDragDirection System.Nullable*1Microsoft*Xna*Framework*Vector2
---`Field Private Instance`
---@field mineralScannerSwitch Barotrauma.GUIButton
---`Field Private Instance`
---@field controlContainer Barotrauma.GUIFrame
---`Field Private Instance`
---@field sonarView Barotrauma.GUICustomComponent
---`Field Private Instance`
---@field directionalPingBackground Barotrauma.Sprite
---`Field Private Instance`
---@field directionalPingButton (Barotrauma.Sprite-arr)|(Barotrauma.Sprite[])
---`Field Private Instance`
---@field pingCircle Barotrauma.Sprite
---`Field Private Instance`
---@field directionalPingCircle Barotrauma.Sprite
---`Field Private Instance`
---@field screenOverlay Barotrauma.Sprite
---`Field Private Instance`
---@field screenBackground Barotrauma.Sprite
---`Field Private Instance`
---@field sonarBlip Barotrauma.Sprite
---`Field Private Instance`
---@field lineSprite Barotrauma.Sprite
---`Field Private Instance`
---@field targetIcons (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Tuple*2Barotrauma*Sprite*2Microsoft*Xna*Framework*Color)|({[Barotrauma.Identifier]:(System.Tuple*1Barotrauma*Sprite*1Microsoft*Xna*Framework*Color)})
---`Field Private Instance`
---@field displayBorderSize System.Single
---`Field Private Instance`
---@field sonarBlips (System.Collections.Generic.List*1Barotrauma*Items*Components*SonarBlip)|(Barotrauma.Items.Components.SonarBlip[])
---`Field Private Instance`
---@field prevPassivePingRadius System.Single
---`Field Private Instance`
---@field center Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field disruptionUpdateTimer System.Single
---`Field Private Instance`
---@field longRangeUpdateTimer System.Single
---`Field Private Instance`
---@field showDirectionalIndicatorTimer System.Single
---`Field Private Instance`
---@field nearbyObjects (System.Collections.Generic.List*1Barotrauma*LevelObject)|(Barotrauma.LevelObject[])
---`Field Private Instance`
---@field nearbyObjectUpdateTimer System.Single
---`Field Private Instance`
---@field connectedSubs (System.Collections.Generic.List*1Barotrauma*Submarine)|(Barotrauma.Submarine[])
---`Field Private Instance`
---@field connectedSubUpdateTimer System.Single
---`Field Private Instance`
---@field disruptedDirections (System.Collections.Generic.List*1System*ValueTuple*2Microsoft*Xna*Framework*Vector2*2System*Single)|(System.ValueTuple*1Microsoft*Xna*Framework*Vector2*1System*Single[])
---`Field Private Instance`
---@field markerDistances (System.Collections.Generic.Dictionary*1System*Object*1Barotrauma*CachedDistance)|({[System.Object]:(Barotrauma.CachedDistance)})
---`Field Private Instance`
---@field positiveColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field warningColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field negativeColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field markerColor Microsoft.Xna.Framework.Color
---`Field Private Instance`
---@field prevDockingDist System.Single
---`Field Private Instance`
---@field textBlocksToScaleAndNormalize (System.Collections.Generic.List*1Barotrauma*GUITextBlock)|(Barotrauma.GUITextBlock[])
---`Field Private Instance`
---@field isConnectedToSteering System.Boolean
---`Field Private Instance`
---@field cachedLocations (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*CachedLocation)|({[Barotrauma.Identifier]:(Barotrauma.CachedLocation)})
---`Field Private Instance`
---@field range System.Single
---`Field Private Instance`
---@field currentMode Barotrauma.Items.Components.Sonar.Mode
---`Field Private Instance`
---@field activePings (Barotrauma.Items.Components.ActivePing-arr)|(Barotrauma.Items.Components.Sonar.ActivePing[])
---`Field Private Instance`
---@field activePingsCount System.Int32
---`Field Private Instance`
---@field currentPingIndex System.Int32
---`Field Private Instance`
---@field zoom System.Single
---`Field Private Instance`
---@field useDirectionalPing System.Boolean
---`Field Private Instance`
---@field pingDirection Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field aiPingCheckPending System.Boolean
---`Field Private Instance`
---@field connectedTransducers (System.Collections.Generic.List*1Barotrauma*Items*Components*Sonar*ConnectedTransducer)|(Barotrauma.Items.Components.Sonar.ConnectedTransducer[])
---`Field Private Instance`
---@field hasMineralScanner System.Boolean
---`Field Public Static`
---@field controlBoxSize Microsoft.Xna.Framework.Vector2
---`Field Public Static`
---@field controlBoxOffset Microsoft.Xna.Framework.Vector2
---`Field Private Static`
---@field sonarAreaSize System.Single
---`Field Private Static`
---@field blipColorGradient (System.Collections.Generic.Dictionary*1Barotrauma*Items*Components*Sonar*BlipType*1Microsoft*Xna*Framework*Color-arr)|({[Barotrauma.Items.Components.Sonar.BlipType]:((Microsoft.Xna.Framework.Color-arr)|(Microsoft.Xna.Framework.Color[]))})
---`Field Private Static`
---@field caveLabel Barotrauma.LocalizedString
---`Field Private Static`
---@field enemyLabel Barotrauma.LocalizedString
---`Field Public Static`
---@field SonarList (System.Collections.Generic.List*1Barotrauma*Items*Components*Sonar)|(Barotrauma.Items.Components.Sonar[])
---`Field Private Static`
---@field DirectionalPingDotProduct System.Single
---`Field Private Static`
---@field targetGroups (System.Collections.Generic.Dictionary*1System*String*1System*Collections*Generic*List*2Barotrauma*Character)|({[System.String]:((System.Collections.Generic.List*1Barotrauma*Character)|(Barotrauma.Character[]))})
---`Field Private Static`
---@field DisruptionUpdateInterval System.Single
---`Field Private Static`
---@field LongRangeUpdateInterval System.Single
---`Field Private Static`
---@field NearbyObjectUpdateInterval System.Single
---`Field Private Static`
---@field ConnectedSubUpdateInterval System.Single
---`Field Public Static`
---@field DefaultSonarRange System.Single
---`Field Public Static`
---@field PassivePowerConsumption System.Single
---`Field Private Static`
---@field DirectionalPingSector System.Single
---`Field Private Static`
---@field PingFrequency System.Single
---`Field Private Static`
---@field MinZoom System.Single
---`Field Private Static`
---@field MaxZoom System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SonarModeSwitch Barotrauma.GUIButton
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DisplayScale System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DisplayOffset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field DisplayRadius System.Single
---`Getter Public Static`
---@field GUISizeCalculation Microsoft.Xna.Framework.Vector2
---`Getter Private Instance`
---<br/>`Setter Private Instance`
---@field MineralClusters (System.Collections.Generic.List*1System*ValueTuple*2Microsoft*Xna*Framework*Vector2*2System*Collections*Generic*List*3Barotrauma*Item)|(System.ValueTuple*1Microsoft*Xna*Framework*Vector2*1System*Collections*Generic*List*2Barotrauma*Item[])
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RightLayout System.Boolean
---`Getter Public Instance Virtual`
---@field RecreateGUIOnResolutionChange System.Boolean
---`Getter Public Instance`
---@field UseDirectionalPing System.Boolean
---`Getter Public Instance`
---@field ConnectedTransducers (System.Collections.Generic.IEnumerable*1Barotrauma*Items*Components*SonarTransducer)|(fun():(Barotrauma.Items.Components.SonarTransducer))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Range System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DetectSubmarineWalls System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UseTransducers System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CenterOnTransducers System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HasMineralScanner System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UseMineralScanner System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Zoom System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CurrentMode Barotrauma.Items.Components.Sonar.Mode
_G['Components']['Sonar'] = {}

---`Method NonPublic Instance Virtual`
_G['Components']['Sonar'].OnResolutionChanged = function() end

---`Method NonPublic Instance Virtual`
_G['Components']['Sonar'].CreateGUI = function() end

---`Method Private Instance`
---@param direction Microsoft.Xna.Framework.Vector2
_G['Components']['Sonar'].SetPingDirection = function(direction) end

---`Method Private Instance`
---@return Microsoft.Xna.Framework.Vector2
_G['Components']['Sonar'].GetTransducerPos = function() end

---`Method Public Instance Virtual`
_G['Components']['Sonar'].OnItemLoaded = function() end

---`Method Private Instance`
_G['Components']['Sonar'].AddMineralScannerSwitchToGUI = function() end

---`Method Private Instance`
_G['Components']['Sonar'].PreventMineralScannerOverlap = function() end

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Sonar'].UpdateHUDComponentSpecific = function(character, deltaTime, cam) end

---`Method Private Instance`
---@param rect Microsoft.Xna.Framework.Rectangle
---@param onButton System.Boolean
---@return System.Boolean
_G['Components']['Sonar'].MouseInDirectionalPingRing = function(rect, onButton) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param rect Microsoft.Xna.Framework.Rectangle
_G['Components']['Sonar'].DrawSonar = function(spriteBatch, rect) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param transducerCenter Microsoft.Xna.Framework.Vector2
---@param signalStrength System.Single
_G['Components']['Sonar'].DrawOwnSubmarineBorders = function(spriteBatch, transducerCenter, signalStrength) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param start Microsoft.Xna.Framework.Vector2
---@param luaKey__end Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param width System.Int32
_G['Components']['Sonar'].DrawLine = function(spriteBatch, start, luaKey__end, color, width) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param start Microsoft.Xna.Framework.Vector2
---@param luaKey__end Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
---@param width System.Int32
_G['Components']['Sonar'].DrawLineSprite = function(spriteBatch, start, luaKey__end, color, width) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param transducerCenter Microsoft.Xna.Framework.Vector2
---@param signalStrength System.Single
_G['Components']['Sonar'].DrawDockingPorts = function(spriteBatch, transducerCenter, signalStrength) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param steering Barotrauma.Items.Components.Steering
---@param transducerCenter Microsoft.Xna.Framework.Vector2-ref
_G['Components']['Sonar'].DrawDockingIndicator = function(spriteBatch, steering, transducerCenter) end

---`Method Private Instance`
---@param pingSource Microsoft.Xna.Framework.Vector2
---@param worldPingRadius System.Single
_G['Components']['Sonar'].UpdateDisruptions = function(pingSource, worldPingRadius) end

---`Method Public Instance`
---@param explosion Barotrauma.Explosion
---@param worldPosition Microsoft.Xna.Framework.Vector2
_G['Components']['Sonar'].RegisterExplosion = function(explosion, worldPosition) end

---`Method Private Instance`
---@param pingSource Microsoft.Xna.Framework.Vector2
---@param transducerPos Microsoft.Xna.Framework.Vector2
---@param pingRadius System.Single
---@param prevPingRadius System.Single
---@param displayScale System.Single
---@param range System.Single
---@param passive System.Boolean
---@param pingStrength? System.Single
---@param needsToBeInSector? Barotrauma.AITarget
_G['Components']['Sonar'].Ping = function(pingSource, transducerPos, pingRadius, prevPingRadius, displayScale, range, passive, pingStrength, needsToBeInSector) end

---`Method Private Instance`
---@param point1 Microsoft.Xna.Framework.Vector2
---@param point2 Microsoft.Xna.Framework.Vector2
---@param pingSource Microsoft.Xna.Framework.Vector2
---@param transducerPos Microsoft.Xna.Framework.Vector2
---@param pingRadius System.Single
---@param prevPingRadius System.Single
---@param lineStep System.Single
---@param zStep System.Single
---@param range System.Single
---@param pingStrength System.Single
---@param passive System.Boolean
---@param blipType? Barotrauma.Items.Components.Sonar.BlipType
---@param needsToBeInSector? Barotrauma.AITarget
_G['Components']['Sonar'].CreateBlipsForLine = function(point1, point2, pingSource, transducerPos, pingRadius, prevPingRadius, lineStep, zStep, range, pingStrength, passive, blipType, needsToBeInSector) end

---`Method Private Instance`
---@param sub Barotrauma.Submarine
---@param pingSource Microsoft.Xna.Framework.Vector2
---@param transducerPos Microsoft.Xna.Framework.Vector2
---@param pingRadius System.Single
---@param prevPingRadius System.Single
---@param range System.Single
---@param passive System.Boolean
_G['Components']['Sonar'].CreateBlipsForSubmarineWalls = function(sub, pingSource, transducerPos, pingRadius, prevPingRadius, range, passive) end

---`Method Private Instance`
---@param blip Barotrauma.Items.Components.SonarBlip
---@param transducerPos Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['Components']['Sonar'].CheckBlipVisibility = function(blip, transducerPos) end

---`Method Private Instance`
---@param resourcePos Microsoft.Xna.Framework.Vector2
---@param transducerPos Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['Components']['Sonar'].CheckResourceMarkerVisibility = function(resourcePos, transducerPos) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param blip Barotrauma.Items.Components.SonarBlip
---@param transducerPos Microsoft.Xna.Framework.Vector2
---@param center Microsoft.Xna.Framework.Vector2
---@param strength System.Single
---@param blipScale System.Single
_G['Components']['Sonar'].DrawBlip = function(spriteBatch, blip, transducerPos, center, strength, blipScale) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param label System.String
---@param iconIdentifier Barotrauma.Identifier
---@param targetIdentifier Barotrauma.Identifier
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param transducerPosition Microsoft.Xna.Framework.Vector2
---@param distanceThresholds Barotrauma.Range*1System*Single
---@param offset Barotrauma.Range*1System*Single
---@param minOffset System.Single
_G['Components']['Sonar'].DrawOffsetMarker = function(spriteBatch, label, iconIdentifier, targetIdentifier, worldPosition, transducerPosition, distanceThresholds, offset, minOffset) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param label System.String
---@param iconIdentifier Barotrauma.Identifier
---@param targetIdentifier System.Object
---@param worldPosition Microsoft.Xna.Framework.Vector2
---@param transducerPosition Microsoft.Xna.Framework.Vector2
---@param scale System.Single
---@param center Microsoft.Xna.Framework.Vector2
---@param radius System.Single
---@param onlyShowTextOnMouseOver? System.Boolean
_G['Components']['Sonar'].DrawMarker = function(spriteBatch, label, iconIdentifier, targetIdentifier, worldPosition, transducerPosition, scale, center, radius, onlyShowTextOnMouseOver) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IWriteMessage
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['Sonar'].ClientEventWrite = function(msg, extraData) end

---`Method Public Instance Virtual`
---@param msg Barotrauma.Networking.IReadMessage
---@param sendingTime System.Single
_G['Components']['Sonar'].ClientEventRead = function(msg, sendingTime) end

---`Method Private Instance`
_G['Components']['Sonar'].UpdateGUIElements = function() end

---`Method Private Instance`
---@param element Barotrauma.ContentXElement
_G['Components']['Sonar'].InitProjSpecific = function(element) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['Sonar'].Update = function(deltaTime, cam) end

---`Method Private Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*AITarget)|(fun():(Barotrauma.AITarget))
_G['Components']['Sonar'].GetAITargets = function() end

---`Method Public Instance Virtual`
---@param connection? Barotrauma.Items.Components.Connection
---@return System.Single
_G['Components']['Sonar'].GetCurrentPowerConsumption = function(connection) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character? Barotrauma.Character
---@return System.Boolean
_G['Components']['Sonar'].Use = function(deltaTime, character) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param character Barotrauma.Character
---@param objective Barotrauma.AIObjectiveOperateItem
---@return System.Boolean
_G['Components']['Sonar'].CrewAIOperate = function(deltaTime, character, objective) end

---`Method Private Instance`
---@param dir Microsoft.Xna.Framework.Vector2
---@return Barotrauma.LocalizedString
_G['Components']['Sonar'].GetDirectionName = function(dir) end

---`Method Public Instance Virtual`
---@param signal Barotrauma.Items.Components.Signal
---@param connection Barotrauma.Items.Components.Connection
_G['Components']['Sonar'].ReceiveSignal = function(signal, connection) end

---`Method NonPublic Instance Virtual`
_G['Components']['Sonar'].RemoveComponentSpecific = function() end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IReadMessage
---@param c Barotrauma.Networking.Client
_G['Components']['Sonar'].ServerEventRead = function(msg, c) end

---`Method Public Instance`
---@param msg Barotrauma.Networking.IWriteMessage
---@param c Barotrauma.Networking.Client
---@param extraData? Barotrauma.Networking.NetEntityEvent.IData
_G['Components']['Sonar'].ServerEventWrite = function(msg, c, extraData) end

---`Constructor Private Static`
---@overload fun():Barotrauma.Items.Components.Sonar
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Sonar
_G['Components']['Sonar'] = function(item, element) end

---`Constructor Private Static`
---@overload fun():Barotrauma.Items.Components.Sonar
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Sonar
_G['Components']['Sonar'].__new = function(item, element) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.Items.Components.Sonar
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Sonar
_G['Components']['Sonar'] = function(item, element) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.Items.Components.Sonar
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.Sonar
_G['Components']['Sonar'].__new = function(item, element) end

