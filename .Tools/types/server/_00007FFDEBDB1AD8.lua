---@meta
---@class Microsoft.Xna.Framework.MathHelper : System.Object
---`Field Public Static`
---@field E System.Single
---`Field Public Static`
---@field Log10E System.Single
---`Field Public Static`
---@field Log2E System.Single
---`Field Public Static`
---@field Pi System.Single
---`Field Public Static`
---@field PiOver2 System.Single
---`Field Public Static`
---@field PiOver4 System.Single
---`Field Public Static`
---@field TwoPi System.Single
_G['Microsoft']['Xna']['Framework']['MathHelper'] = {}

---`Method Public Static`
---@param value1 System.Single
---@param value2 System.Single
---@param value3 System.Single
---@param amount1 System.Single
---@param amount2 System.Single
---@return System.Single
_G['Microsoft']['Xna']['Framework']['MathHelper'].Barycentric = function(value1, value2, value3, amount1, amount2) end

---`Method Public Static`
---@param value1 System.Single
---@param value2 System.Single
---@param value3 System.Single
---@param value4 System.Single
---@param amount System.Single
---@return System.Single
_G['Microsoft']['Xna']['Framework']['MathHelper'].CatmullRom = function(value1, value2, value3, value4, amount) end

---`Method Public Static`
---@overload fun(value:System.Single, min:System.Single, max:System.Single):(System.Single)
---@param value System.Int32
---@param min System.Int32
---@param max System.Int32
---@return System.Int32
_G['Microsoft']['Xna']['Framework']['MathHelper'].Clamp = function(value, min, max) end

---`Method Public Static`
---@param value1 System.Single
---@param value2 System.Single
---@return System.Single
_G['Microsoft']['Xna']['Framework']['MathHelper'].Distance = function(value1, value2) end

---`Method Public Static`
---@param value1 System.Single
---@param tangent1 System.Single
---@param value2 System.Single
---@param tangent2 System.Single
---@param amount System.Single
---@return System.Single
_G['Microsoft']['Xna']['Framework']['MathHelper'].Hermite = function(value1, tangent1, value2, tangent2, amount) end

---`Method Public Static`
---@param value1 System.Single
---@param value2 System.Single
---@param amount System.Single
---@return System.Single
_G['Microsoft']['Xna']['Framework']['MathHelper'].Lerp = function(value1, value2, amount) end

---`Method Public Static`
---@param value1 System.Single
---@param value2 System.Single
---@param amount System.Single
---@return System.Single
_G['Microsoft']['Xna']['Framework']['MathHelper'].LerpPrecise = function(value1, value2, amount) end

---`Method Public Static`
---@overload fun(value1:System.Single, value2:System.Single):(System.Single)
---@param value1 System.Int32
---@param value2 System.Int32
---@return System.Int32
_G['Microsoft']['Xna']['Framework']['MathHelper'].Max = function(value1, value2) end

---`Method Public Static`
---@overload fun(value1:System.Single, value2:System.Single):(System.Single)
---@param value1 System.Int32
---@param value2 System.Int32
---@return System.Int32
_G['Microsoft']['Xna']['Framework']['MathHelper'].Min = function(value1, value2) end

---`Method Public Static`
---@param value1 System.Single
---@param value2 System.Single
---@param amount System.Single
---@return System.Single
_G['Microsoft']['Xna']['Framework']['MathHelper'].SmoothStep = function(value1, value2, amount) end

---`Method Public Static`
---@param radians System.Single
---@return System.Single
_G['Microsoft']['Xna']['Framework']['MathHelper'].ToDegrees = function(radians) end

---`Method Public Static`
---@param degrees System.Single
---@return System.Single
_G['Microsoft']['Xna']['Framework']['MathHelper'].ToRadians = function(degrees) end

---`Method Public Static`
---@param angle System.Single
---@return System.Single
_G['Microsoft']['Xna']['Framework']['MathHelper'].WrapAngle = function(angle) end

---`Method Public Static`
---@param value System.Int32
---@return System.Boolean
_G['Microsoft']['Xna']['Framework']['MathHelper'].IsPowerOfTwo = function(value) end

