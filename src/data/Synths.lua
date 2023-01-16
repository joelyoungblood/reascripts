local Synth = {}

-- {name='\n', type=TrackTemplates.Synth, command='_S&M_ADD_TRTEMPLATE' .. ''}

Synth.categories = {
    [1]={name='Favorites\n', icon='fav', color='#B286E6', command='_RS149bd9e455c11e7ded652c9dcb8d6650169e85db'},
    [2]={name='Modern\n', icon='modern', color='#6BACEC', command='_RS7a7d866545fdd42ea2621b822817568f6f99f95d'},
    [3]={name='Modular\n', icon='modular', color='#93E0E2', command='_RS6366dec6956115f1319ae0f613c27c41f51b5ad3'},
    [4]={name='FM PM PD\nModelling', icon='fm', color='#F94144', command='_RS98bf26d2e439bdd478c927c69ccb47540cd35fb5'},
    [5]={name='Unique\n', icon='unique', color='#E0A6CA', command='_RS9514387473c2a493036f1a435096ad66bb2ca674'},
    [6]={name='Keys\n', icon='keys', color='#EDCC6C', command='_RS75d60005cf02813d81c9437ce7ce690802a6f707'},
    [7]={name='Vintage\n', icon='vintage', color='#F4794A', command='_RS21b7df91602a4f015db2b162f7a626d49af38649'},
    [8]={name='Sequencers\n', icon='seq', color='#9CDFC5', command='_RS26e20e864978354201c321da72dae1c55dcc1991'}
}

Synth.favorites = {
    [1]={name='Aalto', command='_S&M_ADD_TRTEMPLATE' .. '67'},
    [2]={name='Blue3', command='_S&M_ADD_TRTEMPLATE' .. '46'},
    [3]={name='Diva', command='_S&M_ADD_TRTEMPLATE' .. '32'},
    [4]={name='Dreamsynth', command='_S&M_ADD_TRTEMPLATE' .. '33'},
    [5]={name="F'EM", command='_S&M_ADD_TRTEMPLATE' .. '108'},
    [6]={name='Generate', command='_S&M_ADD_TRTEMPLATE' .. '80'},
    [7]={name='HY-POLY', command='_S&M_ADD_TRTEMPLATE' .. '50'},
    [8]={name='Icarus', command='_S&M_ADD_TRTEMPLATE' .. '87'},
    [9]={name='Kaivo', command='_S&M_ADD_TRTEMPLATE' .. '113'},
    [10]={name='Predator3', command='_S&M_ADD_TRTEMPLATE' .. '54'},
    [11]={name='Sines', command='_S&M_ADD_TRTEMPLATE' .. '57'},
    [12]={name='Spire 1.5', command='_S&M_ADD_TRTEMPLATE' .. '58'},
    [13]={name='TAL Sampler', command='_S&M_ADD_TRTEMPLATE' .. '43'},
    [14]={name='VCV Rack', command='_S&M_ADD_TRTEMPLATE' .. '73'},
    [15]={name='Zebra', command='_S&M_ADD_TRTEMPLATE' .. '66'},
}


return Synth