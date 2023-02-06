--
-- Add ReaInsert mono send and receive track to selected track
--
-- TODO: add folder as first track, then within have the track wired to the receiving track 

local default_peakcol_chunk = 'PEAKCOL 16576'
local new_peakcol_chunk = 'PEAKCOL 25408511'
local old_layout_chunk = 'PERF 0'
local new_layout_chunk = 'PERF 0\nLAYOUTS "SOLID COLOR" FX'
local old_height_chunk = 'TRACKHEIGHT 0 0 0 -1 -1 0'
local new_height_chunk = 'TRACKHEIGHT 80 0 0 0 -1 0'
local old_rec_chunk = 'REC 0 0 1 0 0 0 0 0'
local new_rec_chunk = 'REC 1 0 0 5 0 0 0 0'

function Main()
    local selected_track_count = reaper.CountSelectedTracks(0)
    if selected_track_count == 0 or selected_track_count > 1 then
        reaper.MB('There is either no selected tracks, or more than one selected track', 'Error, error: redress', 0)
    else
        reaper.Undo_BeginBlock()
        local selected_track = reaper.GetSelectedTrack(0, 0)
        local _, selected_track_name = reaper.GetSetMediaTrackInfo_String(selected_track, 'P_NAME', '', false)
        if selected_track_name ~= '' then
            selected_track_name = selected_track_name .. ' '
        end
        local send_track_idx = reaper.CSurf_TrackToID(selected_track, false)
        reaper.InsertTrackAtIndex(send_track_idx + 1, true)
        local receive_track = reaper.CSurf_TrackFromID(send_track_idx + 1, false)
        reaper.GetSetMediaTrackInfo_String(receive_track, 'P_NAME', selected_track_name .. 'Mono Receive', true)
        -- reaper.SetMediaTrackInfo_Value(selected_track, "I_FOLDERDEPTH", 1, true)

        reaper.SNM_AddReceive(selected_track, receive_track, 0)

        local _, original_chunk = reaper.GetTrackStateChunk(receive_track, "", false)

        local first_chunk_edit = string.gsub(original_chunk, default_peakcol_chunk, new_peakcol_chunk)
        local second_chunk_edit = string.gsub(first_chunk_edit, old_layout_chunk, new_layout_chunk)
        local third_chunk_edit = string.gsub(second_chunk_edit, old_height_chunk, new_height_chunk)
        local final_chunk = string.gsub(third_chunk_edit, old_rec_chunk, new_rec_chunk)

        reaper.SetMediaTrackInfo_Value(receive_track, "I_FOLDERDEPTH", - 1, true)
        reaper.SetTrackStateChunk(receive_track, final_chunk, false)
        reaper.TrackList_AdjustWindows(true)
        reaper.UpdateArrange()

        reaper.Undo_EndBlock('Undo create mono receive', 0)
    end
end

Main()
