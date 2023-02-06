local TrackTemplates = {}

TrackTemplates.Delay = 1
TrackTemplates.Guitar = 2
TrackTemplates.Bass = 3
TrackTemplates.Drums = 4
TrackTemplates.Vocals = 5

-- {name='\n', type=TrackTemplates.Synth, command='_S&M_ADD_TRTEMPLATE' .. ''}

TrackTemplates.Delays = {
    [1]={name='ChowMatrix\n', command='_S&M_ADD_TRTEMPLATE' .. '191'},
    [2]={name='Crystalizer\n', command='_S&M_ADD_TRTEMPLATE' .. '10'},
    [3]={name='Comeback Kid\n', command='_S&M_ADD_TRTEMPLATE' .. '151'},
    [4]={name='Droplet V2\n', command='_S&M_ADD_TRTEMPLATE' .. '192'},
    [5]={name='Echo B2\n', command='_S&M_ADD_TRTEMPLATE' .. '137'},
    [6]={name='Echoes T7E\n', command='_S&M_ADD_TRTEMPLATE' .. '139'},
    [7]={name='GEM ECHOSON\n', command='_S&M_ADD_TRTEMPLATE' .. '138'},
    [8]={name='GEM OTD-2\n', command='_S&M_ADD_TRTEMPLATE' .. '140'},
    [9]={name='GSI-201 mkii\n', command='_S&M_ADD_TRTEMPLATE' .. '11'},
    [10]={name='Imitor\n', command='_S&M_ADD_TRTEMPLATE' .. '12'},
    [11]={name='Lemon\n', command='_S&M_ADD_TRTEMPLATE' .. '13'},
    [12]={name='MSpectral\nDelay', command='_S&M_ADD_TRTEMPLATE' .. '154'},
    [13]={name='Other Desert\nCities', command='_S&M_ADD_TRTEMPLATE' .. '14'},
    [14]={name='Outer Space\n', command='_S&M_ADD_TRTEMPLATE' .. '141'},
    [15]={name='Plexitape\n', command='_S&M_ADD_TRTEMPLATE' .. '142'},
    [16]={name='Pulsar Echorec\n', command='_S&M_ADD_TRTEMPLATE' .. '15'},
    [17]={name='Permut8\n', command='_S&M_ADD_TRTEMPLATE' .. '193'},
    [18]={name='Space Station\nUM-282', command='_S&M_ADD_TRTEMPLATE' .. '144'},
    [19]={name='TAL Dub-X\n', command='_S&M_ADD_TRTEMPLATE' .. '16'},
    [20]={name='Timeless 3\n', command='_S&M_ADD_TRTEMPLATE' .. '144'},
    [21]={name='UVI Dual\nDelay X', command='_S&M_ADD_TRTEMPLATE' .. '146'},
    [22]={name='Valhalla Delay\n', command='_S&M_ADD_TRTEMPLATE' .. '17'},
}

TrackTemplates.Reverbs = {
    [1]={name='AALTOVERB 2\n', command='_S&M_ADD_TRTEMPLATE' .. '182'},
    [2]={name='ALBEDO\n', command='_S&M_ADD_TRTEMPLATE' .. '183'},
    [3]={name='BLACKHOLE\n', command='_S&M_ADD_TRTEMPLATE' .. '184'},
    [4]={name='DESMODUS\n', command='_S&M_ADD_TRTEMPLATE' .. '185'},
    [5]={name='Frostbite2\n', command='_S&M_ADD_TRTEMPLATE' .. '194'},
    [6]={name='GRAINSPACE\n', command='_S&M_ADD_TRTEMPLATE' .. '24'},
    [7]={name='LUMINENCE\n', command='_S&M_ADD_TRTEMPLATE' .. '186'},
    [8]={name='LX 480\n', command='_S&M_ADD_TRTEMPLATE' .. '18'},
    [9]={name='MANGLED VERB\n', command='_S&M_ADD_TRTEMPLATE' .. '187'},
    [10]={name='Polaris\n', command='_S&M_ADD_TRTEMPLATE' .. '195'},
    [11]={name='PRO-R\n', command='_S&M_ADD_TRTEMPLATE' .. '189'},
    [12]={name='SHIMMERVERB\n', command='_S&M_ADD_TRTEMPLATE' .. '190'},
    [13]={name='TAL Reverb\n', command='_S&M_ADD_TRTEMPLATE' .. '196'},
    [14]={name='UVI PLATE\n', command='_S&M_ADD_TRTEMPLATE' .. '19'},
    [15]={name='UVI Sparkverb\n', command='_S&M_ADD_TRTEMPLATE' .. '197'},
    [16]={name='VALHALLA PLATE\n', command='_S&M_ADD_TRTEMPLATE' .. '20'},
    [17]={name='VALHALLA\nROOM', command='_S&M_ADD_TRTEMPLATE' .. '21'},
    [18]={name='VALHALLA\nSHIMMER', command='_S&M_ADD_TRTEMPLATE' .. '131'},
    [19]={name='VALHALLA\nSUPERMASSIVE', command='_S&M_ADD_TRTEMPLATE' .. '22'},
    [20]={name='VALHALLA\nVINTAGE VERB', command='_S&M_ADD_TRTEMPLATE' .. '23'},
}

return TrackTemplates