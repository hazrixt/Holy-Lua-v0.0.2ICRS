-- core/world.lua
World = {
    entities = {},
    rules = {},       -- << important!
    tick = 0,
    running = true
}

-- Adds etnity to the world
function World:add(name)
    local e = { name = name, energy = 10 }
    table.insert(self.entities, e)
    return e
end

-- Adds a rule to the world
function World:rule(name, fn)
    self.rules[name] = fn
end

-- Applies all rules to an entity
function World:apply_rules(e)
    for _, r in pairs(self.rules) do
        r(e)
    end
end

-- Updates all entities
function World:update()
    self.tick = self.tick + 1
    print("\n-- tick", self.tick, "--")

    for i = #self.entities, 1, -1 do
        local e = self.entities[i]
        e.energy = e.energy - 1
        self:apply_rules(e)
        print(e.name, "energy:", e.energy)
    end

    -- Rare miracle
    if self.tick == 5 then
        Miracles.heal_all(5)
    end
end

-- Easter eggs
if self.tick == 7 then
    print("\n[?] The voice whispers: \"It began with some simple curiosity and passion, didn't it, Icarus?\"")
end

if self.tick == 42 then
    print("\n[?] The voice whispers: \"You're doing such a great job, you're making mother proud.\"")
end

if self.tick == 108 then
    print("\n[?] The voice whispers: \"Don't stop here. The fun has just started.\"")
end


-- loops the world
function World:start()
    while #self.entities > 0 do
        self:update()
        os.execute("timeout /t 1 > nul")
    end
    print("The world is empty.")
end
