import os
import dirs
import string

def listdir_recursive(basedir):
    ret = []
    for f in os.listdir(basedir):
	if os.path.isfile(basedir+"\\"+f):
	    ret.append(f)
	elif os.path.isdir(basedir+"\\"+f):
	    for f1 in listdir_recursive(basedir+"\\"+f):
		ret.append(f+"\\"+f1)
    return ret

all = []



for f in listdir_recursive(dirs.installed):
    if string.find(f,'CVS')>=0:
        continue
    all.append((f, dirs.installed, dirs.dst))
    
