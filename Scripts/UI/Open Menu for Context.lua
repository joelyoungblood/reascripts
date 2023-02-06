--
-- Open a window for adding fx, or new tracks based on the current mouse cursor context
--
dofile(reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Scripts/Various/Helpers.lua')

local trackContext = 'tcp|track'
local emptyTcpContext = 'tcp|empty'
local openFxMenuCommand = '_RS8edd5a5c8d7f12253ffb87239b73dff3f87261e4'
local openNewTrackMenuCommand = '_RSf4450ac1b0fb7652f78d0e40b950b892a26dc940'

local context = GetContextString()
local selected_tracks = reaper.CountSelectedTracks(0)
if selected_tracks == nil then
    selected_tracks = reaper.GetLastTouchedTrack()
end

reaper.PreventUIRefresh(1)
if context == trackContext and selected_tracks > 0 then
    local nativeCommand = reaper.NamedCommandLookup(openFxMenuCommand)
    reaper.Main_OnCommandEx(nativeCommand, 0, 0)
elseif context == emptyTcpContext then
    local command = reaper.NamedCommandLookup(openNewTrackMenuCommand)
    reaper.Main_OnCommandEx(command, 0, 0)
else
    reaper.MB('Either no track is selected, or the context is unrecognized', 'Error, error: redress', 0)
end
reaper.PreventUIRefresh(-1)
