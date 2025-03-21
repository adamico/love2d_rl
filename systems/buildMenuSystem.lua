local system = System()

local yui = require("lib.yui")
local Button = yui.Button
local Label = yui.Label
local Spacer = yui.Spacer
local Rows = yui.Rows
local Ui = yui.Ui
Ui.theme = {
    cornerRadius = 0,

    -- font = nil defaults to love.graphics.getFont()

    color = {
        normal   = {bg = { 0.25, 0.25, 0.25}, fg = {0.73, 0.73, 0.73}},
        hovered  = {bg = { 0.19, 0.6, 0.73}, fg = {1, 1, 1}},
        active   = {bg = { 1, 0.6, 0}, fg = {1, 1, 1}}
    }
}

local GUI_WIDTH = 500
local GUI_HEIGHT = 300

local function centerRectOnScreen(w, h)
    local x = math.floor((love.graphics.getWidth() - w) / 2)
    local y = math.floor((love.graphics.getHeight() - h) / 2)

    return x, y
end

-- Creates main menu.
local function makeMainMenu()
    -- Position the UI
    local x,y = centerRectOnScreen(GUI_WIDTH, GUI_HEIGHT)
    local rh = GUI_HEIGHT / 5  -- 5 elements along height

    -- Keep track what's being focused...
    local widgetEnter = function (w)
        -- guiStatus.current = "You're hovering \""..w.text.."\", feel like pressing it?"
    end
    local widgetLeave = function (w)
        -- guiStatus.previous = "So you left \""..w.text.."\"..."
    end

    return Ui:new {
        x = x, y = y,  -- Place UI at the calculated spot

        -- Place the elements in rows from top to bottom
        Rows {
            Label {
                w = GUI_WIDTH, h = rh,
                text = "Like a Rogue"
            },
            Spacer {},
            Button {
                text = "New game",

                onHit = function ()
                    -- guiStatus = { current = "Game started!" }
                    CurrentWorld = Worlds.gamePlay
                end,
                onEnter = widgetEnter,
                onLeave = widgetLeave
            },
            -- Button {
            --     -- ...subsequent widgets _in the same layout_
            --     -- take last widget's size by default.
            --     text = "Continue",

            --     onHit = function()
            --         guiStatus = { current = "Loading game..." }
            --     end,
            --     onEnter = widgetEnter,
            --     onLeave = widgetLeave
            -- },
            -- Button {
            --     text = "Options",

            --     onHit = function()
            --         guiStatus = { current = "Options pressed." }
            --     end,
            --     onEnter = widgetEnter,
            --     onLeave = widgetLeave
            -- },
            -- Button {
            --     text = "Credits",

            --     onHit = function()
            --         guiStatus = { current = "Showcasing credits 8)" }
            --     end,
            --     onEnter = widgetEnter,
            --     onLeave = widgetLeave
            -- },
            Button {
                text = "Quit",

                onHit = function () love.event.quit() end,
                onEnter = widgetEnter,
                onLeave = widgetLeave
            }
        }
    }
end

function system:load()
    Gui = makeMainMenu()
end

return system