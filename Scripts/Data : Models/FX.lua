local FX = {}

FX.TypeCore = 0
FX.TypeEQ = 1
FX.TypeCompressor = 2
FX.TypeEnhancer = 3
FX.TypeMastering = 4
FX.TypeFX = 5
FX.TypeByDeveloper = 6

-- {name='\n', type=, command='_S&M_PASTE_TRACKFXCHAIN' .. ''}

FX.CoreFX = {
    [1]={name='ReaInsert Mono\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '1'},
    [2]={name='ReaInsert Mono\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '2'},
    [3]={name='MAutoVolume\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '3'},
    [4]={name='MAutoAlign\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '4'},
    [5]={name='MMultiAnalyzer\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '6'},
    [6]={name='Metaplugin\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '68'},
    [7]={name='Lime2\nChannel Strip', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '65'},
    [8]={name='Pink4\nChannel Strip', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '66'},
    [9]={name='Magenta5\nChannel Strip', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '67'},
    [10]={name='Perception AB\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '9'},
    [11]={name='Inflator\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '41'},
    [12]={name='Claro\n', type=FX.TypeCore, command='_S&M_PASTE_TRACKFXCHAIN' .. '60'}
}

FX.EQs = {
    -- Column 1, etc etc
    [1]={name='Claro\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '60'},
    [2]={name='EQuivocate\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '10'},
    [3]={name='Pink4 780\nGraphic EQ', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '18'},
    [4]={name='Softube\nTrident', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '70'},

    [5]={name='LIME2 EQU88\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '58'},
    [6]={name='Magenta5 EQ\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '35'},
    [7]={name='Pink4 780\nGraphic EQ', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '18'},
    [8]={name='Coral2\nBaxter\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '16'},

    [9]={name='MAuto\nEqualizer', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '15'},
    [10]={name='Pro-Q\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '10'},
    [11]={name='GEM EQ495\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '17'},
    [12]={name='GEM EQP\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '20'},

    [13]={name='GEM EQ84\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '71'},
    [14]={name='GEM EQ550\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '72'},
    [15]={name='Pulsar Massive\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '69'},
    [16]={name='smartEQ3\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '13'},

    [17]={name='Weiss EQ\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '73'}
}

return FX