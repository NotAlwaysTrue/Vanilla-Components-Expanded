---@meta
---@class Barotrauma.SerializableEntityEditor : Barotrauma.GUIComponent
---`Field Private Instance`
---@field elementHeight System.Int32
---`Field Private Instance`
---@field layoutGroup Barotrauma.GUILayoutGroup
---`Field Private Instance`
---@field inputFieldWidth System.Single
---`Field Private Instance`
---@field largeInputFieldWidth System.Single
---`Field Private Instance`
---@field isReadonly System.Boolean
---`Field Private Instance`
---@field refresh (System.Action)|(fun())
---`Field Public Static`
---@field MissingLocalizations (System.Collections.Generic.List*1System*String)|(System.String[])
---`Field Public Static`
---@field LockEditing System.Boolean
---`Field Public Static`
---@field PropertyChangesActive System.Boolean
---`Field Public Static`
---@field NextCommandPush System.DateTime
---`Field Public Static`
---@field CommandBuffer System.Tuple*1Barotrauma*SerializableProperty*1Barotrauma*PropertyCommand
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Readonly System.Boolean
---`Getter Public Instance`
---@field ContentHeight System.Int32
---`Getter Public Instance`
---@field ContentCount System.Int32
---`Getter Public Instance`
---<br/>`Setter Private Instance`
---@field Fields (System.Collections.Generic.Dictionary*1Barotrauma*Identifier*1Barotrauma*GUIComponent-arr)|({[Barotrauma.Identifier]:((Barotrauma.GUIComponent-arr)|(Barotrauma.GUIComponent[]))})
_G['SerializableEntityEditor'] = {}

---`Method Public Instance`
---@param property Barotrauma.SerializableProperty
---@param newValue System.Object
---@param flash? System.Boolean
_G['SerializableEntityEditor'].UpdateValue = function(property, newValue, flash) end

---`Method Public Instance`
---@param component Barotrauma.GUIComponent
---@param childIndex System.Int32
_G['SerializableEntityEditor'].AddCustomContent = function(component, childIndex) end

---`Method Public Instance`
_G['SerializableEntityEditor'].RefreshValues = function() end

---`Method Public Instance`
_G['SerializableEntityEditor'].Recalculate = function() end

---`Method Public Instance`
---@param property Barotrauma.SerializableProperty
---@param entity Barotrauma.ISerializableEntity
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateNewField = function(property, entity) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value System.Boolean
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateBoolField = function(entity, property, value, displayName, toolTip) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value System.Int32
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateIntField = function(entity, property, value, displayName, toolTip) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value System.Single
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateFloatField = function(entity, property, value, displayName, toolTip) end

---`Method Private Static`
---@param numberInput Barotrauma.GUINumberInput
---@param getter (System.Func*1System*Single)|(fun():(System.Single))
_G['SerializableEntityEditor'].HandleSetterValueTampering = function(numberInput, getter) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value System.Object
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateEnumField = function(entity, property, value, displayName, toolTip) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value System.Object
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateEnumFlagField = function(entity, property, value, displayName, toolTip) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value System.String
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateStringField = function(entity, property, value, displayName, toolTip) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value Microsoft.Xna.Framework.Point
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreatePointField = function(entity, property, value, displayName, toolTip) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value Microsoft.Xna.Framework.Vector2
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateVector2Field = function(entity, property, value, displayName, toolTip) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value Microsoft.Xna.Framework.Vector3
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateVector3Field = function(entity, property, value, displayName, toolTip) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value Microsoft.Xna.Framework.Vector4
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateVector4Field = function(entity, property, value, displayName, toolTip) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value Microsoft.Xna.Framework.Color
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateColorField = function(entity, property, value, displayName, toolTip) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value Microsoft.Xna.Framework.Rectangle
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateRectangleField = function(entity, property, value, displayName, toolTip) end

---`Method Public Instance`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param value (System.String-arr)|(System.String[])
---@param displayName Barotrauma.LocalizedString
---@param toolTip Barotrauma.LocalizedString
---@return Barotrauma.GUIComponent
_G['SerializableEntityEditor'].CreateStringArrayField = function(entity, property, value, displayName, toolTip) end

---`Method Public Instance`
---@param textTag System.String
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
---@param textBox Barotrauma.GUITextBox
_G['SerializableEntityEditor'].CreateTextPicker = function(textTag, entity, property, textBox) end

---`Method Private Static`
---@param entity Barotrauma.ISerializableEntity
---@param property Barotrauma.SerializableProperty
_G['SerializableEntityEditor'].TrySendNetworkUpdate = function(entity, property) end

---`Method Private Instance`
---@param property Barotrauma.SerializableProperty
---@param entity System.Object
---@param value System.Object
---@return System.Boolean
_G['SerializableEntityEditor'].SetPropertyValue = function(property, entity, value) end

---`Method Public Static`
---@param entity System.Object
---@return System.Boolean
_G['SerializableEntityEditor'].IsEntityRemoved = function(entity) end

---`Method Public Static`
_G['SerializableEntityEditor'].CommitCommandBuffer = function() end

---`Method Private Instance`
---@param property Barotrauma.SerializableProperty
---@param parentObject System.Object
---@param value System.Object
---@return (System.Collections.Generic.Dictionary*1Barotrauma*ISerializableEntity*1System*Object)|({[Barotrauma.ISerializableEntity]:(System.Object)})
_G['SerializableEntityEditor'].MultiSetProperties = function(property, parentObject, value) end

---`Constructor Public Instance`
---@overload fun(parent:Barotrauma.RectTransform, entity:Barotrauma.ISerializableEntity, inGame:System.Boolean, showName:System.Boolean, style?:System.String, elementHeight?:System.Int32, titleFont?:Barotrauma.GUIFont):Barotrauma.SerializableEntityEditor
---@overload fun(parent:Barotrauma.RectTransform, entity:Barotrauma.ISerializableEntity, properties:(System.Collections.Generic.IEnumerable*1Barotrauma*SerializableProperty)|(fun():(Barotrauma.SerializableProperty)), showName:System.Boolean, style?:System.String, elementHeight?:System.Int32, titleFont?:Barotrauma.GUIFont):Barotrauma.SerializableEntityEditor
---@return Barotrauma.SerializableEntityEditor
_G['SerializableEntityEditor'] = function() end

---`Constructor Public Instance`
---@overload fun(parent:Barotrauma.RectTransform, entity:Barotrauma.ISerializableEntity, inGame:System.Boolean, showName:System.Boolean, style?:System.String, elementHeight?:System.Int32, titleFont?:Barotrauma.GUIFont):Barotrauma.SerializableEntityEditor
---@overload fun(parent:Barotrauma.RectTransform, entity:Barotrauma.ISerializableEntity, properties:(System.Collections.Generic.IEnumerable*1Barotrauma*SerializableProperty)|(fun():(Barotrauma.SerializableProperty)), showName:System.Boolean, style?:System.String, elementHeight?:System.Int32, titleFont?:Barotrauma.GUIFont):Barotrauma.SerializableEntityEditor
---@return Barotrauma.SerializableEntityEditor
_G['SerializableEntityEditor'].__new = function() end

---`Constructor Private Static`
---@overload fun(parent:Barotrauma.RectTransform, entity:Barotrauma.ISerializableEntity, inGame:System.Boolean, showName:System.Boolean, style?:System.String, elementHeight?:System.Int32, titleFont?:Barotrauma.GUIFont):Barotrauma.SerializableEntityEditor
---@overload fun(parent:Barotrauma.RectTransform, entity:Barotrauma.ISerializableEntity, properties:(System.Collections.Generic.IEnumerable*1Barotrauma*SerializableProperty)|(fun():(Barotrauma.SerializableProperty)), showName:System.Boolean, style?:System.String, elementHeight?:System.Int32, titleFont?:Barotrauma.GUIFont):Barotrauma.SerializableEntityEditor
---@return Barotrauma.SerializableEntityEditor
_G['SerializableEntityEditor'] = function() end

---`Constructor Private Static`
---@overload fun(parent:Barotrauma.RectTransform, entity:Barotrauma.ISerializableEntity, inGame:System.Boolean, showName:System.Boolean, style?:System.String, elementHeight?:System.Int32, titleFont?:Barotrauma.GUIFont):Barotrauma.SerializableEntityEditor
---@overload fun(parent:Barotrauma.RectTransform, entity:Barotrauma.ISerializableEntity, properties:(System.Collections.Generic.IEnumerable*1Barotrauma*SerializableProperty)|(fun():(Barotrauma.SerializableProperty)), showName:System.Boolean, style?:System.String, elementHeight?:System.Int32, titleFont?:Barotrauma.GUIFont):Barotrauma.SerializableEntityEditor
---@return Barotrauma.SerializableEntityEditor
_G['SerializableEntityEditor'].__new = function() end

