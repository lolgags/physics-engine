local class = require("lib.class")
local vector3 = require("lib.vector3")
local states = require("lib.states")
local particle = class:derive("particle")

function particle:new(x, v, a)
    self.position = x
    self.velocity = v
    self.acceleration = a

    self.mass = 1
    self.force = vector3(0, 0, 0)
    self.gravity = 10
    
    self.states = states("")
end

function particle:update(time)
    p1 = self.velocity:mul(time)
    self.position = vector3(p1.x + self.position.x, p1.y + self.position.y, 0)

    v1 = self.acceleration:mul(time)
    self.velocity = vector3(v1.x + self.velocity.x, v1.y + self.velocity.y, 0)  
    
    self.acceleration = self.force:mul(1 / self.mass)
end

return particle
