#
# CHISE.pm by Shigeki Moro
# $Id: CHISE.pm,v 1.6 2003/10/08 13:30:28 moro Exp $
#
package CHISE;

use strict;
use warnings;
use utf8;
use DB_File;

our ($EXCLUSIVE, $HAVE_INTERSECTION, $PROPER_SUBSET, $PROPER_SUPERSET, $EQSET);
($EXCLUSIVE, $HAVE_INTERSECTION, $PROPER_SUBSET, $PROPER_SUPERSET, $EQSET)
  = (1, 2, 3, 4, 5);

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
  print STDERR "CHISE.pm: No database found.\n";
  print STDERR "CHISE.pm: Please set \$DB_HOME to CHISE.pm.\n";
  exit 1;
}

my %alias = ();
my %alias_reverse = ();
for (glob "$DB_HOME/system-char-id/*") {
  s/^.*\/([^\/]+)$/$1/;
  my $i = $_;
  s/^\->/to_/;    # Perlではリファレンスに
  s/^<\-/from_/;  # "-" などが�����えないため、����������しておく。
  s/^=>/mapto/;
  s/^=//;
  s/\-/_/g;
  $alias{$_} = $i;
  $alias_reverse{$i} = $_;
}
%alias = (
	  %alias,
	  'radical','ideographic-radical',
	  'strokes','total-strokes',
);

#--- exportする予�����の関数 -------------------------------------#

sub new (@) {
  # 既存の�����字オブジェクトの生成
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;
  my $self  = { @_ };
  bless $self, $class;
  my $key = ($self->chars)[0]; # 要エラーチェック
  my($value, $result);
  for my $dbname (glob "$DB_HOME/system-char-id/*") {
    $value = &getvalue($dbname, $key);
    if ($value) {
      $dbname =~ s/^.*\/([^\/]+)$/$1/;
      $result->{$alias_reverse{$dbname}} = $value;
    }
  }
  return bless $result, $class;
}

sub define_char {
  # �����しい�����字オブジェクトの生成
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;
  my $self = {@_};
  my $result = ();
  for my $i (keys %$self) {
    $result->{$alias_reverse{$alias{$i}}} = $$self{$i};
  }
  return bless $result, $class;
}

sub dumpAttr {
  # �����字オブジェクトが持っている全属性をprint
  my $self = shift;
  for my $i (keys %$self) {
    print "$i => $$self{$i}\n";
  }
}

sub addAttr {
  # �����字オブジェクトに属性を追加
  my $model = shift;
  my $self = $model->define_char(%$model, @_);
  return $self;
}

sub delAttr (@) {
  # �����字オブジェクトから属性を削除
  my $model = shift;
  delete $$model{$_} foreach (@_);
  my $self = $model->define_char(%$model);
  return $self;
}

# 属性名で属性値を�����す
# 例: $s->morohashi_daikanwa
# cf. get_char_attribute
for my $attrname (keys %alias) {
  my $slot = __PACKAGE__ . "::$attrname";
  no strict "refs";
  *$slot = sub {
    my $self = shift;
    my $dbname = exists $alias{$attrname}
      ? $alias_reverse{$alias{$attrname}}
      : $attrname;
    return $self->{$dbname};
  }
}
#for my $attrname (keys %alias) {
#  my $slot = __PACKAGE__ . "::$attrname";
#  no strict "refs";
#  *$slot = sub {
#    my $self = shift;
#    my @result;
#    for my $i ($self->chars) {
#      my $j = &getvalue("$DB_HOME/system-char-id/$alias{$attrname}", $i);
#      push @result, $j if $j;
#    }
#    return @result;
#  }
#}

sub compare {
  # �����字オブジェクトどうしを比�����して、
  # �����合の重なり具合を�����す。
  my($a, $b) = @_;
  my($aonly, $bonly, $common) = (0, 0, 0);
  for my $i (&cup(keys %$a, keys %$b)) {
    if (exists $a->{$i} and exists $b->{$i}) {
      if ($a->{$i} eq $b->{$i}) {
	$common++;
      } else {
	$aonly++ if (exists $a->{$i});
	$bonly++ if (exists $b->{$i});
      }
    } else {
      $aonly++ if (exists $a->{$i});
      $bonly++ if (exists $b->{$i});
    }
  }
  if ($common == 0) {
    return $EXCLUSIVE; # �����他
  } elsif ($aonly == 0 and $bonly == 0) {
    return $EQSET; # �����全一致
  } elsif ($aonly == 0) {
    return $PROPER_SUBSET; # $aは$bの��������������������合
  } elsif ($bonly == 0) {
    return $PROPER_SUPERSET; # $bは$aの��������������������合
  } else {
    return $HAVE_INTERSECTION;
  }
}

sub rate_of_coincidence {
  # �����字オブジェクトどうしの属性の一致�����を出す。
  my($a, $b) = @_;
  my($all_attr, $common_attr) = (0, 0);
  for my $i (&cup(keys %$a, keys %$b)) {
    if ($a->{$i} eq $b->{$i}) {
      $all_attr++;
      $common_attr++;
    } else {
      $all_attr++ if (exists $a->{$i});
      $all_attr++ if (exists $b->{$i});
    }
  }
  return $all_attr ? ($common_attr / $all_attr) : 0;
}

sub ph2char ($) {
  # �����体参照から?xを得る
  my $ph = shift;
  my %alias = (
	       'C1','chinese-cns11643-1',
	       'C2','chinese-cns11643-2',
	       'C3','chinese-cns11643-3',
	       'C4','chinese-cns11643-4',
	       'C5','chinese-cns11643-5',
	       'C6','chinese-cns11643-6',
	       'C7','chinese-cns11643-7',
	       'CB','ideograph-cbeta',
	       'CDP','chinese-big5-cdp',
	       'GT','ideograph-gt',
	       'GT-K','ideograph-gt',
	       'HZK1','ideograph-hanziku-1',
	       'HZK2','ideograph-hanziku-2',
	       'HZK3','ideograph-hanziku-3',
	       'HZK4','ideograph-hanziku-4',
	       'HZK5','ideograph-hanziku-5',
	       'HZK6','ideograph-hanziku-6',
	       'HZK7','ideograph-hanziku-7',
	       'HZK8','ideograph-hanziku-8',
	       'HZK9','ideograph-hanziku-9',
	       'HZK10','ideograph-hanziku-10',
	       'HZK11','ideograph-hanziku-11',
	       'HZK12','ideograph-hanziku-12',
	       'J78','japanese-jisx0208-1978',
	       'J83','japanese-jisx0208',
	       'J90','japanese-jisx0208-1990',
	       'JSP','japanese-jisx0212',
	       'JX1','japanese-jisx0213-1',
	       'JX2','japanese-jisx0213-2',
	       'K0','korean-ksc5601',
	       'M','ideograph-daikanwa',
	      );
  my $keys = join '|', sort keys %alias;
  my($phname, $phvalue) = ($ph =~ /^\&(?:I\-)?($keys)\-?([0-9a-f]+);$/i);
  if (exists $alias{$phname}) {
    if ($alias{$phname} =~ /daikanwa|gt/) {
      $phvalue =~ s/^0+//;
    } else {
      $phvalue = "0x$phvalue";
    }
    tie my %h, "BerkeleyDB::Hash",
      -Filename => "$DB_HOME/$alias{$phname}/system-char-id"
      or die "Cannot open file $alias{$phname}: $! $BerkeleyDB::Error\n";
    if (exists $h{$phvalue}) {
      return $h{$phvalue};
    } else {
      #print STDERR "\tCan't convert $phname - $phvalue (no value in db).\n";
      return $ph;
    }
    untie %h;
  } else {
    #print STDERR "\tCan't convert $phname - $phvalue.\n";
    return $ph;
  }
}

#--- モジュール内のみで�����う予�����の関数 ----------------------#

sub chars {
  # ?... の配列を�����す
  my $self = shift;
  my @result = ('*');
  for my $attrname (keys %$self) {
    my @tmp = ();
    my $dbname = exists $alias{$attrname} ? $alias{$attrname} : $attrname;
    if (-f "$DB_HOME/$dbname/system-char-id") {
      @tmp = (&getvalue("$DB_HOME/$dbname/system-char-id", $self->{$attrname}));
      @result = &cap(\@result, \@tmp);
    } elsif (-f "$DB_HOME/system-char-id/$dbname") {
      @tmp = &getkeys("$DB_HOME/system-char-id/$dbname", $self->{$attrname});
      @result = &cap(\@result, \@tmp);
    } else {
      die "cannot find $attrname: $! $BerkeleyDB::Error\n";
    }
  }
  return @result;
}

sub utf8 {
  # UTF-8を�����す
  my $self = shift;
  my @result;
  for my $i ($self->chars) {
    $i =~ s/^\?//;
    # To Do: 私用�����域のは�����さないようにしないと。
    push @result, $i;
  }
  return @result;
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


sub cap {
  # 2つの配列の積�����合を求める
  my($a, $b) = @_;
  if (!@$a or !@$b) {
    return ();
  } elsif ($$a[0] eq '*') { # '*'は全体�����合
    return @$b;
  } elsif ($$b[0] eq '*') {
    return @$a;
  } else {
    my %result = ();
    my @result = ();
    for my $i (@$a, @$b) {
      $result{$i}++;
      push @result, $i if ($result{$i} == 2);
    }
    return @result;
    #return grep {
    #  my $c = $_;
    #  grep /^$c$/, @$b;
    #} @$a;
  }
}

sub cup {
  # 2つの配列の和�����合を求める
  my %result = ();
  for my $i (@_) { $result{$i}++; }
  return keys %result;
}

#--------------------------------------------------------#
1;
