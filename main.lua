local vector3 = require("lib.vector3")
local camera = require("lib.camera")
local timer = require("lib.timer")
local particle = require("objects.particle")
local forces = require("forces")

function love.load()
    love.window.setMode(800, 800, {vsync = false}); love.window.setTitle("Integrum Physica")
    width = 800
    height = 800

    testtimer = timer()

    particles = {}
    velocity = vector3(0, 0, 0)
    acceleration = vector3(0, 0, 0)

    p1 = particle(vector3(100, 200, 0), vector3(0.01, 0, 0), acceleration)    
    p2 = particle(vector3(width / 2, height / 2, 0), velocity, acceleration)

    table.insert(particles, p1)
    table.insert(particles, p2)
end

function love.update()
    testtimer:update()
    time = testtimer:getTime()

    -- Update the particles seperately

    p1.force = forces:gravity(p1, p2)
    p2.force = forces:gravity(p2, p1)

    for p = 1, #particles do
        particle = particles[p]
        print(p, particle)
        particle:update(time)
    end

    if love.keyboard.isDown("f") then
        testtimer:start()
    end

    --print(p1.position:sub(p2.position):mag(), p2.position:sub(p1.position):mag())
end

function love.draw()
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    love.graphics.setPointSize(5)
    love.graphics.print("FPS: " .. love.timer.getFPS(), 10, 10)
   
    for index, particle in pairs(particles) do
        love.graphics.points(particle.position.x, particle.position.y)
    end    
end