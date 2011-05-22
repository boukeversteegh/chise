import os
import dirs

def listdir_recursive(basedir):
    ret = []
    for f in os.listdir(basedir):
	if os.path.isfile(basedir+"\\"+f):
	    ret.append(f)
	elif os.path.isdir(basedir+"\\"+f):
	    for f1 in listdir_recursive(basedir+"\\"+f):
		ret.append(f+"\\"+f1)
    return ret

install = []

for f in os.listdir(dirs.source+"\\lib-src"):
    if f == "DOC" or f[-4:]==".exe":
	install.append((f,dirs.source+"\\lib-src",dirs.bin_dst))


for f in ['runemacs.exe', 'xemacs.exe']:
    install.append((f,dirs.source+"\\src",dirs.bin_dst))

for f in listdir_recursive(dirs.source+"\\lisp"):
    install.append((f,dirs.source+"\\lisp",dirs.lisp_dst))

for f in listdir_recursive(dirs.source+"\\etc"):
    install.append((f,dirs.source+"\\etc",dirs.etc_dst))


for f in os.listdir(dirs.source+"\\info"):
    install.append((f,dirs.source+"\\info",dirs.info_dst))



    
