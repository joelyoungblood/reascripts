--
-- Open manual for first synth on selected track / previously selected track. Track name is used for manual lookup. Some special cases need to be added (e.g. vcv rack)
--

-- Since we can open directories now, let there be special children
-- []={name='', path=''},

local manualDataFolder = '"/Users/joelyoungblood/Library/Application Support/REAPER/Data/manuals/"'
local exceptionTable = {
    [1]={name='JV-1080', path='/Users/joelyoungblood/Desktop/Manuals/Synths/Samplers/JV-1080'},
    [2]={name='VCV Rack 2', path='/Users/joelyoungblood/Desktop/Manuals/Synths/Modular/VCV'},
}

function Main()
    if reaper.CountSelectedTracks() > 1 then
        reaper.MB('Multiple tracks selected - only the manual for the first selected track will be searched for.', 'Heads up', 0)
    end

    local track = reaper.GetSelectedTrack(0, 0)
    if track == nil then
        track = reaper.GetLastTouchedTrack()
    end

    local _, trackName = reaper.GetTrackName(track)
    
    for _, exception in ipairs(exceptionTable) do
        if exception.name == trackName then
            os.execute('open ' .. exception.path)
            return
        end
    end

    local res = os.execute('open ' .. manualDataFolder .. trackName .. '.pdf')
    
    if res ~= true then
        reaper.MB('Could not load a file called ' .. trackName .. '.pdf' .. '\n Remember that track name is used as the search query', 'Could not load manual for ' .. trackName, 0)
    end
end

Main()