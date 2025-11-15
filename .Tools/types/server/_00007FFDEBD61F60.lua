---@meta
---@class Barotrauma.CsPackageManager : System.Object
---`Field Private Instance`
---@field _publicizedAssembliesToLoad (System.String-arr)|(System.String[])
---`Field Private Instance`
---@field _assemblyUnloadTimeoutSeconds System.Single
---`Field Private Instance`
---@field _publicizedAssemblyLoader System.Guid
---`Field Private Instance`
---@field _currentPackagesByLoadOrder (System.Collections.Generic.List*1Barotrauma*ContentPackage)|(Barotrauma.ContentPackage[])
---`Field Private Instance`
---@field _packagesDependencies (System.Collections.Generic.Dictionary*1Barotrauma*ContentPackage*1System*Collections*Immutable*ImmutableList*2Barotrauma*ContentPackage)|({[Barotrauma.ContentPackage]:((System.Collections.Immutable.ImmutableList*1Barotrauma*ContentPackage)|(Barotrauma.ContentPackage[]))})
---`Field Private Instance`
---@field _loadedCompiledPackageAssemblies (System.Collections.Generic.Dictionary*1Barotrauma*ContentPackage*1System*Guid)|({[Barotrauma.ContentPackage]:(System.Guid)})
---`Field Private Instance`
---@field _reverseLookupGuidList (System.Collections.Generic.Dictionary*1System*Guid*1Barotrauma*ContentPackage)|({[System.Guid]:(Barotrauma.ContentPackage)})
---`Field Private Instance`
---@field _loadedPlugins (System.Collections.Generic.Dictionary*1System*Guid*1System*Collections*Generic*HashSet*2Barotrauma*IAssemblyPlugin)|({[System.Guid]:((System.Collections.Generic.HashSet*1Barotrauma*IAssemblyPlugin)|(Barotrauma.IAssemblyPlugin[]))})
---`Field Private Instance`
---@field _pluginTypes (System.Collections.Generic.Dictionary*1System*Guid*1System*Collections*Immutable*ImmutableHashSet*2System*Type)|({[System.Guid]:((System.Collections.Immutable.ImmutableHashSet*1System*Type)|(System.Type[]))})
---`Field Private Instance`
---@field _packageRunConfigs (System.Collections.Generic.Dictionary*1Barotrauma*ContentPackage*1Barotrauma*RunConfig)|({[Barotrauma.ContentPackage]:(Barotrauma.RunConfig)})
---`Field Private Instance`
---@field _luaRegisteredTypes (System.Collections.Generic.Dictionary*1System*Guid*1System*Collections*Immutable*ImmutableList*2System*Type)|({[System.Guid]:((System.Collections.Immutable.ImmutableList*1System*Type)|(System.Type[]))})
---`Field Private Instance`
---@field _assemblyManager Barotrauma.AssemblyManager
---`Field Private Instance`
---@field _luaCsSetup Barotrauma.LuaCsSetup
---`Field Private Instance`
---@field _assemblyUnloadStartTime System.DateTime
---`Field Private Instance`
---@field OnDispose (System.Action)|(fun())
---`Field Private Static`
---@field ScriptParseOptions Microsoft.CodeAnalysis.CSharp.CSharpParseOptions
---`Field Private Static`
---@field CompilationOptions Microsoft.CodeAnalysis.CSharp.CSharpCompilationOptions
---`Field Private Static`
---@field BaseAssemblyImports Microsoft.CodeAnalysis.SyntaxTree
---`Field Private Static`
---@field PLATFORM_TARGET System.String
---`Field Private Static`
---@field ARCHITECTURE_TARGET System.String
---`Field Private Static`
---@field SCRIPT_FILE_REGEX System.String
---`Field Private Static`
---@field ASSEMBLY_FILE_REGEX System.String
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field AssembliesLoaded System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PluginsPreInit System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PluginsInitialized System.Boolean
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field PluginsLoaded System.Boolean
_G['PluginPackageManager'] = {}

---`Method Public Instance`
---@param name System.String
---@param caseSensitive? System.Boolean
---@return System.Boolean
_G['PluginPackageManager'].LuaTryRegisterPackageTypes = function(name, caseSensitive) end

---`Method Public Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentPackage)|(fun():(Barotrauma.ContentPackage))
_G['PluginPackageManager'].GetCurrentPackagesByLoadOrder = function() end

---`Method Public Instance`
---@param package Barotrauma.ContentPackage-ref
---@return System.Boolean
_G['PluginPackageManager'].TryGetPackageForPlugin = function(package) end

---`Method Public Instance`
---@param package Barotrauma.ContentPackage
---@param loadedPlugins System.Collections.Generic.IEnumerable
---@return System.Boolean
_G['PluginPackageManager'].TryGetLoadedPluginsForPackage = function(package, loadedPlugins) end

---`Method Public Instance Virtual`
_G['PluginPackageManager'].Dispose = function() end

---`Method Public Instance`
---@return Barotrauma.AssemblyLoadingSuccessState
_G['PluginPackageManager'].LoadAssemblyPackages = function() end

---`Method Public Instance`
_G['PluginPackageManager'].RunPluginsInit = function() end

---`Method Public Instance`
_G['PluginPackageManager'].RunPluginsPreInit = function() end

---`Method Public Instance`
---@param force? System.Boolean
_G['PluginPackageManager'].InstantiatePlugins = function(force) end

---`Method Public Instance`
_G['PluginPackageManager'].UnloadPlugins = function() end

---`Method Public Static`
---@param package Barotrauma.ContentPackage
---@param config Barotrauma.RunConfig-ref
---@return System.Boolean
_G['PluginPackageManager'].GetOrCreateRunConfig = function(package, config) end

---`Method Private Instance`
---@param action (System.Action)|(fun())
---@param messageMethodName System.String
---@param messageTypeName System.String
_G['PluginPackageManager'].TryRun = function(action, messageMethodName, messageTypeName) end

---`Method Private Instance`
---@param assembly System.Reflection.Assembly
_G['PluginPackageManager'].AssemblyManagerOnAssemblyUnloading = function(assembly) end

---`Method Private Instance`
---@param assembly System.Reflection.Assembly
_G['PluginPackageManager'].AssemblyManagerOnAssemblyLoaded = function(assembly) end

---`Method NonPublic Instance Virtual`
_G['PluginPackageManager'].Finalize = function() end

---`Method Private Static`
---@param package Barotrauma.ContentPackage
---@param scriptFilePaths System.Collections.Immutable.ImmutableList
---@return System.Boolean
_G['PluginPackageManager'].TryScanPackageForScripts = function(package, scriptFilePaths) end

---`Method Private Static`
---@param package Barotrauma.ContentPackage
---@param assemblyFilePaths System.Collections.Immutable.ImmutableList
---@return System.Boolean
_G['PluginPackageManager'].TryScanPackagesForAssemblies = function(package, assemblyFilePaths) end

---`Method Private Static`
---@param package Barotrauma.ContentPackage
---@return Barotrauma.RunConfig
_G['PluginPackageManager'].GetRunConfigForPackage = function(package) end

---`Method Private Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*ContentPackage)|(fun():(Barotrauma.ContentPackage))
_G['PluginPackageManager'].BuildPackagesList = function() end

---`Method Private Static`
---@return Microsoft.CodeAnalysis.SyntaxTree
_G['PluginPackageManager'].GetPackageScriptImports = function() end

---`Method Private Static`
---@param packages (System.Collections.Immutable.ImmutableList*1Barotrauma*ContentPackage)|(Barotrauma.ContentPackage[])
---@param dependenciesMap System.Collections.Generic.Dictionary
---@return System.Boolean
_G['PluginPackageManager'].TryBuildDependenciesMap = function(packages, dependenciesMap) end

---`Method Private Static`
---@param packages (System.Collections.Generic.Dictionary*1Barotrauma*ContentPackage*1System*Collections*Immutable*ImmutableList*2Barotrauma*ContentPackage)|({[Barotrauma.ContentPackage]:((System.Collections.Immutable.ImmutableList*1Barotrauma*ContentPackage)|(Barotrauma.ContentPackage[]))})
---@param readyToLoad System.Collections.Generic.IEnumerable
---@param cannotLoadPackages System.Collections.Generic.IEnumerable
---@param packageChecksPredicate? (System.Func*1Barotrauma*ContentPackage*1System*Boolean)|(fun(arg:Barotrauma.ContentPackage):(System.Boolean))
---@return System.Boolean
_G['PluginPackageManager'].OrderAndFilterPackagesByDependencies = function(packages, readyToLoad, cannotLoadPackages, packageChecksPredicate) end

---`Constructor NonPublic Instance`
---@overload fun(assemblyManager:Barotrauma.AssemblyManager, luaCsSetup:Barotrauma.LuaCsSetup):Barotrauma.CsPackageManager
---@return Barotrauma.CsPackageManager
_G['PluginPackageManager'] = function() end

---`Constructor NonPublic Instance`
---@overload fun(assemblyManager:Barotrauma.AssemblyManager, luaCsSetup:Barotrauma.LuaCsSetup):Barotrauma.CsPackageManager
---@return Barotrauma.CsPackageManager
_G['PluginPackageManager'].__new = function() end

---`Constructor Private Static`
---@overload fun(assemblyManager:Barotrauma.AssemblyManager, luaCsSetup:Barotrauma.LuaCsSetup):Barotrauma.CsPackageManager
---@return Barotrauma.CsPackageManager
_G['PluginPackageManager'] = function() end

---`Constructor Private Static`
---@overload fun(assemblyManager:Barotrauma.AssemblyManager, luaCsSetup:Barotrauma.LuaCsSetup):Barotrauma.CsPackageManager
---@return Barotrauma.CsPackageManager
_G['PluginPackageManager'].__new = function() end

