package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
local img_path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Resources'

local Menu = {}

-- TODO: add a back button. Break the main code chunk up so these functions aren't so repititious

function Menu.CreateMainScene(itemList, color, icon, window, needsBackwardsNavigation, closeActionNativeID, backActionNativeID)
    rtk.add_image_search_path(img_path)
    local mainScene = {
        init=function(_, screen)
            rtk.add_image_search_path(reaper.GetResourcePath() .. '/Scripts/thesublibrarian/res')

            local scene = rtk.VBox()
            local header = rtk.HBox{halign='left', valign='center', fillh=false, bmargin=0}
            local closeButton = rtk.Button{icon='close', flat=true, elevation=0, valign='left', surface=false}

            closeButton.onmouseenter = function ()
                closeButton:attr('icon', 'close highlight')
            end

            closeButton.onmouseleave = function ()
                closeButton:attr('icon', 'close')
            end

            closeButton.onclick = function ()
                reaper.Main_OnCommandEx(closeActionNativeID, 0, 0) -- hack where I pass back in the action id for this menu to close it again
            end

            -- title text...?
            if needsBackwardsNavigation then
                local backButton = rtk.Button{icon='back', flat=true, elevation=0, halign='center', valign='left', rmargin='5', surface=false}
                backButton.onmouseenter = function ()
                    backButton:attr('icon', 'back highlight')
                end

                backButton.onmouseleave = function ()
                    backButton:attr('icon', 'back')
                end

                backButton.onclick = function ()
                    reaper.PreventUIRefresh(1)
                    reaper.Main_OnCommandEx(closeActionNativeID, 0, 0) -- hack for closing window
                    reaper.Main_OnCommandEx(backActionNativeID, 0, 0) -- hack for then opening the proceeding window, probably very heinous...
                    reaper.PreventUIRefresh(-1)
                end

                header:add(backButton)
            end

            header:add(closeButton)
            scene:add(header)

            local collection = rtk.FlowBox{bg='#232323', hmargin=5, bmargin=5}
            for _, v in ipairs(itemList) do
                local vbox = rtk.VBox{spacing=5, bmargin=2, tmargin=2, bg='#232323'}
                local synth_button = rtk.Button{icon=icon, bg='#232323', minw=62, minh=48, scale=0.5, flat=true, elevation=0, color='#232323', gradient=0.0}
                vbox:add(synth_button, {valign='top', halign='center'})
                local label = rtk.Text{string.upper(v.name), color='#808787', textalign='center'}
                vbox:add(label, {halign='center', valign='top'})

                synth_button.onclick = function ()
                    local nativeCommandID = reaper.NamedCommandLookup(v.command)
                    reaper.Main_OnCommandEx(nativeCommandID, 0, 0)
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

            scene:add(collection)
            screen.widget = scene
            end
    }
    return mainScene
end

function Menu.CreateCategoryMenu(itemList, window, closeActionNativeId)
    rtk.add_image_search_path(img_path)
    local mainScene = {
        init=function(_, screen)
            rtk.add_image_search_path(reaper.GetResourcePath() .. '/Scripts/thesublibrarian/res')
            local scene = rtk.VBox()
            local header = rtk.HBox{halign='left', valign='center', fillh=false}
            local closeButton = rtk.Button{icon='close', flat=true, elevation=0, valign='left', surface=false}

            closeButton.onmouseenter = function ()
                closeButton:attr('icon', 'close highlight')
            end

            closeButton.onmouseleave = function ()
                closeButton:attr('icon', 'close')
            end

            closeButton.onclick = function ()
                reaper.Main_OnCommandEx(closeActionNativeId, 0, 0) -- hack where I pass back in the action id for this menu to close it again
            end

            header:add(closeButton)
            scene:add(header)

            local collection = rtk.FlowBox{bg='#232323', hmargin=5}
                for _, v in ipairs(itemList) do
                    local vbox = rtk.VBox{spacing=5, bmargin=2, tmargin=2, bg='#232323'}
                    local synth_button = rtk.Button{icon=v.icon, bg='#232323', minw=62, minh=48, scale=0.5, flat=true, elevation=0, color='#232323', gradient=0.0}
                    vbox:add(synth_button, {valign='top', halign='center'})
                    local label = rtk.Text{string.upper(v.name), color='#808787', textalign='center'}
                    vbox:add(label, {halign='center', valign='top'})
                
                    synth_button.onclick = function ()
                        local commandId = reaper.NamedCommandLookup(v.command)
                        reaper.Main_OnCommandEx(commandId, 0, 0)
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
                scene:add(collection)
                screen.widget = scene
            end
    }
    return mainScene
end

return Menu