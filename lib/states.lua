local class = require("lib.class")
local states = class:derive("states")

function states:new(states)
    self.states = states
    self.state = nil
end

function states:set(state)
    if self.states[state] then
        self.state = state
    end
end

function states:add(state)
    if self.states[state] == nil then
        table.insert(self.states, state)
    end
end

function states:remove(state)
    if self.states[state] then
        table.remove(self.states, state)
    end
end

return states