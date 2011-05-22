#!/usr/bin/perl

#==============================================================================
#
# KAGE/DB
#
# This script is the frontend of KAGE/DB. Running as CGI.
#
#==============================================================================

use BerkeleyDB;

$info = "";
$admin = "yes";
$dbdir = "/var/www/kagedb";

#=============== output header
print qq|Content-type: text/html;

<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style>
h1 { margin: 5px 0; padding: 10px; font-size: 20px; border: 1px solid #3333ff; clear: both;}
h2 { margin: 0; font-size: 18px; background: #9999ff; clear: both; }
img { width: 75; height: 75; float: left; margin: 10px; border: 1px dotted blue;}
hr { clear: both; border: 2px solid #000099; }
textarea { margin: 5px 0 5px 5px; }
input { margin: 10px 0 0 5px; }
div { margin: 10px; }
span.large { font-size: 40px; }
</style>
<title>KAGE/DB</title>
</head>
<body>|;

use CGI;
$cgi = new CGI;

if($admin eq "yes"){
	#=============== prepare idsDB
	tie %idsdb, "BerkeleyDB::Hash", 
	-Filename => "$dbdir/idsdb"
	 or print "DB error occured.";
	
	#=============== prepare partsDB
	tie %partsdb, "BerkeleyDB::Hash", 
	-Filename => "$dbdir/partsdb"
	 or print "DB error occured.";

	#=============== prepare aliasDB
	tie %aliasdb, "BerkeleyDB::Hash", 
	-Filename => "$dbdir/aliasdb"
	 or print "DB error occured.";
}else{
	#=============== prepare idsDB
	tie %idsdb, "BerkeleyDB::Hash", 
	-Filename => "$dbdir/idsdb",
	-Flags => DB_RDONLY
	 or print "DB error occured.";
	
	#=============== prepare partsDB
	tie %partsdb, "BerkeleyDB::Hash", 
	-Filename => "$dbdir/partsdb",
	-Flags => DB_RDONLY
	 or print "DB error occured.";

	#=============== prepare aliasDB
	tie %aliasdb, "BerkeleyDB::Hash", 
	-Filename => "$dbdir/aliasdb",
	-Flags => DB_RDONLY
	 or print "DB error occured.";
}

#=============== update DB
if($admin eq "yes"){
	$command = $cgi->param('command');
	$data = $cgi->param('data');
	$title = $cgi->param('title');
	if($command eq 'update_aliasdb'){
		$aliasdb{$title} = $data;
		if($data eq ""){
			delete $aliasdb{$title};
		}
	}
	elsif($command eq 'update_partsdb'){
		$data =~ s/\r/\$/g;
		$data =~ s/\n/\$/g;
		$data =~ s/\$\$/\$/g;
		$data =~ s/\$$//g;
		$partsdb{$title} = $data;
		if($data eq ""){
			delete $partsdb{$title};
		}
	}
}

#=============== get query string
$query = $cgi->param('query');
$query =~ s/[\<\>\\\&\#]//g;

if($query =~ m/^[^a-z]/){
	$query = &utf8er2kageer($query);
}	

if($query =~ m/u([0-9a-f]{4,5})/){
	$query_char = "<span class=\"large\">[".pack("U", eval("0x$1"))."]</span>";
	$query_char_zengo  = "<div align=\"center\">";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")-256)."\">".pack("U", eval("0x$1")-256)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")-128)."\">".pack("U", eval("0x$1")-128)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")-64 )."\">".pack("U", eval("0x$1")-64 )."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")-32 )."\">".pack("U", eval("0x$1")-32 )."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")-16 )."\">".pack("U", eval("0x$1")-16 )."</a>] ";
	$query_char_zengo .= " ... ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")-7)."\">".pack("U", eval("0x$1")-7)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")-6)."\">".pack("U", eval("0x$1")-6)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")-5)."\">".pack("U", eval("0x$1")-5)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")-4)."\">".pack("U", eval("0x$1")-4)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")-3)."\">".pack("U", eval("0x$1")-3)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")-2)."\">".pack("U", eval("0x$1")-2)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")-1)."\">".pack("U", eval("0x$1")-1)."</a>] ";
	$query_char_zengo .= "&#x2190; ".pack("U", eval("0x$1"))." &#x2192; ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")+1)."\">".pack("U", eval("0x$1")+1)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")+2)."\">".pack("U", eval("0x$1")+2)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")+3)."\">".pack("U", eval("0x$1")+3)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")+4)."\">".pack("U", eval("0x$1")+4)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")+5)."\">".pack("U", eval("0x$1")+5)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")+6)."\">".pack("U", eval("0x$1")+6)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")+7)."\">".pack("U", eval("0x$1")+7)."</a>] ";
	$query_char_zengo .= " ... ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")+16 )."\">".pack("U", eval("0x$1")+16 )."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")+32 )."\">".pack("U", eval("0x$1")+32 )."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")+64 )."\">".pack("U", eval("0x$1")+64 )."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")+128)."\">".pack("U", eval("0x$1")+128)."</a>] ";
	$query_char_zengo .= "[<a href=\"?query=".pack("U", eval("0x$1")+256)."\">".pack("U", eval("0x$1")+256)."</a>] ";
	$query_char_zengo .= "</div>";
}else{
	$query_char = "";
	$query_char_zengo = "";
}

#=============== output html form
#print qq|<h1>Query</h1>
print qq|
<form>
Query : 
<input type="text" name="query" value="$query" size="10">
<input type="submit" value="submit">
$query_char_zengo
</form>
<hr>|;

#=============== output results
print "<h1>Result for $query$query_char</h1>";

print "<table width=\"100%\"><tr><td valign=\"top\" width=\"35%\">";

print "<h2>idsdb</h2>";
if(exists($idsdb{$query})){
	$_ = $idsdb{$query};
	s/([^.]*)/<a href="?query=$1">$1<\/a>/g;
	print "<img src=\"/v0.4/engine/kage.cgi?$idsdb{$query}\">";
	#print "<img src=\"/v0.4/engine/kage.cgi?shotai=gothic&$idsdb{$query}\">";
	print "<div>$_</div>";
  if($idsdb{$query} =~ /^u2ff0\./){
    print "<a href=\"../kage/mappin.cgi?target=$query\">簡易調整</a><span style=\"font-size:9pt;\">(test)</span>";
  }
}else{
	print "<div>no resutls</div>";
}

print "</td><td valign=\"top\" rowspan=\"2\">";

print "<h2>partsdb</h2>";
if(exists($partsdb{$query})){
	print "<img src=\"/v0.4/engine/kage.cgi?$query\">";
	$_ = $partsdb{$query};
	$_ =~ s/\$/\n/g;
	print "<form method=\"post\">";
	print "<input type=\"hidden\" name=\"command\" value=\"update_partsdb\">";
	print "<input type=\"text\" name=\"title\" value=\"$query\" size=\"10\">";
	print "<input type=\"hidden\" name=\"query\" value=\"$query\">";
	if($admin eq "yes"){ print "<input type=\"submit\" value=\"update\">"; }
	print "<a href=\"/kage/fled-update.cgi?mypage=$query&mydata=".$partsdb{$query}."\" target=\"edit\">Edit glyph</a>";
	print "<br>";
	print "<textarea cols=\"60\" rows=\"10\" name=\"data\">$_</textarea>";
	print "</form>";
}else{
	print "<div>no resutls</div>";
	print "<form method=\"post\">";
	print "<input type=\"hidden\" name=\"command\" value=\"update_partsdb\">";
	print "<input type=\"text\" name=\"title\" value=\"$query\" size=\"10\">";
	print "<input type=\"hidden\" name=\"query\" value=\"$query\">";
	if($admin eq "yes"){ print "<input type=\"submit\" value=\"create\">"; }
	print "<a href=\"/kage/fled-update.cgi\" target=\"edit\">Edit new glyph</a>";
	print "<br>";
	print "<textarea cols=\"60\" rows=\"10\" name=\"data\"></textarea>";
	print "</form>";
}
print "</td></tr>";
print "<tr><td>";
print "<h2>aliasdb</h2>";
if(exists($aliasdb{$query})){
	$_ = $aliasdb{$query};
	s/([^.]*)/<a href="?query=$1">$1<\/a>/g;
	print "<img src=\"/v0.4/engine/kage.cgi?$aliasdb{$query}\">";
	print "<div>$_</div>";
	print "<form method=\"post\">";
	print "<input type=\"hidden\" name=\"command\" value=\"update_aliasdb\">";
	print "<input type=\"text\" name=\"data\" value=\"$aliasdb{$query}\" size=\"10\">";
	print "<input type=\"hidden\" name=\"title\" value=\"$query\">";
	print "<input type=\"hidden\" name=\"query\" value=\"$query\">";
	if($admin eq "yes"){ print "<input type=\"submit\" value=\"update\">"; }
	print "</form>";
}else{
	print "<div>no resutls</div>";
	print "<form method=\"post\">";
	print "<input type=\"hidden\" name=\"command\" value=\"update_aliasdb\">";
	print "<input type=\"text\" name=\"data\" size=\"10\">";
	print "<input type=\"hidden\" name=\"title\" value=\"$query\">";
	print "<input type=\"hidden\" name=\"query\" value=\"$query\">";
	if($admin eq "yes"){ print "<input type=\"submit\" value=\"create\">"; }
	print "</form>";
}
print "</td></tr></table>";

#=============== output footer
print qq|<hr>
<div align="right"><a href="http://fonts.jp/">fonts.jp</a></div>
</body>
</html>|;

#=============== free DB
untie(%idsdb);
untie(%partsdb);

sub do_search{
	my $result, $buffer;

	$result = $db{"?@_[0]"};

	if($result ne ""){
		#=============== S->ids
		$result =~ s/\(//g;
		$result =~ s/\)//g;
		$result =~ s/\?//g;
		$result =~ s/\ //g;
		$result =~ s/ideographic-structure//g;

		$buffer = $result;
			
		print "<h2>@_[0]</h2>";
		print "<span>";
    print &print_char($buffer);
    print "</span>";

		#=============== recursive search
		my $length = length($result);
		for(my $i = 0; $i < $length;){
			$first = unpack("C", substr($result, $i, 1));
			if(0xc2 <= $first && $first <= 0xdf){ # 2 bytes
				my $next = substr($result, $i, 2);
				$i = $i + 2;
				&do_search($next);
			}
			elsif(0xe0 <= $first && $first <= 0xef){ # 3 bytes
				my $next = substr($result, $i, 3);
				$i = $i + 3;
				&do_search($next);
			}
			elsif(0xf0 == $first){ # 4 bytes(but SIP)
				my $next = substr($result, $i, 4);
				$i = $i + 4;
				&do_search($next);
			}
			elsif(0xf1 <= $first && $first <= 0xf7){ # 4 bytes
				my $next = substr($result, $i, 4);
				$i = $i + 4;
				&search_all($next);
				&do_search($next);
			}
			elsif(0xf8 <= $first && $first <= 0xfb){ # 5 bytes
				my $next = substr($result, $i, 5);
				$i = $i + 5;
				&search_all($next);
				&do_search($next);
			}
			elsif(0xfc <= $first && $first <= 0xfd){ # 6 bytes
				my $next = substr($result, $i, 6);
				$i = $i + 6;
				&search_all($next);
				&do_search($next);
			}
			else{ # 1 byte
				my $next = substr($result, $i, 1);
				$i = $i + 1;
				&search_all($next);
				&do_search($next);
			} 
		}
	}
}

sub search_all{
	$info .= "<h2>".unpack("H*", @_[0])."</h2>";
	opendir(DH, "/home/httpd/chise-db/character/feature/");
	foreach(readdir(DH)){
		if(substr($_, 0, 1) ne '.'){ 
			my %db;
			tie %db, "BerkeleyDB::Hash", 
			-Filename => "/home/httpd/chise-db/character/feature/$_",
			-Flags => DB_RDONLY
			 or print "DB error occured.";
			if(exists($db{'?'.@_[0]})){
				$info .= sprintf("[$_ -> %d(%X)]", $db{'?'.@_[0]}, $db{'?'.@_[0]});
			}
			untie(%db);
		}
	}
	closedir(DH);
}

sub get_char{
	my $b4 = '[\xf1-\xf7][\x80-\xbf]{3}'; # print directly if char is f0(before u+30000)
	my $b5 = '[\xf8-\xfb][\x80-\xbf]{4}'; # some corner-cutting is here
	my $b6 = '[\xfc-\xfd][\x80-\xbf]{5}';
	my $temp;	
	for(my $i = 0; $i < length(@_[0]);){
		$_ = substr(@_[0], $i);
		if(m/^(?:$b4)/){
			print "[".unpack("H*", substr(@_[0], $i, 4))."]";
			$i = $i + 4;
		}
		elsif(m/^(?:$b5)/){
			print "[".unpack("H*", substr(@_[0], $i, 5))."]";
			$i = $i + 5;
		}
		elsif(m/^(?:$b6)/){
			print "[".unpack("H*", substr(@_[0], $i, 6))."]";
			$i = $i + 6;
		}
		elsif(m/^⿰/){
			print qq|<img src="http://fonts.jp/archives/search/0.png" alt="U+2FF0" align="absbottom">|;
			$i = $i + 3;
		}
		elsif(m/^⿱/){
			print qq|<img src="http://fonts.jp/archives/search/1.png" alt="U+2FF1" align="absbottom">|;
			$i = $i + 3;
		}
		elsif(m/^⿲/){
			print qq|<img src="http://fonts.jp/archives/search/2.png" alt="U+2FF2" align="absbottom">|;
			$i = $i + 3;
		}
		elsif(m/^⿳/){
			print qq|<img src="http://fonts.jp/archives/search/3.png" alt="U+2FF3" align="absbottom">|;
			$i = $i + 3;
		}
		elsif(m/^⿴/){
			print qq|<img src="http://fonts.jp/archives/search/4.png" alt="U+2FF4" align="absbottom">|;
			$i = $i + 3;
		}
		elsif(m/^⿵/){
			print qq|<img src="http://fonts.jp/archives/search/5.png" alt="U+2FF5" align="absbottom">|;
			$i = $i + 3;
		}
		elsif(m/^⿶/){
			print qq|<img src="http://fonts.jp/archives/search/6.png" alt="U+2FF6" align="absbottom">|;
			$i = $i + 3;
		}
		elsif(m/^⿷/){
			print qq|<img src="http://fonts.jp/archives/search/7.png" alt="U+2FF7" align="absbottom">|;
			$i = $i + 3;
		}
		elsif(m/^⿸/){
			print qq|<img src="http://fonts.jp/archives/search/8.png" alt="U+2FF8" align="absbottom">|;
			$i = $i + 3;
		}
		elsif(m/^⿹/){
			print qq|<img src="http://fonts.jp/archives/search/9.png" alt="U+2FF9" align="absbottom">|;
			$i = $i + 3;
		}
		elsif(m/^⿺/){
			print qq|<img src="http://fonts.jp/archives/search/a.png" alt="U+2FFA" align="absbottom">|;
			$i = $i + 3;
		}
		elsif(m/^⿻/){
			print qq|<img src="http://fonts.jp/archives/search/b.png" alt="U+2FFB" align="absbottom">|;
			$i = $i + 3;
		}
		else{
		#use Encode 'from_to';
			return substr(@_[0], $i, 3);
#print "{".from_to(substr(@_[0], $i, 3), 'utf-8', 'UTF-32')."}";
			$i = $i + 3;
		}
	}
}

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
