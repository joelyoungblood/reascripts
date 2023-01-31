-- integer reaper.CountTCPFXParms(ReaProject project, MediaTrack track)
-- /Users/joelyoungblood/Library/Application Support/REAPER/Scripts/Daniel Lumertz Scripts/Tracks/Track Snapshot/Chunk Functions.lua
-- Set search RTK path
dofile(reaper.GetResourcePath().."/UserPlugins/ultraschall_api.lua")
dofile(reaper.GetResourcePath() .. '/Scripts/Daniel Lumertz Scripts/Tracks/Track Snapshot/Chunk Functions.lua')

local parameterKey = 'PARM_TCP'
local sectionKey = 'HideShowTCPParams'
local hiddenState = ''
local replacementStarterString = '\nWAK 0 0'
local nl = '\n'
-- key format? name space guid?

-- reaper.PreventUIRefresh(1)

-- local track = reaper.GetSelectedTrack(0, 0)
-- local _, chunk = reaper.GetTrackStateChunk(track, '', false)

-- local testValue = GetChunkVal(chunk, parameterKey)
-- local replacementString = parameterKey .. ' ' .. testValue
-- local updatedChunk = string.gsub(chunk, replacementString, hiddenState)

-- reaper.SetTrackStateChunk(track, updatedChunk, false)

-- reaper.PreventUIRefresh(-1)


function Main()
    reaper.PreventUIRefresh(1)
    local trackCount = reaper.CountTracks(0)
    for i = 1, trackCount, 1 do
        reaper.ShowConsoleMsg('Track index = ' .. i .. ': ')
        local track = reaper.GetTrack(0, i - 1)
        local _, trackName = reaper.GetTrackName(track)
        local _, trackChunk = reaper.GetTrackStateChunk(track, '', false)
        local fxChunk = GetChunkSection('FXCHAIN', trackChunk)
        if i == 2 then
            reaper.ShowConsoleMsg(fxChunk .. nl)
        end
        local tcpParameterValues = GetChunkVal(trackChunk, parameterKey)
        local fxCount = reaper.TrackFX_GetCount(track)
        local parameterTable = {}
        if tcpParameterValues ~= nil then
            for parameterValueString in tcpParameterValues:gmatch('%S+') do
                table.insert(parameterTable, parameterValueString)
            end
        end

        if tcpParameterValues == nil then
            -- first lets see if it exists before we go creating anything
            -- reaper.ShowConsoleMsg('No parameters for ' .. trackName .. nl)
        else
            for j = 1, fxCount, 1 do
                -- gotta do the tcp values check here
                local _, name = reaper.TrackFX_GetFXName(track, j - 1)
                local guid = reaper.TrackFX_GetFXGUID(track, j - 1)
                if string.find(fxChunk, parameterKey) then
                    reaper.ShowConsoleMsg('Track ' .. i .. ' has parameter keys: ' .. nl)
                    local finalParameterValues = ''
                    for k = 1, #parameterTable, 1 do
                        finalParameterValues = finalParameterValues .. parameterTable[k] .. ' '
                    end
                    local updatedChunk = fxChunk:gsub(finalParameterValues, '')
                    reaper.SetTrackStateChunk(track, updatedChunk, false)
                else
                    reaper.ShowConsoleMsg('No parameter keys for fx named = ' .. name .. nl)
                end
                -- local finalReplacementString = parameterKey .. ' ' .. finalParameterValues
                -- reaper.ShowConsoleMsg(finalReplacementString .. nl)
                -- reaper.SetExtState(string section, string key, string value, boolean persist)
                -- reaper.ShowConsoleMsg('FX named ' .. tostring(name) .. ' has the parameterKey ' .. tostring(tcpParameterValues) .. '\n')
                -- reaper.ShowConsoleMsg(tostring(name) .. ' has the GUID ', tostring(guid) .. '\n')
            end
        -- boolean retval, string buf = reaper.TakeFX_GetFXName(MediaItem_Take take, integer fx)
        end
    -- update layout on show? at least increase track height...?
    end
    reaper.PreventUIRefresh(-1)
end

Main()

-- str = "This is some text containing the word tiger."
-- if string.find(str, "tiger") then
--   print ("The word tiger was found.")
-- else
--   print ("The word tiger was not found.")
-- end


  ---------------------------------------------------
--   local function ExtState_Save()
--     conf.dock, conf.wind_x, conf.wind_y, conf.wind_w, conf.wind_h = gfx.dock(-1, 0,0,0,0)
--     for key in pairs(conf) do SetExtState(conf.ES_key, key, conf[key], true)  end
--   end