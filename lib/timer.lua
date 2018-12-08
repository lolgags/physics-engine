local class = require("lib.class")
local timer = class:derive("timer")

function timer:new()
    self.time = 0
    self.microtime = 0

    self.started = false
    self.stopped = false
end

function timer:update()
    if self.started and not self.stopped then
        self.time = self.time + 1
        self.microtime = self.microtime + 0.000001
    end
end

function timer:getTime()
    return self.time
end

function timer:getMicroTime()
    return self.microtime
end

function timer:start()
    if not self.started then
        self.started = true
    end
end

function timer:stop()
    self.stopped = true
end

function timer:resume()
    if self.stopped then
        self.stopped = false
    end
end

return timer