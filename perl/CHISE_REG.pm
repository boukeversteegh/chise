#
# CHISE_REG.pm
# $Id: CHISE_REG.pm,v 1.2 2003/10/08 13:30:29 moro Exp $
#

package CHISE_REG;

use strict;
use warnings;
use utf8;
use overload;

sub import {
  overload::constant ( 'qr' => \&ChiseLikeRegex )
}

sub unimport {
  overload::remove_constant
}

# データベースの場�����を����������指�����。いずれはlibchiseに...
# データベースの全ファイルをchownしないと�����えないかも
my $DB_HOME='';
if (-e '/usr/local/lib/chise/char-db') {
  $DB_HOME = '/usr/local/lib/chise/char-db';
} elsif (-e '/sw/lib/xemacs-21.4.11/powerpc-apple-darwin6.6/char-db') {
  $DB_HOME = '/sw/lib/xemacs-21.4.11/powerpc-apple-darwin6.6/char-db';
} elsif (-e '/usr/local/lib/xemacs-21.4.11/i686-pc-linux/char-db') {
  $DB_HOME = '/usr/local/lib/xemacs-21.4.11/i686-pc-linux/char-db';
} elsif (-e '/usr/local/lib/xemacs-21.4.11/powerpc-apple-darwin6.4/char-db') {
  $DB_HOME = '/usr/local/lib/xemacs-21.4.11/powerpc-apple-darwin6.4/char-db';
} elsif (-e '/usr/local/xemacs-utf2000/lib/xemacs-21.4.11/powerpc-apple-darwin6.4/char-db'){
  $DB_HOME = '/usr/local/xemacs-utf2000/lib/xemacs-21.4.11/powerpc-apple-darwin6.4/char-db';
} elsif (-e '/usr/local/lib/xemacs-21.4.10/i686-pc-linux/char-db') {
  $DB_HOME = '/usr/local/lib/xemacs-21.4.10/i686-pc-linux/char-db';
} elsif (-e '/usr/local/lib/xemacs-21.4.10/powerpc-apple-darwin6.4/char-db') {
  $DB_HOME = '/usr/local/lib/xemacs-21.4.10/powerpc-apple-darwin6.4/char-db';
} elsif (-e '/usr/local/xemacs-utf2000/lib/xemacs-21.4.10/powerpc-apple-darwin6.4/char-db'){
  $DB_HOME = '/usr/local/xemacs-utf2000/lib/xemacs-21.4.10/powerpc-apple-darwin6.4/char-db';
} elsif (-e 'd:/work/chise/char-db'){
  $DB_HOME = 'd:/work/chise/char-db';
} else {
  print STDERR "CHISE_REG.pm: No database found.\n";
  print STDERR "CHISE_REG.pm: Please set \$DB_HOME to CHISE.pm.\n";
  exit 1;
}

#--- 正規表現のCHISE的拡張 ------------------------------------#

sub ChiseLikeRegex ($) {
# 正規表現のオーバーロード
  my ($RegexLiteral) = @_;
  #print STDERR "BEFORE: $RegexLiteral\n"; # for debug
  $RegexLiteral
    =~ s/\\same_([^_]+)_(\d)/(??{CHISE_REG->chise_backref(\$$2,'$1')})/g;
  #print STDERR "AFTER:  $RegexLiteral\n"; # for debug
  return $RegexLiteral;
}

sub chise_backref {
  my $self = shift;
  my ($backreference, $feature_name) = @_;
  #print STDERR "backreference: $backreference\n"; # for debug
  #print STDERR "feature name:  $feature_name\n";  # for debug
  my $result = `./chisereg.pl $backreference $DB_HOME $feature_name`;
  #print STDERR $result, "\n"; # for debug
  return "[$result]";
}

1;
