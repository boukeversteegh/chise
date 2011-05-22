#include <stdlib.h>
#include <string.h>
#include <alloca.h>
#include <chise.h>

CHISE_DS *ds;

static int
test_name_map_func (CHISE_DS *ds, unsigned char *name)
{
  printf ("feature : %s\n", name);
  return 0;
}

static int
test_map_func (CHISE_Char_ID cid, CHISE_Feature db,
	       CHISE_Value *valdatum)
{
  unsigned char buf[256];
  unsigned char name[256];
  int ucs = -1;

  printf ("#x%08X ", cid);

  if ( chise_char_gets_feature_value
       (cid, chise_ds_get_feature (ds, "=ucs"),
	buf, sizeof (buf)) != NULL )
    {
      ucs = atoi (buf);
      printf ("[U-%08X]", ucs);
    }
  else if ( chise_char_gets_feature_value
	    (cid, chise_ds_get_feature (ds, "=>ucs"),
	     buf, sizeof (buf)) != NULL )
    {
      ucs = atoi (buf);
      printf ("(U-%08X)", ucs);
    }
  else
    printf ("            ");

  if ( chise_char_gets_feature_value
       (cid, chise_ds_get_feature (ds, "name"),
	name, sizeof (name)) != NULL )
    printf (" %s", name);

  if (chise_value_size (valdatum) < 256)
    {
      strncpy (buf, chise_value_data (valdatum),
	       chise_value_size (valdatum));
      buf[chise_value_size (valdatum)] = '\0';
      printf ("\t%s\n", buf);
    }
  else
    printf ("\t%s\n",
	    chise_value_to_c_string (valdatum));
  return 0;
}

static int
test_radical_func (CHISE_Char_ID cid, CHISE_Feature db,
		   CHISE_Value *valdatum)
{
  unsigned char buf[256];
  unsigned char name[256];
  int ucs = -1;

  if (chise_value_size (valdatum) < 256)
    {
      strncpy (buf, chise_value_data (valdatum),
	       chise_value_size (valdatum));
      buf[chise_value_size (valdatum)] = '\0';
      printf ("%s\t", buf);
    }
  else
    printf ("%s\t",
	    chise_value_to_c_string (valdatum));

  if (strcmp (buf, "75") == 0) /* Tree */
    {
      printf ("#x%08X ", cid);
      if ( chise_char_gets_feature_value
	   (cid, chise_ds_get_feature (ds, "=ucs"),
	    buf, sizeof (buf)) != NULL )
	{
	  ucs = atoi (buf);
	  printf ("[U-%08X]", ucs);
	}
      else if ( chise_char_gets_feature_value
		(cid, chise_ds_get_feature (ds, "=>ucs"),
		 buf, sizeof (buf)) != NULL )
	{
	  ucs = atoi (buf);
	  printf ("(U-%08X)", ucs);
	}
      else
	printf ("            ");

      printf ("\n");
    }
  else
    printf ("\n");
  return 0;
}

int
main (int argc, char* argv[])
{
#if 0
  CHISE_CCS ccs_daikanwa;
#endif
  CHISE_Feature ft_ideographic_structure;
  CHISE_Feature ft_numeric_value;
  CHISE_Feature ft_radicals;
  CHISE_Char_ID char_id;
  unsigned char buf[1024];

  printf("chise_system_db_dir = %s\n", chise_system_db_dir);

  /* open a data-source */
  ds = CHISE_DS_open (CHISE_DS_Berkeley_DB, chise_system_db_dir,
		      0 /* DB_HASH */, 0755 /* rwxr-xr-x */);
  if (ds == NULL)
    {
      printf ("Can't open data source\n");
      return -1;
    }

  printf("data source location = %s\n", chise_ds_location(ds));


  /*
   * get a character corresponding with Daikanwa number 364
   */

#if 1
  char_id = chise_ds_decode_char (ds, "=daikanwa", 364);
#else
  /* setup a decoding-table */
  ccs_daikanwa
    = chise_ds_get_ccs (ds, "=daikanwa");
  if (ccs_daikanwa == NULL)
    {
      printf ("Can't open CCS =daikanwa\n");
      CHISE_DS_close (ds);
      return -1;
    }
  
  /* get a character from the decoding-table */
  char_id = chise_ccs_decode (ccs_daikanwa, 364);
#endif

  /* get a feature-value of the character */
  ft_ideographic_structure
    = chise_ds_get_feature (ds, "ideographic-structure");
  if (chise_char_gets_feature_value
      (char_id, ft_ideographic_structure, buf, sizeof (buf)) != NULL)
    printf ("#x%X => %s\n", char_id, buf);
  else
    printf ("#x%X\n", char_id);

  chise_ds_foreach_char_feature_name (ds, &test_name_map_func);

  ft_radicals = chise_ds_get_feature (ds, "ideographic-radical");
  chise_feature_foreach_char_with_value (ft_radicals, &test_radical_func);

  ft_numeric_value = chise_ds_get_feature (ds, "numeric-value");
  chise_feature_foreach_char_with_value (ft_numeric_value, &test_map_func);
  chise_feature_foreach_char_with_value
    (ft_ideographic_structure, &test_map_func);

  /* close the data-source */
  CHISE_DS_close (ds);

  return 0;
}
