--
-- FX categories
-- [1]={name='Favorites\n', icon='fav', color='#B286E6', command='_RS8c4592fbe64fd75e0db53323377602cde2cae889'},

-- []={name='', color='#', icon='', command='' .. ''},

local FXType = {}

-- Command ID's need to be updated

FXType.Type = {
    [1]={name='Core', icon='core fx', color='#EDCC6C', command='_RS8e40c92f733b81a2c10e13c8a33957a09a4c6e25'},
    [2]={name='EQUALIZERS', color='#9CDFC5', icon='equalizers', command='_RSf3c8ebe56afc798e6387677832b54a5d1e06c3e9'},
    [3]={name='COMPRESSORS', color='#7795E9', icon='compressors', command='_S&M_PASTE_TRACKFXCHAIN'},
    [4]={name='ENHANCERS', color='#B286E6', icon='enhancers', command='_S&M_PASTE_TRACKFXCHAIN'},
    [5]={name='MASTERING', color='#F4794A', icon='mastering', command='_S&M_PASTE_TRACKFXCHAIN'},
    [6]={name='FX', color='#E0A6CA', icon='fx_select', command='_S&M_PASTE_TRACKFXCHAIN'}
}

return FXType