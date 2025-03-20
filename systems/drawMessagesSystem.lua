local system = System()

function system:draw()
    local message = Entities.message
    love.graphics.setFont(love.graphics.newFont(20))
    local font = love.graphics.getFont()
    local text = love.graphics.newText(
        font,
        message.text.base.." "..message.text.repeated
    )
    love.graphics.draw(
        text,
        message.position.x,
        message.position.y
    )
end

return system