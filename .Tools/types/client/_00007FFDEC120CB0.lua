---@meta
---@class Barotrauma.Items.Components.MotionSensor : Barotrauma.Items.Components.ItemComponent
---`Field Private Instance`
---@field rangeX System.Single
---`Field Private Instance`
---@field rangeY System.Single
---`Field Private Instance`
---@field detectOffset Microsoft.Xna.Framework.Vector2
---`Field Private Instance`
---@field updateTimer System.Single
---`Field Private Instance`
---@field triggerFromHumans System.Boolean
---`Field Private Instance`
---@field triggerFromPets System.Boolean
---`Field Private Instance`
---@field triggerFromMonsters System.Boolean
---`Field Private Instance`
---@field _target Barotrauma.Items.Components.MotionSensor.TargetType
---`Field Private Instance`
---@field targetCharacters (System.Collections.Generic.HashSet*1Barotrauma*Identifier)|(Barotrauma.Identifier[])
---`Field Private Instance`
---@field maxOutputLength System.Int32
---`Field Private Instance`
---@field output System.String
---`Field Private Instance`
---@field falseOutput System.String
---`Getter Public Instance Virtual`
---@field DrawSize Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MotionDetected System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Target Barotrauma.Items.Components.MotionSensor.TargetType
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field TargetCharacters System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field IgnoreDead System.Boolean
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RangeX System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field RangeY System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DetectOffset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---@field TransformedDetectOffset Microsoft.Xna.Framework.Vector2
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field UpdateInterval System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MaxOutputLength System.Int32
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Output System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field FalseOutput System.String
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field MinimumVelocity System.Single
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field DetectOwnMotion System.Boolean
_G['Components']['MotionSensor'] = {}

---`Method Public Instance Virtual`
---@param spriteBatch Microsoft.Xna.Framework.Graphics.SpriteBatch
---@param editing System.Boolean
---@param itemDepth? System.Single
---@param overrideColor? System.Nullable*1Microsoft*Xna*Framework*Color
_G['Components']['MotionSensor'].Draw = function(spriteBatch, editing, itemDepth, overrideColor) end

---`Method Public Instance Virtual`
---@param componentElement Barotrauma.ContentXElement
---@param usePrefabValues System.Boolean
---@param idRemap Barotrauma.IdRemap
---@param isItemSwap System.Boolean
_G['Components']['MotionSensor'].Load = function(componentElement, usePrefabValues, idRemap, isItemSwap) end

---`Method Public Instance Virtual`
---@param deltaTime System.Single
---@param cam Barotrauma.Camera
_G['Components']['MotionSensor'].Update = function(deltaTime, cam) end

---`Method Public Instance`
---@param character Barotrauma.Character
---@return System.Boolean
_G['Components']['MotionSensor'].TriggersOn = function(character) end

---`Method Private Instance`
---@param character Barotrauma.Character
---@param triggerFromHumans System.Boolean
---@param triggerFromPets System.Boolean
---@param triggerFromMonsters System.Boolean
---@return System.Boolean
_G['Components']['MotionSensor'].TriggersOn = function(character, triggerFromHumans, triggerFromPets, triggerFromMonsters) end

---`Method Public Instance Virtual`
---@param parentElement System.Xml.Linq.XElement
---@return System.Xml.Linq.XElement
_G['Components']['MotionSensor'].Save = function(parentElement) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.MotionSensor
_G['Components']['MotionSensor'] = function(item, element) end

---`Constructor Public Instance`
---@param item Barotrauma.Item
---@param element Barotrauma.ContentXElement
---@return Barotrauma.Items.Components.MotionSensor
_G['Components']['MotionSensor'].__new = function(item, element) end

