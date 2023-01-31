package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/src/utility/?.lua'
local utilities = require('tslutility')

local track_context = 'tcp|track'
local empty_tcp_context = 'tcp|empty'
local open_fx_menu_command = 41681

function Main()
    local context = utilities.GetContextString()
    local selected_tracks = reaper.CountSelectedTracks(0)
    if selected_tracks == nil then
        selected_tracks = reaper.GetLastTouchedTrack()
    end

    if context == track_context and selected_tracks > 0 then
        reaper.Main_OnCommandEx(open_fx_menu_command, 0, 0)
    elseif context == empty_tcp_context then
        reaper.ShowConsoleMsg('Open new track menu thingy...')
        -- local command = reaper.NamedCommandLookup('_RS467b12654ba1a556c82db2c3282622a7b0d3f20d')
        -- reaper.Main_OnCommandEx(command, 0, 0)
    else
        reaper.MB('Either no track is selected, or the context is unrecognized', 'Error, error: redress', 0)
    end
end

Main()
