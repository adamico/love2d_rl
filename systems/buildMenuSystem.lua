local helium = require("helium")

MenuScene = helium.scene.new(true)
ModalScene = helium.scene.new(true)

ModalActive = false

local function switchToModal()
	ModalActive = true
	GaussWeen = 1
	MenuScene:deactivate()
	ModalScene:activate()
end

local function switchToMenu()
	ModalActive = false
	GaussWeen = 0
	ModalScene:deactivate()
	MenuScene:activate()
end

local system = System()

function system:load()
    GaussWeen = 0
    MenuScene:draw()

    Modal = require("main-menu.modal")({switch = switchToMenu}, 400, 400)
    Menu = require("main-menu.menu")({switch = switchToModal}, 200, 200)
    ModalScene:activate()
    Modal:draw(400, 200)
    MenuScene:activate()
    Menu:draw(0, 0, 1200, 800)

    local fsc = love.graphics.newCanvas(1200/4, 800/4)
end

return system