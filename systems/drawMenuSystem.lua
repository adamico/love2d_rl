local moonshine = require("moonshine")

local gaussBlurs = {
    moonshine(moonshine.effects.fastgaussianblur),
    moonshine(moonshine.effects.fastgaussianblur),
    moonshine(moonshine.effects.fastgaussianblur),
    moonshine(moonshine.effects.fastgaussianblur),
    moonshine(moonshine.effects.fastgaussianblur),
}
gaussBlurs[1].fastgaussianblur.taps = 11
gaussBlurs[2].fastgaussianblur.taps = 15
gaussBlurs[3].fastgaussianblur.taps = 21
gaussBlurs[4].fastgaussianblur.taps = 37
gaussBlurs[5].fastgaussianblur.taps = 51

local system = System()

function system:draw()
    if ModalActive then
		gaussBlurs[GausWeen](function()
			MenuScene:draw()
		end)
		ModalScene:draw()
	else
		MenuScene:draw()
	end
end

function system:resize(w, h)
    Menu:draw(0, 0, w, h)
	MenuScene:resize(w, h)
end

return system