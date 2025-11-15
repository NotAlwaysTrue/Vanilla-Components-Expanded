---@meta
---@class Barotrauma.OutpostGenerator : System.Object
---`Field Private Static`
---@field usedForceOutpostModule Barotrauma.SubmarineInfo
---`Field Private Static`
---@field GapPositions (Barotrauma.GapPosition-arr)|(Barotrauma.OutpostModuleInfo.GapPosition[])
---`Field Private Static`
---@field MaxOutpostGenerationRetries System.Int32
_G['OutpostGenerator'] = {}

---`Method Public Static`
---@overload fun(generationParams:Barotrauma.OutpostGenerationParams, locationType:Barotrauma.LocationType, onlyEntrance?:System.Boolean, allowInvalidOutpost?:System.Boolean):(Barotrauma.Submarine)
---@param generationParams Barotrauma.OutpostGenerationParams
---@param location Barotrauma.Location
---@param onlyEntrance? System.Boolean
---@param allowInvalidOutpost? System.Boolean
---@return Barotrauma.Submarine
_G['OutpostGenerator'].Generate = function(generationParams, location, onlyEntrance, allowInvalidOutpost) end

---`Method Private Static`
---@param generationParams Barotrauma.OutpostGenerationParams
---@param locationType Barotrauma.LocationType
---@param location Barotrauma.Location
---@param onlyEntrance? System.Boolean
---@param allowInvalidOutpost? System.Boolean
---@return Barotrauma.Submarine
_G['OutpostGenerator'].Generate = function(generationParams, locationType, location, onlyEntrance, allowInvalidOutpost) end

---`Method Private Static`
---@param generationParams Barotrauma.OutpostGenerationParams
---@return Barotrauma.SubmarineInfo
_G['OutpostGenerator'].ChooseOutpost = function(generationParams) end

---`Method Private Static`
---@param generationParams Barotrauma.OutpostGenerationParams
---@param outpostModuleFiles (Barotrauma.OutpostModuleFile-arr)|(Barotrauma.OutpostModuleFile[])
---@param sub Barotrauma.Submarine
---@param locationType Barotrauma.LocationType
---@param location Barotrauma.Location
---@param onlyEntrance? System.Boolean
---@param allowInvalidOutpost? System.Boolean
---@return Barotrauma.Submarine
_G['OutpostGenerator'].GenerateFromModules = function(generationParams, outpostModuleFiles, sub, locationType, location, onlyEntrance, allowInvalidOutpost) end

---`Method Private Static`
---@param modules (System.Collections.Generic.IEnumerable*1Barotrauma*SubmarineInfo)|(fun():(Barotrauma.SubmarineInfo))
---@param location Barotrauma.Location
---@param generationParams Barotrauma.OutpostGenerationParams
---@return (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
_G['OutpostGenerator'].SelectModules = function(modules, location, generationParams) end

---`Method Private Static`
---@param currentModule Barotrauma.OutpostGenerator.PlacedModule
---@param availableModules (System.Collections.Generic.List*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
---@param pendingModuleFlags (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---@param selectedModules (System.Collections.Generic.List*1Barotrauma*OutpostGenerator*PlacedModule)|(Barotrauma.OutpostGenerator.PlacedModule[])
---@param locationType Barotrauma.LocationType
---@param tryReplacingCurrentModule? System.Boolean
---@param allowExtendBelowInitialModule? System.Boolean
---@param allowDifferentLocationType? System.Boolean
---@return System.Boolean
_G['OutpostGenerator'].AppendToModule = function(currentModule, availableModules, pendingModuleFlags, selectedModules, locationType, tryReplacingCurrentModule, allowExtendBelowInitialModule, allowDifferentLocationType) end

---`Method Private Static`
---@param currentModule Barotrauma.OutpostGenerator.PlacedModule
---@param gapPosition Barotrauma.OutpostModuleInfo.GapPosition
---@param availableModules (System.Collections.Generic.List*1Barotrauma*SubmarineInfo)|(Barotrauma.SubmarineInfo[])
---@param pendingModuleFlags (System.Collections.Generic.List*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---@param selectedModules (System.Collections.Generic.List*1Barotrauma*OutpostGenerator*PlacedModule)|(Barotrauma.OutpostGenerator.PlacedModule[])
---@param locationType Barotrauma.LocationType
---@param allowDifferentLocationType System.Boolean
---@return Barotrauma.OutpostGenerator.PlacedModule
_G['OutpostGenerator'].AppendModule = function(currentModule, gapPosition, availableModules, pendingModuleFlags, selectedModules, locationType, allowDifferentLocationType) end

---`Method Private Static`
---@param modules1 (System.Collections.Generic.IEnumerable*1Barotrauma*OutpostGenerator*PlacedModule)|(fun():(Barotrauma.OutpostGenerator.PlacedModule))
---@param modules2 (System.Collections.Generic.IEnumerable*1Barotrauma*OutpostGenerator*PlacedModule)|(fun():(Barotrauma.OutpostGenerator.PlacedModule))
---@param module1 Barotrauma.PlacedModule-ref
---@param module2 Barotrauma.PlacedModule-ref
---@return System.Boolean
_G['OutpostGenerator'].FindOverlap = function(modules1, modules2, module1, module2) end

---`Method Private Static`
---@param module1 Barotrauma.OutpostGenerator.PlacedModule
---@param module2 Barotrauma.OutpostGenerator.PlacedModule
---@return System.Boolean
_G['OutpostGenerator'].ModulesOverlap = function(module1, module2) end

---`Method Private Static`
---@param modules (System.Collections.Generic.IEnumerable*1Barotrauma*OutpostGenerator*PlacedModule)|(fun():(Barotrauma.OutpostGenerator.PlacedModule))
---@return System.Boolean
_G['OutpostGenerator'].ModuleOverlapsWithModuleConnections = function(modules) end

---`Method Private Static`
---@param module Barotrauma.OutpostGenerator.PlacedModule
---@param initialModule Barotrauma.OutpostGenerator.PlacedModule
---@return System.Boolean
_G['OutpostGenerator'].ModuleBelowInitialModule = function(module, initialModule) end

---`Method Private Static`
---@param movableModules (System.Collections.Generic.IEnumerable*1Barotrauma*OutpostGenerator*PlacedModule)|(fun():(Barotrauma.OutpostGenerator.PlacedModule))
---@param module1 Barotrauma.OutpostGenerator.PlacedModule
---@param module2 Barotrauma.OutpostGenerator.PlacedModule
---@param allmodules (System.Collections.Generic.IEnumerable*1Barotrauma*OutpostGenerator*PlacedModule)|(fun():(Barotrauma.OutpostGenerator.PlacedModule))
---@param minMoveAmount System.Single
---@param maxMoveAmount System.Int32
---@param solution System.Collections.Generic.Dictionary
---@return System.Boolean
_G['OutpostGenerator'].FindOverlapSolution = function(movableModules, module1, module2, allmodules, minMoveAmount, maxMoveAmount, solution) end

---`Method Private Static`
---@overload fun(modules:(System.Collections.Generic.IEnumerable*1Barotrauma*SubmarineInfo)|(fun():(Barotrauma.SubmarineInfo)), moduleFlag:Barotrauma.Identifier, locationType:Barotrauma.LocationType):(Barotrauma.SubmarineInfo)
---@param prevModule Barotrauma.OutpostModuleInfo
---@param modules (System.Collections.Generic.IEnumerable*1Barotrauma*SubmarineInfo)|(fun():(Barotrauma.SubmarineInfo))
---@param moduleFlag Barotrauma.Identifier
---@param gapPosition Barotrauma.OutpostModuleInfo.GapPosition
---@param locationType Barotrauma.LocationType
---@param allowDifferentLocationType System.Boolean
---@return Barotrauma.SubmarineInfo
_G['OutpostGenerator'].GetRandomModule = function(prevModule, modules, moduleFlag, gapPosition, locationType, allowDifferentLocationType) end

---`Method Private Static`
---@param startModule Barotrauma.OutpostGenerator.PlacedModule
---@param allModules (System.Collections.Generic.IEnumerable*1Barotrauma*OutpostGenerator*PlacedModule)|(fun():(Barotrauma.OutpostGenerator.PlacedModule))
---@param subsequentModules System.Collections.Generic.List
_G['OutpostGenerator'].GetSubsequentModules = function(startModule, allModules, subsequentModules) end

---`Method Private Static`
---@param thisGapPosition Barotrauma.OutpostModuleInfo.GapPosition
---@return Barotrauma.OutpostModuleInfo.GapPosition
_G['OutpostGenerator'].GetOpposingGapPosition = function(thisGapPosition) end

---`Method Private Static`
---@param thisGapPosition Barotrauma.OutpostModuleInfo.GapPosition
---@return Microsoft.Xna.Framework.Vector2
_G['OutpostGenerator'].GetMoveDir = function(thisGapPosition) end

---`Method Private Static`
---@param entities (System.Collections.Generic.IEnumerable*1Barotrauma*MapEntity)|(fun():(Barotrauma.MapEntity))
---@param gapPosition Barotrauma.OutpostModuleInfo.GapPosition
---@return Barotrauma.Gap
_G['OutpostGenerator'].GetGap = function(entities, gapPosition) end

---`Method Private Static`
---@param from Barotrauma.OutpostModuleInfo
---@param to Barotrauma.OutpostModuleInfo
---@return System.Boolean
_G['OutpostGenerator'].CanAttachTo = function(from, to) end

---`Method Private Static`
---@param sub Barotrauma.Submarine
---@param locationType Barotrauma.LocationType
---@param placedModules (System.Collections.Generic.IEnumerable*1Barotrauma*OutpostGenerator*PlacedModule)|(fun():(Barotrauma.OutpostGenerator.PlacedModule))
---@param availableModules (System.Collections.Generic.IEnumerable*1Barotrauma*SubmarineInfo)|(fun():(Barotrauma.SubmarineInfo))
---@param allEntities (System.Collections.Generic.Dictionary*1Barotrauma*OutpostGenerator*PlacedModule*1System*Collections*Generic*List*2Barotrauma*MapEntity)|({[Barotrauma.OutpostGenerator.PlacedModule]:((System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[]))})
---@param isRuin System.Boolean
---@return (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
_G['OutpostGenerator'].GenerateHallways = function(sub, locationType, placedModules, availableModules, allEntities, isRuin) end

---`Method Private Static`
---@param entities (System.Collections.Generic.IEnumerable*1Barotrauma*MapEntity)|(fun():(Barotrauma.MapEntity))
_G['OutpostGenerator'].LinkOxygenGenerators = function(entities) end

---`Method Private Static`
---@param sub Barotrauma.Submarine
---@param location Barotrauma.Location
_G['OutpostGenerator'].EnableFactionSpecificEntities = function(sub, location) end

---`Method Private Static`
---@param placedModules (System.Collections.Generic.IEnumerable*1Barotrauma*OutpostGenerator*PlacedModule)|(fun():(Barotrauma.OutpostGenerator.PlacedModule))
---@param entities (System.Collections.Generic.Dictionary*1Barotrauma*OutpostGenerator*PlacedModule*1System*Collections*Generic*List*2Barotrauma*MapEntity)|({[Barotrauma.OutpostGenerator.PlacedModule]:((System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[]))})
---@param removeUnusedGaps System.Boolean
_G['OutpostGenerator'].LockUnusedDoors = function(placedModules, entities, removeUnusedGaps) end

---`Method Private Static`
---@param placedModules (System.Collections.Generic.IEnumerable*1Barotrauma*OutpostGenerator*PlacedModule)|(fun():(Barotrauma.OutpostGenerator.PlacedModule))
---@param entities (System.Collections.Generic.Dictionary*1Barotrauma*OutpostGenerator*PlacedModule*1System*Collections*Generic*List*2Barotrauma*MapEntity)|({[Barotrauma.OutpostGenerator.PlacedModule]:((System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[]))})
_G['OutpostGenerator'].AlignLadders = function(placedModules, entities) end

---`Method Public Static`
---@param sub Barotrauma.Submarine
_G['OutpostGenerator'].PowerUpOutpost = function(sub) end

---`Method Public Static`
---@param location Barotrauma.Location
---@param outpost Barotrauma.Submarine
_G['OutpostGenerator'].SpawnNPCs = function(location, outpost) end

---`Constructor Private Static`
---@return Barotrauma.OutpostGenerator
_G['OutpostGenerator'] = function() end

---`Constructor Private Static`
---@return Barotrauma.OutpostGenerator
_G['OutpostGenerator'].__new = function() end

