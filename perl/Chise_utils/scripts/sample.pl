#!/usr/bin/perl -w -CSD

use Getopt::Long;  
use strict;
use vars qw($atr $value $char
	    $opt_map $opt_rev_map $opt_mapfrom $opt_mapto
	    $opt_atr $opt_allatr $opt_showatr
	    $opt_query
	    $opt_help
	    );
use utf8;
use Chise_utils ':all';
require 5.008001;

my $usage=<<EOF;
Usage: perl $0 [-m <map> | --map <map> |
		-r <reverse map> |
		--mapfrom <map> |
		--mapto <map> |
                -q <expression> |
		--show-attribute |
                -h | --help |
		-a=<atribuite> <char> |
		-aa <char>]
    -q  <expression>
      ex. of <expression>
         total-strokes==8 means
           the attribute of total-strokes exactly matches to 8.
         ids-parts=~矢 means
            the attribute of ids-parts contains the string 矢.
         total-strokes==8,ids-parts=~矢 means both at the same time.
    -a  get <attribute> of <char>
    -aa get all attributes of <char>
EOF

&GetOptions("mapto=s"=>\$opt_mapto,
	    "mapfrom=s"=>\$opt_mapfrom,
	    "m=s"=>\$opt_map,
	    "r=s"=>\$opt_rev_map,
	    "a=s"=>\$opt_atr,
	    "aa"=>\$opt_allatr,
	    "show-attribute"=>\$opt_showatr,
	    "q"=>\$opt_query,
	    "help",\$opt_help,
	    "h",\$opt_help);

if($opt_help
   or !((($opt_map or $opt_rev_map or $opt_mapfrom or $opt_mapto) and @ARGV==0)
	or($opt_showatr and @ARGV==0)
	or @ARGV==1
	)
   ){
    print $usage;
    exit 1;
}else{
    $char=shift or $char="";
    $char=&de_er($char);
    utf8::decode($char);
}

if($opt_mapfrom){
    $opt_map="<=".$opt_mapfrom;
}elsif($opt_mapto){
    $opt_map="=>".$opt_mapto;
}

if($opt_map){
    if(&get_db($opt_map)){
	foreach $char (sort keys %{$chardb{$opt_map}}){
	    utf8::decode($char);
	    if($value=$chardb{$opt_map}->{$char}){
		utf8::decode($value);
		print $char,"\t",$value,"\n";
	    }
	}
    }else{
	print STDERR "No map for $opt_map.\n";
    }
}elsif($opt_rev_map){
    if(&get_reverse_db($opt_rev_map)){
	foreach $char (sort keys %{$reverse_chardb{$opt_rev_map}}){
	    utf8::decode($char);
	    if($value=$reverse_chardb{$opt_rev_map}->{$char}){
		utf8::decode($value);
		print $char,"\t",$value,"\n";
	    }
	}
    }else{
	print STDERR "No map for $opt_rev_map.\n";
    }
}elsif($opt_allatr){
    print $char,"\n";
    foreach $atr (sort keys %db){
	if($value=&get_char_attribute($char,$atr)){
	    print "  ",$atr,":",$value,"\n";
	}
    }
}elsif($opt_atr){
    print $char,"\n";
    print "  ",$opt_atr,":",&get_char_attribute($char,$opt_atr),"\n";
}elsif($opt_showatr){
#    print "In DB\n";
    foreach $atr (sort keys %db){
	print "  ",$atr,"\n";
    }
#    print "In reverse DB\n";
#    foreach $atr (sort keys %reverse_db){
#	print "  ",$atr,"\n";
#    }
}elsif($opt_query){
    my $query=$char;
    print join "\n",&get_chars_for($query),"\n";
}

exit 0;
