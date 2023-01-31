local Utility = {}

function Utility.Msg(string)
	reaper.ShowConsoleMsg(tostring(string).."\n")
end

function Utility.GetContextString()
	local wnd, seg, det = reaper.BR_GetMouseCursorContext()
	local str = (not wnd or wnd == "unknown") and "" or wnd .. 	((not seg or seg == "") and "" or "|" .. seg ..	(( not det or det == "" ) and "" or "|" .. det))	
	return str
end

function Utility.GetAllFXParameterInfo(track, fx_count)
    if fx_count > 1000 then
        for i = 1, 1000 do  
            local ret, pname = reaper.TrackFX_GetParamName( track, 0, i, "" )
            local val, minvalOut, maxvalOut = reaper.TrackFX_GetParam( track, 0, i )
            local ret, fval = reaper.TrackFX_GetFormattedParamValue( track, 0, i, "" )
            Utility.Msg('Name = ' .. pname .. ' and value = ' .. fval .. 'at index' .. i .. '\n')
        end
    else
	    for i = 1, fx_count do  
		    local ret, pname = reaper.TrackFX_GetParamName( track, 0, i, "" )
		    local val, minvalOut, maxvalOut = reaper.TrackFX_GetParam( track, 0, i )
		    local ret, fval = reaper.TrackFX_GetFormattedParamValue( track, 0, i, "" )
		    Utility.Msg('Name = ' .. pname .. ' and value = ' .. fval .. 'at index' .. i .. '\n')
	    end
    end
end

	-- list all FX params
function Utility.ListAllFXParametersForFirstFXOnTrack(track)
	local fx_param_count = reaper.TrackFX_GetNumParams(track, 0)
	for i = 1, fx_param_count do  
		local ret, pname = reaper.TrackFX_GetParamName( track, 0, i, "" )
		local val, minvalOut, maxvalOut = reaper.TrackFX_GetParam( track, 0, i )
		local ret, fval = reaper.TrackFX_GetFormattedParamValue( track, 0, i, "" )
		Utility.Msg('Name = ' .. pname .. ' and value = ' .. fval .. 'at index' .. i .. '\n')
	end
end

function Utility.ShowErrorMessage(msg)
	reaper.ShowMessageBox(tostring(msg), 'Dude! WTF?!', 0)
end

-- integer reaper.ShowMessageBox(string msg, string title, integer type)
-- type 0=OK,1=OKCANCEL,2=ABORTRETRYIGNORE,3=YESNOCANCEL,4=YESNO,5=RETRYCANCEL : ret 1=OK,2=CANCEL,3=ABORT,4=RETRY,5=IGNORE,6=YES,7=NO

return Utility