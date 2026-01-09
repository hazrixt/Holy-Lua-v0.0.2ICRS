-- scripture/miracles.lua

Miracles = {}

-- Miracle: restore energy
function Miracles.heal_all(amount)
    print("A miracle occurs: healing all entities.")
    for _, e in ipairs(World.entities) do
        e.energy = e.energy + amount
    end
end

-- Miracle: resurrect one being
function Miracles.resurrect(name)
    print("A miracle occurs: resurrection.")
    World:add(name)
end
