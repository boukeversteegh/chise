###############################################################################
# makeidsdb.pl
#
#   create DB file for KAGE/cgi from CHISE-IDS *.txt 
#   by Koichi Kamichi
###############################################################################

if($#ARGV != 0 || !(-d $ARGV[0])){
	print "Usage: perl makeidsdb.pl ids_dir\n";
	exit;
}
$idsdir = $ARGV[0];
$idsdir =~ s/\/?$//; # remove the last slash

if(-e "idsdb"){
  print "Remove old idsdb first.\n";
	exit;
}

use Fcntl;
use BerkeleyDB;

tie %db, "BerkeleyDB::Hash", -Filename => "idsdb", -Flags => DB_CREATE
or die "An error occured at ceating DB file.\n";
%db = ();

opendir(DH, "$ARGV[0]");
@dirlist = readdir(DH);

$counter = 1;

foreach(@dirlist){
	if(m/IDS-.*\.txt/){

		open(FH, "<$ARGV[0]/$_");
		@buffer = <FH>;
		if($buffer[0] =~ m/utf-8-mcs-er/){
			foreach(@buffer){
				
				$_ =~ m/(.*?)[\s]?\t(.*)\t(.*)\n/; # remove space after Daikanwa's No.
				$key = &properucs2kageucs($1);
				$value = &utf8er2kageer($3);
				if(($key ne $value) && ($value ne "")){
					print "\rcreating ... [$counter] key : $key      ";
					$db{$key} = $value;
					$counter++;
				}

			}
		}
		close(FH);
		
	}
}

closedir(DH);
untie(%db);
print "\rdone.\n";

###############################################################################

sub properucs2kageucs{
	my $ax = @_[0];

	$ax =~ s/\'/s/; # replace single quote for Daikanwa No.
	$ax =~ s/\"/d/; # replace double quote for Daikanwa No.
	$ax =~ s/U\+/u/;
	$ax =~ s/U\-0*/u/;

	return lc($ax);
}

sub utf8er2kageer{
	my $result, $first, $semicolon, $ax;
	
	$result = "";
	
	for(my $pointer = 0; $pointer < length(@_[0]);){
		$first = unpack("C", substr(@_[0], $pointer, 1));
    if(0x00 <= $first && $first <= 0x7f){ # 1 byte
    	
    	# the top letter is must be "&"
    	if($first == 0x26){
				$semicolon = index(@_[0], ';', $pointer);    	
				$ax = substr(@_[0], $pointer + 1, $semicolon - $pointer - 1).".";
				$ax =~ s/^I-//; # remove "I-"
				$ax =~ s/\'/s/; # replace single quote for Daikanwa No.
				$ax =~ s/\"/d/; # replace double quote for Daikanwa No.
				$result .= $ax;

				$pointer = $semicolon + 1;
    	}
    	else{
	    	$pointer += 1;
    	}
    	
		}
    elsif(0xc0 <= $first && $first <= 0xdf){ # 2 bytes
			# may not be exist
    	$pointer += 2;
    }
    elsif(0xe0 <= $first && $first <= 0xef){ # 3 bytes
    	$ax = (unpack("C", substr(@_[0], $pointer, 1)) & 0x0f) << 12;
    	$ax += (unpack("C", substr(@_[0], $pointer + 1, 1)) & 0x3f) << 6;
    	$ax += (unpack("C", substr(@_[0], $pointer + 2, 1)) & 0x3f);
    	$result .= sprintf("u%x.", $ax);
			$pointer += 3;
    }
    elsif(0xf0 <= $first && $first <= 0xf7){ # 4 bytes
    	$ax = (unpack("C", substr(@_[0], $pointer, 1)) & 0x07) << 18;
    	$ax += (unpack("C", substr(@_[0], $pointer + 1, 1)) & 0x3f) << 12;
    	$ax += (unpack("C", substr(@_[0], $pointer + 2, 1)) & 0x3f) << 6;
    	$ax += (unpack("C", substr(@_[0], $pointer + 3, 1)) & 0x3f);
    	$result .= sprintf("u%x.", $ax);
    	$pointer += 4;
    }
    elsif(0xf8 <= $first && $first <= 0xfb){ # 5 bytes
    	$ax = (unpack("C", substr(@_[0], $pointer, 1)) & 0x03) << 24;
    	$ax += (unpack("C", substr(@_[0], $pointer + 1, 1)) & 0x3f) << 18;
    	$ax += (unpack("C", substr(@_[0], $pointer + 2, 1)) & 0x3f) << 12;
    	$ax += (unpack("C", substr(@_[0], $pointer + 3, 1)) & 0x3f) << 6;
    	$ax += (unpack("C", substr(@_[0], $pointer + 4, 1)) & 0x3f);
    	$result .= sprintf("u%x.", $ax);
    	$pointer += 5;
    }
    elsif(0xfc <= $first && $first <= 0xfd){ # 6 bytes
    	$ax = (unpack("C", substr(@_[0], $pointer, 1)) & 0x01) << 30;
    	$ax += (unpack("C", substr(@_[0], $pointer + 1, 1)) & 0x3f) << 24;
    	$ax += (unpack("C", substr(@_[0], $pointer + 2, 1)) & 0x3f) << 18;
    	$ax += (unpack("C", substr(@_[0], $pointer + 3, 1)) & 0x3f) << 12;
    	$ax += (unpack("C", substr(@_[0], $pointer + 4, 1)) & 0x3f) << 6;
    	$ax += (unpack("C", substr(@_[0], $pointer + 5, 1)) & 0x3f);
    	$result .= sprintf("u%x.", $ax);
    	$pointer += 6;
    }
		
	}

	chop($result); # remove the last period char.
	return lc($result);

}
