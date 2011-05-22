# sample2.pl (compareのsample)
# $Id: sample2.pl,v 1.3 2003/10/08 13:30:29 moro Exp $
use CHISE;

my $s1 = CHISE->define_char(strokes => 12, radical => 9);
my $s2 = CHISE->define_char(strokes => 12, radical => 9, daikanwa => 694);
my $c = $s1->compare($s2);

if ($c == $CHISE::EXCLUSIVE) {
  print "�����他的\n";
} elsif ($c == $CHISE::HAVE_INTERSECTION) {
  print "共通����������あり\n";
} elsif ($c == $CHISE::PROPER_SUBSET) {
  print "�����全���������������合\n";
} elsif ($c == $CHISE::PROPER_SUPERSET) {
  print "�����全上����������合\n";
} elsif ($c == $CHISE::EQSET) {
  print "�����全一致\n";
}
