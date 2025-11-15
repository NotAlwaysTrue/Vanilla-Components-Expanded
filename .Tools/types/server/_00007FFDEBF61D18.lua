---@meta
---@class Barotrauma.AnimationParams : Barotrauma.EditableParams
---`Field Private Static`
---@field allAnimations (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*Dictionary*2System*String*2Barotrauma*AnimationParams)|({[Barotrauma.Identifier]:((System.Collections.Generic.Dictionary*1System*String*1Barotrauma*AnimationParams)|({[System.String]:(Barotrauma.AnimationParams)}))})
---`Field Private Static`
---@field errorMessages (System.Collections.Generic.List*1System*String)|(System.String[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpeciesName Barotrauma.Identifier
---`Getter Public Instance`
---@field IsGroundedAnimation System.Boolean
---`Getter Public Instance`
---@field IsSwimAnimation System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter NonPublic Instance Virtual`
---@field AnimationType Barotrauma.AnimationType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MovementSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CycleSpeed System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HeadAngle System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field HeadAngleInRadians System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TorsoAngle System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field TorsoAngleInRadians System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HeadTorque System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TorsoTorque System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FootTorque System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ArmIKStrength System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HandIKStrength System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter NonPublic Instance`
---@field Memento Barotrauma.Memento*1Barotrauma*AnimationParams
_G['AnimationParams'] = {}

---`Method Public Static`
---@param speciesName Barotrauma.Identifier
---@param animType Barotrauma.AnimationType
---@return System.String
_G['AnimationParams'].GetDefaultFileName = function(speciesName, animType) end

---`Method Public Static`
---@param speciesName Barotrauma.Identifier
---@param animType Barotrauma.AnimationType
---@return System.String
_G['AnimationParams'].GetDefaultFilePath = function(speciesName, animType) end

---`Method Public Static`
---@param speciesName Barotrauma.Identifier
---@return System.String
_G['AnimationParams'].GetFolder = function(speciesName) end

---`Method Private Static`
---@param root Barotrauma.ContentXElement
---@param filePath System.String
---@return System.String
_G['AnimationParams'].GetFolder = function(root, filePath) end

---`Method Public Static`
---@param filePaths (System.Collections.Generic.IEnumerable*1System*String)|(fun():(System.String))
---@param type Barotrauma.AnimationType
---@return (System.Collections.Generic.IEnumerable*1System*String)|(fun():(System.String))
_G['AnimationParams'].FilterAndSortFiles = function(filePaths, type) end

---`Method NonPublic Static`
---@param character Barotrauma.Character
---@param animType Barotrauma.AnimationType
---@return Barotrauma.AnimationParams.T
_G['AnimationParams'].GetDefaultAnimParams = function(character, animType) end

---`Method NonPublic Static`
---@param character Barotrauma.Character
---@param animType Barotrauma.AnimationType
---@param file Barotrauma.Either*1System*String*1Barotrauma*ContentPath
---@param throwErrors? System.Boolean
---@return Barotrauma.AnimationParams.T
_G['AnimationParams'].GetAnimParams = function(character, animType, file, throwErrors) end

---`Method Private Static`
---@param speciesName Barotrauma.Identifier
---@param animSpecies Barotrauma.Identifier
---@param fallbackSpecies Barotrauma.Identifier
---@param animType Barotrauma.AnimationType
---@param file Barotrauma.Either*1System*String*1Barotrauma*ContentPath
---@param throwErrors? System.Boolean
---@return Barotrauma.AnimationParams.T
_G['AnimationParams'].GetAnimParams = function(speciesName, animSpecies, fallbackSpecies, animType, file, throwErrors) end

---`Method Public Static`
_G['AnimationParams'].ClearCache = function() end

---`Method Public Static`
---@overload fun(fullPath:System.String, speciesName:Barotrauma.Identifier, animationType:Barotrauma.AnimationType, animationParamsType:System.Type):(Barotrauma.AnimationParams)
---@param fullPath System.String
---@param speciesName Barotrauma.Identifier
---@param animationType Barotrauma.AnimationType
---@return Barotrauma.AnimationParams.T
_G['AnimationParams'].Create = function(fullPath, speciesName, animationType) end

---`Method Public Instance`
---@return System.Boolean
_G['AnimationParams'].Serialize = function() end

---`Method Public Instance`
---@return System.Boolean
_G['AnimationParams'].Deserialize = function() end

---`Method NonPublic Instance`
---@param file Barotrauma.ContentPath
---@param speciesName Barotrauma.Identifier
---@return System.Boolean
_G['AnimationParams'].Load = function(file, speciesName) end

---`Method NonPublic Instance Virtual`
---@param newPath Barotrauma.ContentPath
_G['AnimationParams'].UpdatePath = function(newPath) end

---`Method NonPublic Static`
---@param footAngles (System.Collections.Generic.Dictionary*1System*Int32*1System*Single)|({[System.Int32]:(System.Single)})
---@return System.String
_G['AnimationParams'].ParseFootAngles = function(footAngles) end

---`Method NonPublic Static`
---@param footAngles (System.Collections.Generic.Dictionary*1System*Int32*1System*Single)|({[System.Int32]:(System.Single)})
---@param value System.String
_G['AnimationParams'].SetFootAngles = function(footAngles, value) end

---`Method Public Static`
---@param type Barotrauma.AnimationType
---@param isHumanoid System.Boolean
---@return System.Type
_G['AnimationParams'].GetParamTypeFromAnimType = function(type, isHumanoid) end

---`Method Public Instance Abstract Virtual`
_G['AnimationParams'].StoreSnapshot = function() end

---`Method NonPublic Instance`
_G['AnimationParams'].StoreSnapshot = function() end

---`Method Public Instance Virtual`
_G['AnimationParams'].Undo = function() end

---`Method Public Instance Virtual`
_G['AnimationParams'].Redo = function() end

---`Method Public Instance Virtual`
_G['AnimationParams'].ClearHistory = function() end

---`Constructor NonPublic Instance`
---@overload fun():Barotrauma.AnimationParams
---@return Barotrauma.AnimationParams
_G['AnimationParams'] = function() end

---`Constructor NonPublic Instance`
---@overload fun():Barotrauma.AnimationParams
---@return Barotrauma.AnimationParams
_G['AnimationParams'].__new = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.AnimationParams
---@return Barotrauma.AnimationParams
_G['AnimationParams'] = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.AnimationParams
---@return Barotrauma.AnimationParams
_G['AnimationParams'].__new = function() end

