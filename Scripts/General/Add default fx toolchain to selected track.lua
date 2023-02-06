--
-- Action to add default fx chain to post-freeze track (Claro -> VU Meter). See if we can avoid showing the UI
--

-- TODO:  turn this into a 'add analysis tools' action

local selectedTracksCount = reaper.CountSelectedTracks(0)
if selectedTracksCount > 0 then
    reaper.Undo_BeginBlock()
    reaper.PreventUIRefresh(1)
    for i = 0, selectedTracksCount, 1 do
        local selectedTrack = reaper.GetSelectedTrack(0, i)
        if selectedTrack ~= nil then
            reaper.TrackFX_AddByName(selectedTrack, 'Claro', false, 1)
            local fxCount = reaper.TrackFX_GetCount(selectedTrack)
            reaper.TrackFX_Show(selectedTrack, fxCount - 1, 2)
        end
    end
    reaper.Undo_EndBlock('Add default track fx to selected tracks', 0)
    reaper.UpdateArrange()
    reaper.PreventUIRefresh(-1)
else
    reaper.MB('No tracks selected', 'Error, error: redress', 0)
end