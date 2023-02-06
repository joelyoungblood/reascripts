-- -- 
-- -- Menu for synth category selection
-- --

-- package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
-- local rtk = require('rtk')
-- package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/UI/?.lua'
-- local Menu = require('Menu')
-- package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/Data and Models/FX Types.lua'
-- local FXTypes = require('FXType')

-- local fxTypes = FXTypes.Type

-- if rtk.os.mac then
--     rtk.set_theme_overrides {
--         default_font={'Apple SD Gothic Neo Bold', 16}
--     }
-- end

-- local window = rtk.Window{borderless=true, bg='#232323', h=300, w=350, x=433, y=989}

-- local function main()
--     local app = window:add(rtk.Application())
--     app.statusbar:hide()
--     local nativeCloseActionID = reaper.NamedCommandLookup('_RS8edd5a5c8d7f12253ffb87239b73dff3f87261e4')
--     app:add_screen(Menu.CreateCategoryMenu(fxTypes, window, nativeCloseActionID), 'main')
--     window:open()
-- end

-- local function escape_loop()
--       local char = gfx.getchar()
--       if char ~= 27 and char ~= -1 then
--         reaper.defer(escape_loop)
--       end
-- end

-- escape_loop()
-- main()
-- 
-- Menu for synth category selection
--

package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/UI/?.lua'
local Menu = require('Menu')
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/Data and Models/FX Types.lua'
local FXTypes = require('FXType')

if rtk.os.mac then
    rtk.set_theme_overrides{
        default_font={'Apple SD Gothic Neo Bold', 16}
    }
end

local window = rtk.Window{borderless=true, bg='#232323', h=355, w=292, x=428, y=921}

local function main()
    local app = window:add(rtk.Application())
    app.statusbar:hide()
    local nativeCloseActionId = reaper.NamedCommandLookup('_RS8edd5a5c8d7f12253ffb87239b73dff3f87261e4')
    app:add_screen(Menu.CreateCategoryMenu(FXTypes.Type, window, nativeCloseActionId), 'synthcat')
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
