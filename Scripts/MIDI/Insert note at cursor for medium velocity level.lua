VELOCITY = 70

IGNORE_MARGINS = "1"

local _, scr_name, _, cmd_ID, _,_,_ = reaper.get_action_context()
local scr_name = scr_name:match('([^\\/]+)%.%w+')


function ACT(ID, ME)
-- ID - string or integer
	if ID then
	local ID = reaper.NamedCommandLookup(ID) -- works with srings and integers
		if not ME then reaper.Main_OnCommand(ID, 0)
		else
		reaper.MIDIEditor_LastFocused_OnCommand(ID, false) -- islistviewcommand is false
		end
	end
end


function Get_Note_Under_Mouse(midi_take, hwnd) -- returns note index or nil if no note under mouse cursor
	reaper.PreventUIRefresh(1)
	reaper.Undo_BeginBlock() -- to prevent creation of undo point by 'Edit: Split notes at mouse cursor'
	local _, notecntA, _, _ = reaper.MIDI_CountEvts(midi_take)
	local props_t = {} 
	for i = 0, notecntA-1 do -- collect current notes properties
	local _, _, _, startppq, endppq, _, pitch, _ = reaper.MIDI_GetNote(midi_take, i)
	props_t[#props_t+1] = {startppq, endppq, pitch}
	end
	local snap = reaper.GetToggleCommandStateEx(32060, 1014) == 1 -- View: Toggle snap to grid
	local _ = snap and reaper.MIDIEditor_OnCommand(hwnd, 1014) -- disable snap
	reaper.MIDIEditor_OnCommand(hwnd, 40052)	-- Edit: Split notes at mouse cursor
	local _ = snap and reaper.MIDIEditor_OnCommand(hwnd, 1014) -- re-enable snap
	local _, notecntB, _, _ = reaper.MIDI_CountEvts(midi_take) -- re-count after split
	local idx, fin, note
		if notecntB > notecntA then -- some note was split
			for i = 0, notecntB-1  do
			local _, _, _, startppq, endppq, _, pitch, _ = reaper.MIDI_GetNote(midi_take, i)
			local v = props_t[i+1] -- +1 since table index is 1-based while note count is 0-based; the 1st part of the note will keep the note original index after split and after restoration
				if v and startppq == v[1] and endppq ~= v[2] and pitch == v[3] then 
					idx, fin, note = i, endppq, pitch end
					if idx and startppq == fin and pitch == note then -- locate the 2nd part of the split note
					reaper.MIDI_DeleteNote(midi_take, i) -- delete the 2nd part
					reaper.MIDI_SetNote(midi_take, idx, x, x, x, endppq, x, x, x, false) -- restore the note original length // selected, muted, startppq, chan, pitch, vel all nil, noSort false because only one note is affected
			return idx
			end
		end
	end
	reaper.PreventUIRefresh(-1)
	reaper.Undo_EndBlock('',-1) -- to prevent creation of undo point by 'Edit: Split notes at mouse cursor'
end


local ME = reaper.MIDIEditor_GetActive()
local take = reaper.MIDIEditor_GetTake(ME)


if Get_Note_Under_Mouse(take, ME) then 
	return reaper.defer(function() end) 
end

local _, notecnt, _, _ = reaper.MIDI_CountEvts(take)

reaper.SetExtState(cmd_ID..scr_name, 'note count', notecnt, false)

local sel_note_t = {}

for i = 0, notecnt-1 do
		if sel then sel_note_t[#sel_note_t+1] = {i, startpos, pitch}
	end
end


-- reaper.PreventUIRefresh(1)
reaper.Undo_BeginBlock()

-- reaper.MIDI_SelectAll(take, 0)
-- ACT(40001, ME) -- Edit: Insert note at mouse cursor
reaper.MIDIEditor_OnCommand(editor, 40001)


	-- if notecnt == 0 or notecnt == tonumber(old_notecnt) then -- call the dialogue to set new default velocity if note count is no different from the last count stored as extended state, meaning the cursor isn't over the piano roll when the script is called and so no new note has been added hence no change in the count
	-- 	for _, t in ipairs(sel_note_t) do -- reselect stored selected notes, if any, after they've been deselected above
	-- 		reaper.MIDI_SetNote(take, t[1], true, x, x, x, x, x, x, true) -- idx is t[1], selectedIn - true, mutedIn, startppqposIn, endppqposIn,, chanIn, velIn are nil, noSortIn true because multi
	-- 	end

	-- 	reaper.MIDI_Sort(take)

	-- 	local vel = VELOCITY

	-- 	for _, t in ipairs(sel_note_t) do -- apply user chosen velocity to selected notes
	-- 		reaper.MIDI_SetNote(take, t[1], true, x, x, x, x, x, vel, true) -- set velocity; idx is t[1], selectedIn - true, mutedIn, startppqposIn, endppqposIn both, chanIn are nil, noSortIn true because multiple notes
	-- 	end

	-- else
	-- 	for i = 0, notecnt-1 do -- get index of the inserted note which is selected by default and the only one selected since the rest have been deselected above
	-- 	local retval, sel, mute, startpos, endpos, chan, pitch, vel = reaper.MIDI_GetNote(take, i)
	-- 	if sel then idx = i break end
	-- end

	-- local vel = VELOCITY--= #velocity ~= 0 and velocity or INIT_VELOCITY -- if no default velocity as project extended state use the one from the USER SETTINGS
	-- reaper.MIDI_SetNote(take, idx, true, false, x, x, x, x, vel, false) -- set velocity; selectedIn - true, mutedIn - false, startppqposIn, endppqposIn, chanIn are nil, noSortIn - false since only one note prams are set
	
	-- undo = 'Insert note at velocity '..vel
-- for i = 0, notecnt-1 do
-- 	local retval, sel, mute, startpos, endpos, chan, pitch, vel = reaper.MIDI_GetNote(take, i)
-- 		for _, t in ipairs(sel_note_t) do
-- 			if startpos == t[2] and pitch == t[3] then reaper.MIDI_SetNote(take, i, true, mute, startpos, endpos, chan, pitch, vel, false)
-- 			end
-- 		end
-- 	end
local _, note_cnt, _, _ = reaper.MIDI_CountEvts(take)
local _, _, _, start_pos, end_pos, _, pitch, _ = reaper.MIDI_GetNote(take, note_cnt)
reaper.MIDI_SetNote(take, note_cnt, _, _, start_pos, end_pos, _, pitch, VELOCITY, false)
-- reaper.MIDI_Sort(take)
	-- end

-- local item = reaper.GetMediaItemTake_Item(take)
-- reaper.SetMediaItemSelected(item, false)
-- reaper.SetMediaItemSelected(item, true)

reaper.Undo_EndBlock('Insert medium velocity note', -1)
-- reaper.PreventUIRefresh(-1)






