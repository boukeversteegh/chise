import string
import re
import os
import types

infile=open("xemacs.tmpl","r")

import version
import dirs
import filelist
import packages

def letter(package):
    index = packages.all.index(package)
    if index>29:
	raise "WISE error: too many components"
    return chr(ord("A")+index)

def letters(package_list):
    ret = ""
    for p in package_list: 
	ret = ret+letter(p)
    return ret

def describe(package):
    if package in packages.descriptions.keys():
	return ": "+packages.descriptions[package]
    else: return ""

def ifblock(var,val):
    return("item: If/While Statement\n  Variable=%s\n  Value=%s\n  Flags=00001010\nend\n" % (var,val))

def endblock():
    return("item: End Block\nend\n")

def setvar(var,val):
    return("item: Set Variable\n  Variable=%s\n  Value=%s\n  Flags=10000000\nend\n" % (string.upper(var), val))

def default_letters_of_category(cat):
    val = ""
    for p in packages.default:
        if packages.category_of_package(p) == cat:
            val = val + packages.letter_of_package(p)
    return val

def set_category_defaults():
    ret = ""
    for c in packages.category_names:
        ret = ret +  setvar(c, default_letters_of_category(c))
    return ret

def do_category(cat):
    ret = ifblock("COMPONENTS", packages.letter_of_category(cat))
    for pkg in packages.packages_of_category(cat):
        ret = ret + ifblock(string.upper(cat),packages.letter_of_package(pkg))
        for f in files_of_package(pkg):
            ret = ret+install_pkg_file(f)
        ret = ret + endblock()
    ret = ret + endblock()
    return ret

def files_of_package(package):
    manifest_file = dirs.packages + "\\pkginfo\\MANIFEST." + package
    manifest = open(manifest_file,"r")
    lines = manifest.readlines()
    lines = map(lambda s:s[:-1], lines)
    lines = map(lambda s:string.replace(s,'/','\\'), lines)
    return lines

def category_dialog(cat):
    npkg = len(packages.packages_of_category(cat))
    ret=""
    ret=ret+"  item: Dialog\n    Title="+packages.category_descriptions[cat]+" Packages\n"
    ret=ret+"    Width=210\n"
    ret=ret+"    Height=%d\n" % (45+npkg*10)
    ret=ret+"    Font Name=Helv\n"
    ret=ret+"    Font Size=8\n"
    ret=ret+"    item: Push Button\n"
    ret=ret+"      Rectangle=107 %d 147 %d\n" % (5+npkg*10+2, 5+npkg*10+17)
    ret=ret+"      Create Flags=01010000000000010000000000000001\n"
    ret=ret+"      Text=OK\n"
    ret=ret+"    end\n"
    ret=ret+"    item: Push Button\n"
    ret=ret+"      Rectangle=153 %d 193 %d\n" % (5+npkg*10+2, 5+npkg*10+17)
    ret=ret+"      Variable=%s\n" % string.upper(cat)
    ret=ret+"      Value=%%%s_SAVE%%\n" % string.upper(cat)
    ret=ret+"      Create Flags=01010000000000010000000000000000\n"
    ret=ret+"      Flags=0000000000000001\n"
    ret=ret+"      Text=Cancel\n"
    ret=ret+"    end\n"
    ret=ret+"    item: Checkbox\n"
    ret=ret+"      Rectangle=0 5 191 %d\n" % (10*npkg)
    ret=ret+"      Variable=%s\n"%string.upper(cat)
    ret=ret+"      Create Flags=01010000000000010000000000000011\n"
    ret=ret+"      Flags=0000000000000010\n"
    for pkg in packages.packages_of_category(cat):
        ret = ret+"      Text=%s: %s\n"%( pkg, packages.package_descriptions[pkg])
    ret=ret+"      Text=\n"
    ret=ret+"    end\n"
    ret=ret+"  end\n"
    return ret

def src_path(src,name):
    return src + "\\" + name

def dst_path(dst,name):
    return "%MAINDIR%"+"\\"+dst+"\\" + name

def install_file(name,src,dst):
    return("item: Install File\n  Source=%s\n  Destination=%s\n  Flags=0000000010000010\nend\n" % (src_path(src,name),dst_path(dst,name)))

def install_pkg_file(name):
    return install_file(name,dirs.packages,dirs.pkg_dst)

def do_package(package):
    return ifblock("COMPONENTS",letter(package)) + \
	   string.join(map(install_pkg_file,files(package)),"")+ \
	   endblock()

for line in infile.readlines():
    left=string.find(line,"<<<")
    if left>=0:
	right=string.find(line,">>>")
	expr=line[left+3:right]
	val=eval(expr)
	if type(val)==types.StringType:
	    print line[:left] + val + line[right+3:],
	elif type(val)==types.ListType:
	    for v in val:
		print line[:left] + v + line[right+3:],
    else: print line,


