import os, fnmatch

import os, fnmatch
def findReplace(directory, find, replace, filePattern):
    for path, dirs, files in os.walk(os.path.abspath(directory)):
        for filename in fnmatch.filter(files, filePattern):
            filepath = os.path.join(path, filename)
            with open(filepath) as f:
                s = f.read()
            s = s.replace(find, replace)
            with open(filepath, "w") as f:
                f.write(s)

findReplace('/Users/joelyoungblood/Library/Application Support/REAPER/TrackTemplates/FX/', 'SHOWINMIX 1 0.362528 0.547703 1 0.897485 0 0 0', 'SHOWINMIX 1 0.367069 0.547703 1 0.897485 0 0 0', '*.RTrackTemplate')

# --   NCHAN 2
#   TRACKIMGFN "synthosoizer 2.png"