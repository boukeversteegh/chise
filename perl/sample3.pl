# sample3.pl
# $Id: sample3.pl,v 1.3 2003/10/08 13:30:29 moro Exp $

use CHISE_REG;
use utf8;
#use re "debug";

if ('山川' =~ /(.)\same_total-strokes_1/) {
  print STDERR "matched!\n";
} else {
  print STDERR "unmatched...\n";
}
