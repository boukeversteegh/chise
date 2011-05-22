# sample1.pl
# $Id: sample1.pl,v 1.3 2003/10/08 13:30:29 moro Exp $

use CHISE;

my $s1 = CHISE->new(daikanwa => 6942); # 「字」
print $s1->dumpAttr;
print $s1->strokes, "\n"; # �����数を表示
