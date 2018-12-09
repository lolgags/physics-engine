local class = require("lib.class")
local vector3 = require("lib.vector3")
local rope = class:derive("rope")

function rope:new(s, e)
    self.startpoint = s
    self.endpoint = e
    self.elasticity = 0.0000000001
end

function rope:draw()
    love.graphics.setLineStyle("smooth")
    love.graphics.setLineWidth(5)
    love.graphics.line(self.endpoint.x, self.endpoint.y, self.startpoint.x, self.startpoint.y)
end

return rope