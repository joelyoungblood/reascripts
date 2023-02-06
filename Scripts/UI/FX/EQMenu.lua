-- 
-- Menu for adding core fx to selected track
--

package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/UI/?.lua'
local Menu = require('Menu')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/Data and Models/FX.lua'
local FX = require('FX')
local types = FX.EQs

if rtk.os.mac then
    rtk.set_theme_overrides {
        default_font={'Apple SD Gothic Neo Bold', 16}
    }
end

local window = rtk.Window{borderless=true, bg='#232323', h=425, w=387, x=433, y=864}

local function main()
    local app = window:add(rtk.Application())
    app.statusbar:hide()
    local close = reaper.NamedCommandLookup('_RS8e40c92f733b81a2c10e13c8a33957a09a4c6e25')
    local back = reaper.NamedCommandLookup('_RS8edd5a5c8d7f12253ffb87239b73dff3f87261e4')
    app:add_screen(Menu.CreateMainScene(types, '#B286E6', 'equalizers', window, true, close, back), 'main')
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