package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')

package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/src/menus/?.lua'
local Menu = require('Menu')

package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/src/data/?.lua'
local templates = require('TrackTemplates')

if rtk.os.mac then
    rtk.set_theme_overrides {
        default_font={'Apple SD Gothic Neo Bold', 16}
    }
end

local window = rtk.Window{borderless=true, bg='#232323', h=500, w=520, x=433, y=788}

local function main()
    local app = window:add(rtk.Application())
    app.statusbar:hide()
    app:add_screen(Menu.CreateMainScene(templates.Delays, '#F4794A', 'delay', window), 'main')
    window:open()
end

local function escape_loop()
      local char = gfx.getchar()
      if char ~= 27 and char ~= -1 then
        reaper.defer(escape_loop)
      end
end

escape_loop()
main()
