
/* Minitar:  extract .tar.gz files on Win32 platforms. 
   Uses zlib for decompression.
   
   This is very simple-minded, it ignores checksums, and any type of file 
   that is not a plain file or a directory.  Nonetheless it is useful.

   Author: Charles G. Waldman (cgw@pgt.com),  Aug 4 1998

   This file is placed in the public domain; you can
   do whatever you like with it.  There is NO WARRANTY. 
   If it breaks, you get to keep both pieces */


#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <io.h>
#ifdef WIN32_NATIVE
# include <direct.h>	/* For mkdir */
#endif

#include <zlib.h>

static void
Usage (char *name)
{
  fprintf (stderr, "Usage: %s file.tar.gz [base-dir]\n", name);
  fprintf (stderr, "\tExtracts the contents compressed tar file to base-dir\n");
  exit (-1);
}


#define BLOCKSIZE 512
#define MAXNAMELEN 1024

static int
octal (char *str)
{
  int ret = -1;
  sscanf (str, "%o", &ret);
  return ret;
}

/* this is like mkdir -p, except if there is no trailing slash,
   the final component is assumed to be a file, rather than a
   path component, so it is not created as a directory */

static int
makepath (char *path)
{
  char tmp[MAXNAMELEN];
  char *cp;

  for (cp=path; cp; cp = (char*)strchr (cp+1, '/'))
    {
      if (!*cp)
	break;
      if (*cp != '/')
	continue;
      strncpy (tmp, path, cp-path);
      tmp[cp-path] = '\0';
      if (strlen (tmp) == 0)
	continue;
#ifdef WIN32_NATIVE
      if (mkdir (tmp))
#else
	if (mkdir (tmp, 0777))
#endif
	  {
	    if (errno == EEXIST)
	      continue;
	    else
	      return -1;
	  }
    }
  return 0;
}



int
main (int argc, char **argv)
{
  char fullname[MAXNAMELEN];
  char *basedir = ".";
  char *tarfile;
  int size;
  char osize[13];
  char name[101];
  char magic[7];
  char type;
  
  gzFile *infile = (gzFile*)0;
  FILE *outfile = (FILE*)0;

  char block[BLOCKSIZE];
  int nbytes, nread, nwritten;

  int in_block = 0;
  int directory = 0;

  if (argc < 2 || argc > 3)
    Usage (argv[0]);

  tarfile = argv[1];
  if (argc==3)
    basedir = argv[2];

  if (! (infile = gzopen (tarfile, "rb")))
    {
      fprintf (stderr, "Cannot open %s\n", tarfile);
      exit (-2);
    }
  
  while (1)
    {
      nread = gzread (infile, block, 512);

      if (!in_block && nread == 0)
	break;

      if (nread != BLOCKSIZE)
	{
	  fprintf (stderr, "Error: incomplete block read. Exiting.\n");
	  exit (-2);
	}

      if (!in_block)
	{
	  if (block[0]=='\0')  /* We're done */
	    break;

	  strncpy (magic, block+257, 6);
	  magic[6] = '\0';
	  if (strcmp (magic, "ustar "))
	    {
	      fprintf (stderr,
		       "Error: incorrect magic number in tar header. Exiting\n");
	      exit (-2);
	    }

	  strncpy (name, block, 100);
	  name[100] = '\0';
	  sprintf (fullname, "%s/%s", basedir, name);
	  printf ("%s\n", fullname);
	  type = block[156];
      
	  switch (type)
	    {
	    case '0':
	    case '\0':
	      directory = 0;
	      break;
	    case '5':
	      directory = 1;
	      break;
	    default:
	      fprintf (stderr, "Error: unknown type flag %c. Exiting.\n", type);
	      exit (-2);
	      break;
	    }
      
	  if (directory)
	    {
	      in_block = 0;
	
	      /* makepath will ignore the final path component, so make sure 
		 dirnames have a trailing slash */

	      if (fullname[strlen (fullname)-1] != '/')
		strcat (fullname, "/");
	      if (makepath (fullname))
		{
		  fprintf (stderr, "Error: cannot create directory %s. Exiting.\n",
			   fullname);
		  exit (-2);
		}
	      continue;
	    }
	  else
	    { /*file */
	      in_block = 1;
	      if (outfile)
		{
		  if (fclose (outfile))
		    {
		      fprintf (stderr, "Error: cannot close file %s. Exiting.\n",
			       fullname);
		      exit (-2);
		    }
		  outfile = (FILE*)0;
		}

	      if (!(outfile = fopen (fullname, "wb")))
		{
		  /*try creating the directory, maybe it's not there */
		  if (makepath (fullname))
		    {
		      fprintf (stderr, "Error: cannot create file %s. Exiting.\n",
			       fullname);
		      exit (-2);
		    }
		  /* now try again to open the file */
		  if (!(outfile = fopen (fullname, "wb")))
		    {
		      fprintf (stderr, "Error: cannot create file %s. Exiting.\n",
			       fullname);
		      exit (-2);
		    }
		}

	      strncpy (osize, block+124, 12);
	      osize[12] = '\0';
	      size = octal (osize);
	      if (size<0)
		{
		  fprintf (stderr, "Error: invalid size in tar header. Exiting.\n");
		  exit (-2);
		}
	      if (size==0)	/* file of size 0 is done */
		in_block = 0;
	    }
	}
      else
	{ /* write or continue writing file contents */
	  nbytes = size>512? 512:size;
      
	  nwritten = fwrite (block, 1, nbytes, outfile);
	  if (nwritten != nbytes)
	    {
	      fprintf (stderr, "Error: only wrote %d bytes to file %s. Exiting.\n",
		       nwritten, fullname);
	      exit (-2);
	    }
	  size -= nbytes;
	  if (size==0)
	    in_block = 0;
	}
    }
  return 0;
}


  
