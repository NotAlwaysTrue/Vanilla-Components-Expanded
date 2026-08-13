VCE.HF = {}

VCE.HF.clamp = math.clamp

---@param probability number
---@return boolean
VCE.HF.DoChance = function(probability)
    local probability = VCE.HF.clamp(probability,0,1) * 100
    if probability - math.random(1,100) >= 0 then return true end
    return false
end

---@param vector Microsoft.Xna.Framework.Vector2
---@return number
VCE.HF.Vector2Dir = function(vector)
    return math.atan2(vector.Y, vector.X)
end
