local function Msg(str)
	reaper.ShowConsoleMsg(tostring(str).."\n")
end

local fxParameters = {}
local lastTouchedFXTrack = reaper.GetSelectedTrack(0, 0)
local totalParams = reaper.TrackFX_GetNumParams(lastTouchedFXTrack, 0)
local _, fxName = reaper.TrackFX_GetFXName(lastTouchedFXTrack, 0, '')

-- Sanity check - some FX have about 4 trilion parameters apparently, and it can easily freeze reaper right on up if you try and list all them shits out
-- It seems 250 items is the max you can log to the console at once anyway
if totalParams > 1000 then totalParams = 250 end
for i = 1, totalParams do
	local _, parameterName = reaper.TrackFX_GetParamName(lastTouchedFXTrack, 0, i)
	local currentParamValue = reaper.TrackFX_GetParam(lastTouchedFXTrack, 0, i)
	local _, formattedParameterValue = reaper.TrackFX_GetFormattedParamValue(lastTouchedFXTrack, 0, i, '')
	table.insert(fxParameters, {parameterName, currentParamValue, formattedParameterValue})
end

Msg('Parameters for first effect in first slot of selected ( ' ..fxName.. ' )' .. '\n')
for i = 1, #fxParameters do
	Msg("\t"..i.." - "..tostring(fxParameters[i][1]))
	Msg("\t\tReal value: "..tostring(fxParameters[i][2]).."\n\t\tFormatted: "..tostring(fxParameters[i][3]))
end