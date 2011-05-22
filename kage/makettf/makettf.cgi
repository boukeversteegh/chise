#!/usr/bin/perl

# definition
$BASEDIR = "/var/www/makettf";
$MAKETTF = "/usr/bin/perl $BASEDIR/makettf.pl";
$LICENSE = 'Created by KAGE system. (http://fonts.jp/)';
$TEMP="font";
$HEADER_FILENAME = "head.txt";
$PARTS_FILENAME = "parts.txt";
$FOOTER_FILENAME = "foot.txt";

# initialize
use utf8;
binmode STDOUT, ":utf8";
use CGI;
$form = new CGI;

# prepare working directory
$RANDOM = sprintf("%07X", rand(0x10000000));
$TEMPDIR = "$BASEDIR/$RANDOM";
$TEMPURL = "$RANDOM";
mkdir($TEMPDIR);

# main : divided for parent and child process
$| = 1;
$pid = fork();
unless(defined $pid){
  &makeerror();
  exit;
}
if($pid > 0){
  &makepage();
} else{
  close(STDIN);
  close(STDOUT);
  close(STDERR);
  &makehead();
  &makefoot();
  &makeparts();
  $dummy = `$MAKETTF $TEMPDIR $TEMP mincho 3`;
}
exit;

sub makehead{
  $fontname_en = $form->param('fontname-en');
  $fontname_en =~ s/[\;\&\#\"\'\%\\\$\:\!\=\~\^\`]//g;
  $fontname_ja = $form->param('fontname-ja');
  $fontname_ja =~ s/[\;\&\#\"\'\%\\\$\:\!\=\~\^\`]//g;
  utf8::decode($fontname_ja);
  if($fontname_en eq ""){
    $fontname_en = "Untitled";
  }
  if($fontname_ja eq ""){
    $fontname_ja = $fontname_en;
  }
  open FH, ">:utf8", "$TEMPDIR/$HEADER_FILENAME";
  print FH <<"EOT";
New()
Reencode("UnicodeFull")
SetTTFName(0x409,0,"$LICENSE")
SetTTFName(0x409,1,"$fontname_en")
SetTTFName(0x409,4,"$fontname_en")
SetTTFName(0x411,1,"$fontname_ja")
SetTTFName(0x411,4,"$fontname_ja")
EOT
  close FH;
}

sub makefoot{
  open FH, ">:utf8", "$TEMPDIR/$FOOTER_FILENAME";
  close FH;
}

sub makeparts{
  my $temp = $form->param('partsdata');
  utf8::decode($temp);
  open FH, ">:utf8", "$TEMPDIR/$PARTS_FILENAME";
  print FH $temp;
  close FH;
}

sub makepage{
  print <<"EOT";
Content-type: text/html;

<!DOCTYPE html
    PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="http://fonts.jp/green.css">
<html>
<head>
<title>フォントダウンロード</title>
</head>
<body>
<div class="main">
<h1>フォント生成中</h1>
<p>以下のリンクをクリックしてください。リンクが切れている場合は生成中ですのでもう少しお待ちください。6000グリフで25分程度かかります。</p>
<p><a href="$TEMPURL/$TEMP.ttf">フォントのダウンロード</a></p>
<p><a href="$TEMPURL/$TEMP.log">生成ログ</a>（しばらくすると、ここに処理したグリフのUCSコードポイントが記録されます。通常の漢字は0u4E00から0u9FA5の間で、0u4E00から処理されます。0u9XXXまで到達せずに更新が止まった場合はデータにエラーがあり失敗している可能性があります。</p>
<p><a href="index.html">戻る</a></p>
<hr class="footer">
fonts.jp
</div>
</body>
</html>
EOT
}

sub makeerror{
print <<"EOT";
Content-type: text/html;

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="http://fonts.jp/green.css">
<html>
<head>
<title>フォント生成失敗</title>
</head>
<body>
<div class="main">
<h1>フォント生成失敗</h1>
<p>もう一度戻ってやり直してください。</p>
<p><a href="index.html">戻る</a></p>
<hr class="footer">
fonts.jp
</div>
</body>
</html>
EOT
}
