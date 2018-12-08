local class = require("lib.class")
local forces = class:derive("forces")

function forces:gravity(p1, p2)
    print(p1, p2.position)
    unitvector = p2.position:sub(p1.position):unit()
    r = p2.position:sub(p1.position):mag()
    G = 0.00003

    gravity = unitvector:mul((G * p1.mass * p2.mass)/(r * r))
    return gravity
end

return forces