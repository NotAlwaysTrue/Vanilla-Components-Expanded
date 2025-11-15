---@meta
---@class Barotrauma.RagdollParams : Barotrauma.EditableParams
---`Field Private Instance`
---@field limbScale System.Single
---`Field Private Instance`
---@field jointScale System.Single
---`Field Private Instance`
---@field isVariantScaleApplied System.Boolean
---`Field Private Static`
---@field allRagdolls (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1System*Collections*Generic*Dictionary*2System*String*2Barotrauma*RagdollParams)|({[Barotrauma.Identifier]:((System.Collections.Generic.Dictionary*1System*String*1Barotrauma*RagdollParams)|({[System.String]:(Barotrauma.RagdollParams)}))})
---`Field Public Static`
---@field MIN_SCALE System.Single
---`Field Public Static`
---@field MAX_SCALE System.Single
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpeciesName Barotrauma.Identifier
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Texture System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Color Microsoft.Xna.Framework.Color
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpritesheetOrientation System.Single
---`Getter Public Instance`
---@field IsSpritesheetOrientationHorizontal System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field LimbScale System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field JointScale System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TextureScale System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SourceRectScale System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ColliderHeightFromFloor System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ImpactTolerance System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CanEnterSubmarine Barotrauma.CanEnterSubmarine
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field CanWalk System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Draggable System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MainLimb Barotrauma.LimbType
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Colliders (System.Collections.Generic.List*1Barotrauma*RagdollParams*ColliderParams)|(Barotrauma.RagdollParams.ColliderParams[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Limbs (System.Collections.Generic.List*1Barotrauma*RagdollParams*LimbParams)|(Barotrauma.RagdollParams.LimbParams[])
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Joints (System.Collections.Generic.List*1Barotrauma*RagdollParams*JointParams)|(Barotrauma.RagdollParams.JointParams[])
---`Getter Public Instance Virtual`
---<br/>`Setter NonPublic Instance`
---@field Memento Barotrauma.Memento*1Barotrauma*RagdollParams
_G['RagdollParams'] = {}

---`Method NonPublic Instance`
---@return (System.Collections.Generic.IEnumerable*1Barotrauma*RagdollParams*SubParam)|(fun():(Barotrauma.RagdollParams.SubParam))
_G['RagdollParams'].GetAllSubParams = function() end

---`Method Public Static`
---@param speciesName Barotrauma.Identifier
---@return System.String
_G['RagdollParams'].GetDefaultFileName = function(speciesName) end

---`Method Public Static`
---@param speciesName Barotrauma.Identifier
---@return System.String
_G['RagdollParams'].GetDefaultFile = function(speciesName) end

---`Method Public Static`
---@param speciesName Barotrauma.Identifier
---@return System.String
_G['RagdollParams'].GetFolder = function(speciesName) end

---`Method Private Static`
---@param root Barotrauma.ContentXElement
---@param filePath System.String
---@return System.String
_G['RagdollParams'].GetFolder = function(root, filePath) end

---`Method Public Static`
---@overload fun(character:Barotrauma.Character):(Barotrauma.RagdollParams.T)
---@overload fun(speciesName:Barotrauma.Identifier, characterParams:Barotrauma.CharacterParams, contentPackage:Barotrauma.ContentPackage):(Barotrauma.RagdollParams.T)
---@param speciesName Barotrauma.Identifier
---@param characterRootElement System.Xml.Linq.XElement
---@param contentPackage Barotrauma.ContentPackage
---@return Barotrauma.RagdollParams.T
_G['RagdollParams'].GetDefaultRagdollParams = function(speciesName, characterRootElement, contentPackage) end

---`Method Public Static`
---@param speciesName Barotrauma.Identifier
---@param ragdollSpecies Barotrauma.Identifier
---@param file Barotrauma.Either*1System*String*1Barotrauma*ContentPath
---@param contentPackage Barotrauma.ContentPackage
---@return Barotrauma.RagdollParams.T
_G['RagdollParams'].GetRagdollParams = function(speciesName, ragdollSpecies, file, contentPackage) end

---`Method Public Static`
---@param fullPath System.String
---@param speciesName Barotrauma.Identifier
---@param mainElement System.Xml.Linq.XElement
---@return Barotrauma.RagdollParams.T
_G['RagdollParams'].CreateDefault = function(fullPath, speciesName, mainElement) end

---`Method Public Static`
_G['RagdollParams'].ClearCache = function() end

---`Method NonPublic Instance Virtual`
---@param fullPath Barotrauma.ContentPath
_G['RagdollParams'].UpdatePath = function(fullPath) end

---`Method Public Instance`
---@param fileNameWithoutExtension? System.String
---@return System.Boolean
_G['RagdollParams'].Save = function(fileNameWithoutExtension) end

---`Method NonPublic Instance`
---@param file Barotrauma.ContentPath
---@param speciesName Barotrauma.Identifier
---@return System.Boolean
_G['RagdollParams'].Load = function(file, speciesName) end

---`Method Public Instance`
_G['RagdollParams'].Apply = function() end

---`Method Public Instance Virtual`
---@param forceReload? System.Boolean
---@return System.Boolean
_G['RagdollParams'].Reset = function(forceReload) end

---`Method NonPublic Instance`
_G['RagdollParams'].CreateColliders = function() end

---`Method NonPublic Instance`
_G['RagdollParams'].CreateLimbs = function() end

---`Method NonPublic Instance`
_G['RagdollParams'].CreateJoints = function() end

---`Method Public Instance`
---@param element? System.Xml.Linq.XElement
---@param alsoChildren? System.Boolean
---@param recursive? System.Boolean
---@return System.Boolean
_G['RagdollParams'].Deserialize = function(element, alsoChildren, recursive) end

---`Method Public Instance`
---@param element? System.Xml.Linq.XElement
---@param alsoChildren? System.Boolean
---@param recursive? System.Boolean
---@return System.Boolean
_G['RagdollParams'].Serialize = function(element, alsoChildren, recursive) end

---`Method Public Instance`
---@param variantFile System.Xml.Linq.XDocument
_G['RagdollParams'].TryApplyVariantScale = function(variantFile) end

---`Method Public Instance Virtual`
_G['RagdollParams'].StoreSnapshot = function() end

---`Method Public Instance Virtual`
_G['RagdollParams'].Undo = function() end

---`Method Public Instance Virtual`
_G['RagdollParams'].Redo = function() end

---`Method Public Instance Virtual`
_G['RagdollParams'].ClearHistory = function() end

---`Method Private Instance`
---@param source Barotrauma.RagdollParams
_G['RagdollParams'].RevertTo = function(source) end

---`Constructor Public Instance`
---@overload fun():Barotrauma.RagdollParams
---@return Barotrauma.RagdollParams
_G['RagdollParams'] = function() end

---`Constructor Public Instance`
---@overload fun():Barotrauma.RagdollParams
---@return Barotrauma.RagdollParams
_G['RagdollParams'].__new = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.RagdollParams
---@return Barotrauma.RagdollParams
_G['RagdollParams'] = function() end

---`Constructor Private Static`
---@overload fun():Barotrauma.RagdollParams
---@return Barotrauma.RagdollParams
_G['RagdollParams'].__new = function() end

