-- Set search RTK path
package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')

package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/src/data/?.lua'
local Synths = require('Synths')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/src/menus/?.lua'
local Menu = require('Menu')

if rtk.os.mac then
    rtk.set_theme_overrides{
        default_font={'Apple SD Gothic Neo Bold', 18}
    }
end

local window = rtk.Window{borderless=true, bg='#000000', h=452, w=387, x=434, y=836}

local function main()
    local app = window:add(rtk.Application())
    app.statusbar:hide()
    -- app:add_screen(Menu.CreateMainScene(Synths.categories, '#9CDFC5', 'vintage', window), 'main')
    app:add_screen(Menu.CreateSynthCategoryMenu(Synths.categories, window), 'synthcat')
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