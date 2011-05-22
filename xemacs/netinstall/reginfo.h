/* reginfo.h -- XEmacs version numbers and accompanying documentation.

Copyright (C) 2000 Andy Piper. */

#define XEMACS_INFO_XEMACS_ORG_REGISTRY_NAME "XEmacs"
#define XEMACS_INFO_XEMACS_REGISTRY_NAME "XEmacs"
/* Keys */
#define XEMACS_INFO_XEMACS_ROOT_KEY "emacs_dir"
#define XEMACS_INFO_XEMACS_ROOT_TYPE "install_type"
#define XEMACS_INFO_XEMACS_PACKAGE_KEY "EMACSPACKAGEPATH"
#define XEMACS_INFO_XEMACS_VERSION_KEY "version"

#define XEMACS_DEFAULT_ROOT "\\Program Files\\XEmacs"
#define XEMACS_CYGWIN_DEFAULT_ROOT "\\usr\\local"

#define XEMACS_SETUP_DIR \
  ((char*)(install_type == IDC_INSTALL_NATIVE ? "\\setup\\" : "/lib/xemacs/setup/"))
#define XEMACS_RESOURCE_DIR \
  ((char*)(install_type == IDC_INSTALL_NATIVE ? "\\" : "/lib/xemacs/"))
#define XEMACS_PACKAGE_DIR \
  ((char*)(install_type == IDC_INSTALL_NATIVE ? "\\xemacs-packages\\" \
				    : "/lib/xemacs/xemacs-packages/"))
#define XEMACS_NATIVE_ARCH_NAME "i586-pc-win32"
#define XEMACS_CYGWIN_ARCH_NAME "i686-pc-cygwin"

/*
 * Installation hierarchy is:
 * C:\Program Files\XEmacs
 *			\xemacs-packages
 *				\etc
 *				\info
 *				\lib-src
 *				\lisp
 *				\man
 *				\pkginfo
 * 			\site-packages
 *			\mule-packages
 *			\XEmacs-21.4
 *				\i586-pc-win32
 *				\etc
 *				\info
 *				\lisp
 * Or:
 * /usr/local/lib
 *		/xemacs/xemacs-packages
 * 		/xemacs/site-packages
 *		/xemacs/mule-packages
 *		/xemacs-21.4
 *				/i686-pc-cygwin
 *				/etc
 *				/info
 *				/lisp
 * /usr/local/bin/i686-pc-cygwin
 */

 
