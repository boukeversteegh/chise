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

/* Built-in tar functionality.  See tar.h for usage. */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>

#include "win32.h"
#include <zlib.h>
#include "tar.h"
#include "mkdir.h"
#include "log.h"

#include "port.h"

#if defined(CYGWIN) || defined(MINGW)
#define FACTOR (0x19db1ded53ea710LL)
#define NSPERSEC 10000000LL
#else
__int64 FACTOR=0x19db1ded53ea710L;
__int64 NSPERSEC=10000000L;
#endif
#define SYMLINK_COOKIE "!<symlink>"

typedef struct {
  char name[100];               /*   0 */
  char mode[8];                 /* 100 */
  char uid[8];                  /* 108 */
  char gid[8];                  /* 116 */
  char size[12];                /* 124 */
  char mtime[12];               /* 136 */
  char chksum[8];               /* 148 */
  char typeflag;                /* 156 */
  char linkname[100];           /* 157 */
  char magic[6];                /* 257 */
  char version[2];              /* 263 */
  char uname[32];               /* 265 */
  char gname[32];               /* 297 */
  char devmajor[8];             /* 329 */
  char devminor[8];             /* 337 */
  char prefix[155];             /* 345 */
  char junk[12];		/* 500 */
} tar_header_type;

typedef struct tar_map_result_type_s {
  struct tar_map_result_type_s *next;
  char *stored_name;
  char *mapped_name;
} tar_map_result_type;

static tar_map_result_type *tar_map_result = 0;

static int err;

static char file_name[_MAX_PATH+512];
static char have_longname = 0;
static int  file_length;

static tar_header_type tar_header;
static char buf[512];

static int _tar_file_size = 0;
int _tar_verbose = 0;
FILE * _tar_vfile = 0;
#define vp if (_tar_verbose) fprintf
#define vp2 if (_tar_verbose>1) fprintf

static gzFile g = 0;

static char *
xstrdup (char *c)
{
  char *r = (char *) malloc (strlen (c) + 1);
  if (!r)
    exit_setup (1);
  strcpy (r, c);
  return r;
}

int
tar_open (char *pathname)
{
  struct stat s;
  if (_tar_vfile == 0)
    _tar_vfile = stderr;

  vp2 (_tar_vfile, "tar: open `%s'\n", pathname);
  if (stat (pathname, &s) < 0)
    return 1;
  _tar_file_size = s.st_size;

  g = gzopen (pathname, "rb");
  if (sizeof (tar_header) != 512)
    {
      /* drastic, but important */
      fprintf (stderr, "compilation error: tar header struct not 512"
	       " bytes (it's %d)\n", sizeof (tar_header));
      exit_setup (1);
    }
  err = 0;
  return g ? 0 : 1;
}

/* For some reason the cygwin version uses a function that is not in
   the original source. We duplicate it here - although this does mean
   revealing some internals. */
extern "C" {
  z_off_t ZEXPORT tar_gzctell (gzFile file);
  typedef struct gz_stream {
    z_stream stream;
    int      z_err;   /* error code for last stream operation */
    int      z_eof;   /* set if end of input file */
    FILE     *file;   /* .gz file */
    Byte     *inbuf;  /* input buffer */
    Byte     *outbuf; /* output buffer */
    uLong    crc;     /* crc32 of uncompressed data */
    char     *msg;    /* error message */
    char     *path;   /* path name for debugging only */
    int      transparent; /* 1 if input file is not a .gz file */
    char     mode;    /* 'w' or 'r' */
    long     startpos; /* start of compressed data in file (header skipped) */
  } gz_stream;
};

z_off_t ZEXPORT tar_gzctell (gzFile file)
{
    gz_stream *s = (gz_stream *)file;
    return ftell(s->file);
}

int
tar_ftell ()
{
  return tar_gzctell (g);
}

static void
skip_file ()
{
  while (file_length > 0)
    {
      gzread (g, buf, 512);
      file_length -= 512;
    }
}

char *
tar_next_file ()
{
  int r, n;
  char *c;
  r = gzread (g, &tar_header, 512);

  /* See if we're at end of file */
  if (r != 512)
    return 0;

  /* See if the header is all zeros (i.e. last block) */
  n = 0;
  for (r = 512/sizeof (int); r; r--)
    n |= ((int *)&tar_header)[r-1];
  if (n == 0)
    return 0;

  if (!have_longname && tar_header.typeflag != 'L')
    {
      memcpy (file_name, tar_header.name, 100);
      file_name[100] = 0;
    }

  sscanf (tar_header.size, "%o", &file_length);

  vp2 (_tar_vfile, "%c %9d %s\n", tar_header.typeflag, file_length, file_name);

  switch (tar_header.typeflag)
    {
    case 'L': /* GNU tar long name extension */
      if (file_length > _MAX_PATH)
	{
	  skip_file ();
	  fprintf (stderr, "error: long file name exceeds %d characters\n",
		   _MAX_PATH);
	  err ++;
	  gzread (g, &tar_header, 512);
	  sscanf (tar_header.size, "%o", &file_length);
	  skip_file ();
	  return tar_next_file ();
	}
      c = file_name;
      while (file_length > 0)
	{
	  int need = file_length > 512 ? 512 : file_length;
	  if (gzread (g, buf, 512) < 512)
	    return 0;
	  memcpy (c, buf, need);
	  c += need;
	  file_length -= need;
	}
      *c = 0;
      have_longname = 1;
      return tar_next_file ();

    case '3': /* char */
    case '4': /* block */
    case '6': /* fifo */
      fprintf (stderr, "warning: not extracting special file %s\n",
	       file_name);
      err ++;
      return tar_next_file ();

    case '0': /* regular file */
    case 0: /* regular file also */
    case '2': /* symbolic link */
    case '5': /* directory */
    case '7': /* contiguous file */
      return file_name;

    case '1': /* hard link, we just copy */
      return file_name;

    default:
      fprintf (stderr, "error: unknown (or unsupported) file type `%c'\n",
	       tar_header.typeflag);
      err ++;
      skip_file ();
      return tar_next_file ();
    }
}

static void
fix_time_stamp (char *path)
{
  int mtime;
#if defined(CYGWIN) || defined(MINGW)
  long long ftimev;
#else
  __int64 ftimev;
#endif
  FILETIME ftime;
  HANDLE h;

  sscanf (tar_header.mtime, "%o", &mtime);
  ftimev = mtime * NSPERSEC + FACTOR;
  ftime.dwHighDateTime = ftimev >> 32;
  ftime.dwLowDateTime = ftimev;
  h = CreateFileA (path, GENERIC_WRITE, FILE_SHARE_READ | FILE_SHARE_WRITE,
		   0, OPEN_EXISTING,
		   FILE_ATTRIBUTE_NORMAL | FILE_FLAG_BACKUP_SEMANTICS, 0);
  if (h)
    {
      SetFileTime (h, 0, 0, &ftime);
      CloseHandle (h);
    }
}

static FILE *
common_fopen (char *path)
{
  FILE *out;
  out = fopen (path, "wb");
  if (!out)
    {
      /* maybe we need to create a directory */
      if (mkdir_p (0, path))
	{
	  skip_file ();
	  return 0;
	}
      out = fopen (path, "wb");
    }
  if (!out)
    {
      fprintf (stderr, "unable to write to file %s\n", path);
      perror ("The error was");
      skip_file ();
      return 0;
    }
  return out;
}

static void
prepare_for_file (char *path)
{
  DWORD w;
  mkdir_p (0, path);

  w = GetFileAttributes (path);
  if (w != 0xffffffff && w & FILE_ATTRIBUTE_DIRECTORY)
    {
      char *tmp = (char *) malloc (strlen (path) + 10);
      int i = 0;
      do {
	i++;
	sprintf (tmp, "%s.old-%d", path, i);
      } while (GetFileAttributes (tmp) != 0xffffffff);
      fprintf (stderr, "warning: moving directory \"%s\" out of the way.\n", path);
      MoveFile (path, tmp);
      free (tmp);
    }

  DeleteFileA (path);
}

int
tar_read_file (char *path)
{
  FILE *out, *copy;
  HANDLE h;
  DWORD w;
  int got;
  tar_map_result_type *tmr;

  switch (tar_header.typeflag)
    {
    case '0':	/* regular files */
    case 0:
    case '7':
      vp (_tar_vfile, "F %s\n", path);
      prepare_for_file (path);
      out = common_fopen (path);
      if (!out)
	return 1;

      while (file_length > 0)
	{
	  int put;
	  int want = file_length > 512 ? 512 : file_length;
	  got = gzread (g, buf, 512);
	  if (got < 512)
	    {
	      fprintf (stderr, "tar: unexpected end of file reading %s\n", path);
	      fclose (out);
	      remove (path);
	      return 1;
	    }
	  put = fwrite (buf, 1, want, out);
	  if (put < want)
	    {
	      fprintf (stderr, "tar: out of disk space writing %s\n", path);
	      fclose (out);
	      remove (path);
	      skip_file ();
	      return 1;
	    }
	  file_length -= want;
	}
      fclose (out);

      fix_time_stamp (path);

      /* we need this to do hard links below */
      tmr = (tar_map_result_type *) malloc (sizeof (tar_map_result_type));
      tmr->next = tar_map_result;
      tmr->stored_name = xstrdup (file_name);
      tmr->mapped_name = xstrdup (path);
      tar_map_result = tmr;

      return 0;

    case '1':	/* hard links; we just copy */
      for (tmr = tar_map_result; tmr; tmr=tmr->next)
	if (strcmp (tmr->stored_name, tar_header.linkname) == 0)
	  break;
      if (!tmr)
	{
	  fprintf (stderr, "tar: can't find %s to link %s to\n",
		   tar_header.linkname, path);
	  return 1;
	}
      vp (_tar_vfile, "H %s <- %s\n", path, tmr->mapped_name);
      prepare_for_file (path);
      copy = fopen (tmr->mapped_name, "rb");
      if (!copy)
	{
	  fprintf (stderr, "tar: unable to read %s\n", tmr->mapped_name);
	  return 1;
	}
      out = common_fopen (path);
      if (!out)
	return 1;

      while ((got = fread (buf, 1, 512, copy)) > 0)
	{
	  int put = fwrite (buf, 1, got, out);
	  if (put < got)
	    {
	      fprintf (stderr, "tar: out of disk space writing %s\n", path);
	      fclose (out);
	      fclose (copy);
	      remove (path);
	      return 1;
	    }
	}
      fclose (out);
      fclose (copy);

      fix_time_stamp (path);
      return 0;

    case '5':	/* directories */
      vp (_tar_vfile, "D %s\n", path);
      while (path[0] && path[strlen (path)-1] == '/')
	path[strlen (path) - 1] = 0;
      return mkdir_p (1, path);


    case '2':	/* symbolic links */
      vp (_tar_vfile, "L %s -> %s\n", path, tar_header.linkname);
      prepare_for_file (path);
      h = CreateFileA (path, GENERIC_WRITE, 0, 0, CREATE_NEW,
		      FILE_ATTRIBUTE_NORMAL, 0);
      if (h == INVALID_HANDLE_VALUE)
	{
	  fprintf (stderr, "error: unable to create symlink \"%s\" -> \"%s\"\n",
		   path, tar_header.linkname);
	  return 1;
	}
      strcpy (buf, SYMLINK_COOKIE);
      strcat (buf, tar_header.linkname);
      if (WriteFile (h, buf, strlen (buf) + 1, &w, NULL))
	{
	  CloseHandle (h);
	  SetFileAttributesA (path, FILE_ATTRIBUTE_SYSTEM);
	  return 0;
	}
      CloseHandle (h);
      fprintf (stderr, "error: unable to write symlink \"%s\"\n", path);
      DeleteFileA (path);
      return 1;
    }

  return 0;
}

int
tar_close ()
{
#if 0
  while (tar_map_result)
    {
      tar_map_result_type *t = tar_map_result->next;
      free (tar_map_result->stored_name);
      free (tar_map_result->mapped_name);
      free (tar_map_result);
      tar_map_result = t;
    }
#endif
  tar_map_result = 0;

  if (gzclose (g))
    err ++;
  return err; /* includes errors for skipped files, etc */
}

typedef struct {
  char *from;
  int from_len;
  char *to;
  int to_len;
} map_type;

static map_type *map;
static int nmaps;

int
tar_auto (char *pathname, char **maplist)
{
  char *c;
  int errcount = 0;
  int i, j;
  map_type mtemp;
  char newname[_MAX_PATH+512];
  static char twiddles[] = "|\b/\b-\b\\\b";
  int t = 0;

  for (nmaps=0; maplist[nmaps*2]; nmaps++) ;
  map = (map_type *) malloc ((nmaps+1) * sizeof (map_type));
  for (nmaps=0; maplist[nmaps*2]; nmaps++)
    {
      map[nmaps].from = maplist[nmaps*2];
      map[nmaps].from_len = strlen (maplist[nmaps*2]);
      map[nmaps].to = maplist[nmaps*2+1];
      map[nmaps].to_len = strlen (maplist[nmaps*2+1]);
    }
  /* bubble sort - expect the maps to be short */
  for (i=0; i<nmaps-1; i++)
    for (j=i+1; j<nmaps; j++)
      if (map[i].from_len < map[j].from_len)
	{
	  mtemp = map[i];
	  map[i] = map[j];
	  map[j] = mtemp;
	}

  if ((tar_open (pathname)))
    return 1;
  while ((c = tar_next_file ()))
    {
      int l = strlen (c);
      for (i=0; i<nmaps; i++)
	if (l >= map[i].from_len
	    && strncmp (c, map[i].from, map[i].from_len) == 0)
	  {
	    strcpy (newname, map[i].to);
	    strcpy (newname+map[i].to_len, c + map[i].from_len);
	    c = newname;
	    break;
	  }

      t = (t+2) % 8;
      fwrite (twiddles+t, 1, 2, stderr);

      if (tar_read_file (c))
	errcount ++;
    }
  if (tar_close ())
    errcount ++;

  fwrite (" \b", 1, 2, stderr);

  vp2 (_tar_vfile, "tar_auto returns %d\n", errcount);
  return errcount;
}
