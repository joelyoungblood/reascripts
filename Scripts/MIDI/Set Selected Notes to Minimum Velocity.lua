VELOCITY = 15

local editor = reaper.MIDIEditor_GetActive()
local take = reaper.MIDIEditor_GetTake(editor)

local _, note_count, _, _ = reaper.MIDI_CountEvts(take)

-- reaper.PreventUIRefresh(1)

for i = 0, note_count - 1, 1 do
	local _, is_selected, _, start_pos, end_pos, _, pitch, _ = reaper.MIDI_GetNote(take, i)
	if is_selected == true then
		reaper.MIDI_SetNote(take, i, _, _, start_pos, end_pos, _, pitch, VELOCITY, true)
	end
end

reaper.MIDI_Sort(take)

-- reaper.PreventUIRefresh(-1)

-- integer reaper.MIDIEditor_GetSetting_int(HWND midieditor, string setting_desc)
-- Get settings from a MIDI editor. setting_desc can be:
-- snap_enabled: returns 0 or 1
-- active_note_row: returns 0-127
-- last_clicked_cc_lane: returns 0-127=CC, 0x100|(0-31)=14-bit CC, 0x200=velocity, 0x201=pitch, 0x202=program, 0x203=channel pressure, 0x204=bank/program select, 0x205=text, 0x206=sysex, 0x207=off velocity, 0x208=notation events, 0x210=media item lane
-- default_note_vel: returns 0-127
-- default_note_chan: returns 0-15
-- default_note_len: returns default length in MIDI ticks
-- scale_enabled: returns 0-1
-- scale_root: returns 0-12 (0=C)
-- list_cnt: if viewing list view, returns event count
-- if setting_desc is unsupported, the function returns -1.
-- See MIDIEditor_SetSetting_int, MIDIEditor_GetActive, MIDIEditor_GetSetting_str