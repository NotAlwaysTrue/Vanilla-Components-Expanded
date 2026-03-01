VCE.HF = {
    clamp =  function(input,min,max)
        if input <= min then return min end
        if input >= max then return max end
        return input
    end,

    DoChance = function(probability)
        local probability = VCE.HF.clamp(probability,0,1) * 100
        if probability - math.random(1,100) >= 0 then return true end
        return false
    end,

    Vector2Dir = function(vector)
	    return math.atan2(vector.Y, vector.X)
    end

}