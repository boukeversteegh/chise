package Chise_utils;

require 5.008;
use strict;
use warnings;

require Exporter;

use utf8;
use BerkeleyDB;
use vars qw(%db %chardb %db_opened
	    %reverse_db %reverse_chardb %rdb_opened
	    %er_alias $er_prefix_re
	    $atr $idc
	    $omegadb_path
	);

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Chise_utils ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
				   %db %chardb
				   %reverse_db %reverse_chardb
				   $idc
				   %er_alias $er_prefix_re
				   $omegadb_path
				   &get_db
				   &get_reverse_db
				   &get_char_attribute
				   &get_chars_matching
				   &get_chars_containing
				   &get_chars_for
				   &de_er
				   &ids_argc
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
);
our $VERSION = '0.03';


# Preloaded methods go here.

$omegadb_path="";
unless($omegadb_path){
    if(-w '/usr/local/share/chise/omega'){
	$omegadb_path='/usr/local/share/chise/omega';
    }elsif(-w '/usr/share/chise/omega'){
	$omegadb_path='/usr/share/chise/omega';
    }elsif(-w '/sw/share/chise/omega'){
	$omegadb_path='/sw/share/chise/omega';
    }elsif(-w '/usr/local/lib/chise/omega'){
	$omegadb_path='/usr/local/lib/chise/omega';
    }else{
	$omegadb_path=".";
    }
}

my $DB_HOME="";
unless($DB_HOME){
    if(-e '/usr/local/share/chise/1.0/db'){
	$DB_HOME='/usr/local/share/chise/1.0/db';
    }elsif(-e '/usr/share/chise/1.0/db'){
	$DB_HOME='/usr/share/chise/1.0/db';
    }elsif(-e '/sw/share/chise/1.0/db'){
	$DB_HOME='/sw/share/chise/1.0/db';
    }elsif(-e '/usr/local/lib/chise/chise-db'){
	$DB_HOME='/usr/local/lib/chise/chise-db';
    }elsif(-e '/usr/lib/chise/chise-db'){
	$DB_HOME='/usr/lib/chise/chise-db';
    }elsif(-e '/usr/local/lib/chise/char-db'){
	$DB_HOME='/usr/local/lib/chise/char-db';
    }elsif(-e 'd:/work/chise/char-db'){
	$DB_HOME='d:/work/chise/char-db';
    }else{
	print STDERR "No database found.\n";
	print STDERR "Pleas set \$DB_HOME to Chise_utils.pm.\n";
	exit 1;
    }
}

$idc="\x{2ff0}-\x{2fff}";

%er_alias =
    ('C1','=cns11643-1',
     'C2','=cns11643-2',
     'C3','=cns11643-3',
     'C4','=cns11643-4',
     'C5','=cns11643-5',
     'C6','=cns11643-6',
     'C7','=cns11643-7',
     'CB','=cbeta',
     'CDP','=big5-cdp',
     'GT','=gt',
     'GT-K','=gt-k',
     'HZK1','=hanziku-1',
     'HZK2','=hanziku-2',
     'HZK3','=hanziku-3',
     'HZK4','=hanziku-4',
     'HZK5','=hanziku-5',
     'HZK6','=hanziku-6',
     'HZK7','=hanziku-7',
     'HZK8','=hanziku-8',
     'HZK9','=hanziku-9',
     'HZK10','=hanziku-10',
     'HZK11','=hanziku-11',
     'HZK12','=hanziku-12',
     'J78','=jisx0208-1978',
     'J83','=jisx0208',
     'J90','=jisx0208-1990',
     'JSP','=jisx0212',
     'JX1','=jisx0213-1',
     'JX2','=jisx0213-2',
     'K0','=ks-x1001',
     'M','=daikanwa',
     );

$er_prefix_re=join '|', keys %er_alias;

if(-d "$DB_HOME/character"){
    for (glob "$DB_HOME/character/feature/*"){
	next if(/\.txt$/);
	$atr=$_;
	$atr=~s!$DB_HOME/character/feature/!!;
	$db{$atr}=$_;
    }
    for (glob "$DB_HOME/character/index/*"){
	next if(/\.txt$/);
	$atr=$_;
	$atr=~s!$DB_HOME/character/index/!!;
	$reverse_db{$atr}=$_;
    }
}elsif(-d "$DB_HOME/system-char-id"){
    for (glob "$DB_HOME/system-char-id/*"){
	next if(/\.txt$/);
	$atr=$_;
	$atr=~s!$DB_HOME/system-char-id/!!;
	$db{$atr}=$_;
    }
    for (glob "$DB_HOME/*"){
	next if(/\.txt$/ or /system-char-id/);
	$atr=$_;
	$atr=~s!$DB_HOME/!!;
	$reverse_db{$atr}=$_."/system-char-id";
    }
}else{
    print STDERR "No database found.\n";
    print STDERR "Pleas set \$DB_HOME to Chise_utils.pm correctly.\n";
    exit 1;
}

sub get_db{
    my($atr)=@_;
    return 1 if($db_opened{$atr});
    if(defined($db{$atr}) and -f $db{$atr}){
	if(tie %{$chardb{$atr}}, 'BerkeleyDB::Hash',
	   -Filename => $db{$atr},
	   -Flags => DB_RDONLY){
	    $db_opened{$atr}=1;
	}else{
	    return undef;
	}
    }else{
	return undef;
    }
}

sub get_reverse_db{
    my($atr)=@_;
    return 1 if($rdb_opened{$atr});
    if(defined($reverse_db{$atr}) and -f $reverse_db{$atr}){
	if(tie %{$reverse_chardb{$atr}}, "BerkeleyDB::Hash",
	   -Filename => $reverse_db{$atr},
	   -Flags => DB_RDONLY){
	    $rdb_opened{$atr}=1;
	}else{
	    return undef;
	}
    }else{
	return undef;
    }
}


sub get_char_attribute{
    my($char,$atr)=@_;
    my($res);
    unless($db_opened{$atr}){
	&get_db($atr) or return "";
    }
    if($res=$chardb{$atr}->{"?$char"}){
	utf8::decode($res);
	return $res;
    }else{
	return "";
    }
}

sub get_chars_containing{
    my($atr,$value)=@_;
    my($char,@res);
    unless($db_opened{$atr}){
	&get_db($atr) or return ();
    }
    utf8::encode($value);
    foreach $char (keys %{$chardb{$atr}}){
	if($chardb{$atr}->{$char}=~/$value/){
	    utf8::decode($char);
	      $char=~s/^\?//;
	      push @res,$char;
	  }
    }
    return @res;
}

sub get_chars_matching{
    my($atr,$value)=@_;
    my($char,@res);
    if(defined($reverse_db{$atr})){
	unless($rdb_opened{$atr}){
	    &get_reverse_db($atr) or return ();
	}
	utf8::encode($value);
	if($char=$reverse_chardb{$atr}->{$value}){
	    utf8::decode($char);
	      $char=~s/^\?//;
	      push @res,$char;
	  }
    }
    else{
#   never fall back.
#    unless(@res){
#    # fall back if DB inconsistency exists.
	unless($db_opened{$atr}){
	    &get_db($atr) or return ();
	}
	foreach $char (keys %{$chardb{$atr}}){
	    if($chardb{$atr}->{$char} eq $value){
		utf8::decode($char);
		  $char=~s/^\?//;
		  push @res,$char;
	      }
	}
    }
    return @res;
}

sub get_chars_for{
    my($query)=@_;
    my @q=split(",",$query);
    my(%res,@res,$atr,$value);
    my $i=0;
    foreach $query (@q){
        if($query=~/=~/){
	    ($atr,$value)=split("=~",$query,2);
	    $i++;
	    foreach (&get_chars_containing($atr,$value)){
		$res{$_}++;
	    }
	}elsif($query=~/==/){
	    ($atr,$value)=split(/==/,$query,2);
	    $i++;
	    foreach (&get_chars_matching($atr,$value)){
		$res{$_}++;
	    }
	}
    }
    return grep {defined($res{$_}) and $res{$_}==$i} (keys %res);
}

sub de_er{
    my($er)=@_;
    my($output_char,$atr,$value);
    my($prefix,$suffix);
    $er=~/^(amp|&)?(.+?)(;)?$/
	and $prefix=$1,$er=$2,$suffix=$3;
    $prefix or $prefix="",$suffix or $suffix="";
    if($prefix eq 'amp'){$prefix="",$suffix="";}
    if($er=~/^\d+$/){
	$output_char=pack("U",$er);
    }elsif($er=~/^U[\+\-]([a-fA-F\d]+)/){
	$output_char=pack("U",hex($1));
    }elsif($er=~/^(?:I\-)?($er_prefix_re)\-?([0-9a-fA-F]+)$/){
	($atr,$value)=($1,$2);
	if($er_alias{$atr}=~/daikanwa|gt/){
	    $value+=0;
	}else{
	    $value=hex($value);
	}
	($output_char)=&get_chars_matching($er_alias{$atr},$value);
    }
    if($output_char){
	return $output_char;
    }else{
	return $prefix.$er.$suffix;
    }
}

sub ids_argc{
    my($char)=@_;
    my $char_id=unpack("U",$char);
    if($char_id==0x2ff2 or $char_id==0x2ff3){
	return 3;
    }elsif($char_id>=0x2ff0 and $char_id<=0x2fff){
	return 2;
    }else{
	return 0;
    }
}

# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

Chise_utils - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Chise_utils;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Chise_utils, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.


=head1 AUTHOR

A. U. Thor, a.u.thor@a.galaxy.far.far.away

=head1 SEE ALSO

perl(1).

=cut
