---@meta
---@class Microsoft.Xna.Framework.Matrix : System.ValueType, {[System.Int32]:System.Single}
---@operator add(Microsoft.Xna.Framework.Matrix):Microsoft.Xna.Framework.Matrix
---@operator div(Microsoft.Xna.Framework.Matrix):Microsoft.Xna.Framework.Matrix
---@operator div(System.Single):Microsoft.Xna.Framework.Matrix
---@operator mul(Microsoft.Xna.Framework.Matrix):Microsoft.Xna.Framework.Matrix
---@operator mul(System.Single):Microsoft.Xna.Framework.Matrix
---@operator sub(Microsoft.Xna.Framework.Matrix):Microsoft.Xna.Framework.Matrix
---@operator unm:Microsoft.Xna.Framework.Matrix
---`Field Public Instance`
---@field M11 System.Single
---`Field Public Instance`
---@field M12 System.Single
---`Field Public Instance`
---@field M13 System.Single
---`Field Public Instance`
---@field M14 System.Single
---`Field Public Instance`
---@field M21 System.Single
---`Field Public Instance`
---@field M22 System.Single
---`Field Public Instance`
---@field M23 System.Single
---`Field Public Instance`
---@field M24 System.Single
---`Field Public Instance`
---@field M31 System.Single
---`Field Public Instance`
---@field M32 System.Single
---`Field Public Instance`
---@field M33 System.Single
---`Field Public Instance`
---@field M34 System.Single
---`Field Public Instance`
---@field M41 System.Single
---`Field Public Instance`
---@field M42 System.Single
---`Field Public Instance`
---@field M43 System.Single
---`Field Public Instance`
---@field M44 System.Single
---`Field Private Static`
---@field identity Microsoft.Xna.Framework.Matrix
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Backward Microsoft.Xna.Framework.Vector3
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Down Microsoft.Xna.Framework.Vector3
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Forward Microsoft.Xna.Framework.Vector3
---`Getter Public Static`
---@field Identity Microsoft.Xna.Framework.Matrix
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Left Microsoft.Xna.Framework.Vector3
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Right Microsoft.Xna.Framework.Vector3
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Translation Microsoft.Xna.Framework.Vector3
---`Getter Public Instance`
---<br/>`Setter Public Instance`
---@field Up Microsoft.Xna.Framework.Vector3
---`Getter NonPublic Instance`
---@field DebugDisplayString System.String
_G['Matrix'] = {}

---`Method Public Static`
---@overload fun(matrix1:Microsoft.Xna.Framework.Matrix, matrix2:Microsoft.Xna.Framework.Matrix):(Microsoft.Xna.Framework.Matrix)
---@param matrix1 Microsoft.Xna.Framework.Matrix-ref
---@param matrix2 Microsoft.Xna.Framework.Matrix-ref
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].Add = function(matrix1, matrix2, result) end

---`Method Public Static`
---@overload fun(objectPosition:Microsoft.Xna.Framework.Vector3, cameraPosition:Microsoft.Xna.Framework.Vector3, cameraUpVector:Microsoft.Xna.Framework.Vector3, cameraForwardVector:System.Nullable*1Microsoft*Xna*Framework*Vector3):(Microsoft.Xna.Framework.Matrix)
---@param objectPosition Microsoft.Xna.Framework.Vector3-ref
---@param cameraPosition Microsoft.Xna.Framework.Vector3-ref
---@param cameraUpVector Microsoft.Xna.Framework.Vector3-ref
---@param cameraForwardVector System.Nullable*1Microsoft*Xna*Framework*Vector3
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateBillboard = function(objectPosition, cameraPosition, cameraUpVector, cameraForwardVector, result) end

---`Method Public Static`
---@overload fun(objectPosition:Microsoft.Xna.Framework.Vector3, cameraPosition:Microsoft.Xna.Framework.Vector3, rotateAxis:Microsoft.Xna.Framework.Vector3, cameraForwardVector:System.Nullable*1Microsoft*Xna*Framework*Vector3, objectForwardVector:System.Nullable*1Microsoft*Xna*Framework*Vector3):(Microsoft.Xna.Framework.Matrix)
---@param objectPosition Microsoft.Xna.Framework.Vector3-ref
---@param cameraPosition Microsoft.Xna.Framework.Vector3-ref
---@param rotateAxis Microsoft.Xna.Framework.Vector3-ref
---@param cameraForwardVector System.Nullable*1Microsoft*Xna*Framework*Vector3
---@param objectForwardVector System.Nullable*1Microsoft*Xna*Framework*Vector3
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateConstrainedBillboard = function(objectPosition, cameraPosition, rotateAxis, cameraForwardVector, objectForwardVector, result) end

---`Method Public Static`
---@overload fun(axis:Microsoft.Xna.Framework.Vector3, angle:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param axis Microsoft.Xna.Framework.Vector3-ref
---@param angle System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateFromAxisAngle = function(axis, angle, result) end

---`Method Public Static`
---@overload fun(quaternion:Microsoft.Xna.Framework.Quaternion):(Microsoft.Xna.Framework.Matrix)
---@param quaternion Microsoft.Xna.Framework.Quaternion-ref
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateFromQuaternion = function(quaternion, result) end

---`Method Public Static`
---@overload fun(yaw:System.Single, pitch:System.Single, roll:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param yaw System.Single
---@param pitch System.Single
---@param roll System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateFromYawPitchRoll = function(yaw, pitch, roll, result) end

---`Method Public Static`
---@overload fun(cameraPosition:Microsoft.Xna.Framework.Vector3, cameraTarget:Microsoft.Xna.Framework.Vector3, cameraUpVector:Microsoft.Xna.Framework.Vector3):(Microsoft.Xna.Framework.Matrix)
---@param cameraPosition Microsoft.Xna.Framework.Vector3-ref
---@param cameraTarget Microsoft.Xna.Framework.Vector3-ref
---@param cameraUpVector Microsoft.Xna.Framework.Vector3-ref
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateLookAt = function(cameraPosition, cameraTarget, cameraUpVector, result) end

---`Method Public Static`
---@overload fun(width:System.Single, height:System.Single, zNearPlane:System.Single, zFarPlane:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param width System.Single
---@param height System.Single
---@param zNearPlane System.Single
---@param zFarPlane System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateOrthographic = function(width, height, zNearPlane, zFarPlane, result) end

---`Method Public Static`
---@overload fun(left:System.Single, right:System.Single, bottom:System.Single, top:System.Single, zNearPlane:System.Single, zFarPlane:System.Single):(Microsoft.Xna.Framework.Matrix)
---@overload fun(viewingVolume:Microsoft.Xna.Framework.Rectangle, zNearPlane:System.Single, zFarPlane:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param left System.Single
---@param right System.Single
---@param bottom System.Single
---@param top System.Single
---@param zNearPlane System.Single
---@param zFarPlane System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateOrthographicOffCenter = function(left, right, bottom, top, zNearPlane, zFarPlane, result) end

---`Method Public Static`
---@overload fun(width:System.Single, height:System.Single, nearPlaneDistance:System.Single, farPlaneDistance:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param width System.Single
---@param height System.Single
---@param nearPlaneDistance System.Single
---@param farPlaneDistance System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreatePerspective = function(width, height, nearPlaneDistance, farPlaneDistance, result) end

---`Method Public Static`
---@overload fun(fieldOfView:System.Single, aspectRatio:System.Single, nearPlaneDistance:System.Single, farPlaneDistance:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param fieldOfView System.Single
---@param aspectRatio System.Single
---@param nearPlaneDistance System.Single
---@param farPlaneDistance System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreatePerspectiveFieldOfView = function(fieldOfView, aspectRatio, nearPlaneDistance, farPlaneDistance, result) end

---`Method Public Static`
---@overload fun(left:System.Single, right:System.Single, bottom:System.Single, top:System.Single, nearPlaneDistance:System.Single, farPlaneDistance:System.Single):(Microsoft.Xna.Framework.Matrix)
---@overload fun(viewingVolume:Microsoft.Xna.Framework.Rectangle, nearPlaneDistance:System.Single, farPlaneDistance:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param left System.Single
---@param right System.Single
---@param bottom System.Single
---@param top System.Single
---@param nearPlaneDistance System.Single
---@param farPlaneDistance System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreatePerspectiveOffCenter = function(left, right, bottom, top, nearPlaneDistance, farPlaneDistance, result) end

---`Method Public Static`
---@overload fun(radians:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param radians System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateRotationX = function(radians, result) end

---`Method Public Static`
---@overload fun(radians:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param radians System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateRotationY = function(radians, result) end

---`Method Public Static`
---@overload fun(radians:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param radians System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateRotationZ = function(radians, result) end

---`Method Public Static`
---@overload fun(scale:System.Single):(Microsoft.Xna.Framework.Matrix)
---@overload fun(scale:System.Single, result:Microsoft.Xna.Framework.Matrix-ref)
---@overload fun(xScale:System.Single, yScale:System.Single, zScale:System.Single):(Microsoft.Xna.Framework.Matrix)
---@overload fun(xScale:System.Single, yScale:System.Single, zScale:System.Single, result:Microsoft.Xna.Framework.Matrix-ref)
---@overload fun(scales:Microsoft.Xna.Framework.Vector3):(Microsoft.Xna.Framework.Matrix)
---@param scales Microsoft.Xna.Framework.Vector3-ref
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateScale = function(scales, result) end

---`Method Public Static`
---@overload fun(lightDirection:Microsoft.Xna.Framework.Vector3, plane:Microsoft.Xna.Framework.Plane):(Microsoft.Xna.Framework.Matrix)
---@param lightDirection Microsoft.Xna.Framework.Vector3-ref
---@param plane Microsoft.Xna.Framework.Plane-ref
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateShadow = function(lightDirection, plane, result) end

---`Method Public Static`
---@overload fun(xPosition:System.Single, yPosition:System.Single, zPosition:System.Single):(Microsoft.Xna.Framework.Matrix)
---@overload fun(position:Microsoft.Xna.Framework.Vector3-ref, result:Microsoft.Xna.Framework.Matrix-ref)
---@overload fun(position:Microsoft.Xna.Framework.Vector3):(Microsoft.Xna.Framework.Matrix)
---@param xPosition System.Single
---@param yPosition System.Single
---@param zPosition System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateTranslation = function(xPosition, yPosition, zPosition, result) end

---`Method Public Static`
---@overload fun(value:Microsoft.Xna.Framework.Plane):(Microsoft.Xna.Framework.Matrix)
---@param value Microsoft.Xna.Framework.Plane-ref
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateReflection = function(value, result) end

---`Method Public Static`
---@overload fun(position:Microsoft.Xna.Framework.Vector3, forward:Microsoft.Xna.Framework.Vector3, up:Microsoft.Xna.Framework.Vector3):(Microsoft.Xna.Framework.Matrix)
---@param position Microsoft.Xna.Framework.Vector3-ref
---@param forward Microsoft.Xna.Framework.Vector3-ref
---@param up Microsoft.Xna.Framework.Vector3-ref
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].CreateWorld = function(position, forward, up, result) end

---`Method Public Instance`
---@param scale Microsoft.Xna.Framework.Vector3-ref
---@param rotation Microsoft.Xna.Framework.Quaternion-ref
---@param translation Microsoft.Xna.Framework.Vector3-ref
---@return System.Boolean
_G['Matrix'].Decompose = function(scale, rotation, translation) end

---`Method Public Instance`
---@return System.Single
_G['Matrix'].Determinant = function() end

---`Method Public Static`
---@overload fun(matrix1:Microsoft.Xna.Framework.Matrix, matrix2:Microsoft.Xna.Framework.Matrix):(Microsoft.Xna.Framework.Matrix)
---@overload fun(matrix1:Microsoft.Xna.Framework.Matrix-ref, matrix2:Microsoft.Xna.Framework.Matrix-ref, result:Microsoft.Xna.Framework.Matrix-ref)
---@overload fun(matrix1:Microsoft.Xna.Framework.Matrix, divider:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param matrix1 Microsoft.Xna.Framework.Matrix-ref
---@param divider System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].Divide = function(matrix1, divider, result) end

---`Method Public Instance Virtual`
---@overload fun(other:Microsoft.Xna.Framework.Matrix):(System.Boolean)
---@param obj System.Object
---@return System.Boolean
_G['Matrix'].Equals = function(obj) end

---`Method Public Instance Virtual`
---@return System.Int32
_G['Matrix'].GetHashCode = function() end

---`Method Public Static`
---@overload fun(matrix:Microsoft.Xna.Framework.Matrix):(Microsoft.Xna.Framework.Matrix)
---@param matrix Microsoft.Xna.Framework.Matrix-ref
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].Invert = function(matrix, result) end

---`Method Public Static`
---@overload fun(matrix1:Microsoft.Xna.Framework.Matrix, matrix2:Microsoft.Xna.Framework.Matrix, amount:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param matrix1 Microsoft.Xna.Framework.Matrix-ref
---@param matrix2 Microsoft.Xna.Framework.Matrix-ref
---@param amount System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].Lerp = function(matrix1, matrix2, amount, result) end

---`Method Public Static`
---@overload fun(matrix1:Microsoft.Xna.Framework.Matrix, matrix2:Microsoft.Xna.Framework.Matrix):(Microsoft.Xna.Framework.Matrix)
---@overload fun(matrix1:Microsoft.Xna.Framework.Matrix-ref, matrix2:Microsoft.Xna.Framework.Matrix-ref, result:Microsoft.Xna.Framework.Matrix-ref)
---@overload fun(matrix1:Microsoft.Xna.Framework.Matrix, scaleFactor:System.Single):(Microsoft.Xna.Framework.Matrix)
---@param matrix1 Microsoft.Xna.Framework.Matrix-ref
---@param scaleFactor System.Single
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].Multiply = function(matrix1, scaleFactor, result) end

---`Method Public Static`
---@param matrix Microsoft.Xna.Framework.Matrix
---@return (System.Single-arr)|(System.Single[])
_G['Matrix'].ToFloatArray = function(matrix) end

---`Method Public Static`
---@overload fun(matrix:Microsoft.Xna.Framework.Matrix):(Microsoft.Xna.Framework.Matrix)
---@param matrix Microsoft.Xna.Framework.Matrix-ref
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].Negate = function(matrix, result) end

---`Method Public Static`
---@overload fun(matrix1:Microsoft.Xna.Framework.Matrix, matrix2:Microsoft.Xna.Framework.Matrix):(Microsoft.Xna.Framework.Matrix)
---@param matrix1 Microsoft.Xna.Framework.Matrix-ref
---@param matrix2 Microsoft.Xna.Framework.Matrix-ref
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].Subtract = function(matrix1, matrix2, result) end

---`Method Public Instance Virtual`
---@return System.String
_G['Matrix'].ToString = function() end

---`Method Public Static`
---@overload fun(matrix:Microsoft.Xna.Framework.Matrix):(Microsoft.Xna.Framework.Matrix)
---@param matrix Microsoft.Xna.Framework.Matrix-ref
---@param result Microsoft.Xna.Framework.Matrix-ref
_G['Matrix'].Transpose = function(matrix, result) end

---`Method Private Static`
---@param matrix Microsoft.Xna.Framework.Matrix-ref
---@param major System.Single-ref
---@param minor1 System.Single-ref
---@param minor2 System.Single-ref
---@param minor3 System.Single-ref
---@param minor4 System.Single-ref
---@param minor5 System.Single-ref
---@param minor6 System.Single-ref
---@param minor7 System.Single-ref
---@param minor8 System.Single-ref
---@param minor9 System.Single-ref
---@param minor10 System.Single-ref
---@param minor11 System.Single-ref
---@param minor12 System.Single-ref
_G['Matrix'].FindDeterminants = function(matrix, major, minor1, minor2, minor3, minor4, minor5, minor6, minor7, minor8, minor9, minor10, minor11, minor12) end

---`Constructor Public Instance`
---@overload fun(m11:System.Single, m12:System.Single, m13:System.Single, m14:System.Single, m21:System.Single, m22:System.Single, m23:System.Single, m24:System.Single, m31:System.Single, m32:System.Single, m33:System.Single, m34:System.Single, m41:System.Single, m42:System.Single, m43:System.Single, m44:System.Single):Microsoft.Xna.Framework.Matrix
---@overload fun(row1:Microsoft.Xna.Framework.Vector4, row2:Microsoft.Xna.Framework.Vector4, row3:Microsoft.Xna.Framework.Vector4, row4:Microsoft.Xna.Framework.Vector4):Microsoft.Xna.Framework.Matrix
---@return Microsoft.Xna.Framework.Matrix
_G['Matrix'] = function() end

---`Constructor Public Instance`
---@overload fun(m11:System.Single, m12:System.Single, m13:System.Single, m14:System.Single, m21:System.Single, m22:System.Single, m23:System.Single, m24:System.Single, m31:System.Single, m32:System.Single, m33:System.Single, m34:System.Single, m41:System.Single, m42:System.Single, m43:System.Single, m44:System.Single):Microsoft.Xna.Framework.Matrix
---@overload fun(row1:Microsoft.Xna.Framework.Vector4, row2:Microsoft.Xna.Framework.Vector4, row3:Microsoft.Xna.Framework.Vector4, row4:Microsoft.Xna.Framework.Vector4):Microsoft.Xna.Framework.Matrix
---@return Microsoft.Xna.Framework.Matrix
_G['Matrix'].__new = function() end

---`Constructor Private Static`
---@overload fun(m11:System.Single, m12:System.Single, m13:System.Single, m14:System.Single, m21:System.Single, m22:System.Single, m23:System.Single, m24:System.Single, m31:System.Single, m32:System.Single, m33:System.Single, m34:System.Single, m41:System.Single, m42:System.Single, m43:System.Single, m44:System.Single):Microsoft.Xna.Framework.Matrix
---@overload fun(row1:Microsoft.Xna.Framework.Vector4, row2:Microsoft.Xna.Framework.Vector4, row3:Microsoft.Xna.Framework.Vector4, row4:Microsoft.Xna.Framework.Vector4):Microsoft.Xna.Framework.Matrix
---@return Microsoft.Xna.Framework.Matrix
_G['Matrix'] = function() end

---`Constructor Private Static`
---@overload fun(m11:System.Single, m12:System.Single, m13:System.Single, m14:System.Single, m21:System.Single, m22:System.Single, m23:System.Single, m24:System.Single, m31:System.Single, m32:System.Single, m33:System.Single, m34:System.Single, m41:System.Single, m42:System.Single, m43:System.Single, m44:System.Single):Microsoft.Xna.Framework.Matrix
---@overload fun(row1:Microsoft.Xna.Framework.Vector4, row2:Microsoft.Xna.Framework.Vector4, row3:Microsoft.Xna.Framework.Vector4, row4:Microsoft.Xna.Framework.Vector4):Microsoft.Xna.Framework.Matrix
---@return Microsoft.Xna.Framework.Matrix
_G['Matrix'].__new = function() end

