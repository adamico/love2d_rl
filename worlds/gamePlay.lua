local gamePlay = World()

gamePlay:addSystems(
    Systems.drawEntitiesSystem,
    Systems.drawMessagesSystem,
    Systems.drawMapSystem,
    Systems.moveSystem,
    Systems.gamePlayInputSystem
)

gamePlay:addEntity(Entities.player)
gamePlay:addEntity(Entities.message)
gamePlay:addEntity(Entities.map)

return gamePlay