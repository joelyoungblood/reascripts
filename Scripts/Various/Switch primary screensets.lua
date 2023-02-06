--
-- Utility for switching screensets while also updating the arrangement of additional windows as needed
--

local hwndID = reaper.JS_Window_FindChild(reaper.GetMainHwnd(), 'HeDa ', false)
reaper.DockWindowRemove(hwndID)

local section = "window_sets"
local key = "last_window_set"

local firstScreensetActionId = 40454
local secondScreensetActionId = 40455
local addInfoPaneAction = reaper.NamedCommandLookup('_RSc18de16721a3c34e4867889bd9bf02450163b2f8')

function ToggleScreenSetAB()
    local firstScreenset = 0
    local secondScreenset = 1
    local extStorageState = reaper.GetExtState(section, key)
    if extStorageState == '' or extStorageState == nil then
        extStorageState = secondScreensetActionId
    else
        extStorageState = tonumber(extStorageState) or secondScreensetActionId
    end

    local actionId

    if extStorageState ~= firstScreensetActionId + firstScreenset then
        -- go to sreenset 1
        -- show info pane if not showing
        -- check if a track is selected, if not, select master
        actionId = firstScreensetActionId + firstScreenset
    else
        -- go to screnset 2 (hide info pane if showing)
        -- I_HEIGHTOVERRIDE
        -- boolean reaper.SetMediaTrackInfo_Value(MediaTrack tr, string parmname, number newvalue)
        actionId = firstScreensetActionId + secondScreenset
    end
    reaper.Main_OnCommand(actionId, 0)
    reaper.SetExtState(section, key, tostring(actionId), false)
end

ToggleScreenSetAB()