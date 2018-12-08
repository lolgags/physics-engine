local class = require("lib.class")
local vector3 = require("lib.vector3")
local camera = class:derive("camera")

function camera:new(x, y, z, fov, angle)
    self.position = vector3(x, y, z)
    self.fov = fov
    self.angle = angle
end

return camera