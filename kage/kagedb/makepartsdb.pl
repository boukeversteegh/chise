###############################################################################
# makepartsdb.pl
#
#   create DB file for KAGE/cgi from parts.txt 
#   by Koichi Kamichi
###############################################################################

if($#ARGV != 0 || !(-d $ARGV[0])){
	print "Usage: perl makepartsdb.pl parts_dir\n";
	exit;
}
$partsdir = $ARGV[0];
$partsdir =~ s/\/?$//; # remove the last slash

if(-e "partsdb"){
  print "Remove old partsdb first.\n";
	exit;
}

use Fcntl;
use BerkeleyDB;

tie %db, "BerkeleyDB::Hash", -Filename => "partsdb", -Flags => DB_CREATE
or die "An error occured at ceating DB file.\n";
%db = ();

open(FH, "<$ARGV[0]/parts.txt");
@buffer = <FH>;

$counter = 1;

foreach(@buffer){
	$_ =~ m/(.*?)\t(.*)\n/;
	$key = $1;
	$value = $2;
	if($value ne ""){
		print "\rcreating ... [$counter] key : $key      ";
		$db{$key} = $value;
		$counter++;
	}
}

close(FH);
untie(%db);
print "\n\rdone.\n";
