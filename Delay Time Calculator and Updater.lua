-- Set search paths
package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
-- There *must* be a better way of importing modules from differant directories, this feels like SUCH a hack...
package.path = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/?.lua'
local utilities = require('tslutility')

local window = rtk.Window{borderless=true, bg='#232323', h=370, w=750, x=434, y=917}

local one_mintute = 60000
local track = reaper.GetSelectedTrack(0, 0)
local lemon_name = 'LEMONSTEREOZL.vst3'
local delay = 0
local tap1DSParam = 10
local tap1CSParam = 11
local tap1MSParam = 12
local tap2DSParam = 20
local tap2CSParam = 21
local tap2MSParam = 22
local straight_times = {}
local dotted_times = {}
local triplet_times = {}
local straight_time_labels = {
	[1]='Quarter Note',
	[2]='Eighth Note',
	[3]='Sixteenth Note'
}

local function calculate_delay_times(bpm)
	local quarter_note = one_mintute / bpm
	local eight_straight = quarter_note / 2
	local sixteenth_straight = eight_straight / 2

	local quarter_dotted = quarter_note * 1.5
	local eight_dotted = eight_straight * 1.5
	local sixteenth_dotted = sixteenth_straight * 1.5

	local quarter_triplet = quarter_note * 0.667
	local eight_triplet = eight_straight * 0.667
	local sixteenth_triplet = sixteenth_straight * 0.667

	straight_times[1] = quarter_note
	straight_times[2] = eight_straight
	straight_times[3] = sixteenth_straight
	dotted_times[1] = quarter_dotted
	dotted_times[2] = eight_dotted
	dotted_times[3] = sixteenth_dotted
	triplet_times[1] = quarter_triplet
	triplet_times[2] = eight_triplet
	triplet_times[3] = sixteenth_triplet
end

local function update_lemon()
	local stringTime = tostring(straight_times[1])
	utilities.Msg(stringTime)
	local dsString = string.sub(stringTime, 0, 1)
	local csString = string.sub(stringTime, 2, 2)
	local msString = string.sub(stringTime, 3, 3)

	local ds = tonumber(dsString)
	local cs = tonumber(csString)
	local ms = tonumber(msString)

	if ds / 10 == 0.0 then
		ds = 0
	elseif ds / 10 > 0.0 then
		ds = ds + 0.05
	end

	if cs / 10 == 0.0 then
		cs = 0
	elseif cs / 10 > 0.0 then
		cs = cs + 0.05
	end

	if ms / 10 < 0.04 then
		ms = 0
	else
		ms = ms + 0.05
	end

	-- params are in .05 increments = e.g. 1 = 0.6, 2 = 1.6, etc etc
	-- Msg(string.format("Current param = %s\nCurrent param min = %s\nMax = %s", current, min, max))
	reaper.TrackFX_SetParamNormalized(track, delay, tap1DSParam, ds / 10 + 0.05) -- // lemon
	reaper.TrackFX_SetParamNormalized(track, delay, tap1CSParam, cs / 10 + 0.05) -- // lemon
	reaper.TrackFX_SetParamNormalized(track, delay, tap1MSParam, ms / 10 + 0.05) -- // lemon
	reaper.TrackFX_SetParamNormalized(track, delay, tap2DSParam, ds / 10 + 0.05) -- // lemon
	reaper.TrackFX_SetParamNormalized(track, delay, tap2CSParam, cs / 10 + 0.05) -- // lemon
	reaper.TrackFX_SetParamNormalized(track, delay, tap2MSParam, ms / 10 + 0.05) -- // lemon
end

local mainScene = {
    init=function(app, screen)
		local straight_container = rtk.VBox{spacing=30, fillh='true', fillv='true'}
		for k, v in ipairs(straight_times) do
			local straight_time_container = rtk.VBox{spacing=5}
			local formatted_time = string.format("%.2f",v)
			local time_label = rtk.Text{straight_time_labels[k] .. ': ' .. formatted_time, halign='left', fontsize=36}
			straight_time_container:add(time_label)
			straight_container:add(straight_time_container)
		end
		screen.widget = straight_container
	end
}

local function main()
	local bpm, _ = reaper.GetProjectTimeSignature2(0)
	calculate_delay_times(bpm)
	local totalFx = reaper.TrackFX_GetCount(track)
	local _, name = reaper.BR_TrackFX_GetFXModuleName(track, 0)

    local app = window:add(rtk.Application())
    app.statusbar:hide()
    app:add_screen(mainScene, 'main')
    window:open()

	if name == lemon_name then
		utilities.Msg('Lemon is on selected track. She wore lemon...')
		update_lemon()
	end
	-- utilities.GetAllFXParameterInfo(track, fx_param_count)
end

local function escape_loop()    
	local char = gfx.getchar()
	if char ~= 27 and char ~= -1 then
	  reaper.defer(escape_loop)
	end
end

escape_loop()
main()