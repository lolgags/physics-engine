local class = require("lib.class")
local system = class:derive("system")

function system:new()
    self.particles = {}
end

function system:addparticles(particle)
    if particle.type == "particle" then
        table.insert(self.particles, particle)
    elseif type(particle) == "table" then
        for p = 1, #particle do
            if particle[p].type == "particle" then
                table.insert(self.particles, particle[p])
            end
        end
    end
end

return system