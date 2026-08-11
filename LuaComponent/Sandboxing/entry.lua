local path = table.pack(...)[1]
package.path = { path .. "/?.lua" }
setmodulepaths(package.path)

local clrLuaUserData = LuaUserData

---@param userdata userdata
function AddCallMetaTable(userdata)
    if userdata == nil then
        error("Attempted to add a call metatable to a nil value.", 2)
    end

    if not clrLuaUserData.HasMember(userdata, ".ctor") then
        error("Attempted to add a call metatable to a userdata that does not have a constructor.", 2)
    end

    debug.setmetatable(userdata, {
        __call = function(obj, ...)
            if userdata == nil then
                error("userdata was nil.", 2)
            end

            local success, result = pcall(userdata.__new, ...)

            if not success then
                error(result, 2)
            end

            return result
        end
    })
end

---@param typeName string
---@param callable? boolean
---@return userdata
function CreateStatic(typeName, callable)
    if type(typeName) ~= "string" then
        error("Expected a string for typeName, got " .. type(typeName) .. ".", 2)
    end

    local success, result = pcall(clrLuaUserData.CreateStatic, typeName)

    if not success then
        error(result, 2)
    end

    if result == nil then
        return
    end

    if (callable == nil and true or callable) and clrLuaUserData.HasMember(result, ".ctor") then
        AddCallMetaTable(result)
    end

    return result
end

---@type fun(typeName: string): { [string]: integer }
CreateEnum = clrLuaUserData.CreateEnumTable

---@param context table
local function importModule(context)
    for k, fname in pairs(context) do
        rawset(_G, k, fname)
    end
end

importModule(require "libs.client")
importModule(require "libs.shared")
importModule(require "libs.utils.math")
importModule(require "libs.utils.string")

AddCallMetaTable = nil
CreateStatic = nil
CreateEnum = nil
