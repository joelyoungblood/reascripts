-- Set search paths
package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')

local img_path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/resources'

if rtk.os.mac then
    rtk.set_theme_overrides{
        default_font={'Apple SD Gothic Neo Bold', 20}
    }
end

-- 685 - 385 = 300
-- 655 - 385 = 270
-- 631 - 

-- local contextTCP = 'tcp|track'
-- local context = utilities.get_context_str()
-- 433 / 423
local window = rtk.Window{borderless=true, bg='#232323', h=655, w=777, x=434, y=361}
-- utilities.Msg(context)

-- Combine these two tables into one dictionary and use that to assign names and actions

local fav_synths = {
    [1]='Aalto', -- 67\
    [2]='Ace', -- 150
    [3]='Avenger', -- 88
    [4]='Blue3', -- 46
    [5]='Cursus Vereor', -- 47
    [6]='Dune3', -- 48
    [7]='Granulizer 2', -- 151
    [8]='Hive', -- 49
    [9]='HY-POLY', -- 50
    [10]='Icarus', -- 87
    [11]='Loquelic Vereor', -- 52
    [12]='Manis Iteritas', -- 53
    [13]='Nemesis', -- 148
    [14]='Pigments', -- 127
    [15]='Predator3', -- 54
    [16]='Quanta 2', -- 128
    [17]='Rapid', -- 55
    [18]='Serum', -- 129
    [19]='Sinc Vereor', -- 56
    [20]='Spire', -- 58
    [21]='Sylenth1', -- 149
    [22]='Synthmaster2', -- 60
    [23]='UVI Falcon', -- 61
    [24]='Virt Vereor', -- 62
    [25]='Vital', -- 63
    [26]='Warlock', -- 64
    [27]='Waverazor', -- 65
    [28]='Zebra2', -- 66
}
-- must match above order or else fucky results ensue
local favs_command_ids = {
    [1]='_S&M_ADD_TRTEMPLATE67', -- Aalto
    [2]='_S&M_ADD_TRTEMPLATE150', -- Ace
    [3]='_S&M_ADD_TRTEMPLATE88', -- Avenger
    [4]='_S&M_ADD_TRTEMPLATE46', -- Blue3
    [5]='_S&M_ADD_TRTEMPLATE47', -- Cursus Vereor
    [6]='_S&M_ADD_TRTEMPLATE48', -- Dune3
    [7]='_S&M_ADD_TRTEMPLATE151', -- Granulizer 2
    [8]='_S&M_ADD_TRTEMPLATE49', -- Hive
    [9]='_S&M_ADD_TRTEMPLATE50', -- HY-POLY
    [10]='_S&M_ADD_TRTEMPLATE87', -- Icarus
    [11]='_S&M_ADD_TRTEMPLATE52', -- Loquelic Vereor
    [12]='_S&M_ADD_TRTEMPLATE53', -- Manis Iteritas
    [13]='_S&M_ADD_TRTEMPLATE148', -- Nemesis
    [14]='_S&M_ADD_TRTEMPLATE127', -- Pigments
    [15]='_S&M_ADD_TRTEMPLATE54', -- Predator3
    [16]='_S&M_ADD_TRTEMPLATE128', -- Quanta 2
    [17]='_S&M_ADD_TRTEMPLATE55', -- Rapid
    [18]='_S&M_ADD_TRTEMPLATE129', -- Serum
    [19]='_S&M_ADD_TRTEMPLATE56', -- Sinc Vereor
    [20]='_S&M_ADD_TRTEMPLATE58', -- Spire
    [21]='_S&M_ADD_TRTEMPLATE149', -- Sylenth1
    [22]='_S&M_ADD_TRTEMPLATE60', -- Synthmaster2
    [23]='_S&M_ADD_TRTEMPLATE61', -- UVI Falcon
    [24]='_S&M_ADD_TRTEMPLATE62', -- Virt Vereor
    [25]='_S&M_ADD_TRTEMPLATE63', -- Vital
    [26]='_S&M_ADD_TRTEMPLATE64', -- Warlock
    [27]='_S&M_ADD_TRTEMPLATE65', -- Waverazor
    [28]='_S&M_ADD_TRTEMPLATE66', -- Zebra2
}

local mainScene = {
    init=function(app, screen)
        local collection = rtk.FlowBox{bg='#232323'}
            for i,v in ipairs(fav_synths) do
                local vbox = rtk.VBox{spacing=5, bmargin=10, tmargin=10}
                local synth_button = rtk.Button{icon='modern', bg='#232323', minw=62, minh=48, scale=0.5, flat=true, elevation=0, color='#232323'}
                vbox:add(synth_button, {valign='top', halign='center'})
                local label = rtk.Text{string.upper(v), color='#808787'}
                vbox:add(label, {halign='center', valign='top'})
                
                synth_button.onclick = function ()
                    local command_id = reaper.NamedCommandLookup(favs_command_ids[i])
                    reaper.Main_OnCommandEx(command_id, 0, 0)
                    window:close()
                end
                
                synth_button.onmouseenter = function ()
                    label:attr('color', '#6BACEC')
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

local function escape_loop()    
      local char = gfx.getchar()
      if char ~= 27 and char ~= -1 then
        reaper.defer(escape_loop)
      end
end

escape_loop()
main()