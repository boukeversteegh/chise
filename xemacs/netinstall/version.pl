while (<STDIN>) {
  if (/^\$Revision:\s*([0-9\.]*)/) {
    print "char *version = \"$1\";\n";
    print "static char *id = \"\\n%%% setup-version $1\\n\";\n";
  }
}
