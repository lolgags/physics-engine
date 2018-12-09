local class = require("lib.class")
local vector3 = require("lib.vector3")
local states = require("lib.states")
local particle = class:derive("particle")

function isState(s)
    for index, value in pairs(states) do
        if value == s then
            return true
        end
    end
    return false
end

function particle:new(x, v, a, s)
    self.position = x
    self.velocity = v
    self.acceleration = a
    self.momentum = 0

    for index, value in pairs(s) do
        if isState(index) == false then
            error("The state: " .. value .. ", does not exist!")
        end
    end
    self.states = s

    self.force = vector3(0, 0, 0)
    self.gravity = 10
end

function particle:distance(particle)
    return self.position:distance(particle.distance)
end

function particle:update(time)
    self.acceleration = self.force:mul(1 / self.states.mass)

    v1 = self.acceleration:mul(time)
    self.velocity = vector3(v1.x + self.velocity.x, v1.y + self.velocity.y, 0)
    
    p1 = self.velocity:mul(time)
    self.position = vector3(p1.x + self.position.x, p1.y + self.position.y, 0)
    --print(self.position)
end

function particle:draw()
    love.graphics.circle("fill", self.position.x, self.position.y, self.states.mass)
end

return particle