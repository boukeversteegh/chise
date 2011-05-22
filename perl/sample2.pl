# sample2.pl (compareã®sample)
# $Id: sample2.pl,v 1.3 2003/10/08 13:30:29 moro Exp $
use CHISE;

my $s1 = CHISE->define_char(strokes => 12, radical => 9);
my $s2 = CHISE->define_char(strokes => 12, radical => 9, daikanwa => 694);
my $c = $s1->compare($s2);

if ($c == $CHISE::EXCLUSIVE) {
  print "ø»‚´¦ä»–çš„\n";
} elsif ($c == $CHISE::HAVE_INTERSECTION) {
  print "å…±é€šø½Š±¿ø»‚¸™ã‚ã‚Š\n";
} elsif ($c == $CHISE::PROPER_SUBSET) {
  print "ø½Š’…å…¨ø½Š±¿ø»‚¸™ø½ŠŸ›åˆ\n";
} elsif ($c == $CHISE::PROPER_SUPERSET) {
  print "ø½Š’…å…¨ä¸Šø½ŠŒ©ø½ŠŸ›åˆ\n";
} elsif ($c == $CHISE::EQSET) {
  print "ø½Š’…å…¨ä¸€è‡´\n";
}
