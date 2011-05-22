#!/usr/bin/env ruby
$LOAD_PATH << '../ruby/src'
require 'chise'
include CHISE
p "字".to_er		#"&#x5b57;"	#実体参照化する
p "&#x5b57;".de_er	#"字"		#実体参照を解除
p "&J90-3B7A;".de_er	#JISX0208-1990におけるコードポイントを用いた実体参照を解除
p "&M-06942;".de_er	#大漢和番号を用いた実体参照を解除
