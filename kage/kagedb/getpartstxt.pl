###############################################################################
# getpartstxt.pl
#
#   create txt file from KAGE/cgi 
#   by Koichi Kamichi
###############################################################################

if($#ARGV != 0 || !(-d $ARGV[0])){
	print "Usage: perl getpartstxt.pl partsdb_dir\n";
	exit;
}
$partsdir = $ARGV[0];
$partsdir =~ s/\/?$//; # remove the last slash

use Fcntl;
use BerkeleyDB;

tie %db, "BerkeleyDB::Hash", -Filename => "$partsdir/partsdb", -Flags => DB_RDONLY
or die "An error occured at opening DB file.\n";
%db = ();

foreach(sort(keys(%db))){
	print "$_\t$db{$_}\n";
}

untie(%db);
