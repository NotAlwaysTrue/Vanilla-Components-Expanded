---@meta
---@class FarseerPhysics.ConvertUnits : System.Object
---`Field Private Static`
---@field _displayUnitsToSimUnitsRatio System.Single
---`Field Private Static`
---@field _simUnitsToDisplayUnitsRatio System.Single
_G['ConvertUnits'] = {}

---`Method Public Static`
---@param displayUnitsPerSimUnit System.Single
_G['ConvertUnits'].SetDisplayUnitToSimUnitRatio = function(displayUnitsPerSimUnit) end

---`Method Public Static`
---@overload fun(simUnits:System.Single):(System.Single)
---@overload fun(simUnits:System.Int32):(System.Single)
---@overload fun(simUnits:Microsoft.Xna.Framework.Vector2):(Microsoft.Xna.Framework.Vector2)
---@overload fun(simUnits:Microsoft.Xna.Framework.Vector2-ref, displayUnits:Microsoft.Xna.Framework.Vector2-ref)
---@overload fun(simUnits:Microsoft.Xna.Framework.Vector3):(Microsoft.Xna.Framework.Vector3)
---@overload fun(x:System.Single, y:System.Single):(Microsoft.Xna.Framework.Vector2)
---@param x System.Single
---@param y System.Single
---@param displayUnits Microsoft.Xna.Framework.Vector2-ref
_G['ConvertUnits'].ToDisplayUnits = function(x, y, displayUnits) end

---`Method Public Static`
---@overload fun(displayUnits:System.Single):(System.Single)
---@overload fun(displayUnits:System.Double):(System.Single)
---@overload fun(displayUnits:System.Int32):(System.Single)
---@overload fun(displayUnits:Microsoft.Xna.Framework.Vector2):(Microsoft.Xna.Framework.Vector2)
---@overload fun(displayUnits:Microsoft.Xna.Framework.Vector3):(Microsoft.Xna.Framework.Vector3)
---@overload fun(displayUnits:Microsoft.Xna.Framework.Vector2-ref, simUnits:Microsoft.Xna.Framework.Vector2-ref)
---@overload fun(x:System.Single, y:System.Single):(Microsoft.Xna.Framework.Vector2)
---@overload fun(x:System.Double, y:System.Double):(Microsoft.Xna.Framework.Vector2)
---@param x System.Single
---@param y System.Single
---@param simUnits Microsoft.Xna.Framework.Vector2-ref
_G['ConvertUnits'].ToSimUnits = function(x, y, simUnits) end

---`Constructor Private Static`
---@return FarseerPhysics.ConvertUnits
_G['ConvertUnits'] = function() end

---`Constructor Private Static`
---@return FarseerPhysics.ConvertUnits
_G['ConvertUnits'].__new = function() end

