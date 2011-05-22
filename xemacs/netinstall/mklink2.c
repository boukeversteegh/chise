#include "win32.h"
#include "shlobj.h"

/* This part of the code must be in C because the C++ interface to COM
doesn't work. */

void
make_link_2 (char *exepath, char *args, char *icon, char *lname)
{
  IShellLink *sl;
  IPersistFile *pf;
  WCHAR widepath [_MAX_PATH];

  CoCreateInstance (&CLSID_ShellLink, NULL,
		    CLSCTX_INPROC_SERVER, &IID_IShellLink, (LPVOID *) & sl);
  sl->lpVtbl->QueryInterface (sl, &IID_IPersistFile, (void **) &pf);

  sl->lpVtbl->SetPath (sl, exepath);
  sl->lpVtbl->SetArguments (sl, args);
  sl->lpVtbl->SetIconLocation (sl, icon, 0);

  MultiByteToWideChar (CP_ACP, 0, lname, -1, widepath, _MAX_PATH);
  pf->lpVtbl->Save (pf, widepath, TRUE);

  pf->lpVtbl->Release (pf);
  sl->lpVtbl->Release (sl);
}
