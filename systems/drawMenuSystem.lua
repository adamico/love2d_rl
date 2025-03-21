local FONT_SIZE = 32
local guiFont = love.graphics.newFont('fonts/PixelDroidMenu.ttf', FONT_SIZE)

local system = System()

function system:draw()
  love.graphics.setFont(guiFont)
  -- Print UI status
  -- local y = 0
  -- if guiStatus.previous ~= nil then
  --     love.graphics.print(guiStatus.previous, 0, y)
  --     y = y + guiFont:getHeight()
  -- end
  -- love.graphics.print(guiStatus.current, 0, y)

  -- Draw UI
  Gui:draw()
end

function system:resize(w, h)

end

return system