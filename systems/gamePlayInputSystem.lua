local system = System()

local keys = {
    up = { "w", "up", "kp8" },
    down = { "s", "down", "kp2" },
    left = { "a", "left", "kp4" },
    right = { "d", "right", "kp6" },
}

local function contains(array, item)
    for _, v in ipairs(array) do
        if v == item then
            return true
        end
    end
    return false
end

local function canMoveTo(entity, x, y)
    if Entities.map.mapData.value[(entity.grid.y / CellSize) + y][(entity.grid.x / CellSize) + x] == 0 then
        return true
    end
    return false
end

local function sendMessage(message, string)
    if message.text.base == string then
        message.repeated.counter = message.repeated.counter + 1
        message.text.base = string
        message.text.repeated = "x"..message.repeated.counter
    else
        message.repeated.counter = 0
        message.text.base = string
    end
end

local function tryMoving(entity, x, y)
    if canMoveTo(entity, x, y) then
        entity.grid.y = entity.grid.y + CellSize * y
        entity.grid.x = entity.grid.x + CellSize * x
    else
        sendMessage(Entities.message, "the way is obstructed")
    end
end

function system:keypressed(_key, scancode, _isrepeat)
    local e = Entities.player
    if contains(keys.up, scancode) then
        tryMoving(e, 0, -1)
    elseif contains(keys.down, scancode) then
        tryMoving(e, 0, 1)
    elseif contains(keys.left, scancode) then
        tryMoving(e, -1, 0)
    elseif contains(keys.right, scancode) then
        tryMoving(e, 1, 0)
    elseif scancode == "escape" then
        CurrentWorld = Worlds.titleMenu
    end
end


return system