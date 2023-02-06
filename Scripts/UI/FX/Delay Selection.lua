--
-- Open delay selection menu
--

package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/UI/?.lua'
local Menu = require('Menu')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/Data and Models/?.lua'
local templates = require('TrackTemplates')
local delays = templates.Delays

if rtk.os.mac then
    rtk.set_theme_overrides {
        default_font={'Apple SD Gothic Neo Bold', 16}
    }
end

local window = rtk.Window{borderless=true, bg='#232323', h=584, w=494, x=433, y=702}

local function main()
    local app = window:add(rtk.Application())
    app.statusbar:hide()
    local nativeCommandID = reaper.NamedCommandLookup('_RS49d025397978d1e8575a1b952751b77e87929136')
    app:add_screen(Menu.CreateMainScene(delays, '#F4794A', 'delay', window, false, nativeCommandID), 'main')
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
