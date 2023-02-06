local FX = {}

FX.TypeCore = 0
FX.TypeEQ = 1
FX.TypeCompressor = 2
FX.TypeEnhancer = 3
FX.TypeMastering = 4
FX.TypeFX = 5
FX.TypeByDeveloper = 6

-- {name='\n', type=, command='_S&M_PASTE_TRACKFXCHAIN' .. ''}

FX.CoreFX = { -- are channel strips really core...? Time will tell I guess
    [1]={name='MAutoVolume\n', command='_S&M_PASTE_TRACKFXCHAIN' .. '3'},
    [2]={name='MAutoAlign\n', command='_S&M_PASTE_TRACKFXCHAIN' .. '4'},
    [3]={name='MMultiAnalyzer\n', command='_S&M_PASTE_TRACKFXCHAIN' .. '6'},
    [4]={name='Metaplugin\n', command='_S&M_PASTE_TRACKFXCHAIN' .. '68'},
    [5]={name='Lime2\nChannel Strip', command='_S&M_PASTE_TRACKFXCHAIN' .. '65'},
    [6]={name='Pink4\nChannel Strip', command='_S&M_PASTE_TRACKFXCHAIN' .. '66'},
    [7]={name='Magenta5\nChannel Strip', command='_S&M_PASTE_TRACKFXCHAIN' .. '67'},
    [8]={name='Perception AB\n', command='_S&M_PASTE_TRACKFXCHAIN' .. '9'},
    [9]={name='Inflator\n', command='_S&M_PASTE_TRACKFXCHAIN' .. '41'},
    [10]={name='Claro\n', command='_S&M_PASTE_TRACKFXCHAIN' .. '60'},
}
-- add to the above: mccgenerator...?

FX.EQs = {
    [1]={name='Claro\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '60'},
    [2]={name='Coral2\nBaxter\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '16'},
    [3]={name='EQuivocate\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '10'},
    [4]={name='GEM EQ84\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '71'},
    [5]={name='GEM EQ495\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '17'},
    [6]={name='GEM EQ550\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '72'},
    [7]={name='GEM EQP\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '20'},
    [8]={name='LIME2 EQU88\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '58'},
    [9]={name='Magenta5 EQ\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '35'},
    [10]={name='MAuto\nEqualizer', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '15'},
    [11]={name='Pink4 780\nGraphic EQ', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '18'},
    [12]={name='Pro-Q\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '10'},
    [13]={name='Pulsar Massive\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '69'},
    [14]={name='smartEQ3\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '13'},
    [15]={name='Softube\nTrident', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '70'},
    [16]={name='Weiss EQ\n', type=FX.TypeEQ, command='_S&M_PASTE_TRACKFXCHAIN' .. '73'}
}

FX.Compressors = {

}

return FX