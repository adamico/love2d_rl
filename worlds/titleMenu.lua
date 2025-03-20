local titleMenu = World()

titleMenu:addSystems(
    Systems.buildMenuSystem,
    Systems.drawMenuSystem,
    Systems.updateMenuSystem,
    Systems.menuInputSystem
)

return titleMenu