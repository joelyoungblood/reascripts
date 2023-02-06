--
-- Delay time calculator / update where applicable
--
package.path = reaper.GetResourcePath() .. '/Scripts/rtk/1/?.lua'
local rtk = require('rtk')
local imagePath = reaper.GetResourcePath() .. '/Scripts/thesublibrarian/Resources'

if rtk.os.mac then
    rtk.set_theme_overrides {
        default_font={'Apple SD Gothic Neo Bold', 16}
    }
end

local window = rtk.Window{borderless=true, bg='#232323', h=370, w=750, x=434, y=917}

local oneMinute = 60000
local track = reaper.GetSelectedTrack(0, 0)
local lemonIdString = 'LEMONSTEREOZL.vst3'
local delay = 0
local tap1DSParam = 10
local tap1CSParam = 11
local tap1MSParam = 12
local tap2DSParam = 20
local tap2CSParam = 21
local tap2MSParam = 22
local delayTimes = {}
-- {label='', value=''}
local delayTimeLabels = {
	[1]='Quarter Note',
	[2]='Eighth Note',
	[3]='Sixteenth Note',
	[4]='Quarter Dotted',
	[5]='Eighth Dotted',
	[6]='Sixteenth Dotted',
	[7]='Quarter Triplet',
	[8]='Eighth Triplet',
	[9]='Sixteenth Triplet'
}

local function calculate_delay_times(bpm)
	local quarterNote = oneMinute / bpm
	local eighthStraight = quarterNote / 2
	local sixteenthStraight = eighthStraight / 2

	local quarterDotted = quarterNote * 1.5
	local eighthDotted = eighthStraight * 1.5
	local sixteenthDotted = sixteenthStraight * 1.5

	local quarterTriplet = quarterNote * 0.667
	local eighthTriplet = eighthStraight * 0.667
	local sixteenthTriplet = sixteenthStraight * 0.667

	delayTimes[1] = {label='Quarter Note', value=quarterNote}
	delayTimes[2] = {label='Eighth Note', value=eighthStraight}
	delayTimes[3] = {label='Sixteenth Note', value=sixteenthStraight}
	delayTimes[4] = {label='Quarter Dotted', value=quarterDotted}
	delayTimes[5] = {label='Eighth Dotted', value=eighthDotted}
	delayTimes[6] = {label='Sixteenth Dotted', value=sixteenthDotted}
	delayTimes[7] = {label='Quarter Triplet', value=quarterTriplet}
	delayTimes[8] = {label='Eighth Triplet', value=eighthTriplet}
	delayTimes[9] = {label='Sixteenth Triplet', value=sixteenthTriplet}
end

local function update_lemon()
	local stringTime = tostring(delayTimes[1])
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

-- header with update options / 3 columns - delay / verb / herz...anything else...? OH! Verb times / mod rates?

local mainScene = {
    init = function(_, screen)
		rtk.add_image_search_path(imagePath)
		local mainContainer = rtk.VBox{fillh='true', fillw='true', bg='#232323', spacing=15}
		local header = rtk.HBox{w=1, h=15, bg='#232323', spacing=20}
		local closeButton = rtk.Button{icon='close', flat=true, elevation=0, valign='left', surface=false}

		closeButton.onmouseenter = function ()
			closeButton:attr('icon', 'close highlight')
		end

		closeButton.onmouseleave = function ()
			closeButton:attr('icon', 'close')
		end

		closeButton.onclick = function ()
			reaper.Main_OnCommandEx(reaper.NamedCommandLookup('_RS3a18d8fb6353b4501e1dca557472ac7de97643d7'), 0, 0) -- hack where I pass back in the action id for this menu to close it again
		end

		local delayTimesContainer = rtk.VBox{spacing=15, fillv='true', w=150}

		header:add(closeButton)
		mainContainer:add(header)

		for k, v in ipairs(delayTimes) do
			local timeContainer = rtk.VBox{spacing=5}
			local formattedTimeString = string.format("%.2f", v.value)
			local timeLabel = rtk.Text{v.label .. ': ' .. formattedTimeString, halign='center', fontsize=16, color='#808787'}
			timeContainer:add(timeLabel)

			local seperator = rtk.Spacer{w = 1, h = 2, bg='gray', spacing=5}
			timeContainer:add(seperator)
			delayTimesContainer:add(timeContainer)
		end
		mainContainer:add(delayTimesContainer)
		screen.widget = mainContainer
	end
}

local function main()
	local bpm, _ = reaper.GetProjectTimeSignature2(0)
	calculate_delay_times(bpm)
	-- local totalFx = reaper.TrackFX_GetCount(track)
	-- local _, name = reaper.BR_TrackFX_GetFXModuleName(track, 0)

    local app = window:add(rtk.Application())
    app.statusbar:hide()
    app:add_screen(mainScene, 'main')
    window:open()

	-- if name == lemonIdString then
	-- 	update_lemon()
	-- end
end

local function escape_loop()    
	local char = gfx.getchar()
	if char ~= 27 and char ~= -1 then
	  reaper.defer(escape_loop)
	end
end

escape_loop()
main()