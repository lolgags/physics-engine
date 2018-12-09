local class = require("lib.class")
local forces = class:derive("forces")
local vector3 = require("lib.vector3")

function forces:gravity(p1, p2)
    unitvector = p2.position:sub(p1.position):unit()
    r = p2.position:sub(p1.position):mag()
    G = 0.0003

    gravity = unitvector:mul((G * p1.mass * p2.mass)/(r * r))
    return gravity
end

function forces:electric(p1, p2)
    q1 = p1.charge
    q2 = p2.charge
    unitvector = p2.position:sub(p1.position):unit()
    r = p2.position:sub(p1.position):mag()
    f = 0.001

    Fe = unitvector:mul((-1 * f * q1 * q2)/(r^2))
    return Fe
end

return forces
