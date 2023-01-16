-- Set search paths
package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
-- There *must* be a better way of importing modules from differant directories, this feels like SUCH a hack...
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/?.lua'
local utilities = require('tslutility')

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
local window = rtk.Window{borderless=true, bg='#232323', h=655, w=627, x=434, y=361}
-- utilities.Msg(context)

-- Combine these two tables into one dictionary and use that to assign names and actions

local fav_synths = {
    [1]='CS-80 V4', -- 115
    [2]='Diva', -- 32
    [3]='DX7 V', -- 153
    [4]='Eight Voice', -- 123
    [5]='GX-80', -- 34,
    [6]='Jun-6V', -- 125
    [7]='Jup-8 V4', -- 119
    [8]='M-tron', -- 117
    [9]='M-tron mkii', -- 42
    [10]='MS-20V', -- 154
    [11]='OB-E', -- 35
    [12]='OB-XD', -- 116
    [13]='Obsession', -- 36
    [14]='OBXA V', -- 118
    [15]='Oddity3', -- 37
    [16]='OPS7', -- 109
    [17]='Repro-5', -- 39
    [18]='Saurus', -- 126
    [19]='Model 72', -- 124
    [20]='Model 82', -- 122
    [21]='Model 84', -- 40,
    [22]='TAL BassLine 101', -- 120
    [23]='TAL J-8', -- 41
    [24]='TAL Sampler', -- 43
    [25]='TAL-UN-LX-V2', -- 121
}
-- must match above order or else fucky results ensue
local favs_command_ids = {
    [1]='_S&M_ADD_TRTEMPLATE115', -- CS-80 V4
    [2]='_S&M_ADD_TRTEMPLATE32', -- Diva
    [3]='_S&M_ADD_TRTEMPLATE153', -- DX7 V
    [4]='_S&M_ADD_TRTEMPLATE123', -- Eight voice
    [5]='_S&M_ADD_TRTEMPLATE34', -- GX-80
    [6]='_S&M_ADD_TRTEMPLATE125', -- Jun-6V
    [7]='_S&M_ADD_TRTEMPLATE119', -- Jup-8 V4
    [8]='_S&M_ADD_TRTEMPLATE117', -- M-tron
    [9]='_S&M_ADD_TRTEMPLATE42', -- M-tron mkii
    [10]='_S&M_ADD_TRTEMPLATE154', -- MS-20V
    [11]='_S&M_ADD_TRTEMPLATE35', -- OB-E
    [12]='_S&M_ADD_TRTEMPLATE116', -- OB-XD
    [13]='_S&M_ADD_TRTEMPLATE36', -- Obsession
    [14]='_S&M_ADD_TRTEMPLATE118', -- OBXA V
    [15]='_S&M_ADD_TRTEMPLATE37', -- Oddity3
    [16]='_S&M_ADD_TRTEMPLATE109', -- OPS7
    [17]='_S&M_ADD_TRTEMPLATE39', -- Repro-5
    [18]='_S&M_ADD_TRTEMPLATE126', -- Saurus
    [19]='_S&M_ADD_TRTEMPLATE124', -- Softube Model 72
    [20]='_S&M_ADD_TRTEMPLATE122', -- Softube Model 82
    [21]='_S&M_ADD_TRTEMPLATE40', -- Model 84
    [22]='_S&M_ADD_TRTEMPLATE120', -- TAL BassLine
    [23]='_S&M_ADD_TRTEMPLATE41', -- TAL J-8
    [24]='_S&M_ADD_TRTEMPLATE43', -- TAL Sampler
    [25]='_S&M_ADD_TRTEMPLATE121', -- TAL UNO
}

local mainScene = {
    init=function(app, screen)
        local collection = rtk.FlowBox{bg='#232323'}
            for i,v in ipairs(fav_synths) do
                local vbox = rtk.VBox{spacing=5, bmargin=10, tmargin=10}
                local synth_button = rtk.Button{icon='vintage', bg='#232323', minw=62, minh=48, scale=0.5, flat=true, elevation=0, color='#232323'}
                vbox:add(synth_button, {valign='top', halign='center'})
                local label = rtk.Text{string.upper(v), color='#808787'}
                vbox:add(label, {halign='center', valign='top'})
                
                synth_button.onclick = function ()
                    local command_id = reaper.NamedCommandLookup(favs_command_ids[i])
                    reaper.Main_OnCommandEx(command_id, 0, 0)
                    window:close()
                end
                
                synth_button.onmouseenter = function ()
                    label:attr('color', '#F4794A')
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