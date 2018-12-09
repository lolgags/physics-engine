local class = require("lib.class")
local forces = class:derive("forces")
local vector3 = require("lib.vector3")

function forces:gravity(p1, p2)
    if p1.states.mass and p2.states.mass then
        if p1.states.mass > 0 and p2.states.mass > 0 then
            unitvector = p2.position:sub(p1.position):unit()
            r = p2.position:sub(p1.position):mag()
            G = 0.0003

            gravity = unitvector:mul((G * p1.states.mass * p2.states.mass)/(r * r))
            return gravity
        end
    end
end

function forces:electric(p1, p2)
    if p1.states.charge and p2.states.charge then
        q1 = p1.states.charge
        q2 = p2.states.charge
        unitvector = p2.position:sub(p1.position):unit()
        r = p2.position:sub(p1.position):mag()
        f = 0.001
    
        Fe = unitvector:mul((-1 * f * q1 * q2)/(r^2))
        return Fe    
    end
end

function forces:tension(r, f)
    direction = r.endpoint:sub(r.startpoint):unit()
    magnitude = 1 / r.elasticity

    return direction:mul(magnitude)
end

return forces