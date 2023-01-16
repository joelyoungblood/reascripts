-- integer retval, integer tracknumber, integer itemnumber, integer fxnumber = reaper.GetFocusedFX2()
-- Return value has 1 set if track FX, 2 if take/item FX, 4 set if FX is no longer focused but still open. 
-- tracknumber==0 means the master track, 1 means track 1, etc. itemnumber is zero-based (or -1 if not an item).
--  For interpretation of fxnumber, see GetLastTouchedFX.

-- HWND reaper.TrackFX_GetFloatingWindow(MediaTrack track, integer index)
-- returns HWND of floating window for effect index, if any

-- boolean retval, integer tracknumber, integer fxnumber, integer paramnumber = reaper.GetLastTouchedFX()
-- Returns true if the last touched FX parameter is valid, false otherwise. The low word of tracknumber is the 1-based track index -- 0 means the master track, 1 means track 1, etc. If the high word of tracknumber is nonzero, it refers to the 1-based item index (1 is the first item on the track, etc). For track FX, the low 24 bits of fxnumber refer to the FX index in the chain, and if the next 8 bits are 01, then the FX is record FX. For item FX, the low word defines the FX index in the chain, and the high word defines the take number.



-- local retval, tracknumber, itemnumber, fxnumber = reaper.GetFocusedFX2()
-- reaper.ShowConsoleMsg('retval = ' .. retval .. '\n')
-- reaper.ShowConsoleMsg('tracknumber = ' .. tracknumber .. '\n')
-- reaper.ShowConsoleMsg('itemnumber = ' .. itemnumber .. '\n')
-- reaper.ShowConsoleMsg('fxnumber = ' .. fxnumber .. '\n')

-- local _, track, item, fx = reaper.GetLastTouchedFX()
-- -- reaper.ShowConsoleMsg('retval = ' .. retval .. '\n')
-- reaper.ShowConsoleMsg('tracknumber = ' .. track .. '\n')
-- reaper.ShowConsoleMsg('itemnumber = ' .. item .. '\n')
-- reaper.ShowConsoleMsg('fxnumber = ' .. fx .. '\n')

-- local media_track = reaper.GetMediat
local track = reaper.GetTrack(0, 0)
local _, buffer = reaper.TrackFX_GetFXName(track, 0)
reaper.ShowConsoleMsg(buffer)

local track = reaper.GetTrack(0, 0)
local test = reaper.TrackFX_GetOpen(track, 0)
if test then
    reaper.ShowConsoleMsg('open')
end