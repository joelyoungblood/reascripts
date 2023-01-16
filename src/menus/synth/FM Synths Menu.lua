-- Set search paths
package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')

local img_path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/resources'

if rtk.os.mac then
    rtk.set_theme_overrides{
        default_font={'Apple SD Gothic Neo Bold', 20}
    }
end

local window = rtk.Window{borderless=true, bg='#232323', h=265, w=632, x=434, y=751}

local fav_synths = {
    [1]='Bazille', -- 45
    [2]='Blue3', -- 46
    [3]='CZ V', -- 110
    [4]='F-EM', -- 108
    [5]='Imagine', -- 112
    [6]='Kaivo', -- 113
    [7]='OPS7', -- 109
    [8]='OPSIX', -- 111
    [9]='Sines', -- 57
    [10]='Triple Cheese', -- 114
}

local favs_command_ids = {
    [1]='_S&M_ADD_TRTEMPLATE45', -- Bazille
    [2]='_S&M_ADD_TRTEMPLATE46',
    [3]='_S&M_ADD_TRTEMPLATE110',
    [4]='_S&M_ADD_TRTEMPLATE108',
    [5]='_S&M_ADD_TRTEMPLATE112',
    [6]='_S&M_ADD_TRTEMPLATE113',
    [7]='_S&M_ADD_TRTEMPLATE109',
    [8]='_S&M_ADD_TRTEMPLATE111',
    [9]='_S&M_ADD_TRTEMPLATE57',
    [10]='_S&M_ADD_TRTEMPLATE114'
}

local mainScene = {
    init=function(app, screen)
        local collection = rtk.FlowBox{bg='#232323'}
            for i,v in ipairs(fav_synths) do
                local vbox = rtk.VBox{spacing=5, bmargin=10, tmargin=10}
                local synth_button = rtk.Button{icon='fm', bg='#232323', minw=62, minh=48, scale=0.5, flat=true, elevation=0, color='#232323'}
                vbox:add(synth_button, {valign='top', halign='center'})
                local label = rtk.Text{string.upper(v), color='#808787'}
                vbox:add(label, {halign='center', valign='top'})
                
                synth_button.onclick = function ()
                    local command_id = reaper.NamedCommandLookup(favs_command_ids[i])
                    reaper.Main_OnCommandEx(command_id, 0, 0)
                    window:close()
                end
                
                synth_button.onmouseenter = function ()
                    label:attr('color', '#EE6A6F')
                end

                synth_button.onmouseleave = function ()
                    label:attr('color', '#808787')
                end

                collection:add(vbox)
            end
            screen.widget = collection
        end
}

-- reaper.Main_OnCommandEx(integer command, integer flag, ReaProject proj)
-- Performs an action belonging to the main action section. To perform non-native actions (ReaScripts, custom or extension plugins' actions) safely, see NamedC

local function main()
    rtk.add_image_search_path(img_path)
    local app = window:add(rtk.Application())
    app.statusbar:hide()
    app:add_screen(mainScene, 'main')
    window:open()
end

local function mainloop()    
      local char = gfx.getchar()
      if char ~= 27 and char ~= -1 then
        reaper.defer(mainloop)
      end
end

mainloop()
main()