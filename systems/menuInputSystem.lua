local system = System()


function system:keypressed(key, scancode, _isrepeat)
    if key == "escape" then
        love.event.quit()
    end
end

function system:mousepressed(x, y, button, istouch)
end

function system:mousereleased(x, y, button, istouch)
end

return system