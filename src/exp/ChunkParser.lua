-- local TrackTemplateParser = {}

function ParseInitialChunk()
    local selected_track = reaper.GetSelectedTrack(0, 0)
    local _, original_chunk = reaper.GetTrackStateChunk(selected_track, "", false)
    local clear_opening_tag = string.gsub(original_chunk, '<', '')
    local clear_closing_tag = string.gsub(clear_opening_tag, '>', '')
    local clear_track_tag = string.gsub(clear_closing_tag, 'TRACK', '')
    local fields_and_values = {}
    for field in clear_track_tag:gmatch('[^\r\n]+') do table.insert(fields_and_values, field) end
    -- reaper.ShowConsoleMsg(fields_and_values[1])
    local test_table = {}
    for i = 1, 2, 1 do
        local temp_table = {}
        for token in fields_and_values[i]:gmatch('%w+') do
            table.insert(temp_table, token)
        end
        test_table[temp_table[1]] = temp_table[2]
    end

    for key, value in pairs(test_table) do
        reaper.ShowConsoleMsg('Key = ' .. key .. '  Value = ' .. value .. '\n')
    end
end

-- s = "foo bar 123"
-- words = {}/
-- for word in s:gmatch("%w+") do table.insert(words, word) end

ParseInitialChunk()
-- return TrackTemplateParser



-- class.Chunk {
--     _init = function(self, name)
--         self.name = name
--     end;

--     __tostring = function(self)
--         return 'Hi, my name is ' .. self.name
--     end;
-- }

-- K/V = 1 NAME "chipsynth OPS7"
-- K/V = 2 PEAKCOL 31485345
-- K/V = 3 BEAT -1
-- K/V = 4 AUTOMODE 0
-- K/V = 5 VOLPAN 0.70794578438414 0 -1 -1 1
-- K/V = 6 MUTESOLO 0 0 0
-- K/V = 7 IPHASE 0
-- K/V = 8 PLAYOFFS 0 1
-- K/V = 9 ISBUS 0 0
-- K/V = 10 BUSCOMP 0 0 0 0 0
-- K/V = 11 SHOWINMIX 1 0.359743 0.7 1 0.5 0 0 0
-- K/V = 12 REC 1 5088 1 0 0 0 0 0
-- K/V = 13 VU 2
-- K/V = 14 HEIGHT 80 0 0 0 -1 0
-- K/V = 15 INQ 0 0 0 0.5 100 0 0 100
-- K/V = 16 NCHAN 2
-- K/V = 17 IMGFN "synthosoizer 2.png"
-- K/V = 18 FX 1
-- K/V = 19 ID {68891997-7D1F-DA48-9BF8-56C62D9E3F23}
-- K/V = 20 PERF 0
-- K/V = 21 LAYOUTS "SOLID COLOR" SYNTH
-- K/V = 22 MIDIOUT -1
-- K/V = 23 MAINSEND 1 0
-- K/V = 24 FXCHAIN
-- K/V = 25 WNDRECT 0 0 2560 1415
-- K/V = 26 SHOW 0
-- K/V = 27 LASTSEL 0
-- K/V = 28 DOCKED 0
-- K/V = 29 BYPASS 0 0 0
-- K/V = 30 VST "VST3i: chipsynth OPS7 (Plogue Art et Technologie, Inc)" "chipsynth OPS7.vst3" 0 "" 1394169806{5C5CA79682FC437AB6539BA224BAB356} ""
-- K/V = 31 zlcZU+5e7f4AAAAAAgAAAAEAAAAAAAAAAgAAAAAAAACaBQAAAQAAAP//EAA=
-- K/V = 32 igUAAAEAAAAAAAAAggUAAENFR1CtNQAAeJztWltz4jYU7nN+hced6VvAMvcmzg4Bsss0BCYmeejLjjACNLEtV5ZZ6OTHV7K5mDSKtQnQ1AMvWNLHp3M+3Y7Fufyy8FxtjmiIiW/poGDo2pers0sbztG22gRGRdcCSsaRw7ptjgNGbVPxuPm1gF2dafxzaSPGsD8Ntb8i6GK25K26FjKKoMerLb1k6poHF3Zc03Rd4vSuLb0CeHWv2+72I9YjY8S71jUYMeJBxruwXcIsnZsYOpZe
-- K/V = 33 5k0unqMEF1dCF/InoJ1rSHRbCB13Vd1CPkPU0qscN3XJCLrDyI8N4RW9oR1/F1e2P4SIbuyfY/TjT0K8e2FBbM8ch3iEhVOtGfSn3Ps76HET/kDLEYF0bCNHGPsa0GaQoZ2+hEsaHsd1fkzTH9hc2xH0n7rjtdLbATJE0eF0PnIt/ZyL6uEx/u7FIvBSQFyhdVXX2NbBYPSdCgO4+YYoMl4K4xYv9Ugcxkc9fp4jlzc4TzGlR3xC0XRteVKci+55aYIXaEyJGJdSNRkYs8FBUYJO
-- K/V = 34 vIw97UHsrz2dQzdK7C2+hgAbhCFBmJmIUiainImoZCKqmYhaJqKeiWhkIoCRDclWFWTLCrJ1BdnCAqmyq3X3YqK8AZJ6lQZJ/UqDpJ6lQVLf0iAl76RTJw2Szp40SDqB0iDpHNoRU01yJc3lk2kHpaS6fErtoJR0B0rCAyXlgZL0QEl7U0l7U22+K2lvKmlvKmlvKmlvKmlvKmlvKmlvKmlfUtK+JNV+ACn0klVd3soFZKBavZENqqeGWg6qlBRA9Uo2qJGa8XJQSvR6VY7auleR
-- K/V = 35 c6VEL0v1bKREL5fkqK0MQlsZajs29bIUVZZOvxSotp3JpfouagjpFLFVNOcQrzBwyTRChY4XuZARWhAR3rPxXDLaped0iBT/uhWFPNxtQwa1GVsGgp/jUiGgaVR5h3DMEZZu9x/uWx2r1QIX7Y497N41h93+ndX8feDMtEc8orzDi/7Njd0ZWkbBuGj2+g93Q4vH+Rfdu0fL+O3XhdG8kLBc/xzLrgrFRIZ36FKpVZoqughcShfxBoD/FnpxtZA/xjCpTIQy+Kd2Yxim8d7P3twD
-- K/V = 36 lfpzScE9jnvNPeMV7/YqPciv9MI9M9/uqcys/7F75Xy7V8m3e9V8u1fLt3v1fLvXyLd7IMchVexfzuMWkPPABeQ8cgH5DV1qnXpN5Y1N4NJ/ZtTB9k12gl0Ud3S+YUheK08Np4ZTw95uV+K1qnBUntbqqeHU8AnWqkJYdFqrp4ZTwydYqwoh/ltrVQOFPQflCveJxzVI4QbwuAYp3Nkd1yCFW7bjGqRwL/amQUahsl+DVG6yjiuRyt3TkS1SuC06skUfDGQOYNGn267Bp9uvwQc3
-- K/V = 37 7L3+a65yg/1f/GsubFO5fd6PbZdFkTS8eu5MJshh6SzidQpuYnbTG2HkOygjozigxNkkUhdf5wYvudvIhcv3EH996K6thQ7Dc9TdZHYn5c420xu53AY0HsJRnO6czsahKESsh/xIw+Eaz2KhdobrBlGPa1pwZjgIlz6baUmKNUMLDjznNkI2s/TirUh0octiMwhc7MQJ55odBQGhrJhQFXcpitjHrDBJ6Be7I9ayDWA7lLjuI0Y/BnCKWsRnoozoJtG7jVDwAsSoK5IwnYhS5DNR
-- K/V = 38 9a8spI9Qg8NRm4ejLh2Ounw46srBqA9n9OFsrh6MuXYw5vrBmBsfZvbIODmFQhkwu4tmGOKp73FIDwYrXr5hTyn0wutoMtluRHa8Dcf7+s/RDAhxm/uhud4PzTc1GqGn0BJiH9Ee9LmG9OUJz5v5GXKL/SfNSZ75gdvudAbD5v3XzlBf1yJxEA86tzf9F8f62x1dFvlBeXXGz3s4R1dnv/wDKLJbrgAAAAAAAAAA
-- K/V = 39 AE5vIHByZXNldAAQAAAA
-- K/V = 40 PRESETNAME "No preset"
-- K/V = 41 FLOATPOS 48 0 2392 1414
-- K/V = 42 FXID {7EF3270F-5528-4843-8077-B4D66C448770}
-- K/V = 43 WAK 0 0