local pl = require('pl')

local name = ''
local color = ''
local track_height = ''
local layouts = ''
local manual_path = '/Users/joelyoungblood/Library/Application Support/REAPER/Data/manuals/'

function ParseChunk2(chunk)
    local chunk_t = {}
    for line in chunk:gmatch('[^\n]+') do
        table.insert(chunk_t, line)
    end
    for index, value in ipairs(chunk_t) do
        print(value)
    end
end

function ParseChunk(chunk)
    local clear_opening_tag = string.gsub(chunk, '<', '')
    local clear_closing_tag = string.gsub(clear_opening_tag, '>', '')
    local clear_track_tag = string.gsub(clear_closing_tag, 'TRACK', '')
    local fields_and_values = {}
    for field in clear_track_tag:gmatch('[^\n]+ ') do table.insert(fields_and_values, field) end
    -- [^\n]+  [^\r\n]+
    local parsed = {}
    for index, value in ipairs(fields_and_values) do
        -- reaper.ShowConsoleMsg(value .. '\n')
        local test = {}
        -- reaper.ShowConsoleMsg(tostring(string.split(value, ' ', 1)))
        -- local sub_parsed = string.split(value, ' ', 1)
        -- reaper.ShowConsoleMsg(tostring(sub_parsed))
        for token in value:gmatch(' .*|') do
            reaper.ShowConsoleMsg('Hi')
            reaper.ShowConsoleMsg(tostring(token) .. '\n\n\n\n')
        end
        -- if value ~= nil then
        --     local tokenized = string.split(value, ' ', 1)
        --     -- for token in string.split(value, ' ', 1) do
        --     --     table.insert(test, token)
        --     -- end
        --     parsed[tokenized[1]] = tokenized[2]
        -- end
        -- for token in string.split(value, ' ', 1) do
        --     reaper.ShowConsoleMsg(token)
        --     table.insert(test, token)
        -- end
        -- for i = 1, 2, 1 do
        --     local temp_table = {}
        --     for token in string.split(value, ' ', 1) do
        --         table.insert(temp_table, token)
        --     end
        --     -- split("a,b,c", ",", 2) --> {"a", "b,c"}
        --     -- for token in value:gmatch('%w+') do
        --     --     table.insert(temp_table, token)
        --     -- end
        --     parsed[temp_table[1]] = temp_table[2]
        -- end
    end
    return parsed
end

function VF_TrackFX_SetEmbeddedState(track, fx0, func_perform)
    -- func_perform is like 
      --[[
       func = function(flag1,flag2) 
              local WAKflag1 = flag1
              local WAKflag2 = 2
              return WAKflag1, WAKflag2 
            end
      ]]
            
    --  0-based fx
      if not fx0 then return end
      if not track then return end
      local retval, inchunk = GetTrackStateChunk( track, '', false )
    -- parse FX
      local t,i,brackets = {},0,0
      local wak_ids = {}
      for line in inchunk:gmatch('[^\r\n]+') do
        if line:match('<FXCHAIN') then collect = true end
        if collect == true then 
          local count_brackets_open = #string.gsub(line, "[^<]", "")
          local count_brackets_close = #string.gsub(line, "[^>]", "")
          i = i + 1 
          if line:match('WAK %d') then
            wak_ids[#wak_ids+1] = i
          end
          t[i] = line 
          brackets = brackets + count_brackets_open - count_brackets_close
          if brackets == 0 then break end
        end
      end 
      local fxchunk = table.concat(t,'\n')
    
    -- mod flags
      for fx = 0,  TrackFX_GetCount( track )-1 do 
        if fx0 == -1 or (fx0 ~= -1 and fx0 == fx) then
          local wakID = wak_ids[fx+1] 
          if wakID and t[wakID] then
            local src_line = t[wakID]
            if not src_line:match('WAK [%d%-]+ [%d%-]+') then src_line = src_line..' 0' end -- backward comatibility with old reaper versions
            local flag1, flag2 = src_line:match('WAK ([%d%-]+) ([%d%-]+)')
            flag1 = tonumber(flag1)
            flag2 = tonumber(flag2)
            local flag1out, flag2out = func_perform(flag1,flag2)
            t[wakID] = 'WAK '..flag1out..' '..flag2out
          end 
        end
      end
      
      local fxchunk_mod = table.concat(t,'\n')
    
    -- apply out
      local outchunk = inchunk:gsub(literalize(fxchunk), fxchunk_mod)
      SetTrackStateChunk( track, outchunk, false )
  end

function Main()
    local track = reaper.GetSelectedTrack(0, 0)
    if track == nil then
        track = reaper.GetLastTouchedTrack()
    end

    -- local synth_index = reaper.TrackFX_GetInstrument(track)
    -- -- Don't waste cycles on parsing the chunk if it's not even an instrument (unless I want to support any vst...sigh, maybe)
    -- if synth_index ~= -1 then
    --     reaper.ShowConsoleMsg(name)
    --     local _, track_name = reaper.GetTrackName(track)
    --     local _ = os.execute(string.format('open "/Users/joelyoungblood/Library/Application Support/REAPER/Data/manuals/%s"', track_name .. '.pdf'))
    -- end
    VF_TrackFX_SetEmbeddedState(track)
end

-- CLAPi: TAL BassLine 101 (TAL-Togu Audio Line)

Main()