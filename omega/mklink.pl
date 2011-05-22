#!/usr/bin/perl -w

use strict;
use vars qw($usage
	    $in_cs @in_cs $in_cs_re
	    $out_cs @out_cs
	    $scriptdir
	    );

$usage=<<"EOF";
Usage: $0 <input coding system> <script directory>
    creates necessary links of external OTP to the curret directory.
  input coding system: Utf8mcs, Utf8cns, Utf8gb, Utf8jis, Utf8ks.
  script directory:    directory where inCHISE and makefonts.pl exist,
                         typically /usr/local/lib/chise/omega
EOF

@in_cs=("Utf8mcs","Utf8cns","Utf8gb","Utf8jis","Utf8ks");
@out_cs=("UniMulti","UniGB","UniCNS","UniJIS","UniKS");
$in_cs_re=join "|", @in_cs;

if(@ARGV!=2){
    print $usage;
    exit 1;
}else{
    $in_cs=shift;
    $scriptdir=shift;
    $scriptdir=~s!/$!!;
    unless($in_cs=~/^($in_cs_re)$/
	   and -e "$scriptdir/inCHISE"
	   and -e "$scriptdir/makefonts.pl"){
	print $usage;
	exit 1;
    }
}

foreach $out_cs (@out_cs){
    symlink "$scriptdir/inCHISE", $in_cs."To".$out_cs;
}
symlink "$scriptdir/makefonts.pl", "makefonts.pl";
