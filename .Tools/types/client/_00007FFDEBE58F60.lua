---@meta
---@class Barotrauma.LuaUserData : System.Object
_G['LuaUserData'] = {}

---`Method Public Static`
---@param typeName System.String
---@return System.Type
_G['LuaUserData'].GetType = function(typeName) end

---`Method Public Static`
---@param typeName System.String
---@return MoonSharp.Interpreter.Interop.IUserDataDescriptor
_G['LuaUserData'].RegisterType = function(typeName) end

---`Method Public Static`
---@param typeName System.String
_G['LuaUserData'].RegisterExtensionType = function(typeName) end

---`Method Public Static`
---@param typeName System.String
---@return System.Boolean
_G['LuaUserData'].IsRegistered = function(typeName) end

---`Method Public Static`
---@param typeName System.String
---@param deleteHistory? System.Boolean
_G['LuaUserData'].UnregisterType = function(typeName, deleteHistory) end

---`Method Public Static`
---@param typeName System.String
---@param ... System.String
---@return MoonSharp.Interpreter.Interop.IUserDataDescriptor
_G['LuaUserData'].RegisterGenericType = function(typeName, ...) end

---`Method Public Static`
---@param typeName System.String
---@param ... System.String
_G['LuaUserData'].UnregisterGenericType = function(typeName, ...) end

---`Method Public Static`
---@param obj System.Object
---@param typeName System.String
---@return System.Boolean
_G['LuaUserData'].IsTargetType = function(obj, typeName) end

---`Method Public Static`
---@param obj System.Object
---@return System.String
_G['LuaUserData'].TypeOf = function(obj) end

---`Method Public Static`
---@param typeName System.String
---@return System.Object
_G['LuaUserData'].CreateStatic = function(typeName) end

---`Method Public Static`
---@param typeName System.String
---@return System.Object
_G['LuaUserData'].CreateEnumTable = function(typeName) end

---`Method Private Static`
---@param type System.Type
---@param fieldName System.String
---@return System.Reflection.FieldInfo
_G['LuaUserData'].FindFieldRecursively = function(type, fieldName) end

---`Method Public Static`
---@param IUUD MoonSharp.Interpreter.Interop.IUserDataDescriptor
---@param fieldName System.String
_G['LuaUserData'].MakeFieldAccessible = function(IUUD, fieldName) end

---`Method Private Static`
---@param type System.Type
---@param methodName System.String
---@param types? (System.Type-arr)|(System.Type[])
---@return System.Reflection.MethodInfo
_G['LuaUserData'].FindMethodRecursively = function(type, methodName, types) end

---`Method Public Static`
---@param IUUD MoonSharp.Interpreter.Interop.IUserDataDescriptor
---@param methodName System.String
---@param parameters? (System.String-arr)|(System.String[])
_G['LuaUserData'].MakeMethodAccessible = function(IUUD, methodName, parameters) end

---`Method Private Static`
---@param type System.Type
---@param propertyName System.String
---@return System.Reflection.PropertyInfo
_G['LuaUserData'].FindPropertyRecursively = function(type, propertyName) end

---`Method Public Static`
---@param IUUD MoonSharp.Interpreter.Interop.IUserDataDescriptor
---@param propertyName System.String
_G['LuaUserData'].MakePropertyAccessible = function(IUUD, propertyName) end

---`Method Public Static`
---@param IUUD MoonSharp.Interpreter.Interop.IUserDataDescriptor
---@param methodName System.String
---@param luaKey__function System.Object
_G['LuaUserData'].AddMethod = function(IUUD, methodName, luaKey__function) end

---`Method Public Static`
---@param IUUD MoonSharp.Interpreter.Interop.IUserDataDescriptor
---@param fieldName System.String
---@param value MoonSharp.Interpreter.DynValue
_G['LuaUserData'].AddField = function(IUUD, fieldName, value) end

---`Method Public Static`
---@param IUUD MoonSharp.Interpreter.Interop.IUserDataDescriptor
---@param memberName System.String
_G['LuaUserData'].RemoveMember = function(IUUD, memberName) end

---`Method Public Static`
---@param obj System.Object
---@param memberName System.String
---@return System.Boolean
_G['LuaUserData'].HasMember = function(obj, memberName) end

---`Method Public Static`
---@param scriptObject MoonSharp.Interpreter.DynValue
---@param desiredTypeDescriptor MoonSharp.Interpreter.Interop.IUserDataDescriptor
---@return MoonSharp.Interpreter.DynValue
_G['LuaUserData'].CreateUserDataFromDescriptor = function(scriptObject, desiredTypeDescriptor) end

---`Method Public Static`
---@param scriptObject MoonSharp.Interpreter.DynValue
---@param desiredType System.Type
---@return MoonSharp.Interpreter.DynValue
_G['LuaUserData'].CreateUserDataFromType = function(scriptObject, desiredType) end

---`Constructor Public Instance`
---@return Barotrauma.LuaUserData
_G['LuaUserData'] = function() end

---`Constructor Public Instance`
---@return Barotrauma.LuaUserData
_G['LuaUserData'].__new = function() end

