function Main()
    local track = reaper.GetSelectedTrack(0, 0)
    if track == nil then
        track = reaper.GetLastTouchedTrack()
    end

    local _, track_name = reaper.GetTrackName(track)
    local res = os.execute(string.format('open "/Users/joelyoungblood/Library/Application Support/REAPER/Data/manuals/%s"', track_name .. '.pdf'))
    -- local res = os.execute('')
    if res ~= true then
        reaper.MB('Could not load a file called ' .. track_name .. '.pdf' .. '\n Remember that track name is used as the search query', 'Could not load manual for ' .. track_name, 0)
    end
end

Main()