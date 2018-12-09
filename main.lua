local system = require("lib.system")()
local vector3 = require("lib.vector3")
local vector2 = require("lib.vector2")
local timer = require("lib.timer")

local particle = require("objects.particle")
local rope = require("objects.rope")

local forces = require("forces")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.window.setMode(800, 600, {vsync = false})
    width, height = love.graphics.getDimensions()

    gametime = timer()
    gametime:start()

    d1 = particle(vector3(width / 1.9, height / 2, 0), vector3(0, 0.006, 0), vector3(0, 0, 0), {mass = 10, charge =  -5})
    d2 = particle(vector3(2 * width / 3, height / 2, 0), vector3(0, 0, 0), vector3(0, 0, 0), {mass = 60, charge = 10})

    r1 = rope(vector3(200, height / 2, 0), vector3(400, 400, 0))

    system:addparticles({d1, d2})
end

function love.update()
    gametime:update()

    r1.endpoint = d1.position
    --d1.forces = forces:tension(r1)
    --print(d1.position.x, d1.position.y)

    for p = 1, #system.particles do 
        particle = system.particles[p]
        particle:update(gametime:getTime())

        if system.particles[p + 1] then
            p2 = system.particles[p + 1]
            --particle.force = forces:gravity(particle, p2):add(forces:electric(particle, p2))    
            particle.force = forces:electric(particle, p2) 
            --p2.force = forces:electric(p2, particle)  
        end
    end
end

function love.draw()
    love.graphics.print("Simulation time: " .. gametime:getTime() .. ", FPS: " .. love.timer.getFPS(), 10, 10)

    for p = 1, #system.particles do 
        particle = system.particles[p]
        particle:draw()
    end
    
    r1:draw()
end
