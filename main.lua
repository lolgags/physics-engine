local vector3 = require("lib.vector3")
local timer = require("lib.timer")
local particle = require("objects.particle")

local forces = require("forces")

gametime = timer()
gametime:start()

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    width, height = love.graphics.getDimensions()

    testparticle = particle(vector3(width / 2, height / 2, 0), vector3(0, 0, 0), vector3(0, 0, 0), 20)
    testparticle2 = particle(vector3(width / 4, height / 2, 0), vector3(0.010, 0.01, 0), vector3(0, 0, 0), 10)
end

function love.update()
    gametime:update()

    testparticle:update(gametime:getTime())
    testparticle2:update(gametime:getTime())

    --testparticle.force = forces:gravity(testparticle, testparticle2)
    testparticle2.force = forces:gravity(testparticle2, testparticle)

    print(gametime:getTime())
end

function love.draw()
    testparticle:draw()
    testparticle2:draw()
end
