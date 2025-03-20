local system = System()

function system:draw()
    local map = Entities.map
    for y=1, #map.mapData.value do
        for x=1, #map.mapData.value[y] do
            if map.mapData.value[y][x] == 1 then
                love.graphics.rectangle(
                    "line",
                    x * CellSize,
                    y * CellSize,
                    CellSize,
                    CellSize
                )
            end
        end
    end
end

return system