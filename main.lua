ECS = require("concord")

CellSize = 32

Keys = {
    up = { "w", "up", "kp8" },
    down = { "s", "down", "kp2" },
    left = { "a", "left", "kp4" },
    right = { "d", "right", "kp6" },
}

Entity    = ECS.entity
Component = ECS.component
System    = ECS.system
World     = ECS.world

function love.load()
    love.window.setMode(1200, 800, {resizable=true})

    ECS.utils.loadNamespace("components")

    Systems = {}
    ECS.utils.loadNamespace("systems", Systems)

    Entities = {}
    ECS.utils.loadNamespace("entities", Entities)

    Worlds = {}
    ECS.utils.loadNamespace("worlds", Worlds)

    CurrentWorld = Worlds.titleMenu
    CurrentWorld:emit("load")
end

function love.update(dt)
    CurrentWorld:emit("update", dt)
end

function love.resize(w, h)
    CurrentWorld:emit("resize", w, h)
end

function love.draw()
    CurrentWorld:emit("draw")
end

function love.mousepressed(x, y, button, istouch)
    CurrentWorld:emit("mousepressed", x, y, button, istouch)
end

function love.mousereleased(x, y, button, istouch)
    CurrentWorld:emit("mousereleased", x, y, button, istouch)
end

function love.keypressed(key, scancode, isrepeat)
    CurrentWorld:emit("keypressed", key, scancode, isrepeat)
end