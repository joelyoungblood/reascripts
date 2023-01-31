local TrackTemplates = {}

TrackTemplates.Delay = 1
TrackTemplates.Guitar = 2
TrackTemplates.Bass = 3
TrackTemplates.Drums = 4
TrackTemplates.Vocals = 5

-- {name='\n', type=TrackTemplates.Synth, command='_S&M_ADD_TRTEMPLATE' .. ''}

TrackTemplates.Delays = {
    [1]={name='Crystalizer\n', command='_S&M_ADD_TRTEMPLATE' .. '67'}, -- 10
    [2]={name='Comeback Kid\n', command='_S&M_ADD_TRTEMPLATE152'}, -- 152
    [3]={name='Echo B2\n', command='_S&M_ADD_TRTEMPLATE138'},
    [4]={name='Echoes T7E\n', command='_S&M_ADD_TRTEMPLATE140'}, -- 140
    [5]={name='GEM OTD-2\n', command='_S&M_ADD_TRTEMPLATE141'}, -- 141
    [6]={name='GSI-201 mkii\n', command='_S&M_ADD_TRTEMPLATE' .. '11'}, -- 11
    [7]={name='Imitor\n', command='_S&M_ADD_TRTEMPLATE12'}, -- 12
    [8]={name='Lemon\n', command='_S&M_ADD_TRTEMPLATE13'}, -- 13
    [9]={name='Other Desert\nCities', command='_S&M_ADD_TRTEMPLATE14'}, -- 14
    [10]={name='Outer Space\n', command='_S&M_ADD_TRTEMPLATE142'}, -- 142
    [11]={name='Plexitape\n', command='_S&M_ADD_TRTEMPLATE143'}, -- 143
    [12]={name='Pulsar Echorec\n', command='_S&M_ADD_TRTEMPLATE15'}, -- 15
    [13]={name='Space Station\nUM-282', command='_S&M_ADD_TRTEMPLATE144'}, -- 144
    [14]={name='TAL Dub-X\n', command='_S&M_ADD_TRTEMPLATE16'}, -- 16
    [15]={name='Timeless 3\n', command='_S&M_ADD_TRTEMPLATE145'}, -- 145
    [16]={name='UVI Dual\nDelay X', command='_S&M_ADD_TRTEMPLATE147'}, -- 147
    [17]={name='UVI Relayer\n', command='_S&M_ADD_TRTEMPLATE146'}, -- 146
    [18]={name='Valhalla Delay\n', command='_S&M_ADD_TRTEMPLATE17'}, -- 17
}

-- TrackTemplates.Reverbs {
--     []={name='\n', type=TrackTemplates.Synth, command='_S&M_ADD_TRTEMPLATE' .. ''},
-- }

return TrackTemplates