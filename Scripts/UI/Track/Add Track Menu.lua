--
--
--

package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/Data and Models/?.lua'
local TrackTypes = require('Track Types')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/UI/?.lua'
local Menu = require('Menu')
local types = TrackTypes.Type

if rtk.os.mac then
    rtk.set_theme_overrides{
        default_font={'Apple SD Gothic Neo Bold', 16}
    }
end

local window = rtk.Window{borderless=true, bg='#232323', h=300, w=345, x=429, y=963}

local function main()
    local app = window:add(rtk.Application())
    app.statusbar:hide()
    local closeActionNativeID = reaper.NamedCommandLookup('_RSf4450ac1b0fb7652f78d0e40b950b892a26dc940')
    app:add_screen(Menu.CreateCategoryMenu(types, window, closeActionNativeID), 'trackAdd')
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