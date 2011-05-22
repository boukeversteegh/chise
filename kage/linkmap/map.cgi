#!/usr/bin/perl

$PERL = "/usr/bin/perl";
$LINKMAP_DIR = "/var/www/fonts.jp/chise_linkmap";

use CGI;
$cgi = new CGI;
$target = lc($cgi->param('code'));
if($target !~ m/^[0-9a-f]{4,5}$/){
  $buffer = "Request error!";
} else {
  if(!-e "$LINKMAP_DIR/data/linkmap_$target.html"){
    $dummy = `$PERL $LINKMAP_DIR/map.pl $target data/linkmap_$target 2>/dev/null`;
  }
  
  $buffer = "";
  open FH, "<$LINKMAP_DIR/data/linkmap_$target.html";
  while(!eof(FH)){
    $buffer .= <FH>;
  }
  close FH;
}

print "Content-type: text/html\n\n";
print $buffer;

