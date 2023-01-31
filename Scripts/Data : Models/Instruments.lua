local Instruments = {}

-- []={name='', command='_S&M_ADD_TRTEMPLATE' .. ''},
-- columns of four

Instruments.synthCategories = {
    [1]={name='Favorites\n', icon='fav', color='#B286E6', command='_RS149bd9e455c11e7ded652c9dcb8d6650169e85db'},
    [2]={name='Modern\n', icon='modern', color='#6BACEC', command='_RS7a7d866545fdd42ea2621b822817568f6f99f95d'},
    [3]={name='Modular\n', icon='modular', color='#93E0E2', command='_RS6366dec6956115f1319ae0f613c27c41f51b5ad3'},
    [4]={name='FM PM PD\nModelling', icon='fm', color='#F94144', command='_RS98bf26d2e439bdd478c927c69ccb47540cd35fb5'},
    [5]={name='Unique\n', icon='unique', color='#E0A6CA', command='_RS9514387473c2a493036f1a435096ad66bb2ca674'},
    [6]={name='Keys\n', icon='keys', color='#EDCC6C', command='_RS75d60005cf02813d81c9437ce7ce690802a6f707'},
    [7]={name='Vintage\n', icon='vintage', color='#F4794A', command='_RS21b7df91602a4f015db2b162f7a626d49af38649'},
    [8]={name='Sequencers\n', icon='seq', color='#9CDFC5', command='_RS26e20e864978354201c321da72dae1c55dcc1991'}
}

Instruments.favorites = {
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

Instruments.keys = {
    [1]={name='B3 V2', command='_S&M_ADD_TRTEMPLATE' .. '157'},
    [2]={name='Cymatic Keys', command='_S&M_ADD_TRTEMPLATE' .. '158'},
    [3]={name='Pianoteq 8', command='_S&M_ADD_TRTEMPLATE' .. '86'},
    [4]={name='Ravenscroft', command='_S&M_ADD_TRTEMPLATE' .. '160'},
    [5]={name='Stage-73 V2', command='_S&M_ADD_TRTEMPLATE' .. '161'},
    [6]={name='Tapex2', command='_S&M_ADD_TRTEMPLATE' .. '162'},
}

Instruments.fm = {
    [1]={name='Bazille', command='_S&M_ADD_TRTEMPLATE' .. '45'},
    [2]={name='Blue3', command='_S&M_ADD_TRTEMPLATE' .. '46'},
    [3]={name='CZ V', command='_S&M_ADD_TRTEMPLATE' .. '110'},
    [4]={name='DX7 V', command='_S&M_ADD_TRTEMPLATE' .. '153'},
    [5]={name="F'em", command="_S&M_ADD_TRTEMPLATE" .. "108"},
    [6]={name='Imagine', command='_S&M_ADD_TRTEMPLATE' .. '112'},
    [7]={name='Kaivo', command='_S&M_ADD_TRTEMPLATE' .. '113'},
    [8]={name='chipsynth MD', command='_S&M_ADD_TRTEMPLATE' .. '163'},
    [9]={name='Nemesis', command='_S&M_ADD_TRTEMPLATE' .. '148'},
    [10]={name='OPS7', command='_S&M_ADD_TRTEMPLATE' .. '109'},
    [11]={name='Opsix', command='_S&M_ADD_TRTEMPLATE' .. '111'},
    [12]={name='Sines', command='_S&M_ADD_TRTEMPLATE' .. '57'},
    [13]={name='Triple Cheese', command='_S&M_ADD_TRTEMPLATE' .. '114'},
}

Instruments.vintage = {
    [1]={name='Buchla Easal V', command='_S&M_ADD_TRTEMPLATE' .. '181'},
    [2]={name='CMI V', command='_S&M_ADD_TRTEMPLATE' .. '166'},
    [3]={name='CS-80 V4', command='_S&M_ADD_TRTEMPLATE' .. '115'},
    [4]={name='Diva', command='_S&M_ADD_TRTEMPLATE' .. '32'},
    [5]={name='Eight Voice', command='_S&M_ADD_TRTEMPLATE' .. '123'},
    [6]={name='Elka-X', command='_S&M_ADD_TRTEMPLATE' .. '167'},
    [7]={name='Emulator IIV', command='_S&M_ADD_TRTEMPLATE' .. '164'},
    [8]={name='Fury800', command='_S&M_ADD_TRTEMPLATE' .. '169'},
    [9]={name='FB-7999', command='_S&M_ADD_TRTEMPLATE' .. '168'},
    [10]={name='GX-80', command='_S&M_ADD_TRTEMPLATE' .. '34'},
    [11]={name='Jup-8 V4', command='_S&M_ADD_TRTEMPLATE' .. '119'},
    [12]={name='Jun-6V', command='_S&M_ADD_TRTEMPLATE' .. '125'},
    [13]={name='M-tron', command='_S&M_ADD_TRTEMPLATE' .. '117'},
    [14]={name='M-tron mkii', command='_S&M_ADD_TRTEMPLATE' .. '42'},
    [15]={name='Memorymode', command='_S&M_ADD_TRTEMPLATE' .. '170'},
    [16]={name='Mercury-4', command='_S&M_ADD_TRTEMPLATE' .. '171'},
    [17]={name='Model 72', command='_S&M_ADD_TRTEMPLATE' .. '124'},
    [18]={name='Model 82', command='_S&M_ADD_TRTEMPLATE' .. '122'},
    [19]={name='Model 84', command='_S&M_ADD_TRTEMPLATE' .. '40'},
    [20]={name='MS-20V', command='_S&M_ADD_TRTEMPLATE' .. '154'},
    [21]={name='OB-E', command='_S&M_ADD_TRTEMPLATE' .. '35'},
    [22]={name='OB-XD', command='_S&M_ADD_TRTEMPLATE' .. '116'},
    [23]={name='Obsession', command='_S&M_ADD_TRTEMPLATE' .. '36'},
    [24]={name='OB-Xa V', command='_S&M_ADD_TRTEMPLATE' .. '118'},
    [25]={name='Oddity3', command='_S&M_ADD_TRTEMPLATE' .. '37'},
    [26]={name='PS-20', command='_S&M_ADD_TRTEMPLATE' .. '172'},
    [27]={name='Polymode', command='_S&M_ADD_TRTEMPLATE' .. '172'},
    [28]={name='Quadra', command='_S&M_ADD_TRTEMPLATE' .. '174'},
    [29]={name='Repro-5', command='_S&M_ADD_TRTEMPLATE' .. '39'},
    [30]={name='chipsynth SFC', command='_S&M_ADD_TRTEMPLATE' .. '165'},
    [31]={name='Surrealistic MG-1', command='_S&M_ADD_TRTEMPLATE' .. '175'},
    [32]={name='Saurus', command='_S&M_ADD_TRTEMPLATE' .. '126'},
    [33]={name='TAL J-8', command='_S&M_ADD_TRTEMPLATE' .. '41'},
    [34]={name='TAL Sampler', command='_S&M_ADD_TRTEMPLATE' .. '43'},
    [35]={name='TAL BassLine 101', command='_S&M_ADD_TRTEMPLATE' .. '120'},
    [36]={name='TAL-UNO-LX-V2', command='_S&M_ADD_TRTEMPLATE' .. '121'},
}

Instruments.modern = {
    [1]={name='Aalto', command='_S&M_ADD_TRTEMPLATE' .. '67'},
    [2]={name='Ace', command='_S&M_ADD_TRTEMPLATE' .. '150'},
    [3]={name='Avenger', command='_S&M_ADD_TRTEMPLATE' .. '88'},
    [4]={name='Cursus Vereor', command='_S&M_ADD_TRTEMPLATE' .. '47'},
    [5]={name='Dune3', command='_S&M_ADD_TRTEMPLATE' .. '48'},
    [6]={name='Granulizer2', command='_S&M_ADD_TRTEMPLATE' .. '151'},
    [7]={name='Hive', command='_S&M_ADD_TRTEMPLATE' .. '49'},
    [8]={name='HY-POLY', command='_S&M_ADD_TRTEMPLATE' .. '50'},
    [9]={name='Icarus', command='_S&M_ADD_TRTEMPLATE' .. '87'},
    [10]={name='Loquelic Vereor', command='_S&M_ADD_TRTEMPLATE' .. '52'},
    [11]={name='Manis Iteritas', command='_S&M_ADD_TRTEMPLATE' .. '53'},
    [12]={name='Pigments', command='_S&M_ADD_TRTEMPLATE' .. '127'},
    [13]={name='Predator3', command='_S&M_ADD_TRTEMPLATE' .. '54'},
    [14]={name='Quanta2', command='_S&M_ADD_TRTEMPLATE' .. '128'},
    [15]={name='Rapid', command='_S&M_ADD_TRTEMPLATE' .. '55'},
    [16]={name='Serum', command='_S&M_ADD_TRTEMPLATE' .. '129'},
    [17]={name='Sinc Vereor', command='_S&M_ADD_TRTEMPLATE' .. '56'},
    [18]={name='Spire 1.5', command='_S&M_ADD_TRTEMPLATE' .. '58'},
    [19]={name='Sylenth1', command='_S&M_ADD_TRTEMPLATE' .. '149'},
    [20]={name='Synthmaster2', command='_S&M_ADD_TRTEMPLATE' .. '60'},
    [21]={name='UVI Falcon', command='_S&M_ADD_TRTEMPLATE' .. '61'},
    [22]={name='Virt Vereor', command='_S&M_ADD_TRTEMPLATE' .. '62'},
    [23]={name='Vital', command='_S&M_ADD_TRTEMPLATE' .. '63'},
    [24]={name='Warlock', command='_S&M_ADD_TRTEMPLATE' .. '64'},
    [25]={name='Waverazor', command='_S&M_ADD_TRTEMPLATE' .. '65'},
    [26]={name='Zebra2', command='_S&M_ADD_TRTEMPLATE' .. '66'},
}

Instruments.modular = {
    [1]={name='Hyperion\n', command='_S&M_ADD_TRTEMPLATE' .. '51'},
    [2]={name='MSound\nFactory', command='_S&M_ADD_TRTEMPLATE' .. '68'},
    [3]={name='Phase Plant\n', command='_S&M_ADD_TRTEMPLATE' .. '70'},
    [4]={name='Reaktor\n', command='_S&M_ADD_TRTEMPLATE' .. '75'},
    [5]={name='Softube\nModular', command='_S&M_ADD_TRTEMPLATE' .. '71'},
    [6]={name='TAL Mod\n', command='_S&M_ADD_TRTEMPLATE' .. '72'},
    [7]={name='VCV Rack\n', command='_S&M_ADD_TRTEMPLATE' .. '73'},
    [8]={name='Voltage\nModular', command='_S&M_ADD_TRTEMPLATE' .. '74'},
}

Instruments.unique = {
    [1]={name='Abyss', command='_S&M_ADD_TRTEMPLATE' .. '76'},
    [2]={name='Bioscape', command='_S&M_ADD_TRTEMPLATE' .. '179'},
    [3]={name='Blade2', command='_S&M_ADD_TRTEMPLATE' .. '78'},
    [4]={name='Dust', command='_S&M_ADD_TRTEMPLATE' .. '79'},
    [5]={name='Generate', command='_S&M_ADD_TRTEMPLATE' .. '80'},
    [6]={name='Kult', command='_S&M_ADD_TRTEMPLATE' .. '85'},
    [7]={name='Novum', command='_S&M_ADD_TRTEMPLATE' .. '81'},
    [8]={name='Rayblaster', command='_S&M_ADD_TRTEMPLATE' .. '82'},
    [9]={name='Shapiro2', command='_S&M_ADD_TRTEMPLATE' .. '178'},
    [10]={name='Spacecraft', command='_S&M_ADD_TRTEMPLATE' .. '83'},
    [11]={name='Synplant', command='_S&M_ADD_TRTEMPLATE' .. '84'},
    [12]={name='UVI Drone', command='_S&M_ADD_TRTEMPLATE' .. '180'},
}

Instruments.sequencers = {
    [1]={name='Acolyte\n', command='_S&M_ADD_TRTEMPLATE' .. '100'},
    [2]={name='Axon2\n', command='_S&M_ADD_TRTEMPLATE' .. '101'},
    [3]={name='HY-RPE2\n', command='_S&M_ADD_TRTEMPLATE' .. '102'},
    [4]={name='HY-Seq\nCollection2', command='_S&M_ADD_TRTEMPLATE' .. '103'},
    [5]={name='Nest\n', command='_S&M_ADD_TRTEMPLATE' .. '104'},
    [6]={name='Obscurium\n', command='_S&M_ADD_TRTEMPLATE' .. '105'},
    [7]={name='Stochas\n', command='_S&M_ADD_TRTEMPLATE' .. '106'},
    [8]={name='Tactic\n', command='_S&M_ADD_TRTEMPLATE' .. '107'},
}


return Instruments