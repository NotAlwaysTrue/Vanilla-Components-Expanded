---@meta
---@class Barotrauma.AssemblyManager : System.Object
---`Field Private Instance`
---@field OnAssemblyLoaded (System.Action*1System*Reflection*Assembly)|(fun(obj:System.Reflection.Assembly))
---`Field Private Instance`
---@field OnAssemblyUnloading (System.Action*1System*Reflection*Assembly)|(fun(obj:System.Reflection.Assembly))
---`Field Private Instance`
---@field OnException (System.Action*1System*String*1System*Exception)|(fun(arg1:System.String, arg2:System.Exception))
---`Field Private Instance`
---@field OnACLUnload (System.Action*1System*Guid)|(fun(obj:System.Guid))
---`Field Private Instance`
---@field IsReadyToUnloadACL (System.Func*1Barotrauma*AssemblyManager*LoadedACL*1System*Boolean)|(fun(arg:Barotrauma.AssemblyManager.LoadedACL):(System.Boolean))
---`Field Private Instance`
---@field _subTypesLookupCache (System.Collections.Concurrent.ConcurrentDictionary*1System*String*1System*Collections*Immutable*ImmutableList*2System*Type)|(fun():(System.Collections.Generic.KeyValuePair*1System*String*1System*Collections*Immutable*ImmutableList*2System*Type))
---`Field Private Instance`
---@field _defaultContextTypes (System.Collections.Immutable.ImmutableDictionary*1System*String*1System*Type)|({[System.String]:(System.Type)})
---`Field Private Instance`
---@field LoadedACLs (System.Collections.Concurrent.ConcurrentDictionary*1System*Guid*1Barotrauma*AssemblyManager*LoadedACL)|(fun():(System.Collections.Generic.KeyValuePair*1System*Guid*1Barotrauma*AssemblyManager*LoadedACL))
---`Field Private Instance`
---@field UnloadingACLs (System.Collections.Generic.List*1System*WeakReference*2Barotrauma*MemoryFileAssemblyContextLoader)|(System.WeakReference*1Barotrauma*MemoryFileAssemblyContextLoader[])
---`Field Private Instance`
---@field OpsLockLoaded System.Threading.ReaderWriterLockSlim
---`Field Private Instance`
---@field OpsLockUnloaded System.Threading.ReaderWriterLockSlim
---`Getter Public Instance`
---@field StillUnloadingACLs (System.Collections.Immutable.ImmutableList*1System*WeakReference*2Barotrauma*MemoryFileAssemblyContextLoader)|(System.WeakReference*1Barotrauma*MemoryFileAssemblyContextLoader[])
---`Getter Public Instance`
---@field IsCurrentlyUnloading System.Boolean
_G['AssemblyManager'] = {}

---`Method Public Instance`
---@overload fun():((System.Collections.Generic.IEnumerable*1System*Type)|(fun():(System.Type)))
---@param rebuildList System.Boolean
---@return (System.Collections.Generic.IEnumerable*1System*Type)|(fun():(System.Type))
_G['AssemblyManager'].GetSubTypesInLoadedAssemblies = function(rebuildList) end

---`Method Public Instance`
---@overload fun(id:System.Guid, types:System.Collections.Generic.IEnumerable):(System.Boolean)
---@param id System.Guid
---@param types System.Collections.Generic.IEnumerable
---@return System.Boolean
_G['AssemblyManager'].TryGetSubTypesFromACL = function(id, types) end

---`Method Public Instance`
---@param typeName System.String
---@return (System.Collections.Generic.IEnumerable*1System*Type)|(fun():(System.Type))
_G['AssemblyManager'].GetTypesByName = function(typeName) end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1System*Type)|(fun():(System.Type))
_G['AssemblyManager'].GetAllTypesInLoadedAssemblies = function() end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*AssemblyManager*LoadedACL)|(fun():(Barotrauma.AssemblyManager.LoadedACL))
_G['AssemblyManager'].GetAllLoadedACLs = function() end

---`Method NonPublic Instance`
---@return (System.Collections.Immutable.ImmutableList*1Barotrauma*AssemblyManager*LoadedACL)|(Barotrauma.AssemblyManager.LoadedACL[])
_G['AssemblyManager'].UnsafeGetAllLoadedACLs = function() end

---`Method Public Instance`
---@param compiledAssemblyName System.String
---@param syntaxTree (System.Collections.Generic.IEnumerable*1Microsoft*CodeAnalysis*SyntaxTree)|(fun():(Microsoft.CodeAnalysis.SyntaxTree))
---@param externalMetadataReferences (System.Collections.Generic.IEnumerable*1Microsoft*CodeAnalysis*MetadataReference)|(fun():(Microsoft.CodeAnalysis.MetadataReference))
---@param compilationOptions Microsoft.CodeAnalysis.CSharp.CSharpCompilationOptions
---@param friendlyName System.String
---@param id System.Guid-ref
---@param externFileAssemblyRefs? (System.Collections.Generic.IEnumerable*1System*Reflection*Assembly)|(fun():(System.Reflection.Assembly))
---@return Barotrauma.AssemblyLoadingSuccessState
_G['AssemblyManager'].LoadAssemblyFromMemory = function(compiledAssemblyName, syntaxTree, externalMetadataReferences, compilationOptions, friendlyName, id, externFileAssemblyRefs) end

---`Method Public Instance`
---@param guid System.Guid
---@return System.Boolean
_G['AssemblyManager'].SetACLToTemplateMode = function(guid) end

---`Method Public Instance`
---@param filePaths (System.Collections.Generic.IEnumerable*1System*String)|(fun():(System.String))
---@param friendlyName System.String
---@param id System.Guid-ref
---@return Barotrauma.AssemblyLoadingSuccessState
_G['AssemblyManager'].LoadAssembliesFromLocations = function(filePaths, friendlyName, id) end

---`Method Public Instance`
---@return System.Boolean
_G['AssemblyManager'].TryBeginDispose = function() end

---`Method Public Instance`
---@return System.Boolean
_G['AssemblyManager'].FinalizeDispose = function() end

---`Method Public Instance`
---@param id System.Guid
---@param acl Barotrauma.LoadedACL-ref
---@return System.Boolean
_G['AssemblyManager'].TryGetACL = function(id, acl) end

---`Method Private Instance`
---@param id System.Guid
---@param friendlyName System.String
---@param acl Barotrauma.LoadedACL-ref
---@return System.Boolean
_G['AssemblyManager'].GetOrCreateACL = function(id, friendlyName, acl) end

---`Method Private Instance`
---@param id System.Guid
---@return System.Boolean
_G['AssemblyManager'].DisposeACL = function(id) end

---`Method Private Instance`
_G['AssemblyManager'].RebuildTypesList = function() end

---`Constructor NonPublic Instance`
---@return Barotrauma.AssemblyManager
_G['AssemblyManager'] = function() end

---`Constructor NonPublic Instance`
---@return Barotrauma.AssemblyManager
_G['AssemblyManager'].__new = function() end

