-- 
-- Menu for synth category selection
--

package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/UI/?.lua'
local Menu = require('Menu')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/Data and Models/?.lua'
local Synths = require('Instruments')

if rtk.os.mac then
    rtk.set_theme_overrides{
        default_font={'Apple SD Gothic Neo Bold', 16}
    }
end

local window = rtk.Window{borderless=true, bg='#232323', h=475, w=290, x=433, y=785}

local function main()
    local app = window:add(rtk.Application())
    app.statusbar:hide()
    local nativeCloseActionId = reaper.NamedCommandLookup('_RSa441548662975401c2e841fd2cd09d98b57bcd59')
    app:add_screen(Menu.CreateCategoryMenu(Synths.synthCategories, window, nativeCloseActionId), 'synthcat')
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