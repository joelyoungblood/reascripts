local fxIndex0 = 2

local fxIndex = 0x1000000 + (fxIndex0 - 1)
local master = reaper.GetMasterTrack()
local isopen = reaper.TrackFX_GetOpen(master, fxIndex)

local v = 0
if isopen then
    v = 2
else
    v = 3
end

reaper.TrackFX_Show(master, fxIndex, v)