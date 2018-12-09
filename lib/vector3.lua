local class = require("lib.class")
local Vec3 = class:derive("vector3")

local sqrt = math.sqrt
local pow = math.pow

function Vec3:new(x, y, z)
    self.x = x
    self.y = y
    self.z = z
end

function Vec3:unit()
    return self:div(self:mag())
end

function Vec3:distance(vector)
    return self:sub(vector):mag()
end

function Vec3:add(vector)
    return Vec3(self.x + vector.x, self.y + vector.y, self.z + vector.z)
end

function Vec3:sub(vector)
    return Vec3(self.x - vector.x, self.y - vector.y, self.z - vector.z)
end

function Vec3:mag()
    return sqrt(pow(self.x, 2) + pow(self.y, 2) + pow(self.z, 2))
end

function Vec3:mul(n)
    return Vec3(self.x * n, self.y * n, self.z * n)
end

function Vec3:div(n)
    return Vec3(self.x / n, self.y / n, self.z / n)
end

return Vec3