local m = {}

m.startsWith = function(str, start)
    if type(str) ~= "string" then error(m.format("bad argument #1 to 'startsWith' (string expected, got %s)", type(str)), 2) end
    if type(start) ~= "string" then error(m.format("bad argument #2 to 'startsWith' (string expected, got %s)", type(start)), 2) end

    return m.sub(str, 1, m.len(start)) == start
end

m.endsWith = function(str, ending)
    if type(str) ~= "string" then error(m.format("bad argument #1 to 'endsWith' (string expected, got %s)", type(str)), 2) end
    if type(ending) ~= "string" then error(m.format("bad argument #2 to 'endsWith' (string expected, got %s)", type(ending)), 2) end

    return ending == "" or m.sub(str, -m.len(ending)) == ending
end

return m
