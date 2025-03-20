local system = System({
    pool = {"position", "drawable"},
})

function system:draw()
    for _, e in ipairs(self.pool) do
        love.graphics.rectangle(
            "fill",
            e.position.x,
            e.position.y,
            CellSize,
            CellSize
        )
    end
end

return system