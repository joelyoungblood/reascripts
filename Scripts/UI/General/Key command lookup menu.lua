package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')

-- Have a differant menu for context, so it can be triggered with its own action, however, let's *link* to it from here

if rtk.os.mac then
    rtk.set_theme_overrides {
        default_font={'Apple SD Gothic Neo Bold', 16}
    }
end

local appState = {
    highlightedTab = 1,
    selectedTab = 1,
    defaultTextColor = '#808787',
    highlightTextColor = '#FFB383',
}

local window = rtk.Window{borderless=true, bg='#232323', h=200, w=500, x=434, y=917}
local app = window:add(rtk.Application())

window.onkeypresspost = function(self, event)
    if not event.handled and event.keycode == rtk.keycodes.ESCAPE and
       not window.docked then
        -- Prevent default behavior of escape key closing the window
        -- by marking the event as handled.
        window:close()
    end
end

app:add_screen{
    name='main',
    init = function (app, screen)
        local mainContainer = rtk.HBox {fillw='true', bg='#232323'}
        local searchEntry = rtk.Entry {
            placeholder = 'Mario teaches fisting',
            textcolor = 'white',
            fontsize = 18,
            fillw = 'true',
            textwidth = 150,
            border_focused = '#232323',
            border_hover = '#232323',
            blink = true
        }

        searchEntry.onchange = function (event)
            reaper.ShowConsoleMsg(tostring(searchEntry.value))
        end

        mainContainer:add(searchEntry)

        -- create some kind of function to return the appropriate list
        local mainViewport = rtk.Viewport {
            scrollbar_size = 5,
            child = mainContainer,
            vscrollbar = 'always',
            flexh=true,
            fillh=true
        }
		screen.widget = mainContainer
    end
}

local mainScene = {
    init = function(_, screen)
		local mainContainer = rtk.HBox {fillw='true', bg='#232323', }
        local searchEntry = rtk.Entry {
            placeholder = 'Mario teaches fisting',
            textcolor = 'white',
            fontsize = 18,
            fillw = 'true',
            textwidth = 150,
            border_focused = '#232323',
            border_hover = '#232323',
            blink = true
        }

        searchEntry.onchange = function (event)
            reaper.ShowConsoleMsg(tostring(searchEntry.value))
        end

        mainContainer:add(searchEntry)

        -- create some kind of function to return the appropriate list
        local mainViewport = rtk.Viewport {
            scrollbar_size = 5,
            child = mainContainer,
            vscrollbar = 'always',
            flexh=true,
            fillh=true
        }
		screen.widget = mainContainer
	end
}

local function configureToolbar()
    app.statusbar:hide()

    app.toolbar:attr('bg', '#232323')
    -- app.toolbar:add(rtk.Text{text='✕', fontsize=28, spacing=5, x=-10})
    local closeButton = rtk.Button {
        label='✕',
        fontsize='30',
        flat=true,
        surface=false,
        elevation=0,
        textcolor2=appState.defaultTextColor,
        onclick = function ()
            window:close()
        end,
    }

    closeButton.onmouseenter = function ()
        closeButton:attr('textcolor2', appState.highlightTextColor)
    end

    closeButton.onmouseleave = function ()
        closeButton:attr('textcolor2', appState.defaultTextColor)
    end

    app.toolbar:add(closeButton)
    -- onmouseenter = function ()
            
    -- end,
    -- onmouseleave = function ()
    --     closeButton:attr('icon', 'close')
    -- end
end

local function main()
    configureToolbar()
    window:open()
end

local function escape_loop()
	local char = gfx.getchar()
	if char ~= 27 and char ~= -1 then
        window:close()
        reaper.defer(escape_loop)
	end
end

escape_loop()
main()