-- Set search paths
package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')

package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/src/menus/?.lua'
local Menu = require('Menu')

package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/src/data/?.lua'
local Synths = require('Synths')


if rtk.os.mac then
    rtk.set_theme_overrides {
        default_font={'Apple SD Gothic Neo Bold', 20}
    }
end

-- local contextTCP = 'tcp|track'
-- local context = utilities.get_context_str()
-- 433 / 423
local window = rtk.Window{borderless=true, bg='#232323', h=385, w=620, x=433, y=631}

-- reaper.Main_OnCommandEx(integer command, integer flag, ReaProject proj)
-- Performs an action belonging to the main action section. To perform non-native actions (ReaScripts, custom or extension plugins' actions) safely, see NamedC

local function main()
    local app = window:add(rtk.Application())
    app.statusbar:hide()
    app:add_screen(Menu.CreateMainScene(Synths.favorites, '#B286E6', 'fav', window), 'main')
    window:open()
end

--CreateMainScene(item_list, color, icon, window)

local function escape_loop()
      local char = gfx.getchar()
      if char ~= 27 and char ~= -1 then
        reaper.defer(escape_loop)
      end
end

escape_loop()
main()