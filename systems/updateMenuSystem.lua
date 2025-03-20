local system = System()
local flux = require("flux")

local accumulator = 0

function system:update(dt)
    flux.update(dt)
	MenuScene:update(dt)

	if ModalActive then
		ModalScene:update(dt)
	end

	if GaussWeen > 0 then
		accumulator = accumulator + dt
	end

	if GaussWeen > 0 and GaussWeen < 5 and accumulator > 0.042 then
		accumulator = 0
		GaussWeen = GaussWeen + 1
	end
end

return system