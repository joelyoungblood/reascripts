-- []={name='', color='', icon='', command='' .. ''},

local TrackType = {}

TrackType.Type = {
    [1]={name='Utility', color='#', icon='core', command='' .. ''},
    [2]={name='Instrument', color='#', icon='fav', command='' .. ''},
    [3]={name='Guitar', color='#', icon='', command='' .. ''},
    [4]={name='FX', color='', icon='', command='' .. ''},
    [5]={name='Drums', color='', icon='', command='' .. ''},
}

return TrackType
-- -- utility, drums, fx, guitar, instrument

-- FX.CoreFX = {
--     [1]={name='ReaInsert Mono\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '1'},
--     [2]={name='ReaInsert Mono\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '2'},
--     [3]={name='MAutoVolume\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '3'},
--     [4]={name='MAutoAlign\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '4'},
--     [5]={name='MMultiAnalyzer\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '6'},
--     [6]={name='Metaplugin\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '68'},
--     [7]={name='Lime2\nChannel Strip', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '65'},
--     [8]={name='Pink4\nChannel Strip', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '66'},
--     [9]={name='Magenta5\nChannel Strip', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '67'},
--     [10]={name='Perception AB\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '9'},
--     [11]={name='Inflator\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '41'},
--     [12]={name='Claro\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '60'}
-- }