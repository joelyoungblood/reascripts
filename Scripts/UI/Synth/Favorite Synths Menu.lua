-- 
-- Menu for favorite synth selection
--

package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/UI/?.lua'
local Menu = require('Menu')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/Data and Models/?.lua'
local Synths = require('Instruments')

if rtk.os.mac then
    rtk.set_theme_overrides {
        default_font={'Apple SD Gothic Neo Bold', 16}
    }
end

local window = rtk.Window{borderless=true, bg='#232323', h=425, w=387, x=433, y=864}

local function main()
    local app = window:add(rtk.Application())
    app.statusbar:hide()
    local close = reaper.NamedCommandLookup('_RS8c4592fbe64fd75e0db53323377602cde2cae889')
    local back = reaper.NamedCommandLookup('_RSa441548662975401c2e841fd2cd09d98b57bcd59')
    app:add_screen(Menu.CreateMainScene(Synths.favorites, '#B286E6', 'fav', window, true, close, back), 'main')
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