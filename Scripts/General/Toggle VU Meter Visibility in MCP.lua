-- TODO: add toggle states / update conditionals / add error handling
local EmbedStateInMCP = 2
dofile(reaper.GetResourcePath()..'/UserPlugins/ultraschall_api.lua')
dofile(reaper.GetResourcePath() .. '/Scripts/thesublibrarian/src/utility/Helpers.lua')
-- src/utility/Helpers.lua
-- eventually check for template type, e.g. guitar, synth, whatever. maybe use layout key?

local collapsedMixHeight = '1 0.252266 0.413043 1 0.5 0 0 0'
local expandedMixHeight = '1 0.433504 0.144543 1 0.5 0 0 0'

reaper.PreventUIRefresh(1)

local track = reaper.GetSelectedTrack(0, 0)

    if track ~= nil then
        local trackFXCount = reaper.TrackFX_GetCount(track)
        local _, chunk = reaper.GetTrackStateChunk(track, '', false)
        local fxChunk = ultraschall.GetFXStateChunk(chunk)
        local _, embedFlag = ultraschall.GetFXWak_FXStateChunk(fxChunk, trackFXCount)
        if embedFlag == EmbedStateInMCP then
        local trackHeight = GetChunkVal(chunk, 'SHOWINMIX')
            local updatedChunk = ultraschall.SetFXWak_FXStateChunk(fxChunk, trackFXCount, 0, 0)
            if updatedChunk ~= nil then
                local _, alteredState = ultraschall.SetFXStateChunk(chunk, updatedChunk)
                local finalState = string.gsub(alteredState, 'SHOWINMIX ' .. trackHeight, 'SHOWINMIX ' .. collapsedMixHeight)
                reaper.SetTrackStateChunk(track, finalState, false)
            end
        else
            local updatedChunk = ultraschall.SetFXWak_FXStateChunk(fxChunk, trackFXCount, 0, 2)
            local trackHeight = GetChunkVal(chunk, 'SHOWINMIX')
            if updatedChunk ~= nil then
                local _, alteredState = ultraschall.SetFXStateChunk(chunk, updatedChunk)
                local finalState = string.gsub(alteredState, 'SHOWINMIX ' .. trackHeight, 'SHOWINMIX ' .. expandedMixHeight)
                reaper.SetTrackStateChunk(track, finalState, false)
            end
        end
    else
        local retval = reaper.MB('No track selected', 'Error error - redress', 4) -- option to set to last focused?
        if retval == 6 then
            reaper.ShowConsoleMsg('Yes, use last selected track')
        else
            reaper.ShowConsoleMsg('Nah, fuck that last track')
        end
    end

reaper.PreventUIRefresh(-1)