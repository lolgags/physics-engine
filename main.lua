local vector3 = require("lib.vector3")
local vector2 = require("lib.vector2")
local timer = require("lib.timer")
local particle = require("objects.particle")

local forces = require("forces")

gametime = timer()
gametime:start()

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    width, height = love.graphics.getDimensions()

    testparticle = particle(vector3(width / 3, height / 2, 0), vector3(0, 0, 0), vector3(0, 0, 0), 20, -1)
    testparticle2 = particle(vector3(2 * width / 3, height / 2, 0), vector3(0, 0, 0), vector3(0, 0, 0), 0.5, -1)
    testparticle3 = particle(vector3(width / 2, height / 3, 0), vector3(0, 0, 0), vector3(0, 0, 0), 5, 5)
end

function love.update()
    gametime:update()

    testparticle:update(gametime:getTime())
    testparticle2:update(gametime:getTime())
    testparticle3:update(gametime:getTime())

    mousevector = vector2(love.mouse.getX(), love.mouse.getY())
    mousedistance = mousevector:distance(vector2(testparticle.position.x, testparticle.position.y))

    if mousedistance <= testparticle.mass * 3 then
        if love.mouse.isDown("1") then
            testparticle.position.x = mousevector.x
            testparticle.position.y = mousevector.y
        end
    end

    --testparticle.force = forces:gravity(testparticle, testparticle2)
    --testparticle2.force = forces:electric(testparticle2, testparticle)
    testparticle3.force = forces:electric(testparticle3, testparticle):add(forces:electric(testparticle3, testparticle2))

    print(gametime:getTime(), mousedistance)
end

function love.draw()
    testparticle:draw()
    testparticle2:draw()
    testparticle3:draw()
end
