#!/usr/bin/perl -w

use strict;
use vars qw($cmapfile $db_home $encoding $utf16
	    %cs_var 
	    $ucs $cid $last
	    $ciddb_filename $ciddb %ciddb %cid
	    );
use BerkeleyDB;
use Chise_utils ':all';
require 5.008;

my $debug=0;

my $usage=<<EOF;
Usage: perl $0 <CMAP file> <CHISE DB dir>
    <CMAP file> UniJIS-UTF16-H etc. available in Adobe Reader Directory.
    <CHISE DB dir> is directory to store BDB data,
      typically /usr/local/share/chise/1.0/db.
EOF

#my $db_home="/usr/local/lib/chise/char-db";
#my $db_home="/usr/local/lib/chise/db";

if(@ARGV==2){
    $cmapfile=shift;
    $db_home=shift;

    $db_home=~s!/$!!;
    if(-d "$db_home/character"){
	$db_home=$db_home."/character/feature";
    }elsif(-d "$db_home/system-char-id"){
	$db_home=$db_home."/system-char-id";
    }else{
	print STDERR $usage;
	exit 1;
    }

    ($ciddb_filename=$cmapfile)=~s!^.*/(.*)$!"vnd-adobe-cid-".lc($1)!e;
    ($encoding=$cmapfile)=~s!.*/Uni(\w+).*$!"\=ucs\@".lc($1)!e;
}

unless(defined($cmapfile) and -f $cmapfile
       and $encoding=~/^=ucs\@(cns|gb|jis|ks)$/
       and -d $db_home){
    print STDERR $usage;
    exit 1;
}

if($cmapfile=~/utf16/io){
    $utf16=1;
}

# if working on Mac OS.
if($^O=~/darwin/){
    print STDERR "Using ^M as delimiter.\n";
    $/="";
}

$cs_var{'=ucs@cns'}=['=cns11643-1','=cns11643-2',
		     '=cns11643-3','=cns11643-4',
		     '=cns11643-5','=cns11643-6',
		     '=cns11643-7'];

$cs_var{'=ucs@gb'}=['=gb12345','=gb2312'];

$cs_var{'=ucs@jis'}=['=jis-x0208','=jis-x0208-1978',
		     '=jis-x0208-1983','=jis-x0208-1990','=jis-x0208-1997',
		     '=jis-x0212',
		     '=jis-x0213-1-2000','=jis-x0213-2-2000'];

$cs_var{'=ucs@ks'}=['=ks-x1001'];

if(-f "$db_home/$ciddb_filename"){
    print STDERR "Removing old DB $db_home/$ciddb_filename.\n";
    unlink "$db_home/$ciddb_filename";
}

$ciddb=tie %ciddb, 'BerkeleyDB::Hash',
    -Filename => "$db_home/$ciddb_filename",
    -Flags => DB_CREATE|DB_TRUNCATE,
    -Pagesize      => 512,
    or die $!;

my $in_cidrange=0;
my $in_cidchar=0;
print STDERR "Reading $cmapfile...";
open(CMAP,"<$cmapfile") or die $!;
# taken from expandcmap.pl by taiji.
while(<CMAP>){
    if(/begincidrange/o){
	$in_cidrange=1;
    }elsif(/endcidrange/o){
	$in_cidrange=0;
    }elsif(/begincidchar/o){
	$in_cidchar=1;
    }elsif(/endcidchar/o){
	$in_cidchar=0;
    }elsif($in_cidchar){
	if(/<([\da-fA-F]+)>\s*(\d+)/o){
	    ($ucs,$cid)=($utf16?&decode_utf16($1):hex($1),$2);
	    &store_cid($ucs,$cid,$encoding);
	}
    }elsif($in_cidrange){
	if(/<([\da-fA-F]+)>\s*<([\da-fA-F]+)>\s*(\d+)/o){
	    ($ucs, $last, $cid) = ($utf16?&decode_utf16($1):hex($1), $utf16?&decode_utf16($2):hex($2), $3);
	    while ($ucs <= $last) {
		&store_cid($ucs,$cid,$encoding);
		$cid++,$ucs++;
	    }
	}
    }
}
close(CMAP);
print STDERR "done!\n";

print STDERR "Storing data to CHISE DB...";
foreach my $char (sort keys %cid){
    unless($ciddb->db_put("?".$char,$cid{$char})==0){
	die $!;
    }
}
print STDERR "done!\n";

undef $ciddb;
untie %ciddb;

exit 0;

sub store_cid{
    my($ucs,$cid,$encoding)=@_;
    my($char,$char_id,$char_id_unified);

    if($char_id=&replace_char_id($ucs,$encoding)){
	$char=pack("U",$char_id);
    }else{
	if(&have_glyph($ucs,$encoding)){
	    $char=pack("U",$ucs);
	}else{
	    foreach $char_id_unified (&get_char_id_unified($ucs)){
		if(&have_glyph($char_id_unified,$encoding)){
		    $char_id=$char_id_unified;
		    last;
		}
	    }
	    if($char_id){
		$char=pack("U",$char_id);
		if($debug){
		    print STDERR sprintf("%x is used for %x(%s).\n",
					 $char_id,$ucs,$encoding);
		}
	    }else{
		$char=pack("U",$ucs);
		if($debug){
		    print STDERR sprintf("%x is uncertain for %s.\n",$ucs,$encoding);
		}
	    }
	}
    }
#    $char=&replace_denotational($char);
    if($debug){
	print STDERR sprintf("%X:%d\n",unpack("U",$char),$cid);
    }
    $cid{$char}=$cid;
}

sub replace_denotational($){
    my($in_char)=@_;
    my($out_char);
    my $ucs=unpack("U",$in_char);

    if(($out_char)=&get_chars_matching('=ucs@unicode',$ucs)){
	return $out_char;
    }else{
	return $in_char;
    }
}

sub replace_char_id{
    my($ucs,$encoding)=@_;
    my($char);

    if(($char)=&get_chars_matching($encoding,$ucs)){
	return unpack("U",$char);
    }else{
	return undef;
    }
}

sub have_glyph{
    my($char_id,$cs)=@_;
    my($cs_var,$char);
    $char=pack("U",$char_id);
    foreach $cs_var (@{$cs_var{$cs}}){
	if(&get_char_attribute($char,$cs_var)){
	    return 1;
	}
    }
    return undef;
}

sub get_char_id_unified{
    my($char_id)=@_;
    my($chars);
    if($chars=&get_char_attribute(pack("U",$char_id),'->ucs-unified')){
	$chars=~s/^\((.*)\)$/$1/;
	return map {unpack("U",$_)} (split(/\s*\?/,$chars));
    }else{
	return ();
    }
}

sub decode_utf16($){
    my($in)=@_;
    my($out);
    if($in=~m/([\da-fA-F]{4})([\da-fA-F]{4})/o){
	$out=0x10000 + (hex($1) - 0xD800) * 0x400 + (hex($2) - 0xDC00);
    }else{
	$out=hex($in);
    }
    return $out;
}
