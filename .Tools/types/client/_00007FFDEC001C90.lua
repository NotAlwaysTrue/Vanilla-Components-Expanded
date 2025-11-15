---@meta
---@class Barotrauma.MapEntity : Barotrauma.Entity
---`Field Private Instance`
---@field Resized (System.Action*1Microsoft*Xna*Framework*Rectangle)|(fun(obj:Microsoft.Xna.Framework.Rectangle))
---`Field Private Instance`
---@field resizeDirX System.Int32
---`Field Private Instance`
---@field resizeDirY System.Int32
---`Field Private Instance`
---@field prevRect System.Nullable*1Microsoft*Xna*Framework*Rectangle
---`Field Public Instance`
---@field ReplacedBy Barotrauma.MapEntity
---`Field Public Instance`
---@field Prefab Barotrauma.MapEntityPrefab
---`Field NonPublic Instance`
---@field linkedToID (System.Collections.Generic.List*1System*UInt16)|(System.UInt16[])
---`Field Public Instance`
---@field unresolvedLinkedToID (System.Collections.Generic.List*1System*UInt16)|(System.UInt16[])
---`Field NonPublic Instance`
---@field Upgrades (System.Collections.Generic.List*1Barotrauma*Upgrade)|(Barotrauma.Upgrade[])
---`Field Public Instance`
---@field DisallowedUpgradeSet (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Public Instance`
---@field linkedTo (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---`Field Public Instance`
---@field ShouldBeSaved System.Boolean
---`Field NonPublic Instance`
---@field rect Microsoft.Xna.Framework.Rectangle
---`Field Private Instance`
---@field externalHighlight System.Boolean
---`Field Private Instance`
---@field isHighlighted System.Boolean
---`Field Private Instance`
---@field _spriteOverrideDepth System.Single
---`Field Public Instance`
---@field OriginalModuleIndex System.Int32
---`Field Public Instance`
---@field OriginalContainerIndex System.Int32
---`Field Private Instance`
---@field mapLoadedCalled System.Boolean
---`Field NonPublic Static`
---@field selectionPos Microsoft.Xna.Framework.Vector2
---`Field NonPublic Static`
---@field selectionSize Microsoft.Xna.Framework.Vector2
---`Field Private Static`
---@field startMovingPos Microsoft.Xna.Framework.Vector2
---`Field Private Static`
---@field keyDelay System.Single
---`Field Public Static`
---@field SelectionChanged System.Boolean
---`Field Public Static`
---@field CopiedList (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---`Field Private Static`
---@field highlightedInEditorList (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---`Field Private Static`
---@field highlightTimer System.Single
---`Field Private Static`
---@field highlightedListBox Barotrauma.GUIListBox
---`Field NonPublic Static`
---@field editingHUD Barotrauma.GUIComponent
---`Field Private Static`
---@field disableSelect System.Boolean
---`Field Public Static`
---@field MapEntityList (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---`Field Public Static`
---@field MapEntityUpdateInterval System.Int32
---`Field Public Static`
---@field PoweredUpdateInterval System.Int32
---`Field Private Static`
---@field mapEntityUpdateTick System.Int32
---`Field NonPublic Static`
---@field highlightedEntities (System.Collections.Generic.HashSet*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---`Field Private Static`
---@field tempHighlightedEntities (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---`Getter Public Static`
---@field StartMovingPos Microsoft.Xna.Framework.Vector2
---`Getter Public Static`
---@field SelectionPos Microsoft.Xna.Framework.Vector2
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field Resizing System.Boolean
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field SelectedList (System.Collections.Generic.HashSet*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---`Getter Public Static`
---@field HighlightedListBox Barotrauma.GUIListBox
---`Getter Public Static`
---@field EditingHUD Barotrauma.GUIComponent
---`Getter Public Static`
---<br/>`Setter Public Static`
---@field DisableSelect System.Boolean
---`Getter Public Instance Virtual`
---@field SelectableInEditor System.Boolean
---`Getter Public Static`
---@field SelectedAny System.Boolean
---`Getter Public Instance`
---@field IsSelected System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsIncludedInSelection System.Boolean
---`Getter Public Static`
---<br/>`Setter Private Static`
---@field FilteredSelectedList (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---`Getter Private Instance`
---@field ResizeHandleSize System.Single
---`Getter Private Instance`
---@field ResizeHandleHighlightDistance System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DisallowedUpgrades System.String
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field FlippedX System.Boolean
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field FlippedY System.Boolean
---`Getter Public Static`
---@field HighlightedEntities (System.Collections.Generic.IEnumerable*1Barotrauma*MapEntity)|(fun():(Barotrauma.MapEntity))
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field ExternalHighlight System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsHighlighted System.Boolean
---`Getter Public Instance Virtual`
---<br/>`Setter NonPublic Instance Virtual`
---@field RotationRad System.Single
---`Getter Public Instance`
---@field RotationRadWithFlipping System.Single
---`Getter Public Instance`
---@field RotationWithFlipping System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Rect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance`
---@field WorldRect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance Virtual`
---@field Sprite Barotrauma.Sprite
---`Getter Public Instance Virtual`
---@field DrawBelowWater System.Boolean
---`Getter Public Instance Virtual`
---@field DrawOverWater System.Boolean
---`Getter Public Instance Virtual`
---@field Linkable System.Boolean
---`Getter Public Instance`
---@field AllowedLinks (System.Collections.Generic.IEnumerable*1Barotrauma*Identifier)|(fun():(Barotrauma.Identifier))
---`Getter Public Instance`
---@field ResizeHorizontal System.Boolean
---`Getter Public Instance`
---@field ResizeVertical System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RectWidth System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RectHeight System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field SpriteDepthOverrideIsSet System.Boolean
---`Getter Public Instance`
---@field SpriteOverrideDepth System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SpriteDepth System.Single
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field Scale System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field HiddenInGame System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IsLayerHidden System.Boolean
---`Getter Public Instance`
---@field IsHidden System.Boolean
---`Getter Public Instance Virtual`
---@field Position Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field SimPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SoundRange System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field SightRange System.Single
---`Getter Public Instance`
---<br/>`Setter NonPublic Instance`
---@field RemoveIfLinkedOutpostDoorInUse System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Layer System.String
---`Getter Public Instance Virtual`
---@field Name System.String
_G['MapEntity'] = {}

---`Method Public Instance Virtual`
---@param worldView Microsoft.Xna.Framework.Rectangle
---@return System.Boolean
_G['MapEntity'].IsVisible = function(worldView) end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param editing System.Boolean
---@param back? System.Boolean
_G['MapEntity'].Draw = function(spriteBatch, editing, back) end

---`Method Public Instance Virtual`
---@return System.Single
_G['MapEntity'].GetDrawDepth = function() end

---`Method Public Instance`
---@param baseDepth System.Single
---@param sprite Barotrauma.Sprite
---@return System.Single
_G['MapEntity'].GetDrawDepth = function(baseDepth, sprite) end

---`Method NonPublic Instance`
---@return Microsoft.Xna.Framework.Vector2
_G['MapEntity'].GetCollapseEffectOffset = function() end

---`Method Public Static`
---@param cam Barotrauma.Camera
_G['MapEntity'].UpdateSelecting = function(cam) end

---`Method Public Static`
_G['MapEntity'].StopSelection = function() end

---`Method Public Static`
---@param doHold? System.Boolean
---@return Microsoft.Xna.Framework.Vector2
_G['MapEntity'].GetNudgeAmount = function(doHold) end

---`Method Public Instance`
---@return Barotrauma.MapEntity
_G['MapEntity'].GetReplacementOrThis = function() end

---`Method Public Static`
---@param position Microsoft.Xna.Framework.Vector2
---@param entities? (System.Collections.Generic.HashSet*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---@return Barotrauma.Item
_G['MapEntity'].GetPotentialContainer = function(position, entities) end

---`Method Public Static`
---@param highlightedEntities (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---@param wiringMode? System.Boolean
_G['MapEntity'].UpdateHighlighting = function(highlightedEntities, wiringMode) end

---`Method Private Static`
---@param highlightedEntities (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---@param wiringMode System.Boolean
_G['MapEntity'].UpdateHighlightedListBox = function(highlightedEntities, wiringMode) end

---`Method Public Static`
---@param entity Barotrauma.MapEntity
_G['MapEntity'].AddSelection = function(entity) end

---`Method Private Static`
---@param entity Barotrauma.MapEntity
---@param onGapFound (System.Action*1Barotrauma*Items*Components*Door*1Barotrauma*Gap)|(fun(arg1:Barotrauma.Items.Components.Door, arg2:Barotrauma.Gap))
---@param onDoorFound (System.Action*1Barotrauma*Items*Components*Door*1Barotrauma*Gap)|(fun(arg1:Barotrauma.Items.Components.Door, arg2:Barotrauma.Gap))
_G['MapEntity'].HandleDoorGapLinks = function(entity, onGapFound, onDoorFound) end

---`Method Public Static`
---@param entity Barotrauma.MapEntity
_G['MapEntity'].RemoveSelection = function(entity) end

---`Method Public Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['MapEntity'].DrawSelecting = function(spriteBatch, cam) end

---`Method Public Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param pos Microsoft.Xna.Framework.Vector2
---@param size Microsoft.Xna.Framework.Vector2
---@param color Microsoft.Xna.Framework.Color
_G['MapEntity'].DrawSelectionRect = function(spriteBatch, pos, size, color) end

---`Method NonPublic Static`
---@param btn Barotrauma.GUIButton
---@param flip System.Boolean
_G['MapEntity'].ColorFlipButton = function(btn, flip) end

---`Method Public Static`
---@param cam Barotrauma.Camera
---@param deltaTime System.Single
_G['MapEntity'].UpdateEditor = function(cam, deltaTime) end

---`Method Public Static`
_G['MapEntity'].ResetEditingHUD = function() end

---`Method Public Static`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['MapEntity'].DrawEditor = function(spriteBatch, cam) end

---`Method Public Static`
_G['MapEntity'].DeselectAll = function() end

---`Method Public Static`
---@param entity Barotrauma.MapEntity
_G['MapEntity'].SelectEntity = function(entity) end

---`Method Public Static`
---@param entities (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
_G['MapEntity'].Copy = function(entities) end

---`Method Public Static`
---@param entities (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
_G['MapEntity'].Cut = function(entities) end

---`Method Public Static`
---@param position Microsoft.Xna.Framework.Vector2
_G['MapEntity'].Paste = function(position) end

---`Method Public Static`
---@param entities (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---@return (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
_G['MapEntity'].CopyEntities = function(entities) end

---`Method Public Instance Virtual`
---@param order? System.Int32
_G['MapEntity'].AddToGUIUpdateList = function(order) end

---`Method Public Instance Virtual`
---@param cam Barotrauma.Camera
---@param deltaTime System.Single
_G['MapEntity'].UpdateEditing = function(cam, deltaTime) end

---`Method NonPublic Static`
_G['MapEntity'].PositionEditingHUD = function() end

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['MapEntity'].DrawEditing = function(spriteBatch, cam) end

---`Method Private Instance`
---@param x System.Int32
---@param y System.Int32
---@param cam Barotrauma.Camera
---@return Microsoft.Xna.Framework.Vector2
_G['MapEntity'].GetEditingHandlePos = function(x, y, cam) end

---`Method Private Instance`
---@param cam Barotrauma.Camera
_G['MapEntity'].UpdateResizing = function(cam) end

---`Method Private Instance`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param cam Barotrauma.Camera
_G['MapEntity'].DrawResizing = function(spriteBatch, cam) end

---`Method Public Static`
---@param pos Microsoft.Xna.Framework.Vector2
---@param size Microsoft.Xna.Framework.Vector2
---@return (System.Collections.Generic.HashSet*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
_G['MapEntity'].FindSelectedEntities = function(pos, size) end

---`Method Public Instance`
---@param entity Barotrauma.MapEntity
_G['MapEntity'].AddLinked = function(entity) end

---`Method NonPublic Instance`
---@param element System.Xml.Linq.XElement
---@param idRemap Barotrauma.IdRemap
_G['MapEntity'].ParseLinks = function(element, idRemap) end

---`Method Public Instance`
---@param childRemap Barotrauma.IdRemap
_G['MapEntity'].ResolveLinks = function(childRemap) end

---`Method Public Instance Virtual`
---@param amount Microsoft.Xna.Framework.Vector2
---@param ignoreContacts? System.Boolean
_G['MapEntity'].Move = function(amount, ignoreContacts) end

---`Method Public Instance Virtual`
---@param position Microsoft.Xna.Framework.Vector2
---@return System.Boolean
_G['MapEntity'].IsMouseOn = function(position) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@return System.Boolean
_G['MapEntity'].HasUpgrade = function(identifier) end

---`Method Public Instance`
---@param identifier Barotrauma.Identifier
---@return Barotrauma.Upgrade
_G['MapEntity'].GetUpgrade = function(identifier) end

---`Method Public Instance`
---@return (System.Collections.Generic.List*1Barotrauma*Upgrade)|(Barotrauma.Upgrade[])
_G['MapEntity'].GetUpgrades = function() end

---`Method Public Instance`
---@param upgrade Barotrauma.Upgrade
---@param createNetworkEvent? System.Boolean
_G['MapEntity'].SetUpgrade = function(upgrade, createNetworkEvent) end

---`Method Public Instance Virtual`
---@param upgrade Barotrauma.Upgrade
---@param createNetworkEvent? System.Boolean
---@return System.Boolean
_G['MapEntity'].AddUpgrade = function(upgrade, createNetworkEvent) end

---`Method NonPublic Instance Virtual`
_G['MapEntity'].CheckIsHighlighted = function() end

---`Method Public Static`
_G['MapEntity'].ClearHighlightedEntities = function() end

---`Method Public Instance Abstract Virtual`
---@return Barotrauma.MapEntity
_G['MapEntity'].Clone = function() end

---`Method Public Static`
---@param entitiesToClone (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---@return (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
_G['MapEntity'].Clone = function(entitiesToClone) end

---`Method NonPublic Instance`
_G['MapEntity'].InsertToList = function() end

---`Method Public Instance Virtual`
_G['MapEntity'].ShallowRemove = function() end

---`Method Public Instance Virtual`
_G['MapEntity'].Remove = function() end

---`Method Public Static`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['MapEntity'].UpdateAll = function(deltaTime, cam) end

---`Method Private Static`
---@param deltaTime System.Single
_G['MapEntity'].UpdateAllProjSpecific = function(deltaTime) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['MapEntity'].Update = function(deltaTime, cam) end

---`Method Public Instance Virtual`
---@param relativeToSub System.Boolean
---@param force? System.Boolean
_G['MapEntity'].FlipX = function(relativeToSub, force) end

---`Method Public Instance Virtual`
---@param relativeToSub System.Boolean
---@param force? System.Boolean
_G['MapEntity'].FlipY = function(relativeToSub, force) end

---`Method Public Instance Virtual`
---@return Barotrauma.Quad2D
_G['MapEntity'].GetTransformedQuad = function() end

---`Method Public Static`
---@param submarine Barotrauma.Submarine
---@param parentElement System.Xml.Linq.XElement
---@param filePath System.String
---@param idOffset System.Int32
---@return (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
_G['MapEntity'].LoadAll = function(submarine, parentElement, filePath, idOffset) end

---`Method Public Static`
---@param entities (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
---@param updateHulls System.Boolean
_G['MapEntity'].MapLoaded = function(entities, updateHulls) end

---`Method Private Static`
---@param entities (System.Collections.Generic.List*1Barotrauma*MapEntity)|(Barotrauma.MapEntity[])
_G['MapEntity'].CreateDroppedStacks = function(entities) end

---`Method Public Static`
---@param entities (System.Collections.Generic.IEnumerable*1Barotrauma*MapEntity)|(fun():(Barotrauma.MapEntity))
_G['MapEntity'].InitializeLoadedLinks = function(entities) end

---`Method Public Instance Virtual`
_G['MapEntity'].OnMapLoaded = function() end

---`Method Public Instance Virtual`
---@param parentElement System.Xml.Linq.XElement
---@return System.Xml.Linq.XElement
_G['MapEntity'].Save = function(parentElement) end

---`Method Public Instance`
---@param e Barotrauma.MapEntity
_G['MapEntity'].RemoveLinked = function(e) end

---`Method Public Instance`
---@param list? (System.Collections.Generic.HashSet*1Barotrauma*MapEntity*T)|(Barotrauma.MapEntity.T[])
---@param maxDepth? System.Nullable*1System*Int32
---@param filter? (System.Func*1Barotrauma*MapEntity*T*1System*Boolean)|(fun(arg:Barotrauma.MapEntity.T):(System.Boolean))
---@return (System.Collections.Generic.HashSet*1Barotrauma*MapEntity*T)|(Barotrauma.MapEntity.T[])
_G['MapEntity'].GetLinkedEntities = function(list, maxDepth, filter) end

---`Method Private Static`
---@param mapEntity Barotrauma.MapEntity
---@param linkedTargets (System.Collections.Generic.HashSet*1Barotrauma*MapEntity*T)|(Barotrauma.MapEntity.T[])
---@param depth System.Int32-ref
---@param maxDepth? System.Nullable*1System*Int32
---@param filter? (System.Func*1Barotrauma*MapEntity*T*1System*Boolean)|(fun(arg:Barotrauma.MapEntity.T):(System.Boolean))
_G['MapEntity'].GetLinkedEntitiesRecursive = function(mapEntity, linkedTargets, depth, maxDepth, filter) end

---`Constructor Public Instance`
---@overload fun(prefab:Barotrauma.MapEntityPrefab, submarine:Barotrauma.Submarine, id:System.UInt16):Barotrauma.MapEntity
---@return Barotrauma.MapEntity
_G['MapEntity'] = function() end

---`Constructor Public Instance`
---@overload fun(prefab:Barotrauma.MapEntityPrefab, submarine:Barotrauma.Submarine, id:System.UInt16):Barotrauma.MapEntity
---@return Barotrauma.MapEntity
_G['MapEntity'].__new = function() end

---`Constructor Private Static`
---@overload fun(prefab:Barotrauma.MapEntityPrefab, submarine:Barotrauma.Submarine, id:System.UInt16):Barotrauma.MapEntity
---@return Barotrauma.MapEntity
_G['MapEntity'] = function() end

---`Constructor Private Static`
---@overload fun(prefab:Barotrauma.MapEntityPrefab, submarine:Barotrauma.Submarine, id:System.UInt16):Barotrauma.MapEntity
---@return Barotrauma.MapEntity
_G['MapEntity'].__new = function() end

