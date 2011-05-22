%{
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

/* tokenize the setup.ini files.  We parse a string which we've
   previously downloaded.  The program must call ini_init() to specify
   that string. */

#include "win32.h"
#include <string.h>
#include <stdlib.h>

#include "ini.h"
#include "iniparse.h"

#define YY_INPUT(buf,result,max_size) { result = ini_getchar(buf, max_size); }

static int ini_getchar(char *buf, int max_size);
static void ignore_line ();

%}

/*%option debug */
%option noyywrap
%option yylineno
%option never-interactive

STR	[a-zA-Z0-9_./-]+

%%

\"[^"]*\"		{ yylval = strdup (yytext+1);
			  yylval[strlen (yylval)-1] = 0;
			  return STRING; }

"setup-timestamp:"	return SETUP_TIMESTAMP;
"setup-version:"	return SETUP_VERSION;
"version:"		return VERSION;
"install:"		return INSTALL;
"type:"			return TYPE;
"source:"		return SOURCE;
"sdesc:"		return SDESC;
"ldesc:"		return LDESC;

^{STR}":"		ignore_line ();

"[curr]"		return T_CURR;
"[test]"		return T_TEST;
"[exp]"			return T_TEST;
"[prev]"		return T_PREV;
"["{STR}"]"		return T_UNKNOWN;

{STR}			{ yylval = strdup (yytext);
			  return STRING; }

[ \t\r]+		/* do nothing */

"#".*\n			/* ignore comments */

\n			{ return yytext[0]; }
.			{ return yytext[0]; }

%%

static char *input_string = 0;
static char *end_input_string;

void
ini_init(char *string)
{
  input_string = string;
  end_input_string = input_string + strlen(input_string);
}

static int
ini_getchar(char *buf, int max_size)
{
  if (input_string)
    {
      int avail = end_input_string - input_string;
      if (avail == 0)
	{
	  input_string = end_input_string = 0;
	  return 0;
	}
      if (avail > max_size)
	avail = max_size;
      memcpy(buf, input_string, avail);
      input_string += avail;
      return avail;
    }
  else
    return 0;
}

static void
ignore_line ()
{
  char c;
  while (c = input ())
    {
      if (c == EOF)
	return;
      if (c == '\n')
	return;
    }
}
