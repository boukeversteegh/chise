require "mkmf"
if have_library("db", "db_create") and have_header("db.h")
  open("config.h", "wb"){|f|
    f.print <<"EOT"
#ifndef CONFIG_H
#define CONFIG_H
#define CHISE_DB_DIR    "/cygdrive/c/chise/chise-db"
#define CHISE_SI_DB_DIR "/cygdrive/c/chise/chise-db"
#endif
EOT
  }
  $defs << "-DHAVE_CONFIG_H"
  $defs << "-DHAVE_STRNLEN"
  create_makefile("libchise_c")
end
