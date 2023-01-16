package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/?.lua'
local utilities = require('tslutility')

local allowed_context = 'tcp|track'
local open_fx_menu_command = 41681

function Main()
    local context = utilities.GetContextString()
    local selected_tracks = reaper.CountSelectedTracks(0)
    if context == allowed_context and selected_tracks > 0 then
        reaper.Main_OnCommandEx(open_fx_menu_command, 0, 0)
    else
        utilities.ShowErrorMessage('Gotta be over a TCP with a track selected. Again!')
    end
end

Main()