-- Set package path to find rtk installed via ReaPack
package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
-- Load the package
local rtk = require('rtk')
-- Set the module-local log variable for more convenient logging.  Throughout
-- this tutorial we will assume both rtk and log variables have been set.
local log = rtk.log

function main()
    -- Declare the given directory contains light-colored icons (suitable
    -- for dark themes).  Paths are relative to the entrypoint script.
    rtk.add_image_search_path('../img/icons-light', 'light')
    -- We'll create a window, and initialize it as borderless.  The window
    -- isn't open yet, but we can begin adding widgets to it.
    local window = rtk.Window{borderless=true}
    
    local settings = {
        init=function(app, screen)
            screen.toolbar = rtk.HBox()
            local b = screen.toolbar:add(rtk.Button{'Back', icon='18-arrow_back', flat=true})
            b.onclick = function()
                app:pop_screen()
                -- Marks the click event as being handled. This prevents the event from
                -- propagating to lower-zindex widgets. We particularly want to do this
                -- for toolbar buttons on borderless windows, otherwise if the user
                -- inadvertently double clicks the button and we don't mark this click
                -- as having been handled, then the second click will fall through to the
                -- rtk.Window and register as a double click along the toolbar, maximizing
                -- the window.
                return true
            end

            local box = rtk.VBox{margin=10}
            box:add(rtk.Heading{'Appearance', bmargin=5})
            screen.cb_borderless = box:add(rtk.CheckBox{"Use borderless window when undocked"})
            screen.cb_borderless.onchange = function(cb)
                -- In practice you would have some sort of config state that persists across
                -- reloads, probably using reaper.SetExtState().  This here is purely a
                -- runtime change.
                window:attr('borderless', cb.value)
            end
            -- Because the borderless window feature depends on js_ReaScriptAPI to work, we
            -- simply hide the checkbox if the extension isn't available.
            screen.cb_borderless:attr('visible', rtk.has_js_reascript_api)
            screen.widget = box
        end,

        update=function(app, screen)
            -- Whenever the screen is shown, we update the checkbox value based on the
            -- current borderless state.
            screen.cb_borderless:attr('value', window.borderless)
        end,
    }

    local home = {
        -- init() is invoked via rtk.Application:add_screen() below.
        init = function(app, screen)
            local box = rtk.VBox{margin=10}
            -- A button to add a new track to the project.
            local button = box:add(rtk.Button{"Add New Track"})
            button.onclick = function()
                reaper.InsertTrackAtIndex(-1, true)
            end
            screen.widget = box
        end,
    }

    local app = window:add(rtk.Application())
    app:add_screen(home, 'home')
    app:add_screen(settings, 'settings')
    -- We'll also hide the application status bar since we aren't using it.
    app.statusbar:hide()

    local b = app.toolbar:add(rtk.Button{icon='18-settings', flat=true})
    b.onclick = function()
        app:push_screen('settings')
        -- Mark as handled, for the same reason as described above.
        return true
    end
    window:open()
end

rtk.call(main)