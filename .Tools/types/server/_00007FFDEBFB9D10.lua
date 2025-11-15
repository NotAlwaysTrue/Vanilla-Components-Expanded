---@meta
---@class Barotrauma.WallSection : System.Object
---`Field Public Instance`
---@field rect Microsoft.Xna.Framework.Rectangle
---`Field Public Instance`
---@field damage System.Single
---`Field Public Instance`
---@field gap Barotrauma.Gap
---`Field Public Instance`
---@field NoPhysicsBody System.Boolean
---`Getter Public Instance`
---@field Wall Barotrauma.Structure
---`Getter Public Instance Virtual`
---@field Position Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field WorldPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field SimPosition Microsoft.Xna.Framework.Vector2
---`Getter Public Instance Virtual`
---@field Submarine Barotrauma.Submarine
---`Getter Public Instance`
---@field WorldRect Microsoft.Xna.Framework.Rectangle
---`Getter Public Instance Virtual`
---<br/>`Setter Public Instance Virtual`
---@field OrderedToBeIgnored System.Boolean
_G['WallSection'] = {}

---`Method Public Instance Virtual`
---@param character Barotrauma.Character
---@return System.Boolean
_G['WallSection'].IgnoreByAI = function(character) end

---`Constructor Public Instance`
---@param rect Microsoft.Xna.Framework.Rectangle
---@param wall Barotrauma.Structure
---@param damage? System.Single
---@return Barotrauma.WallSection
_G['WallSection'] = function(rect, wall, damage) end

---`Constructor Public Instance`
---@param rect Microsoft.Xna.Framework.Rectangle
---@param wall Barotrauma.Structure
---@param damage? System.Single
---@return Barotrauma.WallSection
_G['WallSection'].__new = function(rect, wall, damage) end

