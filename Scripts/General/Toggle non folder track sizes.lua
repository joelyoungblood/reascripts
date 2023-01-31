-- integer reaper.GetTrackDepth(MediaTrack track)
        -- I_HEIGHTOVERRIDE
        -- boolean reaper.SetMediaTrackInfo_Value(MediaTrack tr, string parmname, number newvalue)

local trackCount = reaper.CountTracks(0)
local stateLarge = 0
local stateSmall = 1

-- boolean reaper.SetToggleCommandState(integer section_id, integer command_id, integer state)
-- Updates the toggle state of an action, returns true if succeeded. Only ReaScripts can have their toggle states changed programmatically. See RefreshToolbar2.

-- reaper.RefreshToolbar2(integer section_id, integer command_id)
-- Refresh the toolbar button states of a toggle action.

-- integer reaper.GetToggleCommandStateEx(integer section_id, integer command_id)