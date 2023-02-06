--
-- Reverb selection menu
--

package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/UI/?.lua'
local Menu = require('Menu')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/Data and Models/?.lua'
local templates = require('TrackTemplates')

if rtk.os.mac then
    rtk.set_theme_overrides {
        default_font={'Apple SD Gothic Neo Bold', 16}
    }
end

local window = rtk.Window{borderless=true, bg='#232323', w=405, h=737, x=433, y=547}

local function main()
    local app = window:add(rtk.Application())
    app.statusbar:hide()
    local closeMenuNativeCommandID = reaper.NamedCommandLookup('_RSfee16deeccb608969b1be7ca3afe83ed6631b654')
    app:add_screen(Menu.CreateMainScene(templates.Reverbs, '#D22D2C', 'reverb', window, false, closeMenuNativeCommandID), 'main')
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
