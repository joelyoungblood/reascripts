local TrackTemplates = {}

TrackTemplates.Delay = 1
TrackTemplates.Guitar = 2
TrackTemplates.Bass = 3
TrackTemplates.Drums = 4
TrackTemplates.Vocals = 5

-- {name='\n', type=TrackTemplates.Synth, command='_S&M_ADD_TRTEMPLATE' .. ''}

TrackTemplates.Delays = {
    [1]={name='Crystalizer\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE' .. '67'}, -- 10
    [2]={name='Comeback Kid\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE152'}, -- 152
    [3]={name='Echo B2\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE138'},
    [4]={name='Echoes T7E\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE140'}, -- 140
    [5]={name='GEM OTD-2\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE141'}, -- 141
    [6]={name='GSI-201 mkii\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE'}, -- 11
    [7]={name='Imitor\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE12'}, -- 12
    [8]={name='Lemon\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE13'}, -- 13
    [9]={name='Other Desert\nCities', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE14'}, -- 14
    [10]={name='Outer Space\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE142'}, -- 142
    [11]={name='Plexitape\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE143'}, -- 143
    [12]={name='Pulsar Echorec\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE15'}, -- 15
    [13]={name='Space Station\nUM-282', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE144'}, -- 144
    [14]={name='TAL Dub-X\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE16'}, -- 16
    [15]={name='Timeless 3\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE145'}, -- 145
    [16]={name='UVI Dual\nDelay X', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE147'}, -- 147
    [17]={name='UVI Relayer\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE146'}, -- 146
    [18]={name='Valhalla Delay\n', type=TrackTemplates.Delay, command='_S&M_ADD_TRTEMPLATE17'}, -- 17
}

return TrackTemplates