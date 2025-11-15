---@meta
---@class Barotrauma.DebugConsole : System.Object
---`Field Private Static`
---@field isOpen System.Boolean
---`Field Public Static`
---@field Paused System.Boolean
---`Field Private Static`
---@field activeQuestionText Barotrauma.GUITextBlock
---`Field Private Static`
---@field frame Barotrauma.GUIFrame
---`Field Private Static`
---@field listBox Barotrauma.GUIListBox
---`Field Private Static`
---@field textBox Barotrauma.GUITextBox
---`Field Private Static`
---@field chatManager Barotrauma.ChatManager
---`Field Private Static`
---@field queuedMessages (System.Collections.Concurrent.ConcurrentQueue*1Barotrauma*ColoredText)|(fun():(Barotrauma.ColoredText))
---`Field Public Static`
---@field MessageHandler Barotrauma.NamedEvent*1Barotrauma*ColoredText
---`Field Public Static`
---@field Messages (System.Collections.Generic.List*1Barotrauma*ColoredText)|(Barotrauma.ColoredText[])
---`Field Private Static`
---@field activeQuestionCallback (Barotrauma.DebugConsole.QuestionCallback)|(fun(answer:System.String))
---`Field Private Static`
---@field commands (System.Collections.Generic.List*1Barotrauma*DebugConsole*Command)|(Barotrauma.DebugConsole.Command[])
---`Field Private Static`
---@field currentAutoCompletedCommand System.String
---`Field Private Static`
---@field currentAutoCompletedIndex System.Int32
---`Field Public Static`
---@field CheatsEnabled System.Boolean
---`Field Private Static`
---@field unsavedMessages (System.Collections.Generic.List*1Barotrauma*ColoredText)|(Barotrauma.ColoredText[])
---`Field Private Static`
---@field messagesPerFile System.Int32
---`Field Private Static`
---@field previousControlledCharacter System.WeakReference*1Barotrauma*Character
---`Field Private Static`
---@field loggedErrorIdentifiers (System.Collections.Generic.HashSet*1System*String)|(System.String[])
---`Field Private Static`
---@field maxLength System.Int32
---`Field Private Static`
---@field MaxMessages System.Int32
---`Field Public Static`
---@field SavePath System.String
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field IsOpen System.Boolean
---`Getter Public Static`
---@field TextBox Barotrauma.GUITextBox
---`Getter Public Static`
---@field Commands (System.Collections.Generic.List*1Barotrauma*DebugConsole*Command)|(Barotrauma.DebugConsole.Command[])
_G['DebugConsole'] = {}

---`Method Public Static`
_G['DebugConsole'].Init = function() end

---`Method Public Static`
_G['DebugConsole'].AddToGUIUpdateList = function() end

---`Method Public Static`
---@param deltaTime System.Single
_G['DebugConsole'].Update = function(deltaTime) end

---`Method Public Static`
_G['DebugConsole'].Toggle = function() end

---`Method Private Static`
---@param command Barotrauma.Identifier
---@param client Barotrauma.Networking.GameClient
---@return System.Boolean
_G['DebugConsole'].IsCommandPermitted = function(command, client) end

---`Method Public Static`
_G['DebugConsole'].DequeueMessages = function() end

---`Method Private Static`
---@param msg Barotrauma.ColoredText
_G['DebugConsole'].AddMessage = function(msg) end

---`Method Private Static`
---@param names System.String
---@param onClientExecute (System.Action*1System*String-arr)|(fun(obj:(System.String-arr)|(System.String[])))
_G['DebugConsole'].AssignOnClientExecute = function(names, onClientExecute) end

---`Method Private Static`
---@param names System.String
---@param relay System.Boolean
_G['DebugConsole'].AssignRelayToServer = function(names, relay) end

---`Method Private Static`
_G['DebugConsole'].InitProjectSpecific = function() end

---`Method Private Static`
---@param character Barotrauma.Character
---@param variant? System.Int32
_G['DebugConsole'].ReloadWearables = function(character, variant) end

---`Method Private Static`
---@param firstArg System.String
---@param secondArg System.String
---@param action (System.Action*1Barotrauma*Sprite)|(fun(obj:Barotrauma.Sprite))
---@return System.Boolean
_G['DebugConsole'].TryDoActionOnSprite = function(firstArg, secondArg, action) end

---`Method Private Static`
---@param newPrices (System.Collections.Generic.Dictionary*1Barotrauma*ItemPrefab*1System*Int32)|({[Barotrauma.ItemPrefab]:(System.Int32)})
---@param materialPrefab Barotrauma.ItemPrefab
---@param fabricableItems (System.Collections.Generic.List*1Barotrauma*FabricationRecipe)|(Barotrauma.FabricationRecipe[])
---@param newPrice System.Int32
---@param adjustDown System.Boolean
---@param depth? System.String
---@param adjustItemType? Barotrauma.DebugConsole.AdjustItemTypes
_G['DebugConsole'].PrintItemCosts = function(newPrices, materialPrefab, fabricableItems, newPrice, adjustDown, depth, adjustItemType) end

---`Method Private Static`
---@param itemCost System.Int32
---@param componentCost System.Int32
---@return System.Double
_G['DebugConsole'].GetComponentCostDifference = function(itemCost, componentCost) end

---`Method Private Static`
---@param itemPrefab Barotrauma.ItemPrefab
---@param componentCost System.Int32-ref
---@param newComponentCost System.Int32-ref
---@param newPrices (System.Collections.Generic.Dictionary*1Barotrauma*ItemPrefab*1System*Int32)|({[Barotrauma.ItemPrefab]:(System.Int32)})
_G['DebugConsole'].GetAdjustedPrice = function(itemPrefab, componentCost, newComponentCost, newPrices) end

---`Method Public Static`
---@param numClients? System.Int32
_G['DebugConsole'].StartLocalMPSession = function(numClients) end

---`Method Private Static`
_G['DebugConsole'].InitShowSoldItems = function() end

---`Method Private Static`
---@param item Barotrauma.ItemPrefab
---@param filter System.String
---@param includeStores System.Boolean
---@param soldOnly System.Boolean
---@return System.Boolean
_G['DebugConsole'].MatchesFilter = function(item, filter, includeStores, soldOnly) end

---`Method Private Static`
---@param priceEl System.Xml.Linq.XElement
---@param itemPrefab Barotrauma.ItemPrefab
---@param filter System.String
---@param soldOnly System.Boolean
---@return System.Boolean
_G['DebugConsole'].MatchesPriceElement = function(priceEl, itemPrefab, filter, soldOnly) end

---`Method Private Static`
---@param item Barotrauma.ItemPrefab
---@param hideStoreOverrides? System.Boolean
_G['DebugConsole'].PrintItemInfo = function(item, hideStoreOverrides) end

---`Method Private Static`
---@param command Barotrauma.DebugConsole.Command
_G['DebugConsole'].ShowHelpMessage = function(command) end

---`Method Public Static`
---@param names System.String
---@param onExecute (System.Action*1System*String-arr)|(fun(obj:(System.String-arr)|(System.String[])))
_G['DebugConsole'].AssignOnExecute = function(names, onExecute) end

---`Method Private Static`
---@param healedCharacter Barotrauma.Character
---@param healAll System.Boolean
---@param targetClient? Barotrauma.Networking.Client
_G['DebugConsole'].HealCharacter = function(healedCharacter, healAll, targetClient) end

---`Method Public Static`
---@param command System.String
---@param increment? System.Int32
---@return System.String
_G['DebugConsole'].AutoComplete = function(command, increment) end

---`Method Public Static`
_G['DebugConsole'].ResetAutoComplete = function() end

---`Method Public Static`
---@param inputtedCommands System.String
_G['DebugConsole'].ExecuteCommand = function(inputtedCommands) end

---`Method Private Static`
---@return (System.String-arr)|(System.String[])
_G['DebugConsole'].ListAvailableLocations = function() end

---`Method Private Static`
---@param locationName System.String
---@param teleportPosition Microsoft.Xna.Framework.Vector2-ref
---@return System.Boolean
_G['DebugConsole'].TryFindTeleportPosition = function(locationName, teleportPosition) end

---`Method Private Static`
---@param submarineName System.String
---@return Barotrauma.DebugConsole.TFile
_G['DebugConsole'].GetSubmarineFile = function(submarineName) end

---`Method Private Static`
---@return (System.Collections.Generic.List*1Barotrauma*DebugConsole*TFile)|(Barotrauma.DebugConsole.TFile[])
_G['DebugConsole'].GetContentFiles = function() end

---`Method Private Static`
---@return (System.Collections.Generic.List*1Barotrauma*DebugConsole*TFile)|(Barotrauma.DebugConsole.TFile[])
_G['DebugConsole'].GetSubmarineFiles = function() end

---`Method Private Static`
---@param path System.String
---@return Barotrauma.ContentFile
_G['DebugConsole'].GetContentFile = function(path) end

---`Method Private Static`
---@return (System.String-arr)|(System.String[])
_G['DebugConsole'].ListContentFilePaths = function() end

---`Method Private Static`
---@return (System.String-arr)|(System.String[])
_G['DebugConsole'].ListSubmarineFileNames = function() end

---`Method Private Static`
---@param characterList (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
---@return (System.Linq.IOrderedEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
_G['DebugConsole'].SortSpawnedSpecies = function(characterList) end

---`Method Private Static`
---@param includeMeArgument? System.Boolean
---@param includeCrewArgument? System.Boolean
---@return (System.String-arr)|(System.String[])
_G['DebugConsole'].ListCharacterNames = function(includeMeArgument, includeCrewArgument) end

---`Method Private Static`
---@param includeMeArgument? System.Boolean
---@param includeCrewArgument? System.Boolean
---@return (System.String-arr)|(System.String[])
_G['DebugConsole'].GetCharacterNames = function(includeMeArgument, includeCrewArgument) end

---`Method Private Static`
---@return (System.String-arr)|(System.String[])
_G['DebugConsole'].GetSpawnedSpeciesNames = function() end

---`Method Private Static`
---@overload fun(args:(System.String-arr)|(System.String[])):((System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character)))
---@param speciesName System.String
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*Character)|(fun():(Barotrauma.Character))
_G['DebugConsole'].FindMatchingSpecies = function(speciesName) end

---`Method Private Static`
---@param args (System.String-arr)|(System.String[])
---@param action (System.Action*1Barotrauma*Character)|(fun(obj:Barotrauma.Character))
---@param targetClient? Barotrauma.Networking.Client
_G['DebugConsole'].HandleCommandForCrewOrSingleCharacter = function(args, action, targetClient) end

---`Method Private Static`
---@param args (System.String-arr)|(System.String[])
---@param ignoreRemotePlayers? System.Boolean
---@param allowedRemotePlayer? Barotrauma.Networking.Client
---@param botsOnly? System.Boolean
---@return Barotrauma.Character
_G['DebugConsole'].FindMatchingCharacter = function(args, ignoreRemotePlayers, allowedRemotePlayer, botsOnly) end

---`Method Private Static`
---@param cursorWorldPos Microsoft.Xna.Framework.Vector2
---@param controlledCharacter Barotrauma.Character
---@param args (System.String-arr)|(System.String[])
_G['DebugConsole'].TeleportCharacter = function(cursorWorldPos, controlledCharacter, args) end

---`Method Private Static`
---@param targetCharacter Barotrauma.Character
---@param locationNameArgument System.String
---@param defaultWorldPosition Microsoft.Xna.Framework.Vector2
_G['DebugConsole'].TeleportSpecificCharacter = function(targetCharacter, locationNameArgument, defaultWorldPosition) end

---`Method Private Static`
---@param args (System.String-arr)|(System.String[])
---@param cursorWorldPos Microsoft.Xna.Framework.Vector2
---@param usePreConfiguredNPC? System.Boolean
_G['DebugConsole'].SpawnCharacter = function(args, cursorWorldPos, usePreConfiguredNPC) end

---`Method Private Static`
---@return (System.Collections.Generic.IEnumerable*1System*String)|(fun():(System.String))
_G['DebugConsole'].GetSpawnPosParams = function() end

---`Method Private Static`
---@return (System.Collections.Generic.IEnumerable*1System*String)|(fun():(System.String))
_G['DebugConsole'].GetItemNameOrIdParams = function() end

---`Method Private Static`
---@param args (System.String-arr)|(System.String[])
_G['DebugConsole'].TrySpawnItem = function(args) end

---`Method Public Static`
---@param args (System.String-arr)|(System.String[])
---@param cursorPos Microsoft.Xna.Framework.Vector2
---@param controlledCharacter Barotrauma.Character
---@param errorMsg System.String-ref
_G['DebugConsole'].SpawnItem = function(args, cursorPos, controlledCharacter, errorMsg) end

---`Method Public Static`
---@param error System.String
_G['DebugConsole'].AddSafeError = function(error) end

---`Method Public Static`
---@param msg System.String
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
---@param contentPackage? Barotrauma.ContentPackage
_G['DebugConsole'].LogError = function(msg, color, contentPackage) end

---`Method Public Static`
---@param command System.String
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
_G['DebugConsole'].NewCommand = function(command, color) end

---`Method Public Static`
---@overload fun(msg:Barotrauma.LocalizedString, color?:System.Nullable*1Microsoft*Xna*Framework*Color, debugOnly?:System.Boolean)
---@param msg System.String
---@param color? System.Nullable*1Microsoft*Xna*Framework*Color
---@param debugOnly? System.Boolean
_G['DebugConsole'].NewMessage = function(msg, color, debugOnly) end

---`Method Private Static`
---@param msg System.String
---@param color Microsoft.Xna.Framework.Color
---@param isCommand System.Boolean
---@param isError System.Boolean
_G['DebugConsole'].NewMessage = function(msg, color, isCommand, isError) end

---`Method Public Static`
---@param question System.String
---@param onAnswered (Barotrauma.DebugConsole.QuestionCallback)|(fun(answer:System.String))
---@param args? (System.String-arr)|(System.String[])
---@param argCount? System.Int32
_G['DebugConsole'].ShowQuestionPrompt = function(question, onAnswered, args, argCount) end

---`Method Private Static`
---@param s System.String
---@param timeSpan System.TimeSpan-ref
---@return System.Boolean
_G['DebugConsole'].TryParseTimeSpan = function(s, timeSpan) end

---`Method Public Static`
---@param commandName System.String
---@return Barotrauma.DebugConsole.Command
_G['DebugConsole'].FindCommand = function(commandName) end

---`Method Public Static`
---@overload fun(message:Barotrauma.LocalizedString)
---@param message System.String
_G['DebugConsole'].Log = function(message) end

---`Method Public Static`
---@param error Barotrauma.LocalizedString
---@param e? System.Exception
---@param contentPackage? Barotrauma.ContentPackage
---@param createMessageBox? System.Boolean
---@param appendStackTrace? System.Boolean
_G['DebugConsole'].ThrowErrorLocalized = function(error, e, contentPackage, createMessageBox, appendStackTrace) end

---`Method Public Static`
---@param error System.String
---@param e? System.Exception
---@param contentPackage? Barotrauma.ContentPackage
---@param createMessageBox? System.Boolean
---@param appendStackTrace? System.Boolean
_G['DebugConsole'].ThrowError = function(error, e, contentPackage, createMessageBox, appendStackTrace) end

---`Method Public Static`
---@param gaIdentifier System.String
---@param errorMsg System.String
_G['DebugConsole'].ThrowErrorAndLogToGA = function(gaIdentifier, errorMsg) end

---`Method Public Static`
---@param identifier System.String
---@param errorMsg System.String
---@param e? System.Exception
_G['DebugConsole'].ThrowErrorOnce = function(identifier, errorMsg, e) end

---`Method Public Static`
---@param warning System.String
---@param contentPackage? Barotrauma.ContentPackage
_G['DebugConsole'].AddWarning = function(warning, contentPackage) end

---`Method Private Static`
---@param message System.String
---@param contentPackage Barotrauma.ContentPackage
---@return System.String
_G['DebugConsole'].AddContentPackageInfoToMessage = function(message, contentPackage) end

---`Method Private Static`
---@param errorMsg System.String
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*CoroutineStatus)|(fun():(Barotrauma.CoroutineStatus))
_G['DebugConsole'].CreateMessageBox = function(errorMsg) end

---`Method Public Static`
_G['DebugConsole'].SaveLogs = function() end

---`Method Private Static`
---@param restrictions Barotrauma.EnemyTargetingRestrictions
_G['DebugConsole'].ToggleEnemyAITargetingRestrictions = function(restrictions) end

---`Method Public Static`
_G['DebugConsole'].DeactivateCheats = function() end

---`Constructor Private Static`
---@return Barotrauma.DebugConsole
_G['DebugConsole'] = function() end

---`Constructor Private Static`
---@return Barotrauma.DebugConsole
_G['DebugConsole'].__new = function() end

