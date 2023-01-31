dofile(reaper.GetResourcePath() .. '/Scripts/thesublibrarian/src/utility/Helpers.lua')

local preferredNewTrackMixerSettingsString = '1 0.313299 0 1 0.5 0 -1 0'

local firstSelected = reaper.GetSelectedTrack(0, 0)
if not firstSelected then return end

reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)

local firstSelectedTrackIndex = reaper.GetMediaTrackInfo_Value(firstSelected, "IP_TRACKNUMBER") - 1
reaper.InsertTrackAtIndex(firstSelectedTrackIndex, true)
local parent = reaper.GetTrack(0, firstSelectedTrackIndex)

local nativeColor = reaper.ColorToNative(178, 134, 230)
reaper.SetTrackColor(parent, nativeColor)
reaper.GetSetMediaTrackInfo_String(parent, "P_NAME", "Synth", true)
reaper.GetSetMediaTrackInfo_String(parent, "P_TCP_LAYOUT", 'METERBRIDGE', true)
reaper.GetSetMediaTrackInfo_String(parent, "P_MCP_LAYOUT", 'FADER CYAN 200', true)
reaper.SetMediaTrackInfo_Value(parent, "I_FOLDERDEPTH", 1, true)
reaper.SetMediaTrackInfo_Value(parent, 'I_HEIGHTOVERRIDE', 62)
reaper.TrackFX_AddByName(parent, 'Claro (Sonnox)', false, 1)
reaper.TrackFX_AddByName(parent, 'ReaTeam JSFX/Utility/zenomod_VU Meter (ZenoMOD).jsfx', false, 1)
reaper.TrackFX_SetOpen(parent, 0, false)
reaper.TrackFX_SetOpen(parent, 1, false)

local lastSelectedTrack = reaper.GetSelectedTrack(0, reaper.CountSelectedTracks(0) - 1)

local lastSelectedTrackIndex = reaper.GetMediaTrackInfo_Value(lastSelectedTrack, "IP_TRACKNUMBER") - 1
local currentDepth = 0
for trackIdx = lastSelectedTrackIndex, reaper.CountTracks(0) - 1 do
    local track = reaper.GetTrack(0, trackIdx)
    local trackDepth = reaper.GetMediaTrackInfo_Value(track, "I_FOLDERDEPTH")
    currentDepth = currentDepth + trackDepth
    if currentDepth <= 0 then
        reaper.SetMediaTrackInfo_Value(track, "I_FOLDERDEPTH", trackDepth - 1, true)
        break
    end
end

local _, chunk = reaper.GetTrackStateChunk(parent, '', true)
local updatedStateChunk = ChangeChunkVal2(chunk, 'SHOWINMIX', preferredNewTrackMixerSettingsString)
reaper.SetTrackStateChunk(parent, updatedStateChunk, true)

reaper.PreventUIRefresh(-1)

reaper.TrackList_AdjustWindows(true)
reaper.UpdateArrange()

reaper.Undo_EndBlock("Create folder for selected tracks", 0)