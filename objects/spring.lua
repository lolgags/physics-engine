local class = require("lib.class")
local spring = class:derive("spring")

function spring:new(s, e)
    self.startpoint = s
    self.endpoint = e
    self.constant = 5

    self.expansion = 0
end

return spring