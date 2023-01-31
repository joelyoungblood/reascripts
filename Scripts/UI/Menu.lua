package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
local img_path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/res'

local Menu = {}

function Menu.CreateMainScene(item_list, color, icon, window)
    rtk.add_image_search_path(img_path)
    local mainScene = {
        init=function(app, screen)
            rtk.add_image_search_path(reaper.GetResourcePath() .. '/Scripts/thesublibrarian/res')
            local collection = rtk.FlowBox{bg='#232323', hmargin=5}
                for _, v in ipairs(item_list) do
                    local vbox = rtk.VBox{spacing=5, bmargin=10, tmargin=10, bg='#232323'}
                    local synth_button = rtk.Button{icon=icon, bg='#232323', minw=62, minh=48, scale=0.5, flat=true, elevation=0, color='#232323', gradient=0.0}
                    vbox:add(synth_button, {valign='top', halign='center'})
                    local label = rtk.Text{string.upper(v.name), color='#808787', textalign='center'}
                    vbox:add(label, {halign='center', valign='top'})
                
                    synth_button.onclick = function ()
                        local command_id = reaper.NamedCommandLookup(v.command)
                        reaper.Main_OnCommandEx(command_id, 0, 0)
                        window:close()
                    end
                
                    synth_button.onmouseenter = function ()
                        synth_button:attr('bg', '#232323')
                        label:attr('color', color)
                    end

                    synth_button.onmouseleave = function ()
                        label:attr('color', '#808787')
                    end

                    collection:add(vbox)
                end
                screen.widget = collection
            end
    }
    return mainScene
end

function Menu.CreateSynthCategoryMenu(item_list, window)
    rtk.add_image_search_path(img_path)
    local mainScene = {
        init=function(app, screen)
            rtk.add_image_search_path(reaper.GetResourcePath() .. '/Scripts/thesublibrarian/res')
            local collection = rtk.FlowBox{bg='#232323', hmargin=5}
                for _, v in ipairs(item_list) do
                    local vbox = rtk.VBox{spacing=5, bmargin=10, tmargin=10, bg='#232323'}
                    local synth_button = rtk.Button{icon=v.icon, bg='#232323', minw=62, minh=48, scale=0.5, flat=true, elevation=0, color='#232323', gradient=0.0}
                    vbox:add(synth_button, {valign='top', halign='center'})
                    local label = rtk.Text{string.upper(v.name), color='#808787', textalign='center'}
                    vbox:add(label, {halign='center', valign='top'})
                
                    synth_button.onclick = function ()
                        local command_id = reaper.NamedCommandLookup(v.command)
                        reaper.Main_OnCommandEx(command_id, 0, 0)
                        window:close()
                    end
                
                    synth_button.onmouseenter = function ()
                        label:attr('color', v.color)
                    end

                    synth_button.onmouseleave = function ()
                        label:attr('color', '#808787')
                    end

                    collection:add(vbox)
                end
                screen.widget = collection
            end
    }
    return mainScene
end

return Menu