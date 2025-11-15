---@meta
---@class Barotrauma.ContentPackage : System.Object
---`Field Public Instance`
---@field AltNames (System.Collections.Immutable.ImmutableArray*1System*String)|(System.String[])
---`Field Public Instance`
---@field UgcId Barotrauma.Option*1Barotrauma*ContentPackageId
---`Field Public Instance`
---@field GameVersion System.Version
---`Field Public Instance`
---@field ModVersion System.String
---`Field Public Instance`
---@field InstallTime Barotrauma.Option*1Barotrauma*SerializableDateTime
---`Field Private Instance`
---@field missingDependencies (System.Collections.Generic.HashSet*1Steamworks*Data*PublishedFileId)|(Steamworks.Data.PublishedFileId[])
---`Field Public Static`
---@field MinimumHashCompatibleVersion System.Version
---`Field Public Static`
---@field WorkshopModsDir System.String
---`Field Public Static`
---@field LocalModsDir System.String
---`Field Public Static`
---@field FileListFileName System.String
---`Field Public Static`
---@field DefaultModVersion System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Name System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Path System.String
---`Getter Public Instance`
---@field Dir System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UgcItemStatus Barotrauma.ContentPackage.UgcStatus
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field UgcItem Barotrauma.Option*1Steamworks*Ugc*Item
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Hash Barotrauma.Md5Hash
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Files (System.Collections.Immutable.ImmutableArray*1Barotrauma*ContentFile)|(Barotrauma.ContentFile[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field FatalLoadErrors (System.Collections.Immutable.ImmutableArray*1Barotrauma*ContentPackage*LoadError)|(Barotrauma.ContentPackage.LoadError[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field EnableError Barotrauma.Option*1Barotrauma*ContentPackageManager*LoadProgress*Error
---`Getter Public Instance`
---@field MissingDependencies (System.Collections.Generic.IEnumerable*1Steamworks*Data*PublishedFileId)|(fun():(Steamworks.Data.PublishedFileId))
---`Getter Public Instance`
---@field HasAnyErrors System.Boolean
---`Getter Public Instance`
---@field Index System.Int32
---`Getter Public Instance`
---@field HasMultiplayerSyncedContent System.Boolean
_G['ContentPackage'] = {}

---`Method Public Instance`
---@return System.Threading.Tasks.Task*1System*Boolean
_G['ContentPackage'].IsUpToDate = function() end

---`Method Public Instance`
---@param expectedHash System.String
---@return System.Boolean
_G['ContentPackage'].HashMismatches = function(expectedHash) end

---`Method Public Instance`
---@overload fun():((System.Collections.Generic.IEnumerable*1Barotrauma*ContentPackage*T)|(fun():(Barotrauma.ContentPackage.T)))
---@param type System.Type
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentFile)|(fun():(Barotrauma.ContentFile))
_G['ContentPackage'].GetFiles = function(type) end

---`Method Public Instance`
---@overload fun(name:Barotrauma.Identifier):(System.Boolean)
---@param name System.String
---@return System.Boolean
_G['ContentPackage'].NameMatches = function(name) end

---`Method Public Static`
---@param path System.String
---@return Barotrauma.Result*1Barotrauma*ContentPackage*1System*Exception
_G['ContentPackage'].TryLoad = function(path) end

---`Method Public Instance`
---@param logging? System.Boolean
---@param name? System.String
---@param modVersion? System.String
---@return Barotrauma.Md5Hash
_G['ContentPackage'].CalculateHash = function(logging, name, modVersion) end

---`Method NonPublic Instance`
---@param condition System.Boolean
---@param errorMsg System.String
_G['ContentPackage'].AssertCondition = function(condition, errorMsg) end

---`Method Public Instance`
---@param missingItemID Steamworks.Data.PublishedFileId
_G['ContentPackage'].AddMissingDependency = function(missingItemID) end

---`Method Public Instance`
_G['ContentPackage'].ClearMissingDependencies = function() end

---`Method Public Instance`
_G['ContentPackage'].LoadFilesOfType = function() end

---`Method Public Instance`
_G['ContentPackage'].UnloadFilesOfType = function() end

---`Method Public Instance`
---@return Barotrauma.ContentPackage.LoadResult
_G['ContentPackage'].LoadContent = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentPackageManager*LoadProgress)|(fun():(Barotrauma.ContentPackageManager.LoadProgress))
_G['ContentPackage'].LoadContentEnumerable = function() end

---`Method Public Instance`
---@param onFinished (System.Action*1System*String)|(fun(obj:System.String))
_G['ContentPackage'].TryFetchUgcDescription = function(onFinished) end

---`Method Public Instance`
---@param onFinished (System.Action*1Steamworks*Data*PublishedFileId-arr)|(fun(obj:(Steamworks.Data.PublishedFileId-arr)|(Steamworks.Data.PublishedFileId[])))
_G['ContentPackage'].TryFetchUgcChildren = function(onFinished) end

---`Method Private Instance`
---@param onFinished (System.Action*1System*Nullable*2Steamworks*Ugc*Item)|(fun(obj:System.Nullable*1Steamworks*Ugc*Item))
_G['ContentPackage'].TryFetchUgcItem = function(onFinished) end

---`Method Public Instance`
---@param onFinished (System.Action)|(fun())
_G['ContentPackage'].TryFetchUgcItem = function(onFinished) end

---`Method Public Instance`
_G['ContentPackage'].UnloadContent = function() end

---`Method Public Instance`
_G['ContentPackage'].ReloadSubsAndItemAssemblies = function() end

---`Method Public Static`
---@param path System.String
---@return System.Boolean
_G['ContentPackage'].PathAllowedAsLocalModFile = function(path) end

---`Method Public Instance`
_G['ContentPackage'].LogErrors = function() end

---`Method Public Instance`
---@param newName System.String
---@return System.Boolean
_G['ContentPackage'].TryRenameLocal = function(newName) end

---`Method Public Instance`
---@return System.Boolean
_G['ContentPackage'].TryDeleteLocal = function() end

---`Method Public Instance`
---@return System.Boolean
_G['ContentPackage'].TryCreateLocalFromWorkshop = function() end

---`Constructor NonPublic Instance`
---@overload fun(doc:System.Xml.Linq.XDocument, path:System.String):Barotrauma.ContentPackage
---@return Barotrauma.ContentPackage
_G['ContentPackage'] = function() end

---`Constructor NonPublic Instance`
---@overload fun(doc:System.Xml.Linq.XDocument, path:System.String):Barotrauma.ContentPackage
---@return Barotrauma.ContentPackage
_G['ContentPackage'].__new = function() end

---`Constructor Private Static`
---@overload fun(doc:System.Xml.Linq.XDocument, path:System.String):Barotrauma.ContentPackage
---@return Barotrauma.ContentPackage
_G['ContentPackage'] = function() end

---`Constructor Private Static`
---@overload fun(doc:System.Xml.Linq.XDocument, path:System.String):Barotrauma.ContentPackage
---@return Barotrauma.ContentPackage
_G['ContentPackage'].__new = function() end

