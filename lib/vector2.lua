local class = require("lib.class")
local Vec2 = class:derive("vector2")

local sqrt = math.sqrt
local pow = math.pow
local abs = math.abs
local floor = math.floor

function Vec2:new(x, y)
    self.x = x or 0
    self.y = y or 0
end

function Vec2:setX(x)
    self.x = x
end

function Vec2:setY(y)
    self.y = y
end

function Vec2:rotate(angle)
    x = self.x * math.cos(-angle) - self.y * math.sin(-angle)
    y = self.x * math.sin(-angle) + self.y * math.cos(-angle)
    self.x = x
    self.y = y
end

function Vec2:distance(vector)
    return self:sub(vector):mag()
end

function Vec2:unit()
    return self:div(self:mag())
end

function Vec2:mag()
    return sqrt(pow(self.x, 2) + pow(self.y, 2))
end

function Vec2:add(vector)
    return Vec2(self.x + vector.x, self.y + vector.y)
end

function Vec2:sub(vector)
    return Vec2(self.x - vector.x, self.y - vector.y)
end

function Vec2:div(n)
    return Vec2(self.x / n, self.y / n)
end

function Vec2:mul(n)
    return Vec2(self.x * n, self.y * n)
end

function Vec2:mid(vector)
    return Vec2((self.x + vector.x) / 2, (self.y + vector.y) / 2)
end

function Vec2:opposite()
    return Vec2(-self.x + 0, -self.y + 0)
end

function Vec2:mod()
    return Vec2(floor(abs(self.x)), floor(abs(self.y)))
end

return Vec2