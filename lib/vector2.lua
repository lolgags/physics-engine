local class = require("lib.class")
local Vec2 = class:derive("Vector2")

local sqrt = math.sqrt
local pow = math.pow
local abs = math.abs
local floor = math.floor

function Vec2:new(x, y)
    self.x = x or 0
    self.y = y or 0
end

function Vec2:unit()
    return self:div(self:mag())
end

function Vec2:mag()
    return sqrt(pow(self.x, 2) + pow(self.y, 2))
end

function Vec2:add()
    return Vec2(self.x + self.x, self.y + self.y)
end

function Vec2:sub()
    return Vec2(self.x - self.x, self.y - self.y)
end

function Vec2:div(divisor)
    return Vec2(self.x / divisor, self.y / divisor)
end

function Vec2:mul(v1, mult)
    return Vec2(self.x * mult, self.y * mult)
end

-- TODO: scratch my head and work on this function
function Vec2:lerp(goal, alpha)
    return (1 - alpha) * (self.x + self.y) + alpha * (goal.x + goal.y)
end

function Vec2:mid(vector)
    return Vec2((self.x + vector.x) / 2, (self.y + vector.y) / 2)
end

function Vec2:copy()
    return Vec2(self.x, self.y)
end

function Vec2:opposite()
    return Vec2(-self.x + 0, -self.y + 0)
end

function Vec2:mod()
    return Vec2(floor(abs(self.x)), floor(abs(self.y)))
end

return Vec2