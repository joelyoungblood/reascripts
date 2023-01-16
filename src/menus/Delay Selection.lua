-- Set search paths
package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
-- There *must* be a better way of importing modules from differant directories, this feels like SUCH a hack...
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/?.lua'
local templates = require('TrackTemplates')

local img_path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/res'

if rtk.os.mac then
    rtk.set_theme_overrides{
        default_font={'Apple SD Gothic Neo Bold', 20}
    }
end

local window = rtk.Window{borderless=true, bg='#232323', h=315, w=760, x=434, y=973}

local mainScene = {
    init=function(_, screen)
        local collection = rtk.FlowBox{bg='#232323'}
            for i,v in ipairs(templates.Delays) do
                local vbox = rtk.VBox()
                local synth_button = rtk.Button{icon='delay', bg='#232323', flat=true, elevation=0, color='#232323'}
                vbox:add(synth_button, {valign='center', halign='center'})
                local label = rtk.Text{string.upper(v.name), color='#808787', textalign='center'}
                vbox:add(label, {halign='center', valign='top'})
                
                synth_button.onclick = function ()
                    local command_id = reaper.NamedCommandLookup(v.command)
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