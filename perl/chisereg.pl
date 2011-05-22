#!/usr/bin/perl
# chisereg.pl
# $Id: chisereg.pl,v 1.2 2003/10/08 13:30:29 moro Exp $

use strict;
use warnings;
use DB_File;

my ($key, $DB_HOME, $feature_name) = @ARGV;
my $target = "$DB_HOME/system-char-id/$feature_name";
my $value = &getvalue($target, "?$key");
if ($value) {
  #print STDERR "value: $value\n"; # for debug
  my $result = '';
  for $key (&getkeys($target, $value)) {
    my $ucs_value = &getvalue("$DB_HOME/system-char-id/=ucs", $key);
    if ($ucs_value) {
      $key = sprintf "\\x\{%x\}", $ucs_value;
      $result .= $key;
    }
  }
  if ($result ne '') {
    print STDOUT $result;
  } else {
    print STDOUT $key;
  }
} else {
  #print STDERR "no values\n"; # for debug
}

sub getvalue ($$) {
  # キーから値を�����り出す
  my ($chise_dbname, $key) = @_;
  my $value = '';
  tie (my %h, "DB_File", $chise_dbname, O_RDWR)
    or die "Cannot open file $chise_dbname: $!\n";
  $value = $h{$key};
  untie %h;
  return $value;
}

sub getkeys ($$) {
  # 値からキーの配列を�����り出す
  my ($chise_dbname, $value) = @_;
  tie (my %h, "DB_File", $chise_dbname, O_RDWR, , $DB_BTREE)
    or die "Cannot open file $chise_dbname: $!\n";
  my @keys = ();
  for my $key (keys %h) {
    next unless (exists $h{$key});
    push @keys, $key if ($h{$key} eq $value);
  }
  untie %h;
  return @keys;
}
