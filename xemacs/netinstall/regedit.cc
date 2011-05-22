/*
 * Copyright (c) 2000, Red Hat, Inc.
 *
 *     This program is free software; you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation; either version 2 of the License, or
 *     (at your option) any later version.
 *
 *     A copy of the GNU General Public License can be found at
 *     http://www.gnu.org/
 *
 * Written by DJ Delorie <dj@cygnus.com>
 *
 */

/* Manipulate the registry for XEmacs. */

#include "win32.h"

#include <stdio.h>
#if defined(CYGWIN) || defined(MINGW)
#include <cygwin/version.h>
#include <sys/mount.h>
#endif

#include "reginfo.h"
#include "regedit.h"
#include "msg.h"
#include "resource.h"
#include "dialog.h"

static char *
find_cygwin_mount (HKEY rkey, int *istext)
{
  char buf[1000];
  char *retval = 0;
  HKEY key;
  DWORD retvallen = 0;
  DWORD flags = 0;
  DWORD type;

#if defined(CYGWIN) || defined(MINGW)
  sprintf (buf, "Software\\%s\\%s\\%s\\/",
	   CYGWIN_INFO_CYGNUS_REGISTRY_NAME,
	   CYGWIN_INFO_CYGWIN_REGISTRY_NAME,
	   CYGWIN_INFO_CYGWIN_MOUNT_REGISTRY_NAME);

  if (RegOpenKeyEx (rkey, buf, 0, KEY_READ, &key) != ERROR_SUCCESS)
    return 0;

  if (RegQueryValueEx (key, "native", 0, &type, 0, &retvallen)
      == ERROR_SUCCESS)
    {
      retval = new char[retvallen+1];
      if (RegQueryValueEx (key, "native", 0, &type, (BYTE *)retval, &retvallen)
	  != ERROR_SUCCESS)
	{
	  delete retval;
	  retval = 0;
	}
    }

  retvallen = sizeof (flags);
  RegQueryValueEx (key, "flags", 0, &type, (BYTE *)&flags, &retvallen);

  RegCloseKey (key);

  if (retval)
    *istext = (flags & MOUNT_BINARY) ? 0 : 1;
  return retval;
#else
  return 0;
#endif
}

static char *
find_xemacs_root (HKEY rkey, int* isnative)
{
  char buf[1000];
  char *retval = 0;
  HKEY key;
  DWORD retvallen = 0;
  DWORD type;
  DWORD itype;

  sprintf (buf, "Software\\%s\\%s",
	   XEMACS_INFO_XEMACS_ORG_REGISTRY_NAME,
	   XEMACS_INFO_XEMACS_REGISTRY_NAME);

  if (RegOpenKeyEx (rkey, buf, 0, KEY_READ, &key) != ERROR_SUCCESS)
    return 0;

  if (RegQueryValueEx (key, XEMACS_INFO_XEMACS_ROOT_KEY,
		       0, &type, 0, &retvallen) == ERROR_SUCCESS)
    {
      retval = new char[retvallen+1];
      if (RegQueryValueEx (key, XEMACS_INFO_XEMACS_ROOT_KEY,
			   0, &type, (BYTE *)retval, &retvallen) 
	  != ERROR_SUCCESS)
	{
	  delete retval;
	  retval = 0;
	}
    }

  retvallen = sizeof (itype);
  RegQueryValueEx (key, XEMACS_INFO_XEMACS_ROOT_TYPE, 
		   0, &type, (BYTE *)&itype, &retvallen);

  if (itype == 1)
    *isnative = 1;
  else
    *isnative = 0;

  RegCloseKey (key);

  return retval;
}

char *
find_root_location (int *issystem, int *isnative)
{
  char *rv;
  if ((rv = find_xemacs_root (HKEY_CURRENT_USER, isnative)))
    {
      *issystem = 0;
      return rv;
    }
  else if ((rv = find_xemacs_root (HKEY_LOCAL_MACHINE, isnative)))
    {
      *issystem = 1;
      return rv;
    }
  return 0;
}

char *
find_cygwin_root (int *issystem)
{
  char *rv;
  int istext;
  if ((rv = find_cygwin_mount (HKEY_CURRENT_USER, &istext)))
    {
      *issystem = 0;
      return rv;
    }
  else if ((rv = find_cygwin_mount (HKEY_LOCAL_MACHINE, &istext)))
    {
      *issystem = 1;
      return rv;
    }
  return 0;
}

void
create_xemacs_root (char *path, int issystem, int isnative)
{
  char buf[1000];
  HKEY key;
  DWORD disposition;
  DWORD itype = isnative ? 1 : 0;

  remove_xemacs_root ();

  sprintf (buf, "Software\\%s\\%s",
	   XEMACS_INFO_XEMACS_ORG_REGISTRY_NAME,
	   XEMACS_INFO_XEMACS_REGISTRY_NAME);

  HKEY kr = issystem ? HKEY_LOCAL_MACHINE : HKEY_CURRENT_USER;
  if (RegCreateKeyEx (kr, buf, 0, "XEmacs", 0, KEY_ALL_ACCESS,
		      0, &key, &disposition) != ERROR_SUCCESS)
    fatal ("create_xemacs_root");

  RegSetValueEx (key, XEMACS_INFO_XEMACS_ROOT_KEY, 
		 0, REG_SZ, (BYTE *)path, strlen (path)+1);
  RegSetValueEx (key, XEMACS_INFO_XEMACS_ROOT_TYPE, 
		 0, REG_DWORD, (BYTE *)&itype, sizeof (itype));
  // write out the package path
  sprintf (buf, "~\\.xemacs;%s\\site-packages;%s\\xemacs-packages",
	   path, path);
  RegSetValueEx (key, XEMACS_INFO_XEMACS_PACKAGE_KEY, 
		 0, REG_SZ, (BYTE *)buf, strlen (buf)+1);
  RegCloseKey (key);
}

void
set_app_path (char *exe, char* path, int issystem)
{
  char buf[1000];
  HKEY key;
  DWORD disposition;

  sprintf (buf, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths\\%s",
	   exe);

  HKEY kr = issystem ? HKEY_LOCAL_MACHINE : HKEY_CURRENT_USER;
  RegDeleteKey (kr, buf);
  
  if (RegCreateKeyEx (kr, buf, 0, "XEmacs", 0, KEY_ALL_ACCESS,
		      0, &key, &disposition) != ERROR_SUCCESS)
    fatal ("set_app_path");

  RegSetValueEx (key, "Path", 
		 0, REG_SZ, (BYTE *)path, strlen (path)+1);
  RegCloseKey (key);
}

void
set_install_path (char* path, int issystem)
{
  char buf[1000];
  HKEY key;
  DWORD disposition;

  sprintf (buf, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\XEmacs");

  HKEY kr = issystem ? HKEY_LOCAL_MACHINE : HKEY_CURRENT_USER;
  RegDeleteKey (kr, buf);
  
  if (RegCreateKeyEx (kr, buf, 0, "XEmacs", 0, KEY_ALL_ACCESS,
		      0, &key, &disposition) != ERROR_SUCCESS)
    fatal ("set_install_path");

  RegSetValueEx (key, "DisplayName", 
		 0, REG_SZ, (BYTE *)"XEmacs", strlen ("XEmacs")+1);

  sprintf (buf, "%s\\setup.exe -u", path);
  RegSetValueEx (key, "UninstallString", 
		 0, REG_SZ, (BYTE *)buf, strlen (buf)+1);
  RegCloseKey (key);
}

void
setup_explorer (char* file_type, char* name, char *exe)
{
  char buf[1000];
  char ftype[32];
  HKEY key;
  DWORD disposition;

  sprintf (buf, ".%s", file_type);
  RegDeleteKey (HKEY_CLASSES_ROOT, buf);

  if (RegCreateKeyEx (HKEY_CLASSES_ROOT, buf, 0, "XEmacs", 0, KEY_ALL_ACCESS,
		      0, &key, &disposition) != ERROR_SUCCESS)
    fatal ("setup_explorer");

  // set default key
  sprintf (ftype, "%sfile", file_type);
  RegSetValueEx (key, NULL, 
		 0, REG_SZ, (BYTE *)ftype, strlen (ftype)+1);
  RegCloseKey (key);

  // create file type entry
  RegDeleteKey (HKEY_CLASSES_ROOT, ftype);
  if (RegCreateKeyEx (HKEY_CLASSES_ROOT, ftype, 0, "XEmacs", 
		      0, KEY_ALL_ACCESS,
		      0, &key, &disposition) != ERROR_SUCCESS)
    fatal ("setup_explorer");
  RegSetValueEx (key, NULL,
		 0, REG_SZ, (BYTE *)name, strlen (name)+1);
  RegSetValueEx (key, "AlwaysShowExt",
		 0, REG_SZ, (BYTE *)"", strlen ("")+1);
  RegCloseKey (key);

  // make xemacs file the default icon
  sprintf(buf, "%s\\DefaultIcon", ftype);
  if (RegCreateKeyEx (HKEY_CLASSES_ROOT, buf, 0, "XEmacs", 0, KEY_ALL_ACCESS,
		      0, &key, &disposition) != ERROR_SUCCESS)
    fatal ("setup_explorer");

  sprintf(buf, "%s,1", exe);
  RegSetValueEx (key, NULL, 
		 0, REG_SZ, (BYTE *)buf, strlen (buf)+1);
  RegCloseKey (key);

  // command default key (exe)
  sprintf(buf, "%s\\shell\\Open\\command", ftype);
  if (RegCreateKeyEx (HKEY_CLASSES_ROOT, buf, 0, "XEmacs", 0, KEY_ALL_ACCESS,
		      0, &key, &disposition) != ERROR_SUCCESS)
    fatal ("setup_explorer");

  sprintf(buf, "\"%s\"", exe);	// Don't need %1 because dde will open the file
  RegSetValueEx (key, NULL, 
		 0, REG_SZ, (BYTE *)buf, strlen (buf)+1);
  RegCloseKey (key);

  // ddeexec
  sprintf(buf, "%s\\shell\\Open\\ddeexec", ftype);
  if (RegCreateKeyEx (HKEY_CLASSES_ROOT, buf, 0, "XEmacs", 0, KEY_ALL_ACCESS,
		      0, &key, &disposition) != ERROR_SUCCESS)
    fatal ("setup_explorer");

#define DDE_OPEN "Open(\"%1\")"
  RegSetValueEx (key, NULL, 
		 0, REG_SZ, (BYTE *)DDE_OPEN, strlen (DDE_OPEN)+1);
  RegCloseKey (key);

  // ddeexec application
  sprintf(buf, "%s\\shell\\Open\\ddeexec\\application", ftype);
  if (RegCreateKeyEx (HKEY_CLASSES_ROOT, buf, 0, "XEmacs", 0, KEY_ALL_ACCESS,
		      0, &key, &disposition) != ERROR_SUCCESS)
    fatal ("setup_explorer");
  RegSetValueEx (key, NULL, 
		 0, REG_SZ, (BYTE *)"XEmacs", strlen ("XEmacs")+1);
  RegCloseKey (key);

  // ddeexec topic
  sprintf(buf, "%s\\shell\\Open\\ddeexec\\topic", ftype);
  if (RegCreateKeyEx (HKEY_CLASSES_ROOT, buf, 0, "XEmacs", 0, KEY_ALL_ACCESS,
		      0, &key, &disposition) != ERROR_SUCCESS)
    fatal ("setup_explorer");
  RegSetValueEx (key, NULL, 
		 0, REG_SZ, (BYTE *)"system", strlen ("system")+1);
  RegCloseKey (key);
}

static void
remove1 (HKEY rkey)
{
  char buf[1000];

  sprintf (buf, "Software\\%s\\%s",
	   XEMACS_INFO_XEMACS_ORG_REGISTRY_NAME,
	   XEMACS_INFO_XEMACS_REGISTRY_NAME);
  RegDeleteKey (rkey, buf);

  sprintf (buf, "Software\\%s",
	   XEMACS_INFO_XEMACS_ORG_REGISTRY_NAME);
  RegDeleteKey (rkey, buf);
}

void
remove_xemacs_root ()
{
  remove1 (HKEY_LOCAL_MACHINE);
  remove1 (HKEY_CURRENT_USER);
}

void
remove_app_path (char *exe)
{
  char buf[1000];
  sprintf (buf, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths\\%s",
	   exe);

  RegDeleteKey (HKEY_LOCAL_MACHINE, buf);
  RegDeleteKey (HKEY_CURRENT_USER, buf);
}

void
remove_uninstall_path ()
{
  char buf[1000];
  sprintf (buf, "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall\\XEmacs");

  RegDeleteKey (HKEY_LOCAL_MACHINE, buf);
  RegDeleteKey (HKEY_CURRENT_USER, buf);
}
