local system = System({
    pool = {"position", "velocity"}
})

function system:update(dt)
    for _, e in ipairs(self.pool) do
        e.position.x = e.position.x - (e.position.x - e.grid.x) * e.velocity.amount * dt
        e.position.y = e.position.y - (e.position.y - e.grid.y) * e.velocity.amount * dt
    end
end

return system
