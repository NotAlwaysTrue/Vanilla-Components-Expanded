---@meta
---@class Barotrauma.ItemAssemblyPrefab : Barotrauma.MapEntityPrefab
---`Field Private Instance`
---@field configElement System.Xml.Linq.XElement
---`Field Public Instance`
---@field DisplayEntities (System.Collections.Immutable.ImmutableArray*1Barotrauma*ItemAssemblyPrefab*DisplayEntity)|(Barotrauma.ItemAssemblyPrefab.DisplayEntity[])
---`Field Public Instance`
---@field Bounds Microsoft.Xna.Framework.Rectangle
---`Field Public Static`
---@field Prefabs (Barotrauma.PrefabCollection*1Barotrauma*ItemAssemblyPrefab)|(fun():(Barotrauma.ItemAssemblyPrefab))
---`Getter Public Instance Virtual`
---@field Name Barotrauma.LocalizedString
---`Getter Public Instance Virtual`
---@field Sprite Barotrauma.Sprite
---`Getter Public Instance Virtual`
---@field OriginalName System.String
---`Getter Public Instance Virtual`
---@field Tags (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance Virtual`
---@field AllowedLinks (System.Collections.Immutable.ImmutableHashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Getter Public Instance Virtual`
---@field Category Barotrauma.MapEntityCategory
---`Getter Public Instance Virtual`
---@field Aliases (System.Collections.Immutable.ImmutableHashSet*1System*String)|(System.String[])
_G['ItemAssemblyPrefab'] = {}

---`Method NonPublic Instance Virtual`
---@param element System.Xml.Linq.XElement
---@return Barotrauma.Identifier
_G['ItemAssemblyPrefab'].DetermineIdentifier = function(element) end

---`Method NonPublic Instance Virtual`
---@param rect Microsoft.Xna.Framework.Rectangle
_G['ItemAssemblyPrefab'].CreateInstance = function(rect) end

---`Method Public Instance`
---@param position Microsoft.Xna.Framework.Vector2
---@param sub Barotrauma.Submarine
---@param selectInstance? System.Boolean
---@return (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
_G['ItemAssemblyPrefab'].CreateInstance = function(position, sub, selectInstance) end

---`Method Public Static`
---@param position Microsoft.Xna.Framework.Vector2
---@param sub Barotrauma.Submarine
---@param configElement System.Xml.Linq.XElement
---@param filePath? System.String
---@param selectInstance? System.Boolean
---@return (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
_G['ItemAssemblyPrefab'].PasteEntities = function(position, sub, configElement, filePath, selectInstance) end

---`Method Public Instance`
_G['ItemAssemblyPrefab'].Delete = function() end

---`Method Public Instance Virtual`
_G['ItemAssemblyPrefab'].Dispose = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.ItemAssemblyFile):Barotrauma.ItemAssemblyPrefab
---@return Barotrauma.ItemAssemblyPrefab
_G['ItemAssemblyPrefab'] = function() end

---`Constructor Public Instance`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.ItemAssemblyFile):Barotrauma.ItemAssemblyPrefab
---@return Barotrauma.ItemAssemblyPrefab
_G['ItemAssemblyPrefab'].__new = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.ItemAssemblyFile):Barotrauma.ItemAssemblyPrefab
---@return Barotrauma.ItemAssemblyPrefab
_G['ItemAssemblyPrefab'] = function() end

---`Constructor Private Static`
---@overload fun(element:Barotrauma.ContentXElement, file:Barotrauma.ItemAssemblyFile):Barotrauma.ItemAssemblyPrefab
---@return Barotrauma.ItemAssemblyPrefab
_G['ItemAssemblyPrefab'].__new = function() end

