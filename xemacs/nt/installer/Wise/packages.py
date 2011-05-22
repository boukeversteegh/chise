#configuration variables

#package categories
category_names = ["libs", "comm", "oa", "os", "prog", "wp", "games"]

category_descriptions = {"libs":"Libraries",
                         "comm":"Communication",
                         "oa": "Productivity", #???
                         "os": "Operating System",
                         "prog": "Programming",
                         "wp": "Word Processing",
                         "games": "Games and Amusements"}


#packages to install by default
default=["xemacs-base","edit-utils","efs",
	 "text-modes","prog-modes",
	 "dired","apel",
	 "c-support","cc-mode",
	 "mail-lib","pc","sounds-wav"]

def category_of_letter(x):
    return category_names[ord(x)-ord('A')]

def letter_of_category(cat):
    return chr(ord('A')+category_names.index(cat))

def letter_of_package(x):
    return chr(ord('A')+packages_of_category(category_of_package(x)).index(x))

import dirs, os
catpkg = {}
pkgcat = {}

for cat in category_names:
    pkgcat[cat]=[]
    dd = os.path.join(dirs.pkg_src,cat)
    for d in os.listdir(dd):
        if d == "CVS":
            continue
        manifest = dirs.packages + "\\pkginfo\\MANIFEST." + d
        if not os.path.exists(manifest): #it's not installed, skip it
            continue
        if os.path.isdir(os.path.join(dd,d)):
            catpkg[d] = cat
            pkgcat[cat].append(d)
            
def category_of_package(p):
    return catpkg[p]

def packages_of_category(c):
    return pkgcat[c]

#Brief descriptions of the packages.
#This data is up-to-date as of 13 January 1998.
package_descriptions={
    "Sun":"Support for Sparcworks.",
    "apel":"A Portable Emacs Library",
    "edebug":"A Lisp debugger",
    "dired":"The DIRectory EDitor",
    "efs":"Access remote filesystems",
    "mail-lib":"Fundamental email support",
    "tooltalk":"Tooltalk",
    "xemacs-base":"Fundamental XEmacs support",
    "xemacs-devel":"Lisp developer support.",
    "footnote":"Footnoting in mail messages",
    "gnats":"XEmacs bug reports",
    "gnus":"Newsreader and Mailreader",
    "mailcrypt":"Message encryption with PGP.",
    "mh-e":"Support for MH mailreader",
    "net-utils":"Networking Utilities",
    "ph":"CCSO/qi directory client",
    "rmail":"An obsolete Emacs mailer",
    "supercite":"Mail/News Citation tool",
    "tm":"Emacs MIME support",
    "vm":"An Emacs mailer",
    "w3":"A Web browser",
    "cookie":"Spook and Yow (Zippy quotes)",
    "games":"Tetris, Sokoban, and Snake",
    "mine":"Minehunt",
    "misc-games":"Other amusements and diversions",
    "egg-its":"Wnn(4.2 and 6)/SJ3 support",
    "leim":"Quail",
    "locale":"Localized menubars",
    "mule-base":"Basic Mule support",
    "skk":"Another Japanese Language Input Method",
    "calendar":"Calendar and diary",
    "edit-utils":"Various XEmacs goodies",
    "forms":"Obsolete forms editing support",
    "frame-icon":"Change icon based on mode",
    "hm--html-menus":"HTML editing",
    "ispell":"Spell-checking with ispell",
    "pc":"PC style interface emulation",
    "psgml":"Validated HTML/SGML editing",
    "sgml":"SGML/Linuxdoc-SGML editing",
    "slider":"User interface tool",
    "speedbar":"??? Document me.",
    "strokes":"Mouse enhancement utility",
    "text-modes":"Packages for editing text files",
    "time":"Display time and date",
    "eterm":"Terminal emulator",
    "igrep":"Enhanced Grep",
    "ilisp":"Front-end for Inferior Lisp",
    "os-utils":"Misc. OS utilities",
    "view-process":"Unix process viewer",
    "ada":"Ada language support",
    "c-support":"Add-ons for editing C code",
    "cc-mode":"C, C++ and Java language editing",
    "debug": "GUD, gdb, dbx debugging support",
    "ediff": "Compare files",
    "emerge": "Merge files",
    "pcl-cvs":"CVS frontend.",
    "prog-modes":"Various programming languages",
    "scheme":"Front-end for Inferior Scheme",
    "sh-script":"Support for editing shell scripts",
    "vc":"Version Control",
    "vc-cc":"Broken",
    "vhdl":"Support for VHDL",
    "auctex":"Basic TeX/LaTeX support",
    "crisp":"Crisp/Brief emulation",
    "edt":"DEC EDIT/EDT emulation",
    "texinfo":"XEmacs TeXinfo support.",
    "textools":"TeX support",
    "tpu":"DEC EDIT/TPU support",
    "viper":"VI emulation",
    "elib":"Portable elisp utility library",
    "fsf-compat": "FSF Emacs compatibility files",
    "sounds-wav": "XEmacs Microsoft sound files",
    "bbdb": "The Big Brother Data Base",
    "eudc": "Emacs Unified Directory Client",
    "mew": "Messaging in an Emacs World",
    "zenirc": "IRC client",
    "calc": "Emacs calculator",
    "jde": "Java development environment",
    "reftex": "LaTeX cross-referencing and citations"
}




